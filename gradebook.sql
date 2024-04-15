DROP DATABASE IF EXISTS Gradebook;
CREATE DATABASE Gradebook;
USE Gradebook;


CREATE TABLE Courses (
	course_id INT,
    professor_id INT,
    department VARCHAR(100),
    course_number INT,
    course_name VARCHAR(100),
    semester VARCHAR(25),
    year INT
    );


CREATE TABLE Professor (
     professor_id INT,
     first_name VARCHAR(50),
     last_name VARCHAR(50),
     contact_info VARCHAR(50),
     office_location VARCHAR(50)
);

CREATE TABLE Category (
     category_id INT,
     category_name VARCHAR(100),
     wieght_percent INT
); 

CREATE TABLE Assignment (
     assignment_id INT,
     category_id INT,
     assignment_name VARCHAR(100),
     max_score INT
);

CREATE TABLE Student (
      student_id INT,
      first_name VARCHAR(50),
      last_name VARCHAR(50)
);

CREATE TABLE Grade(
grade_id INT,
student_id INT,
assignment_id INT,
course_id INT,
student_score INT,
date DATE
);

INSERT INTO Grade
VALUES 
(101, 3038031, 112, 354, 95, '2024-04-27'),
(102, 3038032, 112, 354, 86, '2024-04-27'),
(103, 3038033, 112, 354, 91, '2024-04-27'),
(104, 3038034, 112, 354, 70, '2024-04-27');

#CREATE VIEW Grade_view AS
#SELECT grade_id, student_id, course_id, student_score
#FROM Grade
#WHERE student_score > 90; 

#SHOW CREATE VIEW Grade_view;
SELECT *
FROM Grade