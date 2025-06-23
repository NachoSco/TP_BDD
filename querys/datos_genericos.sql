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
('rockero90', 'rock90@gmail.com', '2025-02-10', 'Premium'),
('poplover', 'poplove@yahoo.com', '2025-03-18', 'Familiar'),
('urbanbeat', 'urban@outlook.com', '2025-04-22', 'Gratuito'),
('jazzfan', 'jazzfan@gmail.com', '2025-05-30', 'Premium'),
('indiequeen', 'indieq@hotmail.com', '2025-06-10', 'Familiar');

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
('Gustavo Cerati', 'solista', 'Argentina'),
('The Weeknd', 'solista', 'Canadá'),
('Lana Del Rey', 'solista', 'EEUU'),
('Bad Bunny', 'solista', 'Puerto Rico'),
('C. Tangana', 'solista', 'España'),
('Vetusta Morla', 'banda', 'España'),
('Metallica', 'banda', 'EEUU'),
('Kali Uchis', 'solista', 'Colombia'),
('Nirvana', 'banda', 'EEUU'),
('Shakira', 'solista', 'Colombia');

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
('Deja Vu', 237, 'pop'),
('Blinding Lights', 200, 'pop'),
('Summertime Sadness', 265, 'pop'),
('Tití Me Preguntó', 243, 'reguetón'),
('Ingobernable', 180, 'pop latino'),
('La Muerte', 245, 'rock'),
('Nothing Else Matters', 388, 'rock'),
('Moonlight', 215, 'pop'),
('Smells Like Teen Spirit', 301, 'rock alternativo'),
('La Tortura', 214, 'pop latino'),
('Saoko', 155, 'flamenco urbano'),
('Fluorescent Adolescent', 173, 'indie rock'),
('New Rules', 209, 'pop'),
('Feels Like We Only Go Backwards', 216, 'rock psicodélico'),
('Ocean Eyes', 201, 'pop'),
('Crimen', 231, 'rock'),
('Save Your Tears', 215, 'pop'),
('Video Games', 282, 'pop'),
('Me Porto Bonito', 179, 'reguetón'),
('Párteme la Cara', 220, 'rock'),
('Enter Sandman', 331, 'rock'),
('Telepatía', 161, 'pop latino'),
('Come As You Are', 219, 'rock alternativo'),
('Whenever, Wherever', 227, 'pop latino'),
('Candy Necklace', 213, 'pop'),
('Un Verano Sin Ti', 163, 'reguetón'),
('Los Ángeles', 256, 'rock'),
('One', 447, 'rock'),
('Beach', 178, 'pop'),
('Bored', 203, 'pop');

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
('Gustavo Cerati', 'Fuerza Natural', '2009-08-31'),
('The Weeknd', 'After Hours', '2020-03-20'),
('Lana Del Rey', 'Born to Die', '2012-01-27'),
('Bad Bunny', 'Un Verano Sin Ti', '2022-05-06'),
('C. Tangana', 'El Madrileño', '2021-02-26'),
('Vetusta Morla', 'Mapas', '2008-09-23'),
('Metallica', 'Metallica', '1991-08-12'),
('Kali Uchis', 'Red Moon in Venus', '2023-03-03'),
('Nirvana', 'Nevermind', '1991-09-24'),
('Shakira', 'Fijación Oral Vol. 1', '2005-06-03'),
('Rosalía', 'Motomami', '2022-03-18'),
('Arctic Monkeys', 'Favourite Worst Nightmare', '2007-04-23'),
('Dua Lipa', 'Dua Lipa', '2017-06-02'),
('Tame Impala', 'Lonerism', '2012-10-05'),
('B Eilish', "Don't Smile at Me", '2017-08-11');

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
(14, 11),
(15, 12),
(16, 13),
(17, 14),
(18, 15), 
(19, 16),
(20, 17),
(21, 18),
(22, 19),
(23, 20),
(24, 21),
(25, 22),
(26, 23),
(27, 24),
(28, 25),
(29, 11),
(30, 12),
(31, 13),
(32, 14),
(33, 15),
(34, 16),
(35, 17),
(36, 18),
(37, 19),
(38, 20),
(39, 21),
(40, 22),
(41, 23),
(42, 24),
(43, 25);

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
(14, 'Gustavo Cerati'),
(15, 'The Weeknd'),
(16, 'Lana Del Rey'), 
(17, 'Bad Bunny'),
(18, 'C. Tangana'),
(19, 'Vetusta Morla'), 
(20, 'Metallica'),
(21, 'Kali Uchis'),
(22, 'Nirvana'), 
(23, 'Shakira'),
(24, 'Rosalía'),
(25, 'Arctic Monkeys'), 
(26, 'Dua Lipa'),
(27, 'Tame Impala'),
(28, 'B Eilish'),
(29, 'Gustavo Cerati'),
(30, 'The Weeknd'),
(31, 'Lana Del Rey'), 
(32, 'Bad Bunny'),
(33, 'C. Tangana'),
(34, 'Vetusta Morla'), 
(35, 'Metallica'),
(36, 'Kali Uchis'),
(37, 'Nirvana'), 
(38, 'Shakira'),
(39, 'Rosalía'),
(40, 'Arctic Monkeys'), 
(41, 'Dua Lipa'),
(42, 'Tame Impala'),
(43, 'B Eilish');

-- 8. Pagos (2 originales + 5 nuevos = 7 total)
INSERT INTO pagos (nombre_usuario, nombre_plan, forma_pago) VALUES
('vale_rock', 'Premium', 'tarjeta'),
('juanpop', 'Familiar', 'transferencia'),
('sofia_music', 'Premium', 'paypal'),
('ana_sound', 'Familiar', 'tarjeta'),
('mario_jazz', 'Premium', 'transferencia'),
('laura_waves', 'Premium', 'tarjeta'),
('isabel_tune', 'Familiar', 'paypal');
('rockero90', 'Premium', 'tarjeta'),
('poplover', 'Familiar', 'paypal'),
('jazzfan', 'Premium', 'transferencia'),
('indiequeen', 'Familiar', 'tarjeta'),
('laura_waves', 'Premium', 'tarjeta');

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
('rockero90', 20),
('rockero90', 22),
('rockero90', 28),
('poplover', 15),
('poplover', 21),
('poplover', 26),
('urbanbeat', 17),
('urbanbeat', 24),
('urbanbeat', 32),
('jazzfan', 19),
('jazzfan', 27),
('jazzfan', 33),
('indiequeen', 25),
('indiequeen', 31),
('indiequeen', 40),
-- Reproducciones adicionales para usuarios existentes
('lucas123', 14),
('lucas123', 30),
('vale_rock', 27),
('vale_rock', 42),
('juanpop', 18),
('juanpop', 35),
('sofia_music', 16),
('sofia_music', 26),
('carlos_beat', 23),
('carlos_beat', 38),
('ana_sound', 21),
('ana_sound', 36),
('mario_jazz', 22),
('mario_jazz', 37),
('laura_waves', 15),
('laura_waves', 29),
('diego_rhythm', 19),
('diego_rhythm', 34),
('isabel_tune', 25),
('isabel_tune', 39),
-- Más reproducciones variadas
('rockero90', 1),
('poplover', 2),
('urbanbeat', 3),
('jazzfan', 4),
('indiequeen', 5),
('rockero90', 6),
('poplover', 7),
('urbanbeat', 8),
('jazzfan', 9),
('indiequeen', 10),
('rockero90', 11),
('poplover', 12),
('urbanbeat', 13),
('jazzfan', 14),
('indiequeen', 15);

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
('rockero90', 'Metallica'), 
('rockero90', 'Nirvana'),
('poplover', 'The Weeknd'), 
('poplover', 'Dua Lipa'),
('urbanbeat', 'Bad Bunny'), 
('urbanbeat', 'J Balvin'),
('jazzfan', 'Vetusta Morla'), 
('jazzfan', 'Gustavo Cerati'),
('indiequeen', 'Arctic Monkeys'), 
('indiequeen', 'Tame Impala'),
('lucas123', 'Gustavo Cerati'), 
('vale_rock', 'Lana Del Rey'),
('juanpop', 'Shakira'), 
('sofia_music', 'Kali Uchis'),
('carlos_beat', 'C. Tangana'), 
('ana_sound', 'Rosalía'),
('mario_jazz', 'The Weeknd'), 
('laura_waves', 'B Eilish'),
('diego_rhythm', 'Nirvana'), 
('isabel_tune', 'Vetusta Morla');

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
('rockero90', 20),
('rockero90', 22), 
('poplover', 15),
('poplover', 26), 
('urbanbeat', 17),
('urbanbeat', 24), 
('jazzfan', 19),
('jazzfan', 33), 
('indiequeen', 25),
('indiequeen', 40),
('lucas123', 14),
('lucas123', 30), 
('vale_rock', 27),
('vale_rock', 42), 
('juanpop', 18),
('juanpop', 35), 
('sofia_music', 16),
('sofia_music', 21), 
('carlos_beat', 23),
('carlos_beat', 32), 
('ana_sound', 21),
('ana_sound', 36), 
('mario_jazz', 22),
('mario_jazz', 37), 
('laura_waves', 15),
('laura_waves', 29), 
('diego_rhythm', 19),
('diego_rhythm', 28), 
('isabel_tune', 25),
('isabel_tune', 31);

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
('rockero90', 17),
('rockero90', 19),  -- Metallica, Nirvana
('poplover', 12),
('poplover', 13),    -- The Weeknd, Lana Del Rey
('urbanbeat', 14),
('urbanbeat', 7),   -- Bad Bunny, J Balvin
('jazzfan', 16),
('jazzfan', 11),      -- Vetusta Morla, Gustavo Cerati
('indiequeen', 6),
('indiequeen', 9),  -- Arctic Monkeys, Tame Impala
('lucas123', 11),
('vale_rock', 13),   -- Gustavo Cerati, Lana Del Rey
('juanpop', 20),
('sofia_music', 18),  -- Shakira, Kali Uchis
('carlos_beat', 15),
('ana_sound', 21),-- C. Tangana, Rosalía
('mario_jazz', 12),
('laura_waves', 25),-- The Weeknd, B Eilish
('diego_rhythm', 19),
('isabel_tune', 16); -- Nirvana, Vetusta Morla