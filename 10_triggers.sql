CREATE TABLE tb_facturacion (
    FECHA DATE NULL,
    VENTA_TOTAL FLOAT
);

SELECT * FROM tb_facturacion;

-- ventas_jugos.tb_factura definition

CREATE TABLE `tb_factura1` (
    `NUMERO` varchar(5) NOT NULL,
    `FECHA` date DEFAULT NULL,
    `DNI` varchar(11) NOT NULL,
    `MATRICULA` varchar(5) NOT NULL,
    `IMPUESTO` float DEFAULT NULL,
    `FECHA_VENTA` varchar(50) DEFAULT NULL,
    PRIMARY KEY (`NUMERO`),
    KEY `DNI` (`DNI`),
    KEY `MATRICULA` (`MATRICULA`),
    CONSTRAINT `tb_factura1_ibfk_1` FOREIGN KEY (`DNI`) REFERENCES `tb_cliente` (`DNI`),
    CONSTRAINT `tb_factura1_ibfk_2` FOREIGN KEY (`MATRICULA`) REFERENCES `tb_vendedor` (`MATRICULA`)
);

-- ventas_jugos.tb_items_facturas definition

CREATE TABLE `tb_items_facturas1` (
    `NUMERO` varchar(5) NOT NULL,
    `CODIGO` varchar(10) NOT NULL,
    `CANTIDAD` int(11) DEFAULT NULL,
    `PRECIO` float DEFAULT NULL,
    PRIMARY KEY (`NUMERO`, `CODIGO`),
    KEY `CODIGO` (`CODIGO`),
    CONSTRAINT `tb_items_facturas1_ibfk_1` FOREIGN KEY (`NUMERO`) REFERENCES `tb_factura1` (`NUMERO`),
    CONSTRAINT `tb_items_facturas1_ibfk_2` FOREIGN KEY (`CODIGO`) REFERENCES `tb_producto` (`CODIGO`)
);

SELECT * FROM tb_items_facturas1;

SELECT * FROM tb_factura1;

INSERT INTO
    tb_factura1
VALUES (
        '0100',
        '2022-01-01',
        '50534475787',
        '238',
        0.10
    );

INSERT INTO
    tb_items_facturas1
VALUES ('0100', '231776', 100, 25),
    ('0100', '235653', 200, 25),
    ('0100', '243083', 300, 25);

SELECT `A`.`FECHA`, SUM(`B`.`CANTIDAD` * `B`.`PRECIO`) AS VENTA_TOTAL
FROM
    tb_factura1 A
    INNER JOIN tb_items_facturas1 B ON A.`NUMERO` = `B`.`NUMERO`
GROUP BY
    `A`.`FECHA`;

INSERT INTO
    tb_factura1
VALUES (
        '0101',
        '2022-01-01',
        '50534475787',
        '238',
        0.10
    );

INSERT INTO
    tb_items_facturas1
VALUES ('0101', '231776', 100, 25),
    ('0101', '235653', 200, 25),
    ('0101', '243083', 300, 25);

INSERT INTO
    tb_factura1
VALUES (
        '0102',
        '2022-01-01',
        '50534475787',
        '238',
        0.10
    );

INSERT INTO
    tb_items_facturas1
VALUES ('0102', '231776', 200, 25),
    ('0102', '235653', 300, 25),
    ('0102', '243083', 400, 25);

DELIMITER ##;

CREATE TRIGGER TG_FACTURACION_INSERT
AFTER INSERT ON tb_items_facturas1

FOR EACH ROW BEGIN
DELETE FROM tb_facturacion;

INSERT INTO
    tb_facturacion
SELECT `A`.`FECHA`, SUM(`B`.`CANTIDAD` * `B`.`PRECIO`) AS VENTA_TOTAL
FROM
    tb_factura1 A
    INNER JOIN tb_items_facturas1 B ON A.`NUMERO` = `B`.`NUMERO`
GROUP BY
    `A`.`FECHA`;

END

INSERT INTO
    tb_factura1
VALUES (
        '0103',
        '2022-01-01',
        '50534475787',
        '238',
        0.10
    );

INSERT INTO
    tb_items_facturas1
VALUES ('0103', '231776', 200, 25),
    ('0103', '235653', 300, 25),
    ('0103', '243083', 400, 25);

INSERT INTO
    tb_factura1
VALUES (
        '0104',
        '2022-01-01',
        '50534475787',
        '238',
        0.10
    );

INSERT INTO
    tb_items_facturas1
VALUES ('0104', '231776', 200, 25),
    ('0104', '235653', 400, 30),
    ('0104', '243083', 500, 25);

SELECT
    DNI,
    EDAD,
    FECHA_NACIMIENTO,
    timestampdiff(YEAR, FECHA_NACIMIENTO, NOW()) AS ANOS
FROM tb_cliente;

DELIMITER ::

CREATE TRIGGER TG_EDAD_CLIENTES_INSERT
BEFORE INSERT ON tb_cliente

FOR EACH ROW BEGIN
    SET NEW.EDAD = timestampdiff(YEAR, NEW.FECHA_NACIMIENTO, NOW());

END ::

INSERT INTO
    tb_cliente (
        `DNI`,
        `NOMBRE`,
        `DIRECCION`,
        `BARRIO`,
        `CIUDAD`,
        `ESTADO`,
        `CP`,
        `FECHA_NACIMIENTO`,
        `EDAD`,
        `SEXO`,
        `LIMITE_CREDITO`,
        `VOLUMEN_COMPRA`,
        `PRIMERA_COMPRA`
    )
values (
        '9752134115',
        'Juan Álvarez',
        'Calle San Rafael, 212',
        'Del Valle',
        'Cancun',
        'QRoo',
        '22009912',
        '1995-07-23',
        11,
        'M',
        75000,
        24000,
        1
    );

SELECT * FROM tb_facturacion;

SELECT * FROM tb_factura1;

SELECT * FROM tb_items_facturas1;

UPDATE tb_items_facturas1
SET
    `CANTIDAD` = 600
WHERE
    `NUMERO` = '0101'
    AND `CODIGO` = '231776';

DELETE FROM tb_items_facturas1
WHERE
    `NUMERO` = '0104'
    AND `CODIGO` = '235653';

DELIMITER ::

CREATE TRIGGER TG_FACTURACION_DELETE
AFTER DELETE ON tb_items_facturas1

FOR EACH ROW BEGIN
DELETE FROM tb_facturacion;

INSERT INTO
    tb_facturacion
SELECT `A`.`FECHA`, SUM(`B`.`CANTIDAD` * `B`.`PRECIO`) AS VENTA_TOTAL
FROM
    tb_factura1 A
    INNER JOIN tb_items_facturas1 B ON A.`NUMERO` = `B`.`NUMERO`
GROUP BY
    `A`.`FECHA`;

END ::

DELIMITER ::

CREATE TRIGGER TG_FACTURACION_UPDATE
AFTER UPDATE ON tb_items_facturas1

FOR EACH ROW BEGIN
DELETE FROM tb_facturacion;

INSERT INTO
    tb_facturacion
SELECT `A`.`FECHA`, SUM(`B`.`CANTIDAD` * `B`.`PRECIO`) AS VENTA_TOTAL
FROM
    tb_factura1 A
    INNER JOIN tb_items_facturas1 B ON A.`NUMERO` = `B`.`NUMERO`
GROUP BY
    `A`.`FECHA`;

END ::

UPDATE tb_items_facturas1
SET
    `CANTIDAD` = 800
WHERE
    `NUMERO` = '0101'
    AND `CODIGO` = '231776';

DELETE FROM tb_items_facturas1
WHERE
    `NUMERO` = '0104'
    AND `CODIGO` = '243083';