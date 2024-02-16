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
-- Name: universe; Type: DATABASE; Schema: -; Owner: Dioue
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO Dioue;

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
-- Name: constellation; Type: TABLE; Schema: public; Owner: Dioue
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(100) NOT NULL,
    abbreviation character varying(10) NOT NULL,
    family character varying(100),
    brightest_star character varying(100),
    region character varying(100),
    age_in_millions_of_years integer
);


ALTER TABLE public.constellation OWNER TO Dioue;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: Dioue
--

CREATE SEQUENCE public.constellation_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_constellation_id_seq OWNER TO Dioue;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Dioue
--

ALTER SEQUENCE public.constellation_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: Dioue
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    type character varying(50),
    description text,
    has_life boolean NOT NULL,
    distance_light_years numeric,
    size_radius_km numeric
);


ALTER TABLE public.galaxy OWNER TO Dioue;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: Dioue
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO Dioue;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Dioue
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: Dioue
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(100) NOT NULL,
    planet_id integer,
    diameter_km numeric,
    mass_kg numeric,
    distance_from_planet_km numeric,
    moon_description text
);


ALTER TABLE public.moon OWNER TO Dioue;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: Dioue
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO Dioue;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Dioue
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: Dioue
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(100) NOT NULL,
    star_id integer,
    diameter_km numeric NOT NULL,
    mass_kg numeric,
    distance_from_star_km numeric,
    is_spherical boolean NOT NULL,
    age_in_millions_of_years integer,
    planet_type character varying(50),
    planet_description text
);


ALTER TABLE public.planet OWNER TO Dioue;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: Dioue
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO Dioue;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Dioue
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: Dioue
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_id integer,
    spectral_class character varying(10),
    luminosity numeric,
    mass_kg numeric NOT NULL,
    is_visible boolean NOT NULL,
    star_description text
);


ALTER TABLE public.star OWNER TO Dioue;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: Dioue
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO Dioue;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Dioue
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: Dioue
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_constellation_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: Dioue
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: Dioue
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: Dioue
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: Dioue
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: Dioue
--

INSERT INTO public.constellation VALUES (1, 'Orion', 'Ori', 'Orion', 'Rigel', 'Winter', 800);
INSERT INTO public.constellation VALUES (2, 'Ursa Major', 'UMa', 'Ursa Major', 'Dubhe', 'Northern', 500);
INSERT INTO public.constellation VALUES (3, 'Crux', 'Cru', 'Southern Cross', 'Acrux', 'Southern', 100);
INSERT INTO public.constellation VALUES (4, 'Cassiopeia', 'Cas', 'Cassiopeia', 'Schedar', 'Northern', 400);
INSERT INTO public.constellation VALUES (5, 'Pegasus', 'Peg', 'Pegasus', 'Markab', 'Autumn', 600);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: Dioue
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 'Our home galaxy', true, 100000, 100000);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 'Nearest spiral galaxy', false, 200000, 120000);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 'Third-largest galaxy in the Local Group', false, 300000, 80000);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Spiral', 'Known for its prominent spiral arms', false, 150000, 90000);
INSERT INTO public.galaxy VALUES (5, 'Pinwheel', 'Spiral', 'Named after its resemblance to a pinwheel', false, 140000, 85000);
INSERT INTO public.galaxy VALUES (6, 'Black Eye', 'Spiral', 'Has a dark band of dust', false, 160000, 95000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: Dioue
--

INSERT INTO public.moon VALUES (1, 'Luna', 3, 3474, 73500000000000000000000, 384400, 'Earth''s only natural satellite');
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 22, 10659000000000000, 9378, 'Larger moon of Mars');
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 12, 1476200000000000, 23460, 'Smaller moon of Mars');
INSERT INTO public.moon VALUES (4, 'Europa', 5, 3121, 48000000000000000000000, 671034, 'One of Jupiter''s Galilean moons');
INSERT INTO public.moon VALUES (5, 'Io', 5, 3643.2, 89319380000000000000000, 421700, 'Most volcanically active body in the Solar System');
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 5262.4, 148190000000000000000000, 1070400, 'Largest moon in the Solar System');
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 4800, 107593800000000000000000, 1882700, 'Heavily cratered moon of Jupiter');
INSERT INTO public.moon VALUES (8, 'Titan', 6, 5150, 134520000000000000000000, 1221870, 'Largest moon of Saturn and has a thick atmosphere');
INSERT INTO public.moon VALUES (9, 'Enceladus', 6, 504.2, 108022000000000000000, 238037, 'Contains water vapor geysers');
INSERT INTO public.moon VALUES (10, 'Triton', 8, 2706.8, 21400000000000000000000, 354759, 'Only large moon in the Solar System with a retrograde orbit');
INSERT INTO public.moon VALUES (11, 'Charon', 9, 1212, 1586000000000000000000, 19571, 'Largest moon of Pluto and is tidally locked with it');
INSERT INTO public.moon VALUES (12, 'Phoebe', 10, 213.6, 8292000000000000000, 12947918, 'Retrograde irregular moon of Saturn');
INSERT INTO public.moon VALUES (13, 'Dione', 6, 1122.8, 1095452000000000000000, 377396, 'Innermost of the Galilean moons of Jupiter');
INSERT INTO public.moon VALUES (14, 'Rhea', 6, 1527.6, 2306518000000000000000, 527108, 'Second-largest moon of Saturn and has a very bright surface');
INSERT INTO public.moon VALUES (15, 'Iapetus', 6, 1468.6, 1805635000000000000000, 3561300, 'Known for its two-tone coloration');
INSERT INTO public.moon VALUES (16, 'Mimas', 6, 396.4, 37493000000000000000, 185404, 'Has a large crater named Herschel');
INSERT INTO public.moon VALUES (17, 'Miranda', 11, 471.6, 65900000000000000000, 129390, 'Mostly made of ice and has a chaotic terrain');
INSERT INTO public.moon VALUES (18, 'Tethys', 6, 1062, 617400000000000000000, 294660, 'Contains the large impact crater Odysseus');
INSERT INTO public.moon VALUES (19, 'Hyperion', 6, 270.4, 5600000000000000000, 1481000, 'Highly irregular shape and unpredictable rotation');
INSERT INTO public.moon VALUES (20, 'Ariel', 12, 1157.8, 1350000000000000000000, 190900, 'Youngest of the five major Uranian moons and has a bright surface');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: Dioue
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 4879, 330110000000000000000000, 57910000, true, 4500, 'Terrestrial', 'Closest planet to the Sun');
INSERT INTO public.planet VALUES (2, 'Venus', 1, 12104, 4867500000000000000000000, 108200000, true, 4600, 'Terrestrial', 'Second planet from the Sun');
INSERT INTO public.planet VALUES (3, 'Earth', 1, 12742, 5972000000000000000000000, 149600000, true, 4600, 'Terrestrial', 'Third planet from the Sun and only known to harbor life');
INSERT INTO public.planet VALUES (4, 'Mars', 1, 6792, 641710000000000000000000, 227900000, true, 4500, 'Terrestrial', 'Fourth planet from the Sun');
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 139822, 1898200000000000000000000000, 778600000, true, 4600, 'Gas Giant', 'Fifth planet from the Sun and largest in the Solar System');
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 116464, 568340000000000000000000000, 1433500000, true, 4600, 'Gas Giant', 'Sixth planet from the Sun known for its rings');
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 50724, 86810000000000000000000000, 2872400000, true, 4600, 'Ice Giant', 'Seventh planet from the Sun and tilted on its side');
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 49244, 102413000000000000000000000, 4495100000, true, 4600, 'Ice Giant', 'Eighth planet from the Sun and known for its blue color');
INSERT INTO public.planet VALUES (9, 'Pluto', 1, 2376, 13030000000000000000000, 5906400000, true, 4600, 'Dwarf', 'Dwarf planet in the Kuiper belt');
INSERT INTO public.planet VALUES (10, 'Kepler-10b', 2, 18213, 3333000000000000000000000, 14729000, true, 8600, 'Rocky', 'First rocky exoplanet discovered by the Kepler space telescope');
INSERT INTO public.planet VALUES (11, 'HD 209458 b', 2, 71492, 1487900000000000000000000000, 69000000, true, 2200, 'Gas Giant', 'First exoplanet detected by transit method');
INSERT INTO public.planet VALUES (12, '55 Cancri e', 2, 198940, 8630000000000000000000000, 2408550, true, 1900, 'Rocky', 'Exoplanet with extreme temperatures');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: Dioue
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'G2V', 1.0, 1989000000000000000000000000000, true, 'The star at the center of the Solar System');
INSERT INTO public.star VALUES (2, 'Betelgeuse', 1, 'M1', 10000, 77000000000000000000000000000000, true, 'Red supergiant in the constellation of Orion');
INSERT INTO public.star VALUES (3, 'Sirius', 1, 'A1V', 25.4, 2063000000000000000000000000000, true, 'Brightest star in the night sky');
INSERT INTO public.star VALUES (4, 'Proxima Centauri', 1, 'M5.5', 0.0017, 244700000000000000000000000000, true, 'Closest known star to the Sun');
INSERT INTO public.star VALUES (5, 'Alpha Centauri A', 1, 'G2V', 1.1, 2200000000000000000000000000000, true, 'Closest star system to the Solar System');
INSERT INTO public.star VALUES (6, 'Alpha Centauri B', 1, 'K0V', 0.45, 1850000000000000000000000000000, true, 'Closest star system to the Solar System');


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Dioue
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 5, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Dioue
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Dioue
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Dioue
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Dioue
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: constellation constellation_name_key; Type: CONSTRAINT; Schema: public; Owner: Dioue
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_name_key UNIQUE (name);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: Dioue
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: Dioue
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: Dioue
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: Dioue
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: Dioue
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: Dioue
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: Dioue
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: Dioue
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: Dioue
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: Dioue
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: Dioue
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: Dioue
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

