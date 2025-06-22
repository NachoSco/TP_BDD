CREATE SCHEMA aplicacion_musica; -- CREATE SCHEMA aplicacion_musica AUTHORIZATION postgres;
SET search_path TO "aplicacion_musica";

CREATE TYPE forma_pago_enum AS ENUM ('efectivo', 'tarjeta', 'transferencia');
CREATE TYPE genero_cancion_enum AS ENUM ('rock', 'pop', 'jazz', 'reggae', 'trap', 'indie', 'cumbia');

CREATE TABLE planes_subscripcion (
    nombre_plan VARCHAR(32),
    descripcion_plan VARCHAR(64) NOT NULL,
    duracion_plan INT NOT NULL DEFAULT 36500,  
    es_pago BOOLEAN NOT NULL DEFAULT false,
	precio NUMERIC(10,2) NOT NULL, 
    PRIMARY KEY (nombre_plan),
	CONSTRAINT chk_precio_pago_total
  	CHECK (
    	(es_pago = TRUE  AND precio > 2000)
 		OR (es_pago = FALSE AND precio = 0)
	)
);

--Creacion Tabla usuarios
CREATE TABLE usuarios (
    nombre_usuario VARCHAR(32),
    email VARCHAR(64) UNIQUE NOT NULL,
    fecha_de_registro DATE NOT NULL DEFAULT CURRENT_DATE,
    nombre_plan VARCHAR(32) NOT NULL, --DEFAULT Gratuito,
    PRIMARY KEY (nombre_usuario),
    CONSTRAINT fk_usuarios_plan FOREIGN KEY (nombre_plan) REFERENCES planes_subscripcion(nombre_plan) 
    ON DELETE SET DEFAULT
    ON UPDATE CASCADE
);

--Creacion Tabla pagos
CREATE TABLE pagos (
    numero_pago SERIAL NOT NULL,
    nombre_usuario VARCHAR(32),
    nombre_plan VARCHAR(32),
    forma_pago forma_pago_enum NOT NULL,
    fecha_pago DATE NOT NULL DEFAULT CURRENT_DATE,
    precio_plan NUMERIC(10,2) NOT NULL,
    PRIMARY KEY (numero_pago),
    FOREIGN KEY (nombre_usuario) REFERENCES usuarios(nombre_usuario),
    FOREIGN KEY (nombre_plan) REFERENCES planes_subscripcion(nombre_plan)
);

--Creacion Tabla artistas
CREATE TABLE artistas ( 
    nombre_artista VARCHAR(32),
    tipo_artista VARCHAR(32) NOT NULL CHECK (tipo_artista IN ('solista', 'banda')),
    pais VARCHAR(32) NOT NULL,
    PRIMARY KEY (nombre_artista)
);

--Creacion Tabla canciones
--Cuidado con INTERVAL Porque aca en vs no lo toma como dominio pero supuestamente es un dominio

CREATE TABLE canciones (
    id_cancion SERIAL,
    nombre_cancion VARCHAR(32) NOT NULL,
    duracion_cancion INT CHECK (duracion_cancion > 0) NOT NULL, -- Duracion en segundos
    genero_cancion genero_cancion_enum NOT NULL,
    PRIMARY KEY (id_cancion)
);

--Creacion Tabla albumes
CREATE TABLE albumes ( 
    id_album SERIAL,
    nombre_artista VARCHAR(32),
    nombre_album VARCHAR(32) NOT NULL,
    fecha_lanzamiento DATE NOT NULL,
    PRIMARY KEY (id_album),
    FOREIGN KEY (nombre_artista) REFERENCES artistas(nombre_artista)
);

--Creacion Albumes_Canciones
CREATE TABLE albumes_canciones (
    id_cancion INT,
    id_album INT, 
    PRIMARY KEY (id_cancion),
    FOREIGN KEY (id_cancion) REFERENCES canciones(id_cancion),
    FOREIGN KEY (id_album) REFERENCES albumes(id_album)
);

--Creacion Canciones_Artistas
CREATE TABLE canciones_artistas (
    id_cancion INT,
    nombre_artista VARCHAR(32),
    PRIMARY KEY (id_cancion, nombre_artista),
    FOREIGN KEY (id_cancion) REFERENCES canciones(id_cancion),
    FOREIGN KEY (nombre_artista) REFERENCES artistas(nombre_artista)
);

--Creacion Reproducciones_Usuarios 
CREATE TABLE reproducciones_usuarios (
    nombre_usuario VARCHAR(32),
    id_cancion INT,
    PRIMARY KEY (nombre_usuario, id_cancion),
    FOREIGN KEY (nombre_usuario) REFERENCES usuarios(nombre_usuario),
    FOREIGN KEY (id_cancion) REFERENCES canciones(id_cancion)
);

--Creacion Artistas_Guardados 
CREATE TABLE artistas_guardados (
    nombre_usuario VARCHAR(32),
    nombre_artista VARCHAR(32),
    PRIMARY KEY (nombre_usuario, nombre_artista),
    FOREIGN KEY (nombre_usuario) REFERENCES usuarios(nombre_usuario),
    FOREIGN KEY (nombre_artista) REFERENCES artistas(nombre_artista)
);

--Creacion Canciones_Guardadas (esta tabla es igual a reproducciones_usuarios)
CREATE TABLE canciones_guardadas (
    nombre_usuario VARCHAR(32),
    id_cancion INT,
    PRIMARY KEY (nombre_usuario, id_cancion),
    FOREIGN KEY (nombre_usuario) REFERENCES usuarios(nombre_usuario),
    FOREIGN KEY (id_cancion) REFERENCES canciones(id_cancion)
);

--Creacion Albumes_Guardados
CREATE TABLE albumes_guardados (
    nombre_usuario VARCHAR(32),
    id_album INT,
    PRIMARY KEY (nombre_usuario, id_album),
    FOREIGN KEY (nombre_usuario) REFERENCES usuarios(nombre_usuario),
    FOREIGN KEY (id_album) REFERENCES albumes(id_album)
);

-- 1) (Re)Crear la función, calificando también la tabla de planes
CREATE OR REPLACE FUNCTION aplicacion_musica.trg_set_precio_plan()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
  SELECT precio
    INTO NEW.precio_plan
  FROM aplicacion_musica.planes_subscripcion ap
  WHERE ap.nombre_plan = NEW.nombre_plan;

  RETURN NEW;
END;
$$;

-- 3) Crear el trigger en el esquema correcto
CREATE TRIGGER before_pagos_insert
  BEFORE INSERT OR UPDATE ON aplicacion_musica.pagos
  FOR EACH ROW
  EXECUTE FUNCTION aplicacion_musica.trg_set_precio_plan();