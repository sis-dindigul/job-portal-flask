-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 04, 2026 at 09:42 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jobportalflk`
--

-- --------------------------------------------------------

--
-- Table structure for table `interviewtable`
--

CREATE TABLE `interviewtable` (
  `id` int(20) NOT NULL,
  `Date` varchar(30) DEFAULT NULL,
  `CName` varchar(60) DEFAULT NULL,
  `Address` varchar(60) DEFAULT NULL,
  `Contact` varchar(60) DEFAULT NULL,
  `Mobile` varchar(30) DEFAULT NULL,
  `City` varchar(50) DEFAULT NULL,
  `Time` varchar(30) DEFAULT NULL,
  `Position` varchar(50) DEFAULT NULL,
  `requirements` varchar(100) NOT NULL,
  `npos` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `interviewtable`
--

INSERT INTO `interviewtable` (`id`, `Date`, `CName`, `Address`, `Contact`, `Mobile`, `City`, `Time`, `Position`, `requirements`, `npos`) VALUES
(1, '2026-04-20', 'HCL', 'Chennai', 'Kannan', '9865451230', 'Chennai,Bangalore', '11 am', 'AI/ML Engineer', 'TensorFlow Python', '10'),
(3, '2026-04-28', 'pooja center', 'dindigul', 'pooja', '8574237637', 'dindigul', '10.30am', 'Accountant', 'Tally GST', '5'),
(4, '2026-04-26', 'lucky company', 'dindigul', 'devi', '7475758985', 'dindigul', '10am', 'AI/ML Engineer', 'TensorFlow Python', '5'),
(6, '2026-04-10', 'pooja center', 'chennai', 'murugan', '9856587568', 'chennai', '10am', 'Accountant', 'Tally GST', '5'),
(7, '2026-04-07', 'lucky company', 'chennai', 'devi', '9854715635', 'chennai', '10am', 'AI/ML Engineer', 'TensorFlow Python', '5');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` int(11) NOT NULL,
  `job_role` varchar(255) DEFAULT NULL,
  `requirements` varchar(255) DEFAULT NULL,
  `candidate_skill` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`id`, `job_role`, `requirements`, `candidate_skill`) VALUES
(1, 'Accountant', 'Tally GST', 'Tally GST Excel Accounting'),
(2, 'AI/ML Engineer', 'TensorFlow Python', 'Python TensorFlow Machine_Learning Deep_Learning'),
(3, 'Auditor', 'Audit Compliance', 'Audit_Reports Compliance Finance'),
(4, 'Backend Developer', 'Python Django API', 'Python Django REST API MySQL'),
(5, 'Banking Executive', 'Banking Ops', 'Banking_Operations Customer_Handling Finance'),
(6, 'Business Analyst', 'Requirement Analysis', 'Requirement_Gathering Documentation SQL'),
(7, 'Civil Engineer', 'Construction', 'Construction_Site AutoCAD Project_Management'),
(8, 'Cloud Engineer', 'AWS Azure', 'AWS Azure Cloud DevOps Linux'),
(9, 'College Lecturer', 'Engineering Subjects', 'Teaching_Engineering_Subjects Communication'),
(10, 'Content Writer', 'SEO Writing', 'SEO_Writing Blogging_Content Marketing'),
(11, 'Customer Relationship Manager', 'CRM Tools', 'CRM_Tools Customer_Handling Communication'),
(12, 'Customer Support Executive', 'Call Support', 'Call_Support Customer_Service Communication'),
(13, 'Cyber Security Analyst', 'Network Security', 'Cyber_Security Network_Security Ethical_Hacking'),
(14, 'Data Analyst', 'Excel SQL PowerBI', 'Excel SQL PowerBI Data_Visualization'),
(15, 'Data Scientist', 'Python ML Pandas', 'Python Pandas Machine_Learning Data_Science'),
(16, 'Database Administrator', 'MySQL Oracle', 'MySQL Oracle Database_Management SQL'),
(17, 'Delivery Executive', 'Logistics Delivery', 'Delivery_Logistics Time_Management'),
(18, 'DevOps Engineer', 'Docker Kubernetes', 'Docker Kubernetes CI/CD AWS'),
(19, 'Digital Marketing Specialist', 'Google Ads SEO', 'SEO Google_Ads Social_Media_Marketing'),
(20, 'Doctor', 'General Medicine', 'Patient_Diagnosis Treatment_Medical_Knowledge'),
(21, 'Education Counselor', 'Student Guidance', 'Student_Counseling Communication Guidance'),
(22, 'Electrical Engineer', 'Electrical Systems', 'Electrical Systems_Maintenance Troubleshooting'),
(23, 'Electronics Engineer', 'Circuit Design', 'Circuit_Design Embedded_Systems'),
(24, 'Financial Analyst', 'Finance Excel', 'Finance_Analysis Excel_Budgeting'),
(25, 'Frontend Developer', 'React HTML CSS', 'React HTML CSS JavaScript UI_Design'),
(26, 'Full Stack Developer', 'MERN Stack', 'MongoDB Express React Node.js'),
(27, 'Graphic Designer', 'Photoshop Illustrator', 'Photoshop_Illustrator Creativity_Design'),
(28, 'HR Executive', 'HRMS Hiring', 'HRMS_Recruitment Communication'),
(29, 'HR Manager', 'Recruitment Payroll', 'Recruitment_Payroll Employee_Management'),
(30, 'Marketing Executive', 'Digital Marketing', 'Digital_Marketing SEO Social_Media'),
(31, 'Marketing Manager', 'SEO Campaigns', 'SEO_Campaign_Strategy Marketing'),
(32, 'Mechanical Engineer', 'AutoCAD Design', 'AutoCAD SolidWorks Mechanical_Design'),
(33, 'Medical Lab Technician', 'Lab Testing', 'Lab_Testing Diagnostics Equipment_Handling'),
(34, 'Mobile App Developer', 'Flutter Android', 'Flutter Android_App_Development'),
(35, 'Network Engineer', 'Cisco Networking', 'Cisco_Networking Routing Switching'),
(36, 'Operations Manager', 'Operations Planning', 'Operations_Planning_Management Leadership'),
(37, 'Pharmacist', 'Medicine Dispensing', 'Medicine_Dispensing Pharmacy_Knowledge'),
(38, 'Physiotherapist', 'Physical Therapy', 'Physical_Therapy Rehabilitation'),
(39, 'Principal', 'School Admin', 'School_Administration Leadership'),
(40, 'Project Manager', 'Agile Scrum', 'Agile_Scrum Project_Management'),
(41, 'Quality Control Engineer', 'Quality Testing', 'Quality_Testing Inspection'),
(42, 'Sales Executive', 'Client Handling', 'Client_Handling Sales_Communication'),
(43, 'Sales Manager', 'Sales Strategy', 'Sales_Strategy Leadership'),
(44, 'School Teacher', 'Teaching Maths', 'Teaching_Maths Classroom_Management'),
(45, 'Software Developer', 'Python Flask MySQL', 'Python Flask MySQL Backend_Development'),
(46, 'Staff Nurse', 'Patient Care', 'Patient_Care Nursing Medical_Support'),
(47, 'System Administrator', 'Linux Server', 'Linux_Server_Administration Networking'),
(48, 'Tax Consultant', 'Tax Filing GST', 'Tax_Filing GST Accounting'),
(49, 'Tutor', 'Home Tuition', 'Teaching_Home_Tuition Communication'),
(50, 'Web Developer', 'HTML CSS JS', 'HTML CSS JavaScript Web_Development');

-- --------------------------------------------------------

--
-- Table structure for table `newcompany`
--

CREATE TABLE `newcompany` (
  `id` int(20) NOT NULL,
  `cname` varchar(30) DEFAULT NULL,
  `cperson` varchar(30) DEFAULT NULL,
  `adrs` varchar(30) DEFAULT NULL,
  `city` varchar(30) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `mobile` varchar(30) DEFAULT NULL,
  `awork` varchar(50) DEFAULT NULL,
  `uname` varchar(30) DEFAULT NULL,
  `pwd` varchar(30) DEFAULT NULL,
  `sqns` varchar(30) DEFAULT NULL,
  `answer` varchar(30) DEFAULT NULL,
  `flag` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `newcompany`
--

INSERT INTO `newcompany` (`id`, `cname`, `cperson`, `adrs`, `city`, `email`, `mobile`, `awork`, `uname`, `pwd`, `sqns`, `answer`, `flag`) VALUES
(1, 'HCL', 'devi', 'alvarpet', 'chennai', 'hcl123@gmail.com', '9854715635', 'IT', 'hcl', 'hcl', 'What is Your Pet Name?', 'lilly', 1),
(3, 'PVK', 'Hemamalini', 'dindigul', 'dindigul', 'malini123@gmail.com', '9632587410', 'Exports', 'malini', 'malini', 'Who is Your Favourite Person?', 'APJ abdulkalam', 1),
(4, 'lucky company', 'devi', 'dindigul', 'dindigul', 'devi123@gmail.com', '7475758985', 'IT', 'devi', 'devi', 'What is Your Pet Name?', 'bujji', 1),
(5, 'SRK company', 'hari', 'dindigul', 'dindigul', 'srk123@gmail.com', '7475758985', 'software', 'srk', 'srk', 'What is Your Pet Name?', 'puppy', 1),
(6, 'RR construction', 'guna', 'dindigul', 'dindigul', 'rr123@gmail.com', '9854715632', 'real estate', 'rrbuilding', 'rrbuilding', 'What is Your Pet Name?', 'lucky', 0),
(7, 'pooja center', 'pooja', 'dindigul', 'dindigul', 'pooja123@gmail.com', '8574237637', 'manufacturing', 'pooja', 'pooja', 'What is Your Pet Name?', 'star', 1);

-- --------------------------------------------------------

--
-- Table structure for table `newjobseeker`
--

CREATE TABLE `newjobseeker` (
  `id` int(25) NOT NULL,
  `jname` varchar(40) DEFAULT NULL,
  `adrs` varchar(60) DEFAULT NULL,
  `city` varchar(40) DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `quali` varchar(40) DEFAULT NULL,
  `gender` varchar(40) DEFAULT NULL,
  `dob` varchar(20) DEFAULT NULL,
  `upload` varchar(40) DEFAULT NULL,
  `uname` varchar(40) DEFAULT NULL,
  `pwd` varchar(40) DEFAULT NULL,
  `secqns` varchar(100) DEFAULT NULL,
  `answer` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `newjobseeker`
--

INSERT INTO `newjobseeker` (`id`, `jname`, `adrs`, `city`, `email`, `mobile`, `quali`, `gender`, `dob`, `upload`, `uname`, `pwd`, `secqns`, `answer`) VALUES
(2, 'Kumar', 'Chennai', 'Chennai', 'kumar@gmail.com', '9865741230', 'B.C.A', 'Male', '15/08/1984', 'Doc1.docx', 'kumar', 'kumar', 'Who is Your Favourite Person?', 'me'),
(3, 'sai', 'dindigul', 'dindigul', 'sai123@gmail.com', '9854715635', 'B.C.A', 'Female', '02/05/2000', 'Doc1.docx', 'sai', 'sai', 'Who is Your Favourite Person?', 'mother terasa'),
(4, 'sanjai', 'dindigul', 'dindigul', 'sanjai123s@gmail.com', '8521455748', 'B.C.A', 'Male', '02/05/2000', 'Doc1.docx', 'sanjai', 'sanjai', 'What is Your Pet Name?', 'bujji'),
(5, 'karthick', 'dindigul', 'dindigul', 'karthi123@gmail.com', '8745214563', 'B.C.A', 'Male', '02-03-2005', 'EX MARK LIST.xlsx', 'karthi', 'karthi', 'Who is Your Favourite Person?', 'Amma'),
(6, 'guru', 'dindigul', 'dindigul', 'guru123@gmail.com', '9854715475', 'B.C.A', 'Male', '05-08-2005', 'Doc2.docx', 'guru', 'guru', 'Who is Your Favourite Person?', 'Father'),
(7, 'uma', 'madurai', 'madurai', 'uma123@gmail.com', '9000256577', 'M.Sc.C.S', 'Female', '5-4-2005', 'uma_mark.docx', 'uma', 'uma', 'Who is Your Favourite Person?', 'mother terasa');

-- --------------------------------------------------------

--
-- Table structure for table `resumetable`
--

CREATE TABLE `resumetable` (
  `id` int(20) NOT NULL,
  `jname` varchar(40) DEFAULT NULL,
  `fname` varchar(40) DEFAULT NULL,
  `street` varchar(40) DEFAULT NULL,
  `city` varchar(40) DEFAULT NULL,
  `state` varchar(40) DEFAULT NULL,
  `country` varchar(40) DEFAULT NULL,
  `pincode` varchar(40) DEFAULT NULL,
  `qualification` varchar(40) DEFAULT NULL,
  `mailid` varchar(40) DEFAULT NULL,
  `mobile` varchar(40) DEFAULT NULL,
  `referencename` varchar(40) DEFAULT NULL,
  `precomname` varchar(40) DEFAULT NULL,
  `experience` varchar(40) DEFAULT NULL,
  `salary` varchar(40) DEFAULT NULL,
  `resumee` varchar(100) DEFAULT NULL,
  `skillset` varchar(300) DEFAULT NULL,
  `job_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `resumetable`
--

INSERT INTO `resumetable` (`id`, `jname`, `fname`, `street`, `city`, `state`, `country`, `pincode`, `qualification`, `mailid`, `mobile`, `referencename`, `precomname`, `experience`, `salary`, `resumee`, `skillset`, `job_id`) VALUES
(8, 'sai', 'Ganesh', 'anna nagar', 'dindigul', 'Tamilnadu', 'india', '624001', 'B.Com(CA)', 'sai123@gmail.com', '9632587410', 'chandru', 'SAI Info-tech', '2', '10000', 'KARTHI DEC DAILY.docx', 'Tally,GST,Excel_Accounting', 6),
(9, 'Kumar', 'Ravi', 'anna nagar', 'Dindigul', 'Tamilnadu', 'india', '624001', 'MCA', 'kumar123@gmail.com', '7475758985', 'nil', 'SSR Info-tech', '2', '30000', 'kumar_resume.docx', 'Python,TensorFlow,Machine_Learning,Deep_Learning', 7),
(10, 'chitra', 'Ganesh', 'julee nagar', 'Madurai', 'Tamilnadu', 'india', '624011', 'MCA', 'chitra123@gmail.com', '9856587568', 'vimala', 'nil', '0', '25000', 'chitra_resume.docx', 'Python,TensorFlow,Machine_Learning', 7),
(11, 'uma', 'shanmugam', 'MGR Nagar', 'Trichy', 'Tamilnadu', 'india', '630018', 'M.Sc', 'uma123@gmail.com', '9000256577', 'pooja', 'nil', '0', '15000', 'uma_resume.docx', 'Python,TensorFlow,Machine_Learning,Deep_Learning', 7),
(12, 'sairam', 'shanmugam', 'KK nagar', 'Dindigul', 'Tamilnadu', 'india', '624013', 'M.Sc', 'sairam123@gmail.com', '8245555541', 'nil', 'PVP info-tech', '2', '35000', 'sairam_resume.docx', 'Python,TensorFlow,Machine_Learning,Deep_Learning', 7),
(13, 'Joseph', 'Michel', 'JJ street', 'velankanni', 'Tamilnadu', 'india', '635424', 'MCA', 'joseph123@gmail.com', '6985415656', 'Helan', 'HRM infotech', '5', '50000', 'helan_resume.docx', 'Python,TensorFlow,Machine_Learning,Deep_Learning', 7);

-- --------------------------------------------------------

--
-- Table structure for table `shortlist`
--

CREATE TABLE `shortlist` (
  `id` int(11) NOT NULL,
  `cname` varchar(100) DEFAULT NULL,
  `skillset` varchar(50) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `qualification` varchar(100) DEFAULT NULL,
  `experience` varchar(50) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `shortlist`
--

INSERT INTO `shortlist` (`id`, `cname`, `skillset`, `name`, `qualification`, `experience`, `status`) VALUES
(7, 'pooja center', 'Tally,GST,Excel_Accounting', 'sai', 'B.Com(CA)', '2', 'Shortlisted'),
(8, 'lucky company', 'Python,TensorFlow,Machine_Learning,Deep_Learning', 'Kumar', 'MCA', '2', 'Shortlisted'),
(9, 'lucky company', 'Python,TensorFlow,Machine_Learning,Deep_Learning', 'sairam', 'M.Sc', '2', 'Shortlisted'),
(10, 'lucky company', 'Python,TensorFlow,Machine_Learning,Deep_Learning', 'Joseph', 'MCA', '5', 'Shortlisted');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `interviewtable`
--
ALTER TABLE `interviewtable`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `newcompany`
--
ALTER TABLE `newcompany`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `newjobseeker`
--
ALTER TABLE `newjobseeker`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `resumetable`
--
ALTER TABLE `resumetable`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shortlist`
--
ALTER TABLE `shortlist`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `interviewtable`
--
ALTER TABLE `interviewtable`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `newcompany`
--
ALTER TABLE `newcompany`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `newjobseeker`
--
ALTER TABLE `newjobseeker`
  MODIFY `id` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `resumetable`
--
ALTER TABLE `resumetable`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `shortlist`
--
ALTER TABLE `shortlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
