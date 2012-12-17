/**
 * erp hr tables
 * requires:
 * 	erp_clients
 * 	erp_users
 */

create table erp_employees
(
	id int not null auto_increment comment 'pk, employee id',
	client_id int not null comment 'fk erp_clients.id',
	user_id int comment 'fk erp_users.id',
	last_name varchar(100) not null,
	first_name varchar(100) not null,
	middle_name varchar(100) not null,
	prefix varchar(100),
	suffix varchar(100),
	created datetime not null,
	primary key (id),
	constraint fk_erp_employees_1 foreign key (client_id) references erp_clients(id),
	constraint fk_erp_employees_2 foreign key (user_id) references erp_users(id)
)
engine innodb
default character set utf8
comment 'table of employees';