-- city
CREATE TABLE IF NOT EXISTS city
(
    id         BIGINT PRIMARY KEY AUTO_INCREMENT,
    name       VARCHAR(255) NOT NULL,
    country_id BIGINT       NOT NULL,
    FOREIGN KEY (country_id) REFERENCES country (id)
);
-- country
CREATE TABLE IF NOT EXISTS country
(
    id   BIGINT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL
);
-- address
CREATE TABLE IF NOT EXISTS address
(
    id               BIGINT PRIMARY KEY AUTO_INCREMENT,
    country_id       BIGINT NOT NULL,
    city_id          BIGINT NOT NULL,
    street           VARCHAR(255),
    house_number     VARCHAR(255),
    apartment_number VARCHAR(255),
    FOREIGN KEY (country_id) REFERENCES country (id),
    FOREIGN KEY (city_id) REFERENCES city (id)

);
-- user
CREATE TABLE IF NOT EXISTS user
(
    id              BIGINT PRIMARY KEY AUTO_INCREMENT,
    activation_code VARCHAR(255),
    active          BOOLEAN      NOT NULL,
    name            VARCHAR(255),
    surname         VARCHAR(255),
    phone_number    VARCHAR(32),
    address_id      BIGINT,
    email           VARCHAR(255) NOT NULL,
    username        VARCHAR(255) NOT NULL,
    password        VARCHAR(255) NOT NULL,
    FOREIGN KEY (address_id) REFERENCES address (id)
);
-- user_roles
CREATE TABLE IF NOT EXISTS user_roles
(
    user_id BIGINT NOT NULL,
    role    VARCHAR(255),
    FOREIGN KEY (user_id) REFERENCES user (id)
);
-- brand
CREATE TABLE IF NOT EXISTS brand
(
    id   BIGINT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL
);
-- product_type
CREATE TABLE IF NOT EXISTS product_type
(
    id   BIGINT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL
);
-- category
CREATE TABLE IF NOT EXISTS category
(
    id   BIGINT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL
);
-- product
CREATE TABLE IF NOT EXISTS product
(
    id              BIGINT PRIMARY KEY AUTO_INCREMENT,
    category_id     BIGINT         NOT NULL,
    product_type_id BIGINT         NOT NULL,
    brand_id        BIGINT         NOT NULL,
    name            VARCHAR(255)   NOT NULL,
    price           DECIMAL(20, 2) NOT NULL,
    count           BIGINT         NOT NULL,
    description     TEXT,
    FOREIGN KEY (category_id) REFERENCES category (id),
    FOREIGN KEY (product_type_id) REFERENCES product_type (id),
    FOREIGN KEY (brand_id) REFERENCES brand (id)
);
-- product_properties
CREATE TABLE IF NOT EXISTS product_properties
(
    id             BIGINT PRIMARY KEY AUTO_INCREMENT,
    product_id     BIGINT         NOT NULL,
    property_name  VARCHAR(255)   NOT NULL,
    property_value VARCHAR(255)   NOT NULL,
    property_price DECIMAL(20, 2) NOT NULL,
    FOREIGN KEY (product_id) REFERENCES product (id)
);
-- product_images
CREATE TABLE IF NOT EXISTS product_images
(
    id         BIGINT PRIMARY KEY AUTO_INCREMENT,
    product_id BIGINT NOT NULL,
    image      VARCHAR(2048),
    FOREIGN KEY (product_id) REFERENCES product (id)
);
-- order
CREATE TABLE IF NOT EXISTS orders
(
    id           BIGINT PRIMARY KEY AUTO_INCREMENT,
    user_id      BIGINT,
    user_name    VARCHAR(255) NOT NULL,
    user_surname VARCHAR(255) NOT NULL,
    phone        VARCHAR(32)  NOT NULL,
    address      VARCHAR(512) NOT NULL,
    email        VARCHAR(255),
    comment      TEXT,
    data_time    DATETIME     NOT NULL,
    FOREIGN KEY (user_id) REFERENCES user (id)
);
-- orders-products
CREATE TABLE IF NOT EXISTS orders_products
(
    orders_id  BIGINT         NOT NULL,
    product_id BIGINT         NOT NULL,
    count      BIGINT         NOT NULL,
    order_sum  DECIMAL(20, 2) NOT NULL,
    PRIMARY KEY (orders_id, product_id),
    FOREIGN KEY (orders_id) REFERENCES orders (id),
    FOREIGN KEY (product_id) REFERENCES product (id)
);