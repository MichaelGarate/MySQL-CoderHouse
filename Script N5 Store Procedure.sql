USE `proyecto_coderhouse`;


-- SP_CLIENTES_ORDEN
DROP procedure IF EXISTS `sp_clientes_orden`;
DELIMITER $$
USE `proyecto_coderhouse`$$
CREATE PROCEDURE `sp_clientes_orden`(in Campo char(30))
BEGIN
	if Campo <> '' then
    set @cliente_order = concat ('ORDER BY ', Campo);
    else
    set @cliente_order = '';
    end if;
    set @clausula = concat ('select * from proyecto_coderhouse.cliente ', @cliente_order);
    prepare runSQL FROM @clausula;
    execute runSQL;
    deallocate prepare runSQL;
END$$
DELIMITER ;


-- SP_CREATE_FACTURA
DROP procedure IF EXISTS `sp_create_factura`;
DELIMITER $$
USE `proyecto_coderhouse`$$
CREATE PROCEDURE `sp_create_factura`(in id_del_cliente int)
BEGIN
DECLARE service INT;
set service = (select servicio from cliente where id_cliente = id_del_cliente);
	INSERT INTO factura(Id_factura, Id_Cliente, servicio_contratado, Fecha_factura,Precio)
	VALUES(not null, id_del_cliente, service ,current_date(),(select precio from servicio where id_servicio =service));
END$$
DELIMITER ;


-- SP_CREATE_SERVICIO
DROP procedure IF EXISTS `sp_create_servicio`;
DELIMITER $$
USE `proyecto_coderhouse`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_create_servicio`(in id_ser int, in nombre_ser varchar(50), in carac_ser varchar(100), in price int)
BEGIN
DECLARE existe_servicio INT;
DECLARE id int;
SET existe_servicio = (select count(*)from servicio where id_servicio = id_ser);
if existe_servicio = 0 then
	INSERT INTO servicio(Id_Servicio, Nombre_Servicio,Caract_Servicio, Precio)
	VALUES(id_ser, nombre_ser, carac_ser, price);
	set id = last_insert_id();
else
set id = 0;	
end if;
select id;
END$$
DELIMITER ;


-- SP_NEW_UBICACION
DROP procedure IF EXISTS `sp_new_ubicacion`;
DELIMITER $$
USE `proyecto_coderhouse`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_new_ubicacion`(in Comuna_nombre VARCHAR(60), in Calle varchar(50), in poblacion varchar(100), in numero_vivienda int, in vivienda ENUM ('Casa','Departamento'))
BEGIN
DECLARE crear_ubicacion INT;
DECLARE Id_comun int;
SET Id_comun = (select id_comuna from comuna where nombre_Comuna = Comuna_nombre);
INSERT INTO ubicacion(Id_comuna, calle, poblacion,numero_vivienda, vivienda)
VALUES(Id_comun, Calle, poblacion, numero_vivienda,vivienda);
END$$
DELIMITER ;
