
-- List the following details of each employee:
-- employee number, last name, first name, sex, and salary.
SELECT e.emp_no, e.first_name, e.last_name, e.sex, s.salary
FROM employees AS e
LEFT JOIN salaries AS s
ON e.emp_no = s.emp_no
ORDER BY e.emp_no;
----------------------------------------------------------

-- List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';
----------------------------------------------------------

-- List the manager of each department with the following information:
-- department number, department name, the manager's employee number,
-- last name, first name
SELECT dm.dept_no AS "Dept No.", d.dept_name AS "Dept Name", dm.emp_no AS "Emp No.",
		e.last_name AS "Last Name", e.first_name AS "First Name" 
FROM dept_manager AS dm
	INNER JOIN departments AS d
		ON (dm.dept_no = d.dept_no)
	INNER JOIN employees AS e
		ON (dm.emp_no = e.emp_no);

------------------------------------------------

-- List the department of each employee with the following information:
-- employee number, last name, first name, and department name.
SELECT e.emp_no AS "Emp No.", e.last_name AS "Last Name", 
		e.first_name AS "First Name", d.dept_name AS "Dept Name"
FROM employees AS e
	INNER JOIN dept_emp AS ed
		ON (e.emp_no = ed.emp_no)
	INNER JOIN departments AS d
		ON (ed.dept_no = d.dept_no)
ORDER BY e.emp_no;
----------------------------------------------------------------------------

-- List first name, last name, and sex for employees whose
-- first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex
FROM employees
	WHERE first_name = 'Hercules'
	AND last_name LIKE 'B%';
-----------------------------------------------------------------------------
	
-- List all employees in the Sales department, including their
-- employee number, last name, first name, and department name.
SELECT e.emp_no AS "Emp No.", e.last_name AS "Last Name", 
		e.first_name AS "First Name", d.dept_name AS "Dept Name"
FROM employees AS e
	INNER JOIN dept_emp AS ed
		ON (e.emp_no = ed.emp_no)
	INNER JOIN departments AS d
		ON (ed.dept_no = d.dept_no)
	WHERE d.dept_name = 'Sales'
ORDER BY e.emp_no;
----------------------------------------------------------------------------

-- List all employees in the Sales and Development departments, including their
-- employee number, last name, first name, and department name.
SELECT e.emp_no AS "Emp No.", e.last_name AS "Last Name", 
		e.first_name AS "First Name", d.dept_name AS "Dept Name"
FROM employees AS e
	INNER JOIN dept_emp AS ed
		ON (e.emp_no = ed.emp_no)
	INNER JOIN departments AS d
		ON (ed.dept_no = d.dept_no)
	WHERE d.dept_name IN ('Sales', 'Development')
ORDER BY e.emp_no;
------------------------------------------------------------------------------

-- In descending order, list the frequency count of employee last names,
-- i.e., how many employees share each last name.
SELECT last_name, count(last_name) as Total
FROM employees
GROUP BY last_name
ORDER BY Total DESC;

-------------------------------------------------------------------------------
