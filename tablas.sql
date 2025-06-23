CREATE SCHEMA aplicacion_musica; -- CREATE SCHEMA aplicacion_musica AUTHORIZATION postgres;
SET search_path TO "aplicacion_musica";

CREATE TYPE forma_pago_enum AS ENUM ('efectivo', 'tarjeta', 'transferencia');
CREATE TYPE genero_cancion_enum AS ENUM (
    'rock',
    'pop',
    'rock alternativo',
    'reguetón',
    'flamenco urbano',
    'rock psicodélico',
    'pop latino',
    'indie rock'
);

CREATE TABLE IF NOT EXISTS planes_subscripcion (
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
CREATE TABLE IF NOT EXISTS usuarios (
    nombre_usuario VARCHAR(32),
    email VARCHAR(64) UNIQUE NOT NULL,
    fecha_de_registro DATE NOT NULL DEFAULT CURRENT_DATE,
    nombre_plan VARCHAR(32) NOT NULL DEFAULT 'Gratuito',
    PRIMARY KEY (nombre_usuario),
    CONSTRAINT fk_usuario_plan FOREIGN KEY (nombre_plan) REFERENCES planes_subscripcion(nombre_plan) 
    ON DELETE SET DEFAULT
    ON UPDATE CASCADE
);

--Creacion Tabla pagos
CREATE TABLE IF NOT EXISTS pagos (
    numero_pago SERIAL NOT NULL,
    nombre_usuario VARCHAR(32),
    nombre_plan VARCHAR(32),
    forma_pago forma_pago_enum NOT NULL,
    precio_plan NUMERIC(10,2) NOT NULL,
    fecha_pago DATE NOT NULL DEFAULT CURRENT_DATE,
    PRIMARY KEY (numero_pago),
    CONSTRAINT fk_nombre_usuario FOREIGN KEY (nombre_usuario) REFERENCES usuarios(nombre_usuario)
    ON DELETE CASCADE
);

--Creacion Tabla artistas
CREATE TABLE IF NOT EXISTS artistas ( 
    nombre_artista VARCHAR(32),
    tipo_artista VARCHAR(32) NOT NULL CHECK (tipo_artista IN ('solista', 'banda')),
    pais VARCHAR(32) NOT NULL,
    PRIMARY KEY (nombre_artista)
);

--Creacion Tabla canciones
--Cuidado con INTERVAL Porque aca en vs no lo toma como dominio pero supuestamente es un dominio

CREATE TABLE IF NOT EXISTS canciones (
    id_cancion SERIAL,
    nombre_cancion VARCHAR(32) NOT NULL,
    duracion_cancion INT CHECK (duracion_cancion > 0) NOT NULL, -- Duracion en segundos
    genero_cancion genero_cancion_enum NOT NULL,
    PRIMARY KEY (id_cancion)
);

--Creacion Tabla albumes
CREATE TABLE IF NOT EXISTS albumes ( 
    id_album SERIAL,
    nombre_artista VARCHAR(32),
    nombre_album VARCHAR(32) NOT NULL,
    fecha_lanzamiento DATE NOT NULL,
    PRIMARY KEY (id_album),
    CONSTRAINT fk_nombre_artista FOREIGN KEY (nombre_artista) REFERENCES artistas(nombre_artista)
    ON DELETE CASCADE
);

--Creacion Albumes_Canciones
CREATE TABLE IF NOT EXISTS albumes_canciones (
    id_cancion INT,
    id_album INT, 
    PRIMARY KEY (id_cancion),
    CONSTRAINT fk_id_cancion FOREIGN KEY (id_cancion) REFERENCES canciones(id_cancion)
    ON DELETE CASCADE,
    CONSTRAINT fk_id_album FOREIGN KEY (id_album) REFERENCES albumes(id_album)
    ON DELETE CASCADE
);

--Creacion Canciones_Artistas
CREATE TABLE IF NOT EXISTS canciones_artistas (
    id_cancion INT,
    nombre_artista VARCHAR(32),
    PRIMARY KEY (id_cancion, nombre_artista),
    CONSTRAINT fk_id_cancion FOREIGN KEY (id_cancion) REFERENCES canciones(id_cancion)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    CONSTRAINT fk_nombre_artista FOREIGN KEY (nombre_artista) REFERENCES artistas(nombre_artista)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);

--Creacion Reproducciones_Usuarios 
CREATE TABLE IF NOT EXISTS reproducciones_usuarios (
    nombre_usuario VARCHAR(32),
    id_cancion INT,
    PRIMARY KEY (nombre_usuario, id_cancion),
    CONSTRAINT fk_nombre_usuario FOREIGN KEY (nombre_usuario) REFERENCES usuarios(nombre_usuario)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    CONSTRAINT fk_id_cancion FOREIGN KEY (id_cancion) REFERENCES canciones(id_cancion)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);

--Creacion Artistas_Guardados 
CREATE TABLE IF NOT EXISTS artistas_guardados (
    nombre_usuario VARCHAR(32),
    nombre_artista VARCHAR(32),
    PRIMARY KEY (nombre_usuario, nombre_artista),
    CONSTRAINT fk_nombre_usuario FOREIGN KEY (nombre_usuario) REFERENCES usuarios(nombre_usuario)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    CONSTRAINT fk_nombre_artista FOREIGN KEY (nombre_artista) REFERENCES artistas(nombre_artista)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);

--Creacion Canciones_Guardadas (esta tabla es igual a reproducciones_usuarios)
CREATE TABLE IF NOT EXISTS canciones_guardadas (
    nombre_usuario VARCHAR(32),
    id_cancion INT,
    PRIMARY KEY (nombre_usuario, id_cancion),
    CONSTRAINT fk_nombre_usuario FOREIGN KEY (nombre_usuario) REFERENCES usuarios(nombre_usuario)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    CONSTRAINT fk_id_cancion FOREIGN KEY (id_cancion) REFERENCES canciones(id_cancion)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

--Creacion Albumes_Guardados
CREATE TABLE IF NOT EXISTS albumes_guardados (
    nombre_usuario VARCHAR(32),
    id_album INT,
    PRIMARY KEY (nombre_usuario, id_album),
    CONSTRAINT fk_nombre_usuario FOREIGN KEY (nombre_usuario) REFERENCES usuarios(nombre_usuario)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    CONSTRAINT fk_id_album FOREIGN KEY (id_album) REFERENCES albumes(id_album)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

-- Crear o reemplazar la funciÃ³n del trigger
CREATE OR REPLACE FUNCTION aplicacion_musica.trg_check_nombre_plan()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
  -- Verificar que el nombre_plan exista en la tabla de planes
  IF NOT EXISTS (
    SELECT 1
    FROM aplicacion_musica.planes_subscripcion
    WHERE nombre_plan = NEW.nombre_plan
  ) THEN
    RAISE EXCEPTION 'El plan "%" no existe en planes_subscripcion.', NEW.nombre_plan;
  END IF;

  RETURN NEW;
END;
$$;

-- Crear el trigger sobre la tabla pagos
CREATE TRIGGER trg_check_nombre_plan
BEFORE INSERT OR UPDATE ON aplicacion_musica.pagos
FOR EACH ROW
EXECUTE FUNCTION aplicacion_musica.trg_check_nombre_plan();

-- Funcion para verificar precio de plan
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
END
$$;

CREATE TRIGGER before_pagos_insert
  BEFORE INSERT OR UPDATE ON aplicacion_musica.pagos
  FOR EACH ROW
  EXECUTE FUNCTION aplicacion_musica.trg_set_precio_plan();