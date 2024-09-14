alter table contracts
add constraint contracts_fk1 foreign key (client_id)
references clients (client_id)
on delete cascade
on update cascade;

alter table contracts
add constraint contracts_fk2 foreign key (tariff_id)
references tariffs (tariff_id)
on delete cascade
on update cascade;

alter table contracts
add constraint contracts_fk3 foreign key (parking_space_id)
references parking_spaces (parking_space_id)
on delete cascade
on update cascade;

alter table payments
add constraint payments_fk foreign key (contract_id)
references contracts (contract_id)
on delete cascade
on update cascade;

alter table passages
add constraint passages_fk1 foreign key (contract_id)
references contracts (contract_id)
on delete cascade
on update cascade;

alter table passages
add constraint passages_fk2 foreign key (car_id)
references cars (car_id)
on delete cascade
on update cascade;
