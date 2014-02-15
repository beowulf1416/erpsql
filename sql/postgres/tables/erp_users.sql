/**
 * postgres
 * requires:
 * 	../erp.sql
 * 	erp_clients.sql
 */

create sequence users_seq;

create table erp.users (
	id unsigned int not null default nextval('users_seq'),
	name varchar(100) not null,
	email varchar(100),
	pw varchar(1024) not null,
	active unsigned int not null default 1,
	created datetime not null default now(),
	constraint pk_users primary key (id),
	constraint u_users_1 unique key (name),
	constraint u_users_2 unique key (email)
);

create sequence permissions_seq;

create table erp.permissions (
	id unsigned int not null default nextval('permissions_req'),
	name varchar(100) not null,
	active unsigned int not null default 1,
	constraint pk_permissions primary key (id),
	constraint u_permissions unique key (name)
);

create table sequence roles_seq;

create table erp.roles (
	id unsigned int not null default nextval('roles_seq'),
	client_id unsigned int not null,
	name varchar(100) not null,
	active unsigned int not null default 1,
	constraint pk_roles primary key (id),
	constraint u_roles_1 unique key (client_id,name),
	constraint fk_roles_1 foreign key (client_id) references erp.clients (id) on delete restrict
);

create table erp.role_permissions (
	client_id unsigned int not null,
	role_id unsigned int not null,
	permission_id unsigned int not null,
	constraint pk_role_permissions primary key (client_id, role_id, permission_id),
	constraint fk_role_permissions_1 foreign key (client_id) references erp.clients (id) on delete restrict,
	constraint fk_role_permissions_2 foreign key (role_id) references erp.roles (id) on delete restrict,
	constraint fk_role_permissions_3 foreign key (permission_id) references erp.permissions (id) on delete restrict
);

create table erp.user_roles (
	client_id unsigned int not null,
	user_id unsigned int not null,
	role_id unsigned int not null,
	constraint pk_user_roles primary key (client_id, user_id, role_id),
	constraint fk_user_roles_1 foreign key (client_id) references erp.clients (id) on delete restrict,
	constraint fk_user_roles_2 foreign key (user_id) references erp.users (id) on delete restrict,
	constraint fk_user_roles_3 foreign key (role_id) references erp.roles (id) on delete restrict
);