**CREATE TABLE product (
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  description TEXT NOT NULL,
  price DECIMAL(10,2) NOT NULL,
  image VARCHAR(255) NOT NULL,
  quantity INT NOT NULL,
  category_id INT NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (category_id) REFERENCES category (id)
);

CREATE TABLE category (
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE order (
  id INT NOT NULL AUTO_INCREMENT,
  customer_id INT NOT NULL,
  status VARCHAR(255) NOT NULL,
  date_created DATETIME NOT NULL,
  date_shipped DATETIME NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (customer_id) REFERENCES customer (id)
);

CREATE TABLE customer (
  id INT NOT NULL AUTO_INCREMENT,
  first_name VARCHAR(255) NOT NULL,
  last_name VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  password VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
);

-- Comments

**Table product**

This table stores information about products. The `id` column is the primary key and is automatically incremented. The `name` column stores the product name, the `description` column stores a detailed description of the product, the `price` column stores the product price, the `image` column stores the URL to an image of the product, the `quantity` column stores the number of products in stock, and the `category_id` column stores the ID of the category to which the product belongs.

**Table category**

This table stores information about categories. The `id` column is the primary key and is automatically incremented. The `name` column stores the category name.

**Table order**

This table stores information about orders. The `id` column is the primary key and is automatically incremented. The `customer_id` column stores the ID of the customer who placed the order, the `status` column stores the status of the order (e.g., "pending", "processing", "shipped"), the `date_created` column stores the date and time the order was created, and the `date_shipped` column stores the date and time the order was shipped.

**Table customer**

This table stores information about customers. The `id` column is the primary key and is automatically incremented. The `first_name` column stores the customer's first name, the `last_name` column stores the customer's last name, the `email` column stores the customer's email address, the `password` column stores the customer's password, and the `password` column stores the customer's password.