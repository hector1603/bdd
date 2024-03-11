SELECT * FROM personas;

UPDATE personas SET estatura = 1.70 WHERE cedula = '12345678';

UPDATE personas SET cantidad_ahorrada = 0 WHERE cantidad_ahorrada IS null;

UPDATE personas SET numero_hijos = 0 WHERE numero_hijos IS null;

UPDATE personas SET numero_hijos = 2 WHERE cedula = '12345678';

UPDATE personas SET estatura = 1.12, fecha_nacimiento = '03/05/2016' WHERE cedula = '12342678';