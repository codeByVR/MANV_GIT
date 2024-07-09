--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3 (Debian 16.3-1.pgdg120+1)
-- Dumped by pg_dump version 16.3 (Debian 16.3-1.pgdg120+1)

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

ALTER TABLE ONLY public.directus_versions DROP CONSTRAINT directus_versions_user_updated_foreign;
ALTER TABLE ONLY public.directus_versions DROP CONSTRAINT directus_versions_user_created_foreign;
ALTER TABLE ONLY public.directus_versions DROP CONSTRAINT directus_versions_collection_foreign;
ALTER TABLE ONLY public.directus_shares DROP CONSTRAINT directus_shares_user_created_foreign;
ALTER TABLE ONLY public.directus_shares DROP CONSTRAINT directus_shares_role_foreign;
ALTER TABLE ONLY public.directus_shares DROP CONSTRAINT directus_shares_collection_foreign;
ALTER TABLE ONLY public.directus_settings DROP CONSTRAINT directus_settings_storage_default_folder_foreign;
ALTER TABLE ONLY public.directus_settings DROP CONSTRAINT directus_settings_public_foreground_foreign;
ALTER TABLE ONLY public.directus_settings DROP CONSTRAINT directus_settings_public_favicon_foreign;
ALTER TABLE ONLY public.directus_settings DROP CONSTRAINT directus_settings_public_background_foreign;
ALTER TABLE ONLY public.directus_settings DROP CONSTRAINT directus_settings_project_logo_foreign;
ALTER TABLE ONLY public.directus_presets DROP CONSTRAINT directus_presets_user_foreign;
ALTER TABLE ONLY public.directus_presets DROP CONSTRAINT directus_presets_role_foreign;
ALTER TABLE ONLY public.directus_permissions DROP CONSTRAINT directus_permissions_role_foreign;
ALTER TABLE ONLY public.directus_panels DROP CONSTRAINT directus_panels_user_created_foreign;
ALTER TABLE ONLY public.directus_panels DROP CONSTRAINT directus_panels_dashboard_foreign;
ALTER TABLE ONLY public.directus_operations DROP CONSTRAINT directus_operations_user_created_foreign;
ALTER TABLE ONLY public.directus_operations DROP CONSTRAINT directus_operations_resolve_foreign;
ALTER TABLE ONLY public.directus_operations DROP CONSTRAINT directus_operations_reject_foreign;
ALTER TABLE ONLY public.directus_operations DROP CONSTRAINT directus_operations_flow_foreign;
ALTER TABLE ONLY public.directus_folders DROP CONSTRAINT directus_folders_parent_foreign;
ALTER TABLE ONLY public.directus_flows DROP CONSTRAINT directus_flows_user_created_foreign;
ALTER TABLE ONLY public.directus_files DROP CONSTRAINT directus_files_uploaded_by_foreign;
ALTER TABLE ONLY public.directus_files DROP CONSTRAINT directus_files_modified_by_foreign;
ALTER TABLE ONLY public.directus_files DROP CONSTRAINT directus_files_folder_foreign;
ALTER TABLE ONLY public.directus_dashboards DROP CONSTRAINT directus_dashboards_user_created_foreign;
ALTER TABLE ONLY public.directus_webhooks DROP CONSTRAINT directus_webhooks_pkey;
ALTER TABLE ONLY public.directus_versions DROP CONSTRAINT directus_versions_pkey;
ALTER TABLE ONLY public.directus_translations DROP CONSTRAINT directus_translations_pkey;
ALTER TABLE ONLY public.directus_shares DROP CONSTRAINT directus_shares_pkey;
ALTER TABLE ONLY public.directus_settings DROP CONSTRAINT directus_settings_pkey;
ALTER TABLE ONLY public.directus_roles DROP CONSTRAINT directus_roles_pkey;
ALTER TABLE ONLY public.directus_relations DROP CONSTRAINT directus_relations_pkey;
ALTER TABLE ONLY public.directus_presets DROP CONSTRAINT directus_presets_pkey;
ALTER TABLE ONLY public.directus_permissions DROP CONSTRAINT directus_permissions_pkey;
ALTER TABLE ONLY public.directus_panels DROP CONSTRAINT directus_panels_pkey;
ALTER TABLE ONLY public.directus_operations DROP CONSTRAINT directus_operations_resolve_unique;
ALTER TABLE ONLY public.directus_operations DROP CONSTRAINT directus_operations_reject_unique;
ALTER TABLE ONLY public.directus_operations DROP CONSTRAINT directus_operations_pkey;
ALTER TABLE ONLY public.directus_migrations DROP CONSTRAINT directus_migrations_pkey;
ALTER TABLE ONLY public.directus_folders DROP CONSTRAINT directus_folders_pkey;
ALTER TABLE ONLY public.directus_flows DROP CONSTRAINT directus_flows_pkey;
ALTER TABLE ONLY public.directus_flows DROP CONSTRAINT directus_flows_operation_unique;
ALTER TABLE ONLY public.directus_files DROP CONSTRAINT directus_files_pkey;
ALTER TABLE ONLY public.directus_fields DROP CONSTRAINT directus_fields_pkey;
ALTER TABLE ONLY public.directus_extensions DROP CONSTRAINT directus_extensions_pkey;
ALTER TABLE ONLY public.directus_dashboards DROP CONSTRAINT directus_dashboards_pkey;
ALTER TABLE public.directus_webhooks ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.directus_settings ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.directus_relations ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.directus_presets ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.directus_permissions ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.directus_fields ALTER COLUMN id DROP DEFAULT;
DROP SEQUENCE public.directus_webhooks_id_seq;
DROP TABLE public.directus_webhooks;
DROP TABLE public.directus_versions;
DROP TABLE public.directus_translations;
DROP TABLE public.directus_shares;
DROP SEQUENCE public.directus_settings_id_seq;
DROP TABLE public.directus_settings;
DROP TABLE public.directus_roles;
DROP SEQUENCE public.directus_relations_id_seq;
DROP TABLE public.directus_relations;
DROP SEQUENCE public.directus_presets_id_seq;
DROP TABLE public.directus_presets;
DROP SEQUENCE public.directus_permissions_id_seq;
DROP TABLE public.directus_permissions;
DROP TABLE public.directus_panels;
DROP TABLE public.directus_operations;
DROP TABLE public.directus_migrations;
DROP TABLE public.directus_folders;
DROP TABLE public.directus_flows;
DROP TABLE public.directus_files;
DROP SEQUENCE public.directus_fields_id_seq;
DROP TABLE public.directus_fields;
DROP TABLE public.directus_extensions;
DROP TABLE public.directus_dashboards;
SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: directus_dashboards; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_dashboards (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    icon character varying(30) DEFAULT 'dashboard'::character varying NOT NULL,
    note text,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid,
    color character varying(255)
);


ALTER TABLE public.directus_dashboards OWNER TO directus;

--
-- Name: directus_extensions; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_extensions (
    enabled boolean DEFAULT true NOT NULL,
    id uuid NOT NULL,
    folder character varying(255) NOT NULL,
    source character varying(255) NOT NULL,
    bundle uuid
);


ALTER TABLE public.directus_extensions OWNER TO directus;

--
-- Name: directus_fields; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_fields (
    id integer NOT NULL,
    collection character varying(64) NOT NULL,
    field character varying(64) NOT NULL,
    special character varying(64),
    interface character varying(64),
    options json,
    display character varying(64),
    display_options json,
    readonly boolean DEFAULT false NOT NULL,
    hidden boolean DEFAULT false NOT NULL,
    sort integer,
    width character varying(30) DEFAULT 'full'::character varying,
    translations json,
    note text,
    conditions json,
    required boolean DEFAULT false,
    "group" character varying(64),
    validation json,
    validation_message text
);


ALTER TABLE public.directus_fields OWNER TO directus;

--
-- Name: directus_fields_id_seq; Type: SEQUENCE; Schema: public; Owner: directus
--

CREATE SEQUENCE public.directus_fields_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.directus_fields_id_seq OWNER TO directus;

--
-- Name: directus_fields_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: directus
--

ALTER SEQUENCE public.directus_fields_id_seq OWNED BY public.directus_fields.id;


--
-- Name: directus_files; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_files (
    id uuid NOT NULL,
    storage character varying(255) NOT NULL,
    filename_disk character varying(255),
    filename_download character varying(255) NOT NULL,
    title character varying(255),
    type character varying(255),
    folder uuid,
    uploaded_by uuid,
    uploaded_on timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    modified_by uuid,
    modified_on timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    charset character varying(50),
    filesize bigint,
    width integer,
    height integer,
    duration integer,
    embed character varying(200),
    description text,
    location text,
    tags text,
    metadata json,
    focal_point_x integer,
    focal_point_y integer
);


ALTER TABLE public.directus_files OWNER TO directus;

--
-- Name: directus_flows; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_flows (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    icon character varying(30),
    color character varying(255),
    description text,
    status character varying(255) DEFAULT 'active'::character varying NOT NULL,
    trigger character varying(255),
    accountability character varying(255) DEFAULT 'all'::character varying,
    options json,
    operation uuid,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid
);


ALTER TABLE public.directus_flows OWNER TO directus;

--
-- Name: directus_folders; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_folders (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    parent uuid
);


ALTER TABLE public.directus_folders OWNER TO directus;

--
-- Name: directus_migrations; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_migrations (
    version character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    "timestamp" timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.directus_migrations OWNER TO directus;

--
-- Name: directus_operations; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_operations (
    id uuid NOT NULL,
    name character varying(255),
    key character varying(255) NOT NULL,
    type character varying(255) NOT NULL,
    position_x integer NOT NULL,
    position_y integer NOT NULL,
    options json,
    resolve uuid,
    reject uuid,
    flow uuid NOT NULL,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid
);


ALTER TABLE public.directus_operations OWNER TO directus;

--
-- Name: directus_panels; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_panels (
    id uuid NOT NULL,
    dashboard uuid NOT NULL,
    name character varying(255),
    icon character varying(30) DEFAULT NULL::character varying,
    color character varying(10),
    show_header boolean DEFAULT false NOT NULL,
    note text,
    type character varying(255) NOT NULL,
    position_x integer NOT NULL,
    position_y integer NOT NULL,
    width integer NOT NULL,
    height integer NOT NULL,
    options json,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid
);


ALTER TABLE public.directus_panels OWNER TO directus;

--
-- Name: directus_permissions; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_permissions (
    id integer NOT NULL,
    role uuid,
    collection character varying(64) NOT NULL,
    action character varying(10) NOT NULL,
    permissions json,
    validation json,
    presets json,
    fields text
);


ALTER TABLE public.directus_permissions OWNER TO directus;

--
-- Name: directus_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: directus
--

CREATE SEQUENCE public.directus_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.directus_permissions_id_seq OWNER TO directus;

--
-- Name: directus_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: directus
--

ALTER SEQUENCE public.directus_permissions_id_seq OWNED BY public.directus_permissions.id;


--
-- Name: directus_presets; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_presets (
    id integer NOT NULL,
    bookmark character varying(255),
    "user" uuid,
    role uuid,
    collection character varying(64),
    search character varying(100),
    layout character varying(100) DEFAULT 'tabular'::character varying,
    layout_query json,
    layout_options json,
    refresh_interval integer,
    filter json,
    icon character varying(30) DEFAULT 'bookmark'::character varying,
    color character varying(255)
);


ALTER TABLE public.directus_presets OWNER TO directus;

--
-- Name: directus_presets_id_seq; Type: SEQUENCE; Schema: public; Owner: directus
--

CREATE SEQUENCE public.directus_presets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.directus_presets_id_seq OWNER TO directus;

--
-- Name: directus_presets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: directus
--

ALTER SEQUENCE public.directus_presets_id_seq OWNED BY public.directus_presets.id;


--
-- Name: directus_relations; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_relations (
    id integer NOT NULL,
    many_collection character varying(64) NOT NULL,
    many_field character varying(64) NOT NULL,
    one_collection character varying(64),
    one_field character varying(64),
    one_collection_field character varying(64),
    one_allowed_collections text,
    junction_field character varying(64),
    sort_field character varying(64),
    one_deselect_action character varying(255) DEFAULT 'nullify'::character varying NOT NULL
);


ALTER TABLE public.directus_relations OWNER TO directus;

--
-- Name: directus_relations_id_seq; Type: SEQUENCE; Schema: public; Owner: directus
--

CREATE SEQUENCE public.directus_relations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.directus_relations_id_seq OWNER TO directus;

--
-- Name: directus_relations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: directus
--

ALTER SEQUENCE public.directus_relations_id_seq OWNED BY public.directus_relations.id;


--
-- Name: directus_roles; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_roles (
    id uuid NOT NULL,
    name character varying(100) NOT NULL,
    icon character varying(30) DEFAULT 'supervised_user_circle'::character varying NOT NULL,
    description text,
    ip_access text,
    enforce_tfa boolean DEFAULT false NOT NULL,
    admin_access boolean DEFAULT false NOT NULL,
    app_access boolean DEFAULT true NOT NULL
);


ALTER TABLE public.directus_roles OWNER TO directus;

--
-- Name: directus_settings; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_settings (
    id integer NOT NULL,
    project_name character varying(100) DEFAULT 'Directus'::character varying NOT NULL,
    project_url character varying(255),
    project_color character varying(255) DEFAULT '#6644FF'::character varying NOT NULL,
    project_logo uuid,
    public_foreground uuid,
    public_background uuid,
    public_note text,
    auth_login_attempts integer DEFAULT 25,
    auth_password_policy character varying(100),
    storage_asset_transform character varying(7) DEFAULT 'all'::character varying,
    storage_asset_presets json,
    custom_css text,
    storage_default_folder uuid,
    basemaps json,
    mapbox_key character varying(255),
    module_bar json,
    project_descriptor character varying(100),
    default_language character varying(255) DEFAULT 'en-US'::character varying NOT NULL,
    custom_aspect_ratios json,
    public_favicon uuid,
    default_appearance character varying(255) DEFAULT 'auto'::character varying NOT NULL,
    default_theme_light character varying(255),
    theme_light_overrides json,
    default_theme_dark character varying(255),
    theme_dark_overrides json
);


ALTER TABLE public.directus_settings OWNER TO directus;

--
-- Name: directus_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: directus
--

CREATE SEQUENCE public.directus_settings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.directus_settings_id_seq OWNER TO directus;

--
-- Name: directus_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: directus
--

ALTER SEQUENCE public.directus_settings_id_seq OWNED BY public.directus_settings.id;


--
-- Name: directus_shares; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_shares (
    id uuid NOT NULL,
    name character varying(255),
    collection character varying(64) NOT NULL,
    item character varying(255) NOT NULL,
    role uuid,
    password character varying(255),
    user_created uuid,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    date_start timestamp with time zone,
    date_end timestamp with time zone,
    times_used integer DEFAULT 0,
    max_uses integer
);


ALTER TABLE public.directus_shares OWNER TO directus;

--
-- Name: directus_translations; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_translations (
    id uuid NOT NULL,
    language character varying(255) NOT NULL,
    key character varying(255) NOT NULL,
    value text NOT NULL
);


ALTER TABLE public.directus_translations OWNER TO directus;

--
-- Name: directus_versions; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_versions (
    id uuid NOT NULL,
    key character varying(64) NOT NULL,
    name character varying(255),
    collection character varying(64) NOT NULL,
    item character varying(255) NOT NULL,
    hash character varying(255),
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    date_updated timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid,
    user_updated uuid
);


ALTER TABLE public.directus_versions OWNER TO directus;

--
-- Name: directus_webhooks; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_webhooks (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    method character varying(10) DEFAULT 'POST'::character varying NOT NULL,
    url character varying(255) NOT NULL,
    status character varying(10) DEFAULT 'active'::character varying NOT NULL,
    data boolean DEFAULT true NOT NULL,
    actions character varying(100) NOT NULL,
    collections character varying(255) NOT NULL,
    headers json
);


ALTER TABLE public.directus_webhooks OWNER TO directus;

--
-- Name: directus_webhooks_id_seq; Type: SEQUENCE; Schema: public; Owner: directus
--

CREATE SEQUENCE public.directus_webhooks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.directus_webhooks_id_seq OWNER TO directus;

--
-- Name: directus_webhooks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: directus
--

ALTER SEQUENCE public.directus_webhooks_id_seq OWNED BY public.directus_webhooks.id;


--
-- Name: directus_fields id; Type: DEFAULT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_fields ALTER COLUMN id SET DEFAULT nextval('public.directus_fields_id_seq'::regclass);


--
-- Name: directus_permissions id; Type: DEFAULT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_permissions ALTER COLUMN id SET DEFAULT nextval('public.directus_permissions_id_seq'::regclass);


--
-- Name: directus_presets id; Type: DEFAULT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_presets ALTER COLUMN id SET DEFAULT nextval('public.directus_presets_id_seq'::regclass);


--
-- Name: directus_relations id; Type: DEFAULT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_relations ALTER COLUMN id SET DEFAULT nextval('public.directus_relations_id_seq'::regclass);


--
-- Name: directus_settings id; Type: DEFAULT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_settings ALTER COLUMN id SET DEFAULT nextval('public.directus_settings_id_seq'::regclass);


--
-- Name: directus_webhooks id; Type: DEFAULT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_webhooks ALTER COLUMN id SET DEFAULT nextval('public.directus_webhooks_id_seq'::regclass);


--
-- Data for Name: directus_dashboards; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_dashboards (id, name, icon, note, date_created, user_created, color) FROM stdin;
\.


--
-- Data for Name: directus_extensions; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_extensions (enabled, id, folder, source, bundle) FROM stdin;
\.


--
-- Data for Name: directus_fields; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_fields (id, collection, field, special, interface, options, display, display_options, readonly, hidden, sort, width, translations, note, conditions, required, "group", validation, validation_message) FROM stdin;
1	Device	id	uuid	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N
2	Device	Name	\N	input	{"placeholder":null}	\N	\N	f	f	2	full	\N	\N	\N	t	\N	\N	\N
3	Device	Room	m2o	select-dropdown-m2o	{"template":"{{Name}}"}	\N	\N	f	f	3	full	\N	\N	\N	t	\N	\N	\N
4	Device	Duration	\N	input	{"max":1000000,"min":1}	\N	\N	f	f	4	full	\N	\N	\N	t	\N	\N	\N
5	Device	Blocked	cast-boolean	boolean	\N	\N	\N	f	f	5	full	\N	\N	\N	f	\N	\N	\N
6	Examination	id	uuid	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N
7	Examination	Doctor	m2o,user-created	select-dropdown-m2o	\N	\N	\N	f	f	2	full	\N	\N	\N	f	\N	\N	\N
8	Examination	Device	m2o	select-dropdown-m2o	\N	\N	\N	f	f	4	full	\N	\N	\N	t	\N	\N	\N
9	Examination	StartTime	date-created	datetime	\N	datetime	{"format":"short"}	t	f	3	full	\N	\N	\N	f	\N	\N	\N
10	Examination	ExaminationResult	m2o	select-dropdown-m2o	\N	\N	\N	f	f	5	full	\N	\N	\N	t	\N	\N	\N
12	ExaminationResult	id	uuid	input	\N	\N	\N	t	f	1	full	\N	\N	\N	f	\N	\N	\N
13	ExaminationResult	Bodypart	\N	input	\N	\N	\N	f	f	2	full	\N	\N	\N	t	\N	\N	\N
14	ExaminationResult	Recognized	cast-boolean	boolean	\N	\N	\N	f	f	3	full	\N	\N	\N	t	\N	\N	\N
15	ExaminationResult	Patient	m2o	select-dropdown-m2o	{"template":"{{Name}}"}	\N	\N	f	f	4	full	\N	\N	\N	t	\N	\N	\N
17	ExaminationResult	Image	file	file-image	{"crop":false}	\N	\N	f	f	6	full	\N	\N	\N	f	\N	\N	\N
18	Patient	id	uuid	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N
19	Patient	Name	\N	input	{"placeholder":"Name"}	\N	\N	f	f	2	full	\N	\N	\N	t	\N	\N	\N
20	Patient	Age	\N	input	{"max":200,"min":0,"placeholder":"Age"}	\N	\N	f	f	3	full	\N	\N	\N	t	\N	\N	\N
21	Patient	Weight	\N	input	{"max":1000,"min":0,"placeholder":"Weight"}	\N	\N	f	f	4	full	\N	\N	\N	t	\N	\N	\N
22	Patient	BloodType	\N	select-dropdown	{"allowOther":true,"choices":[{"text":"Bloodtype A","value":"A"},{"text":"Bloodtype B","value":"B"},{"text":"Bloodtype AB","value":"AB"},{"text":"Bloodtype 0","value":"0"}],"placeholder":"Bloodtype"}	\N	\N	f	f	5	full	\N	\N	\N	t	\N	\N	\N
23	Room	id	uuid	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N
24	Room	Name	\N	input	{"placeholder":null}	\N	\N	f	f	2	full	\N	\N	\N	t	\N	\N	\N
25	Symptom	id	\N	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N
26	Symptom	Name	\N	input	{"placeholder":"Symptom Name"}	\N	\N	f	f	2	full	\N	\N	\N	t	\N	\N	\N
27	Symptom	Description	\N	input	{"placeholder":"Symptom Description"}	\N	\N	f	f	3	full	\N	\N	\N	t	\N	\N	\N
28	Symptom	Device	m2m	list-m2m	\N	\N	\N	f	f	4	full	\N	\N	\N	t	\N	\N	\N
29	Symptom_Device	id	\N	\N	\N	\N	\N	f	t	1	full	\N	\N	\N	f	\N	\N	\N
30	Symptom_Device	Symptom_id	\N	\N	\N	\N	\N	f	t	2	full	\N	\N	\N	f	\N	\N	\N
31	Symptom_Device	Device_id	\N	\N	\N	\N	\N	f	t	3	full	\N	\N	\N	f	\N	\N	\N
16	ExaminationResult	Symptom	m2o	select-dropdown-m2o	\N	related-values	{"template":"{{Description}}"}	f	f	5	full	\N	\N	\N	t	\N	\N	\N
\.


--
-- Data for Name: directus_files; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_files (id, storage, filename_disk, filename_download, title, type, folder, uploaded_by, uploaded_on, modified_by, modified_on, charset, filesize, width, height, duration, embed, description, location, tags, metadata, focal_point_x, focal_point_y) FROM stdin;
375f3716-546b-48fa-9067-c9495c913e1f	local	375f3716-546b-48fa-9067-c9495c913e1f.jpeg	mrt-lws-fall-11-bild-d.jpeg	Mrt Lws Fall 11 Bild D	image/jpeg	cbf1a26f-99d1-4331-9f9c-4f6f41ff25d2	1e35ea82-61e8-45ff-b688-2e21a7ab8276	2024-07-02 13:56:21.811642+00	\N	2024-07-02 13:56:21.872+00	\N	51664	200	200	\N	\N	\N	\N	\N	{}	\N	\N
f2a107b2-51a4-4b8f-ab37-dbc80f308566	local	f2a107b2-51a4-4b8f-ab37-dbc80f308566.jpeg	mrt-lws-fall-8-bild-c.jpeg	Mrt Lws Fall 8 Bild C	image/jpeg	cbf1a26f-99d1-4331-9f9c-4f6f41ff25d2	1e35ea82-61e8-45ff-b688-2e21a7ab8276	2024-07-02 13:56:21.822268+00	\N	2024-07-02 13:56:21.883+00	\N	63663	200	200	\N	\N	\N	\N	\N	{}	\N	\N
4a7ced5d-cda3-4c8e-b7a9-da54f58462d4	local	4a7ced5d-cda3-4c8e-b7a9-da54f58462d4.jpeg	mrt-hws-fall-5-bild-c.jpeg	Mrt Hws Fall 5 Bild C	image/jpeg	cbf1a26f-99d1-4331-9f9c-4f6f41ff25d2	1e35ea82-61e8-45ff-b688-2e21a7ab8276	2024-07-02 13:56:20.593533+00	\N	2024-07-02 13:56:20.604+00	\N	25649	200	200	\N	\N	\N	\N	\N	{}	\N	\N
ef6b19fc-51d5-4219-8117-4d67b82c9292	local	ef6b19fc-51d5-4219-8117-4d67b82c9292.jpeg	mrt-hws-fall-7-bild-b.jpeg	Mrt Hws Fall 7 Bild B	image/jpeg	cbf1a26f-99d1-4331-9f9c-4f6f41ff25d2	1e35ea82-61e8-45ff-b688-2e21a7ab8276	2024-07-02 13:56:21.028361+00	\N	2024-07-02 13:56:21.047+00	\N	28593	198	198	\N	\N	\N	\N	\N	{}	\N	\N
d7d45e90-c7ef-4703-a506-ff6fe6d6824f	local	d7d45e90-c7ef-4703-a506-ff6fe6d6824f.jpeg	mrt-hws-fall-9-bild-b.jpeg	Mrt Hws Fall 9 Bild B	image/jpeg	cbf1a26f-99d1-4331-9f9c-4f6f41ff25d2	1e35ea82-61e8-45ff-b688-2e21a7ab8276	2024-07-02 13:56:21.035372+00	\N	2024-07-02 13:56:21.05+00	\N	24793	200	200	\N	\N	\N	\N	\N	{}	\N	\N
027bf21e-9d8f-42bc-9caa-57e594b59989	local	027bf21e-9d8f-42bc-9caa-57e594b59989.jpeg	mrt-hws-fall-4-bild-a.jpeg	Mrt Hws Fall 4 Bild A	image/jpeg	cbf1a26f-99d1-4331-9f9c-4f6f41ff25d2	1e35ea82-61e8-45ff-b688-2e21a7ab8276	2024-07-02 13:56:21.020772+00	\N	2024-07-02 13:56:21.055+00	\N	57342	200	200	\N	\N	\N	\N	\N	{}	\N	\N
a1a902a6-60cb-49a3-8784-d3c7a5db0d3c	local	a1a902a6-60cb-49a3-8784-d3c7a5db0d3c.jpeg	mrt-lws-fall-3-bild-d.jpeg	Mrt Lws Fall 3 Bild D	image/jpeg	cbf1a26f-99d1-4331-9f9c-4f6f41ff25d2	1e35ea82-61e8-45ff-b688-2e21a7ab8276	2024-07-02 13:56:21.073687+00	\N	2024-07-02 13:56:21.099+00	\N	48027	200	200	\N	\N	\N	\N	\N	{}	\N	\N
de43ecc7-3ddf-471a-824a-39ad84612370	local	de43ecc7-3ddf-471a-824a-39ad84612370.jpeg	mrt-lws-fall-6-bild-c.jpeg	Mrt Lws Fall 6 Bild C	image/jpeg	cbf1a26f-99d1-4331-9f9c-4f6f41ff25d2	1e35ea82-61e8-45ff-b688-2e21a7ab8276	2024-07-02 13:56:21.083051+00	\N	2024-07-02 13:56:21.108+00	\N	53794	200	200	\N	\N	\N	\N	\N	{}	\N	\N
ba25684d-072f-446e-b5ca-117b4a56fdf4	local	ba25684d-072f-446e-b5ca-117b4a56fdf4.jpeg	mrt-lws-fall-1-bild-e.jpeg	Mrt Lws Fall 1 Bild E	image/jpeg	cbf1a26f-99d1-4331-9f9c-4f6f41ff25d2	1e35ea82-61e8-45ff-b688-2e21a7ab8276	2024-07-02 13:56:21.064+00	4d47351f-5734-483f-b49a-8afa3747c491	2024-07-02 17:33:16.477+00	\N	41907	200	200	\N	\N	\N	\N	\N	{}	\N	\N
bdd630ff-21a7-4bed-89bc-a57fab4c6455	local	bdd630ff-21a7-4bed-89bc-a57fab4c6455.jpeg	mrt-lws-fall-12-bild-e.jpeg	Mrt Lws Fall 12 Bild E	image/jpeg	cbf1a26f-99d1-4331-9f9c-4f6f41ff25d2	1e35ea82-61e8-45ff-b688-2e21a7ab8276	2024-07-02 13:56:21.857+00	b5840c4b-7c2a-43c1-bac2-a0f5e18455aa	2024-07-03 07:56:26.711+00	\N	25155	200	200	\N	\N	\N	\N	\N	{}	\N	\N
\.


--
-- Data for Name: directus_flows; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_flows (id, name, icon, color, description, status, trigger, accountability, options, operation, date_created, user_created) FROM stdin;
385284df-f509-4fcd-80db-e03808ad55c9	ExaminationRecognize	lab_research	#6644FF	\N	active	event	all	{"type":"action","scope":["items.create"],"collections":["Examination"]}	8dfbbf3e-b940-434f-9f56-b2b49c4a3f87	2024-07-02 14:58:28.677+00	c276fc7e-1d90-4c9b-b678-86bac70c395d
ef5d1387-bef3-4b30-864c-276c3769cb7e	BlockDevice	bolt	\N	\N	active	event	all	{"type":"action","scope":["items.create"],"collections":["Examination"]}	6c606a2d-ceaf-4551-8a6e-c8de7c240a70	2024-07-02 16:27:37.622+00	1e35ea82-61e8-45ff-b688-2e21a7ab8276
\.


--
-- Data for Name: directus_folders; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_folders (id, name, parent) FROM stdin;
cbf1a26f-99d1-4331-9f9c-4f6f41ff25d2	ExaminationResults	\N
\.


--
-- Data for Name: directus_migrations; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_migrations (version, name, "timestamp") FROM stdin;
20201028A	Remove Collection Foreign Keys	2024-06-30 16:36:10.956222+00
20201029A	Remove System Relations	2024-06-30 16:36:10.964608+00
20201029B	Remove System Collections	2024-06-30 16:36:10.973426+00
20201029C	Remove System Fields	2024-06-30 16:36:10.989066+00
20201105A	Add Cascade System Relations	2024-06-30 16:36:11.073133+00
20201105B	Change Webhook URL Type	2024-06-30 16:36:11.08423+00
20210225A	Add Relations Sort Field	2024-06-30 16:36:11.095678+00
20210304A	Remove Locked Fields	2024-06-30 16:36:11.107279+00
20210312A	Webhooks Collections Text	2024-06-30 16:36:11.122077+00
20210331A	Add Refresh Interval	2024-06-30 16:36:11.127164+00
20210415A	Make Filesize Nullable	2024-06-30 16:36:11.140652+00
20210416A	Add Collections Accountability	2024-06-30 16:36:11.147309+00
20210422A	Remove Files Interface	2024-06-30 16:36:11.151702+00
20210506A	Rename Interfaces	2024-06-30 16:36:11.180611+00
20210510A	Restructure Relations	2024-06-30 16:36:11.218456+00
20210518A	Add Foreign Key Constraints	2024-06-30 16:36:11.231313+00
20210519A	Add System Fk Triggers	2024-06-30 16:36:11.280446+00
20210521A	Add Collections Icon Color	2024-06-30 16:36:11.285512+00
20210525A	Add Insights	2024-06-30 16:36:11.323856+00
20210608A	Add Deep Clone Config	2024-06-30 16:36:11.329785+00
20210626A	Change Filesize Bigint	2024-06-30 16:36:11.353422+00
20210716A	Add Conditions to Fields	2024-06-30 16:36:11.363213+00
20210721A	Add Default Folder	2024-06-30 16:36:11.390261+00
20210802A	Replace Groups	2024-06-30 16:36:11.400915+00
20210803A	Add Required to Fields	2024-06-30 16:36:11.409502+00
20210805A	Update Groups	2024-06-30 16:36:11.417091+00
20210805B	Change Image Metadata Structure	2024-06-30 16:36:11.423245+00
20210811A	Add Geometry Config	2024-06-30 16:36:11.42873+00
20210831A	Remove Limit Column	2024-06-30 16:36:11.433834+00
20210903A	Add Auth Provider	2024-06-30 16:36:11.472258+00
20210907A	Webhooks Collections Not Null	2024-06-30 16:36:11.484168+00
20210910A	Move Module Setup	2024-06-30 16:36:11.494026+00
20210920A	Webhooks URL Not Null	2024-06-30 16:36:11.50807+00
20210924A	Add Collection Organization	2024-06-30 16:36:11.515984+00
20210927A	Replace Fields Group	2024-06-30 16:36:11.528483+00
20210927B	Replace M2M Interface	2024-06-30 16:36:11.532325+00
20210929A	Rename Login Action	2024-06-30 16:36:11.536446+00
20211007A	Update Presets	2024-06-30 16:36:11.547092+00
20211009A	Add Auth Data	2024-06-30 16:36:11.551674+00
20211016A	Add Webhook Headers	2024-06-30 16:36:11.559534+00
20211103A	Set Unique to User Token	2024-06-30 16:36:11.568616+00
20211103B	Update Special Geometry	2024-06-30 16:36:11.572414+00
20211104A	Remove Collections Listing	2024-06-30 16:36:11.577769+00
20211118A	Add Notifications	2024-06-30 16:36:11.603284+00
20211211A	Add Shares	2024-06-30 16:36:11.63742+00
20211230A	Add Project Descriptor	2024-06-30 16:36:11.642606+00
20220303A	Remove Default Project Color	2024-06-30 16:36:11.655727+00
20220308A	Add Bookmark Icon and Color	2024-06-30 16:36:11.664036+00
20220314A	Add Translation Strings	2024-06-30 16:36:11.669352+00
20220322A	Rename Field Typecast Flags	2024-06-30 16:36:11.6764+00
20220323A	Add Field Validation	2024-06-30 16:36:11.687686+00
20220325A	Fix Typecast Flags	2024-06-30 16:36:11.700218+00
20220325B	Add Default Language	2024-06-30 16:36:11.718143+00
20220402A	Remove Default Value Panel Icon	2024-06-30 16:36:11.732399+00
20220429A	Add Flows	2024-06-30 16:36:11.790151+00
20220429B	Add Color to Insights Icon	2024-06-30 16:36:11.799394+00
20220429C	Drop Non Null From IP of Activity	2024-06-30 16:36:11.804603+00
20220429D	Drop Non Null From Sender of Notifications	2024-06-30 16:36:11.810578+00
20220614A	Rename Hook Trigger to Event	2024-06-30 16:36:11.815364+00
20220801A	Update Notifications Timestamp Column	2024-06-30 16:36:11.829151+00
20220802A	Add Custom Aspect Ratios	2024-06-30 16:36:11.83487+00
20220826A	Add Origin to Accountability	2024-06-30 16:36:11.843515+00
20230401A	Update Material Icons	2024-06-30 16:36:11.860128+00
20230525A	Add Preview Settings	2024-06-30 16:36:11.869629+00
20230526A	Migrate Translation Strings	2024-06-30 16:36:11.891358+00
20230721A	Require Shares Fields	2024-06-30 16:36:11.901498+00
20230823A	Add Content Versioning	2024-06-30 16:36:11.932554+00
20230927A	Themes	2024-06-30 16:36:11.963089+00
20231009A	Update CSV Fields to Text	2024-06-30 16:36:11.970233+00
20231009B	Update Panel Options	2024-06-30 16:36:11.97633+00
20231010A	Add Extensions	2024-06-30 16:36:11.987309+00
20231215A	Add Focalpoints	2024-06-30 16:36:11.994007+00
20240204A	Marketplace	2024-06-30 16:36:12.04078+00
\.


--
-- Data for Name: directus_operations; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_operations (id, name, key, type, position_x, position_y, options, resolve, reject, flow, date_created, user_created) FROM stdin;
e0fdc6b6-f17d-4de0-bc84-fcf72a1d5634	Sleep	sleep_5pu7e	sleep	21	19	{"milliseconds":"{{$last.sleepFor}}"}	eaeb79bd-3e0d-4fa5-8c6d-d607e89634e4	\N	385284df-f509-4fcd-80db-e03808ad55c9	2024-07-02 15:13:58.064+00	c276fc7e-1d90-4c9b-b678-86bac70c395d
be937172-c998-4d17-91f6-366a7041824d	Sleep	exec_vrqul	exec	3	19	{"code":"module.exports = async function(data) {\\n    const d = data.$trigger.payload.Device.Duration * 1000\\n    return {\\"sleepFor\\": d};\\n}"}	e0fdc6b6-f17d-4de0-bc84-fcf72a1d5634	\N	385284df-f509-4fcd-80db-e03808ad55c9	2024-07-02 15:13:58.069+00	c276fc7e-1d90-4c9b-b678-86bac70c395d
8dfbbf3e-b940-434f-9f56-b2b49c4a3f87	ReadDevice	read_device	item-read	19	1	{"collection":"Device","key":"{{$trigger.payload.Device.id}}","permissions":"$full"}	be937172-c998-4d17-91f6-366a7041824d	\N	385284df-f509-4fcd-80db-e03808ad55c9	2024-07-02 15:13:58.075+00	c276fc7e-1d90-4c9b-b678-86bac70c395d
55ff50d1-e298-48fb-b164-51a72be6885b	Update Data	item_update_qw93w	item-update	39	19	{"collection":"Device","permissions":"$full","key":"{{$trigger.payload.Device.id}}","payload":{"Blocked":false}}	\N	\N	ef5d1387-bef3-4b30-864c-276c3769cb7e	2024-07-02 16:28:03.619+00	1e35ea82-61e8-45ff-b688-2e21a7ab8276
d044a29c-cec3-45c7-b388-7d45b86fa3ac	Sleep	sleep_5pu7e	sleep	21	19	{"milliseconds":"{{$last.sleepFor}}"}	55ff50d1-e298-48fb-b164-51a72be6885b	\N	ef5d1387-bef3-4b30-864c-276c3769cb7e	2024-07-02 16:28:00.432+00	1e35ea82-61e8-45ff-b688-2e21a7ab8276
9107547f-90d6-4062-bb5d-3a444cc3d1a0	Sleep	exec_vrqul	exec	3	19	{"code":"module.exports = async function(data) {\\n    const d = data.$trigger.payload.Device.Duration * 1000\\n    return {\\"sleepFor\\": d};\\n}"}	d044a29c-cec3-45c7-b388-7d45b86fa3ac	\N	ef5d1387-bef3-4b30-864c-276c3769cb7e	2024-07-02 16:27:56.329+00	1e35ea82-61e8-45ff-b688-2e21a7ab8276
6c606a2d-ceaf-4551-8a6e-c8de7c240a70	Update Data	item_update_qw93w_vwfwd	item-update	20	1	{"collection":"Device","permissions":"$full","key":"{{$trigger.payload.Device.id}}","payload":{"Blocked":true},"query":{"fields":"['*']"}}	9107547f-90d6-4062-bb5d-3a444cc3d1a0	\N	ef5d1387-bef3-4b30-864c-276c3769cb7e	2024-07-02 16:30:11.996+00	1e35ea82-61e8-45ff-b688-2e21a7ab8276
eaeb79bd-3e0d-4fa5-8c6d-d607e89634e4	Update Data	item_update_qw93w	item-update	39	19	{"collection":"ExaminationResult","key":"{{$trigger.payload.ExaminationResult.id}}","permissions":"$full","payload":{"Recognized":true}}	\N	\N	385284df-f509-4fcd-80db-e03808ad55c9	2024-07-02 15:13:58.058+00	c276fc7e-1d90-4c9b-b678-86bac70c395d
\.


--
-- Data for Name: directus_panels; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_panels (id, dashboard, name, icon, color, show_header, note, type, position_x, position_y, width, height, options, date_created, user_created) FROM stdin;
\.


--
-- Data for Name: directus_permissions; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_permissions (id, role, collection, action, permissions, validation, presets, fields) FROM stdin;
25	2740e574-82f3-458b-8b3d-362d7cb87160	Patient	create	{}	{}	\N	*
26	2740e574-82f3-458b-8b3d-362d7cb87160	Patient	read	{}	{}	\N	*
27	2740e574-82f3-458b-8b3d-362d7cb87160	Patient	update	{}	{}	\N	*
28	2740e574-82f3-458b-8b3d-362d7cb87160	Patient	share	{}	{}	\N	*
29	2740e574-82f3-458b-8b3d-362d7cb87160	Patient	delete	{}	{}	\N	*
30	2740e574-82f3-458b-8b3d-362d7cb87160	Room	create	{}	{}	\N	*
31	2740e574-82f3-458b-8b3d-362d7cb87160	Room	read	{}	{}	\N	*
32	2740e574-82f3-458b-8b3d-362d7cb87160	Room	update	{}	{}	\N	*
33	2740e574-82f3-458b-8b3d-362d7cb87160	Room	delete	{}	{}	\N	*
34	2740e574-82f3-458b-8b3d-362d7cb87160	Room	share	{}	{}	\N	*
35	2740e574-82f3-458b-8b3d-362d7cb87160	Symptom	create	{}	{}	\N	*
36	2740e574-82f3-458b-8b3d-362d7cb87160	Symptom	read	{}	{}	\N	*
37	2740e574-82f3-458b-8b3d-362d7cb87160	Symptom	delete	{}	{}	\N	*
38	2740e574-82f3-458b-8b3d-362d7cb87160	Symptom	share	{}	{}	\N	*
39	2740e574-82f3-458b-8b3d-362d7cb87160	Symptom	update	{}	{}	\N	*
40	2740e574-82f3-458b-8b3d-362d7cb87160	Examination	read	{}	{}	\N	*
41	2740e574-82f3-458b-8b3d-362d7cb87160	Examination	create	{}	{}	\N	*
42	2740e574-82f3-458b-8b3d-362d7cb87160	Examination	update	{}	{}	\N	*
43	2740e574-82f3-458b-8b3d-362d7cb87160	Examination	share	{}	{}	\N	*
44	2740e574-82f3-458b-8b3d-362d7cb87160	Examination	delete	{}	{}	\N	*
45	2740e574-82f3-458b-8b3d-362d7cb87160	Device	create	{}	{}	\N	*
46	2740e574-82f3-458b-8b3d-362d7cb87160	Device	read	{}	{}	\N	*
47	2740e574-82f3-458b-8b3d-362d7cb87160	Device	update	{}	{}	\N	*
48	2740e574-82f3-458b-8b3d-362d7cb87160	Device	share	{}	{}	\N	*
49	2740e574-82f3-458b-8b3d-362d7cb87160	Device	delete	{}	{}	\N	*
50	2740e574-82f3-458b-8b3d-362d7cb87160	Symptom_Device	create	{}	{}	\N	*
51	2740e574-82f3-458b-8b3d-362d7cb87160	Symptom_Device	read	{}	{}	\N	*
52	2740e574-82f3-458b-8b3d-362d7cb87160	Symptom_Device	update	{}	{}	\N	*
53	2740e574-82f3-458b-8b3d-362d7cb87160	Symptom_Device	share	{}	{}	\N	*
54	2740e574-82f3-458b-8b3d-362d7cb87160	Symptom_Device	delete	{}	{}	\N	*
59	\N	directus_files	create	{}	{}	\N	*
60	\N	directus_files	read	{}	{}	\N	*
61	\N	directus_files	delete	{}	{}	\N	*
62	\N	directus_files	share	{}	{}	\N	*
63	\N	directus_files	update	{}	{}	\N	*
64	\N	Examination	create	{}	{}	\N	*
65	\N	Examination	read	{}	{}	\N	*
66	\N	Examination	delete	{}	{}	\N	*
67	\N	Examination	share	{}	{}	\N	*
68	\N	Examination	update	{}	{}	\N	*
69	\N	ExaminationResult	create	{}	{}	\N	*
70	\N	ExaminationResult	update	{}	{}	\N	*
71	\N	ExaminationResult	delete	{}	{}	\N	*
72	\N	ExaminationResult	share	{}	{}	\N	*
73	\N	ExaminationResult	read	{}	{}	\N	*
57	2740e574-82f3-458b-8b3d-362d7cb87160	ExaminationResult	create	{}	{}	\N	*
58	2740e574-82f3-458b-8b3d-362d7cb87160	ExaminationResult	read	{}	{}	\N	*
406	2740e574-82f3-458b-8b3d-362d7cb87160	directus_users	delete	{}	{}	\N	*
408	2740e574-82f3-458b-8b3d-362d7cb87160	directus_roles	create	{}	{}	\N	*
169	2740e574-82f3-458b-8b3d-362d7cb87160	ExaminationResult	share	{}	{}	\N	*
407	2740e574-82f3-458b-8b3d-362d7cb87160	directus_roles	update	{}	{}	\N	*
409	2740e574-82f3-458b-8b3d-362d7cb87160	directus_roles	delete	{}	{}	\N	*
405	2740e574-82f3-458b-8b3d-362d7cb87160	directus_users	share	{}	{}	\N	*
170	2740e574-82f3-458b-8b3d-362d7cb87160	ExaminationResult	update	{}	{}	\N	*
380	2740e574-82f3-458b-8b3d-362d7cb87160	directus_files	create	{}	\N	\N	*
381	2740e574-82f3-458b-8b3d-362d7cb87160	directus_files	read	{}	\N	\N	*
382	2740e574-82f3-458b-8b3d-362d7cb87160	directus_files	update	{}	\N	\N	*
383	2740e574-82f3-458b-8b3d-362d7cb87160	directus_files	delete	{}	\N	\N	*
384	2740e574-82f3-458b-8b3d-362d7cb87160	directus_dashboards	create	{}	\N	\N	*
171	2740e574-82f3-458b-8b3d-362d7cb87160	ExaminationResult	delete	{}	{}	\N	*
385	2740e574-82f3-458b-8b3d-362d7cb87160	directus_dashboards	read	{}	\N	\N	*
386	2740e574-82f3-458b-8b3d-362d7cb87160	directus_dashboards	update	{}	\N	\N	*
387	2740e574-82f3-458b-8b3d-362d7cb87160	directus_dashboards	delete	{}	\N	\N	*
388	2740e574-82f3-458b-8b3d-362d7cb87160	directus_panels	create	{}	\N	\N	*
389	2740e574-82f3-458b-8b3d-362d7cb87160	directus_panels	read	{}	\N	\N	*
390	2740e574-82f3-458b-8b3d-362d7cb87160	directus_panels	update	{}	\N	\N	*
391	2740e574-82f3-458b-8b3d-362d7cb87160	directus_panels	delete	{}	\N	\N	*
392	2740e574-82f3-458b-8b3d-362d7cb87160	directus_folders	create	{}	\N	\N	*
393	2740e574-82f3-458b-8b3d-362d7cb87160	directus_folders	read	{}	\N	\N	*
394	2740e574-82f3-458b-8b3d-362d7cb87160	directus_folders	update	{}	\N	\N	*
395	2740e574-82f3-458b-8b3d-362d7cb87160	directus_folders	delete	{}	\N	\N	\N
399	2740e574-82f3-458b-8b3d-362d7cb87160	directus_shares	read	{"_or":[{"role":{"_eq":"$CURRENT_ROLE"}},{"role":{"_null":true}}]}	\N	\N	*
400	2740e574-82f3-458b-8b3d-362d7cb87160	directus_shares	create	{}	\N	\N	*
401	2740e574-82f3-458b-8b3d-362d7cb87160	directus_shares	update	{"user_created":{"_eq":"$CURRENT_USER"}}	\N	\N	*
402	2740e574-82f3-458b-8b3d-362d7cb87160	directus_shares	delete	{"user_created":{"_eq":"$CURRENT_USER"}}	\N	\N	*
403	2740e574-82f3-458b-8b3d-362d7cb87160	directus_flows	read	{"trigger":{"_eq":"manual"}}	\N	\N	id,status,name,icon,color,options,trigger
404	2740e574-82f3-458b-8b3d-362d7cb87160	directus_users	create	{}	{}	\N	*
396	2740e574-82f3-458b-8b3d-362d7cb87160	directus_users	read	{}	{}	\N	*
397	2740e574-82f3-458b-8b3d-362d7cb87160	directus_users	update	{}	{}	\N	*
398	2740e574-82f3-458b-8b3d-362d7cb87160	directus_roles	read	{}	{}	\N	*
410	2740e574-82f3-458b-8b3d-362d7cb87160	directus_roles	share	{}	{}	\N	*
\.


--
-- Data for Name: directus_presets; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_presets (id, bookmark, "user", role, collection, search, layout, layout_query, layout_options, refresh_interval, filter, icon, color) FROM stdin;
1	\N	1e35ea82-61e8-45ff-b688-2e21a7ab8276	\N	Symptom	\N	\N	{"tabular":{"fields":["Description","Device","Name"]}}	{"tabular":{"widths":{"Description":638}}}	\N	\N	bookmark	\N
2	\N	29779c03-f7ee-4bcd-8cc9-bbf96991c576	\N	ExaminationResult	\N	\N	{"tabular":{"fields":["Bodypart","Patient","Recognized","id","Patient.Name"]}}	\N	\N	\N	bookmark	\N
5	\N	1e35ea82-61e8-45ff-b688-2e21a7ab8276	\N	Device	\N	\N	{"tabular":{"fields":["Blocked","Duration","Name","Room"]}}	{"tabular":{"widths":{"Blocked":112,"Duration":118,"Name":128}}}	\N	\N	bookmark	\N
4	\N	1e35ea82-61e8-45ff-b688-2e21a7ab8276	\N	ExaminationResult	\N	\N	{"tabular":{"fields":["Bodypart","Patient","Recognized","id"]}}	{"tabular":{"widths":{"Bodypart":222,"Patient":361,"Recognized":167}}}	\N	\N	bookmark	\N
6	\N	1e35ea82-61e8-45ff-b688-2e21a7ab8276	\N	directus_files	\N	cards	{"cards":{"sort":["-uploaded_on"],"page":1}}	{"cards":{"icon":"insert_drive_file","title":"{{ title }}","subtitle":"{{ type }} • {{ filesize }}","size":4,"imageFit":"crop"}}	\N	\N	bookmark	\N
7	\N	4d47351f-5734-483f-b49a-8afa3747c491	\N	directus_files	\N	cards	{"cards":{"sort":["-uploaded_on"],"page":1}}	{"cards":{"icon":"insert_drive_file","title":"{{ title }}","subtitle":"{{ type }} • {{ filesize }}","size":4,"imageFit":"crop"}}	\N	\N	bookmark	\N
\.


--
-- Data for Name: directus_relations; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_relations (id, many_collection, many_field, one_collection, one_field, one_collection_field, one_allowed_collections, junction_field, sort_field, one_deselect_action) FROM stdin;
1	Device	Room	Room	\N	\N	\N	\N	\N	nullify
2	Examination	Doctor	directus_users	\N	\N	\N	\N	\N	nullify
3	Examination	Device	Device	\N	\N	\N	\N	\N	nullify
4	Examination	ExaminationResult	ExaminationResult	\N	\N	\N	\N	\N	nullify
6	ExaminationResult	Patient	Patient	\N	\N	\N	\N	\N	nullify
7	ExaminationResult	Symptom	Symptom	\N	\N	\N	\N	\N	nullify
8	ExaminationResult	Image	directus_files	\N	\N	\N	\N	\N	nullify
9	Symptom_Device	Device_id	Device	\N	\N	\N	Symptom_id	\N	nullify
10	Symptom_Device	Symptom_id	Symptom	Device	\N	\N	Device_id	\N	nullify
\.


--
-- Data for Name: directus_roles; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_roles (id, name, icon, description, ip_access, enforce_tfa, admin_access, app_access) FROM stdin;
2740e574-82f3-458b-8b3d-362d7cb87160	Doctor	supervised_user_circle	\N	\N	f	f	t
\.


--
-- Data for Name: directus_settings; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_settings (id, project_name, project_url, project_color, project_logo, public_foreground, public_background, public_note, auth_login_attempts, auth_password_policy, storage_asset_transform, storage_asset_presets, custom_css, storage_default_folder, basemaps, mapbox_key, module_bar, project_descriptor, default_language, custom_aspect_ratios, public_favicon, default_appearance, default_theme_light, theme_light_overrides, default_theme_dark, theme_dark_overrides) FROM stdin;
\.


--
-- Data for Name: directus_shares; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_shares (id, name, collection, item, role, password, user_created, date_created, date_start, date_end, times_used, max_uses) FROM stdin;
\.


--
-- Data for Name: directus_translations; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_translations (id, language, key, value) FROM stdin;
\.


--
-- Data for Name: directus_versions; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_versions (id, key, name, collection, item, hash, date_created, date_updated, user_created, user_updated) FROM stdin;
\.


--
-- Data for Name: directus_webhooks; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_webhooks (id, name, method, url, status, data, actions, collections, headers) FROM stdin;
\.


--
-- Name: directus_fields_id_seq; Type: SEQUENCE SET; Schema: public; Owner: directus
--

SELECT pg_catalog.setval('public.directus_fields_id_seq', 31, true);


--
-- Name: directus_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: directus
--

SELECT pg_catalog.setval('public.directus_permissions_id_seq', 410, true);


--
-- Name: directus_presets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: directus
--

SELECT pg_catalog.setval('public.directus_presets_id_seq', 7, true);


--
-- Name: directus_relations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: directus
--

SELECT pg_catalog.setval('public.directus_relations_id_seq', 10, true);


--
-- Name: directus_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: directus
--

SELECT pg_catalog.setval('public.directus_settings_id_seq', 1, false);


--
-- Name: directus_webhooks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: directus
--

SELECT pg_catalog.setval('public.directus_webhooks_id_seq', 1, false);


--
-- Name: directus_dashboards directus_dashboards_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_dashboards
    ADD CONSTRAINT directus_dashboards_pkey PRIMARY KEY (id);


--
-- Name: directus_extensions directus_extensions_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_extensions
    ADD CONSTRAINT directus_extensions_pkey PRIMARY KEY (id);


--
-- Name: directus_fields directus_fields_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_fields
    ADD CONSTRAINT directus_fields_pkey PRIMARY KEY (id);


--
-- Name: directus_files directus_files_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_pkey PRIMARY KEY (id);


--
-- Name: directus_flows directus_flows_operation_unique; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_flows
    ADD CONSTRAINT directus_flows_operation_unique UNIQUE (operation);


--
-- Name: directus_flows directus_flows_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_flows
    ADD CONSTRAINT directus_flows_pkey PRIMARY KEY (id);


--
-- Name: directus_folders directus_folders_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_folders
    ADD CONSTRAINT directus_folders_pkey PRIMARY KEY (id);


--
-- Name: directus_migrations directus_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_migrations
    ADD CONSTRAINT directus_migrations_pkey PRIMARY KEY (version);


--
-- Name: directus_operations directus_operations_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_pkey PRIMARY KEY (id);


--
-- Name: directus_operations directus_operations_reject_unique; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_reject_unique UNIQUE (reject);


--
-- Name: directus_operations directus_operations_resolve_unique; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_resolve_unique UNIQUE (resolve);


--
-- Name: directus_panels directus_panels_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_panels
    ADD CONSTRAINT directus_panels_pkey PRIMARY KEY (id);


--
-- Name: directus_permissions directus_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_permissions
    ADD CONSTRAINT directus_permissions_pkey PRIMARY KEY (id);


--
-- Name: directus_presets directus_presets_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_presets
    ADD CONSTRAINT directus_presets_pkey PRIMARY KEY (id);


--
-- Name: directus_relations directus_relations_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_relations
    ADD CONSTRAINT directus_relations_pkey PRIMARY KEY (id);


--
-- Name: directus_roles directus_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_roles
    ADD CONSTRAINT directus_roles_pkey PRIMARY KEY (id);


--
-- Name: directus_settings directus_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_pkey PRIMARY KEY (id);


--
-- Name: directus_shares directus_shares_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_shares
    ADD CONSTRAINT directus_shares_pkey PRIMARY KEY (id);


--
-- Name: directus_translations directus_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_translations
    ADD CONSTRAINT directus_translations_pkey PRIMARY KEY (id);


--
-- Name: directus_versions directus_versions_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_versions
    ADD CONSTRAINT directus_versions_pkey PRIMARY KEY (id);


--
-- Name: directus_webhooks directus_webhooks_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_webhooks
    ADD CONSTRAINT directus_webhooks_pkey PRIMARY KEY (id);


--
-- Name: directus_dashboards directus_dashboards_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_dashboards
    ADD CONSTRAINT directus_dashboards_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- Name: directus_files directus_files_folder_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_folder_foreign FOREIGN KEY (folder) REFERENCES public.directus_folders(id) ON DELETE SET NULL;


--
-- Name: directus_files directus_files_modified_by_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_modified_by_foreign FOREIGN KEY (modified_by) REFERENCES public.directus_users(id);


--
-- Name: directus_files directus_files_uploaded_by_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_uploaded_by_foreign FOREIGN KEY (uploaded_by) REFERENCES public.directus_users(id);


--
-- Name: directus_flows directus_flows_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_flows
    ADD CONSTRAINT directus_flows_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- Name: directus_folders directus_folders_parent_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_folders
    ADD CONSTRAINT directus_folders_parent_foreign FOREIGN KEY (parent) REFERENCES public.directus_folders(id);


--
-- Name: directus_operations directus_operations_flow_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_flow_foreign FOREIGN KEY (flow) REFERENCES public.directus_flows(id) ON DELETE CASCADE;


--
-- Name: directus_operations directus_operations_reject_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_reject_foreign FOREIGN KEY (reject) REFERENCES public.directus_operations(id);


--
-- Name: directus_operations directus_operations_resolve_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_resolve_foreign FOREIGN KEY (resolve) REFERENCES public.directus_operations(id);


--
-- Name: directus_operations directus_operations_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- Name: directus_panels directus_panels_dashboard_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_panels
    ADD CONSTRAINT directus_panels_dashboard_foreign FOREIGN KEY (dashboard) REFERENCES public.directus_dashboards(id) ON DELETE CASCADE;


--
-- Name: directus_panels directus_panels_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_panels
    ADD CONSTRAINT directus_panels_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- Name: directus_permissions directus_permissions_role_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_permissions
    ADD CONSTRAINT directus_permissions_role_foreign FOREIGN KEY (role) REFERENCES public.directus_roles(id) ON DELETE CASCADE;


--
-- Name: directus_presets directus_presets_role_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_presets
    ADD CONSTRAINT directus_presets_role_foreign FOREIGN KEY (role) REFERENCES public.directus_roles(id) ON DELETE CASCADE;


--
-- Name: directus_presets directus_presets_user_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_presets
    ADD CONSTRAINT directus_presets_user_foreign FOREIGN KEY ("user") REFERENCES public.directus_users(id) ON DELETE CASCADE;


--
-- Name: directus_settings directus_settings_project_logo_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_project_logo_foreign FOREIGN KEY (project_logo) REFERENCES public.directus_files(id);


--
-- Name: directus_settings directus_settings_public_background_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_public_background_foreign FOREIGN KEY (public_background) REFERENCES public.directus_files(id);


--
-- Name: directus_settings directus_settings_public_favicon_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_public_favicon_foreign FOREIGN KEY (public_favicon) REFERENCES public.directus_files(id);


--
-- Name: directus_settings directus_settings_public_foreground_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_public_foreground_foreign FOREIGN KEY (public_foreground) REFERENCES public.directus_files(id);


--
-- Name: directus_settings directus_settings_storage_default_folder_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_storage_default_folder_foreign FOREIGN KEY (storage_default_folder) REFERENCES public.directus_folders(id) ON DELETE SET NULL;


--
-- Name: directus_shares directus_shares_collection_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_shares
    ADD CONSTRAINT directus_shares_collection_foreign FOREIGN KEY (collection) REFERENCES public.directus_collections(collection) ON DELETE CASCADE;


--
-- Name: directus_shares directus_shares_role_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_shares
    ADD CONSTRAINT directus_shares_role_foreign FOREIGN KEY (role) REFERENCES public.directus_roles(id) ON DELETE CASCADE;


--
-- Name: directus_shares directus_shares_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_shares
    ADD CONSTRAINT directus_shares_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- Name: directus_versions directus_versions_collection_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_versions
    ADD CONSTRAINT directus_versions_collection_foreign FOREIGN KEY (collection) REFERENCES public.directus_collections(collection) ON DELETE CASCADE;


--
-- Name: directus_versions directus_versions_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_versions
    ADD CONSTRAINT directus_versions_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- Name: directus_versions directus_versions_user_updated_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_versions
    ADD CONSTRAINT directus_versions_user_updated_foreign FOREIGN KEY (user_updated) REFERENCES public.directus_users(id);


--
-- PostgreSQL database dump complete
--

