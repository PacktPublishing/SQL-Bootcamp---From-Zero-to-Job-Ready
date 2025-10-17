CREATE DATABASE snowflake_schema;

USE snowflake_schema;

#------creating month and quarter sub-dimension table--------#
CREATE TABLE month_info ( 
	month_id INT AUTO_INCREMENT PRIMARY KEY,
	month_name VARCHAR(50)
);
INSERT INTO month_info (month_id, month_name) VALUES (1, 'May');

CREATE TABLE quarter_info ( 
	quarter_id INT AUTO_INCREMENT PRIMARY KEY,
	quarter_name VARCHAR(50) );
     
INSERT INTO quarter_info (quarter_id, quarter_name) 
VALUES (1, 'Q2');

#------creating time dimension table--------#
CREATE TABLE time_t ( 
	time_id INT AUTO_INCREMENT PRIMARY KEY, 	
	day_d DATE, 
	week_w INT, 
	month_id INT,
 	quarter_id INT, 
	year_y INT,
	FOREIGN KEY (month_id) REFERENCES month_info(month_id),
    FOREIGN KEY (quarter_id) REFERENCES quarter_info(quarter_id)
);

INSERT INTO time_t (time_id, day_d, week_w, month_id, quarter_id, year_y) VALUES
(1, '2024-05-01', 7,1, 1, 2024);

#------Creating category and brand sub-dimensions--------#

CREATE TABLE category (
	category_id INT AUTO_INCREMENT PRIMARY KEY, 
	category_name VARCHAR(50)
);

INSERT INTO category (category_id , category_name) VALUES
(1, 'Vegetarian'), 
(2, 'Non-Vegetarian');


CREATE TABLE brand (
	brand_id INT AUTO_INCREMENT PRIMARY KEY, 
	brand_name VARCHAR(50)
);
INSERT INTO brand (brand_id , brand_name) VALUES
(1, 'Pizza Delight');

#------creating products dimension table--------#

CREATE TABLE products (
	product_id INT AUTO_INCREMENT PRIMARY KEY, 
	name VARCHAR(100), 
	category_id INT, 
	brand_id INT,
    FOREIGN KEY (category_id) REFERENCES category(category_id),
    FOREIGN KEY (brand_id) REFERENCES brand(brand_id)
);

INSERT INTO products (product_id, name, category_id, brand_id) VALUES
(1, 'Margherita', 1, 1), 
(2, 'Pepperoni', 2, 1), 
(3, 'BBQ Chicken', 2, 1), 
(4, 'Veggie Supreme', 1, 1), 
(5, 'Hawaiian', 2, 1);



#------creating contact sub-dimension table--------#

CREATE TABLE contact (
	contact_id INT AUTO_INCREMENT PRIMARY KEY, 
	email VARCHAR(100),
	phone_number VARCHAR(15) 
);
INSERT INTO contact (contact_id, email, phone_number) VALUES
(1, 'john.doe@example.com', '123-456-7890'), 
(2, 'jane.smith@example.com', '123-456-7891'), 
(3, 'alice.johnson@example.com', '123-456-7892'), 
(4, 'bob.brown@example.com', '123-456-7893'), 
(5, 'charlie.davis@example.com', '123-456-7894');

#------creating customers dimension table--------#

CREATE TABLE customers (
	customer_id INT AUTO_INCREMENT PRIMARY KEY, 
	first_name VARCHAR(50), 
	last_name VARCHAR(50), 
	contact_id INT,
    FOREIGN KEY (contact_id) REFERENCES contact(contact_id)
);

INSERT INTO customers (customer_id, first_name, last_name, contact_id) VALUES
(1, 'John', 'Doe', 1), 
(2, 'Jane', 'Smith', 2), 
(3, 'Alice', 'Johnson', 3), 
(4, 'Bob', 'Brown', 4), 
(5, 'Charlie', 'Davis', 5);


#-----creating the delivery dimension table---------#

CREATE TABLE delivery (
	delivery_id INT AUTO_INCREMENT PRIMARY KEY, 
	type VARCHAR(50),
	delivery_time_minutes INT
);
INSERT INTO delivery (delivery_id, type, delivery_time_minutes) VALUES (1, 'Home', 30), 
(2, 'Takeaway', 0), 
(3, 'Home', 25), 
(4, 'Home', 35), 
(5, 'Takeaway', 0);


#--creating the fact table--#

CREATE TABLE pizza_orders (
	order_id INT AUTO_INCREMENT PRIMARY KEY, 
	date_id INT, 
	product_id INT,
 	customer_id INT,
	delivery_id INT,
 	quantity INT, 
	total_amount DECIMAL(10, 2),
    FOREIGN KEY (date_id) REFERENCES time_t(time_id),
	FOREIGN KEY (product_id) REFERENCES products(product_id),
	FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
	FOREIGN KEY (delivery_id) REFERENCES delivery(delivery_id)
);

INSERT INTO pizza_orders (order_id, date_id, product_id, customer_id, delivery_id, quantity, total_amount) VALUES 
(1, 1, 2, 1, 1, 2, 19.98);
