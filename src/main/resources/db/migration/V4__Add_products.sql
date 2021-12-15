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

insert into product (category_id, product_type_id, brand_id, name, price, count, description)
values (1, 1, 1, 'Iphone 11', 650 , 10, 'Black'),
       (1, 1, 2, 'Galaxy A51', 250, 1, 'Purple'),
       (1, 1, 1, 'Iphone 13', 1200, 5, 'Black');

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
       (3, 4, '256 ГБ');

insert into product_images (product_id, image)
values (1, '/static/img/products/mobile/apple/Iphone-11-black.jpg'),
       (2, '/static/img/products/mobile/samsung/Samsung-galaxy-z-flip-purple.png'),
       (3, '/static/img/products/mobile/apple/Iphone-13-mini-black.png');
