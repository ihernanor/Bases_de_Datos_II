SET SERVEROUTPUT ON;
-- CREATE OR REPLACE nos permite modificar más adelante después de haber depurado.
CREATE OR REPLACE PROCEDURE IMPRIMIR(MENSA IN VARCHAR2) 
AS 
BEGIN
DBMS_OUTPUT.PUT_LINE(MENSA);
END;
/

--Vamos a invocarlo internamente, es decir, desde Oracle.
BEGIN
IMPRIMIR('Vamos a ver si funciona');
END;
/

--Vamos a invocarlo externamente, lo haremos desde Java.
CREATE TABLE Dance(ID INTEGER PRIMARY KEY,Mensaje VARCHAR(80));

CREATE OR REPLACE PROCEDURE GUARDAR_DANCE(VAL1 IN INTEGER, VAL2 IN VARCHAR2)
AS
BEGIN
INSERT INTO Dance VALUES(VAL1,VAL2);
END;
/
--Probamos Internamente
BEGIN
GUARDAR_DANCE(1,'Mi primer mensajito');
END;
/
SELECT * FROM Dance;