-- Inserts para esquema aplicacion_musica

-- 1. Planes de subscripción
INSERT INTO planes_subscripcion (nombre_plan, descripcion_plan, duracion_plan, es_pago, precio) VALUES
('Gratuito', 'Plan gratuito con publicidad', 36500, false, 0),
('Premium', 'Plan sin publicidad con calidad HD', 365, true, 3500),
('Familiar', 'Hasta 5 cuentas', 365, true, 8000);

-- 2. Usuarios
INSERT INTO usuarios (nombre_usuario, email, fecha_de_registro, nombre_plan) VALUES
('lucas123', 'lucas@gmail.com', '2024-11-05', 'Gratuito'),
('vale_rock', 'valen@yahoo.com', '2025-01-22', 'Premium'),
('juanpop', 'juan@outlook.com', '2025-03-15', 'Familiar');

-- 3. Artistas
INSERT INTO artistas (nombre_artista, tipo_artista, pais) VALUES
('Los Piojos', 'banda', 'Argentina'),
('B Eilish', 'solista', 'EEUU'),
('Tame Impala', 'banda', 'Australia');

-- 4. Canciones
INSERT INTO canciones (nombre_cancion, duracion_cancion, genero_cancion) VALUES
('Forgiveness', 360, 'rock'),
('Bad Guy', 194, 'pop'),
('Tan Solo', 275, 'rock');

-- 5. Álbumes
INSERT INTO albumes (nombre_artista, nombre_album, fecha_lanzamiento) VALUES
('Tame Impala', 'Slow Rush', '2020-02-14'),
('B Eilish', 'When We Sleep', '2019-03-29'),
('Los Piojos', '3er Arco', '1996-08-15');

-- 6. Álbumes-Canciones
INSERT INTO albumes_canciones (id_cancion, id_album) VALUES
(1, 1),
(2, 2),
(3, 3);

-- 7. Canciones-Artistas
INSERT INTO canciones_artistas (id_cancion, nombre_artista) VALUES
(1, 'Tame Impala'),
(2, 'B Eilish'),
(3, 'Los Piojos');

-- 8. Pagos (el trigger rellena precio_plan)
INSERT INTO pagos (nombre_usuario, nombre_plan, forma_pago) VALUES
('vale_rock', 'Premium', 'tarjeta'),
('juanpop', 'Familiar', 'transferencia');

-- 9. Reproducciones de usuarios
INSERT INTO reproducciones_usuarios (nombre_usuario, id_cancion) VALUES
('lucas123', 2),
('vale_rock', 1),
('juanpop', 3);

-- 10. Artistas guardados
INSERT INTO artistas_guardados (nombre_usuario, nombre_artista) VALUES
('lucas123', 'B Eilish'),
('juanpop', 'Los Piojos');

-- 11. Canciones guardadas
INSERT INTO canciones_guardadas (nombre_usuario, id_cancion) VALUES
('vale_rock', 1),
('lucas123', 2);

-- 12. Álbumes guardados
INSERT INTO albumes_guardados (nombre_usuario, id_album) VALUES
('vale_rock', 1),
('juanpop', 3);