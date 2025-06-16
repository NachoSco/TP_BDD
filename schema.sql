--
-- PostgreSQL database dump
--

-- Dumped from database version 17.5
-- Dumped by pg_dump version 17.5

-- Started on 2025-06-16 13:22:06

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 6 (class 2615 OID 16392)
-- Name: aplicacion_musica; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA aplicacion_musica;


ALTER SCHEMA aplicacion_musica OWNER TO postgres;

--
-- TOC entry 237 (class 1255 OID 16462)
-- Name: validar_precio_minimo(); Type: FUNCTION; Schema: aplicacion_musica; Owner: postgres
--

CREATE FUNCTION aplicacion_musica.validar_precio_minimo() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    minimo NUMERIC(10,2);
BEGIN
    SELECT precio_minimo INTO minimo
    FROM aplicacion_musica.Configuracion_Precio_Minimo
    WHERE fecha_desde <= CURRENT_DATE
    ORDER BY fecha_desde DESC
    LIMIT 1;

    IF minimo IS NULL THEN
        minimo := 0;
    END IF;

    IF NEW.precio < minimo THEN
        RAISE EXCEPTION 'El precio % es menor que el mínimo permitido %', NEW.precio, minimo;
    END IF;

    RETURN NEW;
END;
$$;


ALTER FUNCTION aplicacion_musica.validar_precio_minimo() OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 225 (class 1259 OID 16427)
-- Name: album; Type: TABLE; Schema: aplicacion_musica; Owner: postgres
--

CREATE TABLE aplicacion_musica.album (
    id_album integer NOT NULL,
    titulo character varying(32) NOT NULL,
    fecha_lanzamiento date NOT NULL,
    genero character varying(32) NOT NULL,
    artista character varying(32) NOT NULL
);


ALTER TABLE aplicacion_musica.album OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16426)
-- Name: Album_ID_Album_seq; Type: SEQUENCE; Schema: aplicacion_musica; Owner: postgres
--

ALTER TABLE aplicacion_musica.album ALTER COLUMN id_album ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME aplicacion_musica."Album_ID_Album_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 221 (class 1259 OID 16419)
-- Name: cancion; Type: TABLE; Schema: aplicacion_musica; Owner: postgres
--

CREATE TABLE aplicacion_musica.cancion (
    id_cancion integer NOT NULL,
    titulo character varying(32) NOT NULL,
    genero character varying(32) NOT NULL,
    duracion interval NOT NULL,
    artista character varying(32) NOT NULL
);


ALTER TABLE aplicacion_musica.cancion OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16424)
-- Name: Cancion_ID_Cancion_seq; Type: SEQUENCE; Schema: aplicacion_musica; Owner: postgres
--

ALTER TABLE aplicacion_musica.cancion ALTER COLUMN id_cancion ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME aplicacion_musica."Cancion_ID_Cancion_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 229 (class 1259 OID 16456)
-- Name: configuracion_precio_minimo; Type: TABLE; Schema: aplicacion_musica; Owner: postgres
--

CREATE TABLE aplicacion_musica.configuracion_precio_minimo (
    id_precio integer NOT NULL,
    fecha_desde date NOT NULL,
    precio_minimo numeric(10,2) NOT NULL
);


ALTER TABLE aplicacion_musica.configuracion_precio_minimo OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 16455)
-- Name: Configuracion_Precio_Minimo_ID_Precio_seq; Type: SEQUENCE; Schema: aplicacion_musica; Owner: postgres
--

ALTER TABLE aplicacion_musica.configuracion_precio_minimo ALTER COLUMN id_precio ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME aplicacion_musica."Configuracion_Precio_Minimo_ID_Precio_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 218 (class 1259 OID 16393)
-- Name: usuario; Type: TABLE; Schema: aplicacion_musica; Owner: postgres
--

CREATE TABLE aplicacion_musica.usuario (
    nombre character varying(32) NOT NULL,
    email character varying(32) NOT NULL,
    fecha_registro date DEFAULT CURRENT_DATE NOT NULL,
    id_usuario integer NOT NULL,
    nombre_plan character varying(32)
);


ALTER TABLE aplicacion_musica.usuario OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16411)
-- Name: Usuario_ID_Usuario_seq; Type: SEQUENCE; Schema: aplicacion_musica; Owner: postgres
--

CREATE SEQUENCE aplicacion_musica."Usuario_ID_Usuario_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE aplicacion_musica."Usuario_ID_Usuario_seq" OWNER TO postgres;

--
-- TOC entry 5017 (class 0 OID 0)
-- Dependencies: 220
-- Name: Usuario_ID_Usuario_seq; Type: SEQUENCE OWNED BY; Schema: aplicacion_musica; Owner: postgres
--

ALTER SEQUENCE aplicacion_musica."Usuario_ID_Usuario_seq" OWNED BY aplicacion_musica.usuario.id_usuario;


--
-- TOC entry 223 (class 1259 OID 16425)
-- Name: Usuario_ID_Usuario_seq1; Type: SEQUENCE; Schema: aplicacion_musica; Owner: postgres
--

ALTER TABLE aplicacion_musica.usuario ALTER COLUMN id_usuario ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME aplicacion_musica."Usuario_ID_Usuario_seq1"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 219 (class 1259 OID 16400)
-- Name: artista; Type: TABLE; Schema: aplicacion_musica; Owner: postgres
--

CREATE TABLE aplicacion_musica.artista (
    pais character varying(32) NOT NULL,
    nombre character varying(32) NOT NULL,
    es_solista boolean NOT NULL
);


ALTER TABLE aplicacion_musica.artista OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 16494)
-- Name: cancion_pertenece_album; Type: TABLE; Schema: aplicacion_musica; Owner: postgres
--

CREATE TABLE aplicacion_musica.cancion_pertenece_album (
    id_cancion integer NOT NULL,
    id_album integer NOT NULL
);


ALTER TABLE aplicacion_musica.cancion_pertenece_album OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16439)
-- Name: generos_validos; Type: TABLE; Schema: aplicacion_musica; Owner: postgres
--

CREATE TABLE aplicacion_musica.generos_validos (
    nombre character varying(32) NOT NULL
);


ALTER TABLE aplicacion_musica.generos_validos OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 16465)
-- Name: pago; Type: TABLE; Schema: aplicacion_musica; Owner: postgres
--

CREATE TABLE aplicacion_musica.pago (
    numero_pago integer NOT NULL,
    usuario_id integer NOT NULL,
    nombre_plan character varying NOT NULL,
    forma_pago character varying NOT NULL,
    fecha date DEFAULT CURRENT_DATE NOT NULL
);


ALTER TABLE aplicacion_musica.pago OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 16464)
-- Name: pago_numero_pago_seq; Type: SEQUENCE; Schema: aplicacion_musica; Owner: postgres
--

ALTER TABLE aplicacion_musica.pago ALTER COLUMN numero_pago ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME aplicacion_musica.pago_numero_pago_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 226 (class 1259 OID 16432)
-- Name: plan_suscripcion; Type: TABLE; Schema: aplicacion_musica; Owner: postgres
--

CREATE TABLE aplicacion_musica.plan_suscripcion (
    nombre character varying(32) NOT NULL,
    precio bigint NOT NULL,
    descripcion character varying(32) NOT NULL,
    con_publicidad boolean NOT NULL
);


ALTER TABLE aplicacion_musica.plan_suscripcion OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 16555)
-- Name: usuario_escucha_cancion; Type: TABLE; Schema: aplicacion_musica; Owner: postgres
--

CREATE TABLE aplicacion_musica.usuario_escucha_cancion (
    id_usuario integer NOT NULL,
    id_cancion integer NOT NULL,
    fecha timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE aplicacion_musica.usuario_escucha_cancion OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 16539)
-- Name: usuario_favorito_album; Type: TABLE; Schema: aplicacion_musica; Owner: postgres
--

CREATE TABLE aplicacion_musica.usuario_favorito_album (
    id_usuario integer NOT NULL,
    id_album integer NOT NULL
);


ALTER TABLE aplicacion_musica.usuario_favorito_album OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 16509)
-- Name: usuario_favorito_artista; Type: TABLE; Schema: aplicacion_musica; Owner: postgres
--

CREATE TABLE aplicacion_musica.usuario_favorito_artista (
    id_usuario integer NOT NULL,
    nombre_artista character varying(32) NOT NULL
);


ALTER TABLE aplicacion_musica.usuario_favorito_artista OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 16524)
-- Name: usuario_favorito_cancion; Type: TABLE; Schema: aplicacion_musica; Owner: postgres
--

CREATE TABLE aplicacion_musica.usuario_favorito_cancion (
    id_usuario integer NOT NULL,
    id_cancion integer NOT NULL
);


ALTER TABLE aplicacion_musica.usuario_favorito_cancion OWNER TO postgres;

--
-- TOC entry 5000 (class 0 OID 16427)
-- Dependencies: 225
-- Data for Name: album; Type: TABLE DATA; Schema: aplicacion_musica; Owner: postgres
--

COPY aplicacion_musica.album (id_album, titulo, fecha_lanzamiento, genero, artista) FROM stdin;
\.


--
-- TOC entry 4994 (class 0 OID 16400)
-- Dependencies: 219
-- Data for Name: artista; Type: TABLE DATA; Schema: aplicacion_musica; Owner: postgres
--

COPY aplicacion_musica.artista (pais, nombre, es_solista) FROM stdin;
Argentina	Chayanne	t
\.


--
-- TOC entry 4996 (class 0 OID 16419)
-- Dependencies: 221
-- Data for Name: cancion; Type: TABLE DATA; Schema: aplicacion_musica; Owner: postgres
--

COPY aplicacion_musica.cancion (id_cancion, titulo, genero, duracion, artista) FROM stdin;
4	La vaca lola	Rock	00:03:00	Chayanne
\.


--
-- TOC entry 5007 (class 0 OID 16494)
-- Dependencies: 232
-- Data for Name: cancion_pertenece_album; Type: TABLE DATA; Schema: aplicacion_musica; Owner: postgres
--

COPY aplicacion_musica.cancion_pertenece_album (id_cancion, id_album) FROM stdin;
\.


--
-- TOC entry 5004 (class 0 OID 16456)
-- Dependencies: 229
-- Data for Name: configuracion_precio_minimo; Type: TABLE DATA; Schema: aplicacion_musica; Owner: postgres
--

COPY aplicacion_musica.configuracion_precio_minimo (id_precio, fecha_desde, precio_minimo) FROM stdin;
1	2025-06-15	100.00
\.


--
-- TOC entry 5002 (class 0 OID 16439)
-- Dependencies: 227
-- Data for Name: generos_validos; Type: TABLE DATA; Schema: aplicacion_musica; Owner: postgres
--

COPY aplicacion_musica.generos_validos (nombre) FROM stdin;
Rock
Pop
Jazz
Clásica
Latina
Trap
\.


--
-- TOC entry 5006 (class 0 OID 16465)
-- Dependencies: 231
-- Data for Name: pago; Type: TABLE DATA; Schema: aplicacion_musica; Owner: postgres
--

COPY aplicacion_musica.pago (numero_pago, usuario_id, nombre_plan, forma_pago, fecha) FROM stdin;
\.


--
-- TOC entry 5001 (class 0 OID 16432)
-- Dependencies: 226
-- Data for Name: plan_suscripcion; Type: TABLE DATA; Schema: aplicacion_musica; Owner: postgres
--

COPY aplicacion_musica.plan_suscripcion (nombre, precio, descripcion, con_publicidad) FROM stdin;
\.


--
-- TOC entry 4993 (class 0 OID 16393)
-- Dependencies: 218
-- Data for Name: usuario; Type: TABLE DATA; Schema: aplicacion_musica; Owner: postgres
--

COPY aplicacion_musica.usuario (nombre, email, fecha_registro, id_usuario, nombre_plan) FROM stdin;
ignacio	ignacio@gmail.com	2025-06-14	1	\N
Ignacio	ignacio777@gmail.com	2025-06-16	2	\N
\.


--
-- TOC entry 5011 (class 0 OID 16555)
-- Dependencies: 236
-- Data for Name: usuario_escucha_cancion; Type: TABLE DATA; Schema: aplicacion_musica; Owner: postgres
--

COPY aplicacion_musica.usuario_escucha_cancion (id_usuario, id_cancion, fecha) FROM stdin;
1	4	2025-06-16 00:37:17.892498-03
1	4	2025-06-16 13:15:15.293541-03
\.


--
-- TOC entry 5010 (class 0 OID 16539)
-- Dependencies: 235
-- Data for Name: usuario_favorito_album; Type: TABLE DATA; Schema: aplicacion_musica; Owner: postgres
--

COPY aplicacion_musica.usuario_favorito_album (id_usuario, id_album) FROM stdin;
\.


--
-- TOC entry 5008 (class 0 OID 16509)
-- Dependencies: 233
-- Data for Name: usuario_favorito_artista; Type: TABLE DATA; Schema: aplicacion_musica; Owner: postgres
--

COPY aplicacion_musica.usuario_favorito_artista (id_usuario, nombre_artista) FROM stdin;
\.


--
-- TOC entry 5009 (class 0 OID 16524)
-- Dependencies: 234
-- Data for Name: usuario_favorito_cancion; Type: TABLE DATA; Schema: aplicacion_musica; Owner: postgres
--

COPY aplicacion_musica.usuario_favorito_cancion (id_usuario, id_cancion) FROM stdin;
\.


--
-- TOC entry 5018 (class 0 OID 0)
-- Dependencies: 224
-- Name: Album_ID_Album_seq; Type: SEQUENCE SET; Schema: aplicacion_musica; Owner: postgres
--

SELECT pg_catalog.setval('aplicacion_musica."Album_ID_Album_seq"', 1, false);


--
-- TOC entry 5019 (class 0 OID 0)
-- Dependencies: 222
-- Name: Cancion_ID_Cancion_seq; Type: SEQUENCE SET; Schema: aplicacion_musica; Owner: postgres
--

SELECT pg_catalog.setval('aplicacion_musica."Cancion_ID_Cancion_seq"', 4, true);


--
-- TOC entry 5020 (class 0 OID 0)
-- Dependencies: 228
-- Name: Configuracion_Precio_Minimo_ID_Precio_seq; Type: SEQUENCE SET; Schema: aplicacion_musica; Owner: postgres
--

SELECT pg_catalog.setval('aplicacion_musica."Configuracion_Precio_Minimo_ID_Precio_seq"', 1, true);


--
-- TOC entry 5021 (class 0 OID 0)
-- Dependencies: 220
-- Name: Usuario_ID_Usuario_seq; Type: SEQUENCE SET; Schema: aplicacion_musica; Owner: postgres
--

SELECT pg_catalog.setval('aplicacion_musica."Usuario_ID_Usuario_seq"', 1, true);


--
-- TOC entry 5022 (class 0 OID 0)
-- Dependencies: 223
-- Name: Usuario_ID_Usuario_seq1; Type: SEQUENCE SET; Schema: aplicacion_musica; Owner: postgres
--

SELECT pg_catalog.setval('aplicacion_musica."Usuario_ID_Usuario_seq1"', 2, true);


--
-- TOC entry 5023 (class 0 OID 0)
-- Dependencies: 230
-- Name: pago_numero_pago_seq; Type: SEQUENCE SET; Schema: aplicacion_musica; Owner: postgres
--

SELECT pg_catalog.setval('aplicacion_musica.pago_numero_pago_seq', 2, true);


--
-- TOC entry 4811 (class 2606 OID 16431)
-- Name: album Album_pkey; Type: CONSTRAINT; Schema: aplicacion_musica; Owner: postgres
--

ALTER TABLE ONLY aplicacion_musica.album
    ADD CONSTRAINT "Album_pkey" PRIMARY KEY (id_album);


--
-- TOC entry 4809 (class 2606 OID 16423)
-- Name: cancion Cancion_pkey; Type: CONSTRAINT; Schema: aplicacion_musica; Owner: postgres
--

ALTER TABLE ONLY aplicacion_musica.cancion
    ADD CONSTRAINT "Cancion_pkey" PRIMARY KEY (id_cancion);


--
-- TOC entry 4817 (class 2606 OID 16460)
-- Name: configuracion_precio_minimo Configuracion_Precio_Minimo_pkey; Type: CONSTRAINT; Schema: aplicacion_musica; Owner: postgres
--

ALTER TABLE ONLY aplicacion_musica.configuracion_precio_minimo
    ADD CONSTRAINT "Configuracion_Precio_Minimo_pkey" PRIMARY KEY (id_precio);


--
-- TOC entry 4815 (class 2606 OID 16443)
-- Name: generos_validos Generos_Validos_pkey; Type: CONSTRAINT; Schema: aplicacion_musica; Owner: postgres
--

ALTER TABLE ONLY aplicacion_musica.generos_validos
    ADD CONSTRAINT "Generos_Validos_pkey" PRIMARY KEY (nombre);


--
-- TOC entry 4813 (class 2606 OID 16436)
-- Name: plan_suscripcion Plan_Subscripcion_pkey; Type: CONSTRAINT; Schema: aplicacion_musica; Owner: postgres
--

ALTER TABLE ONLY aplicacion_musica.plan_suscripcion
    ADD CONSTRAINT "Plan_Subscripcion_pkey" PRIMARY KEY (nombre);


--
-- TOC entry 4801 (class 2606 OID 16461)
-- Name: configuracion_precio_minimo Precio_Minimo_Mayor_A_Cero; Type: CHECK CONSTRAINT; Schema: aplicacion_musica; Owner: postgres
--

ALTER TABLE aplicacion_musica.configuracion_precio_minimo
    ADD CONSTRAINT "Precio_Minimo_Mayor_A_Cero" CHECK ((precio_minimo > (0)::numeric)) NOT VALID;


--
-- TOC entry 4803 (class 2606 OID 16418)
-- Name: usuario Usuario_pkey; Type: CONSTRAINT; Schema: aplicacion_musica; Owner: postgres
--

ALTER TABLE ONLY aplicacion_musica.usuario
    ADD CONSTRAINT "Usuario_pkey" PRIMARY KEY (id_usuario);


--
-- TOC entry 4807 (class 2606 OID 16483)
-- Name: artista artista_pkey; Type: CONSTRAINT; Schema: aplicacion_musica; Owner: postgres
--

ALTER TABLE ONLY aplicacion_musica.artista
    ADD CONSTRAINT artista_pkey PRIMARY KEY (nombre);


--
-- TOC entry 4821 (class 2606 OID 16498)
-- Name: cancion_pertenece_album cancion_pertenece_album_pkey; Type: CONSTRAINT; Schema: aplicacion_musica; Owner: postgres
--

ALTER TABLE ONLY aplicacion_musica.cancion_pertenece_album
    ADD CONSTRAINT cancion_pertenece_album_pkey PRIMARY KEY (id_cancion, id_album);


--
-- TOC entry 4800 (class 2606 OID 16438)
-- Name: album check_genero_valido; Type: CHECK CONSTRAINT; Schema: aplicacion_musica; Owner: postgres
--

ALTER TABLE aplicacion_musica.album
    ADD CONSTRAINT check_genero_valido CHECK (((genero)::text = ANY (ARRAY[('Rock'::character varying)::text, ('Pop'::character varying)::text, ('Jazz'::character varying)::text, ('Clásica'::character varying)::text, ('Latina'::character varying)::text, ('Trap'::character varying)::text]))) NOT VALID;


--
-- TOC entry 4819 (class 2606 OID 16471)
-- Name: pago pago_pkey; Type: CONSTRAINT; Schema: aplicacion_musica; Owner: postgres
--

ALTER TABLE ONLY aplicacion_musica.pago
    ADD CONSTRAINT pago_pkey PRIMARY KEY (numero_pago, usuario_id, nombre_plan);


--
-- TOC entry 4805 (class 2606 OID 16399)
-- Name: usuario unique_mail; Type: CONSTRAINT; Schema: aplicacion_musica; Owner: postgres
--

ALTER TABLE ONLY aplicacion_musica.usuario
    ADD CONSTRAINT unique_mail UNIQUE (email);


--
-- TOC entry 4829 (class 2606 OID 16579)
-- Name: usuario_escucha_cancion usuario_escucha_cancion_pkey; Type: CONSTRAINT; Schema: aplicacion_musica; Owner: postgres
--

ALTER TABLE ONLY aplicacion_musica.usuario_escucha_cancion
    ADD CONSTRAINT usuario_escucha_cancion_pkey PRIMARY KEY (id_usuario, id_cancion, fecha);


--
-- TOC entry 4827 (class 2606 OID 16543)
-- Name: usuario_favorito_album usuario_favorito_album_pkey; Type: CONSTRAINT; Schema: aplicacion_musica; Owner: postgres
--

ALTER TABLE ONLY aplicacion_musica.usuario_favorito_album
    ADD CONSTRAINT usuario_favorito_album_pkey PRIMARY KEY (id_usuario, id_album);


--
-- TOC entry 4823 (class 2606 OID 16513)
-- Name: usuario_favorito_artista usuario_favorito_artista_pkey; Type: CONSTRAINT; Schema: aplicacion_musica; Owner: postgres
--

ALTER TABLE ONLY aplicacion_musica.usuario_favorito_artista
    ADD CONSTRAINT usuario_favorito_artista_pkey PRIMARY KEY (id_usuario, nombre_artista);


--
-- TOC entry 4825 (class 2606 OID 16528)
-- Name: usuario_favorito_cancion usuario_favorito_cancion_pkey; Type: CONSTRAINT; Schema: aplicacion_musica; Owner: postgres
--

ALTER TABLE ONLY aplicacion_musica.usuario_favorito_cancion
    ADD CONSTRAINT usuario_favorito_cancion_pkey PRIMARY KEY (id_usuario, id_cancion);


--
-- TOC entry 4847 (class 2620 OID 16463)
-- Name: plan_suscripcion trg_validar_precio_minimo; Type: TRIGGER; Schema: aplicacion_musica; Owner: postgres
--

CREATE TRIGGER trg_validar_precio_minimo BEFORE INSERT OR UPDATE ON aplicacion_musica.plan_suscripcion FOR EACH ROW EXECUTE FUNCTION aplicacion_musica.validar_precio_minimo();


--
-- TOC entry 4831 (class 2606 OID 16484)
-- Name: cancion artista_fk; Type: FK CONSTRAINT; Schema: aplicacion_musica; Owner: postgres
--

ALTER TABLE ONLY aplicacion_musica.cancion
    ADD CONSTRAINT artista_fk FOREIGN KEY (artista) REFERENCES aplicacion_musica.artista(nombre) NOT VALID;


--
-- TOC entry 4833 (class 2606 OID 16489)
-- Name: album artista_fk; Type: FK CONSTRAINT; Schema: aplicacion_musica; Owner: postgres
--

ALTER TABLE ONLY aplicacion_musica.album
    ADD CONSTRAINT artista_fk FOREIGN KEY (artista) REFERENCES aplicacion_musica.artista(nombre) NOT VALID;


--
-- TOC entry 4832 (class 2606 OID 16444)
-- Name: cancion generos_validos_fk; Type: FK CONSTRAINT; Schema: aplicacion_musica; Owner: postgres
--

ALTER TABLE ONLY aplicacion_musica.cancion
    ADD CONSTRAINT generos_validos_fk FOREIGN KEY (genero) REFERENCES aplicacion_musica.generos_validos(nombre) NOT VALID;


--
-- TOC entry 4834 (class 2606 OID 16449)
-- Name: album generos_validos_fk; Type: FK CONSTRAINT; Schema: aplicacion_musica; Owner: postgres
--

ALTER TABLE ONLY aplicacion_musica.album
    ADD CONSTRAINT generos_validos_fk FOREIGN KEY (genero) REFERENCES aplicacion_musica.generos_validos(nombre) NOT VALID;


--
-- TOC entry 4837 (class 2606 OID 16504)
-- Name: cancion_pertenece_album id_album; Type: FK CONSTRAINT; Schema: aplicacion_musica; Owner: postgres
--

ALTER TABLE ONLY aplicacion_musica.cancion_pertenece_album
    ADD CONSTRAINT id_album FOREIGN KEY (id_album) REFERENCES aplicacion_musica.album(id_album);


--
-- TOC entry 4843 (class 2606 OID 16549)
-- Name: usuario_favorito_album id_album; Type: FK CONSTRAINT; Schema: aplicacion_musica; Owner: postgres
--

ALTER TABLE ONLY aplicacion_musica.usuario_favorito_album
    ADD CONSTRAINT id_album FOREIGN KEY (id_album) REFERENCES aplicacion_musica.album(id_album);


--
-- TOC entry 4838 (class 2606 OID 16499)
-- Name: cancion_pertenece_album id_cancion; Type: FK CONSTRAINT; Schema: aplicacion_musica; Owner: postgres
--

ALTER TABLE ONLY aplicacion_musica.cancion_pertenece_album
    ADD CONSTRAINT id_cancion FOREIGN KEY (id_cancion) REFERENCES aplicacion_musica.cancion(id_cancion);


--
-- TOC entry 4841 (class 2606 OID 16534)
-- Name: usuario_favorito_cancion id_cancion_fk; Type: FK CONSTRAINT; Schema: aplicacion_musica; Owner: postgres
--

ALTER TABLE ONLY aplicacion_musica.usuario_favorito_cancion
    ADD CONSTRAINT id_cancion_fk FOREIGN KEY (id_cancion) REFERENCES aplicacion_musica.cancion(id_cancion);


--
-- TOC entry 4845 (class 2606 OID 16566)
-- Name: usuario_escucha_cancion id_cancion_pk; Type: FK CONSTRAINT; Schema: aplicacion_musica; Owner: postgres
--

ALTER TABLE ONLY aplicacion_musica.usuario_escucha_cancion
    ADD CONSTRAINT id_cancion_pk FOREIGN KEY (id_cancion) REFERENCES aplicacion_musica.cancion(id_cancion);


--
-- TOC entry 4835 (class 2606 OID 16472)
-- Name: pago id_usuario_fk; Type: FK CONSTRAINT; Schema: aplicacion_musica; Owner: postgres
--

ALTER TABLE ONLY aplicacion_musica.pago
    ADD CONSTRAINT id_usuario_fk FOREIGN KEY (usuario_id) REFERENCES aplicacion_musica.usuario(id_usuario);


--
-- TOC entry 4842 (class 2606 OID 16529)
-- Name: usuario_favorito_cancion id_usuario_fk; Type: FK CONSTRAINT; Schema: aplicacion_musica; Owner: postgres
--

ALTER TABLE ONLY aplicacion_musica.usuario_favorito_cancion
    ADD CONSTRAINT id_usuario_fk FOREIGN KEY (id_usuario) REFERENCES aplicacion_musica.usuario(id_usuario);


--
-- TOC entry 4844 (class 2606 OID 16544)
-- Name: usuario_favorito_album id_usuario_fk; Type: FK CONSTRAINT; Schema: aplicacion_musica; Owner: postgres
--

ALTER TABLE ONLY aplicacion_musica.usuario_favorito_album
    ADD CONSTRAINT id_usuario_fk FOREIGN KEY (id_usuario) REFERENCES aplicacion_musica.usuario(id_usuario);


--
-- TOC entry 4846 (class 2606 OID 16561)
-- Name: usuario_escucha_cancion id_usuario_pk; Type: FK CONSTRAINT; Schema: aplicacion_musica; Owner: postgres
--

ALTER TABLE ONLY aplicacion_musica.usuario_escucha_cancion
    ADD CONSTRAINT id_usuario_pk FOREIGN KEY (id_usuario) REFERENCES aplicacion_musica.usuario(id_usuario);


--
-- TOC entry 4839 (class 2606 OID 16519)
-- Name: usuario_favorito_artista nombre_artista_fk; Type: FK CONSTRAINT; Schema: aplicacion_musica; Owner: postgres
--

ALTER TABLE ONLY aplicacion_musica.usuario_favorito_artista
    ADD CONSTRAINT nombre_artista_fk FOREIGN KEY (nombre_artista) REFERENCES aplicacion_musica.artista(nombre);


--
-- TOC entry 4836 (class 2606 OID 16477)
-- Name: pago nombre_plan_fk; Type: FK CONSTRAINT; Schema: aplicacion_musica; Owner: postgres
--

ALTER TABLE ONLY aplicacion_musica.pago
    ADD CONSTRAINT nombre_plan_fk FOREIGN KEY (nombre_plan) REFERENCES aplicacion_musica.plan_suscripcion(nombre);


--
-- TOC entry 4830 (class 2606 OID 16573)
-- Name: usuario nombre_plan_fk; Type: FK CONSTRAINT; Schema: aplicacion_musica; Owner: postgres
--

ALTER TABLE ONLY aplicacion_musica.usuario
    ADD CONSTRAINT nombre_plan_fk FOREIGN KEY (nombre_plan) REFERENCES aplicacion_musica.plan_suscripcion(nombre) NOT VALID;


--
-- TOC entry 4840 (class 2606 OID 16514)
-- Name: usuario_favorito_artista usuario_fk; Type: FK CONSTRAINT; Schema: aplicacion_musica; Owner: postgres
--

ALTER TABLE ONLY aplicacion_musica.usuario_favorito_artista
    ADD CONSTRAINT usuario_fk FOREIGN KEY (id_usuario) REFERENCES aplicacion_musica.usuario(id_usuario);


-- Completed on 2025-06-16 13:22:07

--
-- PostgreSQL database dump complete
--

