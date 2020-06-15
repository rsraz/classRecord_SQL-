USE classRecord;

SELECT * FROM students;   
SELECT * FROM courses;        
SELECT * FROM professors;  
SELECT * FROM grades;  

-- table of ARTS 1 students with their names, grade and assessment 
SELECT 
	CONCAT(first_name, ' ', last_name) AS "ARTS 1 Students",
    grade as Grade,
    CASE 
		WHEN grade <= 3.00 THEN "Passed"
         WHEN grade > 3.00 AND grade <=4.00 THEN "Incomplete"
        ELSE "Failed"
	END AS Assessment
FROM students 
JOIN grades
ON students.id = grades.student_id
JOIN courses
ON grades.course_id = courses.id
WHERE course_name = "ARTS 1"
ORDER BY Grade ASC;

-- table of MATH 10 students with their names, grade and assessment 
SELECT 
	CONCAT(first_name, ' ', last_name) AS "MATH 10 Students",
    grade as Grade,
    CASE 
		WHEN grade <= 3.00 THEN "Passed"
         WHEN grade > 3.00 AND grade <=4.00 THEN "Incomplete"
        ELSE "Failed"
	END AS Assessment
FROM students 
JOIN grades
ON students.id = grades.student_id
JOIN courses
ON grades.course_id = courses.id
WHERE course_name = "MATH 10"
ORDER BY Grade ASC;

-- table of CMSC 133 students with their names, grade and assessment 
SELECT 
	CONCAT(first_name, ' ', last_name) AS "CMSC 133 Students",
    grade as Grade,
    CASE 
		WHEN grade <= 3.00 THEN "Passed"
        WHEN grade > 3.00 AND grade <=4.00 THEN "Incomplete"
        ELSE "Failed"
	END AS Assessment
FROM students 
JOIN grades
ON students.id = grades.student_id
JOIN courses
ON grades.course_id = courses.id
WHERE course_name = "CMSC 133"
ORDER BY Grade ASC;

-- table of CMSC 127 students with their names, grade and assessment 
SELECT 
	CONCAT(first_name, ' ', last_name) AS "CMSC 127 Students",
    grade as Grade,
    CASE 
		WHEN grade <= 3.00 THEN "Passed"
        WHEN grade > 3.00 AND grade <=4.00 THEN "Incomplete"
        ELSE "Failed"
	END AS Assessment
FROM students 
JOIN grades
ON students.id = grades.student_id
JOIN courses
ON grades.course_id = courses.id
WHERE course_name = "CMSC 127"
ORDER BY Grade ASC;

-- table of CMSC 106 students with their names, grade and assessment 
SELECT 
	CONCAT(first_name, ' ', last_name) AS "CMSC 106 Students",
    grade as Grade,
    CASE 
		WHEN grade <= 3.00 THEN "Passed"
        WHEN grade > 3.00 AND grade <=4.00 THEN "Incomplete"
        ELSE "Failed"
	END AS Assessment
FROM students 
JOIN grades
ON students.id = grades.student_id
JOIN courses
ON grades.course_id = courses.id
WHERE course_name = "CMSC 106"
ORDER BY last_name, first_name, Grade ASC;

-- table of CMSC 141 students with their names, grade and assessment 
SELECT 
	CONCAT(first_name, ' ', last_name) AS "CMSC 141 Students",
    grade as Grade,
    CASE 
		WHEN grade <= 3.00 THEN "Passed"
        WHEN grade > 3.00 AND grade <=4.00 THEN "Incomplete"
        ELSE "Failed"
	END AS Assessment
FROM students 
JOIN grades
ON students.id = grades.student_id
JOIN courses
ON grades.course_id = courses.id
WHERE course_name = "CMSC 141"
ORDER BY last_name, first_name, Grade ASC;

-- table of PE 2H students with their names, grade and assessment 
SELECT 
	CONCAT(first_name, ' ', last_name) AS "PE 2H Students",
    grade as Grade,
    CASE 
		WHEN grade <= 3.00 THEN "Passed"
        WHEN grade > 3.00 AND grade <=4.00 THEN "Incomplete"
        ELSE "Failed"
	END AS Assessment
FROM students 
JOIN grades
ON students.id = grades.student_id
JOIN courses
ON grades.course_id = courses.id
WHERE course_name = "PE 2H"
ORDER BY last_name, first_name, Grade ASC;

-- courses and professors handling it
SELECT 
	course_name as Course, 
    concat(first_name, " ", last_name) as Professors
FROM courses
INNER JOIN professors
ON courses.id = professors.course_id
ORDER BY course;

-- HIGHEST GRADE FOR EACH COURSE
SELECT 
	course_name as Course,
    Min(grade) as "Highest Grade"
FROM students
JOIN grades
ON students.id = grades.student_id
JOIN courses
ON grades.course_id = courses.id
GROUP BY course_name
ORDER BY course_name;

-- student name and their average grade as well as their award for the sem
SELECT 
	CONCAT(first_name, ' ', last_name) as Student,
    AVG(grade) as Average_Grade,
    CASE
		WHEN AVG(grade) <= 1.500000 THEN "UNIVERSITY SCHOLAR"
        WHEN AVG(grade) > 1.500000 AND AVG(grade) <= 1.75000 THEN "COLLEGE SCHOLAR"
        ELSE "NONE"
    END as ASSESSMENT 
FROM students
JOIN grades
ON students.id = grades.student_id
JOIN courses
ON grades.course_id = courses.id
GROUP BY last_name, first_name
ORDER BY last_name, first_name;

-- this is supposed to query the name of the student with the highest grade
