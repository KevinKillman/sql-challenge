SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees AS e
INNER JOIN salaries AS s
ON e.emp_no = s.emp_no;

SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date LIKE '%1986'
ORDER BY first_name;

SELECT d.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
FROM employees AS e
INNER JOIN dept_manager AS dm ON dm.emp_no = e.emp_no
INNER JOIN departments AS d ON d.dept_no = dm.dept_no;

SELECT e.emp_no, e.first_name, e.last_name, d.dept_name
FROM employees AS e
INNER JOIN dept_emp AS de ON de.emp_no = e.emp_no
INNER JOIN departments AS d ON d.dept_no = de.dept_no;

SELECT first_name, last_name, sex
FROM employees
WHERE first_name ='Hercules' AND last_name LIKE 'B%';

SELECT emp_no, last_name, first_name, (SELECT dept_name FROM departments WHERE dept_name = 'Sales' )
FROM employees
WHERE emp_no IN (
	SELECT emp_no
	FROM dept_emp
	WHERE dept_no IN (
		SELECT dept_no
		FROM departments 
		WHERE dept_name LIKE 'Development'
	)
)
ORDER BY last_name;

SELECT emp_no, last_name, first_name, (SELECT dept_name FROM departments WHERE dept_name LIKE 'Sales' OR dept_name LIKE 'Development' LIMIT 1)
FROM employees  
WHERE emp_no IN (
	SELECT emp_no
	FROM dept_emp
	WHERE dept_no IN (
		SELECT dept_no
		FROM departments 
		WHERE dept_name LIKE 'Sales' OR dept_name LIKE 'Development'
	)
)
ORDER BY last_name;

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
INNER JOIN dept_emp AS de ON de.emp_no = e.emp_no
INNER JOIN departments AS d ON de.dept_no = d.dept_no
WHERE  d.dept_name LIKE 'Sales' OR d.dept_name LIKE 'Development';

SELECT last_name, COUNT(last_name)
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC; 
