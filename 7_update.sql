UPDATE tb_producto
SET
    `DESCRIPCION` = "Sabor de la Montaña",
    `TAMANO` = "1 Litro",
    `ENVASE` = "Botella PET"
WHERE
    `CODIGO` = "1000889";

UPDATE tb_cliente SET `VOLUMEN_COMPRA` = `VOLUMEN_COMPRA` / 10;

UPDATE tb_cliente
SET
    `DIRECCION` = "Jorge Emilio 23",
    `BARRIO` = "San Antonio",
    `CIUDAD` = "Guadalajara",
    `ESTADO` = "Jalisco",
    `CP` = "44700000"
WHERE
    `DNI` = "5840119709";

SELECT * FROM tb_vendedor;

SELECT * FROM jugos_ventas.tabla_de_vendedores;

SELECT *
FROM tb_vendedor A
    INNER JOIN jugos_ventas.tabla_de_vendedores B ON A.`MATRICULA` = SUBSTRING(B.`MATRICULA`, 3);

UPDATE tb_vendedor A
INNER JOIN jugos_ventas.tabla_de_vendedores B ON A.`MATRICULA` = SUBSTRING(B.`MATRICULA`, 3)
SET
    A.`DE_VACACIONES` = `B`.`VACACIONES`;

SELECT A.`DNI`, A.`BARRIO`, A.`VOLUMEN_COMPRA`
FROM tb_cliente A
    INNER JOIN tb_vendedor B ON `A`.`BARRIO` = `B`.`BARRIO`;

UPDATE tb_cliente A
INNER JOIN tb_vendedor B ON `A`.`BARRIO` = `B`.`BARRIO`
SET
    A.`VOLUMEN_COMPRA` = `A`.`VOLUMEN_COMPRA` * 1.3;

SELECT * FROM tb_producto WHERE DESCRIPCION = 'Sabor Alpino';

DELETE FROM tb_producto WHERE `CODIGO` = '1001000';

DELETE FROM tb_producto WHERE `TAMANO` = '1 Litro';

SELECT `CODIGO_DEL_PRODUCTO` FROM jugos_ventas.tabla_de_productos;

SELECT `CODIGO`
FROM tb_producto
WHERE
    `CODIGO` NOT IN(
        SELECT `CODIGO_DEL_PRODUCTO`
        FROM jugos_ventas.tabla_de_productos
    );

DELETE FROM tb_producto
WHERE
    `CODIGO` NOT IN(
        SELECT `CODIGO_DEL_PRODUCTO`
        FROM jugos_ventas.tabla_de_productos
    );

SELECT *
FROM tb_factura A
    INNER JOIN tb_cliente B ON A.DNI = B.DNI
WHERE
    B.EDAD < 18;

DELETE A
FROM tb_facturas A
    INNER JOIN tb_clientes B ON A.DNI = B.DNI
WHERE
    B.EDAD < 18;

INSERT INTO
    ventas_jugos.tb_vendedor (
        MATRICULA,
        NOMBRE,
        BARRIO,
        COMISION,
        FECHA_ADMISION,
        DE_VACACIONES
    )
VALUES (
        '256',
        'Fernando Ruiz',
        'Oblatos',
        0.1,
        '2015-06-14',
        0
    );

SELECT * FROM tb_vendedor;

START TRANSACTION;

INSERT INTO
    ventas_jugos.tb_vendedor (
        MATRICULA,
        NOMBRE,
        BARRIO,
        COMISION,
        FECHA_ADMISION,
        DE_VACACIONES
    )
VALUES (
        '257',
        'Fernando Rojas',
        'Oblatos',
        0.1,
        '2015-06-14',
        0
    );

INSERT INTO
    ventas_jugos.tb_vendedor (
        MATRICULA,
        NOMBRE,
        BARRIO,
        COMISION,
        FECHA_ADMISION,
        DE_VACACIONES
    )
VALUES (
        '258',
        'David Rojas',
        'Oblatos',
        0.15,
        '2015-06-14',
        0
    );

SELECT * FROM tb_vendedor;

UPDATE tb_vendedor SET `COMISION` = `COMISION` * 1.05;

ROLLBACK;

COMMIT;