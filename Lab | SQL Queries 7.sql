	#1 Which last names are not repeated?
select last_name, count(last_name) as "number of apparences" from sakila.actor
group by last_name
having count(last_name) = 1;

	#2 Which last names appear more than once?
select last_name, count(last_name) as "number of apparences" from sakila.actor
group by last_name
having count(last_name) > 1;

	#3 Rentals by employee.
select staff_id, count(staff_id) as "number of films" from sakila.rental
group by staff_id;

	#4 Films by year.
select release_year, count(release_year) as "number of films" from sakila.film
group by release_year;

	#5 Films by rating.
select rating, count(rating) as "number of films" from sakila.film
group by rating;

	#6 Mean length by rating.
select rating, round(avg(length))  as "avg length"
from sakila.film
group by rating;

	#7 Which kind of movies (rating) have a mean duration of more than two hours?
select rating, round(avg(length)) as "avg_length"
from sakila.film
group by rating
having avg_length >= 120;

	#8 List movies and add information of average duration for their rating and original language.
Select title, language_id, rating, round(avg(length)) as avg_length
from sakila.film
group by title, language_id, rating;

select title, language_id, rating, avg(length) over (partition by title)
from sakila.film;

	#9 Which rentals are longer than  expected?
Select rental_id, datediff(return_date, rental_date) as 'Rental length'
from sakila.rental;
