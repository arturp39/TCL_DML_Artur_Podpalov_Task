--1
UPDATE film
SET
  rental_duration = 3,
  rental_rate = 9.99
WHERE
  film_id IN ((SELECT film_id FROM film WHERE title = 'The Godfather'),
  (SELECT film_id FROM film WHERE title = 'Interstellar'),
  (SELECT film_id FROM film WHERE title = 'Bohemian Rhapsody'));
--2
WITH UpdateCustomer AS (
  SELECT
    c.customer_id
  FROM
    customer c
    JOIN rental r ON c.customer_id = r.customer_id
    JOIN payment p ON c.customer_id = p.customer_id
  GROUP BY
    c.customer_id
  having
  	COUNT(DISTINCT r.rental_id) >= 10
    AND COUNT(DISTINCT p.payment_id) >= 10
  LIMIT 1
)

UPDATE customer
SET
  first_name = 'Artur',
  last_name = 'Podpalov',
  email = 'arturpodpalov@gmail.com',
  address_id = (SELECT address_id FROM address ORDER BY random() LIMIT 1)
WHERE
  customer_id IN (SELECT customer_id FROM UpdateCustomer);
 
--3
WITH UpdateCustomer AS (
  SELECT
    c.customer_id
  FROM
    customer c
    JOIN rental r ON c.customer_id = r.customer_id
    JOIN payment p ON c.customer_id = p.customer_id
  GROUP BY
    c.customer_id
  HAVING
    COUNT(DISTINCT r.rental_id) >= 10
    AND COUNT(DISTINCT p.payment_id) >= 10
  LIMIT 1
)
update customer
set
  create_date = current_date
where
  customer_id in (select customer_id from UpdateCustomer);