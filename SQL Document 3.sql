-- Question One
-- List all customers who live in Texas (use JOINS)

select customer.first_name, customer.last_name, customer.email, district
from customer
inner join address
on customer.address_id = address.address_id
where district = 'Texas';

-- Question Two
-- Get all payments above $6.99 with the Customer's Full Name

select customer.first_name, customer.last_name, amount
from customer
inner join payment
on customer.customer_id = payment.customer_id
where amount > 6.99
order by amount desc;

-- Question Three
-- Show all customers names who have made payments over $175(use subqueries)
-- The directions didn't say the sum of payments, so I didn't do that

select first_name, last_name
from customer
where customer_id in (
	select customer_id 
	from payment
	where amount > 175
	order by amount
);

-- Question Four
-- List all customers that live in Nepal (use city table)

select customer.first_name, customer.last_name, country
from customer
inner join address
on customer.address_id = address.address_id
inner join city
on address.city_id = city.city_id
inner join country
on city.country_id = country.country_id
where country = 'Nepal';

-- Question Five
-- Which staff member had the most transactions?

select staff.staff_id, staff.first_name, staff.last_name, count(rental_id)
from staff
inner join rental
on staff.staff_id = rental.staff_id
group by staff.staff_id 
order by count(rental_id) desc;

--Question Six
--How many movies of each rating are there?
select rating, count(rating)
from film
group by rating 
order by count(rating) desc;

--Question Seven
-- Show all customers who have made a single payment above $6.99 (use subqueries)
select first_name, last_name
from customer
where customer_id in (
	select customer_id 
	from payment
	where amount > 6.99
	order by amount
);


-- Question Eight
-- How many rentals did our store give away?

select count(rental_id)
from rental
where rental_id in (
	select rental_id 
	from payment
	where amount is null
	
);

