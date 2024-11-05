SELECT * FROM jugos_ventas.tabla_de_productos;

SELECT
    `CODIGO_DEL_PRODUCTO` AS CODIGO,
    `NOMBRE_DEL_PRODUCTO` AS DESCRIPCION,
    `SABOR`,
    `TAMANO`,
    `ENVASE`,
    `PRECIO_DE_LISTA` AS PRECIO_LISTA
FROM jugos_ventas.tabla_de_productos
WHERE
    `CODIGO_DEL_PRODUCTO` NOT IN(
        SELECT `CODIGO`
        FROM tb_producto
    );

INSERT INTO
    tb_producto
SELECT
    `CODIGO_DEL_PRODUCTO` AS CODIGO,
    `NOMBRE_DEL_PRODUCTO` AS DESCRIPCION,
    `SABOR`,
    `TAMANO`,
    `ENVASE`,
    `PRECIO_DE_LISTA` AS PRECIO_LISTA
FROM jugos_ventas.tabla_de_productos
WHERE
    `CODIGO_DEL_PRODUCTO` NOT IN(
        SELECT `CODIGO`
        FROM tb_producto
    );

SELECT * FROM tb_producto;