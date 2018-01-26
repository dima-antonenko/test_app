--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.10
-- Dumped by pg_dump version 9.6.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
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


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE ar_internal_metadata OWNER TO postgres;

--
-- Name: articles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE articles (
    id bigint NOT NULL,
    title character varying,
    body text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE articles OWNER TO postgres;

--
-- Name: articles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE articles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE articles_id_seq OWNER TO postgres;

--
-- Name: articles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE articles_id_seq OWNED BY articles.id;


--
-- Name: product_categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE product_categories (
    id bigint NOT NULL,
    name character varying,
    source_url character varying,
    parsed boolean
);


ALTER TABLE product_categories OWNER TO postgres;

--
-- Name: product_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE product_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE product_categories_id_seq OWNER TO postgres;

--
-- Name: product_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE product_categories_id_seq OWNED BY product_categories.id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE products (
    id bigint NOT NULL,
    name character varying,
    price integer,
    product_category_id integer
);


ALTER TABLE products OWNER TO postgres;

--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE products_id_seq OWNER TO postgres;

--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE products_id_seq OWNED BY products.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE schema_migrations OWNER TO postgres;

--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE users (
    id bigint NOT NULL,
    email character varying,
    password_digest character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: articles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY articles ALTER COLUMN id SET DEFAULT nextval('articles_id_seq'::regclass);


--
-- Name: product_categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY product_categories ALTER COLUMN id SET DEFAULT nextval('product_categories_id_seq'::regclass);


--
-- Name: products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY products ALTER COLUMN id SET DEFAULT nextval('products_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO ar_internal_metadata VALUES ('environment', 'development', '2018-01-26 07:05:28.69673', '2018-01-26 07:05:28.69673');


--
-- Data for Name: articles; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO articles VALUES (1, 'first article', 'first article body', '2018-01-26 07:08:21.87995', '2018-01-26 07:08:21.87995');
INSERT INTO articles VALUES (2, 'second article', 'second article body', '2018-01-26 07:08:29.825459', '2018-01-26 07:08:29.825459');


--
-- Name: articles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('articles_id_seq', 2, true);


--
-- Data for Name: product_categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO product_categories VALUES (1, 'Ноутбуки
                                            ', 'https://www.citilink.ru/catalog/mobile/notebooks/', false);
INSERT INTO product_categories VALUES (2, 'Ультрабуки
                                            ', 'https://www.citilink.ru/catalog/mobile/ultrabuki/', false);
INSERT INTO product_categories VALUES (3, 'Ноутбуки-трансформеры
                                            ', 'https://www.citilink.ru/catalog/mobile/noutbuki_transformery/', false);
INSERT INTO product_categories VALUES (4, 'Планшеты
                                            ', 'https://www.citilink.ru/catalog/mobile/tablet_pc/', false);
INSERT INTO product_categories VALUES (5, 'Детские планшеты
                                            ', 'https://www.citilink.ru/catalog/mobile/kid_tablet_pc/', false);
INSERT INTO product_categories VALUES (6, 'Мобильные телефоны
                                            ', 'https://www.citilink.ru/catalog/mobile/cell_phones/', false);
INSERT INTO product_categories VALUES (7, 'Смартфоны
                                            ', 'https://www.citilink.ru/catalog/mobile/smartfony/', false);
INSERT INTO product_categories VALUES (8, 'Гаджеты
                                            ', 'https://www.citilink.ru/catalog/mobile/phone_gadgets/', false);
INSERT INTO product_categories VALUES (9, 'Аксессуары для ноутбуков
                                            ', 'https://www.citilink.ru/catalog/mobile/note_aks/', false);
INSERT INTO product_categories VALUES (10, 'Аксессуары для планшетов
                                            ', 'https://www.citilink.ru/catalog/mobile/tablet_pc_aks/', false);
INSERT INTO product_categories VALUES (11, 'Аксессуары для смартфонов
                                            ', 'https://www.citilink.ru/catalog/mobile/cell_phones_aks/', false);
INSERT INTO product_categories VALUES (12, 'Электронные книги и аксессуары
                                            ', 'https://www.citilink.ru/catalog/mobile/ebook/', false);
INSERT INTO product_categories VALUES (13, 'Усилители для наушников
                                            ', 'https://www.citilink.ru/catalog/mobile/usiliteli_dlya_naushnikov/', false);
INSERT INTO product_categories VALUES (14, 'Аксессуары для наушников
                                            ', 'https://www.citilink.ru/catalog/mobile/aksessuary_dlya_naushnikov/', false);


--
-- Name: product_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('product_categories_id_seq', 14, true);


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO products VALUES (12, 'Тестовый товар №0', 50, 3);
INSERT INTO products VALUES (13, 'Тестовый товар №1', 60, 4);
INSERT INTO products VALUES (14, 'Тестовый товар №2', 70, 11);
INSERT INTO products VALUES (15, 'Тестовый товар №3', 80, 11);
INSERT INTO products VALUES (16, 'Тестовый товар №4', 90, 1);
INSERT INTO products VALUES (17, 'Тестовый товар №5', 100, 3);
INSERT INTO products VALUES (18, 'Тестовый товар №6', 110, 10);
INSERT INTO products VALUES (19, 'Тестовый товар №7', 120, 3);
INSERT INTO products VALUES (20, 'Тестовый товар №8', 130, 8);
INSERT INTO products VALUES (21, 'Тестовый товар №9', 140, 5);
INSERT INTO products VALUES (22, 'Тестовый товар №10', 150, 8);
INSERT INTO products VALUES (23, 'Тестовый товар №11', 160, 2);
INSERT INTO products VALUES (24, 'Тестовый товар №12', 170, 6);
INSERT INTO products VALUES (25, 'Тестовый товар №13', 180, 5);
INSERT INTO products VALUES (26, 'Тестовый товар №14', 190, 3);
INSERT INTO products VALUES (27, 'Тестовый товар №15', 200, 2);
INSERT INTO products VALUES (28, 'Тестовый товар №16', 210, 4);
INSERT INTO products VALUES (29, 'Тестовый товар №17', 220, 5);
INSERT INTO products VALUES (30, 'Тестовый товар №18', 230, 7);
INSERT INTO products VALUES (31, 'Тестовый товар №19', 240, 13);
INSERT INTO products VALUES (32, 'Тестовый товар №20', 250, 13);
INSERT INTO products VALUES (33, 'Тестовый товар №21', 260, 10);
INSERT INTO products VALUES (34, 'Тестовый товар №22', 270, 7);
INSERT INTO products VALUES (35, 'Тестовый товар №23', 280, 13);
INSERT INTO products VALUES (36, 'Тестовый товар №24', 290, 7);
INSERT INTO products VALUES (37, 'Тестовый товар №25', 300, 14);
INSERT INTO products VALUES (38, 'Тестовый товар №26', 310, 2);
INSERT INTO products VALUES (39, 'Тестовый товар №27', 320, 13);
INSERT INTO products VALUES (40, 'Тестовый товар №28', 330, 10);
INSERT INTO products VALUES (41, 'Тестовый товар №29', 340, 2);
INSERT INTO products VALUES (42, 'Тестовый товар №30', 350, 8);
INSERT INTO products VALUES (43, 'Тестовый товар №31', 360, 8);
INSERT INTO products VALUES (44, 'Тестовый товар №32', 370, 7);
INSERT INTO products VALUES (45, 'Тестовый товар №33', 380, 6);
INSERT INTO products VALUES (46, 'Тестовый товар №34', 390, 7);
INSERT INTO products VALUES (47, 'Тестовый товар №35', 400, 1);
INSERT INTO products VALUES (48, 'Тестовый товар №36', 410, 10);
INSERT INTO products VALUES (49, 'Тестовый товар №37', 420, 5);
INSERT INTO products VALUES (50, 'Тестовый товар №38', 430, 6);
INSERT INTO products VALUES (51, 'Тестовый товар №39', 440, 1);
INSERT INTO products VALUES (52, 'Тестовый товар №40', 450, 2);
INSERT INTO products VALUES (53, 'Тестовый товар №41', 460, 12);
INSERT INTO products VALUES (54, 'Тестовый товар №42', 470, 3);
INSERT INTO products VALUES (55, 'Тестовый товар №43', 480, 13);
INSERT INTO products VALUES (56, 'Тестовый товар №44', 490, 11);
INSERT INTO products VALUES (57, 'Тестовый товар №45', 500, 8);
INSERT INTO products VALUES (58, 'Тестовый товар №46', 510, 1);
INSERT INTO products VALUES (59, 'Тестовый товар №47', 520, 7);
INSERT INTO products VALUES (60, 'Тестовый товар №48', 530, 9);
INSERT INTO products VALUES (61, 'Тестовый товар №49', 540, 13);
INSERT INTO products VALUES (62, 'Тестовый товар №50', 550, 8);
INSERT INTO products VALUES (63, 'Тестовый товар №51', 560, 14);
INSERT INTO products VALUES (64, 'Тестовый товар №52', 570, 4);
INSERT INTO products VALUES (65, 'Тестовый товар №53', 580, 1);
INSERT INTO products VALUES (66, 'Тестовый товар №54', 590, 14);
INSERT INTO products VALUES (67, 'Тестовый товар №55', 600, 9);
INSERT INTO products VALUES (68, 'Тестовый товар №56', 610, 12);
INSERT INTO products VALUES (69, 'Тестовый товар №57', 620, 5);
INSERT INTO products VALUES (70, 'Тестовый товар №58', 630, 10);
INSERT INTO products VALUES (71, 'Тестовый товар №59', 640, 10);
INSERT INTO products VALUES (72, 'Тестовый товар №60', 650, 2);
INSERT INTO products VALUES (73, 'Тестовый товар №61', 660, 5);
INSERT INTO products VALUES (74, 'Тестовый товар №62', 670, 1);
INSERT INTO products VALUES (75, 'Тестовый товар №63', 680, 10);
INSERT INTO products VALUES (76, 'Тестовый товар №64', 690, 12);
INSERT INTO products VALUES (77, 'Тестовый товар №65', 700, 9);
INSERT INTO products VALUES (78, 'Тестовый товар №66', 710, 13);
INSERT INTO products VALUES (79, 'Тестовый товар №67', 720, 5);
INSERT INTO products VALUES (80, 'Тестовый товар №68', 730, 1);
INSERT INTO products VALUES (81, 'Тестовый товар №69', 740, 8);
INSERT INTO products VALUES (82, 'Тестовый товар №70', 750, 13);
INSERT INTO products VALUES (83, 'Тестовый товар №71', 760, 12);
INSERT INTO products VALUES (84, 'Тестовый товар №72', 770, 14);
INSERT INTO products VALUES (85, 'Тестовый товар №73', 780, 12);
INSERT INTO products VALUES (86, 'Тестовый товар №74', 790, 9);
INSERT INTO products VALUES (87, 'Тестовый товар №75', 800, 13);
INSERT INTO products VALUES (88, 'Тестовый товар №76', 810, 2);
INSERT INTO products VALUES (89, 'Тестовый товар №77', 820, 5);
INSERT INTO products VALUES (90, 'Тестовый товар №78', 830, 12);
INSERT INTO products VALUES (91, 'Тестовый товар №79', 840, 2);
INSERT INTO products VALUES (92, 'Тестовый товар №80', 850, 11);
INSERT INTO products VALUES (93, 'Тестовый товар №81', 860, 3);
INSERT INTO products VALUES (94, 'Тестовый товар №82', 870, 5);
INSERT INTO products VALUES (95, 'Тестовый товар №83', 880, 13);
INSERT INTO products VALUES (96, 'Тестовый товар №84', 890, 1);
INSERT INTO products VALUES (97, 'Тестовый товар №85', 900, 6);
INSERT INTO products VALUES (98, 'Тестовый товар №86', 910, 11);
INSERT INTO products VALUES (99, 'Тестовый товар №87', 920, 2);
INSERT INTO products VALUES (100, 'Тестовый товар №88', 930, 12);
INSERT INTO products VALUES (101, 'Тестовый товар №89', 940, 2);
INSERT INTO products VALUES (102, 'Тестовый товар №90', 950, 13);
INSERT INTO products VALUES (103, 'Тестовый товар №91', 960, 3);
INSERT INTO products VALUES (104, 'Тестовый товар №92', 970, 2);
INSERT INTO products VALUES (105, 'Тестовый товар №93', 980, 8);
INSERT INTO products VALUES (106, 'Тестовый товар №94', 990, 3);
INSERT INTO products VALUES (107, 'Тестовый товар №95', 1000, 6);
INSERT INTO products VALUES (108, 'Тестовый товар №96', 1010, 12);
INSERT INTO products VALUES (109, 'Тестовый товар №97', 1020, 4);
INSERT INTO products VALUES (110, 'Тестовый товар №98', 1030, 14);
INSERT INTO products VALUES (111, 'Тестовый товар №99', 1040, 7);


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('products_id_seq', 111, true);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO schema_migrations VALUES ('20180126070504');
INSERT INTO schema_migrations VALUES ('20180126070740');
INSERT INTO schema_migrations VALUES ('20180126075414');
INSERT INTO schema_migrations VALUES ('20180126095254');


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO users VALUES (1, 'admin@mail.com', '$2a$10$ghozPmj5fPIVF9y2x2JiGudetlObk/VbZQEPuqyQF2257jKuQcgQ2', '2018-01-26 07:06:43.373526', '2018-01-26 07:06:43.373526');


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('users_id_seq', 1, true);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: articles articles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY articles
    ADD CONSTRAINT articles_pkey PRIMARY KEY (id);


--
-- Name: product_categories product_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY product_categories
    ADD CONSTRAINT product_categories_pkey PRIMARY KEY (id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_articles_on_body; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_articles_on_body ON articles USING btree (body);


--
-- Name: index_articles_on_title; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_articles_on_title ON articles USING btree (title);


--
-- Name: index_product_categories_on_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_product_categories_on_name ON product_categories USING btree (name);


--
-- Name: index_product_categories_on_parsed; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_product_categories_on_parsed ON product_categories USING btree (parsed);


--
-- Name: index_product_categories_on_source_url; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_product_categories_on_source_url ON product_categories USING btree (source_url);


--
-- Name: index_products_on_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_products_on_name ON products USING btree (name);


--
-- Name: index_products_on_price; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_products_on_price ON products USING btree (price);


--
-- Name: index_products_on_product_category_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_products_on_product_category_id ON products USING btree (product_category_id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_users_on_email ON users USING btree (email);


--
-- Name: index_users_on_password_digest; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_users_on_password_digest ON users USING btree (password_digest);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

