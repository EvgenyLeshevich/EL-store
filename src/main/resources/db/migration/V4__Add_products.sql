insert into brand (name)
values ('Apple'),
       ('Samsung'),
       ('Huawei');

insert into product_type (name)
values ('SmartphoneController'),
       ('Laptop');

insert into category (name)
values ('Smartphones and gadgets'),
       ('Laptops and computers');

insert into product (category_id, product_type_id, brand_id, name, price, count, description, number_of_purchases)
values (1, 1, 1, 'Iphone 11', 650 , 10, 'Black', 0),
       (1, 1, 2, 'Galaxy A51', 250, 1, 'Purple', 5),
       (1, 1, 1, 'Iphone 13', 1200, 5, 'Black', 2),
       (1, 1, 2, 'Galaxy Note20 Ultra', 1000, 25, 'Black', 0),
       (1, 1, 1, 'Iphone 12', 950, 1, 'Red', 12),
       (1, 1, 1, 'Iphone 13 Pro', 1700, 4, 'Blue', 1),
       (1, 1, 2, 'Galaxy Z Fold3 5G', 2100, 15, 'Black', 0);

insert into property (property_name)
values ('operating_system'),
       ('screen_technology'),
       ('processor'),
       ('flash_memory');

insert into product_properties (product_id, property_id, property_value)
values (1, 1, 'Apple iOS'),
       (1, 2, 'IPS'),
       (1, 3, 'Apple A13 Bionic'),
       (1, 4, '128 ГБ'),
       (2, 1, 'Android'),
       (2, 2, 'AMOLED'),
       (2, 3, 'Exynos 9611'),
       (2, 4, '128 ГБ'),
       (3, 1, 'Apple iOS'),
       (3, 2, 'IPS'),
       (3, 3, 'Apple A15 Bionic'),
       (3, 4, '256 ГБ'),
       (4, 1, 'Android'),
       (4, 2, 'Dynamic AMOLED 2x'),
       (4, 3, 'Exynos 990'),
       (4, 4, '256 ГБ'),
       (5, 1, 'Apple iOS'),
       (5, 2, 'OLED'),
       (5, 3, 'Apple A14 Bionic'),
       (5, 4, '64 ГБ'),
       (6, 1, 'Apple iOS'),
       (6, 2, 'OLED'),
       (6, 3, 'Apple A15 Bionic'),
       (6, 4, '128 ГБ'),
       (7, 1, 'Android'),
       (7, 2, 'Dynamic AMOLED 2x'),
       (7, 3, 'Qualcomm Snapdragon 888'),
       (7, 4, '512 ГБ');

insert into product_images (product_id, image)
values (1, '/static/img/products/mobile/apple/Iphone-11-black.jpg'),
       (2, '/static/img/products/mobile/samsung/Samsung-galaxy-z-flip-purple.png'),
       (3, '/static/img/products/mobile/apple/Iphone-13-mini-black.png'),
       (4, '/static/img/products/mobile/samsung/Samsung-Galaxy-Note20-Ultra.jpg'),
       (5, '/static/img/products/mobile/apple/Iphone-12-red.jpg'),
       (6, '/static/img/products/mobile/apple/Iphone-13-pro-blue.png'),
       (7, '/static/img/products/mobile/samsung/Samsung-Galaxy-Z-Fold3-black.jpg');

