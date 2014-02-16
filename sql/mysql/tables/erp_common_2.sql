/**
 * erp tables
 * requires:
 * 	erp_clients
 */


create table erp_units 
(
	id int unsigned not null comment 'unit id',
	client_id int unsigned not null comment 'fk, erp_clients.id',
	dimension_id int unsigned not null comment 'fk erp_dimensions.id',
	name varchar(100) not null,
	symbol varchar(20) not null,
	primary key (id),
	unique key (name),
	constraint fk_erp_units_1 foreign key (client_id) references erp_clients(id),
	constraint fk_erp_units_2 foreign key (dimension_id) references erp_dimensions(id)
)
engine innodb
default character set utf8
comment 'table of units';