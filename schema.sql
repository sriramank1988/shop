CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    email VARCHAR(300) NOT NULL UNIQUE,
    password_digest VARCHAR(400),
    user_role VARCHAR(300)
);

CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    product_code VARCHAR(300) PRIMARY KEY,
    name VARCHAR(300) NOT NULL,
    image_url VARCHAR(300) NOT NULL,
    quantity_on_hand INTEGER NOT NULL
);

CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    customer_id INTEGER NOT NULL,
    status VARCHAR(300) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES users(id)
);


CREATE TABLE orders_products (
    id SERIAL PRIMARY KEY,
    order_id INTEGER NOT NULL,
    product_id VARCHAR(300) NOT NULL,
    quantity INTEGER NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (product_id) REFERENCES product(product_code)
);