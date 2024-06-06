--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.2

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
-- Name: dim_city; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dim_city (
    "CityID" integer NOT NULL,
    "CityName" character varying(50),
    "ProvinceID" integer,
    "MunicipalityID" integer,
    "CountryID" integer
);


ALTER TABLE public.dim_city OWNER TO postgres;

--
-- Name: dim_country; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dim_country (
    "CountryID" integer NOT NULL,
    "CountryName" character varying(50)
);


ALTER TABLE public.dim_country OWNER TO postgres;

--
-- Name: dim_day_date; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dim_day_date (
    businessdate integer NOT NULL,
    date timestamp without time zone NOT NULL,
    weekdayname character varying(10),
    quartername character varying(2),
    monthname character varying(20),
    year integer,
    isworkday integer,
    dayofweek integer,
    dayofmonth integer,
    dayofyear integer,
    monthofyear integer
);


ALTER TABLE public.dim_day_date OWNER TO postgres;

--
-- Name: dim_day_part; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dim_day_part (
    daypartid integer NOT NULL,
    daypartdesc character varying(50),
    starttime timestamp without time zone,
    endtime timestamp without time zone
);


ALTER TABLE public.dim_day_part OWNER TO postgres;

--
-- Name: dim_franchisee; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dim_franchisee (
    franchiseeid integer NOT NULL,
    franchiseename character varying(50),
    active boolean,
    startdate date,
    enddate date,
    address character varying(50),
    effective timestamp without time zone,
    expired timestamp without time zone,
    iscurrent boolean NOT NULL
);


ALTER TABLE public.dim_franchisee OWNER TO postgres;

--
-- Name: dim_location; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dim_location (
    locationid integer NOT NULL,
    businessname character varying(50) NOT NULL,
    regionname character varying(50),
    countryname character varying(50),
    iscurrent boolean NOT NULL,
    effective timestamp without time zone,
    expired timestamp without time zone
);


ALTER TABLE public.dim_location OWNER TO postgres;

--
-- Name: dim_owner_operator; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dim_owner_operator (
    owneroperatorid integer NOT NULL,
    firstname character varying(50),
    lastname character varying(50),
    emailaddress character varying(50),
    contactnumber character varying(10),
    active boolean,
    effective timestamp without time zone,
    expired timestamp without time zone,
    iscurrent boolean NOT NULL
);


ALTER TABLE public.dim_owner_operator OWNER TO postgres;

--
-- Name: dim_product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dim_product (
    productid integer NOT NULL,
    productgroupcode integer NOT NULL,
    productgroupdesc character varying(30),
    productleveldesc character varying(30),
    iscurrent boolean NOT NULL,
    effective timestamp without time zone,
    expired timestamp without time zone
);


ALTER TABLE public.dim_product OWNER TO postgres;

--
-- Name: dim_product_category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dim_product_category (
    productcategoryid integer NOT NULL,
    productcategorydesc character varying(30),
    effective timestamp without time zone,
    expired timestamp without time zone,
    iscurrent boolean NOT NULL
);


ALTER TABLE public.dim_product_category OWNER TO postgres;

--
-- Name: dim_product_group_level1; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dim_product_group_level1 (
    "ProductLevel1ID" integer NOT NULL,
    "ProductLevel1Desc" character varying(50),
    "StartDate" timestamp without time zone
);


ALTER TABLE public.dim_product_group_level1 OWNER TO postgres;

--
-- Name: dim_product_group_level2; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dim_product_group_level2 (
    "ProductLevel2ID" integer NOT NULL,
    "ProductLevel2Desc" character varying(50),
    "ProductLevel1ID" integer,
    "StartDate" timestamp without time zone
);


ALTER TABLE public.dim_product_group_level2 OWNER TO postgres;

--
-- Name: dim_product_group_level3; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dim_product_group_level3 (
    "ProductLevel3ID" integer NOT NULL,
    "ProductLevel3Desc" character varying(50),
    "ProductLevel1ID" integer,
    "ProductLevel2ID" integer,
    "StartDate" timestamp without time zone
);


ALTER TABLE public.dim_product_group_level3 OWNER TO postgres;

--
-- Name: dim_product_group_level4; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dim_product_group_level4 (
    "ProductLevel4ID" integer NOT NULL,
    "ProductLevel4Code" integer,
    "ProductLevel4Desc" character varying(50),
    "ProductLevel1ID" integer,
    "ProductLevel2ID" integer,
    "ProductLevel3ID" integer,
    "ProductCategoryID" integer,
    "StartDate" timestamp without time zone
);


ALTER TABLE public.dim_product_group_level4 OWNER TO postgres;

--
-- Name: dim_province; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dim_province (
    "ProvinceID" integer NOT NULL,
    "ProvinceName" character varying(50),
    "CountryID" integer
);


ALTER TABLE public.dim_province OWNER TO postgres;

--
-- Name: dim_sales_order_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dim_sales_order_type (
    salesordertypeid integer NOT NULL,
    salesordertypename character varying(30) NOT NULL,
    iscurrent boolean NOT NULL,
    effective timestamp without time zone,
    expired timestamp without time zone
);


ALTER TABLE public.dim_sales_order_type OWNER TO postgres;

--
-- Name: dim_sales_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dim_sales_type (
    salestypeid integer NOT NULL,
    salestypename character varying(30) NOT NULL,
    iscurrent boolean NOT NULL,
    effective timestamp without time zone,
    expired timestamp without time zone
);


ALTER TABLE public.dim_sales_type OWNER TO postgres;

--
-- Name: dim_stores; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dim_stores (
    storeno integer NOT NULL,
    storename character varying(50) NOT NULL,
    telephonenumber character varying(10),
    emailaddress character varying(50),
    openstatus boolean NOT NULL,
    delivery boolean NOT NULL,
    drivethru boolean NOT NULL,
    generatorstatus boolean NOT NULL,
    cafe boolean NOT NULL,
    playplace boolean NOT NULL,
    wifi boolean NOT NULL,
    dessertkiosk boolean NOT NULL,
    addressline1 character varying(50),
    addressline2 character varying(50),
    addressline3 character varying(50),
    postaladdress character varying(4),
    opendate date,
    closedate date,
    volumebanddesc character varying(30),
    tradinghoursdesc character varying(30),
    effective timestamp without time zone,
    expired timestamp without time zone,
    iscurrent boolean NOT NULL
);


ALTER TABLE public.dim_stores OWNER TO postgres;

--
-- Name: dim_trading_hours; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dim_trading_hours (
    "TradingHoursID" integer NOT NULL,
    "TradingHoursDesc" character varying(50)
);


ALTER TABLE public.dim_trading_hours OWNER TO postgres;

--
-- Name: dim_volumn_band; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dim_volumn_band (
    "VolumnBandID" integer NOT NULL,
    "VolumnBandDesc" character varying(50)
);


ALTER TABLE public.dim_volumn_band OWNER TO postgres;

--
-- Name: fact_daily_sales; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fact_daily_sales (
    dailysalesid integer NOT NULL,
    storeno integer NOT NULL,
    businessdate date NOT NULL,
    daypartid integer NOT NULL,
    owneroperatorid integer NOT NULL,
    franchiseeid integer NOT NULL,
    locationid integer NOT NULL,
    salestypeid integer NOT NULL,
    salesordertypeid integer NOT NULL,
    productid integer NOT NULL,
    productcategoryid integer NOT NULL,
    quantity integer NOT NULL,
    grosssales numeric NOT NULL,
    totalprice numeric NOT NULL,
    notransactions integer NOT NULL,
    effective timestamp without time zone,
    iscurrent boolean NOT NULL
);


ALTER TABLE public.fact_daily_sales OWNER TO postgres;

--
-- Name: fact_daily_sales_dailysalesid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.fact_daily_sales_dailysalesid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.fact_daily_sales_dailysalesid_seq OWNER TO postgres;

--
-- Name: fact_daily_sales_dailysalesid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.fact_daily_sales_dailysalesid_seq OWNED BY public.fact_daily_sales.dailysalesid;


--
-- Name: fact_daily_sales dailysalesid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fact_daily_sales ALTER COLUMN dailysalesid SET DEFAULT nextval('public.fact_daily_sales_dailysalesid_seq'::regclass);


--
-- Data for Name: dim_city; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dim_city ("CityID", "CityName", "ProvinceID", "MunicipalityID", "CountryID") FROM stdin;
\.


--
-- Data for Name: dim_country; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dim_country ("CountryID", "CountryName") FROM stdin;
\.


--
-- Data for Name: dim_day_date; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dim_day_date (businessdate, date, weekdayname, quartername, monthname, year, isworkday, dayofweek, dayofmonth, dayofyear, monthofyear) FROM stdin;
\.


--
-- Data for Name: dim_day_part; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dim_day_part (daypartid, daypartdesc, starttime, endtime) FROM stdin;
\.


--
-- Data for Name: dim_franchisee; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dim_franchisee (franchiseeid, franchiseename, active, startdate, enddate, address, effective, expired, iscurrent) FROM stdin;
\.


--
-- Data for Name: dim_location; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dim_location (locationid, businessname, regionname, countryname, iscurrent, effective, expired) FROM stdin;
\.


--
-- Data for Name: dim_owner_operator; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dim_owner_operator (owneroperatorid, firstname, lastname, emailaddress, contactnumber, active, effective, expired, iscurrent) FROM stdin;
\.


--
-- Data for Name: dim_product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dim_product (productid, productgroupcode, productgroupdesc, productleveldesc, iscurrent, effective, expired) FROM stdin;
\.


--
-- Data for Name: dim_product_category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dim_product_category (productcategoryid, productcategorydesc, effective, expired, iscurrent) FROM stdin;
\.


--
-- Data for Name: dim_product_group_level1; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dim_product_group_level1 ("ProductLevel1ID", "ProductLevel1Desc", "StartDate") FROM stdin;
\.


--
-- Data for Name: dim_product_group_level2; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dim_product_group_level2 ("ProductLevel2ID", "ProductLevel2Desc", "ProductLevel1ID", "StartDate") FROM stdin;
\.


--
-- Data for Name: dim_product_group_level3; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dim_product_group_level3 ("ProductLevel3ID", "ProductLevel3Desc", "ProductLevel1ID", "ProductLevel2ID", "StartDate") FROM stdin;
\.


--
-- Data for Name: dim_product_group_level4; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dim_product_group_level4 ("ProductLevel4ID", "ProductLevel4Code", "ProductLevel4Desc", "ProductLevel1ID", "ProductLevel2ID", "ProductLevel3ID", "ProductCategoryID", "StartDate") FROM stdin;
\.


--
-- Data for Name: dim_province; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dim_province ("ProvinceID", "ProvinceName", "CountryID") FROM stdin;
\.


--
-- Data for Name: dim_sales_order_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dim_sales_order_type (salesordertypeid, salesordertypename, iscurrent, effective, expired) FROM stdin;
\.


--
-- Data for Name: dim_sales_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dim_sales_type (salestypeid, salestypename, iscurrent, effective, expired) FROM stdin;
\.


--
-- Data for Name: dim_stores; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dim_stores (storeno, storename, telephonenumber, emailaddress, openstatus, delivery, drivethru, generatorstatus, cafe, playplace, wifi, dessertkiosk, addressline1, addressline2, addressline3, postaladdress, opendate, closedate, volumebanddesc, tradinghoursdesc, effective, expired, iscurrent) FROM stdin;
\.


--
-- Data for Name: dim_trading_hours; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dim_trading_hours ("TradingHoursID", "TradingHoursDesc") FROM stdin;
\.


--
-- Data for Name: dim_volumn_band; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dim_volumn_band ("VolumnBandID", "VolumnBandDesc") FROM stdin;
\.


--
-- Data for Name: fact_daily_sales; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fact_daily_sales (dailysalesid, storeno, businessdate, daypartid, owneroperatorid, franchiseeid, locationid, salestypeid, salesordertypeid, productid, productcategoryid, quantity, grosssales, totalprice, notransactions, effective, iscurrent) FROM stdin;
\.


--
-- Name: fact_daily_sales_dailysalesid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.fact_daily_sales_dailysalesid_seq', 1, false);


--
-- Name: dim_city City_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_city
    ADD CONSTRAINT "City_pkey" PRIMARY KEY ("CityID");


--
-- Name: dim_country Country_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_country
    ADD CONSTRAINT "Country_pkey" PRIMARY KEY ("CountryID");


--
-- Name: dim_product_group_level1 ProductGroupLevel1_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_product_group_level1
    ADD CONSTRAINT "ProductGroupLevel1_pkey" PRIMARY KEY ("ProductLevel1ID");


--
-- Name: dim_product_group_level2 ProductGroupLevel2_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_product_group_level2
    ADD CONSTRAINT "ProductGroupLevel2_pkey" PRIMARY KEY ("ProductLevel2ID");


--
-- Name: dim_product_group_level3 ProductGroupLevel3_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_product_group_level3
    ADD CONSTRAINT "ProductGroupLevel3_pkey" PRIMARY KEY ("ProductLevel3ID");


--
-- Name: dim_product_group_level4 ProductGroupLevel4_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_product_group_level4
    ADD CONSTRAINT "ProductGroupLevel4_pkey" PRIMARY KEY ("ProductLevel4ID");


--
-- Name: dim_province Province_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_province
    ADD CONSTRAINT "Province_pkey" PRIMARY KEY ("ProvinceID");


--
-- Name: dim_trading_hours TradingHours_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_trading_hours
    ADD CONSTRAINT "TradingHours_pkey" PRIMARY KEY ("TradingHoursID");


--
-- Name: dim_volumn_band VolumnBand_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_volumn_band
    ADD CONSTRAINT "VolumnBand_pkey" PRIMARY KEY ("VolumnBandID");


--
-- Name: dim_day_date dim_day_date_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_day_date
    ADD CONSTRAINT dim_day_date_pkey PRIMARY KEY (businessdate);


--
-- Name: dim_day_part dim_day_part_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_day_part
    ADD CONSTRAINT dim_day_part_pkey PRIMARY KEY (daypartid);


--
-- Name: dim_franchisee dim_franchisee_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_franchisee
    ADD CONSTRAINT dim_franchisee_pkey PRIMARY KEY (franchiseeid);


--
-- Name: dim_location dim_location_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_location
    ADD CONSTRAINT dim_location_pkey PRIMARY KEY (locationid);


--
-- Name: dim_owner_operator dim_owner_operator_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_owner_operator
    ADD CONSTRAINT dim_owner_operator_pkey PRIMARY KEY (owneroperatorid);


--
-- Name: dim_product_category dim_product_category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_product_category
    ADD CONSTRAINT dim_product_category_pkey PRIMARY KEY (productcategoryid);


--
-- Name: dim_product dim_product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_product
    ADD CONSTRAINT dim_product_pkey PRIMARY KEY (productid);


--
-- Name: dim_sales_order_type dim_sales_order_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_sales_order_type
    ADD CONSTRAINT dim_sales_order_type_pkey PRIMARY KEY (salesordertypeid);


--
-- Name: dim_sales_type dim_sales_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_sales_type
    ADD CONSTRAINT dim_sales_type_pkey PRIMARY KEY (salestypeid);


--
-- Name: dim_stores dim_stores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_stores
    ADD CONSTRAINT dim_stores_pkey PRIMARY KEY (storeno);


--
-- Name: fact_daily_sales fact_daily_sales_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fact_daily_sales
    ADD CONSTRAINT fact_daily_sales_pkey PRIMARY KEY (dailysalesid);


--
-- Name: fact_daily_sales fact_daily_sales_daypartid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fact_daily_sales
    ADD CONSTRAINT fact_daily_sales_daypartid_fkey FOREIGN KEY (daypartid) REFERENCES public.dim_day_part(daypartid);


--
-- Name: fact_daily_sales fact_daily_sales_franchiseeid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fact_daily_sales
    ADD CONSTRAINT fact_daily_sales_franchiseeid_fkey FOREIGN KEY (franchiseeid) REFERENCES public.dim_franchisee(franchiseeid);


--
-- Name: fact_daily_sales fact_daily_sales_locationid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fact_daily_sales
    ADD CONSTRAINT fact_daily_sales_locationid_fkey FOREIGN KEY (locationid) REFERENCES public.dim_location(locationid);


--
-- Name: fact_daily_sales fact_daily_sales_owneroperatorid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fact_daily_sales
    ADD CONSTRAINT fact_daily_sales_owneroperatorid_fkey FOREIGN KEY (owneroperatorid) REFERENCES public.dim_owner_operator(owneroperatorid);


--
-- Name: fact_daily_sales fact_daily_sales_productcategoryid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fact_daily_sales
    ADD CONSTRAINT fact_daily_sales_productcategoryid_fkey FOREIGN KEY (productcategoryid) REFERENCES public.dim_product_category(productcategoryid);


--
-- Name: fact_daily_sales fact_daily_sales_productid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fact_daily_sales
    ADD CONSTRAINT fact_daily_sales_productid_fkey FOREIGN KEY (productid) REFERENCES public.dim_product(productid);


--
-- Name: fact_daily_sales fact_daily_sales_salesordertypeid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fact_daily_sales
    ADD CONSTRAINT fact_daily_sales_salesordertypeid_fkey FOREIGN KEY (salesordertypeid) REFERENCES public.dim_sales_order_type(salesordertypeid);


--
-- Name: fact_daily_sales fact_daily_sales_salestypeid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fact_daily_sales
    ADD CONSTRAINT fact_daily_sales_salestypeid_fkey FOREIGN KEY (salestypeid) REFERENCES public.dim_sales_type(salestypeid);


--
-- Name: fact_daily_sales fact_daily_sales_storeno_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fact_daily_sales
    ADD CONSTRAINT fact_daily_sales_storeno_fkey FOREIGN KEY (storeno) REFERENCES public.dim_stores(storeno);


--
-- PostgreSQL database dump complete
--

