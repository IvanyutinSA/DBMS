select distinct car_name from cars;

select * from passages
where passage_date between '09-01-2024' and '09-30-2024';

select * from passages
where passage_date between '09-01-2024' and '09-30-2024'
limit 3;

select * from passages
where passage_date between '09-01-2024' and '09-30-2024'
limit 3 offset 3;

select car_number from cars 
where car_number like '%55rus';

select car_number from cars 
where car_number not like '%55rus';

select car_number from cars 
where car_number ~ '55rus$';

select count(passage_date), max(passage_date), min(passage_date) from passages
where passage_date between '09-01-2024' and '09-30-2024'
limit 3;

select car_name from cars
where car_number = any(select car_number from passages
                    where passage_date between '09-01-2024' and '09-30-2024');

select tariff_id, tariff_price,
        case when tariff_price <= 500 then 'Okey'
             when tariff_price <= 750 then 'Expencive, but okey'
             else 'Scam'
        end as Category
from tariffs;

select contract_id, min(payment_date) as "first payment date",sum(payment_amount) as "total_payment_amount"
from payments
group by contract_id
order by "first payment date", "total_payment_amount";
