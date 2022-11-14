SELECT
	s.first_name,
	s.last_name ,
	tab.num,
	CASE
		WHEN tab.num > 8000 THEN 'YES'
		ELSE 'NO'
	END prem
FROM
	(
	SELECT
		p.staff_id ,
		COUNT(1) num
	FROM
		sakila.payment p
	GROUP BY
		p.staff_id) tab
JOIN 
sakila.staff s ON
	s.staff_id = tab.staff_id;