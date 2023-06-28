-- 1. How many actors are there with the last name ‘Wahlberg’?
    -- 2, Nick and Daryl Wahlberg
     SELECT * 
     FROM actor
     WHERE last_name = 'Wahlberg';

-- 2. How many payments were made between $3.99 and $5.99?
    -- 1
    SELECT *
    FROM payment
    WHERE amount BETWEEN 3.99 AND 5.99;

-- 3. What film does the store have the most of? (search in inventory)
    -- Crossroads Casualities (and several others)
    SELECT film_id, COUNT(film_id)
    FROM inventory
    GROUP BY film_id
    ORDER BY COUNT(film_id) DESC;

    SELECT *
    FROM film
    WHERE film_id = 193;

-- 4. How many customers have the last name ‘William’?
    -- 1, Linda Williams
    SELECT first_name, last_name, COUNT(last_name)
    FROM customer
    WHERE last_name = 'Williams'
    GROUP BY first_name, last_name;

-- 5. What store employee (get the id) sold the most rentals?
    -- Mike Hillyer
    SELECT staff_id, COUNT(rental_id)
    FROM rental
    GROUP BY staff_id;

    SELECT first_name, last_name
    from staff
    WHERE staff_id = 1;

-- 6. How many different district names are there?
    -- 378
    SELECT COUNT(DISTINCT district) 
    FROM address;
    
-- 7. What film has the most actors in it? (use film_actor table and get film_id)
    -- Academy Dinosaur, 10
    select film_id, COUNT(DISTINCT actor_id)
    FROM film_actor
    GROUP BY film_id;

    SELECT *
    FROM film
    WHERE film_id = 1;

-- 8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)
    -- 13
    SELECT COUNT(DISTINCT customer_id)
    FROM customer
    WHERE store_id = 1 and last_name LIKE '%es';

-- 9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers
-- with ids between 380 and 430? (use group by and having > 250)
    -- 1257
    SELECT count(amount)
    FROM payment
    WHERE customer_id BETWEEN 380 AND 430
    GROUP BY rental_id > 250;



-- 10. Within the film table, how many rating categories are there? And what rating has the most movies total?
    -- 5, PG-13
    SELECT rating, COUNT(DISTINCT rating), COUNT(DISTINCT film_id) as film_count
    From film
    GROUP BY rating
    ORDER BY film_count DESC;
    

