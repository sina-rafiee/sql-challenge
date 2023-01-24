
CREATE TABLE titles (
  title_id VARCHAR NOT NULL,
  title VARCHAR NOT NULL,
	PRIMARY KEY (title_id)
);

CREATE TABLE employees (
  emp_no integer NOT NULL,
  emp_title_id VARCHAR NOT NULL,
  birth_date date NOT NULL,
  first_name VARCHAR NOT NULL,
  last_name VARCHAR NOT NULL,
  sex VARCHAR NOT NULL,
  hire_date date NOT NULL,
	PRIMARY KEY (emp_no),
	FOREIGN KEY (emp_title_id) REFERENCES titles (title_id)
);

CREATE TABLE departments (
  dept_no VARCHAR NOT NULL,
  dept_name VARCHAR NOT NULL,
	PRIMARY KEY (dept_no)
);

CREATE TABLE dept_emp (
  emp_no integer NOT NULL,
  dept_no VARCHAR NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
	PRIMARY KEY (emp_no, dept_no)
);

CREATE TABLE dept_manager (
  dept_no VARCHAR NOT NULL,
  emp_no integer NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no)
);

CREATE TABLE salaries (
  emp_no integer NOT NULL,
  salary integer NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	PRIMARY KEY (emp_no)
);



SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees
INNER JOIN salaries
ON employees.emp_no = salaries.emp_no;


SELECT employees.last_name, employees.first_name, employees.hire_date
FROM employees
WHERE employees.hire_date BETWEEN '1986-01-01' AND '1986-12-31';



SELECT departments.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name
FROM ((departments
INNER JOIN dept_manager
ON departments.dept_no = dept_manager.dept_no)
INNER JOIN employees
ON dept_manager.emp_no = employees.emp_no);

SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM ((departments
INNER JOIN dept_emp
ON departments.dept_no = dept_emp.dept_no)
INNER JOIN employees
ON dept_emp.emp_no = employees.emp_no);

SELECT employees.first_name, employees.last_name, employees.sex
FROM employees
WHERE employees.first_name = 'Hercules' AND employees.last_name LIKE 'B%';

SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM ((departments
INNER JOIN dept_emp
ON departments.dept_no = dept_emp.dept_no)
INNER JOIN employees
ON dept_emp.emp_no = employees.emp_no)
WHERE departments.dept_name = 'Sales';

SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM ((departments
INNER JOIN dept_emp
ON departments.dept_no = dept_emp.dept_no)
INNER JOIN employees
ON dept_emp.emp_no = employees.emp_no)
WHERE departments.dept_name = 'Sales' OR departments.dept_name = 'Development';

SELECT employees.last_name, COUNT(employees.last_name) AS LastNameCount
FROM employees
GROUP BY employees.last_name
ORDER BY LastNameCount DESC;















































