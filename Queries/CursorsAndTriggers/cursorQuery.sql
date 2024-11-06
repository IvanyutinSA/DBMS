create or replace procedure car_select(
    in _car_name text,
    in _car_number text
)
language 'plpgsql'
as $$
declare 
    car_number text;
    car_name text;
    cur cursor for
        select cars.car_name, cars.car_number
        from cars
        where (_car_name is null or cars.car_name ~ _car_name) and
              (_car_number is null or cars.car_number ~ _car_number);
begin 
    open cur;
    loop
        fetch cur into car_name, car_number;
        exit when not found;
        raise notice '%, %', car_name, car_number;
    end loop;
    close cur;
end;
$$;

create or replace procedure car_select_back_and_forth()
language 'plpgsql'
as $$
declare 
    car_number text;
    car_name text;
    flag integer;
    cur cursor for
        select * from cars;
begin
    open cur;
    flag = 0;
    loop
        if flag = 0 then
            fetch forward from cur into car_number, car_name;
        else
            fetch prior from cur into car_number, car_name;
        end if;

        if not found then
            flag = flag + 1;
        else
            raise notice '%, %', car_number, car_name;
        end if;

        if flag = 2 then
            exit;
        end if;
    end loop;
    close cur;
end;
$$;

create or replace procedure september_clients()
language 'plpgsql'
as $$
declare
    client_id integer;
    contract_id integer;
    cur cursor for
        select contracts.client_id, contracts.contract_id
        from clients, contracts
        where clients.client_id = contracts.client_id and
              contracts.start_date between '09-01-2024' and '09-30-2024';
begin
    open cur;
    loop
        fetch cur into client_id, contract_id;
        exit when not found;
        insert into september(client_id, contract_id)
               values (client_id, contract_id);
    end loop;
    close cur;
end;
$$;

