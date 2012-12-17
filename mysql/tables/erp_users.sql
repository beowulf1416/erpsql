/**
 * erp users
 * requires:
 * 	erp_clients
 */

create table erp_users
(
	id int not null auto_increment comment 'user id',
	client_id int not null comment 'fk erp_clients.id',
	user_name varchar(100) not null,
	full_name varchar(500) not null,
	created datetime not null,
	primary key (id),
	unique key (user_name),
	constraint fk_erp_users foreign key (client_id) references erp_clients(id)
)
engine innodb
default character set utf8
comment 'table of erp users';