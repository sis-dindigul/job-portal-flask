from flask import Flask, render_template,request,url_for,session,flash,send_from_directory,redirect
from datetime import datetime
from flask_mysqldb import MySQL
import MySQLdb.cursors
import re
import os
from werkzeug.utils import secure_filename
import pandas as pd
from sklearn.tree import DecisionTreeClassifier
from sklearn.preprocessing import LabelEncoder

app = Flask(__name__) 
app.secret_key = 'your_secret_key'
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = ''   
app.config['MYSQL_DB'] = 'jobportalflk'

mysql = MySQL(app)
 
app.config['UPLOAD_FOLDER'] = 'uploads'
os.makedirs(app.config['UPLOAD_FOLDER'], exist_ok=True)

#______________________Basic Needs_________________

#______________________Page Start_________________

@app.route('/') 
def index(): 
     return render_template('index.html')
 
@app.route('/contact') 
def contact(): 
     return render_template('contact.html')
 
@app.route('/admin',methods=['GET','POST']) 
def admin(): 
    if request.method == 'POST':
        username = request.form.get('un')
        password = request.form.get('pwd')
        if username == 'admin' and password == 'admin':
            session['admin'] = True
            return redirect(url_for('admin_dashboard'))
        flash('Incorrect password')
    return render_template('admin.html')

@app.route('/user',methods=['GET','POST']) 
def user():
    if request.method == 'POST':
        uname = request.form['un']
        pwd = request.form['pwd']

        cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cursor.execute('SELECT * FROM newjobseeker WHERE uname= %s AND pwd = %s', (uname, pwd))
        account = cursor.fetchone()

        if account:
            session['loggedin'] = True
            session['uname'] = account['uname']
            return redirect(url_for('jobseeker_dashboard',username=uname))
        else:
            flash('Invalid username or password!', 'danger')

    return render_template('user.html') 

@app.route('/new_job',methods=['GET','POST']) 
def new_job():
    if request.method == 'POST'   :
        jname = request.form['t1']
        adrs = request.form['t2']
        city = request.form['t3']
        email = request.form['t4']
        mobile = request.form['t5']
        quali = request.form['t6']
        gender = request.form['t7']
        dob = request.form['t8']
                
        username = request.form['uname']
        password = request.form['pwd']
        secq = request.form['t10']
        ans = request.form['t11']
        res = request.files['t9']
        filepath = os.path.join(app.config['UPLOAD_FOLDER'], res.filename)
        res.save(filepath)
        cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)

        cursor.execute('INSERT INTO newjobseeker VALUES (NULL,  %s, %s,%s,%s,%s, %s,%s, %s,%s,%s, %s,%s, %s)',(jname,adrs,city,email,mobile,quali,gender,dob,res.filename,username,password,secq,ans))
        mysql.connection.commit()
        flash('You have successfully registered!')
    return render_template('new_job.html')


@app.route('/new_company',methods=['GET','POST']) 
def new_company():
    if request.method == 'POST'   :
        fname = request.form['cname']
        pers = request.form['cperson']
        adrs = request.form['address']
        city = request.form['city']
        mailid = request.form['email']
        mob = request.form['mob']
        area= request.form['area']
       
        username = request.form['uname']
        password = request.form['pword']
        qns = request.form['ques']
        ans = request.form['ans']
        flg=0
        cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)

        cursor.execute('INSERT INTO newcompany VALUES (NULL, %s,%s, %s, %s,%s,%s,%s, %s, %s,%s,%s,%s)',(fname,pers,adrs,city,mailid,mob,area,username,password,qns,ans,flg))
        mysql.connection.commit()
        flash('You have successfully registered!')
    return render_template('new_company.html')

@app.route('/company',methods=['GET','POST'])  
def company(): 
     if request.method == 'POST':
        uname = request.form['un']
        pwd = request.form['pwd']

        cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cursor.execute('SELECT * FROM newcompany WHERE uname= %s AND pwd = %s AND flag = 1 ', (uname, pwd))
        account = cursor.fetchone()

        if account:
            session['loggedin'] = True
            session['uname'] = account['uname']
            session['cname'] = account['cname'] 
            return redirect(url_for('company_dashboard',username=uname))
        else:
            flash('Invalid username or password!', 'danger')
     return render_template('company.html')

#______________________admin Dashboard__________________

@app.route('/admin_dashboard')
def admin_dashboard():
    
    return render_template('admin_dashboard/index.html')

@app.route('/admin_dashboard/acompany')
def acompany():
    cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
    cursor.execute('SELECT * FROM newcompany where flag=0')
    account = cursor.fetchall()
    
    cursor.execute('SELECT * FROM newcompany where flag=1')
    account1 = cursor.fetchall()
    
    
    return render_template('admin_dashboard/acompany.html',account=account,account1=account1)

@app.route('/admin_dashboard/ajobseeker')
def ajobseeker():
    cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
    cursor.execute('SELECT * FROM newjobseeker')
    account = cursor.fetchall()
    
    return render_template('admin_dashboard/ajobseeker.html',account=account)


@app.route('/admin_dashboard/aconfirm/<int:id>', methods=['GET', 'POST'])
def aconfirm(id):
    cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)

    if request.method == "POST":
        conf = request.form['confr']
        cursor.execute("UPDATE newcompany SET flag=%s WHERE id=%s", (conf, id))
        mysql.connection.commit()
        flash("Company confirmed successfully!")
        return redirect(url_for("acompany"))   # back to list page

    # GET → show form
    cursor.execute("SELECT * FROM newcompany WHERE id=%s", (id,))
    account = cursor.fetchone()
    return render_template("admin_dashboard/aconfirm.html", account=account)



@app.route('/admin_dashboard/ainterview')
def ainterview():
    cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
    cursor.execute('SELECT * FROM interviewtable')
    account = cursor.fetchall()
    
    return render_template('admin_dashboard/ainterview.html',account=account)

@app.route('/admin_dashboard/aresume', methods=['GET', 'POST'])
def aresume():

    account = []
    selected_req = None

    cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)

    # 🔹 Dropdown
    cursor.execute("SELECT id, requirements FROM jobs")
    jobs = cursor.fetchall()

    if request.method == 'POST':
        selected_req = request.form.get('requirements')   # ✅ FIXED

        if selected_req:

            cursor.execute("SELECT * FROM resumetable")
            data = cursor.fetchall()

            results = []

            for row in data:

                # 🔥 Requirement from dropdown
                req_words = [r.strip().lower() for r in selected_req.split()]
                # ['tally','gst']

                # 🔥 Skillset clean
                skill_words = [s.strip().lower() for s in row['skillset'].split(',')]
                # ['tally','gst','excel','accounting']

                # 🔥 Match %
                match_count = sum(1 for r in req_words if r in skill_words)
                match_percent = (match_count / len(req_words)) * 100

                row['match_percent'] = round(match_percent, 2)

                # 🔥 OPTIONAL: show only matched candidates
                if match_percent > 0:
                    results.append(row)

            account = results

    return render_template(
        'admin_dashboard/aresume.html',
        account=account,
        jobs=jobs,
        selected_req=selected_req
    )
@app.route('/admin_dashboard/ashortlist_rep')
def ashortlist_rep():
    
    cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
    cursor.execute('SELECT * FROM shortlist')
    account = cursor.fetchall()
    
    return render_template('admin_dashboard/ashortlist_rep.html',account=account) 


#______________________jobseeker Dashboard__________________

@app.route('/jobseeker_dashboard')
def jobseeker_dashboard():
    Username = request.args.get('username')
    return render_template('jobseeker_dashboard/index.html')     


   

@app.route('/jobseeker_dashboard/jobs')
def jobs():
    cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
    cursor.execute("SELECT * FROM interviewtable ORDER BY Date ASC")
    jobs = cursor.fetchall()
    
    return render_template('jobseeker_dashboard/jobs.html',jobs=jobs)     

# 🔹 2. Job Details (Role-based Description)
@app.route('/job/<int:id>')
def job_detail(id):
    cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)

    cursor.execute("""
        SELECT i.*, j.requirements, j.candidate_skill
        FROM interviewtable i
        JOIN jobs j ON i.Position = j.job_role
        WHERE i.id = %s
    """, (id,))

    job = cursor.fetchone()

    return render_template(
        'jobseeker_dashboard/job_detail.html',
        job=job
    )


# 🔹 3. Apply Page
@app.route('/jobseeker_dashboard/apply/<int:id>', methods=['GET', 'POST'])
def apply(id):
    if request.method == 'POST':
        name = request.form['name']
        mobile = request.form['mobile']
        return redirect(url_for('jresume', id=id, name=name, mobile=mobile))
    return render_template('jobseeker_dashboard/apply.html', id=id)


# 🔹 4. Resume Upload


@app.route('/jobseeker_dashboard/jresume/<int:id>',methods=['GET','POST']) 
def jresume(id):
    Username = request.args.get('username')

    cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)

    # 🔥 Get job + candidate skills
    cursor.execute("""
        SELECT i.Position, j.candidate_skill
        FROM interviewtable i
        JOIN jobs j ON i.Position = j.job_role
        WHERE i.id = %s
    """, (id,))
    
    job_data = cursor.fetchone()

    # 🔹 Convert skills into list
    skills = []
    if job_data and job_data['candidate_skill']:
        skills = job_data['candidate_skill'].split()

    if request.method == 'POST':
        jname = request.form['name']
        fname = request.form['fname']
        street = request.form['street']
        city = request.form['city']
        state = request.form['state']
        country = request.form['country']
        pin = request.form['pin']
        qual = request.form['qual']
        mail = request.form['mail']
        mob = request.form['mob']
                
        rname = request.form['rname']
        pcn = request.form['pcn']
        work = request.form['work']
        salary = request.form['salary']
        res = request.files['resume']
        sset_list = request.form.getlist('sset')   # get multiple values
        sset = ",".join(sset_list)               # convert list → string
        filepath = os.path.join(app.config['UPLOAD_FOLDER'], res.filename)
        res.save(filepath)

        cursor.execute('''
        INSERT INTO resumetable 
        VALUES (NULL, %s, %s, %s,%s,%s,%s, %s, %s,%s,%s, %s,%s, %s,%s,%s,%s,%s)
        ''',(jname,fname,street,city,state,country,pin,qual,mail,mob,
             rname,pcn,work,salary,res.filename,sset,id))

        mysql.connection.commit()
        flash('You have successfully registered!')
        return redirect(url_for('jobs'))

    return render_template(
        'jobseeker_dashboard/jresume.html',
        id=id,
        skills=skills,
        name=request.args.get('name'),
        mobile=request.args.get('mobile')
    )




@app.route('/jobseeker_dashboard/jobshortlist_rep')
def jobshortlist_rep():
    
    cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
    cursor.execute('SELECT * FROM shortlist')
    account = cursor.fetchall()
    
    return render_template('jobseeker_dashboard/jobshortlist_rep.html',account=account) 


#______________________Company Dashboard__________________


@app.route('/company_dashboard')
def company_dashboard():
    Username = request.args.get('username')
    return render_template('company_dashboard/index.html')    

@app.route('/company_dashboard/cominterview', methods=['GET','POST'])  
def cominterview():
    
    cname = session.get('cname')   # 🔥 logged company

   
    cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)

    # 🔹 Fetch all job roles
    cursor.execute("SELECT * FROM jobs")
    jobs = cursor.fetchall()

    cursor.execute('SELECT * FROM newcompany WHERE cname=%s', (cname,))
    account = cursor.fetchone()
    
    if request.method == 'POST':
        dat = request.form['date']
        fname = request.form['cname']
        adrs = request.form['address']
        pers = request.form['cper']
        mob = request.form['mob']
        city = request.form['lmark']
        tim = request.form['tim']        
       
        pos = request.form['pos']   # job_role
        requirements = request.form['requirements']
        npos = request.form['npos']

        cursor.execute('''
        INSERT INTO interviewtable 
        VALUES (NULL, %s,%s,%s,%s,%s,%s,%s,%s,%s,%s)
        ''',(dat,fname,adrs,pers,mob,city,tim,pos,requirements,npos))

        mysql.connection.commit()
        flash('You have successfully registered!')

    return render_template('company_dashboard/cominterview.html', jobs=jobs,account=account)




@app.route('/company_dashboard/comresume', methods=['GET', 'POST'])
def comresume():

    account = []
    selected_req = None

    cname = session.get('cname')
    cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)

    # 🔹 Dropdown → Requirements
    cursor.execute("SELECT id, requirements FROM jobs")
    jobs = cursor.fetchall()

    if request.method == 'POST':
        selected_req = request.form.get('requirement')

        if selected_req:

            # 🔥 Fetch resumes based on job + company
            cursor.execute("""
                SELECT r.*, j.requirements, i.CName, i.Position
                FROM resumetable r
                JOIN interviewtable i ON r.job_id = i.id
                JOIN jobs j ON i.Position = j.job_role
                WHERE j.requirements = %s AND i.CName = %s
            """, (selected_req, cname))

            data = cursor.fetchall()

            if data:
                df_db = pd.DataFrame(data)

                results = []

                for _, row in df_db.iterrows():

                    # 🔹 Get requirement & skill list
                    req_words = str(row['requirements']).lower().split()
                    skill_words = str(row['skillset']).lower().split(',')

                    # 🔥 Calculate match %
                    match_count = sum(1 for r in req_words if r in skill_words)
                    match_percent = (match_count / len(req_words)) * 100 if req_words else 0

                    exp = int(row.get('experience', 0))

                    # 🔥 Final Decision Logic
                    if match_percent >= 50 and exp >= 1:
                        status = "Selected"
                    else:
                        status = "Rejected"

                    row['ML_Status'] = status
                    row['match_percent'] = round(match_percent, 2)

                    results.append(row)

                account = results

    return render_template(
        'company_dashboard/comresume.html',
        jobs=jobs,
        account=account,
        selected_req=selected_req
    )

@app.route('/company_dashboard/comshortlist', methods=['GET', 'POST'])
def comshortlist():

    cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)

    if request.method == "POST":

        job_id = request.form.get('job_id')   # ✅ get job_id

        # 🔥 FETCH COMPANY NAME FROM interviewtable
        cursor.execute("SELECT CName FROM interviewtable WHERE id=%s", (job_id,))
        job = cursor.fetchone()

        if job:
            cname = job['CName']
        else:
            cname = "Unknown"

        # other values
        skillset = request.form['sset']
        name = request.form['name']
        qualification = request.form['qualification']
        experience = request.form['experience']
        status = request.form['status']

        # 🔥 INSERT INTO SHORTLIST
        cursor.execute("""
        INSERT INTO shortlist
        (cname, skillset, name, qualification, experience, status)
        VALUES (%s,%s,%s,%s,%s,%s)
        """,(cname, skillset, name, qualification, experience, status))

        mysql.connection.commit()
        flash("Candidate Shortlisted Successfully")

        return redirect(url_for('comresume'))   # better UX

    return render_template("company_dashboard/comshortlist.html")


@app.route('/company_dashboard/comshortlist_rep')
def comshortlist_rep():

    cname = session.get('cname')   # 🔥 logged company

    cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
    cursor.execute('SELECT * FROM shortlist WHERE cname=%s', (cname,))
    account = cursor.fetchall()

    return render_template('company_dashboard/comshortlist_rep.html', account=account)

@app.route('/company_dashboard/download/<filename>')
def download_file(filename):

    return send_from_directory(app.config['UPLOAD_FOLDER'],filename,as_attachment=True)





if __name__ == '__main__': 
    app.run(debug = True) 
