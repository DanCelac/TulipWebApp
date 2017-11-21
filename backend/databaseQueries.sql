CREATE TABLE category (

      id IDENTITY,
      name VARCHAR(50),
      description VARCHAR(255),
      image_url VARCHAR(50),
      is_active BOOLEAN,
      
      CONSTRAINT pk_category_id
      PRIMARY KEY (id )
);
--done

CREATE TABLE user_detail (
	id IDENTITY,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	role VARCHAR(50),
	enabled BOOLEAN,
	password VARCHAR(60),
	email VARCHAR(100),
	contact_number VARCHAR(15),	
	CONSTRAINT pk_user_id PRIMARY KEY(id)
);
--done

CREATE TABLE product (
	id IDENTITY,
	code VARCHAR(20),
	name VARCHAR(50),
	description VARCHAR(255),
	unit_price DECIMAL(10,2),
	is_active BOOLEAN,
	category_id INT,
	supplier_id INT,
	purchases INT DEFAULT 0,
	views INT DEFAULT 0,
	CONSTRAINT pk_product_id PRIMARY KEY (id),
 	CONSTRAINT fk_product_category_id FOREIGN KEY (category_id) REFERENCES category (id),
	CONSTRAINT fk_product_supplier_id FOREIGN KEY (supplier_id) REFERENCES user_detail(id),	
);	
--brand scos, quantity scos
-- the address table to store the user billing and shipping addresses
CREATE TABLE address (
	id IDENTITY,
	user_id int,
	address_line_one VARCHAR(100),
	city VARCHAR(20),
	is_billing BOOLEAN,
	is_shipping BOOLEAN,
	CONSTRAINT fk_address_user_id FOREIGN KEY (user_id ) REFERENCES user_detail (id),
	CONSTRAINT pk_address_id PRIMARY KEY (id)
);
--state scos, postal_code scos, country scos, address_line_two
-- the cart table to store the user cart top-level details
CREATE TABLE cart (
	id IDENTITY,
	user_id int,
	grand_total DECIMAL(10,2),
	cart_lines int,
	CONSTRAINT fk_cart_user_id FOREIGN KEY (user_id ) REFERENCES user_detail (id),
	CONSTRAINT pk_cart_id PRIMARY KEY (id)
);

-- the cart line table to store the cart details

CREATE TABLE cart_line (
	id IDENTITY,
	cart_id int,
	total DECIMAL(10,2),
	product_id int,
	product_count int,
	buying_price DECIMAL(10,2),
	is_available boolean,
	CONSTRAINT fk_cartline_product_id FOREIGN KEY (product_id ) REFERENCES product (id),
	CONSTRAINT pk_cartline_id PRIMARY KEY (id)
);


-- the order detail table to store the order

CREATE TABLE order_detail (
	id IDENTITY,
	user_id int,
	order_total DECIMAL(10,2),
	order_count int,
	shipping_id int,
	billing_id int,
	order_date date,
	CONSTRAINT fk_order_detail_user_id FOREIGN KEY (user_id) REFERENCES user_detail (id),
	CONSTRAINT fk_order_detail_shipping_id FOREIGN KEY (shipping_id) REFERENCES address (id),
	CONSTRAINT fk_order_detail_billing_id FOREIGN KEY (billing_id) REFERENCES address (id),
	CONSTRAINT pk_order_detail_id PRIMARY KEY (id)
);

-- the order item table to store order items

CREATE TABLE order_item (
	id IDENTITY,
	order_id int,
	total DECIMAL(10,2),
	product_id int,
	product_count int,
	buying_price DECIMAL(10,2),
	CONSTRAINT fk_order_item_product_id FOREIGN KEY (product_id) REFERENCES product (id),
	CONSTRAINT fk_order_item_order_id FOREIGN KEY (order_id) REFERENCES order_detail (id),
	CONSTRAINT pk_order_item_id PRIMARY KEY (id)
);



-- adding three categories
INSERT INTO category (name, description,image_url,is_active) VALUES ('Pizza', 'This is description for Pizza category!', 'CAT_1.png', true);
INSERT INTO category (name, description,image_url,is_active) VALUES ('Salad', 'This is description for Salad category!', 'CAT_2.png', true);
INSERT INTO category (name, description,image_url,is_active) VALUES ('Meat', 'This is description for Meat category!', 'CAT_3.png', true);
-- adding three users 

INSERT INTO user_detail 
(first_name, last_name, role, enabled, password, email, contact_number) 
VALUES ('Celac', 'Dan', 'ADMIN', true, '079176572d', 'dancelac@mail.ru', '068272361');
INSERT INTO user_detail 
(first_name, last_name, role, enabled, password, email, contact_number) 
VALUES ('Procop', 'Denis', 'SUPPLIER', true, 'procopDenis', 'procopdenis@mail.ru', '068024481');
INSERT INTO user_detail 
(first_name, last_name, role, enabled, password, email, contact_number) 
VALUES ('Procop', 'Vlad', 'SUPPLIER', true, 'procopVlad', 'procopVlad@mail.ru', '068442602');
INSERT INTO user_detail 
(first_name, last_name, role, enabled, password, email, contact_number) 
VALUES ('Celac', 'Ala', 'USER', true, 'celacAla', 'celacala@mail.ru', '068024482');

-- adding five products
INSERT INTO product (code, name, description, unit_price, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDABC123DEFX', 'Pizza Atomic', 'This is one of the most bought product !', 58, true, 3, 2, 0, 0 );
INSERT INTO product (code, name, description, unit_price, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDDEF123DEFX', 'Meat', 'Grilled pork steak with vegetables !', 50, true, 3, 3, 0, 0 );
INSERT INTO product (code, name, description, unit_price, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDPQR123WGTX', 'Salate', 'That is one of the most preferred salat!', 35, true, 3, 2, 0, 0 );
INSERT INTO product (code, name, description, unit_price, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDMNO123PQRX', ' Fish', 'Salmon steak', 50, true, 1, 2, 0, 0 );
INSERT INTO product (code, name, description, unit_price, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDABCXYZDEFX', 'Garniture', 'Risotto with vegetables!', 20, true, 1, 3, 0, 0 );
-- adding a supplier correspondece address
INSERT INTO address( user_id, address_line_one, city, is_billing, is_shipping) 
VALUES (4, 'str.Vasile Lupu 42/1', 'Orhei', true, false );
-- adding a cart for testing 
INSERT INTO cart (user_id, grand_total, cart_lines) VALUES (4, 0, 0);


