SELECT * FROM cuentas;
SELECT * FROM usuario;

SELECT AVG(CAST(saldo AS NUMERIC)) FROM cuentas, usuario
WHERE cedula_propietario = '98765';

SELECT tipo_cuenta, COUNT(*) FROM usuario
GROUP BY tipo_cuenta;

SELECT * FROM clientes;
SELECT * FROM compras;

SELECT cedula, SUM(monto) FROM compras
GROUP BY cedula;

SELECT SUM(monto), COUNT(*) FROM compras
WHERE fecha_compra = '2021-07-31';


SELECT * FROM estudiantes;
SELECT * FROM profesores;

SELECT codigo_profesor, COUNT(*) FROM estudiantes
GROUP BY codigo_profesor;

SELECT ROUND(AVG(EXTRACT(YEAR FROM CURRENT_DATE) - EXTRACT(YEAR FROM fecha_nacimiento))) AS edad_promedio
FROM estudiantes;

SELECT * FROM persona;
SELECT * FROM prestamo;

SELECT cedula, SUM(monto) AS monto_total_prestamos FROM prestamo 
GROUP BY cedula;

SELECT COUNT(*) AS total_personas FROM persona
WHERE numero_hijos > 1;

SELECT * FROM productos;
SELECT * FROM ventas;

SELECT MAX(precio) AS precio_maximo FROM productos;

SELECT SUM(cantidad) AS cantidad_total_vendida FROM ventas;

SELECT * FROM transacciones;
SELECT * FROM banco;

SELECT COUNT(monto) AS total_transacciones_credito FROM transacciones
WHERE tipo = 'C';

SELECT numero_cuenta, ROUND(AVG(CAST(monto AS decimal)),2) AS monto_promedio FROM transacciones
GROUP BY numero_cuenta;

SELECT * FROM videojuegos;
SELECT * FROM plataformas;

SELECT codigo_videojuego, COUNT(*) AS total_plataformas FROM plataformas
GROUP BY codigo_videojuego;

SELECT ROUND(AVG(valoracion),2) AS valoracion_promedio FROM videojuegos;

SELECT * FROM registro_entrada;
SELECT * FROM empleado;

SELECT cedula_empleado, COUNT(*) AS total_registros_entrada FROM registro_entrada
GROUP BY cedula_empleado;

SELECT MIN(fecha) AS fecha_minima, MAX(fecha) AS fecha_maxima FROM registro_entrada;