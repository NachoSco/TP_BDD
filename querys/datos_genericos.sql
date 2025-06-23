SET search_path TO aplicacion_musica;

-- 1. Planes de subscripción (originales + 0 nuevos = 3 total)
INSERT INTO planes_subscripcion (nombre_plan, descripcion_plan, duracion_plan, es_pago, precio) VALUES
('Gratuito', 'Plan gratuito con publicidad', 36500, false, 0),
('Premium', 'Plan sin publicidad con calidad HD', 365, true, 3500),
('Familiar', 'Hasta 5 cuentas', 365, true, 8000);

-- 2. Usuarios (3 originales + 7 nuevos = 10 total)
INSERT INTO usuarios (nombre_usuario, email, fecha_de_registro, nombre_plan) VALUES
('lucas123', 'lucas@gmail.com', '2024-11-05', 'Gratuito'),
('vale_rock', 'valen@yahoo.com', '2025-01-22', 'Premium'),
('juanpop', 'juan@outlook.com', '2025-03-15', 'Familiar'),
('sofia_music', 'sofia@gmail.com', '2025-01-10', 'Premium'),
('carlos_beat', 'carlos@hotmail.com', '2025-02-18', 'Gratuito'),
('ana_sound', 'ana@yahoo.com', '2025-04-03', 'Familiar'),
('mario_jazz', 'mario@gmail.com', '2025-05-21', 'Premium'),
('laura_waves', 'laura@outlook.com', '2025-06-12', 'Premium'),
('diego_rhythm', 'diego@yahoo.com', '2025-06-15', 'Gratuito'),
('isabel_tune', 'isabel@gmail.com', '2025-06-20', 'Familiar');

-- 3. Artistas (3 originales + 5 nuevos = 8 total)
INSERT INTO artistas (nombre_artista, tipo_artista, pais) VALUES
('Los Piojos', 'banda', 'Argentina'),
('B Eilish', 'solista', 'EEUU'),
('Tame Impala', 'banda', 'Australia'),
('Soda Stereo', 'banda', 'Argentina'),
('Dua Lipa', 'solista', 'Reino Unido'),
('Arctic Monkeys', 'banda', 'Reino Unido'),
('J Balvin', 'solista', 'Colombia'),
('Rosalía', 'solista', 'España');

-- 4. Canciones (3 originales + 10 nuevas = 13 total)
INSERT INTO canciones (nombre_cancion, duracion_cancion, genero_cancion) VALUES
('Forgiveness', 360, 'rock'),
('Bad Guy', 194, 'pop'),
('Tan Solo', 275, 'rock'),
('De Música Ligera', 210, 'rock'),
('Levitating', 203, 'pop'),
('Do I Wanna Know?', 272, 'rock alternativo'),
('Mi Gente', 185, 'reguetón'),
('Malamente', 153, 'flamenco urbano'),
('Verte', 240, 'rock'),
('Electric Feel', 236, 'rock psicodélico'),
('Ocean Eyes', 201, 'pop'),
('Mariposa', 195, 'pop latino'),
('505', 258, 'indie rock');

-- 5. Álbumes (3 originales + 7 nuevos = 10 total)
INSERT INTO albumes (nombre_artista, nombre_album, fecha_lanzamiento) VALUES
('Tame Impala', 'Slow Rush', '2020-02-14'),
('B Eilish', 'When We Sleep', '2019-03-29'),
('Los Piojos', '3er Arco', '1996-08-15'),
('Soda Stereo', 'Canción Animal', '1990-09-17'),
('Dua Lipa', 'Future Nostalgia', '2020-03-27'),
('Arctic Monkeys', 'AM', '2013-09-09'),
('J Balvin', 'Vibras', '2018-05-25'),
('Rosalía', 'El Mal Querer', '2018-11-02'),
('Tame Impala', 'Currents', '2015-07-17'),
('B Eilish', 'Happier Than Ever', '2021-07-30');

-- 6. Álbumes-Canciones (3 originales + 10 nuevas = 13 total)
INSERT INTO albumes_canciones (id_cancion, id_album) VALUES
(1, 1),  -- Forgiveness -> Slow Rush
(2, 2),  -- Bad Guy -> When We Sleep
(3, 3),  -- Tan Solo -> 3er Arco
(4, 4),  -- De Música Ligera -> Canción Animal
(5, 5),  -- Levitating -> Future Nostalgia
(6, 6),  -- Do I Wanna Know? -> AM
(7, 7),  -- Mi Gente -> Vibras
(8, 8),  -- Malamente -> El Mal Querer
(9, 3),  -- Verte -> 3er Arco (Los Piojos)
(10, 9), -- Electric Feel -> Currents (Tame Impala)
(11, 2), -- Ocean Eyes -> When We Sleep (B Eilish)
(12, 5), -- Mariposa -> Future Nostalgia (Dua Lipa)
(13, 6); -- 505 -> AM (Arctic Monkeys)

-- 7. Canciones-Artistas (3 originales + 10 nuevas = 13 total)
INSERT INTO canciones_artistas (id_cancion, nombre_artista) VALUES
(1, 'Tame Impala'),
(2, 'B Eilish'),
(3, 'Los Piojos'),
(4, 'Soda Stereo'),
(5, 'Dua Lipa'),
(6, 'Arctic Monkeys'),
(7, 'J Balvin'),
(8, 'Rosalía'),
(9, 'Los Piojos'),
(10, 'Tame Impala'),
(11, 'B Eilish'),
(12, 'Dua Lipa'),
(13, 'Arctic Monkeys');

-- 8. Pagos (2 originales + 5 nuevos = 7 total)
INSERT INTO pagos (nombre_usuario, nombre_plan, forma_pago) VALUES
('vale_rock', 'Premium', 'tarjeta'),
('juanpop', 'Familiar', 'transferencia'),
('sofia_music', 'Premium', 'paypal'),
('ana_sound', 'Familiar', 'tarjeta'),
('mario_jazz', 'Premium', 'transferencia'),
('laura_waves', 'Premium', 'tarjeta'),
('isabel_tune', 'Familiar', 'paypal');

-- 9. Reproducciones de usuarios (3 originales + 15 nuevas = 18 total)
INSERT INTO reproducciones_usuarios (nombre_usuario, id_cancion) VALUES
('lucas123', 2),
('vale_rock', 1),
('juanpop', 3),
('lucas123', 4),
('lucas123', 7),
('vale_rock', 6),
('vale_rock', 10),
('juanpop', 8),
('juanpop', 1),
('sofia_music', 5),
('sofia_music', 12),
('carlos_beat', 3),
('carlos_beat', 9),
('ana_sound', 11),
('ana_sound', 2),
('mario_jazz', 13),
('mario_jazz', 4),
('laura_waves', 7),
('laura_waves', 8);

-- 10. Artistas guardados (2 originales + 10 nuevas = 12 total)
INSERT INTO artistas_guardados (nombre_usuario, nombre_artista) VALUES
('lucas123', 'B Eilish'),
('juanpop', 'Los Piojos'),
('vale_rock', 'Arctic Monkeys'),
('juanpop', 'Soda Stereo'),
('sofia_music', 'Dua Lipa'),
('carlos_beat', 'J Balvin'),
('ana_sound', 'Rosalía'),
('mario_jazz', 'Tame Impala'),
('laura_waves', 'B Eilish'),
('diego_rhythm', 'Los Piojos'),
('isabel_tune', 'Arctic Monkeys'),
('lucas123', 'Rosalía');

-- 11. Canciones guardadas (2 originales + 10 nuevas = 12 total)
INSERT INTO canciones_guardadas (nombre_usuario, id_cancion) VALUES
('vale_rock', 1),
('lucas123', 2),
('vale_rock', 6),
('juanpop', 4),
('sofia_music', 5),
('carlos_beat', 7),
('ana_sound', 8),
('mario_jazz', 10),
('laura_waves', 11),
('diego_rhythm', 3),
('isabel_tune', 13),
('lucas123', 8);

-- 12. Álbumes guardados (2 originales + 10 nuevas = 12 total)
INSERT INTO albumes_guardados (nombre_usuario, id_album) VALUES
('vale_rock', 1),
('juanpop', 3),
('vale_rock', 6),
('juanpop', 4),
('sofia_music', 5),
('carlos_beat', 7),
('ana_sound', 8),
('mario_jazz', 9),
('laura_waves', 10),
('diego_rhythm', 3),
('isabel_tune', 6),
('lucas123', 8);