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

ALTER TABLE IF EXISTS ONLY public.properties DROP CONSTRAINT IF EXISTS properties_type_id_fkey;
ALTER TABLE IF EXISTS ONLY public.properties DROP CONSTRAINT IF EXISTS properties_atomic_number_fkey;
ALTER TABLE IF EXISTS ONLY public.types DROP CONSTRAINT IF EXISTS types_type_key;
ALTER TABLE IF EXISTS ONLY public.types DROP CONSTRAINT IF EXISTS types_pkey;
ALTER TABLE IF EXISTS ONLY public.properties DROP CONSTRAINT IF EXISTS properties_pkey;
ALTER TABLE IF EXISTS ONLY public.properties DROP CONSTRAINT IF EXISTS properties_atomic_number_key;
ALTER TABLE IF EXISTS ONLY public.elements DROP CONSTRAINT IF EXISTS elements_symbol_key;
ALTER TABLE IF EXISTS ONLY public.elements DROP CONSTRAINT IF EXISTS elements_pkey;
ALTER TABLE IF EXISTS ONLY public.elements DROP CONSTRAINT IF EXISTS elements_name_key;
ALTER TABLE IF EXISTS ONLY public.elements DROP CONSTRAINT IF EXISTS elements_atomic_number_key;
DROP TABLE IF EXISTS public.types;
DROP TABLE IF EXISTS public.properties;
DROP TABLE IF EXISTS public.elements;
SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: elements; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.elements (
    atomic_number integer NOT NULL,
    symbol character varying(2) NOT NULL,
    name character varying(40) NOT NULL
);


--
-- Name: properties; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.properties (
    atomic_number integer NOT NULL,
    atomic_mass numeric NOT NULL,
    melting_point_celsius numeric NOT NULL,
    boiling_point_celsius numeric NOT NULL,
    type_id integer NOT NULL
);


--
-- Name: types; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.types (
    type_id integer NOT NULL,
    type character varying(20) NOT NULL
);


--
-- Data for Name: elements; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.elements (atomic_number, symbol, name) FROM stdin;
1	H	Hydrogen
2	He	Helium
3	Li	Lithium
4	Be	Beryllium
5	B	Boron
6	C	Carbon
7	N	Nitrogen
8	O	Oxygen
9	F	Fluorine
10	Ne	Neon
\.


--
-- Data for Name: properties; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.properties (atomic_number, atomic_mass, melting_point_celsius, boiling_point_celsius, type_id) FROM stdin;
1	1.008	-259.1	-252.9	2
2	4.0026	-272.2	-269	2
3	6.94	180.54	1342	1
4	9.0122	1287	2470	1
5	10.81	2075	4000	3
6	12.011	3550	4027	2
7	14.007	-210.1	-195.8	2
8	15.999	-218	-183	2
9	18.998	-220	-188.1	2
10	20.18	-248.6	-246.1	2
\.


--
-- Data for Name: types; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.types (type_id, type) FROM stdin;
1	metal
2	nonmetal
3	metalloid
\.


--
-- Name: elements elements_atomic_number_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.elements
    ADD CONSTRAINT elements_atomic_number_key UNIQUE (atomic_number);


--
-- Name: elements elements_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.elements
    ADD CONSTRAINT elements_name_key UNIQUE (name);


--
-- Name: elements elements_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.elements
    ADD CONSTRAINT elements_pkey PRIMARY KEY (atomic_number);


--
-- Name: elements elements_symbol_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.elements
    ADD CONSTRAINT elements_symbol_key UNIQUE (symbol);


--
-- Name: properties properties_atomic_number_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.properties
    ADD CONSTRAINT properties_atomic_number_key UNIQUE (atomic_number);


--
-- Name: properties properties_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.properties
    ADD CONSTRAINT properties_pkey PRIMARY KEY (atomic_number);


--
-- Name: types types_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.types
    ADD CONSTRAINT types_pkey PRIMARY KEY (type_id);


--
-- Name: types types_type_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.types
    ADD CONSTRAINT types_type_key UNIQUE (type);


--
-- Name: properties properties_atomic_number_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.properties
    ADD CONSTRAINT properties_atomic_number_fkey FOREIGN KEY (atomic_number) REFERENCES public.elements(atomic_number);


--
-- Name: properties properties_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.properties
    ADD CONSTRAINT properties_type_id_fkey FOREIGN KEY (type_id) REFERENCES public.types(type_id);


--
-- PostgreSQL database dump complete
--

