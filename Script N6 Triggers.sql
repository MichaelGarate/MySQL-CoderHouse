-- muestra hora a la que se creo un nuevo servicio y que tipo de servicio se creo
drop trigger if exists trigg_log_servicio;
delimiter //
	create trigger trigg_log_servicio after insert on servicio
	for each row begin
	insert into AUDITORIA(accion, fecha, usuario) value (concat('Se creo el nuevo servicio: ', NEW.nombre_servicio,'. con id: ', new.id_servicio),(current_time),(current_user));
	end// 
delimiter ;
-- Crear un servicio mediante del uso de la store procedure"sp_create_servicio"

-- /////////////////////////////////////////////////////////////////////////////7
-- registra de la creacion de una factura
drop trigger if exists trigg_create_factura;
delimiter //
	create trigger trigg_create_factura after insert on factura
	for each row begin
	insert into auditoria(accion, fecha,usuario) value (concat('Se genero la factura: ',new.id_factura,'. Proveniente del usuario con ID: ',new.id_cliente),(current_time()),(current_user));
	end//
delimiter ;
-- Crear una factura mediante del uso de la store procedure"sp_create_factura"

-- /////////////////////////////////////////////////////////////////////////////7

-- trigger de advertencia al momento de intentar eliminar un registro de la tabla servicio
drop trigger if exists trigg_adv_del_serv;
delimiter //
	CREATE trigger trigg_adv_del_serv BEFORE DELETE on servicio
	for each row begin
	SIGNAL sqlstate '45000' SET	 message_text = 'No se permite eliminar el servicio';
	end // -- Cambiar 45000 por 01000 para eliminar definitivamente.
delimiter ;
-- Ejecucion para uso del trigger trigg_adv_del_serv
/*
delete from proyectofinal_coderhouse.servicio
 where id_servicio = 0;
*/

-- /////////////////////////////////////////////////////////////////////////////7

-- actualizara la infomacion del servicio y estado del servicio de un usuario mediante su ID.
drop trigger if exists trigg_actualizacion_cliente;
delimiter //
	create trigger trigg_actualizacion_cliente after update on cliente
	for each row begin
	insert into AUDITORIA(accion,fecha, usuario) value (concat('El cliente con id: ',old.id_cliente,' actualizo al servicio: ', NEW.servicio),(current_time),(current_user));
	end// 
delimiter ;
-- Ejecucion para uso del trigger actualizacion_cliente
/*
SET FOREIGN_KEY_CHECKS = 0;
update cliente 
set servicio = 101 
where Id_Cliente =3;
SET FOREIGN_KEY_CHECKS = 1;
*/

-- Revisar todos los trigger ejecutados
select * from AUDITORIA;