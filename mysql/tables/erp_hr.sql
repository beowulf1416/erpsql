/**
 * erp hr tables
 * requires:
 * 	erp_clients
 */

create table erp_employees
(
	id int not null auto_increment comment 'pk, employee id',
	client_id int not null comment 'fk erp_clients.id',
	primary key (id),
	constraint fk_erp_employees_1 foreign key (client_id) references erp_clients(id)
)
engine innodb
default character set utf8
comment 'table of employees';