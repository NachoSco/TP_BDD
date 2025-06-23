/*
    ADMINISTRADOR

    Tiene total acceso a la base de datos
*/

GRANT ALL PRIVILEGES ON SCHEMA aplicacion_musica TO Administrador;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA aplicacion_musica TO Administrador;

-- Permisos de administrador para las secuencias
GRANT USAGE, SELECT ON SEQUENCE aplicacion_musica.albumes_id_album_seq TO Administrador;
GRANT USAGE, SELECT ON SEQUENCE aplicacion_musica.canciones_id_cancion_seq TO Administrador;
GRANT USAGE, SELECT ON SEQUENCE aplicacion_musica.pagos_numero_pago_seq TO Administrador;

/*
    CLIENTE

    Puede buscar canciones, artistas, y álbumes
*/
GRANT USAGE ON SCHEMA aplicacion_musica TO Cliente;

-- Permisos para las secuencias de los cliente
GRANT USAGE, SELECT ON SEQUENCE aplicacion_musica.pagos_numero_pago_seq TO Cliente;

-- Permisos para seleccionar canciones, albumes y artistas
GRANT SELECT ON aplicacion_musica.canciones TO Cliente;
GRANT SELECT ON aplicacion_musica.canciones_artistas TO Cliente;
GRANT SELECT ON aplicacion_musica.albumes TO Cliente;
GRANT SELECT ON aplicacion_musica.albumes_canciones TO Cliente;
GRANT SELECT ON aplicacion_musica.artistas TO Cliente;

-- Permisos para consultar, guardar y eliminar canciones, albumes y artistes
GRANT SELECT, INSERT, DELETE ON aplicacion_musica.canciones_guardadas TO Cliente;
GRANT SELECT, INSERT, DELETE ON aplicacion_musica.albumes_guardados TO Cliente;
GRANT SELECT, INSERT, DELETE ON aplicacion_musica.artistas_guardados TO Cliente;

-- Permisos para buscar planes de suscripcion
GRANT SELECT ON aplicacion_musica.planes_subscripcion TO Cliente;

-- Permisos para realizar un pago y ver el historial
GRANT SELECT ON aplicacion_musica.pagos TO Cliente;
GRANT INSERT ON aplicacion_musica.pagos TO Cliente;

/*
    PUBLICADOR
    Puede buscar e insertar canciones, artistas, y álbumes
*/
GRANT USAGE ON SCHEMA aplicacion_musica TO Publicador;

-- Permisos para las secuencias de los publicador
GRANT USAGE, SELECT ON SEQUENCE aplicacion_musica.albumes_id_album_seq TO Publicador;
GRANT USAGE, SELECT ON SEQUENCE aplicacion_musica.canciones_id_cancion_seq TO Publicador;

-- Permisos para insertar, modificar, actualizar y eliminar canciones y su relacion con
-- los albumes existentes
GRANT SELECT, UPDATE, INSERT, DELETE ON aplicacion_musica.canciones TO Publicador;
GRANT SELECT, UPDATE, INSERT, DELETE ON aplicacion_musica.canciones_artistas TO Publicador;
GRANT SELECT, UPDATE, INSERT, DELETE ON aplicacion_musica.albumes TO Publicador;
GRANT SELECT, UPDATE, INSERT, DELETE ON aplicacion_musica.albumes_canciones TO Publicador;
GRANT SELECT, UPDATE, INSERT, DELETE ON aplicacion_musica.artistas TO Publicador;