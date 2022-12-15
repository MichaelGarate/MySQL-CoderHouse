set autocommit = 0; -- desactivar autocommit
-- Query > auto-commmit transitions
SELECT @@autocommit;

-- PRIMERA SENTENCIA
START TRANSACTION;
DELETE FROM FACTURA WHERE id_factura = 1;
SELECT * FROM FACTURA;

ROLLBACK;-- Deshacer 
SELECT * FROM FACTURA;

COMMIT;-- Confirmar
SELECT * FROM FACTURA;

-- SEGUNDA SENTENCIA
START TRANSACTION;
INSERT INTO COMUNA(id_comuna,nombre_comuna, Region)Values
(12,"La Pintana","Region Metropolitana");
INSERT INTO COMUNA(id_comuna,nombre_comuna, Region)Values
(13,"Recoleta","Region Metropolitana");
INSERT INTO COMUNA(id_comuna,nombre_comuna, Region)Values
(14,"Cerrillos","Region Metropolitana");
INSERT INTO COMUNA(id_comuna,nombre_comuna, Region)Values
(15,"San Bernardo","Region Metropolitana");
savepoint comunas1;
INSERT INTO COMUNA(id_comuna,nombre_comuna, Region)Values
(16,"Cerro Navia","Region Metropolitana");
INSERT INTO COMUNA(id_comuna,nombre_comuna, Region)Values
(17,"Pudahuel","Region Metropolitana");
INSERT INTO COMUNA(id_comuna,nombre_comuna, Region)Values
(18,"Las Condes","Region Metropolitana");
INSERT INTO COMUNA(id_comuna,nombre_comuna, Region)Values
(19,"San Joaquin","Region Metropolitana");
savepoint comunas2;

-- RELEASE SAVEPOINT comunas1;

