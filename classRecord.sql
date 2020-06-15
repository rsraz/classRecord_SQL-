CREATE DATABASE classRecord;
USE classRecord;

CREATE TABLE students(
	id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    age INT NOT NULL,
    gender enum("F", "M") NOT NULL
);

-- DESC comsciSophomores;

-- ALTER TABLE comsciSophomores
-- RENAME TO students;

DESC students;

CREATE TABLE courses(
	id INT AUTO_INCREMENT PRIMARY KEY,
	course_name VARCHAR(30),
    pre_req_course VARCHAR(30)
);


CREATE TABLE professors(
	id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    course_id INT NOT NULL,
    FOREIGN KEY (course_id) REFERENCES courses(id)
);


CREATE TABLE grades(
	id INT AUTO_INCREMENT PRIMARY KEY,
	student_id INT NOT NULL,
    course_id INT NOT NULL,	
    grade DEC(3,2) NOT NULL, 
    FOREIGN KEY (student_id) REFERENCES students(id),
    FOREIGN KEY (course_id) REFERENCES courses(id)
);

DROP TABLE professors;
DROP TABLE grades;
DROP TABLE courses;

DESC courses;
DESC professors;
DESC grades;

SHOW TABLES;