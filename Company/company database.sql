-- use my_db;
-- drop database company;

-- create database company;
-- go
-- use company;
-- go
-- select * from employee;
-- select * from department;
-- select * from employee join department on Dnumber = Dno;
-- CREATE TABLE Employee (
--     Fname VARCHAR(40) DEFAULT 'No Name',
--     Minit VARCHAR(1),
--     Lname VARCHAR(40) DEFAULT 'No Name',
--     Ssn VARCHAR(40) PRIMARY KEY,
--     Bdate DATE,
--     Address VARCHAR(40),
--     Sex VARCHAR(1),
--     Salary INT,
--     Super_ssn VARCHAR(40),
--     Dno INT
-- );
-- go

-- CREATE TABLE Department (
--     Dname VARCHAR(40),
--     Dnumber INT PRIMARY KEY,
--     Mgr_ssn VARCHAR(40),
--     Mgr_start_data DATE,
--     FOREIGN KEY(Mgr_ssn) REFERENCES employee(Ssn) ON DELETE SET NULL ON UPDATE CASCADE
-- );
-- go

-- ALTER TABLE employee 
-- ADD FOREIGN KEY(Dno) 
-- REFERENCES department(Dnumber) ON DELETE NO ACTION ON UPDATE NO ACTION;
-- go

-- ALTER TABLE employee
-- ADD FOREIGN KEY(Super_ssn) REFERENCES employee(Ssn)
-- ON DELETE NO ACTION ON UPDATE NO ACTION;
-- go

-- CREATE TABLE Dept_locations (
--     Dnumber INT,
--     Dlocation VARCHAR(40),
--     PRIMARY KEY(Dnumber, Dlocation),
--     FOREIGN KEY(Dnumber) REFERENCES department(Dnumber) ON DELETE NO ACTION ON UPDATE NO ACTION
-- );
-- go

-- CREATE TABLE Project (
--     Pname VARCHAR(40) DEFAULT 'No Name',
--     Pnumber INT PRIMARY KEY,
--     Plocation VARCHAR(40) DEFAULT 'No Location',
--     Dnum INT,
--     FOREIGN KEY(Dnum) REFERENCES department(Dnumber) ON DELETE NO ACTION ON UPDATE NO ACTION
-- );
-- go

-- CREATE TABLE Works_on (
--     Essn VARCHAR(40),
--     Pno INT,
--     Hours FLOAT,
--     FOREIGN KEY(Essn) REFERENCES employee(Ssn) ON DELETE NO ACTION ON UPDATE NO ACTION,
--     FOREIGN KEY(Pno) REFERENCES project(Pnumber) ON DELETE NO ACTION ON UPDATE NO ACTION,
--     PRIMARY KEY(Essn, Pno)
-- );
-- go

-- CREATE TABLE Dependent (
--     Essn VARCHAR(40),
--     Dependent_name VARCHAR(40),
--     Sex VARCHAR(1),
--     Bdate DATE,
--     Relationship VARCHAR(40),
--     FOREIGN KEY(Essn) REFERENCES employee(Ssn) ON DELETE CASCADE,
--     PRIMARY KEY(Essn, Dependent_name)
-- );
-- go



-- -- DATE: mm-dd-yy
-- INSERT INTO Employee VALUES ('John', 'B', 'Smith', '123456789', '01-09-1965', '731 Fondren, Houston, TX', 'M', 30000, null, null);
-- go

-- INSERT INTO Employee VALUES ('Franklin', 'T', 'Wong', '333445555', '12-08-1955', '638 Voss, Houston, TX', 'M', 40000, null, null);
-- go
-- INSERT INTO Employee VALUES ('Alicia', 'J', 'Zelaya', '999887777', '07-19-1968', '3321 Castle, Spring, TX', 'F', 25000, null, null);
-- go
-- INSERT INTO Employee VALUES ('Jennifer', 'S', 'Wallace', '987654321', '06-20-1941', '291 Berry, Bellaire, TX', 'F', 43000, null, null);
-- go
-- INSERT INTO Employee VALUES ('Ramesh', 'K', 'Narayan', '666884444', '09-15-1962', '975 Fire Oak, Humble, TX', 'M', 38000, '333445555', null);
-- go
-- INSERT INTO Employee VALUES ('Joyce', 'A', 'English', '453453453', '07-31-1972', '5631 Rice, Houston, TX', 'F', 25000, '333445555', null);
-- go
-- INSERT INTO Employee VALUES ('Ahmad', 'V', 'Jabbar', '987987987', '03-29-1969', '980 Dallas, Houston, TX', 'M', 25000, '987654321', null);
-- go
-- INSERT INTO Employee VALUES ('James', 'E', 'Borg', '888665555', '11-10-1973', '450 Stone, Houston, TX', 'M', 55000, null, null);
-- go
-- UPDATE Employee SET Bdate = '01-09-1965' WHERE Ssn = '123456789';
-- go
-- UPDATE Employee SET Bdate = '12-08-1955' WHERE Ssn = '333445555';
-- go

-- INSERT INTO Department VALUES ('Research', 5, '333445555', '05-22-1988');
-- go
-- INSERT INTO Department VALUES ('Administration', 4, '987654321', '01-01-1995');
-- go
-- INSERT INTO Department VALUES ('Headquarters', 1, '888665555', '06-19-1981');
-- go

-- UPDATE employee SET Super_ssn = '333445555' WHERE Ssn = '123456789';
-- go
-- UPDATE employee SET Dno = 5 WHERE Ssn = '123456789';	
-- go
-- UPDATE employee SET Super_ssn = '888665555' WHERE Ssn = '333445555';
-- go
-- UPDATE employee SET Dno = 5 WHERE Ssn = '333445555';
-- go
-- UPDATE employee SET Super_ssn = '987654321' WHERE Ssn = '999887777';
-- go
-- UPDATE employee SET Dno = 4 WHERE Ssn = '999887777';
-- go
-- UPDATE employee SET Super_ssn = '888665555' WHERE Ssn = '987654321';
-- go
-- UPDATE employee SET Dno = 4 WHERE Ssn = '987654321';
-- go
-- UPDATE employee SET Super_ssn = '333445555' WHERE Ssn = '666884444';
-- go
-- UPDATE employee SET Dno = 5 WHERE Ssn = '666884444';	
-- go
-- UPDATE employee SET Super_ssn = '333445555' WHERE Ssn = '453453453';
-- go
-- UPDATE employee SET Dno = 5 WHERE Ssn = '453453453';
-- go
-- UPDATE employee SET Dno = 1 WHERE Ssn = '888665555';
-- go
-- UPDATE employee SET Dno = 4 WHERE Ssn = '987987987';

-- INSERT INTO Dept_locations VALUES (1, 'Houston');
-- go
-- INSERT INTO Dept_locations VALUES (4, 'Stafford');
-- go
-- INSERT INTO Dept_locations VALUES (5, 'Bellaire');
-- go
-- INSERT INTO Dept_locations VALUES (5, 'Sugarland');
-- go
-- INSERT INTO Dept_locations VALUES (5, 'Houston');
-- go

-- INSERT INTO Project VALUES ('ProductX', 1, 'Bellaire', 5);
-- go
-- INSERT INTO Project VALUES ('ProductY', 2, 'Sugarland', 5);
-- go
-- INSERT INTO Project VALUES ('ProductZ', 3, 'Houston', 5);
-- go
-- INSERT INTO Project VALUES ('Computerization', 10, 'Stafford', 4);
-- go
-- INSERT INTO Project VALUES ('Reorganization', 20, 'Houston', 1);
-- go
-- INSERT INTO Project VALUES ('Newbenefits', 30, 'Stafford', 4);
-- go

-- INSERT INTO Works_on VALUES ('123456789', 1, 32.5);
-- go
-- INSERT INTO Works_on VALUES ('123456789', 2, 7.5);
-- go
-- INSERT INTO Works_on VALUES ('666884444', 3, 40.0);
-- go
-- INSERT INTO Works_on VALUES ('453453453', 1, 20.0);
-- go
-- INSERT INTO Works_on VALUES ('453453453', 2, 20.0);
-- go
-- INSERT INTO Works_on VALUES ('333445555', 2, 10.0);
-- go
-- INSERT INTO Works_on VALUES ('333445555', 3, 10.0);
-- go
-- INSERT INTO Works_on VALUES ('333445555', 10, 10.0);
-- go
-- INSERT INTO Works_on VALUES ('333445555', 20, 10.0);
-- go
-- INSERT INTO Works_on VALUES ('999887777', 30, 30.0);
-- go
-- INSERT INTO Works_on VALUES ('999887777', 10, 10.0);
-- go
-- INSERT INTO Works_on VALUES ('987987987', 10, 35.0);
-- go
-- INSERT INTO Works_on VALUES ('987987987', 30, 5.0);
-- go
-- INSERT INTO Works_on VALUES ('987654321', 30, 20.0);
-- go
-- INSERT INTO Works_on VALUES ('987654321', 20, 15.0);
-- go
-- INSERT INTO Works_on VALUES ('888665555', 20, null);
-- go

-- INSERT INTO Dependent VALUES ('333445555', 'Alice', 'F', '05-04-1986', 'Daughter');
-- go
-- INSERT INTO Dependent VALUES ('333445555', 'Theodore', 'M', '10-25-1983', 'Son');
-- go
-- INSERT INTO Dependent VALUES ('333445555', 'Joy', 'F', '05-03-1958', 'Spouse');
-- go
-- INSERT INTO Dependent VALUES ('987654321', 'Abner', 'M', '02-28-1942', 'Spouse');
-- go
-- INSERT INTO Dependent VALUES ('123456789', 'Michael', 'M', '01-04-1988', 'Son');
-- go
-- INSERT INTO Dependent VALUES ('123456789', 'Alice', 'M', '01-04-1988', 'Son');
-- go
-- INSERT INTO Dependent VALUES ('123456789', 'Elizabeth', 'M', '05-05-1967', 'Spouse');
-- go
-- UPDATE Dependent SET Bdate = '04-05-1986' WHERE Essn = '333445555' and Dependent_name = 'Alice';
-- go

-- Retrieve the names of all employees whose sex is male in the Department “Research”
-- that makes at least one project more than 10 hours a week.
-- SELECT DISTINCT e.Fname, e.Minit, e.Lname 
-- FROM Employee e, Department d, Project p, Works_on w 
-- WHERE e.Sex = 'M' AND d.dname = 'Research' AND d.Dnumber = e.dno AND p.Dnum = d.Dnumber AND e.Ssn = w.Essn AND w.Hours >= 10;

-- Find the names of all employees who are directly supervised by the manager of the “Research” department.
-- SELECT e.Fname, e.Minit, e.Lname
-- FROM Employee e, Department d
-- WHERE d.Mgr_ssn = e.Super_ssn AND d.Dname = 'Research';

-- For each project, list the project name, and the total number of hours a week that all employees have to work for that project.
-- SELECT p.Pname, SUM(w.Hours)
-- FROM Project p, Works_on w
-- WHERE p.Pnumber = w.Pno
-- GROUP BY p.Pname;

-- -- For each department, list the department name and the names of all employees working for the department there.
-- SELECT d.Dname, e.Fname, e.Minit, e.Lname
-- FROM Department d, Employee e
-- WHERE d.Dnumber = e.Dno;

-- -- List the names of all employees who are not working on any projects at “Houston”.
-- SELECT DISTINCT e.Fname, e.Minit, e.Lname
-- FROM Employee e, Project p
-- WHERE e.Ssn NOT IN (SELECT w.Essn FROM Works_on w, Project p WHERE w.Pno = p.Pnumber AND p.Plocation = 'Houston');

-- -- List the names of all employees working on all projects in “Houston”
-- SELECT e.Fname + ' ' + e.Minit + ' ' +  e.Lname AS Full_Name
-- FROM Employee e
-- WHERE NOT EXISTS (
--     (SELECT p.Pnumber FROM Project p WHERE p.Plocation = 'Houston')
--     EXCEPT
--     (SELECT w.Pno FROM Works_on w WHERE e.Ssn = w.Essn)
-- );

-- -- Find the employee with the most total projects involved in the company.
-- SELECT e.Fname + ' ' + e.Minit + ' ' +  e.Lname AS Full_Name
-- FROM (SELECT TOP 1 e1.Ssn ssn,  COUNT(w.Pno) total 
--     FROM Employee e1, Works_on w  
--     GROUP BY e1.Ssn 
--     ORDER BY total DESC) AS T, Employee e 
-- WHERE T.ssn = e.Ssn;

-- -- List the names of the highest-paid employees in each department.
-- SELECT e.Fname + ' ' + e.Minit + ' ' +  e.Lname AS Full_Name
-- FROM(SELECT d.Dnumber dno, MAX(e1.Salary) max_salary
--     FROM Department d, Employee e1
--     WHERE d.Dnumber = e1.Dno
--     GROUP BY d.Dnumber) AS T, Employee e
-- WHERE T.max_salary = e.Salary; 

-- -- For each department, find the employees with the most total projects involved in that department.
-- select Essn, Dnum, count(Pno) as total_number_project
-- from Project join Works_on on Pno = Pnumber
-- group by Essn, Dnum;

-- select * from Dependent;
-- UPDATE Employee SET Address = '123 Lý Thường Kiệt F.14 Q.10' WHERE Ssn = '123456789'; 

-- -- Employee “Franklin” relationship with dependent “Joy” changed to “Friend”
-- UPDATE Dependent SET Relationship = 'Friend' WHERE Essn = (select e.Ssn from Employee e where e.Fname = 'Franklin') AND Dependent_name = 'Joy';

-- -- All departmental employees with at least one position at “Houston” receive a double pay rise.
-- UPDATE Employee SET Salary = Salary * 2 WHERE Ssn IN (Select SSn From Employee e Join Dept_locations dl On dl.Dnumber = e.Dno where dl.Dlocation = 'Houston');

-- -- Deduct 5% of salary for employees whose total projects are less than 2.
-- UPDATE Employee SET Salary = Salary * 0.95 WHERE Ssn IN (
--     select T.Essn
--     from (select w.Essn, Count(w.Pno) Pno_total from Works_on w group by Essn having Count(Pno) < 2) T
-- );

-- -- Delete employees' relatives named "Alice".
-- Delete from Dependent where Dependent_name = 'Alice';
-- -- Delete project "ProductZ"
-- Delete from Project where Pname = 'ProductZ';
-- Alter table Project ADD FOREIGN KEY(Dnum) REFERENCES department(Dnumber) ON DELETE SET NULL; 

-- -- Create a view (employee ID, full name, project code, project name, number of working hours) 
-- -- containing employee information, projects and working hours for projects located in Houston.
-- create view Emp_Pro_Whours as
-- select e.Ssn, e.Fname + ' ' + e.Minit + ' ' + e.Lname as Full_name, p.Pnumber, p.Pname, w.Hours
-- from Employee e, Project p, Works_on w
-- where p.Plocation = 'Houston' and e.Ssn = w.Essn and w.Pno = p.Pnumber;

-- select * from Emp_Pro_WHours;
-- drop view Emp_Pro_WHours;

-- -- Create a view (employee code, employee full name, number of dependents) 
-- -- containing information about employees with more than 2 dependents
-- create view Emps_More_2Deps as 
-- select e1.Ssn, e1.Fname + ' ' + e1.Minit + ' ' + e1.Lname as Full_name, T.Total_deps
-- from 
-- (select e.Ssn as ssn, count(*) as Total_deps
-- from Employee e join Dependent dep on e.Ssn = dep.Essn
-- group by e.Ssn having count(*) > 2) as T, Employee e1
-- where T.ssn = e1.Ssn;

-- select * from Emps_More_2Deps;
-- -- Create a view containing information (employee's first and last name, date of birth, gender) of employees with birth date in July. 
-- -- This view is read-only
-- create view DOB7_Emps as
-- select e.Fname, e.Lname, e.Bdate, e.Sex
-- from Employee e
-- where e.Bdate like '____-07-__';

-- drop view DOB7_Emps;
-- select * from DOB7_Emps;

-- Employees must be over 18 years old when entering the company. write a trigger to check this constraint

-- create or alter trigger check_years_old
-- on dbo.Employee
-- for insert 
-- as
-- begin
--     declare @Bdate date
--     declare @age int
--     declare @years int 
--     select * from inserted;
--     select @Bdate = i.Bdate from inserted i;
--     set @age = cast(YEAR(@Bdate) as int);
--     set @years = cast(year(getdate()) as int);
--     if(@years - @age < 18) 
--         begin
--             raiserror('Employees must be over 18 years old!!!!', 16, 1);
--             rollback;
--         end;
-- end;

-- The project location (PLocation) must be in the location of the department (DLocation) managing that project.
-- Write a trigger to check this constraint when inserting or updating Project information.

-- drop trigger Plocation_map_Dlocation;
-- create or alter trigger Plocation_map_Dlocation
-- on dbo.Project
-- for insert, update 
-- as
-- begin
--     declare @check varchar(40)
--     select * from inserted;
--     select @check = i.Plocation from inserted i;
--     if(@check not in (select dep.Dlocation from Dept_locations dep)) 
--         begin
--             raiserror('Plocation must be match with Dlocation of the department', 16, 1);
--             rollback;
--         end;
-- end;

-- Write trigger to automatically increase an employee's salary by 25% 
-- when the employee crosses the 30 hour/week mark for all projects.

-- Must be modified
-- create trigger Increase_auto_salary
-- on dbo.Works_on
-- for insert, delete, update
-- as
-- begin
--     declare @ssn varchar(40);
--     select @ssn = i.Essn from inserted i;
--     declare @total_hours int;
--     set @total_hours = 30;
--     if(@total_hours < all (select w.Hours from Works_on w))
--         begin
--             update Employee set Salary = Salary * 1.25 where Ssn = @ssn;
--             print('Updated the salary of Employee ' + cast(@ssn as varchar(14)));
--         end;
-- end;
-- drop trigger Increase_auto_salary;

-- create trigger Increase_auto_SalaryEmp
-- on dbo.Works_on
-- for update, insert
-- as 
-- begin 
--     declare @Count int;
--     declare @ssn varchar(40);
--     set @Count = 0;
--     select @ssn = i.Essn from inserted i;
--     select @Count = count(w.[Hours]) from Works_on w where @ssn = w.Essn and w.[Hours] < 30;
--     if(@Count = 0)
--         begin
--             update Employee set Salary = Salary * 1.25 where Ssn = @ssn;
--             print('Updated the salary of Employee ' + cast(@ssn as varchar(14)));
--         end;
-- end;
-- drop trigger Increase_auto_SalaryEmp;

-- INSERT INTO Employee VALUES ('Franklin', 'T', 'Wong', '986745555', '08-12-1955', '638 Voss, Houston, TX', 'M', 40000, null, null);
-- update Works_on set Hours = 40 where Essn = '999887777' and (Pno = 10 or Pno = 30);
-- INSERT INTO Works_on VALUES ('333445555', 3, 35);
-- update Works_on set Hours = 40 where Essn = '987654321' and (Pno = 20 or Pno = 30);

-- Procedure to update salary of Employee.

-- create or alter procedure Update_salary
--     @Ssn varchar(40), @factor numeric(3,2)
-- as 
-- begin
--     declare @Count int;
--     select @Count = Count(*) from Employee e where @Ssn = e.Ssn;
--     if(@Count = 1) 
--         begin
--             update Employee set Salary = Salary * @factor;
--             print('Updated the salary of Employee ' + convert(varchar(40), @Ssn));
--         end
-- end;
-- drop procedure Update_salary;

-- run procedure
-- exec Update_salary '123456789', 1.5;

-- create function to get salary from Employee
-- create or alter function Get_salary_Emp(@Ssn varchar(40))
-- returns decimal(10,2)
-- as 
-- begin
--     declare @sal decimal(10,2)
--     set @sal = (select e.Salary from Employee e where @Ssn = e.Ssn);
--     return @sal;
-- end;

-- drop function Get_salary_Emp;
-- call function
-- select dbo.Get_salary_Emp('123456789') as Salary;
-- select * from Dependent;

-- create a table-value function

-- create or alter function Emp_and_Dependent(@essn varchar(40))
-- returns @emp_dep_rel table
--     (
--         essn varchar(40),
--         full_name varchar(100),
--         Dep_name varchar(40),
--         relation_emp_dep varchar(40)
--     )
-- as 
-- begin
--     insert into @emp_dep_rel(essn, full_name, Dep_name, relation_emp_dep)(
--         select e.Ssn, concat(e.Fname,' ', e.Minit, ' ', e.Lname), dep.Dependent_name, dep.Relationship
--         from Dependent dep, Employee e 
--         where e.Ssn = @essn and @essn = dep.Essn
--     )
--     return;
-- end;

-- call function
-- SELECT * FROM  dbo.Emp_and_Dependent('123456789');

-- Example of cursor
-- create or alter proc PrintEmp_Cursor
-- as 
-- begin
--     declare @v_empId int, @v_emp_name varchar(100);
--     declare @v_counter int;
--     set @v_counter = 1;

--     -- create cursor
--     declare Emp_cursor cursor
--     for select Ssn, concat(Fname, ' ', Minit, ' ', Lname) from Employee;

--     -- open cursor
--     open Emp_cursor;
    
--     -- fetch the record.
--     fetch next from Emp_cursor into @v_empId, @v_emp_name;

--     while (@@fetch_status) = 0
--     begin
--         if @v_counter = 1
--             begin
--                 print('EmployeeSsn' + char(9) + char(9) + 'Name');
--                 print('--------------------------------')
--             end;
--         -- print the current record.
--         set @v_counter = @v_counter + 1;
--         print(concat('Employee', cast(@v_empId as varchar(9)), char(9), char(9), @v_emp_name));
--         fetch next from Emp_cursor into @v_empId, @v_emp_name;
--     end;
    
--     -- close the cursor
--     close Emp_cursor;
--     deallocate Emp_cursor;
-- end;
-- drop proc PrintEmp_Cursor;

-- test cursor
-- exec PrintEmp_Cursor;

-- create or alter proc Insert_Emp
--     @emp_Fname varchar(40), @emp_Minit varchar(40), @emp_Lname varchar(40), @emp_Ssn varchar(40), @emp_DOB date, @emp_Address varchar(40), @emp_Sex char(1), @emp_Salary decimal, @emp_SuperSsn int, @emp_Dno int
-- as 
-- begin
--     if(@emp_Ssn not in (select e.Ssn from Employee e) 
--         and (@emp_SuperSsn in (select Ssn from Employee) or @emp_SuperSsn = null) 
--         and (@emp_Dno in (select Dnumber from Department) or @emp_Dno = null))

--         begin
--             insert into Employee values(@emp_Fname, @emp_Minit, @emp_Lname, @emp_SSn, @emp_DOB, @emp_Address, @emp_Sex, @emp_Salary, @emp_SuperSsn, @emp_Dno);
--             print('Inserted employeeSsn ' + @emp_Ssn + ' successfully!!!!!');
--         end;
--     else 
--         begin
--             raiserror('Invalid inserted values!!!!', 16, 1);
--         end;
-- end;
-- drop proc Insert_Emp;

-- test
-- exec Insert_Emp 'John', 'B', 'Smith', '423456789', '01-09-1965', '731 Fondren, Houston, TX', 'M', 30000, null, null;

-- create or alter function Total_Projects(@Emp_Ssn varchar(40))
-- returns int
-- as 
-- begin
--     declare @count int;
--     set @count = (select count(w.Pno) from Works_on w where @Emp_Ssn = w.Essn);
--     return @count;
-- end;
-- select * from Department;

-- select dbo.Total_Projects('123456789') as Total_Projects;

-- create or alter proc Print_Emps
-- as  
-- begin
--     select e.Ssn, concat(e.Fname, ' ', e.Minit, ' ', e.Lname) as FullName, d.Dname, e.Salary * 12 as Year_Salary   
--     from Employee e, Department d;
-- end;

-- exec Print_Emps;
