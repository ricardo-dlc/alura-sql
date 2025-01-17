ALTER TABLE tb_venta RENAME tb_factura;

CREATE TABLE tb_items_facturas (
    NUMERO VARCHAR(5) NOT NULL,
    CODIGO VARCHAR(10) NOT NULL,
    CANTIDAD INT,
    PRECIO FLOAT,
    PRIMARY KEY (NUMERO, CODIGO),
    FOREIGN KEY (NUMERO) REFERENCES tb_factura (NUMERO),
    FOREIGN KEY (CODIGO) REFERENCES tb_producto (CODIGO)
);