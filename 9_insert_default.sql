CREATE TABLE tb_default (
    ID INT AUTO_INCREMENT,
    DESCRIPCION VARCHAR(50) NOT NULL,
    DIRECCION VARCHAR(100) NULL,
    CIUDAD VARCHAR(50) DEFAULT 'Monterrey',
    FECHA_CREACION TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (ID)
);

INSERT INTO
    tb_default (
        `DESCRIPCION`,
        `DIRECCION`,
        `CIUDAD`,
        `FECHA_CREACION`
    )
VALUES (
        'Cliente X',
        'Calle Sol, 525',
        'Cancun',
        '2021-01-01'
    );

SELECT * FROM tb_default;

INSERT INTO
    tb_default (`DESCRIPCION`)
VALUES ('Cliente X');