Средняя продолжительность всех фильмов

SELECT AVG( f.`length`)  FROM sakila.film f;


SELECT
	COUNT(1)
FROM
	sakila.film f
WHERE
	f.`length` > (
	SELECT
		AVG( f.`length`)
	FROM
		sakila.film f);

