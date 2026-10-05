
use baitap;


CREATE TABLE students (
  Student_ID INT PRIMARY KEY ,
  name VARCHAR(100),
  age INT,
  major VARCHAR(50)

);
 
INSERT INTO students (Student_ID, name, age, major)
VALUES
(1, 'Kien', 20, 'Software Engineering'),
(2, 'Nam', 21, 'Information Technology'),
(3, 'Lan', 19, 'Business Administration'),
(4, 'Minh', 22, 'Computer Science'),
(5, 'Hoa', 20, 'Graphic Design'),
(6, 'Tuan', 21, 'Software Engineering'),
(7, 'Linh', 19, 'Digital Marketing'),
(8, 'Huy', 23, 'Information Technology'),
(9, 'Trang', 20, 'Business Administration'),
(10, 'Phuc', 22, 'Computer Science');

SELECT * FROM students;

SELECT name FROM students as s WHERE s.age >= 20 && s.age <=22; 


DELETE FROM students WHERE Student_ID IN (9,10);

SELECT * FROM students;


UPDATE students
SET major="CNTT" WHERE Student_ID= 1;

SELECT * FROM students;

CREATE TABLE Employees (
 EmployyeeID INT PRIMARY KEY AUTO_INCREMENT,
 Name  VARCHAR(100),
 Age INT ,
 Department VARCHAR(50),
 Salary DECIMAL(10,2)

);

INSERT INTO Employees (Name,Age,Department,Salary)
VALUES
('Kien', 20, 'IT', 15000000),
('Nam', 25, 'HR', 12000000),
('Lan', 23, 'IT', 14000000),
('Minh', 28, 'Marketing', 13000000),
('Huy', 24, 'IT', 16000000);


SELECT * FROM Employees as e
WHERE e.Department = "IT";

UPDATE Employees
SET Salary =850000 WHERE  EmployyeeID=2;

SELECT * FROM Employees as e;

DELETE FROM  Employees WHERE EmployyeeID=4;

SELECT * FROM Employees as e;


CREATE TABLE Sales (
SaleID INT PRIMARY KEY AUTO_INCREMENT,
EmployyeeID INT,
SaleAmout DECIMAL(10,2),
SaleDate DATE,
FOREIGN KEY  (EmployyeeID) REFERENCES  Employees(EmployyeeID)
);

INSERT INTO Sales (EmployyeeID, SaleAmout, SaleDate)
VALUES
(25, 500000, '2026-10-01'),
(26, 750000, '2026-10-02'),
(2, 1200000, '2026-10-02'),
(3, 850000, '2026-10-03'),
(5, 2000000, '2026-10-04');


SELECT SUM(SaleAmout) FROM Sales;
SELECT e.Name,AVG (SaleAmout) FROM Employees as e 
INNER JOIN Sales as s  ON s.EmployyeeID = e.EmployyeeID
WHERE e.Department = "Sales"
GROUP BY e.EmployyeeID, e.Name;


SELECT e.* FROM Employees as e 
LEFT  JOIN Sales as s  ON s.EmployyeeID = e.EmployyeeID
WHERE s.SaleID IS NULL;


CREATE TABLE Projects (
    ProjectID INT PRIMARY KEY AUTO_INCREMENT,
    ProjectName VARCHAR(100),
    Department VARCHAR(50)
);


CREATE TABLE  Assignments(
AssignmentID INT PRIMARY KEY AUTO_INCREMENT,
EmployeeID INT ,
ProjectID INT ,

FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployyeeID),
FOREIGN KEY (ProjectID) REFERENCES Projects(ProjectID)
);

INSERT INTO Projects (ProjectName, Department)
VALUES
('Website Development', 'IT'),
('Sales Management', 'Sales'),
('Marketing Campaign', 'Marketing');


INSERT INTO Assignments (EmployeeID, ProjectID)
VALUES
(1, 1),
(2, 2),
(3, 1),
(5, 3),
(26, 2);

SELECT * FROM Projects;


SELECT e.name , p.ProjectName FROM Employees as e
INNER JOIN Assignments as a  ON a.EmployeeID = e.EmployyeeID
INNER JOIN Projects as p ON p.ProjectID = a.ProjectID
GROUP BY e.EmployyeeID,e.name , p.ProjectName;


SELECT e.*  FROM Employees as e
LEFT JOIN Assignments as a  ON a.EmployeeID = e.EmployyeeID
WHERE a.AssignmentID IS NULL;

SELECT  p.ProjectID, p.ProjectName , COUNT(a.EmployeeID) FROM Projects as p
INNER JOIN Assignments as a  ON a.ProjectID = p.ProjectID
GROUP BY p.ProjectID, p.ProjectName;


SELECT e.* FROM Employees e
WHERE e.Salary =(SELECT MAX(e.Salary) FROM Employees e);


SELECT e.* FROM Employees e
WHERE e.Department= "HR"
ORDER BY e.age DESC; 

SELECT e.*
FROM Employees AS e
WHERE e.Salary >= 5000.00
  AND e.Salary <= 10000.00;
  
  
  
  
SELECT * FROM Sales as s
ORDER BY s.SaleAmout DESC
LIMIT 3;
  
SELECT * FROM Sales as s
WHERE MONTH(s.SaleDate) = MONTH(CURRENT_DATE())

