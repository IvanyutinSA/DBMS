create or replace function car_region(number text) returns text
language plpgsql as $$
begin
    return substring(number, '\d+(?=\D+$)');
end
$$;

create or replace function car_country(number text) returns text
language plpgsql as $$
begin
    return substring(number, '\D+$');
end
$$;
