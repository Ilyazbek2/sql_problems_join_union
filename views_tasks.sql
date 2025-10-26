-- 1. Simple view with employee names
CREATE OR REPLACE VIEW v_employees AS
SELECT first_name, last_name
FROM employees;

-- 2. View joining employees and current salaries
CREATE OR REPLACE VIEW v_emp_sal AS
SELECT e.emp_no, e.first_name, e.last_name, s.salary
FROM employees e
JOIN salaries s ON e.emp_no = s.emp_no
WHERE s.to_date = '9999-01-01';

-- 3. View showing average salary by department
CREATE OR REPLACE VIEW v_avg_salary AS
SELECT d.dept_name, AVG(s.salary) AS avg_salary
FROM salaries s
JOIN dept_emp de ON s.emp_no = de.emp_no
JOIN departments d ON de.dept_no = d.dept_no
WHERE s.to_date = '9999-01-01'
GROUP BY d.dept_name;

-- 4. View showing employees in the 'Sales' department
CREATE OR REPLACE VIEW v_sales AS
SELECT e.emp_no, e.first_name, e.last_name, d.dept_name
FROM employees e
JOIN dept_emp de ON e.emp_no = de.emp_no
JOIN departments d ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales' AND de.to_date = '9999-01-01';
