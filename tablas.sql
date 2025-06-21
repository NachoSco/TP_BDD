--Creacion de Esquema
CREATE SCHEMA aplicacion_musica; -- CREATE SCHEMA aplicacion_musica AUTHORIZATION postgres;

CREATE TYPE forma_pago_enum AS ENUM ('efectivo', 'tarjeta', 'transferencia');
CREATE TYPE genero_cancion_enum AS ENUM ('rock', 'pop', 'jazz', 'reggae', 'trap', 'indie', 'cumbia');

-- Dominio del precio plan
CREATE DOMAIN precio_plan AS integer
CHECK (VALUE > 2500);

--duracion_plan modificar su dominio
CREATE TABLE planes_subscripcion (
    nombre_plan VARCHAR(32),
    descripcion_plan VARCHAR(64) NOT NULL, 
    PRIMARY KEY (nombre_plan, duracion_plan)
);

CREATE TABLE planes_gratuitos (
    nombre_plan VARCHAR(32),
    descripcion_plan VARCHAR(64) NOT NULL, 
    PRIMARY KEY (nombre_plan, duracion_plan),
    FOREIGN KEY (nombre_plan) REFERENCES planes_subscripcion(nombre_plan),
    FOREIGN KEY (descripcion_plan) REFERENCES planes_subscripcion(descripcion_plan)
);

CREATE TABLE planes_pagos (
    nombre_plan VARCHAR(32),
    duracion_plan INT CHECK(duracion_plan > 0),
    descripcion_plan VARCHAR(64) NOT NULL, 
    precio precio_plan NOT NULL, 
    PRIMARY KEY (nombre_plan, duracion_plan),
    FOREIGN KEY (nombre_plan) REFERENCES planes_subscripcion(nombre_plan),
    FOREIGN KEY (descripcion_plan) REFERENCES planes_subscripcion(descripcion_plan)
);

--Creacion Tabla usuarios
CREATE TABLE usuarios (
    nombre_usuario VARCHAR(32),
    email VARCHAR(64) UNIQUE NOT NULL,
    fecha_de_registro DATE NOT NULL DEFAULT CURRENT_DATE,
    nombre_plan VARCHAR(32) NOT NULL DEFAULT "Gratuito",
    PRIMARY KEY (nombre_usuario),
    CONSTRAINT FOREIGN KEY (nombre_plan, duracion_plan) REFERENCES planes_subscripcion(nombre_plan, duracion_plan) 
    ON DELETE SET DEFAULT
    ON UPDATE CASCADE
);

--Creacion Tabla pagos
CREATE TABLE pagos (
    numero_pago SERIAL NOT NULL,
    nombre_usuario VARCHAR(32) NOT NULL,
    nombre_plan VARCHAR(32) NOT NULL,
    forma_pago forma_pago_enum NOT NULL,
    fecha_pago DATE NOT NULL DEFAULT CURRENT_DATE,
    monto precio_plan NOT NULL DEFAULT 2500,
    PRIMARY KEY (numero_pago),
    FOREIGN KEY (nombre_usuario) REFERENCES usuarios(nombre_usuario),
    FOREIGN KEY (nombre_plan, duracion_plan) REFERENCES planes_subscripcion(nombre_plan, duracion_plan)
);

--Creacion Tabla artistas
CREATE TABLE artistas ( 
    nombre_artista VARCHAR(32),
    tipo_artista VARCHAR(32) NOT NULL CHECK tipo_artista IN ('solista', 'banda'),
    pais VARCHAR(32) NOT NULL,
    PRIMARY KEY (nombre_artista)
);

--Creacion Tabla canciones
--Cuidado con INTERVAL Porque aca en vs no lo toma como dominio pero supuestamente es un dominio

CREATE TABLE canciones (
    id_cancion SERIAL,
    nombre_cancion VARCHAR(32),
    duracion_cancion INT CHECK (duracion_cancion > 0) NOT NULL, -- Duracion en segundos
    genero_cancion genero_cancion_enum NOT NULL,
    PRIMARY KEY (id_cancion)
);

--Creacion Tabla albumes
CREATE TABLE albumes ( 
    id_album SERIAL,
    nombre_artista VARCHAR(32) NOT NULL,
    nombre_album VARCHAR(32) NOT NULL,
    fecha_lanzamiento DATE NOT NULL,
    PRIMARY KEY (id_album),
    FOREIGN KEY (nombre_artista) REFERENCES artistas(nombre_artista)
);

--Creacion Albumes_Canciones
CREATE TABLE albumes_canciones (
    id_cancion INT,
    id_album INT NOT NULL, 
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
    nombre_usuario VARCHAR(32) NOT NULL,
    id_cancion INT NOT NULL,
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