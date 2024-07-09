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

ALTER TABLE ONLY public."Symptom_Device" DROP CONSTRAINT symptom_device_symptom_id_foreign;
ALTER TABLE ONLY public."Symptom_Device" DROP CONSTRAINT symptom_device_device_id_foreign;
ALTER TABLE ONLY public."ExaminationResult" DROP CONSTRAINT examinationresult_symptom_foreign;
ALTER TABLE ONLY public."ExaminationResult" DROP CONSTRAINT examinationresult_patient_foreign;
ALTER TABLE ONLY public."ExaminationResult" DROP CONSTRAINT examinationresult_image_foreign;
ALTER TABLE ONLY public."Examination" DROP CONSTRAINT examination_examinationresult_foreign;
ALTER TABLE ONLY public."Examination" DROP CONSTRAINT examination_doctor_foreign;
ALTER TABLE ONLY public."Examination" DROP CONSTRAINT examination_device_foreign;
ALTER TABLE ONLY public.directus_users DROP CONSTRAINT directus_users_role_foreign;
ALTER TABLE ONLY public."Device" DROP CONSTRAINT device_room_foreign;
ALTER TABLE ONLY public.directus_users DROP CONSTRAINT directus_users_token_unique;
ALTER TABLE ONLY public.directus_users DROP CONSTRAINT directus_users_pkey;
ALTER TABLE ONLY public.directus_users DROP CONSTRAINT directus_users_external_identifier_unique;
ALTER TABLE ONLY public.directus_users DROP CONSTRAINT directus_users_email_unique;
ALTER TABLE ONLY public."Symptom" DROP CONSTRAINT "Symptom_pkey";
ALTER TABLE ONLY public."Symptom_Device" DROP CONSTRAINT "Symptom_Device_pkey";
ALTER TABLE ONLY public."Room" DROP CONSTRAINT "Room_pkey";
ALTER TABLE ONLY public."Patient" DROP CONSTRAINT "Patient_pkey";
ALTER TABLE ONLY public."Examination" DROP CONSTRAINT "Examination_pkey";
ALTER TABLE ONLY public."ExaminationResult" DROP CONSTRAINT "ExaminationResult_pkey";
ALTER TABLE ONLY public."Device" DROP CONSTRAINT "Device_pkey";
ALTER TABLE public."Symptom_Device" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public."Symptom" ALTER COLUMN id DROP DEFAULT;
DROP SEQUENCE public.directus_webhooks_id_seq;
DROP TABLE public.directus_users;
DROP SEQUENCE public.directus_settings_id_seq;
DROP SEQUENCE public.directus_revisions_id_seq;
DROP SEQUENCE public.directus_relations_id_seq;
DROP SEQUENCE public.directus_presets_id_seq;
DROP SEQUENCE public.directus_permissions_id_seq;
DROP SEQUENCE public.directus_notifications_id_seq;
DROP SEQUENCE public.directus_fields_id_seq;
DROP SEQUENCE public.directus_activity_id_seq;
DROP SEQUENCE public."Symptom_id_seq";
DROP SEQUENCE public."Symptom_Device_id_seq";
DROP TABLE public."Symptom_Device";
DROP TABLE public."Symptom";
DROP TABLE public."Room";
DROP TABLE public."Patient";
DROP TABLE public."ExaminationResult";
DROP TABLE public."Examination";
DROP TABLE public."Device";
SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: Device; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public."Device" (
    id uuid NOT NULL,
    "Name" character varying(255) DEFAULT NULL::character varying,
    "Room" uuid,
    "Duration" integer,
    "Blocked" boolean DEFAULT false
);


ALTER TABLE public."Device" OWNER TO directus;

--
-- Name: Examination; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public."Examination" (
    id uuid NOT NULL,
    "Doctor" uuid,
    "Device" uuid,
    "StartTime" timestamp without time zone,
    "ExaminationResult" uuid
);


ALTER TABLE public."Examination" OWNER TO directus;

--
-- Name: ExaminationResult; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public."ExaminationResult" (
    id uuid NOT NULL,
    "Bodypart" character varying(255) DEFAULT NULL::character varying,
    "Recognized" boolean DEFAULT false,
    "Patient" uuid,
    "Symptom" integer,
    "Image" uuid
);


ALTER TABLE public."ExaminationResult" OWNER TO directus;

--
-- Name: Patient; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public."Patient" (
    id uuid NOT NULL,
    "Name" character varying(255) DEFAULT NULL::character varying,
    "Age" integer,
    "Weight" real,
    "BloodType" character varying(255) DEFAULT NULL::character varying
);


ALTER TABLE public."Patient" OWNER TO directus;

--
-- Name: Room; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public."Room" (
    id uuid NOT NULL,
    "Name" character varying(255) DEFAULT NULL::character varying
);


ALTER TABLE public."Room" OWNER TO directus;

--
-- Name: Symptom; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public."Symptom" (
    id integer NOT NULL,
    "Name" character varying(255) DEFAULT NULL::character varying,
    "Description" character varying(255) DEFAULT NULL::character varying
);


ALTER TABLE public."Symptom" OWNER TO directus;

--
-- Name: Symptom_Device; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public."Symptom_Device" (
    id integer NOT NULL,
    "Symptom_id" integer,
    "Device_id" uuid
);


ALTER TABLE public."Symptom_Device" OWNER TO directus;

--
-- Name: Symptom_Device_id_seq; Type: SEQUENCE; Schema: public; Owner: directus
--

CREATE SEQUENCE public."Symptom_Device_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Symptom_Device_id_seq" OWNER TO directus;

--
-- Name: Symptom_Device_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: directus
--

ALTER SEQUENCE public."Symptom_Device_id_seq" OWNED BY public."Symptom_Device".id;


--
-- Name: Symptom_id_seq; Type: SEQUENCE; Schema: public; Owner: directus
--

CREATE SEQUENCE public."Symptom_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Symptom_id_seq" OWNER TO directus;

--
-- Name: Symptom_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: directus
--

ALTER SEQUENCE public."Symptom_id_seq" OWNED BY public."Symptom".id;


--
-- Name: directus_activity_id_seq; Type: SEQUENCE; Schema: public; Owner: directus
--

CREATE SEQUENCE public.directus_activity_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.directus_activity_id_seq OWNER TO directus;

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
-- Name: directus_notifications_id_seq; Type: SEQUENCE; Schema: public; Owner: directus
--

CREATE SEQUENCE public.directus_notifications_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.directus_notifications_id_seq OWNER TO directus;

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
-- Name: directus_revisions_id_seq; Type: SEQUENCE; Schema: public; Owner: directus
--

CREATE SEQUENCE public.directus_revisions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.directus_revisions_id_seq OWNER TO directus;

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
-- Name: directus_users; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_users (
    id uuid NOT NULL,
    first_name character varying(50),
    last_name character varying(50),
    email character varying(128),
    password character varying(255),
    location character varying(255),
    title character varying(50),
    description text,
    tags json,
    avatar uuid,
    language character varying(255) DEFAULT NULL::character varying,
    tfa_secret character varying(255),
    status character varying(16) DEFAULT 'active'::character varying NOT NULL,
    role uuid,
    token character varying(255),
    last_access timestamp with time zone,
    last_page character varying(255),
    provider character varying(128) DEFAULT 'default'::character varying NOT NULL,
    external_identifier character varying(255),
    auth_data json,
    email_notifications boolean DEFAULT true,
    appearance character varying(255),
    theme_dark character varying(255),
    theme_light character varying(255),
    theme_light_overrides json,
    theme_dark_overrides json
);


ALTER TABLE public.directus_users OWNER TO directus;

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
-- Name: Symptom id; Type: DEFAULT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public."Symptom" ALTER COLUMN id SET DEFAULT nextval('public."Symptom_id_seq"'::regclass);


--
-- Name: Symptom_Device id; Type: DEFAULT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public."Symptom_Device" ALTER COLUMN id SET DEFAULT nextval('public."Symptom_Device_id_seq"'::regclass);


--
-- Data for Name: Device; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public."Device" (id, "Name", "Room", "Duration", "Blocked") FROM stdin;
67fe0d5d-9c1b-41d3-ba55-a40ecc8c75f7	CT	0faa9d66-c10f-453c-ace5-6d32a2e3214f	15	f
6ad44755-a074-4133-acee-5d03c745f062	CT	3d6f22f3-ceaf-4a06-a271-c396c8788d4c	15	f
1003a1f9-3660-430e-8fa4-2d3e1ee2639a	Röntgengerät	d17c6caa-864d-47c5-804e-df0e26a45b25	60	f
b642c6cc-b322-4b9e-b78f-8fd9937db83f	MRT 2	c4b049f4-b30c-45f0-a226-f68496f62dbc	20	f
4f2bf8ca-0443-4186-b052-4ca58162d924	MRT 1	c16ca299-e061-4d25-8c94-f7dffe11828b	20	f
\.


--
-- Data for Name: Examination; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public."Examination" (id, "Doctor", "Device", "StartTime", "ExaminationResult") FROM stdin;
\.


--
-- Data for Name: ExaminationResult; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public."ExaminationResult" (id, "Bodypart", "Recognized", "Patient", "Symptom", "Image") FROM stdin;
0b79a1cb-8e8e-44ed-b495-db9cfb062682	seitlicher Rücken	f	c4dfbc85-e714-49be-9d52-fa98b395531c	3	f2a107b2-51a4-4b8f-ab37-dbc80f308566
8851f262-482b-4c79-9674-76959e0fd6da	Kopf	f	777b808a-1b35-472b-9c90-2bc85f8c822f	4	a1a902a6-60cb-49a3-8784-d3c7a5db0d3c
b2751082-71b1-43be-828f-6a2e1638d723	Oberschenkel	f	47d8210e-ba8b-41b0-be66-77772b710e37	2	d7d45e90-c7ef-4703-a506-ff6fe6d6824f
b50fc661-956a-4be6-96d7-a78bcd883519	Brust	f	cbb5c262-21f1-4e3d-b137-4508da8f2fbc	1	ef6b19fc-51d5-4219-8117-4d67b82c9292
cd9f507c-75c0-4074-87c8-d2ebfa21d424	seitlicher Rücken	f	c7508802-92e2-4359-8f87-161bc53e71e3	3	027bf21e-9d8f-42bc-9caa-57e594b59989
23779f58-f6a9-46b4-9c5a-14060f2bbe92	Kopf	f	8366ec52-6602-42f9-a9c2-52a631962954	4	375f3716-546b-48fa-9067-c9495c913e1f
6aa34ad4-eb7b-42ef-96a9-d947a48b7e4f	Brust	f	15059091-6197-4788-9fa5-a80ce52e08be	1	de43ecc7-3ddf-471a-824a-39ad84612370
f948bb7a-97e8-49e0-8a7e-9e9451425b6e	Oberschenkel	f	80795dd7-6fc4-4892-a78e-4c36989b4e53	2	4a7ced5d-cda3-4c8e-b7a9-da54f58462d4
8f92f2a5-efb5-44fd-a691-24aa8f0c816d	Rücken	f	b568ef53-6f2a-4733-ba42-0339f9503bed	5	ba25684d-072f-446e-b5ca-117b4a56fdf4
020b100b-9294-4631-9451-c525af59cc84	Rücken	f	adc58d8c-f450-4c2d-9f55-a1b69dd7ac54	5	bdd630ff-21a7-4bed-89bc-a57fab4c6455
\.


--
-- Data for Name: Patient; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public."Patient" (id, "Name", "Age", "Weight", "BloodType") FROM stdin;
8366ec52-6602-42f9-a9c2-52a631962954	Jürgen Schmidt	55	90	B
777b808a-1b35-472b-9c90-2bc85f8c822f	Mario Anha	42	69	0
47d8210e-ba8b-41b0-be66-77772b710e37	Manfred Rot	36	65	A
cbb5c262-21f1-4e3d-b137-4508da8f2fbc	Susanne Wagner	60	55	B
80795dd7-6fc4-4892-a78e-4c36989b4e53	Jennifer Meier	24	60	AB
c4dfbc85-e714-49be-9d52-fa98b395531c	Ruben Tuben	70	75	0
15059091-6197-4788-9fa5-a80ce52e08be	Eva Musterfrau	62	62	AB
c7508802-92e2-4359-8f87-161bc53e71e3	Max Mustermann	33	77	0
b568ef53-6f2a-4733-ba42-0339f9503bed	Torsten Müller	32	80	AB
adc58d8c-f450-4c2d-9f55-a1b69dd7ac54	Olaf Scholz	66	82	A
\.


--
-- Data for Name: Room; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public."Room" (id, "Name") FROM stdin;
d17c6caa-864d-47c5-804e-df0e26a45b25	102
3d6f22f3-ceaf-4a06-a271-c396c8788d4c	103
0faa9d66-c10f-453c-ace5-6d32a2e3214f	104
c4b049f4-b30c-45f0-a226-f68496f62dbc	101
c16ca299-e061-4d25-8c94-f7dffe11828b	105
\.


--
-- Data for Name: Symptom; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public."Symptom" (id, "Name", "Description") FROM stdin;
1	Knoten	Knoten oder Schwellungen in der Achselhöhle
2	Fehlstellung 	Schmerzen, Fehlstellung, Schwellung bzw. Bewegungseinschränkung
3	Schmerz im Rückenbereich	dumpfer Schmerz im seitlichen Rückenbereich
4	epileptische Krampfanfälle	Neu auftretende epileptische Krampfanfälle
5	Schmerzen mittlerer Rücken	brennende/stechende Rückenschmerzen,  die über Lendenwirbel hinausstrahlen.
\.


--
-- Data for Name: Symptom_Device; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public."Symptom_Device" (id, "Symptom_id", "Device_id") FROM stdin;
1	1	b642c6cc-b322-4b9e-b78f-8fd9937db83f
2	2	1003a1f9-3660-430e-8fa4-2d3e1ee2639a
3	3	6ad44755-a074-4133-acee-5d03c745f062
4	4	67fe0d5d-9c1b-41d3-ba55-a40ecc8c75f7
5	4	6ad44755-a074-4133-acee-5d03c745f062
9	3	4f2bf8ca-0443-4186-b052-4ca58162d924
6	\N	67fe0d5d-9c1b-41d3-ba55-a40ecc8c75f7
7	5	4f2bf8ca-0443-4186-b052-4ca58162d924
8	5	b642c6cc-b322-4b9e-b78f-8fd9937db83f
\.


--
-- Data for Name: directus_users; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_users (id, first_name, last_name, email, password, location, title, description, tags, avatar, language, tfa_secret, status, role, token, last_access, last_page, provider, external_identifier, auth_data, email_notifications, appearance, theme_dark, theme_light, theme_light_overrides, theme_dark_overrides) FROM stdin;
d3b03538-c39e-43e6-acbc-73cdda39f912	Albert	Tross	a.tross@manv.de	$argon2id$v=19$m=65536,t=3,p=4$AobNePjI0h/RXUQL6D6Trg$NLhscrWgDwEUKlHmlxkcCIn5ZohVfF6wBia1+CC6OsQ	\N	Dr	\N	\N	\N	\N	\N	active	2740e574-82f3-458b-8b3d-362d7cb87160	\N	\N	\N	default	\N	\N	t	\N	\N	\N	\N	\N
b5840c4b-7c2a-43c1-bac2-a0f5e18455aa	Anna	Nass	a.nass@manv.de	$argon2id$v=19$m=65536,t=3,p=4$/dqKJIyxf1GoZimWUOBaxA$n/2mH7TDSRtOn3zr2tZ2liPfWWigBXDF2zMvNQPbD7A	\N	Dr	\N	\N	\N	\N	\N	active	2740e574-82f3-458b-8b3d-362d7cb87160	\N	\N	\N	default	\N	\N	t	\N	\N	\N	\N	\N
a2353ff7-798f-4d49-a267-f1326929b1b0	Karl	Kopf	k.kopf@manv.de	$argon2id$v=19$m=65536,t=3,p=4$LHej/79DJjl5cE6gjjDYew$bgmK3wvjs+Vq5brlMY3n7U1bQjdpOaTC8Uqy6nqnho8	\N	Dr	\N	\N	\N	\N	\N	active	2740e574-82f3-458b-8b3d-362d7cb87160	\N	\N	\N	default	\N	\N	t	\N	\N	\N	\N	\N
d4d78b4d-ce52-4ac6-a3cd-95b16fc72240	Klara	Himmel	k.himmel@manv.de	$argon2id$v=19$m=65536,t=3,p=4$sRFKqp6XFlWP23yHQCqh0g$jjiJgvqVvhlUBK7kqTd9LWm+SUyXXdTtXdF0e6qhjQg	\N	\N	\N	\N	\N	\N	\N	active	2740e574-82f3-458b-8b3d-362d7cb87160	\N	\N	\N	default	\N	\N	t	\N	\N	\N	\N	\N
29779c03-f7ee-4bcd-8cc9-bbf96991c576	Jannis	Köppel	jannis@manv.de	$argon2id$v=19$m=65536,t=3,p=4$k8TM4xxPStEut3JZCQpWgQ$7IpEaZCedi/3QUZfuQK8Wf4uyyhwOwE1rQ3Q0JaCe74	Sporch	Dr.	\N	\N	db6a0cc4-0572-49b9-9d99-48e1c1c642d0	\N	\N	active	3d6fb4d7-97ec-4e67-9d49-cad7b1e85a41	\N	2024-07-01 09:35:06.625+00	/content/ExaminationResult	default	\N	\N	t	\N	\N	\N	\N	\N
c276fc7e-1d90-4c9b-b678-86bac70c395d	Valerij	Rube	valerij@manv.de	$argon2id$v=19$m=65536,t=3,p=4$Wjt89h/g+h66VklA7XkmPg$HixJlyUe6Ls3ELiHhNDZ06epp8/v+eOctqmMDu1GRVk	\N	\N	\N	\N	\N	\N	\N	active	3d6fb4d7-97ec-4e67-9d49-cad7b1e85a41	\N	2024-07-02 16:06:27.122+00	/content/ExaminationResult/f948bb7a-97e8-49e0-8a7e-9e9451425b6e	default	\N	\N	t	\N	\N	\N	\N	\N
1e35ea82-61e8-45ff-b688-2e21a7ab8276	Vincent	Rittner	vincent@manv.de	$argon2id$v=19$m=65536,t=3,p=4$Wd8AvCOVsZ+Qu+IITwAzbg$oj8aBJfNCm/Ybnxy3DRNDzf7zKUYvcw211AyGzXf7X0	\N	\N	\N	\N	\N	\N	\N	active	3d6fb4d7-97ec-4e67-9d49-cad7b1e85a41	\N	2024-07-02 15:52:09.062+00	/content/Examination	default	\N	\N	t	\N	\N	\N	\N	\N
\.


--
-- Name: Symptom_Device_id_seq; Type: SEQUENCE SET; Schema: public; Owner: directus
--

SELECT pg_catalog.setval('public."Symptom_Device_id_seq"', 9, true);


--
-- Name: Symptom_id_seq; Type: SEQUENCE SET; Schema: public; Owner: directus
--

SELECT pg_catalog.setval('public."Symptom_id_seq"', 5, true);


--
-- Name: directus_activity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: directus
--

SELECT pg_catalog.setval('public.directus_activity_id_seq', 524, true);


--
-- Name: directus_fields_id_seq; Type: SEQUENCE SET; Schema: public; Owner: directus
--

SELECT pg_catalog.setval('public.directus_fields_id_seq', 31, true);


--
-- Name: directus_notifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: directus
--

SELECT pg_catalog.setval('public.directus_notifications_id_seq', 1, false);


--
-- Name: directus_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: directus
--

SELECT pg_catalog.setval('public.directus_permissions_id_seq', 63, true);


--
-- Name: directus_presets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: directus
--

SELECT pg_catalog.setval('public.directus_presets_id_seq', 7, true);


--
-- Name: directus_relations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: directus
--

SELECT pg_catalog.setval('public.directus_relations_id_seq', 10, true);


--
-- Name: directus_revisions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: directus
--

SELECT pg_catalog.setval('public.directus_revisions_id_seq', 466, true);


--
-- Name: directus_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: directus
--

SELECT pg_catalog.setval('public.directus_settings_id_seq', 1, false);


--
-- Name: directus_webhooks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: directus
--

SELECT pg_catalog.setval('public.directus_webhooks_id_seq', 1, false);


--
-- Name: Device Device_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public."Device"
    ADD CONSTRAINT "Device_pkey" PRIMARY KEY (id);


--
-- Name: ExaminationResult ExaminationResult_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public."ExaminationResult"
    ADD CONSTRAINT "ExaminationResult_pkey" PRIMARY KEY (id);


--
-- Name: Examination Examination_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public."Examination"
    ADD CONSTRAINT "Examination_pkey" PRIMARY KEY (id);


--
-- Name: Patient Patient_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public."Patient"
    ADD CONSTRAINT "Patient_pkey" PRIMARY KEY (id);


--
-- Name: Room Room_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public."Room"
    ADD CONSTRAINT "Room_pkey" PRIMARY KEY (id);


--
-- Name: Symptom_Device Symptom_Device_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public."Symptom_Device"
    ADD CONSTRAINT "Symptom_Device_pkey" PRIMARY KEY (id);


--
-- Name: Symptom Symptom_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public."Symptom"
    ADD CONSTRAINT "Symptom_pkey" PRIMARY KEY (id);


--
-- Name: directus_users directus_users_email_unique; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_email_unique UNIQUE (email);


--
-- Name: directus_users directus_users_external_identifier_unique; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_external_identifier_unique UNIQUE (external_identifier);


--
-- Name: directus_users directus_users_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_pkey PRIMARY KEY (id);


--
-- Name: directus_users directus_users_token_unique; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_token_unique UNIQUE (token);


--
-- Name: Device device_room_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public."Device"
    ADD CONSTRAINT device_room_foreign FOREIGN KEY ("Room") REFERENCES public."Room"(id) ON DELETE SET NULL;


--
-- Name: directus_users directus_users_role_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_role_foreign FOREIGN KEY (role) REFERENCES public.directus_roles(id) ON DELETE SET NULL;


--
-- Name: Examination examination_device_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public."Examination"
    ADD CONSTRAINT examination_device_foreign FOREIGN KEY ("Device") REFERENCES public."Device"(id) ON DELETE SET NULL;


--
-- Name: Examination examination_doctor_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public."Examination"
    ADD CONSTRAINT examination_doctor_foreign FOREIGN KEY ("Doctor") REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- Name: Examination examination_examinationresult_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public."Examination"
    ADD CONSTRAINT examination_examinationresult_foreign FOREIGN KEY ("ExaminationResult") REFERENCES public."ExaminationResult"(id) ON DELETE SET NULL;


--
-- Name: ExaminationResult examinationresult_image_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public."ExaminationResult"
    ADD CONSTRAINT examinationresult_image_foreign FOREIGN KEY ("Image") REFERENCES public.directus_files(id) ON DELETE SET NULL;


--
-- Name: ExaminationResult examinationresult_patient_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public."ExaminationResult"
    ADD CONSTRAINT examinationresult_patient_foreign FOREIGN KEY ("Patient") REFERENCES public."Patient"(id) ON DELETE SET NULL;


--
-- Name: ExaminationResult examinationresult_symptom_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public."ExaminationResult"
    ADD CONSTRAINT examinationresult_symptom_foreign FOREIGN KEY ("Symptom") REFERENCES public."Symptom"(id) ON DELETE SET NULL;


--
-- Name: Symptom_Device symptom_device_device_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public."Symptom_Device"
    ADD CONSTRAINT symptom_device_device_id_foreign FOREIGN KEY ("Device_id") REFERENCES public."Device"(id) ON DELETE SET NULL;


--
-- Name: Symptom_Device symptom_device_symptom_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public."Symptom_Device"
    ADD CONSTRAINT symptom_device_symptom_id_foreign FOREIGN KEY ("Symptom_id") REFERENCES public."Symptom"(id) ON DELETE SET NULL;


--
-- PostgreSQL database dump complete
--

