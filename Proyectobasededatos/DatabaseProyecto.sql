create database proyectobd;
use proyectobd;
CREATE TABLE localizacion (
  CodigoPostal INT NOT NULL,
  Numero INT NOT NULL,
  Calle_Principal VARCHAR(50) NOT NULL,
  Calle_Secundaria VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (CodigoPostal));
CREATE TABLE pastelero (
  CedulaPanadero VARCHAR(25) NOT NULL,
  Nombre VARCHAR(50) NOT NULL,
  telefono INT NULL DEFAULT NULL,
  Correo VARCHAR(50) NOT NULL,
  Contraseña VARCHAR(50) NOT NULL,
  Cod_postal INT NULL DEFAULT NULL,
  PRIMARY KEY (CedulaPanadero),
    FOREIGN KEY (Cod_postal)
    REFERENCES localizacion (CodigoPostal));
CREATE TABLE cliente (
  Cedula VARCHAR(25) NOT NULL,
  Nombre VARCHAR(50) NOT NULL,
  telefono INT NULL DEFAULT NULL,
  Correo VARCHAR(50) NOT NULL,
  Contraseña VARCHAR(50) NOT NULL,
  PRIMARY KEY (Cedula));
CREATE TABLE IF NOT EXISTS calificaciones (
    Id_calif VARCHAR(10) NOT NULL,
    Nota_cali FLOAT NOT NULL,
    Comentario VARCHAR(250) NULL DEFAULT NULL,
    Fecha DATE NULL DEFAULT NULL,
    cliente_Cedula VARCHAR(25) NOT NULL,
    Ced_Pas VARCHAR(25) NULL DEFAULT NULL,
    PRIMARY KEY (Id_calif),
    FOREIGN KEY (Ced_Pas)
        REFERENCES pastelero (CedulaPanadero),
    FOREIGN KEY (cliente_Cedula)
        REFERENCES cliente (Cedula));
CREATE TABLE categoria (
  Id_Categoria INT NOT NULL,
  Nombre_categoria VARCHAR(50) NOT NULL,
  PRIMARY KEY (Id_Categoria));
CREATE TABLE cuentabancaria (
  Numero_cuenta INT NOT NULL,
  Tipo_de_cuenta VARCHAR(25) NOT NULL,
  Ced_clie VARCHAR(25) NOT NULL,
  PRIMARY KEY (Numero_cuenta),
    FOREIGN KEY (Ced_clie)
    REFERENCES cliente (Cedula));
CREATE TABLE pedido (
  Pedido_id VARCHAR(10) NOT NULL,
  Fecha DATE NOT NULL,
  Total FLOAT NOT NULL,
  Estado VARCHAR(45) NOT NULL,
  cliente_Cedula VARCHAR(25) NOT NULL,
  pastelero_CedulaPanadero VARCHAR(25) NOT NULL,
  PRIMARY KEY (Pedido_id, cliente_Cedula),
    FOREIGN KEY (cliente_Cedula)
    REFERENCES cliente (Cedula),
    FOREIGN KEY (pastelero_CedulaPanadero)
    REFERENCES pastelero (CedulaPanadero));
CREATE TABLE producto (
  Prod_Id VARCHAR(25) NOT NULL,
  Nombre VARCHAR(50) NOT NULL,
  Canti INT NULL DEFAULT NULL,
  Precio FLOAT NOT NULL,
  Id_Cate INT NULL DEFAULT NULL,
  pastelero_CedulaPanadero VARCHAR(25) NOT NULL,
  PRIMARY KEY (Prod_Id),
    FOREIGN KEY (Id_Cate)
    REFERENCES categoria (Id_Categoria),
    FOREIGN KEY (pastelero_CedulaPanadero)
    REFERENCES pastelero (CedulaPanadero));
CREATE TABLE requerimiento_pedido_especial (
  Porciones INT NOT NULL,
  Tamaño FLOAT NULL DEFAULT NULL,
  Sabor VARCHAR(50) NOT NULL,
  pedido_Pedido_id VARCHAR(10) NOT NULL,
  pedido_cliente_Cedula VARCHAR(25) NOT NULL,
  PRIMARY KEY (pedido_Pedido_id),
    FOREIGN KEY (pedido_Pedido_id , pedido_cliente_Cedula)
    REFERENCES pedido (Pedido_id , cliente_Cedula));   
CREATE TABLE IF NOT EXISTS tarjeta_credito (
  Numerotarjeta INT NOT NULL,
  cvv VARCHAR(3) NOT NULL,
  Fecha_Exp DATE NOT NULL,
  Ced_clie VARCHAR(25) NOT NULL,
  PRIMARY KEY (Numerotarjeta),
    FOREIGN KEY (Ced_clie)
    REFERENCES cliente (Cedula));
CREATE TABLE IF NOT EXISTS Entrega_domicilio (
  Codigo INT NOT NULL,
  Domicilio VARCHAR(50) NOT NULL,
  Fecha DATE NOT NULL,
  hora TIME NOT NULL,
  Ced_clie VARCHAR(25) NOT NULL,
  pastelero_CedulaPanadero VARCHAR(25) NOT NULL,
  PRIMARY KEY (Codigo),
    FOREIGN KEY (Ced_clie)
    REFERENCES cliente (Cedula),
    FOREIGN KEY (pastelero_CedulaPanadero)
    REFERENCES pastelero (CedulaPanadero));


INSERT INTO Cliente  VALUES('093121344','Juan',239201,'juan@gmail.com','kjdskjds');
INSERT INTO Cliente  VALUES('093732773','Pedro',283920,'pedro@gmail.com','kjdskjds');
INSERT INTO Cliente  VALUES('123483837','Daniel',213020,'daniel@gmail.com','kjdskjds');
INSERT INTO Cliente  VALUES('238485959','David',222111,'david@gmail.com','kjdskjds');
INSERT INTO Cliente  VALUES('794737848','Paul',333222,'paul@gmail.com','kjdskjds');
INSERT INTO Cliente  VALUES('983364848','Mabel',444111,'mabel@gmail.com','kjdskjds');
INSERT INTO Cliente  VALUES('098332832','Daniela',444222,'daniela@gmail.com','kjdskjds');
INSERT INTO Cliente  VALUES('098724923','Javier',555533,'javier@gmail.com','kjdskjds');
INSERT INTO Cliente  VALUES('092737492','Xavier',986324,'xavier@gmail.com','kjdskjds');
INSERT INTO Cliente  VALUES('293857398','Jordan',983749,'jordan@gmail.com','kjdskjds');

/************************************************************************/
INSERT INTO CuentaBancaria  VALUES(11111111,'Corriente','093121344');
INSERT INTO CuentaBancaria  VALUES(22222222,'Ahorro','093732773');
INSERT INTO CuentaBancaria  VALUES(33333333,'Corriente','093732773');
INSERT INTO CuentaBancaria  VALUES(44444444,'Ahorro','093121344');
INSERT INTO CuentaBancaria  VALUES(55555555,'Corriente','098332832');
INSERT INTO CuentaBancaria  VALUES(66666666,'Ahorro','983364848');
INSERT INTO CuentaBancaria  VALUES(77777777,'Corriente','794737848');
INSERT INTO CuentaBancaria  VALUES(88888888,'Ahorro','293857398');
INSERT INTO CuentaBancaria  VALUES(99999999,'Corriente','123483837');
INSERT INTO CuentaBancaria  VALUES(11111112,'Ahorro','098724923');

INSERT INTO Tarjeta_Credito  VALUES(134111,'123','2020-03-21','093121344');
INSERT INTO Tarjeta_Credito  VALUES(252222,'234','2020-03-21','093732773');
INSERT INTO Tarjeta_Credito  VALUES(323343,'012','2020-03-21','123483837');
INSERT INTO Tarjeta_Credito  VALUES(478744,'034','2020-03-21','238485959');
INSERT INTO Tarjeta_Credito  VALUES(534215,'021','2020-03-21','794737848');
INSERT INTO Tarjeta_Credito  VALUES(354678,'235','2020-03-21','983364848');
INSERT INTO Tarjeta_Credito  VALUES(342321,'672','2020-03-21','098332832');
INSERT INTO Tarjeta_Credito  VALUES(456543,'567','2020-03-21','098724923');
INSERT INTO Tarjeta_Credito  VALUES(323463,'120','2020-03-21','092737492');
INSERT INTO Tarjeta_Credito  VALUES(983646,'230','2020-03-21','293857398');

INSERT INTO Localizacion  VALUES(1341,12,'Prosperina',null);
INSERT INTO Localizacion  VALUES(2522,34,'Espol peñas','aula123');
INSERT INTO Localizacion  VALUES(3433,132,'Sauces','sauces9');
INSERT INTO Localizacion  VALUES(7444,344,'Alborada','5ta etapa');
INSERT INTO Localizacion  VALUES(2155,44,'Urdesa',null);
INSERT INTO Localizacion  VALUES(3546,43,'Urdesa',null);
INSERT INTO Localizacion  VALUES(3427,22,'Urdesa',null);
INSERT INTO Localizacion  VALUES(4438,35,'Samanes',null);
INSERT INTO Localizacion  VALUES(3639,126,'Monte Sinai','hospital monte sinai');
INSERT INTO Localizacion  VALUES(9460,239,'Prosperina','Mercador la prosperina');

INSERT INTO Pastelero  VALUES('095121344','Carlos',239221,'carlos@gmail.com','kjdskjds',1341);
INSERT INTO Pastelero  VALUES('096732773','Ismael',234822,'ismael@gmail.com','kjdskjds',2522);
INSERT INTO Pastelero  VALUES('122483837','Daniel',398321,'daniel2@gmail.com','kjdskjds',3433);
INSERT INTO Pastelero  VALUES('231485959','David',382989,'david2@gmail.com','kjdskjds',7444);
INSERT INTO Pastelero  VALUES('797737848','Paul',283839,'paul2@gmail.com','kjdskjds',2155);
INSERT INTO Pastelero  VALUES('986364848','Mabel',283939,'mabel2@gmail.com','kjdskjds',3546);
INSERT INTO Pastelero  VALUES('093332832','Daniela',102039,'daniela2@gmail.com','kjdskjds',3427);
INSERT INTO Pastelero  VALUES('096724923','Javier',139202,'javier2@gmail.com','kjdskjds',4438);
INSERT INTO Pastelero  VALUES('099737492','Xavier',239210,'xavier2@gmail.com','kjdskjds',3639);
INSERT INTO Pastelero  VALUES('299857398','Jordan',923432,'jordan2@gmail.com','kjdskjds',9460);

INSERT INTO entrega_domicilio  VALUES(1341111,'Prosperina','2020-03-21','18:30:00','093121344','099737492');
INSERT INTO entrega_domicilio  VALUES(2522222,'Espol peñas','2020-03-21','11:30:00','093732773','099737492');
INSERT INTO entrega_domicilio  VALUES(3233433,'Sauces','2020-03-21','12:30:00','123483837','299857398');
INSERT INTO entrega_domicilio  VALUES(4787444,'Alborada','2020-03-21','10:30:00','238485959','299857398');
INSERT INTO entrega_domicilio  VALUES(5342155,'Urdesa','2020-03-21','12:35:00','794737848','099737492');
INSERT INTO entrega_domicilio  VALUES(3546786,'Urdesa','2020-03-21','18:40:00','983364848','986364848');
INSERT INTO entrega_domicilio  VALUES(3423217,'Urdesa','2020-03-21','19:30:00','098332832','986364848');
INSERT INTO entrega_domicilio  VALUES(4565438,'Samanes','2020-03-21','19:00:00','098724923','797737848');
INSERT INTO entrega_domicilio  VALUES(3234639,'Monte Sinai','2020-03-21','18:00:00','092737492','797737848');
INSERT INTO entrega_domicilio  VALUES(9836460,'Prosperina','2020-03-21','18:00:00','293857398','797737848');

INSERT INTO Categoria  VALUES(11111,'Tortas');
INSERT INTO Categoria  VALUES(22222,'Cheescake');
INSERT INTO Categoria  VALUES(32323,'Panes');
select * from Producto;
INSERT INTO Producto  VALUES('0001','Tarta de manzana',12,2.50,11111,'797737848');
INSERT INTO Producto  VALUES('0002','Pan de piña',20,0.50,32323,'797737848');
INSERT INTO Producto  VALUES('0003','Torta mojada de chocolate',25,3.50,11111,'797737848');
INSERT INTO Producto  VALUES('0004','Dulce de tres leche',12,2.50,11111,'797737848');
INSERT INTO Producto  VALUES('0005','Cara sucia',30,0.50,32323,'099737492');
INSERT INTO Producto  VALUES('0006','Pan Integral',12,0.25,32323,'099737492');
INSERT INTO Producto  VALUES('0007','Tarta de pera',12,2.50,11111,'099737492');
INSERT INTO Producto  VALUES('0008','Cheescake',12,2.50,22222,'099737492');
INSERT INTO Producto  VALUES('0009','Torta de chocolate',12,2.50,11111,'099737492');
INSERT INTO Producto  VALUES('0010','tarta de durazano',12,2.50,11111,'099737492');

INSERT INTO pedido  VALUES('1029','2020-03-21',12.5,'Pendiente','293857398','099737492');
INSERT INTO pedido  VALUES('6666','2020-03-21',10.5,'Completado','293857398','099737492');
INSERT INTO pedido  VALUES('7656','2020-03-21',11.5,'Completado','293857398','099737492');
INSERT INTO pedido  VALUES('6433','2020-03-21',13.5,'Completado','293857398','099737492');
INSERT INTO pedido  VALUES('4543','2020-03-21',8.5,'Pendiente','098724923','099737492');
INSERT INTO pedido  VALUES('4556','2020-03-21',3.2,'Completado','098724923','231485959');
INSERT INTO pedido  VALUES('7687','2020-03-21',5.5,'Completado','983364848','231485959');
INSERT INTO pedido  VALUES('3445','2020-03-21',6.4,'Pendiente','983364848','231485959');
INSERT INTO pedido  VALUES('2344','2020-03-21',5.4,'Pendiente','983364848','231485959');
INSERT INTO pedido  VALUES('3455','2020-03-21',3.4,'Pendiente','983364848','095121344');

INSERT INTO Calificaciones  VALUES('001',5,'Buen trabajo','2020-02-20','983364848','095121344');
INSERT INTO Calificaciones  VALUES('002',4.5,'Buen trabajo','2020-02-20','983364848','095121344');
INSERT INTO Calificaciones  VALUES('003',3.5,'Buen trabajo','2020-02-20','983364848','095121344');
INSERT INTO Calificaciones  VALUES('004',4.5,'Buen trabajo','2020-02-20','983364848','231485959');
INSERT INTO Calificaciones  VALUES('005',4.5,'Buen trabajo','2020-02-20','983364848','231485959');
INSERT INTO Calificaciones  VALUES('006',5,'Buen trabajo','2020-02-20','098724923','231485959');
INSERT INTO Calificaciones  VALUES('007',4.5,'Buen trabajo','2020-02-20','098724923','797737848');
INSERT INTO Calificaciones  VALUES('008',5,'Buen trabajo','2020-02-20','098724923','797737848');
INSERT INTO Calificaciones  VALUES('009',4.5,'Buen trabajo','2020-02-20','098724923','797737848');
INSERT INTO Calificaciones  VALUES('010',5,'Buen trabajo','2020-02-20','983364848','797737848');

