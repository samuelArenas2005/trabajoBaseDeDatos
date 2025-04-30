-- Insertar datos en tabla Bebida
INSERT INTO Bebida (id_bebida, Nombre, Importe) VALUES
(1, 'Jugo de Naranja', 8000),
(2, 'Coca-Cola', 6000),
(3, 'Limonada Natural', 7000),
(4, 'Cerveza Artesanal', 12000),
(5, 'Agua Mineral', 5000);

-- Insertar datos en tabla Cliente 
INSERT INTO Cliente (id_cliente, Nombre, Apellido, Observaciones) VALUES
(1, 'Carlos', 'Pérez', 'Cliente frecuente'),
(2, 'María', 'Gómez', 'Solicita factura electrónica'),
(3, 'Juan', 'Rodríguez', 'Prefiere contacto por correo'),
(4, 'Ana', 'López', 'Cliente nuevo'),
(5, 'Luis', 'Martínez', 'Tiene descuento del 10%');

-- Insertar datos en tabla Mesa 
INSERT INTO Mesa (id_mesa, num_comensales, Ubicacion) VALUES
(1, 1, 'Terraza'),
(2, 2, 'Interior junto a ventana'),
(3, 3, 'Salón principal'),
(4, 4, 'Zona VIP'),
(5, 5, 'Cerca de la barra');

-- Insertar datos en tabla Mesero 
INSERT INTO Mesero (id_mesero, Nombre, Apellido1, Apellido2) VALUES
(1, 'Sofia', 'Ramírez', 'Torres'),
(2, 'Mateo', 'González', 'López'),
(3, 'Camila', 'Fernández', 'Martínez'),
(4, 'Diego', 'Sánchez', 'Ruiz'),
(5, 'Valentina', 'Castro', 'Jiménez');

-- Insertar datos en tabla Platillo
INSERT INTO Platillo (id_platillo, Nombre, Importe) VALUES
(1, 'Tacos al Pastor', 25000),
(2, 'Hamburguesa Especial', 32000),
(3, 'Pizza Margarita', 28000),
(4, 'Ensalada César', 22000),
(5, 'Sopa de Mariscos', 30000);

-- Insertar datos en tabla Factura
INSERT INTO factura (id_factura, fecha_factura, id_cliente, id_mesero, id_mesa, id_platillo, id_bebida) VALUES
(1, '2025-04-01', 1, 1, 1, 1, 1),
(2, '2025-04-01', 2, 2, 2, 2, 2),
(3, '2025-04-01', 3, 3, 3, 3, 3),
(4, '2025-04-01', 4, 4, 4, 4, 4),
(5, '2025-04-01', 5, 5, 5, 5, 5),
(6, '2025-04-02', 1, 1, 4, 4, 5),
(7, '2025-04-02', 2, 2, 5, 5, 1),
(8, '2025-04-03', 3, 3, 1, 2, 3),
(9, '2025-04-03', 4, 4, 2, 3, 4),
(10, '2025-04-03', 5, 5, 3, 4, 5),
(11, '2025-04-04', 1, 1, 4, 5, 1),
(12, '2025-04-04', 2, 2, 5, 1, 2),
(13, '2025-04-04', 3, 3, 1, 2, 3),
(14, '2025-04-04', 4, 4, 2, 3, 4),
(15, '2025-04-05', 5, 5, 3, 5, 1);