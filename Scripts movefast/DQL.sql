-- Obtener los vehículos disponibles en una ciudad específica.
SELECT v.*
FROM vehiculo v
JOIN sucursal s 
  ON v.sucursal = s.idsucursal WHERE s.ciudad = 'Medellín' and v.disponible

--  Listar los alquileres activos con información del cliente y vehículo
SELECT 
  a.idalquiler,
  c.*,
  v.*
FROM alquiler a
JOIN cliente c 
  ON c.ncedula = a.clienteid
JOIN vehiculo v
  ON v.placa = a.vehiculoPlaca
WHERE CURRENT_DATE 
      BETWEEN a.fechaentrada::date 
          AND a.fechasalida::date;

-- Calcular los ingresos totales por sucursal considerando solo vehículos con más de 3 alquileres.

SELECT s.ciudad, SUM(p.valor) AS ingresos_totales
FROM pago p
JOIN alquiler a ON p.idalquiler = a.idalquiler
JOIN vehiculo v ON v.placa = a.vehiculoPlaca
JOIN sucursal s ON v.sucursal = s.idsucursal
WHERE v.placa IN (
    SELECT vehiculoPlaca
    FROM alquiler
    GROUP BY vehiculoPlaca
    HAVING COUNT(*) > 3
)
GROUP BY s.ciudad;


--  Filtrar solo vehículos con más de 5 alquileres (usar subconsulta)

SELECT *
FROM vehiculo v
WHERE (
  SELECT COUNT(*)
  FROM alquiler a
  WHERE a.vehiculoPlaca = v.placa
) > 5;

--Sumar los montos de todos los pagos asociados
SELECT SUM(valor) FROM pago;
