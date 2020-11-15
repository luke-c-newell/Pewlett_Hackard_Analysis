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

![Retiring Titles](https://github.com/luke-c-newell/Pewlett_Hackard_Analysis/blob/main/Images/retiring_titles.png "retiring_titles.png")

### Number of Employees eligible for the mentorship program

![Mentorship Titles](https://github.com/luke-c-newell/Pewlett_Hackard_Analysis/blob/main/Images/mentorship_titles.png "mentorship_titles.png")

## Summary
### How many roles will need to be filled as the "silver tsunami" begins to make an impact?
### Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?
