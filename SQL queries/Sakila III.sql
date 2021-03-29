/*How many customers are there for each country?  Have your result display the full country name and the number of customers for each country.*/
USE sakila;
SELECT country.country, count(customer.customer_id) AS total_number_of_customer FROM customer
LEFT JOIN address ON customer.address_id = address.address_id
LEFT JOIN city ON address.city_id = city.city_id
LEFT JOIN  country ON city.country_id = country.country_id
GROUP BY country
ORDER BY country;

/*How many customers are there for each city?  Have your result display the full city name, the full country name, as well as the number of customers for each city.*/
USE sakila;
SELECT country.country, city.city, count(address.address_id) AS total_number_of_customer FROM address
LEFT JOIN city ON address.city_id = city.city_id
LEFT JOIN  country ON city.country_id = country.country_id
GROUP BY city
ORDER BY country;
/*I figure out my mistake, I included customers, it's a tricky question "customer for each city" therefore I should look customer in city table and shouldn't join customer table*/

/*Retrieve both the average rental amount, the total rental amount, as well as the total number of transactions for each month of each year.*/
USE sakila;
SELECT concat(MONTHNAME(payment.payment_date),"-",YEAR(payment.payment_date)) AS month_and_year, sum(payment.amount) AS total_rental_amount, count(payment.amount) AS total_transaction, avg(payment.amount) AS average_rental_amount FROM payment
GROUP BY month_and_year
ORDER BY payment_date;

/*Your manager comes and asks you to pull payment report based on the hour of the day.  The managers wants to know which hour the company earns the most money/payment.  Have your sql query generate the top 10 hours of the day with the most sales.  Have the first row of your result be the hour with the most payments received.*/
USE sakila;
SELECT TIME_FORMAT(payment.payment_date,'%h %p') AS hour_of_the_day, sum(payment.amount) AS total_payment_received FROM payment
GROUP BY hour_of_the_day
ORDER BY total_payment_received DESC LIMIT 10;
