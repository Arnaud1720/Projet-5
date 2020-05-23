--
-- PostgreSQL database dump
--

-- Dumped from database version 12.2
-- Dumped by pg_dump version 12.2

-- Started on 2020-05-16 17:08:31

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

DROP DATABASE "DataBaseP5";
--
-- TOC entry 2940 (class 1262 OID 41487)
-- Name: DataBaseP5; Type: DATABASE; Schema: -; Owner: Administrateur
--

CREATE DATABASE "DataBaseP5" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'French_France.1252' LC_CTYPE = 'French_France.1252';


ALTER DATABASE "DataBaseP5" OWNER TO "Administrateur";

\connect "DataBaseP5"

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
-- TOC entry 2941 (class 0 OID 0)
-- Dependencies: 2940
-- Name: DATABASE "DataBaseP5"; Type: COMMENT; Schema: -; Owner: Administrateur
--

COMMENT ON DATABASE "DataBaseP5" IS 'etat final base de données projet 5';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 203 (class 1259 OID 41582)
-- Name: adresse; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.adresse (
    id_adresse integer NOT NULL,
    numero_telepehone integer NOT NULL,
    nom_rue character varying NOT NULL,
    numero_rue integer NOT NULL,
    code_postale integer NOT NULL,
    ville character varying NOT NULL
);


ALTER TABLE public.adresse OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 41574)
-- Name: aidememoire; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.aidememoire (
    recette_pizza character varying NOT NULL
);


ALTER TABLE public.aidememoire OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 41630)
-- Name: client; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.client (
    client_id integer NOT NULL,
    nom character varying NOT NULL,
    prenom character varying NOT NULL,
    date_inscription date NOT NULL,
    id_adresse integer NOT NULL
);


ALTER TABLE public.client OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 41660)
-- Name: commande; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.commande (
    commande_id integer NOT NULL,
    montant_total real NOT NULL,
    resume_commande character varying NOT NULL,
    mode_paimment character varying NOT NULL,
    client_id integer NOT NULL,
    id_livreur integer NOT NULL,
    id_pizzaiollo integer NOT NULL
);


ALTER TABLE public.commande OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 41651)
-- Name: employe; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employe (
    id_employer integer NOT NULL,
    date_emboche date NOT NULL,
    prenom character varying NOT NULL,
    login character varying NOT NULL,
    motdepasse character varying(255) NOT NULL,
    role character varying NOT NULL,
    pizzeria_id integer NOT NULL,
    id_adresse integer NOT NULL
);


ALTER TABLE public.employe OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 41649)
-- Name: employe_id_employer_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.employe_id_employer_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.employe_id_employer_seq OWNER TO postgres;

--
-- TOC entry 2942 (class 0 OID 0)
-- Dependencies: 215
-- Name: employe_id_employer_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.employe_id_employer_seq OWNED BY public.employe.id_employer;


--
-- TOC entry 214 (class 1259 OID 41642)
-- Name: facturation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.facturation (
    factureid integer NOT NULL,
    numerofacture integer NOT NULL,
    id_adresse integer NOT NULL,
    client_id integer NOT NULL
);


ALTER TABLE public.facturation OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 41638)
-- Name: facturation_factureid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.facturation_factureid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.facturation_factureid_seq OWNER TO postgres;

--
-- TOC entry 2943 (class 0 OID 0)
-- Dependencies: 212
-- Name: facturation_factureid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.facturation_factureid_seq OWNED BY public.facturation.factureid;


--
-- TOC entry 213 (class 1259 OID 41640)
-- Name: facturation_numerofacture_seq_2; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.facturation_numerofacture_seq_2
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.facturation_numerofacture_seq_2 OWNER TO postgres;

--
-- TOC entry 2944 (class 0 OID 0)
-- Dependencies: 213
-- Name: facturation_numerofacture_seq_2; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.facturation_numerofacture_seq_2 OWNED BY public.facturation.numerofacture;


--
-- TOC entry 207 (class 1259 OID 41603)
-- Name: ingrediant; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ingrediant (
    idingrediant integer NOT NULL,
    matierepremiere character varying NOT NULL,
    stockunitaire integer NOT NULL,
    ingrediant_restant integer NOT NULL
);


ALTER TABLE public.ingrediant OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 41601)
-- Name: ingrediant_idingrediant_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ingrediant_idingrediant_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ingrediant_idingrediant_seq OWNER TO postgres;

--
-- TOC entry 2945 (class 0 OID 0)
-- Dependencies: 206
-- Name: ingrediant_idingrediant_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ingrediant_idingrediant_seq OWNED BY public.ingrediant.idingrediant;


--
-- TOC entry 218 (class 1259 OID 41668)
-- Name: ligne_commande; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ligne_commande (
    pizza_id integer NOT NULL,
    commande_id integer NOT NULL
);


ALTER TABLE public.ligne_commande OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 41612)
-- Name: ligne_recette; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ligne_recette (
    pizza_id integer NOT NULL,
    idingrediant integer NOT NULL,
    quentite integer NOT NULL
);


ALTER TABLE public.ligne_recette OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 41592)
-- Name: pizza; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pizza (
    pizza_id integer NOT NULL,
    prixpizza integer NOT NULL,
    nom character varying(30) NOT NULL,
    recette_pizza character varying NOT NULL
);


ALTER TABLE public.pizza OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 41590)
-- Name: pizza_pizza_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pizza_pizza_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pizza_pizza_id_seq OWNER TO postgres;

--
-- TOC entry 2946 (class 0 OID 0)
-- Dependencies: 204
-- Name: pizza_pizza_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pizza_pizza_id_seq OWNED BY public.pizza.pizza_id;


--
-- TOC entry 209 (class 1259 OID 41617)
-- Name: point_de_vente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.point_de_vente (
    pizzeria_id integer NOT NULL,
    date_creation date NOT NULL,
    recette_pizzeria real NOT NULL,
    id_adresse integer NOT NULL
);


ALTER TABLE public.point_de_vente OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 41622)
-- Name: stock; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stock (
    idingrediant integer NOT NULL,
    adresse_pizzeria integer NOT NULL,
    quantite character varying NOT NULL
);


ALTER TABLE public.stock OWNER TO postgres;

--
-- TOC entry 2751 (class 2604 OID 41654)
-- Name: employe id_employer; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employe ALTER COLUMN id_employer SET DEFAULT nextval('public.employe_id_employer_seq'::regclass);


--
-- TOC entry 2749 (class 2604 OID 41645)
-- Name: facturation factureid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.facturation ALTER COLUMN factureid SET DEFAULT nextval('public.facturation_factureid_seq'::regclass);


--
-- TOC entry 2750 (class 2604 OID 41646)
-- Name: facturation numerofacture; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.facturation ALTER COLUMN numerofacture SET DEFAULT nextval('public.facturation_numerofacture_seq_2'::regclass);


--
-- TOC entry 2748 (class 2604 OID 41606)
-- Name: ingrediant idingrediant; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ingrediant ALTER COLUMN idingrediant SET DEFAULT nextval('public.ingrediant_idingrediant_seq'::regclass);


--
-- TOC entry 2747 (class 2604 OID 41595)
-- Name: pizza pizza_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pizza ALTER COLUMN pizza_id SET DEFAULT nextval('public.pizza_pizza_id_seq'::regclass);


--
-- TOC entry 2919 (class 0 OID 41582)
-- Dependencies: 203
-- Data for Name: adresse; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.adresse (id_adresse, numero_telepehone, nom_rue, numero_rue, code_postale, ville) VALUES (1, 621478858, 'Rue de nimes', 1, 30900, 'Nimes');
INSERT INTO public.adresse (id_adresse, numero_telepehone, nom_rue, numero_rue, code_postale, ville) VALUES (2, 214785455, 'Rue de paris', 25, 75000, 'Paris');
INSERT INTO public.adresse (id_adresse, numero_telepehone, nom_rue, numero_rue, code_postale, ville) VALUES (3, 556875214, 'Rue de bordeaux', 5, 33000, 'Bordeaux');
INSERT INTO public.adresse (id_adresse, numero_telepehone, nom_rue, numero_rue, code_postale, ville) VALUES (4, 752142144, 'Rue de lyon', 78, 69000, 'Lyon');
INSERT INTO public.adresse (id_adresse, numero_telepehone, nom_rue, numero_rue, code_postale, ville) VALUES (5, 642121147, 'Rue de paris', 23, 75000, 'Paris');


--
-- TOC entry 2918 (class 0 OID 41574)
-- Dependencies: 202
-- Data for Name: aidememoire; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.aidememoire (recette_pizza) VALUES ('Recette1');
INSERT INTO public.aidememoire (recette_pizza) VALUES ('Recette2');
INSERT INTO public.aidememoire (recette_pizza) VALUES ('Recette3');
INSERT INTO public.aidememoire (recette_pizza) VALUES ('Recette4');
INSERT INTO public.aidememoire (recette_pizza) VALUES ('Recette5');


--
-- TOC entry 2927 (class 0 OID 41630)
-- Dependencies: 211
-- Data for Name: client; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.client (client_id, nom, prenom, date_inscription, id_adresse) VALUES (1, 'SALETTE', 'Patrick', '2017-03-25', 1);
INSERT INTO public.client (client_id, nom, prenom, date_inscription, id_adresse) VALUES (2, 'ZANNI', 'Pascal', '2017-04-12', 2);
INSERT INTO public.client (client_id, nom, prenom, date_inscription, id_adresse) VALUES (3, 'CASTANIED', 'Marie-pierre', '2017-05-21', 3);
INSERT INTO public.client (client_id, nom, prenom, date_inscription, id_adresse) VALUES (4, 'SHMIT', 'Marc', '2017-08-30', 4);
INSERT INTO public.client (client_id, nom, prenom, date_inscription, id_adresse) VALUES (5, 'GOSLING', 'James', '2017-12-09', 5);


--
-- TOC entry 2933 (class 0 OID 41660)
-- Dependencies: 217
-- Data for Name: commande; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.commande (commande_id, montant_total, resume_commande, mode_paimment, client_id, id_livreur, id_pizzaiollo) VALUES (1, 35, 'Article, Article, Article, ', 'Carte bleu', 1, 1, 2);
INSERT INTO public.commande (commande_id, montant_total, resume_commande, mode_paimment, client_id, id_livreur, id_pizzaiollo) VALUES (2, 60, 'Article, Article, Article, Article, Article, Article, ', 'Espece', 2, 2, 2);
INSERT INTO public.commande (commande_id, montant_total, resume_commande, mode_paimment, client_id, id_livreur, id_pizzaiollo) VALUES (3, 80, 'Article, Article, Article, Article, Article, Article, Article', 'Carte bleu ', 3, 1, 1);
INSERT INTO public.commande (commande_id, montant_total, resume_commande, mode_paimment, client_id, id_livreur, id_pizzaiollo) VALUES (4, 110, 'Article, Article, Article, Article, Article, Article, Article, Article, Article, Article, Article, Article, Article, Article, Article', 'Espece', 4, 3, 1);
INSERT INTO public.commande (commande_id, montant_total, resume_commande, mode_paimment, client_id, id_livreur, id_pizzaiollo) VALUES (5, 15, 'Article, Article', 'Espece', 5, 3, 3);


--
-- TOC entry 2932 (class 0 OID 41651)
-- Dependencies: 216
-- Data for Name: employe; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.employe (id_employer, date_emboche, prenom, login, motdepasse, role, pizzeria_id, id_adresse) VALUES (1, '2016-04-12', 'Marc', 'Marc_01', 'Marc01', 'Pizzaiollo', 1, 1);
INSERT INTO public.employe (id_employer, date_emboche, prenom, login, motdepasse, role, pizzeria_id, id_adresse) VALUES (2, '2016-04-14', 'Stephan', 'Stephan2', 'Steph02', 'Pizzaiollo', 1, 1);
INSERT INTO public.employe (id_employer, date_emboche, prenom, login, motdepasse, role, pizzeria_id, id_adresse) VALUES (3, '2016-04-11', 'Sylvie', 'Syl03', 'Syl3', 'Livreur', 1, 2);
INSERT INTO public.employe (id_employer, date_emboche, prenom, login, motdepasse, role, pizzeria_id, id_adresse) VALUES (4, '2017-04-27', 'Claire', 'Claire04', 'Claire04', 'Livreur', 2, 2);


--
-- TOC entry 2930 (class 0 OID 41642)
-- Dependencies: 214
-- Data for Name: facturation; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.facturation (factureid, numerofacture, id_adresse, client_id) VALUES (1, 1, 1, 1);
INSERT INTO public.facturation (factureid, numerofacture, id_adresse, client_id) VALUES (2, 2, 2, 2);
INSERT INTO public.facturation (factureid, numerofacture, id_adresse, client_id) VALUES (3, 3, 1, 2);
INSERT INTO public.facturation (factureid, numerofacture, id_adresse, client_id) VALUES (4, 4, 3, 3);
INSERT INTO public.facturation (factureid, numerofacture, id_adresse, client_id) VALUES (10, 12, 4, 4);


--
-- TOC entry 2923 (class 0 OID 41603)
-- Dependencies: 207
-- Data for Name: ingrediant; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.ingrediant (idingrediant, matierepremiere, stockunitaire, ingrediant_restant) VALUES (1, 'Salade', 3, 3);
INSERT INTO public.ingrediant (idingrediant, matierepremiere, stockunitaire, ingrediant_restant) VALUES (2, 'Poulet', 2, 2);
INSERT INTO public.ingrediant (idingrediant, matierepremiere, stockunitaire, ingrediant_restant) VALUES (3, 'Tomate', 1, 1);
INSERT INTO public.ingrediant (idingrediant, matierepremiere, stockunitaire, ingrediant_restant) VALUES (4, 'Mozzarella', 4, 4);
INSERT INTO public.ingrediant (idingrediant, matierepremiere, stockunitaire, ingrediant_restant) VALUES (5, 'Fromage', 5, 5);


--
-- TOC entry 2934 (class 0 OID 41668)
-- Dependencies: 218
-- Data for Name: ligne_commande; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.ligne_commande (pizza_id, commande_id) VALUES (1, 1);
INSERT INTO public.ligne_commande (pizza_id, commande_id) VALUES (1, 2);
INSERT INTO public.ligne_commande (pizza_id, commande_id) VALUES (1, 3);
INSERT INTO public.ligne_commande (pizza_id, commande_id) VALUES (1, 4);


--
-- TOC entry 2924 (class 0 OID 41612)
-- Dependencies: 208
-- Data for Name: ligne_recette; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.ligne_recette (pizza_id, idingrediant, quentite) VALUES (1, 1, 12);
INSERT INTO public.ligne_recette (pizza_id, idingrediant, quentite) VALUES (1, 2, 10);
INSERT INTO public.ligne_recette (pizza_id, idingrediant, quentite) VALUES (2, 2, 10);
INSERT INTO public.ligne_recette (pizza_id, idingrediant, quentite) VALUES (3, 3, 5);


--
-- TOC entry 2921 (class 0 OID 41592)
-- Dependencies: 205
-- Data for Name: pizza; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.pizza (pizza_id, prixpizza, nom, recette_pizza) VALUES (1, 20, 'PIZZA 4 STAGIONI', 'Recette1');
INSERT INTO public.pizza (pizza_id, prixpizza, nom, recette_pizza) VALUES (2, 12, 'PIZZA CAPRICCIOSA', 'Recette2');
INSERT INTO public.pizza (pizza_id, prixpizza, nom, recette_pizza) VALUES (3, 30, 'PIZZA MARGHERITA', 'Recette3');
INSERT INTO public.pizza (pizza_id, prixpizza, nom, recette_pizza) VALUES (4, 45, 'PIZZA MARINARA', 'Recette4');
INSERT INTO public.pizza (pizza_id, prixpizza, nom, recette_pizza) VALUES (5, 25, 'PIZZA ROMANA', 'Recette5');


--
-- TOC entry 2925 (class 0 OID 41617)
-- Dependencies: 209
-- Data for Name: point_de_vente; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.point_de_vente (pizzeria_id, date_creation, recette_pizzeria, id_adresse) VALUES (1, '2016-02-02', 20, 1);
INSERT INTO public.point_de_vente (pizzeria_id, date_creation, recette_pizzeria, id_adresse) VALUES (2, '2016-08-12', 12, 2);


--
-- TOC entry 2926 (class 0 OID 41622)
-- Dependencies: 210
-- Data for Name: stock; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.stock (idingrediant, adresse_pizzeria, quantite) VALUES (1, 1, '12');
INSERT INTO public.stock (idingrediant, adresse_pizzeria, quantite) VALUES (2, 1, '11');
INSERT INTO public.stock (idingrediant, adresse_pizzeria, quantite) VALUES (2, 2, '14');


--
-- TOC entry 2947 (class 0 OID 0)
-- Dependencies: 215
-- Name: employe_id_employer_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.employe_id_employer_seq', 1, false);


--
-- TOC entry 2948 (class 0 OID 0)
-- Dependencies: 212
-- Name: facturation_factureid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.facturation_factureid_seq', 1, false);


--
-- TOC entry 2949 (class 0 OID 0)
-- Dependencies: 213
-- Name: facturation_numerofacture_seq_2; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.facturation_numerofacture_seq_2', 1, false);


--
-- TOC entry 2950 (class 0 OID 0)
-- Dependencies: 206
-- Name: ingrediant_idingrediant_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ingrediant_idingrediant_seq', 1, false);


--
-- TOC entry 2951 (class 0 OID 0)
-- Dependencies: 204
-- Name: pizza_pizza_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pizza_pizza_id_seq', 1, false);


--
-- TOC entry 2755 (class 2606 OID 41589)
-- Name: adresse adresse_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.adresse
    ADD CONSTRAINT adresse_pk PRIMARY KEY (id_adresse);


--
-- TOC entry 2753 (class 2606 OID 41581)
-- Name: aidememoire aidememoire_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aidememoire
    ADD CONSTRAINT aidememoire_pk PRIMARY KEY (recette_pizza);


--
-- TOC entry 2767 (class 2606 OID 41637)
-- Name: client client_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT client_pk PRIMARY KEY (client_id);


--
-- TOC entry 2773 (class 2606 OID 41667)
-- Name: commande commande_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.commande
    ADD CONSTRAINT commande_pk PRIMARY KEY (commande_id);


--
-- TOC entry 2771 (class 2606 OID 41659)
-- Name: employe employe_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employe
    ADD CONSTRAINT employe_pk PRIMARY KEY (id_employer);


--
-- TOC entry 2769 (class 2606 OID 41648)
-- Name: facturation facturation_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.facturation
    ADD CONSTRAINT facturation_pk PRIMARY KEY (factureid);


--
-- TOC entry 2759 (class 2606 OID 41611)
-- Name: ingrediant ingrediant_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ingrediant
    ADD CONSTRAINT ingrediant_pk PRIMARY KEY (idingrediant);


--
-- TOC entry 2775 (class 2606 OID 41672)
-- Name: ligne_commande ligne_commande_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ligne_commande
    ADD CONSTRAINT ligne_commande_pk PRIMARY KEY (pizza_id, commande_id);


--
-- TOC entry 2761 (class 2606 OID 41616)
-- Name: ligne_recette ligne_recette_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ligne_recette
    ADD CONSTRAINT ligne_recette_pk PRIMARY KEY (pizza_id, idingrediant);


--
-- TOC entry 2757 (class 2606 OID 41600)
-- Name: pizza pizza_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pizza
    ADD CONSTRAINT pizza_pk PRIMARY KEY (pizza_id);


--
-- TOC entry 2763 (class 2606 OID 41621)
-- Name: point_de_vente point_de_vente_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.point_de_vente
    ADD CONSTRAINT point_de_vente_pk PRIMARY KEY (pizzeria_id);


--
-- TOC entry 2765 (class 2606 OID 41629)
-- Name: stock stock_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock
    ADD CONSTRAINT stock_pk PRIMARY KEY (idingrediant, adresse_pizzeria);


--
-- TOC entry 2782 (class 2606 OID 41693)
-- Name: client adresse_client_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT adresse_client_fk FOREIGN KEY (id_adresse) REFERENCES public.adresse(id_adresse);


--
-- TOC entry 2785 (class 2606 OID 41678)
-- Name: employe adresse_employe_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employe
    ADD CONSTRAINT adresse_employe_fk FOREIGN KEY (id_adresse) REFERENCES public.adresse(id_adresse);


--
-- TOC entry 2783 (class 2606 OID 41688)
-- Name: facturation adresse_facturation_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.facturation
    ADD CONSTRAINT adresse_facturation_fk FOREIGN KEY (id_adresse) REFERENCES public.adresse(id_adresse);


--
-- TOC entry 2779 (class 2606 OID 41683)
-- Name: point_de_vente adresse_point_de_vente_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.point_de_vente
    ADD CONSTRAINT adresse_point_de_vente_fk FOREIGN KEY (id_adresse) REFERENCES public.adresse(id_adresse);


--
-- TOC entry 2776 (class 2606 OID 41673)
-- Name: pizza aidememoire_pizza_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pizza
    ADD CONSTRAINT aidememoire_pizza_fk FOREIGN KEY (recette_pizza) REFERENCES public.aidememoire(recette_pizza);


--
-- TOC entry 2787 (class 2606 OID 41728)
-- Name: commande client_commande_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.commande
    ADD CONSTRAINT client_commande_fk FOREIGN KEY (client_id) REFERENCES public.client(client_id);


--
-- TOC entry 2784 (class 2606 OID 41733)
-- Name: facturation client_facturation_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.facturation
    ADD CONSTRAINT client_facturation_fk FOREIGN KEY (client_id) REFERENCES public.client(client_id);


--
-- TOC entry 2791 (class 2606 OID 41748)
-- Name: ligne_commande commande_ligne_commande_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ligne_commande
    ADD CONSTRAINT commande_ligne_commande_fk FOREIGN KEY (commande_id) REFERENCES public.commande(commande_id);


--
-- TOC entry 2788 (class 2606 OID 41738)
-- Name: commande employe_commande_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.commande
    ADD CONSTRAINT employe_commande_fk FOREIGN KEY (id_livreur) REFERENCES public.employe(id_employer);


--
-- TOC entry 2789 (class 2606 OID 41743)
-- Name: commande employe_commande_fk1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.commande
    ADD CONSTRAINT employe_commande_fk1 FOREIGN KEY (id_pizzaiollo) REFERENCES public.employe(id_employer);


--
-- TOC entry 2780 (class 2606 OID 41713)
-- Name: stock ingrediant_stock_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock
    ADD CONSTRAINT ingrediant_stock_fk FOREIGN KEY (idingrediant) REFERENCES public.ingrediant(idingrediant);


--
-- TOC entry 2790 (class 2606 OID 41698)
-- Name: ligne_commande pizza_ligne_commande_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ligne_commande
    ADD CONSTRAINT pizza_ligne_commande_fk FOREIGN KEY (pizza_id) REFERENCES public.pizza(pizza_id);


--
-- TOC entry 2777 (class 2606 OID 41703)
-- Name: ligne_recette pizza_ligne_stock_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ligne_recette
    ADD CONSTRAINT pizza_ligne_stock_fk FOREIGN KEY (pizza_id) REFERENCES public.pizza(pizza_id);


--
-- TOC entry 2786 (class 2606 OID 41723)
-- Name: employe point_de_vente_employe_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employe
    ADD CONSTRAINT point_de_vente_employe_fk FOREIGN KEY (pizzeria_id) REFERENCES public.point_de_vente(pizzeria_id);


--
-- TOC entry 2781 (class 2606 OID 41718)
-- Name: stock point_de_vente_stock_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock
    ADD CONSTRAINT point_de_vente_stock_fk FOREIGN KEY (adresse_pizzeria) REFERENCES public.point_de_vente(pizzeria_id);


--
-- TOC entry 2778 (class 2606 OID 41708)
-- Name: ligne_recette stock_ligne_stock_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ligne_recette
    ADD CONSTRAINT stock_ligne_stock_fk FOREIGN KEY (idingrediant) REFERENCES public.ingrediant(idingrediant);


-- Completed on 2020-05-16 17:08:31

--
-- PostgreSQL database dump complete
--

