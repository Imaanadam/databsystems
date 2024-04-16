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
(105, 1, 'Exit ticket', 10, 20),
(106, 2, 'Homework 1', 100, 100),
(107, 2, 'Homework 1', 35, 100);


INSERT INTO Grade (grade_id,student_id, assignment_id, course_id, student_score, date)
VALUES 
(101,259871, 101, 304, 90, '2024-04-15'),
(171,259872, 102, 505, 75, '2024-04-15'),
(151,259873, 103, 607, 85, '2024-04-15'),
(110,259874, 104, 808, 65, '2024-04-15'),
(102,259871, 104, 304, 86, '2024-04-15');

#show the tables with the inserted contents;
SELECT *
FROM Professor;

SELECT *
FROM Courses;

SELECT *
FROM Category;

SELECT *
FROM Assignment;

SELECT *
FROM Student;

SELECT *
FROM Grade;

#compute the average/highest/lowest score of an assignment
SELECT AVG(score) as avg_score
FROM Assignment
WHERE assignment_name = 'Homework 1';

SELECT MAX(score) as high_score
FROM Assignment
WHERE assignment_name = 'Homework 1';

SELECT MIN(score) as low_score
FROM Assignment
WHERE assignment_name = 'Homework 1';

#List all the students of a given course
SELECT C.course_name, GR.course_id, GR.student_id, ST.first_name, ST.last_name
FROM Grade as GR JOIN Student as ST ON GR.student_id = ST.student_id
	JOIN Courses as C ON C.course_id = GR.course_id
WHERE GR.course_id = 808; 