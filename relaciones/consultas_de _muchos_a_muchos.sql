SELECT * FROM usuarios;
SELECT * FROM grupo;
SELECT * FROM usuario_grupo;

-- Consulta
SELECT us.nombre AS nombre_usuarios, gr.nombre AS nombre_grupos FROM usuarios us, grupo gr, usuario_grupo ug
WHERE us.id_usuario = ug.us_id
AND gr.id_grupo = ug.gr_id;

SELECT us.nombre FROM usuarios us
WHERE id_usuario IN(SELECT us_id FROM usuario_grupo WHERE gr_id = 1);

SELECT gr.nombre, COUNT(ug.us_id) FROM usuario_grupo ug, grupo gr
WHERE gr.id_grupo = ug.gr_id
GROUP BY gr.nombre

-- Consulta 2
SELECT us.nombre, gr.nombre FROM usuarios us, grupo gr, usuario_grupo ug
WHERE us.id_usuario = ug.us_id AND gr.id_grupo = ug.gr_id
AND gr.nombre LIKE '%intensivo%'

SELECT us.nombre AS nombre_usuarios FROM usuarios us
WHERE us.id_usuario IN(SELECT us_id FROM usuario_grupo WHERE gr_id = 2);

SELECT gr.nombre AS nombre_grupo, MAX(ug.us_id) AS maximo FROM grupo gr, usuario_grupo ug
WHERE gr.id_grupo = ug.gr_id
GROUP BY gr.nombre

-- Consulta 3
SELECT us.nombre AS nombre_usuarios, gr.fecha_creacion FROM usuarios us, grupo gr, usuario_grupo ug
WHERE us.id_usuario = ug.us_id AND gr.id_grupo = ug.gr_id
AND gr.fecha_creacion BETWEEN '2020-03-08' AND '2022-03-08';

SELECT us.nombre FROM usuarios us
WHERE us.id_usuario IN(SELECT us_id FROM usuario_grupo WHERE gr_id = 3);

SELECT gr.descripcion, COUNT(ug.us_id) AS usuarios_por_grupo FROM grupo gr, usuario_grupo ug
WHERE gr.id_grupo = ug.gr_id AND gr.descripcion LIKE '%matutino%'
GROUP BY gr.descripcion;



SELECT * FROM habitaciones;
SELECT * FROM huespedes;
SELECT * FROM reservas;

-- Consulta
SELECT ha.habitacion_numero, hu.nombres, hu.apellidos FROM habitaciones ha, huespedes hu, reservas re
WHERE ha.habitacion_numero = re.habitacion_id 
AND hu.id_huespedes = re.huesped_id

SELECT hu.nombres, hu.apellidos FROM huespedes hu
WHERE hu.id_huespedes IN(SELECT huesped_id FROM reservas WHERE habitacion_id = 2);

SELECT ha.habitacion_numero, COUNT(re.huesped_id) FROM habitaciones ha, reservas re
WHERE ha.habitacion_numero = re.habitacion_id
GROUP BY ha.habitacion_numero;

-- Consulta 2
SELECT ha.habitacion_numero, ha.piso, hu.nombres, hu.apellidos FROM habitaciones ha, huespedes hu, reservas re
WHERE ha.habitacion_numero = re.habitacion_id AND hu.id_huespedes = re.huesped_id
AND ha.piso = 4;

SELECT hu.nombres, hu.apellidos FROM huespedes hu
WHERE hu.id_huespedes IN(SELECT huesped_id FROM reservas WHERE habitacion_id = 3);

SELECT ha.habitacion_numero, ROUND(AVG(re.huesped_id),2) AS promedio_de_huespedes FROM habitaciones ha, reservas re
WHERE ha.habitacion_numero = re.habitacion_id
GROUP BY ha.habitacion_numero;

-- Consulta 3
SELECT ha.habitacion_numero, hu.nombres, hu.apellidos FROM habitaciones ha, huespedes hu, reservas re
WHERE ha.habitacion_numero = re.habitacion_id AND hu.id_huespedes = re.huesped_id;

SELECT hu.nombres, hu.apellidos FROM huespedes hu
WHERE hu.id_huespedes IN(SELECT huesped_id FROM reservas WHERE habitacion_id = 4);

SELECT ha.habitacion_numero, SUM(ha.precio_por_noche) AS recaudo_por_habitacion FROM habitaciones ha, reservas re
WHERE ha.habitacion_numero = re.habitacion_id
GROUP BY ha.habitacion_numero;


SELECT * FROM municipio;
SELECT * FROM proyecto;
SELECT * FROM proyecto_municipio;
SELECT * FROM ciudad;

-- Consulta
SELECT mu.nombre AS nombre_municipio, pr.proyecto AS nombre_proyecto FROM municipio mu, proyecto pr, proyecto_municipio pm
WHERE mu.id_municipio = pm.municipio_id AND pr.id_proyecto = pm.proyecto_id;

SELECT pr.proyecto AS nombre_proyecto FROM proyecto pr
WHERE pr.id_proyecto IN(SELECT proyecto_id FROM proyecto_municipio WHERE municipio_id = 1);

SELECT mu.nombre AS nombre_municipio, COUNT(proyecto_id) AS proyectos_por_municipio FROM municipio mu, proyecto_municipio pm
WHERE mu.id_municipio = pm.municipio_id
GROUP BY mu.nombre;

-- Consulta 2
SELECT mu.nombre AS nombre_municipio, pr.proyecto AS nombre_proyecto FROM municipio mu, proyecto pr, proyecto_municipio pm
WHERE mu.id_municipio = pm.municipio_id AND pr.id_proyecto = pm.proyecto_id
AND mu.nombre LIKE '%GAD%';

SELECT mu.nombre AS nombre_municipio, MIN(proyecto_id) AS valor_minimo_proyecto FROM municipio mu, proyecto_municipio pm
WHERE mu.id_municipio = pm.municipio_id
GROUP BY mu.nombre;

-- Consulta 3
SELECT mu.nombre AS nombre_municipio, ci.nombre AS nombre_ciudad FROM municipio mu, ciudad ci
WHERE mu.ciudad_id = ci.id_ciudad;

SELECT pr.proyecto FROM proyecto pr
WHERE pr.id_proyecto IN(SELECT proyecto_id FROM proyecto_municipio WHERE municipio_id = 3);

SELECT mu.nombre AS nombre_municipio, MAX(proyecto_id) AS valor_maximo FROM municipio mu, proyecto_municipio pm
WHERE mu.id_municipio = pm.municipio_id
GROUP BY mu.nombre;