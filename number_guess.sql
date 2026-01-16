--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
    user_id integer,
    number_guesses integer NOT NULL
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
    username character varying(22) NOT NULL,
    games_played integer DEFAULT 0,
    best_game integer
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

COPY public.games (game_id, user_id, number_guesses) FROM stdin;
1	72	716
2	72	869
3	73	850
4	73	692
5	72	19
6	72	226
7	72	966
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.users (user_id, username, games_played, best_game) FROM stdin;
1	ana	1	35
3	user_1768568272237	2	699
2	user_1768568272238	5	229
19	user_1768570305600	358	195
5	user_1768568556092	2	0
18	user_1768570305601	1926	99
4	user_1768568556093	5	0
35	user_1768573126668	2	60
7	user_1768569273338	2	766
21	user_1768570544437	1	900
6	user_1768569273339	5	17
34	user_1768573126669	5	153
20	user_1768570544438	1	448
9	user_1768569365850	2	184
8	user_1768569365851	5	138
11	user_1768569577575	2	65
23	user_1768570691594	1	1
10	user_1768569577576	5	82
22	user_1768570691595	1	1
13	user_1768569657671	2	51
38	user_1768573296203	1	359
12	user_1768569657672	5	20
25	user_1768570758116	1	386
15	user_1768569833820	2	196
14	user_1768569833821	5	62
24	user_1768570758117	1	5
17	user_1768570144881	1	103
16	user_1768570144882	1	567
36	user_1768573296204	1	382
27	user_1768570783024	1	965
26	user_1768570783025	1	89
29	user_1768571465373	512	189
44	user_1768573325382	2	342
28	user_1768571465374	1790	204
43	user_1768573325383	5	395
31	user_1768573003739	2	153
30	user_1768573003740	5	255
46	user_1768573340613	2	148
33	user_1768573012607	2	319
32	user_1768573012608	5	103
45	user_1768573340614	5	64
47	user_1768576460975	0	\N
48	user_1768576460974	0	\N
49	user_1768576826440	0	\N
50	user_1768576826439	0	\N
51	user_1768577079477	0	\N
52	user_1768577079476	0	\N
53	user_1768577350930	0	\N
54	user_1768577350929	0	\N
55	user_1768577779377	0	\N
56	user_1768577779376	0	\N
57	user_1768578016043	0	\N
59	user_1768578016042	0	\N
64	user_1768578361374	0	\N
65	user_1768578361373	0	\N
66	user_1768578543707	0	\N
67	user_1768578543706	0	\N
68	user_1768578734249	0	\N
69	user_1768578734248	0	\N
70	user_1768579057827	0	\N
71	user_1768579057826	0	\N
72	user_1768579658134	0	\N
73	user_1768579658133	0	\N
\.


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 7, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 1, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

