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
     weight_percent INT
); 
CREATE TABLE Student (
      student_id INT PRIMARY KEY,
      first_name VARCHAR(50),
      last_name VARCHAR(50)
);
CREATE TABLE Assignment (
     assignment_id INT PRIMARY KEY,
     category_id INT,
     #student_id INT,
     course_id INT,
     assignment_name VARCHAR(100),
     max_score INT,
	 #FOREIGN KEY (student_id) REFERENCES Student(student_id),
     FOREIGN KEY (category_id) REFERENCES Category (category_id),
     FOREIGN KEY (course_id) REFERENCES Courses (course_id)
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
(259872,'ivy', 'Qee'),
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

INSERT INTO Assignment(assignment_id, category_id, course_id, assignment_name, max_score)
VALUES
(101, 2, 808, 'Homework 1', 100),
(102, 3, 607, 'Test 3', 100),
(103, 4, 505, 'Bison Project', 100),
(104, 3, 304, 'Theory Exam', 100),
(105, 1, 808,'Exit ticket', 20),
(106, 2, 808, 'Homework 1', 100),
(107, 2, 304, 'Homework 1',100);


INSERT INTO Grade (grade_id,student_id, assignment_id, course_id, student_score, date)
VALUES 
(101,259871, 101, 808, 65, '2024-04-15'),
(171,259872, 102, 607, 75, '2024-04-15'),
(151,259873, 103, 505, 85, '2024-04-15'),
(110,259874, 104, 304, 65, '2024-04-15'),
(144,259874, 106, 808, 40, '2024-04-15'),
(124,259874, 105, 808, 19, '2024-04-15'),
(102,259871, 107, 304, 86, '2024-04-15');

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


SELECT student_score as MAX_score
FROM Grade as GR JOIN Assignment as A ON GR.assignment_id = A.assignment_id
WHERE student_score = (SELECT MAX(student_score) FROM Grade WHERE assignment_name = 'Homework 1');

SELECT AVG(G.student_score) AS average_score
FROM Grade G
JOIN Assignment A ON G.assignment_id = A.assignment_id
WHERE A.assignment_name = 'Homework 1' -- Change 'Homework 1' to the desired assignment name
AND A.course_id = 808; -- Change 808 to the desired course_id


SELECT student_score as MIN_score
FROM Grade as GR JOIN Assignment as A ON GR.assignment_id = A.assignment_id
WHERE student_score = (SELECT MIN(student_score) FROM Grade WHERE assignment_name = 'Homework 1');
#SELECT MIN(student_score) as low_score
#FROM Grade
#WHERE assignment_name = 'Homework 1';

#List all the students of a given course
SELECT C.course_name, GR.course_id, GR.student_id, ST.first_name, ST.last_name
FROM Grade as GR JOIN Student as ST ON GR.student_id = ST.student_id
	JOIN Courses as C ON C.course_id = GR.course_id
WHERE GR.course_id = 808; 

#List all students in given coure and their scores for each assignment

#Add and assignment to a course
INSERT INTO Assignment(assignment_id, category_id, course_id, assignment_name, max_score)
VALUES
(108, 4, 607, 'Russian Essay', 100);
SELECT *
FROM Assignment;

SELECT 
    C.course_name,
    S.student_id,
    S.first_name,
    S.last_name,
    A.assignment_name,
    G.student_score
FROM 
    Grade G
JOIN 
    Student S ON G.student_id = S.student_id
JOIN 
    Courses C ON G.course_id = C.course_id
JOIN 
    Assignment A ON G.assignment_id = A.assignment_id
WHERE 
    C.course_id = 808;
    
#Change the percentages of the categories for a course
UPDATE Category
SET weight_percent = 15
WHERE category_id= 1 ;

UPDATE Category
SET weight_percent = 25
WHERE category_id = 2;

UPDATE Category
SET weight_percent = 40
WHERE category_id= 3;

UPDATE Category
SET weight_percent = 20
WHERE category_id = 4;

SELECT * 
FROM Category;

/*UPDATE Grade
SET student_score = student_score + 2
WHERE student_id = 259871 AND assignment_id = 101;

UPDATE Grade
SET student_score = student_score + 2
WHERE student_id = 259872 AND assignment_id = 102;

UPDATE Grade
SET student_score = student_score + 2
WHERE student_id = 259873 AND assignment_id = 103;

UPDATE Grade
SET student_score = student_score + 2
WHERE student_id = 259874 AND assignment_id = 104;
*/
#Add 2 points to the score of each student on an assignment

UPDATE Grade
SET student_score = student_score + 2
WHERE grade_id = 101;

UPDATE Grade
SET student_score = student_score + 2
WHERE grade_id = 110;

UPDATE Grade
SET student_score = student_score + 2
WHERE grade_id = 151;

UPDATE Grade
SET student_score = student_score + 2
WHERE grade_id = 171;

SELECT *
FROM Grade;

/*UPDATE Grade as GR
JOIN Student as ST ON GR.student_id = ST.student_id
SET GR.student_score = GR.student_score + 2
WHERE ST.last_name LIKE '%Q%';

SELECT first_name, last_name, student_score
FROM Grade as GR JOIN Student as ST ON GR.student; */

UPDATE Grade AS GR
JOIN (
    SELECT student_id
    FROM Student
    WHERE last_name LIKE 'Q%'
) AS ST ON GR.student_id = ST.student_id
SET GR.student_score = GR.student_score + 2;

#compute student grade
