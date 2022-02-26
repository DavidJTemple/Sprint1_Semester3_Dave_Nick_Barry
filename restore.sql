--
-- NOTE:
--
-- File paths need to be edited. Search for $$PATH$$ and
-- replace it with the path to the directory containing
-- the extracted data files.
--
--
-- PostgreSQL database dump
--

-- Dumped from database version 14.1
-- Dumped by pg_dump version 14.1

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

DROP DATABASE "BKBrewery";
--
-- Name: BKBrewery; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "BKBrewery" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'C';


ALTER DATABASE "BKBrewery" OWNER TO postgres;

\connect "BKBrewery"

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
-- Name: address; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.address (
    address_id integer NOT NULL,
    address character varying(100) NOT NULL,
    city character varying(20) NOT NULL,
    province character(2) NOT NULL,
    post_code character varying(6) NOT NULL
);


ALTER TABLE public.address OWNER TO postgres;

--
-- Name: address_address_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.address_address_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.address_address_id_seq OWNER TO postgres;

--
-- Name: address_address_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.address_address_id_seq OWNED BY public.address.address_id;


--
-- Name: dates; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dates (
    date_id integer NOT NULL,
    day numeric(2,0) NOT NULL,
    month numeric(2,0) NOT NULL,
    year numeric(4,0) NOT NULL
);


ALTER TABLE public.dates OWNER TO postgres;

--
-- Name: dates_date_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dates_date_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dates_date_id_seq OWNER TO postgres;

--
-- Name: dates_date_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dates_date_id_seq OWNED BY public.dates.date_id;


--
-- Name: deliveries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.deliveries (
    delivery_id integer NOT NULL,
    event_id integer NOT NULL,
    locale_id integer NOT NULL,
    product_id integer NOT NULL,
    quantity numeric(5,0) NOT NULL,
    recyling_id integer,
    date_id integer NOT NULL
);


ALTER TABLE public.deliveries OWNER TO postgres;

--
-- Name: deliveries_delivery_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.deliveries_delivery_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.deliveries_delivery_id_seq OWNER TO postgres;

--
-- Name: deliveries_delivery_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.deliveries_delivery_id_seq OWNED BY public.deliveries.delivery_id;


--
-- Name: events; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.events (
    event_id integer NOT NULL,
    event_name character varying(40) NOT NULL,
    capacity numeric(5,0),
    date_id integer NOT NULL
);


ALTER TABLE public.events OWNER TO postgres;

--
-- Name: events_event_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.events_event_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.events_event_id_seq OWNER TO postgres;

--
-- Name: events_event_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.events_event_id_seq OWNED BY public.events.event_id;


--
-- Name: payment_methods; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payment_methods (
    pay_method_id integer NOT NULL,
    method character varying(20) NOT NULL
);


ALTER TABLE public.payment_methods OWNER TO postgres;

--
-- Name: payment_methods_pay_method_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.payment_methods_pay_method_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.payment_methods_pay_method_id_seq OWNER TO postgres;

--
-- Name: payment_methods_pay_method_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.payment_methods_pay_method_id_seq OWNED BY public.payment_methods.pay_method_id;


--
-- Name: product_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_types (
    type_id integer NOT NULL,
    type character varying(15) NOT NULL
);


ALTER TABLE public.product_types OWNER TO postgres;

--
-- Name: product_types_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_types_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_types_type_id_seq OWNER TO postgres;

--
-- Name: product_types_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_types_type_id_seq OWNED BY public.product_types.type_id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    product_id integer NOT NULL,
    type_id integer NOT NULL,
    name character varying(20) NOT NULL,
    "alcohol%" numeric(4,0),
    "container_weight/oz" numeric(4,0) NOT NULL,
    price money NOT NULL
);


ALTER TABLE public.products OWNER TO postgres;

--
-- Name: products_product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_product_id_seq OWNER TO postgres;

--
-- Name: products_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_product_id_seq OWNED BY public.products.product_id;


--
-- Name: recycling; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.recycling (
    recyling_id integer NOT NULL,
    cans_weight_lbs numeric(4,0),
    bucket_weight_lbs numeric(5,0)
);


ALTER TABLE public.recycling OWNER TO postgres;

--
-- Name: recyling_recyling_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.recyling_recyling_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.recyling_recyling_id_seq OWNER TO postgres;

--
-- Name: recyling_recyling_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.recyling_recyling_id_seq OWNED BY public.recycling.recyling_id;


--
-- Name: sales; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sales (
    sale_id integer NOT NULL,
    locale_id integer NOT NULL,
    member_id integer NOT NULL,
    product_id integer NOT NULL,
    purchase_id integer NOT NULL,
    date_id integer NOT NULL
);


ALTER TABLE public.sales OWNER TO postgres;

--
-- Name: sales_sale_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sales_sale_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sales_sale_id_seq OWNER TO postgres;

--
-- Name: sales_sale_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sales_sale_id_seq OWNED BY public.sales.sale_id;


--
-- Name: sales_team; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sales_team (
    member_id integer NOT NULL,
    first_name character varying(20) NOT NULL,
    last_name character varying(30) NOT NULL,
    phone_num numeric(10,0) NOT NULL,
    email character varying(50) NOT NULL,
    address character varying(100) NOT NULL,
    city character varying(50) NOT NULL,
    province character(2) NOT NULL,
    postal_code character varying(6) NOT NULL
);


ALTER TABLE public.sales_team OWNER TO postgres;

--
-- Name: sales_team_member_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sales_team_member_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sales_team_member_id_seq OWNER TO postgres;

--
-- Name: sales_team_member_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sales_team_member_id_seq OWNED BY public.sales_team.member_id;


--
-- Name: tax_table; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tax_table (
    tax_rate double precision NOT NULL
);


ALTER TABLE public.tax_table OWNER TO postgres;

--
-- Name: transactions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.transactions (
    purchase_id integer NOT NULL,
    beer_price money NOT NULL,
    quantity integer NOT NULL,
    subtotal money NOT NULL,
    bucket_discount money,
    new_subtotal money NOT NULL,
    tax_rate double precision NOT NULL,
    tax_total money NOT NULL,
    total money NOT NULL,
    pay_method_id integer NOT NULL
);


ALTER TABLE public.transactions OWNER TO postgres;

--
-- Name: transactions_purchase_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.transactions_purchase_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.transactions_purchase_id_seq OWNER TO postgres;

--
-- Name: transactions_purchase_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.transactions_purchase_id_seq OWNED BY public.transactions.purchase_id;


--
-- Name: venue_locale; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.venue_locale (
    locale_id integer NOT NULL,
    event_id integer NOT NULL,
    address_id integer NOT NULL,
    description character varying(150) NOT NULL
);


ALTER TABLE public.venue_locale OWNER TO postgres;

--
-- Name: venue_locale_locale_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.venue_locale_locale_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.venue_locale_locale_id_seq OWNER TO postgres;

--
-- Name: venue_locale_locale_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.venue_locale_locale_id_seq OWNED BY public.venue_locale.locale_id;


--
-- Name: address address_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.address ALTER COLUMN address_id SET DEFAULT nextval('public.address_address_id_seq'::regclass);


--
-- Name: dates date_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dates ALTER COLUMN date_id SET DEFAULT nextval('public.dates_date_id_seq'::regclass);


--
-- Name: deliveries delivery_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deliveries ALTER COLUMN delivery_id SET DEFAULT nextval('public.deliveries_delivery_id_seq'::regclass);


--
-- Name: events event_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events ALTER COLUMN event_id SET DEFAULT nextval('public.events_event_id_seq'::regclass);


--
-- Name: payment_methods pay_method_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_methods ALTER COLUMN pay_method_id SET DEFAULT nextval('public.payment_methods_pay_method_id_seq'::regclass);


--
-- Name: product_types type_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_types ALTER COLUMN type_id SET DEFAULT nextval('public.product_types_type_id_seq'::regclass);


--
-- Name: products product_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products ALTER COLUMN product_id SET DEFAULT nextval('public.products_product_id_seq'::regclass);


--
-- Name: recycling recyling_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recycling ALTER COLUMN recyling_id SET DEFAULT nextval('public.recyling_recyling_id_seq'::regclass);


--
-- Name: sales sale_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales ALTER COLUMN sale_id SET DEFAULT nextval('public.sales_sale_id_seq'::regclass);


--
-- Name: sales_team member_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_team ALTER COLUMN member_id SET DEFAULT nextval('public.sales_team_member_id_seq'::regclass);


--
-- Name: transactions purchase_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transactions ALTER COLUMN purchase_id SET DEFAULT nextval('public.transactions_purchase_id_seq'::regclass);


--
-- Name: venue_locale locale_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.venue_locale ALTER COLUMN locale_id SET DEFAULT nextval('public.venue_locale_locale_id_seq'::regclass);


--
-- Data for Name: address; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.address (address_id, address, city, province, post_code) FROM stdin;
\.
COPY public.address (address_id, address, city, province, post_code) FROM '$$PATH$$/3692.dat';

--
-- Data for Name: dates; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dates (date_id, day, month, year) FROM stdin;
\.
COPY public.dates (date_id, day, month, year) FROM '$$PATH$$/3700.dat';

--
-- Data for Name: deliveries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.deliveries (delivery_id, event_id, locale_id, product_id, quantity, recyling_id, date_id) FROM stdin;
\.
COPY public.deliveries (delivery_id, event_id, locale_id, product_id, quantity, recyling_id, date_id) FROM '$$PATH$$/3694.dat';

--
-- Data for Name: events; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.events (event_id, event_name, capacity, date_id) FROM stdin;
\.
COPY public.events (event_id, event_name, capacity, date_id) FROM '$$PATH$$/3688.dat';

--
-- Data for Name: payment_methods; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payment_methods (pay_method_id, method) FROM stdin;
\.
COPY public.payment_methods (pay_method_id, method) FROM '$$PATH$$/3704.dat';

--
-- Data for Name: product_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_types (type_id, type) FROM stdin;
\.
COPY public.product_types (type_id, type) FROM '$$PATH$$/3684.dat';

--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (product_id, type_id, name, "alcohol%", "container_weight/oz", price) FROM stdin;
\.
COPY public.products (product_id, type_id, name, "alcohol%", "container_weight/oz", price) FROM '$$PATH$$/3682.dat';

--
-- Data for Name: recycling; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.recycling (recyling_id, cans_weight_lbs, bucket_weight_lbs) FROM stdin;
\.
COPY public.recycling (recyling_id, cans_weight_lbs, bucket_weight_lbs) FROM '$$PATH$$/3696.dat';

--
-- Data for Name: sales; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sales (sale_id, locale_id, member_id, product_id, purchase_id, date_id) FROM stdin;
\.
COPY public.sales (sale_id, locale_id, member_id, product_id, purchase_id, date_id) FROM '$$PATH$$/3698.dat';

--
-- Data for Name: sales_team; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sales_team (member_id, first_name, last_name, phone_num, email, address, city, province, postal_code) FROM stdin;
\.
COPY public.sales_team (member_id, first_name, last_name, phone_num, email, address, city, province, postal_code) FROM '$$PATH$$/3686.dat';

--
-- Data for Name: tax_table; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tax_table (tax_rate) FROM stdin;
\.
COPY public.tax_table (tax_rate) FROM '$$PATH$$/3705.dat';

--
-- Data for Name: transactions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.transactions (purchase_id, beer_price, quantity, subtotal, bucket_discount, new_subtotal, tax_rate, tax_total, total, pay_method_id) FROM stdin;
\.
COPY public.transactions (purchase_id, beer_price, quantity, subtotal, bucket_discount, new_subtotal, tax_rate, tax_total, total, pay_method_id) FROM '$$PATH$$/3702.dat';

--
-- Data for Name: venue_locale; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.venue_locale (locale_id, event_id, address_id, description) FROM stdin;
\.
COPY public.venue_locale (locale_id, event_id, address_id, description) FROM '$$PATH$$/3690.dat';

--
-- Name: address_address_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.address_address_id_seq', 12, true);


--
-- Name: dates_date_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dates_date_id_seq', 365, true);


--
-- Name: deliveries_delivery_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.deliveries_delivery_id_seq', 76, true);


--
-- Name: events_event_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.events_event_id_seq', 10, true);


--
-- Name: payment_methods_pay_method_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payment_methods_pay_method_id_seq', 3, true);


--
-- Name: product_types_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_types_type_id_seq', 1, false);


--
-- Name: products_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_product_id_seq', 1, true);


--
-- Name: recyling_recyling_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.recyling_recyling_id_seq', 12, true);


--
-- Name: sales_sale_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sales_sale_id_seq', 1, false);


--
-- Name: sales_team_member_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sales_team_member_id_seq', 16, true);


--
-- Name: transactions_purchase_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.transactions_purchase_id_seq', 3, true);


--
-- Name: venue_locale_locale_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.venue_locale_locale_id_seq', 12, true);


--
-- Name: address address_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.address
    ADD CONSTRAINT address_pkey PRIMARY KEY (address_id);


--
-- Name: dates dates_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dates
    ADD CONSTRAINT dates_pkey PRIMARY KEY (date_id);


--
-- Name: deliveries deliveries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deliveries
    ADD CONSTRAINT deliveries_pkey PRIMARY KEY (delivery_id);


--
-- Name: events events_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_pkey PRIMARY KEY (event_id);


--
-- Name: payment_methods payment_methods_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_methods
    ADD CONSTRAINT payment_methods_pkey PRIMARY KEY (pay_method_id);


--
-- Name: product_types product_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_types
    ADD CONSTRAINT product_types_pkey PRIMARY KEY (type_id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (product_id);


--
-- Name: recycling recyling_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recycling
    ADD CONSTRAINT recyling_pkey PRIMARY KEY (recyling_id);


--
-- Name: sales sales_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales
    ADD CONSTRAINT sales_pkey PRIMARY KEY (sale_id);


--
-- Name: sales_team sales_team_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_team
    ADD CONSTRAINT sales_team_pkey PRIMARY KEY (member_id);


--
-- Name: tax_table tax_table_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tax_table
    ADD CONSTRAINT tax_table_pkey PRIMARY KEY (tax_rate);


--
-- Name: transactions transactions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT transactions_pkey PRIMARY KEY (purchase_id);


--
-- Name: venue_locale venue_locale_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.venue_locale
    ADD CONSTRAINT venue_locale_pkey PRIMARY KEY (locale_id);


--
-- Name: deliveries deliveries_date_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deliveries
    ADD CONSTRAINT deliveries_date_id_fkey FOREIGN KEY (date_id) REFERENCES public.dates(date_id);


--
-- Name: deliveries deliveries_event_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deliveries
    ADD CONSTRAINT deliveries_event_id_fkey FOREIGN KEY (event_id) REFERENCES public.events(event_id);


--
-- Name: deliveries deliveries_locale_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deliveries
    ADD CONSTRAINT deliveries_locale_id_fkey FOREIGN KEY (locale_id) REFERENCES public.venue_locale(locale_id);


--
-- Name: deliveries deliveries_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deliveries
    ADD CONSTRAINT deliveries_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(product_id);


--
-- Name: deliveries deliveries_recyling_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deliveries
    ADD CONSTRAINT deliveries_recyling_id_fkey FOREIGN KEY (recyling_id) REFERENCES public.recycling(recyling_id);


--
-- Name: transactions invoices_tax_rate_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT invoices_tax_rate_fkey FOREIGN KEY (tax_rate) REFERENCES public.tax_table(tax_rate);


--
-- Name: products products_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_type_id_fkey FOREIGN KEY (type_id) REFERENCES public.product_types(type_id);


--
-- Name: sales sales_date_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales
    ADD CONSTRAINT sales_date_id_fkey FOREIGN KEY (date_id) REFERENCES public.dates(date_id);


--
-- Name: sales sales_locale_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales
    ADD CONSTRAINT sales_locale_id_fkey FOREIGN KEY (locale_id) REFERENCES public.venue_locale(locale_id);


--
-- Name: sales sales_member_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales
    ADD CONSTRAINT sales_member_id_fkey FOREIGN KEY (member_id) REFERENCES public.sales_team(member_id);


--
-- Name: sales sales_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales
    ADD CONSTRAINT sales_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(product_id);


--
-- Name: sales sales_purchase_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales
    ADD CONSTRAINT sales_purchase_id_fkey FOREIGN KEY (purchase_id) REFERENCES public.transactions(purchase_id);


--
-- Name: transactions transactions_pay_method_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT transactions_pay_method_id_fkey FOREIGN KEY (pay_method_id) REFERENCES public.payment_methods(pay_method_id);


--
-- Name: venue_locale venue_locale_address_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.venue_locale
    ADD CONSTRAINT venue_locale_address_id_fkey FOREIGN KEY (address_id) REFERENCES public.address(address_id);


--
-- Name: venue_locale venue_locale_event_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.venue_locale
    ADD CONSTRAINT venue_locale_event_id_fkey FOREIGN KEY (event_id) REFERENCES public.events(event_id);


--
-- PostgreSQL database dump complete
--

