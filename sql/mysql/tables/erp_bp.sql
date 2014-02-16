create table erp_bps (
	id bigint unsigned not null autoincrement comment 'pk, business partner id',
	active tinyint unsigned comment 'null = active, 1 = inactive',
	client_id bigint unsigned not null comment 'fk, erp_clients.id',
	name varchar(100) not null comment 'name',
	description varchar(200) not null comment 'description',
	is_customer tinyint unsigned not null default 0 comment '0 = not a customer',
	is_vendor tinyint unsigned not null default 0 comment '0 = not a vendor',
	is_employee tinyint unsigned not null default 0 comment '0 = not an employee',
	constraint pk_erp_bps primary key (id),
	constraint u_erp_pbs_1 unique key (client_id, name, active),
	constraint fk_erp_bps_1 foreign key (client_id) references erp_clients(id)
)
engine innodb
comment 'business partners';

create table erp_customers (
	id bigint unsigned not null autoincrement comment 'fk, business partner id',
	active tinyint unsigned comment 'null = active, 1 = inactive',
	client_id bigint unsigned not null comment 'fk, erp_clients.id',
	constraint pk_erp_customers primary key (id),
	constraint fk_erp_customers_1 foreign key (client_id) references erp_clients(id)
)
engine innodb
comment 'customers';

create table erp_vendors (
	id bigint unsigned not null autoincrement comment 'fk, business partner id',
	active tinyint unsigned comment 'null = active, 1 = inactive',
	client_id bigint unsigned not null comment 'fk, erp_clients.id',
	constraint pk_erp_vendors primary key (id),
	constraint fk_erp_vendors_1 foreign key (client_id) references erp_clients(id)
)
engine innodb
comment 'vendors';

create table erp_employees (
	id bigint unsigned not null autoincrement comment 'fk, business partner id',
	active tinyint unsigned comment 'null = active, 1 = inactive',
	client_id bigint unsigned not null comment 'fk, erp_clients.id',
	constraint pk_erp_employees primary key (id),
	constraint fk_erp_employees_1 foreign key (client_id) references erp_clients(id)
)
engine innodb
comment 'employees';