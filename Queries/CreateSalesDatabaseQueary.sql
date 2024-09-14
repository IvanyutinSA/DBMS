-- Database: sales

drop database if exists sales;

create database sales
    with
    owner = postgres
    encoding = 'UTF8'
    lc_collate = 'ru_RU.utf8'
    lc_ctype = 'ru_RU.utf8'
    tablespace = pg_default
    connection limit = -1
    is_template = False
    template = template0;

comment on database sales
    is 'База данных для службы оформления заказов на товары';
