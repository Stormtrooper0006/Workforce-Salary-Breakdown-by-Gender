USE employees_mod;

SELECT
	YEAR(d.from_date) AS calendar_year,
    e.gender,
    COUNT(e.emp_no) AS num_of_employees
FROM t_employees e
JOIN t_dept_emp d ON e.emp_no = d.emp_no
WHERE YEAR(d.from_date) >= 1990
GROUP BY calendar_year, e.gender
ORDER BY calendar_year ASC;