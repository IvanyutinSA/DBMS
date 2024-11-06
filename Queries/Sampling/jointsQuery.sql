select car_name, passage_date
from cars, passages
where cars.car_number = passages.car_number;

select car_name, passage_date
from cars join passages
on cars.car_number = passages.car_number;

select car_name, passage_date
from cars left join passages
on cars.car_number = passages.car_number;

select car_name, passage_date
from cars right join passages
on cars.car_number = passages.car_number;

select car_name, passage_date
from cars full join passages
on cars.car_number = passages.car_number;

## cross join
## inner join
