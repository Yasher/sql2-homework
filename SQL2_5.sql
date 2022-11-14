ID фильмов, которые брали в аренду


SELECT i.film_id  FROM  sakila.rental r 
JOIN 
sakila.inventory i ON i.inventory_id = r.inventory_id ;


Список id всех фильмов

SELECT f.film_id  FROM sakila.film f ;


#Final

SELECT
	f.title
FROM
	sakila.film f
WHERE
	f.film_id NOT IN (
	SELECT
		i.film_id
	FROM
		sakila.rental r
	JOIN 
sakila.inventory i ON
		i.inventory_id = r.inventory_id);