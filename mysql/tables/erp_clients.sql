/**
 * erp client tables
 * requires:
 * 	erp_common
 */

create table erp_clients
(
	id int not null auto_increment comment 'pk, client_id',
	name varchar(200) not null,
	currency_id int not null comment 'default currency, fk erp_currencies.id',
	created datetime not null,
	primary key (id),
	unique key (name),
	constraint fk_erp_clients_1 foreign key (currency_id) references erp_clients(id)
)
engine innodb
default character set utf8
comment 'table of clients';

create table erp_orgs
(
	id int not null auto_increment comment 'pk organization id',
	client_id int not null comment 'fk erp_clients.id',
	name varchar(200) not null,
	primary key (id),
	unique key (name),
	constraint fk_erp_orgs_1 foreign key (client_id) references erp_clients(id)
)
engine innodb
default character set utf8
comment 'organizations';