/**
 * postgres
 * requires:
 * 	../erp.sql
 */

create table erp.clients (
	id unsigned int not null,
	name varchar(200) not null,
	constraint pk_clients primary key (id),
	constraint u_clients_1 unique key (name)
);
