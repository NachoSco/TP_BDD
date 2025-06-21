-- Puede buscar canciones, artistas, y álbumes
GRANT SELECT ON cancion IN SCHEMA aplicacion_musica TO Publicador;
GRANT SELECT ON album IN SCHEMA aplicacion_musica TO Publicador;
GRANT SELECT ON artista IN SCHEMA aplicacion_musica TO Publicador;

--Puede hacer actualizar en canciones, artistas, y álbumes
GRANT UPDATE ON cancion IN SCHEMA aplicacion_musica TO Publicador;
GRANT UPDATE ON album IN SCHEMA aplicacion_musica TO Publicador;
GRANT UPDATE ON artista IN SCHEMA aplicacion_musica TO Publicador;

--Puede instertar canciones, albumes, artistas
GRANT INSERT ON cancion IN SCHEMA aplicacion_musica TO Publicador;
GRANT INSERT ON album IN SCHEMA aplicacion_musica TO Publicador;
GRANT INSERT ON artista IN SCHEMA aplicacion_musica TO Publicador;

--Puede eliminar canciones, albumes y artistas  
GRANT DELETE ON cancion IN SCHEMA aplicacion_musica TO Publicador;
GRANT DELETE ON album IN SCHEMA aplicacion_musica TO Publicador;
GRANT DELETE ON artista IN SCHEMA aplicacion_musica TO Publicador;






