-- project_01_sk --

-- 1. Create new schema as ecommerce.

create database ecommerce;
use ecommerce;

-- 2. Import .csv file users_data into MySQL --
#.csv file users_data hasbeen imported. 

-- 3. Run SQL command to see the structure of table.
show tables;
describe users_data;

-- 4. Run SQL command to select first 100 rows of the database --

select * from users_data limit 100;

-- 5. How many distinct values exist in table for field country and language --
select count(distinct(country)) " Country" ,count(distinct(language)) " Language" from users_data;

-- 6. Check whether male users are having maximum followers or female users --
select gender,sum(socialNbFollowers) from users_data group by gender;

-- 7. Calculate the total users those
-- a. Uses Profile Picture in their Profile
-- b. Uses Application for Ecommerce platform
-- c. Uses Android app
-- d. Uses ios app
-- a. 
select count(hasProfilePicture) from users_data where hasProfilePicture = 'True';
-- b. 
select count(hasAnyApp) from users_data where hasAnyApp = 'True';
-- c.
select count(hasAndroidApp) from users_data where hasAndroidApp = 'True';
-- d. 
select count(hasiosapp) from users_data where hasiosapp = 'True';

-- 8. Calculate the total number of buyers for each country and sort the result in descending order of total number of buyers. --
select * from users_data;
select country,count(productsbought) from users_data where productsbought != 0  group by country order by count(productsbought) desc;

-- 9. Calculate the average number of sellers for each country and sort the result in ascending order of total number of sellers. --
select country,count(productssold) from users_data where productssold>0 group by country  order by count(productssold) asc;

-- 10. Display name of top 10 countries having maximum products pass rate. --
select distinct(country),productsPassRate from users_data order by productsPassRate  desc limit 10;

-- 11. Calculate the number of users on an ecommerce platform for different language choices. --
 select language,count(language) from users_data group by language;

-- 12. Check the choice of female users about putting the product in a wishlist or to like socially on an ecommerce platform. --
select count(gender), gender from users_data where gender = "F" and (socialProductsLiked != 0 or productsWished != 0);

-- 13. Check the choice of male users about being seller or buyer. --

select count(*) from users_data where gender ='M' and productssold != 0 union (select count( productsbought)  from users_data where gender = 'M' and productsbought != 0);

-- 14. Which country is having maximum number of buyers? --
select  country,productsbought from users_data where productsbought = (select max( productsbought) from users_data);


-- 15. List the name of 10 countries having zero number of sellers. --
select country,productssold from users_data where productssold=0 group by country limit 10;

-- 16. Display record of top 110 users who have used ecommerce platform recently. --
select * from users_data order by dayssincelastlogin limit 110;

-- 17. Calculate the number of female users those who have not logged in since last 100 days. --
select count(gender),gender from users_data where gender ='F' and dayssincelastlogin >100;

-- 18. Display the number of female users of each country at ecommerce platform.
select country, count(gender), gender from users_data where gender = 'F' group by country;

-- 19. Display the number of male users of each country at ecommerce platform. --
select country, gender,count(gender) from users_data where gender = 'M' group by country;

-- 20. Calculate the average number of products sold and bought on ecommerce platform by male users for each country. --
select country, avg(productssold),avg(productsbought) from users_data where gender = 'M' group by country;


