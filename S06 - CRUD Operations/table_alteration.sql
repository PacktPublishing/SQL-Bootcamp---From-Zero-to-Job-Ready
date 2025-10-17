-- Altering the table properties and fields

ALTER TABLE transactions_pizza
MODIFY COLUMN price DECIMAL(5,2);


-- Updating an existing info of the table

UPDATE transactions_pizza
SET toppings='Cheese,Tomato,Corn,Mushroom'
WHERE pizza_id=4;