SELECT * FROM transacciones;


DELETE FROM productos WHERE descripcion IS null;

DELETE FROM cuentas WHERE cedula_propietario LIKE '10%';

DELETE FROM estudiantes WHERE cedula LIKE '%05';

DELETE FROM registros_entrada WHERE fecha = '10/06/2000';

DELETE FROM videojuegos WHERE valoracion < 7;

DELETE FROM transacciones WHERE hora BETWEEN '14:00' AND '18:00';







