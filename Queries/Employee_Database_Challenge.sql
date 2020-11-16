-- Create a retirement_titles table
SELECT	e.emp_no,
		e.first_name,
		e.last_name,
		ti.title,
		ti.from_date,
		ti.to_date
INTO retirement_titles
FROM employees AS e
INNER JOIN titles AS ti
ON (e.emp_no = ti.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) 
	emp_no,
	first_name,
	last_name,
	title
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no, to_date DESC;

SELECT *
FROM unique_titles;

SELECT COUNT (title), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY count DESC;

SELECT *
FROM retiring_titles;

SELECT DISTINCT ON (emp_no)
	e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	ti.title
INTO mentorship_eligibility
FROM employees AS e
INNER JOIN dept_emp AS de
ON (e.emp_no = de.emp_no)
INNER JOIN titles AS ti
ON (e.emp_no = ti.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
	AND (de.to_date = '9999-01-01')
	AND (ti.to_date = '9999-01-01')
ORDER BY emp_no, to_date DESC;

SELECT *
FROM mentorship_eligibility;

-- Create table for the number of employees eligible for the mentorship program
SELECT COUNT (title), title
INTO mentorship_titles
FROM mentorship_eligibility
GROUP BY title
ORDER BY count DESC;

-- Create table to show the departments for employees eligible for the mentorship program
SELECT DISTINCT ON (emp_no)
	e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	de.dept_no,
	ti.title
INTO mentorship_eligibility_departments
FROM employees AS e
INNER JOIN dept_emp AS de
ON (e.emp_no = de.emp_no)
INNER JOIN titles AS ti
ON (e.emp_no = ti.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
	AND (de.to_date = '9999-01-01')
	AND (ti.to_date = '9999-01-01')
ORDER BY emp_no, to_date DESC;

SELECT COUNT (dept_no), dept_no
INTO mentorship_dept_no
FROM mentorship_eligibility_departments
GROUP BY dept_no
ORDER BY count DESC;

SELECT *
FROM mentorship_dept_no;

SELECT 	men.count,
		men.dept_no,
		dep.dept_name
FROM mentorship_dept_no AS men
INTO mentorship_dept_names
INNER JOIN departments AS dep
ON men.dept_no = dep.dept_no;
