CREATE DATABASE IF NOT EXISTS happiness_project;

USE happiness_project;

CREATE TABLE IF NOT EXISTS country (
country_id INT PRIMARY KEY,
country_name VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS happiness_metrics (
happiness_id INT PRIMARY KEY,
country_id INT,
year INT, 
happiness_score FLOAT,
life_satisfaction FLOAT,
social_support FLOAT,
healthy_life_exp FLOAT,
freedom FLOAT,
generosity FLOAT,
corruption FLOAT,
public_trust FLOAT,
mental_health FLOAT,
work_life_balance FLOAT,
climate_index FLOAT,
FOREIGN KEY (country_id) REFERENCES country(country_id) 
);

CREATE TABLE IF NOT EXISTS social_economic_metrics (
social_id INT PRIMARY KEY,
country_id INT ,
year INT,
gdp_per_capita FLOAT,
population INT ,
urbanization_rate FLOAT,
education_index FLOAT,
unemployment_rate FLOAT,
employment_rate FLOAT,
income_inequality FLOAT,
public_health_expenditure FLOAT,
internet_access FLOAT,
crime_rate FLOAT,
political_stability FLOAT,
FOREIGN KEY (country_id) REFERENCES country(country_id) 
);

CREATE TABLE IF NOT EXISTS macroeconomic_indicators (
macro_id INT PRIMARY KEY,
country_id INT ,
year INT,
gdp_billion_usd FLOAT,
inflation_rate_pct FLOAT,
unemployment_rate_pct FLOAT, 
economic_growth_pct FLOAT,
FOREIGN KEY (country_id) REFERENCES country(country_id) 
);









