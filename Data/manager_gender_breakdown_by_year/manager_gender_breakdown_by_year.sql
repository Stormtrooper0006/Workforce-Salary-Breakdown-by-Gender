USE employees_mod;

SELECT
	d.dept_name,
    e.gender,
    e.emp_no,
    dm.from_date,
    dm.to_date,
    e2.calendar_year,
    CASE
		WHEN YEAR(dm.from_date) <= e2.calendar_year AND YEAR(dm.to_date) >= e2.calendar_year THEN 1
		ELSE 0
	END AS active
FROM t_employees e
JOIN t_dept_manager dm ON e.emp_no = dm.emp_no
JOIN t_departments d ON dm.dept_no = d.dept_no
CROSS JOIN 
	(SELECT DISTINCT YEAR(hire_date) AS calendar_year
		FROM t_employees) AS e2
ORDER BY e.emp_no, e2.calendar_year ASC;