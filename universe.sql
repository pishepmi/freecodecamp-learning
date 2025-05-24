--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
    name character varying(100) NOT NULL,
    type text NOT NULL,
    size_in_light_years integer NOT NULL,
    contains_black_hole boolean NOT NULL,
    discovered_year integer
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
    name character varying(100) NOT NULL,
    planet_id integer NOT NULL,
    is_spherical boolean NOT NULL,
    diameter_km integer NOT NULL,
    discovered_by text
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
-- Name: observatory; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.observatory (
    observatory_id integer NOT NULL,
    name character varying(100) NOT NULL,
    location text NOT NULL,
    is_active boolean NOT NULL,
    established_year integer NOT NULL,
    telescope_count integer
);


ALTER TABLE public.observatory OWNER TO freecodecamp;

--
-- Name: observatory_observatory_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.observatory_observatory_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.observatory_observatory_id_seq OWNER TO freecodecamp;

--
-- Name: observatory_observatory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.observatory_observatory_id_seq OWNED BY public.observatory.observatory_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(100) NOT NULL,
    star_id integer NOT NULL,
    has_life boolean NOT NULL,
    distance_from_star numeric(8,2) NOT NULL,
    orbital_period_days integer
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
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_id integer NOT NULL,
    mass numeric(10,2) NOT NULL,
    is_main_sequence boolean NOT NULL,
    age_in_million_years integer
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
-- Name: observatory observatory_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.observatory ALTER COLUMN observatory_id SET DEFAULT nextval('public.observatory_observatory_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 100000, true, 1610);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 220000, true, 1764);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 60000, false, 1784);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Spiral', 76000, true, 1773);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Elliptical', 50000, false, 1912);
INSERT INTO public.galaxy VALUES (6, 'Messier 87', 'Elliptical', 120000, true, 1781);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, true, 3475, 'Humans');
INSERT INTO public.moon VALUES (2, 'Phobos', 2, false, 22, 'Hall');
INSERT INTO public.moon VALUES (3, 'Deimos', 2, false, 12, 'Hall');
INSERT INTO public.moon VALUES (4, 'Europa', 1, true, 3122, 'Galileo');
INSERT INTO public.moon VALUES (5, 'Ganymede', 1, true, 5262, 'Galileo');
INSERT INTO public.moon VALUES (6, 'Callisto', 1, true, 4821, 'Galileo');
INSERT INTO public.moon VALUES (7, 'Io', 1, true, 3643, 'Galileo');
INSERT INTO public.moon VALUES (8, 'Titan', 3, true, 5150, 'Huygens');
INSERT INTO public.moon VALUES (9, 'Rhea', 3, true, 1527, 'Cassini');
INSERT INTO public.moon VALUES (10, 'Iapetus', 3, true, 1469, 'Cassini');
INSERT INTO public.moon VALUES (11, 'Dione', 3, true, 1122, 'Cassini');
INSERT INTO public.moon VALUES (12, 'Proxima b I', 5, false, 10, 'Unknown');
INSERT INTO public.moon VALUES (13, 'Proxima b II', 5, false, 12, 'Unknown');
INSERT INTO public.moon VALUES (14, 'Sirius I-A', 6, true, 1500, 'Unknown');
INSERT INTO public.moon VALUES (15, 'Sirius I-B', 6, true, 1300, 'Unknown');
INSERT INTO public.moon VALUES (16, 'Vega I-A', 10, true, 1700, 'Unknown');
INSERT INTO public.moon VALUES (17, 'Vega I-B', 10, true, 1000, 'Unknown');
INSERT INTO public.moon VALUES (18, 'Vega II-A', 11, true, 900, 'Unknown');
INSERT INTO public.moon VALUES (19, 'Vega II-B', 11, true, 800, 'Unknown');
INSERT INTO public.moon VALUES (20, 'Vega III-A', 12, true, 700, 'Unknown');


--
-- Data for Name: observatory; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.observatory VALUES (1, 'Hubble Space Telescope', 'Low Earth Orbit', true, 1990, 1);
INSERT INTO public.observatory VALUES (2, 'Arecibo Observatory', 'Puerto Rico', false, 1963, 2);
INSERT INTO public.observatory VALUES (3, 'Very Large Telescope', 'Chile', true, 1998, 4);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, true, 149.60, 365);
INSERT INTO public.planet VALUES (2, 'Mars', 1, false, 227.90, 687);
INSERT INTO public.planet VALUES (3, 'Venus', 1, false, 108.20, 225);
INSERT INTO public.planet VALUES (4, 'Mercury', 1, false, 57.90, 88);
INSERT INTO public.planet VALUES (5, 'Proxima b', 2, false, 7.50, 11);
INSERT INTO public.planet VALUES (6, 'Sirius b I', 3, false, 200.00, 500);
INSERT INTO public.planet VALUES (7, 'Sirius b II', 3, false, 300.00, 700);
INSERT INTO public.planet VALUES (8, 'Betelgeuse I', 4, false, 500.00, 1000);
INSERT INTO public.planet VALUES (9, 'Rigel I', 5, false, 400.00, 900);
INSERT INTO public.planet VALUES (10, 'Vega I', 6, false, 150.00, 350);
INSERT INTO public.planet VALUES (11, 'Vega II', 6, false, 180.00, 400);
INSERT INTO public.planet VALUES (12, 'Vega III', 6, false, 200.00, 450);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 1.00, true, 4600);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 1, 0.12, true, 4500);
INSERT INTO public.star VALUES (3, 'Sirius A', 1, 2.06, true, 250);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 1, 20.00, false, 8000);
INSERT INTO public.star VALUES (5, 'Rigel', 2, 21.00, false, 8000);
INSERT INTO public.star VALUES (6, 'Vega', 3, 2.14, true, 455);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: observatory_observatory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.observatory_observatory_id_seq', 3, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


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
-- Name: observatory observatory_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.observatory
    ADD CONSTRAINT observatory_name_key UNIQUE (name);


--
-- Name: observatory observatory_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.observatory
    ADD CONSTRAINT observatory_pkey PRIMARY KEY (observatory_id);


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
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

