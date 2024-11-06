create or replace function cancel_baton()
returns trigger
as $$
begin 
    if new.client_name ~ '[Бб]атон' then
        raise exception 'Canceled';
    end if;
    return new;
end;
$$ language plpgsql;

create trigger baton
before insert on clients
    for each row execute procedure cancel_baton();

create or replace function log_clients()
returns trigger
as $$
begin 
    insert into log(operation, stamp, userid, table_name)
    values (TG_OP, now(), user, TG_TABLE_NAME);
    return null;
end;
$$ language plpgsql;

create trigger clients
after insert or update or delete on clients
    for each row execute procedure log_clients();

create table log(
    operation text not null,
    stamp timestamp not null,
    userid text not null,
    table_name text not null
)

create or replace function no_numbers_in_clients()
returns trigger 
as $$
begin
    if new.client_name ~ '\d' then
        raise exception 'No numbers in my client table';
    end if;
    return new;
end;
$$ language plpgsql;

create trigger no_number_clients
before insert on clients
    for each row execute procedure no_numbers_in_clients();
