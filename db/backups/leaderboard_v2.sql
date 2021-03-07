--
-- PostgreSQL database dump
--

-- Dumped from database version 13.1
-- Dumped by pg_dump version 13.1

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

--
-- Name: athletes_id_seq; Type: SEQUENCE; Schema: public; Owner: aforward
--

CREATE SEQUENCE public.athletes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.athletes_id_seq OWNER TO aforward;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: athletes; Type: TABLE; Schema: public; Owner: aforward
--

CREATE TABLE public.athletes (
    id integer DEFAULT nextval('public.athletes_id_seq'::regclass) NOT NULL,
    identifier character varying(100) DEFAULT md5((random())::text) NOT NULL,
    created timestamp without time zone DEFAULT now() NOT NULL,
    modified timestamp without time zone DEFAULT now() NOT NULL,
    name character varying(1000),
    dob date,
    gender character varying(100)
);


ALTER TABLE public.athletes OWNER TO aforward;

--
-- Name: competitions_id_seq; Type: SEQUENCE; Schema: public; Owner: aforward
--

CREATE SEQUENCE public.competitions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.competitions_id_seq OWNER TO aforward;

--
-- Name: competitions; Type: TABLE; Schema: public; Owner: aforward
--

CREATE TABLE public.competitions (
    id integer DEFAULT nextval('public.competitions_id_seq'::regclass) NOT NULL,
    identifier character varying(100) DEFAULT md5((random())::text) NOT NULL,
    created timestamp without time zone DEFAULT now() NOT NULL,
    modified timestamp without time zone DEFAULT now() NOT NULL,
    name character varying(1000),
    venue character varying(1000),
    start_date date,
    end_date date
);


ALTER TABLE public.competitions OWNER TO aforward;

--
-- Name: registrations_id_seq; Type: SEQUENCE; Schema: public; Owner: aforward
--

CREATE SEQUENCE public.registrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.registrations_id_seq OWNER TO aforward;

--
-- Name: registrations; Type: TABLE; Schema: public; Owner: aforward
--

CREATE TABLE public.registrations (
    id integer DEFAULT nextval('public.registrations_id_seq'::regclass) NOT NULL,
    identifier character varying(100) DEFAULT md5((random())::text) NOT NULL,
    created timestamp without time zone DEFAULT now() NOT NULL,
    modified timestamp without time zone DEFAULT now() NOT NULL,
    athlete_id integer,
    competition_id integer,
    age integer,
    gender character varying(100)
);


ALTER TABLE public.registrations OWNER TO aforward;

--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: aforward
--

CREATE TABLE public.schema_migrations (
    migration character varying(1000) NOT NULL,
    migrated_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO aforward;

--
-- Data for Name: athletes; Type: TABLE DATA; Schema: public; Owner: aforward
--

COPY public.athletes (id, identifier, created, modified, name, dob, gender) FROM stdin;
1	4c6c957bc6f18ac0287291a93a0f63ff	2021-02-21 09:33:22.61259	2021-02-21 09:33:22.61259	Andrew	1975-12-01	m
2	ff35b7e1a2124c74482f61261feed793	2021-02-21 09:33:22.61259	2021-02-21 09:33:22.61259	Ayana	1998-06-11	f
3	6e98b2bff38e0219d01175d16ad2d1b7	2021-02-21 09:33:22.61259	2021-02-21 09:33:22.61259	Hayden	1996-07-24	m
4	b67260df05bf191dbbbbeafcd831ea0b	2021-02-21 09:33:22.61259	2021-02-21 09:33:22.61259	August	1999-09-09	m
\.


--
-- Data for Name: competitions; Type: TABLE DATA; Schema: public; Owner: aforward
--

COPY public.competitions (id, identifier, created, modified, name, venue, start_date, end_date) FROM stdin;
1	21cb7e278b49acbc1f25119b47c900ec	2021-02-21 09:33:22.614014	2021-02-21 09:33:22.614014	Bytown Closed 2020	CrossFit Bytown	2019-10-01	\N
2	cc6890e5577792d6ffb328e71bfa692a	2021-02-21 09:33:22.614014	2021-02-21 09:33:22.614014	The Open 2020	online	2019-10-01	2019-12-01
\.


--
-- Data for Name: registrations; Type: TABLE DATA; Schema: public; Owner: aforward
--

COPY public.registrations (id, identifier, created, modified, athlete_id, competition_id, age, gender) FROM stdin;
1	92bb5223a80e090ba0499402c2e420e9	2021-02-21 09:33:22.614725	2021-02-21 09:33:22.614725	1	1	40	m
2	047b16532b769fbe1b7df2a94efd55d6	2021-02-21 09:33:22.617109	2021-02-21 09:33:22.617109	2	1	40	f
3	9b9c606ceebaf0db64a9fcaad91db3ff	2021-02-21 09:33:22.617596	2021-02-21 09:33:22.617596	3	1	10	m
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: aforward
--

COPY public.schema_migrations (migration, migrated_at) FROM stdin;
20200205100000-create-athletes.sql	2021-02-21 09:33:22.580603
20200206230000-create-migrations.sql	2021-02-21 09:33:22.580603
20200206230001-update-athletes.sql	2021-02-21 09:33:22.580603
20200206230002-create-competitions.sql	2021-02-21 09:33:22.580603
\.


--
-- Name: athletes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: aforward
--

SELECT pg_catalog.setval('public.athletes_id_seq', 4, true);


--
-- Name: competitions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: aforward
--

SELECT pg_catalog.setval('public.competitions_id_seq', 2, true);


--
-- Name: registrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: aforward
--

SELECT pg_catalog.setval('public.registrations_id_seq', 3, true);


--
-- Name: athletes athletes_identifier_key; Type: CONSTRAINT; Schema: public; Owner: aforward
--

ALTER TABLE ONLY public.athletes
    ADD CONSTRAINT athletes_identifier_key UNIQUE (identifier);


--
-- Name: athletes athletes_pkey; Type: CONSTRAINT; Schema: public; Owner: aforward
--

ALTER TABLE ONLY public.athletes
    ADD CONSTRAINT athletes_pkey PRIMARY KEY (id);


--
-- Name: competitions competitions_identifier_key; Type: CONSTRAINT; Schema: public; Owner: aforward
--

ALTER TABLE ONLY public.competitions
    ADD CONSTRAINT competitions_identifier_key UNIQUE (identifier);


--
-- Name: competitions competitions_pkey; Type: CONSTRAINT; Schema: public; Owner: aforward
--

ALTER TABLE ONLY public.competitions
    ADD CONSTRAINT competitions_pkey PRIMARY KEY (id);


--
-- Name: registrations registrations_athlete_id_competition_id_key; Type: CONSTRAINT; Schema: public; Owner: aforward
--

ALTER TABLE ONLY public.registrations
    ADD CONSTRAINT registrations_athlete_id_competition_id_key UNIQUE (athlete_id, competition_id);


--
-- Name: registrations registrations_identifier_key; Type: CONSTRAINT; Schema: public; Owner: aforward
--

ALTER TABLE ONLY public.registrations
    ADD CONSTRAINT registrations_identifier_key UNIQUE (identifier);


--
-- Name: registrations registrations_pkey; Type: CONSTRAINT; Schema: public; Owner: aforward
--

ALTER TABLE ONLY public.registrations
    ADD CONSTRAINT registrations_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: aforward
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (migration);


--
-- Name: registrations registrations_athlete_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: aforward
--

ALTER TABLE ONLY public.registrations
    ADD CONSTRAINT registrations_athlete_id_fkey FOREIGN KEY (athlete_id) REFERENCES public.athletes(id);


--
-- Name: registrations registrations_competition_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: aforward
--

ALTER TABLE ONLY public.registrations
    ADD CONSTRAINT registrations_competition_id_fkey FOREIGN KEY (competition_id) REFERENCES public.competitions(id);


--
-- PostgreSQL database dump complete
--

