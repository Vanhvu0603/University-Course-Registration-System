# University-Course-Registration-System
# Overview
This project implements a foundational database system for a university course registration platform. It is designed to manage essential entities such as students, instructors, courses, departments, faculties, and enrollment records. The database schema facilitates tracking student academic progress, course offerings, and the relationships between various university entities. This project demonstrates core database design principles, data manipulation techniques, and practical SQL queries using SQL SERVER.
# Database and Tools
SQL SERVER MANAGEMENT STUDIO 22
# Database Schema

The database is meticulously structured to efficiently manage university-related data, ensuring data integrity and enabling complex querying. The schema includes the following key tables and their relationships:

faculty: Stores information about the university's faculties.
department: Details each academic department, linked to a specific faculty.
students: Contains personal and academic information for each registered student, linked to their major department.
instructors: Holds information about university instructors.
courses: Defines the master list of all courses offered by the university.
course_prerequisites: A linking table to establish prerequisite relationships between courses.
course_offering: Records specific instances of courses being offered in a given semester, linked to an instructor and a base course.
enrollment: Tracks student registrations for specific course offerings.
payments: Manages payment information related to student enrollments.
For a visual representation of the database structure and relationships, please refer to the Entity-Relationship Diagram (ERD) below:
