/**
 * user, roles and permissions procedures and functions
 * requires:
 * 	
 */

delimiter //

create function sp_user_add
(
	p_client_id int unsigned
	p_uname varchar,
	p_fname varchar
)
	returns int unsigned
	language sql
	modifies sql data
begin
	insert into erp_users
	( client_id, user_name, full_name, created )
	values
	( p_client_id, p_uname, p_fname, sysdate());
	
	return last_insert_id();
end;
/* sp_user_add */
//