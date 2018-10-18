--3) Efectuar el SELECT en Almacen
SELECT * FROM Almacen;

--Ejercicio 1: Cursor explicito para iterar la tabla Almacen
SET SERVEROUTPUT ON;
DECLARE
CURSOR CUR_ALMACEN IS SELECT * FROM Almacen;
BEGIN
--Para recorrerlo o iterarlo usamos un ciclo For
FOR FILA IN CUR_ALMACEN LOOP
DBMS_OUTPUT.PUT_LINE('La ubicación del almacén es:'||FILA.UBICACION_ALMACEN);
END LOOP;
END;
/

/*
Ejercicio 2: Generar un procedimiento que itere la tabla Almacen y que modifique nuestra ubicación conservando el nombre 
de la ubicación pero agregando el Varchar,Ecaterror.
*/
DECLARE
CURSOR CUR_ALMACEN IS SELECT * FROM Almacen FOR UPDATE;
BEGIN
FOR FILA IN CUR_ALMACEN LOOP
DBMS_OUTPUT.PUT_LINE('Ubicación actual:'||FILA.UBICACION_ALMACEN);
UPDATE Almacen SET UBICACION_ALMACEN=FILA.UBICACION_ALMACEN||', ECATERROR' WHERE CURRENT OF CUR_ALMACEN;
END LOOP;
END;
/

SELECT * FROM Almacen;

/*
Ejercicio 3: Efectuar un bloque PL SQL para cambiar el nombre a Nezayork a los registros
menores a indice o número de almacén 2
*/
DECLARE
CURSOR CUR_ALMACEN IS SELECT * FROM Almacen FOR UPDATE;
BEGIN
FOR FILA IN CUR_ALMACEN LOOP
DBMS_OUTPUT.PUT_LINE('Ubicación actual:'||FILA.UBICACION_ALMACEN);
--Checaos el número del Almacén
IF FILA.NUMERO_ALMACEN <=2 THEN
  UPDATE Almacen SET UBICACION_ALMACEN='NezaYork' WHERE CURRENT OF CUR_ALMACEN;
END IF;
END LOOP;
END;
/

SELECT * FROM Almacen;

/*
Ejercicio 4: Obtener con cursores (no Joins) la vista de los nombres de los clientes
que compraron en NezaYork
almacen y cliente
*/
DECLARE
CURSOR CUR_ALMACEN IS SELECT * FROM Almacen;
CURSOR CUR_CLIENTE IS SELECT * FROM Cliente;
BEGIN
FOR FILA1 IN CUR_ALMACEN LOOP
DBMS_OUTPUT.PUT_LINE('Ubicación actual:'||FILA.UBICACION_ALMACEN);
FOR FILA2 IN CUR_CLIENTE LOOP
DBMS_OUTPUT.PUT_LINE('Ubicación actual:'||FILA.UBICACION_ALMACEN);
--Checaos el número del Almacén
IF FILA1.NUMERO_ALMACEN='NezaYork' AND FILA2.NUMERO_ALMACEN=FILA1.NUMERO_ALMACEN THEN
  DBMS_OUTPUT.PUT_LINE('La ubicación del almacén es:'||FILA.UBICACION_ALMACEN);
END IF;
END LOOP;
END;
/

