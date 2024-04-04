CREATE TABLE productos (
	codigo int not null,
	nombre varchar(50) not null,
	stock  int not null,
	constraint productos_pk primary key (codigo)
);

INSERT INTO productos (codigo, nombre, stock)
VALUES (100, 'Doritos', 100),
		(200, 'Kchitos', 200),
		(300, 'Papas', 300),
		(400, 'Takis', 0);

SELECT * FROM productos;

CREATE TABLE proveedores (
	codigo int not null,
	nombre varchar(20) not null,
	telefono varchar(20) not null,
	constraint proveedores_pk primary key (codigo)
);

INSERT INTO proveedores (codigo, nombre, telefono)
VALUES(1, 'Snacks SA', '099292030'),
		(2, 'Distrisnacks', '098723221');
		
SELECT * FROM proveedores;

CREATE TABLE productos_por_proveedor (
	pp_codigo_producto int not null,
	pp_codigo_proveedor int not null,
	pp_precio money not null,
	constraint producto_fk FOREIGN KEY (pp_codigo_producto) REFERENCES productos(codigo),
	constraint proveedor_fk FOREIGN KEY (pp_codigo_proveedor) REFERENCES proveedores(codigo),
	constraint productos_por_proveedor_pk PRIMARY KEY (pp_codigo_producto, pp_codigo_proveedor)
);

INSERT INTO productos_por_proveedor (pp_codigo_producto, pp_codigo_proveedor, pp_precio)
VALUES(300, 1, 0.48),
		(300, 2, 0.49),
		(100, 1, 0.50),
		(200, 1, 0.51),
		(400, 2, 0.51);
		
SELECT * FROM productos_por_proveedor;

SELECT prod.codigo, prod.nombre, prov.nombre AS proveedor, pp.pp_precio AS precio FROM productos prod, proveedores prov, productos_por_proveedor pp
WHERE pp.pp_codigo_producto = prod.codigo
AND pp.pp_codigo_proveedor = prov.codigo
AND prod.codigo = 300;

CREATE TABLE usuarios (
	id_usuario int,
	nombre varchar(25) not null,
	apellido varchar(25) not null,
	fecha_nacimiento date,
	constraint usuarios_pk primary key (id_usuario)
);

CREATE TABLE grupo (
	id_grupo int,
	nombre varchar(25) not null,
	descripcion varchar(75),
	fecha_creacion date,
	constraint grupo_pk primary key (id_grupo)
);

CREATE TABLE usuario_grupo (
	us_id int not null,
	gr_id int not null,
	constraint us_id_fk foreign key (us_id) references usuarios(id_usuario),
	constraint gr_id_fk foreign key (gr_id) references grupo(id_grupo),
	constraint usuario_grupo_pk PRIMARY KEY (us_id, gr_id)
);

SELECT * FROM grupo;

CREATE TABLE habitaciones (
	habitacion_numero int,
	precio_por_noche decimal not null,
	piso int not null,
	max_personas int,
	constraint habitaciones_pk primary key (habitacion_numero)
);

CREATE TABLE huespedes (
	id_huespedes int,
	nombres varchar(45) not null,
	apellidos varchar(45) not null,
	telefono char(10),
	correo varchar(45),
	direccion varchar(45),
	ciudad varchar(45),
	pais varchar(45),
	constraint huespedes_pk primary key (id_huespedes)
);

CREATE TABLE reservas (
	inicio_fecha date,
	fin_fecha date,
	habitacion_id int not null,
	huesped_id int not null,
	constraint habitacion_id_fk FOREIGN KEY (habitacion_id) references habitaciones(habitacion_numero),
	constraint huesped_id_fk FOREIGN KEY (huesped_id) references huespedes(id_huespedes),
	constraint reservas_pk PRIMARY KEY (habitacion_id, huesped_id)
);

CREATE TABLE ciudad (
	id_ciudad int,
	nombre varchar(45) not null,
	constraint ciudad_pk primary key (id_ciudad)
);

CREATE TABLE municipio (
	id_municipio int,
	nombre varchar(45),
	ciudad_id int,
	constraint ciudad_id_fk FOREIGN KEY (ciudad_id) REFERENCES ciudad(id_ciudad),
	constraint municipio_pk PRIMARY KEY (id_municipio) 
);

CREATE TABLE proyecto (
	id_proyecto int,
	proyecto varchar(50) not null,
	monto money not null,
	fecha_inicio date,
	fecha_entrega date,
	constraint proyecto_pk PRIMARY KEY (id_proyecto)
);

CREATE TABLE proyecto_municipio (
	municipio_id int not null,
	proyecto_id int not null,
	constraint municipio_id_fk FOREIGN KEY (municipio_id) REFERENCES municipio (id_municipio),
	constraint proyecto_id_fk FOREIGN KEY (proyecto_id) REFERENCES proyecto (id_proyecto),
	constraint proyecto_municipio_pk PRIMARY KEY (municipio_id, proyecto_id)
);

select *from proyecto_municipio
	