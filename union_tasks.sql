-- 1. Union of male employees and managers
CREATE OR REPLACE VIEW v_union_male_managers AS
SELECT emp_no
FROM employees
WHERE gender = 'M'
UNION
SELECT emp_no
FROM dept_manager;

-- 2. Unique job titles and department names
CREATE OR REPLACE VIEW v_titles_departments AS
SELECT title
FROM titles
UNION
SELECT dept_name
FROM departments;

-- 3. Employees with salary > 60000 or < 40000
CREATE OR REPLACE VIEW v_salary_extremes AS
SELECT e.first_name, e.last_name, s.salary
FROM employees e
JOIN salaries s ON e.emp_no = s.emp_no
WHERE s.salary > 60000
UNION
SELECT e.first_name, e.last_name, s.salary
FROM employees e
JOIN salaries s ON e.emp_no = s.emp_no
WHERE s.salary < 40000;

-- 4. Current and former employees (status column)
CREATE OR REPLACE VIEW v_current_former_employees AS
SELECT e.first_name, e.last_name, 'Текущий' AS status
FROM employees e
WHERE e.emp_no IN (
    SELECT emp_no FROM dept_emp WHERE to_date = '9999-01-01'
)
UNION
SELECT e.first_name, e.last_name, 'Бывший' AS status
FROM employees e
WHERE e.emp_no IN (
    SELECT emp_no FROM dept_emp WHERE to_date <> '9999-01-01'
);

-- 5. Average salary comparison: Managers vs Employees
CREATE OR REPLACE VIEW v_salary_comparison AS
SELECT 'Менеджер' AS type, AVG(s.salary) AS avg_salary
FROM salaries s
WHERE s.emp_no IN (SELECT emp_no FROM dept_manager)
UNION
SELECT 'Обычный сотрудник' AS type, AVG(s.salary) AS avg_salary
FROM salaries s
WHERE s.emp_no NOT IN (SELECT emp_no FROM dept_manager);
