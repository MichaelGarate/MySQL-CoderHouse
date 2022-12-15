-- CONTAR LA CANTIDAD DE CLIENTES QUE TIENEN "X" SERVICIO
drop function if exists fn_count_servicio;
delimiter //
create function fn_count_servicio (id_del_servicio int)
returns varchar(300)
no sql
begin
declare id_servicio int;
declare resultado varchar(300);
set id_servicio = (select count(servicio) from cliente
where servicio = id_del_servicio);
set resultado = concat('Hay ',id_servicio,' clientes con el servicio ',id_del_servicio);
return resultado;
end //
delimiter ;

-- Buscar cuantos clientes tiene el servicio 201
select fn_count_servicio(201) as Servicio;

drop function if exists fn_comunas_x_region;
delimiter //
CREATE FUNCTION `fn_comunas_x_region`(Nombre_de_region varchar(60)) 
RETURNS varchar(300)
NO SQL
begin
declare region_nombre varchar(60);
declare resultado varchar(400);

set region_nombre = (select count(nombre_comuna) from comuna 
where Region = Nombre_de_region);


set resultado =concat('Hay ',region_nombre,' comunas con disponibilidad de servicio en la region ', Nombre_de_region) ;
return resultado;
end