---Adding Foregin Key Consttraints to Orders Table ---

	ALTER TABLE orders
	ADD constraint fk_customers 
	FOREIGN key (customer_id) 
	REFERENCES customers (customer_id);
	
	ALTER TABLE orders
	ADD constraint fk_resturants 
	FOREIGN key (resturant_id) 
	REFERENCES resturants (resturant_id);

--Adding Foregin Key Constraints to deliveries table--
	ALTER TABLE deliveries
	ADD CONSTRAINT fk_orders 
	FOREIGN key (order_id) 
	REFERENCES orders (order_id);

	ALTER TABLE deliveries
	ADD CONSTRAINT fk_riders 
	FOREIGN key (rider_id) 
	REFERENCES riders(rider_id);

-----Correcting the columns name in deliveries table
Select * from deliveries

ALTER TABLE deliveries
RENAME COLUMN deilvery_status TO delivery_status

ALTER TABLE deliveries
RENAME COLUMN deilivery TO delivery_time
