-- Tạo cơ sở dữ liệu và sử dụng
CREATE DATABASE IF NOT EXISTS bai_tap_buoi_12_bo_xung CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE bai_tap_buoi_12_bo_xung;

-- Tạo bảng Departments
CREATE TABLE Departments (
    DeptID VARCHAR(4) PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    NoOfStudents INT
);

-- Tạo bảng Students
CREATE TABLE Students (
    StudentID VARCHAR(4) PRIMARY KEY,
    LastName VARCHAR(30),
    FirstName VARCHAR(10),
    Sex ENUM('F', 'M'),
    DateOfBirth DATE,
    PlaceOfBirth VARCHAR(30),
    DeptID VARCHAR(4),
    Scholarship FLOAT,
    AverageScore DECIMAL(4,2),
    FOREIGN KEY (DeptID) REFERENCES Departments(DeptID)
);

-- Tạo bảng Courses
CREATE TABLE Courses (
    CourseID VARCHAR(4) PRIMARY KEY,
    Name VARCHAR(35),
    Credits TINYINT
);

-- Tạo bảng Results
CREATE TABLE Results (
    StudentID VARCHAR(4),
    CourseID VARCHAR(4),
    Year INT,
    Semester INT,
    Mark FLOAT,
    Grade VARCHAR(6),
    PRIMARY KEY (StudentID, CourseID, Year, Semester),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

INSERT INTO Departments (DeptID, Name, NoOfStudents) VALUES
('IS', 'Information Systems', NULL),
('NC', 'Network and Communication', NULL),
('SE', 'Software Engineering', NULL),
('CE', 'Computer Engineering', NULL),
('CS', 'Computer Science', NULL);

INSERT INTO Students (StudentID, LastName, FirstName, Sex, DateOfBirth, PlaceOfBirth, DeptID, Scholarship, AverageScore) VALUES
('S001', 'Lê', 'Kim Lan', 'F', '1990-02-23', 'Hà nội', 'IS', 130000, NULL),
('S002', 'Trần', 'Minh Chánh', 'M', '1992-12-24', 'Bình Định', 'NC', 150000, NULL),
('S003', 'Lê', 'An Tuyết', 'F', '1991-01-21', 'Hải phòng', 'IS', 170000, NULL),
('S004', 'Trần', 'Anh Tuấn', 'M', '1993-12-20', 'TpHCM', 'NC', 80000, NULL),
('S005', 'Trần', 'Thị Mai', 'F', '1991-08-12', 'TpHCM', 'SE', 0, NULL),
('S006', 'Lê', 'Thị Thuý', 'F', '1991-01-02', 'An Giang', 'IS', 0, NULL),
('S007', 'Nguyễn', 'Kim Thư', 'F', '1990-02-02', 'Hà Nội', 'SE', 180000, NULL),
('S008', 'Lê', 'Văn Long', 'M', '1992-12-08', 'TpHCM', 'IS', 190000, NULL);

INSERT INTO Courses (CourseID, Name, Credits) VALUES
('DS01', 'Database Systems', 3),
('AI01', 'Artificial Intelligence', 3),
('CN01', 'Computer Network', 3),
('CG01', 'Computer Graphics', 4),
('DSA1', 'Data Structures and Algorithms', 4);

INSERT INTO Results (StudentID, CourseID, Year, Semester, Mark, Grade) VALUES
('S001', 'DS01', 2017, 1, 3, NULL),
('S001', 'DS01', 2017, 2, 6, NULL),
('S001', 'AI01', 2017, 1, 4.5, NULL),
('S001', 'AI01', 2017, 2, 6, NULL),
('S001', 'CN01', 2017, 3, 5, NULL),
('S002', 'DS01', 2016, 1, 4.5, NULL),
('S002', 'DS01', 2017, 1, 7, NULL),
('S002', 'CN01', 2017, 3, 10, NULL),
('S002', 'DSA1', 2016, 3, 9, NULL),
('S003', 'DS01', 2017, 1, 2, NULL),
('S003', 'DS01', 2017, 2, 5, NULL),
('S003', 'CN01', 2017, 2, 2.5, NULL),
('S003', 'CN01', 2017, 3, 4, NULL),
('S004', 'DS01', 2017, 3, 4.5, NULL),
('S004', 'DSA1', 2017, 1, 10, NULL),
('S005', 'DS01', 2017, 2, 7, NULL),
('S005', 'CN01', 2017, 2, 2.5, NULL),
('S005', 'CN01', 2018, 1, 5, NULL),
('S006', 'AI01', 2018, 1, 6, NULL),
('S006', 'CN01', 2018, 2, 10, NULL);

-- -----------------------------------------------------------------------
-- câu 2 cập nhật cột NoOfStudents
SET SQL_SAFE_UPDATES = 0;
UPDATE Departments d
LEFT JOIN (
    SELECT DeptID, COUNT(*) AS total_students
    FROM Students
    GROUP BY DeptID
) s ON d.DeptID = s.DeptID
SET d.NoOfStudents = IFNULL(s.total_students, 0);

-- câu 3 Cập nhật AverageScore (điểm trung bình) cho mỗi sinh viên, sao cho:
UPDATE Results
SET Grade = 
    CASE 
        WHEN Mark >= 5 AND Mark <= 10 THEN 'Passed'
        WHEN Mark >= 0 AND Mark < 5 THEN 'Failed'
        ELSE NULL
    END;

-- câu 4 Liệt kê sinh viên có học bổng ≤ 160000, sắp xếp giảm dần theo học bổng
SELECT StudentID, CONCAT(FirstName, ' ', LastName) AS Fullname, DateOfBirth, PlaceOfBirth, DeptID, Scholarship
FROM students
WHERE  Scholarship <= '160000'
ORDER BY Scholarship DESC;

-- Câu 6: Liệt kê tất cả các khoa, kể cả những khoa không có sinh viên
SELECT 
    d.DeptID,
    d.Name AS DepartmentName,
    s.StudentID,
    s.LastName,
    s.FirstName
FROM Departments d
LEFT JOIN Students s ON d.DeptID = s.DeptID;

-- Liệt kê (StudentID, LastName, FirstName, NumberOfCourses) của tất cả sinh viên.
-- Hiển thị kết quả theo thứ tự tăng dần của NumberOfCourses – tức là số lượng môn học mà sinh viên đó đã học.
SELECT 
    s.StudentID, 
    s.LastName, 
    s.FirstName, 
    IFNULL(nc.NumberOfCourses, 0) AS SoMonSinhVienHoc
FROM Students s
LEFT JOIN (
    SELECT StudentID, COUNT(DISTINCT CourseID) AS NumberOfCourses
    FROM Results
    GROUP BY StudentID
) AS nc ON s.StudentID = nc.StudentID
ORDER BY nc.NumberOfCourses DESC;

-- Hiển thị danh sách các sinh viên không thuộc khoa "Information Systems", nhưng có điểm môn học "Database Systems" cao hơn ít nhất một sinh viên thuộc khoa "Information Systems".

-- Câu 8 Liệt kê (DeptID, DepartmentName, NumberOfFemaleStudents, NumberOfMaleStudents) của tất cả các khoa.
SELECT d.DeptID, d.name AS DepartmentName, 
	COUNT(CASE WHEN s.sex = "F" THEN 1 END ) AS  NumberOfFemaleStudents,
    COUNT(CASE WHEN s.sex = "M" THEN 1 END ) AS  NumberOfMaleStudents
FROM departments d
JOIN Students s
ON d.DeptID = s.DeptID
GROUP BY d.DeptID, d.name;

-- câu 9
SELECT DISTINCT s.StudentID, s.LastName, s.FirstName
FROM Students s
JOIN Results r ON s.StudentID = r.StudentID
JOIN Courses c ON r.CourseID = c.CourseID
WHERE c.Name = 'Database Systems'
  AND s.DeptID != (
      SELECT DeptID
      FROM Departments
      WHERE Name = 'Information Systems'
  )
  AND r.Mark > ANY (
      SELECT r2.Mark
      FROM Results r2
      JOIN Students s2 ON r2.StudentID = s2.StudentID
      JOIN Courses c2 ON r2.CourseID = c2.CourseID
      WHERE s2.DeptID = (
          SELECT DeptID
          FROM Departments
          WHERE Name = 'Information Systems'
      )
      AND c2.Name = 'Database Systems'
  );


-- câu 10
SELECT 
    c.CourseID,
    c.Name AS CourseName,
    CONCAT(s.FirstName, ' ', s.LastName) AS BestStudentFullName
FROM Courses c
JOIN Results r ON c.CourseID = r.CourseID
JOIN Students s ON r.StudentID = s.StudentID
WHERE (r.CourseID, r.Mark) IN (
    SELECT CourseID, MAX(Mark)
    FROM Results
    GROUP BY CourseID
);
