CREATE DATABASE tiendaRopa
CHARACTER SET utf8
COLLATE utf8_unicode_ci;

USE tiendaRopa;

CREATE TABLE estado(
	idEstado	INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	nombreEstado	VARCHAR(255),
	descripcion	TEXT
);

CREATE TABLE usuario(
	idUsuario	INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	nombre		VARCHAR(255),
	apellido	VARCHAR(255),
	correo		VARCHAR(255),
	contrasena	VARCHAR(255),
	idEstado	INT,
	idRol		INT
);

CREATE TABLE producto(
	idProducto	INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	nombreProducto	VARCHAR(255),
	precio		INT,
	imgProducto	VARCHAR(255),	
	descripcion	VARCHAR(255),
	idSubcategoria	INT,
	idEstado	INT
);

CREATE TABLE categoria(
	idCategoria	INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	nombre		VARCHAR(255),
	descripcion	VARCHAR(255),
	idEstado	INT
);

CREATE TABLE subcategoria(
	idSubcategoria		INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	nombreSubcategoria	VARCHAR(255),
	idCategoria		INT
);

CREATE TABLE rol(
	idRol		INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	rol		VARCHAR(255),
	descripcion	TEXT,
	idEstado	INT
);

ALTER TABLE 	usuario
ADD CONSTRAINT 	fk_usuarioEstado
FOREIGN KEY	(idEstado)
REFERENCES	estado(idEstado)
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE 	usuario
ADD CONSTRAINT 	fk_usuarioRol
FOREIGN KEY	(idRol)
REFERENCES	rol(idRol)
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE	producto
ADD CONSTRAINT 	fk_productoSubcategoria
FOREIGN KEY	(idSubcategoria)
REFERENCES	subcategoria(idSubcategoria)
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE	producto
ADD CONSTRAINT 	fk_productoEstado
FOREIGN KEY	(idEstado)
REFERENCES	estado(idEstado)
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE	categoria
ADD CONSTRAINT 	fk_categoriaEstado
FOREIGN KEY	(idEstado)
REFERENCES	estado(idEstado)
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE	subcategoria	
ADD CONSTRAINT	fk_subcategoriaCategoria
FOREIGN KEY	(idCategoria)
REFERENCES	categoria(idCategoria)
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE	rol
ADD CONSTRAINT 	fk_rolEstado
FOREIGN KEY	(idEstado)
REFERENCES	estado(idEstado)
ON DELETE CASCADE
ON UPDATE CASCADE;

INSERT INTO estado (nombreEstado, descripcion)
VALUES ('activo', 'Disponible'), ('inactivo', 'No disponible');


INSERT INTO rol	(rol, descripcion, idEstado)
VALUES ('admin', 'Usuario sin la posibilidad de cambiar datos', 1);

INSERT INTO rol	(rol, descripcion, idEstado)
VALUES ('superAdmin', 'Usuario con la posibilidad de cambiar datos', 1);


INSERT INTO usuario (nombre, apellido, correo, contrasena, idEstado, idRol)
VALUES ('Kike', 'Sierra', 'superkike95@gmail.com', 'kikeymaria456', 1, 1);

INSERT INTO categoria (nombre, descripcion, idEstado)
VALUES ('Accesorios', 'Accesorios para Damas y Caballeros', 1);

INSERT INTO subcategoria (nombreSubcategoria, idCategoria)
VALUES ('Sombreros', 1);

INSERT INTO producto (nombreProducto, precio, imgProducto, descripcion, idSubcategoria, idEstado)
VALUES ('Fedora', 45000, 'https://www.meme-arsenal.com/memes/4bc07ce4a3c5fd117a499711f0f4cf68.jpg', 'Fedora clásico con corte español', 1, 1);
