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
    Dno INT
);

CREATE TABLE IF NOT EXISTS Department (
    Dname VARCHAR,
    Dnumber INT PRIMARY KEY,
    Mgr_ssn VARCHAR,
    Mgr_start_data DATE,
);

CREATE TABLE IF NOT EXISTS Dept_locations (
    Dnumber INT,
    Dlocation VARCHAR,
    PRIMARY KEY((Dnumber, Dlocation)),
);

CREATE TABLE IF NOT EXISTS Project (
    Pname VARCHAR,
    Pnumber INT PRIMARY KEY,
    Plocation VARCHAR,
    Dnum INT,
);

CREATE TABLE IF NOT EXISTS Works_on (
    Essn VARCHAR,
    Pno INT,
    Hours FLOAT,
    PRIMARY KEY((Essn, Pno))
);

CREATE TABLE IF NOT EXISTS Dependent (
    Essn VARCHAR,
    Dependent_name VARCHAR,
    Sex VARCHAR,
    Bdate DATE,
    Relationship VARCHAR,
    PRIMARY KEY((Essn, Dependent_name))
);


/*DATE: yy-mm-dd */
INSERT INTO Employee (fname, lname, minit, ssn, bdate, address, sex, salary, super_ssn, dno) VALUES ('John', 'B', 'Smith', '123456789', '1965-01-09', '731 Fondren, Houston, TX', 'M', 30000, null, null);
INSERT INTO Employee (fname, lname, minit, ssn, bdate, address, sex, salary, super_ssn, dno) VALUES ('Franklin', 'T', 'Wong', '333445555', '1955-12-08', '638 Voss, Houston, TX', 'M', 40000, null, null);
INSERT INTO Employee (fname, lname, minit, ssn, bdate, address, sex, salary, super_ssn, dno) VALUES ('Alicia', 'J', 'Zelaya', '999887777', '1968-07-19', '3321 Castle, Spring, TX', 'F', 25000, null, null);
INSERT INTO Employee (fname, lname, minit, ssn, bdate, address, sex, salary, super_ssn, dno) VALUES ('Jennifer', 'S', 'Wallace', '987654321', '1941-06-20', '291 Berry, Bellaire, TX', 'F', 43000, null, null);
INSERT INTO Employee (fname, lname, minit, ssn, bdate, address, sex, salary, super_ssn, dno) VALUES ('Ramesh', 'K', 'Narayan', '666884444', '1962-09-15', '975 Fire Oak, Humble, TX', 'M', 38000, '333445555', null);
INSERT INTO Employee (fname, lname, minit, ssn, bdate, address, sex, salary, super_ssn, dno) VALUES ('Joyce', 'A', 'English', '453453453', '1972-07-31', '5631 Rice, Houston, TX', 'F', 25000, '333445555', null);
INSERT INTO Employee (fname, lname, minit, ssn, bdate, address, sex, salary, super_ssn, dno) VALUES ('Ahmad', 'V', 'Jabbar', '987987987', '1969-03-29', '980 Dallas, Houston, TX', 'M', 25000, '987654321', null);
INSERT INTO Employee (fname, lname, minit, ssn, bdate, address, sex, salary, super_ssn, dno) VALUES ('James', 'E', 'Borg', '888665555', '1973-11-10', '450 Stone, Houston, TX', 'M', 55000, null, null);

INSERT INTO Department (dname, dnumber, mgr_ssn, mgr_start_data) VALUES ('Research', 5, '333445555', '1988-05-22');
INSERT INTO Department (dname, dnumber, mgr_ssn, mgr_start_data) VALUES ('Administration', 4, '987654321', '1995-01-01');
INSERT INTO Department (dname, dnumber, mgr_ssn, mgr_start_data) VALUES ('Headquarters', 1, '888665555', '1981-06-19');

INSERT INTO Dept_locations (dnumber, dlocation) VALUES (1, 'Houston');
INSERT INTO Dept_locations (dnumber, dlocation) VALUES (4, 'Stafford');
INSERT INTO Dept_locations (dnumber, dlocation) VALUES (5, 'Bellaire');
INSERT INTO Dept_locations (dnumber, dlocation) VALUES (5, 'Sugarland');
INSERT INTO Dept_locations (dnumber, dlocation) VALUES (5, 'Houston');

INSERT INTO Project (pname, pnumber, plocation, dnum) VALUES ('ProductX', 1, 'Bellaire', 5);
INSERT INTO Project (pname, pnumber, plocation, dnum) VALUES ('ProductY', 2, 'Sugarland', 5);
INSERT INTO Project (pname, pnumber, plocation, dnum) VALUES ('ProductZ', 3, 'Houston', 5);
INSERT INTO Project (pname, pnumber, plocation, dnum) VALUES ('Computerization', 10, 'Stafford', 4);
INSERT INTO Project (pname, pnumber, plocation, dnum) VALUES ('Reorganization', 20, 'Houston', 1);
INSERT INTO Project (pname, pnumber, plocation, dnum) VALUES ('Newbenefits', 30, 'Stafford', 4);

INSERT INTO Works_on (essn, pno, hours) VALUES ('123456789', 1, 32.5);
INSERT INTO Works_on (essn, pno, hours) VALUES ('123456789', 2, 7.5);
INSERT INTO Works_on (essn, pno, hours) VALUES ('666884444', 3, 40.0);
INSERT INTO Works_on (essn, pno, hours) VALUES ('453453453', 1, 20.0);
INSERT INTO Works_on (essn, pno, hours) VALUES ('453453453', 2, 20.0);
INSERT INTO Works_on (essn, pno, hours) VALUES ('333445555', 2, 10.0);
INSERT INTO Works_on (essn, pno, hours) VALUES ('333445555', 3, 10.0);
INSERT INTO Works_on (essn, pno, hours) VALUES ('333445555', 10, 10.0);
INSERT INTO Works_on (essn, pno, hours) VALUES ('333445555', 20, 10.0);
INSERT INTO Works_on (essn, pno, hours) VALUES ('999887777', 30, 30.0);
INSERT INTO Works_on (essn, pno, hours) VALUES ('999887777', 10, 10.0);
INSERT INTO Works_on (essn, pno, hours) VALUES ('987987987', 10, 35.0);
INSERT INTO Works_on (essn, pno, hours) VALUES ('987987987', 30, 5.0);
INSERT INTO Works_on (essn, pno, hours) VALUES ('987654321', 30, 20.0);
INSERT INTO Works_on (essn, pno, hours) VALUES ('987654321', 20, 15.0);
INSERT INTO Works_on (essn, pno, hours) VALUES ('888665555', 20, null);

INSERT INTO Dependent (essn, dependent_name, sex, bdate, relationship) VALUES ('333445555', 'Alice', 'F', '1986-05-04', 'Daughter');
INSERT INTO Dependent (essn, dependent_name, sex, bdate, relationship) VALUES ('333445555', 'Theodore', 'M', '1983-10-25', 'Son');
INSERT INTO Dependent (essn, dependent_name, sex, bdate, relationship) VALUES ('333445555', 'Joy', 'F', '1958-05-03', 'Spouse');
INSERT INTO Dependent (essn, dependent_name, sex, bdate, relationship) VALUES ('987654321', 'Abner', 'M', '1942-02-28', 'Spouse');
INSERT INTO Dependent (essn, dependent_name, sex, bdate, relationship) VALUES ('123456789', 'Michael', 'M', '1988-01-04', 'Son');
INSERT INTO Dependent (essn, dependent_name, sex, bdate, relationship) VALUES ('123456789', 'Alice', 'M', '1988-01-04', 'Son');
INSERT INTO Dependent (essn, dependent_name, sex, bdate, relationship) VALUES ('123456789', 'Elizabeth', 'M', '1967-05-05', 'Spouse');

UPDATE Employee SET Bdate = '1965-01-09' WHERE Ssn = '123456789';
UPDATE Employee SET Bdate = '1955-12-08' WHERE Ssn = '333445555';
UPDATE Employee SET Super_ssn = '333445555' WHERE Ssn = '123456789';
UPDATE Employee SET Dno = 5 WHERE Ssn = '123456789';	
UPDATE Employee SET Super_ssn = '888665555' WHERE Ssn = '333445555';
UPDATE Employee SET Dno = 5 WHERE Ssn = '333445555';
UPDATE Employee SET Super_ssn = '987654321' WHERE Ssn = '999887777';
UPDATE Employee SET Dno = 4 WHERE Ssn = '999887777';
UPDATE Employee SET Super_ssn = '888665555' WHERE Ssn = '987654321';
UPDATE Employee SET Dno = 4 WHERE Ssn = '987654321';
UPDATE Employee SET Super_ssn = '333445555' WHERE Ssn = '666884444';
UPDATE Employee SET Dno = 5 WHERE Ssn = '666884444';	
UPDATE Employee SET Super_ssn = '333445555' WHERE Ssn = '453453453';
UPDATE Employee SET Dno = 5 WHERE Ssn = '453453453';
UPDATE Employee SET Dno = 1 WHERE Ssn = '888665555';
UPDATE Employee SET Dno = 4 WHERE Ssn = '987987987';

UPDATE Dependent SET Bdate = '1986-04-05' WHERE Essn = '333445555' and Dependent_name = 'Alice';

/* Retrieve the names of all employees whose sex is male in the Department “Research” 
that makes at least one project more than 10 hours a week. */

SELECT DISTINCT e.fname, e.minit, e.lname 
FROM Employee as e, Department as d, Project as p, Works_on as w 
WHERE e.sex = 'M' AND d.dname = 'Research' AND d.dnumber = e.dno AND p.dnum = d.dnumber AND e.ssn = w.essn AND w.hours >= 10;

SELECT Fname, Lname
FROM Employee
WHERE Super_ssn = (
  SELECT Mgr_ssn
  FROM Department
  WHERE Dname = 'Research'
);
