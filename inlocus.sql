--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.14
-- Dumped by pg_dump version 9.5.14

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: applications; Type: TABLE; Schema: public; Owner: beaconstalk
--

CREATE TABLE public.applications (
    id integer NOT NULL,
    name character varying(255),
    "API_KEY" character varying(255),
    "API_SECRET" character varying(255),
    active boolean,
    cactive boolean,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.applications OWNER TO beaconstalk;

--
-- Name: applications_id_seq; Type: SEQUENCE; Schema: public; Owner: beaconstalk
--

CREATE SEQUENCE public.applications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.applications_id_seq OWNER TO beaconstalk;

--
-- Name: applications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: beaconstalk
--

ALTER SEQUENCE public.applications_id_seq OWNED BY public.applications.id;


--
-- Name: appusers; Type: TABLE; Schema: public; Owner: beaconstalk
--

CREATE TABLE public.appusers (
    id integer NOT NULL,
    "userId" character varying(255),
    "mobileNo" character varying(255),
    "emailId" character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "applicationId" integer,
    "deviceId" integer
);


ALTER TABLE public.appusers OWNER TO beaconstalk;

--
-- Name: appusers_id_seq; Type: SEQUENCE; Schema: public; Owner: beaconstalk
--

CREATE SEQUENCE public.appusers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.appusers_id_seq OWNER TO beaconstalk;

--
-- Name: appusers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: beaconstalk
--

ALTER SEQUENCE public.appusers_id_seq OWNED BY public.appusers.id;


--
-- Name: beacon_masters; Type: TABLE; Schema: public; Owner: beaconstalk
--

CREATE TABLE public.beacon_masters (
    id integer NOT NULL,
    major character varying(255),
    minor character varying(255),
    shortlink character varying(255),
    uuid character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "locationMasterId" integer
);


ALTER TABLE public.beacon_masters OWNER TO beaconstalk;

--
-- Name: beacon_masters_id_seq; Type: SEQUENCE; Schema: public; Owner: beaconstalk
--

CREATE SEQUENCE public.beacon_masters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.beacon_masters_id_seq OWNER TO beaconstalk;

--
-- Name: beacon_masters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: beaconstalk
--

ALTER SEQUENCE public.beacon_masters_id_seq OWNED BY public.beacon_masters.id;


--
-- Name: beacons; Type: TABLE; Schema: public; Owner: beaconstalk
--

CREATE TABLE public.beacons (
    id integer NOT NULL,
    major character varying(255),
    minor character varying(255),
    uuid character varying(255),
    rssi double precision,
    distance double precision,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "deviceId" integer
);


ALTER TABLE public.beacons OWNER TO beaconstalk;

--
-- Name: beacons_id_seq; Type: SEQUENCE; Schema: public; Owner: beaconstalk
--

CREATE SEQUENCE public.beacons_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.beacons_id_seq OWNER TO beaconstalk;

--
-- Name: beacons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: beaconstalk
--

ALTER SEQUENCE public.beacons_id_seq OWNED BY public.beacons.id;


--
-- Name: campaigns; Type: TABLE; Schema: public; Owner: beaconstalk
--

CREATE TABLE public.campaigns (
    id integer NOT NULL,
    name character varying(255),
    start_timestamp timestamp with time zone,
    end_timestamp timestamp with time zone,
    content character varying(255),
    action character varying(255),
    file character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "applicationId" integer,
    "locationMasterId" integer
);


ALTER TABLE public.campaigns OWNER TO beaconstalk;

--
-- Name: campaigns_id_seq; Type: SEQUENCE; Schema: public; Owner: beaconstalk
--

CREATE SEQUENCE public.campaigns_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.campaigns_id_seq OWNER TO beaconstalk;

--
-- Name: campaigns_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: beaconstalk
--

ALTER SEQUENCE public.campaigns_id_seq OWNED BY public.campaigns.id;


--
-- Name: devices; Type: TABLE; Schema: public; Owner: beaconstalk
--

CREATE TABLE public.devices (
    id integer NOT NULL,
    "IMEI" character varying(255),
    "GAID" character varying(255),
    "deviceId" character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.devices OWNER TO beaconstalk;

--
-- Name: devices_id_seq; Type: SEQUENCE; Schema: public; Owner: beaconstalk
--

CREATE SEQUENCE public.devices_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.devices_id_seq OWNER TO beaconstalk;

--
-- Name: devices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: beaconstalk
--

ALTER SEQUENCE public.devices_id_seq OWNED BY public.devices.id;


--
-- Name: geofences; Type: TABLE; Schema: public; Owner: beaconstalk
--

CREATE TABLE public.geofences (
    id integer NOT NULL,
    name character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "userId" integer NOT NULL
);


ALTER TABLE public.geofences OWNER TO beaconstalk;

--
-- Name: geofences_id_seq; Type: SEQUENCE; Schema: public; Owner: beaconstalk
--

CREATE SEQUENCE public.geofences_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.geofences_id_seq OWNER TO beaconstalk;

--
-- Name: geofences_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: beaconstalk
--

ALTER SEQUENCE public.geofences_id_seq OWNED BY public.geofences.id;


--
-- Name: geolocations; Type: TABLE; Schema: public; Owner: beaconstalk
--

CREATE TABLE public.geolocations (
    id integer NOT NULL,
    type character varying(255),
    latitude double precision,
    longitude double precision,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "userId" integer,
    "geofenceId" integer
);


ALTER TABLE public.geolocations OWNER TO beaconstalk;

--
-- Name: geolocations_id_seq; Type: SEQUENCE; Schema: public; Owner: beaconstalk
--

CREATE SEQUENCE public.geolocations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.geolocations_id_seq OWNER TO beaconstalk;

--
-- Name: geolocations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: beaconstalk
--

ALTER SEQUENCE public.geolocations_id_seq OWNED BY public.geolocations.id;


--
-- Name: location_masters; Type: TABLE; Schema: public; Owner: beaconstalk
--

CREATE TABLE public.location_masters (
    id integer NOT NULL,
    name character varying(255),
    type character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.location_masters OWNER TO beaconstalk;

--
-- Name: location_masters_id_seq; Type: SEQUENCE; Schema: public; Owner: beaconstalk
--

CREATE SEQUENCE public.location_masters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.location_masters_id_seq OWNER TO beaconstalk;

--
-- Name: location_masters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: beaconstalk
--

ALTER SEQUENCE public.location_masters_id_seq OWNED BY public.location_masters.id;


--
-- Name: locations; Type: TABLE; Schema: public; Owner: beaconstalk
--

CREATE TABLE public.locations (
    id integer NOT NULL,
    latitude double precision,
    longitude double precision,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "deviceId" integer
);


ALTER TABLE public.locations OWNER TO beaconstalk;

--
-- Name: locations_id_seq; Type: SEQUENCE; Schema: public; Owner: beaconstalk
--

CREATE SEQUENCE public.locations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.locations_id_seq OWNER TO beaconstalk;

--
-- Name: locations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: beaconstalk
--

ALTER SEQUENCE public.locations_id_seq OWNED BY public.locations.id;


--
-- Name: roles; Type: TABLE; Schema: public; Owner: beaconstalk
--

CREATE TABLE public.roles (
    id integer NOT NULL,
    superadmin boolean,
    appadmin boolean,
    appstaff boolean,
    advertiser boolean,
    active boolean,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "userId" integer
);


ALTER TABLE public.roles OWNER TO beaconstalk;

--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: beaconstalk
--

CREATE SEQUENCE public.roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.roles_id_seq OWNER TO beaconstalk;

--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: beaconstalk
--

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;


--
-- Name: tags; Type: TABLE; Schema: public; Owner: beaconstalk
--

CREATE TABLE public.tags (
    id integer NOT NULL,
    tag character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "beaconMasterId" integer
);


ALTER TABLE public.tags OWNER TO beaconstalk;

--
-- Name: tags_id_seq; Type: SEQUENCE; Schema: public; Owner: beaconstalk
--

CREATE SEQUENCE public.tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tags_id_seq OWNER TO beaconstalk;

--
-- Name: tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: beaconstalk
--

ALTER SEQUENCE public.tags_id_seq OWNED BY public.tags.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: beaconstalk
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(255),
    username character varying(255),
    email character varying(255),
    password character varying(255),
    active boolean,
    superadmin boolean,
    appadmin boolean,
    staff boolean,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "applicationId" integer
);


ALTER TABLE public.users OWNER TO beaconstalk;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: beaconstalk
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO beaconstalk;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: beaconstalk
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: wifis; Type: TABLE; Schema: public; Owner: beaconstalk
--

CREATE TABLE public.wifis (
    id integer NOT NULL,
    macid character varying(255),
    ssid character varying(255),
    rssi double precision,
    freq character varying(255),
    distance double precision,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "deviceId" integer
);


ALTER TABLE public.wifis OWNER TO beaconstalk;

--
-- Name: wifis_id_seq; Type: SEQUENCE; Schema: public; Owner: beaconstalk
--

CREATE SEQUENCE public.wifis_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wifis_id_seq OWNER TO beaconstalk;

--
-- Name: wifis_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: beaconstalk
--

ALTER SEQUENCE public.wifis_id_seq OWNED BY public.wifis.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: beaconstalk
--

ALTER TABLE ONLY public.applications ALTER COLUMN id SET DEFAULT nextval('public.applications_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: beaconstalk
--

ALTER TABLE ONLY public.appusers ALTER COLUMN id SET DEFAULT nextval('public.appusers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: beaconstalk
--

ALTER TABLE ONLY public.beacon_masters ALTER COLUMN id SET DEFAULT nextval('public.beacon_masters_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: beaconstalk
--

ALTER TABLE ONLY public.beacons ALTER COLUMN id SET DEFAULT nextval('public.beacons_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: beaconstalk
--

ALTER TABLE ONLY public.campaigns ALTER COLUMN id SET DEFAULT nextval('public.campaigns_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: beaconstalk
--

ALTER TABLE ONLY public.devices ALTER COLUMN id SET DEFAULT nextval('public.devices_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: beaconstalk
--

ALTER TABLE ONLY public.geofences ALTER COLUMN id SET DEFAULT nextval('public.geofences_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: beaconstalk
--

ALTER TABLE ONLY public.geolocations ALTER COLUMN id SET DEFAULT nextval('public.geolocations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: beaconstalk
--

ALTER TABLE ONLY public.location_masters ALTER COLUMN id SET DEFAULT nextval('public.location_masters_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: beaconstalk
--

ALTER TABLE ONLY public.locations ALTER COLUMN id SET DEFAULT nextval('public.locations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: beaconstalk
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: beaconstalk
--

ALTER TABLE ONLY public.tags ALTER COLUMN id SET DEFAULT nextval('public.tags_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: beaconstalk
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: beaconstalk
--

ALTER TABLE ONLY public.wifis ALTER COLUMN id SET DEFAULT nextval('public.wifis_id_seq'::regclass);


--
-- Data for Name: applications; Type: TABLE DATA; Schema: public; Owner: beaconstalk
--

COPY public.applications (id, name, "API_KEY", "API_SECRET", active, cactive, "createdAt", "updatedAt") FROM stdin;
2	DCB Bank	0V4VMXP-WQJ497N-Q17SBTS-99KXYVK	06c9ba76-e5e4-449e-b84f-95eb4a67df6e	t	t	2019-03-07 13:43:33.081+05:30	2019-03-07 13:43:45.501+05:30
1	inLocus	KHK9J4K-AGQ4BY7-K94B4G8-WQTFWGJ	9c669912-542e-45f8-9a48-b241e5f4fe42	t	t	2019-03-06 12:04:38.289+05:30	2019-03-06 12:04:38.289+05:30
3	BookMyShow	KHK9J42-AGQ4BY7-K94B4G8-WQTFWGJ	9c6699K2-542e-45f8-9a48-b241e5f4fe42	t	t	2019-03-06 12:04:38.289+05:30	2019-03-06 12:04:38.289+05:30
\.


--
-- Name: applications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: beaconstalk
--

SELECT pg_catalog.setval('public.applications_id_seq', 3, true);


--
-- Data for Name: appusers; Type: TABLE DATA; Schema: public; Owner: beaconstalk
--

COPY public.appusers (id, "userId", "mobileNo", "emailId", "createdAt", "updatedAt", "applicationId", "deviceId") FROM stdin;
2	10	352724070870919	SM-G361H.com	2019-03-07 12:29:03.876+05:30	2019-03-07 12:29:03.876+05:30	1	10
4	12	862103030598089	Redmi Note 4.com	2019-03-22 17:18:04.828+05:30	2019-03-22 17:18:04.828+05:30	1	12
5	14	358958067208139	Moto G (5) Plus.com	2019-03-25 17:38:24.602+05:30	2019-03-25 17:38:24.602+05:30	2	14
6	15	866409038498420	Mi A1.com	2019-04-02 14:03:17.85+05:30	2019-04-02 14:03:17.85+05:30	2	15
7	TESTINGUSERID	9787464656	lol@Lol.com	2019-04-03 11:49:06.233+05:30	2019-04-03 11:49:06.233+05:30	2	16
8	17	866407030548085	MI MAX 2.com	2019-04-10 13:00:58.707+05:30	2019-04-10 13:00:58.707+05:30	2	17
\.


--
-- Name: appusers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: beaconstalk
--

SELECT pg_catalog.setval('public.appusers_id_seq', 8, true);


--
-- Data for Name: beacon_masters; Type: TABLE DATA; Schema: public; Owner: beaconstalk
--

COPY public.beacon_masters (id, major, minor, shortlink, uuid, "createdAt", "updatedAt", "locationMasterId") FROM stdin;
2	45755	23042	2CTI	f7826da6-4fa2-4e98-8024-bc5b71e0893e	2019-03-20 12:00:26.039+05:30	2019-03-20 12:00:26.039+05:30	4
3	9481	5743	0DRn	f7826da6-4fa2-4e98-8024-bc5b71e0893e 	2019-03-25 17:32:17.107+05:30	2019-03-25 17:32:17.107+05:30	4
4	590	34261	JOZ0	f7826da6-4fa2-4e98-8024-bc5b71e0893e 	2019-03-26 17:28:36.818+05:30	2019-03-26 17:28:36.818+05:30	4
1	36287	18995	Vlxj	f7826da6-4fa2-4e98-8024-bc5b71e0893e	2019-03-06 12:15:41.859+05:30	2019-03-06 12:15:41.859+05:30	4
\.


--
-- Name: beacon_masters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: beaconstalk
--

SELECT pg_catalog.setval('public.beacon_masters_id_seq', 4, true);


--
-- Data for Name: beacons; Type: TABLE DATA; Schema: public; Owner: beaconstalk
--

COPY public.beacons (id, major, minor, uuid, rssi, distance, "createdAt", "updatedAt", "deviceId") FROM stdin;
251	59400	29112	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-95	2	2019-03-25 17:40:33.444+05:30	2019-03-25 17:40:33.444+05:30	14
257	9481	5743	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-58	0	2019-03-25 17:49:41.795+05:30	2019-03-25 17:49:41.795+05:30	14
263	24066	30314	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-92	3	2019-03-25 18:01:18.082+05:30	2019-03-25 18:01:18.082+05:30	14
272	318	36323	b9407f30-f5f8-466e-aff9-25556b57fe6d	-78	1	2019-03-25 18:14:33.356+05:30	2019-03-25 18:14:33.356+05:30	12
278	46457	63216	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-71	0	2019-03-25 18:33:04.879+05:30	2019-03-25 18:33:04.879+05:30	12
285	318	36323	b9407f30-f5f8-466e-aff9-25556b57fe6d	-85	2	2019-03-25 19:05:44.243+05:30	2019-03-25 19:05:44.243+05:30	12
292	22054	39580	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-80	1	2019-03-25 19:17:01.491+05:30	2019-03-25 19:17:01.491+05:30	12
298	38844	60555	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-89	2	2019-03-25 19:24:40.665+05:30	2019-03-25 19:24:40.665+05:30	14
304	36287	18995	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-96	0	2019-03-25 20:18:12.467+05:30	2019-03-25 20:18:12.467+05:30	14
311	9481	5743	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-78	1	2019-03-25 20:30:44.863+05:30	2019-03-25 20:30:44.863+05:30	14
317	36287	18995	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-105	0	2019-03-25 23:45:41.202+05:30	2019-03-25 23:45:41.202+05:30	14
325	37885	17221	b9407f30-f5f8-466e-aff9-25556b57fe6d	-86	2	2019-03-26 15:17:44.543+05:30	2019-03-26 15:17:44.543+05:30	14
333	37885	17221	b9407f30-f5f8-466e-aff9-25556b57fe6d	-87	2	2019-04-02 14:09:27.176+05:30	2019-04-02 14:09:27.176+05:30	15
341	17984	15352	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-92	3	2019-04-02 14:20:46.787+05:30	2019-04-02 14:20:46.787+05:30	15
347	43966	62146	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-87	98	2019-04-03 11:06:39.231+05:30	2019-04-03 11:06:39.231+05:30	14
353	45014	34401	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-84	4	2019-04-03 11:35:41.428+05:30	2019-04-03 11:35:41.428+05:30	14
359	9481	5743	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-76	0	2019-04-03 11:46:47.211+05:30	2019-04-03 11:46:47.211+05:30	14
370	36287	18995	f7826da6-4fa2-4e98-8024-bc5b71e0893e	14845484	3	2019-04-03 11:56:08.098+05:30	2019-04-03 11:56:08.098+05:30	16
371	22054	39580	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-90	3	2019-04-03 11:56:08.305+05:30	2019-04-03 11:56:08.305+05:30	14
377	55777	56871	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-84	1	2019-04-03 12:06:10.332+05:30	2019-04-03 12:06:10.332+05:30	14
383	12990	25209	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-84	1	2019-04-03 12:22:52.908+05:30	2019-04-03 12:22:52.908+05:30	14
390	5193	25495	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-90	3	2019-04-03 12:36:48.283+05:30	2019-04-03 12:36:48.283+05:30	14
397	36287	18995	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-75	0	2019-04-03 15:25:52.292+05:30	2019-04-03 15:25:52.292+05:30	14
403	22305	58311	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-76	0	2019-04-05 14:16:38.434+05:30	2019-04-05 14:16:38.434+05:30	15
415	318	36323	b9407f30-f5f8-466e-aff9-25556b57fe6d	-90	3	2019-04-05 15:10:32.18+05:30	2019-04-05 15:10:32.18+05:30	14
421	44889	57023	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-85	2	2019-04-08 12:54:03.972+05:30	2019-04-08 12:54:03.972+05:30	15
429	9481	5743	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-58	0	2019-04-08 13:19:44.061+05:30	2019-04-08 13:19:44.061+05:30	14
436	10577	18573	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-87	2	2019-04-08 14:03:11.314+05:30	2019-04-08 14:03:11.314+05:30	15
442	46358	19727	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-76	0	2019-04-08 18:12:29.428+05:30	2019-04-08 18:12:29.428+05:30	14
451	318	36323	b9407f30-f5f8-466e-aff9-25556b57fe6d	-98	6	2019-04-10 15:26:02.091+05:30	2019-04-10 15:26:02.091+05:30	17
457	61925	17177	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-84	1	2019-04-11 11:47:47.062+05:30	2019-04-11 11:47:47.062+05:30	14
465	55022	43108	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-96	5	2019-04-11 12:00:36.712+05:30	2019-04-11 12:00:36.712+05:30	14
466	37885	17221	b9407f30-f5f8-466e-aff9-25556b57fe6d	-97	6	2019-04-11 12:00:36.894+05:30	2019-04-11 12:00:36.894+05:30	14
472	32251	27897	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-82	1	2019-04-11 12:15:16.688+05:30	2019-04-11 12:15:16.688+05:30	14
481	45014	34401	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-79	2	2019-04-11 12:47:44.414+05:30	2019-04-11 12:47:44.414+05:30	14
482	45828	35151	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-86	2	2019-04-11 12:47:44.878+05:30	2019-04-11 12:47:44.878+05:30	14
488	318	36323	b9407f30-f5f8-466e-aff9-25556b57fe6d	-92	4	2019-04-11 17:11:27.437+05:30	2019-04-11 17:11:27.437+05:30	14
494	19490	65063	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-75	0	2019-04-11 17:18:59.012+05:30	2019-04-11 17:18:59.012+05:30	14
502	33455	5309	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-77	1	2019-04-11 17:27:03.13+05:30	2019-04-11 17:27:03.13+05:30	14
509	46284	14876	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-86	2	2019-04-11 17:57:26.694+05:30	2019-04-11 17:57:26.694+05:30	14
75	3010	54104	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-91	3	2019-03-07 10:02:26.557+05:30	2019-03-07 10:02:26.557+05:30	\N
252	65118	21120	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-86	2	2019-03-25 17:41:03.66+05:30	2019-03-25 17:41:03.66+05:30	14
258	9481	5743	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-65	0	2019-03-25 17:50:42.691+05:30	2019-03-25 17:50:42.691+05:30	14
264	8713	61271	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-84	1	2019-03-25 18:03:06.047+05:30	2019-03-25 18:03:06.047+05:30	14
273	53833	48842	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-67	0	2019-03-25 18:14:33.359+05:30	2019-03-25 18:14:33.359+05:30	12
279	22082	56546	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-85	2	2019-03-25 18:35:46.808+05:30	2019-03-25 18:35:46.808+05:30	14
281	36607	61222	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-82	1	2019-03-25 18:35:46.818+05:30	2019-03-25 18:35:46.818+05:30	14
286	12990	25209	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-81	1	2019-03-25 19:06:50.476+05:30	2019-03-25 19:06:50.476+05:30	12
293	318	36323	b9407f30-f5f8-466e-aff9-25556b57fe6d	-77	1	2019-03-25 19:19:11.841+05:30	2019-03-25 19:19:11.841+05:30	12
299	27641	63017	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-84	1	2019-03-25 19:24:40.669+05:30	2019-03-25 19:24:40.669+05:30	14
305	9481	5743	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-72	0	2019-03-25 20:20:52.419+05:30	2019-03-25 20:20:52.419+05:30	14
312	9481	5743	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-76	0	2019-03-25 20:31:15.121+05:30	2019-03-25 20:31:15.121+05:30	14
318	1361	13573	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-77	1	2019-03-26 15:08:10.659+05:30	2019-03-26 15:08:10.659+05:30	14
326	23563	11325	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-88	2	2019-03-26 15:17:44.548+05:30	2019-03-26 15:17:44.548+05:30	14
334	58571	399	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-78	1	2019-04-02 14:12:20.913+05:30	2019-04-02 14:12:20.913+05:30	15
335	58029	12078	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-95	0	2019-04-02 14:12:20.917+05:30	2019-04-02 14:12:20.917+05:30	15
342	37885	17221	b9407f30-f5f8-466e-aff9-25556b57fe6d	-90	3	2019-04-02 14:22:48.304+05:30	2019-04-02 14:22:48.304+05:30	15
348	2252	32136	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-98	5	2019-04-03 11:28:44.128+05:30	2019-04-03 11:28:44.128+05:30	14
354	33455	5309	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-86	2	2019-04-03 11:39:58.189+05:30	2019-04-03 11:39:58.189+05:30	14
360	39302	13340	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-84	1	2019-04-03 11:48:47.299+05:30	2019-04-03 11:48:47.299+05:30	14
361	43966	62146	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-85	77	2019-04-03 11:48:47.313+05:30	2019-04-03 11:48:47.313+05:30	14
362	25938	40145	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-81	1	2019-04-03 11:48:47.328+05:30	2019-04-03 11:48:47.328+05:30	14
372	46284	14876	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-88	2	2019-04-03 11:58:56.951+05:30	2019-04-03 11:58:56.951+05:30	14
378	44889	57023	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-85	2	2019-04-03 12:06:10.334+05:30	2019-04-03 12:06:10.334+05:30	14
384	25938	40145	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-80	1	2019-04-03 12:26:14.916+05:30	2019-04-03 12:26:14.916+05:30	15
391	2694	39225	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-86	2	2019-04-03 12:36:48.286+05:30	2019-04-03 12:36:48.286+05:30	14
398	36287	18995	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-77	0	2019-04-04 15:49:23.2+05:30	2019-04-04 15:49:23.2+05:30	14
404	58571	399	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-79	1	2019-04-05 14:52:42.342+05:30	2019-04-05 14:52:42.342+05:30	14
405	22054	39580	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-92	3	2019-04-05 14:52:42.694+05:30	2019-04-05 14:52:42.694+05:30	14
406	318	36323	b9407f30-f5f8-466e-aff9-25556b57fe6d	-95	5	2019-04-05 14:52:46.529+05:30	2019-04-05 14:52:46.529+05:30	15
416	55777	56871	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-78	0	2019-04-05 15:27:15.887+05:30	2019-04-05 15:27:15.887+05:30	14
422	318	36323	b9407f30-f5f8-466e-aff9-25556b57fe6d	-82	1	2019-04-08 12:54:33.101+05:30	2019-04-08 12:54:33.101+05:30	15
430	37885	17221	b9407f30-f5f8-466e-aff9-25556b57fe6d	-83	1	2019-04-08 13:24:42.803+05:30	2019-04-08 13:24:42.803+05:30	15
431	22305	58311	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-86	2	2019-04-08 13:24:42.808+05:30	2019-04-08 13:24:42.808+05:30	15
437	9481	5743	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-70	0	2019-04-08 14:17:31.274+05:30	2019-04-08 14:17:31.274+05:30	15
443	12990	25209	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-83	1	2019-04-10 13:01:35.925+05:30	2019-04-10 13:01:35.925+05:30	14
444	46358	19727	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-84	1	2019-04-10 13:01:35.986+05:30	2019-04-10 13:01:35.986+05:30	14
452	17984	15352	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-94	4	2019-04-10 15:26:31.993+05:30	2019-04-10 15:26:31.993+05:30	17
458	10577	18573	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-85	2	2019-04-11 11:48:17.154+05:30	2019-04-11 11:48:17.154+05:30	14
459	55022	43108	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-92	3	2019-04-11 11:48:17.492+05:30	2019-04-11 11:48:17.492+05:30	14
467	55777	56871	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-96	3	2019-04-11 12:02:20.67+05:30	2019-04-11 12:02:20.67+05:30	14
473	46358	19727	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-82	1	2019-04-11 12:16:17.537+05:30	2019-04-11 12:16:17.537+05:30	14
474	44889	57023	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-87	2	2019-04-11 12:16:17.661+05:30	2019-04-11 12:16:17.661+05:30	14
483	46358	19727	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-86	2	2019-04-11 13:25:06.132+05:30	2019-04-11 13:25:06.132+05:30	14
484	28503	54895	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-90	3	2019-04-11 13:25:08.414+05:30	2019-04-11 13:25:08.414+05:30	14
489	32251	27897	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-77	1	2019-04-11 17:12:47.519+05:30	2019-04-11 17:12:47.519+05:30	14
495	33455	5309	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-80	1	2019-04-11 17:23:20.067+05:30	2019-04-11 17:23:20.067+05:30	14
503	46358	19727	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-85	2	2019-04-11 17:28:59.922+05:30	2019-04-11 17:28:59.922+05:30	14
505	46284	14876	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-86	2	2019-04-11 17:28:59.933+05:30	2019-04-11 17:28:59.933+05:30	14
510	1381	28143	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-87	1	2019-04-16 07:41:23.997+05:30	2019-04-16 07:41:23.997+05:30	14
253	36287	18995	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-69	0	2019-03-25 17:42:05.664+05:30	2019-03-25 17:42:05.664+05:30	14
259	9481	5743	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-70	0	2019-03-25 17:53:22.218+05:30	2019-03-25 17:53:22.218+05:30	14
265	25938	40145	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-74	0	2019-03-25 18:03:37.717+05:30	2019-03-25 18:03:37.717+05:30	14
274	3010	54104	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-72	0	2019-03-25 18:15:07.971+05:30	2019-03-25 18:15:07.971+05:30	12
280	23563	11325	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-90	3	2019-03-25 18:35:46.817+05:30	2019-03-25 18:35:46.817+05:30	14
287	42231	39771	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-89	1	2019-03-25 19:08:50.626+05:30	2019-03-25 19:08:50.626+05:30	12
294	42975	50049	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-85	2	2019-03-25 19:20:41.886+05:30	2019-03-25 19:20:41.886+05:30	12
300	58571	399	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-96	5	2019-03-25 20:05:31.793+05:30	2019-03-25 20:05:31.793+05:30	14
306	36287	18995	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-94	0	2019-03-25 20:21:22.479+05:30	2019-03-25 20:21:22.479+05:30	14
307	9481	5743	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-70	0	2019-03-25 20:21:22.486+05:30	2019-03-25 20:21:22.486+05:30	14
313	45014	34401	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-98	13	2019-03-25 20:32:16.945+05:30	2019-03-25 20:32:16.945+05:30	14
319	58571	399	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-78	1	2019-03-26 15:09:41.428+05:30	2019-03-26 15:09:41.428+05:30	14
327	9481	5743	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-74	0	2019-03-26 15:46:12.137+05:30	2019-03-26 15:46:12.137+05:30	14
336	53833	48842	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-83	1	2019-04-02 14:15:00.269+05:30	2019-04-02 14:15:00.269+05:30	15
343	2694	39225	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-84	1	2019-04-02 14:29:04.145+05:30	2019-04-02 14:29:04.145+05:30	15
349	46358	19727	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-88	2	2019-04-03 11:30:17.76+05:30	2019-04-03 11:30:17.76+05:30	14
355	36287	18995	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-75	0	2019-04-03 11:41:37.458+05:30	2019-04-03 11:41:37.458+05:30	14
363	36287	18995	f7826da6-4fa2-4e98-8024-bc5b71e0893e	14845484	3	2019-04-03 11:50:37.574+05:30	2019-04-03 11:50:37.574+05:30	16
364	36287	18995	f7826da6-4fa2-4e98-8024-bc5b71e0893e	14845484	3	2019-04-03 11:50:44.035+05:30	2019-04-03 11:50:44.035+05:30	16
365	36287	18995	f7826da6-4fa2-4e98-8024-bc5b71e0893e	14845484	3	2019-04-03 11:50:44.921+05:30	2019-04-03 11:50:44.921+05:30	16
366	36287	18995	f7826da6-4fa2-4e98-8024-bc5b71e0893e	14845484	3	2019-04-03 11:50:45.591+05:30	2019-04-03 11:50:45.591+05:30	16
373	23563	11325	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-77	1	2019-04-03 11:59:36.776+05:30	2019-04-03 11:59:36.776+05:30	14
379	17984	15352	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-88	2	2019-04-03 12:06:40.014+05:30	2019-04-03 12:06:40.014+05:30	14
385	318	36323	b9407f30-f5f8-466e-aff9-25556b57fe6d	-89	3	2019-04-03 12:26:48.013+05:30	2019-04-03 12:26:48.013+05:30	15
386	55777	56871	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-88	1	2019-04-03 12:26:48.017+05:30	2019-04-03 12:26:48.017+05:30	15
392	24066	30314	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-96	5	2019-04-03 12:37:56.649+05:30	2019-04-03 12:37:56.649+05:30	14
393	32251	27897	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-84	1	2019-04-03 12:37:56.661+05:30	2019-04-03 12:37:56.661+05:30	14
399	59487	55111	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-94	0	2019-04-04 20:11:45.111+05:30	2019-04-04 20:11:45.111+05:30	15
407	53833	48842	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-84	1	2019-04-05 14:53:12.509+05:30	2019-04-05 14:53:12.509+05:30	14
408	58571	399	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-76	0	2019-04-05 14:53:12.552+05:30	2019-04-05 14:53:12.552+05:30	14
409	22054	39580	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-89	2	2019-04-05 14:53:12.568+05:30	2019-04-05 14:53:12.568+05:30	14
417	25938	40145	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-76	0	2019-04-05 15:59:26.968+05:30	2019-04-05 15:59:26.968+05:30	15
423	15072	4433	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-95	4	2019-04-08 12:55:32.394+05:30	2019-04-08 12:55:32.394+05:30	14
424	58571	399	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-80	1	2019-04-08 12:55:39.625+05:30	2019-04-08 12:55:39.625+05:30	15
432	61925	17177	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-81	1	2019-04-08 13:24:43.017+05:30	2019-04-08 13:24:43.017+05:30	15
438	58571	399	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-85	2	2019-04-08 14:47:08.291+05:30	2019-04-08 14:47:08.291+05:30	15
445	53833	48842	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-83	1	2019-04-10 13:02:19.567+05:30	2019-04-10 13:02:19.567+05:30	17
453	42975	50049	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-92	3	2019-04-10 17:25:27.154+05:30	2019-04-10 17:25:27.154+05:30	17
460	55022	43108	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-84	1	2019-04-11 11:49:27.793+05:30	2019-04-11 11:49:27.793+05:30	14
468	33455	5309	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-93	3	2019-04-11 12:05:00.601+05:30	2019-04-11 12:05:00.601+05:30	14
475	22082	56546	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-87	2	2019-04-11 12:18:57.955+05:30	2019-04-11 12:18:57.955+05:30	14
476	45014	34401	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-80	2	2019-04-11 12:18:57.966+05:30	2019-04-11 12:18:57.966+05:30	14
485	38844	60555	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-82	1	2019-04-11 17:06:58.903+05:30	2019-04-11 17:06:58.903+05:30	14
490	19490	65063	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-78	1	2019-04-11 17:14:59.894+05:30	2019-04-11 17:14:59.894+05:30	14
496	3010	54104	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-77	1	2019-04-11 17:24:55.318+05:30	2019-04-11 17:24:55.318+05:30	14
504	61761	33282	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-84	1	2019-04-11 17:28:59.923+05:30	2019-04-11 17:28:59.923+05:30	14
136	57441	7716	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-82	1	2019-03-07 12:38:35.811+05:30	2019-03-07 12:38:35.811+05:30	10
254	36287	18995	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-79	0	2019-03-25 17:44:54.226+05:30	2019-03-25 17:44:54.226+05:30	14
260	36287	18995	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-98	0	2019-03-25 17:55:07.77+05:30	2019-03-25 17:55:07.77+05:30	14
266	53833	48842	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-74	0	2019-03-25 18:04:36.738+05:30	2019-03-25 18:04:36.738+05:30	14
275	12990	25209	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-78	1	2019-03-25 18:16:11.342+05:30	2019-03-25 18:16:11.342+05:30	12
282	53833	48842	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-70	0	2019-03-25 18:37:58.361+05:30	2019-03-25 18:37:58.361+05:30	12
288	44889	57023	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-78	1	2019-03-25 19:13:40.896+05:30	2019-03-25 19:13:40.896+05:30	12
295	22305	58311	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-79	1	2019-03-25 19:21:12.066+05:30	2019-03-25 19:21:12.066+05:30	12
301	9481	5743	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-85	2	2019-03-25 20:06:11.048+05:30	2019-03-25 20:06:11.048+05:30	14
308	9481	5743	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-70	0	2019-03-25 20:22:23.385+05:30	2019-03-25 20:22:23.385+05:30	14
314	36287	18995	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-86	0	2019-03-25 20:35:05.48+05:30	2019-03-25 20:35:05.48+05:30	14
320	9481	5743	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-92	3	2019-03-26 15:10:06.273+05:30	2019-03-26 15:10:06.273+05:30	14
328	52990	19129	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-85	2	2019-03-26 16:19:10.696+05:30	2019-03-26 16:19:10.696+05:30	14
329	37885	17221	b9407f30-f5f8-466e-aff9-25556b57fe6d	-81	1	2019-03-26 16:19:10.699+05:30	2019-03-26 16:19:10.699+05:30	14
330	17984	15352	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-79	1	2019-03-26 16:19:10.782+05:30	2019-03-26 16:19:10.782+05:30	14
337	27641	63017	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-88	2	2019-04-02 14:17:37.467+05:30	2019-04-02 14:17:37.467+05:30	15
344	25938	40145	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-79	1	2019-04-02 14:46:53.972+05:30	2019-04-02 14:46:53.972+05:30	15
350	318	36323	b9407f30-f5f8-466e-aff9-25556b57fe6d	-90	3	2019-04-03 11:31:37.285+05:30	2019-04-03 11:31:37.285+05:30	14
356	23838	30118	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-82	1	2019-04-03 11:45:18.58+05:30	2019-04-03 11:45:18.58+05:30	14
367	62889	38604	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-86	2	2019-04-03 11:52:49.865+05:30	2019-04-03 11:52:49.865+05:30	14
374	46358	19727	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-87	2	2019-04-03 12:00:37.097+05:30	2019-04-03 12:00:37.097+05:30	14
380	36625	6820	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-87	2	2019-04-03 12:08:22.69+05:30	2019-04-03 12:08:22.69+05:30	14
387	36324	18069	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-90	3	2019-04-03 12:28:02.166+05:30	2019-04-03 12:28:02.166+05:30	15
394	57441	7716	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-84	1	2019-04-03 12:40:18.398+05:30	2019-04-03 12:40:18.398+05:30	14
400	10577	18573	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-76	0	2019-04-05 14:11:59.818+05:30	2019-04-05 14:11:59.818+05:30	15
410	9481	5743	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-70	0	2019-04-05 14:54:12.713+05:30	2019-04-05 14:54:12.713+05:30	14
418	65118	21120	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-93	3	2019-04-05 17:15:12.136+05:30	2019-04-05 17:15:12.136+05:30	14
425	1515	2869	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-83	1	2019-04-08 12:56:01.243+05:30	2019-04-08 12:56:01.243+05:30	14
426	45828	35151	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-79	1	2019-04-08 12:56:01.275+05:30	2019-04-08 12:56:01.275+05:30	14
433	5193	25495	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-81	1	2019-04-08 13:45:10.241+05:30	2019-04-08 13:45:10.241+05:30	15
439	2694	39225	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-90	3	2019-04-08 15:06:39.178+05:30	2019-04-08 15:06:39.178+05:30	15
446	10577	18573	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-94	4	2019-04-10 13:04:37.193+05:30	2019-04-10 13:04:37.193+05:30	17
447	42975	50049	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-97	5	2019-04-10 13:04:37.467+05:30	2019-04-10 13:04:37.467+05:30	17
454	46358	19727	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-87	2	2019-04-10 17:25:27.158+05:30	2019-04-10 17:25:27.158+05:30	17
461	32251	27897	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-82	1	2019-04-11 11:51:35.984+05:30	2019-04-11 11:51:35.984+05:30	14
462	24197	21728	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-83	1	2019-04-11 11:51:36.282+05:30	2019-04-11 11:51:36.282+05:30	14
469	34477	57156	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-96	5	2019-04-11 12:09:46.06+05:30	2019-04-11 12:09:46.06+05:30	14
477	52990	19129	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-88	2	2019-04-11 12:22:57.94+05:30	2019-04-11 12:22:57.94+05:30	14
478	19179	45059	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-81	1	2019-04-11 12:22:58.048+05:30	2019-04-11 12:22:58.048+05:30	14
491	12990	25209	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-83	1	2019-04-11 17:15:30.302+05:30	2019-04-11 17:15:30.302+05:30	14
492	58571	399	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-85	2	2019-04-11 17:15:30.307+05:30	2019-04-11 17:15:30.307+05:30	14
497	17984	15352	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-78	1	2019-04-11 17:25:25.472+05:30	2019-04-11 17:25:25.472+05:30	14
498	57966	55059	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-97	0	2019-04-11 17:25:25.478+05:30	2019-04-11 17:25:25.478+05:30	14
506	53833	48842	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-78	1	2019-04-11 17:32:58.356+05:30	2019-04-11 17:32:58.356+05:30	14
507	23563	11325	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-86	2	2019-04-11 17:32:58.357+05:30	2019-04-11 17:32:58.357+05:30	14
255	9481	5743	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-76	0	2019-03-25 17:46:39.767+05:30	2019-03-25 17:46:39.767+05:30	14
261	23838	30118	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-89	2	2019-03-25 17:57:31.97+05:30	2019-03-25 17:57:31.97+05:30	14
267	24197	21728	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-83	1	2019-03-25 18:07:16.963+05:30	2019-03-25 18:07:16.963+05:30	14
268	58571	399	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-78	1	2019-03-25 18:07:16.969+05:30	2019-03-25 18:07:16.969+05:30	14
276	38844	60555	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-84	1	2019-03-25 18:19:42.476+05:30	2019-03-25 18:19:42.476+05:30	14
283	3010	54104	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-79	1	2019-03-25 19:03:40.026+05:30	2019-03-25 19:03:40.026+05:30	12
289	37885	17221	b9407f30-f5f8-466e-aff9-25556b57fe6d	-83	1	2019-03-25 19:15:29.149+05:30	2019-03-25 19:15:29.149+05:30	12
290	34873	22039	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-82	1	2019-03-25 19:15:29.155+05:30	2019-03-25 19:15:29.155+05:30	12
296	19490	65063	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-78	1	2019-03-25 19:21:12.069+05:30	2019-03-25 19:21:12.069+05:30	12
302	9481	5743	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-59	0	2019-03-25 20:14:42.732+05:30	2019-03-25 20:14:42.732+05:30	14
309	9481	5743	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-69	0	2019-03-25 20:25:03.161+05:30	2019-03-25 20:25:03.161+05:30	14
315	9481	5743	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-70	0	2019-03-25 20:42:57.165+05:30	2019-03-25 20:42:57.165+05:30	14
321	8713	61271	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-98	5	2019-03-26 15:11:43.682+05:30	2019-03-26 15:11:43.682+05:30	14
331	12138	52472	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-89	2	2019-03-26 16:19:10.784+05:30	2019-03-26 16:19:10.784+05:30	14
338	23563	11325	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-72	0	2019-04-02 14:19:07.626+05:30	2019-04-02 14:19:07.626+05:30	15
345	12138	52472	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-92	3	2019-04-02 15:03:09.669+05:30	2019-04-02 15:03:09.669+05:30	15
351	22305	58311	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-87	2	2019-04-03 11:32:15.017+05:30	2019-04-03 11:32:15.017+05:30	14
357	9481	5743	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-81	1	2019-04-03 11:45:46.897+05:30	2019-04-03 11:45:46.897+05:30	14
368	36287	18995	f7826da6-4fa2-4e98-8024-bc5b71e0893e	14845484	3	2019-04-03 11:54:43.766+05:30	2019-04-03 11:54:43.766+05:30	16
375	2252	32136	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-95	4	2019-04-03 12:03:24.59+05:30	2019-04-03 12:03:24.59+05:30	14
381	12138	52472	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-89	2	2019-04-03 12:10:30.801+05:30	2019-04-03 12:10:30.801+05:30	14
388	33455	5309	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-86	2	2019-04-03 12:30:11.817+05:30	2019-04-03 12:30:11.817+05:30	15
395	44889	57023	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-79	1	2019-04-03 12:44:18.732+05:30	2019-04-03 12:44:18.732+05:30	14
401	55777	56871	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-80	0	2019-04-05 14:11:59.821+05:30	2019-04-05 14:11:59.821+05:30	15
411	318	36323	b9407f30-f5f8-466e-aff9-25556b57fe6d	-89	3	2019-04-05 14:56:57.943+05:30	2019-04-05 14:56:57.943+05:30	14
412	12990	25209	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-102	7	2019-04-05 14:56:58.888+05:30	2019-04-05 14:56:58.888+05:30	14
419	58082	34138	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-93	2	2019-04-05 19:29:13.615+05:30	2019-04-05 19:29:13.615+05:30	14
427	57441	7716	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-84	1	2019-04-08 12:57:01.403+05:30	2019-04-08 12:57:01.403+05:30	14
434	55777	56871	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-95	3	2019-04-08 13:56:54.796+05:30	2019-04-08 13:56:54.796+05:30	14
440	39302	13340	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-80	1	2019-04-08 15:38:40.034+05:30	2019-04-08 15:38:40.034+05:30	15
448	46358	19727	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-88	2	2019-04-10 13:05:12.225+05:30	2019-04-10 13:05:12.225+05:30	17
449	12138	52472	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-87	2	2019-04-10 13:05:12.424+05:30	2019-04-10 13:05:12.424+05:30	17
455	58082	34138	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-90	1	2019-04-11 10:16:11.71+05:30	2019-04-11 10:16:11.71+05:30	14
463	61925	17177	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-86	2	2019-04-11 11:55:46.761+05:30	2019-04-11 11:55:46.761+05:30	14
470	45014	34401	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-83	3	2019-04-11 12:12:59.392+05:30	2019-04-11 12:12:59.392+05:30	14
240	53833	48842	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-82	1	2019-03-22 17:20:05.083+05:30	2019-03-22 17:20:05.083+05:30	12
241	25938	40145	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-79	1	2019-03-22 17:20:52.789+05:30	2019-03-22 17:20:52.789+05:30	12
242	34477	57156	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-81	1	2019-03-22 17:22:30.664+05:30	2019-03-22 17:22:30.664+05:30	12
243	32251	27897	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-86	2	2019-03-22 17:24:45.818+05:30	2019-03-22 17:24:45.818+05:30	12
244	58571	399	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-68	0	2019-03-22 17:26:15.683+05:30	2019-03-22 17:26:15.683+05:30	12
245	28503	54895	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-83	1	2019-03-22 17:26:46.242+05:30	2019-03-22 17:26:46.242+05:30	12
246	55022	43108	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-86	2	2019-03-22 17:33:43.547+05:30	2019-03-22 17:33:43.547+05:30	12
247	46358	19727	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-78	1	2019-03-22 17:35:25.977+05:30	2019-03-22 17:35:25.977+05:30	12
248	55777	56871	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-92	2	2019-03-22 17:36:07.389+05:30	2019-03-22 17:36:07.389+05:30	12
249	34477	57156	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-93	3	2019-03-22 17:36:09.004+05:30	2019-03-22 17:36:09.004+05:30	12
250	24066	30314	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-86	2	2019-03-22 17:37:10.734+05:30	2019-03-22 17:37:10.734+05:30	12
1	53833	48842	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-80	1	2019-03-06 14:23:36.748+05:30	2019-03-06 14:23:36.748+05:30	\N
2	34477	57156	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-90	3	2019-03-06 14:24:37.04+05:30	2019-03-06 14:24:37.04+05:30	\N
3	25938	40145	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-87	2	2019-03-06 14:25:08.202+05:30	2019-03-06 14:25:08.202+05:30	\N
4	32251	27897	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-90	3	2019-03-06 14:25:08.203+05:30	2019-03-06 14:25:08.203+05:30	\N
5	34477	57156	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-92	3	2019-03-06 14:25:13.063+05:30	2019-03-06 14:25:13.063+05:30	\N
6	43966	62146	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-91	153	2019-03-06 14:26:08.063+05:30	2019-03-06 14:26:08.063+05:30	\N
7	25938	40145	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-82	1	2019-03-06 14:28:44.754+05:30	2019-03-06 14:28:44.754+05:30	\N
8	45014	34401	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-80	2	2019-03-06 14:32:56.46+05:30	2019-03-06 14:32:56.46+05:30	\N
9	19179	45059	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-87	2	2019-03-06 14:42:00.22+05:30	2019-03-06 14:42:00.22+05:30	\N
10	64521	20852	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-98	3	2019-03-06 14:46:31.308+05:30	2019-03-06 14:46:31.308+05:30	\N
12	15072	4433	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-90	3	2019-03-06 14:48:04.193+05:30	2019-03-06 14:48:04.193+05:30	\N
13	58571	399	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-90	3	2019-03-06 14:48:34.572+05:30	2019-03-06 14:48:34.572+05:30	\N
14	65118	21120	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-88	2	2019-03-06 14:49:35.077+05:30	2019-03-06 14:49:35.077+05:30	\N
20	318	36323	b9407f30-f5f8-466e-aff9-25556b57fe6d	-94	4	2019-03-06 14:57:06.228+05:30	2019-03-06 14:57:06.228+05:30	\N
21	2694	39225	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-86	2	2019-03-06 15:05:06.424+05:30	2019-03-06 15:05:06.424+05:30	\N
22	22054	39580	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-82	1	2019-03-06 15:05:06.43+05:30	2019-03-06 15:05:06.43+05:30	\N
23	36607	61222	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-94	4	2019-03-06 15:21:10.702+05:30	2019-03-06 15:21:10.702+05:30	\N
24	19179	45059	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-83	1	2019-03-06 15:21:11.032+05:30	2019-03-06 15:21:11.032+05:30	\N
25	46358	19727	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-91	3	2019-03-06 15:21:11.103+05:30	2019-03-06 15:21:11.103+05:30	\N
26	23563	11325	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-84	1	2019-03-06 15:54:18.387+05:30	2019-03-06 15:54:18.387+05:30	\N
27	12138	52472	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-95	4	2019-03-06 15:54:18.537+05:30	2019-03-06 15:54:18.537+05:30	\N
30	43966	62146	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-96	262	2019-03-06 16:31:29.182+05:30	2019-03-06 16:31:29.182+05:30	\N
31	1515	2869	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-87	2	2019-03-06 16:32:36.359+05:30	2019-03-06 16:32:36.359+05:30	\N
32	45828	35151	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-89	2	2019-03-06 16:33:59.957+05:30	2019-03-06 16:33:59.957+05:30	\N
33	23563	11325	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-84	1	2019-03-06 16:35:46.356+05:30	2019-03-06 16:35:46.356+05:30	\N
34	46457	63216	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-100	6	2019-03-06 16:36:16.698+05:30	2019-03-06 16:36:16.698+05:30	\N
35	41704	42796	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-82	1	2019-03-06 16:36:47.022+05:30	2019-03-06 16:36:47.022+05:30	\N
36	32251	27897	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-94	4	2019-03-06 16:39:37.146+05:30	2019-03-06 16:39:37.146+05:30	\N
37	36625	6820	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-95	4	2019-03-06 16:43:37.34+05:30	2019-03-06 16:43:37.34+05:30	\N
38	12990	25209	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-101	7	2019-03-06 16:43:37.346+05:30	2019-03-06 16:43:37.346+05:30	\N
39	65118	21120	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-94	4	2019-03-06 16:43:37.49+05:30	2019-03-06 16:43:37.49+05:30	\N
40	57441	7716	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-89	2	2019-03-06 16:51:58.511+05:30	2019-03-06 16:51:58.511+05:30	\N
41	45014	34401	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-86	5	2019-03-06 16:51:58.519+05:30	2019-03-06 16:51:58.519+05:30	\N
42	23563	11325	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-83	1	2019-03-06 17:08:01.657+05:30	2019-03-06 17:08:01.657+05:30	\N
43	55022	43108	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-97	5	2019-03-06 17:08:01.658+05:30	2019-03-06 17:08:01.658+05:30	\N
44	46358	19727	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-88	2	2019-03-06 17:08:01.673+05:30	2019-03-06 17:08:01.673+05:30	\N
45	58571	399	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-87	2	2019-03-06 17:08:01.685+05:30	2019-03-06 17:08:01.685+05:30	\N
46	37241	34483	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-82	1	2019-03-06 17:40:01.988+05:30	2019-03-06 17:40:01.988+05:30	\N
47	8713	61271	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-88	2	2019-03-06 17:40:02.292+05:30	2019-03-06 17:40:02.292+05:30	\N
48	36287	18995	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-99	0	2019-03-06 20:57:24.58+05:30	2019-03-06 20:57:24.58+05:30	\N
49	45014	34401	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-76	2	2019-03-07 09:34:09.572+05:30	2019-03-07 09:34:09.572+05:30	\N
50	23838	30118	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-86	2	2019-03-07 09:35:19.991+05:30	2019-03-07 09:35:19.991+05:30	\N
51	2694	39225	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-77	1	2019-03-07 09:35:19.998+05:30	2019-03-07 09:35:19.998+05:30	\N
52	41704	42796	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-78	1	2019-03-07 09:35:19.999+05:30	2019-03-07 09:35:19.999+05:30	\N
53	23563	11325	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-86	2	2019-03-07 09:35:20.036+05:30	2019-03-07 09:35:20.036+05:30	\N
54	17984	15352	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-80	1	2019-03-07 09:35:23.556+05:30	2019-03-07 09:35:23.556+05:30	\N
55	53833	48842	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-82	1	2019-03-07 09:35:50.311+05:30	2019-03-07 09:35:50.311+05:30	\N
56	36625	6820	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-82	1	2019-03-07 09:36:50.607+05:30	2019-03-07 09:36:50.607+05:30	\N
57	22305	58311	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-80	1	2019-03-07 09:36:50.61+05:30	2019-03-07 09:36:50.61+05:30	\N
58	19490	65063	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-90	3	2019-03-07 09:36:50.618+05:30	2019-03-07 09:36:50.618+05:30	\N
59	45828	35151	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-75	0	2019-03-07 09:36:54.325+05:30	2019-03-07 09:36:54.325+05:30	\N
60	17984	15352	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-81	1	2019-03-07 09:39:44.137+05:30	2019-03-07 09:39:44.137+05:30	\N
61	2252	32136	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-77	1	2019-03-07 09:39:44.141+05:30	2019-03-07 09:39:44.141+05:30	\N
62	2252	32136	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-77	1	2019-03-07 09:44:22.188+05:30	2019-03-07 09:44:22.188+05:30	\N
63	64521	20852	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-87	1	2019-03-07 09:44:22.191+05:30	2019-03-07 09:44:22.191+05:30	\N
64	23563	11325	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-85	2	2019-03-07 09:51:43.298+05:30	2019-03-07 09:51:43.298+05:30	\N
65	1515	2869	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-96	5	2019-03-07 09:52:13.347+05:30	2019-03-07 09:52:13.347+05:30	\N
66	53833	48842	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-82	1	2019-03-07 09:54:41.984+05:30	2019-03-07 09:54:41.984+05:30	\N
67	8713	61271	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-96	5	2019-03-07 09:54:41.988+05:30	2019-03-07 09:54:41.988+05:30	\N
68	53833	48842	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-82	1	2019-03-07 09:55:12.343+05:30	2019-03-07 09:55:12.343+05:30	\N
69	24197	21728	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-91	3	2019-03-07 09:56:22.494+05:30	2019-03-07 09:56:22.494+05:30	\N
70	33455	5309	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-94	4	2019-03-07 09:56:22.768+05:30	2019-03-07 09:56:22.768+05:30	\N
71	2694	39225	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-83	1	2019-03-07 09:58:35.595+05:30	2019-03-07 09:58:35.595+05:30	\N
72	12990	25209	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-90	3	2019-03-07 10:00:32.011+05:30	2019-03-07 10:00:32.011+05:30	\N
73	27641	63017	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-90	3	2019-03-07 10:00:37.487+05:30	2019-03-07 10:00:37.487+05:30	\N
74	27641	63017	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-78	1	2019-03-07 10:02:26.558+05:30	2019-03-07 10:02:26.558+05:30	\N
76	590	34261	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-68	0	2019-03-07 10:02:26.559+05:30	2019-03-07 10:02:26.559+05:30	\N
77	57441	7716	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-84	1	2019-03-07 10:03:07.596+05:30	2019-03-07 10:03:07.596+05:30	\N
78	23563	11325	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-90	3	2019-03-07 10:03:07.6+05:30	2019-03-07 10:03:07.6+05:30	\N
79	8713	61271	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-86	2	2019-03-07 10:04:07.444+05:30	2019-03-07 10:04:07.444+05:30	\N
80	58571	399	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-76	0	2019-03-07 10:04:07.57+05:30	2019-03-07 10:04:07.57+05:30	\N
81	37241	34483	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-80	1	2019-03-07 10:06:50.923+05:30	2019-03-07 10:06:50.923+05:30	\N
82	17984	15352	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-86	2	2019-03-07 10:09:45.151+05:30	2019-03-07 10:09:45.151+05:30	\N
83	17984	15352	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-84	1	2019-03-07 10:10:13.477+05:30	2019-03-07 10:10:13.477+05:30	\N
84	52990	19129	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-84	1	2019-03-07 10:10:13.482+05:30	2019-03-07 10:10:13.482+05:30	\N
85	46284	14876	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-87	2	2019-03-07 10:12:36.146+05:30	2019-03-07 10:12:36.146+05:30	\N
86	10577	18573	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-86	2	2019-03-07 10:12:36.151+05:30	2019-03-07 10:12:36.151+05:30	\N
87	46358	19727	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-83	1	2019-03-07 10:13:25.214+05:30	2019-03-07 10:13:25.214+05:30	\N
88	38844	60555	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-82	1	2019-03-07 10:14:45.182+05:30	2019-03-07 10:14:45.182+05:30	\N
89	12138	52472	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-98	5	2019-03-07 10:17:41.033+05:30	2019-03-07 10:17:41.033+05:30	\N
90	38844	60555	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-96	5	2019-03-07 10:21:41.867+05:30	2019-03-07 10:21:41.867+05:30	\N
91	59400	29112	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-101	3	2019-03-07 10:21:41.875+05:30	2019-03-07 10:21:41.875+05:30	\N
92	37885	17221	b9407f30-f5f8-466e-aff9-25556b57fe6d	-85	2	2019-03-07 10:27:42.961+05:30	2019-03-07 10:27:42.961+05:30	\N
93	590	34261	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-74	0	2019-03-07 10:28:12.948+05:30	2019-03-07 10:28:12.948+05:30	\N
94	12990	25209	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-84	1	2019-03-07 10:29:11.347+05:30	2019-03-07 10:29:11.347+05:30	\N
95	48557	7208	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-76	0	2019-03-07 10:31:51.424+05:30	2019-03-07 10:31:51.424+05:30	\N
96	57441	7716	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-79	1	2019-03-07 10:36:42.943+05:30	2019-03-07 10:36:42.943+05:30	\N
97	59400	29112	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-97	2	2019-03-07 10:44:44.829+05:30	2019-03-07 10:44:44.829+05:30	\N
98	590	34261	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-74	0	2019-03-07 11:00:53.198+05:30	2019-03-07 11:00:53.198+05:30	\N
99	39302	13340	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-81	1	2019-03-07 11:02:31.753+05:30	2019-03-07 11:02:31.753+05:30	\N
100	22305	58311	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-86	2	2019-03-07 11:02:31.758+05:30	2019-03-07 11:02:31.758+05:30	\N
101	38844	60555	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-83	1	2019-03-07 11:02:31.759+05:30	2019-03-07 11:02:31.759+05:30	\N
102	19179	45059	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-85	2	2019-03-07 11:03:00.552+05:30	2019-03-07 11:03:00.552+05:30	\N
103	37885	17221	b9407f30-f5f8-466e-aff9-25556b57fe6d	-86	2	2019-03-07 11:04:00.334+05:30	2019-03-07 11:04:00.334+05:30	\N
104	45014	34401	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-77	2	2019-03-07 11:06:00.676+05:30	2019-03-07 11:06:00.676+05:30	\N
105	65118	21120	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-91	3	2019-03-07 11:06:00.681+05:30	2019-03-07 11:06:00.681+05:30	\N
106	55022	43108	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-80	1	2019-03-07 11:07:41.801+05:30	2019-03-07 11:07:41.801+05:30	\N
107	55022	43108	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-85	2	2019-03-07 11:09:12.003+05:30	2019-03-07 11:09:12.003+05:30	\N
108	31702	52064	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-93	2	2019-03-07 11:11:13.887+05:30	2019-03-07 11:11:13.887+05:30	\N
109	52990	19129	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-87	2	2019-03-07 11:11:13.891+05:30	2019-03-07 11:11:13.891+05:30	\N
110	36625	6820	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-89	2	2019-03-07 11:11:45.658+05:30	2019-03-07 11:11:45.658+05:30	\N
111	53833	48842	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-78	1	2019-03-07 11:11:45.662+05:30	2019-03-07 11:11:45.662+05:30	\N
112	45014	34401	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-76	2	2019-03-07 11:12:55.524+05:30	2019-03-07 11:12:55.524+05:30	\N
113	46457	63216	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-84	1	2019-03-07 11:13:27.02+05:30	2019-03-07 11:13:27.02+05:30	\N
114	3010	54104	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-85	2	2019-03-07 11:16:01.77+05:30	2019-03-07 11:16:01.77+05:30	\N
115	28503	54895	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-78	1	2019-03-07 11:16:31.518+05:30	2019-03-07 11:16:31.518+05:30	\N
116	39302	13340	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-82	1	2019-03-07 11:16:31.519+05:30	2019-03-07 11:16:31.519+05:30	\N
117	24197	21728	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-79	1	2019-03-07 11:17:32.239+05:30	2019-03-07 11:17:32.239+05:30	\N
118	10577	18573	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-85	2	2019-03-07 11:19:31.892+05:30	2019-03-07 11:19:31.892+05:30	\N
119	61761	33282	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-93	3	2019-03-07 11:19:31.899+05:30	2019-03-07 11:19:31.899+05:30	\N
120	24197	21728	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-79	1	2019-03-07 11:23:31.907+05:30	2019-03-07 11:23:31.907+05:30	\N
121	1515	2869	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-88	2	2019-03-07 11:23:31.907+05:30	2019-03-07 11:23:31.907+05:30	\N
122	42231	39771	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-88	1	2019-03-07 11:23:31.908+05:30	2019-03-07 11:23:31.908+05:30	\N
123	590	34261	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-81	1	2019-03-07 11:30:55.39+05:30	2019-03-07 11:30:55.39+05:30	\N
124	590	34261	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-70	0	2019-03-07 11:31:29.549+05:30	2019-03-07 11:31:29.549+05:30	\N
125	590	34261	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-79	1	2019-03-07 11:32:29.456+05:30	2019-03-07 11:32:29.456+05:30	\N
126	590	34261	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-76	0	2019-03-07 11:35:53.073+05:30	2019-03-07 11:35:53.073+05:30	\N
127	590	34261	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-74	0	2019-03-07 11:36:23.24+05:30	2019-03-07 11:36:23.24+05:30	\N
128	590	34261	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-79	1	2019-03-07 11:37:26.403+05:30	2019-03-07 11:37:26.403+05:30	\N
129	590	34261	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-80	1	2019-03-07 11:39:26.55+05:30	2019-03-07 11:39:26.55+05:30	\N
130	58571	399	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-82	1	2019-03-07 11:43:28.745+05:30	2019-03-07 11:43:28.745+05:30	\N
131	58571	399	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-76	0	2019-03-07 11:51:28.945+05:30	2019-03-07 11:51:28.945+05:30	\N
132	58571	399	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-81	1	2019-03-07 11:56:15.064+05:30	2019-03-07 11:56:15.064+05:30	\N
133	2694	39225	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-84	1	2019-03-07 11:58:02.913+05:30	2019-03-07 11:58:02.913+05:30	\N
134	22305	58311	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-84	1	2019-03-07 12:31:32.805+05:30	2019-03-07 12:31:32.805+05:30	\N
135	590	34261	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-73	0	2019-03-07 12:35:54.268+05:30	2019-03-07 12:35:54.268+05:30	\N
137	45014	34401	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-85	4	2019-03-07 12:44:40.613+05:30	2019-03-07 12:44:40.613+05:30	\N
138	22054	39580	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-90	3	2019-03-07 12:45:10.893+05:30	2019-03-07 12:45:10.893+05:30	\N
139	34873	22039	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-90	3	2019-03-07 12:48:07.691+05:30	2019-03-07 12:48:07.691+05:30	\N
140	53833	48842	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-88	2	2019-03-07 12:48:38.123+05:30	2019-03-07 12:48:38.123+05:30	\N
141	34477	57156	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-95	4	2019-03-07 13:27:43.865+05:30	2019-03-07 13:27:43.865+05:30	\N
142	23563	11325	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-90	3	2019-03-07 13:43:50.27+05:30	2019-03-07 13:43:50.27+05:30	\N
143	46358	19727	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-92	3	2019-03-07 14:09:57.211+05:30	2019-03-07 14:09:57.211+05:30	\N
144	318	36323	b9407f30-f5f8-466e-aff9-25556b57fe6d	-87	2	2019-03-07 14:12:07.916+05:30	2019-03-07 14:12:07.916+05:30	\N
145	590	34261	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-94	4	2019-03-07 14:17:59.965+05:30	2019-03-07 14:17:59.965+05:30	\N
146	590	34261	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-92	3	2019-03-07 14:22:20.309+05:30	2019-03-07 14:22:20.309+05:30	\N
147	590	34261	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-84	1	2019-03-07 14:30:39.413+05:30	2019-03-07 14:30:39.413+05:30	\N
148	590	34261	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-87	2	2019-03-07 14:43:22.582+05:30	2019-03-07 14:43:22.582+05:30	\N
149	590	34261	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-96	5	2019-03-07 14:54:32.953+05:30	2019-03-07 14:54:32.953+05:30	\N
150	590	34261	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-82	1	2019-03-07 14:55:14.816+05:30	2019-03-07 14:55:14.816+05:30	\N
151	590	34261	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-93	3	2019-03-07 14:57:01.837+05:30	2019-03-07 14:57:01.837+05:30	\N
152	590	34261	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-100	6	2019-03-07 14:59:54.761+05:30	2019-03-07 14:59:54.761+05:30	\N
153	590	34261	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-81	1	2019-03-07 15:18:54.204+05:30	2019-03-07 15:18:54.204+05:30	\N
154	590	34261	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-98	5	2019-03-07 15:35:17.01+05:30	2019-03-07 15:35:17.01+05:30	\N
155	58082	34138	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-96	2	2019-03-10 06:48:49.347+05:30	2019-03-10 06:48:49.347+05:30	\N
156	590	34261	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-92	3	2019-03-10 17:29:02.227+05:30	2019-03-10 17:29:02.227+05:30	\N
157	58082	34138	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-98	3	2019-03-10 17:29:02.23+05:30	2019-03-10 17:29:02.23+05:30	\N
158	61761	33282	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-87	2	2019-03-18 10:07:43.192+05:30	2019-03-18 10:07:43.192+05:30	\N
159	45014	34401	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-77	2	2019-03-18 10:11:20.933+05:30	2019-03-18 10:11:20.933+05:30	\N
160	318	36323	b9407f30-f5f8-466e-aff9-25556b57fe6d	-91	3	2019-03-18 10:11:24.34+05:30	2019-03-18 10:11:24.34+05:30	\N
161	22305	58311	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-84	1	2019-03-18 10:11:24.352+05:30	2019-03-18 10:11:24.352+05:30	\N
162	19490	65063	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-85	2	2019-03-18 10:11:24.479+05:30	2019-03-18 10:11:24.479+05:30	\N
163	28503	54895	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-83	1	2019-03-18 10:12:11.965+05:30	2019-03-18 10:12:11.965+05:30	\N
164	590	34261	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-77	1	2019-03-18 16:07:32.821+05:30	2019-03-18 16:07:32.821+05:30	\N
165	590	34261	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-76	0	2019-03-18 16:09:09.733+05:30	2019-03-18 16:09:09.733+05:30	\N
166	590	34261	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-77	1	2019-03-18 16:09:59.915+05:30	2019-03-18 16:09:59.915+05:30	\N
167	590	34261	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-76	0	2019-03-18 16:11:42.373+05:30	2019-03-18 16:11:42.373+05:30	\N
168	590	34261	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-76	0	2019-03-18 16:14:08.883+05:30	2019-03-18 16:14:08.883+05:30	\N
169	590	34261	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-76	0	2019-03-18 16:18:19.158+05:30	2019-03-18 16:18:19.158+05:30	\N
170	590	34261	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-53	0	2019-03-18 16:21:41.604+05:30	2019-03-18 16:21:41.604+05:30	\N
171	46358	19727	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-76	0	2019-03-20 11:32:22.633+05:30	2019-03-20 11:32:22.633+05:30	\N
172	46284	14876	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-80	1	2019-03-20 11:32:22.637+05:30	2019-03-20 11:32:22.637+05:30	\N
173	37241	34483	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-86	2	2019-03-20 11:32:22.657+05:30	2019-03-20 11:32:22.657+05:30	\N
174	1361	13573	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-82	1	2019-03-20 11:32:53.254+05:30	2019-03-20 11:32:53.254+05:30	\N
175	36607	61222	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-81	1	2019-03-20 11:33:56.242+05:30	2019-03-20 11:33:56.242+05:30	\N
176	45014	34401	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-75	1	2019-03-20 11:33:56.276+05:30	2019-03-20 11:33:56.276+05:30	\N
177	12990	25209	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-84	1	2019-03-20 11:33:56.293+05:30	2019-03-20 11:33:56.293+05:30	\N
178	58571	399	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-73	0	2019-03-20 11:33:56.466+05:30	2019-03-20 11:33:56.466+05:30	\N
179	41704	42796	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-85	2	2019-03-20 11:36:18.837+05:30	2019-03-20 11:36:18.837+05:30	\N
180	12990	25209	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-92	3	2019-03-20 11:36:19.072+05:30	2019-03-20 11:36:19.072+05:30	\N
181	37241	34483	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-101	7	2019-03-20 11:40:19.359+05:30	2019-03-20 11:40:19.359+05:30	\N
182	32251	27897	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-75	0	2019-03-20 11:48:19.306+05:30	2019-03-20 11:48:19.306+05:30	\N
183	36324	18069	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-85	2	2019-03-20 12:04:19.607+05:30	2019-03-20 12:04:19.607+05:30	\N
184	61761	33282	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-95	4	2019-03-20 12:18:26.534+05:30	2019-03-20 12:18:26.534+05:30	\N
185	55777	56871	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-87	1	2019-03-20 12:20:21.117+05:30	2019-03-20 12:20:21.117+05:30	\N
186	22305	58311	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-82	1	2019-03-20 12:20:21.682+05:30	2019-03-20 12:20:21.682+05:30	\N
187	53833	48842	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-76	0	2019-03-20 12:20:21.694+05:30	2019-03-20 12:20:21.694+05:30	\N
188	23464	51295	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-100	0	2019-03-20 12:20:55.269+05:30	2019-03-20 12:20:55.269+05:30	\N
189	22082	56546	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-84	1	2019-03-20 12:22:21.387+05:30	2019-03-20 12:22:21.387+05:30	\N
190	46321	22481	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-83	1	2019-03-20 12:22:21.392+05:30	2019-03-20 12:22:21.392+05:30	\N
191	55022	43108	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-85	2	2019-03-20 12:25:15.992+05:30	2019-03-20 12:25:15.992+05:30	\N
192	12990	25209	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-86	2	2019-03-20 12:29:57.502+05:30	2019-03-20 12:29:57.502+05:30	\N
193	34873	22039	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-100	6	2019-03-20 12:29:57.506+05:30	2019-03-20 12:29:57.506+05:30	\N
194	46457	63216	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-76	0	2019-03-20 12:38:59.238+05:30	2019-03-20 12:38:59.238+05:30	\N
195	61925	17177	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-76	0	2019-03-20 12:38:59.243+05:30	2019-03-20 12:38:59.243+05:30	\N
196	65118	21120	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-79	1	2019-03-20 12:55:22.211+05:30	2019-03-20 12:55:22.211+05:30	\N
197	22054	39580	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-92	3	2019-03-20 13:27:35.068+05:30	2019-03-20 13:27:35.068+05:30	\N
198	12990	25209	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-91	3	2019-03-20 13:27:36.026+05:30	2019-03-20 13:27:36.026+05:30	\N
199	61761	33282	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-81	1	2019-03-20 16:18:32.973+05:30	2019-03-20 16:18:32.973+05:30	\N
200	3010	54104	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-86	2	2019-03-20 16:20:14.965+05:30	2019-03-20 16:20:14.965+05:30	\N
201	33455	5309	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-84	1	2019-03-20 16:20:15.681+05:30	2019-03-20 16:20:15.681+05:30	\N
202	44889	57023	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-92	3	2019-03-20 16:20:44.819+05:30	2019-03-20 16:20:44.819+05:30	\N
203	52990	19129	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-90	3	2019-03-20 16:21:46.091+05:30	2019-03-20 16:21:46.091+05:30	\N
204	2694	39225	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-88	2	2019-03-20 16:24:26.363+05:30	2019-03-20 16:24:26.363+05:30	\N
205	19179	45059	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-89	2	2019-03-20 16:24:26.368+05:30	2019-03-20 16:24:26.368+05:30	\N
206	22054	39580	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-87	2	2019-03-20 16:28:29.777+05:30	2019-03-20 16:28:29.777+05:30	\N
207	22305	58311	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-83	1	2019-03-20 16:36:30.791+05:30	2019-03-20 16:36:30.791+05:30	\N
208	23563	11325	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-73	0	2019-03-20 16:36:31.229+05:30	2019-03-20 16:36:31.229+05:30	\N
209	58571	399	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-78	1	2019-03-20 16:52:53.752+05:30	2019-03-20 16:52:53.752+05:30	\N
210	45828	35151	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-82	1	2019-03-20 16:52:53.754+05:30	2019-03-20 16:52:53.754+05:30	\N
211	62889	38604	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-90	3	2019-03-20 16:52:54.073+05:30	2019-03-20 16:52:54.073+05:30	\N
212	8713	61271	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-88	2	2019-03-20 17:24:54.309+05:30	2019-03-20 17:24:54.309+05:30	\N
213	36625	6820	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-83	1	2019-03-20 17:28:36.811+05:30	2019-03-20 17:28:36.811+05:30	\N
214	41704	42796	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-94	4	2019-03-20 17:30:25.169+05:30	2019-03-20 17:30:25.169+05:30	\N
215	34477	57156	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-83	1	2019-03-20 17:31:03.362+05:30	2019-03-20 17:31:03.362+05:30	\N
216	36324	18069	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-87	2	2019-03-20 17:32:08.76+05:30	2019-03-20 17:32:08.76+05:30	\N
217	55777	56871	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-88	1	2019-03-20 17:32:08.772+05:30	2019-03-20 17:32:08.772+05:30	\N
218	44889	57023	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-76	0	2019-03-20 17:34:08.956+05:30	2019-03-20 17:34:08.956+05:30	\N
219	22054	39580	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-94	4	2019-03-20 17:38:19.926+05:30	2019-03-20 17:38:19.926+05:30	\N
220	45828	35151	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-78	1	2019-03-20 17:46:32.449+05:30	2019-03-20 17:46:32.449+05:30	\N
221	17984	15352	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-92	3	2019-03-20 17:47:53.963+05:30	2019-03-20 17:47:53.963+05:30	\N
222	318	36323	b9407f30-f5f8-466e-aff9-25556b57fe6d	-88	2	2019-03-20 17:47:53.968+05:30	2019-03-20 17:47:53.968+05:30	\N
223	1515	2869	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-90	3	2019-03-20 17:47:54.122+05:30	2019-03-20 17:47:54.122+05:30	\N
224	46284	14876	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-97	5	2019-03-20 17:47:54.145+05:30	2019-03-20 17:47:54.145+05:30	\N
225	42975	50049	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-92	3	2019-03-20 17:47:54.496+05:30	2019-03-20 17:47:54.496+05:30	\N
226	28503	54895	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-95	4	2019-03-20 17:48:24.164+05:30	2019-03-20 17:48:24.164+05:30	\N
227	44889	57023	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-76	0	2019-03-20 17:48:24.302+05:30	2019-03-20 17:48:24.302+05:30	\N
228	46321	22481	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-90	3	2019-03-20 17:49:24.591+05:30	2019-03-20 17:49:24.591+05:30	\N
229	41704	42796	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-90	3	2019-03-20 17:52:05.38+05:30	2019-03-20 17:52:05.38+05:30	\N
230	37885	17221	b9407f30-f5f8-466e-aff9-25556b57fe6d	-92	4	2019-03-20 17:52:05.385+05:30	2019-03-20 17:52:05.385+05:30	\N
231	24197	21728	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-92	3	2019-03-20 17:52:05.386+05:30	2019-03-20 17:52:05.386+05:30	\N
232	36287	18995	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-97	0	2019-03-21 10:42:48.496+05:30	2019-03-21 10:42:48.496+05:30	\N
233	36287	18995	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-102	0	2019-03-21 10:43:21.298+05:30	2019-03-21 10:43:21.298+05:30	\N
234	36287	18995	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-103	0	2019-03-21 10:44:20.711+05:30	2019-03-21 10:44:20.711+05:30	\N
235	36287	18995	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-89	0	2019-03-21 10:46:49.861+05:30	2019-03-21 10:46:49.861+05:30	\N
236	36287	18995	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-91	0	2019-03-21 10:51:06.801+05:30	2019-03-21 10:51:06.801+05:30	\N
237	36287	18995	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-95	0	2019-03-21 11:00:08.395+05:30	2019-03-21 11:00:08.395+05:30	\N
238	36287	18995	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-92	0	2019-03-21 11:16:26.704+05:30	2019-03-21 11:16:26.704+05:30	\N
239	36287	18995	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-99	0	2019-03-21 12:56:19.422+05:30	2019-03-21 12:56:19.422+05:30	\N
256	9481	5743	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-45	0	2019-03-25 17:49:10.152+05:30	2019-03-25 17:49:10.152+05:30	14
262	24197	21728	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-86	2	2019-03-25 17:57:31.976+05:30	2019-03-25 17:57:31.976+05:30	14
269	1515	2869	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-86	2	2019-03-25 18:11:25.371+05:30	2019-03-25 18:11:25.371+05:30	12
270	55777	56871	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-97	3	2019-03-25 18:11:29.454+05:30	2019-03-25 18:11:29.454+05:30	14
271	10577	18573	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-88	2	2019-03-25 18:11:29.457+05:30	2019-03-25 18:11:29.457+05:30	14
277	34873	22039	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-85	2	2019-03-25 18:31:33.662+05:30	2019-03-25 18:31:33.662+05:30	12
284	10577	18573	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-80	1	2019-03-25 19:05:10.176+05:30	2019-03-25 19:05:10.176+05:30	12
291	46284	14876	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-80	1	2019-03-25 19:16:01.274+05:30	2019-03-25 19:16:01.274+05:30	12
297	19179	45059	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-80	1	2019-03-25 19:22:12.341+05:30	2019-03-25 19:22:12.341+05:30	12
303	9481	5743	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-70	0	2019-03-25 20:16:40.889+05:30	2019-03-25 20:16:40.889+05:30	12
310	9481	5743	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-81	1	2019-03-25 20:27:17.639+05:30	2019-03-25 20:27:17.639+05:30	14
316	9481	5743	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-79	1	2019-03-25 20:47:10.342+05:30	2019-03-25 20:47:10.342+05:30	14
322	32251	27897	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-85	2	2019-03-26 15:13:44.129+05:30	2019-03-26 15:13:44.129+05:30	14
323	5193	25495	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-96	5	2019-03-26 15:13:44.132+05:30	2019-03-26 15:13:44.132+05:30	14
324	55777	56871	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-97	3	2019-03-26 15:13:44.135+05:30	2019-03-26 15:13:44.135+05:30	14
332	36287	18995	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-75	0	2019-03-28 06:40:23.715+05:30	2019-03-28 06:40:23.715+05:30	14
339	28503	54895	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-88	2	2019-04-02 14:19:37.486+05:30	2019-04-02 14:19:37.486+05:30	15
340	24197	21728	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-87	2	2019-04-02 14:19:37.775+05:30	2019-04-02 14:19:37.775+05:30	15
346	9481	5743	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-79	1	2019-04-02 15:35:11.871+05:30	2019-04-02 15:35:11.871+05:30	15
352	9481	5743	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-83	1	2019-04-03 11:33:21.227+05:30	2019-04-03 11:33:21.227+05:30	14
369	36287	18995	f7826da6-4fa2-4e98-8024-bc5b71e0893e	14845484	3	2019-04-03 11:55:25.212+05:30	2019-04-03 11:55:25.212+05:30	16
376	22082	56546	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-89	2	2019-04-03 12:04:17.475+05:30	2019-04-03 12:04:17.475+05:30	14
382	318	36323	b9407f30-f5f8-466e-aff9-25556b57fe6d	-81	1	2019-04-03 12:14:31.435+05:30	2019-04-03 12:14:31.435+05:30	14
389	19490	65063	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-97	5	2019-04-03 12:36:17.208+05:30	2019-04-03 12:36:17.208+05:30	14
396	17984	15352	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-90	3	2019-04-03 12:48:22.968+05:30	2019-04-03 12:48:22.968+05:30	14
402	5193	25495	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-78	1	2019-04-05 14:14:00.064+05:30	2019-04-05 14:14:00.064+05:30	15
413	22054	39580	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-83	1	2019-04-05 15:02:12.374+05:30	2019-04-05 15:02:12.374+05:30	14
414	5193	25495	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-77	1	2019-04-05 15:02:12.39+05:30	2019-04-05 15:02:12.39+05:30	14
420	58082	34138	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-100	3	2019-04-06 12:29:20.648+05:30	2019-04-06 12:29:20.648+05:30	14
428	27641	63017	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-88	2	2019-04-08 12:58:03.713+05:30	2019-04-08 12:58:03.713+05:30	15
435	23563	11325	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-80	1	2019-04-08 13:59:03.99+05:30	2019-04-08 13:59:03.99+05:30	15
441	45014	34401	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-78	2	2019-04-08 16:45:51.629+05:30	2019-04-08 16:45:51.629+05:30	15
450	62889	38604	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-94	4	2019-04-10 15:24:11.724+05:30	2019-04-10 15:24:11.724+05:30	17
456	318	36323	b9407f30-f5f8-466e-aff9-25556b57fe6d	-90	3	2019-04-11 11:46:16.111+05:30	2019-04-11 11:46:16.111+05:30	14
464	318	36323	b9407f30-f5f8-466e-aff9-25556b57fe6d	-87	2	2019-04-11 12:00:06.566+05:30	2019-04-11 12:00:06.566+05:30	14
471	45014	34401	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-81	3	2019-04-11 12:14:46.809+05:30	2019-04-11 12:14:46.809+05:30	14
479	31702	52064	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-95	2	2019-04-11 12:31:23.491+05:30	2019-04-11 12:31:23.491+05:30	14
480	37241	34483	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-94	4	2019-04-11 12:31:25.193+05:30	2019-04-11 12:31:25.193+05:30	14
487	36324	18069	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-87	2	2019-04-11 17:10:43.517+05:30	2019-04-11 17:10:43.517+05:30	14
493	36324	18069	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-89	2	2019-04-11 17:16:30.249+05:30	2019-04-11 17:16:30.249+05:30	14
499	31702	52064	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-87	1	2019-04-11 17:26:59.392+05:30	2019-04-11 17:26:59.392+05:30	14
500	52990	19129	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-76	0	2019-04-11 17:26:59.402+05:30	2019-04-11 17:26:59.402+05:30	14
501	12990	25209	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-83	1	2019-04-11 17:26:59.403+05:30	2019-04-11 17:26:59.403+05:30	14
508	57441	7716	f7826da6-4fa2-4e98-8024-bc5b71e0893e	-81	1	2019-04-11 17:41:24.785+05:30	2019-04-11 17:41:24.785+05:30	14
\.


--
-- Name: beacons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: beaconstalk
--

SELECT pg_catalog.setval('public.beacons_id_seq', 510, true);


--
-- Data for Name: campaigns; Type: TABLE DATA; Schema: public; Owner: beaconstalk
--

COPY public.campaigns (id, name, start_timestamp, end_timestamp, content, action, file, "createdAt", "updatedAt", "applicationId", "locationMasterId") FROM stdin;
1	DCB Bank	2019-03-06 00:00:00+05:30	2019-03-31 23:00:00+05:30	Get discounts on medicines and more at Apollo Pharmacy	https://www.dcbbank.com/images/Card_Offer_Emailer_july.jpg	/uploads/7408401c-5002-4ab0-854d-ed443c9d178b.png	2019-03-06 12:17:38.189+05:30	2019-03-06 12:17:38.189+05:30	1	4
3	SBI Card Offers	2019-03-25 00:00:00+05:30	2019-04-25 23:00:00+05:30	Pay with Rewards Points at Your Merchant Store	https://www.sbicard.com/en/personal/offer/accelerated-rewards-page	/uploads/505f1d0b-82ca-469e-8e0b-eea6a0956620.png	2019-03-25 17:36:20.223+05:30	2019-03-25 17:36:20.223+05:30	2	1
4	Hello	2019-04-11 16:00:00+05:30	2019-04-11 18:00:00+05:30	Hello This is a test	https://www.sbicard.com/en/personal/offer/accelerated-rewards-page	/uploads/483a3d9b-a034-4dc9-9552-3046f59ba145.png	2019-04-11 17:08:11.137+05:30	2019-04-11 17:08:11.137+05:30	2	1
5	Replacement	2019-04-11 16:00:00+05:30	2019-04-11 18:00:00+05:30	REPLACEMENT	http://beaconstalk.com	/uploads/8978346e-3005-4ec2-a47e-e9052a72cccd.png	2019-04-11 17:27:42.23+05:30	2019-04-11 17:27:42.23+05:30	2	1
\.


--
-- Name: campaigns_id_seq; Type: SEQUENCE SET; Schema: public; Owner: beaconstalk
--

SELECT pg_catalog.setval('public.campaigns_id_seq', 5, true);


--
-- Data for Name: devices; Type: TABLE DATA; Schema: public; Owner: beaconstalk
--

COPY public.devices (id, "IMEI", "GAID", "deviceId", "createdAt", "updatedAt") FROM stdin;
10	352724070870919	352724070870919	352724070870919	2019-03-07 12:29:03.805+05:30	2019-03-07 12:29:03.805+05:30
12	862103030598089	862103030598089	862103030598089	2019-03-22 17:18:04.782+05:30	2019-03-22 17:18:04.782+05:30
13	358958067208139	358958067208139	358958067208139	2019-03-25 17:36:36.511+05:30	2019-03-25 17:36:36.511+05:30
14	358958067208139	358958067208139	358958067208139	2019-03-25 17:38:24.54+05:30	2019-03-25 17:38:24.54+05:30
15	866409038498420	866409038498420	866409038498420	2019-04-02 14:03:17.433+05:30	2019-04-02 14:03:17.433+05:30
16	TESTINGIMEI	TESTGAID	TESTINGDEVICEID	2019-04-03 11:48:27.492+05:30	2019-04-03 11:48:27.492+05:30
17	866407030548085	866407030548085	866407030548085	2019-04-10 13:00:58.637+05:30	2019-04-10 13:00:58.637+05:30
\.


--
-- Name: devices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: beaconstalk
--

SELECT pg_catalog.setval('public.devices_id_seq', 17, true);


--
-- Data for Name: geofences; Type: TABLE DATA; Schema: public; Owner: beaconstalk
--

COPY public.geofences (id, name, "createdAt", "updatedAt", "userId") FROM stdin;
1	Testing	2019-03-06 13:04:14.335+05:30	2019-03-06 13:04:14.335+05:30	1
2	Test	2019-03-07 12:20:03.244+05:30	2019-03-07 12:20:03.244+05:30	1
3	Working?	2019-03-07 12:23:30.79+05:30	2019-03-07 12:23:30.79+05:30	1
4	Awfis Geofence	2019-03-07 12:23:58.47+05:30	2019-03-07 12:23:58.47+05:30	1
5	test	2019-03-11 22:07:46.775+05:30	2019-03-11 22:07:46.775+05:30	1
6	Test	2019-04-03 15:31:54.553+05:30	2019-04-03 15:31:54.553+05:30	1
7	Test1	2019-04-03 15:34:35.43+05:30	2019-04-03 15:34:35.43+05:30	1
\.


--
-- Name: geofences_id_seq; Type: SEQUENCE SET; Schema: public; Owner: beaconstalk
--

SELECT pg_catalog.setval('public.geofences_id_seq', 7, true);


--
-- Data for Name: geolocations; Type: TABLE DATA; Schema: public; Owner: beaconstalk
--

COPY public.geolocations (id, type, latitude, longitude, "createdAt", "updatedAt", "userId", "geofenceId") FROM stdin;
\.


--
-- Name: geolocations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: beaconstalk
--

SELECT pg_catalog.setval('public.geolocations_id_seq', 1, false);


--
-- Data for Name: location_masters; Type: TABLE DATA; Schema: public; Owner: beaconstalk
--

COPY public.location_masters (id, name, type, "createdAt", "updatedAt") FROM stdin;
1	KFC	QSR	2019-03-06 12:15:16.86+05:30	2019-03-06 12:15:16.86+05:30
2	Phoenix Mall Parel	Mall	2019-03-07 11:01:51.63+05:30	2019-03-07 11:01:51.63+05:30
3	Equanimity Investments	Office	2019-03-07 14:07:07.132+05:30	2019-03-07 14:07:07.132+05:30
4	DCB Bank Lower Parel	Office	2019-03-18 10:15:56.462+05:30	2019-03-18 10:15:56.462+05:30
5	Xyz	Restaurant	2019-04-03 15:35:18.243+05:30	2019-04-03 15:35:18.243+05:30
6	Kurla	Mall	2019-04-03 15:35:25.513+05:30	2019-04-03 15:35:25.513+05:30
\.


--
-- Name: location_masters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: beaconstalk
--

SELECT pg_catalog.setval('public.location_masters_id_seq', 6, true);


--
-- Data for Name: locations; Type: TABLE DATA; Schema: public; Owner: beaconstalk
--

COPY public.locations (id, latitude, longitude, "createdAt", "updatedAt", "deviceId") FROM stdin;
206	19.1189576999999957	72.9135954999999996	2019-03-25 17:40:33.421+05:30	2019-03-25 17:40:33.421+05:30	14
209	19.1189576999999957	72.9135954999999996	2019-03-25 17:44:05.782+05:30	2019-03-25 17:44:05.782+05:30	14
212	19.1189576999999957	72.9135954999999996	2019-03-25 17:49:40.294+05:30	2019-03-25 17:49:40.294+05:30	14
215	19.1191220000000008	72.9136792999999983	2019-03-25 17:57:31.975+05:30	2019-03-25 17:57:31.975+05:30	14
218	19.1199490986764431	72.912919158115983	2019-03-25 18:04:36.735+05:30	2019-03-25 18:04:36.735+05:30	14
221	19.1189742000000003	72.9135945000000021	2019-03-25 18:19:42.463+05:30	2019-03-25 18:19:42.463+05:30	14
224	19.1189928999999985	72.9135782999999975	2019-03-25 19:24:40.673+05:30	2019-03-25 19:24:40.673+05:30	14
227	19.1199490986764431	72.912919158115983	2019-03-25 19:33:33.787+05:30	2019-03-25 19:33:33.787+05:30	14
230	19.1189652999999993	72.9135918000000061	2019-03-25 20:05:20.007+05:30	2019-03-25 20:05:20.007+05:30	14
233	19.1190800000000003	72.9137082999999961	2019-03-25 20:20:52.422+05:30	2019-03-25 20:20:52.422+05:30	14
236	19.1190800000000003	72.9137082999999961	2019-03-25 20:25:03.158+05:30	2019-03-25 20:25:03.158+05:30	14
239	19.1191126999999952	72.9136787999999854	2019-03-25 20:32:16.943+05:30	2019-03-25 20:32:16.943+05:30	14
242	19.1181139999999985	73.0042629999999946	2019-03-25 22:40:37.345+05:30	2019-03-25 22:40:37.345+05:30	14
245	19.1181377999999995	73.0042617999999948	2019-03-26 08:47:06.302+05:30	2019-03-26 08:47:06.302+05:30	14
248	19.1189689999999999	72.9136101999999937	2019-03-26 15:11:43.28+05:30	2019-03-26 15:11:43.28+05:30	14
251	19.1189724000000005	72.9136256000000031	2019-03-26 15:25:47.067+05:30	2019-03-26 15:25:47.067+05:30	14
254	19.1199490986764431	72.912919158115983	2019-03-26 17:23:22.805+05:30	2019-03-26 17:23:22.805+05:30	14
257	19.1189724000000005	72.913610399999996	2019-03-27 18:44:25.943+05:30	2019-03-27 18:44:25.943+05:30	14
260	19.1189609000000011	72.9136246999999997	2019-03-28 11:52:34.308+05:30	2019-03-28 11:52:34.308+05:30	14
263	19.1180903999999998	73.0042990999999972	2019-03-29 06:38:27.987+05:30	2019-03-29 06:38:27.987+05:30	14
266	19.1181222999999996	73.0042940000000016	2019-03-30 01:28:11.674+05:30	2019-03-30 01:28:11.674+05:30	14
269	19.1181392999999993	73.0042741000000035	2019-03-30 17:32:10.505+05:30	2019-03-30 17:32:10.505+05:30	14
272	19.1181273000000012	73.0042763999999949	2019-03-31 14:22:52.368+05:30	2019-03-31 14:22:52.368+05:30	14
275	19.1181118000000012	73.0043084999999934	2019-04-01 11:49:15.423+05:30	2019-04-01 11:49:15.423+05:30	14
278	19.1190995999999984	72.9137302999999974	2019-04-02 15:46:44.393+05:30	2019-04-02 15:46:44.393+05:30	14
281	19.1113796504214406	72.8990592621266984	2019-04-03 10:31:56.436+05:30	2019-04-03 10:31:56.436+05:30	14
284	19.1189712999999983	72.913590499999998	2019-04-03 11:31:36.87+05:30	2019-04-03 11:31:36.87+05:30	14
287	19.1189712999999983	72.913590499999998	2019-04-03 11:35:40.91+05:30	2019-04-03 11:35:40.91+05:30	14
290	19.1189663000000003	72.9136000999999965	2019-04-03 11:45:47.241+05:30	2019-04-03 11:45:47.241+05:30	14
293	19.1189663000000003	72.9136000999999965	2019-04-03 11:52:49.869+05:30	2019-04-03 11:52:49.869+05:30	14
296	19.1189663000000003	72.9136000999999965	2019-04-03 12:00:36.897+05:30	2019-04-03 12:00:36.897+05:30	14
299	19.1189663000000003	72.9136000999999965	2019-04-03 12:06:39.985+05:30	2019-04-03 12:06:39.985+05:30	14
302	19.1189663000000003	72.9136000999999965	2019-04-03 12:14:31.402+05:30	2019-04-03 12:14:31.402+05:30	14
305	19.1189663000000003	72.9136000999999965	2019-04-03 12:36:48.29+05:30	2019-04-03 12:36:48.29+05:30	14
308	19.1189663000000003	72.9136000999999965	2019-04-03 12:44:18.728+05:30	2019-04-03 12:44:18.728+05:30	14
311	19.1189266999999994	72.913538200000005	2019-04-03 14:01:13.69+05:30	2019-04-03 14:01:13.69+05:30	14
314	19.1756299199999987	72.8659019600000022	2019-04-04 11:46:26.098+05:30	2019-04-04 11:46:26.098+05:30	14
317	19.1189605	72.9135832999999991	2019-04-04 12:20:19.097+05:30	2019-04-04 12:20:19.097+05:30	14
320	19.1189585000000015	72.913582500000004	2019-04-04 15:52:21.865+05:30	2019-04-04 15:52:21.865+05:30	14
323	19.1189585000000015	72.913582500000004	2019-04-04 16:19:59.003+05:30	2019-04-04 16:19:59.003+05:30	14
326	19.0126934900000002	72.826605200000003	2019-04-05 14:52:42.311+05:30	2019-04-05 14:52:42.311+05:30	14
329	19.0126934900000002	72.826605200000003	2019-04-05 14:56:57.946+05:30	2019-04-05 14:56:57.946+05:30	14
331	19.0126934900000002	72.826605200000003	2019-04-05 15:10:32.168+05:30	2019-04-05 15:10:32.168+05:30	14
333	19.0126934900000002	72.826605200000003	2019-04-05 16:00:06.688+05:30	2019-04-05 16:00:06.688+05:30	14
335	19.1113796504214406	72.8990592621266984	2019-04-05 19:26:32.141+05:30	2019-04-05 19:26:32.141+05:30	14
337	19.1121212000000007	72.898676199999997	2019-04-06 06:29:53.565+05:30	2019-04-06 06:29:53.565+05:30	14
339	19.1178543999999988	72.9073147600000055	2019-04-06 17:29:57.139+05:30	2019-04-06 17:29:57.139+05:30	14
341	19.1123489599999985	72.8988340199999953	2019-04-07 05:02:53.454+05:30	2019-04-07 05:02:53.454+05:30	14
343	19.1121255999999988	72.8986713999999978	2019-04-08 01:42:07.588+05:30	2019-04-08 01:42:07.588+05:30	14
345	19.1190828708931804	72.9137285985052586	2019-04-08 12:06:12.375+05:30	2019-04-08 12:06:12.375+05:30	14
347	19.119803044013679	72.9136959090828896	2019-04-08 12:56:01.105+05:30	2019-04-08 12:56:01.105+05:30	14
349	19.1190290000000012	72.9135315000000048	2019-04-08 12:59:22.642+05:30	2019-04-08 12:59:22.642+05:30	14
351	19.119803044013679	72.9136959090828896	2019-04-08 13:27:41.444+05:30	2019-04-08 13:27:41.444+05:30	14
353	19.119803044013679	72.9136959090828896	2019-04-08 14:31:06.339+05:30	2019-04-08 14:31:06.339+05:30	14
355	19.1189552999999997	72.9135220999999945	2019-04-08 18:12:29.619+05:30	2019-04-08 18:12:29.619+05:30	14
357	19.1121195999999998	72.8986797999999965	2019-04-09 05:57:32.543+05:30	2019-04-09 05:57:32.543+05:30	14
359	19.1189622999999997	72.913595799999996	2019-04-09 16:32:09.398+05:30	2019-04-09 16:32:09.398+05:30	14
361	19.1189622999999997	72.913595799999996	2019-04-10 05:41:33.396+05:30	2019-04-10 05:41:33.396+05:30	14
363	19.118967099999999	72.9136024999999961	2019-04-10 13:04:37.017+05:30	2019-04-10 13:04:37.017+05:30	17
365	19.118967099999999	72.9136024999999961	2019-04-10 15:26:02.007+05:30	2019-04-10 15:26:02.007+05:30	17
367	19.118967099999999	72.9136024999999961	2019-04-10 17:25:27.533+05:30	2019-04-10 17:25:27.533+05:30	17
369	19.118967099999999	72.9136024999999961	2019-04-10 17:40:57.92+05:30	2019-04-10 17:40:57.92+05:30	17
371	19.1124557191506028	72.8985681664198637	2019-04-10 23:14:38.499+05:30	2019-04-10 23:14:38.499+05:30	14
373	19.1121831600000007	72.8985277599999932	2019-04-11 10:16:11.706+05:30	2019-04-11 10:16:11.706+05:30	14
375	19.119803044013679	72.9136959090828896	2019-04-11 11:48:17.315+05:30	2019-04-11 11:48:17.315+05:30	14
377	19.1190828708931804	72.9137285985052586	2019-04-11 11:51:36.189+05:30	2019-04-11 11:51:36.189+05:30	14
379	19.119803044013679	72.9136959090828896	2019-04-11 12:00:06.489+05:30	2019-04-11 12:00:06.489+05:30	14
381	19.119803044013679	72.9136959090828896	2019-04-11 12:02:20.606+05:30	2019-04-11 12:02:20.606+05:30	14
383	19.1189781999999973	72.9136218999999954	2019-04-11 12:09:45.975+05:30	2019-04-11 12:09:45.975+05:30	14
385	19.1189781999999973	72.9136218999999954	2019-04-11 12:15:16.653+05:30	2019-04-11 12:15:16.653+05:30	14
387	19.1189781999999973	72.9136218999999954	2019-04-11 12:18:59.013+05:30	2019-04-11 12:18:59.013+05:30	14
389	19.1189781999999973	72.9136218999999954	2019-04-11 12:31:23.498+05:30	2019-04-11 12:31:23.498+05:30	14
391	19.119803044013679	72.9136959090828896	2019-04-11 13:21:12.77+05:30	2019-04-11 13:21:12.77+05:30	14
393	19.1189810999999992	72.913585299999994	2019-04-11 17:06:59.19+05:30	2019-04-11 17:06:59.19+05:30	14
395	19.1189442000000014	72.9136031000000031	2019-04-11 17:11:27.149+05:30	2019-04-11 17:11:27.149+05:30	14
397	19.1189442000000014	72.9136031000000031	2019-04-11 17:14:59.898+05:30	2019-04-11 17:14:59.898+05:30	14
399	19.1189442000000014	72.9136031000000031	2019-04-11 17:16:30.061+05:30	2019-04-11 17:16:30.061+05:30	14
401	19.1189442000000014	72.9136031000000031	2019-04-11 17:24:55.325+05:30	2019-04-11 17:24:55.325+05:30	14
403	19.1189442000000014	72.9136031000000031	2019-04-11 17:26:59.39+05:30	2019-04-11 17:26:59.39+05:30	14
405	19.1189442000000014	72.9136031000000031	2019-04-11 17:32:58.198+05:30	2019-04-11 17:32:58.198+05:30	14
407	19.119803044013679	72.9136959090828896	2019-04-11 17:57:26.679+05:30	2019-04-11 17:57:26.679+05:30	14
409	19.1185813899999992	72.912476280000007	2019-04-11 19:44:58.751+05:30	2019-04-11 19:44:58.751+05:30	14
411	19.1120906999999995	72.898383999999993	2019-04-12 03:29:31.868+05:30	2019-04-12 03:29:31.868+05:30	14
413	19.1183797549456358	72.9070472996681929	2019-04-12 13:56:48.581+05:30	2019-04-12 13:56:48.581+05:30	14
415	19.1117750744766433	72.8987824462461163	2019-04-13 00:02:10.577+05:30	2019-04-13 00:02:10.577+05:30	14
417	19.1120965200000015	72.8986003499999953	2019-04-13 11:28:07.742+05:30	2019-04-13 11:28:07.742+05:30	14
419	19.1121106999999988	72.8984010000000069	2019-04-13 22:18:20.205+05:30	2019-04-13 22:18:20.205+05:30	14
421	19.1120783000000003	72.8983690999999965	2019-04-14 08:50:36.115+05:30	2019-04-14 08:50:36.115+05:30	14
423	19.1120783000000003	72.8983690999999965	2019-04-14 20:22:09.452+05:30	2019-04-14 20:22:09.452+05:30	14
425	19.1121011000000003	72.8984616999999986	2019-04-15 06:39:54.548+05:30	2019-04-15 06:39:54.548+05:30	14
427	19.1231684000000008	72.8713364000000041	2019-04-15 16:40:07.235+05:30	2019-04-15 16:40:07.235+05:30	14
429	19.1102877999999947	72.8662419999999997	2019-04-15 17:01:47.682+05:30	2019-04-15 17:01:47.682+05:30	14
431	19.0569252999999996	72.8517324999999971	2019-04-15 17:42:33.115+05:30	2019-04-15 17:42:33.115+05:30	14
433	19.0547080999999991	72.850977560000004	2019-04-15 19:56:32.766+05:30	2019-04-15 19:56:32.766+05:30	14
435	19.1082878177985549	72.9011487867683172	2019-04-16 02:40:22.327+05:30	2019-04-16 02:40:22.327+05:30	14
207	19.1189576999999957	72.9135954999999996	2019-03-25 17:41:03.477+05:30	2019-03-25 17:41:03.477+05:30	14
210	19.1189576999999957	72.9135954999999996	2019-03-25 17:46:34.534+05:30	2019-03-25 17:46:34.534+05:30	14
213	19.1189576999999957	72.9135954999999996	2019-03-25 17:50:42.694+05:30	2019-03-25 17:50:42.694+05:30	14
216	19.1199490986764431	72.912919158115983	2019-03-25 18:03:06.274+05:30	2019-03-25 18:03:06.274+05:30	14
219	19.1189742000000003	72.9135945000000021	2019-03-25 18:07:16.965+05:30	2019-03-25 18:07:16.965+05:30	14
222	19.1189931000000009	72.9135966999999994	2019-03-25 18:35:46.804+05:30	2019-03-25 18:35:46.804+05:30	14
225	19.1189722999999994	72.9135738999999887	2019-03-25 19:27:02.685+05:30	2019-03-25 19:27:02.685+05:30	14
228	19.1189865999999995	72.9135789999999986	2019-03-25 19:44:04.981+05:30	2019-03-25 19:44:04.981+05:30	14
231	19.1189652999999993	72.9135918000000061	2019-03-25 20:09:14.843+05:30	2019-03-25 20:09:14.843+05:30	14
234	19.1190800000000003	72.9137082999999961	2019-03-25 20:21:22.489+05:30	2019-03-25 20:21:22.489+05:30	14
237	19.1199490986764431	72.912919158115983	2019-03-25 20:30:44.856+05:30	2019-03-25 20:30:44.856+05:30	14
240	19.1191126999999952	72.9136787999999854	2019-03-25 20:35:05.484+05:30	2019-03-25 20:35:05.484+05:30	14
243	19.118114699999996	73.0042625999999899	2019-03-25 23:45:40.621+05:30	2019-03-25 23:45:40.621+05:30	14
246	19.1189707999999996	72.9136261999999959	2019-03-26 15:09:41.58+05:30	2019-03-26 15:09:41.58+05:30	14
249	19.1189689999999999	72.9136101999999937	2019-03-26 15:13:43.853+05:30	2019-03-26 15:13:43.853+05:30	14
252	19.1189792999999959	72.9135854999999822	2019-03-26 15:46:11.241+05:30	2019-03-26 15:46:11.241+05:30	14
255	19.1189716999999995	72.9136151000000012	2019-03-26 19:41:51.886+05:30	2019-03-26 19:41:51.886+05:30	14
258	19.118125899999999	73.004283700000002	2019-03-28 01:32:36.961+05:30	2019-03-28 01:32:36.961+05:30	14
261	19.1189548000000009	72.913609699999995	2019-03-28 18:27:04.201+05:30	2019-03-28 18:27:04.201+05:30	14
264	19.1181118000000012	73.0043086000000017	2019-03-29 11:48:35.455+05:30	2019-03-29 11:48:35.455+05:30	14
267	19.1181258000000014	73.0042839000000043	2019-03-30 06:37:22.453+05:30	2019-03-30 06:37:22.453+05:30	14
270	19.1181392999999993	73.0042741000000035	2019-03-30 23:23:02.18+05:30	2019-03-30 23:23:02.18+05:30	14
273	19.1181273000000012	73.0042763999999949	2019-03-31 20:26:53.421+05:30	2019-03-31 20:26:53.421+05:30	14
276	19.119803044013679	72.9136959090828896	2019-04-01 16:51:19.512+05:30	2019-04-01 16:51:19.512+05:30	14
279	19.1121236000000003	72.8986649	2019-04-02 21:07:52.921+05:30	2019-04-02 21:07:52.921+05:30	14
282	19.1189712999999983	72.913590499999998	2019-04-03 11:08:12.132+05:30	2019-04-03 11:08:12.132+05:30	14
285	19.1189712999999983	72.913590499999998	2019-04-03 11:32:10.777+05:30	2019-04-03 11:32:10.777+05:30	14
288	19.1189663000000003	72.9136000999999965	2019-04-03 11:41:37.387+05:30	2019-04-03 11:41:37.387+05:30	14
291	19.1189663000000003	72.9136000999999965	2019-04-03 11:46:47.011+05:30	2019-04-03 11:46:47.011+05:30	14
294	19.1189663000000003	72.9136000999999965	2019-04-03 11:58:56.881+05:30	2019-04-03 11:58:56.881+05:30	14
297	19.1189663000000003	72.9136000999999965	2019-04-03 12:03:24.535+05:30	2019-04-03 12:03:24.535+05:30	14
300	19.1189663000000003	72.9136000999999965	2019-04-03 12:08:22.685+05:30	2019-04-03 12:08:22.685+05:30	14
303	19.1189663000000003	72.9136000999999965	2019-04-03 12:22:52.912+05:30	2019-04-03 12:22:52.912+05:30	14
306	19.1189663000000003	72.9136000999999965	2019-04-03 12:37:56.66+05:30	2019-04-03 12:37:56.66+05:30	14
309	19.1189663000000003	72.9136000999999965	2019-04-03 12:52:19.814+05:30	2019-04-03 12:52:19.814+05:30	14
312	19.1193518400000002	72.912264399999998	2019-04-03 15:42:25.563+05:30	2019-04-03 15:42:25.563+05:30	14
315	19.1189605	72.9135832999999991	2019-04-04 11:56:56.904+05:30	2019-04-04 11:56:56.904+05:30	14
318	19.1189585000000015	72.913582500000004	2019-04-04 13:09:39.1+05:30	2019-04-04 13:09:39.1+05:30	14
321	19.1189585000000015	72.913582500000004	2019-04-04 15:56:45.625+05:30	2019-04-04 15:56:45.625+05:30	14
324	19.1189585000000015	72.913582500000004	2019-04-04 16:35:03.549+05:30	2019-04-04 16:35:03.549+05:30	14
327	19.0126934900000002	72.826605200000003	2019-04-05 14:53:12.412+05:30	2019-04-05 14:53:12.412+05:30	14
330	19.0126934900000002	72.826605200000003	2019-04-05 15:02:12.143+05:30	2019-04-05 15:02:12.143+05:30	14
332	19.0126934900000002	72.826605200000003	2019-04-05 15:27:16.163+05:30	2019-04-05 15:27:16.163+05:30	14
334	19.1189564999999995	72.9136019999999974	2019-04-05 17:14:41.397+05:30	2019-04-05 17:14:41.397+05:30	14
336	19.1113796504214406	72.8990592621266984	2019-04-05 23:48:44.795+05:30	2019-04-05 23:48:44.795+05:30	14
338	19.1121228000000016	72.898673500000001	2019-04-06 12:29:20.644+05:30	2019-04-06 12:29:20.644+05:30	14
340	19.1123489599999985	72.8988340199999953	2019-04-06 23:06:05.159+05:30	2019-04-06 23:06:05.159+05:30	14
342	19.1122005999999978	72.8986192999999787	2019-04-07 10:16:37.096+05:30	2019-04-07 10:16:37.096+05:30	14
344	19.1124557191506028	72.8985681664198637	2019-04-08 06:54:31.7+05:30	2019-04-08 06:54:31.7+05:30	14
346	19.119803044013679	72.9136959090828896	2019-04-08 12:55:32.425+05:30	2019-04-08 12:55:32.425+05:30	14
348	19.119803044013679	72.9136959090828896	2019-04-08 12:57:01.64+05:30	2019-04-08 12:57:01.64+05:30	14
350	19.1190290000000012	72.9135315000000048	2019-04-08 13:13:52.186+05:30	2019-04-08 13:13:52.186+05:30	14
352	19.119803044013679	72.9136959090828896	2019-04-08 13:53:58.023+05:30	2019-04-08 13:53:58.023+05:30	14
354	19.1189552999999997	72.9135220999999945	2019-04-08 15:54:33.209+05:30	2019-04-08 15:54:33.209+05:30	14
356	19.1123435000000015	72.8984027999999995	2019-04-08 22:31:55.489+05:30	2019-04-08 22:31:55.489+05:30	14
358	19.1186365345492959	72.90829804725945	2019-04-09 11:20:29.099+05:30	2019-04-09 11:20:29.099+05:30	14
360	19.1189622999999997	72.913595799999996	2019-04-09 23:55:13.817+05:30	2019-04-09 23:55:13.817+05:30	14
362	19.1189758999999988	72.9136167000000057	2019-04-10 13:01:36.657+05:30	2019-04-10 13:01:36.657+05:30	14
364	19.118967099999999	72.9136024999999961	2019-04-10 13:05:12.327+05:30	2019-04-10 13:05:12.327+05:30	17
366	19.118967099999999	72.9136024999999961	2019-04-10 15:26:32.118+05:30	2019-04-10 15:26:32.118+05:30	17
368	19.118967099999999	72.9136024999999961	2019-04-10 17:27:26.305+05:30	2019-04-10 17:27:26.305+05:30	17
370	19.119803044013679	72.9136959090828896	2019-04-10 18:03:32.069+05:30	2019-04-10 18:03:32.069+05:30	14
372	19.112176599999998	72.8984986999999904	2019-04-11 04:28:30.447+05:30	2019-04-11 04:28:30.447+05:30	14
374	19.119803044013679	72.9136959090828896	2019-04-11 11:47:47.052+05:30	2019-04-11 11:47:47.052+05:30	14
376	19.119803044013679	72.9136959090828896	2019-04-11 11:49:26.069+05:30	2019-04-11 11:49:26.069+05:30	14
378	19.119803044013679	72.9136959090828896	2019-04-11 11:55:46.306+05:30	2019-04-11 11:55:46.306+05:30	14
380	19.119803044013679	72.9136959090828896	2019-04-11 12:00:36.668+05:30	2019-04-11 12:00:36.668+05:30	14
382	19.119803044013679	72.9136959090828896	2019-04-11 12:05:00.582+05:30	2019-04-11 12:05:00.582+05:30	14
384	19.1189781999999973	72.9136218999999954	2019-04-11 12:14:46.56+05:30	2019-04-11 12:14:46.56+05:30	14
386	19.1189781999999973	72.9136218999999954	2019-04-11 12:16:17.461+05:30	2019-04-11 12:16:17.461+05:30	14
388	19.1189781999999973	72.9136218999999954	2019-04-11 12:22:57.87+05:30	2019-04-11 12:22:57.87+05:30	14
390	19.1197792394086719	72.913045808672905	2019-04-11 12:47:45.332+05:30	2019-04-11 12:47:45.332+05:30	14
392	19.119803044013679	72.9136959090828896	2019-04-11 14:29:09.59+05:30	2019-04-11 14:29:09.59+05:30	14
394	19.1189442000000014	72.9136031000000031	2019-04-11 17:10:44.62+05:30	2019-04-11 17:10:44.62+05:30	14
396	19.1189442000000014	72.9136031000000031	2019-04-11 17:12:47.183+05:30	2019-04-11 17:12:47.183+05:30	14
398	19.1189442000000014	72.9136031000000031	2019-04-11 17:15:30.295+05:30	2019-04-11 17:15:30.295+05:30	14
400	19.1189442000000014	72.9136031000000031	2019-04-11 17:18:58.993+05:30	2019-04-11 17:18:58.993+05:30	14
402	19.1189442000000014	72.9136031000000031	2019-04-11 17:25:25.468+05:30	2019-04-11 17:25:25.468+05:30	14
404	19.1189442000000014	72.9136031000000031	2019-04-11 17:28:59.935+05:30	2019-04-11 17:28:59.935+05:30	14
406	19.119803044013679	72.9136959090828896	2019-04-11 17:41:24.789+05:30	2019-04-11 17:41:24.789+05:30	14
408	19.119803044013679	72.9136959090828896	2019-04-11 18:31:48.541+05:30	2019-04-11 18:31:48.541+05:30	14
410	19.1121088999999991	72.8984173999999996	2019-04-11 22:50:47.577+05:30	2019-04-11 22:50:47.577+05:30	14
412	19.1120705999999991	72.8983649000000042	2019-04-12 08:42:44.474+05:30	2019-04-12 08:42:44.474+05:30	14
414	19.1190828708931804	72.9137285985052586	2019-04-12 19:00:09.1+05:30	2019-04-12 19:00:09.1+05:30	14
416	19.1120921000000017	72.8983896999999956	2019-04-13 06:07:42.166+05:30	2019-04-13 06:07:42.166+05:30	14
418	19.1189675000000001	72.9135954999999996	2019-04-13 16:33:59.561+05:30	2019-04-13 16:33:59.561+05:30	14
420	19.111591293476522	72.8983919788151979	2019-04-14 03:27:42.537+05:30	2019-04-14 03:27:42.537+05:30	14
158	19.1189408000000007	72.9136009000000058	2019-03-19 14:17:03.507+05:30	2019-03-19 14:17:03.507+05:30	\N
422	19.1120783000000003	72.8983690999999965	2019-04-14 14:31:13.009+05:30	2019-04-14 14:31:13.009+05:30	14
424	19.1118443000000013	72.8983869999999996	2019-04-15 01:29:06.358+05:30	2019-04-15 01:29:06.358+05:30	14
426	19.1189718999999982	72.9136158000000023	2019-04-15 11:50:02.903+05:30	2019-04-15 11:50:02.903+05:30	14
428	19.1102877999999947	72.8662419999999997	2019-04-15 16:50:37.47+05:30	2019-04-15 16:50:37.47+05:30	14
430	19.1041216999999968	72.8581020999999964	2019-04-15 17:24:34.071+05:30	2019-04-15 17:24:34.071+05:30	14
432	19.0569252999999996	72.8517324999999971	2019-04-15 18:09:42.397+05:30	2019-04-15 18:09:42.397+05:30	14
434	19.1121514599999998	72.898553789999994	2019-04-15 22:19:11.485+05:30	2019-04-15 22:19:11.485+05:30	14
436	19.0963591000000008	72.8739491000000044	2019-04-16 07:41:22.986+05:30	2019-04-16 07:41:22.986+05:30	14
1	19.1168956970795954	72.9023309703916311	2019-03-06 14:23:36.741+05:30	2019-03-06 14:23:36.741+05:30	\N
2	19.1168956970795954	72.9023309703916311	2019-03-06 14:24:36.871+05:30	2019-03-06 14:24:36.871+05:30	\N
3	19.1168956970795954	72.9023309703916311	2019-03-06 14:25:08.198+05:30	2019-03-06 14:25:08.198+05:30	\N
4	19.1168956970795954	72.9023309703916311	2019-03-06 14:25:13.212+05:30	2019-03-06 14:25:13.212+05:30	\N
5	19.1168956970795954	72.9023309703916311	2019-03-06 14:26:08.068+05:30	2019-03-06 14:26:08.068+05:30	\N
6	19.1168956970795954	72.9023309703916311	2019-03-06 14:28:45.231+05:30	2019-03-06 14:28:45.231+05:30	\N
7	19.1168956970795954	72.9023309703916311	2019-03-06 14:32:56.448+05:30	2019-03-06 14:32:56.448+05:30	\N
8	19.1168956970795954	72.9023309703916311	2019-03-06 14:42:00.208+05:30	2019-03-06 14:42:00.208+05:30	\N
9	19.1168956970795954	72.9023309703916311	2019-03-06 14:46:31.323+05:30	2019-03-06 14:46:31.323+05:30	\N
108	19.1227124000000011	72.8910611999999816	2019-03-07 14:59:01.807+05:30	2019-03-07 14:59:01.807+05:30	\N
10	19.1168956970795954	72.9023309703916311	2019-03-06 14:48:04.181+05:30	2019-03-06 14:48:04.181+05:30	\N
11	19.1168956970795954	72.9023309703916311	2019-03-06 14:48:34.568+05:30	2019-03-06 14:48:34.568+05:30	\N
12	19.1168956970795954	72.9023309703916311	2019-03-06 14:49:35.072+05:30	2019-03-06 14:49:35.072+05:30	\N
13	19.1168956970795954	72.9023309703916311	2019-03-06 14:57:06.233+05:30	2019-03-06 14:57:06.233+05:30	\N
14	19.1168956970795954	72.9023309703916311	2019-03-06 15:05:06.41+05:30	2019-03-06 15:05:06.41+05:30	\N
15	19.1168956970795954	72.9023309703916311	2019-03-06 15:21:10.696+05:30	2019-03-06 15:21:10.696+05:30	\N
16	19.1168956970795954	72.9023309703916311	2019-03-06 15:54:17.829+05:30	2019-03-06 15:54:17.829+05:30	\N
17	19.1168956970795954	72.9023309703916311	2019-03-06 16:31:29.462+05:30	2019-03-06 16:31:29.462+05:30	\N
18	19.1168956970795954	72.9023309703916311	2019-03-06 16:32:36.213+05:30	2019-03-06 16:32:36.213+05:30	\N
19	19.1168956970795954	72.9023309703916311	2019-03-06 16:34:00.232+05:30	2019-03-06 16:34:00.232+05:30	\N
20	19.1168956970795954	72.9023309703916311	2019-03-06 16:35:46.493+05:30	2019-03-06 16:35:46.493+05:30	\N
21	19.1168956970795954	72.9023309703916311	2019-03-06 16:36:16.414+05:30	2019-03-06 16:36:16.414+05:30	\N
22	19.1168956970795954	72.9023309703916311	2019-03-06 16:36:46.581+05:30	2019-03-06 16:36:46.581+05:30	\N
23	19.1168956970795954	72.9023309703916311	2019-03-06 16:39:37.142+05:30	2019-03-06 16:39:37.142+05:30	\N
24	19.1168956970795954	72.9023309703916311	2019-03-06 16:43:37.345+05:30	2019-03-06 16:43:37.345+05:30	\N
25	19.1168956970795954	72.9023309703916311	2019-03-06 16:51:58.515+05:30	2019-03-06 16:51:58.515+05:30	\N
26	19.1168956970795954	72.9023309703916311	2019-03-06 17:08:01.641+05:30	2019-03-06 17:08:01.641+05:30	\N
27	19.1168956970795954	72.9023309703916311	2019-03-06 17:40:02.512+05:30	2019-03-06 17:40:02.512+05:30	\N
28	19.1536134000000011	72.9654335999999972	2019-03-06 18:48:13.603+05:30	2019-03-06 18:48:13.603+05:30	\N
29	19.1181561999999978	73.0042530000000056	2019-03-06 20:57:24.176+05:30	2019-03-06 20:57:24.176+05:30	\N
30	19.1181386000000018	73.0042732000000001	2019-03-07 01:59:23.346+05:30	2019-03-07 01:59:23.346+05:30	\N
31	19.1181386000000018	73.0042732000000001	2019-03-07 07:01:55.976+05:30	2019-03-07 07:01:55.976+05:30	\N
32	19.1189387999999951	72.9136270999999994	2019-03-07 09:58:35.612+05:30	2019-03-07 09:58:35.612+05:30	\N
33	19.1189436999999991	72.9136086999999975	2019-03-07 10:00:32.021+05:30	2019-03-07 10:00:32.021+05:30	\N
34	19.1189436999999991	72.9136086999999975	2019-03-07 10:00:37.643+05:30	2019-03-07 10:00:37.643+05:30	\N
35	19.1189436999999991	72.9136086999999975	2019-03-07 10:02:26.552+05:30	2019-03-07 10:02:26.552+05:30	\N
36	19.1189436999999991	72.9136086999999975	2019-03-07 10:03:07.602+05:30	2019-03-07 10:03:07.602+05:30	\N
37	19.1189436999999991	72.9136086999999975	2019-03-07 10:04:07.445+05:30	2019-03-07 10:04:07.445+05:30	\N
38	19.1189436999999991	72.9136086999999975	2019-03-07 10:06:50.909+05:30	2019-03-07 10:06:50.909+05:30	\N
39	19.1189436999999991	72.9136086999999975	2019-03-07 10:09:45.156+05:30	2019-03-07 10:09:45.156+05:30	\N
40	19.1189436999999991	72.9136086999999975	2019-03-07 10:10:13.481+05:30	2019-03-07 10:10:13.481+05:30	\N
41	19.1189436999999991	72.9136086999999975	2019-03-07 10:12:36.15+05:30	2019-03-07 10:12:36.15+05:30	\N
42	19.1189436999999991	72.9136086999999975	2019-03-07 10:13:25.218+05:30	2019-03-07 10:13:25.218+05:30	\N
43	19.1189436999999991	72.9136086999999975	2019-03-07 10:17:41.022+05:30	2019-03-07 10:17:41.022+05:30	\N
44	19.1189436999999991	72.9136086999999975	2019-03-07 10:21:41.859+05:30	2019-03-07 10:21:41.859+05:30	\N
45	19.1189436999999991	72.9136086999999975	2019-03-07 10:27:42.966+05:30	2019-03-07 10:27:42.966+05:30	\N
46	19.1189436999999991	72.9136086999999975	2019-03-07 10:28:12.944+05:30	2019-03-07 10:28:12.944+05:30	\N
47	19.1189436999999991	72.9136086999999975	2019-03-07 10:29:11.342+05:30	2019-03-07 10:29:11.342+05:30	\N
48	19.1189436999999991	72.9136086999999975	2019-03-07 10:31:51.42+05:30	2019-03-07 10:31:51.42+05:30	\N
49	19.1189436999999991	72.9136086999999975	2019-03-07 10:36:42.931+05:30	2019-03-07 10:36:42.931+05:30	\N
50	19.1189436999999991	72.9136086999999975	2019-03-07 10:44:44.746+05:30	2019-03-07 10:44:44.746+05:30	\N
51	19.1189436999999991	72.9136086999999975	2019-03-07 11:00:53.209+05:30	2019-03-07 11:00:53.209+05:30	\N
52	19.1189436999999991	72.9136086999999975	2019-03-07 11:02:31.757+05:30	2019-03-07 11:02:31.757+05:30	\N
53	19.1189436999999991	72.9136086999999975	2019-03-07 11:03:00.556+05:30	2019-03-07 11:03:00.556+05:30	\N
54	19.1189436999999991	72.9136086999999975	2019-03-07 11:04:00.163+05:30	2019-03-07 11:04:00.163+05:30	\N
55	19.1189436999999991	72.9136086999999975	2019-03-07 11:06:00.684+05:30	2019-03-07 11:06:00.684+05:30	\N
56	19.1189436999999991	72.9136086999999975	2019-03-07 11:07:41.797+05:30	2019-03-07 11:07:41.797+05:30	\N
57	19.1189436999999991	72.9136086999999975	2019-03-07 11:09:11.996+05:30	2019-03-07 11:09:11.996+05:30	\N
58	19.1189436999999991	72.9136086999999975	2019-03-07 11:09:43.667+05:30	2019-03-07 11:09:43.667+05:30	\N
59	19.1189436999999991	72.9136086999999975	2019-03-07 11:11:13.896+05:30	2019-03-07 11:11:13.896+05:30	\N
60	19.1189436999999991	72.9136086999999975	2019-03-07 11:11:45.669+05:30	2019-03-07 11:11:45.669+05:30	\N
61	19.1189436999999991	72.9136086999999975	2019-03-07 11:12:55.48+05:30	2019-03-07 11:12:55.48+05:30	\N
62	19.1189436999999991	72.9136086999999975	2019-03-07 11:13:27.017+05:30	2019-03-07 11:13:27.017+05:30	\N
63	19.1189436999999991	72.9136086999999975	2019-03-07 11:16:01.774+05:30	2019-03-07 11:16:01.774+05:30	\N
64	19.1189436999999991	72.9136086999999975	2019-03-07 11:16:31.514+05:30	2019-03-07 11:16:31.514+05:30	\N
65	19.1189436999999991	72.9136086999999975	2019-03-07 11:17:32.249+05:30	2019-03-07 11:17:32.249+05:30	\N
66	19.1189436999999991	72.9136086999999975	2019-03-07 11:19:31.9+05:30	2019-03-07 11:19:31.9+05:30	\N
67	19.1189436999999991	72.9136086999999975	2019-03-07 11:23:31.902+05:30	2019-03-07 11:23:31.902+05:30	\N
68	19.1189436999999991	72.9136086999999975	2019-03-07 11:30:55.394+05:30	2019-03-07 11:30:55.394+05:30	\N
69	19.1189436999999991	72.9136086999999975	2019-03-07 11:31:29.414+05:30	2019-03-07 11:31:29.414+05:30	\N
70	19.1189436999999991	72.9136086999999975	2019-03-07 11:32:29.48+05:30	2019-03-07 11:32:29.48+05:30	\N
71	19.119634099999999	72.9139143000000018	2019-03-07 11:35:53.069+05:30	2019-03-07 11:35:53.069+05:30	\N
72	19.119634099999999	72.9139143000000018	2019-03-07 11:36:23.239+05:30	2019-03-07 11:36:23.239+05:30	\N
73	19.119634099999999	72.9139143000000018	2019-03-07 11:37:26.404+05:30	2019-03-07 11:37:26.404+05:30	\N
74	19.119634099999999	72.9139143000000018	2019-03-07 11:39:26.55+05:30	2019-03-07 11:39:26.55+05:30	\N
75	19.119634099999999	72.9139143000000018	2019-03-07 11:43:28.731+05:30	2019-03-07 11:43:28.731+05:30	\N
76	19.119634099999999	72.9139143000000018	2019-03-07 11:51:28.868+05:30	2019-03-07 11:51:28.868+05:30	\N
77	19.119634099999999	72.9139143000000018	2019-03-07 11:56:15.069+05:30	2019-03-07 11:56:15.069+05:30	\N
78	19.1189235999999987	72.9136223000000001	2019-03-07 11:58:02.897+05:30	2019-03-07 11:58:02.897+05:30	\N
79	19.1189235999999987	72.9136223000000001	2019-03-07 11:58:50.815+05:30	2019-03-07 11:58:50.815+05:30	\N
80	19.1189235999999987	72.9136223000000001	2019-03-07 12:06:35.721+05:30	2019-03-07 12:06:35.721+05:30	\N
81	19.1189235999999987	72.9136223000000001	2019-03-07 12:18:50.719+05:30	2019-03-07 12:18:50.719+05:30	\N
82	19.1189235999999987	72.9136223000000001	2019-03-07 12:31:32.788+05:30	2019-03-07 12:31:32.788+05:30	\N
83	19.1189235999999987	72.9136223000000001	2019-03-07 12:35:31.995+05:30	2019-03-07 12:35:31.995+05:30	\N
84	19.1189235999999987	72.9136223000000001	2019-03-07 12:44:40.627+05:30	2019-03-07 12:44:40.627+05:30	\N
85	19.1189235999999987	72.9136223000000001	2019-03-07 12:45:10.899+05:30	2019-03-07 12:45:10.899+05:30	\N
86	19.1189235999999987	72.9136223000000001	2019-03-07 12:48:07.647+05:30	2019-03-07 12:48:07.647+05:30	\N
87	19.1189235999999987	72.9136223000000001	2019-03-07 12:48:38.116+05:30	2019-03-07 12:48:38.116+05:30	\N
88	19.1189235999999987	72.9136223000000001	2019-03-07 12:49:36.102+05:30	2019-03-07 12:49:36.102+05:30	\N
89	19.1189235999999987	72.9136223000000001	2019-03-07 13:01:38.409+05:30	2019-03-07 13:01:38.409+05:30	\N
90	19.1189235999999987	72.9136223000000001	2019-03-07 13:02:14.871+05:30	2019-03-07 13:02:14.871+05:30	\N
91	19.1189235999999987	72.9136223000000001	2019-03-07 13:05:43.639+05:30	2019-03-07 13:05:43.639+05:30	\N
92	19.1189235999999987	72.9136223000000001	2019-03-07 13:23:43.822+05:30	2019-03-07 13:23:43.822+05:30	\N
93	19.1189235999999987	72.9136223000000001	2019-03-07 13:43:50.22+05:30	2019-03-07 13:43:50.22+05:30	\N
94	19.1189235999999987	72.9136223000000001	2019-03-07 14:09:56.92+05:30	2019-03-07 14:09:56.92+05:30	\N
95	19.1189235999999987	72.9136223000000001	2019-03-07 14:12:07.664+05:30	2019-03-07 14:12:07.664+05:30	\N
96	19.1189208999999991	72.9136320000000069	2019-03-07 14:12:26.08+05:30	2019-03-07 14:12:26.08+05:30	\N
97	19.1189208999999991	72.9136320000000069	2019-03-07 14:12:38.165+05:30	2019-03-07 14:12:38.165+05:30	\N
98	19.1188564999999997	72.9136184000000043	2019-03-07 14:15:43.419+05:30	2019-03-07 14:15:43.419+05:30	\N
99	19.1188564999999997	72.9136184000000043	2019-03-07 14:17:59.964+05:30	2019-03-07 14:17:59.964+05:30	\N
100	19.1188564999999997	72.9136184000000043	2019-03-07 14:22:18.819+05:30	2019-03-07 14:22:18.819+05:30	\N
101	19.1179787999999995	72.9119122000000033	2019-03-07 14:30:39.407+05:30	2019-03-07 14:30:39.407+05:30	\N
102	19.1179787999999995	72.9119122000000033	2019-03-07 14:43:22.586+05:30	2019-03-07 14:43:22.586+05:30	\N
103	19.1226686000000008	72.8911700999999823	2019-03-07 14:45:36.469+05:30	2019-03-07 14:45:36.469+05:30	\N
104	19.1226686000000008	72.8911700999999823	2019-03-07 14:48:43.402+05:30	2019-03-07 14:48:43.402+05:30	\N
105	19.1226686000000008	72.8911700999999823	2019-03-07 14:48:51.213+05:30	2019-03-07 14:48:51.213+05:30	\N
106	19.1226686000000008	72.8911700999999823	2019-03-07 14:50:20.963+05:30	2019-03-07 14:50:20.963+05:30	\N
107	19.1227124000000011	72.8910611999999816	2019-03-07 14:56:18.599+05:30	2019-03-07 14:56:18.599+05:30	\N
109	19.1227124000000011	72.8910611999999816	2019-03-07 15:09:38.168+05:30	2019-03-07 15:09:38.168+05:30	\N
110	19.1227124000000011	72.8910611999999816	2019-03-07 15:18:54.145+05:30	2019-03-07 15:18:54.145+05:30	\N
111	19.1227124000000011	72.8910611999999816	2019-03-07 15:35:16.972+05:30	2019-03-07 15:35:16.972+05:30	\N
112	19.1227124000000011	72.8910611999999816	2019-03-07 16:11:21.225+05:30	2019-03-07 16:11:21.225+05:30	\N
113	19.123257670000001	72.9128288699999985	2019-03-07 17:17:06.19+05:30	2019-03-07 17:17:06.19+05:30	\N
114	19.1249521999999992	73.0071228999999988	2019-03-07 19:25:18.499+05:30	2019-03-07 19:25:18.499+05:30	\N
115	19.112159099999996	72.8985501999999883	2019-03-07 23:51:29.594+05:30	2019-03-07 23:51:29.594+05:30	\N
116	19.1120404899999983	72.8987944699999986	2019-03-08 07:05:03.331+05:30	2019-03-08 07:05:03.331+05:30	\N
117	19.1212315400000001	72.9128456600000021	2019-03-08 12:06:35.779+05:30	2019-03-08 12:06:35.779+05:30	\N
118	19.0128164599999998	72.854672739999998	2019-03-08 17:11:38.256+05:30	2019-03-08 17:11:38.256+05:30	\N
119	19.1121925999999966	72.8984925000000032	2019-03-08 22:11:39.951+05:30	2019-03-08 22:11:39.951+05:30	\N
120	19.1121443000000006	72.8985169999999982	2019-03-09 03:11:41.434+05:30	2019-03-09 03:11:41.434+05:30	\N
121	19.1121547999999954	72.898517599999991	2019-03-09 08:18:06.881+05:30	2019-03-09 08:18:06.881+05:30	\N
122	19.1156539000000016	72.9087252000000063	2019-03-09 13:23:17.856+05:30	2019-03-09 13:23:17.856+05:30	\N
123	19.1121397000000002	72.8985529999999926	2019-03-09 18:26:13.298+05:30	2019-03-09 18:26:13.298+05:30	\N
124	19.1121397000000002	72.8985529999999926	2019-03-10 01:48:35.753+05:30	2019-03-10 01:48:35.753+05:30	\N
125	19.1121397000000002	72.8985529999999926	2019-03-10 06:48:49.351+05:30	2019-03-10 06:48:49.351+05:30	\N
126	19.1134541999999996	72.8986047700000057	2019-03-10 11:57:34.574+05:30	2019-03-10 11:57:34.574+05:30	\N
127	19.1132086236029863	72.8985696751624346	2019-03-10 17:29:02.221+05:30	2019-03-10 17:29:02.221+05:30	\N
128	19.1121373400000003	72.8985462600000034	2019-03-10 22:37:37.588+05:30	2019-03-10 22:37:37.588+05:30	\N
129	19.1121313999999991	72.8985272000000037	2019-03-11 05:58:56.287+05:30	2019-03-11 05:58:56.287+05:30	\N
130	19.1121425000000009	72.8985531999999949	2019-03-11 21:38:02.573+05:30	2019-03-11 21:38:02.573+05:30	\N
131	19.1121425000000009	72.8985531999999949	2019-03-12 07:03:49.291+05:30	2019-03-12 07:03:49.291+05:30	\N
132	19.1189436000000015	72.9136234999999999	2019-03-18 10:07:43.505+05:30	2019-03-18 10:07:43.505+05:30	\N
133	19.1189436000000015	72.9136234999999999	2019-03-18 10:09:45.172+05:30	2019-03-18 10:09:45.172+05:30	\N
134	19.1189436000000015	72.9136234999999999	2019-03-18 10:09:48.984+05:30	2019-03-18 10:09:48.984+05:30	\N
135	19.1189436000000015	72.9136234999999999	2019-03-18 10:11:24.946+05:30	2019-03-18 10:11:24.946+05:30	\N
136	19.1189436000000015	72.9136234999999999	2019-03-18 10:12:15.818+05:30	2019-03-18 10:12:15.818+05:30	\N
137	19.1191724734380841	72.9137430153787136	2019-03-18 10:13:11.266+05:30	2019-03-18 10:13:11.266+05:30	\N
138	19.1191724734380841	72.9137430153787136	2019-03-18 10:14:47.139+05:30	2019-03-18 10:14:47.139+05:30	\N
139	19.1191724734380841	72.9137430153787136	2019-03-18 10:26:30.236+05:30	2019-03-18 10:26:30.236+05:30	\N
140	19.1189588999999991	72.9136060999999955	2019-03-18 10:38:34.151+05:30	2019-03-18 10:38:34.151+05:30	\N
141	19.1189588999999991	72.9136060999999955	2019-03-18 10:56:42.064+05:30	2019-03-18 10:56:42.064+05:30	\N
142	19.1305772999999988	72.8577832000000001	2019-03-18 14:49:33.636+05:30	2019-03-18 14:49:33.636+05:30	\N
143	18.9991963999999989	72.8286314000000061	2019-03-18 16:07:32.825+05:30	2019-03-18 16:07:32.825+05:30	\N
144	18.9991963999999989	72.8286314000000061	2019-03-18 16:09:09.683+05:30	2019-03-18 16:09:09.683+05:30	\N
145	18.9991963999999989	72.8286314000000061	2019-03-18 16:09:59.919+05:30	2019-03-18 16:09:59.919+05:30	\N
146	18.9991963999999989	72.8286314000000061	2019-03-18 16:11:42.197+05:30	2019-03-18 16:11:42.197+05:30	\N
147	18.9991963999999989	72.8286314000000061	2019-03-18 16:14:08.873+05:30	2019-03-18 16:14:08.873+05:30	\N
148	18.9991963999999989	72.8286314000000061	2019-03-18 16:18:18.678+05:30	2019-03-18 16:18:18.678+05:30	\N
149	18.9992055999999998	72.8286441000000053	2019-03-18 16:21:41.609+05:30	2019-03-18 16:21:41.609+05:30	\N
150	18.9992055999999998	72.8286441000000053	2019-03-18 16:37:49.964+05:30	2019-03-18 16:37:49.964+05:30	\N
151	18.9992055999999998	72.8286441000000053	2019-03-18 16:50:30.753+05:30	2019-03-18 16:50:30.753+05:30	\N
152	19.0221018000000015	72.8443474000000037	2019-03-18 16:53:19.666+05:30	2019-03-18 16:53:19.666+05:30	\N
153	19.0297957000000011	72.8572711000000055	2019-03-18 17:00:24.318+05:30	2019-03-18 17:00:24.318+05:30	\N
154	19.0756501000000007	72.9142623999999984	2019-03-18 17:15:22.799+05:30	2019-03-18 17:15:22.799+05:30	\N
155	19.1121017000000002	72.8985153999999937	2019-03-18 22:14:53.714+05:30	2019-03-18 22:14:53.714+05:30	\N
156	19.1121352999999985	72.8985131000000024	2019-03-19 04:02:16.677+05:30	2019-03-19 04:02:16.677+05:30	\N
157	19.1121071799999989	72.8985222499999992	2019-03-19 09:17:04.795+05:30	2019-03-19 09:17:04.795+05:30	\N
159	19.011622899999999	72.831981099999993	2019-03-19 14:58:50.244+05:30	2019-03-19 14:58:50.244+05:30	\N
160	19.1189445000000013	72.9136026999999984	2019-03-20 16:18:32.977+05:30	2019-03-20 16:18:32.977+05:30	\N
161	19.1189445000000013	72.9136026999999984	2019-03-20 16:19:10.649+05:30	2019-03-20 16:19:10.649+05:30	\N
162	19.1189445000000013	72.9136026999999984	2019-03-20 16:20:15.895+05:30	2019-03-20 16:20:15.895+05:30	\N
163	19.1189445000000013	72.9136026999999984	2019-03-20 16:20:44.816+05:30	2019-03-20 16:20:44.816+05:30	\N
164	19.1189445000000013	72.9136026999999984	2019-03-20 16:21:46.088+05:30	2019-03-20 16:21:46.088+05:30	\N
165	19.1189445000000013	72.9136026999999984	2019-03-20 16:24:26.518+05:30	2019-03-20 16:24:26.518+05:30	\N
166	19.1189445000000013	72.9136026999999984	2019-03-20 16:28:29.773+05:30	2019-03-20 16:28:29.773+05:30	\N
167	19.1189445000000013	72.9136026999999984	2019-03-20 16:36:31.075+05:30	2019-03-20 16:36:31.075+05:30	\N
168	19.1189445000000013	72.9136026999999984	2019-03-20 16:52:53.741+05:30	2019-03-20 16:52:53.741+05:30	\N
169	19.1189445000000013	72.9136026999999984	2019-03-20 17:24:54.034+05:30	2019-03-20 17:24:54.034+05:30	\N
170	19.1189445000000013	72.9136026999999984	2019-03-20 17:28:36.805+05:30	2019-03-20 17:28:36.805+05:30	\N
171	19.1189445000000013	72.9136026999999984	2019-03-20 17:30:25.164+05:30	2019-03-20 17:30:25.164+05:30	\N
172	19.1189445000000013	72.9136026999999984	2019-03-20 17:31:03.208+05:30	2019-03-20 17:31:03.208+05:30	\N
173	19.1189445000000013	72.9136026999999984	2019-03-20 17:32:09.188+05:30	2019-03-20 17:32:09.188+05:30	\N
174	19.1189445000000013	72.9136026999999984	2019-03-20 17:34:09.401+05:30	2019-03-20 17:34:09.401+05:30	\N
175	19.1189445000000013	72.9136026999999984	2019-03-20 17:38:20.226+05:30	2019-03-20 17:38:20.226+05:30	\N
176	19.1189445000000013	72.9136026999999984	2019-03-20 17:46:32.448+05:30	2019-03-20 17:46:32.448+05:30	\N
177	19.1189445000000013	72.9136026999999984	2019-03-20 17:47:53.969+05:30	2019-03-20 17:47:53.969+05:30	\N
178	19.1189445000000013	72.9136026999999984	2019-03-20 17:48:24.157+05:30	2019-03-20 17:48:24.157+05:30	\N
179	19.1189445000000013	72.9136026999999984	2019-03-20 17:49:24.587+05:30	2019-03-20 17:49:24.587+05:30	\N
180	19.1189445000000013	72.9136026999999984	2019-03-20 17:52:05.385+05:30	2019-03-20 17:52:05.385+05:30	\N
181	19.1189445000000013	72.9136026999999984	2019-03-20 17:56:11.977+05:30	2019-03-20 17:56:11.977+05:30	\N
182	19.1189445000000013	72.9136026999999984	2019-03-20 18:04:13.651+05:30	2019-03-20 18:04:13.651+05:30	\N
183	19.1189445000000013	72.9136026999999984	2019-03-20 18:22:08.252+05:30	2019-03-20 18:22:08.252+05:30	\N
184	19.1189445000000013	72.9136026999999984	2019-03-20 18:57:21.493+05:30	2019-03-20 18:57:21.493+05:30	\N
185	19.1181565000000013	73.004253300000002	2019-03-21 10:42:48.246+05:30	2019-03-21 10:42:48.246+05:30	\N
186	19.1181565000000013	73.004253300000002	2019-03-21 10:43:21.295+05:30	2019-03-21 10:43:21.295+05:30	\N
187	19.1181570000000001	73.0042528000000033	2019-03-21 10:44:19.916+05:30	2019-03-21 10:44:19.916+05:30	\N
188	19.1181570000000001	73.0042528000000033	2019-03-21 10:46:49.866+05:30	2019-03-21 10:46:49.866+05:30	\N
189	19.1181570000000001	73.0042528000000033	2019-03-21 10:51:06.797+05:30	2019-03-21 10:51:06.797+05:30	\N
190	19.1181570000000001	73.0042528000000033	2019-03-21 11:00:08.391+05:30	2019-03-21 11:00:08.391+05:30	\N
191	19.1181570000000001	73.0042528000000033	2019-03-21 11:16:26.701+05:30	2019-03-21 11:16:26.701+05:30	\N
192	19.1181570000000001	73.0042528000000033	2019-03-21 11:52:10.648+05:30	2019-03-21 11:52:10.648+05:30	\N
193	19.1181441999999997	73.0042533999999961	2019-03-21 12:56:13.999+05:30	2019-03-21 12:56:13.999+05:30	\N
194	19.1181441999999997	73.0042533999999961	2019-03-21 15:20:01.101+05:30	2019-03-21 15:20:01.101+05:30	\N
195	19.1181184000000002	73.0042610999999937	2019-03-21 21:54:34.185+05:30	2019-03-21 21:54:34.185+05:30	\N
196	19.1181629000000015	73.0042360000000059	2019-03-22 05:58:39.301+05:30	2019-03-22 05:58:39.301+05:30	\N
197	19.1189761000000011	72.9135837999999978	2019-03-22 20:23:05.347+05:30	2019-03-22 20:23:05.347+05:30	\N
198	19.1181374999999996	73.0042616000000066	2019-03-23 06:34:24.639+05:30	2019-03-23 06:34:24.639+05:30	\N
199	19.1181491000000001	73.0042655000000025	2019-03-23 13:18:04.955+05:30	2019-03-23 13:18:04.955+05:30	\N
200	19.1181404999999991	73.0042523999999986	2019-03-23 20:00:22.856+05:30	2019-03-23 20:00:22.856+05:30	\N
201	19.1181280999999998	73.0042811	2019-03-24 01:57:15.908+05:30	2019-03-24 01:57:15.908+05:30	\N
202	19.1181141999999973	73.0042868999999968	2019-03-24 07:00:16.94+05:30	2019-03-24 07:00:16.94+05:30	\N
203	19.1181389999999993	73.0042739000000012	2019-03-24 14:51:29.534+05:30	2019-03-24 14:51:29.534+05:30	\N
204	19.1181389999999993	73.0042739000000012	2019-03-24 20:03:33.198+05:30	2019-03-24 20:03:33.198+05:30	\N
205	19.1181266000000001	73.0042822000000058	2019-03-25 06:28:38.006+05:30	2019-03-25 06:28:38.006+05:30	\N
208	19.1189576999999957	72.9135954999999996	2019-03-25 17:42:03.78+05:30	2019-03-25 17:42:03.78+05:30	14
211	19.1189576999999957	72.9135954999999996	2019-03-25 17:49:10.09+05:30	2019-03-25 17:49:10.09+05:30	14
214	19.1189576999999957	72.9135954999999996	2019-03-25 17:53:22.188+05:30	2019-03-25 17:53:22.188+05:30	14
217	19.1199490986764431	72.912919158115983	2019-03-25 18:03:37.711+05:30	2019-03-25 18:03:37.711+05:30	14
220	19.1189742000000003	72.9135945000000021	2019-03-25 18:11:29.463+05:30	2019-03-25 18:11:29.463+05:30	14
223	19.118961800000001	72.9135787999999962	2019-03-25 19:17:58.947+05:30	2019-03-25 19:17:58.947+05:30	14
226	19.1199490986764431	72.912919158115983	2019-03-25 19:30:03.312+05:30	2019-03-25 19:30:03.312+05:30	14
229	19.1189543999999998	72.9135940999999974	2019-03-25 19:55:39.139+05:30	2019-03-25 19:55:39.139+05:30	14
232	19.1190800000000003	72.9137082999999961	2019-03-25 20:18:12.463+05:30	2019-03-25 20:18:12.463+05:30	14
235	19.1190800000000003	72.9137082999999961	2019-03-25 20:22:23.389+05:30	2019-03-25 20:22:23.389+05:30	14
238	19.1199490986764431	72.912919158115983	2019-03-25 20:31:14.728+05:30	2019-03-25 20:31:14.728+05:30	14
241	19.1199490986764431	72.912919158115983	2019-03-25 20:47:10.348+05:30	2019-03-25 20:47:10.348+05:30	14
244	19.1181379999999983	73.0042617000000007	2019-03-26 02:57:49.797+05:30	2019-03-26 02:57:49.797+05:30	14
247	19.1189707999999996	72.9136261999999959	2019-03-26 15:10:06.276+05:30	2019-03-26 15:10:06.276+05:30	14
250	19.1189689999999999	72.9136101999999937	2019-03-26 15:17:44.551+05:30	2019-03-26 15:17:44.551+05:30	14
253	19.1189797000000006	72.9136232000000035	2019-03-26 16:19:10.996+05:30	2019-03-26 16:19:10.996+05:30	14
256	19.1399221799999992	73.0025818700000002	2019-03-27 11:30:38.583+05:30	2019-03-27 11:30:38.583+05:30	14
259	19.1181179999999991	73.004296999999994	2019-03-28 06:40:23.72+05:30	2019-03-28 06:40:23.72+05:30	14
262	19.1181197999999988	73.0042959000000025	2019-03-29 00:33:44.738+05:30	2019-03-29 00:33:44.738+05:30	14
265	19.1189678000000001	72.9135976000000028	2019-03-29 16:50:42.37+05:30	2019-03-29 16:50:42.37+05:30	14
268	19.1181248000000004	73.0042841000000067	2019-03-30 12:08:11.649+05:30	2019-03-30 12:08:11.649+05:30	14
271	19.1181196	73.0042820000000034	2019-03-31 06:32:36.256+05:30	2019-03-31 06:32:36.256+05:30	14
274	19.1181280999999998	73.0042753000000033	2019-04-01 06:31:37.948+05:30	2019-04-01 06:31:37.948+05:30	14
277	19.1113944999999958	72.8974572999999992	2019-04-01 22:04:58.338+05:30	2019-04-01 22:04:58.338+05:30	14
280	19.1121310999999956	72.8986555999999979	2019-04-03 03:02:13.28+05:30	2019-04-03 03:02:13.28+05:30	14
283	19.1189712999999983	72.913590499999998	2019-04-03 11:18:40.29+05:30	2019-04-03 11:18:40.29+05:30	14
286	19.1189712999999983	72.913590499999998	2019-04-03 11:33:21.084+05:30	2019-04-03 11:33:21.084+05:30	14
289	19.1189663000000003	72.9136000999999965	2019-04-03 11:45:16.779+05:30	2019-04-03 11:45:16.779+05:30	14
292	19.1189663000000003	72.9136000999999965	2019-04-03 11:48:47.273+05:30	2019-04-03 11:48:47.273+05:30	14
295	19.1189663000000003	72.9136000999999965	2019-04-03 11:59:36.742+05:30	2019-04-03 11:59:36.742+05:30	14
298	19.1189663000000003	72.9136000999999965	2019-04-03 12:06:10.327+05:30	2019-04-03 12:06:10.327+05:30	14
301	19.1189663000000003	72.9136000999999965	2019-04-03 12:10:30.709+05:30	2019-04-03 12:10:30.709+05:30	14
304	19.1189663000000003	72.9136000999999965	2019-04-03 12:36:17.214+05:30	2019-04-03 12:36:17.214+05:30	14
307	19.1189663000000003	72.9136000999999965	2019-04-03 12:40:18.394+05:30	2019-04-03 12:40:18.394+05:30	14
310	19.1189663000000003	72.9136000999999965	2019-04-03 13:18:49.91+05:30	2019-04-03 13:18:49.91+05:30	14
313	19.0066432999999968	72.8326091999999932	2019-04-03 15:46:25.273+05:30	2019-04-03 15:46:25.273+05:30	14
316	19.1189605	72.9135832999999991	2019-04-04 12:08:12.93+05:30	2019-04-04 12:08:12.93+05:30	14
319	19.1189585000000015	72.913582500000004	2019-04-04 13:56:33.819+05:30	2019-04-04 13:56:33.819+05:30	14
322	19.1189585000000015	72.913582500000004	2019-04-04 16:07:47.848+05:30	2019-04-04 16:07:47.848+05:30	14
325	19.0126934900000002	72.826605200000003	2019-04-05 14:35:45.447+05:30	2019-04-05 14:35:45.447+05:30	14
328	19.0126934900000002	72.826605200000003	2019-04-05 14:54:12.68+05:30	2019-04-05 14:54:12.68+05:30	14
\.


--
-- Name: locations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: beaconstalk
--

SELECT pg_catalog.setval('public.locations_id_seq', 436, true);


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: beaconstalk
--

COPY public.roles (id, superadmin, appadmin, appstaff, advertiser, active, "createdAt", "updatedAt", "userId") FROM stdin;
\.


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: beaconstalk
--

SELECT pg_catalog.setval('public.roles_id_seq', 1, false);


--
-- Data for Name: tags; Type: TABLE DATA; Schema: public; Owner: beaconstalk
--

COPY public.tags (id, tag, "createdAt", "updatedAt", "beaconMasterId") FROM stdin;
\.


--
-- Name: tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: beaconstalk
--

SELECT pg_catalog.setval('public.tags_id_seq', 1, false);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: beaconstalk
--

COPY public.users (id, name, username, email, password, active, superadmin, appadmin, staff, "createdAt", "updatedAt", "applicationId") FROM stdin;
2	BMS Admin	bms	admin@bookmyshow.com	$2a$10$rQEGSgl5niSVJvK4dSUCIe.8rPlCkDAhz3.jqhvhg86SX5yWjV7R6	t	f	t	f	2019-03-06 12:04:38.437+05:30	2019-03-06 12:11:45.823+05:30	3
1	Admin	admin	admin@beaconstalk.com	$2a$10$rQEGSgl5niSVJvK4dSUCIe.8rPlCkDAhz3.jqhvhg86SX5yWjV7R6	t	t	t	f	2019-03-06 12:04:38.437+05:30	2019-03-27 13:38:48.114+05:30	1
3	Diwakar Mitr	diwakar	sbicard@inlocus.in	$2a$10$i06GbXMw6T8Or4QsjhQhu.2Kb8vfmYizLMkGd/H.lF2gw.laEMYNa	t	f	t	f	2019-04-11 17:24:16.404+05:30	2019-04-11 17:24:18.893+05:30	2
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: beaconstalk
--

SELECT pg_catalog.setval('public.users_id_seq', 3, true);


--
-- Data for Name: wifis; Type: TABLE DATA; Schema: public; Owner: beaconstalk
--

COPY public.wifis (id, macid, ssid, rssi, freq, distance, "createdAt", "updatedAt", "deviceId") FROM stdin;
1060	94:e9:79:90:3d:51	DIRECT-fELAPTOP-668QLSGLmsfN	0	-54	2412	2019-03-25 17:44:12.171+05:30	2019-03-25 17:44:12.171+05:30	14
1061	a8:bd:27:7b:eb:75	Al-Mulla-FTZ	0	-59	5745	2019-03-25 17:44:12.171+05:30	2019-03-25 17:44:12.171+05:30	14
1062	a8:bd:27:7b:eb:74	Nelson	0	-59	5745	2019-03-25 17:44:12.171+05:30	2019-03-25 17:44:12.171+05:30	14
1063	a8:bd:27:7b:eb:73	Mmr-Research	0	-59	5745	2019-03-25 17:44:12.171+05:30	2019-03-25 17:44:12.171+05:30	14
1068	a8:bd:27:7b:d0:e4	Nelson	0	-60	2462	2019-03-25 17:44:12.172+05:30	2019-03-25 17:44:12.172+05:30	14
1073	a8:bd:27:7b:eb:71	Awfis	0	-61	5745	2019-03-25 17:44:12.173+05:30	2019-03-25 17:44:12.173+05:30	14
1079	a8:bd:27:7b:eb:65	Al-Mulla-FTZ	0	-64	2412	2019-03-25 17:44:12.175+05:30	2019-03-25 17:44:12.175+05:30	14
1085	a8:bd:27:7b:d0:f3	Mmr-Research	0	-66	5260	2019-03-25 17:44:12.177+05:30	2019-03-25 17:44:12.177+05:30	14
1093	a8:bd:27:7c:07:63	Mmr-Research	0	-68	2437	2019-03-25 17:44:12.178+05:30	2019-03-25 17:44:12.178+05:30	14
1099	a8:bd:27:77:b3:25	Al-Mulla-FTZ	0	-71	2462	2019-03-25 17:44:12.179+05:30	2019-03-25 17:44:12.179+05:30	14
1105	a8:bd:27:7b:cc:65	Al-Mulla-FTZ	0	-76	2462	2019-03-25 17:44:12.18+05:30	2019-03-25 17:44:12.18+05:30	14
1111	a8:bd:27:7c:07:71	Awfis	0	-79	5745	2019-03-25 17:44:12.181+05:30	2019-03-25 17:44:12.181+05:30	14
1117	a8:bd:27:7c:07:72	INDX	0	-80	5745	2019-03-25 17:44:12.182+05:30	2019-03-25 17:44:12.182+05:30	14
1120	a8:bd:27:7b:e5:33	Mmr-Research	0	-85	5180	2019-03-25 17:44:12.182+05:30	2019-03-25 17:44:12.182+05:30	14
1125	a8:bd:27:7b:e1:74	Nelson	0	-86	5260	2019-03-25 17:44:12.183+05:30	2019-03-25 17:44:12.183+05:30	14
1130	a8:bd:27:7b:e1:73	Mmr-Research	0	-87	5260	2019-03-25 17:44:12.183+05:30	2019-03-25 17:44:12.183+05:30	14
1138	a8:bd:27:7b:e2:73	Mmr-Research	0	-89	5745	2019-03-25 17:44:12.184+05:30	2019-03-25 17:44:12.184+05:30	14
73	a8:bd:27:77:b3:31	Awfis	0	-90	5180	2019-03-07 13:01:43.076+05:30	2019-03-07 13:01:43.076+05:30	\N
1064	a8:bd:27:7b:eb:72	INDX	0	-59	5745	2019-03-25 17:44:12.171+05:30	2019-03-25 17:44:12.171+05:30	14
1067	a8:bd:27:7b:d0:e5	Al-Mulla-FTZ	0	-60	2462	2019-03-25 17:44:12.172+05:30	2019-03-25 17:44:12.172+05:30	14
1072	a8:bd:27:7b:d0:e0	Ethinos	0	-60	2462	2019-03-25 17:44:12.173+05:30	2019-03-25 17:44:12.173+05:30	14
1075	a8:bd:27:77:b3:35	Al-Mulla-FTZ	0	-61	5180	2019-03-25 17:44:12.173+05:30	2019-03-25 17:44:12.173+05:30	14
1078	a8:bd:27:77:b3:30	Ethinos	0	-61	5180	2019-03-25 17:44:12.175+05:30	2019-03-25 17:44:12.175+05:30	14
1081	a8:bd:27:7b:eb:63	Mmr-Research	0	-64	2412	2019-03-25 17:44:12.176+05:30	2019-03-25 17:44:12.176+05:30	14
1084	a8:bd:27:7b:eb:60	Ethinos	0	-64	2412	2019-03-25 17:44:12.177+05:30	2019-03-25 17:44:12.177+05:30	14
1087	a8:bd:27:7b:d0:f4	Nelson	0	-66	5260	2019-03-25 17:44:12.177+05:30	2019-03-25 17:44:12.177+05:30	14
1090	a8:bd:27:7b:d0:f0	Ethinos	0	-66	5260	2019-03-25 17:44:12.178+05:30	2019-03-25 17:44:12.178+05:30	14
1095	a8:bd:27:7c:07:64	Nelson	0	-69	2437	2019-03-25 17:44:12.178+05:30	2019-03-25 17:44:12.178+05:30	14
1098	a8:bd:27:77:b3:24	Nelson	0	-70	2462	2019-03-25 17:44:12.179+05:30	2019-03-25 17:44:12.179+05:30	14
1101	a8:bd:27:7b:e5:23	Mmr-Research	0	-73	2412	2019-03-25 17:44:12.18+05:30	2019-03-25 17:44:12.18+05:30	14
1104	18:a6:f7:67:78:d6	Beaconstalk	0	-76	2462	2019-03-25 17:44:12.18+05:30	2019-03-25 17:44:12.18+05:30	14
1107	a8:bd:27:7c:07:75	Al-Mulla-FTZ	0	-79	5745	2019-03-25 17:44:12.18+05:30	2019-03-25 17:44:12.18+05:30	14
1110	a8:bd:27:7c:07:70	Ethinos	0	-79	5745	2019-03-25 17:44:12.181+05:30	2019-03-25 17:44:12.181+05:30	14
1113	a8:bd:27:7b:cc:74	Nelson	0	-80	5745	2019-03-25 17:44:12.181+05:30	2019-03-25 17:44:12.181+05:30	14
1116	a8:bd:27:7b:cc:70	Ethinos	0	-80	5745	2019-03-25 17:44:12.181+05:30	2019-03-25 17:44:12.181+05:30	14
1119	a8:bd:27:7b:e2:70	Ethinos	0	-83	5745	2019-03-25 17:44:12.182+05:30	2019-03-25 17:44:12.182+05:30	14
1124	a8:bd:27:7b:e5:31	Awfis	0	-86	5180	2019-03-25 17:44:12.182+05:30	2019-03-25 17:44:12.182+05:30	14
1129	a8:bd:27:7b:e5:32	INDX	0	-87	5180	2019-03-25 17:44:12.183+05:30	2019-03-25 17:44:12.183+05:30	14
1131	a8:bd:27:7b:e1:71	Awfis	0	-87	5260	2019-03-25 17:44:12.183+05:30	2019-03-25 17:44:12.183+05:30	14
1135	a8:bd:27:7b:e2:74	Nelson	0	-88	5745	2019-03-25 17:44:12.184+05:30	2019-03-25 17:44:12.184+05:30	14
1139	a8:bd:27:7c:0c:b1	Awfis	0	-89	5180	2019-03-25 17:44:12.184+05:30	2019-03-25 17:44:12.184+05:30	14
1065	a8:bd:27:7b:eb:70	Ethinos	0	-59	5745	2019-03-25 17:44:12.171+05:30	2019-03-25 17:44:12.171+05:30	14
1070	a8:bd:27:7b:d0:e2	INDX	0	-60	2462	2019-03-25 17:44:12.172+05:30	2019-03-25 17:44:12.172+05:30	14
1076	a8:bd:27:77:b3:34	Nelson	0	-61	5180	2019-03-25 17:44:12.175+05:30	2019-03-25 17:44:12.175+05:30	14
1082	a8:bd:27:7b:eb:62	INDX	0	-64	2412	2019-03-25 17:44:12.177+05:30	2019-03-25 17:44:12.177+05:30	14
1088	a8:bd:27:7b:d0:f2	INDX	0	-66	5260	2019-03-25 17:44:12.177+05:30	2019-03-25 17:44:12.177+05:30	14
1091	a8:bd:27:7c:07:60	Ethinos	0	-67	2437	2019-03-25 17:44:12.178+05:30	2019-03-25 17:44:12.178+05:30	14
1096	a8:bd:27:7c:07:61	Awfis	0	-69	2437	2019-03-25 17:44:12.178+05:30	2019-03-25 17:44:12.178+05:30	14
1102	a8:bd:27:7b:e5:22	INDX	0	-73	2412	2019-03-25 17:44:12.18+05:30	2019-03-25 17:44:12.18+05:30	14
1108	a8:bd:27:7c:07:73	Mmr-Research	0	-79	5745	2019-03-25 17:44:12.18+05:30	2019-03-25 17:44:12.18+05:30	14
1114	a8:bd:27:7b:cc:73	Mmr-Research	0	-80	5745	2019-03-25 17:44:12.181+05:30	2019-03-25 17:44:12.181+05:30	14
1122	a8:bd:27:7c:0c:a5	Al-Mulla-FTZ	0	-85	2412	2019-03-25 17:44:12.182+05:30	2019-03-25 17:44:12.182+05:30	14
1127	a8:bd:27:7b:e2:71	Awfis	0	-87	5745	2019-03-25 17:44:12.183+05:30	2019-03-25 17:44:12.183+05:30	14
1132	a8:bd:27:7b:e1:70	Ethinos	0	-87	5260	2019-03-25 17:44:12.184+05:30	2019-03-25 17:44:12.184+05:30	14
1136	a8:bd:27:7b:e2:72	INDX	0	-88	5745	2019-03-25 17:44:12.184+05:30	2019-03-25 17:44:12.184+05:30	14
1141	a8:bd:27:7c:0c:b4	Nelson	0	-91	5180	2019-03-25 17:44:12.185+05:30	2019-03-25 17:44:12.185+05:30	14
1066	a8:bd:27:77:b3:32	INDX	0	-60	5180	2019-03-25 17:44:12.172+05:30	2019-03-25 17:44:12.172+05:30	14
1071	a8:bd:27:7b:d0:e1	Awfis	0	-60	2462	2019-03-25 17:44:12.172+05:30	2019-03-25 17:44:12.172+05:30	14
1077	a8:bd:27:77:b3:31	Awfis	0	-61	5180	2019-03-25 17:44:12.175+05:30	2019-03-25 17:44:12.175+05:30	14
1083	a8:bd:27:7b:eb:61	Awfis	0	-64	2412	2019-03-25 17:44:12.177+05:30	2019-03-25 17:44:12.177+05:30	14
1089	a8:bd:27:7b:d0:f1	Awfis	0	-66	5260	2019-03-25 17:44:12.177+05:30	2019-03-25 17:44:12.177+05:30	14
1092	a8:bd:27:7c:07:62	INDX	0	-68	2437	2019-03-25 17:44:12.178+05:30	2019-03-25 17:44:12.178+05:30	14
1097	a8:bd:27:77:b3:21	Awfis	0	-70	2462	2019-03-25 17:44:12.179+05:30	2019-03-25 17:44:12.179+05:30	14
1103	a8:bd:27:7b:e5:21	Awfis	0	-73	2412	2019-03-25 17:44:12.18+05:30	2019-03-25 17:44:12.18+05:30	14
1109	a8:bd:27:7b:cc:71	Awfis	0	-79	5745	2019-03-25 17:44:12.181+05:30	2019-03-25 17:44:12.181+05:30	14
1115	a8:bd:27:7b:cc:72	INDX	0	-80	5745	2019-03-25 17:44:12.181+05:30	2019-03-25 17:44:12.181+05:30	14
1123	a8:bd:27:7b:e5:34	Nelson	0	-86	5180	2019-03-25 17:44:12.182+05:30	2019-03-25 17:44:12.182+05:30	14
1128	a8:bd:27:7b:e5:35	Al-Mulla-FTZ	0	-87	5180	2019-03-25 17:44:12.183+05:30	2019-03-25 17:44:12.183+05:30	14
1134	a8:bd:27:7b:e2:75	Al-Mulla-FTZ	0	-88	5745	2019-03-25 17:44:12.184+05:30	2019-03-25 17:44:12.184+05:30	14
1140	a8:bd:27:7c:0c:b0	Ethinos	0	-90	5180	2019-03-25 17:44:12.185+05:30	2019-03-25 17:44:12.185+05:30	14
218	18:a6:f7:67:78:d6	Beaconstalk	0	-42	2462	2019-03-11 11:11:52.442+05:30	2019-03-11 11:11:52.442+05:30	\N
223	a2:04:60:98:dd:d2	INDX-Guest	0	-68	2462	2019-03-11 11:11:52.444+05:30	2019-03-11 11:11:52.444+05:30	\N
225	a8:bd:27:7b:eb:82	INDX	0	-72	2437	2019-03-11 11:11:52.444+05:30	2019-03-11 11:11:52.444+05:30	\N
228	a8:bd:27:7b:eb:93	Mmr-Research	0	-74	5180	2019-03-11 11:11:52.445+05:30	2019-03-11 11:11:52.445+05:30	\N
232	a8:bd:27:7b:eb:92	INDX	0	-74	5180	2019-03-11 11:11:52.445+05:30	2019-03-11 11:11:52.445+05:30	\N
235	a8:bd:27:7b:d0:f5	Al-Mulla-FTZ	0	-78	5745	2019-03-11 11:11:52.452+05:30	2019-03-11 11:11:52.452+05:30	\N
240	a8:bd:27:7b:d0:f0	Ethinos	0	-78	5745	2019-03-11 11:11:52.452+05:30	2019-03-11 11:11:52.452+05:30	\N
247	a8:bd:27:7b:eb:74	Nelson	0	-80	5745	2019-03-11 11:11:52.453+05:30	2019-03-11 11:11:52.453+05:30	\N
252	a8:bd:27:7c:07:61	Awfis	0	-81	2412	2019-03-11 11:11:52.453+05:30	2019-03-11 11:11:52.453+05:30	\N
258	a8:bd:27:7c:07:70	Ethinos	0	-83	5260	2019-03-11 11:11:52.455+05:30	2019-03-11 11:11:52.455+05:30	\N
263	a8:bd:27:7b:da:34	Nelson	0	-89	5260	2019-03-11 11:11:52.455+05:30	2019-03-11 11:11:52.455+05:30	\N
1069	a8:bd:27:7b:d0:e3	Mmr-Research	0	-60	2462	2019-03-25 17:44:12.172+05:30	2019-03-25 17:44:12.172+05:30	14
1074	a8:bd:27:77:b3:33	Mmr-Research	0	-61	5180	2019-03-25 17:44:12.173+05:30	2019-03-25 17:44:12.173+05:30	14
1080	a8:bd:27:7b:eb:64	Nelson	0	-64	2412	2019-03-25 17:44:12.176+05:30	2019-03-25 17:44:12.176+05:30	14
1086	a8:bd:27:7b:d0:f5	Al-Mulla-FTZ	0	-66	5260	2019-03-25 17:44:12.177+05:30	2019-03-25 17:44:12.177+05:30	14
1094	a8:bd:27:7c:07:65	Al-Mulla-FTZ	0	-69	2437	2019-03-25 17:44:12.178+05:30	2019-03-25 17:44:12.178+05:30	14
1100	a8:bd:27:77:b3:22	INDX	0	-71	2462	2019-03-25 17:44:12.179+05:30	2019-03-25 17:44:12.179+05:30	14
1106	a8:bd:27:7b:cc:63	Mmr-Research	0	-76	2462	2019-03-25 17:44:12.18+05:30	2019-03-25 17:44:12.18+05:30	14
1112	a8:bd:27:7c:07:74	Nelson	0	-80	5745	2019-03-25 17:44:12.181+05:30	2019-03-25 17:44:12.181+05:30	14
1118	a8:bd:27:7b:cc:75	Al-Mulla-FTZ	0	-81	5745	2019-03-25 17:44:12.182+05:30	2019-03-25 17:44:12.182+05:30	14
1121	a8:bd:27:7b:e5:30	Ethinos	0	-85	5180	2019-03-25 17:44:12.182+05:30	2019-03-25 17:44:12.182+05:30	14
1126	a8:bd:27:7b:e1:72	INDX	0	-86	5260	2019-03-25 17:44:12.183+05:30	2019-03-25 17:44:12.183+05:30	14
1133	a8:bd:27:7c:0c:b5	Al-Mulla-FTZ	0	-88	5180	2019-03-25 17:44:12.184+05:30	2019-03-25 17:44:12.184+05:30	14
1137	a8:bd:27:7c:0c:b3	Mmr-Research	0	-89	5180	2019-03-25 17:44:12.184+05:30	2019-03-25 17:44:12.184+05:30	14
1142	a8:bd:27:7c:0c:b2	INDX	0	-91	5180	2019-03-25 17:44:12.185+05:30	2019-03-25 17:44:12.185+05:30	14
221	08:25:25:0d:00:25	Redmi	0	-66	2462	2019-03-11 11:11:52.443+05:30	2019-03-11 11:11:52.443+05:30	\N
226	a8:bd:27:7b:eb:85	Al-Mulla-FTZ	0	-72	2437	2019-03-11 11:11:52.444+05:30	2019-03-11 11:11:52.444+05:30	\N
229	a8:bd:27:7b:eb:90	Ethinos	0	-74	5180	2019-03-11 11:11:52.445+05:30	2019-03-11 11:11:52.445+05:30	\N
233	a8:bd:27:7b:da:22	INDX	0	-75	2462	2019-03-11 11:11:52.445+05:30	2019-03-11 11:11:52.445+05:30	\N
236	a8:bd:27:7b:eb:63	Mmr-Research	0	-76	2437	2019-03-11 11:11:52.451+05:30	2019-03-11 11:11:52.451+05:30	\N
241	a8:bd:27:7c:07:63	Mmr-Research	0	-78	2412	2019-03-11 11:11:52.452+05:30	2019-03-11 11:11:52.452+05:30	\N
248	a8:bd:27:7b:eb:73	Mmr-Research	0	-80	5745	2019-03-11 11:11:52.453+05:30	2019-03-11 11:11:52.453+05:30	\N
254	a8:bd:27:7c:07:71	Awfis	0	-81	5260	2019-03-11 11:11:52.454+05:30	2019-03-11 11:11:52.454+05:30	\N
260	a8:bd:27:7b:da:33	Mmr-Research	0	-88	5260	2019-03-11 11:11:52.455+05:30	2019-03-11 11:11:52.455+05:30	\N
1143	a8:bd:27:7b:eb:71	Awfis	0	-58	5745	2019-03-25 17:46:39.524+05:30	2019-03-25 17:46:39.524+05:30	14
1144	a8:bd:27:7b:eb:75	Al-Mulla-FTZ	0	-59	5745	2019-03-25 17:46:39.524+05:30	2019-03-25 17:46:39.524+05:30	14
1145	a8:bd:27:7b:eb:74	Nelson	0	-59	5745	2019-03-25 17:46:39.525+05:30	2019-03-25 17:46:39.525+05:30	14
1146	a8:bd:27:7b:eb:73	Mmr-Research	0	-59	5745	2019-03-25 17:46:39.525+05:30	2019-03-25 17:46:39.525+05:30	14
1147	94:e9:79:90:3d:51	DIRECT-fELAPTOP-668QLSGLmsfN	0	-59	2412	2019-03-25 17:46:39.525+05:30	2019-03-25 17:46:39.525+05:30	14
1149	a8:bd:27:7b:d0:e2	INDX	0	-63	2462	2019-03-25 17:46:39.525+05:30	2019-03-25 17:46:39.525+05:30	14
1151	a8:bd:27:7b:d0:e0	Ethinos	0	-63	2462	2019-03-25 17:46:39.525+05:30	2019-03-25 17:46:39.525+05:30	14
1152	a8:bd:27:7b:d0:e3	Mmr-Research	0	-63	2462	2019-03-25 17:46:39.525+05:30	2019-03-25 17:46:39.525+05:30	14
1153	a8:bd:27:7b:d0:e1	Awfis	0	-64	2462	2019-03-25 17:46:39.525+05:30	2019-03-25 17:46:39.525+05:30	14
1154	a8:bd:27:77:b3:25	Al-Mulla-FTZ	0	-65	2462	2019-03-25 17:46:39.525+05:30	2019-03-25 17:46:39.525+05:30	14
1158	a8:bd:27:7b:eb:65	Al-Mulla-FTZ	0	-66	2412	2019-03-25 17:46:39.526+05:30	2019-03-25 17:46:39.526+05:30	14
1160	a8:bd:27:7b:eb:63	Mmr-Research	0	-67	2412	2019-03-25 17:46:39.526+05:30	2019-03-25 17:46:39.526+05:30	14
1164	a8:bd:27:7c:07:60	Ethinos	0	-68	2437	2019-03-25 17:46:39.526+05:30	2019-03-25 17:46:39.526+05:30	14
1165	a8:bd:27:7b:d0:f3	Mmr-Research	0	-69	5260	2019-03-25 17:46:39.526+05:30	2019-03-25 17:46:39.526+05:30	14
1170	a8:bd:27:7b:d0:f0	Ethinos	0	-69	5260	2019-03-25 17:46:39.529+05:30	2019-03-25 17:46:39.529+05:30	14
1175	a8:bd:27:77:b3:22	INDX	0	-71	2462	2019-03-25 17:46:39.53+05:30	2019-03-25 17:46:39.53+05:30	14
1181	a8:bd:27:77:b3:30	Ethinos	0	-72	5180	2019-03-25 17:46:39.532+05:30	2019-03-25 17:46:39.532+05:30	14
1187	a8:bd:27:7b:cc:73	Mmr-Research	0	-78	5745	2019-03-25 17:46:39.533+05:30	2019-03-25 17:46:39.533+05:30	14
1192	a8:bd:27:7b:e1:62	INDX	0	-79	2437	2019-03-25 17:46:39.533+05:30	2019-03-25 17:46:39.533+05:30	14
1198	a8:bd:27:7c:07:75	Al-Mulla-FTZ	0	-83	5745	2019-03-25 17:46:39.534+05:30	2019-03-25 17:46:39.534+05:30	14
1204	a8:bd:27:7b:e2:74	Nelson	0	-87	5745	2019-03-25 17:46:39.534+05:30	2019-03-25 17:46:39.534+05:30	14
1210	a8:bd:27:7b:e1:74	Nelson	0	-88	5260	2019-03-25 17:46:39.535+05:30	2019-03-25 17:46:39.535+05:30	14
1217	a8:bd:27:7b:e1:75	Al-Mulla-FTZ	0	-89	5260	2019-03-25 17:46:39.535+05:30	2019-03-25 17:46:39.535+05:30	14
1222	a8:bd:27:7b:e5:31	Awfis	0	-90	5180	2019-03-25 17:46:39.535+05:30	2019-03-25 17:46:39.535+05:30	14
1148	a8:bd:27:7b:eb:72	INDX	0	-60	5745	2019-03-25 17:46:39.525+05:30	2019-03-25 17:46:39.525+05:30	14
1156	a4:2b:b0:a0:c1:36	Screencasting	0	-65	2462	2019-03-25 17:46:39.526+05:30	2019-03-25 17:46:39.526+05:30	14
1162	a8:bd:27:7b:eb:61	Awfis	0	-67	2412	2019-03-25 17:46:39.526+05:30	2019-03-25 17:46:39.526+05:30	14
1166	a8:bd:27:7b:d0:f5	Al-Mulla-FTZ	0	-69	5260	2019-03-25 17:46:39.529+05:30	2019-03-25 17:46:39.529+05:30	14
1171	a8:bd:27:7c:07:62	INDX	0	-69	2437	2019-03-25 17:46:39.529+05:30	2019-03-25 17:46:39.529+05:30	14
1176	a8:bd:27:77:b3:32	INDX	0	-72	5180	2019-03-25 17:46:39.53+05:30	2019-03-25 17:46:39.53+05:30	14
1180	a8:bd:27:77:b3:31	Awfis	0	-72	5180	2019-03-25 17:46:39.532+05:30	2019-03-25 17:46:39.532+05:30	14
1186	a8:bd:27:7b:cc:75	Al-Mulla-FTZ	0	-78	5745	2019-03-25 17:46:39.533+05:30	2019-03-25 17:46:39.533+05:30	14
1193	a8:bd:27:7b:cc:70	Ethinos	0	-80	5745	2019-03-25 17:46:39.533+05:30	2019-03-25 17:46:39.533+05:30	14
1199	a8:bd:27:7c:07:73	Mmr-Research	0	-83	5745	2019-03-25 17:46:39.534+05:30	2019-03-25 17:46:39.534+05:30	14
1205	a8:bd:27:7b:e2:73	Mmr-Research	0	-87	5745	2019-03-25 17:46:39.534+05:30	2019-03-25 17:46:39.534+05:30	14
1211	a8:bd:27:7b:e1:73	Mmr-Research	0	-88	5260	2019-03-25 17:46:39.535+05:30	2019-03-25 17:46:39.535+05:30	14
1216	a8:bd:27:7b:e1:70	Ethinos	0	-89	5260	2019-03-25 17:46:39.535+05:30	2019-03-25 17:46:39.535+05:30	14
1223	a8:bd:27:7b:e5:30	Ethinos	0	-91	5180	2019-03-25 17:46:39.536+05:30	2019-03-25 17:46:39.536+05:30	14
314	a8:bd:27:7b:eb:80	Ethinos	0	-63	2412	2019-03-12 12:08:20.071+05:30	2019-03-12 12:08:20.071+05:30	\N
317	a8:bd:27:7b:eb:81	Awfis	0	-65	2412	2019-03-12 12:08:20.071+05:30	2019-03-12 12:08:20.071+05:30	\N
322	a8:bd:27:7b:eb:93	Mmr-Research	0	-72	5180	2019-03-12 12:08:20.071+05:30	2019-03-12 12:08:20.071+05:30	\N
325	a8:bd:27:7b:eb:90	Ethinos	0	-73	5180	2019-03-12 12:08:20.074+05:30	2019-03-12 12:08:20.074+05:30	\N
329	a8:bd:27:7b:d0:e0	Ethinos	0	-74	2412	2019-03-12 12:08:20.074+05:30	2019-03-12 12:08:20.074+05:30	\N
333	a8:bd:27:7b:eb:70	Ethinos	0	-82	5745	2019-03-12 12:08:20.075+05:30	2019-03-12 12:08:20.075+05:30	\N
337	a8:bd:27:7b:d0:f1	Awfis	0	-83	5745	2019-03-12 12:08:20.075+05:30	2019-03-12 12:08:20.075+05:30	\N
341	a8:bd:27:7b:eb:73	Mmr-Research	0	-83	5745	2019-03-12 12:08:20.076+05:30	2019-03-12 12:08:20.076+05:30	\N
347	a8:bd:27:77:b3:33	Mmr-Research	0	-89	5180	2019-03-12 12:08:20.076+05:30	2019-03-12 12:08:20.076+05:30	\N
1150	a8:bd:27:7b:eb:70	Ethinos	0	-59	5745	2019-03-25 17:46:39.525+05:30	2019-03-25 17:46:39.525+05:30	14
1155	a8:bd:27:77:b3:24	Nelson	0	-65	2462	2019-03-25 17:46:39.525+05:30	2019-03-25 17:46:39.525+05:30	14
1159	a8:bd:27:7b:eb:64	Nelson	0	-66	2412	2019-03-25 17:46:39.526+05:30	2019-03-25 17:46:39.526+05:30	14
1161	a8:bd:27:7b:eb:62	INDX	0	-67	2412	2019-03-25 17:46:39.526+05:30	2019-03-25 17:46:39.526+05:30	14
1167	a8:bd:27:7b:d0:f4	Nelson	0	-69	5260	2019-03-25 17:46:39.529+05:30	2019-03-25 17:46:39.529+05:30	14
1172	a8:bd:27:7c:07:63	Mmr-Research	0	-70	2437	2019-03-25 17:46:39.529+05:30	2019-03-25 17:46:39.529+05:30	14
1177	a8:bd:27:77:b3:33	Mmr-Research	0	-72	5180	2019-03-25 17:46:39.53+05:30	2019-03-25 17:46:39.53+05:30	14
1182	a8:bd:27:77:b3:23	Mmr-Research	0	-72	2462	2019-03-25 17:46:39.533+05:30	2019-03-25 17:46:39.533+05:30	14
1185	a8:bd:27:7b:cc:71	Awfis	0	-77	5745	2019-03-25 17:46:39.533+05:30	2019-03-25 17:46:39.533+05:30	14
1188	a8:bd:27:7b:cc:72	INDX	0	-78	5745	2019-03-25 17:46:39.533+05:30	2019-03-25 17:46:39.533+05:30	14
1191	a8:bd:27:7b:e1:63	Mmr-Research	0	-79	2437	2019-03-25 17:46:39.533+05:30	2019-03-25 17:46:39.533+05:30	14
1194	a8:bd:27:7b:e1:65	Al-Mulla-FTZ	0	-80	2437	2019-03-25 17:46:39.533+05:30	2019-03-25 17:46:39.533+05:30	14
1197	a8:bd:27:7c:07:71	Awfis	0	-82	5745	2019-03-25 17:46:39.534+05:30	2019-03-25 17:46:39.534+05:30	14
1200	a8:bd:27:7c:07:74	Nelson	0	-83	5745	2019-03-25 17:46:39.534+05:30	2019-03-25 17:46:39.534+05:30	14
1203	a8:bd:27:7b:e2:75	Al-Mulla-FTZ	0	-87	5745	2019-03-25 17:46:39.534+05:30	2019-03-25 17:46:39.534+05:30	14
1206	a8:bd:27:7b:e2:72	INDX	0	-87	5745	2019-03-25 17:46:39.534+05:30	2019-03-25 17:46:39.534+05:30	14
1209	a8:bd:27:7b:e2:70	Ethinos	0	-87	5745	2019-03-25 17:46:39.535+05:30	2019-03-25 17:46:39.535+05:30	14
1212	a8:bd:27:7b:e1:71	Awfis	0	-88	5260	2019-03-25 17:46:39.535+05:30	2019-03-25 17:46:39.535+05:30	14
1215	a8:bd:27:7c:0c:b2	INDX	0	-89	5180	2019-03-25 17:46:39.535+05:30	2019-03-25 17:46:39.535+05:30	14
1218	a8:bd:27:7b:e1:72	INDX	0	-89	5260	2019-03-25 17:46:39.535+05:30	2019-03-25 17:46:39.535+05:30	14
1221	a8:bd:27:7b:e5:34	Nelson	0	-90	5180	2019-03-25 17:46:39.535+05:30	2019-03-25 17:46:39.535+05:30	14
1224	a8:bd:27:7c:0c:b5	Al-Mulla-FTZ	0	-92	5180	2019-03-25 17:46:39.536+05:30	2019-03-25 17:46:39.536+05:30	14
315	b2:35:9f:ae:c6:ee	DIRECT-BMLAPTOP-RLKD4AMImsEG	0	-45	2462	2019-03-12 12:08:20.071+05:30	2019-03-12 12:08:20.071+05:30	\N
318	a8:bd:27:7b:eb:95	Al-Mulla-FTZ	0	-72	5180	2019-03-12 12:08:20.071+05:30	2019-03-12 12:08:20.071+05:30	\N
323	a8:bd:27:7b:eb:94	Nelson	0	-72	5180	2019-03-12 12:08:20.071+05:30	2019-03-12 12:08:20.071+05:30	\N
326	a8:bd:27:7b:d0:e1	Awfis	0	-74	2412	2019-03-12 12:08:20.074+05:30	2019-03-12 12:08:20.074+05:30	\N
330	0c:b6:d2:5a:d4:80	MTNL-EDMPL	0	-79	2427	2019-03-12 12:08:20.075+05:30	2019-03-12 12:08:20.075+05:30	\N
331	a8:bd:27:7b:d0:f5	Al-Mulla-FTZ	0	-83	5745	2019-03-12 12:08:20.075+05:30	2019-03-12 12:08:20.075+05:30	\N
336	a8:bd:27:7b:d0:f3	Mmr-Research	0	-83	5745	2019-03-12 12:08:20.075+05:30	2019-03-12 12:08:20.075+05:30	\N
342	a8:bd:27:7b:eb:71	Awfis	0	-83	5745	2019-03-12 12:08:20.076+05:30	2019-03-12 12:08:20.076+05:30	\N
348	a8:bd:27:77:b3:35	Al-Mulla-FTZ	0	-89	5180	2019-03-12 12:08:20.076+05:30	2019-03-12 12:08:20.076+05:30	\N
1157	a8:bd:27:7b:eb:60	Ethinos	0	-65	2412	2019-03-25 17:46:39.525+05:30	2019-03-25 17:46:39.525+05:30	14
1163	a8:bd:27:7c:07:61	Awfis	0	-68	2437	2019-03-25 17:46:39.526+05:30	2019-03-25 17:46:39.526+05:30	14
1168	a8:bd:27:7b:d0:f2	INDX	0	-69	5260	2019-03-25 17:46:39.529+05:30	2019-03-25 17:46:39.529+05:30	14
1173	a8:bd:27:77:b3:35	Al-Mulla-FTZ	0	-71	5180	2019-03-25 17:46:39.53+05:30	2019-03-25 17:46:39.53+05:30	14
1178	a8:bd:27:77:b3:21	Awfis	0	-72	2462	2019-03-25 17:46:39.53+05:30	2019-03-25 17:46:39.53+05:30	14
1183	a8:bd:27:7b:e5:24	Nelson	0	-74	2412	2019-03-25 17:46:39.533+05:30	2019-03-25 17:46:39.533+05:30	14
1189	a8:bd:27:7b:e5:22	INDX	0	-78	2412	2019-03-25 17:46:39.533+05:30	2019-03-25 17:46:39.533+05:30	14
1195	a8:bd:27:7b:e5:25	Al-Mulla-FTZ	0	-81	2412	2019-03-25 17:46:39.533+05:30	2019-03-25 17:46:39.533+05:30	14
1201	ac:c1:ee:70:27:13	Redmi	0	-85	2412	2019-03-25 17:46:39.534+05:30	2019-03-25 17:46:39.534+05:30	14
1207	a8:bd:27:7c:0c:a1	Awfis	0	-87	2412	2019-03-25 17:46:39.534+05:30	2019-03-25 17:46:39.534+05:30	14
1213	a8:bd:27:7c:0c:b4	Nelson	0	-89	5180	2019-03-25 17:46:39.535+05:30	2019-03-25 17:46:39.535+05:30	14
1219	a8:bd:27:7c:0c:b3	Mmr-Research	0	-90	5180	2019-03-25 17:46:39.535+05:30	2019-03-25 17:46:39.535+05:30	14
1169	a8:bd:27:7b:d0:f1	Awfis	0	-69	5260	2019-03-25 17:46:39.529+05:30	2019-03-25 17:46:39.529+05:30	14
1174	a8:bd:27:77:b3:34	Nelson	0	-71	5180	2019-03-25 17:46:39.53+05:30	2019-03-25 17:46:39.53+05:30	14
1179	a8:bd:27:77:b3:20	Ethinos	0	-72	2462	2019-03-25 17:46:39.53+05:30	2019-03-25 17:46:39.53+05:30	14
1184	a8:bd:27:7b:cc:65	Al-Mulla-FTZ	0	-76	2462	2019-03-25 17:46:39.533+05:30	2019-03-25 17:46:39.533+05:30	14
1190	a8:bd:27:7b:cc:74	Nelson	0	-79	5745	2019-03-25 17:46:39.533+05:30	2019-03-25 17:46:39.533+05:30	14
1196	a8:bd:27:7b:e5:23	Mmr-Research	0	-81	2412	2019-03-25 17:46:39.534+05:30	2019-03-25 17:46:39.534+05:30	14
1202	a8:bd:27:7b:e5:32	INDX	0	-86	5180	2019-03-25 17:46:39.534+05:30	2019-03-25 17:46:39.534+05:30	14
1208	a8:bd:27:7b:e2:71	Awfis	0	-87	5745	2019-03-25 17:46:39.534+05:30	2019-03-25 17:46:39.534+05:30	14
1214	a8:bd:27:7c:0c:b1	Awfis	0	-89	5180	2019-03-25 17:46:39.535+05:30	2019-03-25 17:46:39.535+05:30	14
1220	a8:bd:27:7b:e5:35	Al-Mulla-FTZ	0	-90	5180	2019-03-25 17:46:39.535+05:30	2019-03-25 17:46:39.535+05:30	14
405	a8:bd:27:7b:da:32	INDX	0	-85	5260	2019-03-18 10:13:11.401+05:30	2019-03-18 10:13:11.401+05:30	\N
410	a8:bd:27:77:b3:31	Awfis	0	-86	5260	2019-03-18 10:13:11.402+05:30	2019-03-18 10:13:11.402+05:30	\N
1225	18:a6:f7:67:78:d6	Beaconstalk	0	-36	2462	2019-03-25 19:17:59.069+05:30	2019-03-25 19:17:59.069+05:30	14
1226	a8:bd:27:7b:d0:e1	Awfis	0	-63	2462	2019-03-25 19:17:59.069+05:30	2019-03-25 19:17:59.069+05:30	14
1227	a8:bd:27:7b:d0:e0	Ethinos	0	-63	2462	2019-03-25 19:17:59.069+05:30	2019-03-25 19:17:59.069+05:30	14
1228	a8:bd:27:7b:d0:e3	Mmr-Research	0	-63	2462	2019-03-25 19:17:59.069+05:30	2019-03-25 19:17:59.069+05:30	14
1230	a8:bd:27:7b:d0:f5	Al-Mulla-FTZ	0	-72	5260	2019-03-25 19:17:59.069+05:30	2019-03-25 19:17:59.069+05:30	14
1232	a8:bd:27:7c:07:63	Mmr-Research	0	-72	2437	2019-03-25 19:17:59.07+05:30	2019-03-25 19:17:59.07+05:30	14
1233	a8:bd:27:7c:07:65	Al-Mulla-FTZ	0	-72	2437	2019-03-25 19:17:59.07+05:30	2019-03-25 19:17:59.07+05:30	14
1238	a8:bd:27:7b:d0:f4	Nelson	0	-73	5260	2019-03-25 19:17:59.07+05:30	2019-03-25 19:17:59.07+05:30	14
1241	a8:bd:27:7b:d0:f0	Ethinos	0	-73	5260	2019-03-25 19:17:59.07+05:30	2019-03-25 19:17:59.07+05:30	14
1244	a8:bd:27:7b:eb:94	Nelson	0	-77	5180	2019-03-25 19:17:59.07+05:30	2019-03-25 19:17:59.07+05:30	14
1247	a8:bd:27:7b:eb:91	Awfis	0	-77	5180	2019-03-25 19:17:59.071+05:30	2019-03-25 19:17:59.071+05:30	14
1250	a8:bd:27:7c:07:74	Nelson	0	-78	5745	2019-03-25 19:17:59.071+05:30	2019-03-25 19:17:59.071+05:30	14
1253	a8:bd:27:7c:07:72	INDX	0	-79	5745	2019-03-25 19:17:59.071+05:30	2019-03-25 19:17:59.071+05:30	14
1256	a8:bd:27:7b:da:20	Ethinos	0	-79	2462	2019-03-25 19:17:59.071+05:30	2019-03-25 19:17:59.071+05:30	14
1260	a8:bd:27:7b:e1:61	Awfis	0	-80	2437	2019-03-25 19:17:59.072+05:30	2019-03-25 19:17:59.072+05:30	14
1263	a8:bd:27:7b:e1:75	Al-Mulla-FTZ	0	-83	5260	2019-03-25 19:17:59.072+05:30	2019-03-25 19:17:59.072+05:30	14
1266	a8:bd:27:7b:e1:72	INDX	0	-83	5260	2019-03-25 19:17:59.072+05:30	2019-03-25 19:17:59.072+05:30	14
1269	a8:bd:27:7b:eb:70	Ethinos	0	-83	5745	2019-03-25 19:17:59.072+05:30	2019-03-25 19:17:59.072+05:30	14
1272	a8:bd:27:7b:eb:73	Mmr-Research	0	-84	5745	2019-03-25 19:17:59.073+05:30	2019-03-25 19:17:59.073+05:30	14
1275	a8:bd:27:7b:da:35	Al-Mulla-FTZ	0	-85	5745	2019-03-25 19:17:59.075+05:30	2019-03-25 19:17:59.075+05:30	14
1278	a8:bd:27:7b:da:33	Mmr-Research	0	-85	5745	2019-03-25 19:17:59.075+05:30	2019-03-25 19:17:59.075+05:30	14
1281	a8:bd:27:77:b3:35	Al-Mulla-FTZ	0	-86	5180	2019-03-25 19:17:59.075+05:30	2019-03-25 19:17:59.075+05:30	14
1284	a8:bd:27:7b:da:34	Nelson	0	-86	5745	2019-03-25 19:17:59.076+05:30	2019-03-25 19:17:59.076+05:30	14
406	a8:bd:27:7b:da:31	Awfis	0	-85	5260	2019-03-18 10:13:11.401+05:30	2019-03-18 10:13:11.401+05:30	\N
412	a8:bd:27:77:b3:30	Ethinos	0	-87	5260	2019-03-18 10:13:11.403+05:30	2019-03-18 10:13:11.403+05:30	\N
1229	a8:bd:27:7b:d0:e2	INDX	0	-63	2462	2019-03-25 19:17:59.069+05:30	2019-03-25 19:17:59.069+05:30	14
1234	a8:bd:27:7c:07:61	Awfis	0	-72	2437	2019-03-25 19:17:59.07+05:30	2019-03-25 19:17:59.07+05:30	14
1240	a8:bd:27:7b:d0:f2	INDX	0	-73	5260	2019-03-25 19:17:59.07+05:30	2019-03-25 19:17:59.07+05:30	14
1245	a8:bd:27:7b:eb:93	Mmr-Research	0	-77	5180	2019-03-25 19:17:59.07+05:30	2019-03-25 19:17:59.07+05:30	14
1251	a8:bd:27:7b:da:24	Nelson	0	-78	2462	2019-03-25 19:17:59.071+05:30	2019-03-25 19:17:59.071+05:30	14
1258	a8:bd:27:7c:07:70	Ethinos	0	-80	5745	2019-03-25 19:17:59.071+05:30	2019-03-25 19:17:59.071+05:30	14
1264	a8:bd:27:7b:e1:74	Nelson	0	-83	5260	2019-03-25 19:17:59.072+05:30	2019-03-25 19:17:59.072+05:30	14
1270	a8:bd:27:7b:eb:75	Al-Mulla-FTZ	0	-84	5745	2019-03-25 19:17:59.073+05:30	2019-03-25 19:17:59.073+05:30	14
1276	a8:bd:27:7b:da:32	INDX	0	-85	5745	2019-03-25 19:17:59.075+05:30	2019-03-25 19:17:59.075+05:30	14
1282	a8:bd:27:77:b3:34	Nelson	0	-86	5180	2019-03-25 19:17:59.075+05:30	2019-03-25 19:17:59.075+05:30	14
407	a8:bd:27:7b:da:30	Ethinos	0	-85	5260	2019-03-18 10:13:11.401+05:30	2019-03-18 10:13:11.401+05:30	\N
413	a8:bd:27:7b:e1:74	Nelson	0	-88	5260	2019-03-18 10:13:11.403+05:30	2019-03-18 10:13:11.403+05:30	\N
1231	a0:04:60:9e:dd:d2		0	-67	2462	2019-03-25 19:17:59.069+05:30	2019-03-25 19:17:59.069+05:30	14
1236	a8:bd:27:7c:07:62	INDX	0	-72	2437	2019-03-25 19:17:59.07+05:30	2019-03-25 19:17:59.07+05:30	14
1239	a8:bd:27:7b:d0:f3	Mmr-Research	0	-73	5260	2019-03-25 19:17:59.07+05:30	2019-03-25 19:17:59.07+05:30	14
1243	a8:bd:27:7b:eb:95	Al-Mulla-FTZ	0	-77	5180	2019-03-25 19:17:59.07+05:30	2019-03-25 19:17:59.07+05:30	14
1248	a8:bd:27:7b:eb:90	Ethinos	0	-77	5180	2019-03-25 19:17:59.071+05:30	2019-03-25 19:17:59.071+05:30	14
1254	a8:bd:27:7c:07:71	Awfis	0	-79	5745	2019-03-25 19:17:59.071+05:30	2019-03-25 19:17:59.071+05:30	14
1257	a8:bd:27:7c:07:75	Al-Mulla-FTZ	0	-80	5745	2019-03-25 19:17:59.071+05:30	2019-03-25 19:17:59.071+05:30	14
1261	a8:bd:27:77:b3:20	Ethinos	0	-81	2462	2019-03-25 19:17:59.072+05:30	2019-03-25 19:17:59.072+05:30	14
1267	a8:bd:27:7b:e1:71	Awfis	0	-83	5260	2019-03-25 19:17:59.072+05:30	2019-03-25 19:17:59.072+05:30	14
1273	a8:bd:27:77:b3:32	INDX	0	-85	5180	2019-03-25 19:17:59.074+05:30	2019-03-25 19:17:59.074+05:30	14
1279	a8:bd:27:77:b3:33	Mmr-Research	0	-85	5180	2019-03-25 19:17:59.075+05:30	2019-03-25 19:17:59.075+05:30	14
1285	a8:bd:27:7b:cc:25	Al-Mulla-FTZ	0	-89	2412	2019-03-25 19:17:59.076+05:30	2019-03-25 19:17:59.076+05:30	14
408	a8:bd:27:77:b3:32	INDX	0	-86	5260	2019-03-18 10:13:11.402+05:30	2019-03-18 10:13:11.402+05:30	\N
411	a8:bd:27:77:b3:34	Nelson	0	-87	5260	2019-03-18 10:13:11.402+05:30	2019-03-18 10:13:11.402+05:30	\N
414	a8:bd:27:7b:e1:75	Al-Mulla-FTZ	0	-89	5260	2019-03-18 10:13:11.403+05:30	2019-03-18 10:13:11.403+05:30	\N
1235	a2:04:60:98:dd:d2	INDX-Guest	0	-68	2462	2019-03-25 19:17:59.069+05:30	2019-03-25 19:17:59.069+05:30	14
1242	a8:bd:27:7b:d0:f1	Awfis	0	-73	5260	2019-03-25 19:17:59.07+05:30	2019-03-25 19:17:59.07+05:30	14
1249	a8:bd:27:7b:da:23	Mmr-Research	0	-78	2462	2019-03-25 19:17:59.071+05:30	2019-03-25 19:17:59.071+05:30	14
1255	a8:bd:27:7b:da:21	Awfis	0	-79	2462	2019-03-25 19:17:59.071+05:30	2019-03-25 19:17:59.071+05:30	14
1262	a8:bd:27:7b:eb:71	Awfis	0	-83	5745	2019-03-25 19:17:59.072+05:30	2019-03-25 19:17:59.072+05:30	14
1268	a8:bd:27:7b:e1:70	Ethinos	0	-83	5260	2019-03-25 19:17:59.072+05:30	2019-03-25 19:17:59.072+05:30	14
1274	a8:bd:27:77:b3:30	Ethinos	0	-85	5180	2019-03-25 19:17:59.074+05:30	2019-03-25 19:17:59.074+05:30	14
1280	a8:bd:27:7b:da:30	Ethinos	0	-85	5745	2019-03-25 19:17:59.075+05:30	2019-03-25 19:17:59.075+05:30	14
1286	a8:bd:27:7b:cc:24	Nelson	0	-89	2412	2019-03-25 19:17:59.076+05:30	2019-03-25 19:17:59.076+05:30	14
1237	2e:33:61:56:57:af	Ravi Kadam’s iPhone	0	-71	2437	2019-03-25 19:17:59.069+05:30	2019-03-25 19:17:59.069+05:30	14
1246	a8:bd:27:7b:eb:92	INDX	0	-77	5180	2019-03-25 19:17:59.07+05:30	2019-03-25 19:17:59.07+05:30	14
1252	a8:bd:27:7c:07:73	Mmr-Research	0	-79	5745	2019-03-25 19:17:59.071+05:30	2019-03-25 19:17:59.071+05:30	14
1259	a8:bd:27:7b:e1:63	Mmr-Research	0	-80	2437	2019-03-25 19:17:59.072+05:30	2019-03-25 19:17:59.072+05:30	14
1265	a8:bd:27:7b:e1:73	Mmr-Research	0	-83	5260	2019-03-25 19:17:59.072+05:30	2019-03-25 19:17:59.072+05:30	14
1271	a8:bd:27:7b:eb:72	INDX	0	-84	5745	2019-03-25 19:17:59.073+05:30	2019-03-25 19:17:59.073+05:30	14
1277	a8:bd:27:7b:da:31	Awfis	0	-85	5745	2019-03-25 19:17:59.075+05:30	2019-03-25 19:17:59.075+05:30	14
1283	a8:bd:27:77:b3:31	Awfis	0	-86	5180	2019-03-25 19:17:59.075+05:30	2019-03-25 19:17:59.075+05:30	14
487	a8:bd:27:7c:07:74	Nelson	0	-79	5745	2019-03-18 11:33:02.815+05:30	2019-03-18 11:33:02.815+05:30	\N
492	a8:bd:27:7b:cc:72	INDX	0	-89	5260	2019-03-18 11:33:02.816+05:30	2019-03-18 11:33:02.816+05:30	\N
1287	18:a6:f7:67:78:d6	Beaconstalk	0	-45	2462	2019-03-25 19:27:07.467+05:30	2019-03-25 19:27:07.467+05:30	14
1288	a0:04:60:9e:dd:d2		0	-65	2462	2019-03-25 19:27:07.468+05:30	2019-03-25 19:27:07.468+05:30	14
1289	a8:bd:27:7b:eb:83	Mmr-Research	0	-66	2412	2019-03-25 19:27:07.468+05:30	2019-03-25 19:27:07.468+05:30	14
1290	a2:04:60:98:dd:d2	INDX-Guest	0	-67	2462	2019-03-25 19:27:07.468+05:30	2019-03-25 19:27:07.468+05:30	14
1291	a8:bd:27:7b:eb:82	INDX	0	-68	2412	2019-03-25 19:27:07.468+05:30	2019-03-25 19:27:07.468+05:30	14
1292	a8:bd:27:7b:eb:80	Ethinos	0	-69	2412	2019-03-25 19:27:07.468+05:30	2019-03-25 19:27:07.468+05:30	14
1293	a8:bd:27:7b:eb:95	Al-Mulla-FTZ	0	-71	5180	2019-03-25 19:27:07.468+05:30	2019-03-25 19:27:07.468+05:30	14
1295	a8:bd:27:7b:eb:94	Nelson	0	-71	5180	2019-03-25 19:27:07.468+05:30	2019-03-25 19:27:07.468+05:30	14
1297	a8:bd:27:7b:eb:93	Mmr-Research	0	-71	5180	2019-03-25 19:27:07.469+05:30	2019-03-25 19:27:07.469+05:30	14
1298	a8:bd:27:7b:eb:92	INDX	0	-71	5180	2019-03-25 19:27:07.469+05:30	2019-03-25 19:27:07.469+05:30	14
1299	a8:bd:27:7b:eb:91	Awfis	0	-71	5180	2019-03-25 19:27:07.469+05:30	2019-03-25 19:27:07.469+05:30	14
1303	a8:bd:27:7b:eb:63	Mmr-Research	0	-72	2412	2019-03-25 19:27:07.47+05:30	2019-03-25 19:27:07.47+05:30	14
1308	a8:bd:27:7b:da:21	Awfis	0	-74	2462	2019-03-25 19:27:07.471+05:30	2019-03-25 19:27:07.471+05:30	14
1311	a8:bd:27:7b:da:24	Nelson	0	-74	2462	2019-03-25 19:27:07.471+05:30	2019-03-25 19:27:07.471+05:30	14
1316	a8:bd:27:7b:e1:65	Al-Mulla-FTZ	0	-75	2437	2019-03-25 19:27:07.472+05:30	2019-03-25 19:27:07.472+05:30	14
1319	a8:bd:27:7c:07:72	INDX	0	-76	5745	2019-03-25 19:27:07.472+05:30	2019-03-25 19:27:07.472+05:30	14
1322	a8:bd:27:7c:07:73	Mmr-Research	0	-77	5745	2019-03-25 19:27:07.472+05:30	2019-03-25 19:27:07.472+05:30	14
1325	a8:bd:27:7b:eb:74	Nelson	0	-77	5745	2019-03-25 19:27:07.473+05:30	2019-03-25 19:27:07.473+05:30	14
1328	a8:bd:27:7b:eb:73	Mmr-Research	0	-78	5745	2019-03-25 19:27:07.473+05:30	2019-03-25 19:27:07.473+05:30	14
1331	a8:bd:27:7b:da:35	Al-Mulla-FTZ	0	-83	5745	2019-03-25 19:27:07.473+05:30	2019-03-25 19:27:07.473+05:30	14
1334	a8:bd:27:7b:da:31	Awfis	0	-83	5745	2019-03-25 19:27:07.473+05:30	2019-03-25 19:27:07.473+05:30	14
1337	a8:bd:27:7b:e1:74	Nelson	0	-85	5260	2019-03-25 19:27:07.474+05:30	2019-03-25 19:27:07.474+05:30	14
1340	a8:bd:27:7b:e1:71	Awfis	0	-86	5260	2019-03-25 19:27:07.474+05:30	2019-03-25 19:27:07.474+05:30	14
1343	a8:bd:27:77:b3:31	Awfis	0	-88	5180	2019-03-25 19:27:07.474+05:30	2019-03-25 19:27:07.474+05:30	14
1346	a8:bd:27:77:b3:30	Ethinos	0	-89	5180	2019-03-25 19:27:07.475+05:30	2019-03-25 19:27:07.475+05:30	14
488	a8:bd:27:7b:eb:60	Ethinos	0	-79	2462	2019-03-18 11:33:02.815+05:30	2019-03-18 11:33:02.815+05:30	\N
493	a8:bd:27:7b:e2:75	Al-Mulla-FTZ	0	-86	5745	2019-03-18 11:33:02.816+05:30	2019-03-18 11:33:02.816+05:30	\N
1294	a8:bd:27:7b:eb:81	Awfis	0	-70	2412	2019-03-25 19:27:07.468+05:30	2019-03-25 19:27:07.468+05:30	14
1301	a8:bd:27:7b:da:20	Ethinos	0	-72	2462	2019-03-25 19:27:07.47+05:30	2019-03-25 19:27:07.47+05:30	14
1305	a8:bd:27:7b:da:22	INDX	0	-73	2462	2019-03-25 19:27:07.471+05:30	2019-03-25 19:27:07.471+05:30	14
1312	a8:bd:27:7b:d0:f4	Nelson	0	-75	5260	2019-03-25 19:27:07.471+05:30	2019-03-25 19:27:07.471+05:30	14
1317	a8:bd:27:7b:e1:63	Mmr-Research	0	-75	2437	2019-03-25 19:27:07.472+05:30	2019-03-25 19:27:07.472+05:30	14
1323	a8:bd:27:7c:07:71	Awfis	0	-77	5745	2019-03-25 19:27:07.472+05:30	2019-03-25 19:27:07.472+05:30	14
1329	0c:b6:d2:5a:d4:80	MTNL-EDMPL	0	-78	2427	2019-03-25 19:27:07.473+05:30	2019-03-25 19:27:07.473+05:30	14
1335	a8:bd:27:7b:da:30	Ethinos	0	-83	5745	2019-03-25 19:27:07.473+05:30	2019-03-25 19:27:07.473+05:30	14
1341	a8:bd:27:7b:e1:75	Al-Mulla-FTZ	0	-87	5260	2019-03-25 19:27:07.474+05:30	2019-03-25 19:27:07.474+05:30	14
1347	a8:bd:27:77:b3:32	INDX	0	-90	5180	2019-03-25 19:27:07.475+05:30	2019-03-25 19:27:07.475+05:30	14
489	a4:2b:b0:a0:c1:36	Screencasting	0	-81	2462	2019-03-18 11:33:02.816+05:30	2019-03-18 11:33:02.816+05:30	\N
494	a8:bd:27:7b:cc:70	Ethinos	0	-89	5260	2019-03-18 11:33:02.816+05:30	2019-03-18 11:33:02.816+05:30	\N
1296	a8:bd:27:7b:eb:84	Nelson	0	-69	2412	2019-03-25 19:27:07.468+05:30	2019-03-25 19:27:07.468+05:30	14
1300	a8:bd:27:7b:d0:e1	Awfis	0	-72	2462	2019-03-25 19:27:07.469+05:30	2019-03-25 19:27:07.469+05:30	14
1304	a8:bd:27:7b:eb:62	INDX	0	-72	2412	2019-03-25 19:27:07.47+05:30	2019-03-25 19:27:07.47+05:30	14
1307	a8:bd:27:7b:da:23	Mmr-Research	0	-73	2462	2019-03-25 19:27:07.471+05:30	2019-03-25 19:27:07.471+05:30	14
1310	a8:bd:27:7b:d0:f0	Ethinos	0	-74	5260	2019-03-25 19:27:07.471+05:30	2019-03-25 19:27:07.471+05:30	14
1314	a8:bd:27:7b:d0:f2	INDX	0	-75	5260	2019-03-25 19:27:07.471+05:30	2019-03-25 19:27:07.471+05:30	14
1320	a8:bd:27:7c:07:75	Al-Mulla-FTZ	0	-77	5745	2019-03-25 19:27:07.472+05:30	2019-03-25 19:27:07.472+05:30	14
1326	a8:bd:27:7b:eb:72	INDX	0	-77	5745	2019-03-25 19:27:07.473+05:30	2019-03-25 19:27:07.473+05:30	14
1332	a8:bd:27:7b:da:34	Nelson	0	-83	5745	2019-03-25 19:27:07.473+05:30	2019-03-25 19:27:07.473+05:30	14
1338	a8:bd:27:7b:e1:72	INDX	0	-85	5260	2019-03-25 19:27:07.474+05:30	2019-03-25 19:27:07.474+05:30	14
1344	a8:bd:27:77:b3:34	Nelson	0	-89	5180	2019-03-25 19:27:07.474+05:30	2019-03-25 19:27:07.474+05:30	14
490	a8:bd:27:7b:e2:70	Ethinos	0	-86	5745	2019-03-18 11:33:02.816+05:30	2019-03-18 11:33:02.816+05:30	\N
1302	a8:bd:27:7b:eb:90	Ethinos	0	-72	5180	2019-03-25 19:27:07.47+05:30	2019-03-25 19:27:07.47+05:30	14
1306	a8:bd:27:7b:e1:61	Awfis	0	-73	2437	2019-03-25 19:27:07.471+05:30	2019-03-25 19:27:07.471+05:30	14
1313	a8:bd:27:7b:d0:f3	Mmr-Research	0	-75	5260	2019-03-25 19:27:07.471+05:30	2019-03-25 19:27:07.471+05:30	14
1318	a8:bd:27:7b:e1:60	Ethinos	0	-75	2437	2019-03-25 19:27:07.472+05:30	2019-03-25 19:27:07.472+05:30	14
1324	a8:bd:27:7c:07:70	Ethinos	0	-77	5745	2019-03-25 19:27:07.472+05:30	2019-03-25 19:27:07.472+05:30	14
1330	a8:bd:27:7c:07:64	Nelson	0	-79	2437	2019-03-25 19:27:07.473+05:30	2019-03-25 19:27:07.473+05:30	14
1336	a8:bd:27:7b:da:33	Mmr-Research	0	-84	5745	2019-03-25 19:27:07.474+05:30	2019-03-25 19:27:07.474+05:30	14
1342	a8:bd:27:77:b3:35	Al-Mulla-FTZ	0	-88	5180	2019-03-25 19:27:07.474+05:30	2019-03-25 19:27:07.474+05:30	14
1309	a8:bd:27:7b:d0:f5	Al-Mulla-FTZ	0	-74	5260	2019-03-25 19:27:07.471+05:30	2019-03-25 19:27:07.471+05:30	14
1315	a8:bd:27:7b:d0:f1	Awfis	0	-75	5260	2019-03-25 19:27:07.472+05:30	2019-03-25 19:27:07.472+05:30	14
1321	a8:bd:27:7c:07:74	Nelson	0	-77	5745	2019-03-25 19:27:07.472+05:30	2019-03-25 19:27:07.472+05:30	14
1327	a8:bd:27:7b:eb:75	Al-Mulla-FTZ	0	-78	5745	2019-03-25 19:27:07.473+05:30	2019-03-25 19:27:07.473+05:30	14
1333	a8:bd:27:7b:da:32	INDX	0	-83	5745	2019-03-25 19:27:07.473+05:30	2019-03-25 19:27:07.473+05:30	14
1339	a8:bd:27:7b:e1:70	Ethinos	0	-85	5260	2019-03-25 19:27:07.474+05:30	2019-03-25 19:27:07.474+05:30	14
1345	a8:bd:27:77:b3:33	Mmr-Research	0	-89	5180	2019-03-25 19:27:07.475+05:30	2019-03-25 19:27:07.475+05:30	14
1348	b2:35:9f:ae:c6:ee	DIRECT-BMLAPTOP-RLKD4AMImsEG	0	-30	2462	2019-03-25 19:30:08.138+05:30	2019-03-25 19:30:08.138+05:30	14
1349	18:a6:f7:67:78:d6	Beaconstalk	0	-41	2462	2019-03-25 19:30:08.138+05:30	2019-03-25 19:30:08.138+05:30	14
1350	a2:04:60:98:dd:d2	INDX-Guest	0	-63	2462	2019-03-25 19:30:08.138+05:30	2019-03-25 19:30:08.138+05:30	14
1351	a8:bd:27:7b:d0:e1	Awfis	0	-67	2462	2019-03-25 19:30:08.138+05:30	2019-03-25 19:30:08.138+05:30	14
1354	a8:bd:27:7b:d0:f4	Nelson	0	-69	5260	2019-03-25 19:30:08.138+05:30	2019-03-25 19:30:08.138+05:30	14
1355	a8:bd:27:7b:d0:f3	Mmr-Research	0	-69	5260	2019-03-25 19:30:08.138+05:30	2019-03-25 19:30:08.138+05:30	14
1356	a8:bd:27:7b:d0:e2	INDX	0	-70	2462	2019-03-25 19:30:08.138+05:30	2019-03-25 19:30:08.138+05:30	14
1359	a8:bd:27:7b:d0:f2	INDX	0	-70	5260	2019-03-25 19:30:08.139+05:30	2019-03-25 19:30:08.139+05:30	14
1362	a8:bd:27:7c:07:61	Awfis	0	-72	2437	2019-03-25 19:30:08.14+05:30	2019-03-25 19:30:08.14+05:30	14
1365	a8:bd:27:7b:da:23	Mmr-Research	0	-73	2462	2019-03-25 19:30:08.14+05:30	2019-03-25 19:30:08.14+05:30	14
1369	a8:bd:27:7b:da:22	INDX	0	-74	2462	2019-03-25 19:30:08.149+05:30	2019-03-25 19:30:08.149+05:30	14
1373	a8:bd:27:7b:eb:94	Nelson	0	-76	5180	2019-03-25 19:30:08.149+05:30	2019-03-25 19:30:08.149+05:30	14
1378	a8:bd:27:7b:eb:90	Ethinos	0	-76	5180	2019-03-25 19:30:08.149+05:30	2019-03-25 19:30:08.149+05:30	14
1383	a8:bd:27:7c:07:75	Al-Mulla-FTZ	0	-80	5745	2019-03-25 19:30:08.15+05:30	2019-03-25 19:30:08.15+05:30	14
1387	a8:bd:27:7b:eb:70	Ethinos	0	-80	5745	2019-03-25 19:30:08.15+05:30	2019-03-25 19:30:08.15+05:30	14
1390	a8:bd:27:77:b3:35	Al-Mulla-FTZ	0	-84	5180	2019-03-25 19:30:08.15+05:30	2019-03-25 19:30:08.15+05:30	14
1393	a8:bd:27:7b:da:33	Mmr-Research	0	-85	5745	2019-03-25 19:30:08.151+05:30	2019-03-25 19:30:08.151+05:30	14
1396	a8:bd:27:7b:e1:72	INDX	0	-86	5260	2019-03-25 19:30:08.151+05:30	2019-03-25 19:30:08.151+05:30	14
1399	a8:bd:27:7b:e1:70	Ethinos	0	-87	5260	2019-03-25 19:30:08.151+05:30	2019-03-25 19:30:08.151+05:30	14
1402	a8:bd:27:7b:e1:75	Al-Mulla-FTZ	0	-89	5260	2019-03-25 19:30:08.151+05:30	2019-03-25 19:30:08.151+05:30	14
566	a8:bd:27:7b:d0:f4	Nelson	0	-72	5260	2019-03-18 18:12:51.562+05:30	2019-03-18 18:12:51.562+05:30	\N
567	a8:bd:27:7b:d0:f2	INDX	0	-72	5260	2019-03-18 18:12:51.562+05:30	2019-03-18 18:12:51.562+05:30	\N
568	a8:bd:27:7b:d0:f1	Awfis	0	-72	5260	2019-03-18 18:12:51.562+05:30	2019-03-18 18:12:51.562+05:30	\N
572	a8:bd:27:7b:eb:64	Nelson	0	-75	2462	2019-03-18 18:12:51.563+05:30	2019-03-18 18:12:51.563+05:30	\N
576	a8:bd:27:7b:eb:91	Awfis	0	-80	5180	2019-03-18 18:12:51.569+05:30	2019-03-18 18:12:51.569+05:30	\N
577	a8:bd:27:7b:eb:90	Ethinos	0	-80	5180	2019-03-18 18:12:51.569+05:30	2019-03-18 18:12:51.569+05:30	\N
580	a8:bd:27:7c:07:61	Awfis	0	-81	2437	2019-03-18 18:12:51.569+05:30	2019-03-18 18:12:51.569+05:30	\N
582	a8:bd:27:77:b3:32	INDX	0	-84	5260	2019-03-18 18:12:51.569+05:30	2019-03-18 18:12:51.569+05:30	\N
583	a8:bd:27:7c:07:72	INDX	0	-84	5745	2019-03-18 18:12:51.569+05:30	2019-03-18 18:12:51.569+05:30	\N
586	a8:bd:27:7c:07:73	Mmr-Research	0	-84	5745	2019-03-18 18:12:51.57+05:30	2019-03-18 18:12:51.57+05:30	\N
588	a8:bd:27:77:b3:33	Mmr-Research	0	-85	5260	2019-03-18 18:12:51.57+05:30	2019-03-18 18:12:51.57+05:30	\N
589	a8:bd:27:77:b3:30	Ethinos	0	-85	5260	2019-03-18 18:12:51.57+05:30	2019-03-18 18:12:51.57+05:30	\N
592	a8:bd:27:77:b3:31	Awfis	0	-85	5260	2019-03-18 18:12:51.57+05:30	2019-03-18 18:12:51.57+05:30	\N
594	a8:bd:27:7b:e1:75	Al-Mulla-FTZ	0	-86	5260	2019-03-18 18:12:51.57+05:30	2019-03-18 18:12:51.57+05:30	\N
595	a8:bd:27:7b:e1:70	Ethinos	0	-86	5260	2019-03-18 18:12:51.57+05:30	2019-03-18 18:12:51.57+05:30	\N
598	a8:bd:27:7b:da:35	Al-Mulla-FTZ	0	-87	5260	2019-03-18 18:12:51.571+05:30	2019-03-18 18:12:51.571+05:30	\N
600	a8:bd:27:7b:da:34	Nelson	0	-87	5260	2019-03-18 18:12:51.571+05:30	2019-03-18 18:12:51.571+05:30	\N
601	a8:bd:27:7b:da:32	INDX	0	-87	5260	2019-03-18 18:12:51.571+05:30	2019-03-18 18:12:51.571+05:30	\N
604	a8:bd:27:7b:eb:71	Awfis	0	-88	5745	2019-03-18 18:12:51.571+05:30	2019-03-18 18:12:51.571+05:30	\N
606	a8:bd:27:7b:eb:74	Nelson	0	-88	5745	2019-03-18 18:12:51.571+05:30	2019-03-18 18:12:51.571+05:30	\N
607	a8:bd:27:7b:eb:70	Ethinos	0	-88	5745	2019-03-18 18:12:51.572+05:30	2019-03-18 18:12:51.572+05:30	\N
610	b2:35:9f:ae:c6:ee	DIRECT-BMLAPTOP-RLKD4AMImsEG	0	-47	2462	2019-03-18 18:12:51.67+05:30	2019-03-18 18:12:51.67+05:30	\N
612	a8:bd:27:7b:eb:84	Nelson	0	-58	2412	2019-03-18 18:12:51.67+05:30	2019-03-18 18:12:51.67+05:30	\N
613	a8:bd:27:7b:eb:83	Mmr-Research	0	-59	2412	2019-03-18 18:12:51.67+05:30	2019-03-18 18:12:51.67+05:30	\N
569	a8:bd:27:7b:d0:f0	Ethinos	0	-72	5260	2019-03-18 18:12:51.562+05:30	2019-03-18 18:12:51.562+05:30	\N
573	a8:bd:27:7b:eb:95	Al-Mulla-FTZ	0	-80	5180	2019-03-18 18:12:51.563+05:30	2019-03-18 18:12:51.563+05:30	\N
578	a8:bd:27:7b:eb:93	Mmr-Research	0	-81	5180	2019-03-18 18:12:51.569+05:30	2019-03-18 18:12:51.569+05:30	\N
585	a8:bd:27:77:b3:34	Nelson	0	-84	5260	2019-03-18 18:12:51.569+05:30	2019-03-18 18:12:51.569+05:30	\N
591	a8:bd:27:77:b3:35	Al-Mulla-FTZ	0	-85	5260	2019-03-18 18:12:51.57+05:30	2019-03-18 18:12:51.57+05:30	\N
597	a8:bd:27:7b:e1:72	INDX	0	-86	5260	2019-03-18 18:12:51.571+05:30	2019-03-18 18:12:51.571+05:30	\N
603	a8:bd:27:7b:da:31	Awfis	0	-87	5260	2019-03-18 18:12:51.571+05:30	2019-03-18 18:12:51.571+05:30	\N
609	c8:d7:79:eb:f3:ac	JioFi2_EBF3AC	0	-47	2462	2019-03-18 18:12:51.67+05:30	2019-03-18 18:12:51.67+05:30	\N
614	a8:bd:27:7b:eb:82	INDX	0	-59	2412	2019-03-18 18:12:51.67+05:30	2019-03-18 18:12:51.67+05:30	\N
621	a8:bd:27:7b:d0:e4	Nelson	0	-69	2437	2019-03-18 18:12:51.671+05:30	2019-03-18 18:12:51.671+05:30	\N
626	a8:bd:27:7b:d0:f1	Awfis	0	-72	5260	2019-03-18 18:12:51.671+05:30	2019-03-18 18:12:51.671+05:30	\N
633	a8:bd:27:7b:eb:92	INDX	0	-80	5180	2019-03-18 18:12:51.677+05:30	2019-03-18 18:12:51.677+05:30	\N
638	a8:bd:27:7c:07:61	Awfis	0	-81	2437	2019-03-18 18:12:51.677+05:30	2019-03-18 18:12:51.677+05:30	\N
645	a8:bd:27:7c:07:71	Awfis	0	-84	5745	2019-03-18 18:12:51.678+05:30	2019-03-18 18:12:51.678+05:30	\N
650	a8:bd:27:77:b3:31	Awfis	0	-85	5260	2019-03-18 18:12:51.678+05:30	2019-03-18 18:12:51.678+05:30	\N
657	a8:bd:27:7b:eb:73	Mmr-Research	0	-87	5745	2019-03-18 18:12:51.68+05:30	2019-03-18 18:12:51.68+05:30	\N
662	a8:bd:27:7b:eb:71	Awfis	0	-88	5745	2019-03-18 18:12:51.68+05:30	2019-03-18 18:12:51.68+05:30	\N
1352	a8:bd:27:7b:d0:e0	Ethinos	0	-67	2462	2019-03-25 19:30:08.138+05:30	2019-03-25 19:30:08.138+05:30	14
1358	a8:bd:27:7b:d0:f5	Al-Mulla-FTZ	0	-70	5260	2019-03-25 19:30:08.139+05:30	2019-03-25 19:30:08.139+05:30	14
1361	a8:bd:27:7b:d0:f0	Ethinos	0	-70	5260	2019-03-25 19:30:08.14+05:30	2019-03-25 19:30:08.14+05:30	14
1364	a8:bd:27:7b:e1:61	Awfis	0	-73	2437	2019-03-25 19:30:08.14+05:30	2019-03-25 19:30:08.14+05:30	14
1367	a8:bd:27:7c:07:63	Mmr-Research	0	-74	2437	2019-03-25 19:30:08.148+05:30	2019-03-25 19:30:08.148+05:30	14
1371	a8:bd:27:7c:07:62	INDX	0	-75	2437	2019-03-25 19:30:08.149+05:30	2019-03-25 19:30:08.149+05:30	14
1375	a8:bd:27:7b:eb:92	INDX	0	-76	5180	2019-03-25 19:30:08.149+05:30	2019-03-25 19:30:08.149+05:30	14
1380	a8:bd:27:7b:eb:73	Mmr-Research	0	-79	5745	2019-03-25 19:30:08.15+05:30	2019-03-25 19:30:08.15+05:30	14
1386	a8:bd:27:7b:eb:74	Nelson	0	-80	5745	2019-03-25 19:30:08.15+05:30	2019-03-25 19:30:08.15+05:30	14
1392	a8:bd:27:77:b3:32	INDX	0	-84	5180	2019-03-25 19:30:08.15+05:30	2019-03-25 19:30:08.15+05:30	14
1398	a8:bd:27:7b:da:34	Nelson	0	-86	5745	2019-03-25 19:30:08.151+05:30	2019-03-25 19:30:08.151+05:30	14
1404	a8:bd:27:7b:e1:71	Awfis	0	-89	5260	2019-03-25 19:30:08.151+05:30	2019-03-25 19:30:08.151+05:30	14
570	a8:bd:27:7b:d0:f3	Mmr-Research	0	-72	5260	2019-03-18 18:12:51.563+05:30	2019-03-18 18:12:51.563+05:30	\N
574	a8:bd:27:7b:eb:94	Nelson	0	-80	5180	2019-03-18 18:12:51.568+05:30	2019-03-18 18:12:51.568+05:30	\N
579	a8:bd:27:7c:07:63	Mmr-Research	0	-81	2437	2019-03-18 18:12:51.569+05:30	2019-03-18 18:12:51.569+05:30	\N
584	a8:bd:27:7c:07:70	Ethinos	0	-84	5745	2019-03-18 18:12:51.569+05:30	2019-03-18 18:12:51.569+05:30	\N
590	a8:bd:27:7c:07:74	Nelson	0	-85	5745	2019-03-18 18:12:51.57+05:30	2019-03-18 18:12:51.57+05:30	\N
596	a8:bd:27:7b:e1:73	Mmr-Research	0	-86	5260	2019-03-18 18:12:51.571+05:30	2019-03-18 18:12:51.571+05:30	\N
602	a8:bd:27:7b:e1:74	Nelson	0	-87	5260	2019-03-18 18:12:51.571+05:30	2019-03-18 18:12:51.571+05:30	\N
608	18:a6:f7:67:78:d6	Beaconstalk	0	-32	2462	2019-03-18 18:12:51.67+05:30	2019-03-18 18:12:51.67+05:30	\N
615	a8:bd:27:7b:eb:81	Awfis	0	-59	2412	2019-03-18 18:12:51.67+05:30	2019-03-18 18:12:51.67+05:30	\N
620	a8:bd:27:7b:d0:e0	Ethinos	0	-69	2437	2019-03-18 18:12:51.671+05:30	2019-03-18 18:12:51.671+05:30	\N
627	a8:bd:27:7b:d0:f0	Ethinos	0	-72	5260	2019-03-18 18:12:51.677+05:30	2019-03-18 18:12:51.677+05:30	\N
632	a8:bd:27:7b:eb:94	Nelson	0	-80	5180	2019-03-18 18:12:51.677+05:30	2019-03-18 18:12:51.677+05:30	\N
639	a8:bd:27:7c:07:60	Ethinos	0	-81	2437	2019-03-18 18:12:51.678+05:30	2019-03-18 18:12:51.678+05:30	\N
644	a8:bd:27:7c:07:73	Mmr-Research	0	-84	5745	2019-03-18 18:12:51.678+05:30	2019-03-18 18:12:51.678+05:30	\N
651	a8:bd:27:7c:07:75	Al-Mulla-FTZ	0	-86	5745	2019-03-18 18:12:51.678+05:30	2019-03-18 18:12:51.678+05:30	\N
656	a8:bd:27:7b:da:35	Al-Mulla-FTZ	0	-87	5260	2019-03-18 18:12:51.68+05:30	2019-03-18 18:12:51.68+05:30	\N
663	a8:bd:27:7b:da:33	Mmr-Research	0	-88	5260	2019-03-18 18:12:51.68+05:30	2019-03-18 18:12:51.68+05:30	\N
1353	a8:bd:27:7b:d0:e5	Al-Mulla-FTZ	0	-68	2462	2019-03-25 19:30:08.138+05:30	2019-03-25 19:30:08.138+05:30	14
1360	a8:bd:27:7b:d0:f1	Awfis	0	-70	5260	2019-03-25 19:30:08.14+05:30	2019-03-25 19:30:08.14+05:30	14
1363	a8:bd:27:7c:07:60	Ethinos	0	-73	2437	2019-03-25 19:30:08.14+05:30	2019-03-25 19:30:08.14+05:30	14
1366	a8:bd:27:7c:07:64	Nelson	0	-74	2437	2019-03-25 19:30:08.14+05:30	2019-03-25 19:30:08.14+05:30	14
1370	a8:bd:27:7c:07:65	Al-Mulla-FTZ	0	-75	2437	2019-03-25 19:30:08.149+05:30	2019-03-25 19:30:08.149+05:30	14
1374	a8:bd:27:7b:eb:93	Mmr-Research	0	-76	5180	2019-03-25 19:30:08.149+05:30	2019-03-25 19:30:08.149+05:30	14
1379	a8:bd:27:7c:07:74	Nelson	0	-79	5745	2019-03-25 19:30:08.15+05:30	2019-03-25 19:30:08.15+05:30	14
1385	a8:bd:27:7c:07:71	Awfis	0	-80	5745	2019-03-25 19:30:08.15+05:30	2019-03-25 19:30:08.15+05:30	14
1391	a8:bd:27:77:b3:34	Nelson	0	-84	5180	2019-03-25 19:30:08.15+05:30	2019-03-25 19:30:08.15+05:30	14
1397	a8:bd:27:7b:da:35	Al-Mulla-FTZ	0	-86	5745	2019-03-25 19:30:08.151+05:30	2019-03-25 19:30:08.151+05:30	14
1403	a8:bd:27:7b:e1:73	Mmr-Research	0	-89	5260	2019-03-25 19:30:08.151+05:30	2019-03-25 19:30:08.151+05:30	14
1357	a8:bd:27:7b:d0:e4	Nelson	0	-69	2462	2019-03-25 19:30:08.138+05:30	2019-03-25 19:30:08.138+05:30	14
1368	a8:bd:27:7b:da:24	Nelson	0	-74	2462	2019-03-25 19:30:08.148+05:30	2019-03-25 19:30:08.148+05:30	14
1376	a8:bd:27:7b:eb:95	Al-Mulla-FTZ	0	-76	5180	2019-03-25 19:30:08.149+05:30	2019-03-25 19:30:08.149+05:30	14
1381	a8:bd:27:77:b3:21	Awfis	0	-79	2462	2019-03-25 19:30:08.149+05:30	2019-03-25 19:30:08.149+05:30	14
1384	a8:bd:27:7c:07:73	Mmr-Research	0	-80	5745	2019-03-25 19:30:08.15+05:30	2019-03-25 19:30:08.15+05:30	14
1388	a8:bd:27:77:b3:33	Mmr-Research	0	-83	5180	2019-03-25 19:30:08.15+05:30	2019-03-25 19:30:08.15+05:30	14
1394	a8:bd:27:7b:da:32	INDX	0	-85	5745	2019-03-25 19:30:08.151+05:30	2019-03-25 19:30:08.151+05:30	14
1400	a8:bd:27:7b:da:30	Ethinos	0	-87	5745	2019-03-25 19:30:08.151+05:30	2019-03-25 19:30:08.151+05:30	14
723	a8:bd:27:77:b3:30	Ethinos	0	-81	5260	2019-03-20 14:33:38.963+05:30	2019-03-20 14:33:38.963+05:30	\N
728	a8:bd:27:7b:da:30	Ethinos	0	-86	5260	2019-03-20 14:33:38.964+05:30	2019-03-20 14:33:38.964+05:30	\N
1372	a8:bd:27:7b:da:25	Al-Mulla-FTZ	0	-75	2462	2019-03-25 19:30:08.149+05:30	2019-03-25 19:30:08.149+05:30	14
1377	a8:bd:27:7b:eb:91	Awfis	0	-76	5180	2019-03-25 19:30:08.149+05:30	2019-03-25 19:30:08.149+05:30	14
1382	a8:bd:27:7b:eb:72	INDX	0	-79	5745	2019-03-25 19:30:08.15+05:30	2019-03-25 19:30:08.15+05:30	14
1389	a8:bd:27:77:b3:30	Ethinos	0	-83	5180	2019-03-25 19:30:08.15+05:30	2019-03-25 19:30:08.15+05:30	14
1395	a8:bd:27:7b:da:31	Awfis	0	-85	5745	2019-03-25 19:30:08.151+05:30	2019-03-25 19:30:08.151+05:30	14
1401	a8:bd:27:7b:e1:74	Nelson	0	-88	5260	2019-03-25 19:30:08.151+05:30	2019-03-25 19:30:08.151+05:30	14
724	a8:bd:27:7b:da:32	INDX	0	-85	5260	2019-03-20 14:33:38.963+05:30	2019-03-20 14:33:38.963+05:30	\N
729	ae:ed:5c:ab:a0:95	DESKTOP-1R8G5CS 2130	0	-89	5745	2019-03-20 14:33:38.964+05:30	2019-03-20 14:33:38.964+05:30	\N
725	a8:bd:27:7b:da:33	Mmr-Research	0	-85	5260	2019-03-20 14:33:38.963+05:30	2019-03-20 14:33:38.963+05:30	\N
726	a8:bd:27:7b:da:31	Awfis	0	-85	5260	2019-03-20 14:33:38.963+05:30	2019-03-20 14:33:38.963+05:30	\N
802	a8:bd:27:7b:eb:92	INDX	0	-74	5180	2019-03-20 18:57:21.667+05:30	2019-03-20 18:57:21.667+05:30	\N
806	a8:bd:27:7c:07:75	Al-Mulla-FTZ	0	-79	5745	2019-03-20 18:57:21.667+05:30	2019-03-20 18:57:21.667+05:30	\N
810	a8:bd:27:7c:07:72	INDX	0	-79	5745	2019-03-20 18:57:21.669+05:30	2019-03-20 18:57:21.669+05:30	\N
815	a8:bd:27:7b:d0:f0	Ethinos	0	-80	5180	2019-03-20 18:57:21.669+05:30	2019-03-20 18:57:21.669+05:30	\N
821	a8:bd:27:77:b3:24	Nelson	0	-81	2462	2019-03-20 18:57:21.669+05:30	2019-03-20 18:57:21.669+05:30	\N
826	a8:bd:27:7b:e1:70	Ethinos	0	-82	5260	2019-03-20 18:57:21.67+05:30	2019-03-20 18:57:21.67+05:30	\N
830	a8:bd:27:7b:da:31	Awfis	0	-85	5260	2019-03-20 18:57:21.67+05:30	2019-03-20 18:57:21.67+05:30	\N
833	a8:bd:27:7b:da:34	Nelson	0	-86	5260	2019-03-20 18:57:21.67+05:30	2019-03-20 18:57:21.67+05:30	\N
836	a8:bd:27:7b:cc:25	Al-Mulla-FTZ	0	-89	2412	2019-03-20 18:57:21.67+05:30	2019-03-20 18:57:21.67+05:30	\N
803	a8:bd:27:7b:eb:91	Awfis	0	-75	5180	2019-03-20 18:57:21.667+05:30	2019-03-20 18:57:21.667+05:30	\N
807	a8:bd:27:7c:07:73	Mmr-Research	0	-79	5745	2019-03-20 18:57:21.669+05:30	2019-03-20 18:57:21.669+05:30	\N
812	a8:bd:27:7b:d0:f5	Al-Mulla-FTZ	0	-80	5180	2019-03-20 18:57:21.669+05:30	2019-03-20 18:57:21.669+05:30	\N
817	a8:bd:27:7b:e1:74	Nelson	0	-81	5260	2019-03-20 18:57:21.669+05:30	2019-03-20 18:57:21.669+05:30	\N
822	a8:bd:27:77:b3:35	Al-Mulla-FTZ	0	-82	5260	2019-03-20 18:57:21.669+05:30	2019-03-20 18:57:21.669+05:30	\N
827	a8:bd:27:77:b3:32	INDX	0	-83	5260	2019-03-20 18:57:21.67+05:30	2019-03-20 18:57:21.67+05:30	\N
832	a8:bd:27:7b:da:35	Al-Mulla-FTZ	0	-86	5260	2019-03-20 18:57:21.67+05:30	2019-03-20 18:57:21.67+05:30	\N
804	a8:bd:27:7b:eb:95	Al-Mulla-FTZ	0	-76	5180	2019-03-20 18:57:21.667+05:30	2019-03-20 18:57:21.667+05:30	\N
809	a8:bd:27:7c:07:71	Awfis	0	-79	5745	2019-03-20 18:57:21.669+05:30	2019-03-20 18:57:21.669+05:30	\N
814	a8:bd:27:7b:d0:f1	Awfis	0	-80	5180	2019-03-20 18:57:21.669+05:30	2019-03-20 18:57:21.669+05:30	\N
820	a8:bd:27:7b:e1:71	Awfis	0	-81	5260	2019-03-20 18:57:21.669+05:30	2019-03-20 18:57:21.669+05:30	\N
825	a8:bd:27:7b:e1:75	Al-Mulla-FTZ	0	-82	5260	2019-03-20 18:57:21.669+05:30	2019-03-20 18:57:21.669+05:30	\N
831	a8:bd:27:7b:da:30	Ethinos	0	-85	5260	2019-03-20 18:57:21.67+05:30	2019-03-20 18:57:21.67+05:30	\N
896	a8:bd:27:7b:eb:75	Al-Mulla-FTZ	0	-85	5745	2019-03-22 11:03:36.365+05:30	2019-03-22 11:03:36.365+05:30	\N
902	a8:bd:27:7b:e1:72	INDX	0	-86	5260	2019-03-22 11:03:36.366+05:30	2019-03-22 11:03:36.366+05:30	\N
908	a8:bd:27:77:b3:30	Ethinos	0	-92	5180	2019-03-22 11:03:36.366+05:30	2019-03-22 11:03:36.366+05:30	\N
897	a8:bd:27:7b:e1:71	Awfis	0	-85	5260	2019-03-22 11:03:36.365+05:30	2019-03-22 11:03:36.365+05:30	\N
903	a8:bd:27:77:b3:32	INDX	0	-89	5180	2019-03-22 11:03:36.366+05:30	2019-03-22 11:03:36.366+05:30	\N
898	a8:bd:27:7b:e1:70	Ethinos	0	-85	5260	2019-03-22 11:03:36.365+05:30	2019-03-22 11:03:36.365+05:30	\N
901	a8:bd:27:7b:e1:73	Mmr-Research	0	-86	5260	2019-03-22 11:03:36.366+05:30	2019-03-22 11:03:36.366+05:30	\N
904	a8:bd:27:77:b3:31	Awfis	0	-89	5180	2019-03-22 11:03:36.366+05:30	2019-03-22 11:03:36.366+05:30	\N
907	a8:bd:27:77:b3:35	Al-Mulla-FTZ	0	-91	5180	2019-03-22 11:03:36.366+05:30	2019-03-22 11:03:36.366+05:30	\N
899	a8:bd:27:7b:e1:75	Al-Mulla-FTZ	0	-86	5260	2019-03-22 11:03:36.365+05:30	2019-03-22 11:03:36.365+05:30	\N
905	a8:bd:27:77:b3:34	Nelson	0	-90	5180	2019-03-22 11:03:36.366+05:30	2019-03-22 11:03:36.366+05:30	\N
978	a8:bd:27:7b:eb:95	Al-Mulla-FTZ	0	-76	5180	2019-03-25 11:30:28.005+05:30	2019-03-25 11:30:28.005+05:30	\N
987	a8:bd:27:7c:07:60	Ethinos	0	-77	2437	2019-03-25 11:30:28.005+05:30	2019-03-25 11:30:28.005+05:30	\N
993	a8:bd:27:77:b3:23	Mmr-Research	0	-80	2462	2019-03-25 11:30:28.006+05:30	2019-03-25 11:30:28.006+05:30	\N
998	a8:bd:27:7b:da:33	Mmr-Research	0	-86	5745	2019-03-25 11:30:28.006+05:30	2019-03-25 11:30:28.006+05:30	\N
1004	a8:bd:27:7b:e1:72	INDX	0	-87	5260	2019-03-25 11:30:28.007+05:30	2019-03-25 11:30:28.007+05:30	\N
1010	a8:bd:27:77:b3:35	Al-Mulla-FTZ	0	-89	5180	2019-03-25 11:30:28.007+05:30	2019-03-25 11:30:28.007+05:30	\N
979	a8:bd:27:7b:eb:94	Nelson	0	-76	5180	2019-03-25 11:30:28.005+05:30	2019-03-25 11:30:28.005+05:30	\N
983	a8:bd:27:7c:07:63	Mmr-Research	0	-76	2437	2019-03-25 11:30:28.005+05:30	2019-03-25 11:30:28.005+05:30	\N
988	a8:bd:27:7b:eb:74	Nelson	0	-79	5745	2019-03-25 11:30:28.005+05:30	2019-03-25 11:30:28.005+05:30	\N
991	fe:01:7c:04:98:75	DIRECT-75-HP M254 LaserJet	0	-80	2437	2019-03-25 11:30:28.006+05:30	2019-03-25 11:30:28.006+05:30	\N
994	a8:bd:27:7b:eb:75	Al-Mulla-FTZ	0	-81	5745	2019-03-25 11:30:28.006+05:30	2019-03-25 11:30:28.006+05:30	\N
997	a8:bd:27:7b:da:34	Nelson	0	-86	5745	2019-03-25 11:30:28.006+05:30	2019-03-25 11:30:28.006+05:30	\N
1000	a8:bd:27:7b:e1:74	Nelson	0	-86	5260	2019-03-25 11:30:28.006+05:30	2019-03-25 11:30:28.006+05:30	\N
1003	a8:bd:27:7c:07:73	Mmr-Research	0	-86	5745	2019-03-25 11:30:28.007+05:30	2019-03-25 11:30:28.007+05:30	\N
1006	a8:bd:27:7c:07:75	Al-Mulla-FTZ	0	-88	5745	2019-03-25 11:30:28.007+05:30	2019-03-25 11:30:28.007+05:30	\N
1009	a8:bd:27:77:b3:32	INDX	0	-89	5180	2019-03-25 11:30:28.007+05:30	2019-03-25 11:30:28.007+05:30	\N
1012	a8:bd:27:77:b3:33	Mmr-Research	0	-90	5180	2019-03-25 11:30:28.007+05:30	2019-03-25 11:30:28.007+05:30	\N
980	a8:bd:27:7b:eb:93	Mmr-Research	0	-76	5180	2019-03-25 11:30:28.005+05:30	2019-03-25 11:30:28.005+05:30	\N
984	a8:bd:27:7b:d0:f5	Al-Mulla-FTZ	0	-77	5260	2019-03-25 11:30:28.005+05:30	2019-03-25 11:30:28.005+05:30	\N
989	a8:bd:27:7b:eb:73	Mmr-Research	0	-79	5745	2019-03-25 11:30:28.006+05:30	2019-03-25 11:30:28.006+05:30	\N
995	a8:bd:27:7c:07:72	INDX	0	-85	5745	2019-03-25 11:30:28.006+05:30	2019-03-25 11:30:28.006+05:30	\N
1001	a8:bd:27:7b:e1:71	Awfis	0	-86	5260	2019-03-25 11:30:28.006+05:30	2019-03-25 11:30:28.006+05:30	\N
1007	a8:bd:27:7c:07:74	Nelson	0	-88	5745	2019-03-25 11:30:28.007+05:30	2019-03-25 11:30:28.007+05:30	\N
1014	a8:bd:27:77:b3:31	Awfis	0	-91	5180	2019-03-25 11:30:28.007+05:30	2019-03-25 11:30:28.007+05:30	\N
981	a8:bd:27:7b:eb:92	INDX	0	-76	5180	2019-03-25 11:30:28.005+05:30	2019-03-25 11:30:28.005+05:30	\N
985	a8:bd:27:7b:d0:f2	INDX	0	-77	5260	2019-03-25 11:30:28.005+05:30	2019-03-25 11:30:28.005+05:30	\N
990	a8:bd:27:7b:eb:72	INDX	0	-80	5745	2019-03-25 11:30:28.006+05:30	2019-03-25 11:30:28.006+05:30	\N
996	a8:bd:27:7b:da:35	Al-Mulla-FTZ	0	-86	5745	2019-03-25 11:30:28.006+05:30	2019-03-25 11:30:28.006+05:30	\N
1002	a8:bd:27:7b:e1:70	Ethinos	0	-86	5260	2019-03-25 11:30:28.006+05:30	2019-03-25 11:30:28.006+05:30	\N
1008	a8:bd:27:7c:07:71	Awfis	0	-89	5745	2019-03-25 11:30:28.007+05:30	2019-03-25 11:30:28.007+05:30	\N
1013	a8:bd:27:77:b3:30	Ethinos	0	-90	5180	2019-03-25 11:30:28.007+05:30	2019-03-25 11:30:28.007+05:30	\N
1	00:18:25:00:89:c0	TTML_W18F24_39	0	-85	2427	2019-03-06 18:48:13.586+05:30	2019-03-06 18:48:13.586+05:30	\N
2	00:18:25:00:89:c1	Mgt_W18F24_39	0	-86	2427	2019-03-06 18:48:13.587+05:30	2019-03-06 18:48:13.587+05:30	\N
3	c4:e9:84:fd:58:e2	atharva	0	-94	2457	2019-03-06 18:48:13.587+05:30	2019-03-06 18:48:13.587+05:30	\N
4	ec:08:6b:a8:2a:8e	PRAJAPATI	0	-54	2417	2019-03-06 20:57:24.208+05:30	2019-03-06 20:57:24.208+05:30	\N
5	00:1e:a6:4b:0b:38	Sadda_Adda	0	-56	2447	2019-03-06 20:57:24.208+05:30	2019-03-06 20:57:24.208+05:30	\N
6	40:49:0f:65:6a:02	JioFiber-YtK58	0	-56	2472	2019-03-06 20:57:24.208+05:30	2019-03-06 20:57:24.208+05:30	\N
7	40:49:0f:57:9a:ad	JioFiber-RA2ra	0	-61	2427	2019-03-06 20:57:24.208+05:30	2019-03-06 20:57:24.208+05:30	\N
8	40:49:0f:65:6a:03	JioFiber-YtK58_5G	0	-68	5745	2019-03-06 20:57:24.208+05:30	2019-03-06 20:57:24.208+05:30	\N
9	40:49:0f:7c:19:52	Jai_Mhalar	0	-92	2457	2019-03-06 20:57:24.209+05:30	2019-03-06 20:57:24.209+05:30	\N
10	ac:84:c6:df:ab:c1	Sadda_Adda_Ext	0	-68	2447	2019-03-06 20:57:24.209+05:30	2019-03-06 20:57:24.209+05:30	\N
11	00:1e:a6:4b:0b:38	Sadda_Adda	0	-45	2447	2019-03-07 01:59:23.441+05:30	2019-03-07 01:59:23.441+05:30	\N
12	40:49:0f:65:6a:02	JioFiber-YtK58	0	-58	2472	2019-03-07 01:59:23.441+05:30	2019-03-07 01:59:23.441+05:30	\N
13	40:49:0f:57:9a:ad	JioFiber-RA2ra	0	-64	2427	2019-03-07 01:59:23.441+05:30	2019-03-07 01:59:23.441+05:30	\N
14	ec:08:6b:a8:2a:8e	PRAJAPATI	0	-64	2417	2019-03-07 01:59:23.444+05:30	2019-03-07 01:59:23.444+05:30	\N
15	40:49:0f:65:6a:03	JioFiber-YtK58_5G	0	-71	5745	2019-03-07 01:59:23.444+05:30	2019-03-07 01:59:23.444+05:30	\N
16	ac:84:c6:df:ab:c1	Sadda_Adda_Ext	0	-71	2447	2019-03-07 01:59:23.444+05:30	2019-03-07 01:59:23.444+05:30	\N
17	00:1e:a6:4b:0b:38	Sadda_Adda	0	-45	2447	2019-03-07 07:01:56.067+05:30	2019-03-07 07:01:56.067+05:30	\N
18	40:49:0f:65:6a:02	JioFiber-YtK58	0	-58	2472	2019-03-07 07:01:56.067+05:30	2019-03-07 07:01:56.067+05:30	\N
19	40:49:0f:57:9a:ad	JioFiber-RA2ra	0	-62	2427	2019-03-07 07:01:56.067+05:30	2019-03-07 07:01:56.067+05:30	\N
20	ac:84:c6:df:ab:c1	Sadda_Adda_Ext	0	-72	2447	2019-03-07 07:01:56.068+05:30	2019-03-07 07:01:56.068+05:30	\N
21	00:1e:a6:4b:0b:38	Sadda_Adda	0	-45	2447	2019-03-07 07:01:56.089+05:30	2019-03-07 07:01:56.089+05:30	\N
22	40:49:0f:65:6a:02	JioFiber-YtK58	0	-58	2472	2019-03-07 07:01:56.089+05:30	2019-03-07 07:01:56.089+05:30	\N
23	40:49:0f:57:9a:ad	JioFiber-RA2ra	0	-62	2427	2019-03-07 07:01:56.089+05:30	2019-03-07 07:01:56.089+05:30	\N
24	ac:84:c6:df:ab:c1	Sadda_Adda_Ext	0	-72	2447	2019-03-07 07:01:56.089+05:30	2019-03-07 07:01:56.089+05:30	\N
25	18:a6:f7:67:78:d6	Beaconstalk	0	-28	2462	2019-03-07 13:01:43.069+05:30	2019-03-07 13:01:43.069+05:30	\N
26	b2:35:9f:ae:c6:ee	DIRECT-BMLAPTOP-RLKD4AMImsEG	0	-42	2462	2019-03-07 13:01:43.07+05:30	2019-03-07 13:01:43.07+05:30	\N
27	c8:d7:79:eb:f3:ac	JioFi2_EBF3AC	0	-52	2442	2019-03-07 13:01:43.07+05:30	2019-03-07 13:01:43.07+05:30	\N
28	60:8e:08:f3:8e:95	AndroidAP	0	-56	2462	2019-03-07 13:01:43.07+05:30	2019-03-07 13:01:43.07+05:30	\N
29	ae:2b:6e:3a:29:38	DIRECT-zmDESKTOP-PJ0PBBEmsMz	0	-75	2412	2019-03-07 13:01:43.07+05:30	2019-03-07 13:01:43.07+05:30	\N
30	a8:bd:27:77:b3:21	Awfis	0	-76	2462	2019-03-07 13:01:43.071+05:30	2019-03-07 13:01:43.071+05:30	\N
31	a8:bd:27:7c:07:61	Awfis	0	-76	2437	2019-03-07 13:01:43.07+05:30	2019-03-07 13:01:43.07+05:30	\N
32	a8:bd:27:7b:d0:f0	Ethinos	0	-79	5260	2019-03-07 13:01:43.071+05:30	2019-03-07 13:01:43.071+05:30	\N
33	a8:bd:27:7b:e1:65	Al-Mulla-FTZ	0	-77	2437	2019-03-07 13:01:43.071+05:30	2019-03-07 13:01:43.071+05:30	\N
34	a8:bd:27:7b:d0:f5	Al-Mulla-FTZ	0	-79	5260	2019-03-07 13:01:43.071+05:30	2019-03-07 13:01:43.071+05:30	\N
35	a8:bd:27:7b:d0:f4	Nelson	0	-79	5260	2019-03-07 13:01:43.071+05:30	2019-03-07 13:01:43.071+05:30	\N
36	a8:bd:27:7b:d0:f3	Mmr-Research	0	-79	5260	2019-03-07 13:01:43.071+05:30	2019-03-07 13:01:43.071+05:30	\N
37	a8:bd:27:7b:d0:f2	INDX	0	-79	5260	2019-03-07 13:01:43.071+05:30	2019-03-07 13:01:43.071+05:30	\N
38	a8:bd:27:7b:d0:f1	Awfis	0	-79	5260	2019-03-07 13:01:43.072+05:30	2019-03-07 13:01:43.072+05:30	\N
39	a8:bd:27:7b:eb:94	Nelson	0	-80	5180	2019-03-07 13:01:43.072+05:30	2019-03-07 13:01:43.072+05:30	\N
40	a8:bd:27:7b:eb:93	Mmr-Research	0	-80	5180	2019-03-07 13:01:43.072+05:30	2019-03-07 13:01:43.072+05:30	\N
41	a8:bd:27:7b:eb:92	INDX	0	-80	5180	2019-03-07 13:01:43.072+05:30	2019-03-07 13:01:43.072+05:30	\N
42	a8:bd:27:7b:eb:91	Awfis	0	-80	5180	2019-03-07 13:01:43.072+05:30	2019-03-07 13:01:43.072+05:30	\N
43	a8:bd:27:7b:eb:90	Ethinos	0	-80	5180	2019-03-07 13:01:43.072+05:30	2019-03-07 13:01:43.072+05:30	\N
44	a8:bd:27:7b:eb:95	Al-Mulla-FTZ	0	-80	5180	2019-03-07 13:01:43.072+05:30	2019-03-07 13:01:43.072+05:30	\N
45	a8:bd:27:7c:07:70	Ethinos	0	-81	5260	2019-03-07 13:01:43.073+05:30	2019-03-07 13:01:43.073+05:30	\N
46	a8:bd:27:7c:07:75	Al-Mulla-FTZ	0	-82	5260	2019-03-07 13:01:43.073+05:30	2019-03-07 13:01:43.073+05:30	\N
47	a8:bd:27:7c:07:73	Mmr-Research	0	-82	5260	2019-03-07 13:01:43.073+05:30	2019-03-07 13:01:43.073+05:30	\N
48	a8:bd:27:7c:07:74	Nelson	0	-82	5260	2019-03-07 13:01:43.073+05:30	2019-03-07 13:01:43.073+05:30	\N
49	a8:bd:27:7c:07:71	Awfis	0	-82	5260	2019-03-07 13:01:43.073+05:30	2019-03-07 13:01:43.073+05:30	\N
50	82:ad:16:0f:15:6d	BwAAAFSzPdcAXwGCRedmi Note 5 Pr	0	-82	5180	2019-03-07 13:01:43.073+05:30	2019-03-07 13:01:43.073+05:30	\N
51	a8:bd:27:7c:07:72	INDX	0	-83	5260	2019-03-07 13:01:43.073+05:30	2019-03-07 13:01:43.073+05:30	\N
52	a8:bd:27:7b:eb:74	Nelson	0	-86	5745	2019-03-07 13:01:43.073+05:30	2019-03-07 13:01:43.073+05:30	\N
53	a8:bd:27:7b:da:35	Al-Mulla-FTZ	0	-86	5745	2019-03-07 13:01:43.074+05:30	2019-03-07 13:01:43.074+05:30	\N
54	a8:bd:27:7b:da:32	INDX	0	-86	5745	2019-03-07 13:01:43.074+05:30	2019-03-07 13:01:43.074+05:30	\N
55	a8:bd:27:7b:eb:70	Ethinos	0	-87	5745	2019-03-07 13:01:43.074+05:30	2019-03-07 13:01:43.074+05:30	\N
56	a8:bd:27:7b:eb:73	Mmr-Research	0	-87	5745	2019-03-07 13:01:43.074+05:30	2019-03-07 13:01:43.074+05:30	\N
57	a8:bd:27:7b:eb:72	INDX	0	-87	5745	2019-03-07 13:01:43.074+05:30	2019-03-07 13:01:43.074+05:30	\N
58	a8:bd:27:7b:eb:71	Awfis	0	-87	5745	2019-03-07 13:01:43.074+05:30	2019-03-07 13:01:43.074+05:30	\N
59	a8:bd:27:77:b3:30	Ethinos	0	-87	5180	2019-03-07 13:01:43.074+05:30	2019-03-07 13:01:43.074+05:30	\N
60	a8:bd:27:7b:da:33	Mmr-Research	0	-87	5745	2019-03-07 13:01:43.075+05:30	2019-03-07 13:01:43.075+05:30	\N
61	a8:bd:27:7b:da:31	Awfis	0	-87	5745	2019-03-07 13:01:43.075+05:30	2019-03-07 13:01:43.075+05:30	\N
62	a8:bd:27:7b:da:30	Ethinos	0	-87	5745	2019-03-07 13:01:43.075+05:30	2019-03-07 13:01:43.075+05:30	\N
63	a8:bd:27:77:b3:32	INDX	0	-88	5180	2019-03-07 13:01:43.075+05:30	2019-03-07 13:01:43.075+05:30	\N
64	a8:bd:27:7b:eb:75	Al-Mulla-FTZ	0	-88	5745	2019-03-07 13:01:43.075+05:30	2019-03-07 13:01:43.075+05:30	\N
65	a8:bd:27:7b:e1:71	Awfis	0	-88	5745	2019-03-07 13:01:43.075+05:30	2019-03-07 13:01:43.075+05:30	\N
66	a8:bd:27:77:b3:33	Mmr-Research	0	-88	5180	2019-03-07 13:01:43.075+05:30	2019-03-07 13:01:43.075+05:30	\N
67	a8:bd:27:7b:e1:75	Al-Mulla-FTZ	0	-88	5745	2019-03-07 13:01:43.075+05:30	2019-03-07 13:01:43.075+05:30	\N
68	a8:bd:27:7b:e1:73	Mmr-Research	0	-88	5745	2019-03-07 13:01:43.076+05:30	2019-03-07 13:01:43.076+05:30	\N
69	a8:bd:27:7b:e1:74	Nelson	0	-89	5745	2019-03-07 13:01:43.076+05:30	2019-03-07 13:01:43.076+05:30	\N
70	a8:bd:27:77:b3:35	Al-Mulla-FTZ	0	-89	5180	2019-03-07 13:01:43.076+05:30	2019-03-07 13:01:43.076+05:30	\N
71	a8:bd:27:77:b3:34	Nelson	0	-89	5180	2019-03-07 13:01:43.076+05:30	2019-03-07 13:01:43.076+05:30	\N
72	a8:bd:27:7b:e1:70	Ethinos	0	-90	5745	2019-03-07 13:01:43.076+05:30	2019-03-07 13:01:43.076+05:30	\N
74	a8:bd:27:7b:e1:72	INDX	0	-90	5745	2019-03-07 13:01:43.076+05:30	2019-03-07 13:01:43.076+05:30	\N
75	a8:bd:27:77:b3:24	Nelson	0	-58	2437	2019-03-07 14:15:49.019+05:30	2019-03-07 14:15:49.019+05:30	\N
76	a8:bd:27:77:b3:22	INDX	0	-58	2437	2019-03-07 14:15:49.019+05:30	2019-03-07 14:15:49.019+05:30	\N
77	a8:bd:27:77:b3:20	Ethinos	0	-59	2437	2019-03-07 14:15:49.02+05:30	2019-03-07 14:15:49.02+05:30	\N
78	a8:bd:27:77:b3:25	Al-Mulla-FTZ	0	-59	2437	2019-03-07 14:15:49.02+05:30	2019-03-07 14:15:49.02+05:30	\N
79	a8:bd:27:77:b3:23	Mmr-Research	0	-59	2437	2019-03-07 14:15:49.02+05:30	2019-03-07 14:15:49.02+05:30	\N
80	a8:bd:27:77:b3:21	Awfis	0	-60	2437	2019-03-07 14:15:49.02+05:30	2019-03-07 14:15:49.02+05:30	\N
81	a8:bd:27:77:b3:33	Mmr-Research	0	-64	5180	2019-03-07 14:15:49.02+05:30	2019-03-07 14:15:49.02+05:30	\N
82	a8:bd:27:77:b3:35	Al-Mulla-FTZ	0	-64	5180	2019-03-07 14:15:49.02+05:30	2019-03-07 14:15:49.02+05:30	\N
83	a8:bd:27:77:b3:32	INDX	0	-64	5180	2019-03-07 14:15:49.02+05:30	2019-03-07 14:15:49.02+05:30	\N
84	a8:bd:27:77:b3:31	Awfis	0	-60	5180	2019-03-07 14:15:49.02+05:30	2019-03-07 14:15:49.02+05:30	\N
85	a8:bd:27:77:b3:30	Ethinos	0	-64	5180	2019-03-07 14:15:49.02+05:30	2019-03-07 14:15:49.02+05:30	\N
86	a8:bd:27:77:b3:34	Nelson	0	-64	5180	2019-03-07 14:15:49.02+05:30	2019-03-07 14:15:49.02+05:30	\N
87	a8:bd:27:7b:d0:f5	Al-Mulla-FTZ	0	-74	5260	2019-03-07 14:15:49.021+05:30	2019-03-07 14:15:49.021+05:30	\N
88	a8:bd:27:7b:d0:f3	Mmr-Research	0	-74	5260	2019-03-07 14:15:49.021+05:30	2019-03-07 14:15:49.021+05:30	\N
89	a8:bd:27:7b:d0:f1	Awfis	0	-74	5260	2019-03-07 14:15:49.021+05:30	2019-03-07 14:15:49.021+05:30	\N
90	a4:2b:b0:a0:c1:36	Screencasting	0	-74	2462	2019-03-07 14:15:49.021+05:30	2019-03-07 14:15:49.021+05:30	\N
91	a8:bd:27:7b:eb:73	Mmr-Research	0	-74	5745	2019-03-07 14:15:49.021+05:30	2019-03-07 14:15:49.021+05:30	\N
92	a8:bd:27:7b:eb:71	Awfis	0	-74	5745	2019-03-07 14:15:49.021+05:30	2019-03-07 14:15:49.021+05:30	\N
93	a8:bd:27:7b:d0:f2	INDX	0	-75	5260	2019-03-07 14:15:49.021+05:30	2019-03-07 14:15:49.021+05:30	\N
94	a8:bd:27:7b:d0:f4	Nelson	0	-75	5260	2019-03-07 14:15:49.021+05:30	2019-03-07 14:15:49.021+05:30	\N
95	a8:bd:27:7b:d0:f0	Ethinos	0	-75	5260	2019-03-07 14:15:49.021+05:30	2019-03-07 14:15:49.021+05:30	\N
96	a8:bd:27:7b:eb:75	Al-Mulla-FTZ	0	-75	5745	2019-03-07 14:15:49.021+05:30	2019-03-07 14:15:49.021+05:30	\N
97	a8:bd:27:7b:eb:74	Nelson	0	-75	5745	2019-03-07 14:15:49.021+05:30	2019-03-07 14:15:49.021+05:30	\N
98	a8:bd:27:7b:eb:72	INDX	0	-75	5745	2019-03-07 14:15:49.022+05:30	2019-03-07 14:15:49.022+05:30	\N
99	a8:bd:27:7b:eb:70	Ethinos	0	-75	5745	2019-03-07 14:15:49.022+05:30	2019-03-07 14:15:49.022+05:30	\N
100	a8:bd:27:7c:07:64	Nelson	0	-75	2437	2019-03-07 14:15:49.022+05:30	2019-03-07 14:15:49.022+05:30	\N
101	ae:2b:6e:3a:29:38	DIRECT-zmDESKTOP-PJ0PBBEmsMz	0	-77	2462	2019-03-07 14:15:49.022+05:30	2019-03-07 14:15:49.022+05:30	\N
102	18:a6:f7:67:78:d6	Beaconstalk	0	-82	2462	2019-03-07 14:15:49.022+05:30	2019-03-07 14:15:49.022+05:30	\N
103	a8:bd:27:7c:07:75	Al-Mulla-FTZ	0	-85	5260	2019-03-07 14:15:49.022+05:30	2019-03-07 14:15:49.022+05:30	\N
104	a8:bd:27:7c:07:73	Mmr-Research	0	-85	5260	2019-03-07 14:15:49.022+05:30	2019-03-07 14:15:49.022+05:30	\N
105	a8:bd:27:7c:07:71	Awfis	0	-86	5260	2019-03-07 14:15:49.022+05:30	2019-03-07 14:15:49.022+05:30	\N
106	a8:bd:27:7c:07:74	Nelson	0	-87	5260	2019-03-07 14:15:49.022+05:30	2019-03-07 14:15:49.022+05:30	\N
107	a8:bd:27:7c:07:72	INDX	0	-87	5260	2019-03-07 14:15:49.022+05:30	2019-03-07 14:15:49.022+05:30	\N
108	a8:bd:27:7c:07:70	Ethinos	0	-87	5260	2019-03-07 14:15:49.022+05:30	2019-03-07 14:15:49.022+05:30	\N
109	a8:bd:27:7b:e1:73	Mmr-Research	0	-87	5745	2019-03-07 14:15:49.023+05:30	2019-03-07 14:15:49.023+05:30	\N
110	a8:bd:27:7b:e1:72	INDX	0	-87	5745	2019-03-07 14:15:49.023+05:30	2019-03-07 14:15:49.023+05:30	\N
111	a8:bd:27:7b:e1:71	Awfis	0	-88	5745	2019-03-07 14:15:49.023+05:30	2019-03-07 14:15:49.023+05:30	\N
112	a8:bd:27:7b:e1:70	Ethinos	0	-88	5745	2019-03-07 14:15:49.023+05:30	2019-03-07 14:15:49.023+05:30	\N
113	a8:bd:27:7b:e1:75	Al-Mulla-FTZ	0	-89	5745	2019-03-07 14:15:49.023+05:30	2019-03-07 14:15:49.023+05:30	\N
114	a8:bd:27:7b:e1:74	Nelson	0	-89	5745	2019-03-07 14:15:49.023+05:30	2019-03-07 14:15:49.023+05:30	\N
115	a8:bd:27:7b:da:24	Nelson	0	-90	2462	2019-03-07 14:15:49.023+05:30	2019-03-07 14:15:49.023+05:30	\N
116	a2:04:60:98:dd:d2	INDX-Guest	0	-94	2462	2019-03-07 14:15:49.023+05:30	2019-03-07 14:15:49.023+05:30	\N
117	a0:04:60:9e:dd:d2		0	-95	2462	2019-03-07 14:15:49.023+05:30	2019-03-07 14:15:49.023+05:30	\N
118	c8:d7:79:eb:f3:ac	JioFi2_EBF3AC	0	-55	2442	2019-03-07 14:50:21.089+05:30	2019-03-07 14:50:21.089+05:30	\N
119	00:80:48:6e:a0:8d	Equanimity	0	-62	2462	2019-03-07 14:50:21.089+05:30	2019-03-07 14:50:21.089+05:30	\N
120	00:80:48:6e:a0:8c	Equanimity	0	-64	2462	2019-03-07 14:50:21.089+05:30	2019-03-07 14:50:21.089+05:30	\N
121	2c:4d:54:1b:63:f4	Lifestyle-2	0	-70	2437	2019-03-07 14:50:21.09+05:30	2019-03-07 14:50:21.09+05:30	\N
122	f4:f2:6d:42:dd:a9	2.5G-APHN824B6441	0	-89	2457	2019-03-07 14:50:21.092+05:30	2019-03-07 14:50:21.092+05:30	\N
123	14:cc:20:e8:61:56	Microtrol_Ho	0	-91	2442	2019-03-07 14:50:21.092+05:30	2019-03-07 14:50:21.092+05:30	\N
124	a8:a7:95:4e:9d:b7	HP-Print-b7-LaserJet Pro M202dw	0	-92	2437	2019-03-07 14:50:21.093+05:30	2019-03-07 14:50:21.093+05:30	\N
125	28:56:5a:08:38:c1	JioFi	0	-93	2432	2019-03-07 14:50:21.093+05:30	2019-03-07 14:50:21.093+05:30	\N
126	40:e3:d6:a2:b1:42		0	-92	2462	2019-03-07 14:50:21.092+05:30	2019-03-07 14:50:21.092+05:30	\N
127	74:da:da:18:75:a7	iSecureNet_A40	0	-93	2467	2019-03-07 14:50:21.093+05:30	2019-03-07 14:50:21.093+05:30	\N
128	40:e3:d6:a2:b1:40	C2LBIZGuest	0	-93	2462	2019-03-07 14:50:21.093+05:30	2019-03-07 14:50:21.093+05:30	\N
129	40:e3:d6:a2:b1:41		0	-94	2462	2019-03-07 14:50:21.094+05:30	2019-03-07 14:50:21.094+05:30	\N
130	00:23:b1:88:ec:5a	0LA AUTOCONNECT VY4NN	0	-93	2412	2019-03-07 14:50:21.093+05:30	2019-03-07 14:50:21.093+05:30	\N
131	00:17:7c:8a:c7:36	BhUGOL	0	-93	2437	2019-03-07 14:50:21.093+05:30	2019-03-07 14:50:21.093+05:30	\N
132	0c:d2:b5:74:3e:c4	BRAHMAVIDYA	0	-95	2432	2019-03-07 14:50:21.095+05:30	2019-03-07 14:50:21.095+05:30	\N
133	c8:d7:79:eb:f3:ac	JioFi2_EBF3AC	0	-55	2442	2019-03-07 15:35:16.975+05:30	2019-03-07 15:35:16.975+05:30	\N
134	2c:4d:54:1b:63:f4	Lifestyle-2	0	-62	2437	2019-03-07 15:35:16.976+05:30	2019-03-07 15:35:16.976+05:30	\N
135	00:80:48:6e:a0:8d	Equanimity	0	-65	2462	2019-03-07 15:35:16.976+05:30	2019-03-07 15:35:16.976+05:30	\N
136	00:80:48:6e:a0:8c	Equanimity	0	-66	2462	2019-03-07 15:35:16.976+05:30	2019-03-07 15:35:16.976+05:30	\N
137	00:80:48:6e:a0:8d	Equanimity	0	-55	2462	2019-03-07 16:11:21.232+05:30	2019-03-07 16:11:21.232+05:30	\N
138	c8:d7:79:eb:f3:ac	JioFi2_EBF3AC	0	-39	2442	2019-03-07 16:11:21.232+05:30	2019-03-07 16:11:21.232+05:30	\N
139	2c:4d:54:1b:63:f4	Lifestyle-2	0	-77	2437	2019-03-07 16:11:21.232+05:30	2019-03-07 16:11:21.232+05:30	\N
140	00:80:48:6e:a0:8c	Equanimity	0	-75	2462	2019-03-07 16:11:21.232+05:30	2019-03-07 16:11:21.232+05:30	\N
141	c8:d7:79:eb:f3:ac	JioFi2_EBF3AC	0	-60	2442	2019-03-07 17:17:06.244+05:30	2019-03-07 17:17:06.244+05:30	\N
142	64:a2:f9:cd:7d:c3	Satish Menon	0	-85	2412	2019-03-07 17:17:06.244+05:30	2019-03-07 17:17:06.244+05:30	\N
143	64:a2:f9:c3:fa:fe	OnePlus 6T	0	-93	2447	2019-03-07 17:17:06.244+05:30	2019-03-07 17:17:06.244+05:30	\N
144	c8:d7:79:eb:f3:ac	JioFi2_EBF3AC	0	-49	2442	2019-03-07 19:25:18.546+05:30	2019-03-07 19:25:18.546+05:30	\N
145	00:23:b1:81:71:dc	0LA AUTOCONNECT 2K8FX	0	-83	2412	2019-03-07 19:25:18.546+05:30	2019-03-07 19:25:18.546+05:30	\N
146	c8:d7:79:eb:f3:ac	JioFi2_EBF3AC	0	-49	2442	2019-03-07 19:25:18.556+05:30	2019-03-07 19:25:18.556+05:30	\N
147	00:23:b1:81:71:dc	0LA AUTOCONNECT 2K8FX	0	-83	2412	2019-03-07 19:25:18.556+05:30	2019-03-07 19:25:18.556+05:30	\N
148	b8:c1:a2:66:b3:e7	DM1101C	0	-65	2417	2019-03-07 23:51:30.441+05:30	2019-03-07 23:51:30.441+05:30	\N
149	30:e1:71:c3:b3:d6	DIRECT-D5-HP OfficeJet Pro 6960	0	-85	2472	2019-03-07 23:51:30.441+05:30	2019-03-07 23:51:30.441+05:30	\N
150	58:d5:6e:bd:86:6e	TataC1201	0	-85	2472	2019-03-07 23:51:30.441+05:30	2019-03-07 23:51:30.441+05:30	\N
151	40:16:7e:c3:4a:5e	Sabai24	0	-88	2412	2019-03-07 23:51:30.441+05:30	2019-03-07 23:51:30.441+05:30	\N
152	c8:be:19:5c:4d:4b	Ganesh	0	-93	2462	2019-03-07 23:51:30.442+05:30	2019-03-07 23:51:30.442+05:30	\N
153	b8:c1:a2:66:b3:e7	DM1101C	0	-62	2417	2019-03-08 07:05:06.795+05:30	2019-03-08 07:05:06.795+05:30	\N
154	58:d5:6e:bd:86:6e	TataC1201	0	-82	2472	2019-03-08 07:05:06.795+05:30	2019-03-08 07:05:06.795+05:30	\N
155	40:16:7e:c3:4a:5e	Sabai24	0	-83	2412	2019-03-08 07:05:06.795+05:30	2019-03-08 07:05:06.795+05:30	\N
156	30:e1:71:c3:b3:d6	DIRECT-D5-HP OfficeJet Pro 6960	0	-86	2472	2019-03-08 07:05:06.795+05:30	2019-03-08 07:05:06.795+05:30	\N
157	00:26:75:29:10:35	AZTEC1035	0	-87	2412	2019-03-08 07:05:06.795+05:30	2019-03-08 07:05:06.795+05:30	\N
158	00:23:b1:8a:50:7a	0LA AUTOCONNECT 3Y70Q	0	-80	2412	2019-03-08 12:06:35.849+05:30	2019-03-08 12:06:35.849+05:30	\N
159	00:1e:a6:d5:09:60	iBall-Baton	0	-82	2437	2019-03-08 17:11:38.366+05:30	2019-03-08 17:11:38.366+05:30	\N
160	50:64:2b:4f:23:12	Weblink	0	-86	2457	2019-03-08 17:11:38.366+05:30	2019-03-08 17:11:38.366+05:30	\N
161	ec:22:80:ce:27:6d	Janavi	0	-87	2412	2019-03-08 17:11:38.366+05:30	2019-03-08 17:11:38.366+05:30	\N
162	08:b4:cf:05:45:da	PesthamCP1-PesthamCP2	0	-90	5200	2019-03-08 17:11:38.366+05:30	2019-03-08 17:11:38.366+05:30	\N
163	c4:e9:84:30:67:82	sid	0	-93	2442	2019-03-08 17:11:38.366+05:30	2019-03-08 17:11:38.366+05:30	\N
164	b8:c1:a2:66:b3:e7	DM1101C	0	-56	2417	2019-03-08 22:11:40.001+05:30	2019-03-08 22:11:40.001+05:30	\N
165	ec:08:6b:50:3f:12	SHIVALI	0	-76	2417	2019-03-08 22:11:40.002+05:30	2019-03-08 22:11:40.002+05:30	\N
166	ec:84:b4:55:47:f9	C_1103	0	-80	2412	2019-03-08 22:11:40.002+05:30	2019-03-08 22:11:40.002+05:30	\N
167	78:44:76:fc:81:f0	subodh13	0	-81	2412	2019-03-08 22:11:40.002+05:30	2019-03-08 22:11:40.002+05:30	\N
168	00:1e:a6:e1:af:40	2104	0	-85	2437	2019-03-08 22:11:40.003+05:30	2019-03-08 22:11:40.003+05:30	\N
169	02:ab:1b:51:36:7f	Menons-EXT	0	-93	2472	2019-03-08 22:11:40.003+05:30	2019-03-08 22:11:40.003+05:30	\N
170	34:ce:00:22:59:3e	Ganesh	0	-91	2462	2019-03-08 22:11:40.003+05:30	2019-03-08 22:11:40.003+05:30	\N
171	58:d5:6e:bd:86:6e	TataC1201	0	-84	2472	2019-03-08 22:11:40.002+05:30	2019-03-08 22:11:40.002+05:30	\N
172	b8:c1:a2:66:b3:e7	DM1101C	0	-62	2417	2019-03-09 03:11:41.485+05:30	2019-03-09 03:11:41.485+05:30	\N
173	ec:08:6b:50:3f:12	SHIVALI	0	-76	2417	2019-03-09 03:11:41.485+05:30	2019-03-09 03:11:41.485+05:30	\N
174	58:d5:6e:bd:86:6e	TataC1201	0	-84	2472	2019-03-09 03:11:41.485+05:30	2019-03-09 03:11:41.485+05:30	\N
175	18:a6:f7:87:57:9a	Aarna	0	-94	2417	2019-03-09 03:11:41.485+05:30	2019-03-09 03:11:41.485+05:30	\N
176	b8:c1:a2:66:b3:e7	DM1101C	0	-62	2417	2019-03-09 08:18:07.176+05:30	2019-03-09 08:18:07.176+05:30	\N
177	ec:08:6b:50:3f:12	SHIVALI	0	-81	2417	2019-03-09 08:18:07.176+05:30	2019-03-09 08:18:07.176+05:30	\N
178	ec:84:b4:55:47:fd	C	0	-88	5180	2019-03-09 08:18:07.176+05:30	2019-03-09 08:18:07.176+05:30	\N
179	0c:d2:b5:8b:c7:6b	BUSAGO 1	0	-56	2452	2019-03-09 13:23:17.929+05:30	2019-03-09 13:23:17.929+05:30	\N
180	94:65:2d:cb:0c:f6	XT1635-02 2999	0	-65	2422	2019-03-09 13:23:17.929+05:30	2019-03-09 13:23:17.929+05:30	\N
181	74:da:38:1b:59:f8	MOD Free Wi-Fi	0	-77	2432	2019-03-09 13:23:17.929+05:30	2019-03-09 13:23:17.929+05:30	\N
182	60:e3:27:77:9e:52	MOD POWAI	0	-92	2412	2019-03-09 13:23:17.929+05:30	2019-03-09 13:23:17.929+05:30	\N
183	b8:c1:a2:66:b3:e7	DM1101C	0	-65	2417	2019-03-09 18:26:13.343+05:30	2019-03-09 18:26:13.343+05:30	\N
184	ec:08:6b:50:3f:12	SHIVALI	0	-74	2417	2019-03-09 18:26:13.343+05:30	2019-03-09 18:26:13.343+05:30	\N
185	ec:84:b4:55:47:f9	C_1103	0	-79	2412	2019-03-09 18:26:13.343+05:30	2019-03-09 18:26:13.343+05:30	\N
186	58:d5:6e:bd:86:6e	TataC1201	0	-81	2472	2019-03-09 18:26:13.343+05:30	2019-03-09 18:26:13.343+05:30	\N
187	ec:84:b4:55:47:fd	C	0	-88	5180	2019-03-09 18:26:13.344+05:30	2019-03-09 18:26:13.344+05:30	\N
188	70:4f:57:4d:56:25	Centricity_Mumbai	0	-92	2432	2019-03-09 18:26:13.344+05:30	2019-03-09 18:26:13.344+05:30	\N
189	b8:c1:a2:66:b3:e7	DM1101C	0	-58	2417	2019-03-10 01:48:35.819+05:30	2019-03-10 01:48:35.819+05:30	\N
190	ec:08:6b:50:3f:12	SHIVALI	0	-74	2417	2019-03-10 01:48:35.82+05:30	2019-03-10 01:48:35.82+05:30	\N
191	ec:84:b4:55:47:f9	C_1103	0	-76	2412	2019-03-10 01:48:35.82+05:30	2019-03-10 01:48:35.82+05:30	\N
192	78:44:76:fc:81:f0	subodh13	0	-79	2452	2019-03-10 01:48:35.82+05:30	2019-03-10 01:48:35.82+05:30	\N
193	58:d5:6e:bd:86:6e	TataC1201	0	-80	2472	2019-03-10 01:48:35.82+05:30	2019-03-10 01:48:35.82+05:30	\N
194	00:1e:a6:e1:af:40	2104	0	-89	2437	2019-03-10 01:48:35.82+05:30	2019-03-10 01:48:35.82+05:30	\N
195	0c:d2:b6:37:2b:16	npbangera	0	-96	2432	2019-03-10 01:48:35.82+05:30	2019-03-10 01:48:35.82+05:30	\N
196	ec:84:b4:55:47:fd	C	0	-88	5180	2019-03-10 01:48:35.82+05:30	2019-03-10 01:48:35.82+05:30	\N
197	b8:c1:a2:66:b3:e7	DM1101C	0	-58	2417	2019-03-10 01:48:35.853+05:30	2019-03-10 01:48:35.853+05:30	\N
198	ec:08:6b:50:3f:12	SHIVALI	0	-74	2417	2019-03-10 01:48:35.853+05:30	2019-03-10 01:48:35.853+05:30	\N
199	ec:84:b4:55:47:f9	C_1103	0	-76	2412	2019-03-10 01:48:35.853+05:30	2019-03-10 01:48:35.853+05:30	\N
200	78:44:76:fc:81:f0	subodh13	0	-79	2452	2019-03-10 01:48:35.853+05:30	2019-03-10 01:48:35.853+05:30	\N
201	58:d5:6e:bd:86:6e	TataC1201	0	-80	2472	2019-03-10 01:48:35.853+05:30	2019-03-10 01:48:35.853+05:30	\N
202	ec:84:b4:55:47:fd	C	0	-88	5180	2019-03-10 01:48:35.853+05:30	2019-03-10 01:48:35.853+05:30	\N
203	00:1e:a6:e1:af:40	2104	0	-89	2437	2019-03-10 01:48:35.853+05:30	2019-03-10 01:48:35.853+05:30	\N
204	0c:d2:b6:37:2b:16	npbangera	0	-96	2432	2019-03-10 01:48:35.854+05:30	2019-03-10 01:48:35.854+05:30	\N
205	b8:c1:a2:66:b3:e7	DM1101C	0	-59	2417	2019-03-10 11:57:34.588+05:30	2019-03-10 11:57:34.588+05:30	\N
206	ec:08:6b:50:3f:12	SHIVALI	0	-73	2417	2019-03-10 11:57:34.588+05:30	2019-03-10 11:57:34.588+05:30	\N
207	58:d5:6e:bd:86:6e	TataC1201	0	-81	2472	2019-03-10 11:57:34.589+05:30	2019-03-10 11:57:34.589+05:30	\N
208	ec:84:b4:55:47:fd	C	0	-84	5180	2019-03-10 11:57:34.589+05:30	2019-03-10 11:57:34.589+05:30	\N
209	b8:c1:a2:66:b3:e7	DM1101C	0	-61	2417	2019-03-10 22:37:37.639+05:30	2019-03-10 22:37:37.639+05:30	\N
210	58:d5:6e:bd:86:6e	TataC1201	0	-80	2472	2019-03-10 22:37:37.639+05:30	2019-03-10 22:37:37.639+05:30	\N
211	ec:84:b4:55:47:fd	C	0	-84	5180	2019-03-10 22:37:37.639+05:30	2019-03-10 22:37:37.639+05:30	\N
212	70:4f:57:4d:56:25	Centricity_Mumbai	0	-93	2432	2019-03-10 22:37:37.639+05:30	2019-03-10 22:37:37.639+05:30	\N
213	ec:84:b4:55:47:fd	C	0	-83	5180	2019-03-11 05:58:56.263+05:30	2019-03-11 05:58:56.263+05:30	\N
214	ec:08:6b:50:3f:12	SHIVALI	0	-80	2417	2019-03-11 05:58:56.262+05:30	2019-03-11 05:58:56.262+05:30	\N
215	b8:c1:a2:66:b3:e7	DM1101C	0	-56	2417	2019-03-11 05:58:56.262+05:30	2019-03-11 05:58:56.262+05:30	\N
216	70:4f:57:4d:56:25	Centricity_Mumbai	0	-93	2432	2019-03-11 05:58:56.263+05:30	2019-03-11 05:58:56.263+05:30	\N
217	40:16:7e:c3:4a:5e	Sabai24	0	-83	2412	2019-03-11 05:58:56.263+05:30	2019-03-11 05:58:56.263+05:30	\N
220	a8:bd:27:7b:eb:80	Ethinos	0	-66	2437	2019-03-11 11:11:52.443+05:30	2019-03-11 11:11:52.443+05:30	\N
219	a8:bd:27:7b:eb:81	Awfis	0	-66	2437	2019-03-11 11:11:52.442+05:30	2019-03-11 11:11:52.442+05:30	\N
222	a8:bd:27:7b:eb:83	Mmr-Research	0	-67	2437	2019-03-11 11:11:52.443+05:30	2019-03-11 11:11:52.443+05:30	\N
224	a8:bd:27:7b:eb:84	Nelson	0	-72	2437	2019-03-11 11:11:52.444+05:30	2019-03-11 11:11:52.444+05:30	\N
227	a8:bd:27:7b:eb:94	Nelson	0	-74	5180	2019-03-11 11:11:52.445+05:30	2019-03-11 11:11:52.445+05:30	\N
230	a8:bd:27:7b:eb:95	Al-Mulla-FTZ	0	-74	5180	2019-03-11 11:11:52.444+05:30	2019-03-11 11:11:52.444+05:30	\N
231	a8:bd:27:7b:eb:91	Awfis	0	-75	5180	2019-03-11 11:11:52.445+05:30	2019-03-11 11:11:52.445+05:30	\N
234	a8:bd:27:7b:d0:f2	INDX	0	-77	5745	2019-03-11 11:11:52.452+05:30	2019-03-11 11:11:52.452+05:30	\N
237	a8:bd:27:7b:d0:f4	Nelson	0	-78	5745	2019-03-11 11:11:52.452+05:30	2019-03-11 11:11:52.452+05:30	\N
238	a8:bd:27:7b:d0:f3	Mmr-Research	0	-78	5745	2019-03-11 11:11:52.452+05:30	2019-03-11 11:11:52.452+05:30	\N
239	a8:bd:27:7b:d0:f1	Awfis	0	-78	5745	2019-03-11 11:11:52.452+05:30	2019-03-11 11:11:52.452+05:30	\N
242	a8:bd:27:7c:07:62	INDX	0	-78	2412	2019-03-11 11:11:52.452+05:30	2019-03-11 11:11:52.452+05:30	\N
243	a8:bd:27:7c:07:60	Ethinos	0	-79	2412	2019-03-11 11:11:52.452+05:30	2019-03-11 11:11:52.452+05:30	\N
244	a8:bd:27:7c:07:65	Al-Mulla-FTZ	0	-80	2412	2019-03-11 11:11:52.452+05:30	2019-03-11 11:11:52.452+05:30	\N
245	a8:bd:27:7c:07:64	Nelson	0	-80	2412	2019-03-11 11:11:52.453+05:30	2019-03-11 11:11:52.453+05:30	\N
246	a8:bd:27:7b:eb:75	Al-Mulla-FTZ	0	-80	5745	2019-03-11 11:11:52.453+05:30	2019-03-11 11:11:52.453+05:30	\N
249	a8:bd:27:7b:eb:72	INDX	0	-80	5745	2019-03-11 11:11:52.453+05:30	2019-03-11 11:11:52.453+05:30	\N
250	a8:bd:27:7b:eb:71	Awfis	0	-80	5745	2019-03-11 11:11:52.453+05:30	2019-03-11 11:11:52.453+05:30	\N
251	a8:bd:27:7b:eb:70	Ethinos	0	-80	5745	2019-03-11 11:11:52.453+05:30	2019-03-11 11:11:52.453+05:30	\N
253	a8:bd:27:7c:07:72	INDX	0	-81	5260	2019-03-11 11:11:52.454+05:30	2019-03-11 11:11:52.454+05:30	\N
255	a8:bd:27:7c:07:75	Al-Mulla-FTZ	0	-82	5260	2019-03-11 11:11:52.454+05:30	2019-03-11 11:11:52.454+05:30	\N
256	a8:bd:27:7c:07:74	Nelson	0	-82	5260	2019-03-11 11:11:52.454+05:30	2019-03-11 11:11:52.454+05:30	\N
257	a8:bd:27:7c:07:73	Mmr-Research	0	-82	5260	2019-03-11 11:11:52.455+05:30	2019-03-11 11:11:52.455+05:30	\N
259	a8:bd:27:7b:da:35	Al-Mulla-FTZ	0	-88	5260	2019-03-11 11:11:52.455+05:30	2019-03-11 11:11:52.455+05:30	\N
261	a8:bd:27:7b:da:32	INDX	0	-88	5260	2019-03-11 11:11:52.455+05:30	2019-03-11 11:11:52.455+05:30	\N
262	a8:bd:27:7b:da:31	Awfis	0	-88	5260	2019-03-11 11:11:52.455+05:30	2019-03-11 11:11:52.455+05:30	\N
264	a8:bd:27:7b:e1:63	Mmr-Research	0	-90	2412	2019-03-11 11:11:52.455+05:30	2019-03-11 11:11:52.455+05:30	\N
265	a8:bd:27:77:b3:31	Awfis	0	-92	5180	2019-03-11 11:11:52.455+05:30	2019-03-11 11:11:52.455+05:30	\N
266	b2:35:9f:ae:c6:ee	DIRECT-BMLAPTOP-RLKD4AMImsEG	0	-55	2462	2019-03-11 16:22:18.47+05:30	2019-03-11 16:22:18.47+05:30	\N
267	18:a6:f7:67:78:d6	Beaconstalk	0	-46	2462	2019-03-11 16:22:18.47+05:30	2019-03-11 16:22:18.47+05:30	\N
268	60:8e:08:f3:8e:95	AndroidAP	0	-57	2462	2019-03-11 16:22:18.47+05:30	2019-03-11 16:22:18.47+05:30	\N
269	a8:bd:27:7b:d0:e0	Ethinos	0	-73	2437	2019-03-11 16:22:18.47+05:30	2019-03-11 16:22:18.47+05:30	\N
270	a8:bd:27:7b:eb:95	Al-Mulla-FTZ	0	-77	5180	2019-03-11 16:22:18.47+05:30	2019-03-11 16:22:18.47+05:30	\N
271	62:4d:7f:76:a9:38	iPhone Bono	0	-67	2412	2019-03-11 16:22:18.47+05:30	2019-03-11 16:22:18.47+05:30	\N
272	a8:bd:27:7b:eb:93	Mmr-Research	0	-77	5180	2019-03-11 16:22:18.471+05:30	2019-03-11 16:22:18.471+05:30	\N
273	a8:bd:27:7b:eb:94	Nelson	0	-78	5180	2019-03-11 16:22:18.471+05:30	2019-03-11 16:22:18.471+05:30	\N
274	a8:bd:27:7b:eb:92	INDX	0	-78	5180	2019-03-11 16:22:18.471+05:30	2019-03-11 16:22:18.471+05:30	\N
275	a8:bd:27:7b:eb:91	Awfis	0	-78	5180	2019-03-11 16:22:18.471+05:30	2019-03-11 16:22:18.471+05:30	\N
276	a8:bd:27:7b:eb:90	Ethinos	0	-78	5180	2019-03-11 16:22:18.471+05:30	2019-03-11 16:22:18.471+05:30	\N
277	a8:bd:27:7c:07:62	INDX	0	-79	2412	2019-03-11 16:22:18.471+05:30	2019-03-11 16:22:18.471+05:30	\N
278	a8:bd:27:7c:07:63	Mmr-Research	0	-79	2412	2019-03-11 16:22:18.471+05:30	2019-03-11 16:22:18.471+05:30	\N
279	0c:b6:d2:5a:d4:80	MTNL-EDMPL	0	-79	2427	2019-03-11 16:22:18.471+05:30	2019-03-11 16:22:18.471+05:30	\N
280	a8:bd:27:7b:d0:f3	Mmr-Research	0	-80	5745	2019-03-11 16:22:18.471+05:30	2019-03-11 16:22:18.471+05:30	\N
281	a8:bd:27:7b:d0:f2	INDX	0	-80	5745	2019-03-11 16:22:18.471+05:30	2019-03-11 16:22:18.471+05:30	\N
282	a8:bd:27:7b:d0:f1	Awfis	0	-80	5745	2019-03-11 16:22:18.471+05:30	2019-03-11 16:22:18.471+05:30	\N
283	a8:bd:27:7c:07:61	Awfis	0	-80	2412	2019-03-11 16:22:18.472+05:30	2019-03-11 16:22:18.472+05:30	\N
284	a8:bd:27:7b:d0:f5	Al-Mulla-FTZ	0	-81	5745	2019-03-11 16:22:18.472+05:30	2019-03-11 16:22:18.472+05:30	\N
285	a8:bd:27:7b:d0:f4	Nelson	0	-81	5745	2019-03-11 16:22:18.472+05:30	2019-03-11 16:22:18.472+05:30	\N
286	a8:bd:27:7b:d0:f0	Ethinos	0	-81	5745	2019-03-11 16:22:18.472+05:30	2019-03-11 16:22:18.472+05:30	\N
287	a8:bd:27:7b:eb:75	Al-Mulla-FTZ	0	-84	5745	2019-03-11 16:22:18.472+05:30	2019-03-11 16:22:18.472+05:30	\N
288	a8:bd:27:7b:eb:74	Nelson	0	-84	5745	2019-03-11 16:22:18.472+05:30	2019-03-11 16:22:18.472+05:30	\N
289	a8:bd:27:7b:eb:73	Mmr-Research	0	-84	5745	2019-03-11 16:22:18.472+05:30	2019-03-11 16:22:18.472+05:30	\N
290	a8:bd:27:7b:eb:71	Awfis	0	-84	5745	2019-03-11 16:22:18.473+05:30	2019-03-11 16:22:18.473+05:30	\N
291	a8:bd:27:7b:eb:70	Ethinos	0	-84	5745	2019-03-11 16:22:18.473+05:30	2019-03-11 16:22:18.473+05:30	\N
292	a8:bd:27:7b:eb:72	INDX	0	-85	5745	2019-03-11 16:22:18.474+05:30	2019-03-11 16:22:18.474+05:30	\N
293	a8:bd:27:7c:07:74	Nelson	0	-86	5260	2019-03-11 16:22:18.476+05:30	2019-03-11 16:22:18.476+05:30	\N
294	a8:bd:27:7c:07:71	Awfis	0	-86	5260	2019-03-11 16:22:18.476+05:30	2019-03-11 16:22:18.476+05:30	\N
295	a8:bd:27:7c:07:70	Ethinos	0	-86	5260	2019-03-11 16:22:18.476+05:30	2019-03-11 16:22:18.476+05:30	\N
296	a8:bd:27:7c:07:72	INDX	0	-87	5260	2019-03-11 16:22:18.476+05:30	2019-03-11 16:22:18.476+05:30	\N
297	a8:bd:27:77:b3:20	Ethinos	0	-87	2437	2019-03-11 16:22:18.476+05:30	2019-03-11 16:22:18.476+05:30	\N
298	a8:bd:27:77:b3:25	Al-Mulla-FTZ	0	-88	2437	2019-03-11 16:22:18.477+05:30	2019-03-11 16:22:18.477+05:30	\N
299	a8:bd:27:77:b3:24	Nelson	0	-90	2437	2019-03-11 16:22:18.477+05:30	2019-03-11 16:22:18.477+05:30	\N
300	a8:bd:27:77:b3:34	Nelson	0	-91	5180	2019-03-11 16:22:18.477+05:30	2019-03-11 16:22:18.477+05:30	\N
301	b8:c1:a2:66:b3:e7	DM1101C	0	-57	2417	2019-03-11 21:38:02.616+05:30	2019-03-11 21:38:02.616+05:30	\N
302	58:d5:6e:bd:86:6e	TataC1201	0	-78	2472	2019-03-11 21:38:02.616+05:30	2019-03-11 21:38:02.616+05:30	\N
303	40:16:7e:c3:4a:5e	Sabai24	0	-80	2412	2019-03-11 21:38:02.616+05:30	2019-03-11 21:38:02.616+05:30	\N
304	ec:08:6b:50:3f:12	SHIVALI	0	-86	2417	2019-03-11 21:38:02.616+05:30	2019-03-11 21:38:02.616+05:30	\N
305	18:a6:f7:87:57:9a	Aarna	0	-92	2457	2019-03-11 21:38:02.617+05:30	2019-03-11 21:38:02.617+05:30	\N
306	ec:84:b4:55:47:fd	C	0	-94	5180	2019-03-11 21:38:02.617+05:30	2019-03-11 21:38:02.617+05:30	\N
307	b8:c1:a2:66:b3:e7	DM1101C	0	-56	2417	2019-03-12 07:03:49.332+05:30	2019-03-12 07:03:49.332+05:30	\N
308	58:d5:6e:bd:86:6e	TataC1201	0	-77	2472	2019-03-12 07:03:49.333+05:30	2019-03-12 07:03:49.333+05:30	\N
309	40:16:7e:c3:4a:5e	Sabai24	0	-78	2412	2019-03-12 07:03:49.333+05:30	2019-03-12 07:03:49.333+05:30	\N
310	ec:08:6b:50:3f:12	SHIVALI	0	-84	2417	2019-03-12 07:03:49.333+05:30	2019-03-12 07:03:49.333+05:30	\N
311	ec:84:b4:55:47:f9	C_1103	0	-84	2412	2019-03-12 07:03:49.333+05:30	2019-03-12 07:03:49.333+05:30	\N
312	d4:6e:0e:e7:91:6a	jyoti home	0	-91	2427	2019-03-12 07:03:49.333+05:30	2019-03-12 07:03:49.333+05:30	\N
313	ec:84:b4:55:47:fd	C	0	-90	5180	2019-03-12 07:03:49.333+05:30	2019-03-12 07:03:49.333+05:30	\N
316	18:a6:f7:67:78:d6	Beaconstalk	0	-47	2462	2019-03-12 12:08:20.071+05:30	2019-03-12 12:08:20.071+05:30	\N
319	a2:04:60:98:dd:d2	INDX-Guest	0	-71	2462	2019-03-12 12:08:20.071+05:30	2019-03-12 12:08:20.071+05:30	\N
320	a8:bd:27:7b:eb:83	Mmr-Research	0	-65	2412	2019-03-12 12:08:20.071+05:30	2019-03-12 12:08:20.071+05:30	\N
321	a8:bd:27:7b:d0:e2	INDX	0	-72	2412	2019-03-12 12:08:20.071+05:30	2019-03-12 12:08:20.071+05:30	\N
324	a8:bd:27:7b:eb:92	INDX	0	-73	5180	2019-03-12 12:08:20.072+05:30	2019-03-12 12:08:20.072+05:30	\N
327	a8:bd:27:7b:eb:91	Awfis	0	-73	5180	2019-03-12 12:08:20.072+05:30	2019-03-12 12:08:20.072+05:30	\N
328	7e:f7:e6:a8:b3:96	Shekhar’s iPhone	0	-74	2437	2019-03-12 12:08:20.075+05:30	2019-03-12 12:08:20.075+05:30	\N
332	a8:bd:27:7b:d0:f2	INDX	0	-82	5745	2019-03-12 12:08:20.075+05:30	2019-03-12 12:08:20.075+05:30	\N
334	a8:bd:27:7b:eb:72	INDX	0	-82	5745	2019-03-12 12:08:20.075+05:30	2019-03-12 12:08:20.075+05:30	\N
335	a8:bd:27:7b:d0:f4	Nelson	0	-83	5745	2019-03-12 12:08:20.075+05:30	2019-03-12 12:08:20.075+05:30	\N
338	a8:bd:27:7b:d0:f0	Ethinos	0	-83	5745	2019-03-12 12:08:20.075+05:30	2019-03-12 12:08:20.075+05:30	\N
339	a8:bd:27:7b:eb:75	Al-Mulla-FTZ	0	-83	5745	2019-03-12 12:08:20.075+05:30	2019-03-12 12:08:20.075+05:30	\N
340	a8:bd:27:7b:eb:74	Nelson	0	-83	5745	2019-03-12 12:08:20.075+05:30	2019-03-12 12:08:20.075+05:30	\N
343	a8:bd:27:7c:07:62	INDX	0	-84	2462	2019-03-12 12:08:20.076+05:30	2019-03-12 12:08:20.076+05:30	\N
344	a8:bd:27:7c:07:61	Awfis	0	-84	2462	2019-03-12 12:08:20.076+05:30	2019-03-12 12:08:20.076+05:30	\N
345	a8:bd:27:7c:07:64	Nelson	0	-84	2462	2019-03-12 12:08:20.076+05:30	2019-03-12 12:08:20.076+05:30	\N
346	a8:bd:27:7c:07:63	Mmr-Research	0	-84	2462	2019-03-12 12:08:20.076+05:30	2019-03-12 12:08:20.076+05:30	\N
349	a8:bd:27:77:b3:30	Ethinos	0	-89	5180	2019-03-12 12:08:20.076+05:30	2019-03-12 12:08:20.076+05:30	\N
350	a8:bd:27:77:b3:31	Awfis	0	-90	5180	2019-03-12 12:08:20.076+05:30	2019-03-12 12:08:20.076+05:30	\N
351	a8:bd:27:77:b3:32	INDX	0	-91	5180	2019-03-12 12:08:20.076+05:30	2019-03-12 12:08:20.076+05:30	\N
352	18:a6:f7:67:78:d6	Beaconstalk	0	-35	2462	2019-03-18 10:13:11.395+05:30	2019-03-18 10:13:11.395+05:30	\N
353	a8:bd:27:7b:d0:e0	Ethinos	0	-62	2437	2019-03-18 10:13:11.395+05:30	2019-03-18 10:13:11.395+05:30	\N
354	a8:bd:27:7b:eb:82	INDX	0	-63	2412	2019-03-18 10:13:11.395+05:30	2019-03-18 10:13:11.395+05:30	\N
355	a8:bd:27:7b:d0:e5	Al-Mulla-FTZ	0	-64	2437	2019-03-18 10:13:11.395+05:30	2019-03-18 10:13:11.395+05:30	\N
356	a8:bd:27:7b:d0:e3	Mmr-Research	0	-64	2437	2019-03-18 10:13:11.395+05:30	2019-03-18 10:13:11.395+05:30	\N
357	a8:bd:27:7b:d0:e2	INDX	0	-64	2437	2019-03-18 10:13:11.396+05:30	2019-03-18 10:13:11.396+05:30	\N
358	a8:bd:27:7b:d0:e4	Nelson	0	-64	2437	2019-03-18 10:13:11.395+05:30	2019-03-18 10:13:11.395+05:30	\N
359	a8:bd:27:7b:eb:83	Mmr-Research	0	-64	2412	2019-03-18 10:13:11.396+05:30	2019-03-18 10:13:11.396+05:30	\N
360	a8:bd:27:7b:d0:e1	Awfis	0	-64	2437	2019-03-18 10:13:11.396+05:30	2019-03-18 10:13:11.396+05:30	\N
361	a8:bd:27:7b:eb:80	Ethinos	0	-64	2412	2019-03-18 10:13:11.396+05:30	2019-03-18 10:13:11.396+05:30	\N
362	a8:bd:27:7b:eb:81	Awfis	0	-64	2412	2019-03-18 10:13:11.396+05:30	2019-03-18 10:13:11.396+05:30	\N
363	a8:bd:27:7b:eb:84	Nelson	0	-65	2412	2019-03-18 10:13:11.396+05:30	2019-03-18 10:13:11.396+05:30	\N
364	a8:bd:27:7b:eb:85	Al-Mulla-FTZ	0	-65	2412	2019-03-18 10:13:11.396+05:30	2019-03-18 10:13:11.396+05:30	\N
365	a8:bd:27:7b:eb:94	Nelson	0	-72	5180	2019-03-18 10:13:11.396+05:30	2019-03-18 10:13:11.396+05:30	\N
366	a8:bd:27:7b:eb:93	Mmr-Research	0	-72	5180	2019-03-18 10:13:11.396+05:30	2019-03-18 10:13:11.396+05:30	\N
367	a8:bd:27:7b:eb:92	INDX	0	-72	5180	2019-03-18 10:13:11.396+05:30	2019-03-18 10:13:11.396+05:30	\N
368	a8:bd:27:7b:eb:91	Awfis	0	-72	5180	2019-03-18 10:13:11.397+05:30	2019-03-18 10:13:11.397+05:30	\N
369	a8:bd:27:7b:da:25	Al-Mulla-FTZ	0	-72	2462	2019-03-18 10:13:11.397+05:30	2019-03-18 10:13:11.397+05:30	\N
370	a8:bd:27:7b:eb:90	Ethinos	0	-73	5180	2019-03-18 10:13:11.397+05:30	2019-03-18 10:13:11.397+05:30	\N
371	a8:bd:27:7c:07:63	Mmr-Research	0	-73	2462	2019-03-18 10:13:11.397+05:30	2019-03-18 10:13:11.397+05:30	\N
372	a8:bd:27:7b:eb:95	Al-Mulla-FTZ	0	-74	5180	2019-03-18 10:13:11.397+05:30	2019-03-18 10:13:11.397+05:30	\N
373	a8:bd:27:7c:07:62	INDX	0	-74	2462	2019-03-18 10:13:11.397+05:30	2019-03-18 10:13:11.397+05:30	\N
374	a8:bd:27:7b:da:22	INDX	0	-74	2462	2019-03-18 10:13:11.397+05:30	2019-03-18 10:13:11.397+05:30	\N
375	a2:04:60:98:dd:d2	INDX-Guest	0	-75	2462	2019-03-18 10:13:11.397+05:30	2019-03-18 10:13:11.397+05:30	\N
376	0c:b6:d2:5a:d4:80	MTNL-EDMPL	0	-75	2427	2019-03-18 10:13:11.397+05:30	2019-03-18 10:13:11.397+05:30	\N
377	a8:bd:27:7b:eb:74	Nelson	0	-76	5745	2019-03-18 10:13:11.398+05:30	2019-03-18 10:13:11.398+05:30	\N
378	a8:bd:27:7c:07:61	Awfis	0	-76	2462	2019-03-18 10:13:11.398+05:30	2019-03-18 10:13:11.398+05:30	\N
379	a8:bd:27:7b:e1:72	INDX	0	-77	5260	2019-03-18 10:13:11.398+05:30	2019-03-18 10:13:11.398+05:30	\N
380	a8:bd:27:7b:d0:f1	Awfis	0	-78	5745	2019-03-18 10:13:11.398+05:30	2019-03-18 10:13:11.398+05:30	\N
381	a8:bd:27:7b:d0:f5	Al-Mulla-FTZ	0	-79	5745	2019-03-18 10:13:11.398+05:30	2019-03-18 10:13:11.398+05:30	\N
382	a8:bd:27:7b:d0:f4	Nelson	0	-79	5745	2019-03-18 10:13:11.398+05:30	2019-03-18 10:13:11.398+05:30	\N
383	a8:bd:27:7b:eb:75	Al-Mulla-FTZ	0	-79	5745	2019-03-18 10:13:11.398+05:30	2019-03-18 10:13:11.398+05:30	\N
384	a8:bd:27:7b:eb:73	Mmr-Research	0	-79	5745	2019-03-18 10:13:11.398+05:30	2019-03-18 10:13:11.398+05:30	\N
385	a8:bd:27:7b:eb:72	INDX	0	-79	5745	2019-03-18 10:13:11.398+05:30	2019-03-18 10:13:11.398+05:30	\N
386	a8:bd:27:7b:eb:70	Ethinos	0	-79	5745	2019-03-18 10:13:11.398+05:30	2019-03-18 10:13:11.398+05:30	\N
387	a8:bd:27:7c:07:75	Al-Mulla-FTZ	0	-79	5745	2019-03-18 10:13:11.398+05:30	2019-03-18 10:13:11.398+05:30	\N
388	a8:bd:27:7b:e1:73	Mmr-Research	0	-79	5260	2019-03-18 10:13:11.399+05:30	2019-03-18 10:13:11.399+05:30	\N
389	a8:bd:27:7b:e1:71	Awfis	0	-79	5260	2019-03-18 10:13:11.399+05:30	2019-03-18 10:13:11.399+05:30	\N
390	a8:bd:27:7b:d0:f3	Mmr-Research	0	-80	5745	2019-03-18 10:13:11.399+05:30	2019-03-18 10:13:11.399+05:30	\N
391	a8:bd:27:7b:d0:f2	INDX	0	-80	5745	2019-03-18 10:13:11.399+05:30	2019-03-18 10:13:11.399+05:30	\N
392	a8:bd:27:7b:d0:f0	Ethinos	0	-80	5745	2019-03-18 10:13:11.399+05:30	2019-03-18 10:13:11.399+05:30	\N
393	a8:bd:27:7b:eb:71	Awfis	0	-80	5745	2019-03-18 10:13:11.399+05:30	2019-03-18 10:13:11.399+05:30	\N
394	a8:bd:27:7c:07:70	Ethinos	0	-80	5745	2019-03-18 10:13:11.399+05:30	2019-03-18 10:13:11.399+05:30	\N
395	a8:bd:27:7b:e1:70	Ethinos	0	-80	5260	2019-03-18 10:13:11.399+05:30	2019-03-18 10:13:11.399+05:30	\N
396	a8:bd:27:7c:07:74	Nelson	0	-81	5745	2019-03-18 10:13:11.399+05:30	2019-03-18 10:13:11.399+05:30	\N
397	a8:bd:27:7c:07:73	Mmr-Research	0	-81	5745	2019-03-18 10:13:11.399+05:30	2019-03-18 10:13:11.399+05:30	\N
398	a8:bd:27:7c:07:71	Awfis	0	-81	5745	2019-03-18 10:13:11.399+05:30	2019-03-18 10:13:11.399+05:30	\N
399	a8:bd:27:7b:e1:60	Ethinos	0	-81	2412	2019-03-18 10:13:11.4+05:30	2019-03-18 10:13:11.4+05:30	\N
400	a8:bd:27:7c:07:72	INDX	0	-81	5745	2019-03-18 10:13:11.4+05:30	2019-03-18 10:13:11.4+05:30	\N
401	a8:bd:27:7b:da:34	Nelson	0	-84	5260	2019-03-18 10:13:11.401+05:30	2019-03-18 10:13:11.401+05:30	\N
402	a8:bd:27:77:b3:35	Al-Mulla-FTZ	0	-85	5260	2019-03-18 10:13:11.401+05:30	2019-03-18 10:13:11.401+05:30	\N
403	a8:bd:27:7b:da:35	Al-Mulla-FTZ	0	-85	5260	2019-03-18 10:13:11.401+05:30	2019-03-18 10:13:11.401+05:30	\N
404	a8:bd:27:7b:da:33	Mmr-Research	0	-85	5260	2019-03-18 10:13:11.401+05:30	2019-03-18 10:13:11.401+05:30	\N
409	a8:bd:27:77:b3:33	Mmr-Research	0	-86	5260	2019-03-18 10:13:11.402+05:30	2019-03-18 10:13:11.402+05:30	\N
415	a8:bd:27:7b:cc:22	INDX	0	-90	2412	2019-03-18 10:13:11.403+05:30	2019-03-18 10:13:11.403+05:30	\N
416	18:a6:f7:67:78:d6	Beaconstalk	0	-43	2462	2019-03-18 10:56:42.193+05:30	2019-03-18 10:56:42.193+05:30	\N
417	a8:bd:27:7b:eb:81	Awfis	0	-61	2412	2019-03-18 10:56:42.193+05:30	2019-03-18 10:56:42.193+05:30	\N
418	a8:bd:27:7b:eb:80	Ethinos	0	-62	2412	2019-03-18 10:56:42.193+05:30	2019-03-18 10:56:42.193+05:30	\N
419	a8:bd:27:7b:eb:84	Nelson	0	-62	2412	2019-03-18 10:56:42.194+05:30	2019-03-18 10:56:42.194+05:30	\N
420	a8:bd:27:7b:eb:82	INDX	0	-62	2412	2019-03-18 10:56:42.194+05:30	2019-03-18 10:56:42.194+05:30	\N
421	a8:bd:27:7b:d0:e5	Al-Mulla-FTZ	0	-68	2437	2019-03-18 10:56:42.194+05:30	2019-03-18 10:56:42.194+05:30	\N
422	a8:bd:27:7b:d0:e2	INDX	0	-68	2437	2019-03-18 10:56:42.194+05:30	2019-03-18 10:56:42.194+05:30	\N
423	a8:bd:27:7b:d0:e0	Ethinos	0	-68	2437	2019-03-18 10:56:42.194+05:30	2019-03-18 10:56:42.194+05:30	\N
424	a8:bd:27:7b:d0:e4	Nelson	0	-68	2437	2019-03-18 10:56:42.194+05:30	2019-03-18 10:56:42.194+05:30	\N
425	a8:bd:27:7b:da:21	Awfis	0	-72	2462	2019-03-18 10:56:42.194+05:30	2019-03-18 10:56:42.194+05:30	\N
426	a8:bd:27:7b:da:24	Nelson	0	-74	2462	2019-03-18 10:56:42.194+05:30	2019-03-18 10:56:42.194+05:30	\N
427	a2:04:60:98:dd:d2	INDX-Guest	0	-72	2462	2019-03-18 10:56:42.194+05:30	2019-03-18 10:56:42.194+05:30	\N
428	a8:bd:27:7b:da:25	Al-Mulla-FTZ	0	-75	2462	2019-03-18 10:56:42.194+05:30	2019-03-18 10:56:42.194+05:30	\N
429	a8:bd:27:7b:d0:f3	Mmr-Research	0	-77	5745	2019-03-18 10:56:42.194+05:30	2019-03-18 10:56:42.194+05:30	\N
430	a8:bd:27:7b:eb:94	Nelson	0	-77	5180	2019-03-18 10:56:42.194+05:30	2019-03-18 10:56:42.194+05:30	\N
431	a8:bd:27:7b:eb:93	Mmr-Research	0	-77	5180	2019-03-18 10:56:42.194+05:30	2019-03-18 10:56:42.194+05:30	\N
432	a8:bd:27:7b:eb:92	INDX	0	-77	5180	2019-03-18 10:56:42.194+05:30	2019-03-18 10:56:42.194+05:30	\N
433	a8:bd:27:7b:eb:91	Awfis	0	-77	5180	2019-03-18 10:56:42.194+05:30	2019-03-18 10:56:42.194+05:30	\N
434	a8:bd:27:7b:eb:90	Ethinos	0	-77	5180	2019-03-18 10:56:42.195+05:30	2019-03-18 10:56:42.195+05:30	\N
435	a8:bd:27:7b:d0:f0	Ethinos	0	-77	5745	2019-03-18 10:56:42.195+05:30	2019-03-18 10:56:42.195+05:30	\N
436	a8:bd:27:7c:07:60	Ethinos	0	-77	2462	2019-03-18 10:56:42.195+05:30	2019-03-18 10:56:42.195+05:30	\N
437	a8:bd:27:7b:d0:f5	Al-Mulla-FTZ	0	-78	5745	2019-03-18 10:56:42.195+05:30	2019-03-18 10:56:42.195+05:30	\N
438	a8:bd:27:7b:eb:95	Al-Mulla-FTZ	0	-78	5180	2019-03-18 10:56:42.195+05:30	2019-03-18 10:56:42.195+05:30	\N
439	a8:bd:27:7b:d0:f2	INDX	0	-79	5745	2019-03-18 10:56:42.195+05:30	2019-03-18 10:56:42.195+05:30	\N
440	a8:bd:27:7b:d0:f4	Nelson	0	-79	5745	2019-03-18 10:56:42.195+05:30	2019-03-18 10:56:42.195+05:30	\N
441	a8:bd:27:7b:d0:f1	Awfis	0	-79	5745	2019-03-18 10:56:42.195+05:30	2019-03-18 10:56:42.195+05:30	\N
442	a8:bd:27:7b:eb:71	Awfis	0	-80	5745	2019-03-18 10:56:42.195+05:30	2019-03-18 10:56:42.195+05:30	\N
443	a8:bd:27:77:b3:22	INDX	0	-81	2412	2019-03-18 10:56:42.195+05:30	2019-03-18 10:56:42.195+05:30	\N
444	fe:01:7c:04:98:75	DIRECT-75-HP M254 LaserJet	0	-81	2437	2019-03-18 10:56:42.197+05:30	2019-03-18 10:56:42.197+05:30	\N
445	a8:bd:27:7b:eb:75	Al-Mulla-FTZ	0	-82	5745	2019-03-18 10:56:42.197+05:30	2019-03-18 10:56:42.197+05:30	\N
446	a8:bd:27:7b:eb:72	INDX	0	-82	5745	2019-03-18 10:56:42.197+05:30	2019-03-18 10:56:42.197+05:30	\N
447	a8:bd:27:7b:eb:73	Mmr-Research	0	-82	5745	2019-03-18 10:56:42.197+05:30	2019-03-18 10:56:42.197+05:30	\N
448	a8:bd:27:7b:eb:70	Ethinos	0	-82	5745	2019-03-18 10:56:42.197+05:30	2019-03-18 10:56:42.197+05:30	\N
449	a8:bd:27:7b:eb:74	Nelson	0	-83	5745	2019-03-18 10:56:42.197+05:30	2019-03-18 10:56:42.197+05:30	\N
450	a8:bd:27:7c:07:73	Mmr-Research	0	-84	5745	2019-03-18 10:56:42.197+05:30	2019-03-18 10:56:42.197+05:30	\N
451	a8:bd:27:7c:07:75	Al-Mulla-FTZ	0	-85	5745	2019-03-18 10:56:42.197+05:30	2019-03-18 10:56:42.197+05:30	\N
452	a8:bd:27:7c:07:74	Nelson	0	-86	5745	2019-03-18 10:56:42.197+05:30	2019-03-18 10:56:42.197+05:30	\N
453	a8:bd:27:7c:07:71	Awfis	0	-86	5745	2019-03-18 10:56:42.197+05:30	2019-03-18 10:56:42.197+05:30	\N
454	a8:bd:27:7c:07:72	INDX	0	-86	5745	2019-03-18 10:56:42.197+05:30	2019-03-18 10:56:42.197+05:30	\N
455	a8:bd:27:77:b3:31	Awfis	0	-88	5260	2019-03-18 10:56:42.197+05:30	2019-03-18 10:56:42.197+05:30	\N
456	a8:bd:27:77:b3:34	Nelson	0	-89	5260	2019-03-18 10:56:42.197+05:30	2019-03-18 10:56:42.197+05:30	\N
457	a8:bd:27:77:b3:33	Mmr-Research	0	-89	5260	2019-03-18 10:56:42.197+05:30	2019-03-18 10:56:42.197+05:30	\N
458	a8:bd:27:7b:e1:70	Ethinos	0	-89	5260	2019-03-18 10:56:42.197+05:30	2019-03-18 10:56:42.197+05:30	\N
459	a8:bd:27:77:b3:35	Al-Mulla-FTZ	0	-90	5260	2019-03-18 10:56:42.198+05:30	2019-03-18 10:56:42.198+05:30	\N
460	a8:bd:27:77:b3:32	INDX	0	-90	5260	2019-03-18 10:56:42.198+05:30	2019-03-18 10:56:42.198+05:30	\N
461	a8:bd:27:77:b3:30	Ethinos	0	-90	5260	2019-03-18 10:56:42.198+05:30	2019-03-18 10:56:42.198+05:30	\N
462	a8:bd:27:7b:e1:71	Awfis	0	-90	5260	2019-03-18 10:56:42.198+05:30	2019-03-18 10:56:42.198+05:30	\N
463	5e:5f:67:41:88:4a	DIRECT-UHMMRIND-13msaG	0	-90	5220	2019-03-18 10:56:42.198+05:30	2019-03-18 10:56:42.198+05:30	\N
464	a8:bd:27:7b:d0:e4	Nelson	0	-62	2437	2019-03-18 11:33:02.814+05:30	2019-03-18 11:33:02.814+05:30	\N
465	a8:bd:27:7b:d0:e3	Mmr-Research	0	-62	2437	2019-03-18 11:33:02.814+05:30	2019-03-18 11:33:02.814+05:30	\N
466	a8:bd:27:7b:d0:e5	Al-Mulla-FTZ	0	-62	2437	2019-03-18 11:33:02.814+05:30	2019-03-18 11:33:02.814+05:30	\N
467	a8:bd:27:7b:d0:e1	Awfis	0	-62	2437	2019-03-18 11:33:02.814+05:30	2019-03-18 11:33:02.814+05:30	\N
468	a8:bd:27:77:b3:35	Al-Mulla-FTZ	0	-64	5260	2019-03-18 11:33:02.814+05:30	2019-03-18 11:33:02.814+05:30	\N
469	a8:bd:27:7b:d0:e0	Ethinos	0	-62	2437	2019-03-18 11:33:02.814+05:30	2019-03-18 11:33:02.814+05:30	\N
470	a8:bd:27:7b:d0:e2	INDX	0	-62	2437	2019-03-18 11:33:02.814+05:30	2019-03-18 11:33:02.814+05:30	\N
471	a8:bd:27:77:b3:32	INDX	0	-64	5260	2019-03-18 11:33:02.814+05:30	2019-03-18 11:33:02.814+05:30	\N
472	a8:bd:27:77:b3:34	Nelson	0	-65	5260	2019-03-18 11:33:02.814+05:30	2019-03-18 11:33:02.814+05:30	\N
473	a8:bd:27:77:b3:30	Ethinos	0	-64	5260	2019-03-18 11:33:02.814+05:30	2019-03-18 11:33:02.814+05:30	\N
474	a8:bd:27:77:b3:31	Awfis	0	-65	5260	2019-03-18 11:33:02.815+05:30	2019-03-18 11:33:02.815+05:30	\N
475	a8:bd:27:77:b3:33	Mmr-Research	0	-65	5260	2019-03-18 11:33:02.815+05:30	2019-03-18 11:33:02.815+05:30	\N
476	a8:bd:27:77:b3:24	Nelson	0	-67	2412	2019-03-18 11:33:02.815+05:30	2019-03-18 11:33:02.815+05:30	\N
477	a8:bd:27:77:b3:22	INDX	0	-67	2412	2019-03-18 11:33:02.815+05:30	2019-03-18 11:33:02.815+05:30	\N
478	a8:bd:27:77:b3:23	Mmr-Research	0	-67	2412	2019-03-18 11:33:02.815+05:30	2019-03-18 11:33:02.815+05:30	\N
479	a8:bd:27:77:b3:21	Awfis	0	-67	2412	2019-03-18 11:33:02.815+05:30	2019-03-18 11:33:02.815+05:30	\N
480	a8:bd:27:7c:07:71	Awfis	0	-74	5745	2019-03-18 11:33:02.815+05:30	2019-03-18 11:33:02.815+05:30	\N
481	a8:bd:27:7c:07:73	Mmr-Research	0	-75	5745	2019-03-18 11:33:02.815+05:30	2019-03-18 11:33:02.815+05:30	\N
482	a8:bd:27:77:b3:20	Ethinos	0	-67	2412	2019-03-18 11:33:02.815+05:30	2019-03-18 11:33:02.815+05:30	\N
483	a8:bd:27:7b:eb:63	Mmr-Research	0	-78	2462	2019-03-18 11:33:02.815+05:30	2019-03-18 11:33:02.815+05:30	\N
484	a8:bd:27:7c:07:75	Al-Mulla-FTZ	0	-79	5745	2019-03-18 11:33:02.815+05:30	2019-03-18 11:33:02.815+05:30	\N
485	a8:bd:27:7b:eb:62	INDX	0	-79	2462	2019-03-18 11:33:02.815+05:30	2019-03-18 11:33:02.815+05:30	\N
486	a8:bd:27:7b:eb:61	Awfis	0	-79	2462	2019-03-18 11:33:02.815+05:30	2019-03-18 11:33:02.815+05:30	\N
491	a8:bd:27:7b:cc:75	Al-Mulla-FTZ	0	-89	5260	2019-03-18 11:33:02.816+05:30	2019-03-18 11:33:02.816+05:30	\N
497	b2:35:9f:ae:c6:ee	DIRECT-BMLAPTOP-RLKD4AMImsEG	0	-60	2462	2019-03-18 12:40:18.76+05:30	2019-03-18 12:40:18.76+05:30	\N
496	a2:04:60:98:dd:d2	INDX-Guest	0	-72	2462	2019-03-18 12:40:18.76+05:30	2019-03-18 12:40:18.76+05:30	\N
495	18:a6:f7:67:78:d6	Beaconstalk	0	-53	2462	2019-03-18 12:40:18.76+05:30	2019-03-18 12:40:18.76+05:30	\N
498	0c:b6:d2:5a:d4:80	MTNL-EDMPL	0	-76	2427	2019-03-18 12:40:18.761+05:30	2019-03-18 12:40:18.761+05:30	\N
499	50:8f:4c:af:13:ff	Redmi_shirish	0	-77	2412	2019-03-18 12:40:18.761+05:30	2019-03-18 12:40:18.761+05:30	\N
500	a8:bd:27:7b:d0:e5	Al-Mulla-FTZ	0	-77	2437	2019-03-18 12:40:18.761+05:30	2019-03-18 12:40:18.761+05:30	\N
501	a8:bd:27:7b:d0:e3	Mmr-Research	0	-77	2437	2019-03-18 12:40:18.761+05:30	2019-03-18 12:40:18.761+05:30	\N
502	a8:bd:27:7b:d0:e4	Nelson	0	-77	2437	2019-03-18 12:40:18.761+05:30	2019-03-18 12:40:18.761+05:30	\N
503	a8:bd:27:7b:d0:e0	Ethinos	0	-77	2437	2019-03-18 12:40:18.761+05:30	2019-03-18 12:40:18.761+05:30	\N
504	a8:bd:27:7b:eb:81	Awfis	0	-78	2412	2019-03-18 12:40:18.761+05:30	2019-03-18 12:40:18.761+05:30	\N
505	a8:bd:27:7b:d0:e1	Awfis	0	-77	2437	2019-03-18 12:40:18.761+05:30	2019-03-18 12:40:18.761+05:30	\N
506	a8:bd:27:7b:d0:e2	INDX	0	-78	2437	2019-03-18 12:40:18.761+05:30	2019-03-18 12:40:18.761+05:30	\N
507	a8:bd:27:7b:eb:65	Al-Mulla-FTZ	0	-78	2462	2019-03-18 12:40:18.761+05:30	2019-03-18 12:40:18.761+05:30	\N
508	a8:bd:27:7b:eb:60	Ethinos	0	-78	2462	2019-03-18 12:40:18.761+05:30	2019-03-18 12:40:18.761+05:30	\N
509	a8:bd:27:7b:eb:64	Nelson	0	-78	2462	2019-03-18 12:40:18.761+05:30	2019-03-18 12:40:18.761+05:30	\N
510	a8:bd:27:7b:eb:84	Nelson	0	-79	2412	2019-03-18 12:40:18.761+05:30	2019-03-18 12:40:18.761+05:30	\N
511	a8:bd:27:7b:eb:83	Mmr-Research	0	-79	2412	2019-03-18 12:40:18.761+05:30	2019-03-18 12:40:18.761+05:30	\N
512	a8:bd:27:7b:d0:f1	Awfis	0	-79	5745	2019-03-18 12:40:18.762+05:30	2019-03-18 12:40:18.762+05:30	\N
513	a8:bd:27:7b:d0:f3	Mmr-Research	0	-79	5745	2019-03-18 12:40:18.761+05:30	2019-03-18 12:40:18.761+05:30	\N
514	fe:01:7c:04:98:75	DIRECT-75-HP M254 LaserJet	0	-79	2437	2019-03-18 12:40:18.762+05:30	2019-03-18 12:40:18.762+05:30	\N
515	a8:bd:27:7b:d0:f4	Nelson	0	-80	5745	2019-03-18 12:40:18.762+05:30	2019-03-18 12:40:18.762+05:30	\N
516	a8:bd:27:7b:eb:94	Nelson	0	-80	5180	2019-03-18 12:40:18.762+05:30	2019-03-18 12:40:18.762+05:30	\N
517	a8:bd:27:7b:eb:95	Al-Mulla-FTZ	0	-80	5180	2019-03-18 12:40:18.762+05:30	2019-03-18 12:40:18.762+05:30	\N
518	a8:bd:27:7b:eb:91	Awfis	0	-80	5180	2019-03-18 12:40:18.762+05:30	2019-03-18 12:40:18.762+05:30	\N
519	a8:bd:27:7b:eb:75	Al-Mulla-FTZ	0	-80	5745	2019-03-18 12:40:18.762+05:30	2019-03-18 12:40:18.762+05:30	\N
520	a8:bd:27:7b:eb:73	Mmr-Research	0	-80	5745	2019-03-18 12:40:18.762+05:30	2019-03-18 12:40:18.762+05:30	\N
521	a8:bd:27:7b:eb:74	Nelson	0	-80	5745	2019-03-18 12:40:18.762+05:30	2019-03-18 12:40:18.762+05:30	\N
522	a8:bd:27:7b:eb:82	INDX	0	-81	2412	2019-03-18 12:40:18.762+05:30	2019-03-18 12:40:18.762+05:30	\N
523	a8:bd:27:7b:d0:f5	Al-Mulla-FTZ	0	-81	5745	2019-03-18 12:40:18.762+05:30	2019-03-18 12:40:18.762+05:30	\N
524	a8:bd:27:7b:eb:93	Mmr-Research	0	-81	5180	2019-03-18 12:40:18.762+05:30	2019-03-18 12:40:18.762+05:30	\N
525	a8:bd:27:7b:eb:90	Ethinos	0	-81	5180	2019-03-18 12:40:18.762+05:30	2019-03-18 12:40:18.762+05:30	\N
526	a8:bd:27:7b:eb:92	INDX	0	-81	5180	2019-03-18 12:40:18.762+05:30	2019-03-18 12:40:18.762+05:30	\N
527	a8:bd:27:7b:eb:72	INDX	0	-81	5745	2019-03-18 12:40:18.762+05:30	2019-03-18 12:40:18.762+05:30	\N
528	a8:bd:27:7c:07:75	Al-Mulla-FTZ	0	-87	5745	2019-03-18 12:40:18.762+05:30	2019-03-18 12:40:18.762+05:30	\N
529	a8:bd:27:7c:07:74	Nelson	0	-87	5745	2019-03-18 12:40:18.763+05:30	2019-03-18 12:40:18.763+05:30	\N
530	a8:bd:27:7c:07:70	Ethinos	0	-87	5745	2019-03-18 12:40:18.763+05:30	2019-03-18 12:40:18.763+05:30	\N
531	a8:bd:27:77:b3:34	Nelson	0	-88	5260	2019-03-18 12:40:18.763+05:30	2019-03-18 12:40:18.763+05:30	\N
532	a8:bd:27:7b:da:31	Awfis	0	-89	5260	2019-03-18 12:40:18.763+05:30	2019-03-18 12:40:18.763+05:30	\N
533	a8:bd:27:7b:da:30	Ethinos	0	-89	5260	2019-03-18 12:40:18.763+05:30	2019-03-18 12:40:18.763+05:30	\N
534	a8:bd:27:77:b3:33	Mmr-Research	0	-89	5260	2019-03-18 12:40:18.763+05:30	2019-03-18 12:40:18.763+05:30	\N
535	a8:bd:27:77:b3:32	INDX	0	-89	5260	2019-03-18 12:40:18.763+05:30	2019-03-18 12:40:18.763+05:30	\N
536	a8:bd:27:7b:da:33	Mmr-Research	0	-89	5260	2019-03-18 12:40:18.763+05:30	2019-03-18 12:40:18.763+05:30	\N
537	a8:bd:27:7b:da:34	Nelson	0	-90	5260	2019-03-18 12:40:18.763+05:30	2019-03-18 12:40:18.763+05:30	\N
538	a8:bd:27:77:b3:35	Al-Mulla-FTZ	0	-90	5260	2019-03-18 12:40:18.763+05:30	2019-03-18 12:40:18.763+05:30	\N
539	a8:bd:27:77:b3:31	Awfis	0	-90	5260	2019-03-18 12:40:18.763+05:30	2019-03-18 12:40:18.763+05:30	\N
540	a8:bd:27:77:b3:30	Ethinos	0	-90	5260	2019-03-18 12:40:18.763+05:30	2019-03-18 12:40:18.763+05:30	\N
541	a8:bd:27:7b:da:35	Al-Mulla-FTZ	0	-90	5260	2019-03-18 12:40:18.763+05:30	2019-03-18 12:40:18.763+05:30	\N
542	f4:f2:6d:4f:c6:22	Being human	0	-96	2447	2019-03-18 14:49:33.666+05:30	2019-03-18 14:49:33.666+05:30	\N
543	c8:d7:79:eb:f3:ac	JioFi2_EBF3AC	0	-51	2462	2019-03-18 16:50:30.746+05:30	2019-03-18 16:50:30.746+05:30	\N
544	c8:d7:79:eb:f3:ac	JioFi2_EBF3AC	0	-68	2462	2019-03-18 16:56:09.742+05:30	2019-03-18 16:56:09.742+05:30	\N
545	c4:71:54:30:7a:b8	POWAIAUTOCORP	0	-76	2417	2019-03-18 17:21:21.774+05:30	2019-03-18 17:21:21.774+05:30	\N
546	c8:d7:79:eb:f3:ac	JioFi2_EBF3AC	0	-49	2462	2019-03-18 17:21:21.774+05:30	2019-03-18 17:21:21.774+05:30	\N
547	00:23:b1:7a:8b:15	0LA AUTOCONNECT 6L3SN	0	-82	2412	2019-03-18 17:21:21.774+05:30	2019-03-18 17:21:21.774+05:30	\N
548	7c:8b:ca:ac:be:62		0	-94	2427	2019-03-18 17:21:21.774+05:30	2019-03-18 17:21:21.774+05:30	\N
549	4a:88:ca:dd:c8:a2	ADYYTGVub3ZvSzEwYTQw	0	-93	2437	2019-03-18 17:21:21.774+05:30	2019-03-18 17:21:21.774+05:30	\N
550	b2:35:9f:ae:c6:ee	DIRECT-BMLAPTOP-RLKD4AMImsEG	0	-47	2462	2019-03-18 18:12:51.561+05:30	2019-03-18 18:12:51.561+05:30	\N
551	c8:d7:79:eb:f3:ac	JioFi2_EBF3AC	0	-47	2462	2019-03-18 18:12:51.561+05:30	2019-03-18 18:12:51.561+05:30	\N
552	18:a6:f7:67:78:d6	Beaconstalk	0	-32	2462	2019-03-18 18:12:51.561+05:30	2019-03-18 18:12:51.561+05:30	\N
553	a8:bd:27:7b:eb:84	Nelson	0	-58	2412	2019-03-18 18:12:51.561+05:30	2019-03-18 18:12:51.561+05:30	\N
554	a8:bd:27:7b:eb:85	Al-Mulla-FTZ	0	-58	2412	2019-03-18 18:12:51.561+05:30	2019-03-18 18:12:51.561+05:30	\N
555	a8:bd:27:7b:eb:82	INDX	0	-59	2412	2019-03-18 18:12:51.561+05:30	2019-03-18 18:12:51.561+05:30	\N
556	a8:bd:27:7b:eb:81	Awfis	0	-59	2412	2019-03-18 18:12:51.561+05:30	2019-03-18 18:12:51.561+05:30	\N
557	a8:bd:27:7b:eb:83	Mmr-Research	0	-59	2412	2019-03-18 18:12:51.561+05:30	2019-03-18 18:12:51.561+05:30	\N
558	a8:bd:27:7b:eb:80	Ethinos	0	-59	2412	2019-03-18 18:12:51.561+05:30	2019-03-18 18:12:51.561+05:30	\N
559	a8:bd:27:7b:d0:e5	Al-Mulla-FTZ	0	-69	2437	2019-03-18 18:12:51.562+05:30	2019-03-18 18:12:51.562+05:30	\N
560	a8:bd:27:7b:d0:e2	INDX	0	-69	2437	2019-03-18 18:12:51.562+05:30	2019-03-18 18:12:51.562+05:30	\N
561	a8:bd:27:7b:d0:e0	Ethinos	0	-69	2437	2019-03-18 18:12:51.562+05:30	2019-03-18 18:12:51.562+05:30	\N
562	a8:bd:27:7b:d0:e4	Nelson	0	-69	2437	2019-03-18 18:12:51.562+05:30	2019-03-18 18:12:51.562+05:30	\N
563	a8:bd:27:7b:d0:e3	Mmr-Research	0	-68	2437	2019-03-18 18:12:51.562+05:30	2019-03-18 18:12:51.562+05:30	\N
564	a8:bd:27:7b:d0:f5	Al-Mulla-FTZ	0	-72	5260	2019-03-18 18:12:51.562+05:30	2019-03-18 18:12:51.562+05:30	\N
565	a8:bd:27:7b:e1:61	Awfis	0	-69	2462	2019-03-18 18:12:51.562+05:30	2019-03-18 18:12:51.562+05:30	\N
616	a8:bd:27:7b:eb:80	Ethinos	0	-59	2412	2019-03-18 18:12:51.67+05:30	2019-03-18 18:12:51.67+05:30	\N
618	a8:bd:27:7b:d0:e5	Al-Mulla-FTZ	0	-69	2437	2019-03-18 18:12:51.67+05:30	2019-03-18 18:12:51.67+05:30	\N
619	a8:bd:27:7b:d0:e2	INDX	0	-69	2437	2019-03-18 18:12:51.671+05:30	2019-03-18 18:12:51.671+05:30	\N
622	a8:bd:27:7b:e1:61	Awfis	0	-69	2462	2019-03-18 18:12:51.671+05:30	2019-03-18 18:12:51.671+05:30	\N
624	a8:bd:27:7b:d0:f4	Nelson	0	-72	5260	2019-03-18 18:12:51.671+05:30	2019-03-18 18:12:51.671+05:30	\N
625	a8:bd:27:7b:d0:f2	INDX	0	-72	5260	2019-03-18 18:12:51.671+05:30	2019-03-18 18:12:51.671+05:30	\N
628	a8:bd:27:7b:d0:f3	Mmr-Research	0	-72	5260	2019-03-18 18:12:51.677+05:30	2019-03-18 18:12:51.677+05:30	\N
630	a8:bd:27:7b:eb:64	Nelson	0	-75	2462	2019-03-18 18:12:51.677+05:30	2019-03-18 18:12:51.677+05:30	\N
631	a8:bd:27:7b:eb:95	Al-Mulla-FTZ	0	-80	5180	2019-03-18 18:12:51.677+05:30	2019-03-18 18:12:51.677+05:30	\N
634	a8:bd:27:7b:eb:91	Awfis	0	-80	5180	2019-03-18 18:12:51.677+05:30	2019-03-18 18:12:51.677+05:30	\N
636	a8:bd:27:7b:eb:93	Mmr-Research	0	-81	5180	2019-03-18 18:12:51.677+05:30	2019-03-18 18:12:51.677+05:30	\N
637	a8:bd:27:7c:07:63	Mmr-Research	0	-81	2437	2019-03-18 18:12:51.677+05:30	2019-03-18 18:12:51.677+05:30	\N
640	a8:bd:27:77:b3:32	INDX	0	-84	5260	2019-03-18 18:12:51.678+05:30	2019-03-18 18:12:51.678+05:30	\N
642	a8:bd:27:7c:07:70	Ethinos	0	-84	5745	2019-03-18 18:12:51.678+05:30	2019-03-18 18:12:51.678+05:30	\N
643	a8:bd:27:77:b3:34	Nelson	0	-84	5260	2019-03-18 18:12:51.678+05:30	2019-03-18 18:12:51.678+05:30	\N
646	a8:bd:27:77:b3:33	Mmr-Research	0	-85	5260	2019-03-18 18:12:51.678+05:30	2019-03-18 18:12:51.678+05:30	\N
648	a8:bd:27:7c:07:74	Nelson	0	-85	5745	2019-03-18 18:12:51.678+05:30	2019-03-18 18:12:51.678+05:30	\N
649	a8:bd:27:77:b3:35	Al-Mulla-FTZ	0	-85	5260	2019-03-18 18:12:51.678+05:30	2019-03-18 18:12:51.678+05:30	\N
652	a8:bd:27:7b:e1:75	Al-Mulla-FTZ	0	-86	5260	2019-03-18 18:12:51.68+05:30	2019-03-18 18:12:51.68+05:30	\N
654	a8:bd:27:7b:e1:73	Mmr-Research	0	-86	5260	2019-03-18 18:12:51.68+05:30	2019-03-18 18:12:51.68+05:30	\N
655	a8:bd:27:7b:e1:72	INDX	0	-86	5260	2019-03-18 18:12:51.68+05:30	2019-03-18 18:12:51.68+05:30	\N
658	a8:bd:27:7b:da:34	Nelson	0	-87	5260	2019-03-18 18:12:51.68+05:30	2019-03-18 18:12:51.68+05:30	\N
659	a8:bd:27:7b:da:32	INDX	0	-87	5260	2019-03-18 18:12:51.68+05:30	2019-03-18 18:12:51.68+05:30	\N
661	a8:bd:27:7b:da:31	Awfis	0	-87	5260	2019-03-18 18:12:51.68+05:30	2019-03-18 18:12:51.68+05:30	\N
664	a8:bd:27:7b:eb:74	Nelson	0	-88	5745	2019-03-18 18:12:51.681+05:30	2019-03-18 18:12:51.681+05:30	\N
571	0c:b6:d2:5a:d4:80	MTNL-EDMPL	0	-72	2427	2019-03-18 18:12:51.563+05:30	2019-03-18 18:12:51.563+05:30	\N
575	a8:bd:27:7b:eb:92	INDX	0	-80	5180	2019-03-18 18:12:51.569+05:30	2019-03-18 18:12:51.569+05:30	\N
581	a8:bd:27:7c:07:60	Ethinos	0	-81	2437	2019-03-18 18:12:51.569+05:30	2019-03-18 18:12:51.569+05:30	\N
587	a8:bd:27:7c:07:71	Awfis	0	-84	5745	2019-03-18 18:12:51.57+05:30	2019-03-18 18:12:51.57+05:30	\N
593	a8:bd:27:7c:07:75	Al-Mulla-FTZ	0	-86	5745	2019-03-18 18:12:51.57+05:30	2019-03-18 18:12:51.57+05:30	\N
599	a8:bd:27:7b:eb:73	Mmr-Research	0	-87	5745	2019-03-18 18:12:51.571+05:30	2019-03-18 18:12:51.571+05:30	\N
605	a8:bd:27:7b:da:33	Mmr-Research	0	-88	5260	2019-03-18 18:12:51.571+05:30	2019-03-18 18:12:51.571+05:30	\N
611	a8:bd:27:7b:eb:85	Al-Mulla-FTZ	0	-58	2412	2019-03-18 18:12:51.67+05:30	2019-03-18 18:12:51.67+05:30	\N
617	a8:bd:27:7b:d0:e3	Mmr-Research	0	-68	2437	2019-03-18 18:12:51.67+05:30	2019-03-18 18:12:51.67+05:30	\N
623	a8:bd:27:7b:d0:f5	Al-Mulla-FTZ	0	-72	5260	2019-03-18 18:12:51.671+05:30	2019-03-18 18:12:51.671+05:30	\N
629	0c:b6:d2:5a:d4:80	MTNL-EDMPL	0	-72	2427	2019-03-18 18:12:51.677+05:30	2019-03-18 18:12:51.677+05:30	\N
635	a8:bd:27:7b:eb:90	Ethinos	0	-80	5180	2019-03-18 18:12:51.677+05:30	2019-03-18 18:12:51.677+05:30	\N
641	a8:bd:27:7c:07:72	INDX	0	-84	5745	2019-03-18 18:12:51.678+05:30	2019-03-18 18:12:51.678+05:30	\N
647	a8:bd:27:77:b3:30	Ethinos	0	-85	5260	2019-03-18 18:12:51.678+05:30	2019-03-18 18:12:51.678+05:30	\N
653	a8:bd:27:7b:e1:70	Ethinos	0	-86	5260	2019-03-18 18:12:51.68+05:30	2019-03-18 18:12:51.68+05:30	\N
660	a8:bd:27:7b:e1:74	Nelson	0	-87	5260	2019-03-18 18:12:51.68+05:30	2019-03-18 18:12:51.68+05:30	\N
665	a8:bd:27:7b:eb:70	Ethinos	0	-88	5745	2019-03-18 18:12:51.681+05:30	2019-03-18 18:12:51.681+05:30	\N
666	b8:c1:a2:66:b3:e7	DM1101C	0	-57	2417	2019-03-18 22:14:53.774+05:30	2019-03-18 22:14:53.774+05:30	\N
667	58:d5:6e:bd:86:6e	TataC1201	0	-79	2472	2019-03-18 22:14:53.774+05:30	2019-03-18 22:14:53.774+05:30	\N
668	a4:ca:a0:e1:82:8f	GlobeNet	0	-80	2447	2019-03-18 22:14:53.774+05:30	2019-03-18 22:14:53.774+05:30	\N
669	ec:08:6b:50:3f:12	SHIVALI	0	-82	2417	2019-03-18 22:14:53.775+05:30	2019-03-18 22:14:53.775+05:30	\N
670	ec:84:b4:55:47:f9	C_1103	0	-83	2412	2019-03-18 22:14:53.775+05:30	2019-03-18 22:14:53.775+05:30	\N
671	aa:04:60:2b:dc:6a		0	-87	2447	2019-03-18 22:14:53.776+05:30	2019-03-18 22:14:53.776+05:30	\N
672	3c:1e:04:e6:99:5f	Amol_Pradhan	0	-93	2472	2019-03-18 22:14:53.776+05:30	2019-03-18 22:14:53.776+05:30	\N
673	40:16:7e:c3:4a:5e	Sabai24	0	-84	2412	2019-03-18 22:14:53.776+05:30	2019-03-18 22:14:53.776+05:30	\N
674	ec:84:b4:55:47:fd	C	0	-92	5180	2019-03-18 22:14:53.776+05:30	2019-03-18 22:14:53.776+05:30	\N
675	b8:c1:a2:66:b3:e7	DM1101C	0	-57	2417	2019-03-19 04:02:16.717+05:30	2019-03-19 04:02:16.717+05:30	\N
676	ec:08:6b:50:3f:12	SHIVALI	0	-79	2417	2019-03-19 04:02:16.717+05:30	2019-03-19 04:02:16.717+05:30	\N
677	58:d5:6e:bd:86:6e	TataC1201	0	-80	2472	2019-03-19 04:02:16.717+05:30	2019-03-19 04:02:16.717+05:30	\N
678	10:da:43:1c:24:f0	Jayaram_EXT	0	-90	2457	2019-03-19 04:02:16.717+05:30	2019-03-19 04:02:16.717+05:30	\N
679	ec:84:b4:55:47:fd	C	0	-91	5180	2019-03-19 04:02:16.717+05:30	2019-03-19 04:02:16.717+05:30	\N
680	3c:1e:04:e6:99:5f	Amol_Pradhan	0	-93	2472	2019-03-19 04:02:16.717+05:30	2019-03-19 04:02:16.717+05:30	\N
681	b8:c1:a2:66:b3:e7	DM1101C	0	-66	2417	2019-03-19 09:17:04.849+05:30	2019-03-19 09:17:04.849+05:30	\N
682	ec:08:6b:50:3f:12	SHIVALI	0	-81	2417	2019-03-19 09:17:04.849+05:30	2019-03-19 09:17:04.849+05:30	\N
683	70:4f:57:4d:56:25	Centricity_Mumbai	0	-91	2457	2019-03-19 09:17:04.849+05:30	2019-03-19 09:17:04.849+05:30	\N
684	ec:84:b4:55:47:fd	C	0	-93	5180	2019-03-19 09:17:04.849+05:30	2019-03-19 09:17:04.849+05:30	\N
685	60:8e:08:f3:8e:95	AndroidAP	0	-54	2462	2019-03-20 14:33:38.96+05:30	2019-03-20 14:33:38.96+05:30	\N
686	18:a6:f7:67:78:d6	Beaconstalk	0	-37	2462	2019-03-20 14:33:38.959+05:30	2019-03-20 14:33:38.959+05:30	\N
687	a2:04:60:98:dd:d2	INDX-Guest	0	-67	2462	2019-03-20 14:33:38.96+05:30	2019-03-20 14:33:38.96+05:30	\N
688	a8:bd:27:7b:eb:75	Al-Mulla-FTZ	0	-72	5745	2019-03-20 14:33:38.96+05:30	2019-03-20 14:33:38.96+05:30	\N
689	a0:04:60:9e:dd:d2		0	-60	2462	2019-03-20 14:33:38.96+05:30	2019-03-20 14:33:38.96+05:30	\N
690	a8:bd:27:7b:eb:74	Nelson	0	-72	5745	2019-03-20 14:33:38.96+05:30	2019-03-20 14:33:38.96+05:30	\N
691	a8:bd:27:7b:eb:73	Mmr-Research	0	-72	5745	2019-03-20 14:33:38.96+05:30	2019-03-20 14:33:38.96+05:30	\N
692	a8:bd:27:7b:eb:72	INDX	0	-72	5745	2019-03-20 14:33:38.96+05:30	2019-03-20 14:33:38.96+05:30	\N
693	a8:bd:27:7b:eb:71	Awfis	0	-72	5745	2019-03-20 14:33:38.96+05:30	2019-03-20 14:33:38.96+05:30	\N
694	a8:bd:27:7b:eb:92	INDX	0	-74	5180	2019-03-20 14:33:38.96+05:30	2019-03-20 14:33:38.96+05:30	\N
695	a8:bd:27:7c:07:71	Awfis	0	-73	5745	2019-03-20 14:33:38.96+05:30	2019-03-20 14:33:38.96+05:30	\N
696	a8:bd:27:7b:eb:70	Ethinos	0	-72	5745	2019-03-20 14:33:38.96+05:30	2019-03-20 14:33:38.96+05:30	\N
697	a8:bd:27:7c:07:75	Al-Mulla-FTZ	0	-74	5745	2019-03-20 14:33:38.96+05:30	2019-03-20 14:33:38.96+05:30	\N
698	a8:bd:27:7c:07:74	Nelson	0	-74	5745	2019-03-20 14:33:38.961+05:30	2019-03-20 14:33:38.961+05:30	\N
699	a8:bd:27:7c:07:73	Mmr-Research	0	-74	5745	2019-03-20 14:33:38.961+05:30	2019-03-20 14:33:38.961+05:30	\N
700	a8:bd:27:7c:07:70	Ethinos	0	-74	5745	2019-03-20 14:33:38.961+05:30	2019-03-20 14:33:38.961+05:30	\N
701	a8:bd:27:7b:eb:95	Al-Mulla-FTZ	0	-75	5180	2019-03-20 14:33:38.961+05:30	2019-03-20 14:33:38.961+05:30	\N
702	a8:bd:27:7b:eb:91	Awfis	0	-75	5180	2019-03-20 14:33:38.961+05:30	2019-03-20 14:33:38.961+05:30	\N
703	a8:bd:27:7b:eb:94	Nelson	0	-76	5180	2019-03-20 14:33:38.961+05:30	2019-03-20 14:33:38.961+05:30	\N
704	a8:bd:27:7c:07:72	INDX	0	-74	5745	2019-03-20 14:33:38.961+05:30	2019-03-20 14:33:38.961+05:30	\N
705	a8:bd:27:7b:eb:90	Ethinos	0	-76	5180	2019-03-20 14:33:38.961+05:30	2019-03-20 14:33:38.961+05:30	\N
706	a8:bd:27:7b:eb:93	Mmr-Research	0	-75	5180	2019-03-20 14:33:38.961+05:30	2019-03-20 14:33:38.961+05:30	\N
707	a8:bd:27:7b:e1:73	Mmr-Research	0	-79	5260	2019-03-20 14:33:38.961+05:30	2019-03-20 14:33:38.961+05:30	\N
708	a8:bd:27:7b:d0:f5	Al-Mulla-FTZ	0	-80	5180	2019-03-20 14:33:38.961+05:30	2019-03-20 14:33:38.961+05:30	\N
709	a8:bd:27:7b:d0:f4	Nelson	0	-80	5180	2019-03-20 14:33:38.961+05:30	2019-03-20 14:33:38.961+05:30	\N
710	a8:bd:27:7b:e1:74	Nelson	0	-79	5260	2019-03-20 14:33:38.961+05:30	2019-03-20 14:33:38.961+05:30	\N
711	a8:bd:27:7b:d0:f3	Mmr-Research	0	-80	5180	2019-03-20 14:33:38.961+05:30	2019-03-20 14:33:38.961+05:30	\N
712	a8:bd:27:7b:d0:f1	Awfis	0	-80	5180	2019-03-20 14:33:38.961+05:30	2019-03-20 14:33:38.961+05:30	\N
713	a8:bd:27:7b:d0:f0	Ethinos	0	-80	5180	2019-03-20 14:33:38.961+05:30	2019-03-20 14:33:38.961+05:30	\N
714	a8:bd:27:7b:e1:75	Al-Mulla-FTZ	0	-80	5260	2019-03-20 14:33:38.961+05:30	2019-03-20 14:33:38.961+05:30	\N
715	a8:bd:27:7b:e1:72	INDX	0	-80	5260	2019-03-20 14:33:38.963+05:30	2019-03-20 14:33:38.963+05:30	\N
716	a8:bd:27:7b:e1:71	Awfis	0	-80	5260	2019-03-20 14:33:38.963+05:30	2019-03-20 14:33:38.963+05:30	\N
717	a8:bd:27:7b:e1:70	Ethinos	0	-80	5260	2019-03-20 14:33:38.963+05:30	2019-03-20 14:33:38.963+05:30	\N
718	a8:bd:27:77:b3:35	Al-Mulla-FTZ	0	-80	5260	2019-03-20 14:33:38.963+05:30	2019-03-20 14:33:38.963+05:30	\N
719	a8:bd:27:77:b3:33	Mmr-Research	0	-80	5260	2019-03-20 14:33:38.963+05:30	2019-03-20 14:33:38.963+05:30	\N
720	a8:bd:27:77:b3:32	INDX	0	-80	5260	2019-03-20 14:33:38.963+05:30	2019-03-20 14:33:38.963+05:30	\N
721	a8:bd:27:77:b3:31	Awfis	0	-80	5260	2019-03-20 14:33:38.963+05:30	2019-03-20 14:33:38.963+05:30	\N
722	a8:bd:27:77:b3:34	Nelson	0	-80	5260	2019-03-20 14:33:38.963+05:30	2019-03-20 14:33:38.963+05:30	\N
727	a8:bd:27:7b:da:34	Nelson	0	-86	5260	2019-03-20 14:33:38.964+05:30	2019-03-20 14:33:38.964+05:30	\N
730	18:a6:f7:67:78:d6	Beaconstalk	0	-51	2462	2019-03-20 17:56:12.086+05:30	2019-03-20 17:56:12.086+05:30	\N
731	a8:bd:27:7b:eb:82	INDX	0	-64	2412	2019-03-20 17:56:12.087+05:30	2019-03-20 17:56:12.087+05:30	\N
732	a8:bd:27:7b:eb:84	Nelson	0	-65	2412	2019-03-20 17:56:12.087+05:30	2019-03-20 17:56:12.087+05:30	\N
733	a8:bd:27:7b:eb:83	Mmr-Research	0	-65	2412	2019-03-20 17:56:12.087+05:30	2019-03-20 17:56:12.087+05:30	\N
734	a8:bd:27:7b:eb:81	Awfis	0	-66	2412	2019-03-20 17:56:12.087+05:30	2019-03-20 17:56:12.087+05:30	\N
735	a8:bd:27:7b:eb:80	Ethinos	0	-66	2412	2019-03-20 17:56:12.087+05:30	2019-03-20 17:56:12.087+05:30	\N
736	a8:bd:27:7b:eb:85	Al-Mulla-FTZ	0	-66	2412	2019-03-20 17:56:12.087+05:30	2019-03-20 17:56:12.087+05:30	\N
737	a8:bd:27:7b:d0:e3	Mmr-Research	0	-73	2437	2019-03-20 17:56:12.087+05:30	2019-03-20 17:56:12.087+05:30	\N
738	a8:bd:27:7b:d0:e4	Nelson	0	-73	2437	2019-03-20 17:56:12.087+05:30	2019-03-20 17:56:12.087+05:30	\N
739	a8:bd:27:7b:d0:e0	Ethinos	0	-73	2437	2019-03-20 17:56:12.087+05:30	2019-03-20 17:56:12.087+05:30	\N
740	a8:bd:27:7b:d0:e1	Awfis	0	-73	2437	2019-03-20 17:56:12.087+05:30	2019-03-20 17:56:12.087+05:30	\N
741	a8:bd:27:7c:07:65	Al-Mulla-FTZ	0	-75	2437	2019-03-20 17:56:12.087+05:30	2019-03-20 17:56:12.087+05:30	\N
742	a8:bd:27:7b:d0:e2	INDX	0	-71	2437	2019-03-20 17:56:12.087+05:30	2019-03-20 17:56:12.087+05:30	\N
743	a8:bd:27:7c:07:75	Al-Mulla-FTZ	0	-83	5745	2019-03-20 17:56:12.087+05:30	2019-03-20 17:56:12.087+05:30	\N
744	a8:bd:27:7c:07:73	Mmr-Research	0	-83	5745	2019-03-20 17:56:12.087+05:30	2019-03-20 17:56:12.087+05:30	\N
745	a8:bd:27:7c:07:70	Ethinos	0	-83	5745	2019-03-20 17:56:12.087+05:30	2019-03-20 17:56:12.087+05:30	\N
746	a8:bd:27:7b:eb:75	Al-Mulla-FTZ	0	-83	5745	2019-03-20 17:56:12.087+05:30	2019-03-20 17:56:12.087+05:30	\N
747	a8:bd:27:7b:eb:74	Nelson	0	-83	5745	2019-03-20 17:56:12.088+05:30	2019-03-20 17:56:12.088+05:30	\N
748	a8:bd:27:7b:eb:72	INDX	0	-83	5745	2019-03-20 17:56:12.088+05:30	2019-03-20 17:56:12.088+05:30	\N
749	a8:bd:27:7b:eb:70	Ethinos	0	-83	5745	2019-03-20 17:56:12.088+05:30	2019-03-20 17:56:12.088+05:30	\N
750	a8:bd:27:7b:eb:93	Mmr-Research	0	-84	5180	2019-03-20 17:56:12.088+05:30	2019-03-20 17:56:12.088+05:30	\N
751	a8:bd:27:7b:eb:91	Awfis	0	-84	5180	2019-03-20 17:56:12.088+05:30	2019-03-20 17:56:12.088+05:30	\N
752	a8:bd:27:7c:07:74	Nelson	0	-84	5745	2019-03-20 17:56:12.088+05:30	2019-03-20 17:56:12.088+05:30	\N
753	a8:bd:27:7c:07:72	INDX	0	-84	5745	2019-03-20 17:56:12.088+05:30	2019-03-20 17:56:12.088+05:30	\N
754	a8:bd:27:7c:07:71	Awfis	0	-84	5745	2019-03-20 17:56:12.088+05:30	2019-03-20 17:56:12.088+05:30	\N
755	a8:bd:27:7b:eb:71	Awfis	0	-84	5745	2019-03-20 17:56:12.088+05:30	2019-03-20 17:56:12.088+05:30	\N
756	a8:bd:27:77:b3:35	Al-Mulla-FTZ	0	-85	5260	2019-03-20 17:56:12.088+05:30	2019-03-20 17:56:12.088+05:30	\N
757	a8:bd:27:77:b3:34	Nelson	0	-85	5260	2019-03-20 17:56:12.088+05:30	2019-03-20 17:56:12.088+05:30	\N
758	a8:bd:27:77:b3:32	INDX	0	-85	5260	2019-03-20 17:56:12.088+05:30	2019-03-20 17:56:12.088+05:30	\N
759	a8:bd:27:77:b3:31	Awfis	0	-85	5260	2019-03-20 17:56:12.088+05:30	2019-03-20 17:56:12.088+05:30	\N
760	a8:bd:27:7b:eb:94	Nelson	0	-85	5180	2019-03-20 17:56:12.088+05:30	2019-03-20 17:56:12.088+05:30	\N
761	a8:bd:27:7b:eb:90	Ethinos	0	-85	5180	2019-03-20 17:56:12.088+05:30	2019-03-20 17:56:12.088+05:30	\N
762	a8:bd:27:77:b3:30	Ethinos	0	-86	5260	2019-03-20 17:56:12.088+05:30	2019-03-20 17:56:12.088+05:30	\N
763	a8:bd:27:7b:d0:f4	Nelson	0	-87	5180	2019-03-20 17:56:12.088+05:30	2019-03-20 17:56:12.088+05:30	\N
764	a8:bd:27:7b:e1:75	Al-Mulla-FTZ	0	-87	5260	2019-03-20 17:56:12.089+05:30	2019-03-20 17:56:12.089+05:30	\N
765	a8:bd:27:7b:e1:74	Nelson	0	-87	5260	2019-03-20 17:56:12.089+05:30	2019-03-20 17:56:12.089+05:30	\N
766	a8:bd:27:7b:e1:71	Awfis	0	-87	5260	2019-03-20 17:56:12.089+05:30	2019-03-20 17:56:12.089+05:30	\N
767	a8:bd:27:7b:e1:70	Ethinos	0	-87	5260	2019-03-20 17:56:12.089+05:30	2019-03-20 17:56:12.089+05:30	\N
768	a8:bd:27:7b:d0:f3	Mmr-Research	0	-88	5180	2019-03-20 17:56:12.089+05:30	2019-03-20 17:56:12.089+05:30	\N
769	a8:bd:27:7b:d0:f2	INDX	0	-88	5180	2019-03-20 17:56:12.089+05:30	2019-03-20 17:56:12.089+05:30	\N
770	a8:bd:27:7b:d0:f0	Ethinos	0	-88	5180	2019-03-20 17:56:12.09+05:30	2019-03-20 17:56:12.09+05:30	\N
771	a8:bd:27:7b:e1:73	Mmr-Research	0	-88	5260	2019-03-20 17:56:12.09+05:30	2019-03-20 17:56:12.09+05:30	\N
772	a8:bd:27:7b:e1:72	INDX	0	-88	5260	2019-03-20 17:56:12.09+05:30	2019-03-20 17:56:12.09+05:30	\N
773	a8:bd:27:7b:d0:f5	Al-Mulla-FTZ	0	-89	5180	2019-03-20 17:56:12.09+05:30	2019-03-20 17:56:12.09+05:30	\N
774	a8:bd:27:7b:d0:f1	Awfis	0	-89	5180	2019-03-20 17:56:12.09+05:30	2019-03-20 17:56:12.09+05:30	\N
775	a8:bd:27:7b:da:31	Awfis	0	-91	5260	2019-03-20 17:56:12.09+05:30	2019-03-20 17:56:12.09+05:30	\N
776	b2:35:9f:ae:c6:ee	DIRECT-BMLAPTOP-RLKD4AMImsEG	0	-31	2462	2019-03-20 18:57:21.666+05:30	2019-03-20 18:57:21.666+05:30	\N
777	18:a6:f7:67:78:d6	Beaconstalk	0	-48	2462	2019-03-20 18:57:21.666+05:30	2019-03-20 18:57:21.666+05:30	\N
778	a8:bd:27:7b:eb:84	Nelson	0	-59	2412	2019-03-20 18:57:21.666+05:30	2019-03-20 18:57:21.666+05:30	\N
779	a8:bd:27:7b:eb:81	Awfis	0	-59	2412	2019-03-20 18:57:21.666+05:30	2019-03-20 18:57:21.666+05:30	\N
780	a8:bd:27:7b:eb:85	Al-Mulla-FTZ	0	-59	2412	2019-03-20 18:57:21.666+05:30	2019-03-20 18:57:21.666+05:30	\N
781	a8:bd:27:7b:eb:82	INDX	0	-60	2412	2019-03-20 18:57:21.666+05:30	2019-03-20 18:57:21.666+05:30	\N
782	a8:bd:27:7b:eb:83	Mmr-Research	0	-59	2412	2019-03-20 18:57:21.666+05:30	2019-03-20 18:57:21.666+05:30	\N
783	a2:04:60:98:dd:d2	INDX-Guest	0	-65	2462	2019-03-20 18:57:21.666+05:30	2019-03-20 18:57:21.666+05:30	\N
784	a8:bd:27:7b:eb:80	Ethinos	0	-59	2412	2019-03-20 18:57:21.666+05:30	2019-03-20 18:57:21.666+05:30	\N
785	a8:bd:27:7c:07:64	Nelson	0	-68	2437	2019-03-20 18:57:21.666+05:30	2019-03-20 18:57:21.666+05:30	\N
786	a8:bd:27:7c:07:65	Al-Mulla-FTZ	0	-71	2437	2019-03-20 18:57:21.666+05:30	2019-03-20 18:57:21.666+05:30	\N
787	a8:bd:27:7c:07:63	Mmr-Research	0	-71	2437	2019-03-20 18:57:21.666+05:30	2019-03-20 18:57:21.666+05:30	\N
788	a8:bd:27:7b:d0:e1	Awfis	0	-71	2437	2019-03-20 18:57:21.666+05:30	2019-03-20 18:57:21.666+05:30	\N
789	a8:bd:27:7b:eb:70	Ethinos	0	-72	5745	2019-03-20 18:57:21.666+05:30	2019-03-20 18:57:21.666+05:30	\N
790	a8:bd:27:7c:07:60	Ethinos	0	-71	2437	2019-03-20 18:57:21.666+05:30	2019-03-20 18:57:21.666+05:30	\N
791	a8:bd:27:7b:d0:e3	Mmr-Research	0	-72	2437	2019-03-20 18:57:21.667+05:30	2019-03-20 18:57:21.667+05:30	\N
792	a8:bd:27:7b:eb:64	Nelson	0	-72	2462	2019-03-20 18:57:21.667+05:30	2019-03-20 18:57:21.667+05:30	\N
793	a8:bd:27:7b:eb:75	Al-Mulla-FTZ	0	-73	5745	2019-03-20 18:57:21.667+05:30	2019-03-20 18:57:21.667+05:30	\N
794	a8:bd:27:7b:eb:74	Nelson	0	-73	5745	2019-03-20 18:57:21.667+05:30	2019-03-20 18:57:21.667+05:30	\N
795	a8:bd:27:7b:eb:71	Awfis	0	-73	5745	2019-03-20 18:57:21.667+05:30	2019-03-20 18:57:21.667+05:30	\N
796	a8:bd:27:7b:da:23	Mmr-Research	0	-73	2462	2019-03-20 18:57:21.667+05:30	2019-03-20 18:57:21.667+05:30	\N
797	a8:bd:27:7c:07:61	Awfis	0	-72	2437	2019-03-20 18:57:21.667+05:30	2019-03-20 18:57:21.667+05:30	\N
798	a8:bd:27:7b:da:21	Awfis	0	-73	2462	2019-03-20 18:57:21.667+05:30	2019-03-20 18:57:21.667+05:30	\N
799	a8:bd:27:7b:da:20	Ethinos	0	-73	2462	2019-03-20 18:57:21.667+05:30	2019-03-20 18:57:21.667+05:30	\N
800	a8:bd:27:7b:eb:73	Mmr-Research	0	-73	5745	2019-03-20 18:57:21.667+05:30	2019-03-20 18:57:21.667+05:30	\N
801	a8:bd:27:7b:eb:72	INDX	0	-73	5745	2019-03-20 18:57:21.667+05:30	2019-03-20 18:57:21.667+05:30	\N
805	a8:bd:27:7b:eb:90	Ethinos	0	-76	5180	2019-03-20 18:57:21.667+05:30	2019-03-20 18:57:21.667+05:30	\N
808	a8:bd:27:7c:07:74	Nelson	0	-79	5745	2019-03-20 18:57:21.667+05:30	2019-03-20 18:57:21.667+05:30	\N
811	a8:bd:27:7c:07:70	Ethinos	0	-79	5745	2019-03-20 18:57:21.669+05:30	2019-03-20 18:57:21.669+05:30	\N
813	a8:bd:27:7b:d0:f4	Nelson	0	-80	5180	2019-03-20 18:57:21.669+05:30	2019-03-20 18:57:21.669+05:30	\N
816	a8:bd:27:7b:d0:f2	INDX	0	-80	5180	2019-03-20 18:57:21.669+05:30	2019-03-20 18:57:21.669+05:30	\N
818	a8:bd:27:7b:e1:73	Mmr-Research	0	-81	5260	2019-03-20 18:57:21.669+05:30	2019-03-20 18:57:21.669+05:30	\N
819	a8:bd:27:7b:e1:72	INDX	0	-81	5260	2019-03-20 18:57:21.669+05:30	2019-03-20 18:57:21.669+05:30	\N
823	a8:bd:27:77:b3:34	Nelson	0	-82	5260	2019-03-20 18:57:21.669+05:30	2019-03-20 18:57:21.669+05:30	\N
824	a8:bd:27:77:b3:31	Awfis	0	-82	5260	2019-03-20 18:57:21.669+05:30	2019-03-20 18:57:21.669+05:30	\N
828	a8:bd:27:77:b3:30	Ethinos	0	-83	5260	2019-03-20 18:57:21.67+05:30	2019-03-20 18:57:21.67+05:30	\N
829	a8:bd:27:77:b3:33	Mmr-Research	0	-83	5260	2019-03-20 18:57:21.67+05:30	2019-03-20 18:57:21.67+05:30	\N
834	a8:bd:27:7b:da:33	Mmr-Research	0	-86	5260	2019-03-20 18:57:21.67+05:30	2019-03-20 18:57:21.67+05:30	\N
835	a8:bd:27:7b:da:32	INDX	0	-86	5260	2019-03-20 18:57:21.67+05:30	2019-03-20 18:57:21.67+05:30	\N
837	b2:35:9f:ae:c6:ee	DIRECT-BMLAPTOP-RLKD4AMImsEG	0	-45	2462	2019-03-21 11:52:10.68+05:30	2019-03-21 11:52:10.68+05:30	\N
838	00:1e:a6:4b:0b:38	Sadda Adda	0	-53	2462	2019-03-21 11:52:10.681+05:30	2019-03-21 11:52:10.681+05:30	\N
839	40:49:0f:65:6a:03	JioFiber-YtK58_5G	0	-63	5745	2019-03-21 11:52:10.681+05:30	2019-03-21 11:52:10.681+05:30	\N
840	40:49:0f:57:9a:ad	JioFiber-RA2ra	0	-69	2457	2019-03-21 11:52:10.681+05:30	2019-03-21 11:52:10.681+05:30	\N
841	b2:35:9f:ae:c6:ee	DIRECT-BMLAPTOP-RLKD4AMImsEG	0	-29	2462	2019-03-21 12:56:14.044+05:30	2019-03-21 12:56:14.044+05:30	\N
842	00:1e:a6:4b:0b:38	Sadda Adda	0	-47	2462	2019-03-21 12:56:14.045+05:30	2019-03-21 12:56:14.045+05:30	\N
843	40:49:0f:65:6a:03	JioFiber-YtK58_5G	0	-68	5745	2019-03-21 12:56:14.045+05:30	2019-03-21 12:56:14.045+05:30	\N
844	ec:08:6b:a8:2a:8e	PRAJAPATI	0	-73	2462	2019-03-21 12:56:14.045+05:30	2019-03-21 12:56:14.045+05:30	\N
845	00:1e:a6:4b:0b:38	Sadda Adda	0	-43	2462	2019-03-21 15:20:01.136+05:30	2019-03-21 15:20:01.136+05:30	\N
846	40:49:0f:57:9a:ad	JioFiber-RA2ra	0	-68	2457	2019-03-21 15:20:01.136+05:30	2019-03-21 15:20:01.136+05:30	\N
847	40:49:0f:65:6a:03	JioFiber-YtK58_5G	0	-69	5745	2019-03-21 15:20:01.136+05:30	2019-03-21 15:20:01.136+05:30	\N
848	00:1e:a6:4b:0b:38	Sadda Adda	0	-43	2462	2019-03-21 21:54:34.231+05:30	2019-03-21 21:54:34.231+05:30	\N
849	b2:35:9f:ae:c6:ee	DIRECT-BMLAPTOP-RLKD4AMImsEG	0	-55	2462	2019-03-21 21:54:34.231+05:30	2019-03-21 21:54:34.231+05:30	\N
850	40:49:0f:65:6a:03	JioFiber-YtK58_5G	0	-66	5745	2019-03-21 21:54:34.231+05:30	2019-03-21 21:54:34.231+05:30	\N
851	40:49:0f:57:9a:ad	JioFiber-RA2ra	0	-75	2457	2019-03-21 21:54:34.231+05:30	2019-03-21 21:54:34.231+05:30	\N
852	00:1e:a6:4b:0b:38	Sadda Adda	0	-41	2462	2019-03-22 05:58:39.344+05:30	2019-03-22 05:58:39.344+05:30	\N
853	ec:08:6b:a8:2a:8e	PRAJAPATI	0	-66	2462	2019-03-22 05:58:39.344+05:30	2019-03-22 05:58:39.344+05:30	\N
854	40:49:0f:65:6a:03	JioFiber-YtK58_5G	0	-73	5745	2019-03-22 05:58:39.344+05:30	2019-03-22 05:58:39.344+05:30	\N
855	40:49:0f:57:9a:ad	JioFiber-RA2ra	0	-81	2457	2019-03-22 05:58:39.344+05:30	2019-03-22 05:58:39.344+05:30	\N
856	08:25:25:1f:a3:ad	Samir	0	-54	2462	2019-03-22 11:03:36.363+05:30	2019-03-22 11:03:36.363+05:30	\N
857	a8:bd:27:7b:eb:94	Nelson	0	-72	5180	2019-03-22 11:03:36.363+05:30	2019-03-22 11:03:36.363+05:30	\N
858	18:a6:f7:67:78:d6	Beaconstalk	0	-56	2462	2019-03-22 11:03:36.363+05:30	2019-03-22 11:03:36.363+05:30	\N
859	a8:bd:27:7b:d0:e0	Ethinos	0	-72	2462	2019-03-22 11:03:36.363+05:30	2019-03-22 11:03:36.363+05:30	\N
860	a8:bd:27:7b:eb:95	Al-Mulla-FTZ	0	-73	5180	2019-03-22 11:03:36.363+05:30	2019-03-22 11:03:36.363+05:30	\N
861	a8:bd:27:7b:eb:93	Mmr-Research	0	-73	5180	2019-03-22 11:03:36.363+05:30	2019-03-22 11:03:36.363+05:30	\N
862	a8:bd:27:7b:d0:e2	INDX	0	-73	2462	2019-03-22 11:03:36.364+05:30	2019-03-22 11:03:36.364+05:30	\N
863	a8:bd:27:7b:eb:92	INDX	0	-73	5180	2019-03-22 11:03:36.363+05:30	2019-03-22 11:03:36.363+05:30	\N
864	a8:bd:27:7b:eb:91	Awfis	0	-72	5180	2019-03-22 11:03:36.363+05:30	2019-03-22 11:03:36.363+05:30	\N
865	a8:bd:27:7b:d0:f2	INDX	0	-74	5260	2019-03-22 11:03:36.364+05:30	2019-03-22 11:03:36.364+05:30	\N
866	a8:bd:27:7b:d0:f3	Mmr-Research	0	-74	5260	2019-03-22 11:03:36.364+05:30	2019-03-22 11:03:36.364+05:30	\N
867	a8:bd:27:7b:d0:f0	Ethinos	0	-74	5260	2019-03-22 11:03:36.364+05:30	2019-03-22 11:03:36.364+05:30	\N
868	a8:bd:27:7b:d0:f1	Awfis	0	-74	5260	2019-03-22 11:03:36.364+05:30	2019-03-22 11:03:36.364+05:30	\N
869	a2:04:60:98:dd:d2	INDX-Guest	0	-74	2462	2019-03-22 11:03:36.364+05:30	2019-03-22 11:03:36.364+05:30	\N
870	a8:bd:27:7b:d0:f5	Al-Mulla-FTZ	0	-75	5260	2019-03-22 11:03:36.364+05:30	2019-03-22 11:03:36.364+05:30	\N
871	a8:bd:27:7b:eb:90	Ethinos	0	-74	5180	2019-03-22 11:03:36.364+05:30	2019-03-22 11:03:36.364+05:30	\N
872	a8:bd:27:7b:e1:65	Al-Mulla-FTZ	0	-75	2412	2019-03-22 11:03:36.364+05:30	2019-03-22 11:03:36.364+05:30	\N
873	a8:bd:27:7b:d0:f4	Nelson	0	-75	5260	2019-03-22 11:03:36.364+05:30	2019-03-22 11:03:36.364+05:30	\N
874	a8:bd:27:7b:e1:63	Mmr-Research	0	-75	2412	2019-03-22 11:03:36.364+05:30	2019-03-22 11:03:36.364+05:30	\N
875	a8:bd:27:7b:e1:60	Ethinos	0	-76	2412	2019-03-22 11:03:36.364+05:30	2019-03-22 11:03:36.364+05:30	\N
876	a8:bd:27:7c:07:70	Ethinos	0	-78	5745	2019-03-22 11:03:36.364+05:30	2019-03-22 11:03:36.364+05:30	\N
877	a8:bd:27:7c:07:65	Al-Mulla-FTZ	0	-78	2437	2019-03-22 11:03:36.364+05:30	2019-03-22 11:03:36.364+05:30	\N
878	a8:bd:27:7c:07:63	Mmr-Research	0	-78	2437	2019-03-22 11:03:36.364+05:30	2019-03-22 11:03:36.364+05:30	\N
879	a8:bd:27:7c:07:64	Nelson	0	-78	2437	2019-03-22 11:03:36.364+05:30	2019-03-22 11:03:36.364+05:30	\N
880	a8:bd:27:7c:07:61	Awfis	0	-78	2437	2019-03-22 11:03:36.364+05:30	2019-03-22 11:03:36.364+05:30	\N
881	a8:bd:27:7c:07:60	Ethinos	0	-78	2437	2019-03-22 11:03:36.364+05:30	2019-03-22 11:03:36.364+05:30	\N
882	a8:bd:27:7b:e1:62	INDX	0	-78	2412	2019-03-22 11:03:36.365+05:30	2019-03-22 11:03:36.365+05:30	\N
883	a8:bd:27:7c:07:71	Awfis	0	-79	5745	2019-03-22 11:03:36.365+05:30	2019-03-22 11:03:36.365+05:30	\N
884	a8:bd:27:7c:07:75	Al-Mulla-FTZ	0	-80	5745	2019-03-22 11:03:36.365+05:30	2019-03-22 11:03:36.365+05:30	\N
885	a8:bd:27:7c:07:74	Nelson	0	-80	5745	2019-03-22 11:03:36.365+05:30	2019-03-22 11:03:36.365+05:30	\N
886	a8:bd:27:7c:07:73	Mmr-Research	0	-80	5745	2019-03-22 11:03:36.365+05:30	2019-03-22 11:03:36.365+05:30	\N
887	a8:bd:27:7c:07:72	INDX	0	-80	5745	2019-03-22 11:03:36.365+05:30	2019-03-22 11:03:36.365+05:30	\N
888	a8:bd:27:77:b3:21	Awfis	0	-83	2412	2019-03-22 11:03:36.365+05:30	2019-03-22 11:03:36.365+05:30	\N
889	a8:bd:27:7b:eb:74	Nelson	0	-84	5745	2019-03-22 11:03:36.365+05:30	2019-03-22 11:03:36.365+05:30	\N
890	a8:bd:27:7b:eb:73	Mmr-Research	0	-84	5745	2019-03-22 11:03:36.365+05:30	2019-03-22 11:03:36.365+05:30	\N
891	a8:bd:27:7b:eb:72	INDX	0	-84	5745	2019-03-22 11:03:36.365+05:30	2019-03-22 11:03:36.365+05:30	\N
892	a8:bd:27:7b:eb:71	Awfis	0	-84	5745	2019-03-22 11:03:36.365+05:30	2019-03-22 11:03:36.365+05:30	\N
893	a8:bd:27:7b:eb:70	Ethinos	0	-84	5745	2019-03-22 11:03:36.365+05:30	2019-03-22 11:03:36.365+05:30	\N
894	a8:bd:27:77:b3:24	Nelson	0	-84	2412	2019-03-22 11:03:36.365+05:30	2019-03-22 11:03:36.365+05:30	\N
895	a8:bd:27:77:b3:22	INDX	0	-84	2412	2019-03-22 11:03:36.365+05:30	2019-03-22 11:03:36.365+05:30	\N
900	a8:bd:27:7b:e1:74	Nelson	0	-86	5260	2019-03-22 11:03:36.365+05:30	2019-03-22 11:03:36.365+05:30	\N
906	a8:bd:27:77:b3:33	Mmr-Research	0	-90	5180	2019-03-22 11:03:36.366+05:30	2019-03-22 11:03:36.366+05:30	\N
909	00:1e:a6:4b:0b:38	Sadda Adda	0	-45	2462	2019-03-22 20:23:05.392+05:30	2019-03-22 20:23:05.392+05:30	\N
910	40:49:0f:57:9a:ad	JioFiber-RA2ra	0	-66	2457	2019-03-22 20:23:05.392+05:30	2019-03-22 20:23:05.392+05:30	\N
911	40:49:0f:65:6a:03	JioFiber-YtK58_5G	0	-70	5745	2019-03-22 20:23:05.392+05:30	2019-03-22 20:23:05.392+05:30	\N
912	ec:08:6b:a8:2a:8e	PRAJAPATI	0	-70	2462	2019-03-22 20:23:05.392+05:30	2019-03-22 20:23:05.392+05:30	\N
913	40:49:0f:65:6a:02	JioFiber-YtK58	0	-75	2472	2019-03-22 20:23:05.392+05:30	2019-03-22 20:23:05.392+05:30	\N
914	b2:35:9f:ae:c6:ee	DIRECT-BMLAPTOP-RLKD4AMImsEG	0	-36	2462	2019-03-23 13:18:04.992+05:30	2019-03-23 13:18:04.992+05:30	\N
915	00:1e:a6:4b:0b:38	Sadda Adda	0	-47	2462	2019-03-23 13:18:04.992+05:30	2019-03-23 13:18:04.992+05:30	\N
916	ec:08:6b:a8:2a:8e	PRAJAPATI	0	-71	2462	2019-03-23 13:18:04.992+05:30	2019-03-23 13:18:04.992+05:30	\N
917	40:49:0f:57:9a:ad	JioFiber-RA2ra	0	-77	2457	2019-03-23 13:18:04.992+05:30	2019-03-23 13:18:04.992+05:30	\N
918	40:49:0f:65:6a:03	JioFiber-YtK58_5G	0	-77	5180	2019-03-23 13:18:04.993+05:30	2019-03-23 13:18:04.993+05:30	\N
919	40:49:0f:65:6a:02	JioFiber-YtK58	0	-78	2472	2019-03-23 13:18:04.993+05:30	2019-03-23 13:18:04.993+05:30	\N
920	c0:25:e9:42:2b:8e	Gungun	0	-95	2422	2019-03-23 13:18:04.993+05:30	2019-03-23 13:18:04.993+05:30	\N
921	b2:35:9f:ae:c6:ee	DIRECT-BMLAPTOP-RLKD4AMImsEG	0	-51	2462	2019-03-23 20:00:22.88+05:30	2019-03-23 20:00:22.88+05:30	\N
922	00:1e:a6:4b:0b:38	Sadda Adda	0	-54	2462	2019-03-23 20:00:22.88+05:30	2019-03-23 20:00:22.88+05:30	\N
923	40:49:0f:57:9a:ad	JioFiber-RA2ra	0	-64	2457	2019-03-23 20:00:22.88+05:30	2019-03-23 20:00:22.88+05:30	\N
924	40:49:0f:65:6a:02	JioFiber-YtK58	0	-65	2427	2019-03-23 20:00:22.88+05:30	2019-03-23 20:00:22.88+05:30	\N
925	40:49:0f:65:6a:03	JioFiber-YtK58_5G	0	-66	5745	2019-03-23 20:00:22.881+05:30	2019-03-23 20:00:22.881+05:30	\N
926	ec:08:6b:a8:2a:8e	PRAJAPATI	0	-72	2427	2019-03-23 20:00:22.881+05:30	2019-03-23 20:00:22.881+05:30	\N
927	00:1e:a6:4b:0b:38	Sadda Adda	0	-53	2462	2019-03-24 01:57:15.972+05:30	2019-03-24 01:57:15.972+05:30	\N
928	40:49:0f:57:9a:ad	JioFiber-RA2ra	0	-56	2457	2019-03-24 01:57:15.973+05:30	2019-03-24 01:57:15.973+05:30	\N
929	40:49:0f:65:6a:02	JioFiber-YtK58	0	-60	2427	2019-03-24 01:57:15.973+05:30	2019-03-24 01:57:15.973+05:30	\N
930	40:49:0f:65:6a:03	JioFiber-YtK58_5G	0	-68	5745	2019-03-24 01:57:15.973+05:30	2019-03-24 01:57:15.973+05:30	\N
931	ec:08:6b:a8:2a:8e	PRAJAPATI	0	-81	2427	2019-03-24 01:57:15.973+05:30	2019-03-24 01:57:15.973+05:30	\N
932	00:1e:a6:4b:0b:38	Sadda Adda	0	-55	2462	2019-03-24 07:00:17.006+05:30	2019-03-24 07:00:17.006+05:30	\N
933	40:49:0f:65:6a:02	JioFiber-YtK58	0	-58	2427	2019-03-24 07:00:17.007+05:30	2019-03-24 07:00:17.007+05:30	\N
934	40:49:0f:57:9a:ad	JioFiber-RA2ra	0	-59	2457	2019-03-24 07:00:17.007+05:30	2019-03-24 07:00:17.007+05:30	\N
935	40:49:0f:65:6a:03	JioFiber-YtK58_5G	0	-68	5745	2019-03-24 07:00:17.007+05:30	2019-03-24 07:00:17.007+05:30	\N
936	fa:8f:ca:6a:63:ad		0	-93	2412	2019-03-24 07:00:17.007+05:30	2019-03-24 07:00:17.007+05:30	\N
937	40:49:0f:57:c4:67	A 405	0	-93	2412	2019-03-24 07:00:17.007+05:30	2019-03-24 07:00:17.007+05:30	\N
938	ec:08:6b:a8:2a:8e	PRAJAPATI	0	-84	2427	2019-03-24 07:00:17.007+05:30	2019-03-24 07:00:17.007+05:30	\N
939	00:1e:a6:4b:0b:38	Sadda Adda	0	-46	2462	2019-03-24 14:51:29.578+05:30	2019-03-24 14:51:29.578+05:30	\N
940	40:49:0f:65:6a:02	JioFiber-YtK58	0	-54	2427	2019-03-24 14:51:29.579+05:30	2019-03-24 14:51:29.579+05:30	\N
941	b2:35:9f:ae:c6:ee	DIRECT-BMLAPTOP-RLKD4AMImsEG	0	-57	2462	2019-03-24 14:51:29.579+05:30	2019-03-24 14:51:29.579+05:30	\N
942	40:49:0f:57:9a:ad	JioFiber-RA2ra	0	-65	2457	2019-03-24 14:51:29.579+05:30	2019-03-24 14:51:29.579+05:30	\N
943	40:49:0f:65:6a:03	JioFiber-YtK58_5G	0	-71	5240	2019-03-24 14:51:29.579+05:30	2019-03-24 14:51:29.579+05:30	\N
944	ec:08:6b:a8:2a:8e	PRAJAPATI	0	-75	2427	2019-03-24 14:51:29.579+05:30	2019-03-24 14:51:29.579+05:30	\N
945	b2:35:9f:ae:c6:ee	DIRECT-BMLAPTOP-RLKD4AMImsEG	0	-35	2462	2019-03-24 20:03:33.25+05:30	2019-03-24 20:03:33.25+05:30	\N
946	00:1e:a6:4b:0b:38	Sadda Adda	0	-47	2462	2019-03-24 20:03:33.251+05:30	2019-03-24 20:03:33.251+05:30	\N
947	40:49:0f:65:6a:02	JioFiber-YtK58	0	-56	2427	2019-03-24 20:03:33.251+05:30	2019-03-24 20:03:33.251+05:30	\N
948	40:49:0f:65:6a:03	JioFiber-YtK58_5G	0	-64	5745	2019-03-24 20:03:33.251+05:30	2019-03-24 20:03:33.251+05:30	\N
949	ec:08:6b:a8:2a:8e	PRAJAPATI	0	-68	2427	2019-03-24 20:03:33.251+05:30	2019-03-24 20:03:33.251+05:30	\N
950	40:49:0f:57:9a:ad	JioFiber-RA2ra	0	-78	2457	2019-03-24 20:03:33.251+05:30	2019-03-24 20:03:33.251+05:30	\N
951	b2:35:9f:ae:c6:ee	DIRECT-BMLAPTOP-RLKD4AMImsEG	0	-35	2462	2019-03-24 20:03:33.283+05:30	2019-03-24 20:03:33.283+05:30	\N
952	00:1e:a6:4b:0b:38	Sadda Adda	0	-47	2462	2019-03-24 20:03:33.284+05:30	2019-03-24 20:03:33.284+05:30	\N
953	40:49:0f:65:6a:02	JioFiber-YtK58	0	-56	2427	2019-03-24 20:03:33.284+05:30	2019-03-24 20:03:33.284+05:30	\N
954	40:49:0f:65:6a:03	JioFiber-YtK58_5G	0	-64	5745	2019-03-24 20:03:33.284+05:30	2019-03-24 20:03:33.284+05:30	\N
955	ec:08:6b:a8:2a:8e	PRAJAPATI	0	-68	2427	2019-03-24 20:03:33.284+05:30	2019-03-24 20:03:33.284+05:30	\N
956	40:49:0f:57:9a:ad	JioFiber-RA2ra	0	-78	2457	2019-03-24 20:03:33.284+05:30	2019-03-24 20:03:33.284+05:30	\N
957	00:1e:a6:4b:0b:38	Sadda Adda	0	-50	2462	2019-03-25 06:28:38.043+05:30	2019-03-25 06:28:38.043+05:30	\N
958	40:49:0f:57:9a:ad	JioFiber-RA2ra	0	-56	2457	2019-03-25 06:28:38.043+05:30	2019-03-25 06:28:38.043+05:30	\N
959	40:49:0f:65:6a:02	JioFiber-YtK58	0	-63	2427	2019-03-25 06:28:38.043+05:30	2019-03-25 06:28:38.043+05:30	\N
960	40:49:0f:65:6a:03	JioFiber-YtK58_5G	0	-72	5745	2019-03-25 06:28:38.043+05:30	2019-03-25 06:28:38.043+05:30	\N
961	ec:08:6b:a8:2a:8e	PRAJAPATI	0	-85	2427	2019-03-25 06:28:38.043+05:30	2019-03-25 06:28:38.043+05:30	\N
962	b2:35:9f:ae:c6:ee	DIRECT-BMLAPTOP-RLKD4AMImsEG	0	-45	2462	2019-03-25 11:30:28.002+05:30	2019-03-25 11:30:28.002+05:30	\N
963	18:a6:f7:67:78:d6	Beaconstalk	0	-36	2462	2019-03-25 11:30:28.002+05:30	2019-03-25 11:30:28.002+05:30	\N
964	a2:04:60:98:dd:d2	INDX-Guest	0	-69	2462	2019-03-25 11:30:28.002+05:30	2019-03-25 11:30:28.002+05:30	\N
965	a8:bd:27:7b:d0:e5	Al-Mulla-FTZ	0	-69	2412	2019-03-25 11:30:28.003+05:30	2019-03-25 11:30:28.003+05:30	\N
966	a8:bd:27:7b:d0:e0	Ethinos	0	-69	2412	2019-03-25 11:30:28.003+05:30	2019-03-25 11:30:28.003+05:30	\N
967	a8:bd:27:7b:d0:e4	Nelson	0	-71	2412	2019-03-25 11:30:28.004+05:30	2019-03-25 11:30:28.004+05:30	\N
968	a8:bd:27:7b:d0:e3	Mmr-Research	0	-71	2412	2019-03-25 11:30:28.004+05:30	2019-03-25 11:30:28.004+05:30	\N
969	a8:bd:27:7b:d0:e2	INDX	0	-71	2412	2019-03-25 11:30:28.004+05:30	2019-03-25 11:30:28.004+05:30	\N
970	a8:bd:27:7b:eb:83	Mmr-Research	0	-74	2412	2019-03-25 11:30:28.004+05:30	2019-03-25 11:30:28.004+05:30	\N
971	a8:bd:27:7b:eb:80	Ethinos	0	-74	2412	2019-03-25 11:30:28.004+05:30	2019-03-25 11:30:28.004+05:30	\N
972	a8:bd:27:7c:07:64	Nelson	0	-74	2437	2019-03-25 11:30:28.004+05:30	2019-03-25 11:30:28.004+05:30	\N
973	a8:bd:27:7c:07:62	INDX	0	-74	2437	2019-03-25 11:30:28.004+05:30	2019-03-25 11:30:28.004+05:30	\N
974	a8:bd:27:7b:eb:90	Ethinos	0	-75	5180	2019-03-25 11:30:28.004+05:30	2019-03-25 11:30:28.004+05:30	\N
975	a8:bd:27:7b:d0:f4	Nelson	0	-76	5260	2019-03-25 11:30:28.004+05:30	2019-03-25 11:30:28.004+05:30	\N
976	a8:bd:27:7b:d0:f0	Ethinos	0	-76	5260	2019-03-25 11:30:28.005+05:30	2019-03-25 11:30:28.005+05:30	\N
977	a8:bd:27:7b:d0:f3	Mmr-Research	0	-76	5260	2019-03-25 11:30:28.005+05:30	2019-03-25 11:30:28.005+05:30	\N
982	a8:bd:27:7b:eb:91	Awfis	0	-76	5180	2019-03-25 11:30:28.005+05:30	2019-03-25 11:30:28.005+05:30	\N
986	a8:bd:27:7b:d0:f1	Awfis	0	-77	5260	2019-03-25 11:30:28.005+05:30	2019-03-25 11:30:28.005+05:30	\N
992	a8:bd:27:7b:eb:71	Awfis	0	-80	5745	2019-03-25 11:30:28.006+05:30	2019-03-25 11:30:28.006+05:30	\N
999	a8:bd:27:7b:e1:75	Al-Mulla-FTZ	0	-86	5260	2019-03-25 11:30:28.006+05:30	2019-03-25 11:30:28.006+05:30	\N
1005	a8:bd:27:7b:da:30	Ethinos	0	-87	5745	2019-03-25 11:30:28.007+05:30	2019-03-25 11:30:28.007+05:30	\N
1011	a8:bd:27:77:b3:34	Nelson	0	-90	5180	2019-03-25 11:30:28.007+05:30	2019-03-25 11:30:28.007+05:30	\N
1015	a8:bd:27:7c:07:63	Mmr-Research	0	-70	2437	2019-03-25 17:16:57.174+05:30	2019-03-25 17:16:57.174+05:30	\N
1016	18:a6:f7:67:78:d6	Beaconstalk	0	-36	2462	2019-03-25 17:16:57.174+05:30	2019-03-25 17:16:57.174+05:30	\N
1017	a8:bd:27:7c:07:61	Awfis	0	-70	2437	2019-03-25 17:16:57.174+05:30	2019-03-25 17:16:57.174+05:30	\N
1018	a8:bd:27:7c:07:65	Al-Mulla-FTZ	0	-71	2437	2019-03-25 17:16:57.174+05:30	2019-03-25 17:16:57.174+05:30	\N
1019	a8:bd:27:7c:07:62	INDX	0	-71	2437	2019-03-25 17:16:57.174+05:30	2019-03-25 17:16:57.174+05:30	\N
1020	a8:bd:27:7b:d0:f2	INDX	0	-73	5260	2019-03-25 17:16:57.174+05:30	2019-03-25 17:16:57.174+05:30	\N
1021	a8:bd:27:7b:d0:f5	Al-Mulla-FTZ	0	-74	5260	2019-03-25 17:16:57.174+05:30	2019-03-25 17:16:57.174+05:30	\N
1022	a8:bd:27:7b:d0:f4	Nelson	0	-74	5260	2019-03-25 17:16:57.175+05:30	2019-03-25 17:16:57.175+05:30	\N
1023	a8:bd:27:7b:d0:f0	Ethinos	0	-74	5260	2019-03-25 17:16:57.175+05:30	2019-03-25 17:16:57.175+05:30	\N
1024	a8:bd:27:7b:d0:f1	Awfis	0	-74	5260	2019-03-25 17:16:57.175+05:30	2019-03-25 17:16:57.175+05:30	\N
1025	a8:bd:27:7b:d0:f3	Mmr-Research	0	-74	5260	2019-03-25 17:16:57.175+05:30	2019-03-25 17:16:57.175+05:30	\N
1026	a8:bd:27:7b:eb:74	Nelson	0	-77	5745	2019-03-25 17:16:57.175+05:30	2019-03-25 17:16:57.175+05:30	\N
1027	a8:bd:27:7b:eb:72	INDX	0	-76	5745	2019-03-25 17:16:57.175+05:30	2019-03-25 17:16:57.175+05:30	\N
1028	a8:bd:27:7b:eb:73	Mmr-Research	0	-78	5745	2019-03-25 17:16:57.175+05:30	2019-03-25 17:16:57.175+05:30	\N
1029	a8:bd:27:7b:eb:75	Al-Mulla-FTZ	0	-78	5745	2019-03-25 17:16:57.175+05:30	2019-03-25 17:16:57.175+05:30	\N
1030	a8:bd:27:7b:eb:70	Ethinos	0	-78	5745	2019-03-25 17:16:57.175+05:30	2019-03-25 17:16:57.175+05:30	\N
1031	a8:bd:27:7b:eb:71	Awfis	0	-78	5745	2019-03-25 17:16:57.175+05:30	2019-03-25 17:16:57.175+05:30	\N
1032	a8:bd:27:7b:eb:94	Nelson	0	-79	5180	2019-03-25 17:16:57.175+05:30	2019-03-25 17:16:57.175+05:30	\N
1033	a8:bd:27:7b:eb:91	Awfis	0	-79	5180	2019-03-25 17:16:57.175+05:30	2019-03-25 17:16:57.175+05:30	\N
1034	a8:bd:27:7b:e1:61	Awfis	0	-79	2437	2019-03-25 17:16:57.175+05:30	2019-03-25 17:16:57.175+05:30	\N
1035	a8:bd:27:7b:eb:95	Al-Mulla-FTZ	0	-80	5180	2019-03-25 17:16:57.175+05:30	2019-03-25 17:16:57.175+05:30	\N
1036	a8:bd:27:7b:eb:93	Mmr-Research	0	-80	5180	2019-03-25 17:16:57.176+05:30	2019-03-25 17:16:57.176+05:30	\N
1037	a8:bd:27:7b:eb:92	INDX	0	-80	5180	2019-03-25 17:16:57.176+05:30	2019-03-25 17:16:57.176+05:30	\N
1038	a8:bd:27:7b:eb:90	Ethinos	0	-80	5180	2019-03-25 17:16:57.176+05:30	2019-03-25 17:16:57.176+05:30	\N
1039	a8:bd:27:7b:e1:75	Al-Mulla-FTZ	0	-84	5260	2019-03-25 17:16:57.176+05:30	2019-03-25 17:16:57.176+05:30	\N
1040	a8:bd:27:7b:e1:70	Ethinos	0	-84	5260	2019-03-25 17:16:57.176+05:30	2019-03-25 17:16:57.176+05:30	\N
1041	a8:bd:27:7b:e1:73	Mmr-Research	0	-84	5260	2019-03-25 17:16:57.176+05:30	2019-03-25 17:16:57.176+05:30	\N
1042	a8:bd:27:7b:da:35	Al-Mulla-FTZ	0	-86	5745	2019-03-25 17:16:57.176+05:30	2019-03-25 17:16:57.176+05:30	\N
1043	a8:bd:27:7b:da:33	Mmr-Research	0	-86	5745	2019-03-25 17:16:57.176+05:30	2019-03-25 17:16:57.176+05:30	\N
1044	a8:bd:27:7b:da:30	Ethinos	0	-86	5745	2019-03-25 17:16:57.176+05:30	2019-03-25 17:16:57.176+05:30	\N
1045	a8:bd:27:7b:da:32	INDX	0	-86	5745	2019-03-25 17:16:57.176+05:30	2019-03-25 17:16:57.176+05:30	\N
1046	a8:bd:27:7b:da:31	Awfis	0	-86	5745	2019-03-25 17:16:57.176+05:30	2019-03-25 17:16:57.176+05:30	\N
1047	a8:bd:27:7c:07:72	INDX	0	-86	5745	2019-03-25 17:16:57.176+05:30	2019-03-25 17:16:57.176+05:30	\N
1048	a8:bd:27:7b:da:34	Nelson	0	-87	5745	2019-03-25 17:16:57.176+05:30	2019-03-25 17:16:57.176+05:30	\N
1049	a8:bd:27:7c:07:75	Al-Mulla-FTZ	0	-87	5745	2019-03-25 17:16:57.176+05:30	2019-03-25 17:16:57.176+05:30	\N
1050	a8:bd:27:7c:07:73	Mmr-Research	0	-87	5745	2019-03-25 17:16:57.177+05:30	2019-03-25 17:16:57.177+05:30	\N
1051	a8:bd:27:7c:07:74	Nelson	0	-88	5745	2019-03-25 17:16:57.177+05:30	2019-03-25 17:16:57.177+05:30	\N
1052	a8:bd:27:7c:07:71	Awfis	0	-88	5745	2019-03-25 17:16:57.177+05:30	2019-03-25 17:16:57.177+05:30	\N
1053	a8:bd:27:7c:07:70	Ethinos	0	-89	5745	2019-03-25 17:16:57.177+05:30	2019-03-25 17:16:57.177+05:30	\N
1054	a8:bd:27:77:b3:31	Awfis	0	-89	5180	2019-03-25 17:16:57.177+05:30	2019-03-25 17:16:57.177+05:30	\N
1055	a8:bd:27:77:b3:32	INDX	0	-90	5180	2019-03-25 17:16:57.177+05:30	2019-03-25 17:16:57.177+05:30	\N
1056	a8:bd:27:77:b3:35	Al-Mulla-FTZ	0	-90	5180	2019-03-25 17:16:57.177+05:30	2019-03-25 17:16:57.177+05:30	\N
1057	a8:bd:27:77:b3:34	Nelson	0	-90	5180	2019-03-25 17:16:57.177+05:30	2019-03-25 17:16:57.177+05:30	\N
1058	a8:bd:27:77:b3:33	Mmr-Research	0	-90	5180	2019-03-25 17:16:57.177+05:30	2019-03-25 17:16:57.177+05:30	\N
1059	a8:bd:27:77:b3:30	Ethinos	0	-90	5180	2019-03-25 17:16:57.177+05:30	2019-03-25 17:16:57.177+05:30	\N
\.


--
-- Name: wifis_id_seq; Type: SEQUENCE SET; Schema: public; Owner: beaconstalk
--

SELECT pg_catalog.setval('public.wifis_id_seq', 1404, true);


--
-- Name: applications_pkey; Type: CONSTRAINT; Schema: public; Owner: beaconstalk
--

ALTER TABLE ONLY public.applications
    ADD CONSTRAINT applications_pkey PRIMARY KEY (id);


--
-- Name: appusers_pkey; Type: CONSTRAINT; Schema: public; Owner: beaconstalk
--

ALTER TABLE ONLY public.appusers
    ADD CONSTRAINT appusers_pkey PRIMARY KEY (id);


--
-- Name: beacon_masters_major_key; Type: CONSTRAINT; Schema: public; Owner: beaconstalk
--

ALTER TABLE ONLY public.beacon_masters
    ADD CONSTRAINT beacon_masters_major_key UNIQUE (major);


--
-- Name: beacon_masters_minor_key; Type: CONSTRAINT; Schema: public; Owner: beaconstalk
--

ALTER TABLE ONLY public.beacon_masters
    ADD CONSTRAINT beacon_masters_minor_key UNIQUE (minor);


--
-- Name: beacon_masters_pkey; Type: CONSTRAINT; Schema: public; Owner: beaconstalk
--

ALTER TABLE ONLY public.beacon_masters
    ADD CONSTRAINT beacon_masters_pkey PRIMARY KEY (id);


--
-- Name: beacon_masters_shortlink_key; Type: CONSTRAINT; Schema: public; Owner: beaconstalk
--

ALTER TABLE ONLY public.beacon_masters
    ADD CONSTRAINT beacon_masters_shortlink_key UNIQUE (shortlink);


--
-- Name: beacons_pkey; Type: CONSTRAINT; Schema: public; Owner: beaconstalk
--

ALTER TABLE ONLY public.beacons
    ADD CONSTRAINT beacons_pkey PRIMARY KEY (id);


--
-- Name: campaigns_pkey; Type: CONSTRAINT; Schema: public; Owner: beaconstalk
--

ALTER TABLE ONLY public.campaigns
    ADD CONSTRAINT campaigns_pkey PRIMARY KEY (id);


--
-- Name: devices_pkey; Type: CONSTRAINT; Schema: public; Owner: beaconstalk
--

ALTER TABLE ONLY public.devices
    ADD CONSTRAINT devices_pkey PRIMARY KEY (id);


--
-- Name: geofences_pkey; Type: CONSTRAINT; Schema: public; Owner: beaconstalk
--

ALTER TABLE ONLY public.geofences
    ADD CONSTRAINT geofences_pkey PRIMARY KEY (id);


--
-- Name: geolocations_pkey; Type: CONSTRAINT; Schema: public; Owner: beaconstalk
--

ALTER TABLE ONLY public.geolocations
    ADD CONSTRAINT geolocations_pkey PRIMARY KEY (id);


--
-- Name: location_masters_pkey; Type: CONSTRAINT; Schema: public; Owner: beaconstalk
--

ALTER TABLE ONLY public.location_masters
    ADD CONSTRAINT location_masters_pkey PRIMARY KEY (id);


--
-- Name: locations_pkey; Type: CONSTRAINT; Schema: public; Owner: beaconstalk
--

ALTER TABLE ONLY public.locations
    ADD CONSTRAINT locations_pkey PRIMARY KEY (id);


--
-- Name: roles_pkey; Type: CONSTRAINT; Schema: public; Owner: beaconstalk
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: tags_pkey; Type: CONSTRAINT; Schema: public; Owner: beaconstalk
--

ALTER TABLE ONLY public.tags
    ADD CONSTRAINT tags_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: beaconstalk
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: wifis_pkey; Type: CONSTRAINT; Schema: public; Owner: beaconstalk
--

ALTER TABLE ONLY public.wifis
    ADD CONSTRAINT wifis_pkey PRIMARY KEY (id);


--
-- Name: appusers_applicationId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: beaconstalk
--

ALTER TABLE ONLY public.appusers
    ADD CONSTRAINT "appusers_applicationId_fkey" FOREIGN KEY ("applicationId") REFERENCES public.applications(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: appusers_deviceId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: beaconstalk
--

ALTER TABLE ONLY public.appusers
    ADD CONSTRAINT "appusers_deviceId_fkey" FOREIGN KEY ("deviceId") REFERENCES public.devices(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: beacon_masters_locationMasterId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: beaconstalk
--

ALTER TABLE ONLY public.beacon_masters
    ADD CONSTRAINT "beacon_masters_locationMasterId_fkey" FOREIGN KEY ("locationMasterId") REFERENCES public.location_masters(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: beacons_deviceId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: beaconstalk
--

ALTER TABLE ONLY public.beacons
    ADD CONSTRAINT "beacons_deviceId_fkey" FOREIGN KEY ("deviceId") REFERENCES public.devices(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: campaigns_applicationId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: beaconstalk
--

ALTER TABLE ONLY public.campaigns
    ADD CONSTRAINT "campaigns_applicationId_fkey" FOREIGN KEY ("applicationId") REFERENCES public.applications(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: campaigns_locationMasterId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: beaconstalk
--

ALTER TABLE ONLY public.campaigns
    ADD CONSTRAINT "campaigns_locationMasterId_fkey" FOREIGN KEY ("locationMasterId") REFERENCES public.location_masters(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: geofences_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: beaconstalk
--

ALTER TABLE ONLY public.geofences
    ADD CONSTRAINT "geofences_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id) ON UPDATE CASCADE;


--
-- Name: geolocations_geofenceId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: beaconstalk
--

ALTER TABLE ONLY public.geolocations
    ADD CONSTRAINT "geolocations_geofenceId_fkey" FOREIGN KEY ("geofenceId") REFERENCES public.geofences(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: geolocations_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: beaconstalk
--

ALTER TABLE ONLY public.geolocations
    ADD CONSTRAINT "geolocations_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: locations_deviceId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: beaconstalk
--

ALTER TABLE ONLY public.locations
    ADD CONSTRAINT "locations_deviceId_fkey" FOREIGN KEY ("deviceId") REFERENCES public.devices(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: roles_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: beaconstalk
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT "roles_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: tags_beaconMasterId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: beaconstalk
--

ALTER TABLE ONLY public.tags
    ADD CONSTRAINT "tags_beaconMasterId_fkey" FOREIGN KEY ("beaconMasterId") REFERENCES public.beacon_masters(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: users_applicationId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: beaconstalk
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT "users_applicationId_fkey" FOREIGN KEY ("applicationId") REFERENCES public.applications(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: wifis_deviceId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: beaconstalk
--

ALTER TABLE ONLY public.wifis
    ADD CONSTRAINT "wifis_deviceId_fkey" FOREIGN KEY ("deviceId") REFERENCES public.devices(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

