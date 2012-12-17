/**
 * erp inventory tables
 * requires:
 * 	erp_clients
 */

create table erp_inv_items
(
	id int not null auto_increment comment 'item id',
	client_id int not null comment 'fk erp_clients.id',
	name varchar(500) not null,
	description text,
	dimension_id int not null comment 'default dimension, fk erp_dimensions.id',
	unit_id int not null comment 'default unit, fk erp_units.id',
	shelf_life decimal(10, 5) not null default 0,
	shelf_life_unit_id int not null comment 'fk, erp_units.id',
	length int,
	length_unit_id int comment 'fk, erp_units.id',
	width int,
	width_unit_id int comment 'fk, erp_units.id',
	height int,
	height_unit_id int comment 'fk, erp_units.id',
	created datetime not null,
	primary key (id),
	unique key (id),
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
	item_id int not null comment 'fk, erp_inv_items.id',
	client_id int not null comment 'fk erp_clients.id',
	from_unit_id int not null comment 'fk erp_units.id',
	to_unit_id int not null comment 'fk erp_units.id',
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
	item_id int not null comment 'fk, erp_inv_items.id',
	balance decimal(10, 5) not null default 0,
	primary key (item_id),
	constraint fk_erp_inv_item_balances_1 foreign key (item_id) references erp_inv_items(id)
)
engine innodb
default character set utf8
comment 'item balances';