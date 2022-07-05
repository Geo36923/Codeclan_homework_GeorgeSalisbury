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
--Q4(a) Create a table with the team id, team name and the count of the number of employees in each team.
SELECT 
	--e.team_id, 
	t.id AS team_ID,
	t.name,
	COUNT(e.id) AS total_employees	
FROM employees AS e LEFT JOIN teams AS t
ON e.team_id = t.id
GROUP BY t.id  
 
--MVP
--Q4(b)The total_day_charge of a team is defined as the charge_cost of the team multiplied by 
--the number of employees in the team. Calculate the total_day_charge for each team. 
 
SELECT 
	--e.team_id, 
	t.id AS team_ID,
	t.charge_cost, 
	t.name,
	CAST(charge_cost AS INT) * Count(e.id) AS total_day_charge, 
	COUNT(e.id) AS total_employees
	
FROM employees AS e LEFT JOIN teams AS t
ON e.team_id = t.id
GROUP BY t.id 

--MVP
--Q4(c) How would you amend your query from above to show only those 
--teams with a total_day_charge greater than 5000? 
SELECT 
	--e.team_id, 
	t.id AS team_ID,
	t.charge_cost, 
	t.name,
	CAST(charge_cost AS INT) * Count(e.id) AS total_day_charge, 
	COUNT(e.id) AS total_employees
	
FROM employees AS e LEFT JOIN teams AS t
ON e.team_id = t.id
GROUP BY t.id 
HAVING CAST(charge_cost AS INT) * Count(e.id) > 5000
--WHERE total_day_charge > 8000

--EXTENSION 
--Q1
SELECT 
DISTINCT committee_id   
FROM employees_committees AS ec INNER JOIN



--EXTENSION 
--Q2
