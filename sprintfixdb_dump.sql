--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.2

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
-- Name: customer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer (
    customer_id integer NOT NULL,
    customer_name text NOT NULL,
    customer_email text NOT NULL,
    customer_phone text NOT NULL
);


ALTER TABLE public.customer OWNER TO postgres;

--
-- Name: customer_customer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customer_customer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customer_customer_id_seq OWNER TO postgres;

--
-- Name: customer_customer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customer_customer_id_seq OWNED BY public.customer.customer_id;


--
-- Name: customer_request; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer_request (
    id integer NOT NULL,
    customer_id integer NOT NULL,
    technician_id integer NOT NULL,
    service_id integer NOT NULL,
    request_status character varying(50) NOT NULL,
    request_date timestamp without time zone NOT NULL
);


ALTER TABLE public.customer_request OWNER TO postgres;

--
-- Name: customer_request_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customer_request_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customer_request_id_seq OWNER TO postgres;

--
-- Name: customer_request_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customer_request_id_seq OWNED BY public.customer_request.id;


--
-- Name: listing_services; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.listing_services (
    id integer NOT NULL,
    technician_id integer NOT NULL,
    service_name character varying(100) NOT NULL,
    service_description character varying(255) NOT NULL,
    service_cost numeric NOT NULL
);


ALTER TABLE public.listing_services OWNER TO postgres;

--
-- Name: listing_services_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.listing_services_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.listing_services_id_seq OWNER TO postgres;

--
-- Name: listing_services_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.listing_services_id_seq OWNED BY public.listing_services.id;


--
-- Name: payment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payment (
    id integer NOT NULL,
    customer_id integer NOT NULL,
    technician_id integer NOT NULL,
    service_id integer NOT NULL,
    amount numeric NOT NULL,
    payment_status character varying(50) NOT NULL,
    payment_date timestamp without time zone NOT NULL
);


ALTER TABLE public.payment OWNER TO postgres;

--
-- Name: payment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.payment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.payment_id_seq OWNER TO postgres;

--
-- Name: payment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.payment_id_seq OWNED BY public.payment.id;


--
-- Name: pick_up_and_delivery; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pick_up_and_delivery (
    id integer NOT NULL,
    customer_id integer NOT NULL,
    technician_id integer NOT NULL,
    pick_up_location character varying(100) NOT NULL,
    delivery_location character varying(100) NOT NULL,
    pick_up_date timestamp without time zone NOT NULL,
    delivery_date timestamp without time zone NOT NULL,
    delivery_status character varying(50) NOT NULL
);


ALTER TABLE public.pick_up_and_delivery OWNER TO postgres;

--
-- Name: pick_up_and_delivery_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pick_up_and_delivery_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pick_up_and_delivery_id_seq OWNER TO postgres;

--
-- Name: pick_up_and_delivery_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pick_up_and_delivery_id_seq OWNED BY public.pick_up_and_delivery.id;


--
-- Name: pickup_and_delivery; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pickup_and_delivery (
    id integer NOT NULL,
    customer_id integer NOT NULL,
    technician_id integer NOT NULL,
    pickup_location character varying(100) NOT NULL,
    delivery_location character varying(100) NOT NULL,
    pickup_date timestamp without time zone NOT NULL,
    delivery_date timestamp without time zone NOT NULL,
    delivery_status character varying(50) NOT NULL
);


ALTER TABLE public.pickup_and_delivery OWNER TO postgres;

--
-- Name: pickup_and_delivery_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pickup_and_delivery_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pickup_and_delivery_id_seq OWNER TO postgres;

--
-- Name: pickup_and_delivery_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pickup_and_delivery_id_seq OWNED BY public.pickup_and_delivery.id;


--
-- Name: service; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.service (
    service_id integer NOT NULL,
    technician_id integer NOT NULL,
    customer_id integer NOT NULL,
    service_type text NOT NULL,
    service_description text NOT NULL,
    service_date timestamp without time zone NOT NULL,
    service_status text NOT NULL
);


ALTER TABLE public.service OWNER TO postgres;

--
-- Name: service_service_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.service_service_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.service_service_id_seq OWNER TO postgres;

--
-- Name: service_service_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.service_service_id_seq OWNED BY public.service.service_id;


--
-- Name: service_status; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.service_status (
    status_id integer NOT NULL,
    status_name text NOT NULL
);


ALTER TABLE public.service_status OWNER TO postgres;

--
-- Name: service_status_status_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.service_status_status_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.service_status_status_id_seq OWNER TO postgres;

--
-- Name: service_status_status_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.service_status_status_id_seq OWNED BY public.service_status.status_id;


--
-- Name: technician; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.technician (
    technician_id integer NOT NULL,
    technician_name text NOT NULL,
    technician_email text NOT NULL,
    technician_phone text NOT NULL
);


ALTER TABLE public.technician OWNER TO postgres;

--
-- Name: technician_registration; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.technician_registration (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    email character varying(100) NOT NULL,
    password character varying(100) NOT NULL,
    phone_number character varying(20) NOT NULL,
    address character varying(100) NOT NULL,
    date_created timestamp without time zone NOT NULL,
    last_login timestamp without time zone
);


ALTER TABLE public.technician_registration OWNER TO postgres;

--
-- Name: technician_registration_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.technician_registration_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.technician_registration_id_seq OWNER TO postgres;

--
-- Name: technician_registration_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.technician_registration_id_seq OWNED BY public.technician_registration.id;


--
-- Name: technician_technician_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.technician_technician_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.technician_technician_id_seq OWNER TO postgres;

--
-- Name: technician_technician_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.technician_technician_id_seq OWNED BY public.technician.technician_id;


--
-- Name: tracking_service; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tracking_service (
    id integer NOT NULL,
    customer_id integer NOT NULL,
    technician_id integer NOT NULL,
    service_id integer NOT NULL,
    tracking_status character varying(50) NOT NULL,
    tracking_date timestamp without time zone NOT NULL
);


ALTER TABLE public.tracking_service OWNER TO postgres;

--
-- Name: tracking_service_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tracking_service_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tracking_service_id_seq OWNER TO postgres;

--
-- Name: tracking_service_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tracking_service_id_seq OWNED BY public.tracking_service.id;


--
-- Name: uploading_material; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.uploading_material (
    id integer NOT NULL,
    technician_id integer NOT NULL,
    material_name character varying(100) NOT NULL,
    material_description character varying(255) NOT NULL,
    material_image character varying(255) NOT NULL
);


ALTER TABLE public.uploading_material OWNER TO postgres;

--
-- Name: uploading_material_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.uploading_material_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.uploading_material_id_seq OWNER TO postgres;

--
-- Name: uploading_material_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.uploading_material_id_seq OWNED BY public.uploading_material.id;


--
-- Name: user_registration; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_registration (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    email character varying(100) NOT NULL,
    password character varying(100) NOT NULL,
    phone_number character varying(20) NOT NULL,
    address character varying(100) NOT NULL,
    date_created timestamp without time zone NOT NULL,
    last_login timestamp without time zone
);


ALTER TABLE public.user_registration OWNER TO postgres;

--
-- Name: user_registration_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_registration_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_registration_id_seq OWNER TO postgres;

--
-- Name: user_registration_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_registration_id_seq OWNED BY public.user_registration.id;


--
-- Name: customer customer_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer ALTER COLUMN customer_id SET DEFAULT nextval('public.customer_customer_id_seq'::regclass);


--
-- Name: customer_request id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_request ALTER COLUMN id SET DEFAULT nextval('public.customer_request_id_seq'::regclass);


--
-- Name: listing_services id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.listing_services ALTER COLUMN id SET DEFAULT nextval('public.listing_services_id_seq'::regclass);


--
-- Name: payment id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment ALTER COLUMN id SET DEFAULT nextval('public.payment_id_seq'::regclass);


--
-- Name: pick_up_and_delivery id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pick_up_and_delivery ALTER COLUMN id SET DEFAULT nextval('public.pick_up_and_delivery_id_seq'::regclass);


--
-- Name: pickup_and_delivery id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pickup_and_delivery ALTER COLUMN id SET DEFAULT nextval('public.pickup_and_delivery_id_seq'::regclass);


--
-- Name: service service_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service ALTER COLUMN service_id SET DEFAULT nextval('public.service_service_id_seq'::regclass);


--
-- Name: service_status status_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_status ALTER COLUMN status_id SET DEFAULT nextval('public.service_status_status_id_seq'::regclass);


--
-- Name: technician technician_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.technician ALTER COLUMN technician_id SET DEFAULT nextval('public.technician_technician_id_seq'::regclass);


--
-- Name: technician_registration id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.technician_registration ALTER COLUMN id SET DEFAULT nextval('public.technician_registration_id_seq'::regclass);


--
-- Name: tracking_service id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tracking_service ALTER COLUMN id SET DEFAULT nextval('public.tracking_service_id_seq'::regclass);


--
-- Name: uploading_material id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.uploading_material ALTER COLUMN id SET DEFAULT nextval('public.uploading_material_id_seq'::regclass);


--
-- Name: user_registration id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_registration ALTER COLUMN id SET DEFAULT nextval('public.user_registration_id_seq'::regclass);


--
-- Data for Name: customer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customer (customer_id, customer_name, customer_email, customer_phone) FROM stdin;
\.


--
-- Data for Name: customer_request; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customer_request (id, customer_id, technician_id, service_id, request_status, request_date) FROM stdin;
\.


--
-- Data for Name: listing_services; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.listing_services (id, technician_id, service_name, service_description, service_cost) FROM stdin;
\.


--
-- Data for Name: payment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payment (id, customer_id, technician_id, service_id, amount, payment_status, payment_date) FROM stdin;
\.


--
-- Data for Name: pick_up_and_delivery; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pick_up_and_delivery (id, customer_id, technician_id, pick_up_location, delivery_location, pick_up_date, delivery_date, delivery_status) FROM stdin;
\.


--
-- Data for Name: pickup_and_delivery; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pickup_and_delivery (id, customer_id, technician_id, pickup_location, delivery_location, pickup_date, delivery_date, delivery_status) FROM stdin;
\.


--
-- Data for Name: service; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.service (service_id, technician_id, customer_id, service_type, service_description, service_date, service_status) FROM stdin;
\.


--
-- Data for Name: service_status; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.service_status (status_id, status_name) FROM stdin;
\.


--
-- Data for Name: technician; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.technician (technician_id, technician_name, technician_email, technician_phone) FROM stdin;
\.


--
-- Data for Name: technician_registration; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.technician_registration (id, name, email, password, phone_number, address, date_created, last_login) FROM stdin;
\.


--
-- Data for Name: tracking_service; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tracking_service (id, customer_id, technician_id, service_id, tracking_status, tracking_date) FROM stdin;
\.


--
-- Data for Name: uploading_material; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.uploading_material (id, technician_id, material_name, material_description, material_image) FROM stdin;
\.


--
-- Data for Name: user_registration; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_registration (id, name, email, password, phone_number, address, date_created, last_login) FROM stdin;
\.


--
-- Name: customer_customer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customer_customer_id_seq', 1, false);


--
-- Name: customer_request_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customer_request_id_seq', 1, false);


--
-- Name: listing_services_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.listing_services_id_seq', 1, false);


--
-- Name: payment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payment_id_seq', 1, false);


--
-- Name: pick_up_and_delivery_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pick_up_and_delivery_id_seq', 1, false);


--
-- Name: pickup_and_delivery_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pickup_and_delivery_id_seq', 1, false);


--
-- Name: service_service_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.service_service_id_seq', 1, false);


--
-- Name: service_status_status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.service_status_status_id_seq', 1, false);


--
-- Name: technician_registration_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.technician_registration_id_seq', 1, false);


--
-- Name: technician_technician_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.technician_technician_id_seq', 1, false);


--
-- Name: tracking_service_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tracking_service_id_seq', 1, false);


--
-- Name: uploading_material_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.uploading_material_id_seq', 1, false);


--
-- Name: user_registration_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_registration_id_seq', 1, false);


--
-- Name: customer customer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY (customer_id);


--
-- Name: customer_request customer_request_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_request
    ADD CONSTRAINT customer_request_pkey PRIMARY KEY (id);


--
-- Name: listing_services listing_services_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.listing_services
    ADD CONSTRAINT listing_services_pkey PRIMARY KEY (id);


--
-- Name: payment payment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_pkey PRIMARY KEY (id);


--
-- Name: pick_up_and_delivery pick_up_and_delivery_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pick_up_and_delivery
    ADD CONSTRAINT pick_up_and_delivery_pkey PRIMARY KEY (id);


--
-- Name: pickup_and_delivery pickup_and_delivery_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pickup_and_delivery
    ADD CONSTRAINT pickup_and_delivery_pkey PRIMARY KEY (id);


--
-- Name: service service_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service
    ADD CONSTRAINT service_pkey PRIMARY KEY (service_id);


--
-- Name: service_status service_status_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_status
    ADD CONSTRAINT service_status_pkey PRIMARY KEY (status_id);


--
-- Name: technician technician_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.technician
    ADD CONSTRAINT technician_pkey PRIMARY KEY (technician_id);


--
-- Name: technician_registration technician_registration_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.technician_registration
    ADD CONSTRAINT technician_registration_pkey PRIMARY KEY (id);


--
-- Name: tracking_service tracking_service_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tracking_service
    ADD CONSTRAINT tracking_service_pkey PRIMARY KEY (id);


--
-- Name: uploading_material uploading_material_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.uploading_material
    ADD CONSTRAINT uploading_material_pkey PRIMARY KEY (id);


--
-- Name: user_registration user_registration_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_registration
    ADD CONSTRAINT user_registration_pkey PRIMARY KEY (id);


--
-- Name: customer_request fk_customer_request_customer; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_request
    ADD CONSTRAINT fk_customer_request_customer FOREIGN KEY (customer_id) REFERENCES public.customer(customer_id);


--
-- Name: customer_request fk_customer_request_service; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_request
    ADD CONSTRAINT fk_customer_request_service FOREIGN KEY (service_id) REFERENCES public.service(service_id);


--
-- Name: customer_request fk_customer_request_technician; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_request
    ADD CONSTRAINT fk_customer_request_technician FOREIGN KEY (technician_id) REFERENCES public.technician(technician_id);


--
-- Name: payment fk_payment_customer; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT fk_payment_customer FOREIGN KEY (customer_id) REFERENCES public.customer(customer_id);


--
-- Name: payment fk_payment_service; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT fk_payment_service FOREIGN KEY (service_id) REFERENCES public.service(service_id);


--
-- Name: payment fk_payment_technician; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT fk_payment_technician FOREIGN KEY (technician_id) REFERENCES public.technician(technician_id);


--
-- Name: pickup_and_delivery fk_pickup_and_delivery_customer; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pickup_and_delivery
    ADD CONSTRAINT fk_pickup_and_delivery_customer FOREIGN KEY (customer_id) REFERENCES public.customer(customer_id);


--
-- Name: pickup_and_delivery fk_pickup_and_delivery_technician; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pickup_and_delivery
    ADD CONSTRAINT fk_pickup_and_delivery_technician FOREIGN KEY (technician_id) REFERENCES public.technician(technician_id);


--
-- Name: service fk_service_customer; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service
    ADD CONSTRAINT fk_service_customer FOREIGN KEY (customer_id) REFERENCES public.customer(customer_id);


--
-- Name: service fk_service_technician; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service
    ADD CONSTRAINT fk_service_technician FOREIGN KEY (technician_id) REFERENCES public.technician(technician_id);


--
-- Name: tracking_service fk_tracking_service_customer; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tracking_service
    ADD CONSTRAINT fk_tracking_service_customer FOREIGN KEY (customer_id) REFERENCES public.customer(customer_id);


--
-- Name: tracking_service fk_tracking_service_service; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tracking_service
    ADD CONSTRAINT fk_tracking_service_service FOREIGN KEY (service_id) REFERENCES public.service(service_id);


--
-- Name: tracking_service fk_tracking_service_technician; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tracking_service
    ADD CONSTRAINT fk_tracking_service_technician FOREIGN KEY (technician_id) REFERENCES public.technician(technician_id);


--
-- PostgreSQL database dump complete
--

