/*Retrieve customer information (all fields) where customer_id is 20*/
USE sakila;
SELECT * FROM customer WHERE customer_id = 20;

/*Retrieve customer information (all fields) where customer_id is BETWEEN 20 and 60*/
USE sakila;
SELECT * FROM customer WHERE customer_id BETWEEN 20 AND 60;

/*Retrieve customer information (all fields) WHERE first_name starts with L*/
USE sakila;
SELECT * FROM customer WHERE first_name LIKE 'L%';

/*Retrieve customer information (all fields) WHERE first_name includes L.*/
USE sakila;
SELECT * FROM customer WHERE first_name LIKE '%L%';

/*Retrieve customer information (all fields) WHERE first_name ends with L.*/
USE sakila;
SELECT * FROM customer WHERE first_name LIKE '%L';

/*Retrieve customer information (all fields) WHERE last_name starts with C and have the results be shown, starting with the record where it was created most recently.*/
USE sakila;
SELECT * FROM customer WHERE last_name LIKE 'C%' ORDER BY create_date;

/*Retrieve customer information (all fields) WHERE last_name includes NN.  Only have it retrieve the top 5 records, where the first record shown is the oldest customer (in terms of the create_date)*/
USE sakila;
SELECT * FROM customer WHERE last_name LIKE '%NN%' ORDER BY create_date DESC LIMIT 5;

/*Retrieve customer information (customer_id, first_name, last_name, and email address only) for customers with the following customer_id 515, 181, 582, 503, 29, 85.*/
USE sakila;
SELECT customer_id, first_name, last_name, email FROM customer WHERE customer_id IN (515, 181, 582, 503, 29, 85);

/*Retrieve customer information where store_id is 2.  Now when displaying the columns, instead of the column name be 'email', have it appear as 'email_address'.*/
USE sakila;
SELECT *, email AS email_Address FROM customer WHERE store_id =2;

/*Retrieve customer information (only the first_name, last_name, and email) but order the result with the email address in the DESC order.*/
USE sakila;
SELECT first_name, last_name, email FROM customer ORDER BY email DESC;

/*Retrieve only 'active' customer information (only the customer_id, first_name, last_name, and email) and where their record was created in the month of February.*/
USE sakila;
SELECT customer_id, first_name, last_name, email FROM customer WHERE MONTH(create_date) = 2;

/*Retrieve customer records (email field as well as email_length field) where the customer with the longest email address is shown first.  If customers have the same length of email address, order the list by the email field in the ASC order (meaning it shows email address that starts with 'A' first).*/
USE sakila;
SELECT email, LENGTH(email) AS email_length FROM customer;

/*Now retrieve top 100 customer records with the shortest email address.*/
USE sakila;
SELECT * FROM customer ORDER BY LENGTH(email) ASC LIMIT 100;

