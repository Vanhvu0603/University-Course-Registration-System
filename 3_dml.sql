/* =========================================================
   DML OPERATIONS FOR COURSE MANAGEMENT SYSTEM
   SQL SERVER (T-SQL)
   ========================================================= */

------------------------------------------------------------
-- 1. Registering students for courses (Initial batch)
------------------------------------------------------------
INSERT INTO enrollment (student_id, offering_id, enrollment_date, grade) VALUES 
(2, 5, '2025-03-08', 'B'),
(3, 1, '2025-03-09', 'C'),
(4, 1, '2025-03-10', 'B'),
(5, 1, '2025-03-11', 'A');


------------------------------------------------------------
-- 2. Registering a single student for a course
------------------------------------------------------------
INSERT INTO enrollment (student_id, offering_id, enrollment_date, grade) 
VALUES (6, 2, '2025-03-12', NULL);

------------------------------------------------------------
-- 3. Dropping a student from a course (Example 1)
------------------------------------------------------------
DELETE FROM enrollment
WHERE student_id = 3
  AND offering_id = 1;

------------------------------------------------------------
-- 4. Dropping a student from a course (Example 2)
------------------------------------------------------------
DELETE FROM enrollment
WHERE student_id = 4
  AND offering_id = 1;

------------------------------------------------------------
-- 5. Listing all students enrolled in a particular course offering
------------------------------------------------------------
SELECT
    e.offering_id,
    co.course_id,
    c.course_title,
    s.student_id,
    s.first_name,
    s.last_name
FROM enrollment e
INNER JOIN course_offering co ON e.offering_id = co.offering_id
INNER JOIN courses c ON co.course_id = c.course_id
INNER JOIN students s ON e.student_id = s.student_id
WHERE e.offering_id = 1
ORDER BY s.last_name, s.first_name;

------------------------------------------------------------
-- 6. Listing all students in a specific course offering (concise)
------------------------------------------------------------
SELECT
    s.student_id,
    s.first_name,
    s.last_name,
    e.offering_id
FROM enrollment e
INNER JOIN students s ON e.student_id = s.student_id
WHERE e.offering_id = 2
ORDER BY s.last_name, s.first_name;

------------------------------------------------------------
-- 7. Listing all students enrolled in a particular course (all offerings)
------------------------------------------------------------
SELECT
    c.course_id,
    c.course_title,
    s.student_id,
    s.first_name,
    s.last_name
FROM enrollment e
INNER JOIN course_offering co ON e.offering_id = co.offering_id
INNER JOIN courses c ON co.course_id = c.course_id
INNER JOIN students s ON e.student_id = s.student_id
WHERE c.course_id = 1
ORDER BY s.last_name, s.first_name;

------------------------------------------------------------
-- 8. Finding all courses taught by a specific instructor (detailed)
------------------------------------------------------------
SELECT
    i.instructor_id,
    i.first_name,
    i.last_name,
    c.course_id,
    c.course_title,
    co.offering_id,
    se.semester
FROM instructors i
INNER JOIN course_offering co ON i.instructor_id = co.instructor_id
INNER JOIN courses c ON co.course_id = c.course_id
INNER JOIN semester se ON co.semester_id = se.semester_id
WHERE i.instructor_id = 1;

------------------------------------------------------------
-- 9. Finding all courses taught by a specific instructor (concise)
------------------------------------------------------------
SELECT
    c.course_id,
    c.course_title,
    co.offering_id,
    se.semester
FROM course_offering co
INNER JOIN courses c ON co.course_id = c.course_id
INNER JOIN semester se ON co.semester_id = se.semester_id
WHERE co.instructor_id = 1;

------------------------------------------------------------
-- 10. Counting students per department (excluding empty departments)
------------------------------------------------------------
SELECT
    d.department_id,
    d.department_name,
    COUNT(DISTINCT s.student_id) AS student_count
FROM students s
INNER JOIN department d ON s.major_department_id = d.department_id
GROUP BY d.department_id, d.department_name
ORDER BY d.department_name;

------------------------------------------------------------
-- 11. Counting students per department (including zero students)
------------------------------------------------------------
SELECT
    d.department_id,
    d.department_name,
    COUNT(s.student_id) AS student_count
FROM department d
LEFT JOIN students s ON d.department_id = s.major_department_id
GROUP BY d.department_id, d.department_name
ORDER BY d.department_name;

------------------------------------------------------------
-- 12. Identifying course offerings with available seats (Method 1)
------------------------------------------------------------
SELECT
    co.offering_id,
    c.course_id,
    c.course_title,
    co.capacity,
    COUNT(e.enrollment_id) AS enrolled_students,
    (co.capacity - COUNT(e.enrollment_id)) AS available_seats
FROM course_offering co
INNER JOIN courses c ON co.course_id = c.course_id
LEFT JOIN enrollment e ON co.offering_id = e.offering_id
GROUP BY co.offering_id, c.course_id, c.course_title, co.capacity
HAVING (co.capacity - COUNT(e.enrollment_id)) > 0
ORDER BY c.course_title;

------------------------------------------------------------
-- 13. Identifying course offerings with available seats (Method 2)
------------------------------------------------------------
SELECT
    c.course_id,
    c.course_title,
    co.offering_id,
    co.capacity,
    COUNT(e.enrollment_id) AS enrolled_students,
    (co.capacity - COUNT(e.enrollment_id)) AS available_seats
FROM course_offering co
INNER JOIN courses c ON co.course_id = c.course_id
LEFT JOIN enrollment e ON co.offering_id = e.offering_id
GROUP BY c.course_id, c.course_title, co.offering_id, co.capacity
HAVING (co.capacity - COUNT(e.enrollment_id)) > 0
ORDER BY c.course_title;
