--Roteiro 4

--Q1
    SELECT * FROM department;

--Q2
    SELECT * FROM dept_locations;
    SELECT * FROM dependent;
    SELECT * FROM employee;
    SELECT * FROM project;
    SELECT * FROM works_on;

--Q7
SELECT fname, lname FROM employee WHERE sex = 'M';
--Q8
SELECT fname FROM employee WHERE sex = 'M' AND superssn IS null;
--Q9
SELECT e.fname, s.fname FROM employee AS e, employee AS s WHERE e.superssn = s.ssn;
--Q10
SELECT e.fname FROM employee AS e WHERE e.superssn = (SELECT f.ssn FROM employee AS f WHERE f.fname = 'Franklin');
--Q11
SELECT d.dname, l.dlocation FROM department AS d, dept_locations AS l WHERE d.dnumber = l.dnumber;
--Q12
SELECT d.dname FROM department AS d, dept_locations AS l WHERE d.dnumber = l.dnumber AND SUBSTRING(l.dlocation, 1, 1) = 'S';
--Q13
SELECT e.fname, e.lname, d.dependent_name FROM employee AS e, dependent AS d WHERE e.ssn = d.essn;
--Q14
SELECT e.fname || e.minit || e.lname AS full_name, e.salary FROM employee AS e WHERE e.salary > 50000;
--Q15
SELECT p.pname, d.dname FROM project AS p, department AS d WHERE p.dnum = d.dnumber;
--Q16
SELECT p.pname, m.fname FROM project AS p, employee as M, department AS d WHERE p.dnum = d.dnumber AND m.ssn = d.mgrssn AND p.pnumber > 30;
--Q17
SELECT p.pname, e.fname FROM project AS p, employee as E, works_on AS w WHERE p.pnumber = w.pno AND e.ssn = w.essn;
--Q18
SELECT e.fname, d.dependent_name, d.relationship FROM employee AS e, dependent AS d, project AS p, works_on AS w WHERE e.ssn = w.essn AND p.pnumber = w.pno AND p.pnumber = 91 AND e.ssn = d.essn;