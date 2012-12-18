/**
 * erp users
 * requires:
 * 	erp_clients
 */

create table erp_users
(
	id int unsigned not null auto_increment comment 'user id',
	client_id int unsigned not null comment 'fk erp_clients.id',
	user_name varchar(100) not null,
	full_name varchar(500) not null,
	created datetime not null,
	active tinyint unsigned not null default 0 comment '0 = active otherwise inactive',
	primary key (id),
	unique key (user_name),
	constraint fk_erp_users foreign key (client_id) references erp_clients(id)
)
engine innodb
default character set utf8
comment 'table of erp users';

create table erp_roles
(
	id int unsigned not null auto_increment comment 'role id',
	client_id int unsigned not null comment 'fk erp_clients.id',
	name varchar(100) not null,
	active tinyint not null default 0 comment '0 - active otherwise inactive',
	primary key (id),
	unique key (client_id, name),
	constraint fk_erp_roles_1 foreign key (client_id) references erp_clients(id)
)
engine innodb
default character set utf8
comment 'roles';

create table erp_permissions
(
	id int unsigned not null auto_increment comment 'permission id',
	name varchar(200),
	active tinyint not null default 0 comment '0 - active otherwise inactive',
	primary key (id),
	unique key (name)
)
engine innodb
default character set utf8
comment 'permissions';

create table erp_user_roles
(
	user_id int unsigned not null comment 'fk erp_users.id',
	role_id int unsigned not null comment 'fk erp_roles.id',
	primary key (user_id, role_id),
	constraint erp_user_roles_1 foreign key (user_id) references erp_users(id),
	constraint erp_user_roles_2 foreign key (role_id) references erp_roles(id)
)
engine innodb
default character set utf8
comment 'user roles';

create table erp_role_perms
(
	role_id int unsigned not null comment 'fk, erp_roles.id',
	perm_id int unsigned not null comment 'fk erp_permissions.id',
	primary key (role_id, perm_id),
	constraint fk_erp_role_perms_1 foreign key (role_id) references erp_roles(id),
	constraint fk_erp_role_perms_2 foreign key (perm_id) references erp_permissions(id)
)
engine innodb
default character set utf8
comment 'role permissions';