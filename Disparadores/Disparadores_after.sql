--Ejercicio #2
SET SERVEROUTPUT ON;
CREATE TABLE Generar(ID INTEGER PRIMARY KEY,Nombre VARCHAR2(80),Edad INTEGER);
CREATE TABLE Espejo_mayores(ID INTEGER PRIMARY KEY,Nombre VARCHAR2(80),Edad INTEGER);
CREATE TABLE Espejo_menores(ID INTEGER PRIMARY KEY,Nombre VARCHAR2(80),Edad INTEGER);
/*-Generar un disparador que haga lo siguiente:
1. Que al insertar un registro en la tabla muestra, verifique la edad si es mayor a 18 años, que además inserte en: Espejo_mayores
2. Que al insertar un registro en la tabla maestra, verifique la edad, si es menor o igaul a 18 años, que inserte además en : Espejo_menores
*/

CREATE OR REPLACE TRIGGER DISP_MAESTRA AFTER INSERT ON GENERAR
FOR EACH ROW
BEGIN
IF :NEW.EDAD>18 THEN
INSERT INTO ESPEJO_MAYORES VALUES(:NEW.ID,:NEW.NOMBRE,:NEW.EDAD);
ELSE
INSERT INTO ESPEJO_MENORES VALUES(:NEW.ID,:NEW.NOMBRE,:NEW.EDAD);
END IF;
END;
/