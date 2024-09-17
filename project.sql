-- Creation of new schema as e-commerece
create database  ecommerce;

-- Import of .csv file
-- Question 2 : data table is imported to schemas

-- Checking for structure of table
DESCRIBE ecommerce.users_data;

-- Selection of first 100 rows of the database
select * from ecommerce.users_data  limit 100;

-- Distinct values values exist in table for field country and language
SELECT 
    COUNT(DISTINCT country) AS distinct_countries,
    COUNT(DISTINCT language) AS distinct_languages
FROM 
   ecommerce.users_data;
   
-- Checking for whether male users are having maximum followers or female users
SELECT 
    gender,
    SUM(socialNbFollowers) AS total_followers
FROM 
   ecommerce.users_data
GROUP BY 
    gender
 ORDER BY  sum(socialNbFollowers) desc   
  limit 1  
;

-- Calculating the total users those 
-- a.Uses profile picture in their profile
-- b. Uses application for e-commerence patform
-- c. Uses android app
-- d. uses ios app
use ecommerce;
SELECT
    SUM(CASE WHEN hasProfilePicture = 'TRUE' THEN 1 ELSE 0 END) AS total_users_1,
    SUM(CASE WHEN hasAnyApp = 'TRUE' THEN 1 ELSE 0 END) AS total_users_Application,
    SUM(CASE WHEN hasAndroidApp = 'TRUE' THEN 1 ELSE 0 END) AS total_users_Android,
    SUM(CASE WHEN hasIosApp = 'TRUE' THEN 1 ELSE 0 END) AS total_users_Ios
FROM
    users_data;

-- Calculating the total number of buyers for each country and sorting the result in descending order of total number of buyers
SELECT 
    country, COUNT(*) AS total_buyers
FROM users_data
WHERE productsbought >= 1
GROUP BY country
ORDER BY total_buyers DESC;

-- Calculating total number of sellers for ecah country and sorting the result in ascending order of total number of sellers
SELECT 
    country, COUNT(*) AS total_sellers
FROM users_data
WHERE productsSold >= 1
GROUP BY country
ORDER BY total_sellers ASC;

-- Displaying th ename of top 10 countrie having maximm product pass rate
SELECT country, MAX(productsPassRate) AS max_productsPassRate
FROM users_data
GROUP BY country
ORDER BY max_productsPassRate DESC
LIMIT 10;

-- Calculating the number of users on an ecommerce platform for different language choices
SELECT language, COUNT(identifierHash) AS user_count
FROM users_data
GROUP BY language;

--  Checking the choice of female users about putting the product in a wislist or to like socially on an ecommerece platform 
SELECT  'wishlist' AS action_type,  Count(productsWished)
FROM users_data
WHERE gender = 'F' AND productsWished > 0

UNION

-- Query to check female users who liked products socially
SELECT  'like' AS action_type, count(socialProductsLiked)
FROM users_data
WHERE gender = 'F' AND socialProductsLiked > 0;

-- Checking the choice of male users about being seller or buyer
-- Query to check male users who are sellers (have listed or sold products)
SELECT 'seller' AS role,  count(productsSold)
FROM users_data
WHERE gender = 'M' 

UNION

-- Query to check male users who are buyers (have bought products)
SELECT  'buyer' AS role,  count(productsBought)
FROM users_data
WHERE gender = 'M' ;

-- Country which is having maximum number of buyers
SELECT country, COUNT(identifierHash) AS buyer_count
FROM users_data
WHERE productsBought > 0
GROUP BY country
ORDER BY buyer_count DESC
LIMIT 1;

-- List of the name of 10 countries having zero number of sellers
SELECT country, COUNT(identifierHash) AS buyer_count
FROM users_data
WHERE productsBought = 0
GROUP BY country
ORDER BY buyer_count DESC
limit 10;

-- Record of top 110 users who have used ecommerce platform recently
SELECT *
FROM users_data
ORDER BY daysSinceLastLogin ASC
LIMIT 110;


-- The number of female users those who have not logged in since last 100 days
SELECT COUNT(identifierHash) AS female_user_count
FROM users_data
WHERE gender = 'F' AND daysSinceLastLogin >= 100;

-- The number of female users of each country at ecommerece platform
SELECT country, COUNT(identifierHash) AS female_user_count
FROM users_data
WHERE gender = 'F'
GROUP BY country;

-- The number of male users of each country t ecommerce platform
SELECT country, COUNT(identifierHash) AS male_user_count
FROM users_data
WHERE gender = 'M'
GROUP BY country;

-- The average number of products sold and bought on ecommerce platform by male users for each country
select country, avg(productsSold), avg(productsBought) 
from users_data
where gender='M'
group by country