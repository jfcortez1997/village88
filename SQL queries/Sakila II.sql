/*Get all the list of customers.*/
USE sakila;
SELECT * FROM customer;

/*Get all the list of customers as well as their address.*/
USE sakila;
SELECT concat(customer.first_name," ",customer.last_name) AS customer_name, address.address FROM customer
LEFT JOIN address ON address.address_id = customer.address_id;

/*Get all the list of customers as well as their address and the city name.*/
USE sakila;
SELECT concat(customer.first_name," ",customer.last_name) AS customer_name, address.address, city.city FROM customer
LEFT JOIN address ON address.address_id = customer.address_id
LEFT JOIN city ON city.city_id = address.city_id;

/*Get all the list of customers as well as their address, city name, and the country.*/
USE sakila;
SELECT concat(customer.first_name," ",customer.last_name) AS customer_name, address.address, city.city, country.country FROM customer
LEFT JOIN address ON address.address_id = customer.address_id
LEFT JOIN city ON city.city_id = address.city_id
LEFT JOIN country ON country.country_id = city.country_id
ORDER BY country.country;

/*Get all the list of customers who live in Bolivia*/
USE sakila;
SELECT concat(customer.first_name," ",customer.last_name) AS customer_name, address.address, city.city, country.country FROM customer
LEFT JOIN address ON address.address_id = customer.address_id
LEFT JOIN city ON city.city_id = address.city_id
LEFT JOIN country ON country.country_id = city.country_id 
WHERE country.country = 'Bolivia';

/*Get all the list of customers who live in Bolivia, Germany and Greece*/
USE sakila;
SELECT concat(customer.first_name," ",customer.last_name) AS customer_name, address.address, city.city, country.country FROM customer
LEFT JOIN address ON address.address_id = customer.address_id
LEFT JOIN city ON city.city_id = address.city_id
LEFT JOIN country ON country.country_id = city.country_id 
WHERE country.country IN('Bolivia', 'Germany', 'Greece');

/*Get all the list of customers who live in the city of Baku.*/
USE sakila;
SELECT concat(customer.first_name," ",customer.last_name) AS customer_name, address.address, city.city, country.country FROM customer
LEFT JOIN address ON address.address_id = customer.address_id
LEFT JOIN city ON city.city_id = address.city_id
LEFT JOIN country ON country.country_id = city.country_id 
WHERE city.city = 'Baku';

/*Get all the list of customers who live in the city of Baku, Beira, and Bergamo.*/
USE sakila;
SELECT concat(customer.first_name," ",customer.last_name) AS customer_name, address.address, city.city, country.country FROM customer
LEFT JOIN address ON address.address_id = customer.address_id
LEFT JOIN city ON city.city_id = address.city_id
LEFT JOIN country ON country.country_id = city.country_id 
WHERE city.city IN('Baku', 'Beira', 'Bergamo');

/*Get all the list of customers who live in a country where the country name's length is less than 5.  Show the customer with the longest full name first.*/
USE sakila;
SELECT concat(customer.first_name," ",customer.last_name) AS customer_name, country.country, LENGTH(country.country) AS country_name_length, LENGTH(concat(customer.first_name," ",customer.last_name)) AS full_name_length FROM customer
LEFT JOIN address ON address.address_id = customer.address_id
LEFT JOIN city ON city.city_id = address.city_id
LEFT JOIN country ON country.country_id = city.country_id 
WHERE LENGTH(country.country) < 5
ORDER BY LENGTH(Concat(customer.first_name,customer.last_name)) DESC;

/*Get all the list of customers who live in a city name whose length is more than 10.  Order the result so that the customers who live in the same country are shown together.*/
USE sakila;
SELECT concat(customer.first_name," ",customer.last_name) AS customer_name, country.country, city.city, LENGTH(city.city) AS city_name_length FROM customer
LEFT JOIN address ON address.address_id = customer.address_id
LEFT JOIN city ON city.city_id = address.city_id
LEFT JOIN country ON country.country_id = city.country_id 
WHERE LENGTH(city.city) > 10
ORDER BY country.country;

/*Get all the list of customers who live in a city where the city name includes the word 'ba'.  For example Arratuba or Baiyin  should show up in your result.*/
USE sakila;
SELECT concat(customer.first_name," ",customer.last_name) AS customer_name, city.city FROM customer
LEFT JOIN address ON address.address_id = customer.address_id
LEFT JOIN city ON city.city_id = address.city_id
WHERE city.city LIKE '%BA%';

/*Get all the list of customers where the city name includes a space.  Order the result so that customers who live in the longest city are shown first.*/
USE sakila;
SELECT concat(customer.first_name," ",customer.last_name) AS customer_name, city.city, LENGTH(city.city) AS city_name_length FROM customer
LEFT JOIN address ON address.address_id = customer.address_id
LEFT JOIN city ON city.city_id = address.city_id
WHERE city.city LIKE '% %'
ORDER BY LENGTH(city.city) DESC;

/*Get all the customers where the country name is longer than the city name.*/
USE sakila;
SELECT concat(customer.first_name," ",customer.last_name) AS customer_name, city.city, country.country, LENGTH(city.city) AS city_name_length, LENGTH(country.country) AS country_name_length FROM customer
LEFT JOIN address ON address.address_id = customer.address_id
LEFT JOIN city ON city.city_id = address.city_id
LEFT JOIN country ON country.country_id = city.country_id 
WHERE LENGTH(city.city) < LENGTH(country.country);


