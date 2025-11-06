--
-- PostgreSQL database dump
--

\restrict fsRswJdlIGl0769SfAXAmgSQg7zHZq12TxcTATYz7526mPDkm4wrzvG8Nbaa34h

-- Dumped from database version 15.14
-- Dumped by pg_dump version 15.14

-- Started on 2025-11-06 10:32:02

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
-- TOC entry 215 (class 1259 OID 24710)
-- Name: departments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.departments (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    location character varying(100)
);


ALTER TABLE public.departments OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 24709)
-- Name: departments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.departments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.departments_id_seq OWNER TO postgres;

--
-- TOC entry 3357 (class 0 OID 0)
-- Dependencies: 214
-- Name: departments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.departments_id_seq OWNED BY public.departments.id;


--
-- TOC entry 220 (class 1259 OID 24740)
-- Name: employee_projects; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employee_projects (
    employee_id integer NOT NULL,
    project_id integer NOT NULL,
    hours_worked numeric(5,2),
    assignment_date date DEFAULT CURRENT_DATE
);


ALTER TABLE public.employee_projects OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 24717)
-- Name: employees; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employees (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    salary numeric(10,2),
    department_id integer,
    hire_date date
);


ALTER TABLE public.employees OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 24716)
-- Name: employees_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.employees_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.employees_id_seq OWNER TO postgres;

--
-- TOC entry 3358 (class 0 OID 0)
-- Dependencies: 216
-- Name: employees_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.employees_id_seq OWNED BY public.employees.id;


--
-- TOC entry 219 (class 1259 OID 24729)
-- Name: projects; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.projects (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    budget numeric(15,2),
    department_id integer
);


ALTER TABLE public.projects OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 24728)
-- Name: projects_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.projects_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.projects_id_seq OWNER TO postgres;

--
-- TOC entry 3359 (class 0 OID 0)
-- Dependencies: 218
-- Name: projects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.projects_id_seq OWNED BY public.projects.id;


--
-- TOC entry 3187 (class 2604 OID 24713)
-- Name: departments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departments ALTER COLUMN id SET DEFAULT nextval('public.departments_id_seq'::regclass);


--
-- TOC entry 3188 (class 2604 OID 24720)
-- Name: employees id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees ALTER COLUMN id SET DEFAULT nextval('public.employees_id_seq'::regclass);


--
-- TOC entry 3189 (class 2604 OID 24732)
-- Name: projects id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects ALTER COLUMN id SET DEFAULT nextval('public.projects_id_seq'::regclass);


--
-- TOC entry 3346 (class 0 OID 24710)
-- Dependencies: 215
-- Data for Name: departments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.departments (id, name, location) FROM stdin;
1	IT	Jakarta
2	HR	Bandung
3	Finance	Surabaya
4	Marketing	Medan
5	Operations	Yogyakarta
\.


--
-- TOC entry 3351 (class 0 OID 24740)
-- Dependencies: 220
-- Data for Name: employee_projects; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.employee_projects (employee_id, project_id, hours_worked, assignment_date) FROM stdin;
1	1	120.50	2023-01-15
1	6	80.00	2023-02-01
2	1	95.50	2023-01-20
2	2	150.00	2023-02-15
3	3	200.00	2023-03-01
4	3	180.50	2023-03-05
5	4	220.00	2023-04-01
6	4	190.50	2023-04-05
7	5	175.00	2023-05-01
8	5	160.50	2023-05-10
9	2	140.00	2023-06-01
9	6	90.50	2023-06-15
10	4	210.00	2023-07-01
11	7	100.00	2023-07-15
12	8	180.00	2023-08-01
\.


--
-- TOC entry 3348 (class 0 OID 24717)
-- Dependencies: 217
-- Data for Name: employees; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.employees (id, name, salary, department_id, hire_date) FROM stdin;
1	Budi Santoso	8000000.00	1	2022-01-15
2	Siti Rahayu	7500000.00	1	2022-03-20
3	Ahmad Fauzi	9000000.00	2	2022-11-10
4	Dewi Anggraini	8500000.00	2	2022-02-28
5	Rudi Hermawan	9500000.00	3	2022-08-05
6	Maya Sari	8800000.00	3	2022-04-15
7	Hendra Pratama	8200000.00	4	2022-05-20
8	Lina Marlina	7800000.00	4	2022-06-10
9	Joko Widodo	9200000.00	5	2021-12-01
10	Ratna Dewi	8700000.00	3	2022-03-15
11	Fajar Nugroho	0.00	\N	2023-01-01
12	Bambang Sutoyo	6500000.00	5	2022-07-01
\.


--
-- TOC entry 3350 (class 0 OID 24729)
-- Dependencies: 219
-- Data for Name: projects; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.projects (id, name, budget, department_id) FROM stdin;
1	Website Development	50000000.00	1
2	Mobile App	75000000.00	1
3	Recruitment System	30000000.00	2
4	Payroll System	45000000.00	3
5	Marketing Campaign	6000000.00	4
6	Database Migration	35000000.00	1
7	Inventory System	40000000.00	\N
8	CRM Implementation	55000000.00	5
\.


--
-- TOC entry 3360 (class 0 OID 0)
-- Dependencies: 214
-- Name: departments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.departments_id_seq', 5, true);


--
-- TOC entry 3361 (class 0 OID 0)
-- Dependencies: 216
-- Name: employees_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.employees_id_seq', 12, true);


--
-- TOC entry 3362 (class 0 OID 0)
-- Dependencies: 218
-- Name: projects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.projects_id_seq', 8, true);


--
-- TOC entry 3192 (class 2606 OID 24715)
-- Name: departments departments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departments
    ADD CONSTRAINT departments_pkey PRIMARY KEY (id);


--
-- TOC entry 3198 (class 2606 OID 24745)
-- Name: employee_projects employee_projects_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_projects
    ADD CONSTRAINT employee_projects_pkey PRIMARY KEY (employee_id, project_id);


--
-- TOC entry 3194 (class 2606 OID 24722)
-- Name: employees employees_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (id);


--
-- TOC entry 3196 (class 2606 OID 24734)
-- Name: projects projects_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (id);


--
-- TOC entry 3201 (class 2606 OID 24746)
-- Name: employee_projects employee_projects_employee_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_projects
    ADD CONSTRAINT employee_projects_employee_id_fkey FOREIGN KEY (employee_id) REFERENCES public.employees(id);


--
-- TOC entry 3202 (class 2606 OID 24751)
-- Name: employee_projects employee_projects_project_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_projects
    ADD CONSTRAINT employee_projects_project_id_fkey FOREIGN KEY (project_id) REFERENCES public.projects(id);


--
-- TOC entry 3199 (class 2606 OID 24723)
-- Name: employees employees_department_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_department_id_fkey FOREIGN KEY (department_id) REFERENCES public.departments(id);


--
-- TOC entry 3200 (class 2606 OID 24735)
-- Name: projects projects_department_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_department_id_fkey FOREIGN KEY (department_id) REFERENCES public.departments(id);


-- Completed on 2025-11-06 10:32:03

--
-- PostgreSQL database dump complete
--

\unrestrict fsRswJdlIGl0769SfAXAmgSQg7zHZq12TxcTATYz7526mPDkm4wrzvG8Nbaa34h

