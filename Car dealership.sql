-- Create a procedure to add a new actor to our database
CREATE OR REPLACE PROCEDURE addActor (
	_first_name varchar(45),
	_last_name varchar(45)
)
LANGUAGE plpgsql AS $$
BEGIN
	INSERT INTO actor
		(first_name, last_name)
	VALUES
		(_first_name, _last_name);
END;
$$
INSERT INTO mechanic (first_name, last_name)
VALUES
	('Jimmy', 'Hulk'),
	('Greg', 'Smith'),
	('Sarah', 'Logan');
	
INSERT INTO saleperson (first_name, last_name, inventory_id)
VALUES
	('Deborah', 'Lyons', 1),
	('Zack', 'Dawson', 2);
INSERT INTO saleperson (first_name, last_name, inventory_id)
VALUES
	('Zack', 'Brown', 3);
INSERT INTO inventory (make, model, year, color, amount, serial_number)
VALUES
	('Chevrolet', 'Camaro', '2016', 'red', '25000', 'AKSDFG909');
INSERT INTO inventory (make, model, year, color, amount, serial_number)
VALUES
	('Toyota', 'RAV4', '2019', 'grey', '35000', 'AKSDFG910'),
	('Honda', 'Civic', '2020', 'black', '20000', 'AKSDFG911');
INSERT INTO customer (first_name, last_name, phone_number, email, address)
VALUES
	('Nancy', 'Waters', '1234567890', 'nw@gmail.com', '123 Main St'),
	('Daniel', 'Cliffrad', '1234567899', 'hp@gmail.com', '124 Main St'),
	('Jerry', 'Lee', '1234567898', 'jl@gmail.com', '125 Main St');
INSERT INTO service (mechanic_id, service_type, amount, customer_id)
VALUES
	(2, 'oil change', 50, 1);
INSERT INTO payment (total, saleperson_id, service_id, customer_id, inventory_id)
VALUES
	(500, NULL, 1,  1, NULL)
	
CREATE OR REPLACE PROCEDURE addcustomer (
	_first_name varchar(255),
	_last_name varchar(255),
	_phone_number varchar(255),
	_email varchar(255),
	_address varchar(255)
	
)
LANGUAGE plpgsql AS $$
BEGIN
	INSERT INTO customer
		(first_name, last_name, phone_number, email, address)
	VALUES
		(_first_name, _last_name, _phone_number, _email, _address);
END;
$$
CALL addcustomer ('Jean', 'Thomas', '51510110101', 'hi@aol.com', '1 main dr');

CREATE OR REPLACE PROCEDURE addMechanic (
_first_name varchar (255),
_last_name varchar (255)
)
LANGUAGE plpgsql AS $$
BEGIN 
	INSERT INTO mechanic 
		(first_name, last_name)
	VALUES 
		(_first_name, _last_name);
END;
$$

CALL addMechanic ('Jason', 'Madula');

CREATE OR REPLACE PROCEDURE addInventory (
_make varchar (255),
_model varchar (255),
_year varchar (255),
_color varchar (255),
_amount float8,
_serial_number varchar (255)
)
LANGUAGE plpgsql AS $$
BEGIN 
	INSERT INTO addInventory
		(make, model, YEAR, color, amount, serial_number)
	VALUES
		(_make, _model, _year, _color, _amount, _serial_number);

END;
$$
CALL addInventory ('BMW', 'X3', '2020', 'white', '48000', 'MTKEWS000');
				


