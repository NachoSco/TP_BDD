WITH artistas_populares(nombre_artista,cantidad) AS 
(
   SELECT nombre_artista,SUM(cantidad) AS cantidad FROM  
   (aplicacion_musica.canciones_artistas NATURAL JOIN 
   (SELECT id_cancion, COUNT(*) as cantidad FROM aplicacion_musica.canciones_guardadas GROUP BY id_cancion) as canciones_populares) 
   GROUP BY nombre_artista 
)
SELECT * FROM ( aplicacion_musica.artistas NATURAL JOIN (artistas_populares NATURAL JOIN 
(SELECT MAX(cantidad) as cantidad FROM artistas_populares) AS maximo));