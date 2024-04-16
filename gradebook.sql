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

<<<<<<< HEAD
INSERT INTO Grade (grade_id, date)
VALUES 
(101,'2024-04-27');

#(102, 3038032, 112, 354, 86, '2024-04-27'),
#(103, 3038033, 112, 354, 91, '2024-04-27'),
#(104, 3038034, 112, 354, 70, '2024-04-27');
=======
INSERT INTO Grade(grade_id, student_id, assignment_id, course_id, student_score, date)
VALUES 
(101,'2024-04-15'),
(171,'2024-04-15'),
(151,'2024-04-15'),
(110,'2024-04-15');

INSERT INTO Professor
VALUES
(18571,'john', 'doe', "763-587-9999", "room 37"),
(18572,'mary', 'jane', "202-777-9489", "room 22"),
(18573,'monica', 'lewinsky', "404-697-3674", "room 1"),
(185574,'lana', 'del ray', "625-222-7548", "room 6");

INSERT INTO Student
VALUES
(259871,'steve', 'jobs'),
(259872,'ivy', 'smith'),
(259873,'sam', 'smith'),
(259874,'victoria', 'paris');

INSERT INTO Category
VALUES
(1, 'participation', 10),
(2, 'homework', 20),
(3, 'tests', 50),
(4, 'project', 20);

INSERT INTO Courses(course_id,department, course_number, course_name,semester, year)
VALUES
(808, 'math', 1, 'linear algebra', 'fall', 2023),
(607, 'english', 1, 'russian literature', 'fall', 2023),
(505, 'science', 1, 'astronomy', 'spring', 2024),
(304, 'math', 1, 'pre calculus', 'spring', 2024);

# INTO Assignment(assignment_id, assignment_name, max_score)
#VALUES













>>>>>>> c92a7a842559b94b947a3af2a8e311be56369da9

#CREATE VIEW Grade_view AS
#SELECT grade_id, student_id, course_id, student_score
#FROM Grade
#WHERE student_score > 90; 

#SHOW CREATE VIEW Grade_view;
#SELECT *
#FROM Courses