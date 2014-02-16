/**
 * postgresql
 * requires:
 * 	../erp.sql
 */

create table erp.globals (
	id varchar(100) not null,
	value text not null,
	constraint pk_globals primary key (id)
);

create table erp.dimensions (
	id unsigned int not null ,
	name varchar(100) not null,
	symbol varchar(10) not null,
	description varchar(100) not null, 
	constraint pk_dimensions primary key (id),
	constraint u_dimensions_1 unique key (name),
	constraint u_dimensions_2 unique key (symbol)
);

