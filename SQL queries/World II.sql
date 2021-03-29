/*Part 1*/
/*1. How many country in each continent, have life expectancy greater than 70?*/
USE world;
SELECT country.Continent AS continent, count(country.Continent) AS total_country, country.LifeExpectancy as life_expectancy FROM country 
WHERE LifeExpectancy > 70 
GROUP BY Continent;

/*2. How many country in each continent have life expectancy between 60 and 70?*/
USE world;
SELECT country.Continent AS continent, count(country.Continent) AS total_country, country.LifeExpectancy as life_expectancy FROM country 
WHERE LifeExpectancy > 60 AND LifeExpectancy < 70
GROUP BY Continent;

/*3. How many country have life expectancy greater than 75?*/
USE world;
SELECT country.Name AS country, country.LifeExpectancy as life_expectancy FROM country 
WHERE LifeExpectancy > 75;

/*4. How many country have life expectancy less than 40?*/
USE world;
SELECT country.Name AS country, country.LifeExpectancy as life_expectancy FROM country 
WHERE LifeExpectancy < 40;

/*5 How many people live in the top 10 country with the most population?*/
USE world;
SELECT country.Name AS country, country.Population as population FROM country 
ORDER BY Population DESC LIMIT 10;

/*6. According to the world database, how many people are there in the world?*/
USE world;
SELECT sum(country.Population) AS world_population FROM country;

/*7. Show results for continents where it shows the continent name and the total population.  Only show results where the total_population for the continent is more than 500,000,000.  If. the continent doesn't have 500,000,000 people, do NOT show the result.*/
USE world;
SELECT country.Continent AS continent, sum(country.Population) AS total_population FROM country
GROUP BY continent
HAVING total_population > 500000000;

/*8. Show results of all continents that has average life expectancy for the continent to be less than 71.  Show each of these continent name, how many country there are in each of the continent, total population for the continent, as well as the life expectancy of this continent.  For example, as Europe and North America both have continent life expectancy greater than 71, these continents shouldn't show up in your sql results.*/
USE world;
SELECT country.Continent AS continent, count(country.Name) AS total_country, SUM(country.Population) AS total_population, AVG(country.LifeExpectancy) AS average_life_expectancy FROM country
GROUP BY continent
HAVING average_life_expectancy < 71;

/*Part 2*/
/*How many cities are there for each of the country?  Show the total city count for each country where you display the full country name.*/
USE world;
SELECT country.Name AS country, count(city.Name) AS number_of_cities FROM country
LEFT JOIN city ON country.Code = city.CountryCode
GROUP BY country;

/*For each language, find out how many country speak each language.*/
USE world;
SELECT countrylanguage.Language AS language, COUNT(country.Name) AS number_of_countries FROM countrylanguage
LEFT JOIN country ON countrylanguage.CountryCode = country.Code
GROUP BY language;

/*For each language, find out how many country use that language as the official language.*/
USE world;
SELECT countrylanguage.Language AS language, COUNT(country.Name) AS number_of_countries, countrylanguage.IsOfficial FROM countrylanguage
LEFT JOIN country ON countrylanguage.CountryCode = country.Code
WHERE countrylanguage.IsOfficial = 'T'
GROUP BY language;

/*For each continent, find out how many cities there are (according to this database) and the average population of the cities for each continent. */
USE world;
SELECT country.Continent as continent, COUNT(city.Name) AS number_of_cities, AVG(city.Population) AS average_cities_population FROM country 
LEFT JOIN city ON country.Code = city.CountryCode
GROUP BY continent;

/*For example, for continent A, have it state the number of cities for that continent, and the average city population for that continent.
(Advanced) Find out how many people in the world speak each language.  Make sure the total sum of. this number is comparable to the total population in the */
USE world;
SELECT countrylanguage.Language, SUM(country.Population*countrylanguage.Percentage)/100 AS total_population from countrylanguage 
LEFT JOIN country ON country.Code = countrylanguage.CountryCode
GROUP BY Language
ORDER BY total_population DESC;
