create or replace function no_drop_log()
returns event_trigger 
as $$
declare
    obj record;
begin
    for obj in select * from pg_event_trigger_dropped_objects()
    loop
        if obj.object_name ~ '^log$' then
            raise exception 'You cannot drop log';
        end if;
    end loop;
end;
$$ language plpgsql;

create event trigger no_drop
on sql_drop
execute function no_drop_log();

create or replace function from_six_to_ten()
returns event_trigger
as $$
declare
    current_hour integer = extract('hour' from current_time);
begin
    if current_hour not between 6 and 22 then
        raise exception 'Not yet';
    end if;
end;
$$ language plpgsql;

create event trigger from_six_to_ten_trigger
on ddl_command_start
execute function from_six_to_ten();
