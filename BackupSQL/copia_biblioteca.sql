--
-- PostgreSQL database dump
--

-- Dumped from database version 12.4
-- Dumped by pg_dump version 12.4

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
-- Name: pg_trgm; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_trgm WITH SCHEMA public;


--
-- Name: EXTENSION pg_trgm; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_trgm IS 'text similarity measurement and index searching based on trigrams';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: Persona; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Persona" (
    id integer NOT NULL,
    full_name character varying(50) NOT NULL,
    pais character varying(30) NOT NULL,
    pasaporte character varying(50) NOT NULL,
    edad integer NOT NULL,
    apelativo character varying(10) NOT NULL,
    CONSTRAINT edad_mayor_18 CHECK ((edad >= 18))
);


ALTER TABLE public."Persona" OWNER TO postgres;

--
-- Name: Persona_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Persona_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Persona_id_seq" OWNER TO postgres;

--
-- Name: Persona_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Persona_id_seq" OWNED BY public."Persona".id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO postgres;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO postgres;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: autor_autor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.autor_autor (
    id integer NOT NULL,
    nombres character varying(50) NOT NULL,
    apellidos character varying(50) NOT NULL,
    nacionalidad character varying(20) NOT NULL,
    edad integer NOT NULL,
    CONSTRAINT autor_autor_edad_check CHECK ((edad >= 0))
);


ALTER TABLE public.autor_autor OWNER TO postgres;

--
-- Name: autor_autor_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.autor_autor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.autor_autor_id_seq OWNER TO postgres;

--
-- Name: autor_autor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.autor_autor_id_seq OWNED BY public.autor_autor.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Name: home_empleados; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.home_empleados (
    persona_ptr_id integer NOT NULL,
    empleo character varying(50) NOT NULL
);


ALTER TABLE public.home_empleados OWNER TO postgres;

--
-- Name: lector_lector; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lector_lector (
    id integer NOT NULL,
    nombres character varying(50) NOT NULL,
    apellidos character varying(50) NOT NULL,
    nacionalidad character varying(20) NOT NULL,
    edad integer NOT NULL,
    CONSTRAINT lector_lector_edad_check CHECK ((edad >= 0))
);


ALTER TABLE public.lector_lector OWNER TO postgres;

--
-- Name: lector_lector_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.lector_lector_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.lector_lector_id_seq OWNER TO postgres;

--
-- Name: lector_lector_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.lector_lector_id_seq OWNED BY public.lector_lector.id;


--
-- Name: lector_prestamo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lector_prestamo (
    id integer NOT NULL,
    fecha_prestamo date NOT NULL,
    fecha_devolucion date,
    devuelto boolean NOT NULL,
    lector_id integer NOT NULL,
    libro_id integer NOT NULL
);


ALTER TABLE public.lector_prestamo OWNER TO postgres;

--
-- Name: lector_prestamo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.lector_prestamo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.lector_prestamo_id_seq OWNER TO postgres;

--
-- Name: lector_prestamo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.lector_prestamo_id_seq OWNED BY public.lector_prestamo.id;


--
-- Name: libro_categoria; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.libro_categoria (
    id integer NOT NULL,
    nombre character varying(30) NOT NULL
);


ALTER TABLE public.libro_categoria OWNER TO postgres;

--
-- Name: libro_categoria_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.libro_categoria_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.libro_categoria_id_seq OWNER TO postgres;

--
-- Name: libro_categoria_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.libro_categoria_id_seq OWNED BY public.libro_categoria.id;


--
-- Name: libro_libro; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.libro_libro (
    id integer NOT NULL,
    titulo character varying(50) NOT NULL,
    fecha date NOT NULL,
    portada character varying(100),
    visitas integer,
    categoria_id integer NOT NULL,
    CONSTRAINT libro_libro_visitas_check CHECK ((visitas >= 0))
);


ALTER TABLE public.libro_libro OWNER TO postgres;

--
-- Name: libro_libro_autores; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.libro_libro_autores (
    id integer NOT NULL,
    libro_id integer NOT NULL,
    autor_id integer NOT NULL
);


ALTER TABLE public.libro_libro_autores OWNER TO postgres;

--
-- Name: libro_libro_autores_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.libro_libro_autores_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.libro_libro_autores_id_seq OWNER TO postgres;

--
-- Name: libro_libro_autores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.libro_libro_autores_id_seq OWNED BY public.libro_libro_autores.id;


--
-- Name: libro_libro_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.libro_libro_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.libro_libro_id_seq OWNER TO postgres;

--
-- Name: libro_libro_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.libro_libro_id_seq OWNED BY public.libro_libro.id;


--
-- Name: Persona id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Persona" ALTER COLUMN id SET DEFAULT nextval('public."Persona_id_seq"'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: autor_autor id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.autor_autor ALTER COLUMN id SET DEFAULT nextval('public.autor_autor_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: lector_lector id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lector_lector ALTER COLUMN id SET DEFAULT nextval('public.lector_lector_id_seq'::regclass);


--
-- Name: lector_prestamo id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lector_prestamo ALTER COLUMN id SET DEFAULT nextval('public.lector_prestamo_id_seq'::regclass);


--
-- Name: libro_categoria id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.libro_categoria ALTER COLUMN id SET DEFAULT nextval('public.libro_categoria_id_seq'::regclass);


--
-- Name: libro_libro id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.libro_libro ALTER COLUMN id SET DEFAULT nextval('public.libro_libro_id_seq'::regclass);


--
-- Name: libro_libro_autores id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.libro_libro_autores ALTER COLUMN id SET DEFAULT nextval('public.libro_libro_autores_id_seq'::regclass);


--
-- Data for Name: Persona; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Persona" (id, full_name, pais, pasaporte, edad, apelativo) FROM stdin;
2	Juan Perez	Mexico	100486285ER12	18	perez
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add autor	7	add_autor
26	Can change autor	7	change_autor
27	Can delete autor	7	delete_autor
28	Can view autor	7	view_autor
29	Can add categoria	8	add_categoria
30	Can change categoria	8	change_categoria
31	Can delete categoria	8	delete_categoria
32	Can view categoria	8	view_categoria
33	Can add libro	9	add_libro
34	Can change libro	9	change_libro
35	Can delete libro	9	delete_libro
36	Can view libro	9	view_libro
37	Can add prestamo	10	add_prestamo
38	Can change prestamo	10	change_prestamo
39	Can delete prestamo	10	delete_prestamo
40	Can view prestamo	10	view_prestamo
41	Can add lector	11	add_lector
42	Can change lector	11	change_lector
43	Can delete lector	11	delete_lector
44	Can view lector	11	view_lector
45	Can add Persona	12	add_persona
46	Can change Persona	12	change_persona
47	Can delete Persona	12	delete_persona
48	Can view Persona	12	view_persona
49	Can add empleados	13	add_empleados
50	Can change empleados	13	change_empleados
51	Can delete empleados	13	delete_empleados
52	Can view empleados	13	view_empleados
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$180000$HYncxDKlabVs$lu2vIgjtKu5lu95TarPnqCM5P9mhVSVDuEn63hQsQa8=	2021-03-11 20:10:40.180991-06	t	aaronga			arcan_diabdo@hotmail.com	t	t	2021-03-11 20:10:05.706019-06
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: autor_autor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.autor_autor (id, nombres, apellidos, nacionalidad, edad) FROM stdin;
1	Miguel	de Cervantes	Rumana	54
2	Marcel	Proust	Alemán	48
3	Homero	Homero	Británico	39
4	Franz	Kafka	Estadounidense	40
5	León	Tolstói	Ukraniana	67
6	Herman	Melville	Alemán	49
7	Antón	Chéjov	Hungría	49
8	Jorge Luis	Borges	Mexicana	47
9	Federico	García Lorca	Mexicana	35
10	Fiódor	Dostoievski	Rusa	67
11	Thomas	Mann	Estadounidense	69
12	Juan	Ruflo	Colobiana	70
13	James	Joyce	Británico	40
14	William	Faulkner	Húngara	29
15	Gustave	Flaubert	Rumana	42
16	Malcolm	Lowry	Estadounidense	31
17	Hermann	Broch	Canadiense	40
18	Michel	de Montaigne	Francesa	29
19	Vladimir	Nabokov	Rusa	68
20	Laurence	Sterne	Argentina	58
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2021-03-14 12:05:06.32668-06	1	Miguel - de Cervantes	1	[{"added": {}}]	7	1
2	2021-03-14 12:05:41.492692-06	2	Marcel - Proust	1	[{"added": {}}]	7	1
3	2021-03-14 12:06:14.616586-06	3	Homero - Homero	1	[{"added": {}}]	7	1
4	2021-03-14 12:06:38.734966-06	4	Franz - Kafka	1	[{"added": {}}]	7	1
5	2021-03-14 12:07:20.369347-06	5	León - Tolstói	1	[{"added": {}}]	7	1
6	2021-03-14 12:07:44.398722-06	6	Herman - Melville	1	[{"added": {}}]	7	1
7	2021-03-14 12:08:07.112021-06	7	Antón - Chéjov	1	[{"added": {}}]	7	1
8	2021-03-14 12:08:31.144395-06	8	Jorge Luis - Borges	1	[{"added": {}}]	7	1
9	2021-03-14 12:09:13.381811-06	9	Federico - García Lorca	1	[{"added": {}}]	7	1
10	2021-03-14 12:09:37.893213-06	10	Fiódor - Dostoievski	1	[{"added": {}}]	7	1
11	2021-03-14 12:09:58.413387-06	11	Thomas - Mann	1	[{"added": {}}]	7	1
12	2021-03-14 12:10:16.1254-06	12	Juan - Ruflo	1	[{"added": {}}]	7	1
13	2021-03-14 12:10:49.932334-06	13	James - Joyce	1	[{"added": {}}]	7	1
14	2021-03-14 12:11:14.229723-06	14	William - Faulkner	1	[{"added": {}}]	7	1
15	2021-03-14 12:11:37.25204-06	15	Gustave - Flaubert	1	[{"added": {}}]	7	1
16	2021-03-14 12:12:03.898564-06	16	Malcolm - Lowry	1	[{"added": {}}]	7	1
17	2021-03-14 12:12:27.200897-06	17	Hermann - Broch	1	[{"added": {}}]	7	1
18	2021-03-14 12:12:55.700527-06	18	Michel - de Montaigne	1	[{"added": {}}]	7	1
19	2021-03-14 12:13:36.990889-06	19	Vladimir - Nabokov	1	[{"added": {}}]	7	1
20	2021-03-14 12:14:11.861883-06	20	Laurence - Sterne	1	[{"added": {}}]	7	1
21	2021-03-14 13:48:10.219379-06	1	Suspenso	1	[{"added": {}}]	8	1
22	2021-03-14 13:48:14.727637-06	2	Novela	1	[{"added": {}}]	8	1
23	2021-03-14 13:48:25.471251-06	3	Ciencia ficción	1	[{"added": {}}]	8	1
24	2021-03-14 13:48:30.326529-06	4	Literatura	1	[{"added": {}}]	8	1
25	2021-03-14 13:48:37.665949-06	5	Terror	1	[{"added": {}}]	8	1
26	2021-03-14 13:48:45.182379-06	6	Comedia	1	[{"added": {}}]	8	1
27	2021-03-14 13:48:49.768641-06	7	Drama	1	[{"added": {}}]	8	1
28	2021-03-14 13:52:23.330856-06	1	Odisea	1	[{"added": {}}]	9	1
29	2021-03-14 13:53:07.502383-06	2	El proceso	1	[{"added": {}}]	9	1
30	2021-03-14 13:53:59.966383-06	3	Metamorfosis	1	[{"added": {}}]	9	1
31	2021-03-14 13:54:54.779518-06	4	Moby Dick	1	[{"added": {}}]	9	1
32	2021-03-14 13:55:35.135827-06	5	Ana Kerenina	1	[{"added": {}}]	9	1
33	2021-03-14 13:56:13.346012-06	6	Ficciones	1	[{"added": {}}]	9	1
34	2021-03-14 13:57:06.894075-06	7	Crimen y Castigo	1	[{"added": {}}]	9	1
35	2021-03-15 12:13:40.028455-06	8	8 | La Prueba de Fuego	1	[{"added": {}}]	9	1
36	2021-03-15 12:56:28.09434-06	1	Aaron	1	[{"added": {}}]	11	1
37	2021-03-15 12:56:47.514451-06	2	Saray	1	[{"added": {}}]	11	1
38	2021-03-15 12:57:01.441247-06	3	Miss	1	[{"added": {}}]	11	1
39	2021-03-15 12:57:21.375388-06	4	Mopochi	1	[{"added": {}}]	11	1
40	2021-03-15 12:57:40.937506-06	5	Ziupochi	1	[{"added": {}}]	11	1
41	2021-03-15 12:58:06.112946-06	6	Dulce	1	[{"added": {}}]	11	1
42	2021-03-15 12:58:35.993655-06	1	**Metamorfosis**	1	[{"added": {}}]	10	1
43	2021-03-15 12:58:47.851334-06	2	**Metamorfosis**	1	[{"added": {}}]	10	1
44	2021-03-15 12:59:02.492171-06	3	**Odisea**	1	[{"added": {}}]	10	1
45	2021-03-15 12:59:19.279131-06	4	**Odisea**	1	[{"added": {}}]	10	1
46	2021-03-15 12:59:34.348993-06	5	**Ficciones**	1	[{"added": {}}]	10	1
47	2021-03-16 13:10:17.348043-06	2	Juan Perez	1	[{"added": {}}]	12	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	autor	autor
8	libro	categoria
9	libro	libro
10	lector	prestamo
11	lector	lector
12	home	persona
13	home	empleados
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2021-03-11 20:08:49.366653-06
2	auth	0001_initial	2021-03-11 20:08:49.84568-06
3	admin	0001_initial	2021-03-11 20:08:51.229759-06
4	admin	0002_logentry_remove_auto_add	2021-03-11 20:08:51.299763-06
5	admin	0003_logentry_add_action_flag_choices	2021-03-11 20:08:51.309764-06
6	contenttypes	0002_remove_content_type_name	2021-03-11 20:08:51.41577-06
7	auth	0002_alter_permission_name_max_length	2021-03-11 20:08:51.42277-06
8	auth	0003_alter_user_email_max_length	2021-03-11 20:08:51.467773-06
9	auth	0004_alter_user_username_opts	2021-03-11 20:08:51.479774-06
10	auth	0005_alter_user_last_login_null	2021-03-11 20:08:51.489774-06
11	auth	0006_require_contenttypes_0002	2021-03-11 20:08:51.492774-06
12	auth	0007_alter_validators_add_error_messages	2021-03-11 20:08:51.502775-06
13	auth	0008_alter_user_username_max_length	2021-03-11 20:08:51.59678-06
14	auth	0009_alter_user_last_name_max_length	2021-03-11 20:08:51.609781-06
15	auth	0010_alter_group_name_max_length	2021-03-11 20:08:51.620782-06
16	auth	0011_update_proxy_permissions	2021-03-11 20:08:51.630782-06
17	sessions	0001_initial	2021-03-11 20:08:51.76679-06
18	autor	0001_initial	2021-03-14 11:43:42.813268-06
19	libro	0001_initial	2021-03-14 11:43:43.20529-06
20	lector	0001_initial	2021-03-14 11:43:43.781323-06
21	libro	0002_auto_20210314_1450	2021-03-14 13:50:31.893482-06
22	libro	0003_auto_20210314_1451	2021-03-14 13:51:41.79448-06
23	libro	0004_auto_20210315_1238	2021-03-15 11:39:01.264557-06
24	lector	0002_auto_20210315_1351	2021-03-15 12:51:25.514033-06
25	home	0001_initial	2021-03-16 13:03:26.78656-06
26	libro	0005_auto_20210316_1403	2021-03-16 13:03:26.947569-06
27	home	0002_auto_20210316_1408	2021-03-16 13:08:10.784804-06
28	home	0003_empleados	2021-03-16 13:14:08.706276-06
29	autor	0002_auto_20210316_1422	2021-03-16 13:23:54.440778-06
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
58y2oboguvg1ycqk33vranghw63pgm7x	NDE1N2Q0MzJiMjY1NTM2OTU4MTkyNjRjMTlhM2MyY2NmMjgzOGQxZjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2ZTJkMmUxMGQzNTQxMTA2YWYyYmQxNWJmOTAwMDg3NDkwYTcyNDY1In0=	2021-03-25 19:10:40.188991-06
\.


--
-- Data for Name: home_empleados; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.home_empleados (persona_ptr_id, empleo) FROM stdin;
\.


--
-- Data for Name: lector_lector; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lector_lector (id, nombres, apellidos, nacionalidad, edad) FROM stdin;
1	Aaron	Juarez Acosta	Mexicana	25
2	Saray	Juarez Acosta	Mexicana	27
3	Miss	Chela	Estadounidense	45
4	Mopochi	Juarez	Rusa	20
5	Ziupochi	Juarez	Japonesa	17
6	Dulce	Salgado Quezada	Australiana	24
\.


--
-- Data for Name: lector_prestamo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lector_prestamo (id, fecha_prestamo, fecha_devolucion, devuelto, lector_id, libro_id) FROM stdin;
1	2021-03-15	2021-04-07	f	2	3
2	2021-03-15	2021-03-25	f	1	3
3	2021-03-01	2021-03-31	f	5	1
4	2021-03-11	2021-03-25	f	3	1
5	2021-03-01	2021-03-30	f	3	6
\.


--
-- Data for Name: libro_categoria; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.libro_categoria (id, nombre) FROM stdin;
1	Suspenso
2	Novela
3	Ciencia ficción
4	Literatura
5	Terror
6	Comedia
7	Drama
\.


--
-- Data for Name: libro_libro; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.libro_libro (id, titulo, fecha, portada, visitas, categoria_id) FROM stdin;
1	Odisea	1997-03-19		10	3
2	El proceso	1989-10-24		50	4
3	Metamorfosis	2001-08-20		104	4
4	Moby Dick	1970-02-02		95	2
5	Ana Kerenina	2010-03-20		39	3
6	Ficciones	2009-06-26		100	4
7	Crimen y Castigo	1993-06-27		46	7
8	La Prueba de Fuego	2021-03-01		13	5
\.


--
-- Data for Name: libro_libro_autores; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.libro_libro_autores (id, libro_id, autor_id) FROM stdin;
1	1	3
2	2	4
3	3	4
4	4	6
5	5	5
6	6	8
7	7	10
8	8	1
9	8	4
10	8	7
\.


--
-- Name: Persona_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Persona_id_seq"', 2, true);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 52, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: autor_autor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.autor_autor_id_seq', 20, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 47, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 13, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 29, true);


--
-- Name: lector_lector_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.lector_lector_id_seq', 6, true);


--
-- Name: lector_prestamo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.lector_prestamo_id_seq', 5, true);


--
-- Name: libro_categoria_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.libro_categoria_id_seq', 7, true);


--
-- Name: libro_libro_autores_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.libro_libro_autores_id_seq', 11, true);


--
-- Name: libro_libro_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.libro_libro_id_seq', 8, true);


--
-- Name: Persona Persona_pais_apelativo_a493d036_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Persona"
    ADD CONSTRAINT "Persona_pais_apelativo_a493d036_uniq" UNIQUE (pais, apelativo);


--
-- Name: Persona Persona_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Persona"
    ADD CONSTRAINT "Persona_pkey" PRIMARY KEY (id);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: autor_autor autor_autor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.autor_autor
    ADD CONSTRAINT autor_autor_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: home_empleados home_empleados_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.home_empleados
    ADD CONSTRAINT home_empleados_pkey PRIMARY KEY (persona_ptr_id);


--
-- Name: lector_lector lector_lector_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lector_lector
    ADD CONSTRAINT lector_lector_pkey PRIMARY KEY (id);


--
-- Name: lector_prestamo lector_prestamo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lector_prestamo
    ADD CONSTRAINT lector_prestamo_pkey PRIMARY KEY (id);


--
-- Name: libro_categoria libro_categoria_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.libro_categoria
    ADD CONSTRAINT libro_categoria_pkey PRIMARY KEY (id);


--
-- Name: libro_libro_autores libro_libro_autores_libro_id_autor_id_be0815cf_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.libro_libro_autores
    ADD CONSTRAINT libro_libro_autores_libro_id_autor_id_be0815cf_uniq UNIQUE (libro_id, autor_id);


--
-- Name: libro_libro_autores libro_libro_autores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.libro_libro_autores
    ADD CONSTRAINT libro_libro_autores_pkey PRIMARY KEY (id);


--
-- Name: libro_libro libro_libro_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.libro_libro
    ADD CONSTRAINT libro_libro_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: lector_prestamo_lector_id_a0108599; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX lector_prestamo_lector_id_a0108599 ON public.lector_prestamo USING btree (lector_id);


--
-- Name: lector_prestamo_libro_id_c94b640a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX lector_prestamo_libro_id_c94b640a ON public.lector_prestamo USING btree (libro_id);


--
-- Name: libro_libro_autores_autor_id_75c78bd2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX libro_libro_autores_autor_id_75c78bd2 ON public.libro_libro_autores USING btree (autor_id);


--
-- Name: libro_libro_autores_libro_id_f32f518c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX libro_libro_autores_libro_id_f32f518c ON public.libro_libro_autores USING btree (libro_id);


--
-- Name: libro_libro_categoria_id_5981495f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX libro_libro_categoria_id_5981495f ON public.libro_libro USING btree (categoria_id);


--
-- Name: libro_titulo_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX libro_titulo_idx ON public.libro_libro USING gin (titulo public.gin_trgm_ops);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_empleados home_empleados_persona_ptr_id_27de5a76_fk_Persona_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.home_empleados
    ADD CONSTRAINT "home_empleados_persona_ptr_id_27de5a76_fk_Persona_id" FOREIGN KEY (persona_ptr_id) REFERENCES public."Persona"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: lector_prestamo lector_prestamo_lector_id_a0108599_fk_lector_lector_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lector_prestamo
    ADD CONSTRAINT lector_prestamo_lector_id_a0108599_fk_lector_lector_id FOREIGN KEY (lector_id) REFERENCES public.lector_lector(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: lector_prestamo lector_prestamo_libro_id_c94b640a_fk_libro_libro_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lector_prestamo
    ADD CONSTRAINT lector_prestamo_libro_id_c94b640a_fk_libro_libro_id FOREIGN KEY (libro_id) REFERENCES public.libro_libro(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: libro_libro_autores libro_libro_autores_autor_id_75c78bd2_fk_autor_autor_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.libro_libro_autores
    ADD CONSTRAINT libro_libro_autores_autor_id_75c78bd2_fk_autor_autor_id FOREIGN KEY (autor_id) REFERENCES public.autor_autor(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: libro_libro_autores libro_libro_autores_libro_id_f32f518c_fk_libro_libro_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.libro_libro_autores
    ADD CONSTRAINT libro_libro_autores_libro_id_f32f518c_fk_libro_libro_id FOREIGN KEY (libro_id) REFERENCES public.libro_libro(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: libro_libro libro_libro_categoria_id_5981495f_fk_libro_categoria_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.libro_libro
    ADD CONSTRAINT libro_libro_categoria_id_5981495f_fk_libro_categoria_id FOREIGN KEY (categoria_id) REFERENCES public.libro_categoria(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

