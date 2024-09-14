create table contracts (
    contract_id smallint not null,
    client_id smallint not null,
    tariff_id smallint not null,
    start_date date not null,
    end_date date not null,
    parking_space_id smallint not null,
    entry_permit boolean not null,
    constraint contracts_pk primary key (contract_id)
);

create table tariffs (
    tariff_id smallint not null,
    tariff_price numeric(8, 2) not null,
    constraint tariffs_pk primary key (tariff_id)
);

create table clients (
    client_id smallint not null,
    client_name varchar(60) not null,
    constraint clients_pk primary key (client_id)
);

create table cars (
    car_id varchar(10) not null,
    car_name varchar(30) not null,
    constraint cars_pk primary key (car_id)
);

create table payments (
    contract_id smallint not null,
    payment_id integer not null,
    payment_amount numeric(8, 2) not null,
    payment_date date not null,
    constraint payments_pk primary key (contract_id)
);

create table parking_spaces (
    parking_space_id smallint not null,
    parking_space_area smallint not null,
    constraint parking_spaces_pk primary key (parking_space_id)
);

create table passages (
    contract_id smallint not null,
    passage_id integer not null,
    passage_date date not null,
    passage_type varchar(5) not null,
    car_id varchar(10) not null,
    constraint passages_pk primary key (contract_id, passage_id)
);
