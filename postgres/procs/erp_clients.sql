/**
 * postgres
 * requires:
 * 	../erp.sql
 */

create function erp.user_authenticate (
	user_name varchar(100),
	pw varchar(1024)
)
	returns unsigned int as $$
declare
	uid unsigned int;
begin
	select id into uid
	from erp.users a
	where a.name = user_name
		and a.pw = pw;
		
	return uid;
end ;
$$

create function erp.user_login (
	user_name varchar(100),
	pw varchar(1024)
)
	returns unsigned int as $$
declare
	uid unsigned int;
begin
	
end ;
$$