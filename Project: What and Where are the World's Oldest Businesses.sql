-- Select the oldest and newest founding years from the businesses table
select min(year_founded), max(year_founded)  from businesses;
-- Get the count of rows in businesses where the founding year was before 1000
select count(year_founded) from businesses where year_founded<1000;
-- Select all columns from businesses where the founding year was before 1000
-- Arrange the results from oldest to newest
select * from businesses where year_founded<1000 order by year_founded ASC;
-- Select business name, founding year, and country code from businesses; and category from categories
-- where the founding year was before 1000, arranged from oldest to newest
select businesses.business, businesses.year_founded, businesses.country_code, categories.category
from businesses
inner join categories on businesses.category_code= categories.category_code where year_founded<1000 order by year_founded asc;

-- Select the category,  count of category (as "n")
-- arranged by descending count, limited to 10 most common categories
select categories.category , count(categories.category) as n
from businesses
inner join categories on categories.category_code= businesses.category_code
group by categories.category
 order by n desc limit 10;

-- Select the oldest founding year (as "oldest") from businesses, 
-- and continent from countries
-- for each continent, ordered from oldest to newest 
select min(businesses.year_founded) as oldest , countries.continent
from businesses
inner join countries on businesses.country_code= countries.country_code
group by countries.continent
order by oldest asc;

-- Select the business, founding year, category, country, and continent
select businesses.business, businesses.year_founded, categories.category, countries.country, countries.continent
from businesses
inner join categories on businesses.category_code=categories.category_code
inner join countries on businesses.country_code=countries.country_code;

-- Count the number of businesses in each continent and category


-- Count the number of businesses in each continent and category
SELECT cnt.continent, cat.category, COUNT(*) AS n
    FROM businesses AS bus
    INNER JOIN categories as cat
        ON bus.category_code = cat.category_code
    INNER JOIN countries as cnt
        ON bus.country_code = cnt.country_code
    GROUP BY cnt.continent, cat.category;

-- Repeat that previous query, filtering for results having a count greater than 5
SELECT cnt.continent, cat.category, COUNT(*) AS n
    FROM businesses AS bus
    INNER JOIN categories as cat
        ON bus.category_code = cat.category_code
    INNER JOIN countries as cnt
        ON bus.country_code = cnt.country_code
    GROUP BY cnt.continent, cat.category
    having count(*)>5
    order by n desc;
