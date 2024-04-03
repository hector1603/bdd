-- Usuario y Compras
SELECT * FROM usuario;
SELECT * FROM cuentas;
INSERT INTO usuario (cedula, nombre, apellido, tipo_cuenta, limite_credito) 
VALUES 
    ('12345', 'Juan', 'Perez', 'Ahorros', 500.00),
    ('54321', 'Maria', 'Lopez', 'Corriente', 1000.00),
    ('98765', 'Pedro', 'Gomez', 'Ahorros', 750.00),
    ('67890', 'Ana', 'Rodriguez', 'Corriente', 1500.00);

SELECT cu.numero_cuenta, us.nombre FROM usuario us, cuentas cu
WHERE saldo > money(100) AND saldo < money(1000);

SELECT cu.numero_cuenta, cu.fecha_creacion, cu.saldo, us.cedula FROM cuentas cu, usuario us 
WHERE fecha_creacion > '2022-09-21' AND fecha_creacion < '2023-09-21';


-- Clientes y Compras
SELECT * FROM clientes;
SELECT * FROM compras;
INSERT INTO compras(id_compra, cedula, fecha_compra, monto)
			VALUES(01, 5890123845, '2024-05-01', 120),
				  (02, 9866543679, '2023-04-12', 10.20),
				  (03, 5890123845, '2021-07-31', 215.10);


ALTER TABLE compras
ADD CONSTRAINT clientes_compras_fk
FOREIGN KEY(cedula)
REFERENCES clientes(cedula)

SELECT cli.nombre, cli.apellido, com.fecha_compra, com.monto FROM clientes cli, compras com
WHERE cli.cedula = com.cedula AND nombre LIKE '%o%';

SELECT cli.nombre, cli.apellido FROM clientes cli
WHERE cli.cedula LIKE '%7%';

SELECT cli.cedula, cli.nombre, cli.apellido, cli.edad FROM clientes cli, compras com
WHERE cli.cedula = com.cedula AND nombre = 'Monica';

-- Estudiantes y Profesores
SELECT * FROM estudiantes;
SELECT * FROM profesores;

SELECT prof.codigo, es.nombre, es.apellido FROM estudiantes es, profesores prof
WHERE es.apellido LIKE '%n%';

SELECT es.cedula, es.nombre, es.apellido, es.email, es.fecha_nacimiento, es.codigo_profesor FROM estudiantes es, profesores pr
WHERE es.codigo_profesor = pr.codigo AND pr.nombre = 'Francisco';  

SELECT * FROM estudiantes es
WHERE es.codigo_profesor = 1; 

-- Persona y Prestamo
SELECT * FROM persona;
SELECT * FROM prestamo;

SELECT pe.cantidad_ahorrada, pr.monto, pr.garante FROM persona pe, prestamo pr
WHERE pr.monto > money(100) AND pr.monto < money(1000);

SELECT * FROM persona 
WHERE cedula = '1111111111';

-- Productos y Ventas
SELECT * FROM productos;
SELECT * FROM ventas;

SELECT pr.nombre, pr.stock, ve.cantidad FROM productos pr, ventas ve
WHERE pr.nombre LIKE '%m%' OR descripcion = null;

SELECT pr.nombre, pr.stock FROM productos pr, ventas ve
WHERE ve.codigo_producto = 5;

-- Transacciones y Banco
SELECT * FROM transacciones;
SELECT * FROM banco;

SELECT * FROM transacciones, banco 
WHERE tipo = 'C' AND (numero_cuenta > '22001' AND numero_cuenta < '22004');

SELECT tr.codigo, tr.numero_cuenta, tr.monto, tr.tipo, tr.fecha, tr.hora  FROM transacciones tr, banco ba 
WHERE tr.codigo = ba.codigo_transaccion;

-- Videojuegos y Plataformas
SELECT * FROM videojuegos;
SELECT * FROM plataformas;

SELECT * FROM videojuegos vi, plataformas
WHERE (vi.descripcion = 'Guerra' AND valoracion > 7) OR ((nombre LIKE 'C%' AND valoracion > 8) AND nombre LIKE 'D%'); 

SELECT pl.id_plataforma, pl.nombre_plataforma, pl.codigo_videojuego FROM  videojuegos vi, plataformas pl
WHERE codigo = codigo_videojuego;

-- Registro_entrada y Empleado
SELECT * FROM empleado;
SELECT * FROM registro_entrada;

SELECT re.cedula_empleado, re.fecha, em.nombre FROM registro_entrada re, empleado em
WHERE (re.fecha > '2023-08-01' AND re.fecha < '2023-08-31') OR 
	(re.cedula_empleado LIKE '17%' AND (re.hora > '08:00' AND re.hora < '12:00') OR 
	 (re.fecha > '2023-10-06' AND re.fecha < '2023-10-20') OR
	(re.cedula_empleado LIKE '%08%' AND (re.hora > '09:00' AND re.hora < '13:00')));

SELECT re.codigo_registro, em.nombre FROM registro_entrada re, empleado em
WHERE re.codigo_empleado = em.codigo_empleado;