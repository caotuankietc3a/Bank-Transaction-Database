CREATE KEYSPACE Company
   WITH replication = {'class': 'SimpleStrategy', 'replication_factor' : 1};

CREATE TABLE IF NOT EXISTS Employee (
    Fname VARCHAR,
    Minit VARCHAR,
    Lname VARCHAR,
    Ssn VARCHAR PRIMARY KEY,
    Bdate DATE,
    Address VARCHAR,
    Sex VARCHAR,
    Salary INT,
    Super_ssn VARCHAR,
);

CREATE TABLE IF NOT EXISTS Employee_by_Department (
    Ssn VARCHAR,
    Fname VARCHAR,
    Minit VARCHAR,
    Lname VARCHAR,
    Bdate DATE,
    Address VARCHAR,
    Sex VARCHAR,
    Salary INT,
    Super_ssn VARCHAR,
    Dno INT,
    Department_name VARCHAR,
    PRIMARY KEY ((Dno, Department_name), Ssn)
);


/*DATE: yy-mm-dd */
INSERT INTO Employee (fname, lname, minit, ssn, bdate, address, sex, salary, super_ssn) VALUES ('John', 'B', 'Smith', '123456789', '1965-01-09', '731 Fondren, Houston, TX', 'M', 30000, null);
INSERT INTO Employee (fname, lname, minit, ssn, bdate, address, sex, salary, super_ssn) VALUES ('Franklin', 'T', 'Wong', '333445555', '1955-12-08', '638 Voss, Houston, TX', 'M', 40000, null);
INSERT INTO Employee (fname, lname, minit, ssn, bdate, address, sex, salary, super_ssn) VALUES ('Alicia', 'J', 'Zelaya', '999887777', '1968-07-19', '3321 Castle, Spring, TX', 'F', 25000, null);
INSERT INTO Employee (fname, lname, minit, ssn, bdate, address, sex, salary, super_ssn) VALUES ('Jennifer', 'S', 'Wallace', '987654321', '1941-06-20', '291 Berry, Bellaire, TX', 'F', 43000, null);
INSERT INTO Employee (fname, lname, minit, ssn, bdate, address, sex, salary, super_ssn) VALUES ('Ramesh', 'K', 'Narayan', '666884444', '1962-09-15', '975 Fire Oak, Humble, TX', 'M', 38000, '333445555');
INSERT INTO Employee (fname, lname, minit, ssn, bdate, address, sex, salary, super_ssn) VALUES ('Joyce', 'A', 'English', '453453453', '1972-07-31', '5631 Rice, Houston, TX', 'F', 25000, '333445555');
INSERT INTO Employee (fname, lname, minit, ssn, bdate, address, sex, salary, super_ssn) VALUES ('Ahmad', 'V', 'Jabbar', '987987987', '1969-03-29', '980 Dallas, Houston, TX', 'M', 25000, '987654321');
INSERT INTO Employee (fname, lname, minit, ssn, bdate, address, sex, salary, super_ssn) VALUES ('James', 'E', 'Borg', '888665555', '1973-11-10', '450 Stone, Houston, TX', 'M', 55000, null);

UPDATE Employee SET Bdate = '1965-01-09' WHERE Ssn = '123456789';
UPDATE Employee SET Bdate = '1955-12-08' WHERE Ssn = '333445555';
UPDATE Employee SET Super_ssn = '333445555' WHERE Ssn = '123456789';
UPDATE Employee SET Super_ssn = '888665555' WHERE Ssn = '333445555';
UPDATE Employee SET Super_ssn = '987654321' WHERE Ssn = '999887777';
UPDATE Employee SET Super_ssn = '888665555' WHERE Ssn = '987654321';
UPDATE Employee SET Super_ssn = '333445555' WHERE Ssn = '666884444';
UPDATE Employee SET Super_ssn = '333445555' WHERE Ssn = '453453453';

INSERT INTO Employee_by_Department (fname, lname, minit, ssn, bdate, address, sex, salary, super_ssn, dno, department_name) VALUES ('John', 'B', 'Smith', '123456789', '1965-01-09', '731 Fondren, Houston, TX', 'M', 30000, '333445555', 5, 'Research');
INSERT INTO Employee_by_Department (fname, lname, minit, ssn, bdate, address, sex, salary, super_ssn, dno, department_name) VALUES ('Franklin', 'T', 'Wong', '333445555', '1955-12-08', '638 Voss, Houston, TX', 'M', 40000, '888665555', 5, 'Research');
INSERT INTO Employee_by_Department (fname, lname, minit, ssn, bdate, address, sex, salary, super_ssn, dno, department_name) VALUES ('Alicia', 'J', 'Zelaya', '999887777', '1968-07-19', '3321 Castle, Spring, TX', 'F', 25000, '987654321', 4, 'Administration');
INSERT INTO Employee_by_Department (fname, lname, minit, ssn, bdate, address, sex, salary, super_ssn, dno, department_name) VALUES ('Jennifer', 'S', 'Wallace', '987654321', '1941-06-20', '291 Berry, Bellaire, TX', 'F', 43000, '888665555', 4, 'Administration');
INSERT INTO Employee_by_Department (fname, lname, minit, ssn, bdate, address, sex, salary, super_ssn, dno, department_name) VALUES ('Ramesh', 'K', 'Narayan', '666884444', '1962-09-15', '975 Fire Oak, Humble, TX', 'M', 38000, '333445555', 5, 'Research');
INSERT INTO Employee_by_Department (fname, lname, minit, ssn, bdate, address, sex, salary, super_ssn, dno, department_name) VALUES ('Joyce', 'A', 'English', '453453453', '1972-07-31', '5631 Rice, Houston, TX', 'F', 25000, '333445555', 5, 'Research');
INSERT INTO Employee_by_Department (fname, lname, minit, ssn, bdate, address, sex, salary, super_ssn, dno, department_name) VALUES ('Ahmad', 'V', 'Jabbar', '987987987', '1969-03-29', '980 Dallas, Houston, TX', 'M', 25000, '987654321', 4, 'Administration');
INSERT INTO Employee_by_Department (fname, lname, minit, ssn, bdate, address, sex, salary, super_ssn, dno, department_name) VALUES ('James', 'E', 'Borg', '888665555', '1973-11-10', '450 Stone, Houston, TX', 'M', 55000, null, 1, 'Headquarters');

SELECT Fname , Lname FROM employee WHERE Ssn = '123456789';

CREATE MATERIALIZED VIEW IF NOT EXISTS employee_by_dno AS
SELECT Ssn, Fname, Lname, Sex, Salary, Dno, Department_name
FROM Employee_by_Department
WHERE Dno IS NOT NULL AND salary IS NOT NULL AND Department_name IS NOT NULL AND Ssn IS NOT NULL
PRIMARY KEY ((Dno, Department_name), salary, Ssn);

select * from employee_by_dno where dno = 5 and department_name = 'Research' and salary >= 30000 and salary < 40000;

DROP MATERIALIZED VIEW employee_by_dno;

ALTER TABLE Employee WITH 
compression = {'sstable_compression': 'LZ4Compressor'};

CREATE INDEX employee_salary_index ON Employee (Salary);
SELECT Fname, Lname, Salary FROM employee WHERE Salary = 25000;

DROP INDEX IF EXISTS employee_salary_index;
