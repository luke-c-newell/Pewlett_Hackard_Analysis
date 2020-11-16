# Pewlett_Hackard_Analysis
## Overview
My client, a large company in the tech industry, is looking towards the future as a significant number of their employees begin to approach retirement age. They would like to understand the potential impact of these retirements, in order to plan ahead. There are two areas they are specifically interested in:
1. Who will be retiring in the next few years?
2. Which positions will be coming available?

In order to find answers to these questions, I have used PostgreSQL to analyze the tabular data from the company and create new tables/queries that answer their questions. Using the raw data from six original csv files (seen in the ERD below), I have created an additional 11 tables that show how many roles will be impacted by the upcoming retirements.

![Schema](https://github.com/luke-c-newell/Pewlett_Hackard_Analysis/blob/main/QuickDBD-export.png "schema.png")

## Results
- Over the next few years, over 90,000 employees at Pewlett Hackard will be eligible for retirement. This is a significant proportion of the current workforce and leaders at the company will need to act quickly to fill the gap that these employees will leave.
- More than two thirds of these employees currently hold senior roles, with titles such as Senior Engineer, Senior Staff and Technique Leader. This indicates that there may be a wealth of institutional knowledge that could be harnessed to mentor the next generation of Pewlett Hackard employees.
- Pewlett Hackard may also want to ensure that they focus on replacing the 2 department managers who are approaching retirement age. These are leadership roles that may take more time to fill, which makes replacing them a priority.
- Finally, the current mentorship program is a step in the right direction, but is currently insufficient to replace the large number of retiring employees. At this time, only 1549 employees are eligible for the program which would not make a dent in the 90,000 positions that need to be filled.

### Number of Employees nearing retirement age

![Retiring Titles](https://github.com/luke-c-newell/Pewlett_Hackard_Analysis/blob/main/Images/retiring_titles1.png "retiring_titles1.png")

## Summary
### How many roles will need to be filled as the "silver tsunami" begins to make an impact?


### Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?

#### Number of employees per title eligible for the mentorship program
This table shows the number of employees who are eligible for the mentorship program for each job title.

![Mentorship Titles](https://github.com/luke-c-newell/Pewlett_Hackard_Analysis/blob/main/Images/mentorship_titles1.png "mentorship_titles1.png")

#### Number of employees per department eligible for the mentorship program

![Mentorship Dept Names](https://github.com/luke-c-newell/Pewlett_Hackard_Analysis/blob/main/Images/mentorship_dept_names.png "mentorship_dept_names.png")

### Code Sample

```
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

SELECT  men.count,
        men.dept_no,
        dep.dept_name
FROM mentorship_dept_no AS men
INTO mentorship_dept_names
INNER JOIN departments AS dep
ON men.dept_no = dep.dept_no;
```
