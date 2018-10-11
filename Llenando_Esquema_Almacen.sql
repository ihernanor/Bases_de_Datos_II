/*  **************************
    ***** Llenar_Almacén *****
    **************************
*/

-- Guardamos la información en la tabla almacen
BEGIN
GUARDAR_ALMACEN(1,'PLYMOUTH');
GUARDAR_ALMACEN(2,'SUPERIOR');
GUARDAR_ALMACEN(3,'BISMARCK');
GUARDAR_ALMACEN(4,'FARGO');
END;
/

SELECT * FROM Almacen;

-- Guardamos la información en la tabla Vendedor
BEGIN
GUARDAR_VENDEDOR(3462,'WATERS','WEST');
GUARDAR_VENDEDOR(3593,'DRYNE','EAST');
END;
/

SELECT * FROM Vendedor;

-- Llenamos los datos de los clientes
BEGIN
GUARDAR_CLIENTE(18765,4,'DELTA SYSTEMS');
GUARDAR_CLIENTE(18830,3,'A. LEVY AND SONS');
GUARDAR_CLIENTE(19242,3,'RAINIER COMPANY');
GUARDAR_CLIENTE(18841,2,'R.W. FLOOD INC');
GUARDAR_CLIENTE(18899,2,'SEWARD SYSTEM');
GUARDAR_CLIENTE(19565,1,'SOTOLAS INC');
END;
/

SELECT * FROM Cliente;

/*  ***************************
    ***** Llenar_Vendedor *****
    ***************************
*/

-- Llenamos los datos de los vendedores
DECLARE
VALOR INTEGER;
BEGIN
GUARDAR_VENTAS(VALOR,18765,3462,13540);
GUARDAR_VENTAS(VALOR,18830,3462,10600);
GUARDAR_VENTAS(VALOR,19242,3462,9700);
GUARDAR_VENTAS(VALOR,18841,3593,11560);
GUARDAR_VENTAS(VALOR,18899,3593,2590);
GUARDAR_VENTAS(VALOR,19565,3593,8800);
END;
/
SELECT * FROM VENTAS;

-- DELETE VENTAS; -- Borra todos los registros de una tabla
