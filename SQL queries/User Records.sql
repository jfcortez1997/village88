/* What's the query for creating this new database table with the fields above? */ 
CREATE TABLE hackerhero_practice.users (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(255) NULL,
  last_name VARCHAR(255) NULL,
  email VARCHAR(255) NULL,
  encrypted_password VARCHAR(255) NULL,
  created_at DATETIME NULL,
  updated_at DATETIME NULL
);

/*What's the query for inserting new records into this table?  Write queries for inserting three fake users into the table (one query for each insert).*/
INSERT INTO hackerhero_practice.users 
(id, first_name, last_name, email, encrypted_password) 
VALUES ('1', 'Antonio', 'Saavedra', 'AntoniodelValleSaavedra@yahoo.com', 'advs123456'),
(2, 'Lars', 'Peterson', 'LarsPeterson@yahoo.com', 'LarsTheGreat'),
(3, 'Beate', 'Vileid', 'BeateVileid@yahoo.com', 'beateAndTheBeast');

/*What's the query for updating one of the user records?  For example, if you wanted to update the user record for id = 1, with some fake data, what would the query be?*/
UPDATE hackerhero_practice.users SET id = '4' WHERE (id = '1');

/*What query would you run for updating all of the user records with the last_name of 'Choi'?*/
UPDATE hackerhero_practice.users SET last_name = 'Kors' WHERE (last_name = 'Choi');

/*What query would you run for updating all the user records where ID is 3, 5, 7, 12, or 19?*/
UPDATE hackerhero_practice.users SET created_at = '2021-03-23 16:51:59' WHERE id IN('3','5','7','12','19');

/*What's the query for deleting a user record where id = 1?*/
DELETE FROM hackerhero_practice.users WHERE id = 1;

/*What's the query for deleting the entire users records in the users table?*/
DELETE FROM hackerhero_practice.users; 

/*What's the query for dropping the entire users table?*/
DROP TABLE hackerhero_practice.users3; 
/*What's the difference between dropping the table and deleting all records?*/
/*DROP will delete fields and data while DELETE will clear only the data not the retaining the column fields*/

/*What's the query for altering the email field to have it be 'email_address' instead?*/
ALTER TABLE hackerhero_practice.users
RENAME COLUMN email TO email_address;

/*What's the query for altering the id so that it's a BIGINT instead?*/
ALTER TABLE hackerhero_practice.users 
CHANGE COLUMN `id` `id` BIGINT AUTO_INCREMENT NOT NULL;
/*CHANGE COLUMN [from] [to] [datatype]*/ /*note that we need to declare again the data type*/

/*What's the query for adding a new field to the users table called is_active where it's a Boolean (meaning it's either a 0 or a 1).  Imagine you wanted the default value of this to be 0 when a new record is created and you won't allow this field to ever be NULL.  With this in mind, now come up with a query.*/
ALTER TABLE hackerhero_practice.users
ADD  is_active BOOLEAN NOT NULL DEFAULT 0;

/*Others*/
ALTER TABLE hackerhero_practice.users
DROP COLUMN  first_name1;

SELECT * FROM hackerhero_practice.users; 
/*PRIMARY KEY (idnew_table));*/
/**/