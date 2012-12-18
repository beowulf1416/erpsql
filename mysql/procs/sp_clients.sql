/**
 * erp clients functions and procedures
 * requires:
 * 	sp_users
 */

delimiter //

drop function if exists erp_client_add;
create function erp_client_add
(
	p_name varchar(200),
	p_currency_id int unsigned
)
	returns int
	comment 'add a client'
	language sql
	modifies sql data
begin
	declare client_id int unsigned;
	
	declare no_such_currency condition for 1452;
	declare continue handler for no_such_currency
	begin
		return 0;
	end ;
	
	insert into erp_clients
	( name, currency_id, created )
	values
	( p_name, p_currency_id, sysdate() );
	
	set client_id = last_insert_id();
	
	-- create client admin account
	
	return client_id;
end;
/* erp_client_add */
//

delimiter ;