-- muetra los clientes que tienen contratado un plan en especifico
CREATE OR REPLACE VIEW VW_Clientes_PlanDuo_Intermedia AS 
SELECT DISTINCT C.Id_Cliente, C.Nombre, C.Apellido, C.Servicio FROM CLIENTE as C 
INNER JOIN SERVICIO as S ON C.Servicio = S.Id_Servicio
WHERE S.Id_Servicio = '201';

-- muestra los clientes con servicio activo
CREATE OR REPLACE VIEW VW_Clientes_Activos AS
SELECT DISTINCT Id_cliente, Nombre, Apellido, C.Id_Estado FROM CLIENTE AS C
INNER JOIN ESTADO_SERVICIO AS ES ON C.Id_Estado = ES.Id_Estado
WHERE ES.Id_Estado = '1';

-- muestra las comunas que tienen clientes en la region metropolitana
CREATE OR REPLACE VIEW VW_Comunas_RM AS
SELECT DISTINCT Co.Id_Comuna, nombre_comuna, region FROM COMUNA AS CO
INNER JOIN UBICACION AS U ON CO.Id_Comuna = U.Id_Comuna
WHERE CO.nombre_comuna <= 'Region Metropolitana';

-- muestra solo los clientes con planes de internet
CREATE OR REPLACE VIEW VW_Planes_Internet_Contratados AS
SELECT DISTINCT C.Id_Cliente, C.Nombre, C.Apellido, C.Servicio FROM CLIENTE as C 
INNER JOIN SERVICIO as S ON C.Servicio = S.Id_Servicio
WHERE S.id_Servicio <= '103';

-- muestra los clientes de que se encuentran en la region metropolitana
CREATE OR REPLACE VIEW VW_Clientes_RM AS
SELECT DISTINCT C.Id_Cliente, C.Nombre, C.Apellido, C.id_ubicacion 'Codigo en Region Metropolitana' FROM CLIENTE as C
INNER JOIN UBICACION AS U ON C.id_ubicacion = U.id_detalle_ubicacion
INNER JOIN COMUNA AS CO ON U.id_comuna = CO.id_comuna
WHERE CO.nombre_comuna <= 'Region Metropolitana';