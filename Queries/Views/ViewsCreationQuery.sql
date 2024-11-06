create view cars_55 as
select * from cars
where car_number ~ '(?<=\D)55(?=\D)';

create materialized view september_clients
select client_name, start_date as date
from clients, contracts
where contracts.client_id = clients.client_id and
      start_date between '09-01-2024' and '09-30-2024';


create materialized view payments_total as 
select contract_id, min(payment_date) as first_payment_date,sum(payment_amount) as total_payment_amount
from payments
group by contract_id
order by first_payment_date, total_payment_amount
with no data;
