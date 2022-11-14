
SELECT num_pay.* FROM (SELECT
	YEAR(p.payment_date) y,
	month(p.payment_date) m,
	COUNT(1) np
FROM
	sakila.payment p
GROUP BY
	y,
	m ) num_pay WHERE ();


MAX(num_pay.np)



Макс колво платежей

SELECT MAX(num_pay.np) FROM  (SELECT
	YEAR(p.payment_date) y,
	month(p.payment_date) m,
	COUNT(1) np
FROM
	sakila.payment p
GROUP BY
	y,
	m ) num_pay;
	

ГОД и месяц, с макс колвом платежей

SELECT num_pay.y, num_pay.m FROM  (SELECT
	YEAR(p.payment_date) y,
	month(p.payment_date) m,
	COUNT(1) np
FROM
	sakila.payment p
GROUP BY
	y,
	m ) num_pay WHERE num_pay.np = (SELECT MAX(num_pay.np) FROM  (SELECT
	YEAR(p.payment_date) y,
	month(p.payment_date) m,
	COUNT(1) np
FROM
	sakila.payment p
GROUP BY
	y,
	m ) num_pay);

Аренды за опред год, месяц

SELECT * FROM sakila.rental r WHERE YEAR(r.rental_date) = (SELECT num_pay.y
FROM  (SELECT
	YEAR(p.payment_date) y,
	month(p.payment_date) m,
	COUNT(1) np
FROM
	sakila.payment p
GROUP BY
	y,
	m ) num_pay WHERE num_pay.np = (SELECT MAX(num_pay.np) FROM  (SELECT
	YEAR(p.payment_date) y,
	month(p.payment_date) m,
	COUNT(1) np
FROM
	sakila.payment p
GROUP BY
	y,
	m ) num_pay)) 
	AND 
MONTH (r.rental_date) = (SELECT num_pay.m
FROM  (SELECT
	YEAR(p.payment_date) y,
	month(p.payment_date) m,
	COUNT(1) np
FROM
	sakila.payment p
GROUP BY
	y,
	m ) num_pay WHERE num_pay.np = (SELECT MAX(num_pay.np) FROM  (SELECT
	YEAR(p.payment_date) y,
	month(p.payment_date) m,
	COUNT(1) np
FROM
	sakila.payment p
GROUP BY
	y,
	m ) num_pay))
	;


Колво аренд за месяц и год, где больше всего платежей

SELECT COUNT(1)  FROM sakila.rental r WHERE YEAR(r.rental_date) = (SELECT num_pay.y
FROM  (SELECT
	YEAR(p.payment_date) y,
	month(p.payment_date) m,
	COUNT(1) np
FROM
	sakila.payment p
GROUP BY
	y,
	m ) num_pay WHERE num_pay.np = (SELECT MAX(num_pay.np) FROM  (SELECT
	YEAR(p.payment_date) y,
	month(p.payment_date) m,
	COUNT(1) np
FROM
	sakila.payment p
GROUP BY
	y,
	m ) num_pay)) 
	AND 
MONTH (r.rental_date) = (SELECT num_pay.m
FROM  (SELECT
	YEAR(p.payment_date) y,
	month(p.payment_date) m,
	COUNT(1) np
FROM
	sakila.payment p
GROUP BY
	y,
	m ) num_pay WHERE num_pay.np = (SELECT MAX(num_pay.np) FROM  (SELECT
	YEAR(p.payment_date) y,
	month(p.payment_date) m,
	COUNT(1) np
FROM
	sakila.payment p
GROUP BY
	y,
	m ) num_pay));


Final


SELECT
	num_pay.y 'year',
	num_pay.m 'month',
	max_num_rent.*
FROM
	(
	SELECT
		YEAR(p.payment_date) y,
		month(p.payment_date) m,
		COUNT(1) np
	FROM
		sakila.payment p
	GROUP BY
		y,
		m ) num_pay
JOIN 
(
	SELECT
		COUNT(1) max_num_rent
	FROM
		sakila.rental r
	WHERE
		YEAR(r.rental_date) = (
		SELECT
			num_pay.y
		FROM
			(
			SELECT
				YEAR(p.payment_date) y,
				month(p.payment_date) m,
				COUNT(1) np
			FROM
				sakila.payment p
			GROUP BY
				y,
				m ) num_pay
		WHERE
			num_pay.np = (
			SELECT
				MAX(num_pay.np)
			FROM
				(
				SELECT
					YEAR(p.payment_date) y,
					month(p.payment_date) m,
					COUNT(1) np
				FROM
					sakila.payment p
				GROUP BY
					y,
					m ) num_pay))
		AND 
MONTH (r.rental_date) = (
		SELECT
			num_pay.m
		FROM
			(
			SELECT
				YEAR(p.payment_date) y,
				month(p.payment_date) m,
				COUNT(1) np
			FROM
				sakila.payment p
			GROUP BY
				y,
				m ) num_pay
		WHERE
			num_pay.np = (
			SELECT
				MAX(num_pay.np)
			FROM
				(
				SELECT
					YEAR(p.payment_date) y,
					month(p.payment_date) m,
					COUNT(1) np
				FROM
					sakila.payment p
				GROUP BY
					y,
					m ) num_pay))
) max_num_rent
WHERE
	num_pay.np = (
	SELECT
		MAX(num_pay.np)
	FROM
		(
		SELECT
			YEAR(p.payment_date) y,
			month(p.payment_date) m,
			COUNT(1) np
		FROM
			sakila.payment p
		GROUP BY
			y,
			m ) num_pay);

