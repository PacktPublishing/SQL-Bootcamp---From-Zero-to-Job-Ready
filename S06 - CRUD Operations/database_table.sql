-- creating database

CREATE DATABASE sample_pizza ;



-- Starting to use the database

USE sample_pizza ;



-- Creating the Table

CREATE TABLE transactions_pizza (
pizza_id INT PRIMARY KEY,
pizza_name VARCHAR(50),
toppings VARCHAR(150),
price DECIMAL
);


