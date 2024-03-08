-- SELECT con la tabla productos

SELECT * FROM productos WHERE nombre LIKE 'Q%';

SELECT * FROM productos WHERE descripcion IS null;

SELECT * FROM productos WHERE precio BETWEEN '2' AND '3';

-- SELECT con la tabla cuentas

SELECT * FROM cuentas;

SELECT numero_cuenta, saldo FROM cuentas;

SELECT * FROM cuentas WHERE fecha_creacion BETWEEN '08/01/2024' AND '08/03/2024'; 

SELECT numero_cuenta, saldo FROM cuentas WHERE fecha_creacion BETWEEN '08/01/2024' AND '08/03/2024';

-- SELECT con la tabla estudiantes

SELECT * FROM estudiantes;

SELECT nombre, cedula FROM estudiantes;

SELECT nombre FROM estudiantes WHERE cedula like '17%';

SELECT nombre, apellido FROM estudiantes WHERE nombre like 'A%';

-- SELECT con la tabla registros_entrada

SELECT * FROM registros_entrada;

SELECT fecha, hora FROM registros_entrada;

SELECT * FROM registros_entrada WHERE hora BETWEEN '07:00' AND '14:00';

SELECT * FROM registros_entrada WHERE hora > '08:00';

-- SELECT con la tabla videojuegos

SELECT * FROM videojuegos;

SELECT * FROM videojuegos WHERE nombre like 'C%';

SELECT * FROM videojuegos WHERE valoracion BETWEEN 9 AND 10;}

SELECT * FROM videojuegos WHERE descripcion IS null;

-- SELECT con la tabla transacciones

SELECT * FROM transacciones;

SELECT * FROM transacciones WHERE tipo = 'D';

SELECT * FROM transacciones WHERE monto BETWEEN '200' AND '2000';

SELECT codigo, monto, tipo, fecha FROM transacciones WHERE fecha IS NOT null;
