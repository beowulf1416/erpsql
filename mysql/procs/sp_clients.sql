/**
 * erp clients functions and procedures
 * requires:
 * 	sp_users
 */

delimiter //

create function sp_client_add
(
	p_name varchar(200),
	p_unit_id int,
)
	returns int
	comment 'add a client'
	language sql
	modifies sql data
begin
	declare client_id int unsigned;
	
	insert into erp_clients
	( name, currency_id, created )
	values
	( p_name, p_unit_id, sysdate );
	
	client_id := last_insert_id();
	
	-- create client admin account
	
	return client_id;
end;
/* sp_client_add */
//