
delimiter //

drop function if exists erp_currency_add;
create function erp_currency_add
(
	p_name varchar(100),
	p_symbol varchar(10)
)
	returns int unsigned
	comment 'add a currency'
	language sql
	not deterministic
	modifies sql data
begin
	insert into erp_currencies
	( name, symbol, created )
	values
	( p_name, p_symbol, sysdate() );
	
	return last_insert_id();
end ;
/* erp_currency_add */
// 

drop procedure if exists erp_countries;
create procedure erp_countries
()
	comment 'retrieve list of countries'
	language sql
	deterministic
	reads sql data
begin
	select id, name
	from erp_countries;
end ;
/* erp_countries */
//

delimiter ;