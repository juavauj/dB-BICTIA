-- Punto A

SELECT seleccion.nombre
FROM seleccion
WHERE seleccion.grupo IN (SELECT grupo.id_grupo
 FROM grupo
 WHERE grupo.grupo like '%B%');


-- Punto B

SELECT s2.nombre, s1.nombre
FROM seleccion AS s2 JOIN partido
ON s2.id_seleccion = partido.id_seleccion
JOIN seleccion AS s1 ON s1.id_seleccion = partido.id_seleccion_dos
JOIN grupo ON s1.grupo = grupo.id_grupo WHERE grupo.grupo = 'A';


-- Punto C

SELECT id_partido, ps.nombre AS local, ss.nombre AS visitante
FROM seleccion as ps INNER JOIN partido on ps.id_seleccion=partido.id_seleccion
INNER JOIN seleccion AS ss ON ss.id_seleccion=partido.id_seleccion_dos
WHERE ps.nombre LIKE '%u%' OR ss.nombre LIKE '%u%';


-- Punto D

SELECT l.nombre AS local, CONCAT(goles_equipo_uno,'-', goles_equipo_dos) AS
marcador, v.nombre AS visitante
FROM seleccion as l
INNER JOIN partido on l.id_seleccion=partido.id_seleccion INNER JOIN seleccion AS v
ON v.id_seleccion=partido.id_seleccion_dos
INNER JOIN resultado ON partido.id_partido=resultado.id_partido;


-- Punto E

SELECT l.nombre AS local, CONCAT(goles_equipo_uno,'-', goles_equipo_dos) AS marcador,
v.nombre AS visitante
FROM seleccion as l
INNER JOIN partido on l.id_seleccion=partido.id_seleccion INNER JOIN seleccion AS v ON
v.id_seleccion=partido.id_seleccion_dos INNER JOIN resultado ON
partido.id_partido=resultado.id_partido
WHERE l.nombre='Colombia' OR v.nombre='Colombia';