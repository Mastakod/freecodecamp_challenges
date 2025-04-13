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
    distance_from_earth double precision NOT NULL,
    number_of_stars integer,
    galaxy_type character varying(50)
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
    planet_id integer,
    diameter integer,
    distance_from_planet integer,
    type character varying(50) NOT NULL,
    has_atmosphere boolean DEFAULT false
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
    name character varying(100) NOT NULL,
    star_id integer NOT NULL,
    diameter integer,
    distance_from_star double precision,
    type character varying(50),
    has_life boolean DEFAULT false,
    has_water boolean DEFAULT false
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
-- Name: species; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.species (
    species_id integer NOT NULL,
    name character varying(100) NOT NULL,
    planet_id integer,
    moon_id integer,
    intelligence_level integer,
    population numeric(10,2),
    average_lifespan integer,
    habitat text,
    is_sentient boolean DEFAULT false
);


ALTER TABLE public.species OWNER TO freecodecamp;

--
-- Name: species_species_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.species_species_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.species_species_id_seq OWNER TO freecodecamp;

--
-- Name: species_species_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.species_species_id_seq OWNED BY public.species.species_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_id integer,
    spectral_type character varying(10),
    mass integer,
    luminosity double precision,
    distance_from_earth double precision
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
-- Name: species species_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.species ALTER COLUMN species_id SET DEFAULT nextval('public.species_species_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 0, 2147483647, 'Spiral');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 2540000, 2147483647, 'Oval');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 3000000, 2147483647, 'Miral');
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 23000000, 2147483647, 'Siral');
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 29000000, 2147483647, 'Piral');
INSERT INTO public.galaxy VALUES (6, 'Pinwheel', 21000000, 2147483647, 'Liral');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, 34748, 3844, 'Natural', false);
INSERT INTO public.moon VALUES (2, 'Phobos', 2, 224, 600, 'Natural', false);
INSERT INTO public.moon VALUES (3, 'Deimos', 2, 120, 23460, 'Natural', false);
INSERT INTO public.moon VALUES (4, 'Europa', 3, 31216, 6709, 'Natural', true);
INSERT INTO public.moon VALUES (5, 'Ganymede', 3, 5262, 1070, 'Natural', true);
INSERT INTO public.moon VALUES (6, 'Callisto', 3, 4821, 1880, 'Natural', false);
INSERT INTO public.moon VALUES (7, 'Titan', 4, 51508, 1225, 'Natural', true);
INSERT INTO public.moon VALUES (8, 'Rhea', 4, 1528, 5270, 'Natural', false);
INSERT INTO public.moon VALUES (9, 'Iapetus', 4, 1469, 356000, 'Natural', false);
INSERT INTO public.moon VALUES (10, 'Enceladus', 4, 504, 238, 'Natural', true);
INSERT INTO public.moon VALUES (11, 'Miranda', 5, 472, 129, 'Natural', false);
INSERT INTO public.moon VALUES (12, 'Ariel', 5, 1158, 19110, 'Natural', true);
INSERT INTO public.moon VALUES (13, 'Umbriel', 5, 1169, 26600, 'Natural', false);
INSERT INTO public.moon VALUES (14, 'Titania', 5, 1577, 43600, 'Natural', false);
INSERT INTO public.moon VALUES (15, 'Oberon', 5, 1530, 58350, 'Natural', false);
INSERT INTO public.moon VALUES (16, 'Triton', 6, 2706, 354, 'Natural', true);
INSERT INTO public.moon VALUES (17, 'Nereid', 6, 340, 57000, 'Natural', false);
INSERT INTO public.moon VALUES (18, 'Proteus', 6, 420, 117000, 'Natural', false);
INSERT INTO public.moon VALUES (19, 'Charon', 7, 1212, 19500, 'Natural', true);
INSERT INTO public.moon VALUES (20, 'Haumea', 8, 1600, 30000, 'Natural', false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 12742, 1, 'Terrestrial', true, true);
INSERT INTO public.planet VALUES (2, 'Mars', 1, 6779, 1.5, 'Terrestrial', false, true);
INSERT INTO public.planet VALUES (3, 'Jupiter', 1, 139820, 5.2, 'Gas Giant', false, false);
INSERT INTO public.planet VALUES (4, 'Saturn', 1, 116460, 9.6, 'Gas Giant', false, false);
INSERT INTO public.planet VALUES (5, 'Proxima b', 2, 12000, 0.0485, 'Terrestrial', true, true);
INSERT INTO public.planet VALUES (6, 'Venus', 1, 12104, 0.72, 'Terrestrial', false, false);
INSERT INTO public.planet VALUES (7, 'Mercury', 1, 4879, 0.39, 'Terrestrial', false, false);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 49528, 30.1, 'Gas Giant', false, false);
INSERT INTO public.planet VALUES (9, 'Uranus', 1, 50724, 19.2, 'Gas Giant', false, false);
INSERT INTO public.planet VALUES (10, 'Kepler-186f', 3, 4900, 0.11, 'Terrestrial', true, true);
INSERT INTO public.planet VALUES (11, 'HD 209458 b', 4, 140000, 0.047, 'Gas Giant', false, true);
INSERT INTO public.planet VALUES (12, 'Gliese 581g', 5, 8500, 0.03, 'Terrestrial', true, true);


--
-- Data for Name: species; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.species VALUES (1, 'Zorgs', 1, NULL, 7, 1500000.00, 80, 'Dense forests with high biodiversity.', true);
INSERT INTO public.species VALUES (2, 'Glorpins', 2, 1, 5, 5000000.00, 25, 'Rocky caves and mountainous regions.', false);
INSERT INTO public.species VALUES (3, 'Aquarins', 3, NULL, 8, 2000000.00, 120, 'Aquatic environments with coral reefs.', true);
INSERT INTO public.species VALUES (4, 'Florae', 4, 2, 3, 3000000.00, 15, 'Lush, tropical jungles.', false);
INSERT INTO public.species VALUES (5, 'Aetherians', 5, NULL, 9, 1000000.00, 150, 'High-altitude cloud cities.', true);
INSERT INTO public.species VALUES (6, 'Stonewalkers', 2, 3, 4, 7500000.00, 40, 'Subterranean tunnels and caves.', false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sol', 1, 'G2V', 1, 1, 0);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 2, 'M5.5Ve', 12, 0.0017, 424);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 1, 'M1-M2 Ia', 20, 120000, 6425);
INSERT INTO public.star VALUES (4, 'Sirius A', 1, 'A1V', 2, 25.4, 86);
INSERT INTO public.star VALUES (5, 'Vega', 1, 'A0V', 2, 40, 25);
INSERT INTO public.star VALUES (6, 'Procyon A', 2, 'F5IV-V', 2, 7.5, 11.4);


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
-- Name: species_species_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.species_species_id_seq', 6, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_galaxy_type_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_type_key UNIQUE (galaxy_type);


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
-- Name: species species_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.species
    ADD CONSTRAINT species_name_key UNIQUE (name);


--
-- Name: species species_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.species
    ADD CONSTRAINT species_pkey PRIMARY KEY (species_id);


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
-- Name: species species_moon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.species
    ADD CONSTRAINT species_moon_id_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: species species_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.species
    ADD CONSTRAINT species_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

