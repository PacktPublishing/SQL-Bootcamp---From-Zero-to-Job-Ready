CREATE DATABASE star_schema;

Use star_schema;

CREATE TABLE time_dimension (
time_id INT AUTO_INCREMENT PRIMARY KEY,
day DATE,
week INT,
month INT,
quarter INT,
year INT
);

INSERT INTO time_dimension (time_id, day, week, month, quarter, year) VALUES
(1, '2024-05-01', 18, 5, 2, 2024),
(2, '2024-05-02', 18, 5, 2, 2024),
(3, '2024-05-03', 18, 5, 2, 2024),
(4, '2024-05-04', 18, 5, 2, 2024),
(5, '2024-05-05', 18, 5, 2, 2024);




CREATE TABLE products_dimension (
product_id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(100),
category VARCHAR(50),
brand VARCHAR(50)
);


INSERT INTO products_dimension (product_id, name, category, brand) VALUES
(1,'Margherita', 'Vegetarian', 'Pizza Delight'),
(2,'Pepperoni', 'NonVegetarian', 'Pizza Delight'),
(3,'BBQ Chicken', 'Non-Vegetarian', 'Pizza Delight'),
(4,'Veggie Supreme', 'Vegetarian', 'Pizza Delight'),
(5,'Hawaiian', 'Non-Vegetarian', 'Pizza Delight');




CREATE TABLE customers_dimension (
customer_id INT AUTO_INCREMENT PRIMARY KEY,
first_name VARCHAR(50),
last_name VARCHAR(50),
email VARCHAR(100),
phone_number VARCHAR(15)
);


INSERT INTO customers_dimension (customer_id, first_name, last_name, email, phone_number) VALUES
(1, 'John', 'Doe', 'john.doe@example.com', '123-456-7890'),
(2, 'Jane', 'Smith', 'jane.smith@example.com', '123-456-7891'),
(3, 'Alice', 'Johnson', 'alice.johnson@example.com', '123-456-7892'),
(4, 'Bob', 'Brown', 'bob.brown@example.com', '123-456-7893'),
(5, 'Charlie', 'Davis', 'charlie.davis@example.com', '123-456-7894');



CREATE TABLE delivery_dimension (
delivery_id INT AUTO_INCREMENT PRIMARY KEY,
Type VARCHAR(50),
delivery_time_minutes INT
);

INSERT INTO delivery_dimension (delivery_id, type, delivery_time_minutes) VALUES
(1, 'Home', 30),
(2, 'Takeaway', 0),
(3, 'Home', 25),
(4, 'Home', 35),
(5, 'Takeaway', 0);



CREATE TABLE pizza_orders (
order_id INT AUTO_INCREMENT PRIMARY KEY,
time_id INT,
product_id INT,
customer_id INT,
delivery_id INT,
quantity INT,
total_amount DECIMAL(10, 2),
FOREIGN KEY (time_id) REFERENCES time_dimension(time_id),
FOREIGN KEY (product_id) REFERENCES products_dimension(product_id),
FOREIGN KEY (customer_id) REFERENCES customers_dimension(customer_id),
FOREIGN KEY (delivery_id) REFERENCES delivery_dimension(delivery_id)
);


INSERT INTO pizza_orders (order_id, time_id, product_id, customer_id, delivery_id, quantity, total_amount) VALUES
(1, 1, 2, 1, 1, 2, 19.98),
(2, 2, 3, 2, 2, 1, 12.99),
(3, 3, 1, 3, 3, 3, 29.97),
(4, 4, 5, 4, 4, 1, 10.99),
(5, 5, 4, 5, 5, 2, 21.98);