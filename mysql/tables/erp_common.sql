/**
 * erp common tables
 * requires:
 */

create table erp_dimensions
(
	id int unsigned not null comment 'dimension id',
	name varchar(100) not null,
	primary key (id),
	unique key (name)
)
engine innodb
default character set utf8
comment 'table of dimensions';

create table erp_countries
(
	id varchar(2) not null comment 'country id or country code',
	name varchar(100) not null,
	primary key (id),
	unique key (name)
)
engine innodb
default character set utf8
comment 'countries';

create table erp_currencies
(
	id int unsigned not null comment 'currency id',
	name varchar(100) not null,
	symbol varchar(10) not null,
	created datetime not null,
	primary key (id),
	unique key (name)
)
engine innodb
default character set utf8
comment 'table of currencies';