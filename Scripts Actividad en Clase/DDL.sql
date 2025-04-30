--CREACION DE LAS TABLAS UTILIZANDO DDL

-- Tabla Cliente
CREATE TABLE cliente (
    id_cliente INT NOT NULL PRIMARY KEY,
    Nombre VARCHAR(45) NOT NULL,
    Apellido VARCHAR(45) NOT NULL,
    Observaciones VARCHAR(45)
);

-- Tabla Mesero
CREATE TABLE mesero (
    id_mesero INT NOT NULL PRIMARY KEY,
    Nombre VARCHAR(45) NOT NULL,
    Apellido1 VARCHAR(45) NOT NULL,
    Apellido2 VARCHAR(45)
);

-- Tabla Mesa
CREATE TABLE mesa (
    id_mesa INT NOT NULL PRIMARY KEY,
    num_comensales INT NOT NULL,
    Ubicacion VARCHAR(45) NOT NULL
);

-- Tabla Platillo
CREATE TABLE platillo (
    id_platillo INT NOT NULL PRIMARY KEY,
    Nombre VARCHAR(45) NOT NULL,
    Importe INT NOT NULL
);

-- Tabla Bebida
CREATE TABLE bebida (
    id_bebida INT NOT NULL PRIMARY KEY,
    Nombre VARCHAR(45) NOT NULL,
    Importe INT NOT NULL
);

-- Tabla Factura 
CREATE TABLE factura (
    id_factura INT NOT NULL PRIMARY KEY,
    fecha_factura DATE NOT NULL,
    id_cliente INT NOT NULL,
    id_mesero INT NOT NULL,
    id_mesa INT NOT NULL,
    id_platillo INT NOT NULL,
    id_bebida INT NOT NULL,
    CONSTRAINT fk_cliente 
        FOREIGN KEY (id_cliente) 
        REFERENCES Cliente(id_cliente),
    FOREIGN KEY (id_mesero) REFERENCES Mesero(id_mesero)
    ON UPDATE CASCADE
    ON DELETE SET NULL,
    FOREIGN KEY (id_mesa) REFERENCES Mesa(id_mesa)
     ON UPDATE CASCADE
    ON DELETE SET NULL,
    FOREIGN KEY (id_platillo) REFERENCES Platillo(id_platillo)
     ON UPDATE CASCADE
    ON DELETE SET NULL,
    FOREIGN KEY (id_bebida) REFERENCES Bebida(id_bebida)
     ON UPDATE CASCADE
    ON DELETE SET NULL
);
