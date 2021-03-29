/*Hint: Here is an example of a query that selects data between a date range
SELECT Date,TotalAllowance FROM Calculation WHERE EmployeeId=1 AND Date >= '2011/02/25' AND Date < '2011/02/28';*/

/*1. What query would you run to get the total revenue for March of 2012?*/
USE lead_gen_business;
SELECT MONTHNAME(billing.charged_datetime) AS month, sum(billing.amount) as revenue FROM billing WHERE MONTH(billing.charged_datetime)= '3' AND YEAR(billing.charged_datetime)= '2012'
GROUP BY MONTH(billing.charged_datetime);

/*2. What query would you run to get total revenue collected from the client with an id of 2?*/
USE lead_gen_business;
SELECT client_id, sum(billing.amount) as total_revenue FROM billing WHERE client_id = '2'
GROUP BY client_id;

/*3. What query would you run to get all the sites that client=10 owns?*/
USE lead_gen_business;
SELECT sites.domain_name, sites.client_id FROM sites WHERE sites.client_id=10;

/*4. What query would you run to get total # of sites created per month per year for the client with an id of 1? */
USE lead_gen_business;
SELECT client_id, COUNT(DATE_FORMAT(sites.created_datetime, "%M %Y")) AS number_of_website, MONTHNAME(sites.created_datetime) AS month_created, YEAR(sites.created_datetime) AS year_created FROM sites WHERE sites.client_id=1
GROUP BY DATE_FORMAT(sites.created_datetime, "%M %Y");

/*What about for client=20?*/
USE lead_gen_business;
SELECT client_id, COUNT(DATE_FORMAT(sites.created_datetime, "%M %Y")) AS number_of_website, MONTHNAME(sites.created_datetime) AS month_created, YEAR(sites.created_datetime) AS year_created FROM sites WHERE sites.client_id=20
GROUP BY DATE_FORMAT(sites.created_datetime, "%M %Y");


/*5. What query would you run to get the total # of leads generated for each of the sites between January 1, 2011 to February 15, 2011?*/
USE lead_gen_business;
SELECT sites.domain_name AS website, count(leads.site_id) AS number_of_leads, DATE_FORMAT(leads.registered_datetime, '%M %d, %Y') AS date_generated FROM sites
LEFT JOIN leads ON leads.site_id = sites.site_id
WHERE registered_datetime>'2011/01/01' AND registered_datetime<'2011/02/15'
GROUP BY date_generated;

/*6. What query would you run to get a list of client names and the total # of leads we've generated for each of our clients between January 1, 2011 to December 31, 2011?*/
USE lead_gen_business;
SELECT CONCAT(clients.first_name,' ',clients.last_name) as client_name, COUNT(leads.site_id) AS total_leads FROM clients
LEFT JOIN sites ON sites.client_id = clients.client_id
LEFT JOIN leads ON leads.site_id = sites.site_id
WHERE leads.registered_datetime>'2011/01/01' AND leads.registered_datetime<'2011/12/31'
GROUP BY client_name;
/* same but different order*/

/*7. What query would you run to get a list of client names and the total # of leads we've generated for each client each month between months 1 - 6 of Year 2011?*/
USE lead_gen_business;
SELECT CONCAT(clients.first_name,' ',clients.last_name) as client_name, COUNT(clients.client_id) AS number_of_leads, MONTHNAME(leads.registered_datetime) AS month_generated, YEAR(leads.registered_datetime) AS year_generated FROM leads
LEFT JOIN sites ON sites.site_id = leads.site_id
LEFT JOIN clients ON clients.client_id = sites.client_id
WHERE MONTH(leads.registered_datetime) >= 1 AND MONTH(leads.registered_datetime) <= 6 AND YEAR(leads.registered_datetime) = 2011
GROUP BY registered_datetime;

/*8. What query would you run to get a list of client names and the total # of leads we've generated for each of our clients' sites between January 1, 2011 to December 31, 2011? Order this query by client id.*/ 
USE lead_gen_business;
SELECT CONCAT(clients.first_name,' ',clients.last_name) AS client_name, sites.domain_name AS website, COUNT(leads.site_id) AS number_of_leads, DATE_FORMAT(leads.registered_datetime, '%M %D, %Y') AS date_generated FROM leads
LEFT JOIN sites ON sites.site_id = leads.site_id
LEFT JOIN clients ON clients.client_id = sites.client_id
WHERE leads.registered_datetime > '2011/01/01' AND leads.registered_datetime < '2011/12/31'
GROUP BY website
ORDER BY clients.client_id;

/*Come up with a second query that shows all the clients, the site name(s), and the total number of leads generated from each site for all time.*/
USE lead_gen_business;
SELECT CONCAT(clients.first_name,' ',clients.last_name) AS client_name, sites.domain_name AS website, COUNT(leads.site_id) AS number_of_leads FROM leads
LEFT JOIN sites ON sites.site_id = leads.site_id
LEFT JOIN clients ON clients.client_id = sites.client_id
GROUP BY website;

/*9. Write a single query that retrieves total revenue collected from each client for each month of the year. Order it by client id.*/
USE lead_gen_business;
SELECT CONCAT(clients.first_name,' ',clients.last_name) AS client_name, billing.amount as revenue, DATE_FORMAT(billing.charged_datetime, '%M') AS month_charge, YEAR(billing.charged_datetime) AS year_charge FROM leads
LEFT JOIN sites ON sites.site_id = leads.site_id
LEFT JOIN clients ON clients.client_id = sites.client_id
LEFT JOIN billing ON billing.client_id = clients.client_id
GROUP BY client_name, month_charge, year_charge
ORDER BY client_name DESC, month_charge, year_charge;

/*10. Write a single query that retrieves all the sites that each client owns. Group the results so that each row shows a new client. It will become clearer when you add a new field called 'sites' that has all the sites that the client owns. (HINT: use GROUP_CONCAT)*/
SELECT CONCAT(clients.first_name,' ',clients.last_name) AS client_name, GROUP_CONCAT(DISTINCT sites.domain_name SEPARATOR ' / ') AS sites FROM leads
LEFT JOIN sites ON sites.site_id = leads.site_id
LEFT JOIN clients ON clients.client_id = sites.client_id
LEFT JOIN billing ON billing.client_id = clients.client_id
GROUP BY client_name;

