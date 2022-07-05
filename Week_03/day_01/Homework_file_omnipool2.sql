/* MVP */
/* Q1 */

SELECT *
FROM employees 
WHERE department = 'Human Resources';

/* MVP */
/* Q2 */

SELECT 
	first_name,
	last_name,
	country
FROM employees 
WHERE department = 'Legal'

/* MVP */
/* Q3 */

SELECT 
	count(id) AS portugal_personal
FROM employees 
WHERE country = 'Portugal'

/* MVP */
/* Q4 */
SELECT 
	count(id) AS Portugal_or_Spain
FROM employees 
WHERE country = 'Portugal' OR country = 'Spain'

/* MVP */
/* Q5 */
/*SELECT 
	count(salary) AS Total_pay
FROM employees 
WHERE */

SELECT 
	count(id) AS no_local_account
FROM pay_details  
WHERE local_account_no IS NULL

/* MVP */
/* Q6 */
SELECT 
	count(id) AS no_account_or_iban
FROM pay_details 
WHERE local_account_no IS NULL 
AND iban IS NULL

/* MVP */
/* Q7 */
SELECT  
	first_name, 
	last_name 
FROM employees 
ORDER BY last_name ASC NULLS LAST;

/* MVP */
/* Q8 */
SELECT  
	first_name, 
	last_name,
	country
FROM employees 
ORDER BY 
	country ASC NULLS LAST,
	last_name ASC NULLS LAST;

/* MVP */
/* Q9 */ 
--Expecting the details of the highest paid people in the company
SELECT *	
FROM employees
ORDER BY salary DESC
LIMIT 10;	

/* MVP */
/* Q10 */
--Select the first_name, last_name and salary of the lowest paid employees in Hungary.
SELECT
	first_name,
	last_name,
	salary
FROM employees 
WHERE country = 'Hungary'
ORDER BY salary DESC 
LIMIT 1;

/* MVP */
/* Q11 */

SELECT 
	count(id) AS num_first_name_f
FROM employees 
WHERE first_name LIKE 'F%';

/* MVP */
/* Q12 */
SELECT *
FROM employees 
WHERE email LIKE '%@yahoo%';

/* MVP */
/* Q13 */
SELECT 
	count(id) AS pension_enrol_excluded
FROM employees 
WHERE pension_enrol IS TRUE AND country NOT IN ('France', 'Germany');


/* MVP */
/* Q14 */	
SELECT 
	max(salary) AS max_salary_engineering_
FROM employees 
WHERE department = 'Engineering' AND fte_hours = 1.0

	
/* MVP */
/* Q15 */
SELECT 
	first_name,
	last_name,
	fte_hours,
	salary,
	fte_hours*salary AS effective_yearly_salary
FROM employees; 

/* Extension */
/* Q16 */
SELECT
	first_name, 
	last_name, 
	department, 
	concat(first_name, ' ', last_name, ' - ', department) AS Badge_label 

FROM employees
-----
WHERE 
  first_name IS NOT NULL AND 
  last_name IS NOT NULL AND 
  department IS NOT NULL
  
SELECT
	concat(first_name, ' ', last_name, ' - ', department, ' (joined ', EXTRACT(YEAR FROM start_date), ')')
FROM employees 
WHERE first_name IS NOT NULL AND last_name IS NOT NULL AND department IS NOT NULL AND start_date) IS NOT NULL;

SELECT 
	concat(first_name, ' ', last_name, ' - ', department,)
	TO_CHAR(start_date,'YYYY-MM', 12) --FROM employees
EXTRACT(YEAR, MONTH) 
FROM employees 	
--TO_CHAR(start_date)
EXTRACT()
	
FROM employees 	
--TO_CHAR(start_date)

/* Extension */
/* Q17 */
SELECT
  first_name,
  last_name,
  department,
  start_date,
  CONCAT(
    first_name, ' ', last_name, ' - ', department, 
    ' (joined ', EXTRACT(YEAR FROM start_date), ')'
  ) AS badge_label
 FROM employees
WHERE 
  first_name IS NOT NULL AND 
  last_name IS NOT NULL AND 
  department IS NOT NULL AND
  start_date IS NOT NULL 
  


/* Extension */
/* Q18 */
SELECT
	first_name,	last_name, salary, 
	CASE
	WHEN salary < 40000 THEN 'low_value'
	WHEN salary > 40000 THEN 'high_value'
	WHEN salary IS NULL THEN 'unknown'
END AS Salary_class

FROM employees 	

