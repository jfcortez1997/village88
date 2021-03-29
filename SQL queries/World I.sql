/* Get all the list of countries that are in the continent of Europe*/
USE world;
SELECT * FROM country WHERE continent = 'Europe';

/*Get all the list of countries that are in the continent of North America and Africa.*/
USE world;
SELECT * FROM country WHERE continent IN('North America', 'Africa');

/*Get all the list of cities that are part of a country with population greater than 100 millions*/
USE world;
SELECT country.Code AS country_code, country.Name AS country_name, country.continent, country.Population AS country_population, city.Name as city FROM country 
LEFT JOIN city ON country.Code = city.CountryCode
WHERE country.Population > 100000000
ORDER BY country.Name;

/*Get all the list of countries (display the full country name) who speak 'Spanish' as their language.*/
USE world;
SELECT country.Name, countrylanguage.Language AS language FROM country
LEFT JOIN countrylanguage ON country.Code = countrylanguage.CountryCode
WHERE countrylanguage.Language = 'Spanish';

/*Get all the list of countries (display the full country name) who speak 'Spanish' as their official language.*/
USE world;
SELECT country.Name, countrylanguage.Language AS language, countrylanguage.IsOfficial FROM country
LEFT JOIN countrylanguage ON country.Code = countrylanguage.CountryCode
WHERE countrylanguage.Language = 'Spanish' AND countrylanguage.IsOfficial = 'T';

/*Get all the list of countries (display the full country name) who speak either 'Spanish' or 'English' as their official language.*/
USE world;
SELECT country.Name, countrylanguage.Language AS language, countrylanguage.IsOfficial FROM country
LEFT JOIN countrylanguage ON country.Code = countrylanguage.CountryCode
WHERE countrylanguage.Language IN('Spanish','English') AND countrylanguage.IsOfficial = 'T';

/*Get all the list of countries (display the full country name) where 'Arabic' is spoken by more than 30% of the population but where it's not the country's official language.*/
USE world;
SELECT country.Name, countrylanguage.Language AS language, countrylanguage.IsOfficial language, countrylanguage.Percentage FROM country
LEFT JOIN countrylanguage ON country.Code = countrylanguage.CountryCode
WHERE countrylanguage.Language = 'Arabic' AND countrylanguage.Percentage>30 AND countrylanguage.IsOfficial = 'F';

/*Get all the list of countries (display the full country name) where 'French' is the official language but where less than 50% of the population in that country actually speaks that language.*/
USE world;
SELECT country.Name, countrylanguage.Language AS language, countrylanguage.IsOfficial, countrylanguage.Percentage FROM country
LEFT JOIN countrylanguage ON country.Code = countrylanguage.CountryCode
WHERE countrylanguage.Language = 'French' AND countrylanguage.Percentage<50 AND countrylanguage.IsOfficial = 'T';

/* Get all the list of countries (display the full country name and the full language name) and their official 
language. Order the result so that those with the same official language are shown together.*/
USE world;
SELECT country.Name, countrylanguage.Language AS language, countrylanguage.IsOfficial FROM country
LEFT JOIN countrylanguage ON country.Code = countrylanguage.CountryCode
WHERE countrylanguage.IsOfficial = 'T'
ORDER BY countrylanguage.Language;

/*Get the top 100 cities with the most population. Display the city's full country name also as well as their official language.*/
USE world;
SELECT country.Name, city.Name AS city, countrylanguage.Language AS language, countrylanguage.IsOfficial FROM country
LEFT JOIN countrylanguage ON country.Code = countrylanguage.CountryCode
LEFT JOIN city ON country.Code = city.CountryCode
WHERE countrylanguage.IsOfficial = 'T'
ORDER BY city.Population DESC LIMIT 100;

/*Get the top 100 cities with the most population where the life_expectancy for the country is less than 40.*/
USE world;
SELECT country.Name AS country, country.LifeExpectancy, city.Name AS city, city.Population FROM country
LEFT JOIN city ON country.Code = city.CountryCode
WHERE country.LifeExpectancy < 40
ORDER BY city.Population DESC LIMIT 100;

/*Get the top 100 countries who speak English and where life expectancy is highest. Show the country with the 
highest life expectancy first*/
USE world;
SELECT country.Name AS country, city.Name AS city, country.LifeExpectancy FROM country
LEFT JOIN countrylanguage ON country.Code = countrylanguage.CountryCode
LEFT JOIN city ON country.Code = city.CountryCode
WHERE countrylanguage.Language = 'English'
ORDER BY country.LifeExpectancy DESC LIMIT 100;
