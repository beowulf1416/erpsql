/**
 * user, roles and permissions procedures and functions
 * requires:
 * 	
 */

delimiter //

drop function if exists erp_user_add;
create function erp_user_add
(
	p_client_id int unsigned,
	p_uname varchar(100),
	p_fname varchar(500)
)
	returns int unsigned
	comment 'add a user'
	language sql
	not deterministic
	modifies sql data
begin
	declare no_such_client condition for 1452;
	declare continue handler for no_such_client
	begin
		return 0;
	end ;
	
	insert into erp_users
	( client_id, user_name, full_name, created )
	values
	( p_client_id, p_uname, p_fname, sysdate());
	
	return last_insert_id();
end;
/* erp_user_add */
//

drop procedure if exists erp_user_active;
create procedure erp_user_active
(
	in p_user_id int unsigned,
	in p_active tinyint
)
	comment 'toggles the active status field'
	language sql
	not deterministic
	modifies sql data
begin
	update erp_users set
	active = p_active
	where id = p_user_id;
end ;
/* erp_user_active */
//

drop function if exists erp_role_add;
create function erp_role_add
(
	p_client_id int unsigned,
	p_name varchar(100)
)
	returns int unsigned
	comment 'add a role'
	language sql
	not deterministic
	modifies sql data
begin
	declare no_such_client condition for 1452;
	declare continue handler for no_such_client
	begin
		return 0;
	end ;
	
	insert into erp_roles
	( client_id, name )
	values
	( p_client_id, p_name );
	
	return last_insert_id();
end ;
/* erp_role_add */
//

drop procedure if exists erp_role_active;
create procedure erp_role_active
(
	in p_role_id int unsigned,
	in p_active tinyint
)
	comment 'toggles active status field of a role'
	language sql
	not deterministic
	modifies sql data
begin
	update erp_roles set
	active = p_active
	where id = p_role_id;
end ;
/* erp_role_active */
//

drop function if exists erp_permission_add;
create function erp_permission_add
(
	p_name varchar(200)
)
	returns int unsigned
	comment 'add a permission'
	language sql
	not deterministic
	modifies sql data
begin
	insert into erp_permissions
	( name )
	values
	( p_name );
	
	return last_insert_id();
end ;
/* erp_permission_add */
//

drop procedure if exists erp_user_role_add;
create procedure erp_user_role_add
(
	in p_user_id int unsigned,
	in p_role_id int unsigned
)
	comment 'adds a role to a user'
	language sql
	deterministic
	modifies sql data
begin
	insert into erp_user_roles
	( user_id, role_id )
	values
	( p_user_id, p_role_id );
end ;
/* erp_user_role_add */
//

drop procedure if exists erp_user_role_remove;
create procedure erp_user_role_remove
(
	in p_user_id int unsigned,
	in p_role_id int unsigned
)
	comment 'removes a role from a user'
	language sql
	deterministic
	modifies sql data
begin
	delete from erp_user_roles
	where user_id = p_user_id
		and role_id = p_role_id;
end ;
/* erp_user_role_remove */
//

drop procedure if exists erp_role_perm_add;
create procedure erp_role_perm_add
(
	in p_role_id int unsigned,
	in p_perm_id int unsigned
)
	comment 'assign a permission to a role'
	language sql
	deterministic
	modifies sql data
begin
	insert into erp_role_perms
	( role_id, perm_id )
	values
	( p_role_id, p_perm_id );
end ;
/* erp_role_perm_add */
//

drop procedure if exists erp_role_perm_remove;
create procedure erp_role_perm_remove
(
	in p_role_id int unsigned,
	in p_perm_id int unsigned
)
	comment 'remove a permission from a role'
	language sql
	deterministic
	modifies sql data
begin
	delete from erp_role_perms
	where role_id = p_role_id
		and perm_id = p_perm_id;
end ;
/* erp_role_perm_remove */
//

drop procedure if exists erp_user_perms;
create procedure erp_user_perms
(
	in p_user_id int unsigned
)
	comment 'retrieve all permissions assigned to a user'
	language sql
	deterministic
	reads sql data
begin
	
end ;
/* erp_user_perms */
//


delimiter ;