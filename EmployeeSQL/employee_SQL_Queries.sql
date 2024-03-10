/* 1. List the employee number, last name, first name, sex, and salary of each employee. */
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees AS e
INNER JOIN salaries AS s ON e.emp_no = s.emp_no; 

/* 2. List the first name, last name, and hire date for the employees who were hired in 1986. */
SELECT first_name, last_name, hire_date
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986
ORDER BY hire_date

/* 3. List the manager of each department along with their department number, department name, 
		employee number, last name, and first name. */
SELECT dm.dept_no, de.dept_name, dm.emp_no, e.last_name, e.first_name
FROM dept_manager AS dm
INNER JOIN departments AS de ON de.dept_no = dm.dept_no 
INNER JOIN employees AS e ON e.emp_no = dm.emp_no;

/* 4. List the department number for each employee along with that employee’s employee number, last name,
		first name, and department name. */
SELECT e.emp_no, e.last_name, e.first_name, dept_emp.dept_no, de.dept_name
FROM employees as e
INNER JOIN dept_emp ON e.emp_no = dept_emp.emp_no
INNER JOIN departments AS de ON de.dept_no = dept_emp.dept_no;

Select * from Employees

/* 5. List first name, last name, and sex of each employee whose first name is Hercules and 
		whose last name begins with the letter B. */
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

/* 6. List each employee in the Sales department, including their employee number, last name, and first name. */
-- SELECT * FROM departments;
-- Sales department is d007
SELECT e.emp_no, e.last_name, e.first_name, dept_emp.dept_no
FROM employees AS e
INNER JOIN dept_emp ON e.emp_no = dept_emp.emp_no
INNER JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_no = 'd007';

/* 7. List each employee in the Sales and Development departments, including their employee number, 
		last name, first name, and department name. */
-- SELECT * FROM departments;
-- Sales department is d007; Development department is d005
SELECT e.emp_no, e.last_name, e.first_name, departments.dept_no, departments.dept_name
FROM employees as e
INNER JOIN dept_emp ON e.emp_no = dept_emp.emp_no
INNER JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_no = 'd007' OR departments.dept_no = 'd005';

/* 8. List the frequency counts, in descending order, of all the employee last names 
		(that is, how many employees share each last name).*/
SELECT last_name, COUNT(last_name) AS "Frequency Count"
FROM employees
GROUP BY last_name
ORDER BY "Frequency Count" DESC;