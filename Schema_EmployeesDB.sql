---- drop the table if it already exists
DROP TABLE titles;
DROP TABLE employees;
DROP TABLE departments;
DROP TABLE dept_manager;
DROP TABLE dept_emp;
DROP TABLE salaries;

--- create Titles table
CREATE TABLE titles(
title_id VARCHAR(5) PRIMARY KEY,
title VARCHAR NOT NULL);

SELECT * FROM titles;

--- create Employees table
CREATE TABLE employees(
emp_no INTEGER PRIMARY KEY,
emp_title VARCHAR(5) NOT NULL,
FOREIGN KEY (emp_title) REFERENCES titles(title_id),
birth_date DATE NOT NULL,
first_name VARCHAR(40) NOT NULL,
last_name VARCHAR(45) NOT NULL,
sex VARCHAR(1) NOT NULL,
hire_date DATE NOT NULL);

SELECT * FROM employees;

--- create Departments table
CREATE TABLE departments(
dept_no VARCHAR(4) PRIMARY KEY,
dept_name VARCHAR(25) NOT NULL);

SELECT * FROM departments;

--- create Dept Manager table
CREATE TABLE dept_manager(
dept_no VARCHAR(4) NOT NULL,
FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
emp_no INTEGER NOT NULL,
FOREIGN KEY (emp_no) REFERENCES employees(emp_no));

SELECT * FROM dept_manager;

--- create Dept Emp table
CREATE TABLE dept_emp(
emp_no INTEGER NOT NULL,
FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
dept_no VARCHAR(4) NOT NULL, 
FOREIGN KEY (dept_no) REFERENCES departments(dept_no));

SELECT * FROM dept_emp;

--- create Salaries table
CREATE TABLE salaries(
emp_no INTEGER NOT NULL,
FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
salary INTEGER NOT NULL);

SELECT * FROM salaries;