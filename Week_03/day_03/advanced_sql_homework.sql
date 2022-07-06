--MVP
--Q1 How many employee records are lacking both a grade and salary?
SELECT
	count(id)
FROM employees 
WHERE grade IS NULL 
AND salary IS NULL
--MVP
--Q2Produce a table with the two following fields (columns):

    --the department
   -- the employees full name (first and last name)
--Order your resulting table alphabetically by department, and then by last name
SELECT 
	department,
	concat(first_name, ' ', last_name) AS full_name 
FROM employees 	
ORDER BY department ASC, 
last_name ASC


--MVP
--Q3 Find the details of the top ten highest paid employees who have a last_name beginning with ‘A’.
SELECT *
	
FROM employees 
WHERE last_name LIKE 'A%' 
AND salary IS NOT NULL
ORDER BY salary DESC
LIMIT 10;
--MVP
--Q4 Obtain a count by department of the employees who started work with the corporation in 2003.
SELECT 
	department, 
	count(id)
FROM employees
WHERE start_date BETWEEN '2003-01-01' AND '2003-12-31'
GROUP BY department; 
--MVP
--Q5 Obtain a table showing department, fte_hours and the number of employees in each department who work each fte_hours pattern.
-- Order the table alphabetically by department, and then in ascending order of fte_hours. 
SELECT 
	department,
	fte_hours,
	count(id)
FROM employees 
GROUP BY fte_hours, department 
ORDER BY department ASC, fte_hours ASC
--MVP
--Q6 Provide a breakdown of the numbers of employees enrolled,
-- not enrolled, and with unknown enrollment status in the corporation pension scheme.

SELECT
	pension_enrol, 
	count(id) AS num_employees
FROM employees 
GROUP BY pension_enrol; 

--MVP
--Q7 Obtain the details for the employee with 
--the highest salary in the ‘Accounting’ department who is not enrolled in the pension scheme?
SELECT *
FROM employees 
WHERE department = 'Accounting' 
AND pension_enrol IS FALSE 
ORDER BY salary DESC NULLS LAST
LIMIT 1;
--MVP
--Q8 Get a table of country, number of employees in that country, 
--and the average salary of employees in that country for any countries in which more than 30 employees are based. 
--Order the table by average salary descending.
SELECT
	country,
	avg(salary), 
	count(id) AS employee_count
FROM employees 
GROUP BY country
HAVING count(id) > 30
ORDER BY avg(salary) DESC;
--MVP
--Q9 Return a table containing each employees first_name, last_name, full-time equivalent hours (fte_hours), 
--salary, and a new column effective_yearly_salary which should contain fte_hours multiplied by salary. 
--Return only rows where effective_yearly_salary is more than 30000.
SELECT 
	first_name,
	last_name,
	fte_hours,
	salary,
	fte_hours * salary AS effective_yearly_salary
FROM employees 
WHERE fte_hours * salary > 30000;
--MVP
--Q10 Find the details of all employees in either Data Team 1 or Data Team 2
SELECT 
	e.*,
	t.name AS Team_name
FROM employees AS e INNER JOIN teams AS t 
ON t.id = e.team_id 
WHERE t.name ~ 'Data Team';

/*Hint
name is a field in table `teams

--MVP
--Q11
Find the first name and last name of all employees who lack a local_tax_code.
Hint
local_tax_code is a field in table pay_details, and first_name and last_name are
fields in table employees*/
SELECT
	e.first_name,
	e.last_name,
	pd.local_tax_code
FROM employees AS e LEFT JOIN pay_details AS pd 
ON e.pay_detail_id = pd.id
WHERE local_tax_code IS NULL
--MVP
--Q12
/*The expected_profit of an employee is defined as (48 * 35 * charge_cost - salary) * fte_hours, 
where charge_cost depends upon the team to which the employee belongs. 
Get a table showing expected_profit for each employee.
Hints
charge_cost is in teams, while salary and fte_hours are in employees, so a join will be necessary
You will need to change the type of charge_cost in order to perform the calculation*/
SELECT 
	e.first_name,
	e.last_name,
	e.fte_hours,
	t.charge_cost,
	(48 * 35 * CAST(charge_cost AS INT) - salary) * fte_hours AS expected_profit
FROM employees AS e LEFT JOIN teams AS t 
ON t.id = e.team_id 

--MVP
--Q13[Tough]
/*Find the first_name, last_name and salary of the lowest paid employee in Japan 
who works the least common full-time equivalent hours across the corporation."
Hint
You will need to use a subquery to calculate the mode*/
WITH fte_data AS (
			SELECT 
			fte_hours,
			count(id) AS num_in_fte
		FROM employees 	
		GROUP BY fte_hours 
		ORDER BY num_in_fte ASC
		LIMIT 1
)
SELECT 
	first_name, 
	last_name,
	salary
FROM employees 
WHERE country = 'Japan' AND fte_hours = (SELECT fte_hours FROM fte_data);
--
--MVP
--Q14
/*

Obtain a table showing any departments in which there are two or more employees 
lacking a stored first name. Order the table in descending order of the number of
 employees lacking a first name, and then in alphabetical order by department.
*/
SELECT 
	department,
	count(id) AS missing_frames
FROM employees 
WHERE first_name IS NULL
GROUP BY department
HAVING count(id) > 2
ORDER BY count(id) DESC, department ASC;
	
--MVP
--Q15 /*Return a table of those employee first_names shared by more than one employee, 
--together with a count of the number of times each first_name occurs. Omit employees 
--without a stored first_name from the table. Order the table descending by count, 
--and then alphabetically by first_name */
SELECT 
	first_name,
	count(id) AS num_of_names
FROM employees 	
GROUP BY first_name
HAVING first_name IS NOT NULL AND count(id) > 1
ORDER BY num_of_names DESC, first_name ASC;

--MVP
--Q16 (Tough) Find the proportion of employees in each department who are grade 1. 
/*WITH grade_1_employees AS (
	SELECT
	id,
	CAST(grade AS INT),
	count(id) AS num_grade_1,
	sum(grade = 1 / count(id)) * 100
	FROM employees
	WHERE grade = 1
	GROUP BY department 
	)*/
SELECT 
	department,
	CAST(sum(grade) AS decimal/CAST(count(id) AS decimal) AS proportion_grade_one
FROM employees 
GROUP BY department 
--EXT
--Q1 Get a list of the id, first_name, last_name, department, salary and fte_hours of employees in the largest 
--department.  Add two extra columns showing the ratio of each employee’s salary to that 
--department’s average salary, and each employee’s fte_hours to that department’s average fte_hours.
SELECT
	id,
	first_name,
	last_name,
	department,
	salary,
	fte_hours 

--EXT
--Q2

--EXT
--Q3

--EXT
--Q4


