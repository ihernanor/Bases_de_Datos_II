/*  **************************
    ***** Llenar_Almacén *****
    **************************
*/

-- Primero los almacenes
BEGIN
GUARDAR_ALMACEN(1,'PLYMOUTH');
GUARDAR_ALMACEN(2,'SUPERIOR');
GUARDAR_ALMACEN(3,'BISMARCK');
GUARDAR_ALMACEN(4,'FARGO');
END;
/

SELECT * FROM ALMACEN;

-- Guardamos la información en la tabla Vendedor
BEGIN
guardar_vendedor(3462,'WATERS','WEST');
guardar_vendedor(3593,'DRYNE','EAST');
END;
/

SELECT * FROM VENDEDOR;

-- Llenamos los datos de los clientes
BEGIN
GUARDAR_CLIENTE(18765,4,'DELTA SYSTEMS');
guardar_cliente(18830,3,'A. LEVY AND SONS');
guardar_cliente(19242,3,'RAINIER COMPANY');
guardar_cliente(18841,2,'R.W. FLOOD INC');
guardar_cliente(18899,2,'SEWARD SYSTEM');
guardar_cliente(19565,1,'SOTOLAS INC');
END;
/

SELECT * FROM CLIENTE;

/*  ***************************
    ***** Llenar_Vendedor *****
    ***************************
*/

-- Llenamos los datos de los vendedores
DECLARE
VALOR INTEGER;
BEGIN
guardar_ventas(VALOR,18765,3462,13540);
guardar_ventas(VALOR,18830,3462,10600);
guardar_ventas(VALOR,19242,3462,9700);
guardar_ventas(VALOR,18841,3593,11560);
guardar_ventas(VALOR,18899,3593,2590);
guardar_ventas(VALOR,19565,3593,8800);
END;
/

SELECT * FROM VENTAS;

-- DELETE VENTAS; -- Borra todos los registros de una tabla