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
    course_section INT,
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
     score INT,
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



INSERT INTO Professor
VALUES
(18571,'john', 'doe', "763-587-9999", "room 37"),
(18572,'mary', 'jane', "202-777-9489", "room 22"),
(18573,'monica', 'lewinsky', "404-697-3674", "room 1"),
(18574,'lana', 'del ray', "625-222-7548", "room 6");

INSERT INTO Student
VALUES
(259871,'steve', 'jobs'),
(259872,'ivy', 'smith'),
(259873,'sam', 'smith'),
(259874,'victoria', 'paris');

INSERT INTO Category
VALUES
(1, 'Participation', 10),
(2, 'Homework', 20),
(3, 'Tests', 50),
(4, 'Project', 20);

INSERT INTO Courses(course_id,professor_id,department,course_section,course_name,semester,year)
VALUES
(808, 18571,'math', 1, 'linear algebra', 'fall', 2023),
(607, 18572,'english', 1, 'russian literature', 'fall', 2023),
(505, 18573, 'science', 1, 'astronomy', 'spring', 2024),
(304, 18574, 'math', 1, 'pre calculus', 'spring', 2024);

INSERT INTO Assignment(assignment_id, category_id, assignment_name, score, max_score)
VALUES
(101, 2, 'Homework 1', 77, 100),
(102, 3, 'Test 3', 96, 100),
(103, 4, 'Bison Project', 89, 100),
(104, 3, 'Theory Exam', 65, 100),
(105, 1, 'Exit ticket', 10, 20);

INSERT INTO Grade (grade_id,student_id, assignment_id, course_id, student_score, date)
VALUES 
(101,259871, 101, 304, 90, '2024-04-15'),
(171,259872, 102, 505, 75, '2024-04-15'),
(151,259873, 103, 607, 85, '2024-04-15'),
(110,259874, 104, 808, 65, '2024-04-15');


#CREATE VIEW Grade_view AS
#SELECT grade_id, student_id, course_id, student_score
#FROM Grade
#WHERE student_score > 90; 

#SHOW CREATE VIEW Grade_view;
SELECT *
FROM Grade


