WITH canciones_populares(id_cancion, cantidad) AS 
(
    SELECT id_cancion, COUNT(*) as cantidad FROM aplicacion_musica.canciones_guardadas GROUP BY id_cancion
)
SELECT * FROM ( aplicacion_musica.canciones NATURAL JOIN (canciones_populares NATURAL JOIN (SELECT MAX(cantidad) as cantidad FROM canciones_populares) AS maximo));