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

-- The Blunder
-- Write a query calculating the amount of error (i.e.: actual - miscalculated average monthly salaries), and round it up to the next integer.
WITH actual_avg AS (
		SELECT AVG(salary) AS actual_avg 
		FROM Employees),
miscalc_avg AS (
		SELECT AVG(REGEXP_REPLACE(salary, '[0]', '')) AS wrong_avg 
		FROM Employees)
SELECT CEIL(aa.actual_avg - ma.wrong_avg) 
FROM actual_avg aa, miscalc_avg ma;

-- Top Earners
-- Write a query to find the maximum total earnings for all employees as well as the total number of employees who have maximum total earnings. Then print these values as 2 space-separated integers.
WITH total_earning as (
        SELECT (salary * months) AS earning 
	FROM Employee
),
find_max AS (
    	SELECT MAX(earning) AS max_earning 
	FROM total_earning
),
count_emp AS (
    	SELECT COUNT(*) AS num_of_emp 
	FROM find_max fm, total_earning te
    	WHERE fm.max_earning = te.earning
)
SELECT fm.max_earning, ce.num_of_emp 
FROM find_max fm, count_emp ce;

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


-- Print Prime Numbers
-- Write a query to print all prime numbers less than or equal to 1000. Print your result on a single line, and use the ampersand () character as your separator (instead of a space).
-- For example, the output for all prime numbers 7 would be:
-- 2&3&5&7
SET SERVEROUTPUT ON;
-- Loop through i to n times and n mod any i equal 0 which means there is more than 1 divisible, so its not a prime number
-- Return 0
-- Else Return 1
CREATE OR REPLACE FUNCTION isPrime(n INT)
RETURN INT
IS
BEGIN
    FOR i IN 2..n-1 LOOP
        IF n MOD i = 0 THEN
            RETURN 0;
        END IF;
    END LOOP;
    RETURN 1;
END;
/

-- Save the result of the function isPrime to a variable num
-- Remeber that 1 means number is a prime and 0 means it not a prime
-- You can use booleans value for this too
-- Create a variable called result which will hold all the prime numbers
-- Loop through 1000 times starting from 2
-- Due to concatanation, you have to first check if i is 2
-- If i = 2, concat the i to the result
-- Then, check if num is 1 meaning is prime and i does not equal 2
-- If both condition is true, concat i to the result using result = result || i || '&'
-- You could have avoided checking if i = 2, but this creates a strange case where the last prime number will have
-- & symbol, which makes the output wrong.
DECLARE
    num INT;
    result VARCHAR2(2000) := '';
BEGIN
    FOR i in 2..1000 LOOP   
        num := isPrime(i);
        IF i = 2 THEN
            result := result || i;
        END IF;
        IF num = 1 AND i <> 2 THEN
            result := result || '&' || i;
        END IF;
    END LOOP;
    
    dbms_output.put_line(result);
END;
/

-- //////// PSA: I MADE TO GOLD STAR IN SQL TODAY 10/08/2024

-- Top Competitors
/*
Julia just finished conducting a coding contest, and she needs your help assembling the 
leaderboard! Write a query to print the respective hacker_id and name of hackers who achieved full 
scores for more than one challenge. Order your output in descending order by the total number of 
challenges in which the hacker earned a full score. If more than one hacker received full scores in 
same number of challenges, then sort them by ascending hacker_id.
*/

SELECT h.hacker_id, h.name
FROM Hackers h, Difficulty d, Challenges c, Submissions s
WHERE h.hacker_id = s.hacker_id
AND c.difficulty_level = d.difficulty_level
AND s.challenge_id = c.challenge_id
AND s.score = d.score
GROUP BY h.hacker_id, h.name
having count(*) > 1
order by count(*) desc, h.hacker_id asc;

-- Contest Leaderboard
/*
You did such a great job helping Julia with her last coding contest challenge that she wants you to work on this one, too!

The total score of a hacker is the sum of their maximum scores for all of the challenges. Write a query to print the hacker_id, 
	name, and total score of the hackers ordered by the descending score. If more than one hacker achieved the same total score, 
	then sort the result by ascending hacker_id. Exclude all hackers with a total score of  from your result.
*/

WITH get_score
     AS (SELECT h.hacker_id,
                name,
                Max(score) AS hacker_score,
                challenge_id
         FROM   submissions s
                JOIN hackers h
                  ON s.hacker_id = h.hacker_id
         GROUP  BY challenge_id,
                   h.hacker_id,
                   name),
     sum_score
     AS (SELECT hacker_id,
                SUM(hacker_score) AS total_score
         FROM   get_score
         GROUP  BY hacker_id)
SELECT s.hacker_id,
       name,
       total_score
FROM   sum_score s
       JOIN get_score g
         ON s.hacker_id = g.hacker_id
GROUP  BY s.hacker_id,
          name,
          total_score
HAVING total_score > 0
ORDER  BY total_score DESC,
          s.hacker_id; 
