SELECT * FROM transacciones;

-- Actualizar tabla productos
UPDATE productos SET stock = 0 WHERE stock IS null;

-- Actualizar tabla cuentas
UPDATE cuentas SET saldo = 10 WHERE cedula_propietario LIKE '17%';

-- Actualizar tabla estudiantes
UPDATE estudiantes SET apellido = 'Hernández' WHERE cedula LIKE '17%';

-- Actualizar tabla registros_entrada
UPDATE registros_entrada SET cedula_empleado = '082345679' WHERE fecha = '10/08/2000';

-- Actualizar tabla videojuegos
UPDATE videojuegos SET descripcion = 'Mejor puntuado' WHERE valoracion > 9;

-- Actualizar tabla transacciones
UPDATE transacciones SET tipo = 'T'
WHERE fecha = '2023-09-08' 
AND monto>money(100) AND monto<money(500) 
AND hora BETWEEN '14:00:00' AND '20:00:00';