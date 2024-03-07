CREATE TABLE registros_entrada(
	codigo_registro int not null,
	registro_empleado char(10) not null,
	fecha date not null,
	hora time not null,
	constraint registros_entrada_pk primary key (codigo_registro)
);