--A) Crear la siguiente tabla
CREATE TABLE Cartera_clientes(ID_Cliente INTEGER PRIMARY KEY, Nombre VARCHAR2(40), Sueldo_base FLOAT);
SELECT *FROM Cartera_clientes;

--B) Generamos la secuencia que controla la Primary Key
CREATE SEQUENCE SEC_Cartera_clientes
START WITH 1
INCREMENT BY 1
NOMAXVALUE;

--C) Generamos un procedimiento almacenado cuya función es asociar la secuencias a la tabla Cartera_clientes
--Se utilizó la función OUT en el atributo ID debido a que la secuencia generará el ID de uno en uno, no ingresaremos nosotros el valor del ID.
CREATE OR REPLACE PROCEDURE GUARDAR_CARTERA(MI_ID OUT INTEGER,MI_NOMBRE IN VARCHAR2,MI_SUELDO IN FLOAT)
AS
BEGIN
SELECT SEC_CARTERA_CLIENTES.NEXTVAL INTO MI_ID FROM DUAL;
INSERT INTO Cartera_clientes VALUES(MI_ID,MI_NOMBRE,MI_SUELDO);
END;
/

--D) Probamos con un bloque PL-SQL
DECLARE
Valor INTEGER;
BEGIN
GUARDAR_CARTERA(Valor,'Juan',400);
GUARDAR_CARTERA(Valor,'Gabriela',1000);
END;
/
SELECT * FROM Cartera_clientes;