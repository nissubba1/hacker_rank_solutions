-- This is my solutions to Hacker Rank problem sets for SQL
-- Everything is written in Oracle SQL
-- By Nishan Subba
-- The solution here might be out of order

-- ***************************** EASY *****************************
-- Revising the Select Query I
-- Query all columns for all American cities in the CITY table with populations larger than 100000. The CountryCode for America is USA.
SELECT *
FROM CITY
WHERE population > 100000
AND CountryCode = 'USA';

-- Revising the Select Query I
-- Query the NAME field for all American cities in the CITY table with populations larger than 120000. The CountryCode for America is USA.
SELECT NAME
FROM CITY
WHERE POPULATION > 120000
AND COUNTRYCODE = 'USA';

-- Select All
-- Query all columns (attributes) for every row in the CITY table.
SELECT *
FROM CITY;

-- Select By ID
-- Query all columns for a city in CITY with the ID 1661.
SELECT *
FROM CITY
WHERE ID = 1661;

-- Japanese Cities' Attributes
-- Query all attributes of every Japanese city in the CITY table. The COUNTRYCODE for Japan is JPN.
SELECT *
FROM CITY
WHERE COUNTRYCODE = 'JPN';

-- Japanese Cities' Names
-- Query the names of all the Japanese cities in the CITY table. The COUNTRYCODE for Japan is JPN.
SELECT NAME
FROM CITY
WHERE COUNTRYCODE = 'JPN';

-- Weather Observation Station 1
-- Query a list of CITY and STATE from the STATION table.
SELECT CITY, STATE
FROM STATION;

-- Weather Observation Station 3
-- Query a list of CITY names from STATION for cities that have an even ID number. Print the results in any order, but exclude duplicates from the answer.
SELECT DISTINCT CITY
FROM STATION
WHERE MOD(ID, 2) = 0;

-- Weather Observation Station 4
-- Find the difference between the total number of CITY entries in the table and the number of distinct CITY entries in the table.
SELECT COUNT(*) -  COUNT (DISTINCT CITY)
FROM STATION;

-- Weather Observation Station 5
-- Query the two cities in STATION with the shortest and longest CITY names, as well as their respective lengths (i.e.: number of characters in the name). If there is more than one smallest or largest city, choose the one that comes first when ordered alphabetically.
SELECT MIN(CITY), LENGTH(CITY) FROM STATION
GROUP BY CITY
ORDER BY LENGTH(CITY) ASC
LIMIT 1;

SELECT MAX(CITY), LENGTH(CITY) FROM STATION
GROUP BY CITY
ORDER BY LENGTH(CITY) DESC
LIMIT 1;

-- Weather Observation Station 6
-- Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) from STATION. Your result cannot contain duplicates.
SELECT DISTINCT CITY
FROM STATION
WHERE CITY LIKE UPPER('a%')
OR CITY LIKE UPPER('e%')
OR CITY LIKE UPPER('i%')
OR CITY LIKE UPPER('o%')
OR CITY LIKE UPPER('u%');

-- Weather Observation Station 7
-- Query the list of CITY names ending with vowels (a, e, i, o, u) from STATION. Your result cannot contain duplicates.
SELECT DISTINCT CITY
FROM STATION
WHERE CITY LIKE '%a'
OR CITY LIKE '%e'
OR CITY LIKE '%i'
OR CITY LIKE '%o'
OR CITY LIKE '%u';

-- Weather Observation Station 8
-- Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) as both their first and last characters. Your result cannot contain duplicates.
SELECT DISTINCT CITY
FROM STATION
WHERE REGEXP_LIKE (CITY, '^[AEIOU]')
AND REGEXP_LIKE (CITY, '[aeiou]$');

-- Weather Observation Station 9
-- Query the list of CITY names from STATION that do not start with vowels. Your result cannot contain duplicates.
SELECT DISTINCT CITY
FROM STATION
WHERE REGEXP_Like(City, '^[^A,E,I,O,U].*');

-- Employee Names
-- Write a query that prints a list of employee names (i.e.: the name attribute) from the Employee table in alphabetical order.
SELECT name
FROM employee
ORDER BY name ASC;

-- Employee Salaries
-- Write a query that prints a list of employee names (i.e.: the name attribute) for employees in Employee having a salary greater than  per month who have been employees for less than 10 months. Sort your result by ascending employee_id.
SELECT name
FROM employee
WHERE salary > 2000
AND months < 10
ORDER BY employee_id ASC;

-- Revising Aggregations - The Count Function
-- Query a count of the number of cities in CITY having a Population larger than 100,000.
SELECT count(*)
FROM city
WHERE population > 100000;

-- Revising Aggregations - The Sum Function
-- Query the total population of all cities in CITY where District is California.
SELECT SUM(population)
FROM city
WHERE district = 'California';

-- Revising Aggregations - Averages
-- Query the average population of all cities in CITY where District is California.
SELECT AVG(population)
FROM city
WHERE district = 'California';

-- Average Population
-- Query the average population for all cities in CITY, rounded down to the nearest integer.
SELECT ROUND(avg(population))
FROM city;

-- Japan Population
-- Query the sum of the populations for all Japanese cities in CITY. The COUNTRYCODE for Japan is JPN.
SELECT SUM(population)
FROM city
WHERE countrycode = 'JPN';

-- Population Density Difference
-- Query the difference between the maximum and minimum populations in CITY.
SELECT (MAX(population) - MIN(population))
FROM city;

-- Weather Observation Station 10
-- Query the list of CITY names from STATION that do not end with vowels. Your result cannot contain duplicates.
SELECT DISTINCT city
FROM station
WHERE REGEXP_LIKE(city, '^.*[^a,e,i,o,u]$');

-- Weather Observation Station 11
-- Query the list of CITY names from STATION that either do not start with vowels or do not end with vowels. Your result cannot contain duplicates.
SELECT DISTINCT city
FROM station
WHERE REGEXP_LIKE(city, '^[^AEIOUaeiou]')
OR REGEXP_LIKE(city, '[^AEIOUaeiou]$');

-- Weather Observation Station 12
-- Query the list of CITY names from STATION that do not start with vowels and do not end with vowels. Your result cannot contain duplicates.
SELECT DISTINCT city
FROM station
WHERE REGEXP_LIKE(city, '^[^AEIOUaeiou].*[^aeiouAEIOU]$');

-- Higher Than 75 Marks
-- Query the Name of any student in STUDENTS who scored higher than 75 Marks. Order your output by the last three characters of each name. If two or more students both have names ending in the same last three characters (i.e.: Bobby, Robby, etc.), secondary sort them by ascending ID.
SELECT name
FROM students
WHERE marks > 75
ORDER BY substr(name, -3), id ASC;

-- Weather Observation Station 14
-- Query the greatest value of the Northern Latitudes (LAT_N) from STATION that is less than 137.2345. Truncate your answer to  decimal places.
SELECT TRUNC(MAX(lat_n), 4)
FROM station
WHERE lat_n < 137.2345;

-- Population Census
-- Given the CITY and COUNTRY tables, query the sum of the populations of all cities where the CONTINENT is 'Asia'.
SELECT sum(city.population)
FROM city, country
WHERE city.countrycode = country.code
AND continent = 'Asia';

-- African Cities
-- Given the CITY and COUNTRY tables, query the names of all cities where the CONTINENT is 'Africa'.
SELECT city.name
FROM city
INNER JOIN country
ON city.countrycode = country.code
WHERE continent = 'Africa';

-- Average Population of Each Continent
-- Given the CITY and COUNTRY tables, query the names of all the continents (COUNTRY.Continent) and their respective average city populations (CITY.Population) rounded down to the nearest integer.
SELECT continent,
	floor(avg(city.population))
FROM city, country
WHERE city.countrycode = country.code
GROUP BY continent;

-- Weather Observation Station 2
-- Query the following two values from the STATION table:
-- The sum of all values in LAT_N rounded to a scale of 2 decimal places.
-- The sum of all values in LONG_W rounded to a scale of 2 decimal places.
SELECT ROUND(sum(lat_n), 2),
	ROUND(sum(long_w), 2)
FROM station;

-- Weather Observation Station 13
-- Query the sum of Northern Latitudes (LAT_N) from STATION having values greater than 38.7880 and less than 137.2345. Truncate your answer to 4 decimal places.
SELECT trunc(sum(lat_n), 4)
FROM station
WHERE lat_n BETWEEN 38.7880 AND 137.2345;

-- Type of Triangle
-- Write a query identifying the type of each record in the TRIANGLES table using its three side lengths. Output one of the following statements for each record in the table:
-- Equilateral: It's a triangle with  sides of equal length.
-- Isosceles: It's a triangle with  sides of equal length.
-- Scalene: It's a triangle with  sides of differing lengths.
-- Not A Triangle: The given values of A, B, and C don't form a triangle.
SELECT
    CASE
        WHEN a = b AND b = c THEN
            'Equilateral'
        WHEN (a = b AND a + b > c) OR (b = c AND b + c > a ) OR (a = c AND a + c > b) THEN
            'Isosceles'
        WHEN a + b <= c  THEN
            'Not A Triangle'
        ELSE
            'Scalene'
    END AS triangles_
FROM triangles;

-- Draw The Triangle 1
-- P(R) represents a pattern drawn by Julia in R rows. The following pattern represents P(5):
-- * * * * *
-- * * * *
-- * * *
-- * *
-- *
-- Write a query to print the pattern P(20).
SET serveroutput ON;
BEGIN
    FOR i IN REVERSE 1..20
    LOOP
    	DBMS_OUTPUT.PUT_LINE(REGEXP_REPLACE(RPAD('*', i, '*'), '.', '* '));
    END LOOP;
END;
/

-- Draw The Triangle 2
-- P(R) represents a pattern drawn by Julia in R rows. The following pattern represents P(5):
-- *
-- * *
-- * * *
-- * * * *
-- * * * * *
-- Write a query to print the pattern P(20).
SET serveroutput ON;
BEGIN
	FOR i IN 1..20
	LOOP
    	DBMS_OUTPUT.PUT_LINE(REGEXP_REPLACE(RPAD('*', i, '*'), '(.)', '* '));
	END LOOP;
END;
/

-- Weather Observation Station 15
-- Query the Western Longitude (LONG_W) for the largest Northern Latitude (LAT_N) in STATION that is less than 137.2345. Round your answer to  decimal places.
SELECT ROUND(long_w, 4)
FROM station
WHERE lat_n =
			(
				SELECT MAX(lat_n)
				FROM station
				WHERE lat_n < 137.2345
			);

-- Weather Observation Station 16
-- Query the smallest Northern Latitude (LAT_N) from STATION that is greater than 38.7780. Round your answer to 4 decimal places.
SELECT ROUND(MIN(lat_n), 4)
FROM station
WHERE lat_n > 38.7780;

-- Weather Observation Station 17
-- Query the Western Longitude (LONG_W)where the smallest Northern Latitude (LAT_N) in STATION is greater than 38.7780. Round your answer to 4 decimal places.
SELECT ROUND(long_w, 4)
FROM station
WHERE lat_n =
			(
				SELECT MIN(lat_n)
				FROM station
				WHERE lat_n > 38.7780
			);

-- ***************************** MEDIUM *****************************

-- Weather Observation Station 18
-- Consider P1(a,b) and P2(c,d) to be two points on a 2D plane.
-- a happens to equal the minimum value in Northern Latitude (LAT_N in STATION).
-- b happens to equal the minimum value in Western Longitude (LONG_W in STATION).
-- c happens to equal the maximum value in Northern Latitude (LAT_N in STATION).
-- d happens to equal the maximum value in Western Longitude (LONG_W in STATION).
-- Query the Manhattan Distance between points P1 and P2 and round it to a scale of  decimal places.

-- /////////////// Explanation ///////////////////
-- Distance between 2 points in a plane with P1(x1,y2) and P2(x2,y2)
-- Manhattan Distance = |x1 - x2| + |y1 - y2|
-- Therefore Manhattan Distance this case can be solved using this formula:
-- |min(lat_n) - max(lat_n)| + |min(long_w) - max(long_w)|
-- Where:
-- min(lat_n) = a or x1
-- max(lat_n) = c or x2
-- min(long_w) = b or y1
-- max(long_w) = d or y2
SELECT ABS(ROUND(MIN(lat_n) - MAX(lat_n),4)) + ABS(ROUND(MIN(long_w) - MAX(long_w),4))
FROM station;

-- Weather Observation Station 19
-- Consider P1(a,c) and P2(b,d) to be two points on a 2D plane where (a,b) are the respective minimum and maximum values of Northern Latitude (LAT_N) and (c,d) are the respective minimum and maximum values of Western Longitude (LONG_W) in STATION.
-- Query the Euclidean Distance between points P1 and P2 and format your answer to display 4 decimal digits.

-- ////////////////// Explanation ///////////////////
-- Euclidean Distance between 2 points in Euclidean space id length of line segement between them
-- Euclidean Distance in 2D can be solved using:
-- d(p,q) = sqrt((p1 - q1)^2 + (p2 - q2)^2)
-- P1(a,c) = a = min lat_n and c = max lat_n
-- P2(b, d) = b = min long_w and d = max long_w
-- We can solve for Euclidean Distance = sqrt((min(lat_n) - max(lat_n)^2) + (min(long_w) - max(long_w)^2))
SELECT ROUND(SQRT(POWER(MIN(lat_n) - MAX(lat_n), 2) + POWER(MIN(long_w) - MAX(long_w), 2)), 4)
FROM station;

-- Weather Observation Station 20
-- A median is defined as a number separating the higher half of a data set from the lower half. Query the median of the Northern Latitudes (LAT_N) from STATION and round your answer to 4 decimal places.
SELECT ROUND(MEDIAN(lat_n), 4)
FROM station;
