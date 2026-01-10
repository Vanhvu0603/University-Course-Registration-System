--- Insertions begin ---

-- seeding for faculty table (actual VNU-IS faculties)
SET IDENTITY_INSERT faculty ON;

INSERT INTO faculty (faculty_id, faculty_name, head_of_faculty, number_of_departments)
VALUES
(1, 'Faculty of Applied Sciences', 'Dr. Chu Đình Tới', 4),
(2, 'Faculty of Economics and Management', 'Assoc. Prof. Dr. Lưu Thị Minh Ngọc', 3),
(3, 'Faculty of Finance and Accounting', 'Assoc. Prof. Dr. Phạm Xuân Hoàn', 2),
(4, 'Faculty of Applied Linguistics', 'Dr. Nguyễn Việt Hùng', 2),
(5, 'Faculty of Engineering and Technology', 'Dr. Lê Xuân Hải', 3),
(6, 'International Francophone Institute (IFI)', 'Dr. Đào Tùng', 1);

SET IDENTITY_INSERT faculty OFF;

-- seeding for department table (VNU-IS)
SET IDENTITY_INSERT department ON;

INSERT INTO department (faculty_id, department_id, department_name, head_of_dept) VALUES

/* =========================
   Faculty of Applied Sciences (faculty_id = 1)
========================= */
(1, 101, 'Department of Applied Mathematics', 'Dr. Nguyễn Văn A'),
(1, 102, 'Department of Applied Physics', 'Dr. Trần Thị B'),
(1, 103, 'Department of Environmental Science', 'Dr. Lê Văn C'),
(1, 104, 'Department of Biotechnology', 'Dr. Phạm Thị D'),

/* =========================
   Faculty of Economics and Management (faculty_id = 2)
========================= */
(2, 201, 'Department of Business Administration', 'Dr. Nguyễn Văn E'),
(2, 202, 'Department of International Economics', 'Dr. Trần Thị F'),
(2, 203, 'Department of Management Science', 'Dr. Lê Văn G'),

/* =========================
   Faculty of Finance and Accounting (faculty_id = 3)
========================= */
(3, 301, 'Department of Finance', 'Dr. Phạm Văn H'),
(3, 302, 'Department of Accounting', 'Dr. Nguyễn Thị I'),

/* =========================
   Faculty of Applied Linguistics (faculty_id = 4)
========================= */
(4, 401, 'Department of English Linguistics', 'Dr. Trần Văn K'),
(4, 402, 'Department of Translation and Interpretation', 'Dr. Nguyễn Thị L'),

/* =========================
   Faculty of Engineering and Technology (faculty_id = 5)
========================= */
(5, 501, 'Department of Information Technology', 'Dr. Lê Văn M'),
(5, 502, 'Department of Computer Science', 'Dr. Phạm Thị N'),
(5, 503, 'Department of Engineering Technology', 'Dr. Nguyễn Văn O'),

/* =========================
   International Francophone Institute – IFI (faculty_id = 6)
========================= */
(6, 601, 'Department of Francophone Studies', 'Dr. Đào Văn P');

SET IDENTITY_INSERT department OFF;



-- seeding for courses table
SET IDENTITY_INSERT courses ON;

INSERT INTO courses
(course_id, course_code, course_title, credits, department_id, description, max_capacity)
VALUES
/* =========================
   Department of Applied Physics (department_id = 102)
========================= */
(1, 'PHY101', 'Introduction to Physics', 3, 102, 'Basic principles of physics including mechanics and thermodynamics.', 100),
(2, 'PHY102', 'Classical Mechanics', 4, 102, 'Study of motion, forces, energy, and momentum.', 80),
(3, 'PHY103', 'Electromagnetism', 4, 102, 'Fundamentals of electric and magnetic fields and their interactions.', 90),
(4, 'PHY104', 'Quantum Physics', 3, 102, 'Introduction to quantum theory and its applications.', 70),
(5, 'PHY105', 'Modern Physics', 3, 102, 'Overview of modern physics concepts including relativity and atomic structure.', 60),

/* =========================
   Department of Applied Chemistry / Environmental Science (department_id = 103)
========================= */
(6, 'CHE101', 'General Chemistry I', 3, 103, 'Introduction to chemical principles and laboratory techniques.', 100),
(7, 'CHE102', 'Organic Chemistry', 4, 103, 'Study of carbon compounds and their reactions.', 80),
(8, 'CHE103', 'Inorganic Chemistry', 3, 103, 'Chemistry of metals and nonmetals.', 70),
(9, 'CHE104', 'Physical Chemistry', 4, 103, 'Thermodynamics, kinetics, and quantum chemistry.', 60),
(10, 'CHE105', 'Analytical Chemistry', 3, 103, 'Methods of chemical analysis and instrumentation.', 90),

/* =========================
   Department of Biotechnology (department_id = 104)
========================= */
(11, 'BIO101', 'General Biology', 3, 104, 'Fundamental concepts of biology including cell structure and genetics.', 100),
(12, 'BIO102', 'Microbiology', 4, 104, 'Study of microorganisms and their roles.', 80),
(13, 'BIO103', 'Genetics', 3, 104, 'Principles of heredity and variation.', 70),
(14, 'BIO104', 'Ecology', 3, 104, 'Interactions between organisms and their environment.', 60),
(15, 'BIO105', 'Human Anatomy', 4, 104, 'Structure and function of the human body.', 90),

/* =========================
   Department of Applied Mathematics (department_id = 101)
========================= */
(16, 'MAT101', 'Calculus I', 4, 101, 'Limits, derivatives, and integrals of functions.', 100),
(17, 'MAT102', 'Linear Algebra', 3, 101, 'Vector spaces, matrices, and linear transformations.', 80),
(18, 'MAT103', 'Discrete Mathematics', 3, 101, 'Logic, sets, combinatorics, and graph theory.', 70),
(19, 'MAT104', 'Probability and Statistics', 3, 101, 'Basic probability theory and statistical inference.', 60),
(20, 'MAT105', 'Differential Equations', 4, 101, 'Ordinary differential equations and applications.', 90),

/* =========================
   Department of Information Technology (department_id = 501)
========================= */
(21, 'CSC101', 'Introduction to Programming', 4, 501, 'Fundamentals of programming using Python.', 120),
(22, 'CSC102', 'Data Structures', 3, 501, 'Study of arrays, lists, trees, and algorithms.', 100),
(23, 'CSC103', 'Database Systems', 3, 501, 'Design and implementation of relational databases.', 80),
(24, 'CSC104', 'Computer Networks', 3, 501, 'Principles of data communication and networking.', 70),
(25, 'CSC105', 'Operating Systems', 4, 501, 'Concepts of process management and memory.', 90);
SET IDENTITY_INSERT courses OFF;

-- seeding for students table
SET IDENTITY_INSERT students ON;

INSERT INTO students (student_id, username, matric_number, first_name, last_name, email, major_department_id, phone_number, "DOB", address) VALUES

/* =========================
   DEPARTMENT OF BDA
========================= */
(1,'phy01_01','211000001',N'Nguyễn',N'Văn An','211000001@vnu.edu.vn',101,'0910000001','2004-01-15',N'Hà Nội'),
(2,'phy101_02','211000002',N'Trần',N'Thị Bình','211000002@vnu.edu.vn',101,'0390000002','2004-02-16',N'Hải Phòng'),
(3,'phy101_03','221000003',N'Lê',N'Hoàng Long','221000003@vnu.edu.vn',101,'0910000003','2004-03-17',N'Nam Định'),
(4,'phy101_04','221000004',N'Phạm',N'Thu Trang','221000004@vnu.edu.vn',101,'0390000004','2004-04-18',N'Ninh Bình'),
(5,'phy101_05','231000005',N'Hoàng',N'Minh Đức','231000005@vnu.edu.vn',101,'0910000005','2004-05-19',N'Quảng Ninh'),
(6,'phy101_06','231000006',N'Vũ',N'Ngọc Anh','231000006@vnu.edu.vn',101,'0390000006','2004-06-20',N'Hà Nam'),
(7,'phy101_07','241000007',N'Đỗ',N'Thanh Tùng','241000007@vnu.edu.vn',101,'0910000007','2004-07-21',N'Thanh Hóa'),
(8,'phy101_08','241000008',N'Bùi',N'Hải Yến','241000008@vnu.edu.vn',101,'0390000008','2004-08-22',N'Nghệ An'),
(9,'phy101_09','251000009',N'Ngô',N'Quang Huy','251000009@vnu.edu.vn',101,'0910000009','2004-09-23',N'Hà Tĩnh'),
(10,'phy101_10','251000010',N'Dương',N'Thùy Linh','251000010@vnu.edu.vn',101,'0390000010','2004-10-24',N'Quảng Bình'),

/* =========================
   DEPARTMENT OF IB
========================= */
(11,'che102_01','211000051',N'Nguyễn',N'Văn Hải','211000051@vnu.edu.vn',102,'0910000051','2004-01-15',N'Hà Nội'),
(12,'che102_02','211000052',N'Trần',N'Thị Mai','211000052@vnu.edu.vn',102,'0390000052','2004-02-16',N'Hải Dương'),
(13,'che102_03','221000053',N'Lê',N'Quốc Bảo','221000053@vnu.edu.vn',102,'0910000053','2004-03-17',N'Bắc Ninh'),
(14,'che102_04','221000054',N'Phạm',N'Ngọc Lan','221000054@vnu.edu.vn',102,'0390000054','2004-04-18',N'Hưng Yên'),
(15,'che102_05','231000055',N'Hoàng',N'Tuấn Kiệt','231000055@vnu.edu.vn',102,'0910000055','2004-05-19',N'Thái Bình'),
(16,'che102_06','231000056',N'Vũ',N'Thanh Hà','231000056@vnu.edu.vn',102,'0390000056','2004-06-20',N'Hà Nam'),
(17,'che102_07','241000057',N'Đỗ',N'Minh Quân','241000057@vnu.edu.vn',102,'0910000057','2004-07-21',N'Hòa Bình'),
(18,'che102_08','241000058',N'Bùi',N'Khánh Ly','241000058@vnu.edu.vn',102,'0390000058','2004-08-22',N'Phú Thọ'),
(19,'che102_09','251000059',N'Ngô',N'Anh Tú','251000059@vnu.edu.vn',102,'0910000059','2004-09-23',N'Lào Cai'),
(20,'che102_10','251000060',N'Dương',N'Ngọc Ánh','251000060@vnu.edu.vn',102,'0390000060','2004-10-24',N'Yên Bái'),


/* =========================
   DEPARTMENT OF ICE
========================= */
(21,'bio103_01','211000101',N'Nguyễn',N'Văn Phúc','211000101@vnu.edu.vn',103,'0910000101','2004-01-15',N'Hà Nội'),
(22,'bio103_02','211000102',N'Trần',N'Thị Hương','211000102@vnu.edu.vn',103,'0390000102','2004-02-16',N'Hải Phòng'),
(23,'bio103_03','221000103',N'Lê',N'Thanh Tâm','221000103@vnu.edu.vn',103,'0910000103','2004-03-17',N'Bắc Giang'),
(24,'bio103_04','221000104',N'Phạm',N'Lan Anh','221000104@vnu.edu.vn',103,'0390000104','2004-04-18',N'Tuyên Quang'),
(25,'bio103_05','231000105',N'Hoàng',N'Quốc Việt','231000105@vnu.edu.vn',103,'0910000105','2004-05-19',N'Cao Bằng'),
(26,'bio103_06','231000106',N'Vũ',N'Thùy Dung','231000106@vnu.edu.vn',103,'0390000106','2004-06-20',N'Lạng Sơn'),
(27,'bio103_07','241000107',N'Đỗ',N'Mạnh Cường','241000107@vnu.edu.vn',103,'0910000107','2004-07-21',N'Quảng Ninh'),
(28,'bio103_08','241000108',N'Bùi',N'Kim Oanh','241000108@vnu.edu.vn',103,'0390000108','2004-08-22',N'Bắc Kạn'),
(29,'bio103_09','251000109',N'Ngô',N'Trung Hiếu','251000109@vnu.edu.vn',103,'0910000109','2004-09-23',N'Sơn La'),
(30,'bio103_10','251000110',N'Dương',N'Phương Thảo','251000110@vnu.edu.vn',103,'0390000110','2004-10-24',N'Điện Biên'),

/* =========================
   DEPARTMENT OF MIS
========================= */
(31,'math104_01','211000151',N'Nguyễn',N'Văn Thành','211000151@vnu.edu.vn',104,'0910000151','2004-01-12',N'Hà Nội'),
(32,'math104_02','211000152',N'Trần',N'Thị Hạnh','211000152@vnu.edu.vn',104,'0390000152','2004-02-13',N'Hải Phòng'),
(33,'math104_03','221000153',N'Lê',N'Minh Tuấn','221000153@vnu.edu.vn',104,'0910000153','2004-03-14',N'Hải Dương'),
(34,'math104_04','221000154',N'Phạm',N'Ngọc Mai','221000154@vnu.edu.vn',104,'0390000154','2004-04-15',N'Hưng Yên'),
(35,'math104_05','231000155',N'Hoàng',N'Quốc Huy','231000155@vnu.edu.vn',104,'0910000155','2004-05-16',N'Thái Bình'),
(36,'math104_06','231000156',N'Vũ',N'Thu Trang','231000156@vnu.edu.vn',104,'0390000156','2004-06-17',N'Hà Nam'),
(37,'math104_07','241000157',N'Đỗ',N'Anh Dũng','241000157@vnu.edu.vn',104,'0910000157','2004-07-18',N'Ninh Bình'),
(38,'math104_08','241000158',N'Bùi',N'Khánh Linh','241000158@vnu.edu.vn',104,'0390000158','2004-08-19',N'Thanh Hóa'),
(39,'math104_09','251000159',N'Ngô',N'Hoàng Nam','251000159@vnu.edu.vn',104,'0910000159','2004-09-20',N'Nghệ An'),
(40,'math104_10','251000160',N'Dương',N'Thảo Nguyên','251000160@vnu.edu.vn',104,'0390000160','2004-10-21',N'Hà Tĩnh'),


/* =========================
   DEPARTMENT OF KEUKA
========================= */
(51,'csc201_01','211000251',N'Nguyễn',N'Văn Sơn','211000251@vnu.edu.vn',201,'0910000251','2004-01-05',N'Hà Nội'),
(52,'csc201_02','211000252',N'Trần',N'Thị Hòa','211000252@vnu.edu.vn',201,'0390000252','2004-02-06',N'Hải Phòng'),
(53,'csc201_03','221000253',N'Lê',N'Quốc Trung','221000253@vnu.edu.vn',201,'0910000253','2004-03-07',N'Hải Dương'),
(54,'csc201_04','221000254',N'Phạm',N'Thu Hà','221000254@vnu.edu.vn',201,'0390000254','2004-04-08',N'Hưng Yên'),
(55,'csc201_05','231000255',N'Hoàng',N'Anh Tuấn','231000255@vnu.edu.vn',201,'0910000255','2004-05-09',N'Thái Bình'),
(56,'csc201_06','231000256',N'Vũ',N'Minh Châu','231000256@vnu.edu.vn',201,'0390000256','2004-06-10',N'Hà Nam'),
(57,'csc201_07','241000257',N'Đỗ',N'Văn Duy','241000257@vnu.edu.vn',201,'0910000257','2004-07-11',N'Ninh Bình'),
(58,'csc201_08','241000258',N'Bùi',N'Ngọc Lan','241000258@vnu.edu.vn',201,'0390000258','2004-08-12',N'Thanh Hóa'),
(59,'csc201_09','251000259',N'Ngô',N'Quang Hùng','251000259@vnu.edu.vn',201,'0910000259','2004-09-13',N'Nghệ An'),
(60,'csc201_10','251000260',N'Dương',N'Thị Huyền','251000260@vnu.edu.vn',201,'0390000260','2004-10-14',N'Hà Tĩnh');

SET IDENTITY_INSERT students OFF;


 
-- seeding for semester table

SET IDENTITY_INSERT semester ON;
INSERT INTO semester (semester_id, semester) VALUES
(1, 'Spring 2024'),
(2, 'Summer 2024'),
(3, 'Fall 2024'),
(4, 'Spring 2025'),
(5, 'Summer 2025'),
(6, 'Fall 2025'),
(7, 'Spring 2026'),
(8, 'Summer 2026'),
(9, 'Fall 2026');
SET IDENTITY_INSERT semester OFF;


-- seeding for instructors table 

SET IDENTITY_INSERT instructors ON;
INSERT INTO instructors (instructor_id, department_id, first_name, last_name, email, phone_number, hire_date) VALUES
-- Faculty of Science --
(1, 101, N'Anh', N'Nguyễn', 'anhnguyen@vnu.edu.vn', '0912345678', '2020-01-15'),
(2, 101, N'Bình', N'Trần', 'binhtran@vnu.edu.vn', '0398765432', '2021-02-20'),
(3, 101, N'Chi', N'Lê', 'chile@vnu.edu.vn', '0982345612', '2019-03-12'),
(4, 101, N'Dũng', N'Phạm', 'dungpham@vnu.edu.vn', '0376543219', '2018-04-18'),

(5, 102, N'Bảo', N'Hoàng', 'baohoang@vnu.edu.vn', '0911223344', '2019-08-23'),
(6, 102, N'Em', N'Vũ', 'emvu@vnu.edu.vn', '0389988776', '2020-09-14'),
(7, 102, N'Phúc', N'Đặng', 'phucdang@vnu.edu.vn', '0976655443', '2021-10-05'),
(8, 102, N'Giang', N'Bùi', 'giangbui@vnu.edu.vn', '0312349988', '2022-11-16'),

(9, 103, N'Cường', N'Đỗ', 'cuongdo@vnu.edu.vn', '0919988776', '2021-03-10'),
(10, 103, N'Hà', N'Ngô', 'hango@vnu.edu.vn', '0387766554', '2020-04-22'),
(11, 103, N'Long', N'Dương', 'longduong@vnu.edu.vn', '0977889900', '2019-05-13'),
(12, 103, N'Lan', N'Phan', 'lanphan@vnu.edu.vn', '0391122334', '2018-06-24'),

(13, 104, N'Đạt', N'Nguyễn', 'datnguyen@vnu.edu.vn', '0913344556', '2018-11-05'),
(14, 104, N'Khánh', N'Trịnh', 'khanhtrinh@vnu.edu.vn', '0385566778', '2019-12-16'),
(15, 104, N'Lâm', N'Huỳnh', 'lamhuynh@vnu.edu.vn', '0972233445', '2020-01-27'),
(16, 104, N'Mai', N'Tạ', 'maita@vnu.edu.vn', '0319988776', '2021-02-08'),

-- Faculty of Engineering --
(21, 201, N'Nga', N'Nguyễn', 'nganguyen@vnu.edu.vn', '0915566778', '2018-01-15'),
(22, 201, N'Quân', N'Lý', 'quanly@vnu.edu.vn', '0386677889', '2019-02-26'),
(23, 201, N'Phương', N'Tô', 'phuongto@vnu.edu.vn', '0973344556', '2020-03-17'),
(24, 201, N'Quang', N'Đinh', 'quangdinh@vnu.edu.vn', '0312233445', '2021-04-28'),

(25, 202, N'Sơn', N'Lê', 'sonle@vnu.edu.vn', '0917788990', '2022-05-09'),
(26, 202, N'Thảo', N'Nguyễn', 'thaonguyen@vnu.edu.vn', '0384455667', '2021-06-20'),
(27, 202, N'Thắng', N'Phạm', 'thangpham@vnu.edu.vn', '0978899001', '2020-07-31'),
(28, 202, N'Uyên', N'Võ', 'uyenv o@vnu.edu.vn', '0313344556', '2019-08-12'),

-- Faculty of Business --
(29, 401, N'Phương', N'Reed', 'phuongreed@vnu.edu.vn', '0916677889', '2018-05-21'),
(30, 401, N'Việt', N'Phạm', 'vietpham@vnu.edu.vn', '0387788990', '2019-06-02'),
(31, 401, N'Vân', N'Grant', 'vangrant@vnu.edu.vn', '0978899112', '2020-07-13'),
(32, 401, N'Xuân', N'Hà', 'xuanha@vnu.edu.vn', '0316677889', '2021-08-24'),

-- Faculty of Law --
(33, 501, N'Giang', N'Mai', 'giangmai@vnu.edu.vn', '0917788111', '2022-05-12'),
(34, 501, N'Lan', N'Ôn', 'lanon@vnu.edu.vn', '0388899222', '2021-06-23'),
(35, 501, N'Phát', N'Phan', 'phatphan@vnu.edu.vn', '0979900333', '2020-07-04'),
(36, 501, N'Giáo', N'Quyên', 'giaoquyen@vnu.edu.vn', '0317788990', '2019-08-15');
SET IDENTITY_INSERT instructors OFF;


-- seeding for course_offering
  
SET IDENTITY_INSERT course_offering ON;
INSERT INTO course_offering (offering_id, course_id, instructor_id, semester_id, start_date, end_date, location, capacity) VALUES
-- Fall 2024 Offerings --
(1, 1, 1, 1, '2024-09-02', '2024-12-13', 'Building A, Room 101', 50),
(2, 2, 2, 1, '2024-09-02', '2024-12-13', 'Building B, Room 205', 40),
(3, 4, 3, 1, '2024-09-02', '2024-12-13', 'Physics Lab 1', 60),
(4, 8, 4, 1, '2024-09-02', '2024-12-13', 'Arts Hall 301', 45),
(5, 10, 5, 1, '2024-09-02', '2024-12-13', 'Eng Hall 105', 40),

-- Spring 2025 Offerings --
(6, 3, 2, 2, '2025-01-20', '2025-05-09', 'Building B, Room 205', 30),
(7, 5, 3, 2, '2025-01-20', '2025-05-09', 'Physics Lab 2', 35),
(8, 6, 6, 2, '2025-01-20', '2025-05-09', 'Bio Lab 1', 55),
(9, 9, 4, 2, '2025-01-20', '2025-05-09', 'Arts Hall 302', 25),
(10, 11, 5, 2, '2025-01-20', '2025-05-09', 'Eng Hall 106', 30),

-- Summer 2025 Offerings --
(11, 1, 1, 3, '2025-06-02', '2025-08-08', 'Online', 70),
(12, 24, 7, 3, '2025-06-02', '2025-08-08', 'Math Building 200', 80);
SET IDENTITY_INSERT course_offering OFF;

-- seeding for course_prerequisites table 

INSERT INTO course_prerequisites
(course_id, prerequisite_course_id)
VALUES
(2, 1),   -- Data Structures and Algorithms requires Introduction to Programming
(3, 2),   -- Database Systems requires Data Structures and Algorithms
(5, 4),   -- Electromagnetism requires General Physics I
(7, 6),   -- Genetics requires General Biology I
(9, 8),   -- Creative Writing requires Introduction to Literature
(11, 10), -- Electronics I requires Circuit Analysis
(13, 12), -- Microprocessors requires Computer Organization
(15, 14), -- Construction Materials requires Structural Analysis
(17, 16), -- Thermodynamics requires Engineering Mechanics
(19, 18), -- Fluid Flow Operations requires Chemical Process Principles
(21, 20), -- Water and Wastewater Treatment requires Intro to Environmental Eng
(25, 24), -- Linear Algebra requires Calculus I
(1, 22),  -- CSC101 requires Pre-Programming Basics
(10, 21); -- EEE101 requires Basic Electrical Concepts
GO



SET IDENTITY_INSERT enrollment ON;
INSERT INTO enrollment (enrollment_id, student_id, offering_id, enrollment_date, grade) VALUES
(1, 1, 1, '2024-01-20', 'A'),   
(2, 2, 1, '2024-01-21', 'B+'),  
(3, 3, 3, '2024-01-22', 'A-'),  
(4, 4, 4, '2024-01-23', 'B'),   
(5, 5, 2, '2024-01-24', 'C+'),  
(6, 1, 6, '2025-01-10', NULL),  
(7, 2, 6, '2025-01-11', NULL),  
(8, 6, 1, '2024-01-25', 'B'),   
(9, 7, 5, '2024-01-26', 'A'),   
(10, 8, 1, '2024-01-27', 'A-'), 
(11, 8, 2, '2024-01-27', 'B+'), 
(12, 1, 11, '2025-05-30', NULL); 
SET IDENTITY_INSERT enrollment OFF;



SET IDENTITY_INSERT financial_aid ON;
INSERT INTO financial_aid ("financial_aid_ID", student_id, eligibility, "amount ", aid_type, application_date, award_date) VALUES
(1, 1, 1, 5000, 'Scholarship', '2024-04-10', '2024-05-01'),
(2, 2, 1, 2500, 'Grant', '2024-03-15', '2024-04-20'),
(3, 3, 0, 0, 'N/A', '2024-02-01', '2024-03-01'),
(4, 4, 1, 1500, 'Grant', '2024-01-20', '2024-02-15'),
(5, 6, 1, 3000, 'Scholarship', '2024-05-05', '2024-06-01'),
(6, 7, 1, 2000, 'Grant', '2024-03-10', '2024-04-05'),
(7, 8, 0, 0, 'N/A', '2024-02-15', '2024-03-10'),
(8, 9, 1, 3500, 'Scholarship', '2024-04-12', '2024-05-10'),
(9, 10, 1, 1000, 'Grant', '2024-01-25', '2024-02-20'),
(10, 11, 1, 4000, 'Scholarship', '2024-05-01', '2024-06-01'),
(11, 12, 0, 0, 'N/A', '2024-03-01', '2024-03-25'),
(12, 13, 1, 1200, 'Grant', '2024-02-10', '2024-03-05'),
(13, 14, 1, 2500, 'Scholarship', '2024-04-15', '2024-05-15'),
(14, 15, 1, 1800, 'Grant', '2024-03-20', '2024-04-15'),
(15, 16, 0, 0, 'N/A', '2024-01-30', '2024-02-20'),
(16, 17, 1, 2200, 'Grant', '2024-02-18', '2024-03-10'),
(17, 18, 1, 2700, 'Scholarship', '2024-04-20', '2024-05-20'),
(18, 19, 1, 1500, 'Grant', '2024-03-25', '2024-04-18'),
(19, 20, 0, 0, 'N/A', '2024-02-05', '2024-03-01'),
(20, 21, 1, 3200, 'Scholarship', '2024-05-10', '2024-06-05');
SET IDENTITY_INSERT financial_aid OFF;