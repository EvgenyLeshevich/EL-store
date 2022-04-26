insert into address (id, country_id, city_id, apartment_address, postcode)
values (1, 1, 1, 'улица Варвашени 7/41', '247007');

insert into user (id, username, password, active, phone_number, email, name, surname, address_id)
values (1, 'admin', '{noop}admin', true, '+375292053578', 'evgeniy.leshevich@yandex.by', 'Evgeniy', 'Leshevich', 1);

insert into user_roles (user_id, roles)
values (1, 'USER'),
       (1, 'ADMIN');

UPDATE user SET password = '{bcrypt}$2a$10$i7UCQgIEWTgNCjwkyOZBBufRdo1THvZo4BmQkf275F5LxijzHZO0y' where username = 'admin';