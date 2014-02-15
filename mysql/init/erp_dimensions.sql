/**
 * initialize erp_dimensions table
 */
insert into erp_dimensions 
( id, name) 
values 
(1, 'quantity'),
(2, 'time'),
(3, 'length'),
(4, 'area'),
(5, 'volume');

insert into erp_units
( dimension_id, id, name, symbol )
values
(1, 1, 'quantity', 'qty'),
(1, 2, 'piece', 'pc'),
(2, 3, 'second', 's'),
(2, 4, 'minute', 'min'),
(2, 5, 'hour', 'h'),
(2, 6, 'day', 'd'),
(2, 7, 'week', 'w'),
(2, 8, 'month', 'm'),
(2, 9, 'year', 'y'),
(3, 10, 'meter', 'm'),
(3, 11, 'square meter', 'm²');
(4, 12, 'cubic meter', 'm³');