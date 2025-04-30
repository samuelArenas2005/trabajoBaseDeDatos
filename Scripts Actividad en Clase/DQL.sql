--1. Obtener el nombre y apellido de los clientes que hayan consumido un platillo específico.

SELECT c.nombre, c.apellido FROM factura f JOIN cliente c ON f.id_cliente = c.id_cliente 
JOIN platillo p ON f.id_platillo = p.id_platillo WHERE p.nombre = 'Pizza Margarita';

--2. Obtener el nombre y apellido de los clientes que hayan consumido arroz a la marinera.

SELECT c.nombre, c.apellido FROM factura f JOIN cliente c ON f.id_cliente = c.id_cliente 
JOIN platillo p ON f.id_platillo = p.id_platillo WHERE p.nombre = 'arroz a la marinera';

--3. Listar el nombre del mesero y la fecha en la que atendió una mesa 10 que se encuentra ubicada en el segundo piso del restautante.

SELECT m.nombre, f.fecha_facutra FROM factura f JOIN mesero m ON m.id_mesero = f.id_mesero 
JOIN mesa me ON f.id_mesa = me.id_mesa 
WHERE me.ubicacion = 'segundo piso' and me.id_mesa = 10;

SELECT m.nombre, f.fecha_facutra FROM factura f JOIN mesero m ON m.id_mesero = f.id_mesero 
JOIN mesa me ON f.id_mesa = me.id_mesa 
WHERE me.ubicacion = 'Terraza' ;  --ejemplo con terraza, que es un registro que existe.

--4. Mostrar el nombre de los clientes junto con los nombres de las bebidas que consumieron en sus facturas.

SELECT id_factura, c.nombre, b.nombre FROM factura f JOIN cliente c ON f.id_cliente = c.id_cliente 
JOIN bebida b ON f.id_bebida = b.id_bebida;

--5. Consultar todas las facturas que incluyan platillos con un importe mayor a $300000, incluyendo el nombre del cliente y del platillo.

SELECT F.id_factura, C.Nombre, C.Apellido, P.Nombre , P.Importe 
FROM Factura F JOIN Cliente C ON F.id_cliente = C.id_cliente
JOIN Platillo P ON F.id_platillo = P.id_platillo
WHERE P.Importe > 300000;


--6. Listar el total de consumo (importe de platillos y bebidas) del cliente llamado Manuel Pedroza Gonzalez.

SELECT SUM(P.Importe + B.Importe) AS "Total Consumido"
FROM Factura F
JOIN Cliente C ON F.id_cliente = C.id_cliente
JOIN Platillo P ON F.id_platillo = P.id_platillo
JOIN Bebida B ON F.id_bebida = B.id_bebida
WHERE C.Nombre = 'Manuel' AND C.Apellido = 'Pedroza Gonzalez';

--Ejemplo con cliente que existe 
SELECT SUM(P.Importe + B.Importe) AS "Total Consumido"
FROM Factura F
JOIN Cliente C ON F.id_cliente = C.id_cliente
JOIN Platillo P ON F.id_platillo = P.id_platillo
JOIN Bebida B ON F.id_bebida = B.id_bebida
WHERE C.Nombre = 'Ana' AND C.Apellido = 'López';


--7. Liste las mesas que han sido utilizadas al menos una vez, indicando su ubicación y el número de comensales.
SELECT  M.Ubicacion, M.num_comensales FROM Mesa M 
WHERE M.id_mesa IN (SELECT DISTINCT id_mesa FROM Factura);

--USO DE VIEWS 

-- 1. Vista: Consumo detallado por cliente
CREATE VIEW Vista_ConsumoClientes AS
SELECT 
    C.Nombre ClienteNombre,
    C.Apellido ClienteApellido,
    P.Nombre Platillo,
    B.Nombre Bebida,
    F.fecha_facutra Fecha,
    P.Importe MontoPlatillo,
    B.Importe MontoBebida
FROM Factura F
JOIN Cliente C ON F.id_cliente = C.id_cliente
JOIN Platillo P ON F.id_platillo = P.id_platillo
JOIN Bebida B ON F.id_bebida = B.id_bebida;

-- 2. Vista: Meseros y sus facturas atendidas
CREATE VIEW Vista_MeserosFacturas AS
SELECT 
    M.Nombre MeseroNombre,
    M.Apellido1 MeseroApellido,
    F.id_factura NumeroFactura,
    F.fecha_facutra Fecha,
    Me.Ubicacion MesaUbicacion
FROM Factura F
JOIN Mesero M ON F.id_mesero = M.id_mesero
JOIN Mesa Me ON F.id_mesa = Me.id_mesa;

-- 3. Vista: Total gastado por cliente
CREATE VIEW Vista_TotalPorCliente AS
SELECT 
    C.Nombre ClienteNombre,
    C.Apellido ClienteApellido,
    SUM(P.Importe + B.Importe) TotalGastado
FROM Factura F
JOIN Cliente C ON F.id_cliente = C.id_cliente
JOIN Platillo P ON F.id_platillo = P.id_platillo
JOIN Bebida B ON F.id_bebida = B.id_bebida
GROUP BY C.id_cliente, C.Nombre, C.Apellido;

-- 4.1 Vista: Total de consumo de "Manuel Pedroza Gonzalez" ejercicio 6
CREATE VIEW Vista_TotalManuel AS
SELECT 
    SUM(P.Importe + B.Importe) TotalManuel
FROM Factura F
JOIN Cliente C ON F.id_cliente = C.id_cliente
JOIN Platillo P ON F.id_platillo = P.id_platillo
JOIN Bebida B ON F.id_bebida = B.id_bebida
WHERE C.Nombre = 'Manuel' AND C.Apellido = 'Pedroza Gonzalez';

-- 4.2 Vista: Mesas utilizadas ejercicio 7
CREATE VIEW Vista_MesasUtilizadas AS
SELECT 
    Ubicacion UbicacionMesa,
    num_comensales NumComensales
FROM Mesa
WHERE id_mesa IN (SELECT DISTINCT id_mesa FROM Factura);
