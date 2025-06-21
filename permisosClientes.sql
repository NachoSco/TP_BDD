--Puede buscar canciones, artistas, y álbumes
GRANT SELECT ON cancion IN SCHEMA aplicacion_musica TO Cliente;
GRANT SELECT ON album IN SCHEMA aplicacion_musica TO Cliente;
GRANT SELECT ON artista IN SCHEMA aplicacion_musica TO Cliente;

--Puede realizar un pago
GRANT INSERT ON pago IN SCHEMA aplicacion_musica TO Cliente;

--Puede buscar los planes disponibles
GRANT SELECT ON plan_subscripcion IN SCHEMA aplicacion_musica TO Cliente;



--TODO tabla de favoritos 

