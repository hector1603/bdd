CREATE TABLE usuario(
	cedula char(5),
	nombre varchar(25) not null,
	apellido varchar(25) not null,
	tipo_cuenta varchar(20),
	limite_credito decimal(10,5),
	constraint usuario_pk primary key(cedula)
);

CREATE TABLE cuentas(
	numero_cuenta char(5),
	cedula_propietario char(5) not null,
	fecha_creacion date not null,
	saldo money not null,
	constraint cuentas_pk primary key(numero_cuenta)
);

INSERT INTO cuentas(numero_cuenta, cedula_propietario, fecha_creacion, saldo)
VALUES
('10001', '11111', '2022-08-21', 100.50),
('10002', '22222', '2022-09-01', 200.75),
('10003', '33333', '2022-10-15', 300.25),
('10004', '44444', '2022-11-21', 400.80),
('10005', '55555', '2023-01-03', 500.20),
('10006', '66666', '2023-03-12', 600.90),
('10007', '77777', '2023-04-25', 700.60),
('10008', '88888', '2023-06-08', 800.45),
('10009', '99999', '2023-08-02', 900.30),
('10010', '00000', '2023-09-21', 1000.70);

SELECT * FROM cuentas;

CREATE TABLE clientes(
	cedula char(10),
	nombre varchar(50) not null,
	apellido varchar(50) not null,
	constraint clientes_pk primary key(cedula)
);

CREATE TABLE compras(
	id_compra int,
	cedula char(10) not null,
	fecha_compra date not null,
	monto decimal(10, 2),
	constraint compras_pk primary key(id_compra)
);

INSERT INTO clientes(cedula, nombre, apellido)
VALUES
('1234561829', 'Juan', 'Lopez'),
('9876543678', 'Maria', 'Gomez'),
('2345678710', 'Pedro', 'Martinez'),
('9866543679', 'Monica', 'Rodriguez'),
('5678123478', 'Ana', 'Perez'),
('5890123845', 'Carlos', 'Sanchez'),
('9876543217', 'Monica', 'Fernandez');

SELECT * FROM clientes;

CREATE TABLE productos(
	codigo int not null,
	nombre varchar(50) not null,
	descripcion varchar(200),
	precio money not null,
	stock int not null,
	constraint productos_pk primary key(codigo)
);

CREATE TABLE ventas(
	id_venta int,
	codigo_producto int not null,
	fecha_venta date not null,
	cantidad int,
	constraint ventas_pk primary key(id_venta)
);

ALTER TABLE ventas
ADD CONSTRAINT productos_ventas_fk
FOREIGN KEY(codigo_producto)
REFERENCES productos(codigo);

INSERT INTO productos(codigo, nombre, descripcion, precio, stock)
VALUES
(1, 'Manzana', 'Fruta fresca', 1.50, 100),
(2, 'Tomate', 'Vegetal rojo', 2.00, 50),
(3, 'Jamón', 'Embutido', 10.00, 20),
(4, 'Arroz', NULL, 3.00, 80),
(5, 'Papel Higiénico', 'Producto de limpieza', 5.00, 30),
(6, 'Mantequilla', 'Producto lácteo', 4.50, 40),
(7, 'Pimiento', 'Vegetal verde', 3.20, 25),
(8, 'Maíz', 'Cereal', 2.50, 60),
(9, 'Pimienta', NULL, 1.80, 15),
(10, 'Cámara', 'Dispositivo electrónico', 200.00, 10);

INSERT INTO ventas(id_venta, codigo_producto, fecha_venta, cantidad)
VALUES
(01, 1, '2023-03-15', 5);

CREATE TABLE videojuegos(
	codigo int not null,
	nombre varchar(100) not null,
	descripcion varchar(300),
	valoracion int not null,
	constraint videojuegos_pk primary key(codigo)
);

CREATE TABLE plataformas(
	id_plataforma int,
	nombre_plataforma varchar(50) not null,
	constraint plataformas_pk primary key(id_plataforma)
);

INSERT INTO plataformas (id_plataforma, nombre_plataforma)
VALUES
    (1, 'PlayStation'),
    (2, 'Xbox'),
    (3, 'Nintendo');

SELECT * FROM plataformas; 

ALTER TABLE plataformas
ADD CONSTRAINT videojuegos_plataformas_fk
FOREIGN KEY(codigo_videojuego)
REFERENCES videojuegos(codigo);

INSERT INTO videojuegos (codigo, nombre, descripcion, valoracion)
VALUES
    (1, 'Call of Duty', 'Juego de guerra moderna', 8),
    (2, 'Battlefield', 'Batallas de guerra realistas', 9),
    (3, 'Medal of Honor', 'Simulador de guerra histórica', 7),
    (4, 'Crysis', 'Juego de ciencia ficción', 8),
    (5, 'Doom', 'Shooter de acción en primera persona', 9),
    (6, 'Diablo', 'RPG de acción y aventura', 9),
    (7, 'God of War', 'Aventura épica de acción y mitología', 10),
    (8, 'Gears of War', 'Shooter táctico de guerra', 9),
    (9, 'Civilization VI', 'Estrategia de construcción de civilizaciones', 8),
    (10, 'Crash Bandicoot', 'Plataforma de aventuras con Crash', 9);
	
SELECT * FROM videojuegos;

CREATE TABLE profesores(
	codigo int,
	nombre varchar(50) not null,
	constraint profesores_pk primary key(codigo)
);

CREATE TABLE estudiantes(
	cedula char(10),
	nombre varchar(50) not null,
	apellido varchar(50) not null,
	email varchar(50) not null,
	fecha_nacimiento date,
	codigo_profesor int,
	constraint estudiantes_pk primary key(cedula)
);

ALTER TABLE estudiantes
ADD CONSTRAINT profesores_estudiantes_fk
FOREIGN KEY(codigo_profesor)
REFERENCES profesores(codigo);

INSERT INTO estudiantes (cedula, nombre, apellido, email, fecha_nacimiento, codigo_profesor)
VALUES
    ('1234567890', 'Juan', 'Martinez', 'juan@example.com', '2000-01-01', NULL),
    ('2345678901', 'Maria', 'Sanchez', 'maria@example.com', '2001-02-02', NULL),
    ('3456789012', 'Luis', 'Fernandez', 'luis@example.com', '2002-03-03', NULL),
    ('4567890123', 'Ana', 'Gonzalez', 'ana@example.com', '2003-04-04', NULL),
    ('5678901234', 'Pedro', 'Nuñez', 'pedro@example.com', '2004-05-05', NULL),
    ('6789012345', 'Sofia', 'Duran', 'sofia@example.com', '2005-06-06', NULL),
    ('7890123456', 'Diego', 'Cano', 'diego@example.com', '2006-07-07', NULL),
    ('8901234567', 'Laura', 'Rodriguez', 'laura@example.com', '2007-08-08', NULL),
    ('9012345678', 'Lucia', 'Nieto', 'lucia@example.com', '2008-09-09', NULL),
    ('0123456789', 'Mateo', 'Martin', 'mateo@example.com', '2009-10-10', NULL);
	
INSERT INTO profesores (codigo, nombre)
VALUES (01, 'Francisco'),
    (5, 'Juan Pérez'),
    (2, 'María López'),
    (3, 'Carlos Rodríguez'),
    (4, 'Ana Gómez');

SELECT * FROM estudiantes;

CREATE TABLE registro_entrada(
	codigo_registro int not null,
	cedula_empleado char(10) not null,
	fecha date not null,
	hora time not null,
	codigo_empleado int not null,
	constraint registro_entrada_pk primary key(codigo_registro)
);

CREATE TABLE empleado(
	codigo_empleado int not null,
	nombre varchar(25) not null,
	fecha date not null,
	hora time not null,
	constraint empleado_pk primary key(codigo_empleado)
);

ALTER TABLE registro_entrada
ADD CONSTRAINT registro_entrada_empleado_fk
FOREIGN KEY(codigo_empleado)
REFERENCES empleado(codigo_empleado);

INSERT INTO empleado (codigo_empleado, nombre, fecha, hora)
VALUES (2201, 'Hector', '2023-09-01', '08:30:10');

INSERT INTO registro_entrada (codigo_registro, cedula_empleado, fecha, hora, codigo_empleado)
VALUES
    (1, '1234567890', '2023-08-01', '08:30:00', 2201),
    (2, '2345678901', '2023-08-05', '09:15:00', 2201),
    (3, '3456789012', '2023-08-10', '10:00:00', 2201),
    (4, '4567890123', '2023-08-15', '11:30:00', 2201),
    (5, '5678901234', '2023-08-20', '12:00:00', 2201),
    (6, '6789012345', '2023-08-25', '08:45:00', 2201),
    (7, '7890123456', '2023-08-30', '09:30:00', 2201),
    (8, '8901234567', '2023-09-05', '10:15:00', 2201),
    (9, '9012345678', '2023-09-10', '11:00:00', 2201),
    (10, '0123456789', '2023-09-15', '12:30:00', 2201);

CREATE TABLE persona (
	cedula char(10) not null,
	nombre varchar(50) not null,
	apellido varchar(50) not null,
	estatura decimal(10, 2),
	fecha_nacimiento date not null,
	hora_nacimiento time,
	cantidad_ahorrada money,
	numero_hijos int,
	constraint persona_pk primary key(cedula)
);

CREATE TABLE prestamo (
	cedula char(10),
	monto money,
	fecha_prestamo date,
	hora_prestamo time,
	garante varchar(40),
	constraint prestamo_pk primary key (cedula)
);

INSERT INTO persona (cedula, nombre, apellido, estatura, fecha_nacimiento, hora_nacimiento, cantidad_ahorrada, numero_hijos)
VALUES
    ('1111111111', 'Sean', 'White', 1.75, '1990-05-15', '08:00:00', 5000.00, 2),
    ('2222222222', 'John', 'Doe', 1.80, '1985-07-20', '10:30:00', 8000.00, 3),
    ('3333333333', 'Jane', 'Doe', 1.65, '1992-02-10', '09:15:00', 3000.00, 1),
    ('4444444444', 'Alice', 'Smith', 1.70, '1998-11-28', '11:45:00', 6000.00, 0),
    ('5555555555', 'Bob', 'Johnson', 1.85, '1995-09-03', '08:30:00', 4000.00, 2),
    ('6666666666', 'Mary', 'Taylor', 1.68, '1991-04-12', '10:00:00', 7000.00, 1),
    ('7777777777', 'Emma', 'Brown', 1.73, '1997-12-18', '09:45:00', 3500.00, 0),
    ('8888888888', 'Michael', 'Davis', 1.79, '1989-08-24', '11:15:00', 4500.00, 3),
    ('9999999999', 'Olivia', 'Wilson', 1.72, '1994-06-05', '10:20:00', 5500.00, 2),
    ('1010101010', 'Liam', 'Martinez', 1.76, '1996-03-30', '09:00:00', 6500.00, 1);

INSERT INTO prestamo (cedula, monto, fecha_prestamo, hora_prestamo, garante)
VALUES
    ('1111111111', 500.00, '2023-01-15', '08:30:00', 'Ana Rodríguez'),
    ('2222222222', 750.00, '2023-02-20', '09:45:00', 'Carlos Pérez'),
    ('3333333333', 900.00, '2023-03-10', '10:15:00', 'María Gómez'),
    ('4444444444', 250.00, '2023-04-28', '11:30:00', 'Pedro López'),
    ('5555555555', 600.00, '2023-05-03', '12:00:00', 'Laura Martínez');

CREATE TABLE transacciones (
	codigo int,
	numero_cuenta char(5) not null,
	monto money not null,
	tipo char(1) not null,
	fecha date,
	hora time,
	constraint transacciones_pk primary key(codigo)
);

CREATE TABLE banco (
	codigo_banco int,
	codigo_transaccion int,
	detalle varchar(100),
	constraint banco_pk primary key (codigo_banco)
);

INSERT INTO banco (codigo_banco, codigo_transaccion, detalle)
VALUES (1, 1, 'Transferencia de 800$');

ALTER TABLE banco
ADD CONSTRAINT transacciones_banco_fk
FOREIGN KEY(codigo_transaccion)
REFERENCES transacciones(codigo);

INSERT INTO transacciones (codigo, numero_cuenta, monto, tipo, fecha, hora)
VALUES
    (1, '22001', 100.50, 'C', '2023-08-01', '08:30:00'),
    (2, '22002', 200.75, 'C', '2023-08-05', '09:15:00'),
    (3, '22003', 300.30, 'C', '2023-08-10', '10:00:00'),
    (4, '22004', 150.20, 'D', '2023-08-15', '11:30:00'),
    (5, '22001', 250.60, 'C', '2023-08-20', '12:00:00'),
    (6, '22002', 175.90, 'D', '2023-08-25', '08:45:00'),
    (7, '22003', 180.45, 'C', '2023-08-30', '09:30:00'),
    (8, '22004', 220.80, 'D', '2023-09-05', '10:15:00'),
    (9, '22001', 130.40, 'C', '2023-09-10', '11:00:00'),
    (10, '22002', 180.70, 'C', '2023-09-15', '12:30:00');
