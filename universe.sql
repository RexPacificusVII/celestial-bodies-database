--
-- PostgreSQL database dump
--

-- Dumped from database version 12.16 (Ubuntu 12.16-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.16 (Ubuntu 12.16-0ubuntu0.20.04.1)

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
    size numeric,
    distance_from_earth integer,
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
    size numeric,
    distance_from_planet integer,
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
    mass numeric,
    radius integer,
    distance_from_star numeric,
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
    mass numeric,
    radius integer,
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

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 100000, 25000, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 200000, 2200000, false);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Irregular', 4000, 2200000, false);
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 'Spiral', 50000, 28500, true);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 'Spiral', 30000, 23000, false);
INSERT INTO public.galaxy VALUES (6, 'Pinwheel', 'Spiral', 55000, 23000, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, 73400000000000000000000, 384400, true);
INSERT INTO public.moon VALUES (2, 'Phobos', 2, 10659000000000000, 9376, true);
INSERT INTO public.moon VALUES (3, 'Ganymede', 3, 148190000000000000000000, 1070, false);
INSERT INTO public.moon VALUES (4, 'Titan', 4, 134520000000000000000000, 1221, true);
INSERT INTO public.moon VALUES (5, 'Triton', 5, 21400000000000000000000, 354, true);
INSERT INTO public.moon VALUES (6, 'Charon', 6, 1586000000000000000000, 19571, false);
INSERT INTO public.moon VALUES (7, 'Io', 3, 89300000000000000000000, 421, true);
INSERT INTO public.moon VALUES (8, 'Europa', 3, 48000000000000000000000, 671, false);
INSERT INTO public.moon VALUES (9, 'Callisto', 3, 107590000000000000000000, 1883, true);
INSERT INTO public.moon VALUES (10, 'Enceladus', 4, 108000000000000000000, 237, true);
INSERT INTO public.moon VALUES (11, 'Tethys', 4, 617600000000000000000, 294, false);
INSERT INTO public.moon VALUES (12, 'Rhea', 4, 2316000000000000000000, 527, true);
INSERT INTO public.moon VALUES (13, 'Dione', 4, 1100000000000000000000, 377, false);
INSERT INTO public.moon VALUES (14, 'Nereid', 5, 370000000000000000, 551381, false);
INSERT INTO public.moon VALUES (15, 'Proteus', 5, 44000000000000000000, 117647, false);
INSERT INTO public.moon VALUES (16, 'Charon II', 7, 320000000000000000, 0, true);
INSERT INTO public.moon VALUES (17, 'Lapetus', 6, 1805000000000000000000, 3561, false);
INSERT INTO public.moon VALUES (18, 'Miranda', 5, 65900000000000000000, 129, true);
INSERT INTO public.moon VALUES (19, 'Phoebe', 4, 8290000000000000000, 12952, false);
INSERT INTO public.moon VALUES (20, 'Hyperion', 4, 56200000000000000000, 1481, true);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (4, 'Saturn', 1, 'Gas Giant', 568300000000000000000000000, 58232, 1427, true, false);
INSERT INTO public.planet VALUES (5, 'Neptune', 1, 'Ice Giant', 102400000000000000000000000, 24622, 4495, true, false);
INSERT INTO public.planet VALUES (6, 'Pluto', 1, 'Dwarf Planet', 13030000000000000000000, 1186, 5906, true, false);
INSERT INTO public.planet VALUES (8, 'Uranus', 1, 'Ice Giant', 86810000000000000000000000, 25362, 2871, true, false);
INSERT INTO public.planet VALUES (12, 'Andromeda-II', 6, 'Gas Giant', 26000000000000000000000000, 51844, 2122, false, false);
INSERT INTO public.planet VALUES (1, 'Earth', 1, 'Terrestrial', 5972000000000000000000000, 6371, 149.6, true, true);
INSERT INTO public.planet VALUES (2, 'Mars', 1, 'Terrestrial', 639000000000000000000000, 3389, 227.9, true, false);
INSERT INTO public.planet VALUES (3, 'Jupiter', 1, 'Gas Giant', 1898000000000000000000000000, 69911, 778.3, true, false);
INSERT INTO public.planet VALUES (7, 'Venus', 1, 'Terrestrial', 4867000000000000000000000, 6052, 108.2, false, false);
INSERT INTO public.planet VALUES (9, 'Mercury', 1, 'Terrestrial', 330100000000000000000000, 2439, 57.9, false, false);
INSERT INTO public.planet VALUES (10, 'Kepler-186f', 5, 'Terrestrial', 3900000000000000000000000, 6214, 0.08, false, true);
INSERT INTO public.planet VALUES (11, 'TRAPPIST-1d', 5, 'Terrestrial', 3500000000000000000000000, 7734, 0.021, false, true);


--
-- Data for Name: solar_system; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.solar_system VALUES (1, 'Solar System', 1, 8, 215, true, true);
INSERT INTO public.solar_system VALUES (2, 'Alpha Centauri System', 5, 4, 9, false, false);
INSERT INTO public.solar_system VALUES (3, 'Proxima Centauri System', 6, 1, 2, false, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'G-type', 1989000000000000000000000000000, 696340, true, true);
INSERT INTO public.star VALUES (2, 'Sirius', 1, 'A-type', 2020000000000000000000000000000, 170840, true, true);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 2, 'M-type', 11600000000000000000000000000000, 887700, true, true);
INSERT INTO public.star VALUES (4, 'Vega', 1, 'A-type', 2140000000000000000000000000000, 26728, true, false);
INSERT INTO public.star VALUES (5, 'Alpha Centauri A', 1, 'G-type', 2180000000000000000000000000000, 65354, true, true);
INSERT INTO public.star VALUES (6, 'Proxima Centauri', 1, 'M-type', 23900000000000000000000000000, 118647, true, false);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


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

