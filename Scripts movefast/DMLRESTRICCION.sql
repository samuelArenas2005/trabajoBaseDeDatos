-- Errores en clientes

INSERT INTO cliente VALUES 
(123456789, 'Ana', 'López', -25, '2024-01-01', 'Bogotá'), -- Error: edad negativa (violación del CHECK en edad > 0)

(987654321, 'Carlos', 'Pérez', 30, '2024-01-01', NULL), -- Error: ciudad nula (violación de NOT NULL)

(123456789, 'Lucía', 'Ramírez', 27, '2024-01-01', 'Medellín'); -- Error: clave primaria duplicada (ncedula repetida)

-- Errores en sucursal

INSERT INTO sucursal VALUES 
(10, 'Cali', 'Av. Central 123', '311555888999'), -- Error: ncel demasiado largo (más de 10 caracteres)

(11, NULL, 'Carrera 10 #5-30', '3115554444'), -- Error: ciudad nula (violación de NOT NULL)

(10, 'Bogotá', 'Calle Falsa 123', '3111234567'); -- Error: clave primaria duplicada (idsucursal repetido)

-- Errores en vehiculo

INSERT INTO vehiculo VALUES ('ABC123', 'Toyota', 1949, 'Rojo', 4, TRUE, 1), -- Error: modelo fuera del rango permitido (violación de CHECK)

('DEF456', 'Nissan', 2020, 'Azul', 3, TRUE, 1), -- Error: tracción inválida (valor diferente de 2 o 4)

('GHI789', 'Ford', 2021, 'Negro', 4, TRUE, 99); -- Error: FK inválida, sucursal no existe (no hay sucursal con ID 99)

-- Errores en alquiler

INSERT INTO alquiler VALUES (100, 999999999, 'ABC123', '2024-04-01', '2024-04-10', TRUE), -- Error: cliente no existe (violación de FK)

(101, 123456789, 'ZZZ999', '2024-04-01', '2024-04-10', TRUE), -- Error: vehículo no existe (violación de FK)

(100, 123456789, 'ABC123', '2024-05-01', '2024-05-05', TRUE); -- Error: clave primaria duplicada (idalquiler repetido)

-- Errores en pago

INSERT INTO pago VALUES (200, 100, -50000.00), -- Error: valor negativo (violación del CHECK > 0)

(201, 999, 30000.00), -- Error: alquiler no existe (violación de FK)

(200, 101, 25000.00); -- Error: clave primaria duplicada (idpago repetido)