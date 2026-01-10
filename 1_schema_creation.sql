/* =========================
   CREATE DATABASE
========================= */
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = 'QuanLySinhVien')
BEGIN
    CREATE DATABASE QuanLySinhVien;
END
GO

USE QuanLySinhVien;
GO

/* =========================
   FACULTY
========================= */
CREATE TABLE faculty (
    faculty_id BIGINT IDENTITY(1,1) PRIMARY KEY,
    faculty_name VARCHAR(255) NOT NULL,
    head_of_faculty VARCHAR(255) NOT NULL,
    number_of_departments INT NOT NULL
);

/* =========================
   DEPARTMENT
========================= */
CREATE TABLE department (
    department_id BIGINT IDENTITY(1,1) PRIMARY KEY,
    faculty_id BIGINT NOT NULL,
    department_name VARCHAR(255) NOT NULL,
    head_of_dept VARCHAR(255),
    CONSTRAINT fk_department_faculty
        FOREIGN KEY (faculty_id)
        REFERENCES faculty(faculty_id)
);

/* =========================
   STUDENTS
========================= */
CREATE TABLE students (
    student_id BIGINT IDENTITY(1,1) PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    matric_number BIGINT NOT NULL,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    major_department_id BIGINT NOT NULL,
    phone_number VARCHAR(255) NOT NULL,
    DOB DATE NOT NULL,
    address NVARCHAR(MAX) NOT NULL,
    CONSTRAINT uq_students_email UNIQUE (email),
    CONSTRAINT fk_student_department
        FOREIGN KEY (major_department_id)
        REFERENCES department(department_id)
);

/* =========================
   INSTRUCTORS
========================= */
CREATE TABLE instructors (
    instructor_id BIGINT IDENTITY(1,1) PRIMARY KEY,
    department_id BIGINT NOT NULL,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    phone_number VARCHAR(255) NOT NULL,
    hire_date DATE NOT NULL,
    CONSTRAINT uq_instructor_email UNIQUE (email),
    CONSTRAINT fk_instructor_department
        FOREIGN KEY (department_id)
        REFERENCES department(department_id)
);

/* =========================
   SEMESTER
========================= */
CREATE TABLE semester (
    semester_id BIGINT IDENTITY(1,1) PRIMARY KEY,
    semester VARCHAR(100) NOT NULL
);

/* =========================
   COURSES
========================= */
CREATE TABLE courses (
    course_id BIGINT IDENTITY(1,1) PRIMARY KEY,
    course_code VARCHAR(255) NOT NULL,
    course_title VARCHAR(255) NOT NULL,
    credits INT NOT NULL,
    department_id BIGINT NOT NULL,
    description NVARCHAR(MAX) NOT NULL,
    max_capacity INT NOT NULL,
    CONSTRAINT uq_course_code UNIQUE (course_code),
    CONSTRAINT fk_course_department
        FOREIGN KEY (department_id)
        REFERENCES department(department_id)
);

/* =========================
   COURSE PREREQUISITES
========================= */
CREATE TABLE course_prerequisites (
    course_id BIGINT NOT NULL,
    prerequisite_course_id BIGINT NOT NULL,
    CONSTRAINT pk_course_prerequisites
        PRIMARY KEY (course_id, prerequisite_course_id),
    CONSTRAINT fk_prereq_course
        FOREIGN KEY (course_id)
        REFERENCES courses(course_id),
    CONSTRAINT fk_prereq_required
        FOREIGN KEY (prerequisite_course_id)
        REFERENCES courses(course_id)
);

/* =========================
   COURSE OFFERING
========================= */
CREATE TABLE course_offering (
    offering_id BIGINT IDENTITY(1,1) PRIMARY KEY,
    course_id BIGINT NOT NULL,
    instructor_id BIGINT NOT NULL,
    semester_id BIGINT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    location NVARCHAR(MAX) NOT NULL,
    capacity INT NOT NULL,
    CONSTRAINT fk_offering_course
        FOREIGN KEY (course_id)
        REFERENCES courses(course_id),
    CONSTRAINT fk_offering_instructor
        FOREIGN KEY (instructor_id)
        REFERENCES instructors(instructor_id),
    CONSTRAINT fk_offering_semester
        FOREIGN KEY (semester_id)
        REFERENCES semester(semester_id)
);

/* =========================
   ENROLLMENT
========================= */
CREATE TABLE enrollment (
    enrollment_id BIGINT IDENTITY(1,1) PRIMARY KEY,
    student_id BIGINT NOT NULL,
    offering_id BIGINT NOT NULL,
    enrollment_date DATE NOT NULL,
    grade VARCHAR(50) NULL,
    CONSTRAINT uq_student_offering UNIQUE (student_id, offering_id),
    CONSTRAINT fk_enrollment_student
        FOREIGN KEY (student_id)
        REFERENCES students(student_id),
    CONSTRAINT fk_enrollment_offering
        FOREIGN KEY (offering_id)
        REFERENCES course_offering(offering_id)
);

/* =========================
   FINANCIAL AID
========================= */
CREATE TABLE financial_aid (
    financial_aid_id BIGINT IDENTITY(1,1) PRIMARY KEY,
    student_id BIGINT NOT NULL,
    eligibility BIT NOT NULL,
    amount INT NOT NULL,
    aid_type VARCHAR(255) NOT NULL,
    application_date DATE NOT NULL,
    award_date DATE NOT NULL,
    CONSTRAINT fk_financial_student
        FOREIGN KEY (student_id)
        REFERENCES students(student_id)
);
