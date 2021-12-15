-- country
CREATE TABLE IF NOT EXISTS country
(
    id   BIGINT PRIMARY KEY AUTO_INCREMENT,
    country_name VARCHAR(255) NOT NULL
);
-- city
CREATE TABLE IF NOT EXISTS city
(
    id         BIGINT PRIMARY KEY AUTO_INCREMENT,
    city_name  VARCHAR(255) NOT NULL,
    country_id BIGINT       NOT NULL,
    FOREIGN KEY (country_id) REFERENCES country (id)
);
-- address
CREATE TABLE IF NOT EXISTS address
(
    id                BIGINT PRIMARY KEY AUTO_INCREMENT,
    country_id        BIGINT NOT NULL,
    city_id           BIGINT NOT NULL,
    apartment_address VARCHAR(2048),
    postcode          VARCHAR(255),
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
    phone_number    VARCHAR(32)  NOT NULL,
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
    roles    VARCHAR(255),
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
    description     VARCHAR(2048),
    FOREIGN KEY (category_id) REFERENCES category (id),
    FOREIGN KEY (product_type_id) REFERENCES product_type (id),
    FOREIGN KEY (brand_id) REFERENCES brand (id)
);
-- property
CREATE TABLE IF NOT EXISTS property
(
    id            BIGINT PRIMARY KEY AUTO_INCREMENT,
    property_name VARCHAR(255) NOT NULL
);
-- product_properties
CREATE TABLE IF NOT EXISTS product_properties
(
    id             BIGINT PRIMARY KEY AUTO_INCREMENT,
    product_id     BIGINT       NOT NULL,
    property_id    BIGINT       NOT NULL,
    property_value VARCHAR(255) NOT NULL,
    FOREIGN KEY (product_id) REFERENCES product (id),
    FOREIGN KEY (property_id) REFERENCES property (id)
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
    id                BIGINT PRIMARY KEY AUTO_INCREMENT,
    user_id           BIGINT,
    user_name         VARCHAR(255),
    user_surname      VARCHAR(255),
    phone             VARCHAR(32),
    email             VARCHAR(255),
    country           VARCHAR(255),
    city              VARCHAR(255),
    postcode          VARCHAR(255),
    apartment_address VARCHAR(512),
    comment           VARCHAR(2048),
    data_time         DATETIME,
    FOREIGN KEY (user_id) REFERENCES user (id)
);
-- orders-products
CREATE TABLE IF NOT EXISTS orders_products
(
    id         BIGINT PRIMARY KEY AUTO_INCREMENT,
    orders_id  BIGINT,
    product_id BIGINT,
    count      BIGINT,
    order_sum  DECIMAL(20, 2),
    status     VARCHAR(255),
    data_cookie VARCHAR(2048),
    user_id    BIGINT,
    FOREIGN KEY (orders_id) REFERENCES orders (id),
    FOREIGN KEY (product_id) REFERENCES product (id)
);