
CREATE TABLE product (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  description TEXT NOT NULL,
  price DECIMAL(10, 2) NOT NULL,
  image VARCHAR(255) NOT NULL,
  stock INTEGER NOT NULL,

  -- CONSTRAINTS
  CONSTRAINT fk_product_category FOREIGN KEY (category_id) REFERENCES category (id)
);

CREATE TABLE category (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL
);

CREATE TABLE customer (
  id SERIAL PRIMARY KEY,
  email VARCHAR(255) NOT NULL UNIQUE,
  password VARCHAR(255) NOT NULL,
  first_name VARCHAR(255) NOT NULL,
  last_name VARCHAR(255) NOT NULL,
  address VARCHAR(255) NOT NULL,
  phone_number VARCHAR(255) NOT NULL
);

CREATE TABLE order (
  id SERIAL PRIMARY KEY,
  customer_id INTEGER NOT NULL REFERENCES customer (id),
  order_date TIMESTAMP NOT NULL,
  total_price DECIMAL(10, 2) NOT NULL,

  -- CONSTRAINTS
  CONSTRAINT fk_order_customer FOREIGN KEY (customer_id) REFERENCES customer (id)
);

CREATE TABLE order_item (
  id SERIAL PRIMARY KEY,
  order_id INTEGER NOT NULL REFERENCES order (id),
  product_id INTEGER NOT NULL REFERENCES product (id),
  quantity INTEGER NOT NULL,

  -- CONSTRAINTS
  CONSTRAINT fk_order_item_order FOREIGN KEY (order_id) REFERENCES order (id),
  CONSTRAINT fk_order_item_product FOREIGN KEY (product_id) REFERENCES product (id)
);

-- COMMENT ON TABLE product IS 'This table stores information about products.';
-- COMMENT ON COLUMN product.id IS 'The unique identifier for a product.';
-- COMMENT ON COLUMN product.name IS 'The name of the product.';
-- COMMENT ON COLUMN product.description IS 'A detailed description of the product.';
-- COMMENT ON COLUMN product.price IS 'The price of the product.';
-- COMMENT ON COLUMN product.image IS 'The URL of an image of the product.';
-- COMMENT ON COLUMN product.stock IS 'The number of units of the product in stock.';

-- COMMENT ON TABLE category IS 'This table stores information about categories.';
-- COMMENT ON COLUMN category.id IS 'The unique identifier for a category.';
-- COMMENT ON COLUMN category.name IS 'The name of the category.';

-- COMMENT ON TABLE customer IS 'This table stores information about customers.';
-- COMMENT ON COLUMN customer.id IS 'The unique identifier for a customer.';
-- COMMENT ON COLUMN customer.email IS 'The email address of the customer.';
-- COMMENT ON COLUMN customer.password IS 'The password of the customer.';
-- COMMENT ON COLUMN customer.first_name IS 'The first name of the customer.';
-- COMMENT ON COLUMN customer.last_name IS 'The last name of the customer.';
-- COMMENT ON COLUMN customer.address IS 'The address of the customer.';
-- COMMENT ON COLUMN customer.phone_number IS 'The phone number of the customer.';

-- COMMENT ON TABLE order IS 'This table stores information about orders.';
-- COMMENT ON COLUMN order.id IS 'The unique identifier for an order.';
-- COMMENT ON COLUMN order.customer_id IS 'The identifier of the customer who placed the order.';
-- COMMENT ON COLUMN order.order_date IS 'The date and time the order was placed.';
-- COMMENT ON COLUMN order.total_price IS 'The total price of the order.';

-- COMMENT ON TABLE order_item IS 'This table stores information about items in an order.';
-- COMMENT ON COLUMN order_item.id IS 'The unique identifier for an order item.';
-- COMMENT ON COLUMN order_item.order_id IS 'The identifier of the order that the item belongs to.';
-- COMMENT ON COLUMN order_item.product_id IS 'The identifier of the product that the item is for.';
-- COMMENT ON COLUMN order_item.quantity IS