--1 
insert into film (title, rental_rate, rental_duration, language_id)
values('The Shawshank Redemption', '4.99', '14', '1');

--2
insert into actor (actor_id, first_name, last_name)
values
(300, 'Tim','Robbins'),
(301, 'Morgan','Freeman'),
(302, 'Bob','Gunton');

INSERT INTO film_actor (actor_id, film_id)
VALUES (300, (SELECT film_id FROM film WHERE title = 'The Shawshank Redemption')),
       (301, (SELECT film_id FROM film WHERE title = 'The Shawshank Redemption')),
       (302, (SELECT film_id FROM film WHERE title = 'The Shawshank Redemption'));

INSERT INTO inventory (film_id, store_id)
VALUES ((SELECT film_id FROM film WHERE title = 'The Shawshank Redemption'), 1);

--3
INSERT INTO film (title, rental_rate, rental_duration, language_id)
VALUES
  ('The Godfather', 4.99, 14, 1),
  ('Interstellar', 4.99, 14, 1),
  ('Bohemian Rhapsody', 4.99, 14, 1);
 
INSERT INTO inventory (film_id, store_id)
VALUES
  ((SELECT film_id FROM film WHERE title = 'The Godfather'), 1),
  ((SELECT film_id FROM film WHERE title = 'Interstellar'), 1),
  ((SELECT film_id FROM film WHERE title = 'Bohemian Rhapsody'), 1);
  
