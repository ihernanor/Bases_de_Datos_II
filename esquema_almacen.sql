SET SERVEROUTPUT ON;
--Creamos la tabla Almacen
CREATE TABLE Almacen(Numero_Almacen INTEGER,Ubicacion_Almacen VARCHAR2(50),CONSTRAINT PK_Num_Almacen PRIMARY KEY(Numero_Almacen));

--Creamos la tabla Cliente que se relaciona a la tabla Almacen
CREATE TABLE Cliente(Numero_Cliente INTEGER,
Numero_Almacen INTEGER,
Nombre_Cliente VARCHAR2(50),
CONSTRAINT PK_Num_Cliente PRIMARY KEY(Numero_Cliente),
CONSTRAINT FK1_Num_Almacen FOREIGN KEY(Numero_Almacen) REFERENCES Almacen(Numero_Almacen));
--Procedimiento Guardar_Almacen
CREATE OR REPLACE PROCEDURE Guuardar_Almacen(MI_ID IN INTEGER,MI_UBI IN VARCHAR2)
AS
BEGIN
INSERT INTO Almacen VALUES(MI_ID,MI_UBI);
END;
/

CREATE OR REPLACE PROCEDURE Guardar_Cliente(MI_ID IN INTEGER,ID_ALMACEN IN INTEGER,NOM_CLIENTE IN VARCHAR2)
AS
BEGIN
INSERT INTO Cliente VALUES(MI_ID,ID_ALMACEN,NOM_CLIENTE);
END;
/
--Crear la tablas Vendedor y Ventas
CREATE TABLE Vendedor(Numero_Vendedor INTEGER,Nombre_Vendedor VARCHAR2(50),CONSTRAINT PK_Num_Vendedor PRIMARY KEY(Numero_Vendedor));

CREATE TABLE Ventas(
ID_Ventas INTEGER,
Numero_Vendedor INTEGER,
Numero_Cliente INTEGER,
Monto_Ventas FLOAT,
CONSTRAINT PK_ID_Ventas PRIMARY KEY(ID_Ventas),
CONSTRAINT FK2_Num_Vendedor FOREIGN KEY(Numero_Vendedor) REFERENCES Vendedor(Numero_Vendedor),
CONSTRAINT FK3_Num_Cliente FOREIGN KEY(Numero_Cliente) REFERENCES Cliente(Numero_Cliente));

--Generamos la secuencia que controla la Primary Key 
CREATE SEQUENCE SEC_Ventas
START WITH 1
INCREMENT BY 1
NOMAXVALUE;

--Generar los procedimientos respectivos
CREATE TABLE OR REPLACE PROCEDURE Guardar_Vendedor(MI_ID IN INTEGER,NOM_VENDEDOR IN VARCHAR2)
AS
BEGIN
INSERT INTO Vendedor VALUES(MI_ID,NOM_VENDEDOR);
END;
/

CREATE OR REPLACE PROCEDURE Guardar_Ventas(MI_ID OUT INTEGER,NUM_VENDEDOR IN INTEGER,NUM_CLIENTE IN INTEGER,MONTO_VENTAS IN FLOAT)
AS
BEGIN
SELECT SEC_Ventas.NEXTVAL INTO MI_ID FROM DUAL;
INSERT INTO Ventas VALUES(MI_ID,NUM_VENDEDOR,NUM_CLIENTE,MONTO_VENTAS);
END;
/

--Probamos con un bloque PL-SQL
DECLARE
Valor1 INTEGER;
Valor2 INTEGER;
BEGIN
Guardar_Vendedor(1,'Iván');
Guardar_Ventas(Valor2,1248,2216,344);
END;
/
SELECT * FROM Ventas;


