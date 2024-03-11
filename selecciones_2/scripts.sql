SELECT * FROM videojuegos;

ALTER TABLE registros_entrada RENAME COLUMN registro_empleado TO cedula_empleado;

-- SELECT a la tabla productos
SELECT* FROM productos WHERE stock = 10 AND precio < money(10);

SELECT nombre, stock FROM productos WHERE nombre LIKE '%m%' OR nombre LIKE '% %';

SELECT nombre FROM productos WHERE descripcion IS null OR  stock = 0;

-- SELECT a la tabla cuentas
SELECT numero_cuenta, saldo FROM cuentas WHERE saldo > money(100) AND saldo < money(1000);

SELECT numero_cuenta, fecha_creacion FROM cuentas WHERE fecha_creacion BETWEEN '11/03/2023' AND '11/03/2024';

SELECT numero_cuenta FROM cuentas WHERE saldo = money(0) OR cedula_propietario LIKE '%2';

-- SELECT a la tabla estudiantes
SELECT nombre, apellido FROM estudiantes WHERE nombre LIKE 'M%' OR apellido LIKE '%z' 

SELECT nombre FROM estudiantes WHERE cedula LIKE '%32%' AND cedula LIKE '18%';

SELECT nombre, apellido, cedula FROM estudiantes WHERE cedula LIKE '%06' OR cedula LIKE '17%';

-- SELECT con la tabla registros_entrada
SELECT * FROM registros_entrada WHERE fecha = '10/09/2000' OR cedula_empleado LIKE '17';

SELECT * FROM registros_entrada WHERE fecha = '10/08/2000' AND cedula_empleado LIKE '17%' AND hora BETWEEN '08:00' AND '12:00';

SELECT * FROM registros_entrada WHERE (fecha = '10/08/2000' AND cedula_empleado LIKE '17%' AND hora BETWEEN '08:00' AND '12:00') OR (fecha = '10/09/2000' AND cedula_empleado LIKE '08%' AND hora BETWEEN '09:00' and '13:00');

-- SELECT con la tabla videojuegos
SELECT * FROM videojuegos WHERE nombre LIKE '%C%' OR valoracion = 7; 

SELECT * FROM videojuegos WHERE codigo BETWEEN 3 AND 7 OR valoracion = 7;

SELECT * FROM videojuegos WHERE (valoracion > 7 AND nombre LIKE 'C%') OR (valoracion > 8 AND nombre LIKe 'D%'); 

-- SELECT con la tabla transacciones
SELECT * FROM transacciones;

SELECT * FROM transacciones WHERE tipo = 'C' AND numero_cuenta BETWEEN '222001' AND '22004';

SELECT * FROM transacciones WHERE tipo = 'D' AND fecha = '25/05/2024' AND numero_cuenta BETWEEN '22007' AND '22010';

SELECT * FROM transacciones WHERE codigo BETWEEN 1 AND 5 AND numero_cuenta BETWEEN '22002' AND '22004' AND fecha = '25/05/2024' AND fecha = '29/05/2024';  