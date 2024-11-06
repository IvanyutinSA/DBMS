create or replace procedure cars_insert(_car_name text, _car_number text)
language sql
as $$
    insert into cars (car_name, car_number)
    values (_car_name, _car_number);
$$;

create or replace procedure cars_name_update(_car_name text, _car_number text)
language sql
as $$
    update cars set
        car_name = _car_name, 
        car_number = _car_number
    where 
        car_number = _car_number
$$;

create or replace procedure cars_drop(_car_number text)
language sql
as $$
    delete from cars
    where car_number = _car_number;
$$;
