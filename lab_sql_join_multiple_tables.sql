-- 1 Write a query to display for each store its store ID, city, and country.
select * from store;
select * from address;
select * from country;
select * from city;

select s.store_id, c.city, co.country
from store s
join address a
on s.address_id = a.address_id
join city c 
on a.city_id = c.city_id
join country co
on c.country_id = co.country_id;  

-- 2 Write a query to display how much business, in dollars, each store brought in.
select * from store;
select * from staff;
select * from payment;

select s.store_id, concat(sum(p.amount), " $") as "total"
from store s 
join staff st
on s.manager_staff_id = st.staff_id
join payment p 
on p.staff_id = st.staff_id
group by s.store_id;

-- 3 What is the average running time of films by category?
select * from film;

select c.name, avg(f.length)
from film f 
join film_category fc
on f.film_id = fc.film_id
join category c 
on c.category_id = fc.category_id
group by c.name;

-- 4 Which film categories are longest?
select c.name, avg(f.length) as "avg_length"
from film f 
join film_category fc
on f.film_id = fc.film_id
join category c 
on c.category_id = fc.category_id
group by c.name
order by "avg_length" desc 
limit 3;

-- 5 Display the most frequently rented movies in descending order.
select f.title, count(r.rental_id) as "rentals"
from film f 
join inventory i 
on f.film_id = i.film_id
join rental r 
on i.inventory_id = r.inventory_id
group by f.title
order by count(r.rental_id) desc;

-- 6 List the top five genres in gross revenue in descending order.

select sum(p.amount) as "total_revenue", c.name
from film f 
join inventory i 
on f.film_id = i.film_id
join rental r 
on i.inventory_id = r.inventory_id
join payment p
on p.rental_id = r.rental_id
join film_category fc
on f.film_id = fc.film_id
join category c 
on fc.category_id = c.category_id
group by c.name
order by sum(p.amount) desc
limit 5;

-- 7 Is "Academy Dinosaur" available for rent from Store 1?

select f.title, s.store_id
from film f
join inventory i 
on i.film_id = f.film_id
join staff s 
on s.store_id = i.store_id
where f.title = "academy dinosaur" and s.store_id = 1
group by f.title; 
