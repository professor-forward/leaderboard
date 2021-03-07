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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: athletes; Type: TABLE; Schema: public; Owner: aforward
--

CREATE TABLE public.athletes (
    id integer NOT NULL,
    identifier character varying(50),
    created timestamp without time zone,
    modified timestamp without time zone,
    name character varying(50),
    dob date,
    identified_gender character varying(6)
);


ALTER TABLE public.athletes OWNER TO aforward;

--
-- Data for Name: athletes; Type: TABLE DATA; Schema: public; Owner: aforward
--

COPY public.athletes (id, identifier, created, modified, name, dob, identified_gender) FROM stdin;
2	\N	\N	\N	Ayana	1998-06-11	F
1	\N	\N	\N	Andrew	1986-12-01	M
3	\N	\N	\N	Hayden	1996-07-24	M
4	\N	\N	\N	August	1999-09-09	M
\.


--
-- Name: athletes athletes_pkey; Type: CONSTRAINT; Schema: public; Owner: aforward
--

ALTER TABLE ONLY public.athletes
    ADD CONSTRAINT athletes_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

