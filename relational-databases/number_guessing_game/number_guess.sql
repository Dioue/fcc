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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    user_id integer NOT NULL,
    number_to_guess integer,
    guess_count integer
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    name character varying(22) NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (146, 114, 5, 4);
INSERT INTO public.games VALUES (147, 115, 8, 9);
INSERT INTO public.games VALUES (148, 115, 4, 5);
INSERT INTO public.games VALUES (149, 116, 6, 7);
INSERT INTO public.games VALUES (150, 116, 7, 8);
INSERT INTO public.games VALUES (151, 115, 4, 7);
INSERT INTO public.games VALUES (152, 115, 8, 10);
INSERT INTO public.games VALUES (153, 115, 7, 8);
INSERT INTO public.games VALUES (154, 117, 3, 4);
INSERT INTO public.games VALUES (155, 117, 3, 4);
INSERT INTO public.games VALUES (156, 118, 7, 8);
INSERT INTO public.games VALUES (157, 118, 7, 8);
INSERT INTO public.games VALUES (158, 117, 1, 1);
INSERT INTO public.games VALUES (159, 117, 6, 8);
INSERT INTO public.games VALUES (160, 117, 9, 10);
INSERT INTO public.games VALUES (161, 119, 10, 11);
INSERT INTO public.games VALUES (162, 119, 2, 3);
INSERT INTO public.games VALUES (163, 120, 4, 5);
INSERT INTO public.games VALUES (164, 120, 9, 10);
INSERT INTO public.games VALUES (165, 119, 6, 9);
INSERT INTO public.games VALUES (166, 119, 9, 11);
INSERT INTO public.games VALUES (167, 119, 6, 7);
INSERT INTO public.games VALUES (168, 121, 7, 8);
INSERT INTO public.games VALUES (169, 121, 2, 3);
INSERT INTO public.games VALUES (170, 122, 10, 11);
INSERT INTO public.games VALUES (171, 122, 7, 8);
INSERT INTO public.games VALUES (172, 121, 1, 1);
INSERT INTO public.games VALUES (173, 121, 2, 4);
INSERT INTO public.games VALUES (174, 121, 9, 10);
INSERT INTO public.games VALUES (175, 123, 7, 8);
INSERT INTO public.games VALUES (176, 123, 5, 6);
INSERT INTO public.games VALUES (177, 124, 5, 6);
INSERT INTO public.games VALUES (178, 124, 4, 5);
INSERT INTO public.games VALUES (179, 123, 7, 10);
INSERT INTO public.games VALUES (180, 123, 3, 5);
INSERT INTO public.games VALUES (181, 123, 3, 4);
INSERT INTO public.games VALUES (182, 125, 10, 11);
INSERT INTO public.games VALUES (183, 125, 8, 9);
INSERT INTO public.games VALUES (184, 126, 3, 4);
INSERT INTO public.games VALUES (185, 126, 9, 10);
INSERT INTO public.games VALUES (186, 125, 9, 12);
INSERT INTO public.games VALUES (187, 125, 5, 7);
INSERT INTO public.games VALUES (188, 125, 3, 4);
INSERT INTO public.games VALUES (189, 127, 8, 9);
INSERT INTO public.games VALUES (190, 127, 7, 8);
INSERT INTO public.games VALUES (191, 128, 10, 11);
INSERT INTO public.games VALUES (192, 128, 5, 6);
INSERT INTO public.games VALUES (193, 127, 5, 8);
INSERT INTO public.games VALUES (194, 127, 10, 12);
INSERT INTO public.games VALUES (195, 127, 1, 2);
INSERT INTO public.games VALUES (196, 129, 5, 6);
INSERT INTO public.games VALUES (197, 129, 8, 9);
INSERT INTO public.games VALUES (198, 130, 8, 9);
INSERT INTO public.games VALUES (199, 130, 1, 2);
INSERT INTO public.games VALUES (200, 129, 5, 8);
INSERT INTO public.games VALUES (201, 129, 7, 9);
INSERT INTO public.games VALUES (202, 129, 7, 8);
INSERT INTO public.games VALUES (203, 131, 10, 11);
INSERT INTO public.games VALUES (204, 131, 5, 6);
INSERT INTO public.games VALUES (205, 132, 1, 2);
INSERT INTO public.games VALUES (206, 132, 1, 2);
INSERT INTO public.games VALUES (207, 131, 10, 13);
INSERT INTO public.games VALUES (208, 131, 7, 9);
INSERT INTO public.games VALUES (209, 131, 3, 4);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (114, 'joe');
INSERT INTO public.users VALUES (115, 'user_1708236412599');
INSERT INTO public.users VALUES (116, 'user_1708236412598');
INSERT INTO public.users VALUES (117, 'user_1708236415826');
INSERT INTO public.users VALUES (118, 'user_1708236415825');
INSERT INTO public.users VALUES (119, 'user_1708236418068');
INSERT INTO public.users VALUES (120, 'user_1708236418067');
INSERT INTO public.users VALUES (121, 'user_1708236423694');
INSERT INTO public.users VALUES (122, 'user_1708236423693');
INSERT INTO public.users VALUES (123, 'user_1708236428257');
INSERT INTO public.users VALUES (124, 'user_1708236428256');
INSERT INTO public.users VALUES (125, 'user_1708236433517');
INSERT INTO public.users VALUES (126, 'user_1708236433516');
INSERT INTO public.users VALUES (127, 'user_1708236435178');
INSERT INTO public.users VALUES (128, 'user_1708236435177');
INSERT INTO public.users VALUES (129, 'user_1708236449682');
INSERT INTO public.users VALUES (130, 'user_1708236449681');
INSERT INTO public.users VALUES (131, 'user_1708236505840');
INSERT INTO public.users VALUES (132, 'user_1708236505839');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 209, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 132, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_name_key UNIQUE (name);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

