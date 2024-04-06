CREATE DATABASE IF NOT EXISTS warehouse;

use warehouse;

CREATE TABLE IF NOT EXISTS client(
    name varchar(255) not null,
    address varchar(255) not null,
    rfc varchar(255) not null,
    phone_number varchar(255) not null,
    email varchar(255) not null,
    contact_email_address varchar(255) not null,
    contact_name varchar(255) not null,
    contact_name_phone varchar(255) not null,
    client_id int auto_increment primary key    
);

CREATE TABLE IF NOT EXISTS product_category(
    name varchar(255) not null,
    description varchar(255) not null,
    enabled boolean not null default 1,
    last_updated datetime not null,
    product_category_id int auto_increment primary key
);

CREATE TABLE IF NOT EXISTS order_status(
    name varchar(255) not null,
    details varchar(255) not null,
    enabled boolean not null default 1,
    last_updated datetime not null,
    order_status_id int auto_increment primary key
);

CREATE TABLE IF NOT EXISTS provider(
    name varchar(255) not null,
    address varchar(255) not null,
    rfc varchar(255) not null,
    phone_number varchar(255) not null,
    email varchar(255) not null,
    contact_email_address varchar(255) not null,
    contact_name varchar(255) not null,
    contact_name_phone varchar(255) not null,
    enabled boolean not null default 1,
    provider_id int auto_increment primary key    
);

CREATE TABLE IF NOT EXISTS product_status(
    name varchar(255) not null,
    details varchar(255) not null,
    enabled boolean not null default 1,
    last_updated datetime not null,
    product_status_id int auto_increment primary key
);

CREATE TABLE IF NOT EXISTS product(
    name varchar(255) not null,
    description varchar(255) not null,
    color varchar(255) not null,
    brand varchar(255) not null,
    size varchar(255) not null,
    quantity varchar(255) not null,
    price decimal UNSIGNED ZEROFILL not null,
    discount_percentage varchar(255) not null,
    last_updated datetime not null,
    enabled boolean not null default 1,
    product_id int auto_increment primary key,
    product_category_id int,
    product_status_id int,
    provider_id int,
    constraint fk_product_category foreign key(product_category_id) references product_category(product_category_id),
    constraint fk_product_category foreign key(product_category_id) references product_category(product_category_id),
    constraint fk_product_status foreign key(product_status_id) references product_status(product_status_id),
    constraint fk_provider foreign key(provider_id) references provider(provider_id) 
);

CREATE TABLE IF NOT EXISTS orders(
    details varchar(255) not null,
    product_qty int not null,
    product_price decimal UNSIGNED ZEROFILL not null,
    product_discount int,
    placement_date datetime not null,
    order_hash varchar(255) not null,
    client_id int,
    order_status_id int,
    product_id int,
    constraint product_discount_ck check (product_discount between 0 and 60),
    constraint fk_client foreign key(client_id) references client(client_id),
    constraint fk_order_status foreign key(order_status_id) references order_status(order_status_id),
    constraint fk_product foreign key(product_id) references product(product_id)
);

/*
    TODO: CHANGELOG TABLE FOR EVERY OTHER TABLE
*/