--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    type text NOT NULL,
    size_in_kpc numeric,
    distance_from_earth_in_kpc integer,
    has_black_hole boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planet_id integer NOT NULL,
    earth_mass numeric,
    earth_radius numeric,
    distance_from_planet_in_kpc numeric,
    is_tidal_locked boolean
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    star_id integer NOT NULL,
    type text,
    earth_mass numeric,
    earth_radius numeric,
    distance_from_star_in_kpc numeric,
    has_moons boolean,
    is_habitable boolean
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: solar_system; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.solar_system (
    solar_system_id integer NOT NULL,
    name character varying(30) NOT NULL,
    star_id integer NOT NULL,
    num_planets integer,
    num_moons integer,
    is_ring_system boolean,
    has_asteroid_belt boolean
);


ALTER TABLE public.solar_system OWNER TO freecodecamp;

--
-- Name: solar_system_solar_system_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.solar_system_solar_system_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.solar_system_solar_system_id_seq OWNER TO freecodecamp;

--
-- Name: solar_system_solar_system_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.solar_system_solar_system_id_seq OWNED BY public.solar_system.solar_system_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_id integer NOT NULL,
    spectral_type text,
    solar_mass numeric,
    solar_radius numeric,
    is_visible boolean,
    has_planets boolean
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: solar_system solar_system_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.solar_system ALTER COLUMN solar_system_id SET DEFAULT nextval('public.solar_system_solar_system_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 100000, 25, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 200000, 2200, false);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Irregular', 4000, 2200, false);
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 'Spiral', 50000, 29, true);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 'Spiral', 30000, 23, false);
INSERT INTO public.galaxy VALUES (6, 'Pinwheel', 'Spiral', 55000, 23, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (21, 'Moon', 1, 0.0123, 0.274, 0.000052, true);
INSERT INTO public.moon VALUES (22, 'Phobos', 2, 0.000015, 0.0095, 0.000002, true);
INSERT INTO public.moon VALUES (23, 'Ganymede', 3, 1.514, 0.432, 0.000077, false);
INSERT INTO public.moon VALUES (24, 'Titan', 4, 1.471, 0.555, 0.000022, true);
INSERT INTO public.moon VALUES (25, 'Triton', 5, 2.14, 0.236, 0.000029, true);
INSERT INTO public.moon VALUES (26, 'Charon', 6, 1.52, 0.388, 0.000003, false);
INSERT INTO public.moon VALUES (27, 'Io', 3, 0.613, 0.413, 0.000042, true);
INSERT INTO public.moon VALUES (28, 'Europa', 3, 0.478, 0.398, 0.000062, false);
INSERT INTO public.moon VALUES (29, 'Callisto', 3, 0.364, 0.264, 0.000116, true);
INSERT INTO public.moon VALUES (30, 'Enceladus', 4, 0.003, 0.104, 0.000002, true);
INSERT INTO public.moon VALUES (31, 'Tethys', 4, 0.0006, 0.113, 0.000001, false);
INSERT INTO public.moon VALUES (32, 'Rhea', 4, 0.0027, 0.163, 0.000002, true);
INSERT INTO public.moon VALUES (33, 'Dione', 4, 0.0007, 0.112, 0.000002, false);
INSERT INTO public.moon VALUES (34, 'Nereid', 5, 0.00003, 0.017, 0.000059, false);
INSERT INTO public.moon VALUES (35, 'Proteus', 5, 0.0001, 0.019, 0.000011, false);
INSERT INTO public.moon VALUES (36, 'Charon II', 6, 0.000000001, 0.0015, 0.0000002, true);
INSERT INTO public.moon VALUES (37, 'Lapetus', 4, 0.0038, 0.361, 0.000006, false);
INSERT INTO public.moon VALUES (38, 'Miranda', 8, 0.0007, 0.33, 0.000006, true);
INSERT INTO public.moon VALUES (39, 'Phoebe', 8, 0.0003, 0.021, 0.000009, false);
INSERT INTO public.moon VALUES (40, 'Hyperion', 4, 0.0001, 0.018, 0.000002, true);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 'Terrestrial', 1.00, 1.00, 0.00485, true, true);
INSERT INTO public.planet VALUES (2, 'Mars', 1, 'Terrestrial', 0.107, 0.532, 0.00730, true, false);
INSERT INTO public.planet VALUES (3, 'Jupiter', 1, 'Gas Giant', 317.8, 1.15, 0.0253, true, false);
INSERT INTO public.planet VALUES (4, 'Saturn', 1, 'Gas Giant', 95.15, 0.94, 0.0456, true, false);
INSERT INTO public.planet VALUES (5, 'Neptune', 1, 'Ice Giant', 17.15, 1.64, 0.1425, true, false);
INSERT INTO public.planet VALUES (6, 'Pluto', 1, 'Dwarf Planet', 0.002, 0.18, 0.1888, true, false);
INSERT INTO public.planet VALUES (7, 'Venus', 1, 'Terrestrial', 0.90, 0.95, 0.0344, false, false);
INSERT INTO public.planet VALUES (8, 'Uranus', 1, 'Ice Giant', 57.94, 0.77, 0.0913, true, false);
INSERT INTO public.planet VALUES (9, 'Mercury', 1, 'Terrestrial', 0.056, 0.38, 0.0186, false, false);
INSERT INTO public.planet VALUES (10, 'Kepler-186f', 5, 'Terrestrial', 1.11, 1.06, 0.0021, false, true);
INSERT INTO public.planet VALUES (11, 'TRAPPIST-1d', 5, 'Terrestrial', 0.78, 0.84, 0.0003, false, true);
INSERT INTO public.planet VALUES (12, 'Andromeda-II', 6, 'Gas Giant', 0.13, 0.95, 0.0001, false, false);


--
-- Data for Name: solar_system; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.solar_system VALUES (1, 'Solar System', 1, 8, 215, true, true);
INSERT INTO public.solar_system VALUES (2, 'Alpha Centauri System', 5, 4, 9, false, false);
INSERT INTO public.solar_system VALUES (3, 'Proxima Centauri System', 6, 1, 2, false, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'G-type', 1, 1, true, true);
INSERT INTO public.star VALUES (2, 'Sirius', 1, 'A-type', 2.02, 1.71, true, true);
INSERT INTO public.star VALUES (3, 'Betelguese', 2, 'M-type', 16.5, 900, true, true);
INSERT INTO public.star VALUES (4, 'Vega', 1, 'A-type', 2.25, 2.34, true, false);
INSERT INTO public.star VALUES (5, 'Alpha Centauri A', 1, 'G-type', 1.10, 1.10, true, true);
INSERT INTO public.star VALUES (6, 'Proxima Centauri', 1, 'M-type', 0.12, 0.07, true, false);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 40, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: solar_system_solar_system_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.solar_system_solar_system_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: solar_system solar_system_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.solar_system
    ADD CONSTRAINT solar_system_name_key UNIQUE (name);


--
-- Name: solar_system solar_system_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.solar_system
    ADD CONSTRAINT solar_system_pkey PRIMARY KEY (solar_system_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: solar_system solar_system_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.solar_system
    ADD CONSTRAINT solar_system_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

