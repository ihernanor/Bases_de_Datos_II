SET SERVEROUTPUT ON;
CREATE TABLE Empleado(ID INTEGER PRIMARY KEY,Nombre VARCHAR2(80),Sueldo_base FLOAT);

INSERT INTO Empleado VALUES(1,'Ana',400);
INSERT INTO Empleado VALUES(2,'Juan',350);
INSERT INTO Empleado VALUES(3,'Pedro',600);
INSERT INTO Empleado VALUES(4,'Luis',520);
END;
/
SELECT * FROM Empleado; 

--Cursor Implicito (Es solo el retorno de una fila).
DECLARE
NUM_EMPLEADOS INTEGER;
BEGIN
--EL siguiente es el cursor implicito.
SELECT COUNT(*) INTO NUM_EMPLEADOS FROM Empleado;
DBMS_OUTPUT.PUT_LINE('LOS EMPLEADOS SON '||NUM_EMPLEADOS);
END;
/