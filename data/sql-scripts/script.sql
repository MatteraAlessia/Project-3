SELECT
    country_id,
    year,
    happiness_score AS wellbeing_score
FROM happiness_metrics
ORDER BY year;

-- wellbening score per year --

SELECT
    country.country_name,
    happiness_metrics.year,
    happiness_metrics.happiness_score AS wellbeing_score
FROM happiness_metrics
JOIN country
ON happiness_metrics.country_id = country.country_id
ORDER BY country.country_name, happiness_metrics.year;

-- wellbeing score per year per country --

SELECT
    country.country_name,
    happiness_metrics.year,
    happiness_metrics.happiness_score AS wellbeing_score
FROM happiness_metrics
JOIN country
ON happiness_metrics.country_id = country.country_id
ORDER BY wellbeing_score DESC
LIMIT 3;

-- top 3 countries with best wellbeing score per year--

SELECT
    country.country_name,
    ROUND(AVG(happiness_metrics.happiness_score), 2) AS average_wellbeing
FROM happiness_metrics
JOIN country
ON happiness_metrics.country_id = country.country_id
GROUP BY country.country_name
ORDER BY average_wellbeing DESC;



-- COUNTRIES WITH HIGHER AVERAGE WELL BEING --

SELECT
    country.country_name,
    happiness_metrics.year,
    happiness_metrics.happiness_score AS wellbeing_score,
    social_economic_metrics.gdp_per_capita
FROM happiness_metrics
JOIN social_economic_metrics
ON happiness_metrics.country_id = social_economic_metrics.country_id
AND happiness_metrics.year = social_economic_metrics.year
JOIN country
ON happiness_metrics.country_id = country.country_id
ORDER BY country.country_name;

-- wellbeing and GDP per capita together, analyzing and checking weather wealthier countries have higher wellbeing --

SELECT
    country.country_name,
    happiness_metrics.year,
    happiness_metrics.happiness_score AS wellbeing_score,
    macroeconomic_indicators.inflation_rate_pct,
    macroeconomic_indicators.unemployment_rate_pct
FROM happiness_metrics
JOIN macroeconomic_indicators
ON happiness_metrics.country_id = macroeconomic_indicators.country_id
AND happiness_metrics.year = macroeconomic_indicators.year
JOIN country
ON happiness_metrics.country_id = country.country_id
ORDER BY happiness_score DESC;

-- This table allows us to compare wellbeing with: inflation & unemployment. It helps answer our second research question about macroeconomic conditions and wellbeing--


SELECT
    country.country_name,
    MIN(happiness_metrics.happiness_score) AS lowest_wellbeing,
    MAX(happiness_metrics.happiness_score) AS highest_wellbeing,
    ROUND(MAX(happiness_metrics.happiness_score) - MIN(happiness_metrics.happiness_score), 2) AS wellbeing_variation
FROM happiness_metrics
JOIN country
ON happiness_metrics.country_id = country.country_id
GROUP BY country.country_name
ORDER BY wellbeing_variation DESC;

--  Countries with the largest variation in wellbeing over time --