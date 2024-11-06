begin;
    insert into cars (car_number, car_name)
    values ('А000АА00rus', 'Honda Civic');
    savepoint point;
    delete from cars
    where car_number = 'А000АА00rus';
    rollback to savepoint point;
commit;

select * from cars;

delete from cars
where car_number = 'А000АА00rus';
