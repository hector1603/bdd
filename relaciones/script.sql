CREATE TABLE estado_civil(
	codigo char(1) not null, 
	descripcion varchar(20) not null,
	constraint estado_civil_pk primary key(codigo)
)

ALTER TABLE personas
ADD CONSTRAINT personas_estado_civil_fk
FOREIGN KEY(estado_civil_codigo)
REFERENCES estado_civil(codigo);

SELECT * FROM personas;

INSERT INTO personas(cedula, nombre, apellido, estado_civil_codigo)
VALUES('17164525', 'Hector', 'Ajumado', 'U');

INSERT INTO personas(cedula, nombre, apellido, estado_civil_codigo)
VALUES('11602125', 'Lucero', 'Martinez', 'U');

INSERT INTO estado_civil(codigo, descripcion)
VALUES('S', 'SOLTERO'),
		('C', 'CASADO'),
		('U', 'UNION LIBRE');
		
SELECT * FROM estado_civil;