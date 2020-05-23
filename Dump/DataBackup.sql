--
-- PostgreSQL database dump
--

-- Dumped from database version 12.2
-- Dumped by pg_dump version 12.2

-- Started on 2020-05-16 17:06:22

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
-- TOC entry 2919 (class 0 OID 41582)
-- Dependencies: 203
-- Data for Name: adresse; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.adresse (id_adresse, numero_telepehone, nom_rue, numero_rue, code_postale, ville) FROM stdin;
1	621478858	Rue de nimes	1	30900	Nimes
2	214785455	Rue de paris	25	75000	Paris
3	556875214	Rue de bordeaux	5	33000	Bordeaux
4	752142144	Rue de lyon	78	69000	Lyon
5	642121147	Rue de paris	23	75000	Paris
\.


--
-- TOC entry 2918 (class 0 OID 41574)
-- Dependencies: 202
-- Data for Name: aidememoire; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.aidememoire (recette_pizza) FROM stdin;
Recette1
Recette2
Recette3
Recette4
Recette5
\.


--
-- TOC entry 2927 (class 0 OID 41630)
-- Dependencies: 211
-- Data for Name: client; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.client (client_id, nom, prenom, date_inscription, id_adresse) FROM stdin;
1	SALETTE	Patrick	2017-03-25	1
2	ZANNI	Pascal	2017-04-12	2
3	CASTANIED	Marie-pierre	2017-05-21	3
4	SHMIT	Marc	2017-08-30	4
5	GOSLING	James	2017-12-09	5
\.


--
-- TOC entry 2925 (class 0 OID 41617)
-- Dependencies: 209
-- Data for Name: point_de_vente; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.point_de_vente (pizzeria_id, date_creation, recette_pizzeria, id_adresse) FROM stdin;
1	2016-02-02	20	1
2	2016-08-12	12	2
\.


--
-- TOC entry 2932 (class 0 OID 41651)
-- Dependencies: 216
-- Data for Name: employe; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.employe (id_employer, date_emboche, prenom, login, motdepasse, role, pizzeria_id, id_adresse) FROM stdin;
1	2016-04-12	Marc	Marc_01	Marc01	Pizzaiollo	1	1
2	2016-04-14	Stephan	Stephan2	Steph02	Pizzaiollo	1	1
3	2016-04-11	Sylvie	Syl03	Syl3	Livreur	1	2
4	2017-04-27	Claire	Claire04	Claire04	Livreur	2	2
\.


--
-- TOC entry 2933 (class 0 OID 41660)
-- Dependencies: 217
-- Data for Name: commande; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.commande (commande_id, montant_total, resume_commande, mode_paimment, client_id, id_livreur, id_pizzaiollo) FROM stdin;
1	35	Article, Article, Article, 	Carte bleu	1	1	2
2	60	Article, Article, Article, Article, Article, Article, 	Espece	2	2	2
3	80	Article, Article, Article, Article, Article, Article, Article	Carte bleu 	3	1	1
4	110	Article, Article, Article, Article, Article, Article, Article, Article, Article, Article, Article, Article, Article, Article, Article	Espece	4	3	1
5	15	Article, Article	Espece	5	3	3
\.


--
-- TOC entry 2930 (class 0 OID 41642)
-- Dependencies: 214
-- Data for Name: facturation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.facturation (factureid, numerofacture, id_adresse, client_id) FROM stdin;
1	1	1	1
2	2	2	2
3	3	1	2
4	4	3	3
10	12	4	4
\.


--
-- TOC entry 2923 (class 0 OID 41603)
-- Dependencies: 207
-- Data for Name: ingrediant; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ingrediant (idingrediant, matierepremiere, stockunitaire, ingrediant_restant) FROM stdin;
1	Salade	3	3
2	Poulet	2	2
3	Tomate	1	1
4	Mozzarella	4	4
5	Fromage	5	5
\.


--
-- TOC entry 2921 (class 0 OID 41592)
-- Dependencies: 205
-- Data for Name: pizza; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pizza (pizza_id, prixpizza, nom, recette_pizza) FROM stdin;
1	20	PIZZA 4 STAGIONI	Recette1
2	12	PIZZA CAPRICCIOSA	Recette2
3	30	PIZZA MARGHERITA	Recette3
4	45	PIZZA MARINARA	Recette4
5	25	PIZZA ROMANA	Recette5
\.


--
-- TOC entry 2934 (class 0 OID 41668)
-- Dependencies: 218
-- Data for Name: ligne_commande; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ligne_commande (pizza_id, commande_id) FROM stdin;
1	1
1	2
1	3
1	4
\.


--
-- TOC entry 2924 (class 0 OID 41612)
-- Dependencies: 208
-- Data for Name: ligne_recette; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ligne_recette (pizza_id, idingrediant, quentite) FROM stdin;
1	1	12
1	2	10
2	2	10
3	3	5
\.


--
-- TOC entry 2926 (class 0 OID 41622)
-- Dependencies: 210
-- Data for Name: stock; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.stock (idingrediant, adresse_pizzeria, quantite) FROM stdin;
1	1	12
2	1	11
2	2	14
\.


--
-- TOC entry 2940 (class 0 OID 0)
-- Dependencies: 215
-- Name: employe_id_employer_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.employe_id_employer_seq', 1, false);


--
-- TOC entry 2941 (class 0 OID 0)
-- Dependencies: 212
-- Name: facturation_factureid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.facturation_factureid_seq', 1, false);


--
-- TOC entry 2942 (class 0 OID 0)
-- Dependencies: 213
-- Name: facturation_numerofacture_seq_2; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.facturation_numerofacture_seq_2', 1, false);


--
-- TOC entry 2943 (class 0 OID 0)
-- Dependencies: 206
-- Name: ingrediant_idingrediant_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ingrediant_idingrediant_seq', 1, false);


--
-- TOC entry 2944 (class 0 OID 0)
-- Dependencies: 204
-- Name: pizza_pizza_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pizza_pizza_id_seq', 1, false);


-- Completed on 2020-05-16 17:06:22

--
-- PostgreSQL database dump complete
--

