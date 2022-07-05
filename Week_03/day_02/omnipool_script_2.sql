--MVP
--Q1(a). Find the first name, last name and team name of employees who are members of teams.

SELECT 
	e.first_name,
	e.last_name,
	d.name
FROM employees AS e INNER JOIN teams AS d 
ON e.team_id  = d.id; 
--MVP
--Q1(b) Find the first name, last name and team name of employees who are members of teams 
--and are enrolled in the pension scheme.
SELECT 
	e.first_name,
	e.last_name,
	d.name
FROM employees AS e INNER JOIN teams AS d 
ON e.team_id  = d.id 
WHERE pension_enrol = TRUE AND first_name IS NOT NULL;

--MVP
--Q1(c) Find the first name, last name and team name of employees who are members of teams, 
--where their team has a charge cost greater than 80.
SELECT 
	e.first_name,
	e.last_name,
	d.name,
	d.charge_cost 
FROM employees AS e INNER JOIN teams AS d 
ON e.team_id  = d.id 
WHERE CAST (charge_cost AS INT) > 80; 

--MVP
--Q2(a) Get a table of all employees details, together with their local_account_no and local_sort_code, 
--if they have them. 
SELECT 
	e.*,
	p.* 
FROM employees AS e LEFT JOIN pay_details AS p 
ON p.id = e.pay_detail_id  
WHERE email IS NOT NULL 
AND iban IS NOT NULL
AND local_tax_code IS NOT NULL
AND first_name IS NOT NULL;
--AND p.local_sort_code = e.salary ;

--MVP
--Q2(b) Amend your query above to also return the name of the team that each employee belongs to. 
SELECT 
	e.*,
	p.*, 
	e.team_id 
FROM employees AS e LEFT JOIN pay_details AS p 
ON p.id = e.pay_detail_id 
WHERE email IS NOT NULL 
AND iban IS NOT NULL
AND local_tax_code IS NOT NULL
AND first_name IS NOT NULL; 
--MVP
--Q3(a) Make a table, which has each employee id along with the team that employee belongs to.
SELECT 
	e.team_id,
	e.id AS Personal_id,
	t.id,
	t.name
FROM employees AS e LEFT JOIN teams AS t
ON e.team_id = t.id  
--MVP
--Q3(b)
SELECT 
	t.name,
	COUNT(e.id) AS sum_employees
FROM employees AS e LEFT JOIN teams AS t
ON e.team_id = t.id
GROUP BY t.name
--MVP
--Q3(c)
SELECT 
	t.name,
	COUNT(e.id) AS sum_employees
FROM employees AS e LEFT JOIN teams AS t
ON e.team_id = t.id
GROUP BY t.name
ORDER BY sum_employees ASC
--MVP
--Q4(a)
SELECT 
	team_id 
	
FROM employees AS e RIGHT JOIN teams AS t
--MVP
--Q4(b)

--MVP
--Q4(c)

--EXTENSION 
--Q1

--EXTENSION 
--Q2
