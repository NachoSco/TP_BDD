-- ADMINISTRADOR
GRANT ALL PRIVILEGES ON SCHEMA aplicacion_musica TO Administrador;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA aplicacion_musica TO Administrador;

-- CLIENTE
--Puede buscar canciones, artistas, y álbumes
GRANT SELECT ON aplicacion_musica.canciones TO Cliente;
GRANT SELECT ON aplicacion_musica.albumes TO Cliente;
GRANT SELECT ON aplicacion_musica.artistas TO Cliente;

GRANT SELECT, INSERT, DELETE ON aplicacion_musica.canciones_guardadas TO Cliente;
GRANT SELECT, INSERT, DELETE ON aplicacion_musica.albumes_guardados TO Cliente;
GRANT SELECT, INSERT, DELETE ON aplicacion_musica.artistas_guardados TO Cliente;

--Puede buscar los planes disponibles
GRANT SELECT ON aplicacion_musica.planes_subscripcion TO Cliente;

--Puede realizar un pago
GRANT INSERT ON aplicacion_musica.pagos TO Cliente;

-- PUBLICADOR
-- Puede buscar canciones, artistas, y álbumes
GRANT SELECT, UPDATE, INSERT, DELETE ON aplicacion_musica.canciones TO Publicador;
GRANT SELECT, UPDATE, INSERT, DELETE ON aplicacion_musica.albumes TO Publicador;
GRANT SELECT, UPDATE, INSERT, DELETE ON aplicacion_musica.artistas TO Publicador;