select client_name, total_payment_amount
from clients, payments_total, contracts
where clients.client_id = contracts.client_id and
      contracts.contract_id = payments_total.contract_id and
      contracts.contract_id = (
        select contract_id 
        from payments_total
        order by total_payment_amount desc
        limit 1
    );


-- Simple sort
with car_passages as (
select passages.car_number as car_number, count(*) as total_passages
from cars_55, passages
where passages.car_number = cars_55.car_number
group by passages.car_number
order by total_passages desc
)

select cars.car_name, cars.car_number, total_passages 
from cars, car_passages
where cars.car_number = car_passages.car_number;


-- Complex sort
select clients.client_name, cars_55.car_number, count(*) as total_passages 
from september_clients, clients, passages, contracts, cars_55
where clients.client_id = contracts.client_id and
      contracts.contract_id = passages.contract_id and
      passages.car_number = cars_55.car_number and
      september_clients.client_name = clients.client_name
group by cars_55.car_number, clients.client_name
order by clients.client_name, total_passages desc;
