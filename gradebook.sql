DROP DATABASE IF EXISTS Gradebook;
CREATE DATABASE Gradebook;
USE Gradebook;

CREATE TABLE Professor (
     professor_id INT PRIMARY KEY,
     first_name VARCHAR(50),
     last_name VARCHAR(50),
     contact_info VARCHAR(50),
     office_location VARCHAR(50)
);

CREATE TABLE Courses (
	course_id INT PRIMARY KEY,
    professor_id INT,
    department VARCHAR(100),
    course_number INT,
    course_name VARCHAR(100),
    semester VARCHAR(25),
    year INT,
    FOREIGN KEY (professor_id) REFERENCES Professor (professor_id)
    );


CREATE TABLE Category (
     category_id INT PRIMARY KEY,
     category_name VARCHAR(100),
     wieght_percent INT
); 

CREATE TABLE Assignment (
     assignment_id INT PRIMARY KEY,
     category_id INT,
     assignment_name VARCHAR(100),
     max_score INT,
     FOREIGN KEY (category_id) REFERENCES Category (category_id)
);

CREATE TABLE Student (
      student_id INT PRIMARY KEY,
      first_name VARCHAR(50),
      last_name VARCHAR(50)
);

CREATE TABLE Grade (
grade_id INT PRIMARY KEY,
student_id INT,
assignment_id INT,
course_id INT,
student_score INT,
date DATE,
FOREIGN KEY (student_id) REFERENCES Student (student_id),
FOREIGN KEY (assignment_id) REFERENCES Assignment (assignment_id),
FOREIGN KEY (course_id) REFERENCES Courses (course_id)
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