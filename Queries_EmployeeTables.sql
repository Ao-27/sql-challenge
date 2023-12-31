-- List the employee number, last name, first name, sex, and salary of each employee.
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary

FROM
employees as e

INNER JOIN salaries as s ON s.emp_no = e.emp_no;
	
-- List the first name, last name, and hire date for the employees who were hired in 1986
SELECT e.first_name, e.last_name, e.hire_date

FROM
employees as e

WHERE 
date_part('year', e.hire_date) = 1986;

-- List the manager of each department along with their department number, department name, employee number, 
-- last name, and first name
SELECT dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name

FROM
dept_manager as dm

INNER JOIN departments as d ON m.dept_no = d.dept_no 
INNER JOIN employees as e ON m.emp_no = e.emp_no;

--List the department number for each employee along with that employee’s employee
-- number, last name, first name, and department name
SELECT de.dept_no, e.emp_no, e.last_name, e.first_name, d.dept_name

FROM
dept_emp as de

INNER JOIN employees as e ON n.emp_no = e.emp_no
INNER JOIN departments as d ON n.dept_no = d.dept_no;

-- List first name, last name, and sex of each employee whose first name is Hercules and
-- whose last name begins with the letter B
SELECT e.first_name, e.last_name, e.sex

FROM
employees as e

WHERE
e.first_name = 'Hercules' 
AND
e.last_name LIKE 'B%';

-- List each employee in the Sales department, including their employee number, last
-- name, and first name
SELECT
n.emp_no, e.last_name, e.first_name

FROM
dept_emp as n

INNER JOIN employees as e ON n.emp_no = e.emp_no
INNER JOIN departments as d ON n.dept_no = d.dept_no

WHERE 
d.dept_name = 'Sales';

-- List each employee in the Sales and Development departments, including their
-- employee number, last name, first name, and department name
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name

FROM employees e

JOIN dept_emp de ON e.emp_no = de.emp_no
JOIN departments d ON de.dept_no = d.dept_no

WHERE 
d.dept_name IN ('Sales', 'Development');

-- List the frequency counts, in descending order, of all the employee last names (that is
-- how many employees share each last name)
SELECT e.last_name, COUNT(*) AS "frequency_shared_lnames"

FROM employees as e

GROUP BY last_name

ORDER BY "frequency_shared_lnames" DESC;