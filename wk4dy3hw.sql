--List all customers who live in Texas (use JOINs)

SELECT first_name, last_name, district
FROM customer
INNER JOIN address
ON customer.address_id = address.address_id
WHERE district = 'Texas';

--Get all payments above $6.99 with the Customer's FullName
SELECT first_name, last_name, customer_id 
FROM customer
WHERE customer_id IN (
    SELECT customer_id
    FROM payment
    GROUP BY customer_id
    HAVING MIN(amount) = 6.99
); 

--Show all customers names who have made payments over $175(use subqueries)
SELECT first_name, last_name
FROM customer
WHERE customer_id IN (
    SELECT customer_id
    FROM payment
    GROUP BY customer_id
    HAVING sum(amount)>175
    ORDER BY sum(amount) DESC
);

--List all customers that live in Nepal (use the city table)
SELECT first_name, last_name
FROM customer
INNER JOIN address
ON customer.address_id = address.address_id
INNER JOIN city
ON address.city_id = city.city_id
INNER JOIN country
ON country.country_id = city.country_id
WHERE country = 'Nepal';

--Which staff member had the most transactions?
--Employee 1
SELECT staff_id, COUNT(staff_id)
FROM rental
GROUP BY staff_id
ORDER BY staff_id

--How many movies of each rating are there?
SELECT rating, COUNT(rating)
FROM film
GROUP BY rating
ORDER BY rating;


--7.Show all customers who have made a single payment
--above $6.99 (Use Subqueries)

SELECT first_name, last_name
FROM customer
WHERE customer_id IN (
    SELECT customer_id,
    FROM payment
    GROUP BY customer_id
    HAVING MIN(amount) = 6.99
    ORDER BY COUNT(amount) = 1 
);

