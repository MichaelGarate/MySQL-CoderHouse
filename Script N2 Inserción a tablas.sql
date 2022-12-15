-- INSERT DE LOS DATOS NECESARIOS A LAS TABLAS QUE SE OCUPARAN

INSERT INTO COMUNA(nombre_comuna, Region)VALUES
('Puente Alto', 'Region Metropolitana'),
('Vitacura', 'Region Metropolitana'),
('Providencia', 'Region Metropolitana'),
('Maipu', 'Region Metropolitana'),
('Macul', 'Region Metropolitana'),
('La Florida', 'Region Metropolitana'),
('Estacion Central', 'Region Metropolitana'),
('Valparaiso','Region de Valparaiso'),
('San Antonio','Region de Valparaiso'),
('Viña Del Mar','Region de Valparaiso'),
('Cartagena','Region de Valparaiso');

INSERT INTO SERVICIO(Id_Servicio, Nombre_Servicio, Caract_Servicio, Precio)VALUES
('100','Plan Economico','100 Megas, Fibra Optica','13990'),
('101','Plan Intermedio','150 Megas, Fibra Optica','17990'),
('102','Plan Avanzado','300 Megas, Fibra Optica','23990'),
('103','Plan Full','600 Megas, Fibra Optica','29990'),
('200','Plan Duo Basica','100 Megas + 80 Canales HD, Fibra Optica','19990'),
('201','Plan Duo Intermedia','150 Megas + 80 Canales HD, Fibra Optica','25990'),
('202','Plan Duo Avanzado','300 Megas + 100 Canales HD, Fibra Optica','32990'),
('203','Plan Duo Full','600 Megas + 100 Canales HD, Fibra Optica','45990');

INSERT INTO ESTADO_SERVICIO(Id_Estado, Info) VALUES
('1','Servicio Activo'),
('2','Servicio Inactivo');

INSERT INTO UBICACION(Id_comuna,Calle,Poblacion,Numero_Vivienda,Vivienda)VALUES
('1','Eduardo Becerra Cerda','Lomas','25', 'Departamento'),
('2','Puyehue','Las Torres','164', 'Casa'),
('4','Portugal','Villa Inca','869', 'Casa'),
('3','Ortuzar','Nuevo Sol','92', 'Casa'),
('4','Matucana','Nuevo Sol','963', 'Departamento'),
('6','Merced','Nuevo Sol','104', 'Casa'),
('4','Cerrano','Nuevo Sol','72', 'Casa'),
('8','Ugalde','Nuevo Sol','912', 'Casa'),
('2','Arza','Las Torres','941', 'Casa');

INSERT INTO CLIENTE(Nombre,Apellido,Telefono,Correo,Id_Ubicacion,Servicio,Id_Estado) VALUES
('Michael','Garate','+56975231794','Michael@gmail.com','1','103','1'),
('Nicolas','Quintanilla','+56958365487','Nicolas@gmail.com','4','200','2'),
('Maria','Matabenitez','+56909854635','Marias@gmail.com','2','102','1'),
('Felipe','Rodriguez','+56935356721','Pipe@gmail.com','6','203','1'),
('Sebastian','Veliz','+56924141579','Seba@gmail.com','3','201','2'),
('Alvaro','Rojas','+56967894302','ARojas@gmail.com','5','201','1'),
('Catalina','Loyola','+56961287402','CTorres@gmail.com','7','202','2'), 
('Martina','Facco','+56967890091','mFacco@gmail.com','8','103','1'), 
('Arath','Quintanilla','+56346894365','ArathQ@gmail.com','9','202','1'); 


-- LA TABLA AUDITORIA QUEDA VACIA YA QUE SE INGRENSAN DATOS MEDIANTE EL REGISTRO DE ACCIONES EN LA BASE DE DATOS
-- LA TABLA FACTURA QUEDARA VACIA DE MOMENTO YA QUE MEDIANTE UN STORE PROCEDURE SE INGRESARAN LOS DATOS