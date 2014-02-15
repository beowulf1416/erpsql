/**
 * erp inventory tables
 * requires:
 * 	erp_clients
 */

create table erp_inv_items
(
	id bigint unsigned not null auto_increment comment 'item id',
	active tinyint unsiged not null comment 'null = active, 1 = inactive',
	client_id int unsigned not null comment 'fk erp_clients.id',
	name varchar(500) not null,
	description text,
	dimension_id int unsigned not null comment 'default dimension, fk erp_dimensions.id',
	unit_id int unsigned not null comment 'default unit, fk erp_units.id',
	shelf_life decimal(10, 5) not null default 0,
	shelf_life_unit_id int unsigned not null comment 'fk, erp_units.id',
	length int,
	length_unit_id int unsigned comment 'fk, erp_units.id',
	width int,
	width_unit_id int unsigned comment 'fk, erp_units.id',
	height int,
	height_unit_id int unsigned comment 'fk, erp_units.id',
	created datetime not null,
	constraint pk_inv_items primary key (id),
	constraint u_inv_items_1 unique key (client_id, name),
	constraint fk_erp_inv_items_1 foreign key (client_id) references erp_clients(id),
	constraint fk_erp_inv_items_2 foreign key (dimension_id) references erp_dimensions(id),
	constraint fk_erp_inv_items_3 foreign key (unit_id) references erp_units(id),
	constraint fk_erp_inv_items_4 foreign key (shelf_life_unit_id) references erp_units(id)
)
engine innodb
default character set utf8
comment 'inventory items';

create table erp_inv_item_units
(
	item_id bigint unsigned not null comment 'fk, erp_inv_items.id',
	client_id int unsigned not null comment 'fk erp_clients.id',
	from_unit_id int unsigned not null comment 'fk erp_units.id',
	to_unit_id int unsigned not null comment 'fk erp_units.id',
	factor decimal(10, 5) not null comment 'conversion factor',
	primary key (item_id, from_unit_id, to_unit_id),
	constraint fk_erp_inv_item_units_1 foreign key (item_id) references erp_inv_items(id),
	constraint fk_erp_inv_item_units_2 foreign key (client_id) references erp_clients(id),
	constraint fk_erp_inv_item_units_3 foreign key (from_unit_id) references erp_units(id),
	constraint fk_erp_inv_item_units_4 foreign key (from_unit_id) references erp_units(id)
)
engine innodb
default character set utf8
comment 'inventory item units and conversion factors';

create table erp_inv_item_balances
(
	item_id bigint unsigned not null comment 'fk, erp_inv_items.id',
	balance decimal(10, 5) not null default 0,
	primary key (item_id),
	constraint fk_erp_inv_item_balances_1 foreign key (item_id) references erp_inv_items(id)
)
engine innodb
default character set utf8
comment 'item balances';

create table erp_inv_item_substitutes
(
	item_id bigint unsigned not null comment 'fk erp_inv_items.id',
	substitute_id int unsigned  not null comment 'fk erp_inv_items.id'
	primary key (item_id, substitute_id),
	constraint fk_erp_inv_item_substitutes_1 foreign key (item_id) references erp_inv_items(id),
	constraint fk_erp_inv_item_substitutes_2 foreign key (substitute_id) references erp_inv_items(id)
)
engine innodb
default character set utf8
comment 'item substitutes';

create table erp_inv_item_components
(
	item_id bigint unsigned not null comment 'fk erp_inv_items.id',
	component_id int unsigned not null comment 'fk erp_inv_items.id',
)
engine innodb
default character set utf8
comment 'item components';

create table erp_inv_warehouses
(
	id int unsigned not null auto_increment comment 'pk, warehouse id',
	active tinyint unsigned comment 'null = active, 1 = inactive',
	client_id int unsigned not null comment 'fk, erp_clients.id',
	name varchar(100) not null comment 'warehouse name',
	constraint pk_inv_warehouses primary key (id),
	constraint u_inv_warehouses_1 unique key (client_id, active, name),
	constraint pk_inv_warehouses_1 foreign key (client_id) references erp_clients(id)
)
engine innodb
default character set utf8
comment 'inventory warehouses';

create table erp_inv_wh_labels
(
	id bigint unsigned not null auto_increment comment 'pk, locator label id',
	active tinyint unsigned comment 'null = active, 1 = inactive',
	client_id int unsigned not null comment 'fk, erp_clients.id',
	name varchar(50) not null comment 'label name',
	constraint pk_inv_wh_labels primary key (id),
	constraint u_inv_wh_labels_1 unique key (client_id, active, name),
	constraint fk_inv_wh_labels_1 foreign key (client_id) references erp_clients(id)
)
engine innodb
default character set utf8
comment 'inventory warehose storage locations label';

create table erp_inv_wh_locations
(
	id bigint unsigned not null auto_increment comment 'pk, location id',
	active tinyint unsigned comment 'null = active, 1 = inactive',
	client_id int unsigned not null comment 'fk, erp_clients.id',
	name varchar(100) not null comment 'location name',
	constraint pk_inv_wh_locations primary key (id),
	constraint u_inv_wh_locations unique key (client_id, active, name),
	constraint fk_inv_wh_locations_1 foreign key (client_id) references erp_clients(id)
)
engine innodb
default character set utf8
comment 'inventory warehouse storage locations';

create table erp_inv_wh_locators
(
	id bigint unsigned not null auto_increment comment 'pk, locator id',
	active tinyint unsigned comment 'null = active, 1 = inactive',
	client_id int unsigned not null comment 'fk, erp_clients.id',
	warehouse_id int unsigned not null comment 'fk, warehouse id',
	label_id unsigned not null comment 'fk, label id',
	label varchar(100) not null comment 'value',
	constraint pk_inv_wh_locators primary key (id),
	constraint u_inv_wh_locators unique key (client_id, active, warehouse_id, label_id, label),
	constraint fk_inv_wh_locators_1 foreign key (client_id) references erp_clients(id),
	constraint fk_inv_wh_locators_2 foreign key (warehouse_id) references erp_inv_warehouses(id),
	constraint fk_inv_wh_locators_3 foreign key (label_id) references erp_inv_wh_labels(id)
)
engine innodb
default character set utf8
comment 'inventory warehouse storage locators';

create table erp_inv_transaction_types
(
	id int unsigned not null auto_increment comment 'pk transaction type id',
	description varchar(100) not null,
	constraint pk_erp_inv_tran_types primary key (id)
)
engine innodb
default character set utf8
comment 'inventory transaction types';

create table erp_inv_trans
(
	id int unsigned not null auto_increment comment 'pk transaction id',
	client_id int unsigned not null comment 'fk erp_clients.id',
	transaction_type_id int unsigned not null comment 'fk, erp_inv_transaction_types.id',
	title varchar(100) not null,
	description text,
	created datetime not null,
	primary key (id),
	constraint fk_erp_inv_trans_1 foreign key (client_id) references erp_clients(id),
	constraint fk_erp_inv_trans_2 foreign key (transaction_type_id) references erp_inv_transaction_types(id)
)
engine innodb
default character set utf8
comment 'inventory transactions';

create table erp_inv_tran_items
(
	tran_id int unsigned not null comment 'fk erp_inv_trans.id',
	client_id int unsigned not null comment 'fk erp_clients.id',
	item_id bigint unsigned not null comment 'fk erp_inv_items.id',
	unit_id int unsigned not null comment 'fk erp_inv_units.id',
	qty decimal(12,6) not null comment 'quantity',
	constraint fk_erp_inv_tran_items_1 foreign key (tran_id) references erp_inv_trans(id),
	constraint fk_erp_inv_tran_items_2 foreign key (client_id) references erp_clients(id),
	constraint fk_erp_inv_tran_items_3 foreign key (item_id) references erp_inv_items(id),
	constraint fk_erp_inv_tran_items_4 foreign key (unit_id) references erp_units(id)
)
engine innodb
default character set utf8
comment 'inventory transaction items';

create table erp_inv_tran_in
(
	id bigint unsigned not null comment 'pk',
	tran_id int unsigned not null comment 'fk erp_inv_tran_in',
	item_id bigint unsigned not null comment 'fk, erp_inv_items.id',
	client_id int unsigned not null comment 'fk, erp_clients.id',
	expire_ts datetime null comment 'expire date if perishable',
	constraint pk_inv_tran_in primary key (id),
	constraint fk_inv_tran_in_1 foreign key (tran_id) references erp_inv_trans(id),
	constraint fk_inv_tran_in_2 foreign key ()
)
engine innodb
default character set utf8
comment 'inventory transaction items in'
