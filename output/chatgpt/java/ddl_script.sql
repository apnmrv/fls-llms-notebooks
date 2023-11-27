-- Based on the project specification, the SQL dialect to be used is PostgreSQL. Here is the DDL script for the e-commerce website:
-- User table
CREATE TABLE users (
    user_id SERIAL PRIMARY KEY, -- Unique identifier for each user
    username VARCHAR(255) NOT NULL, -- Username of the user
    password VARCHAR(255) NOT NULL, -- Password for the user account
    email VARCHAR(255) UNIQUE NOT NULL -- Email of the user
);

COMMENT ON TABLE users IS 'This entity will store all the information related to the user.';

-- Product table
CREATE TABLE products (
    product_id SERIAL PRIMARY KEY, -- Unique identifier for each product
    product_name VARCHAR(255) NOT NULL, -- Name of the product
    product_description TEXT, -- Description of the product
    product_price NUMERIC(10, 2) NOT NULL -- Price of the product
);

COMMENT ON TABLE products IS 'This entity will store all the information related to the products.';

-- Order table
CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY, -- Unique identifier for each order
    user_id INTEGER REFERENCES users(user_id), -- Identifier for the user who placed the order
    product_id INTEGER REFERENCES products(product_id), -- Identifier for the product ordered
    order_status VARCHAR(255) NOT NULL -- Status of the order
);

COMMENT ON TABLE orders IS 'This entity will store all the information related to the orders.';

-- Review table
CREATE TABLE reviews (
    review_id SERIAL PRIMARY KEY, -- Unique identifier for each review
    user_id INTEGER REFERENCES users(user_id), -- Identifier for the user who wrote the review
    product_id INTEGER REFERENCES products(product_id), -- Identifier for the product reviewed
    review_text TEXT NOT NULL -- Text of the review
);

COMMENT ON TABLE reviews IS 'This entity will store all the information related to the product reviews.';

-- Wishlist table
CREATE TABLE wishlists (
    wishlist_id SERIAL PRIMARY KEY, -- Unique identifier for each wishlist
    user_id INTEGER UNIQUE REFERENCES users(user_id), -- Identifier for the user who owns the wishlist
    product_id INTEGER REFERENCES products(product_id) -- Identifier for the product in the wishlist
);

COMMENT ON TABLE wishlists IS 'This entity will store all the information related to the user''s wishlist.';

-- This script creates five tables: `users`, `products`, `orders`, `reviews`, and `wishlists`. Each table has a primary key, and the `orders`, `reviews`, and `wishlists` tables have foreign keys that reference the `users` and `products` tables. The `user_id` in the `wishlists` table is unique to enforce the one-to-one relationship between `users` and `wishlists`.