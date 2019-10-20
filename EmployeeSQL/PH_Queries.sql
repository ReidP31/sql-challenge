-- 1. List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.gender, salaries.salary
FROM employees INNER JOIN salaries
ON employees.emp_no = salaries.emp_no;

-- 2. List employees who were hired in 1986.
SELECT emp_no, last_name, first_name, hire_date
FROM employees
WHERE hire_date LIKE '1986%';

-- 3. List the manager of each department with the following information: 
--    department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
CREATE VIEW mangr_dept_view AS
SELECT dept_manager.dept_no, departments.dept_name, dept_manager.emp_no, dept_manager.from_date, dept_manager.to_date
FROM departments INNER JOIN dept_manager
ON departments.dept_no = dept_manager.dept_no;

SELECT mangr_dept_view.dept_no, mangr_dept_view.dept_name, mangr_dept_view.emp_no, employees.last_name, employees.first_name, mangr_dept_view.from_date, mangr_dept_view.to_date
FROM employees INNER JOIN mangr_dept_view
ON employees.emp_no = mangr_dept_view.emp_no;

-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp 
	INNER JOIN departments
		ON dept_emp.dept_no = departments.dept_no
	INNER JOIN employees
		ON dept_emp.emp_no = employees.emp_no;

-- 5. List all employees whose first name is "Hercules" and last names begin with "B."
SELECT * FROM employees WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp 
	INNER JOIN departments
		ON dept_emp.dept_no = departments.dept_no
	INNER JOIN employees
		ON dept_emp.emp_no = employees.emp_no
WHERE departments.dept_name = 'Sales';

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp 
	INNER JOIN departments
		ON dept_emp.dept_no = departments.dept_no
	INNER JOIN employees
		ON dept_emp.emp_no = employees.emp_no
WHERE departments.dept_name = 'Sales' OR departments.dept_name = 'Development';

-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, COUNT(*) as frequency
FROM employees
GROUP BY last_name 
ORDER BY frequency DESC;

-- EPILOGUE
SELECT * FROM employees where emp_no = 499942;
