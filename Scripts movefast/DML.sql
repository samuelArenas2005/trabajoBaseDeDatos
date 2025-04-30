
-- 1) CLIENTES (7)
-- Insertamos 7 clientes con cédulas únicas, datos personales y ciudad de registro.
INSERT INTO clientes VALUES
(1001, 'Ana',      'Gómez',     34, '2024-01-15 09:30:00', 'Bogotá'),    -- Cliente Ana Gómez, edad 34, registrada en Bogotá
(1002, 'Luis',     'Martínez',  28, '2024-02-10 14:45:00', 'Medellín'), -- Cliente Luis Martínez, edad 28, registrada en Medellín
(1003, 'Carla',    'Ruiz',      41, '2024-03-05 11:20:00', 'Cali'),      -- Cliente Carla Ruiz, edad 41, registrada en Cali
(1004, 'Pedro',    'Santos',    50, '2023-12-22 08:00:00', 'Bogotá'),    -- Cliente Pedro Santos, edad 50, registrada en Bogotá
(1005, 'Mónica',   'Lozano',    22, '2024-04-01 16:15:00', 'Medellín'), -- Cliente Mónica Lozano, edad 22, registrada en Medellín
(1006, 'Jorge',    'Pérez',     37, '2024-02-28 10:10:00', 'Cali'),      -- Cliente Jorge Pérez, edad 37, registrado en Cali
(1007, 'Verónica', 'Castro',    29, '2023-11-30 13:50:00', 'Bogotá');   -- Cliente Verónica Castro, edad 29, registrada en Bogotá

-- 2) SUCURSALES (3)
-- Insertamos 3 sucursales, cada una con su ID fijo, ciudad, dirección y teléfono de contacto.
INSERT INTO sucursal VALUES
(1, 'Bogotá',   'Cra 10 #45-20', '3001234567'),  -- Sucursal 1 en Bogotá
(2, 'Medellín', 'Cl. 50 #20-15', '3107654321'),  -- Sucursal 2 en Medellín
(3, 'Cali',     'Av. 4N #70-37', '3209876543');  -- Sucursal 3 en Cali

-- 3) VEHÍCULOS (5)
-- Cinco vehículos distintos, con placas únicas, especificando disponibilidad y sucursal.
INSERT INTO vehiculo VALUES
('ABC123', 'Toyota',    2020, 'Blanco', 4, TRUE,  1),  -- Vehículo ABC123 (Toyota 2020 blanco), disponible en sucursal Bogotá
('DEF456', 'Chevrolet', 2018, 'Rojo',   2, TRUE,  1),  -- Vehículo DEF456 (Chevrolet 2018 rojo), disponible en sucursal Bogotá
('GHI789', 'Kia',       2022, 'Negro',  2, FALSE, 2),  -- Vehículo GHI789 (Kia 2022 negro), actualmente no disponible en Medellín
('JKL012', 'Hyundai',   2019, 'Azul',   4, TRUE,  2),  -- Vehículo JKL012 (Hyundai 2019 azul), disponible en sucursal Medellín
('MNO345', 'Ford',      2017, 'Gris',   2, TRUE,  3);  -- Vehículo MNO345 (Ford 2017 gris), disponible en sucursal Cali

-- 4) ALQUILERES (10)
-- Diez alquileres con fechas que no se solapan por vehículo.
-- Sólo dos registros están activos (fechasalida > '2025-04-29').
INSERT INTO alquiler VALUES
( 1, 1001, 'ABC123', '2025-01-05 10:00:00', '2025-01-10 18:00:00', FALSE), -- Ana Gómez alquiló ABC123 del 5 al 10 ene 2025 (inactivo)
( 2, 1002, 'ABC123', '2025-01-20 09:00:00', '2025-01-25 17:00:00', FALSE), -- Luis Martínez alquiló ABC123 del 20 al 25 ene 2025 (inactivo)
( 3, 1003, 'ABC123', '2025-02-10 08:30:00', '2025-02-15 16:00:00', FALSE), -- Carla Ruiz alquiló ABC123 del 10 al 15 feb 2025 (inactivo)
( 4, 1004, 'ABC123', '2025-03-10 11:00:00', '2025-03-15 15:00:00', FALSE), -- Pedro Santos alquiló ABC123 del 10 al 15 mar 2025 (inactivo)

( 5, 1006, 'DEF456', '2025-02-01 09:00:00', '2025-02-07 17:00:00', FALSE), -- Jorge Pérez alquiló DEF456 del 1 al 7 feb 2025 (inactivo)
( 6, 1005, 'DEF456', '2025-04-28 09:00:00', '2025-05-05 18:00:00', TRUE),  -- Mónica Lozano alquila DEF456 del 28 abr al 5 may 2025 (activo)

( 7, 1006, 'JKL012', '2025-03-20 08:00:00', '2025-03-25 16:00:00', FALSE), -- Jorge Pérez alquiló JKL012 del 20 al 25 mar 2025 (inactivo)
( 8, 1007, 'JKL012', '2025-04-30 10:00:00', '2025-05-06 17:00:00', TRUE),  -- Verónica Castro alquila JKL012 del 30 abr al 6 may 2025 (activo)

( 9, 1002, 'GHI789', '2025-02-15 12:00:00', '2025-02-20 14:00:00', FALSE), -- Luis Martínez alquiló GHI789 del 15 al 20 feb 2025 (inactivo)
(10, 1003, 'MNO345', '2025-04-05 07:00:00', '2025-04-12 12:00:00', FALSE); -- Carla Ruiz alquiló MNO345 del 5 al 12 abr 2025 (inactivo)

-- 5) PAGOS (10)
-- Cada pago corresponde a un alquiler específico, registrando el valor cobrado.
INSERT INTO pago VALUES
( 1,  1, 150.00), -- Pago por alquiler 1 (ABC123) de Ana Gómez
( 2,  2, 175.50), -- Pago por alquiler 2 (ABC123) de Luis Martínez
( 3,  3, 200.75), -- Pago por alquiler 3 (ABC123) de Carla Ruiz
( 4,  4, 180.00), -- Pago por alquiler 4 (ABC123) de Pedro Santos
( 5,  5, 220.20), -- Pago por alquiler 5 (DEF456) de Jorge Pérez
( 6,  6, 330.00), -- Pago por alquiler 6 (DEF456) de Mónica Lozano
( 7,  7, 260.00), -- Pago por alquiler 7 (JKL012) de Jorge Pérez
( 8,  8, 275.40), -- Pago por alquiler 8 (JKL012) de Verónica Castro
( 9,  9, 305.60), -- Pago por alquiler 9 (GHI789) de Luis Martínez
(10, 10, 190.80); -- Pago por alquiler 10 (MNO345) de Carla Ruiz
