USE employees_mod;

DROP PROCEDURE IF EXISTS filter_salary;

DELIMITER $$
CREATE PROCEDURE filter_salary(IN p_min_salary FLOAT, IN p_max_salary FLOAT)
BEGIN
	SELECT 
		e.gender,
        d.dept_name,
		ROUND(AVG(s.salary), 2) AS avg_salary
    FROM t_employees e
    JOIN t_salaries s ON e.emp_no = s.emp_no
    JOIN t_dept_emp de ON s.emp_no = de.emp_no
    JOIN t_departments d ON de.dept_no = d.dept_no
    WHERE s.salary BETWEEN p_min_salary AND p_max_salary
    GROUP BY d.dept_no, e.gender
    ORDER BY d.dept_no ASC;
END$$
DELIMITER ;

CALL employees_mod.filter_salary(50000, 90000);