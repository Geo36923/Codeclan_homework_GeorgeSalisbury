--MVP
--Q1(a). Find the first name, last name and team name of employees who are members of teams.

SELECT 
	e.first_name,
	e.last_name,
	d.name
FROM employees AS e INNER JOIN teams AS d 
ON e.team_id  = d.id;
-- classnotes answer
SELECT 
  e.first_name, 
  e.last_name, 
  t.name AS team_name
FROM employees AS e INNER JOIN teams AS t
ON e.team_id = t.id;
--MVP
--Q1(b) Find the first name, last name and team name of employees who are members of teams 
--and are enrolled in the pension scheme.
SELECT 
	e.first_name,
	e.last_name,
	d.name AS team_name
FROM employees AS e INNER JOIN teams AS d 
ON e.team_id  = d.id 
WHERE pension_enrol = TRUE AND first_name IS NOT NULL;
-- classnotes answer
SELECT 
  e.first_name, 
  e.last_name, 
  t.name AS team_name
FROM employees AS e INNER JOIN teams AS t
ON e.team_id = t.id
WHERE e.pension_enrol = TRUE;
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
--classnotes answer
SELECT 
  e.first_name, 
  e.last_name, 
  t.name AS team_name
FROM employees AS e INNER JOIN teams AS t
ON e.team_id = t.id
WHERE CAST(t.charge_cost AS INT) > 80;
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
--classnotes answer
SELECT 
  e.*,
  pd.local_account_no,
  pd.local_sort_code
FROM employees AS e LEFT JOIN pay_details AS pd
ON e.pay_detail_id = pd.id
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
--classnotes answer
SELECT 
  e.*,
  pd.local_account_no,
  pd.local_sort_code,
  t.name AS team_name
FROM employees AS e LEFT JOIN pay_details AS pd
ON e.pay_detail_id = pd.id
LEFT JOIN teams AS t
ON e.team_id = t.id
--MVP
--Q3(a) Make a table, which has each employee id along with the team that employee belongs to.
SELECT 
	e.team_id,
	e.id AS Personal_id,
	t.id,
	t.name
FROM employees AS e LEFT JOIN teams AS t
ON e.team_id = t.id  
--classnotes answer
SELECT 
  e.id AS employee_id,
  t.name AS team_name 
FROM employees AS e LEFT JOIN teams as t
ON e.team_id = t.id;
--MVP
--Q3(b)
SELECT 
	t.name,
	COUNT(e.id) AS sum_employees
FROM employees AS e LEFT JOIN teams AS t
ON e.team_id = t.id
GROUP BY t.name
--classnotes answer
SELECT 
  COUNT(e.id),
  t.name AS team_name 
FROM employees AS e LEFT JOIN teams as t
ON e.team_id = t.id
GROUP BY t.name;
--MVP
--Q3(c)
SELECT 
	t.name,
	COUNT(e.id) AS sum_employees
FROM employees AS e LEFT JOIN teams AS t
ON e.team_id = t.id
GROUP BY t.name
ORDER BY sum_employees ASC
--classnotes answer
SELECT 
  t.name AS team_name, 
  COUNT(e.id) AS num_employees
FROM teams AS t LEFT JOIN employees AS e
ON e.team_id = t.id
GROUP BY t.name
ORDER BY num_employees ASC
--MVP
--Q4(a) Create a table with the team id, team name and the count of the number of employees in each team.
SELECT 
	--e.team_id, 
	t.id AS team_ID,
	t.name,
	COUNT(e.id) AS total_employees	
FROM employees AS e LEFT JOIN teams AS t
ON e.team_id = t.id
GROUP BY t.id;  
--classnotes answer
SELECT 
  t.id,  
  t.name,
  COUNT(e.id)
FROM employees AS e
INNER JOIN teams AS t
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
--classnotes answer
SELECT 
  t.name,
  COUNT(e.id) * CAST(t.charge_cost AS INT) AS total_day_charge
FROM employees AS e
INNER JOIN teams AS t
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
--classnotes answer
SELECT 
  t.name,
  COUNT(e.id) * CAST(t.charge_cost AS INT) AS total_day_charge
FROM employees AS e
INNER JOIN teams AS t
ON e.team_id = t.id
GROUP BY t.id
HAVING COUNT(e.id) * CAST(t.charge_cost AS INT) > 5000
--EXTENSION 
--Q1
SELECT 
	count(DISTINCT ec.employee_id) AS committee_employees
	--DISTINCT committee_id	
  
FROM employees_committees AS ec INNER JOIN employees AS e
ON ec.employee_id = e.id
--classnotes answer
SELECT 
  COUNT(DISTINCT(employee_id)) AS num_employees_on_committees
FROM employees_committees
--EXTENSION 
--Q2
SELECT 
	count(*) AS non_committee_employees
	--DISTINCT committee_id	
  
FROM employees_committees AS ec FULL JOIN employees AS e
ON ec.employee_id = e.id
WHERE ec.employee_id IS NULL
-- classnotes answer
SELECT 
  COUNT(*) AS num_not_in_committees
FROM employees e
LEFT JOIN employees_committees ec
ON e.id = ec.employee_id 
WHERE ec.employee_id IS NULL