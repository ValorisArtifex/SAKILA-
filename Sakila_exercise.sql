SELECT first_name
FROM actor
WHERE  first_name = 'Scarlett'; 

SELECT last_name
FROM actor 
WHERE last_name = 'Johansson'; 

SELECT DISTINCT first_name 
FROM actor ; 

SELECT COUNT(last_name) 
FROM actor 
GROUP BY last_name; 

SELECT last_name
FROM actor
GROUP BY last_name
HAVING COUNT(*) = 1;

SELECT MAX(last_name)
FROM actor
GROUP BY last_name;
 
 SELECT 
    film_actor.actor_id,
    COUNT(DISTINCT film_actor.film_id) AS film_unique,
    actor.last_name,
    actor.first_name
FROM film_actor
JOIN actor 
  ON film_actor.actor_id = actor.actor_id
GROUP BY film_actor.actor_id, actor.last_name, actor.first_name;

SELECT film.film_id , film.title, store.store_id
FROM  film
JOIN store
ON film.film_id = store.store_id
WHERE film.title = 'Academy Dinosaur' AND store.store_id LIKE '1' ;

insert into rental (rental_date, inventory_id, customer_id, staff_id)
values (NOW(), 1, 1, 1);

SELECT AVG(length) AS avg_running_time
FROM film;

SELECT category.name, AVG(length) AS avg_running_time_category
FROM film
JOIN film_category ON film.film_id = film_category.film_id
JOIN category ON category.category_id = film_category.category_id
GROUP BY category.name





