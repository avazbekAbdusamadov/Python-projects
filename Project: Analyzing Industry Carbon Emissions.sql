/*  1)Finding the most recent year data was collected
Start by writing a query which determines the most recent year for which data has been collected.
2)Grouping the data
Now you'll begin writing the final query. Select the columns of interest and GROUP BY industry.
3)Filtering the results
Filter the results so that only data from the most recent year of data collection is returned.
Filtering grouped data
4) The highest-emitting industries
Order the results from the highest-emitting industries to the lowest-emitting industries.
*/
SELECT industry_group,
	COUNT(*) AS count_industry,
	ROUND(SUM(carbon_footprint_pcf), 1) AS total_industry_footprint
FROM product_emissions
GROUP BY industry_group, year
HAVING year = 2017
ORDER BY total_industry_footprint DESC;
