/**
 * erp client tables
 * requires:
 * 	erp_common
 */

create table erp_clients
(
	id int unsigned not null auto_increment comment 'pk, client_id',
	name varchar(200) not null,
	currency_id int unsigned not null comment 'default currency, fk erp_currencies.id',
	active tinyint not null default 0 comment '0 - active otherwise inactive',
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
	id int unsigned not null auto_increment comment 'pk organization id',
	client_id int unsigned not null comment 'fk erp_clients.id',
	name varchar(200) not null,
	primary key (id),
	unique key (name),
	constraint fk_erp_orgs_1 foreign key (client_id) references erp_clients(id)
)
engine innodb
default character set utf8
comment 'organizations';

create table erp_orgs_tree
(
	client_id int unsigned not null comment 'fk, erp_clients.id',
	org_id int unsigned not null comment 'fk erp_orgs.id',
	parent_org_id int unsigned not null comment 'fk erp_orgs.id',
	primary key(org_id, parent_org_id),
	index idx_erp_orgs_tree_1 (org_id),
	index idx_erp_orgs_tree_2 (parent_org_id),
	constraint fk_erp_orgs_tree_1 foreign key (client_id) references erp_clients(id),
	constraint fk_erp_orgs_tree_2 foreign key (org_id) references erp_orgs(id),
	constraint fk_erp_orgs_tree_3 foreign key (parent_org_id) references erp_orgs(id)
)
engine innodb
default character set utf8
comment 'organizational tree';