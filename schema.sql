CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    email VARCHAR(300) NOT NULL UNIQUE,
    password_digest VARCHAR(400),
    user_role VARCHAR(300)
);

CREATE TABLE product (
    product_code VARCHAR(300) PRIMARY KEY,
    name VARCHAR(300) NOT NULL,
    image_url VARCHAR(300) NOT NULL,
    quantity_on_hand INTEGER NOT NULL
);
