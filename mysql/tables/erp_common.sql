/**
 * erp common tables
 * requires:
 */

create table erp_dimensions
(
	id int not null comment 'dimension id',
	name varchar(100) not null,
	primary key (id),
	unique key (name)
)
engine innodb
default character set utf8
comment 'table of dimensions';

create table erp_currencies
(
	id int not null comment 'currency id',
	name varchar(100) not null,
	symbol varchar(10) not null,
	primary key (id),
	unique key (name)
)
engine innodb
default character set utf8
comment 'table of currencies';