insert into address (id, country_id, city_id, apartment_address, postcode)
values (1, 1, 1, 'улица Варвашени 7/41', '247007');

insert into user (id, username, password, active, phone_number, email, name, surname, address_id)
values (1, 'admin', 'admin', true, '+375292053578', 'evgeniy.leshevich@yandex.by', 'Evgeniy', 'Leshevich', 1);

insert into user_roles (user_id, roles)
values (1, 'USER'),
       (1, 'ADMIN');