-- punto A
SELECT * FROM autos where nombre like '%GT%'; 
-- punto B   opcion uno 
SELECT autos.nombre, autos.idMarca
FROM autos
WHERE autos.idMarca IN (SELECT marcas.idMarca
                          FROM marcas
                          WHERE nombre like '%T');
-- punto B   opcion dos
SELECT autos.nombre 
FROM autos 
JOIN marcas on autos.idMarca= marcas.idMarca 
WHERE marcas.nombre LIKE '%t';
-- punto C 
SELECT autos.nombre, autos.precioM, marcas.nombre 
FROM autos 
JOIN marcas on autos.idMarca= marcas.idMarca 
WHERE autos.precioM BETWEEN 100 and 550;
-- punto D opcion uno 
SELECT autos.nombre, autos.idMarca
FROM autos
WHERE autos.idMarca IN (SELECT marcas.idMarca
                          FROM marcas
                          WHERE nombre like '%Chevrolet%' or marcas.nombre LIKE "%Ford%")
order by autos.nombre;
-- punto D opcion dos
SELECT autos.nombre 
FROM autos 
JOIN marcas on autos.idMarca= marcas.idMarca 
WHERE marcas.nombre LIKE '%Chevrolet%' or marcas.nombre LIKE "%Ford%"
order by autos.nombre;