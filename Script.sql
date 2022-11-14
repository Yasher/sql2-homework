SELECT
	c.store_id
	#COUNT(1) col
FROM
	sakila.customer c
GROUP BY
	store_id 
HAVING COUNT(1)>300;

SELECT s.first_name , s.last_name  FROM sakila.staff s WHERE s.store_id = (SELECT
	c.store_id
FROM
	sakila.customer c
GROUP BY
	store_id 
HAVING COUNT(1)>300);



SELECT s.first_name , s.last_name  FROM sakila.staff s WHERE s.store_id = (SELECT
	c.store_id
FROM
	sakila.customer c
GROUP BY
	store_id 
HAVING COUNT(1)>300);





SELECT c.city, a.city_id,   FROM sakila.city c JOIN sakila.address a ON a.city_id = c.city_id ; 




LEFT JOIN st.store_id st ON st.store_id = a1.s ;
	;


#LEFT JOIN ( SELECT st.store_id FROM sakila.staff) st ON st.store_id = c.store_id ;

SELECT
	c.store_id,
	st.first_name,
	st.last_name
FROM
	sakila.customer c
JOIN sakila.staff st ON
	st.store_id = c.store_id ;

(SELECT
	c.store_id,
	s.address_id,
	a.city_id,
	c2.city,
	s2.first_name ,
	s2.last_name  
FROM
	sakila.customer c
LEFT JOIN sakila.store s ON
	s.store_id = c.store_id 
LEFT JOIN sakila.address a ON
a.address_id = s.address_id 
LEFT JOIN sakila.city c2 ON
c2.city_id = a.city_id 
LEFT JOIN sakila.staff s2 ON
s2.store_id = s.store_id) 
GROUP BY c.store_id ;