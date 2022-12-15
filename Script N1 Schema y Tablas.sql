-- CREACION DE LA BASE DE DATOS Y USO DE ESTA
CREATE DATABASE IF NOT EXISTS proyecto_coderhouse;
USE proyecto_coderhouse;

-- CREACION DE LAS TABLAS QUE SE USARAN
CREATE TABLE IF NOT EXISTS SERVICIO(
Id_Servicio INT,	
Nombre_Servicio VARCHAR(50) NOT NULL,
Caract_Servicio VARCHAR (60) NOT NULL,
Precio FLOAT NOT NULL,
PRIMARY KEY (Id_Servicio)
);

CREATE TABLE IF NOT EXISTS COMUNA(
Id_Comuna INT auto_increment,
Nombre_Comuna VARCHAR(60) NOT NULL,
Region VARCHAR(60) NOT NULL,
PRIMARY KEY (Id_comuna)
);

CREATE TABLE IF NOT EXISTS UBICACION(
Id_Detalle_Ubicacion INT auto_increment,
Id_Comuna INT NOT NULL,
Calle VARCHAR (60) NOT NULL,
Poblacion VARCHAR (60) NOT NULL,
Numero_Vivienda VARCHAR(10) NOT NULL,
Vivienda ENUM ('Casa','Departamento') NOT NULL,
PRIMARY KEY(Id_Detalle_Ubicacion),
CONSTRAINT FK_Comuna_Ubicacion FOREIGN KEY(Id_Comuna) REFERENCES COMUNA(Id_Comuna)
);

CREATE TABLE IF NOT EXISTS ESTADO_SERVICIO(
Id_Estado INT,
Info VARCHAR(60),
PRIMARY KEY (Id_Estado)
);

CREATE TABLE IF NOT EXISTS CLIENTE(
Id_Cliente INT auto_increment,	
Nombre VARCHAR(50) NOT NULL,
Apellido VARCHAR(50) NOT NULL,
Telefono VARCHAR(15) NOT NULL,
Correo VARCHAR(30),
Id_Ubicacion INT NOT NULL,
Servicio INT NOT NULL,
Id_Estado INT NOT NULL,
PRIMARY KEY(Id_Cliente),
CONSTRAINT FK_Ubicacion_Cliente FOREIGN KEY (Id_Ubicacion) REFERENCES UBICACION (Id_Detalle_Ubicacion),
CONSTRAINT FK_Servicio_Cliente FOREIGN KEY (Servicio) REFERENCES SERVICIO (Id_Servicio),
CONSTRAINT FK_Estado_Cliente FOREIGN KEY (Id_Estado) REFERENCES ESTADO_SERVICIO (Id_Estado)
);

CREATE TABLE IF NOT EXISTS FACTURA(
Id_Factura INT auto_increment,
Id_Cliente int not null, 
Servicio_Contratado INT NOT NULL,
Fecha_factura DATE NOT NULL,
Precio float not null,
PRIMARY KEY (Id_Factura),
CONSTRAINT FK_Id_Cliente FOREIGN KEY (Id_Cliente) REFERENCES CLIENTE(Id_Cliente),
CONSTRAINT FK_Servicio_Factura FOREIGN KEY (Servicio_Contratado) REFERENCES CLIENTE (Servicio)
);

CREATE TABLE IF NOT EXISTS AUDITORIA(
Id int auto_increment,
accion varchar(300),
fecha datetime,
usuario varchar(50),
primary key(Id)
);


