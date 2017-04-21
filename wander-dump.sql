--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.5
-- Dumped by pg_dump version 9.5.5

SET statement_timeout = 0;
SET lock_timeout = 0;
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
-- Name: airlines; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE airlines (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    code character varying(5) NOT NULL
);


ALTER TABLE airlines OWNER TO vagrant;

--
-- Name: airlines_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE airlines_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE airlines_id_seq OWNER TO vagrant;

--
-- Name: airlines_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE airlines_id_seq OWNED BY airlines.id;


--
-- Name: airports; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE airports (
    id integer NOT NULL,
    country_id integer,
    city_id integer,
    code character varying(5) NOT NULL,
    name character varying(100) NOT NULL,
    latitude double precision,
    longitude double precision
);


ALTER TABLE airports OWNER TO vagrant;

--
-- Name: airports_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE airports_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE airports_id_seq OWNER TO vagrant;

--
-- Name: airports_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE airports_id_seq OWNED BY airports.id;


--
-- Name: bucket_lists; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE bucket_lists (
    id integer NOT NULL,
    title character varying(100) NOT NULL,
    email character varying(32) NOT NULL
);


ALTER TABLE bucket_lists OWNER TO vagrant;

--
-- Name: bucket_lists_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE bucket_lists_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE bucket_lists_id_seq OWNER TO vagrant;

--
-- Name: bucket_lists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE bucket_lists_id_seq OWNED BY bucket_lists.id;


--
-- Name: cities; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE cities (
    id integer NOT NULL,
    country_id integer,
    name character varying(100) NOT NULL,
    code character varying(10) NOT NULL
);


ALTER TABLE cities OWNER TO vagrant;

--
-- Name: cities_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE cities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cities_id_seq OWNER TO vagrant;

--
-- Name: cities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE cities_id_seq OWNED BY cities.id;


--
-- Name: countries; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE countries (
    id integer NOT NULL,
    code character varying(5) NOT NULL,
    name character varying(200) NOT NULL
);


ALTER TABLE countries OWNER TO vagrant;

--
-- Name: countries_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE countries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE countries_id_seq OWNER TO vagrant;

--
-- Name: countries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE countries_id_seq OWNED BY countries.id;


--
-- Name: friends; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE friends (
    id integer NOT NULL,
    "user" character varying(200) NOT NULL,
    fb_friend character varying(200) NOT NULL
);


ALTER TABLE friends OWNER TO vagrant;

--
-- Name: friends_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE friends_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE friends_id_seq OWNER TO vagrant;

--
-- Name: friends_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE friends_id_seq OWNED BY friends.id;


--
-- Name: journals; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE journals (
    id integer NOT NULL,
    priv_item_id integer,
    title character varying(100),
    date timestamp without time zone NOT NULL
);


ALTER TABLE journals OWNER TO vagrant;

--
-- Name: journals_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE journals_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE journals_id_seq OWNER TO vagrant;

--
-- Name: journals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE journals_id_seq OWNED BY journals.id;


--
-- Name: private_items; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE private_items (
    id integer NOT NULL,
    public_item_id integer NOT NULL,
    list_id integer NOT NULL,
    tour_link character varying(200),
    checked_off boolean NOT NULL,
    date_created timestamp without time zone NOT NULL,
    date_completed timestamp without time zone,
    priority character varying(6)
);


ALTER TABLE private_items OWNER TO vagrant;

--
-- Name: private_items_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE private_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE private_items_id_seq OWNER TO vagrant;

--
-- Name: private_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE private_items_id_seq OWNED BY private_items.id;


--
-- Name: public_items; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE public_items (
    id integer NOT NULL,
    title character varying(100) NOT NULL,
    latitude double precision NOT NULL,
    longitude double precision NOT NULL,
    country character varying(100) NOT NULL,
    address character varying(200) NOT NULL,
    image character varying(200) NOT NULL,
    description character varying(300),
    retired boolean
);


ALTER TABLE public_items OWNER TO vagrant;

--
-- Name: public_items_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE public_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public_items_id_seq OWNER TO vagrant;

--
-- Name: public_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE public_items_id_seq OWNED BY public_items.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE users (
    email character varying(200) NOT NULL,
    username character varying(60) NOT NULL,
    password character varying(70) NOT NULL,
    first_name character varying(32) NOT NULL,
    last_name character varying(32) NOT NULL,
    facebook_id character varying(50),
    profile_picture character varying(200)
);


ALTER TABLE users OWNER TO vagrant;

--
-- Name: id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY airlines ALTER COLUMN id SET DEFAULT nextval('airlines_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY airports ALTER COLUMN id SET DEFAULT nextval('airports_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY bucket_lists ALTER COLUMN id SET DEFAULT nextval('bucket_lists_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY cities ALTER COLUMN id SET DEFAULT nextval('cities_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY countries ALTER COLUMN id SET DEFAULT nextval('countries_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY friends ALTER COLUMN id SET DEFAULT nextval('friends_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY journals ALTER COLUMN id SET DEFAULT nextval('journals_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY private_items ALTER COLUMN id SET DEFAULT nextval('private_items_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public_items ALTER COLUMN id SET DEFAULT nextval('public_items_id_seq'::regclass);


--
-- Data for Name: airlines; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY airlines (id, name, code) FROM stdin;
1	1Time Airline	1T
2	40-Mile Air	Q5
3	Ansett Australia	AN
4	Abacus International	1B
5	Abelag Aviation	W9
6	Aigle Azur	ZI
7	Aloha Airlines	AQ
8	American Airlines	AA
9	Asiana Airlines	OZ
10	Askari Aviation	4K
11	Afriqiyah Airways	8U
12	Afrinat International Airlines	Q9
13	Allegiant Air	G4
14	Aban Air	K5
15	ABSA - Aerolinhas Brasileiras	M3
16	Antrak Air	04
17	Airborne Express	GB
18	ABX Air	GB
19	Astral Aviation	8V
20	Aero Asia International	E4
21	Air Togo	YT
22	Advance Leasing Company	4G
23	Aztec Worldwide Airlines	7A
24	Air Tindi	8T
25	Ada Air	ZY
26	ADC Airlines	Z7
27	Adria Airways	JP
28	Air Europa	UX
29	Aero Benin	EM
30	Aegean Airlines	A3
31	Air Atlantique	KI
32	Air Europe	PE
33	Alaska Central Express	KO
34	Astraeus	5W
35	Aerosvit Airlines	VV
36	Air Italy	I9
37	American Falcon	WK
38	Alliance Airlines	QQ
39	Ariana Afghan Airlines	FG
40	Aeroflot Russian Airlines	SU
41	Air Bosna	JA
42	Air France	AF
43	Air Caledonie International	SB
44	Air Gabon	GN
45	Air Salone	2O
46	Air Cargo Carriers	2Q
47	Air Senegal International	V7
48	Air Namibia	SW
49	Air Service Gabon	G8
50	Aerolitoral	5D
51	Amadeus Global Travel Distribution	1A
52	Air Glaciers	7T
53	Aeroper	PL
54	Atlas Blue	8A
55	Air Alpha Greenland	GD
56	Air Hong Kong	LD
57	Aeromist-Kharkiv	HT
58	Azerbaijan Airlines	J2
59	Avies	U3
60	Airbus Industrie	AP
61	Alpine Air Express	5A
62	Airblue	ED
63	Air Berlin	AB
64	Air Contractors	AG
65	Air India Limited	AI
66	Air Bourbon	ZB
67	Air Atlanta Icelandic	CC
68	Air Srpska	RB
69	Air Tahiti Nui	TN
70	Aero Services Executive	W4
71	Arkia Israel Airlines	IZ
72	Air Jamaica	JM
73	Air One	AP
74	Air Sahara	S2
75	Air Malta	KM
76	Amerijet International	M6
77	Air Japan	NQ
78	Air Kiribati	4A
79	Air Nippon Network Co. Ltd.	EH
80	America West Airlines	HP
81	Air Wisconsin	ZW
82	Tatarstan Airlines	U9
83	Air Libert	VD
84	Air Lithuania	TT
85	Air Malawi	QM
86	Air Sicilia	BM
87	Air Macau	NX
88	Air Midwest	ZV
89	Air Seychelles	HM
90	AeroMéxico	AM
91	All Nippon Airways	NH
92	Air Nostrum	YW
93	Air Niugini	PX
94	Air Arabia	G9
95	Air Canada	AC
96	Air Baltic	BT
97	Air Nippon	EL
98	Airnorth	TL
99	Air North Charter - Canada	4N
100	AOM French Airlines	IW
101	Air New Zealand	NZ
102	AVCOM	J6
103	Aero VIP	2D
104	Air Vegas	6V
105	Alitalia Express	XM
106	Asia Overnight Express	OE
107	Aero Flight	GV
108	Arrow Air	JW
109	Arik Air	W3
110	Aerocondor	2B
111	Aires	4C
112	Aerolineas Argentinas	AR
113	Air Armenia	QN
114	Alaska Airlines	AS
115	Air Sinai	4D
116	Airstars	PL
117	Atlantic Southeast Airlines	EV
118	Astrakhan Airlines	OB
119	Air Tanzania	TC
120	Air Burkina	2J
121	Aero-Tropics Air Services	HC
122	Airlines Of Tasmania	FO
123	Air Saint Pierre	PJ
124	Air Transport International	8C
125	Austrian Airlines	OS
126	Augsburg Airways	IQ
127	AirBridge Cargo	RU
128	Abu Dhabi Amiri Flight	MO
129	Aeroflot-Nord	5N
130	Aurigny Air Services	GR
131	Aus-Air	NO
132	Austral Lineas Aereas	AU
133	Australian Airlines	AO
134	Avianca - Aerovias Nacionales de Colombia	AV
135	Air Vanuatu	NF
136	Airlink Zambia	K8
137	Air Bangladesh	B9
138	Air Mediterranee	DR
139	Aeroline GmbH	7E
140	Air Wales	6G
141	Air Caraïbes	TX
142	Air India Express	IX
143	Asian Express Airlines	HJ
144	Air Exel	XT
145	AirAsia	AK
146	Axis Airways	6V
147	Atlant-Soyuz Airlines	3G
148	Alitalia	AZ
149	Arcus-Air Logistic	ZE
150	Amaszonas	Z8
151	Air Zimbabwe	UM
152	Aserca Airlines	R7
153	Rossiya-Russian Airlines	FV
154	Aviaexpress	RX
155	American Eagle Airlines	MQ
156	Airshop	FF
157	African Transport Trading and Investment Company	ML
158	Air Ivoire	VU
159	Air Botswana	BP
160	Air Foyle	GS
161	Air Tahiti	VT
162	Air Urga	3N
163	Air VIA	VL
164	Africa West	FK
165	Avirex	G2
166	ATRAN Cargo Airlines	V8
167	Avensa	VE
168	Avolar Aerolineas	V5
169	Air China	CA
170	Aero Condor Peru	Q6
171	Arctic Circle Air Service	5F
172	Air Corridor	QC
173	Air Central	NV
174	Air Chathams	CV
175	Air Marshall Islands	CW
176	Access Air	ZA
177	Air Algerie	AH
178	Adam Air	KI
179	Astar Air Cargo	ER
180	Antinea Airlines	HO
181	Air Dolomiti	EN
182	Aeroflot-Don	D9
183	Air Madrid	NM
184	Aero Airlines	EE
185	Air City	4F
186	Aer Lingus	EI
187	Alpi Eagles	E8
188	Air S	KY
189	Air Fiji	PC
190	Air Finland	OF
191	Air Pacific	FJ
192	Atlantic Airways	RC
193	Air Florida	QH
194	Air Iceland	NY
195	Air Philippines	2P
196	Air Georgian	ZX
197	Air Guinee Express	2U
198	Amber Air	0A
199	Air Georgia	DA
200	Air Greenland	GL
201	Allegro	LL
202	Atlas Air	5Y
203	Air Guyane	GG
204	Air D'Ayiti	H9
205	Air Comores International	GG
206	Air Horizon	8C
207	Air Bagan	W9
208	Atyrau Air Ways	IP
209	Air Canada Jazz	QK
210	Atlasjet	KK
211	Air Koryo	JS
212	Air Astana	KC
213	Albanian Airlines	LV
214	Alidaunia	D4
215	Alliance Air	CD
216	Aerolane	XL
217	Air Alps Aviation	A6
218	Atlantis European Airways	TD
219	Air Luxor GB	L8
220	Air Luxor	LK
221	Air Mauritius	MK
222	Air Madagascar	MD
223	Air Moldova	9U
224	Aero Mongolia	M0
225	Air Plus Comet	A7
226	Aeromexpress	QO
227	Air Mauritanie	MR
228	Aeroland Airways	3S
229	Astair	8D
230	Albarka Air	F4
231	Aero Contractors	AJ
232	Air Burundi	8Y
233	Aeropelican Air Services	OT
234	Air Paradise International	AD
235	Air Class Lineas Aereas	QD
236	African Safari Airways	QS
237	Airbus France	4Y
238	Air Mobility Command	MC
239	Aer Arann	RE
240	Air Austral	UU
241	Asian Spirit	6K
242	Air Afrique	RK
243	Airlinair	A5
244	Aero Lanka	QL
245	Armenian International Airways	MV
246	Air Salone	20
247	Armavia	U8
248	Aeromar	BQ
249	AeroRep	P5
250	Aero-Service	BF
251	Aerosur	5L
252	Air Santo Domingo	EX
253	Aero California	JR
254	Avient Aviation	Z3
255	Air Service	M3
256	Air Slovakia	GM
257	Aircompany Yakutia	R3
258	Aeromar	VW
259	Air Turks and Caicos	JY
260	Arkefly	OR
261	Airlines PNG	CG
262	Air Cal	TY
263	AirTran Airways	FL
264	Air Transat	TS
265	Avialeasing Aviation Company	EC
266	Austrian Arrows	VO
267	Aero-Charter Ukraine	DW
268	Air Ukraine	6U
269	Aerolineas Galapagos (Aerogal)	2K
270	Alrosa Mirny Air Enterprise	6R
271	Baker Aviation	8Q
272	British Airways	BA
273	Biman Bangladesh Airlines	BG
274	Bluebird Cargo	BF
275	BACH Flugbetriebsges	B4
276	Blue Dart Aviation	BZ
277	B&H Airlines	JA
278	Buffalo Airways	J4
279	Benin Golf Air	A8
280	Belair Airlines	4T
281	Bahamasair	UP
282	Bringer Air Cargo Taxi Aereo	E6
283	Balkan Bulgarian Airlines	LZ
284	BA Connect	TH
285	British International Helicopters	BS
286	Bankair	B4
287	Bangkok Airways	PG
288	Blue1	KF
289	Bearskin Lake Air Service	JV
290	Bellview Airlines	B3
291	bmi	BD
292	bmibaby	WW
293	Bemidji Airlines	CH
294	Bismillah Airlines	5Z
295	Bouraq Indonesia Airlines	BO
296	Blue Panorama Airlines	BV
297	BRA-Transportes Aereos	7R
298	Bering Air	8E
299	Belavia Belarusian Airlines	B2
300	Bravo Air Congo	K6
301	Braniff International Airways	BN
302	Big Sky Airlines	GQ
303	BAL Bashkirian Airlines	V9
304	Metro Batavia	7P
305	Berjaya Air	J8
306	Blue Wings	QW
307	BAX Global	8W
308	Bayu Indonesia Air	BM
309	Brit Air	DB
310	Boston-Maine Airways	E9
311	Brussels Airlines	SN
312	Binter Canarias	NT
313	Blue Air	0B
314	British Mediterranean Airways	KJ
315	Bulgaria Air	FB
316	Barents AirLink	8N
317	CAL Cargo Air Lines	5C
318	CHC Airways	AW
319	Calima Aviacion	XG
320	Calm Air	MO
321	Camai Air	R9
322	Cameroon Airlines	UY
323	CanJet	C6
324	Canadian Airlines	CP
325	Canadian North	5T
326	Canadian Western Airlines	W2
327	Cape Air	9K
328	Capital Cargo International Airlines	PT
329	Cargo 360	GG
330	Cargoitalia	2G
331	Cargojet Airways	W8
332	Cargolux	CV
333	Caribbean Airlines	BW
334	Caribbean Star Airlines	8B
335	Carpatair	V3
336	Caspian Airlines	RV
337	Cathay Pacific	CX
338	Cayman Airways	KX
339	Cebu Pacific	5J
340	Centavia	7N
341	Centralwings	C0
342	Centre-Avia	J7
343	Centurion Air Cargo	WE
344	Chalk's Ocean Airways	OP
345	Champion Air	MG
346	Changan Airlines	2Z
347	Chari Aviation Services	S8
348	Chautauqua Airlines	RP
349	Chicago Express	C8
350	China Airlines	CI
351	China Cargo Airlines	CK
352	China Eastern Airlines	MU
353	China Northern Airlines	CJ
354	China Northwest Airlines	WH
355	China Postal Airlines	8Y
356	China Southern Airlines	CZ
357	China United Airlines	HR
358	China Xinhua Airlines	XO
359	Yunnan Airlines	3Q
360	Chitaavia	X7
361	Cielos Airlines	A2
362	Cimber Air	QI
363	Cirrus Airlines	C9
364	City Airline	CF
365	City Connexion Airlines	G3
366	CityJet	WX
367	BA CityFlyer	CJ
368	Civil Air Transport	CT
369	Club Air	6P
370	Coast Air	BX
371	Coastal Air	DQ
372	Colgan Air	9L
373	Comair	OH
374	Comair	MN
375	CommutAir	C5
376	Comores Airlines	KR
377	Compania Mexicargo	GJ
378	Compass Airlines	CP
379	Condor Flugdienst	DE
380	Consorcio Aviaxsa	6A
381	Contact Air	C3
382	Continental Airlines	CO
383	Continental Airways	PC
384	Continental Express	CO
385	Continental Micronesia	CS
386	Conviasa	V0
387	Copa Airlines	CM
388	Corsairfly	SS
389	Corse-Mediterranee	XK
390	Cosmic Air	F5
391	Croatia Airlines	OU
392	Crossair Europe	QE
393	Cubana de Aviación	CU
394	Cyprus Airways	CY
395	Cyprus Turkish Airlines	YK
396	Czech Airlines	OK
397	DAS Air Cargo	WD
398	DAT Danish Air Transport	DX
399	DHL International	ES
400	DHL de Guatemala	L3
401	Daallo Airlines	D3
402	Dagestan Airlines	N2
403	Dalavia	H8
404	Darwin Airline	0D
405	Dauair	D5
406	Delta Air Lines	DL
407	Deutsche Bahn	2A
408	Deutsche Rettungsflugwacht	1I
409	Dinar	D7
410	Dirgantara Air Service	AW
411	Discovery Airways	DH
412	Djibouti Airlines	D8
413	Dominicana de Aviaci	DO
414	Domodedovo Airlines	E3
415	DonbassAero	5D
416	Dragonair	KA
417	Druk Air	KB
418	dba	DI
419	Electronic Data Systems	1C
420	EUjet	VE
421	EVA Air	BR
422	Eagle Air	H7
423	East African	QU
424	East African Safari Air	S9
425	Eastern Airways	T3
426	Eastland Air	DK
427	Eastwind Airlines	W9
428	Edelweiss Air	WK
429	Egyptair	MS
430	El Al Israel Airlines	LY
431	El-Buraq Air Transport	UZ
432	Emirates	EK
433	Empire Airlines	EM
434	Empresa Ecuatoriana De Aviacion	EU
435	Enkor JSC	G8
436	Eos Airlines	E0
437	Eritrean Airlines	B8
438	Estafeta Carga Aerea	E7
439	Estonian Air	OV
440	Ethiopian Airlines	ET
441	Etihad Airways	EY
442	Euro Exec Express	RZ
443	EuroAtlantic Airways	MM
444	Eurocypria Airlines	UI
445	Eurofly Service	GJ
446	Eurolot	K2
447	Euromanx Airways	3W
448	European Air Express	EA
449	European Air Transport	QY
450	European Aviation Air Charter	E7
451	Eurowings	EW
452	Evergreen International Airlines	EZ
453	Excel Airways	JN
454	Execair Aviation	MB
455	Executive Airlines	OW
456	Expo Aviation	8D
457	Express One International	EO
458	ExpressJet	XE
459	easyJet	U2
460	Falcon Aviation	IH
461	Far Eastern Air Transport	EF
462	Faroejet	F6
463	Faso Airways	F3
464	Federal Express	FX
465	Fika Salaama Airlines	N8
466	Finalair Congo	4S
467	Finnair	AY
468	Finncomm Airlines	FC
469	Firefly	FY
470	First Air	7F
471	First Choice Airways	DP
472	Fischer Air	8F
473	Flightline	B5
474	Florida Coastal Airlines	PA
475	Florida West International Airways	RF
476	Fly Air	F2
477	Fly Me Sweden	SH
478	AirAsia X	D7
479	FlyLal	TE
480	FlyNordic	LF
481	Flybaboo	F7
482	Flybe	BE
483	Flyglobespan	B4
484	Formosa Airlines	VY
485	Forward Air International Airlines	BN
486	Four Star Aviation / Four Star Cargo	HK
487	Freedom Air	FP
488	Frontier Airlines	F9
489	Frontier Flying Service	2F
490	Futura International Airways	FH
491	GB Airways	GT
492	Galaxy Air	7O
493	Galileo International	1G
494	Gambia International Airlines	GC
495	Gandalf Airlines	G7
496	Garuda Indonesia	GA
497	Gazpromavia	4G
498	Gemini Air Cargo	GR
499	Georgian Airways	A9
500	Georgian National Airlines	QB
501	Germania	ST
502	Germanwings	4U
503	Gestair	GP
504	Ghana International Airlines	G0
505	Go Air	G8
506	Go One Airways	GK
507	GoJet Airlines	G7
508	Gol Transportes Aéreos	G3
509	Golden Air	DC
510	Gorkha Airlines	G1
511	Grant Aviation	GS
512	Great Lakes Airlines	ZK
513	Great Wall Airlines	IJ
514	Grupo TACA	TA
515	Guine Bissaur Airlines	G6
516	Guinee Airlines	J9
517	Gujarat Airways	G8
518	Gulf Air Bahrain	GF
519	Guyana Airways 2000	GY
520	Hageland Aviation Services	H6
521	Hahn Air	HR
522	Hainan Airlines	HU
523	Hainan Phoenix Information Systems	1R
524	Haiti Ambassador Airlines	2T
525	Hamburg International	4R
526	TUIfly	X3
527	Hapagfly	HF
528	Harbor Airlines	HB
529	Harmony Airways	HQ
530	Hawaiian Airlines	HA
531	Hawaiian Pacific Airlines	HP
532	Hawkair	BH
533	Heavylift Cargo Airlines	HN
534	Heli France	8H
535	Helijet	JB
536	Helios Airways	ZU
537	Hellas Jet	T4
538	Hello	HW
539	Helvetic Airways	2L
540	Hemus Air	DU
541	Hewa Bora Airways	EO
542	Hex'Air	UD
543	Hi Fly	5K
544	Hokkaido International Airlines	HD
545	Hola Airlines	H5
546	Hong Kong Airlines	HX
547	Hong Kong Express Airways	UO
548	Hope Air	HH
549	Horizon Air	QX
550	Horizon Airlines	BN
551	Héli Sécurité Helicopter Airlines	H4
552	IBC Airways	II
553	ICAR Airlines	C3
554	INFINI Travel Information	1F
555	ITA Software	1U
556	Iberia Airlines	IB
557	Iberworld	TY
558	Ibex Airlines	FW
559	Icelandair	FI
560	Imair Airlines	IK
561	Independence Air	DH
562	IndiGo Airlines	6E
563	Indian Airlines	IC
564	Indigo	I9
565	Indonesia AirAsia	QZ
566	Indonesian Airlines	IO
567	InteliJet Airways	IJ
568	Inter Islands Airlines	H4
569	Interair South Africa	D6
570	Interavia Airlines	ZA
571	Intercontinental de Aviaci	RS
572	Interlink Airlines	ID
573	International Business Air	6I
574	Intersky	3L
575	Interstate Airline	I4
576	Iran Air	IR
577	Iran Aseman Airlines	EP
578	Iraqi Airways	IA
579	Island Airlines	IS
580	Island Express	2S
581	Cargo Plus Aviation	8L
582	Islands Nationair	CN
583	Islas Airways	IF
584	Islena De Inversiones	WC
585	Israir	6H
586	Itali Airlines	9X
587	Itek Air	GI
588	Izair	H9
589	JAL Express	JC
590	JALways	JO
591	JSC Transport Automated Information Systems	1M
592	Japan Airlines	JL
593	Japan Airlines Domestic	JL
594	Japan Asia Airways	EG
595	Japan Transocean Air	NU
596	Jat Airways	JU
597	Jatayu Airlines	VJ
598	Jazeera Airways	J9
599	Jeju Air	7C
600	Jet Airways	9W
601	Jet Airways	QJ
602	Jetclub	0J
603	Jetstar Asia Airways	3K
604	Jet2.com	LS
605	Jet4You	8J
606	JetBlue Airways	B6
607	Jetairfly	JF
608	Jetclub	0J
609	JetsGo	SG
610	Jetstar Airways	JQ
611	Jett8 Airlines Cargo	JX
612	Jetx Airlines	GX
613	Jordan Aviation	R5
614	Juneyao Airlines	HO
615	KD Avia	KD
616	KLM Cityhopper	WA
617	KLM Royal Dutch Airlines	KL
618	Kabo Air	N2
619	Kalitta Air	K4
620	Kam Air	RQ
621	Kampuchea Airlines	E2
622	Karat	V2
623	Kavminvodyavia	KV
624	Kenmore Air	M5
625	Kenya Airways	KQ
626	Keystone Air Services	BZ
627	Kingfisher Airlines	IT
628	Kish Air	Y9
629	Kiwi International Air Lines	KP
630	Kogalymavia Air Company	7K
631	Komiinteravia	8J
632	Korean Air	KE
633	Krasnojarsky Airlines	7B
634	Krylo Airlines	K9
635	Kuban Airlines	GW
636	Kunpeng Airlines	VD
637	Kuwait Airways	KU
638	Kuzu Airlines Cargo	GO
639	Kyrgyz Airlines	N5
640	Kyrgyzstan	QH
641	Kyrgyzstan Airlines	R8
642	Kibris T	KY
643	L.A.B. Flying Service	JF
644	LACSA	LR
645	LAI - Linea Aerea IAACA	KG
646	LAN Airlines	LA
647	Aero 2000	4M
648	LAN Express	LU
649	LAN Peru	LP
650	LOT Polish Airlines	LO
651	LTE International Airways	XO
652	LTU Austria	L3
653	LTU International	LT
654	Lagun Air	N6
655	Lankair	IK
656	Lao Airlines	QV
657	Laoag International Airlines	L7
658	Lauda Air	NG
659	Lebanese Air Transport	LQ
660	Leeward Islands Air Transport	LI
661	Libyan Arab Airlines	LN
662	Linea Aerea SAPSA	L7
663	Linea Aerea de Servicio Ejecutivo Regional	8z
664	Linea Turistica Aerotuy	LD
665	Lineas Aereas Azteca	ZE
666	Linhas A	LM
667	Lion Mentari Airlines	JT
668	Livingston	LM
669	Lloyd Aereo Boliviano	LB
670	Luftfahrtgesellschaft Walter	HE
671	Lufthansa	LH
672	Lufthansa Cargo	LH
673	Lufthansa CityLine	CL
674	Lufthansa Systems	L1
675	Lufttaxi Fluggesellschaft	DV
676	Lufttransport	L5
677	Luxair	LG
678	Lviv Airlines	5V
679	Lynden Air Cargo	L2
680	L	MJ
681	MasAir	M7
682	MAT Macedonian Airlines	IN
683	MIAT Mongolian Airlines	OM
684	MNG Airlines	MB
685	Macair Airlines	CC
686	Maersk	DM
687	Mahan Air	W5
688	Mahfooz Aviation	M2
689	Malaysia Airlines	MH
690	Malmö Aviation	TF
691	Malta Air Charter	R5
692	Malév	MA
693	Mandala Airlines	RI
694	Mandarin Airlines	AE
695	Mango	JE
696	Mars RK	6V
697	Marsland Aviation	M7
698	Martinair	MP
699	Mastertop Linhas Aereas	Q4
700	Mavial Magadan Airlines	H5
701	Maxair	8M
702	Maxjet Airways	MY
703	Maya Island Air	MW
704	Menajet	IM
705	Meridiana	IG
706	Merpati Nusantara Airlines	MZ
707	Mesa Airlines	YV
708	Mesaba Airlines	XJ
709	Mexicana de Aviaci	MX
710	Miami Air International	GL
711	Middle East Airlines	ME
712	Midway Airlines	JI
713	Midwest Airlines	YX
714	Midwest Airlines (Egypt)	MY
715	Moldavian Airlines	2M
716	Monarch Airlines	ZB
717	Myway Airlines	8I
718	Montenegro Airlines	YM
719	Moskovia Airlines	3R
720	Motor Sich	M9
721	Mount Cook Airlines	NM
722	Mountain Air Company	N4
723	MyTravel Airways	VZ
724	Myanma Airways	UB
725	Myanmar Airways International	8M
726	Nantucket Airlines	DV
727	Nas Air	P9
728	Nasair	UE
729	National Airlines	N4
730	National Airlines	N7
731	National Airlines	NA
732	National Airways Cameroon	9O
733	National Jet Systems	NC
734	Nationwide Airlines	CE
735	Nauru Air Corporation	ON
736	Navitaire	1N
737	Nepal Airlines	RA
738	Neos	NO
739	NetJets	1I
740	New England Airlines	EJ
741	Niki	HG
742	Nippon Cargo Airlines	KZ
743	Nok Air	DD
744	Nordeste Linhas Aereas Regionais	JH
745	Nordic Regional	6N
746	North Coast Aviation	N9
747	North Flying	M3
748	North-Wright Airways	HW
749	Northern Air Cargo	NC
750	Northern Dene Airways	U7
751	Northwest Airlines	NW
752	Northwest Regional Airlines	FY
753	Northwestern Air	J3
754	Norwegian Air Shuttle	DY
755	Nouvel Air Tunisie	BJ
756	Nova Airline	M4
757	Novair	1I
758	Nuevo Continente	N6
759	Nas Air	XY
760	O'Connor Airlines	UQ
761	OAG	CR
762	Oasis Hong Kong Airlines	O8
763	Ocean Airlines	VC
764	Oceanair	O6
765	Oceanic Airlines	O2
766	Olympic Airlines	OA
767	Oman Air	WY
768	Omni Air International	OY
769	Omskavia Airline	N3
770	Onur Air	8Q
771	Orenburg Airlines	R2
772	Orient Thai Airlines	OX
773	Origin Pacific Airways	QO
774	Ostfriesische Lufttransport	OL
775	Our Airline	ON
776	Overland Airways	OJ
777	Ozark Air Lines	OZ
778	Ozjet Airlines	O7
779	PAN Air	PV
780	PB Air	9Q
781	PLUNA	PU
782	PMTair	U4
783	Pace Airlines	Y5
784	Jetstar Pacific	BL
785	Pacific Blue	DJ
786	Pacific Coastal Airline	8P
787	Pacific East Asia Cargo Airlines	Q8
788	Pacific Southwest Airlines	PS
789	Pacific Wings	LW
790	Pacificair	GX
791	Pakistan International Airlines	PK
792	Palau Trans Pacific Airline	GP
793	Palestinian Airlines	PF
794	Pamir Airways	NR
795	Pan American Airways	PA
796	Pan American World Airways	PA
797	Panafrican Airways	PQ
798	Pantanal Linhas Aéreas	P8
799	Paramount Airways	I7
800	Pearl Airways	HP
801	Pegasus Airlines	PC
802	Pegasus Hava Tasimaciligi	1I
803	Peninsula Airways	KS
804	Perm Airlines	P9
805	Philippine Airlines	PR
806	Phoenix Airways	HP
807	Phuket Air	9R
808	Piedmont Airlines (1948-1989)	PI
809	Pinnacle Airlines	9E
810	Polar Air Cargo	PO
811	Polynesian Airlines	PH
812	Polynesian Blue	DJ
813	Polyot Sirena	1U
814	Porter Airlines	PD
815	Portugalia	NI
816	Potomac Air	BK
817	Precision Air	PW
818	President Airlines	TO
819	Primaris Airlines	FE
820	Princess Air	8Q
821	Private Wings Flugcharter	8W
822	Proflight Commuter Services	P0
823	Qantas	QF
824	Qatar Airways	QR
825	RACSA	R6
826	Radixx Solutions International	1D
827	Redhill Aviation	8L
828	Reem Air	V4
829	Regional Airlines	FN
830	Regional Express	ZL
831	RegionsAir	3C
832	Reno Air	QQ
833	Republic Airlines	RW
834	Republic Express Airlines	RH
835	Rico Linhas A	C7
836	Rio Grande Air	E2
837	Rio Sul Servi	SL
838	Rossiya	R4
839	Air Rarotonga	GZ
840	Royal Air Force	RR
841	Royal Air Force of Oman	RS
842	Royal Air Maroc	AT
843	Royal Airlines	R0
844	Royal Aruban Airline	V5
845	Royal Brunei Airlines	BI
846	Royal Jordanian	RJ
847	Royal Khmer Airlines	RK
848	Royal Nepal Airlines	RA
849	Royal Tongan Airlines	WR
850	Russian Sky Airlines	P7
851	Rwandair Express	WB
852	Ryan International Airlines	RD
853	Ryanair	FR
854	Régional	YS
855	SATA International	S4
856	South African Airways	SA
857	Shaheen Air International	NL
858	SAM Colombia	MM
859	Scandinavian Airlines System	SK
860	S7 Airlines	S7
861	Seaborne Airlines	BB
862	SriLankan Airlines	UL
863	Sun Country Airlines	SY
864	Sky Express	G3
865	Spicejet	SG
866	Sky Eyes	I6
867	SAETA	EH
868	Star Flyer	7G
869	Safair	FA
870	Skagway Air Service	N5
871	SATA Air Acores	SP
872	Scorpio Aviation	8S
873	Singapore Airlines	SQ
874	Sibaviatrans	5M
875	Skynet Airlines	SI
876	SITA	XS
877	Sriwijaya Air	SJ
878	Sama Airlines	ZS
879	Singapore Airlines Cargo	SQ
880	Siem Reap Airways	FT
881	Sky Work Airlines	SX
882	Swedline Express	SM
883	South East Asian Airlines	DG
884	SwedJet Airways	VD
885	Skyservice Airlines	5G
886	Servicios de Transportes A	FS
887	Sudan Airways	SD
888	Sun Air (Fiji)	PI
889	Sun Air of Scandinavia	EZ
890	Saudi Arabian Airlines	SV
891	Southwest Airlines	WN
892	Southern Winds Airlines	A4
893	Sunwing Airlines	WG
894	Swiss International Air Lines	LX
895	Swissair	SR
896	Swe Fly	WV
897	Shovkoviy Shlyah	S8
898	SunExpress	XQ
899	Syrian Arab Airlines	RB
900	Skywalk Airlines	AL
901	Silk Way Airlines	ZP
902	Samara Airlines	E5
903	Shandong Airlines	SC
904	Spring Airlines	9S
905	Sichuan Airlines	3U
906	Shanghai Airlines	FM
907	Shenzhen Airlines	ZH
908	Shanxi Airlines	8C
909	Sun D'Or	7L
910	SkyEurope	NE
911	Sunshine Express Airlines	CQ
912	Superior Aviation	SO
913	Spanair	JK
914	San Juan Airlines	2G
915	Sabre Pacific	1Z
916	Sabre	1S
917	Sierra Nevada Airlines	1I
918	Siren-Travel	1H
919	Sirena	1Q
920	Sky Trek International Airlines	1I
921	Southern Cross Distribution	1K
922	Sutra	1K
923	SNCF	2C
924	Star Equatorial Airlines	2S
925	Spirit Airlines	NK
926	SATENA	9R
927	Slok Air Gambia	S0
928	Sosoliso Airlines	SO
929	Sky Trek International Airlines	1I
930	Skybus Airlines	SX
931	SkyKing Turks and Caicos Airways	RU
932	Santa Barbara Airlines	S3
933	Sky Airline	H2
934	SkyWest	OO
935	Skyways Express	JZ
936	Skymark Airlines	BC
937	Sierra National Airlines	LJ
938	SilkAir	MI
939	Slovak Airlines	6Q
940	Surinam Airways	PY
941	Servant Air	8D
942	Sterling Airlines	NB
943	Skynet Asia Airways	6J
944	Solomon Airlines	IE
945	Saratov Aviation Division	6W
946	Sat Airlines	HZ
947	Shuttle America	S5
948	Scat Air	DV
949	Sirin	R1
950	Star Air	S6
951	TAME	EQ
952	TAM Brazilian Airlines	JJ
953	TAP Portugal	TP
954	Tunisair	TU
955	TNT Airways	3V
956	Tropical Airways	M7
957	Thai Air Cargo	T2
958	Thomas Cook Airlines	FQ
959	Thomas Cook Airlines	MT
960	Tandem Aero	TQ
961	Teamline Air	L9
962	Transeuropean Airlines	UE
963	Titan Airways	ZT
964	Tiger Airways	TR
965	Tiger Airways Australia	TT
966	Thai Airways International	TG
967	Thai AirAsia	FD
968	Turkish Airlines	TK
969	Twin Jet	T7
970	Thai Sky Airlines	9I
971	Tulip Air	TD
972	Trans Mediterranean Airlines	TL
973	Tri-MG Intra Asia Airlines	GY
974	Tiara Air	3P
975	Tobruk Air	7T
976	Tol-Air Services	TI
977	Thomsonfly	BY
978	Tropic Air	PM
979	Tower Air	FF
980	TAMPA	QT
981	TransAsia Airways	GE
982	Transavia Holland	HV
983	TACV	VR
984	TransMeridian Airlines	T9
985	Transmile Air Services	TH
986	Trast Aero	S5
987	Transwest Air	9T
988	Transaero Airlines	UN
989	Thai Star Airlines	T9
990	Turkmenistan Airlines	T5
991	Tuninter	UG
992	Tavrey Airlines	T6
993	Travel Service	QS
994	Trans World Airlines	TW
995	Transaviaexport	AL
996	TUIfly Nordic	6B
997	TAAG Angola Airlines	DT
998	Tassili Airlines	SF
999	TAM Mercosur	PZ
1000	Trans States Airlines	AX
1001	Travelsky Technology	1E
1002	Thalys	2H
1003	Open Skies Consultative Commission	1L
1004	Tarom	RO
1005	Turan Air	3T
1006	TRIP Linhas A	8R
1007	Tbilaviamsheni	L6
1008	Transports et Travaux A	OF
1009	USA3000 Airlines	U5
1010	United Airlines	UA
1011	United Feeder Service	U2
1012	USA Jet Airlines	U7
1013	Ural Airlines	U6
1014	UM Airlines	UF
1015	Ukrainian Cargo Airways	6Z
1016	United Parcel Service	5X
1017	US Airways	US
1018	UTair Aviation	UT
1019	Uzbekistan Airways	HY
1020	Ukraine International Airlines	PS
1021	US Helicopter Corporation	UH
1022	V Australia Airlines	VA
1023	Valuair	VF
1024	Voyageur Airways	VC
1025	Vietnam Airlines	VN
1026	VIM Airlines	NN
1027	VIA Rail Canada	2R
1028	Viasa	VA
1029	Volaris	Y4
1030	Volga-Dnepr Airlines	VI
1031	Virgin America	VX
1032	Virgin Express	TV
1033	Virgin Nigeria Airways	VK
1034	Virgin Atlantic Airways	VS
1035	Viva Macau	ZG
1036	Volare Airlines	VE
1037	Vueling Airlines	VY
1038	Vladivostok Air	XF
1039	Varig Log	LC
1040	Viaggio Air	VM
1041	Virgin Australia	DJ
1042	Virgin Blue	DJ
1043	VRG Linhas Aereas	RG
1044	VASP	VP
1045	VLM Airlines	VG
1046	Wayraper	7W
1047	WebJet Linhas A	WJ
1048	Welcome Air	2W
1049	West Air Sweden	PT
1050	West Coast Air	8O
1051	WestJet	WS
1052	Western Airlines	WA
1053	Westward Airways	CN
1054	Widerøe	WF
1055	Wind Jet	IV
1056	Wings Air	IW
1057	Wings of Alaska	K5
1058	Wizz Air	W6
1059	Wizz Air Hungary	8Z
1060	World Airways	WO
1061	Worldspan	1P
1062	Wright Air Service	8V
1063	XL Airways France	SE
1064	Xiamen Airlines	MF
1065	Xtra Airways	XP
1066	Yamal Airlines	YL
1067	Yangtze River Express	Y8
1068	Yemenia	IY
1069	Yuzhmashavia	2N
1070	Zambian Airways	Q3
1071	Zip	3J
1072	Zimex Aviation	C4
1073	Zoom Airlines	Z4
1074	buzz	UK
1075	Maldivian Air Taxi	8Q
1076	Yellow Air Taxi	Y0
1077	Royal Air Cambodge	VJ
1078	Air Mandalay	6T
1079	TAN-SAHSA	SH
1080	Air Busan	BX
1081	TUI Airlines Belgium	TB
1082	Sky Express	XW
1083	Braathens	BU
1084	Globus	GH
1085	Air Kazakhstan	9Y
1086	Japan Air System	JD
1087	Annsett New Zealand (NZA)	ZQ
1088	EasyJet (DS)	DS
1089	Star Peru (2I)	2I
1090	Carnival Air Lines	KW
1091	United Airways	4H
1092	Trans Maldivian Airways	M8
1093	Fly540	5H
1094	Transavia France	TO
1095	Island Air (WP)	WP
1096	1-2-go	OG
1097	Uni Air	B7
1098	Gomelavia	YD
1099	Red Wings	WZ
1100	TUIfly (X3)	11
1101	Felix Airways	FU
1102	Kostromskie avialinii	K1
1103	Greenfly	XX
1104	Tajik Air	7J
1105	Air Mozambique	TM
1106	ELK Airways	--
1107	Gabon Airlines	GY
1108	Maldivo Airlines	ML
1109	Virgin Pacific	VH
1110	Zest Air	Z2
1111	Yangon Airways	HK
1112	Transport Aérien Transrégional	IJ
1113	Minerva Airlines	N4
1114	Eastar Jet	ZE
1115	Jin Air	LJ
1116	Aéris (Priv)	SH
1117	Air Arabia Maroc	3O
1118	Baltic Air lines	B1
1119	Ciel Canadien	YC
1120	Canadian National Airways	CN
1121	Epic Holiday	FA
1122	Air Comet Chile	3I
1123	Nazca	-.
1124	Voronezhskie Airlanes	DN
1125	Line Blue	L8
1126	Blue Sky America	BU
1127	Texas Spirit	XS
1128	Illinois Airways	IL
1129	Salzburg arrows	SZ
1130	Texas Wings	TQ
1131	California Western	KT
1132	Dennis Sky	DH
1133	Zz	ZZ
1134	Atifly	A1
1135	Air UK	UK
1136	Suckling Airways	CB
1137	Reno Sky	RY
1138	Ciao Air	99
1139	Birmingham European	VB
1140	Pal airlines	5P
1141	CanXpress	C1
1142	Danube Wings (V5)	V5
1143	Sharp Airlines	SH
1144	CanXplorer	C2
1145	Click (Mexicana)	QA
1146	World Experience Airline	W1
1147	ALAK	J4
1148	AJT Air International	E9
1149	Air Choice One	3E
1150	China United	KN
1151	Locair	ZQ
1152	Safi Airlines	4Q
1153	SeaPort Airlines	K5
1154	Salmon Air	S6
1155	Fly Illi	IL
1156	Bobb Air Freight	01
1157	Star1 Airlines	V9
1158	Pelita	6D
1159	Alpi Eagles (E8)	E8
1160	Alaska Seaplane Service	J5
1161	TAN	T8
1162	MexicanaLink	I6
1163	Island Spirit	IP
1164	TACA Peru	T0
1165	Pan Am World Airways Dominicana	7Q
1166	Primera Air	PF
1167	Air Antilles Express	3S
1168	Regional Paraguaya	P7
1169	VIP Ecuador	V6
1170	Peruvian Airlines	P9
1171	Polar Airlines	ЯП
1172	Catovair	OC
1173	Halcyonair	7Z
1174	Business Aviation	4P
1175	Compagnie Africaine d'Aviation	E9
1176	Zambia Skyways	K8
1177	AlMasria Universal Airlines	UJ
1178	SmartLynx Airlines	6Y
1179	KoralBlue Airlines	K7
1180	Elysian Airlines	E4
1181	Hellenic Imperial Airways	HT
1182	Amsterdam Airlines	WD
1183	Arik Niger	Q9
1184	Dana Air	DA
1185	STP Airways	8F
1186	Med Airways	7Y
1187	Skyjet Airlines	UQ
1188	Air Volga	G6
1189	Royal Falcon	RL
1190	Euroline	4L
1191	Worldways	WG
1192	Athens Airways	ZF
1193	Viking Hellas	VQ
1194	Starline.kz	DZ
1195	Euro Harmony	EH
1196	Lugansk Airlines	L7
1197	Gryphon Airlines	6P
1198	Gadair European Airlines	GP
1199	Spirit of Manila Airlines	SM
1200	Chongqing Airlines	OQ
1201	West Air China	PN
1202	Falcon Air (IH)	IH
1203	QatXpress	C3
1204	OneChina	1C
1205	NordStar Airlines	Y7
1206	Joy Air	JR
1207	Air India Regional	CD
1208	MDLR Airlines	9H
1209	Maldivian	Q2
1210	Xpressair	XN
1211	Strategic Airlines	VC
1212	Al-Naser Airlines	NA
1213	Fuji Dream Airlines	JH
1214	SGA Airlines	5E
1215	Air2there	F8
1216	Avianova (Russia)	AO
1217	Parmiss Airlines (IPV)	PA
1218	EuropeSky	ES
1219	BRAZIL AIR	GB
1220	Homer Air	MR
1221	Court Line	??
1222	South West Africa Territory Force	??
1223	Lombards Air	++
1224	U.S. Air	-+
1225	Flitestar	GM
1226	Jayrow	'
1227	Llloyd Helicopters	::
1228	Wilderness Air	;;
1229	Whitaker Air	^^
1230	PanAm World Airways	WQ
1231	Virginwings	YY
1232	KSY	KY
1233	Buquebus Líneas Aéreas	BQ
1234	SOCHI AIR	CQ
1235	Wizz Air Ukraine	WU
1236	88	47
1237	LCM AIRLINES	LQ
1238	Aero Brazil	BZ
1239	Cambodia Angkor Air (K6)	K6
1240	Skyline nepc	D5
1241	THREE	H3
1242	Royal European Airlines	69
1243	Tom's & co airliners	&T
1244	Azul	AD
1245	LSM Airlines	PQ
1246	LionXpress	C4
1247	Nik Airways	X1
1248	Genesis	GK
1249	Congo Express	XZ
1250	Fly Dubai	FZ
1251	Domenican Airlines	D1
1252	Air Atlantic	9A
1253	Air Ops	CR
1254	Aereonautica militare	JY
1255	LSM AIRLINES 	YZ
1256	Aero Lloyd (YP)	YP
1257	UTair-Express	UR
1258	Huaxia	G5
1259	Zabaykalskii Airlines	ZP
1260	Marysya Airlines	M4
1261	N1	N1
1262	Airlink (SAA)	4Z
1263	JobAir	3B
1264	Zuliana de Aviacion	OD
1265	Black Stallion Airways	BZ
1266	German International Air Lines	GM
1267	TrasBrasil	TB
1268	TransBrasil Airlines	TH
1269	China SSS	9C
1270	Nihon.jet	NJ
1271	Transportes Aéreos Nacionales de Selva	TJ
1272	Air Mekong	P8
1273	Harbour Air (Priv)	H3
1274	Air Hamburg (AHO)	HH
1275	ZABAIKAL AIRLINES	Z6
1276	TransHolding	TI
1277	Yeti Airways	YT
1278	Yellowstone Club Private Shuttle	Y1
1279	Caucasus Airlines	NS
1280	Serbian Airlines	S1
1281	Windward Islands Airways	WM
1282	TransHolding System	YO
1283	CCML Airlines	CB
1284	Air Charter International	SF
1285	Fly Brasil	F1
1286	AUOS	AU
1287	CB Airways UK ( Interliging Flights )	1F
1288	Fly Colombia ( Interliging Flights )	3F
1289	Trans Pas Air	T6
1290	KMV	МИ
1291	Himalayan Airlines	HC
1292	Indya Airline Group	G1
1293	Sunwing	WG
1294	Japan Regio	ZX
1295	Norte Lineas Aereas	N0
1296	Austral Brasil	W7
1297	PEGASUS AIRLINES-	H9
1298	AirLiberté	IJ
1299	Camair-co	QC
1300	Aerocontinente (Priv)	N6
1301	Sky Regional	RS
1302	TUR Avrupa Hava YollarÄ±	YI
1303	LSM International 	II
1304	Baikotovitchestrian Airlines 	BU
1305	Luchsh Airlines 	L4
1306	Zimbabwean Airlines	Z7
1307	Air Cargo Germany	6U
1308	Mongolian International Air Lines 	7M
1309	Alaniya Airlines	2D
1310	Tway Airlines	TW
1311	Papillon Grand Canyon Helicopters	HI
1312	Jusur airways	JX
1313	NEXT Brasil	XB
1314	AeroWorld 	W4
1315	Cook Island Air	KH
1316	US Africa Airways	E8
1317	GNB Linhas Aereas	GN
1318	Usa Sky Cargo	E1
1319	Hankook Airline	HN
1320	Red Jet America	RR
1321	REDjet	Z7
1322	Hellenic Airways	1H
1323	Red Jet Andes	PT
1324	Red Jet Canada	QY
1325	Red Jet Mexico	4X
1326	Marusya Airways	Y8
1327	Era Alaska	7H
1328	AirRussia	R8
1329	Hankook Air US	H1
1330	NEPC Airlines	D5
1331	Canadian World	10
1332	I-Fly	H5
1333	T.A.T	IJ
1334	Alinord	DN
1335	Pacific Express	VB
1336	VickJet	KT
1337	BVI Airways	XV
1338	Salsa d'Haiti	SO
1339	Zambezi Airlines (ZMA)	ZJ
1340	Polet Airlines (Priv)	YQ
1341	TROPICAL LINHAS AEREAS	T1
1342	12 North	12
1343	MAT Airways	6F
1344	Asian Wings Airways	AW
1345	Air Arabia Egypt	E5
1346	Alitalia Cityliner	CT
1347	Orchid Airlines	OI
1348	Asia Wings	Y5
1349	Skywest Australia	XR
1350	Nile Air	NP
1351	Senegal Airlines	DN
1352	Fly 6ix	6I
1353	Starbow Airlines	S9
1354	Copenhagen Express	0X
1355	BusinessAir	8B
1356	SENIC AIRLINES	YR
1357	Sky Wing Pacific	C7
1358	Air Indus	PP
1359	Samurai Airlines	07
1360	AirOne Continental	00
1361	AirOne Polska	U1
1362	Peach Aviation	MM
1363	Aviabus	U1
1364	Michael Airlines	DF
1365	Korongo Airlines	ZC
1366	Indonesia Sky	I5
1367	Pelangi 	9P
1368	Aws express	B0
1369	Southjet	76
1370	Southjet connect	77
1371	Air Cape	KP
1372	Southjet cargo	78
1373	Iberia Express	I2
1374	Interjet (ABC Aerolineas)	4O
1375	AirOnix	OG
1376	Nordic Global Airlines	NJ
1377	Scoot	TZ
1378	Starling Airlines Spain	SX
1379	Hi Fly (5K)	5K
1380	China Northwest Airlines (WH)	WH
1381	Zenith International Airline	ZN
1382	Orbit Airlines Azerbaijan	O1
1383	Air Alps Aviation (A6)	A6
1384	Patriot Airways	P4
1385	Vision Airlines (V2)	V2
\.


--
-- Name: airlines_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('airlines_id_seq', 1385, true);


--
-- Data for Name: airports; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY airports (id, country_id, city_id, code, name, latitude, longitude) FROM stdin;
1	\N	\N	MQP	Kruger Mpumalanga International Airport	-25.3849470000000004	31.0981309999999986
2	\N	\N	MCY	Maroochydore	-26.6053800000000003	153.088210000000004
3	\N	\N	MFE	Mc Allen Miller International	26.1812949999999987	-98.2397799999999961
4	\N	\N	MFR	Rogue Valley International - Medford Airport	42.3690259999999981	-122.87312
5	\N	\N	MIR	Habib Bourguiba	35.7610799999999998	10.7531549999999996
6	\N	\N	MJT	Mytilene International Airport	39.0561099999999968	26.5994430000000008
7	\N	\N	MKE	General Mitchell International	42.9480930000000001	-87.9026700000000005
8	\N	\N	MLB	Melbourne International Airport	28.1024999999999991	-80.6302799999999991
9	\N	\N	MOU	Mountain Village	62.0894430000000028	-163.71665999999999
10	\N	\N	OAJ	Albert J Ellis	34.830440000000003	-77.605834999999999
11	\N	\N	OAK	Metropolitan Oak International	37.7118800000000007	-122.212010000000006
12	\N	\N	PVG	Shanghai Pudong International	31.1518249999999988	121.799805000000006
13	\N	\N	RBV	Ramata	-8.16555600000000048	157.639450000000011
14	\N	\N	UIB	Quibdo	5.69055599999999995	-76.6419450000000069
15	\N	\N	CAI	Cairo International Airport	30.1201059999999998	31.4064699999999988
16	\N	\N	ABQ	Albuquerque International	35.0496249999999989	-106.617194999999995
17	\N	\N	AXR	Arutua	-15.25	-146.75
18	\N	\N	EWB	New Bedford	41.6769450000000035	-70.9591700000000003
19	\N	\N	FAI	Fairbanks International Airport	64.8182139999999976	-147.866800000000012
20	\N	\N	FBE	Francisco Beltrao	-26.0833319999999986	-53.0666659999999979
21	\N	\N	FIH	Ndjili International	-4.38958799999999982	15.4473380000000002
22	\N	\N	FJR	Al-Fujairah International	25.1094439999999999	56.3305549999999968
23	\N	\N	FLN	Hercilio Luz	-27.6644460000000016	-48.5452000000000012
24	\N	\N	FNA	Lungi International	8.61749999999999972	-13.1969440000000002
25	\N	\N	FPO	Grand Bahama International	26.5472929999999998	-78.7052000000000049
26	\N	\N	GBE	Sir Seretse Khama International	-24.5579810000000016	25.9245100000000015
27	\N	\N	GES	General Santos International	6.108066	125.23424
28	\N	\N	GGG	Kilgore	32.3866650000000007	-94.715280000000007
29	\N	\N	GJT	Walker Field	39.1226649999999978	-108.528335999999996
30	\N	\N	GLA	Glasgow International	55.864212000000002	-4.43178200000000011
31	\N	\N	GLO	Gloucestershire	51.8833300000000008	-2.23333300000000001
32	\N	\N	GNB	Grenoble-isere Airport (St Geoirs)	45.3598330000000018	5.33201899999999984
33	\N	\N	GNV	Gainesville Regional	29.6861420000000003	-82.2767939999999953
34	\N	\N	GOA	Cristoforo Colombo	44.415066000000003	8.85080999999999918
35	\N	\N	GRX	Granada	37.1847270000000023	-3.77695399999999992
36	\N	\N	GVA	Geneve-cointrin	46.2296329999999998	6.10577400000000026
37	\N	\N	GYN	Santa Genoveva	-16.6326309999999999	-49.226624000000001
38	\N	\N	HER	Nikos Kazantzakis Airport	35.3366299999999995	25.1741920000000015
39	\N	\N	HGR	Wash. County Regional	39.7077799999999996	-77.730000000000004
40	\N	\N	HOU	William P Hobby	29.6545120000000004	-95.2770160000000033
41	\N	\N	HUY	Humberside International	53.5833780000000033	-0.348509999999999986
42	\N	\N	IAD	Washington Dulles International	38.9531500000000008	-77.447739999999996
43	\N	\N	IFJ	Isafjordur	66.0597199999999987	-23.1327779999999983
44	\N	\N	IGU	Cataratas	-25.5979370000000017	-54.4888229999999965
45	\N	\N	ILZ	Zilina	49.2333339999999993	18.7666660000000007
46	\N	\N	IPL	Imperial County	32.8372230000000016	-115.574719999999999
47	\N	\N	IPT	Lycoming County	41.2422200000000032	-76.9205549999999931
48	\N	\N	ISC	St Marys	49.913333999999999	-6.29166700000000034
49	\N	\N	JDF	Francisco De Assis	-21.75	-43.3333319999999986
50	\N	\N	JHW	Jamestown	42.1505549999999971	-79.2580600000000004
51	\N	\N	JOK	Yoshkar-Ola	56.7166670000000011	47.8999999999999986
52	\N	\N	JRO	Kilimanjaro	-3.42412299999999981	37.0653420000000011
53	\N	\N	JZH	Jiu Zhai Huang Long	32.8566670000000016	103.683059999999998
54	\N	\N	KGF	Karaganda	49.6752600000000015	73.3283600000000035
55	\N	\N	KGP	Kogalym International	62.1958300000000008	74.5336099999999959
56	\N	\N	KHH	Kaoshiung International Airport	22.5725000000000016	120.345275999999998
57	\N	\N	KIF	Kingfisher Lake	53.0138900000000035	-89.8499999999999943
58	\N	\N	KJA	Krasnojarsk	56.1811300000000031	92.4828600000000023
59	\N	\N	KOP	Nakhon Phanom	17.3999999999999986	104.75
60	\N	\N	KOS	Sihanoukville	10.6333330000000004	103.5
61	\N	\N	KPY	Port Bailey SPB	57.9333340000000021	-153.03334000000001
62	\N	\N	KRK	John Paul II Balice International	50.0754930000000016	19.7937429999999992
63	\N	\N	KSO	Aristoteles Airport	40.4508319999999983	21.2733330000000009
64	\N	\N	KVA	Megas Alexandros International	40.9129939999999976	24.6196750000000009
65	\N	\N	LAP	General Manuel Márquez De León International Airport	24.0760879999999986	-110.367835999999997
66	\N	\N	LBA	Leeds/bradford	53.8693400000000011	-1.65998500000000004
67	\N	\N	LBE	Westmoreland County	40.2763899999999992	-79.402780000000007
68	\N	\N	LDE	Tarbes Ossun Lourdes	43.1865099999999984	0.0033679999999999999
69	\N	\N	LIM	Jorge Chavez International	-12.0194209999999995	-77.1076659999999947
70	\N	\N	LIS	Lisbon Portela	38.7700419999999966	-9.1281649999999992
71	\N	\N	LIT	Adams Field Airport	34.7274320000000003	-92.2213749999999948
72	\N	\N	LPA	Gran Canaria	27.9389439999999993	-15.3893509999999996
73	\N	\N	LYB	Little Cayman	19.6591999999999985	-80.0847200000000043
74	\N	\N	MAO	Eduardo Gomes International	-3.0313270000000001	-60.0460929999999991
75	\N	\N	MCV	Mcarthur River	-16.4666670000000011	136.094999999999999
76	\N	\N	MQF	Magnitogorsk	53.4500000000000028	59.0666659999999979
77	\N	\N	NOS	Fascene	-13.3111110000000004	48.3138900000000007
78	\N	\N	NOZ	Novokuznetsk	53.75	87.1666639999999973
79	\N	\N	NWI	Norwich International Airport	52.6695330000000013	1.27678200000000008
80	\N	\N	PKC	Petropavlovsk-Kamchatsky	53.0166660000000007	158.650000000000006
81	\N	\N	SAW	Sabiha Gokcen	40.9046749999999975	29.3091889999999999
82	\N	\N	TWU	Tawau	4.26274999999999959	117.884865000000005
83	\N	\N	AEP	Aeroparque Jorge Newbery	-34.5562200000000033	-58.4166700000000034
84	\N	\N	KNO	Kuala Namu International Airport	3.63783300000000009	98.8705000000000069
85	\N	\N	KMW	Sokerkino	57.75	40.9333340000000021
86	\N	\N	GBB	Gabala	27	-7.56666699999999981
87	\N	\N	ACA	General Juan N. Alvarez International	16.7624029999999991	-99.7545899999999932
88	\N	\N	ADB	Adnan Menderes Airport	38.2944030000000026	27.1475940000000016
89	\N	\N	AFL	Alta Floresta	-9.87245599999999968	-56.1047670000000025
90	\N	\N	AGA	Agadir Almassira	30.3783260000000013	-9.55589499999999958
91	\N	\N	AGU	Aguascalients	21.7014159999999983	-102.313739999999996
92	\N	\N	ANU	V. C. Bird International	17.1083339999999993	-61.7638900000000035
93	\N	\N	AOO	Martinsburg	40.2972219999999979	-78.3199999999999932
94	\N	\N	ASP	Alice Springs	-23.8013900000000014	133.903379999999999
95	\N	\N	AVP	Wilkes-Barre/Scranton International Airport	41.3366970000000009	-75.7306439999999981
96	\N	\N	BCN	El Prat De Llobregat	41.3030299999999997	2.07593000000000005
97	\N	\N	BDO	Husein Sastranegara	-6.9046479999999999	107.581779999999995
98	\N	\N	BGW	Baghdad International	33.2555539999999965	44.2250000000000014
99	\N	\N	BHX	Birmingham International Airport	52.4525199999999998	-1.73325599999999991
100	\N	\N	BLA	Gen J A Anzoategui	10.1079360000000005	-64.6858900000000006
101	\N	\N	BLQ	Guglielmo Marconi	44.5292659999999998	11.2932889999999997
102	\N	\N	BLR	Bangalore International Airport	13.1988889999999994	77.7055600000000055
103	\N	\N	BOH	Bournemouth International	50.7782699999999991	-1.83247599999999999
104	\N	\N	BOI	Boise Air Terminal/Gowen Field	43.5692629999999994	-116.22193
105	\N	\N	BQB	Bussellton	-33.7166670000000011	115.25
106	\N	\N	BRD	Brainerd Lakes Regional	46.3972199999999972	-94.1375000000000028
107	\N	\N	BSB	Presidente Juscelino Kubitschek	-15.8698069999999998	-47.9214860000000016
108	\N	\N	BSC	Bahia Solano	6.18333300000000019	-77.4000000000000057
109	\N	\N	BSL	Euroairport Swiss	47.5996099999999984	7.53260400000000008
110	\N	\N	BTJ	Sultan Iskandarmuda Airport	5.51802100000000006	95.4183299999999974
111	\N	\N	BTV	Burlington International	44.4690129999999968	-73.1552700000000016
112	\N	\N	BUF	Buffalo Niagara International	42.9338260000000034	-78.7318039999999968
113	\N	\N	CAK	Akron/canton Regional	40.9149630000000002	-81.4358299999999957
114	\N	\N	CCS	Simon Bolivar International Airport	10.5969420000000003	-67.005510000000001
115	\N	\N	CCU	Netaji Subhas Chandra	22.6453099999999985	88.4393100000000061
116	\N	\N	CEB	Mactan-Cebu International	10.3133330000000001	123.982780000000005
117	\N	\N	CEI	Chiang Rai	19.9546090000000014	99.878815000000003
118	\N	\N	CEK	Chelyabinsk	55.2975040000000035	61.5123499999999979
119	\N	\N	CFG	Cienfuegos	22.1499999999999986	-80.4141699999999986
120	\N	\N	CFS	Coffs Harbour	-30.3228630000000017	153.115299999999991
121	\N	\N	CGR	International Airport Campo Grande	-20.4569909999999986	-54.6688729999999978
122	\N	\N	CGY	Cagayan De Oro Domestic Airport	8.40774399999999922	124.61157
123	\N	\N	CHC	Christchurch International	-43.4886550000000014	172.538900000000012
124	\N	\N	CLL	Easterwood Field	30.5938419999999986	-96.3668200000000041
125	\N	\N	CMB	Bandaranaike International	7.17411200000000004	79.8864999999999981
126	\N	\N	COU	Columbia Regional	38.8136099999999971	-92.2191700000000054
127	\N	\N	CPC	Chapelco	-40.0666659999999979	-71.1333300000000008
128	\N	\N	CTA	Fontanarossa	37.4706600000000023	15.0658770000000004
129	\N	\N	DDC	Dodge City Municipal	37.7616650000000007	-99.9650000000000034
130	\N	\N	DMM	King Fahd International Airport	26.4711110000000005	49.797780000000003
131	\N	\N	DOH	Doha International	25.2675690000000017	51.5580670000000012
132	\N	\N	DSA	Robin Hood	53.4810030000000012	-1.01154999999999995
133	\N	\N	DUR	Durban International	-29.6144449999999999	31.1163880000000006
134	\N	\N	DUT	Emergency Field	53.8944600000000023	-166.542239999999993
135	\N	\N	DVO	Francisco Bangoy International	7.13069600000000037	125.6447
136	\N	\N	EAS	Donostia - San Sebastian	43.3564000000000007	-1.79353800000000008
137	\N	\N	ELH	International	25.4769170000000003	-76.6819200000000052
138	\N	\N	ERM	Comandante Kraemer	-27.6416660000000007	-52.2755549999999971
139	\N	\N	EUX	F D Roosevelt	17.4930549999999982	-62.9777800000000028
140	\N	\N	EVV	Evansville Regional Airport	38.046165000000002	-87.5279599999999931
141	\N	\N	MPL	Montpellier Méditerranée	43.5784299999999973	3.95917399999999997
142	\N	\N	NLA	Ndola	-12.993449	28.6650239999999989
143	\N	\N	NLV	Nikolaev (Mykolaiv)	47.0499999999999972	31.9166680000000014
144	\N	\N	NUX	Novy Urengoy	66.0733500000000049	76.5228350000000006
145	\N	\N	ORD	Chicago O'hare International	41.9769130000000033	-87.9048800000000057
146	\N	\N	ORU	Oruro	-17.9641669999999998	-67.080830000000006
147	\N	\N	OSI	Osijek	45.5499999999999972	18.6833320000000001
148	\N	\N	OST	Ostend/Bruges International Airport	51.1997220000000013	2.86361100000000013
149	\N	\N	OUL	Oulu	64.9301200000000023	25.3754249999999999
150	\N	\N	PAP	Toussaint Louverture International	18.5753939999999993	-72.2947099999999949
151	\N	\N	PBM	Zanderij International	5.45138899999999982	-55.1911130000000014
152	\N	\N	PDA	Puerto Inirida	3.88333299999999992	-67.8833300000000008
153	\N	\N	PDX	Portland International	45.5889969999999991	-122.5929
154	\N	\N	PEN	Penang International	5.29296100000000003	100.265174999999999
155	\N	\N	PES	Petrozavodsk	61.6833340000000021	34.3333319999999986
156	\N	\N	PHF	Newport News/williamsb	37.1303300000000007	-76.5028199999999998
157	\N	\N	PHX	Sky Harbor International	33.4350359999999966	-112.000159999999994
158	\N	\N	PKZ	Pakse	15.1362570000000005	105.781295999999998
159	\N	\N	PMI	Son Sant Joan Airport	39.5476529999999968	2.73038800000000004
160	\N	\N	PNQ	Lohegaon	18.5813880000000005	73.9205549999999931
161	\N	\N	POL	Porto Amelia	-12.9883330000000008	40.5225000000000009
162	\N	\N	POR	Pori	61.4686599999999999	21.7913819999999987
163	\N	\N	PPB	Adhemar De Barros	-22.1000000000000014	-51.4500000000000028
164	\N	\N	PPS	Puerto Princesa	9.74019799999999947	118.756739999999994
165	\N	\N	PQI	Presque Isle Municipal	46.6850000000000023	-68.0474999999999994
166	\N	\N	PRG	Prague Vaclav Havel Airport	50.106189999999998	14.2666380000000004
167	\N	\N	PSG	Petersburg James A Johnson	56.8041699999999992	-132.942499999999995
168	\N	\N	PTY	Tocumen International	9.06689700000000087	-79.3876400000000046
169	\N	\N	PUY	Pula	44.8916660000000007	13.9236109999999993
170	\N	\N	PWM	International Jetport	43.6474899999999977	-70.3103100000000012
171	\N	\N	PZO	Puerto Ordaz	8.28653300000000037	-62.759135999999998
172	\N	\N	QCU	Heliport	68.75	-52.3333319999999986
173	\N	\N	QSF	Setif	36.1813900000000004	5.33111099999999993
174	\N	\N	RCB	Richards Bay	-28.740556999999999	32.0930559999999971
175	\N	\N	REC	Guararapes International	-8.13150699999999915	-34.9179200000000023
176	\N	\N	RJA	Rajahmundry	17.1096380000000003	81.8208099999999945
177	\N	\N	RKD	Knox County Regional	44.0591659999999976	-69.0980500000000006
178	\N	\N	RSH	Russian SPB	61.7830539999999999	-161.319170000000014
179	\N	\N	RTW	Saratov	51.5666659999999979	46.0666659999999979
180	\N	\N	RXS	Roxas City	11.6006599999999995	122.748819999999995
181	\N	\N	SAH	El Rahaba Airport (Sanaa Intenational)	15.4735980000000009	44.2251100000000008
182	\N	\N	SAV	Savannah/Hilton Head	32.1358000000000033	-81.2105899999999963
183	\N	\N	SBN	South Bend Regional	41.7005539999999968	-86.3133499999999998
184	\N	\N	SCE	University Park Airport	40.8537200000000027	-77.8482300000000009
185	\N	\N	SCL	Arturo Merino Benitez	-33.3971749999999972	-70.7938199999999966
186	\N	\N	SCQ	Santiago De Compostela	42.8973159999999964	-8.42032700000000034
187	\N	\N	SFB	Orlando Sanford International	28.7751179999999991	-81.2432000000000016
188	\N	\N	SFT	Skelleftea	64.6225100000000054	21.0685479999999998
189	\N	\N	SGD	Sonderborg	54.9302800000000033	9.79472200000000015
190	\N	\N	SID	Amilcar Cabral International	16.7346949999999985	-22.9436129999999991
191	\N	\N	SJC	Mineta San Jose International Airport	37.3667370000000005	-121.926379999999995
192	\N	\N	SKG	Macedonia International	40.5208319999999986	22.9722210000000011
193	\N	\N	SKO	Sokoto	13.0063890000000004	5.24222199999999994
194	\N	\N	SLU	George F L Charles	14.0204170000000001	-60.994410000000002
195	\N	\N	SLZ	Marechal Cunha Machado	-2.58331599999999995	-44.2366829999999993
196	\N	\N	SMA	Vila Do Porto	36.9666670000000011	-25.1000000000000014
197	\N	\N	SMF	Sacramento International	38.6922840000000008	-121.593699999999998
198	\N	\N	SOU	Southampton Airport	50.9507260000000031	-1.36131800000000003
199	\N	\N	SSA	Luis Eduardo Magalhaes	-12.9139879999999998	-38.3351970000000009
200	\N	\N	STI	Cibao International Airport	19.4018289999999993	-70.6020800000000008
201	\N	\N	STT	Cyril E King Airport	18.3374999999999986	-64.9694439999999958
202	\N	\N	SUR	Summer Beaver	52.7152799999999999	-88.5474999999999994
203	\N	\N	SVO	Sheremetyevo International	55.9663240000000002	37.4165729999999996
204	\N	\N	SZX	Shenzhen	22.639444000000001	113.810839999999999
205	\N	\N	TAB	Crown Point Airport	11.1525409999999994	-60.8396839999999983
206	\N	\N	TAG	Tagbilaran	9.65758699999999948	123.853615000000005
207	\N	\N	TAM	Gen F Javier Mina	22.2890820000000005	-97.8701599999999985
208	\N	\N	TEE	Tbessa	35.4666670000000011	8.15000000000000036
209	\N	\N	TFN	Norte Los Rodeos	28.4880560000000003	-16.3459819999999993
210	\N	\N	TGZ	Llano San Juan	16.5636100000000006	-93.0224999999999937
211	\N	\N	THU	Pituffik	76.5333300000000065	-68.7000000000000028
212	\N	\N	TIJ	General A. L. Rodriguez International	32.546284	-116.97466
213	\N	\N	TKJ	Tok	63.2999999999999972	-143
214	\N	\N	TLC	Licenciado Adolfo Lopez Mateos International	19.2833329999999989	-99.6666639999999973
215	\N	\N	TNN	Tainan	22.9487060000000014	120.215710000000001
216	\N	\N	TOU	Touho	-20.8000000000000007	165.25
217	\N	\N	TRF	Sandefjord	59.1780850000000029	10.2518069999999994
218	\N	\N	TUA	Tulcan	0.800000000000000044	-77.7166699999999935
219	\N	\N	TUB	Tubuai	-23.3500000000000014	-149.46665999999999
220	\N	\N	TVC	Cherry Capital Airport	44.7440830000000034	-85.5803499999999957
221	\N	\N	TWT	Tawitawi	5.04495800000000028	119.744029999999995
222	\N	\N	TZL	Tuzla International	44.4097200000000001	18.7091670000000008
223	\N	\N	UAP	Ua Pou	-9.34347700000000003	-140.081250000000011
224	\N	\N	UBJ	Ube	33.9333949999999973	131.274889999999999
225	\N	\N	UKA	Ukunda	-4.29999999999999982	39.5666659999999979
226	\N	\N	UKB	Kobe	34.6373000000000033	135.228399999999993
227	\N	\N	ULO	Ulaangom	49.9833339999999993	92.0666659999999979
228	\N	\N	ULY	Vostochny	54.2666660000000007	48.2166670000000011
229	\N	\N	ULZ	Uliastai	47.75	96.8499999999999943
230	\N	\N	VCL	Chulai	15.4222219999999997	108.703890000000001
231	\N	\N	VCS	Coong	10.3713890000000006	106.633330000000001
232	\N	\N	VPN	Vopnafjordur	65.7569400000000002	-14.8294440000000005
233	\N	\N	VVO	Vladivostok	43.3785740000000004	132.140749999999997
234	\N	\N	WAA	Wales	65.6172260000000023	-168.090839999999986
235	\N	\N	WAE	Wadi Ad Dawasir	20.4984439999999992	45.2044500000000014
236	\N	\N	WBQ	Beaver	66.3622199999999935	-147.40834000000001
237	\N	\N	WEI	Weipa	-12.681317	141.924700000000001
238	\N	\N	WJU	WonJu	37.4341659999999976	127.951669999999993
239	\N	\N	WLH	Walaha	-15.4166670000000003	167.699999999999989
240	\N	\N	WNP	Naga	13.5872220000000006	123.269999999999996
241	\N	\N	WUA	Wu Hai	39.7947240000000022	106.799164000000005
242	\N	\N	WWT	Newtok	60.922780000000003	-164.648599999999988
243	\N	\N	WYS	Yellowstone	44.6866699999999994	-111.10472
244	\N	\N	XMS	Macas	-2.31666699999999981	-78.1333300000000008
245	\N	\N	YAG	Fort Frances Municipal	48.6527799999999999	-93.4472200000000015
246	\N	\N	YDP	Nain	56.5333329999999989	-61.6666680000000014
247	\N	\N	YEI	Yenisehir	40.2333339999999993	29.5500000000000007
248	\N	\N	YGJ	Miho	35.5006520000000023	133.24448000000001
249	\N	\N	YHZ	Halifax International	44.8849599999999995	-63.514249999999997
250	\N	\N	YLH	Lansdowne House	52.1833340000000021	-87.9300000000000068
251	\N	\N	YOW	Ottawa Macdonald-Cartier International	45.3208300000000008	-75.6727750000000015
252	\N	\N	YWG	Winnipeg	49.8999999999999986	-97.2333299999999952
253	\N	\N	YXH	Medicine Hat	50.0158350000000027	-110.720830000000007
254	\N	\N	YXS	Prince George	53.8838099999999969	-122.673959999999994
255	\N	\N	YYJ	Victoria International	48.6402659999999969	-123.430959999999999
256	\N	\N	ZRH	Zurich	47.450603000000001	8.56174599999999941
257	\N	\N	ZSA	San Salvador	24.0599999999999987	-74.5330600000000061
258	\N	\N	ZUM	Churchill Falls	53.5627799999999965	-64.109170000000006
259	\N	\N	CRK	Diosdado Macapagal International (Clark International)	15.1825709999999994	120.546486000000002
260	\N	\N	KQT	Kurgan Tube	37.8596100000000035	68.8611700000000013
261	\N	\N	NKG	Nanjing Lukou International Airport	31.7357370000000003	118.866519999999994
262	\N	\N	HLP	Halim Perdana Kusuma	-6.26805599999999963	106.890280000000004
263	\N	\N	AAA	Anaa	-17.0500000000000007	-145.416670000000011
264	\N	\N	AAB	Arrabury	-26.6999999999999993	141.041670000000011
265	\N	\N	AAC	El Arish International Airport	31.1333330000000004	33.75
266	\N	\N	AAE	Les Salines	36.821392000000003	7.81185699999999983
267	\N	\N	AAF	Apalachicola Regional	29.7333339999999993	-84.9833299999999952
268	\N	\N	AAG	Arapoti	-24.1036110000000008	-49.7899999999999991
269	\N	\N	AAH	Aachen/Merzbruck	50.75	6.13333300000000037
270	\N	\N	AAI	Arraias	-12.9166670000000003	-46.9333340000000021
271	\N	\N	AAJ	Cayana Airstrip	3.89999999999999991	-55.3666699999999992
272	\N	\N	AAK	Aranuka	0.16666700000000001	173.583329999999989
273	\N	\N	AAL	Aalborg	57.0865500000000026	9.87224100000000071
274	\N	\N	AAM	Mala Mala	-24.8000000000000007	31.5333329999999989
275	\N	\N	AAN	Al Ain	24.260231000000001	55.6166270000000011
276	\N	\N	AAO	Anaco	9.43194399999999966	-64.4638900000000064
277	\N	\N	AAP	Andrau Airpark	29.8333319999999986	-95.6666639999999973
278	\N	\N	AAQ	Anapa	44.8999999999999986	37.3166659999999979
279	\N	\N	AAR	Aarhus Airport	56.3082300000000018	10.6263509999999997
280	\N	\N	AAS	Apalapsili	-3.9166669999999999	139.25
281	\N	\N	AAU	Asau	-13.4583329999999997	-172.599999999999994
282	\N	\N	AAV	Allah Valley	6.33333299999999966	124.766670000000005
283	\N	\N	AAW	Abbottabad	34.2000000000000028	73.25
284	\N	\N	AAY	Al Ghaydah	16.1959599999999995	52.1732560000000021
285	\N	\N	AAZ	Quetzaltenango	14.8699999999999992	-91.5
286	\N	\N	ABB	RAF Station	51.6666680000000014	-1.28333300000000006
287	\N	\N	ABC	Los Llanos	38.9483340000000027	-1.86333299999999991
288	\N	\N	ABD	Abadan	30.363904999999999	48.2265969999999982
289	\N	\N	ABF	Abaiang	1.67083300000000001	173.304169999999999
290	\N	\N	ABG	Abingdon	-17.6666680000000014	143.199999999999989
291	\N	\N	ABH	Alpha	-23.6499999999999986	146.633330000000001
292	\N	\N	ABJ	Felix Houphouet Boigny	5.25487899999999986	-3.93301500000000015
293	\N	\N	ABK	Kabri Dar	6.73388899999999957	44.2661099999999976
294	\N	\N	ABL	Ambler	67.0875000000000057	-157.84584000000001
295	\N	\N	ABM	Bamaga Injinoo	-10.9426190000000005	142.450330000000008
296	\N	\N	ABN	Albina	5.5	-54.0833319999999986
297	\N	\N	ABO	Aboisso	5.43333300000000019	-3.21666700000000017
298	\N	\N	ABP	Atkamba	-6.06666699999999981	141.099999999999994
299	\N	\N	ABR	Municipal	45.4525000000000006	-98.4261099999999942
300	\N	\N	ABS	Abu Simbel	22.3675670000000011	31.6097740000000016
301	\N	\N	ABU	Atambua	-9.13333300000000037	124.883330000000001
302	\N	\N	ABV	Nnamdi Azikiwe International Airport	9.00461400000000012	7.27044699999999988
303	\N	\N	ABW	Abau	-10.1833329999999993	148.699999999999989
304	\N	\N	ABX	Albury	-36.0696259999999995	146.954530000000005
305	\N	\N	ACB	Antrim County	44.9833339999999993	-85.2166699999999935
306	\N	\N	ACC	Kotoka	5.60737000000000041	-0.171769000000000005
307	\N	\N	ACD	Acandi	8.51666699999999999	-77.2999999999999972
308	\N	\N	ACE	Lanzarote	28.9506680000000003	-13.6090590000000002
309	\N	\N	ACH	Altenrhein	47.4833339999999993	9.5666670000000007
310	\N	\N	ACI	The Blaye	49.7093470000000011	-2.21536899999999992
311	\N	\N	ACJ	Anuradhapura	8.34999999999999964	80.3833300000000008
312	\N	\N	ACK	Nantucket Memorial	41.2566679999999977	-70.0597199999999987
313	\N	\N	ACL	Aguaclara	4.75	-73
314	\N	\N	ACM	Arica	-2	-71.8333360000000027
315	\N	\N	ACN	International	29.3000000000000007	-100.916663999999997
316	\N	\N	ACP	Sahand	37.3472440000000034	46.145114999999997
317	\N	\N	ACR	Araracuara	-0.383332999999999979	-72.2999999999999972
318	\N	\N	ACS	Achinsk	56.2666660000000007	90.5666659999999979
319	\N	\N	ACV	Arcata	40.970913000000003	-124.106926000000001
320	\N	\N	ACX	Xingyi	25.0855560000000004	104.959440000000001
321	\N	\N	ACZ	Zabol Airport	31.0876939999999991	61.5422439999999966
322	\N	\N	ADC	Andakombe	-7.13333300000000037	145.733339999999998
323	\N	\N	ADD	Bole International	8.98375899999999916	38.7959000000000032
324	\N	\N	ADE	International	12.8261160000000007	45.0375370000000004
325	\N	\N	ADG	Lenawee County	41.8999999999999986	-84.0333300000000065
326	\N	\N	ADI	Arandis	-22.3999999999999986	15
327	\N	\N	ADJ	Marka International Airport	31.9753299999999996	35.9827700000000021
328	\N	\N	ADK	Adak Island Ns	51.8827799999999968	-176.64473000000001
329	\N	\N	ADL	Adelaide International Airport	-34.9381750000000011	138.537350000000004
330	\N	\N	ADM	Ardmore Municipal Airport	34.3030550000000005	-97.0194500000000062
331	\N	\N	ADN	Andes	5.66666700000000034	-75.9333340000000021
332	\N	\N	ADO	Andamooka	-31.0166660000000007	137.150000000000006
333	\N	\N	ADP	Ampara	7.3363889999999996	81.625275000000002
334	\N	\N	ADQ	Kodiak Airport	57.7552760000000021	-152.512969999999996
335	\N	\N	ADR	Andrews	33.4500000000000028	-79.5666659999999979
336	\N	\N	ADS	Addison Airport	32.7833329999999989	-97.2999999999999972
337	\N	\N	ADT	Ada Municipal	34.7999999999999972	-96.6666639999999973
338	\N	\N	ADU	Ardabil	38.3238259999999968	48.4212500000000006
339	\N	\N	ADW	Andrews AFB	38.8166659999999979	-76.8666699999999992
340	\N	\N	ADX	Leuchars	56.3666699999999992	-2.86666700000000008
341	\N	\N	ADY	Alldays	-22.6666680000000014	29.0500000000000007
342	\N	\N	AEA	Abemama Atoll	0.483333000000000013	173.849999999999994
343	\N	\N	AED	Aleneva	58.0333329999999989	-152.900000000000006
344	\N	\N	AEG	Aek Godang	1.39972199999999991	99.4166639999999973
345	\N	\N	AEH	Abéché	13.8513889999999993	20.850833999999999
346	\N	\N	AEI	Algeciras	36.1289000000000016	-5.44130100000000017
347	\N	\N	AEK	Aseki	-7.36666699999999963	146.28334000000001
348	\N	\N	AEL	Albert Lea	43.6499999999999986	-93.3666699999999992
349	\N	\N	AEO	Aioun El Atrouss	16.7091670000000008	-9.63555599999999934
350	\N	\N	AEU	Abu Musa	25.8874999999999993	55.0416680000000014
351	\N	\N	AEX	Alexandria International	31.3212679999999999	-92.5395800000000008
352	\N	\N	AEY	Akureyri	65.6545639999999935	-18.0750680000000017
353	\N	\N	AFA	San Rafael	-34.5891700000000029	-68.4005599999999987
354	\N	\N	AFD	Port Alfred	-33.5833319999999986	26.8833330000000004
355	\N	\N	AFF	USAF Academy Airstrip	38.8333319999999986	-104.700000000000003
356	\N	\N	AFI	Amalfi	6.91666700000000034	-75.0666659999999979
357	\N	\N	AFK	Kondavattavan Tank	40.6688880000000026	-96.0069400000000002
358	\N	\N	AFN	Municipal	42.8333319999999986	-72.0666659999999979
359	\N	\N	AFO	Municipal	42.7333339999999993	-110.933334000000002
360	\N	\N	AFR	Afore	-9.13333300000000037	148.383330000000001
361	\N	\N	AFS	Zarafshan	41.6136100000000013	64.2330549999999931
362	\N	\N	AFT	Afutara Aerodrome	-9.19999999999999929	160.849999999999994
363	\N	\N	AFW	Fort Worth Alliance	32.9866680000000017	-97.3166659999999979
364	\N	\N	AFY	Afyon	38.7333339999999993	30.6000000000000014
365	\N	\N	AFZ	Sabzevar	36.1715129999999974	57.6033199999999965
366	\N	\N	AGB	Augsburg - Muehlhausen	48.4252779999999987	10.9316669999999991
367	\N	\N	AGC	Allegheny County	40.3547200000000004	-79.9300000000000068
368	\N	\N	AGD	Anggi	-1.38333299999999992	133.866669999999999
369	\N	\N	AGE	Flugplatz	53.7833329999999989	7.91666700000000034
370	\N	\N	AGF	La Garenne	44.1736099999999965	0.598611000000000004
371	\N	\N	AGG	Angoram	-4.16861100000000029	144.073880000000003
372	\N	\N	AGH	Angelholm	56.293056	12.8625000000000007
373	\N	\N	AGI	Wageningen	5.83333299999999966	-56.8333319999999986
374	\N	\N	AGJ	Aguni	26.5897219999999983	127.238050000000001
375	\N	\N	AGK	Kagua	-6.40333299999999994	143.846660000000014
376	\N	\N	AGL	Wanigela	-9.34027799999999964	149.155270000000002
377	\N	\N	AGO	Municipal	33.2666660000000007	-93.2333299999999952
378	\N	\N	AGP	Pablo Ruiz Picasso	36.6751819999999995	-4.48961599999999983
379	\N	\N	AGQ	Agrinion	38.6041680000000014	21.3519439999999996
380	\N	\N	AGT	Alejo Garcia	-25.5	-54.8333319999999986
381	\N	\N	AGV	Acarigua	9.55222200000000043	-69.2333299999999952
382	\N	\N	AGW	Agnew	-12.1500000000000004	142.150000000000006
383	\N	\N	AGZ	Aggeneys	-29.0500000000000007	18.8500000000000014
384	\N	\N	AHA	Naha AFB	26.1999999999999993	127.650000000000006
385	\N	\N	AHC	Amedee AAF	40.1499999999999986	-120.133330000000001
386	\N	\N	AHD	Downtown	34.1666680000000014	-97.1333300000000008
387	\N	\N	AHF	Municipal	40.2999999999999972	-99.9000000000000057
388	\N	\N	AHH	Municipal	45.2999999999999972	-92.3499999999999943
389	\N	\N	AHI	Amahai	-3.3333330000000001	128.916670000000011
390	\N	\N	AHL	Aishalton	2.48333300000000001	-59.3166659999999979
391	\N	\N	AHN	Athens-Ben Epps	33.9519499999999965	-83.3247199999999992
392	\N	\N	AHO	Fertilia	40.6304050000000032	8.29589099999999924
393	\N	\N	AHS	Ahuas	15.4416670000000007	-84.4249999999999972
394	\N	\N	AHT	Amchitka	51.5	179
395	\N	\N	AHU	Charif Al Idrissi	35.1797200000000032	-3.83694399999999991
396	\N	\N	AHY	Ambatolahy	-20.0166660000000007	45.5333329999999989
397	\N	\N	AHZ	Alpe D Huez	45.0833319999999986	6.08333299999999966
398	\N	\N	AIA	Alliance	42.0516659999999973	-102.806659999999994
399	\N	\N	AIB	Anita Bay	56.2333339999999993	-132.383330000000001
400	\N	\N	AIC	Airok	7.5	170.833329999999989
401	\N	\N	AID	Municipal	40.1666680000000014	-85.6833340000000021
402	\N	\N	AIE	Aiome	-5.16666700000000034	144.666670000000011
403	\N	\N	AIF	Assis	-22.6666680000000014	-50.4166680000000014
404	\N	\N	AIG	Yalinga	6.51666699999999999	23.25
405	\N	\N	AIH	Aiambak	-7.348611	141.266390000000001
406	\N	\N	AII	Alisabieh	11.1500000000000004	42.7166670000000011
407	\N	\N	AIK	Municipal	33.5666659999999979	-81.7166699999999935
408	\N	\N	AIL	Ailigandi	9.25	-78.0833360000000027
409	\N	\N	AIM	Ailuk Island	10.1999999999999993	169.983339999999998
410	\N	\N	AIO	Municipal	41.3999999999999986	-95.0166700000000048
411	\N	\N	AIP	Ailinglapalap Island	7.26666699999999999	168.816669999999988
412	\N	\N	AIR	Aripuana	-10.25	-59.3833300000000008
413	\N	\N	AIS	Arorae Island	-2.64999999999999991	176.833329999999989
414	\N	\N	AIT	Aitutaki	-18.8294430000000013	-159.766999999999996
415	\N	\N	AIU	Atiu Island	-20.0333329999999989	-158.099999999999994
416	\N	\N	AIV	George Downer	33.1333300000000008	-88.1500000000000057
417	\N	\N	AIW	Ai-ais	-27.9833339999999993	17.5833319999999986
418	\N	\N	AIY	Bader Field	39.3599999999999994	-74.4572200000000066
419	\N	\N	AIZ	Lee C Fine Memorial	38.0983299999999971	-92.5472199999999958
420	\N	\N	AJA	Campo Dell Oro	41.9198700000000031	8.79401299999999964
421	\N	\N	AJJ	Akjoujt	19.730556	-14.3744440000000004
422	\N	\N	AJK	Araak	34.1333300000000008	49.8333319999999986
423	\N	\N	AJN	Ouani	-12.1263889999999996	44.4297200000000032
424	\N	\N	AJR	Arvidsjaur	65.5913900000000041	19.2855570000000007
425	\N	\N	AJS	Abreojos	26.8333319999999986	-113.666663999999997
426	\N	\N	AJU	Santa Maria	-10.9872060000000005	-37.0727919999999997
427	\N	\N	AJY	Agades	16.9641669999999998	7.99305600000000016
428	\N	\N	AKA	Ankang	32.7090999999999994	108.936000000000007
429	\N	\N	AKB	Atka	52.2172199999999975	-174.200839999999999
430	\N	\N	AKC	Fulton International	41.0399999999999991	-81.4677800000000047
431	\N	\N	AKD	Akola	20.6666680000000014	77.0833360000000027
432	\N	\N	AKE	Akieni	-1.1722220000000001	13.9166670000000003
433	\N	\N	AKG	Anguganak	-3.63333299999999992	142.016660000000002
434	\N	\N	AKH	Prince Sultan Air Base	24.0633340000000011	47.5805549999999968
435	\N	\N	AKJ	Asahikawa	43.6710899999999995	142.454540000000009
436	\N	\N	AKK	Akhiok SPB	56.9444429999999997	-154.166670000000011
437	\N	\N	AKM	Zakouma	10.8833330000000004	19.8166679999999999
438	\N	\N	AKN	King Salmon	58.6827400000000026	-156.669019999999989
439	\N	\N	AKO	Colorado Plains Regional Airport	40.1666680000000014	-103.216669999999993
440	\N	\N	AKP	Anaktuvuk	68.1375000000000028	-151.740000000000009
441	\N	\N	AKQ	Gunung Batin	-4.61666699999999963	105.233329999999995
442	\N	\N	AKR	Akure	7.25	5.08333299999999966
443	\N	\N	AKT	Raf Akrotiri	34.5833319999999986	32.9833339999999993
444	\N	\N	AKV	Akulivik	60.7333339999999993	-78.5833360000000027
445	\N	\N	AKW	Aghajari	30.75	49.6833340000000021
446	\N	\N	AKX	Aktyubinsk	50.2493359999999996	57.2114029999999971
447	\N	\N	ALA	Almaty	43.3466530000000034	77.0114499999999964
448	\N	\N	ALC	Alicante El Altet	38.2870980000000003	-0.557381000000000015
449	\N	\N	ALD	Alerta	-11.6833329999999993	-69.3333360000000027
450	\N	\N	ALE	Alpine	30.4166680000000014	-103.75
451	\N	\N	ALG	Houari Boumediene	36.7005800000000022	3.2116699999999998
452	\N	\N	ALH	Albany	-34.9449960000000033	117.804000000000002
453	\N	\N	ALI	International	27.75	-98.0666659999999979
454	\N	\N	ALJ	Kortdoorn	-28.5672229999999985	16.5363879999999988
455	\N	\N	ALK	Asela	7.96666700000000017	39.1166699999999992
456	\N	\N	ALM	Municipal	32.8458329999999989	-105.985275000000001
457	\N	\N	ALN	Alton	38.8916660000000007	-90.0483300000000071
458	\N	\N	ALO	Waterloo	42.5561099999999968	-92.3997200000000021
459	\N	\N	ALP	Nejrab	36.1853520000000017	37.2270740000000018
460	\N	\N	ALQ	Federal	-29.7997230000000002	-55.7633319999999983
461	\N	\N	ALR	Alexandra	-45.2138899999999992	169.369450000000001
462	\N	\N	ALS	Municipal	37.4366699999999994	-105.866669999999999
463	\N	\N	ALT	Alenquer	-1.93333299999999997	-54.7666660000000007
464	\N	\N	ALU	Alula	11.9666669999999993	50.7999999999999972
465	\N	\N	ALW	Walla Walla	46.0947230000000019	-118.291115000000005
466	\N	\N	ALX	Thomas C Russell Field	32.9333340000000021	-85.9500000000000028
467	\N	\N	ALZ	Alitak SPB	56.8958319999999986	-154.245830000000012
468	\N	\N	AMA	Rick Husband Amarillo International	35.2182730000000035	-101.705129999999997
469	\N	\N	AMB	Ambilobe	-13.1833329999999993	48.9833339999999993
470	\N	\N	AMC	Am Timan	11.0333330000000007	20.2833329999999989
471	\N	\N	AMD	Ahmedabad	23.0663899999999984	72.6241700000000066
472	\N	\N	AME	Alto Molocue	-15.8333329999999997	37.5833319999999986
473	\N	\N	AMF	Ama	-4.16666700000000034	141.666670000000011
474	\N	\N	AMG	Amboin	-4.61666699999999963	143.699999999999989
475	\N	\N	AMH	Arba Mintch	6.036111	37.5769420000000025
476	\N	\N	AMI	Selaparang	-8.56316499999999969	116.102369999999993
477	\N	\N	AMJ	Almenara	-16.1833320000000001	-40.6833340000000021
478	\N	\N	AMK	Animas Airpark	37.1499999999999986	-107.75
479	\N	\N	AML	Puerto Armuellas	8.26666699999999999	-82.8666699999999992
480	\N	\N	AMM	Queen Alia International	31.7225339999999996	35.9893199999999993
481	\N	\N	AMN	Gratiot Community	43.3833300000000008	-84.6500000000000057
482	\N	\N	AMO	Mao	14.1166669999999996	15.3166670000000007
483	\N	\N	AMP	Ampanihy	-24.6999999999999993	44.7333339999999993
484	\N	\N	AMR	Arno	7.03333299999999983	171.233339999999998
485	\N	\N	AMT	Amata	-26.7666660000000007	132.03334000000001
486	\N	\N	AMU	Amanab	-3.51666699999999999	141.150000000000006
487	\N	\N	AMV	Amderma	69.7666700000000048	61.5499999999999972
488	\N	\N	AMW	Ames	41.9941669999999974	-93.6183300000000003
489	\N	\N	AMX	Ammaroo	-21.7399999999999984	135.240000000000009
490	\N	\N	AMZ	Ardmore	-37.0333329999999989	174.96665999999999
491	\N	\N	ANA	John Wayne International	33.8166659999999979	-117.933334000000002
492	\N	\N	ANB	Anniston Metropolitan	33.5902799999999999	-85.855834999999999
493	\N	\N	AND	Anderson	34.4936099999999968	-82.7099999999999937
494	\N	\N	ANF	Cerro Moreno	-23.4490000000000016	-70.4407900000000069
495	\N	\N	ANG	Brie-Champniers	45.7333339999999993	0.216666999999999998
496	\N	\N	ANH	Anuha Island Resort	-8.98333300000000001	160.5
497	\N	\N	ANJ	Zanaga	-2.85000000000000009	13.8333329999999997
498	\N	\N	ANL	Andulo	-11.25	17.25
499	\N	\N	ANM	Antsirabato	-15	50.3166659999999979
500	\N	\N	ANN	Annette Island	55.0369450000000029	-131.57056
501	\N	\N	ANO	Angoche	-16.177778	39.9369429999999994
502	\N	\N	ANP	Lee	38.9833339999999993	-76.5
503	\N	\N	ANQ	Tri-State Steuben County	41.6333300000000008	-85
504	\N	\N	ANR	Deurne/ Antwerp Airport	51.1891600000000011	4.45067199999999996
505	\N	\N	ANT	St Anton	47.1499999999999986	10.2833330000000007
506	\N	\N	ANW	Ainsworth	42.5499999999999972	-99.8666699999999992
507	\N	\N	ANX	Andøya Lufthavn, Andenes	69.3049199999999956	16.1333260000000003
508	\N	\N	ANY	Anthony	37.1499999999999986	-98.0333300000000065
509	\N	\N	ANZ	Angus Downs	-25.0833319999999986	132.166670000000011
510	\N	\N	AOA	Aroa	-9.05000000000000071	146.800000000000011
511	\N	\N	AOB	Annanberg	-4.91666700000000034	144.650000000000006
512	\N	\N	AOC	Altenburg Nobitz	50.9833339999999993	12.4499999999999993
513	\N	\N	AOD	Abou Deia	11.4747219999999999	19.2888890000000011
514	\N	\N	AOG	Anshan	41.1666680000000014	123.033330000000007
515	\N	\N	AOH	Allen County	40.7666660000000007	-84.0999999999999943
516	\N	\N	AOI	Falconara	43.6069099999999992	13.3557229999999993
517	\N	\N	AOK	Karpathos	35.4206849999999989	27.1467290000000006
518	\N	\N	AOL	Paso De Los Libres	-29.6833320000000001	-57.1499999999999986
519	\N	\N	AON	Arona	-6.33333299999999966	146
520	\N	\N	AOR	Alor Setar	6.20117100000000043	100.405265999999997
521	\N	\N	AOS	Amook	57.4666670000000011	-153.833329999999989
522	\N	\N	AOT	Corrado Gex	45.7386100000000013	7.36249999999999982
523	\N	\N	AOU	Attopeu	14.8000000000000007	106.833336000000003
524	\N	\N	APA	Arapahoe Co	39.7333339999999993	-104.983329999999995
525	\N	\N	APB	Apolo	-14.7166669999999993	-68.5166700000000048
526	\N	\N	APC	Napa County	38.2122230000000016	-122.280000000000001
527	\N	\N	APE	San Juan Aposento	-11.9333329999999993	-69.0833360000000027
528	\N	\N	APF	Naples	26.1527789999999989	-81.7752760000000052
529	\N	\N	APG	Phillips AAF	39.5	-76.1666639999999973
530	\N	\N	APH	Camp A P Hill	38.0499999999999972	-77.3499999999999943
531	\N	\N	API	Apiay	4.06888900000000042	-73.0519400000000019
532	\N	\N	APK	Apataki	-15.4166670000000003	-146.083329999999989
533	\N	\N	APN	Alpena County Regional	45.0816700000000026	-83.5558300000000003
534	\N	\N	APO	Apartado	7.8176779999999999	-76.7176599999999951
535	\N	\N	APP	Asapa	-8.98333300000000001	148.133330000000001
536	\N	\N	APQ	Arapiraca	-9.75	-36.6499999999999986
537	\N	\N	APR	April River	-8.5	145
538	\N	\N	APS	Anapolis	-16.3333319999999986	-48.9666670000000011
539	\N	\N	APT	Marion County	35.0666659999999979	-85.5
540	\N	\N	APU	Apucarana	-23.5500000000000007	-51.4833339999999993
541	\N	\N	APV	Apple Valley	34.5263899999999992	-117.212776000000005
542	\N	\N	APW	Faleolo	-13.8327930000000006	-171.997240000000005
543	\N	\N	APX	Arapongas	-23.4833339999999993	-51.4666670000000011
544	\N	\N	APY	Alto Parnaiba	-9.13333300000000037	-45.9333340000000021
545	\N	\N	APZ	Zapala	-38.9166680000000014	-70.0833360000000027
546	\N	\N	AQA	Araraquara	-21.8166679999999999	-48.1333300000000008
547	\N	\N	AQB	Quiche Airport	15.0099999999999998	-91.1500000000000057
548	\N	\N	AQI	Qaisumah	28.3344079999999998	46.1213150000000027
549	\N	\N	AQJ	King Hussein International	29.6100729999999999	35.0215099999999993
550	\N	\N	AQM	Ariquemes	-9.9333329999999993	-63.0666659999999979
551	\N	\N	AQP	Rodriguez Ballon	-16.344812000000001	-71.5679899999999947
552	\N	\N	AQS	Saqani	-17	170.900000000000006
553	\N	\N	AQY	Alyeska	60.9666670000000011	-149.116669999999999
554	\N	\N	ARB	Municipal	42.2999999999999972	-83.75
555	\N	\N	ARE	Arecibo	18.4499999999999993	-66.6758350000000064
556	\N	\N	ARF	Acaricuara	0.533332999999999946	-70.1333300000000008
557	\N	\N	ARG	Walnut Ridge	36.0666659999999979	-90.9500000000000028
558	\N	\N	ARH	Arkhangelsk	64.5947950000000048	40.7119029999999995
559	\N	\N	ARI	Chacalluta	-18.3497659999999989	-70.3355559999999969
560	\N	\N	ARJ	Arso	-2.93333300000000019	140.78334000000001
561	\N	\N	ARK	Arusha	-3.36666700000000008	36.6833340000000021
562	\N	\N	ARL	Arly	11.5999999999999996	1.48333300000000001
563	\N	\N	ARM	Armidale	-30.5322969999999998	151.614929999999987
564	\N	\N	ARN	Arlanda	59.6498199999999983	17.9303649999999983
565	\N	\N	ARO	Arboletas	8.84999999999999964	-76.4333340000000021
566	\N	\N	ARP	Aragip	-9.80000000000000071	149.5
567	\N	\N	ARQ	Arauquita	7.0330560000000002	-71.4316599999999937
568	\N	\N	ARR	Alto Rio Senguerr	-45.0333329999999989	-70.8333360000000027
569	\N	\N	ARS	Aragarcas	-15.9000000000000004	-52.2333339999999993
570	\N	\N	ART	Watertown	43.9908330000000021	-76.0213849999999951
571	\N	\N	ARU	Aracatuba	-21.143612000000001	-50.4261100000000013
572	\N	\N	ARV	Noble F. Lee	45.9241680000000017	-89.7322199999999981
573	\N	\N	ARX	Asbury Park	40.2166670000000011	-74.0999999999999943
574	\N	\N	ARY	Ararat	-37.3166659999999979	143
575	\N	\N	ASA	Assab International	13.0700000000000003	42.6383319999999983
576	\N	\N	ASB	Ashgabat	37.9841839999999991	58.3669780000000031
577	\N	\N	ASC	Ascension	-15.9166670000000003	-63.1499999999999986
578	\N	\N	ASD	Andros Town	24.6977790000000006	-77.7961099999999988
579	\N	\N	ASE	Aspen	39.2196849999999984	-106.864684999999994
580	\N	\N	ASF	Astrakhan	46.287700000000001	47.9999770000000012
581	\N	\N	ASG	Ashburton	-43.8999999999999986	171.78334000000001
582	\N	\N	ASH	Boire Field	42.778889999999997	-71.5094449999999995
583	\N	\N	ASI	Wideawake Field	-7.96666700000000017	-14.4000000000000004
584	\N	\N	ASJ	Amami	28.4315220000000011	129.707930000000005
585	\N	\N	ASK	Yamoussoukro	6.81666699999999981	-5.28333299999999983
586	\N	\N	ASL	Harrison County	32.5499999999999972	-94.3833300000000008
587	\N	\N	ASM	Yohannes IV	15.2911110000000008	38.9102800000000002
588	\N	\N	ASN	Talladega	33.4333340000000021	-86.0999999999999943
589	\N	\N	ASQ	Austin	39.4666670000000011	-117.166663999999997
590	\N	\N	ASR	Erkilet International Airport	38.7742000000000004	35.4907070000000004
591	\N	\N	AST	Astoria	46.1597200000000001	-123.879999999999995
592	\N	\N	ASU	Silvio Pettirossi	-25.2417949999999998	-57.5137939999999972
593	\N	\N	ASV	Amboseli	-2.63333299999999992	37.25
594	\N	\N	ASX	Ashland	46.5499999999999972	-90.9166639999999973
595	\N	\N	ASY	Ashley	46.0333329999999989	-99.3666699999999992
596	\N	\N	ASZ	Asirim	-5.86666699999999963	150.366669999999999
597	\N	\N	ATA	Anta	-9.34722200000000036	-77.5999999999999943
598	\N	\N	ATB	Atbara	17.7166670000000011	34.0166660000000007
599	\N	\N	ATE	Antlers	34.2333339999999993	-95.6166699999999992
600	\N	\N	ATF	Chachoan	-1.0833330000000001	-78.7000000000000028
601	\N	\N	ATG	Attock	33.8999999999999986	72.25
602	\N	\N	ATI	Artigas	-30.3999999999999986	-56.5083300000000008
603	\N	\N	ATJ	Antsirabe	-19.8500000000000014	47.0166660000000007
604	\N	\N	ATM	Altamira	-3.20000000000000018	-52.2166670000000011
605	\N	\N	ATN	Namatanai	-3.6666669999999999	152.46665999999999
606	\N	\N	ATO	Ohio University	39.3333319999999986	-82.0999999999999943
607	\N	\N	ATP	Airstrip	-3.1666669999999999	142.28334000000001
608	\N	\N	ATQ	Raja Sansi International Airport	31.706741000000001	74.8072999999999979
609	\N	\N	ATR	Mouakchott	20.4994429999999994	-13.0463889999999996
610	\N	\N	ATS	Artesia	32.8483299999999971	-104.466939999999994
611	\N	\N	ATU	Casco Cove	52.8258319999999983	173.172779999999989
612	\N	\N	ATV	Ati	13.2422219999999999	18.307500000000001
613	\N	\N	ATW	Outagamie County	44.2601099999999974	-88.5099400000000003
614	\N	\N	ATX	Atbasar	51.8833300000000008	68.4000000000000057
615	\N	\N	ATY	Watertown	44.9088899999999995	-97.1541699999999935
616	\N	\N	AUA	Reina Beatrix	12.5022219999999997	-70.0138850000000019
617	\N	\N	AUB	Itauba	-5.76666699999999999	-63.3500000000000014
618	\N	\N	AUD	Augustus Downs	-18.5069450000000018	139.881670000000014
619	\N	\N	AUE	Abu Rudeis	28.8999999999999986	33.1833340000000021
620	\N	\N	AUF	Auxerre Branches	47.8500000000000014	3.5
621	\N	\N	AUG	Augusta	44.3180539999999965	-69.796670000000006
622	\N	\N	AUI	Aua Island	-1.4583330000000001	143.074999999999989
623	\N	\N	AUJ	Ambunti	-4.25	142.849999999999994
624	\N	\N	AUK	Alakanuk	62.6891669999999976	-164.610839999999996
625	\N	\N	AUL	Aur Island	8.13333300000000037	171.166670000000011
626	\N	\N	AUM	Austin	43.6666680000000014	-92.9833299999999952
627	\N	\N	AUN	Auburn	38.8999999999999986	-121.066665999999998
628	\N	\N	AUO	Auburn-Opelika	32.6333300000000008	-85.5
629	\N	\N	AUP	Agaun	-9.98333300000000001	149.583329999999989
630	\N	\N	AUR	Aurillac	44.8975000000000009	2.41805599999999998
631	\N	\N	AUT	Atauro	-8.21666699999999928	125.583336000000003
632	\N	\N	AUU	Aurukun Mission	-13.1666670000000003	142.25
633	\N	\N	AUV	Aumo	-5.71666700000000017	148.433330000000012
634	\N	\N	AUW	Municipal	44.923332000000002	-89.6230549999999937
635	\N	\N	AUX	Araguaina	-7.20000000000000018	-48.2000000000000028
636	\N	\N	AUZ	Municipal Airport	41.75	-88.3166659999999979
637	\N	\N	AVA	An Shun/Huang Guo Shu	26.2572210000000013	105.872780000000006
638	\N	\N	AVB	Aviano	46.0333329999999989	12.5999999999999996
639	\N	\N	AVG	Auvergne	-15.6500000000000004	130.016660000000002
640	\N	\N	AVI	Maximo Gomez	22.0249999999999986	-78.7913900000000069
641	\N	\N	AVK	Arvaikheer	46.2666660000000007	102.783330000000007
642	\N	\N	AVN	Avignon-Caumont	43.8999999999999986	4.90000000000000036
643	\N	\N	AVO	Municipal	27.6000000000000014	-81.5166700000000048
644	\N	\N	AVU	Avu Avu	-9.83333299999999966	160.383330000000001
645	\N	\N	AVW	Avra Valley	32.4166680000000014	-111.216669999999993
646	\N	\N	AVX	Avalon Bay	33.3416670000000011	-118.315280000000001
647	\N	\N	AWA	Awassa	7.06111100000000036	38.4874999999999972
648	\N	\N	AWB	Awaba	-8.01666699999999999	142.75
649	\N	\N	AWE	Alowe	-0.75	9.44999999999999929
650	\N	\N	AWK	Wake Island	19.2833329999999989	166.633330000000001
651	\N	\N	AWM	Municipal	35.1333300000000008	-90.1833340000000021
652	\N	\N	AWN	Alton Downs	-26.25	138.666670000000011
653	\N	\N	AWP	Austral Downs	-20.5	137.75
654	\N	\N	AWR	Awar	-4.12416699999999992	144.870290000000011
655	\N	\N	AWZ	Ahwaz	31.3429199999999994	48.7466799999999978
656	\N	\N	AXA	Wallblake	18.2166670000000011	-63.0666659999999979
657	\N	\N	AXB	Alexandria Bay	44.2524999999999977	-75.9013900000000064
658	\N	\N	AXC	Aramac	-22.9580550000000017	145.242500000000007
659	\N	\N	AXE	Xanxere	-26.8833330000000004	-52.3833300000000008
660	\N	\N	AXG	Algona	43.0666659999999979	-94.2333299999999952
661	\N	\N	AXL	Alexandria	-19.0833319999999986	136.666670000000011
662	\N	\N	AXN	Alexandria	45.8672200000000032	-95.394165000000001
663	\N	\N	AXP	Springpoint Airport	22.4499999999999993	-73.9666699999999935
664	\N	\N	AXS	Municipal	34.6966669999999979	-99.3380599999999987
665	\N	\N	AXV	Neil Armstrong	40.5666659999999979	-84.2000000000000028
666	\N	\N	AXX	Angel Fire	36.4166680000000014	-105.283330000000007
667	\N	\N	AYA	Ayapel	8.3166670000000007	-75.1500000000000057
668	\N	\N	AYC	Ayacucho	8.59999999999999964	-73.6166699999999992
669	\N	\N	AYD	Alroy Downs	-19.3000000000000007	135.949999999999989
670	\N	\N	AYE	AAF Heliport	42.5499999999999972	-71.5999999999999943
671	\N	\N	AYG	Yaguara	1.53333300000000006	-73.9333340000000021
672	\N	\N	AYI	Yari	-0.33333299999999999	-72.3333360000000027
673	\N	\N	AYK	Arkalyk	50.3166659999999979	66.9666699999999935
674	\N	\N	AYL	Anthony Lagoon	-18.0333329999999989	135.53334000000001
675	\N	\N	AYN	Anyang	36.1000000000000014	114.349999999999994
676	\N	\N	AYO	Ayolas	-27.3666669999999996	-56.8500000000000014
677	\N	\N	AYP	Yanamilla	-13.197222	-74.2472199999999987
678	\N	\N	AYQ	Connellan	-25.1908780000000014	130.976580000000013
679	\N	\N	AYR	Ayr	-19.596665999999999	147.324450000000013
680	\N	\N	AYS	Ware County	31.2486110000000004	-82.3966700000000003
681	\N	\N	AYT	Antalya	36.8992799999999974	30.8013499999999993
682	\N	\N	AYU	Aiyura	-6.33333299999999966	145.900000000000006
683	\N	\N	AYW	Ayawasi	-1.19999999999999996	132.5
684	\N	\N	AYZ	Zahns	40.6666680000000014	-73.4166639999999973
685	\N	\N	AZB	Amazon Bay	-10.1500000000000004	148.816669999999988
686	\N	\N	AZD	Yazd	31.9036030000000004	54.2832640000000026
687	\N	\N	AZG	Apatzingan	19.0680559999999986	-102.352776000000006
688	\N	\N	AZI	Bateen	24.4191670000000016	54.451667999999998
689	\N	\N	AZN	Andizhan	40.7333339999999993	72.2999999999999972
690	\N	\N	AZS	Samaná El Catey International	19.2705550000000017	-69.7369460000000032
691	\N	\N	AZT	Zapatoca	6.86666699999999963	-73.25
692	\N	\N	AZZ	Ambriz	-7.88333300000000037	13.1500000000000004
693	\N	\N	BAA	Bialla	-5.31666699999999981	151.03334000000001
694	\N	\N	BAB	Beale AFB	39.1499999999999986	-121.583336000000003
695	\N	\N	BAC	Barranca De Upia	4.58333299999999966	-72.9666699999999935
696	\N	\N	BAD	Barksdale AFB	32.5	-93.6666639999999973
697	\N	\N	BAE	Barcelonnette	44.3833300000000008	6.66666700000000034
698	\N	\N	BAF	Barnes	42.1333300000000008	-72.75
699	\N	\N	BAG	Loakan	16.3766670000000012	120.617774999999995
700	\N	\N	BAH	Bahrain International	26.2691799999999986	50.6260499999999993
701	\N	\N	BAI	Buenos Aires	9.16666700000000034	-83.3333360000000027
702	\N	\N	BAJ	Bali	-4.83333299999999966	149.133330000000001
703	\N	\N	BAL	Batman	37.9166680000000014	41.0833319999999986
704	\N	\N	BAM	Lander County	40.6333300000000008	-116.933334000000002
705	\N	\N	BAN	Basongo	-4.31333300000000008	20.428056999999999
706	\N	\N	BAO	Udorn	17.3850000000000016	102.792779999999993
707	\N	\N	BAP	Baibara	-10.3333329999999997	149.75
708	\N	\N	BAQ	E Cortissoz	10.8863979999999998	-74.7761799999999965
709	\N	\N	BAR	Baker AAF	55.3333319999999986	-133.599999999999994
710	\N	\N	BAT	Airport Chafei Amsei	-20.5500000000000007	-48.5499999999999972
711	\N	\N	BAU	Bauru	-22.3430560000000007	-49.052500000000002
712	\N	\N	BAV	Baotou	40.5633279999999985	110.000900000000001
713	\N	\N	BAW	Biawonque	-0.66666700000000001	146.349999999999994
714	\N	\N	BAX	Barnaul	53.3610880000000023	83.5476460000000003
715	\N	\N	BAY	Baia Mare	47.6499999999999986	23.4666670000000011
716	\N	\N	BBA	Teniente Vidal	-45.9166680000000014	-71.6949999999999932
717	\N	\N	BBB	Municipal	45.3166659999999979	-95.5999999999999943
718	\N	\N	BBC	Bay City	28.9833339999999993	-95.9666699999999935
719	\N	\N	BBD	Curtis Field	31.1333330000000004	-99.3333360000000027
720	\N	\N	BBF	Burlington	42.5	-71.1833340000000021
721	\N	\N	BBG	Butaritari	3.1666669999999999	172.75
722	\N	\N	BBH	Barth	54.3397199999999998	12.7116670000000003
723	\N	\N	BBI	Bhubaneswar	20.2528530000000018	85.81738
724	\N	\N	BBJ	Bitburg Air Base	49.9666670000000011	6.51666699999999999
725	\N	\N	BBM	Battambang	13.1166669999999996	103.200000000000003
726	\N	\N	BBP	Bembridge	50.6833340000000021	-1.0833330000000001
727	\N	\N	BBQ	Barbuda	17.5555549999999982	-61.7650000000000006
728	\N	\N	BBR	Baillif	16.0163900000000012	-61.7394450000000035
729	\N	\N	BBS	Blackbushe	51.3333319999999986	-0.849999999999999978
730	\N	\N	BBT	Berberati	4.21916699999999967	15.7880559999999992
731	\N	\N	BBV	Hkg	4.66666700000000034	-6.95000000000000018
732	\N	\N	BBW	Broken Bow	41.3999999999999986	-99.6333300000000008
733	\N	\N	BBX	Wings Field	40.1366650000000007	-75.2674999999999983
734	\N	\N	BBY	Bambari	5.84583299999999983	20.6497209999999995
735	\N	\N	BBZ	Zambezi	-13.5372219999999999	23.1099999999999994
736	\N	\N	BCA	Baracoa	20.3500000000000014	-74.5
737	\N	\N	BCB	Virginia Tech	37.2333339999999993	-80.4166639999999973
738	\N	\N	BCC	Bear Creek	45.1833340000000021	-109.099999999999994
739	\N	\N	BCD	Bacolod	10.6448149999999995	122.933589999999995
740	\N	\N	BCE	Bryce	37.7011099999999999	-112.135279999999995
741	\N	\N	BCF	Bouca	6.75	18.4166680000000014
742	\N	\N	BCG	Bemichi	6.54999999999999982	-58.5499999999999972
743	\N	\N	BCH	Cakung International	-8.49166699999999963	126.399720000000002
744	\N	\N	BCI	Barcaldine	-23.5591679999999997	145.301940000000002
745	\N	\N	BCJ	Baca Grande	39	-106
746	\N	\N	BCK	Bolwarra	-17.3999999999999986	144.166670000000011
747	\N	\N	BCL	Barra Colorado	10.8333329999999997	-82.9666699999999935
748	\N	\N	BCM	Bacau	46.5986100000000008	26.8819450000000018
749	\N	\N	BCO	Jinka	5.78333299999999983	36.5499999999999972
750	\N	\N	BCP	Bambu	-5.84999999999999964	146.483339999999998
751	\N	\N	BCQ	Brack	27.6833320000000001	14.2166669999999993
752	\N	\N	BCR	Boca Do Acre	-8.75	-67.3833300000000008
753	\N	\N	BCS	Southern Seaplane	29.9666670000000011	-90
754	\N	\N	BCT	Public	26.3500000000000014	-80.0833360000000027
755	\N	\N	BCU	Bauchi	10.3666669999999996	9.80000000000000071
756	\N	\N	BCV	Belmopan	17.2666660000000007	-88.7833300000000065
757	\N	\N	BCW	Benguera Island	-21.884722	35.4249999999999972
758	\N	\N	BCX	Beloreck	53.9333340000000021	58.3333319999999986
759	\N	\N	BCY	Bulchi	6.21666700000000017	36.6666680000000014
760	\N	\N	BCZ	Bickerton Island	-13.7833330000000007	137.800000000000011
761	\N	\N	BDA	L. F. Wade International	32.3599400000000017	-64.7011499999999984
762	\N	\N	BDB	Bundaberg	-24.8987079999999992	152.32186999999999
763	\N	\N	BDC	Barra Do Corda	-5.46666700000000017	-45.2666660000000007
764	\N	\N	BDD	Badu Island	-10.1486549999999998	142.171660000000003
765	\N	\N	BDE	Baudette	48.7227800000000002	-94.6069399999999945
766	\N	\N	BDF	Rinkenberger	41.1833340000000021	-89.6500000000000057
767	\N	\N	BDG	Blanding	37.6166699999999992	-109.483329999999995
768	\N	\N	BDI	Bird Island	-3.71666700000000017	55.2166670000000011
769	\N	\N	BDJ	Sjamsudin Noor	-3.43803999999999998	114.754249999999999
770	\N	\N	BDK	Bondoukou	8.03333300000000072	-2.79999999999999982
771	\N	\N	BDM	Bandirma	40.3183330000000026	27.9772220000000011
772	\N	\N	BDN	Talhar	24.6333330000000004	68.9000000000000057
773	\N	\N	BDP	Bhadrapur	26.5333329999999989	88.0833360000000027
774	\N	\N	BDR	Igor I. Sikorsky Memorial	41.164164999999997	-73.124440000000007
775	\N	\N	BDS	Papola Casale	40.6579929999999976	17.9390530000000012
776	\N	\N	BDT	Gbadolite	4.08333299999999966	22.4499999999999993
777	\N	\N	BDU	Bardufoss	69.0561139999999938	18.5399999999999991
778	\N	\N	BDV	Moba	-7	29.8000000000000007
779	\N	\N	BDW	Bedford Downs	-17.3000000000000007	127.466669999999993
780	\N	\N	BDX	Broadus	45.4666670000000011	-105.366669999999999
781	\N	\N	BDY	State	43.1166699999999992	-124.416663999999997
782	\N	\N	BDZ	Baindoung	-6.33333299999999966	146.949999999999989
783	\N	\N	BEA	Bereina	-8.65000000000000036	146.483339999999998
784	\N	\N	BEB	Benbecula	57.4734150000000028	-7.37602799999999981
785	\N	\N	BEC	Beech	37.6833340000000021	-97.3333360000000027
786	\N	\N	BED	Hanscom Field	42.4708329999999989	-71.2900000000000063
787	\N	\N	BEE	Beagle Bay	-16.9666670000000011	122.666663999999997
788	\N	\N	BEF	Bluefields	11.9969439999999992	-83.7686099999999954
789	\N	\N	BEG	Belgrade Nikola Tesla	44.8194429999999997	20.3069440000000014
790	\N	\N	BEH	Ross Field	42.1277770000000018	-86.4283300000000025
791	\N	\N	BEI	Beica	9.39166699999999999	34.5333329999999989
792	\N	\N	BEJ	Kalimaru	2.1666669999999999	117.700000000000003
793	\N	\N	BEK	Bareli	26.2166670000000011	81.2333299999999952
794	\N	\N	BEN	Benina International	32.0854229999999987	20.2648900000000012
795	\N	\N	BEO	Belmont	-33.0333329999999989	151.666670000000011
796	\N	\N	BEP	Bellary	15.1833329999999993	76.9000000000000057
797	\N	\N	BEQ	Honington	52.3500000000000014	0.766666999999999987
798	\N	\N	BES	Brest Lesquin	48.445374000000001	-4.41582700000000017
799	\N	\N	BET	Bethel Airport	60.7844430000000031	-161.831389999999999
800	\N	\N	BEV	Beer Sheba	31.25	34.7999999999999972
801	\N	\N	BEX	Benson (RAF Station)	51.6333300000000008	-1.0833330000000001
802	\N	\N	BEZ	Beru	-1.3333330000000001	176
803	\N	\N	BFA	Bahia Negra	-20.2327790000000007	-58.1702769999999987
804	\N	\N	BFB	Blue Fox Bay	58.1833340000000021	-152.133330000000001
805	\N	\N	BFC	Bloomfield	-15.9000000000000004	145.333329999999989
806	\N	\N	BFD	Bradford	41.8022229999999979	-78.6394399999999933
807	\N	\N	BFE	Bielefeld	52.0166660000000007	8.55000000000000071
808	\N	\N	BFG	Bullfrog Basin	37.5458339999999993	-110.713329999999999
809	\N	\N	BFH	Bacacheri	-25.4024999999999999	-49.2338900000000024
810	\N	\N	BFK	Buffalo Municipal Airport	39.7333339999999993	-104.866669999999999
811	\N	\N	BFL	Meadows Field	35.429625999999999	-119.045330000000007
812	\N	\N	BFM	Mobile Downtown	30.6833320000000001	-88.2333299999999952
813	\N	\N	BFO	Buffalo Range	-21.0091670000000015	31.5791660000000007
814	\N	\N	BFP	Beaver Falls	40.7666660000000007	-80.4000000000000057
815	\N	\N	BFQ	Bahia Pinas	7.58333299999999966	-78.1666639999999973
816	\N	\N	BFR	Virgil I Grissom Municipalcipal	38.8666699999999992	-86.4833299999999952
817	\N	\N	BFT	County	32.4108299999999971	-80.6350000000000051
818	\N	\N	BFU	Bengbu	32.9500000000000028	117.333336000000003
819	\N	\N	BFW	Sidi Belabbes	35.1716649999999973	-0.589443999999999968
820	\N	\N	BFX	Bafoussam	5.48333300000000001	10.4000000000000004
821	\N	\N	BGA	Palo Negro	7.12804500000000019	-73.1813999999999965
822	\N	\N	BGB	Booue	-0.106666999999999998	11.9388889999999996
823	\N	\N	BGC	Braganca	41.8166659999999979	-6.75
824	\N	\N	BGD	Borger	35.6499999999999986	-101.400000000000006
825	\N	\N	BGE	Decatur County	30.9166680000000014	-84.5833360000000027
826	\N	\N	BGF	Bangui	4.39611100000000032	18.5202789999999986
827	\N	\N	BGG	Bongouanou	6.70000000000000018	-4.25
828	\N	\N	BGH	Abbaye	16.6333330000000004	-14.1999999999999993
829	\N	\N	BGJ	Borgarfjordur Eystri	66	-14.5
830	\N	\N	BGK	Big Creek	16.5166660000000007	-88.4000000000000057
831	\N	\N	BGL	Baglung	28.2152789999999989	83.6833340000000021
832	\N	\N	BGM	Greater Binghamton	42.2085340000000002	-75.9829399999999993
833	\N	\N	BGO	Bergen Airport, Flesland	60.2890620000000013	5.22816900000000029
834	\N	\N	BGP	Bongo	-1.64999999999999991	13.4333329999999993
835	\N	\N	BGQ	Big Lake	31.1999999999999993	-101.466669999999993
836	\N	\N	BGR	Bangor International Airport	44.8122979999999984	-68.8210200000000043
837	\N	\N	BGS	Webb AFB	32.3855549999999965	-101.483329999999995
838	\N	\N	BGT	Bagdad	34.5666659999999979	-113.183334000000002
839	\N	\N	BGU	Bangassou	4.78666699999999956	22.7844450000000016
840	\N	\N	BGV	Bento Goncalves	-29.1666680000000014	-51.5166660000000007
841	\N	\N	BGX	Airport Cmdt. Gustavo Kraemer	-31.3986109999999989	-54.1124999999999972
842	\N	\N	BGZ	Braga	41.5499999999999972	-8.4333329999999993
843	\N	\N	BHA	Bahia De Caraquez	-0.599999999999999978	-80.4166639999999973
844	\N	\N	BHB	Bar Harbor	44.4488899999999987	-68.3616640000000046
845	\N	\N	BHC	Bhurban Heliport	33.9249999999999972	73.4333340000000021
846	\N	\N	BHE	Woodbourne Air Station	-41.5135879999999986	173.867649999999998
847	\N	\N	BHF	Bahia Cupica	6.71666700000000017	-77.5166700000000048
848	\N	\N	BHG	Brus Laguna	15.7347219999999997	-84.543334999999999
849	\N	\N	BHI	Comandante Espora	-38.730556	-62.1505549999999971
850	\N	\N	BHJ	Rudra Mata	23.2875000000000014	69.6705549999999931
851	\N	\N	BHK	Bukhara	39.7603700000000018	64.4747899999999987
852	\N	\N	BHL	Bahia Angeles	28.9499999999999993	-113.549999999999997
853	\N	\N	BHM	Birmingham	33.5608330000000024	-86.7521899999999988
854	\N	\N	BHN	Beihan	14.7833330000000007	45.7333339999999993
855	\N	\N	BHP	Bhojpur	27.1833320000000001	87.0499999999999972
856	\N	\N	BHQ	Broken Hill	-31.9989829999999991	141.46857
857	\N	\N	BHR	Bharatpur Airport	27.6763900000000014	84.4325000000000045
858	\N	\N	BHT	Brighton Downs	-23.3666669999999996	141.566669999999988
859	\N	\N	BHU	Bhavnagar	21.754999999999999	72.1844399999999951
860	\N	\N	BHV	Bahawalpur	29.3999999999999986	71.6833340000000021
861	\N	\N	BHW	Bhagatanwala Airport	32.1666680000000014	72.6666639999999973
862	\N	\N	BIB	Baidoa	3.06666699999999981	43.6333300000000008
863	\N	\N	BIC	Big Creek	58.2999999999999972	-157.516660000000002
864	\N	\N	BID	Block Island	41.1694340000000025	-71.5796100000000024
865	\N	\N	BIE	Beatrice	40.2999999999999972	-96.75
866	\N	\N	BIF	Biggs AAF	31.75	-106.483329999999995
867	\N	\N	BIG	Intermediate Field	64.0677799999999991	-145.732769999999988
868	\N	\N	BIH	Bishop	37.3733330000000024	-118.364999999999995
869	\N	\N	BII	Enyu Airfield	11.5250810000000001	165.565120000000007
870	\N	\N	BIJ	Biliau	-5.58333299999999966	146.199999999999989
871	\N	\N	BIK	Frans Kaisepo	-1.19191899999999995	136.105819999999994
872	\N	\N	BIL	Billings	45.8034170000000032	-108.537229999999994
873	\N	\N	BIM	International	25.6999999999999993	-79.2833300000000065
874	\N	\N	BIN	Bamiyan	34.8041699999999992	67.8236100000000022
875	\N	\N	BIP	Bulimba	-16.1499999999999986	143.75
876	\N	\N	BIQ	Biarritz Parme	43.4724160000000026	-1.53124199999999999
877	\N	\N	BIR	Biratnagar	26.4347230000000017	87.2833300000000065
878	\N	\N	BIS	Bismarck	46.7744799999999969	-100.758210000000005
879	\N	\N	BIT	Baitadi	29	80.5
880	\N	\N	BIV	Bria	6.53333299999999983	21.9833339999999993
881	\N	\N	BIW	Billiluna	-19.5666679999999999	127.166663999999997
882	\N	\N	BIX	Keesler AFB	30.3999999999999986	-88.8833300000000008
883	\N	\N	BIY	Bisho	-35.8833300000000008	27.2833329999999989
884	\N	\N	BIZ	Bimin	-5.28333299999999983	142.016660000000002
885	\N	\N	BJB	Bojnord	37.4897199999999984	57.3088499999999996
886	\N	\N	BJC	Jeffco	39.9333340000000021	-105.066665999999998
887	\N	\N	BJD	Bakkafjordur	66.0666659999999979	-14.75
888	\N	\N	BJF	Batsfjord	70.5999999999999943	29.6666680000000014
889	\N	\N	BJG	Bolaang	-0.949999999999999956	122.099999999999994
890	\N	\N	BJH	Bajhang	29.5500000000000007	81.25
891	\N	\N	BJI	Bemidji	47.5097239999999985	-94.9347199999999987
892	\N	\N	BJJ	Wayne County	40.7999999999999972	-81.9333340000000021
893	\N	\N	BJK	Benjina	-6.08333299999999966	134.25
894	\N	\N	BJL	Yundum International	13.3440600000000007	-16.6522000000000006
895	\N	\N	BJM	International	-3.38333299999999992	29.3666669999999996
896	\N	\N	BJN	Bajone	-17.1833320000000001	38.0833319999999986
897	\N	\N	BJO	Bermejo	-22.8666669999999996	-64.3333360000000027
898	\N	\N	BJP	Braganca Paulista	-22.9499999999999993	-46.5666659999999979
899	\N	\N	BJR	Bahar Dar	11.6032919999999997	37.3232399999999984
900	\N	\N	BJT	Bentota River	6.48333300000000001	79.9833299999999952
901	\N	\N	BJU	Bajura Airport	29.3666669999999996	81.3333360000000027
902	\N	\N	BJV	Milas	37.2439540000000022	27.6727810000000005
903	\N	\N	BJW	Bajawa	-8.76666699999999999	120.983329999999995
904	\N	\N	BJX	Del Bajío International	20.9856990000000003	-101.478999999999999
905	\N	\N	BJY	Batajnica	44.9352799999999988	20.2575000000000003
906	\N	\N	BJZ	Talaveral La Real	38.8916660000000007	-6.82000000000000028
907	\N	\N	BKA	Bykovo	55.4333340000000021	37.9666670000000011
908	\N	\N	BKB	Bikaner	28.0166660000000007	73.2999999999999972
909	\N	\N	BKC	Buckland	65.9788900000000069	-161.126659999999987
910	\N	\N	BKD	Stephens County	32.75	-98.9000000000000057
911	\N	\N	BKE	Baker	44.8383329999999987	-117.810000000000002
912	\N	\N	BKF	Lake Brooks SPB	58.6000000000000014	-156.233339999999998
913	\N	\N	BKH	Barking Sands PMRF	21.9666670000000011	-159.71665999999999
914	\N	\N	BKJ	Boke	10.9666669999999993	-14.2833330000000007
915	\N	\N	BKM	Bakalalan	3.96666700000000017	115.616669999999999
916	\N	\N	BKP	Barkly Downs	-20.5	138.5
917	\N	\N	BKQ	Blackall	-24.4341679999999997	145.428329999999988
918	\N	\N	BKR	Bokoro	12.4166670000000003	17.2333339999999993
919	\N	\N	BKS	Padangkemiling	-3.86615900000000012	102.343490000000003
920	\N	\N	BKT	Blackstone AAF	37.0666659999999979	-78
921	\N	\N	BKU	Betioky	-23.7322220000000002	44.3911099999999976
922	\N	\N	BKW	Beckley	37.7819440000000029	-81.1241700000000066
923	\N	\N	BKX	Brookings	44.3033330000000021	-96.8111099999999993
924	\N	\N	BKY	Kavumu	-2.29999999999999982	28.8166679999999999
925	\N	\N	BKZ	Bukoba	-1.30000000000000004	31.8000000000000007
926	\N	\N	BLB	Balboa	8.9730559999999997	-79.5575000000000045
927	\N	\N	BLC	Bamenda	5.89722200000000019	10.0316670000000006
928	\N	\N	BLE	Dala Airport	60.4297299999999993	15.5082599999999999
929	\N	\N	BLF	Princeton	37.2958339999999993	-81.2080500000000001
930	\N	\N	BLG	Belaga	2.70000000000000018	113.783330000000007
931	\N	\N	BLH	Blythe	33.6208340000000021	-114.718890000000002
932	\N	\N	BLI	Bellingham	48.795734000000003	-122.532669999999996
933	\N	\N	BLJ	Batna	35.5666659999999979	6.18333300000000019
934	\N	\N	BLK	Blackpool Airport	53.7783850000000001	-3.04198499999999994
935	\N	\N	BLL	Billund	55.7473829999999992	9.14787399999999984
936	\N	\N	BLM	Monmouth Executive Airport	40.1833340000000021	-74.0166700000000048
937	\N	\N	BLN	Benalla	-36.5499999999999972	145.983339999999998
938	\N	\N	BLO	Blonduos	65.6666639999999973	-20.3000000000000007
939	\N	\N	BLP	Bellavista	-16.5833319999999986	-69.4166639999999973
940	\N	\N	BLS	Bollon	-28.0500000000000007	147.483339999999998
941	\N	\N	BLT	Blackwater	-23.6021840000000012	148.808400000000006
942	\N	\N	BLU	Blue Canyon	39.25	-120.716669999999993
943	\N	\N	BLV	Belleville	38.6517800000000022	-89.8518300000000067
944	\N	\N	BLW	Bellows Field	21.3333319999999986	-157.699999999999989
945	\N	\N	BLX	Belluno	46.1499999999999986	12.2166669999999993
946	\N	\N	BLY	Belmullet	54.2333339999999993	-10
947	\N	\N	BLZ	Chileka	-15.6747219999999992	34.9708329999999989
948	\N	\N	BMA	Bromma	59.3556600000000003	17.9460799999999985
949	\N	\N	BMB	Bumba	2.18999999999999995	22.4733330000000002
950	\N	\N	BMC	Brigham City	41.5491680000000017	-112.062224999999998
951	\N	\N	BMD	Belo	-20.7333339999999993	44.0499999999999972
952	\N	\N	BME	Broome	-17.9526399999999988	122.234290000000001
953	\N	\N	BMF	Bakouma	5.73333300000000001	22.8000000000000007
954	\N	\N	BMG	Bloomington	39.1400000000000006	-86.6147200000000055
955	\N	\N	BMH	Bomai	-6.41666700000000034	144.583329999999989
956	\N	\N	BMI	Central Illinois Regional Airport at Bloomington-Normal	40.4840099999999978	-88.9148299999999949
957	\N	\N	BMJ	Baramita	6.75	-60
958	\N	\N	BMK	Borkum	53.6000000000000014	6.70000000000000018
959	\N	\N	BML	Berlin Municipal Airport	44.5747220000000013	-71.1763899999999978
960	\N	\N	BMM	Bitam	2.07583299999999982	11.4908330000000003
961	\N	\N	BMN	Bamerny	37.1000000000000014	43.2666660000000007
962	\N	\N	BMP	Brampton Island	-20.7833329999999989	149.233339999999998
963	\N	\N	BMQ	Bamburi	-4.5	39.8333319999999986
964	\N	\N	BMR	Baltrum	53.7166670000000011	7.40000000000000036
965	\N	\N	BMS	Brumado	-14.233333	-41.6333300000000008
966	\N	\N	BMT	Beaumont Municipalcipal	30.0833319999999986	-94.0999999999999943
967	\N	\N	BMU	Bima	-8.5	118.916663999999997
968	\N	\N	BMV	Phung-Duc	12.6666670000000003	108.049999999999997
969	\N	\N	BMW	Bordj Badji Mokhtar	21.3166679999999999	1.03333300000000006
970	\N	\N	BMX	Big Mountain	59.3619419999999991	-155.256670000000014
971	\N	\N	BMY	Belep Island	-19.75	163.666670000000011
972	\N	\N	BMZ	Bamu	-7.83333299999999966	143.233339999999998
973	\N	\N	BNA	Nashville International	36.1317400000000006	-86.6689449999999937
974	\N	\N	BNB	Boende	-0.233056000000000013	20.870000000000001
975	\N	\N	BNC	Beni	0.566667000000000032	29.4666670000000011
976	\N	\N	BND	Bandar Abbas	27.2105899999999998	56.3683850000000035
977	\N	\N	BNE	Brisbane International	-27.4030300000000011	153.109049999999996
978	\N	\N	BNF	Warm Spring Bay SPB	57	-135
979	\N	\N	BNG	Banning	33.9333340000000021	-116.866669999999999
980	\N	\N	BNH	Barnes	41.7666660000000007	-72.6833340000000021
981	\N	\N	BNI	Benin City	6.3169430000000002	5.60386299999999959
982	\N	\N	BNK	Ballina Byron Gateway	-28.837606000000001	153.556399999999996
983	\N	\N	BNL	Barnwell Regional	33.25	-81.3833300000000008
984	\N	\N	BNM	Bodinumu	-9.11666699999999963	147.616669999999999
985	\N	\N	BNO	Burns	43.5833319999999986	-118.950000000000003
986	\N	\N	BNP	Bannu	33	70.6666639999999973
987	\N	\N	BNQ	Baganga	13.25	121.049999999999997
988	\N	\N	BNR	Banfora	10.6666670000000003	-4.66666700000000034
989	\N	\N	BNS	Barinas	8.61805599999999927	-70.2211099999999959
990	\N	\N	BNT	Bundi	-5.75	145.449999999999989
991	\N	\N	BNU	Blumenau	-27	-49
992	\N	\N	BNV	Boana	-6.42499999999999982	146.816669999999988
993	\N	\N	BNW	Boone	42.0666659999999979	-93.8833300000000008
994	\N	\N	BNZ	Banz	-5.80833300000000019	144.61139
995	\N	\N	BOA	Boma	-5.86666699999999963	13.0666670000000007
996	\N	\N	BOB	Motu Mute	-16.4462070000000011	-151.754469999999998
997	\N	\N	BOC	Bocas Del Toro	9.33999999999999986	-82.2519450000000063
998	\N	\N	BOD	Mérignac	44.8310200000000023	-0.702169999999999961
999	\N	\N	BOE	Boundji	-1.03333300000000006	15.3833330000000004
1000	\N	\N	BOF	Bolling AFB	38.8999999999999986	-77.0333300000000065
1001	\N	\N	BOG	El Nuevo Dorado International	4.69860200000000017	-74.1431350000000009
1002	\N	\N	BOK	Brookings State	42.0499999999999972	-124.283330000000007
1003	\N	\N	BOL	Ballykelly	55	-7
1004	\N	\N	BON	Flamingo International	12.1334029999999995	-68.2768700000000024
1005	\N	\N	BOP	Bouar	6	15.6666670000000003
1006	\N	\N	BOQ	Boku	-6.53333299999999983	155.349999999999994
1007	\N	\N	BOT	Boset	-7.23333300000000001	141.083329999999989
1008	\N	\N	BOU	Bourges	47.1499999999999986	2.4166669999999999
1009	\N	\N	BOV	Boang	-3.36666700000000008	153.333329999999989
1010	\N	\N	BOW	Bartow	27.8999999999999986	-81.8333360000000027
1011	\N	\N	BOX	Borroloola	-16.0666679999999999	136.28334000000001
1012	\N	\N	BOZ	Bozoum	6.41666700000000034	16.5833319999999986
1013	\N	\N	BPA	Grumman	40.7333339999999993	-73.4833299999999952
1014	\N	\N	BPB	Boridi	-9.13333300000000037	147.53334000000001
1015	\N	\N	BPC	Bamenda	5.91666700000000034	10.1500000000000004
1016	\N	\N	BPD	Bapi	-7.75	147.016660000000002
1017	\N	\N	BPE	Bagan	24	96
1018	\N	\N	BPF	Batuna Aerodrome	-8.55000000000000071	158.116669999999999
1019	\N	\N	BPG	Barra Do Garcas	-15.8499999999999996	-52.3833300000000008
1020	\N	\N	BPH	Bislig	8.1966669999999997	126.321110000000004
1021	\N	\N	BPI	Big Piney-marbleton	42.5333329999999989	-110.116669999999999
1022	\N	\N	BPK	Biangabip	-5.52972199999999958	141.74973
1023	\N	\N	BPN	Sepingan	-1.26062300000000005	116.900819999999996
1024	\N	\N	BPS	Porto Seguro	-16.4411580000000015	-39.0810969999999998
1025	\N	\N	BPT	Jefferson County	29.9508319999999983	-94.019999999999996
1026	\N	\N	BPU	Beppu	33.25	131.5
1027	\N	\N	BPY	Besalampy	-16.75	44.4833339999999993
1028	\N	\N	BQA	Baler	15	121.083336000000003
1029	\N	\N	BQE	Bubaque	11.3000000000000007	-15.8499999999999996
1030	\N	\N	BQH	Biggin Hill	51.3333319999999986	0.0333330000000000015
1031	\N	\N	BQI	Bagani	-18.1180549999999982	21.6297229999999985
1032	\N	\N	BQN	Borinquen	18.4958320000000001	-67.1299999999999955
1033	\N	\N	BQO	Bouna	9.26666699999999999	-3
1034	\N	\N	BQQ	Barra	-11.0833329999999997	-43.1333300000000008
1035	\N	\N	BQT	Brest	52.1166699999999992	23.8833330000000004
1036	\N	\N	BQU	J. F. Mitchell	12.9866670000000006	-61.264167999999998
1037	\N	\N	BQV	Bartlett SPB	58.4166680000000014	-135.733339999999998
1038	\N	\N	BQW	Balgo Hills	-20.1833320000000001	127.799999999999997
1039	\N	\N	BRA	Barreiras	-12.0730559999999993	-45.0083300000000008
1040	\N	\N	BRB	Barreirinhas	-2.91062600000000016	-57.1111099999999965
1041	\N	\N	BRE	Bremen	53.052970000000002	8.78535199999999961
1042	\N	\N	BRF	Bradford	53.7999999999999972	-1.75
1043	\N	\N	BRG	Municipal	37.1166699999999992	-82.8333360000000027
1044	\N	\N	BRH	Brahman	-5.70000000000000018	145.366669999999999
1045	\N	\N	BRJ	Bright	-36.7000000000000028	146.933330000000012
1046	\N	\N	BRK	Bourke	-30.0833319999999986	145.933330000000012
1047	\N	\N	BRL	Burlington	40.7861100000000008	-91.1233399999999989
1048	\N	\N	BRM	Barquisimeto	10.0462670000000003	-69.3598400000000055
1049	\N	\N	BRP	Biaru	-7.53333299999999983	146.699999999999989
1050	\N	\N	BRQ	Turany	49.1499999999999986	16.6999999999999993
1051	\N	\N	BRR	North Bay	57.023335000000003	-7.44027800000000017
1052	\N	\N	BRS	Bristol	51.3867570000000029	-2.71065900000000015
1053	\N	\N	BRT	Bathurst Island	-11.766667	130.633330000000001
1054	\N	\N	BRU	Brussels Airport	50.8971700000000027	4.48360200000000031
1055	\N	\N	BRV	Bremerhaven	53.75	8.91666700000000034
1056	\N	\N	BRW	Wiley Post/W.Rogers M	71.288573999999997	-156.775790000000001
1057	\N	\N	BRX	Barahona	18.2166670000000011	-71.1166699999999992
1058	\N	\N	BRY	Samuels Field	37.8166659999999979	-85.4666699999999935
1059	\N	\N	BRZ	Borotou	8.76666699999999999	-7.5
1060	\N	\N	BSD	Baoshan	25.0551819999999985	99.1614299999999957
1061	\N	\N	BSE	Sematan	1.80000000000000004	109.766670000000005
1062	\N	\N	BSF	Bradshaw AAF	21.3833330000000004	-157.75
1063	\N	\N	BSG	Bata	1.90666699999999989	9.80222200000000043
1064	\N	\N	BSH	Brighton	50.8166659999999979	-0.116667000000000007
1065	\N	\N	BSI	Blairsville	40.4500000000000028	-79.2833300000000065
1066	\N	\N	BSJ	Bairnsdale	-37.8333319999999986	147.633330000000001
1067	\N	\N	BSK	Mohamed Boudiaf	34.7933299999999974	5.73805600000000027
1068	\N	\N	BSM	Bishe-kola	36.6499999999999986	52.3500000000000014
1069	\N	\N	BSN	Bossangoa	6.58333299999999966	17.5
1070	\N	\N	BSP	Bensbach	-8.33333299999999966	141.083329999999989
1071	\N	\N	BSQ	Bisbee Municipal Airport	31.3638900000000014	-109.881110000000007
1072	\N	\N	BSR	International	30.5555549999999982	47.7913899999999998
1073	\N	\N	BSS	Balsas	-7.51666699999999999	-46.0499999999999972
1074	\N	\N	BST	Bost	31.5500000000000007	64.3666699999999992
1075	\N	\N	BSU	Basankusu	1.22166700000000006	19.7888890000000011
1076	\N	\N	BSV	Besakoa	-15.6666670000000003	47.0666659999999979
1077	\N	\N	BSW	Boswell Bay	60.3999999999999986	-146.133330000000001
1078	\N	\N	BSX	Bassein	16.8000000000000007	94.7833300000000065
1079	\N	\N	BSY	Bardera	2.35000000000000009	42.3333319999999986
1080	\N	\N	BSZ	Bartletts	58.2336120000000008	-157.350279999999998
1081	\N	\N	BTA	Yaoundé	4.54083300000000012	13.7274999999999991
1082	\N	\N	BTB	Betou	3.04999999999999982	18.5
1083	\N	\N	BTC	Batticaloa	7.70333299999999976	81.6786100000000062
1084	\N	\N	BTD	Brunette Downs	-18.6666680000000014	135.916670000000011
1085	\N	\N	BTE	Bonthe	7	-12.0083330000000004
1086	\N	\N	BTF	Salt Lake Skypark	40.8833300000000008	-111.883330000000001
1087	\N	\N	BTG	Batangafo	7.41666700000000034	18.3333319999999986
1088	\N	\N	BTH	Hang Nadim	1.12362699999999993	104.115279999999998
1089	\N	\N	BTL	WK Kellogg Regional	42.3727799999999988	-85.2648099999999971
1090	\N	\N	BTM	Bert Mooney Airport	45.9511099999999999	-112.493889999999993
1091	\N	\N	BTN	Bennettsville	34.6166699999999992	-79.6833340000000021
1092	\N	\N	BTO	Botopasie	4.25	-55.4500000000000028
1093	\N	\N	BTP	Butler County - Kenny Scholter Field	40.8500000000000014	-79.9166639999999973
1094	\N	\N	BTQ	Butare	-2.60000000000000009	29.7333339999999993
1095	\N	\N	BTS	M. R. Štefánika	48.1700170000000014	17.1997989999999987
1096	\N	\N	BTW	Batu Licin	-3	116
1097	\N	\N	BTX	Betoota	-25.6999999999999993	140.733339999999998
1098	\N	\N	BTY	Beatty	36.8999999999999986	-116.766670000000005
1099	\N	\N	BUB	Municipal	41.7833329999999989	-99.1333300000000008
1100	\N	\N	BUC	Burketown	-17.75	139.53334000000001
1101	\N	\N	BUD	Liszt Ferenc International	47.4330369999999988	19.2616210000000017
1102	\N	\N	BUG	Gen V Deslandes	-12.6063890000000001	13.4055560000000007
1103	\N	\N	BUI	Bokondini	-2	133.583329999999989
1104	\N	\N	BUJ	Ain Eddis	35.1666680000000014	4.15000000000000036
1105	\N	\N	BUK	Albuq	15.8333329999999997	43.7666660000000007
1106	\N	\N	BUL	Bulolo	-7.18972199999999972	146.647780000000012
1107	\N	\N	BUM	Butler	38.2666660000000007	-94.3333360000000027
1108	\N	\N	BUO	Burao	9.52250000000000085	45.5541699999999992
1109	\N	\N	BUP	Bhatinda	30.1666680000000014	74.9666699999999935
1110	\N	\N	BUQ	Bulawayo	-20.0149329999999992	28.6226160000000007
1111	\N	\N	BUV	Bella Union	-30.3333319999999986	-57.0833319999999986
1112	\N	\N	BUW	Baubau	-5.46666700000000017	122.633330000000001
1113	\N	\N	BUX	Bunia	1.57166699999999993	30.2127780000000001
1114	\N	\N	BUY	Bunbury	-33.3166659999999979	115.633330000000001
1115	\N	\N	BVA	Beauvais-Tille	49.4594880000000003	2.11081500000000011
1116	\N	\N	BVB	Boa Vista	2.8333330000000001	-60.6666680000000014
1117	\N	\N	BVD	Sea Port	53.7333339999999993	-166.316669999999988
1118	\N	\N	BVE	Laroche	45.1666680000000014	1.53333300000000006
1119	\N	\N	BVF	Dama	-17	178.5
1120	\N	\N	BVG	Berlevag	70.8666699999999992	29
1121	\N	\N	BVI	Birdsville	-25.8983330000000009	139.343340000000012
1122	\N	\N	BVK	Huacaraje	-13.5500000000000007	-63.75
1123	\N	\N	BVL	Baures	-13.5833329999999997	-63.5833319999999986
1124	\N	\N	BVM	Belmonte	-15.8333329999999997	-38.9166680000000014
1125	\N	\N	BVO	Bartlesville	36.7625000000000028	-96.0108299999999986
1126	\N	\N	BVP	Bolovip	-5.38333300000000037	141.699999999999989
1127	\N	\N	BVR	Esperadinha	14.8666669999999996	-24.7333339999999993
1128	\N	\N	BVS	Breves	-1.6666669999999999	-50.4666670000000011
1129	\N	\N	BVU	Beluga	61.1694450000000032	-151.036120000000011
1130	\N	\N	BVW	Batavia Downs	-12.6500000000000004	143.21665999999999
1131	\N	\N	BVX	Municipal	35.7666660000000007	-91.6500000000000057
1132	\N	\N	BVY	Beverly Municipal Airport	42.5499999999999972	-70.8833300000000008
1133	\N	\N	BVZ	Beverley Springs	-15	124
1134	\N	\N	BWA	Bhairawa	27.5041679999999999	83.4200000000000017
1135	\N	\N	BWB	Barrow Island	-20.7833329999999989	115.416663999999997
1136	\N	\N	BWC	Brawley	32.9833339999999993	-115.516670000000005
1137	\N	\N	BWD	Brownwood	31.7947220000000002	-98.956665000000001
1138	\N	\N	BWE	Braunschweig	52.2666660000000007	10.5333330000000007
1139	\N	\N	BWF	Walney Island	54.1166699999999992	-3.23333300000000001
1140	\N	\N	BWG	Warren County	36.9622230000000016	-86.4222199999999958
1141	\N	\N	BWH	Butterworth	5.46666700000000017	100.392499999999998
1142	\N	\N	BWI	Baltimore/Washington International Thurgood Marshall	39.1795270000000002	-76.6689400000000063
1143	\N	\N	BWJ	Bawan	-6.40000000000000036	146.900000000000006
1144	\N	\N	BWK	Brac	43.2833329999999989	16.6833320000000001
1145	\N	\N	BWL	Blackwell	36.7999999999999972	-97.2833300000000065
1146	\N	\N	BWM	Bowman	46.1833340000000021	-103.400000000000006
1147	\N	\N	BWO	Balakovo	51.8666699999999992	47.75
1148	\N	\N	BWP	Bewani	-3.01666699999999999	141.150000000000006
1149	\N	\N	BWQ	Brewarrina	-29.9499999999999993	146.866669999999999
1150	\N	\N	BWS	Blaine	48.9666670000000011	-122.833336000000003
1151	\N	\N	BWT	Burnie Wynyard	-40.9931449999999984	145.725069999999988
1152	\N	\N	BWU	Sydney Bankstown	-33.9166680000000014	151.03334000000001
1153	\N	\N	BXA	George R Carr	30.9333320000000001	-89.8833300000000008
1154	\N	\N	BXC	Boxborough	42.4833339999999993	-71.5333300000000065
1155	\N	\N	BXD	Bade	-7.16666700000000034	139.5
1156	\N	\N	BXE	Bakel	14.8416669999999993	-12.4677779999999991
1157	\N	\N	BXF	Belburn	-17.5455550000000002	128.307790000000011
1158	\N	\N	BXG	Bendigo	-36.7347219999999979	144.301940000000002
1159	\N	\N	BXH	Balhash	46.8833300000000008	75.0166700000000048
1160	\N	\N	BXI	Boundiali	8.75	-6.5
1161	\N	\N	BXJ	Burundai	43.5	76.9500000000000028
1162	\N	\N	BXK	Buckeye Municipal	33.3666699999999992	-112.583336000000003
1163	\N	\N	BXL	Blue Lagoon	-16.75	179
1164	\N	\N	BXM	Batom	-4.11666699999999963	140.849999999999994
1165	\N	\N	BXN	Imsik	37.1347239999999985	27.6672210000000014
1166	\N	\N	BXO	Buochs	46.9666670000000011	8.38333300000000037
1167	\N	\N	BXR	Bam	29.0800820000000009	58.4493560000000016
1168	\N	\N	BXS	Borrego Springs	33.3433339999999987	-116.327780000000004
1169	\N	\N	BXT	Bontang	0.16666700000000001	117.5
1170	\N	\N	BXV	Breiddalsvik	64.7666700000000048	-14
1171	\N	\N	BXX	Borama International	9.96666699999999928	43.1166699999999992
1172	\N	\N	BXZ	Bunsil	-5.71666700000000017	147.866669999999999
1173	\N	\N	BYA	Boundary	64.0763850000000019	-141.114440000000002
1174	\N	\N	BYB	Dibaa	25.5833319999999986	56.25
1175	\N	\N	BYC	Yacuiba	-21.9499999999999993	-63.6499999999999986
1176	\N	\N	BYD	Beidah	14.1333330000000004	46.5499999999999972
1177	\N	\N	BYG	Municipal	44.3500000000000014	-106.700000000000003
1178	\N	\N	BYH	Blytheville AFB	35.9333340000000021	-89.9166639999999973
1179	\N	\N	BYI	Rupert	42.5413899999999998	-113.774169999999998
1180	\N	\N	BYK	Bouake	7.73944399999999977	-5.0691670000000002
1181	\N	\N	BYL	Bella Yella	7.36666699999999963	-10
1182	\N	\N	BYM	C.M. de Cespedes	20.3833330000000004	-76.6500000000000057
1183	\N	\N	BYQ	Bunyu	3.5833330000000001	117.833336000000003
1184	\N	\N	BYR	Laeso Airport	57.2775600000000011	11.0050830000000008
1185	\N	\N	BYS	Bicycle Lake AAF	35.2666660000000007	-116.566665999999998
1186	\N	\N	BYT	Bantry	51.6833340000000021	-9.44999999999999929
1187	\N	\N	BYU	Bindlacher-Berg	49.9855579999999975	11.6400000000000006
1188	\N	\N	BYW	Blakely Island	48.5	-123
1189	\N	\N	BYX	Baniyala	-13.1999999999999993	136.233339999999998
1190	\N	\N	BZA	San Pedro	13.9499999999999993	-84.5999999999999943
1191	\N	\N	BZB	Bazaruto Island	-21.5347210000000011	35.4916699999999992
1192	\N	\N	BZC	Buzios	-22.769444	-41.9644430000000028
1193	\N	\N	BZD	Balranald	-34.6166699999999992	143.616669999999999
1194	\N	\N	BZG	Bydgoszcz I. J. Paderewski Airport	53.0966700000000031	17.9786110000000008
1195	\N	\N	BZH	Bumi Hills	-16.8166679999999999	28.3500000000000014
1196	\N	\N	BZI	Balikesir	39.6172200000000032	27.927778
1197	\N	\N	BZK	Briansk	53.2666660000000007	34.3333319999999986
1198	\N	\N	BZL	Barisal	22.8000000000000007	90.2999999999999972
1199	\N	\N	BZM	Woensdrecht	51.4666670000000011	4.29999999999999982
1200	\N	\N	BZN	Gallatin Field	45.7776870000000002	-111.160330000000002
1201	\N	\N	BZO	Bolzano	46.4624439999999979	11.3305109999999996
1202	\N	\N	BZP	Bizant	-15.2166669999999993	144.633330000000001
1203	\N	\N	BZR	Beziers Vias	43.3241650000000007	3.35444399999999998
1204	\N	\N	BZS	Buzzards Pt S	38.8633349999999993	-77.0133359999999954
1205	\N	\N	BZT	Hinkles Ferry	29.0500000000000007	-95.5666659999999979
1206	\N	\N	BZU	Buta	2.79999999999999982	24.7333339999999993
1207	\N	\N	BZV	Maya Maya	-4.25889900000000043	15.2511390000000002
1208	\N	\N	BZY	Beltsy	47.75	27.9333320000000001
1209	\N	\N	BZZ	Raf Brize Norton	51.75	-1.58709300000000009
1210	\N	\N	CAA	Catacamas	14.8305559999999996	-85.8944500000000062
1211	\N	\N	CAB	Cabinda	-5.58333299999999966	12.1999999999999993
1212	\N	\N	CAC	Cascavel	-24.9499999999999993	-53.4666670000000011
1213	\N	\N	CAD	Cadillac	44.2758329999999987	-85.4222199999999958
1214	\N	\N	CAF	Carauari	-4.90000000000000036	-66.9166639999999973
1215	\N	\N	CAJ	Canaima	6.25	-62.8333319999999986
1216	\N	\N	CAL	Machrihanish	55.4363900000000029	-5.68666699999999992
1217	\N	\N	CAM	Camiri	-20.0111099999999986	-63.5611099999999993
1218	\N	\N	CAN	Guangzhou Baiyun International	23.3878610000000009	113.297340000000005
1219	\N	\N	CAO	Clayton	36.4500000000000028	-103.183334000000002
1220	\N	\N	CAP	Cap Haitien	19.7327790000000007	-72.1949999999999932
1221	\N	\N	CAR	Municipal	46.8666699999999992	-68.0166700000000048
1222	\N	\N	CAT	New Bight	24.3150000000000013	-75.4536099999999976
1223	\N	\N	CAU	Caruaru	-8.25	-35.9166680000000014
1224	\N	\N	CAV	Cazombo	-11.9000000000000004	22.8666669999999996
1225	\N	\N	CAW	Bartolomeu Lisandro	-21.75	-41.2999999999999972
1226	\N	\N	CAX	Carlisle	54.9366699999999994	-2.80944400000000005
1227	\N	\N	CBA	Corner Bay	57.7166670000000011	-135.199999999999989
1228	\N	\N	CBB	J Wilsterman	-17.4139540000000004	-66.1788939999999997
1229	\N	\N	CBC	Cherrabun	-18.9166680000000014	125.549999999999997
1230	\N	\N	CBD	Car Nicobar	9.15000000000000036	92.8166659999999979
1231	\N	\N	CBE	Greater Cumberland Regional	39.6144450000000035	-78.7661099999999976
1232	\N	\N	CBF	Municipal	41.2666660000000007	-95.8666699999999992
1233	\N	\N	CBG	Cambridge	52.2000000000000028	0.183332999999999996
1234	\N	\N	CBI	Cape Barren Island	-40.3333319999999986	148.166670000000011
1235	\N	\N	CBJ	Cabo Rojo	17.9333320000000001	-71.6500000000000057
1236	\N	\N	CBK	Municipal	39.3999999999999986	-101.049999999999997
1237	\N	\N	CBL	Ciudad Bolivar	8.12805600000000084	-63.5375000000000014
1238	\N	\N	CBM	Columbus AFB	33.5	-88.4166639999999973
1239	\N	\N	CBN	Penggung	-6.75	108.533330000000007
1240	\N	\N	CBP	Coimbra	40.2000000000000028	-8.41666700000000034
1241	\N	\N	CBQ	Calabar	4.96889000000000003	8.34741499999999981
1242	\N	\N	CBR	Canberra	-35.3073499999999996	149.190519999999992
1243	\N	\N	CBS	Oro Negro	10.3833330000000004	-71.4166639999999973
1244	\N	\N	CBU	Cottbus	51.7702799999999996	14.2991670000000006
1245	\N	\N	CBV	Coban	15.4716670000000001	-90.4091640000000041
1246	\N	\N	CBW	Campo Mourao	-24.0019440000000017	-52.3563880000000026
1247	\N	\N	CBX	Condobolin	-33.8666699999999992	148.25
1248	\N	\N	CBY	Canobie	-19.4786110000000008	140.926119999999997
1249	\N	\N	CBZ	Cabin Creek	55.3833300000000008	-132.416670000000011
1250	\N	\N	CCA	Chaffee AFB	35.3166659999999979	-94.2999999999999972
1251	\N	\N	CCB	Cable Airport	34.1138880000000029	-117.688890000000001
1252	\N	\N	CCC	Cayo Coco	22.5124999999999993	-78.5083300000000008
1253	\N	\N	CCD	Century City	34.0666659999999979	-118.266670000000005
1254	\N	\N	CCE	Grand Case	18.0500000000000007	-63.1166699999999992
1255	\N	\N	CCG	Crane County Airport	31.3999999999999986	-102.349999999999994
1256	\N	\N	CCH	Chile Chico	-46.5499999999999972	-71.7000000000000028
1257	\N	\N	CCI	Concordia	-27.1813889999999994	-52.0505560000000003
1258	\N	\N	CCJ	Kozhikode Airport	11.14025	75.9505840000000063
1259	\N	\N	CCL	Chinchilla	-26.75	150.633330000000001
1260	\N	\N	CCM	Criciuma	-28.6999999999999993	-49.3666699999999992
1261	\N	\N	CCN	Chakcharan	34.5333329999999989	65.2666700000000048
1262	\N	\N	CCO	Carimagua	4.56666699999999981	-71.3333360000000027
1263	\N	\N	CCP	Carriel Sur	-36.7771219999999985	-73.0594399999999951
1264	\N	\N	CCQ	Cachoeira	-12.5999999999999996	-38.9666670000000011
1265	\N	\N	CCR	Buchanan Field	37.9888880000000029	-122.05556
1266	\N	\N	CCT	Colonia Catriel	-39.5	-68.9166639999999973
1267	\N	\N	CCV	Craig Cove	-16.1999999999999993	167.5
1268	\N	\N	CCW	Cowell	-33.6333300000000008	136.833329999999989
1269	\N	\N	CCX	Caceres	-16.0666679999999999	-57.7000000000000028
1270	\N	\N	CCY	Municipal	43.0666659999999979	-92.6833340000000021
1271	\N	\N	CCZ	Chub Cay	25.4175000000000004	-77.8813860000000062
1272	\N	\N	CDA	Cooinda	-12.9052779999999991	132.522500000000008
1273	\N	\N	CDB	Cold Bay	55.2045699999999968	-162.717739999999992
1274	\N	\N	CDC	Cedar City	37.7025000000000006	-113.096109999999996
1275	\N	\N	CDD	Cauquira	15.322222	-83.6027760000000058
1276	\N	\N	CDE	Caledonia	8.33333299999999966	-77.5499999999999972
1277	\N	\N	CDG	Charles De Gaulle	49.0031970000000001	2.56702299999999983
1278	\N	\N	CDH	Harrell Field	33.5833319999999986	-92.8333360000000027
1279	\N	\N	CDI	Cachoeiro Itapemirim	-20.8361109999999989	-41.1869429999999994
1280	\N	\N	CDK	Lewis	29.1333330000000004	-83.0333300000000065
1281	\N	\N	CDL	Candle	65.9080600000000061	-161.938340000000011
1282	\N	\N	CDN	Woodward Field	34.2666660000000007	-80.5999999999999943
1283	\N	\N	CDO	Cradock	-32.1333300000000008	25.6000000000000014
1284	\N	\N	CDP	Cuddapah	14.516667	78.7833300000000065
1285	\N	\N	CDQ	Croydon	-18.3000000000000007	142.25
1286	\N	\N	CDS	Childress	37.4166680000000014	-100.216669999999993
1287	\N	\N	CDU	Camden	-15.4499999999999993	124.416663999999997
1288	\N	\N	CDV	Mudhole Smith	60.4930570000000003	-145.469999999999999
1289	\N	\N	CDW	Caldwell Wright	40.8333319999999986	-74.2666700000000048
1290	\N	\N	CDY	Cagayan De Sulu	7.01361100000000004	118.495000000000005
1291	\N	\N	CDZ	Cadiz	36.5333329999999989	-6.29999999999999982
1292	\N	\N	CEA	Cessna Aircraft Field	37.7000000000000028	-97.3333360000000027
1293	\N	\N	CEC	Mc Namara Field	41.7800000000000011	-124.235830000000007
1294	\N	\N	CEE	Cherepovets	59.2833329999999989	38.0666659999999979
1295	\N	\N	CEF	Westover ARB/Metropolitan	42.1833760000000026	-72.5538300000000049
1296	\N	\N	CEG	Chester	53.1666680000000014	-2.9166669999999999
1297	\N	\N	CEH	Chelinda	-10.5500000000000007	33.7999999999999972
1298	\N	\N	CEL	Cape Eleuthera	25.2838899999999995	-76.330830000000006
1299	\N	\N	CEM	Central	65.5747199999999992	-144.781939999999992
1300	\N	\N	CEO	Waco Kungo	9.3083329999999993	124.730549999999994
1301	\N	\N	CEP	Concepcion	-16.2333339999999993	-62.0833319999999986
1302	\N	\N	CEQ	Mandelieu	43.5463900000000024	6.95416699999999999
1303	\N	\N	CER	Maupertus	49.6511100000000027	-1.46527800000000008
1304	\N	\N	CES	Cessnock	-32.8333319999999986	151.349999999999994
1305	\N	\N	CET	Le Pontreau	47.0666659999999979	-0.866666999999999965
1306	\N	\N	CEU	Oconee County	34.6833340000000021	-82.8333360000000027
1307	\N	\N	CEV	Mettle Field	39.6499999999999986	-85.1333300000000008
1308	\N	\N	CEW	Bob Sikes	30.7666660000000007	-86.5666659999999979
1309	\N	\N	CEX	Chena Hot Springs	65.0499999999999972	-146.166670000000011
1310	\N	\N	CEY	Calloway County	36.6166699999999992	-88.3166659999999979
1311	\N	\N	CEZ	Montezuma County	37.3027760000000015	-108.627219999999994
1312	\N	\N	CFA	Coffee Point	58.2166670000000011	-157.5
1313	\N	\N	CFB	Cabo Frio	-22.9250000000000007	-42.0786099999999976
1314	\N	\N	CFD	Coulter Field	30.6666680000000014	-96.3666699999999992
1315	\N	\N	CFF	Cafunfo	-8.76666699999999999	18
1316	\N	\N	CFH	Clifton Hills	-27	139
1317	\N	\N	CFI	Camfield	-17.0333329999999989	131.28334000000001
1318	\N	\N	CFK	Aboubakr Belkaid	36.2122230000000016	1.33166699999999993
1319	\N	\N	CFN	Donegal	55.0416680000000014	-8.34027799999999964
1320	\N	\N	CFO	Confreza	-10.6333330000000004	-51.5666659999999979
1321	\N	\N	CFP	Carpentaria Downs	-18.7833329999999989	144.349999999999994
1322	\N	\N	CFQ	Creston Valley Airport	49.0369450000000029	-116.498339999999999
1323	\N	\N	CFR	Carpiquet	49.1834369999999979	-0.459276000000000018
1324	\N	\N	CFT	Morenci	33.0499999999999972	-109.299999999999997
1325	\N	\N	CFU	Ioannis Kapodistrias	39.607840000000003	19.9146439999999991
1326	\N	\N	CFV	Municipal	37.0333329999999989	-95.6166699999999992
1327	\N	\N	CGA	Craig SPB	55.4783820000000034	-133.146160000000009
1328	\N	\N	CGB	International Airport Marechal Rondon	-15.6517250000000008	-56.1202660000000009
1329	\N	\N	CGC	Cape Gloucester	-5.45916699999999988	148.515839999999997
1330	\N	\N	CGD	Changde	28.9244669999999999	111.638859999999994
1331	\N	\N	CGE	Cambridge	38.5666659999999979	-76.0833360000000027
1332	\N	\N	CGF	Cuyahoga County	41.552500000000002	-81.4838900000000024
1333	\N	\N	CGG	Casiguran	16.0833319999999986	122.016670000000005
1334	\N	\N	CGI	Cape Girardeau	37.2236100000000008	-89.5716699999999975
1335	\N	\N	CGJ	Chingola	-12.516667	27.8833330000000004
1336	\N	\N	CGN	Cologne/bonn	50.8783650000000023	7.12222400000000011
1337	\N	\N	CGO	Zhengzhou	34.5275200000000027	113.840239999999994
1338	\N	\N	CGP	Patenga	22.2452010000000016	91.8151600000000059
1339	\N	\N	CGQ	Changchun	43.9028360000000006	125.217545000000001
1340	\N	\N	CGS	College Park	33.6666680000000014	-84.4500000000000028
1341	\N	\N	CGT	Chinguitti	20.4499999999999993	-12.3666669999999996
1342	\N	\N	CGU	Ciudad Guayana	8.30499999999999972	-62.7344440000000034
1343	\N	\N	CGV	Caiguna	-32.2666660000000007	125.466669999999993
1344	\N	\N	CGX	Merrill C Meigs	41.8588900000000024	-87.6083299999999952
1345	\N	\N	CGZ	Municipal	32.8833300000000008	-111.75
1346	\N	\N	CHA	Lovell Field	35.0369260000000011	-85.1977839999999986
1347	\N	\N	CHB	Chilas	35.4166680000000014	74.0833360000000027
1348	\N	\N	CHE	Reenroe	51.9333340000000021	-10.233333
1349	\N	\N	CHF	Jinhae	35.1375000000000028	128.697779999999995
1350	\N	\N	CHG	Chaoyang Airport	41.5450820000000007	120.437200000000004
1351	\N	\N	CHH	Chachapoyas	-6.21666700000000017	-77.8499999999999943
1352	\N	\N	CHJ	Chipinge	-20.1999999999999993	32.6499999999999986
1353	\N	\N	CHK	Municipal	35.0499999999999972	-97.9666699999999935
1354	\N	\N	CHL	Challis	44.5	-114.25
1355	\N	\N	CHM	Chimbote	-9.15055599999999991	-78.5311099999999982
1356	\N	\N	CHN	Jeonju	37.0169449999999998	127.933334000000002
1357	\N	\N	CHO	Albemarle	38.1394159999999971	-78.4492800000000017
1358	\N	\N	CHP	Circle Hot Springs	65.4666699999999935	-144.583329999999989
1359	\N	\N	CHR	Chateauroux	46.8166659999999979	1.69999999999999996
1360	\N	\N	CHU	Chuathbaluk	61.5834350000000015	-159.238820000000004
1361	\N	\N	CHV	Chaves	41.7333339999999993	-7.46666700000000017
1362	\N	\N	CHW	Jiuhuang	39.8500000000000014	98.4166639999999973
1363	\N	\N	CHX	Changuinola	9.44999999999999929	-82.4500000000000028
1364	\N	\N	CHY	Choiseul Bay	-6.71378699999999995	156.398560000000003
1365	\N	\N	CHZ	State	42.5833319999999986	-121.866669999999999
1366	\N	\N	CIB	Ap In The Sky	33.4061129999999977	-118.413889999999995
1367	\N	\N	CID	Eastern Iowa Airport	41.8894230000000007	-91.7002999999999986
1368	\N	\N	CIE	Collie	-33.3666699999999992	116.133330000000001
1369	\N	\N	CIG	Craig-Moffat	40.4955560000000006	-107.525000000000006
1370	\N	\N	CIH	Changzhi	36.2458799999999997	113.121579999999994
1371	\N	\N	CIK	Chalkyitsik	66.6480559999999969	-143.729170000000011
1372	\N	\N	CIL	Melsing Creek	64.9083300000000065	-163.733339999999998
1373	\N	\N	CIM	Cimitarra	6.48333300000000001	-74.1166699999999992
1374	\N	\N	CIN	Carroll	42.0666659999999979	-94.8666699999999992
1375	\N	\N	CIO	MCAL Lopez	-23.4344439999999992	-57.4183299999999974
1376	\N	\N	CIP	Chipata	-13.5569439999999997	32.5872230000000016
1377	\N	\N	CIQ	Chiquimula	14.8499999999999996	-89.6166699999999992
1378	\N	\N	CIR	Cairo	37	-89.1833340000000021
1379	\N	\N	CIS	Canton Island	-2.8333330000000001	-171.666670000000011
1380	\N	\N	CIT	Shimkent	42.2999999999999972	69.5999999999999943
1381	\N	\N	CIV	Chomley	55.2166670000000011	-132.21665999999999
1382	\N	\N	CIW	Canouan Island	12.6999999999999993	-61.3166659999999979
1383	\N	\N	CIX	Cornel Ruiz	-6.78972200000000026	-79.8322200000000066
1384	\N	\N	CIY	Comiso	36.9916699999999992	14.6069440000000004
1385	\N	\N	CJA	Cajamarca	-7.13333300000000037	-78.5
1386	\N	\N	CJB	Peelamedu	11.0310260000000007	77.0389299999999935
1387	\N	\N	CJD	Candilejas	1.3333330000000001	-74.2666700000000048
1388	\N	\N	CJH	Chilko Lake	51.3333319999999986	-124.083336000000003
1389	\N	\N	CJJ	Cheongju	36.7224000000000004	127.495090000000005
1390	\N	\N	CJL	Chitral	35.8861119999999971	71.7944399999999945
1391	\N	\N	CJM	Chumphon Airport	10.7097219999999993	99.3638899999999978
1392	\N	\N	CJN	Gillespie Field	32.7999999999999972	-116.966669999999993
1393	\N	\N	CJT	Copalar	16.1666680000000014	-92.0499999999999972
1394	\N	\N	CJU	Jeju Airport	33.5067000000000021	126.493120000000005
1395	\N	\N	CKA	Kegelman Af	36.75	-98.3499999999999943
1396	\N	\N	CKB	Benedum	39.2955550000000002	-80.2294499999999999
1397	\N	\N	CKC	Cherkassy	49.4166680000000014	32
1398	\N	\N	CKD	Crooked Creek	61.8708340000000021	-158.100830000000002
1399	\N	\N	CKE	Clear Lake	38.9347229999999982	-122.622219999999999
1400	\N	\N	CKG	Chongqing Jiangbei International	29.7203400000000002	106.634079999999997
1401	\N	\N	CKH	Chokurdah	70.6333300000000008	147.883330000000001
1402	\N	\N	CKI	Croker Island	-11.1999999999999993	132.53334000000001
1403	\N	\N	CKK	Cherokee	36.5	-91.8666699999999992
1404	\N	\N	CKL	Chkalovsky	55.8666699999999992	38.0519450000000035
1405	\N	\N	CKM	Fletcher Field	34.2000000000000028	-90.5833360000000027
1406	\N	\N	CKN	Municipal	47.7833329999999989	-96.6166699999999992
1407	\N	\N	CKO	Cornelio Procopio	-23.1166669999999996	-50.6666680000000014
1408	\N	\N	CKR	Crane Island	48.6000000000000014	-123
1409	\N	\N	CKT	Sarakhs	36.4880560000000003	61.0700000000000003
1410	\N	\N	CKU	City	60.5499999999999972	-145.75
1411	\N	\N	CKV	Outlaw Field	36.6208340000000021	-87.4144440000000031
1412	\N	\N	CKY	Conakry	9.57565499999999936	-13.6201699999999999
1413	\N	\N	CLA	Comilla	23.4375	91.1922200000000061
1414	\N	\N	CLC	Metroport	29.5569440000000014	-95.1375000000000028
1415	\N	\N	CLE	Hopkins International	41.4108540000000005	-81.8382100000000037
1416	\N	\N	CLG	Coalinga	36.1499999999999986	-120.349999999999994
1417	\N	\N	CLH	Coolah	-31.8333319999999986	149.699999999999989
1418	\N	\N	CLI	Clintonville	42.5666659999999979	-88.8666699999999992
1419	\N	\N	CLJ	Cluj Napoca International Airport	46.7820630000000008	23.6870140000000013
1420	\N	\N	CLK	Municipal	35.5380549999999999	-98.9325000000000045
1421	\N	\N	CLN	Carolina	-7.33333299999999966	-47.4500000000000028
1422	\N	\N	CLO	Alfonso B. Aragon	3.54305599999999998	-76.3813860000000062
1423	\N	\N	CLP	Clarks Point	58.8430559999999971	-158.543059999999997
1424	\N	\N	CLQ	Colima	19.3000000000000007	-103.650000000000006
1425	\N	\N	CLR	Calipatria	33.1333300000000008	-115.516670000000005
1426	\N	\N	CLS	Centralia	46.6738900000000001	-122.981110000000001
1427	\N	\N	CLT	Charlotte Douglas	35.2191660000000013	-80.9358399999999989
1428	\N	\N	CLU	Columbus Municipal	39.2166670000000011	-85.9166639999999973
1429	\N	\N	CLV	Caldas Novas	-17.75	-48.6333300000000008
1430	\N	\N	CLW	Executive	27.9766669999999991	-82.7586100000000044
1431	\N	\N	CLX	Clorinda	-25.3333319999999986	-57.6666680000000014
1432	\N	\N	CLY	Ste Catherine	42.5277799999999999	8.79166700000000034
1433	\N	\N	CLZ	Calabozo	8.9333329999999993	-67.4333340000000021
1434	\N	\N	CMA	Cunnamulla	-28.0313899999999983	145.616099999999989
1435	\N	\N	CMC	Camocim	-2.9166669999999999	-40.8333319999999986
1436	\N	\N	CMD	Cootamundra	-34.6283340000000024	148.043329999999997
1437	\N	\N	CMF	Chambery	45.6379930000000016	5.88436999999999966
1438	\N	\N	CMG	International Airport Corumba	-19.0111099999999986	-57.6722219999999979
1439	\N	\N	CMJ	Chi Mei	23.25	119.416663999999997
1440	\N	\N	CMK	Club Makokola	-14.3000000000000007	35.0499999999999972
1441	\N	\N	CML	Camooweal	-19.9333320000000001	138.116669999999999
1442	\N	\N	CMM	Carmelita	17.4583319999999986	-90.0533300000000025
1443	\N	\N	CMO	Obbia	5.36666699999999963	48.5166660000000007
1444	\N	\N	CMP	Campo Alegre	-9.80000000000000071	-36.3500000000000014
1445	\N	\N	CMQ	Clermont	-22.8666669999999996	147.5
1446	\N	\N	CMR	Colmar-houssen	48.0833319999999986	7.36666699999999963
1447	\N	\N	CMS	Scusciuban	10.3000000000000007	50.2333339999999993
1448	\N	\N	CMT	Cameta	-2.20000000000000018	-49.5
1449	\N	\N	CMU	Chimbu	-5.99388900000000024	144.974439999999987
1450	\N	\N	CMV	Coromandel	-37	175.666670000000011
1451	\N	\N	CMX	Houghton County	47.1677779999999984	-88.4863900000000001
1452	\N	\N	CMY	Fort Mccoy	44.0334700000000012	-90.7789700000000011
1453	\N	\N	CMZ	Caia	-17.8500000000000014	35.3999999999999986
1454	\N	\N	CNA	Cananea	31	-110.333336000000003
1455	\N	\N	CNB	Coonamble	-30.9808330000000005	148.378330000000005
1456	\N	\N	CNC	Coconut Island	-10.050179	143.066589999999991
1457	\N	\N	CNE	Canon City	38.4500000000000028	-105.233329999999995
1458	\N	\N	CNG	Parvaud	45.6833340000000021	-0.33333299999999999
1459	\N	\N	CNH	Municipal	43.3833300000000008	-72.3333360000000027
1460	\N	\N	CNI	Changhai	31.25	121.433334000000002
1461	\N	\N	CNJ	Cloncurry	-20.6689049999999988	140.508510000000001
1462	\N	\N	CNK	Blosser Municipal	39.5666659999999979	-97.6666639999999973
1463	\N	\N	CNL	Sindal	57.4833339999999993	10.2166669999999993
1464	\N	\N	CNM	Carlsbad	32.3372230000000016	-104.262780000000006
1465	\N	\N	CNO	Chino	33.9808299999999974	-117.639169999999993
1466	\N	\N	CNP	Neerlerit Inaat	70.7430599999999998	-22.6583329999999989
1467	\N	\N	CNQ	Camba Punta	-27.4497220000000013	-58.7622220000000013
1468	\N	\N	CNR	Chanaral	-26.3291660000000007	-70.6041639999999973
1469	\N	\N	CNS	Cairns	-16.876536999999999	145.754040000000003
1470	\N	\N	CNT	Charata	-27.2166670000000011	-61.2333339999999993
1471	\N	\N	CNU	Martin Johnson	37.6833340000000021	-95.4500000000000028
1472	\N	\N	CNV	Canavieiras	-15.6666670000000003	-38.9833339999999993
1473	\N	\N	CNW	TSTC Waco Airport	31.9166680000000014	-97.1333300000000008
1474	\N	\N	CNX	Chiang Mai International	18.7695730000000012	98.9684100000000058
1475	\N	\N	CNY	Canyonlands Field	38.7594449999999995	-109.746110000000002
1476	\N	\N	CNZ	Cangamba	-11.5	19
1477	\N	\N	COA	Columbia	38.028889999999997	-120.412779999999998
1478	\N	\N	COB	Coolibah	-15.5500000000000007	130.933330000000012
1479	\N	\N	COC	Concordia	-31.2972220000000014	-57.9963869999999986
1480	\N	\N	COD	Yellowstone Regional	44.5158350000000027	-109.027500000000003
1481	\N	\N	COF	Patrick AFB	28.3500000000000014	-80.7333299999999952
1482	\N	\N	COG	Mandinga	5.07916699999999999	-76.663330000000002
1483	\N	\N	COH	Cooch Behar	26.3333319999999986	89.4666699999999935
1484	\N	\N	COI	Merritt Island	28.3166679999999999	-80.5999999999999943
1485	\N	\N	COJ	Coonabarabran	-31.3372209999999995	149.271940000000001
1486	\N	\N	COK	Cochin International	10.1556440000000006	76.3905299999999983
1487	\N	\N	COM	Coleman	31.8333319999999986	-99.4333340000000021
1488	\N	\N	CON	Concord	43.2000000000000028	-71.5333300000000065
1489	\N	\N	COP	Cooperstown - Westville Airport	42.7000000000000028	-74.9333340000000021
1490	\N	\N	COR	Pajas Blancas	-31.3154800000000009	-64.2137699999999967
1491	\N	\N	COT	Cotulla	28.4333320000000001	-99.2333299999999952
1492	\N	\N	COV	Covilha	40.2833329999999989	-7.5
1493	\N	\N	COW	Coquimbo	-32.7999999999999972	-70.6333300000000008
1494	\N	\N	COX	Congo Town	24.1499999999999986	-77.5833360000000027
1495	\N	\N	COY	Coolawanyah	-21.8500000000000014	117.75
1496	\N	\N	COZ	Constanza	18.8999999999999986	-70.7166699999999935
1497	\N	\N	CPA	A. Tubman	4.37666700000000031	-7.69555599999999984
1498	\N	\N	CPB	Capurgana	8.63333300000000037	-77.3333360000000027
1499	\N	\N	CPD	Coober Pedy	-29.0444430000000011	134.752780000000001
1500	\N	\N	CPE	Campeche International	19.8350000000000009	-90.5094449999999995
1501	\N	\N	CPF	Cepu	-7.15000000000000036	111.583336000000003
1502	\N	\N	CPG	Carmen De Patagones	-40.8333319999999986	-63
1503	\N	\N	CPI	Cape Orford	-5.43333300000000019	152.083329999999989
1504	\N	\N	CPL	Chaparral	3.71666700000000017	-75.4666699999999935
1505	\N	\N	CPM	Compton	33.894444	-118.247780000000006
1506	\N	\N	CPN	Cape Rodney	-10.1833329999999993	148.366669999999999
1507	\N	\N	CPO	Chamonate	-27.298919999999999	-70.4144059999999996
1508	\N	\N	CPQ	International	-22.8564620000000005	-47.1115950000000012
1509	\N	\N	CPR	Natrona County International Airport	42.908610000000003	-106.462500000000006
1510	\N	\N	CPS	St. Louis Downtown Airport	38.576984000000003	-90.1584239999999966
1511	\N	\N	CPT	Cape Town International	-33.9689059999999969	18.5964889999999983
1512	\N	\N	CPU	Cururupu	-1.80000000000000004	-44.8666699999999992
1513	\N	\N	CPV	Joao Suassuna	-7.26666699999999999	-35.8999999999999986
1514	\N	\N	CQA	Canarana Airport	-13.5741669999999992	-52.2702799999999996
1515	\N	\N	CQD	Shahre-kord	32.2944529999999972	50.8375360000000001
1516	\N	\N	CQF	Calais	50.9500000000000028	1.93333299999999997
1517	\N	\N	CQM	Ciudad Real Central	38.9833339999999993	-3.9166669999999999
1518	\N	\N	CQP	Cape Flattery	-18.1999999999999993	147.5
1519	\N	\N	CQS	Costa Marques	-12.4166670000000003	-64.25
1520	\N	\N	CQT	Caquetania	1.61666700000000008	-74.1666639999999973
1521	\N	\N	CRA	Craiova	44.3188900000000032	23.8863890000000012
1522	\N	\N	CRB	Collarenebri	-29.5500000000000007	148.583329999999989
1523	\N	\N	CRC	Cartago	4.76666699999999999	-75.9333340000000021
1524	\N	\N	CRE	Grand Strand Airport	33.8113900000000029	-78.7244400000000013
1525	\N	\N	CRF	Carnot	4.98333300000000001	15.9333329999999993
1526	\N	\N	CRG	Craig Municipal	30.5	-81.6666639999999973
1527	\N	\N	CRH	Cherribah	-28	152.166670000000011
1528	\N	\N	CRI	Crooked Island	22.75	-74.1500000000000057
1529	\N	\N	CRJ	Coorabie	-31.8999999999999986	132.300000000000011
1530	\N	\N	CRO	Corcoran	36.1000000000000014	-119.549999999999997
1531	\N	\N	CRQ	Caravelas	-17.75	-39.25
1532	\N	\N	CRR	Ceres	-29.9166680000000014	-61.8333319999999986
1533	\N	\N	CRS	Corsicana	32.1000000000000014	-96.4666699999999935
1534	\N	\N	CRT	Municipal	33.1333300000000008	-91.9666699999999935
1535	\N	\N	CRU	Carriacou Island	12.4749999999999996	-61.4722200000000001
1536	\N	\N	CRV	Crotone	39	17.0833319999999986
1537	\N	\N	CRW	Yeager	38.3703420000000008	-81.5965039999999959
1538	\N	\N	CRX	Roscoe Turner	34.8999999999999986	-88.5999999999999943
1539	\N	\N	CRY	Carlton Hill	-15.4666669999999993	128.616669999999999
1540	\N	\N	CRZ	Turkmenabad	39.0833319999999986	63.6166699999999992
1541	\N	\N	CSB	Caransebes	45.4166680000000014	22.2166670000000011
1542	\N	\N	CSC	Canas	10.766667	-85.4833299999999952
1543	\N	\N	CSD	Cresswell Downs	-17.9666670000000011	135.916670000000011
1544	\N	\N	CSE	Crested Butte	38.8666699999999992	-106.983329999999995
1545	\N	\N	CSF	Creil	49.25	2.48333300000000001
1546	\N	\N	CSI	Casino	-28.8833330000000004	153.058330000000012
1547	\N	\N	CSJ	Cape St Jacques	10.0333330000000007	111
1548	\N	\N	CSK	Cap Skirring	12.4000000000000004	-16.75
1549	\N	\N	CSL	O Sullivan Army Air Field	35.2366680000000017	-120.639169999999993
1550	\N	\N	CSM	Sherman	35.539164999999997	-96.9333340000000021
1551	\N	\N	CSN	Carson City	39.1916659999999979	-119.734719999999996
1552	\N	\N	CSO	Cochstedt	51.8500000000000014	11.4166670000000003
1553	\N	\N	CSQ	Municipal	41.0666659999999979	-94.3666699999999992
1554	\N	\N	CSR	Casuarito	5.83333299999999966	-68.1333300000000008
1555	\N	\N	CSS	Cassilandia	-18.9833339999999993	-51.9833339999999993
1556	\N	\N	CST	Castaway	-17.5	177.5
1557	\N	\N	CSU	Santa Cruz Do Sul	-29.6833320000000001	-52.4166680000000014
1558	\N	\N	CSV	Memorial	35.9511099999999999	-85.0847239999999942
1559	\N	\N	CSW	Colorado do Oeste	-13.019444	-61.168056
1560	\N	\N	CSX	Changsha	28.1933359999999986	113.214590000000001
1561	\N	\N	CSY	Cheboksary	56.1333300000000008	47.2666660000000007
1562	\N	\N	CSZ	Brigadier Hector Ruiz	-37.4333340000000021	-61.8833300000000008
1563	\N	\N	CTB	Cut Bank	48.6333300000000008	-112.333336000000003
1564	\N	\N	CTC	Catamarca	-28.4483339999999991	-65.7797240000000016
1565	\N	\N	CTD	Chitre	7.96666700000000017	-80.4333340000000021
1566	\N	\N	CTE	Carti	8.83333299999999966	-80.8333360000000027
1567	\N	\N	CTF	Coatepeque Airport	14.766667	-91.9166639999999973
1568	\N	\N	CTG	Rafael Nunez	10.4457039999999992	-75.5165899999999937
1569	\N	\N	CTH	Chestercounty Carlson	39.9833339999999993	-75.8333360000000027
1570	\N	\N	CTI	Cuito Cuanavale	-15.1666670000000003	19.1666680000000014
1571	\N	\N	CTK	Canton	43.2999999999999972	-96.5833360000000027
1572	\N	\N	CTL	Charleville	-26.413333999999999	146.258420000000001
1573	\N	\N	CTM	Chetumal	18.4819430000000011	-88.3333360000000027
1574	\N	\N	CTN	Cooktown	-15.4433330000000009	145.183330000000012
1575	\N	\N	CTO	Peconic River	38.6333300000000008	-77.6833340000000021
1576	\N	\N	CTP	Carutapera	-1.25	-46.0166660000000007
1577	\N	\N	CTQ	Do Palmar	-18.8500000000000014	-50.1000000000000014
1578	\N	\N	CTR	Cattle Creek	-17.5833319999999986	131
1579	\N	\N	CTS	Chitose	42.7872800000000026	141.681340000000006
1580	\N	\N	CTT	Le Castellet	43.25	5.78333299999999983
1581	\N	\N	CTU	Shuangliu	30.5811349999999997	103.956800000000001
1582	\N	\N	CTW	Cottonwood	34.7333339999999993	-112.033330000000007
1583	\N	\N	CTX	Cortland	42.6000000000000014	-76.1833340000000021
1584	\N	\N	CTY	Cross City	29.6333330000000004	-83.1166699999999992
1585	\N	\N	CTZ	Sampson County	35	-78.3666699999999992
1586	\N	\N	CUA	Ciudad Constitucion	25.0369430000000008	-111.664444000000003
1587	\N	\N	CUB	Owens Field	33.9369429999999994	-81.1152799999999985
1588	\N	\N	CUC	Camilo Dazo	7.9271079999999996	-72.5081500000000005
1589	\N	\N	CUD	Caloundra	-26.8000000000000007	153.150000000000006
1590	\N	\N	CUF	Levaldigi	44.5352800000000002	7.61749999999999972
1591	\N	\N	CUG	Cudal	-32	151
1592	\N	\N	CUH	Municipal	35.9833339999999993	-96.7666700000000048
1593	\N	\N	CUI	Currillo	4.66666700000000034	-72
1594	\N	\N	CUJ	Culion	11.8333329999999997	120
1595	\N	\N	CUK	Caye Caulker	17.7666660000000007	-88
1596	\N	\N	CUL	Fedl De Bachigualato	24.7664299999999997	-107.469579999999993
1597	\N	\N	CUM	Cumana	10.4477779999999996	-64.1919400000000024
1598	\N	\N	CUO	Caruru	1.03333300000000006	-71.2333299999999952
1599	\N	\N	CUR	Hato International Airport	12.1846150000000009	-68.9570599999999985
1600	\N	\N	CUS	Municipal	31.8333319999999986	-107.633330000000001
1601	\N	\N	CUT	Cutral	-38.8999999999999986	-69
1602	\N	\N	CUU	Gen Fierro Villalobos	28.7040480000000002	-105.969520000000003
1603	\N	\N	CUV	Casigua	11.0666670000000007	-70.9500000000000028
1604	\N	\N	CUW	Cube Cove	57.9416659999999979	-134.75
1605	\N	\N	CUX	Cuddihy Field	27.75	-97.336110000000005
1606	\N	\N	CUY	Cue	-27.4499999999999993	117.916663999999997
1607	\N	\N	CUZ	Velazco Astete	-13.5384290000000007	-71.9437099999999958
1608	\N	\N	CVA	Civic Ar Heli	40.4966659999999976	-80.2358300000000071
1609	\N	\N	CVB	Chungribu	-4.79999999999999982	144.699999999999989
1610	\N	\N	CVC	Cleve	-33.7000000000000028	136.5
1611	\N	\N	CVE	Covenas	9.40000000000000036	-75.7333299999999952
1612	\N	\N	CVF	Courchevel	45.3966670000000008	6.63472200000000001
1613	\N	\N	CVH	Caviahue	-37.9166680000000014	-71
1614	\N	\N	CVI	Caleta Olivia	-46.4166680000000014	-67.4166639999999973
1615	\N	\N	CVJ	General Mariano Matamoros Airport	18.9166680000000014	-99.25
1616	\N	\N	CVL	Cape Vogel	-9.46666699999999928	150.5
1617	\N	\N	CVN	Municipal	34.4272229999999979	-103.078890000000001
1618	\N	\N	CVO	Albany	44.6333300000000008	-123.116669999999999
1619	\N	\N	CVQ	Carnarvon	-24.8834289999999996	113.663579999999996
1620	\N	\N	CVR	Hughes	33.9750000000000014	-118.417000000000002
1621	\N	\N	CVS	Cannon AFB	34.383890000000001	-103.316665999999998
1622	\N	\N	CVT	West Midlands International	52.3691669999999974	-1.4786109999999999
1623	\N	\N	CVU	Corvo Island	39.7000000000000028	-31.1000000000000014
1624	\N	\N	CWA	Central Wisconsin	44.7842100000000016	-89.6724399999999946
1625	\N	\N	CWB	Afonso Pena International Airport	-25.5321999999999996	-49.1765439999999998
1626	\N	\N	CWC	Chernovtsy	48.2666660000000007	25.9666670000000011
1627	\N	\N	CWG	Callaway Gardens	32.8402799999999999	-84.8824999999999932
1628	\N	\N	CWI	Clinton	41.8294449999999998	-90.3319500000000062
1629	\N	\N	CWL	Cardiff	51.398769999999999	-3.33907499999999979
1630	\N	\N	CWO	Ft Wolter AAF	32.7999999999999972	-98.1166699999999992
1631	\N	\N	CWP	Campbellpore	33.7666660000000007	72.4333340000000021
1632	\N	\N	CWR	Cowarie	-27.7166670000000011	138.333329999999989
1633	\N	\N	CWS	Center Island	47.4849999999999994	-122.831389999999999
1634	\N	\N	CWT	Cowra	-33.8549999999999969	148.64667
1635	\N	\N	CWW	Corowa	-35.9666670000000011	146.349999999999994
1636	\N	\N	CXA	Caicara Del Orinoco	7.53333299999999983	-66.1500000000000057
1637	\N	\N	CXC	Chitina Airport	61.5833319999999986	-144.427780000000013
1638	\N	\N	CXF	Coldfoot	67.2666700000000048	-150.166670000000011
1639	\N	\N	CXL	International	32.6666680000000014	-115.516670000000005
1640	\N	\N	CXN	Candala	11.5	49.9166680000000014
1641	\N	\N	CXO	Montgomery Co	30.3166679999999999	-95.4500000000000028
1642	\N	\N	CXQ	Christmas Creek	-18.8666669999999996	125.916663999999997
1643	\N	\N	CXT	Charters Towers	-20.0466669999999993	146.269170000000003
1644	\N	\N	CXY	Cat Cays	25.4166680000000014	-77.8166659999999979
1645	\N	\N	CYA	Les Cayes	18.2697220000000016	-73.788330000000002
1646	\N	\N	CYC	Caye Chapel	17.6666680000000014	-88.8333360000000027
1647	\N	\N	CYE	Crystal Lake	41.2102780000000024	-75.8322200000000066
1648	\N	\N	CYF	Chefornak SPB	60.2166670000000011	-164.199999999999989
1649	\N	\N	CYG	Corryong	-36.25	147.900000000000006
1650	\N	\N	CYL	Coyoles	15	-86.5
1651	\N	\N	CYM	Chatham SPB	57.5	-135
1652	\N	\N	CYP	Calbayog	12.0758329999999994	124.543049999999994
1653	\N	\N	CYR	Laguna De Los Patos	-34.1666680000000014	-57.5
1654	\N	\N	CYT	Intermediate	60.0799999999999983	-142.494450000000001
1655	\N	\N	CYU	Cuyo	10.8833330000000004	121
1656	\N	\N	CYX	Cherskiy	68.75	161.349999999999994
1657	\N	\N	CYZ	Cauayan	16.9299999999999997	121.755840000000006
1658	\N	\N	CZA	Chichen Itza	20.6666680000000014	-88.5666659999999979
1659	\N	\N	CZB	Carlos Ruhl	-28.6416660000000007	-53.5583340000000021
1660	\N	\N	CZC	Copper Centre	61.9666670000000011	-145.300000000000011
1661	\N	\N	CZF	Cape Romanzof	61.7811129999999977	-166.036390000000011
1662	\N	\N	CZH	Corozal	18.3833330000000004	-88.4166639999999973
1663	\N	\N	CZJ	Corazon De Jesus	9.57055599999999984	-79.3686139999999938
1664	\N	\N	CZK	Cascade Locks/Stevens	45.6666680000000014	-121.900000000000006
1665	\N	\N	CZL	Ain El Bey	36.2864760000000004	6.61842500000000022
1666	\N	\N	CZM	Cozumel	20.5111999999999988	-86.9304659999999956
1667	\N	\N	CZN	Chisana Field	62.0708300000000008	-142.050000000000011
1668	\N	\N	CZO	Chistochina	62.5666659999999979	-144.666670000000011
1669	\N	\N	CZP	Cape Pole	55.9666670000000011	-133.78528
1670	\N	\N	CZT	Carrizo Springs	28.5166660000000007	-99.8666699999999992
1671	\N	\N	CZU	Corozal	9.33750000000000036	-75.2827759999999984
1672	\N	\N	CZW	Czestochowa	50.8166659999999979	19.1000000000000014
1673	\N	\N	CZX	Changzhou	31.9141159999999999	119.779759999999996
1674	\N	\N	CZY	Cluny	-24.5166660000000007	139.53334000000001
1675	\N	\N	CZZ	Campo	37.1000000000000014	-102.583336000000003
1676	\N	\N	DAA	Davison AAF	37.5	-78.75
1677	\N	\N	DAB	Regional	29.1851920000000007	-81.0608299999999957
1678	\N	\N	DAC	Zia International	23.8486480000000007	90.4058760000000063
1679	\N	\N	DAD	Da Nang	16.0553990000000013	108.202979999999997
1680	\N	\N	DAF	Daup	-4.73333300000000001	144.949999999999989
1681	\N	\N	DAG	Barstow-Daggett	34.25	-117.333336000000003
1682	\N	\N	DAH	Dathina	13.8666669999999996	46.1333300000000008
1683	\N	\N	DAJ	Dauan Island	-9.4333329999999993	142.53334000000001
1684	\N	\N	DAK	Dakhla	25.4147220000000011	28.9991659999999989
1685	\N	\N	DAL	Love Field	32.843910000000001	-96.8499999999999943
1686	\N	\N	DAN	Municipal	36.5730549999999965	-79.3349999999999937
1687	\N	\N	DAO	Dabo	-8.43305600000000055	147.849439999999987
1688	\N	\N	DAP	Darchula	29.6666680000000014	80.5
1689	\N	\N	DAS	Great Bear Lake	66.7030599999999936	-119.712776000000005
1690	\N	\N	DAV	Enrique Malek	8.38333300000000037	-82.4333340000000021
1691	\N	\N	DAY	James Cox Dayton International	39.8980060000000023	-84.2207640000000026
1692	\N	\N	DAZ	Darwaz	38.4666670000000011	70.8833300000000008
1693	\N	\N	DBA	Dalbandin	28.8833330000000004	64.4166639999999973
1694	\N	\N	DBB	Alalamain International	30.9244440000000012	28.4613900000000015
1695	\N	\N	DBD	Dhanbad	23.7833329999999989	86.4500000000000028
1696	\N	\N	DBM	Debra Marcos	10.3194440000000007	37.7430570000000003
1697	\N	\N	DBN	Municipal	32.5619429999999994	-82.9861149999999981
1698	\N	\N	DBO	Dubbo	-32.218822000000003	148.569559999999996
1699	\N	\N	DBP	Debepare	-6.28333299999999983	141.900000000000006
1700	\N	\N	DBQ	Municipal	42.4099999999999966	-90.7108300000000014
1701	\N	\N	DBS	Dubois	44.1666680000000014	-112.233329999999995
1702	\N	\N	DBT	Debra Tabor	11.9680560000000007	38.0252759999999981
1703	\N	\N	DBU	Dambulu Oya Tank	7.86000000000000032	80.6516649999999942
1704	\N	\N	DBV	Dubrovnik	42.5607200000000034	18.2606159999999988
1705	\N	\N	DBY	Dalby	-27.1499999999999986	151.266660000000002
1706	\N	\N	DCI	Rafsu Decimomannu	39.3500000000000014	8.96666699999999928
1707	\N	\N	DCK	Dahl Creek Airport	66.9500000000000028	-156.900000000000006
1708	\N	\N	DCM	Mazamet	43.5558320000000023	2.28416700000000006
1709	\N	\N	DCR	Decatur Hi-Way	40.8333319999999986	-84.9333340000000021
1710	\N	\N	DCT	Duncan Town	22.25	-75.75
1711	\N	\N	DCU	Pyor	34.6000000000000014	-86.9833299999999952
1712	\N	\N	DDG	Dandong	40.0323679999999982	124.280810000000002
1713	\N	\N	DDI	Daydream Island	-20.2666660000000007	148.816669999999988
1714	\N	\N	DDM	Dodoima	-8.48333300000000001	145.166670000000011
1715	\N	\N	DDN	Delta Downs	-16.9166680000000014	141.300000000000011
1716	\N	\N	DDP	Dorado Beach	18.4833339999999993	-66.1500000000000057
1717	\N	\N	DDU	Dadu	26.75	67.75
1718	\N	\N	DEA	Dera Ghazi Khan	29.9605560000000004	70.4852750000000015
1719	\N	\N	DEB	Debrecen	47.5499999999999972	21.6999999999999993
1720	\N	\N	DEC	Decatur Airport	39.8341670000000008	-88.8686139999999938
1721	\N	\N	DED	Dehra Dun	30.3166679999999999	78.0333300000000065
1722	\N	\N	DEF	Dezful	32.4388280000000009	48.384680000000003
1723	\N	\N	DEH	Municipal	43.2999999999999972	-91.7999999999999972
1724	\N	\N	DEI	Denis Island	-3.79999999999999982	55.6666680000000014
1725	\N	\N	DEL	Indira Gandhi International	28.5565549999999995	77.1007900000000035
1726	\N	\N	DEM	Dembidollo	8.57111100000000015	34.8833300000000008
1727	\N	\N	DEO	Hyatt Regency Heliport	42.2999999999999972	-83.1666639999999973
1728	\N	\N	DEP	Deparizo	27.3500000000000014	94
1729	\N	\N	DER	Derim	-6.09999999999999964	147.083329999999989
1730	\N	\N	DES	Desroches	-5.68333300000000019	53.6833340000000021
1731	\N	\N	DET	Detroit City	42.4166680000000014	-83.0166700000000048
1732	\N	\N	DFI	Memorial	41.2833329999999989	-84.3666699999999992
1733	\N	\N	DFP	Drumduff	-16	143.333329999999989
1734	\N	\N	DGA	Dangriga	17.1833320000000001	-88.5666659999999979
1735	\N	\N	DGB	Danger Bay	58.0833319999999986	-152.75
1736	\N	\N	DGC	Degahbur	8.23333300000000001	43.5833319999999986
1737	\N	\N	DGD	Dalgaranga	-27.8180559999999986	117.301389999999998
1738	\N	\N	DGF	Douglas Lake	50.1666680000000014	-120.183334000000002
1739	\N	\N	DGG	Daugo	68.0300000000000011	-162.900000000000006
1740	\N	\N	DGL	Douglas Municipal	31.3500000000000014	-109.566665999999998
1741	\N	\N	DGM	Dongguan	23.0300000000000011	113.739999999999995
1742	\N	\N	DGN	NAF	38.2000000000000028	-88.6833340000000021
1743	\N	\N	DGO	Guadalupe Victoria	24.125	-104.525000000000006
1744	\N	\N	DGP	Daugavpils	55.8833300000000008	26.5333329999999989
1745	\N	\N	DGR	Dargaville	-35.9333340000000021	173.883330000000001
1746	\N	\N	DGT	Dumaguete	9.33254299999999937	123.296009999999995
1747	\N	\N	DGU	Dedougou	12.4666669999999993	-3.48333300000000001
1748	\N	\N	DGW	Converse County	42.75	-105.400000000000006
1749	\N	\N	DHA	King Abdulaziz AB	26.3928599999999989	50.1747500000000031
1750	\N	\N	DHD	Durham Downs	-26.1000000000000014	149.083329999999989
1751	\N	\N	DHF	Al Dhafra Military Airport	24.4333320000000001	54.6499999999999986
1752	\N	\N	DHI	Dhangarhi	28.6833320000000001	80.6333300000000008
1753	\N	\N	DHL	Dhala	13.7375000000000007	44.7291680000000014
1754	\N	\N	DHM	Gaggal Airport	32.2999999999999972	76.2666700000000048
1755	\N	\N	DHN	Dothan Airport	31.3200000000000003	-85.4483299999999986
1756	\N	\N	DHR	De Kooy/Den Helder Airport	52.9500000000000028	4.75
1757	\N	\N	DHT	Dalhart	36.0666659999999979	-102.516670000000005
1758	\N	\N	DIB	Dibrugarh	27.4829079999999983	95.021064999999993
1759	\N	\N	DIE	Antsiranana/Arrachart	-12.3461110000000005	49.2924999999999969
1760	\N	\N	DIG	Diqing	27.7897220000000011	99.6777799999999985
1761	\N	\N	DIK	Dickinson	46.8333319999999986	-102.900000000000006
1762	\N	\N	DIL	Presidente Nicolau Lobato International	-8.54961600000000033	125.525000000000006
1763	\N	\N	DIM	Dimbokro	6.75	-4.76666699999999999
1764	\N	\N	DIN	Dien Bien	21.3833330000000004	103
1765	\N	\N	DIO	Diomede Island	65.75	-168.949999999999989
1766	\N	\N	DIP	Diapaga	12.0333330000000007	2.03333299999999983
1767	\N	\N	DIQ	Divinopolis	-20.1813889999999994	-44.8694460000000035
1768	\N	\N	DIR	Aba Tenna D Yilma	9.61337999999999937	41.8579939999999979
1769	\N	\N	DIS	Loubomo	-4.20555599999999963	12.6613889999999998
1770	\N	\N	DIU	Diu	20.7166670000000011	70.9166639999999973
1771	\N	\N	DIV	Divo	5.79999999999999982	-5.25
1772	\N	\N	DIW	Mawella Lagoon	5.99075100000000038	80.733230000000006
1773	\N	\N	DIY	Diyarbakir	37.9038729999999973	40.20458
1774	\N	\N	DJA	Djougou	9.69999999999999929	1.6666669999999999
1775	\N	\N	DJB	Sultan Taha Syarifudn	-1.6304320000000001	103.639359999999996
1776	\N	\N	DJG	Inedbirenne	24.4652789999999989	9.48888900000000035
1777	\N	\N	DJM	Djambala	-2.53333299999999983	14.75
1778	\N	\N	DJN	Delta Junction	64.0333300000000065	-145.683330000000012
1779	\N	\N	DJO	Daloa	6.86694400000000016	-6.46666700000000017
1780	\N	\N	DJU	Djupivogur	64.6502760000000052	-14.2683330000000002
1781	\N	\N	DKI	Dunk Island	-17.9416679999999999	146.136670000000009
1782	\N	\N	DKK	Dunkirk	42.4833339999999993	-79.3333360000000027
1783	\N	\N	DKR	Dakar-Yoff-Léopold Sédar Senghor International	14.7449750000000002	-17.4901939999999989
1784	\N	\N	DKS	Dikson	73.5166700000000048	80.3666699999999992
1785	\N	\N	DKV	Docker River	-24.8666669999999996	129.083329999999989
1786	\N	\N	DLA	Douala	4.01346000000000025	9.71701799999999949
1787	\N	\N	DLC	Dalian	38.9610199999999978	121.539990000000003
1788	\N	\N	DLF	Laughlin AFB	29.3666669999999996	-100.900000000000006
1789	\N	\N	DLG	Municipal	59.0424599999999984	-158.514720000000011
1790	\N	\N	DLH	Duluth International	46.8389740000000003	-92.1801899999999961
1791	\N	\N	DLI	Lienkhang	11.749689	108.37603
1792	\N	\N	DLK	Dulkaninna	-29.0166660000000007	139.46665999999999
1793	\N	\N	DLL	Dillon	34.4166680000000014	-79.3666699999999992
1794	\N	\N	DLM	Dalaman	36.7166670000000011	28.7833329999999989
1795	\N	\N	DLN	Dillon	45.2166670000000011	-112.633330000000001
1796	\N	\N	DLO	Dolomi	55.1222229999999982	-132.050000000000011
1797	\N	\N	DLS	Columbia Gorge Regional/The Dalles Municipal Airport	45.6000000000000014	-121.166663999999997
1798	\N	\N	DLV	Delissaville	-12.5666670000000007	130.633330000000001
1799	\N	\N	DLY	Dillons Bay	-18.6999999999999993	169.150000000000006
1800	\N	\N	DMA	Davis Monthan AFB	32.1666680000000014	-110.883330000000001
1801	\N	\N	DMD	Doomadgee	-17.9392010000000006	138.821599999999989
1802	\N	\N	DMK	Don Muang	13.9124999999999996	100.606669999999994
1803	\N	\N	DMN	Deming	32.2666660000000007	-107.75
1804	\N	\N	DMO	Sedalia	38.7041660000000007	-93.1805599999999998
1805	\N	\N	DMR	Dhamar	14.5333330000000007	44.4333340000000021
1806	\N	\N	DMT	Diamantino	-14.5	-56.5
1807	\N	\N	DMU	Dimapur	25.8798160000000017	93.7728649999999959
1808	\N	\N	DNA	Kadena AB	26.3500000000000014	127.766670000000005
1809	\N	\N	DNB	Dunbar	-16.0108339999999991	142.39054999999999
1810	\N	\N	DND	Dundee	56.4540900000000008	-3.01453099999999985
1811	\N	\N	DNE	Dallas North Airport	32.75	-97.3833300000000008
1812	\N	\N	DNF	Martuba	32.5499999999999972	22.7666660000000007
1813	\N	\N	DNG	Doongan	-15.3833330000000004	126.299999999999997
1814	\N	\N	DNH	Dunhuang	40.2000000000000028	94.6833340000000021
1815	\N	\N	DNI	Wad Medani	14.3938889999999997	33.5438880000000026
1816	\N	\N	DNL	Daniel Field	33.4666670000000011	-81.9666699999999935
1817	\N	\N	DNM	Denham	-25.9166680000000014	113.533330000000007
1818	\N	\N	DNN	Municipal	34.7666660000000007	-84.9666699999999935
1819	\N	\N	DNO	Dianopolis	-11.6166669999999996	-46.8500000000000014
1820	\N	\N	DNP	Dang	28.1166669999999996	82.3166659999999979
1821	\N	\N	DNQ	Deniliquin	-35.5600000000000023	144.951660000000004
1822	\N	\N	DNR	Pleurtuit	48.5877759999999981	-2.08361099999999988
1823	\N	\N	DNS	Municipal	42.0166660000000007	-95.3499999999999943
1824	\N	\N	DNT	Downtown Heliport	33.7666660000000007	-117.866669999999999
1825	\N	\N	DNU	Dinangat	-6.15000000000000036	146.666670000000011
1826	\N	\N	DNV	Vermilion County	40.1972239999999985	-87.5969500000000068
1827	\N	\N	DNX	Galegu	14.0999999999999996	33.0666659999999979
1828	\N	\N	DOA	Doany	-14.3666669999999996	49.5
1829	\N	\N	DOC	Dornoch	57.8666699999999992	-4.03333299999999983
1830	\N	\N	DOE	Djoemoe	4.01666699999999999	-55.4833339999999993
1831	\N	\N	DOF	Dora Bay	55.2124999999999986	-132.266660000000002
1832	\N	\N	DOG	Dongola	19.1833320000000001	30.4499999999999993
1833	\N	\N	DOI	Doini	-10.7166669999999993	150.71665999999999
1834	\N	\N	DOK	Donetsk International Airport	48.0833319999999986	37.75
1835	\N	\N	DOL	St Gatien	49.3627779999999987	0.164167000000000007
1836	\N	\N	DOM	Melville Hall	15.543056	-61.3091659999999976
1837	\N	\N	DON	Dos Lagunas	17.6333330000000004	-89.6666639999999973
1838	\N	\N	DOO	Dorobisoro	-9.26666699999999999	147.550000000000011
1839	\N	\N	DOP	Dolpa	29	82.8166659999999979
1840	\N	\N	DOR	Dori	14.0333330000000007	-0.0333330000000000015
1841	\N	\N	DOS	Dios	-5.53333299999999983	154.833329999999989
1842	\N	\N	DOV	Dover AFB	39.1286130000000014	-75.4641649999999942
1843	\N	\N	DOX	Dongara	-29.25	114.933334000000002
1844	\N	\N	DPA	Dupage County	41.9144440000000031	-88.2463900000000052
1845	\N	\N	DPE	Dieppe	49.9613879999999995	1.24111100000000008
1846	\N	\N	DPG	Michael AAF	40.2333339999999993	-112.75
1847	\N	\N	DPK	Deer Park	41	-73.5333300000000065
1848	\N	\N	DPL	Dipolog	8.59997800000000012	123.344179999999994
1849	\N	\N	DPO	Devonport	-41.1720540000000028	146.427539999999993
1850	\N	\N	DPS	Ngurah Rai International	-8.74446000000000012	115.163309999999996
1851	\N	\N	DPU	Dumpu	-5.88333300000000037	145.75
1852	\N	\N	DRA	Desert Rock	36.6666680000000014	-115.966669999999993
1853	\N	\N	DRB	Derby	-17.3733329999999988	123.652500000000003
1854	\N	\N	DRC	Dirico	-17.8333319999999986	20.6999999999999993
1855	\N	\N	DRD	Dorunda Station	-16.5	142.333329999999989
1856	\N	\N	DRE	Drummond Island	46.0166660000000007	-83.75
1857	\N	\N	DRF	Drift River	60.5833319999999986	-152.150000000000006
1858	\N	\N	DRH	Dabra	-3.25	138.566669999999988
1859	\N	\N	DRI	Beauregard Parish	30.8500000000000014	-93.2833300000000065
1860	\N	\N	DRJ	Drietabbetje	4.11666699999999963	-54.6666680000000014
1861	\N	\N	DRN	Dirranbandi	-28.586666000000001	148.215270000000004
1862	\N	\N	DRR	Durrie	-25.6166669999999996	140.21665999999999
1863	\N	\N	DRS	Dresden Airport	51.1243320000000026	13.7660820000000008
1864	\N	\N	DRT	Del Rio International	29.3333319999999986	-100.97833
1865	\N	\N	DRU	Drummond	46.6666680000000014	-113.150000000000006
1866	\N	\N	DRW	Darwin	-12.4078049999999998	130.877520000000004
1867	\N	\N	DRY	Drysdale River	-15.6666670000000003	126.416663999999997
1868	\N	\N	DSC	Dschang	5.83333299999999966	10.0916669999999993
1869	\N	\N	DSD	La Desirade	16.3333319999999986	-61.0166660000000007
1870	\N	\N	DSE	Combolcha	11.0749999999999993	39.7152799999999999
1871	\N	\N	DSG	Dilasag	14	120
1872	\N	\N	DSI	Destin-Fort Walton Beach Airport	30.3833330000000004	-86.5
1873	\N	\N	DSM	Des Moines International	41.5324329999999975	-93.6480899999999963
1874	\N	\N	DSN	Dongsheng	39.8500000000000014	110.033330000000007
1875	\N	\N	DSV	Dansville	42.5666659999999979	-77.7000000000000028
1876	\N	\N	DTA	Delta	39.3833300000000008	-112.5
1877	\N	\N	DTD	Datadawai	0.621315999999999979	116.600369999999998
1878	\N	\N	DTE	Naga	14.1333330000000004	122.983329999999995
1879	\N	\N	DTH	Death Valley	36.5	-117
1880	\N	\N	DTL	Municipal	46.8263900000000035	-95.8861100000000022
1881	\N	\N	DTM	Dortmund	51.5148280000000014	7.61313900000000032
1882	\N	\N	DTN	Shreveport Downtown	32.5397219999999976	-93.7444459999999964
1883	\N	\N	DTR	Decatur Island	48.5166660000000007	-122.833336000000003
1884	\N	\N	DUA	Eaker	33.9833339999999993	-96.4166639999999973
1885	\N	\N	DUC	Halliburton Field	34.4722200000000001	-97.9597239999999942
1886	\N	\N	DUD	Dunedin International	-45.9238700000000009	170.19905
1887	\N	\N	DUE	Dundo	-7.40000000000000036	20.8166679999999999
1888	\N	\N	DUF	Pine Island Airport	36.2583300000000008	-75.788889999999995
1889	\N	\N	DUG	Bisbee-Douglas International	31.4686100000000017	-109.603615000000005
1890	\N	\N	DUJ	Du Bois-Jefferson County	41.1783330000000021	-78.8988899999999944
1891	\N	\N	DUK	Dukuduk	-28.3666669999999996	32.2341649999999973
1892	\N	\N	DUM	Pinang Kampai	1.5833330000000001	101.466669999999993
1893	\N	\N	DUN	Dundas	76.5772249999999985	-68.7755599999999987
1894	\N	\N	DUQ	Duncan/Quam	48.7833329999999989	-123.700000000000003
1895	\N	\N	DVK	Diavik	64.5113900000000058	-110.289444000000003
1896	\N	\N	DVL	Devils Lake	48.1130560000000003	-98.9074999999999989
1897	\N	\N	DVN	Davenport	41.6105579999999975	-90.5886100000000027
1898	\N	\N	DVP	Davenport Downs	-24.1333330000000004	141.116669999999999
1899	\N	\N	DVR	Daly River	-13.75	130.683330000000012
1900	\N	\N	DVT	Phoenix Deer Valley Airport	33.6838869999999986	-112.083336000000003
1901	\N	\N	DWA	Dwangwa	-13	34.1333300000000008
1902	\N	\N	DWB	Soalala	-16.1000000000000014	45.3666699999999992
1903	\N	\N	DWF	Wright AFB	39.6666680000000014	-84.1833340000000021
1904	\N	\N	DWH	David Wayne Hooks	29.75	-95.4166639999999973
1905	\N	\N	DWN	Downtown Airpark	35.4500000000000028	-97.5333300000000065
1906	\N	\N	DWS	Walt Disney World	28.3836119999999994	-81.5499999999999972
1907	\N	\N	DXB	Dubai	25.248664999999999	55.3529169999999979
1908	\N	\N	DXD	Dixie	-15.1666670000000003	143.666670000000011
1909	\N	\N	DXR	Danbury Municipal Airport	41.3833300000000008	-73.4500000000000028
1910	\N	\N	DYA	Dysart	-23.5	148
1911	\N	\N	DYL	Doylestown	40.3166659999999979	-75.1333300000000008
1912	\N	\N	DYM	Diamantina Lakes	-26.75	139.166670000000011
1913	\N	\N	DYR	Anadyr	64.7333299999999952	177.75
1914	\N	\N	DYS	Dyess AFB	32.4666670000000011	-99.7166699999999935
1915	\N	\N	DYW	Daly Waters	-16.25	133.400000000000006
1916	\N	\N	DZA	Dzaoudzi	-12.8049009999999992	45.2820999999999998
1917	\N	\N	DZI	Codazzi	10.016667	-73.25
1918	\N	\N	DZN	Zhezhazgan	47.7000000000000028	67.7333299999999952
1919	\N	\N	DZO	Santa Bernardina	-33.4166680000000014	-56.5166660000000007
1920	\N	\N	DZU	Dazu	29.6999999999999993	105.716669999999993
1921	\N	\N	EAA	Eagle	64.7766649999999942	-141.148599999999988
1922	\N	\N	EAB	Abbse	14.5833329999999997	43.5
1923	\N	\N	EAE	Emae	-17.1666680000000014	168.416670000000011
1924	\N	\N	EAL	Elenak	9.33333299999999966	166.847229999999996
1925	\N	\N	EAM	Nejran	17.6132810000000006	44.4146459999999976
1926	\N	\N	EAN	Phifer Field	42.0499999999999972	-104.966669999999993
1927	\N	\N	EAT	Pangborn Field	47.3997230000000016	-120.20778
1928	\N	\N	EAU	Chippewa Valley Regional Airport	44.8644450000000035	-91.4872199999999935
1929	\N	\N	EBD	El Obeid	13.1597220000000004	30.2341669999999993
1930	\N	\N	EBG	El Bagre	7.61666699999999963	-74.8166659999999979
1931	\N	\N	EBJ	Esbjerg	55.5214300000000023	8.54906199999999927
1932	\N	\N	EBM	El Borma	31.7166670000000011	9.26666699999999999
1933	\N	\N	EBN	Ebadon	9.33333299999999966	166.800000000000011
1934	\N	\N	EBO	Ebon Airport	4.59999999999999964	168.75
1935	\N	\N	EBR	Downtown	30.4499999999999993	-91.1833340000000021
1936	\N	\N	EBS	Municipal	42.4666670000000011	-93.8166659999999979
1937	\N	\N	EBU	Boutheon	45.5413899999999998	4.29694399999999987
1938	\N	\N	EBW	Ebolowa	2.9166669999999999	11.1666670000000003
1939	\N	\N	ECA	Emmet County Airport	44.2666660000000007	-83.4833299999999952
1940	\N	\N	ECG	Elizabeth City	36.2591669999999979	-76.1730600000000067
1941	\N	\N	ECH	Echuca	-36.1499999999999986	144.75
1942	\N	\N	ECN	Ercan	35.1581199999999967	33.503070000000001
1943	\N	\N	ECO	El Encanto	-1.61666700000000008	-73.2333299999999952
1944	\N	\N	ECR	El Charco	2.5	-78
1945	\N	\N	ECS	Mondell	43.8333319999999986	-104.183334000000002
1946	\N	\N	EDB	Eldebba	18.2833329999999989	30.8333319999999986
1947	\N	\N	EDD	Erldunda	-25.25	133.199999999999989
1948	\N	\N	EDE	Municipal	36.0666659999999979	-76.6500000000000057
1949	\N	\N	EDF	Elmendorf AFB	61.2505570000000006	-149.784729999999996
1950	\N	\N	EDG	Weide AAF	39.4656680000000009	-76.3609160000000031
1951	\N	\N	EDI	Edinburgh	55.9481430000000017	-3.3641770000000002
1952	\N	\N	EDK	El Dorado	37.8166659999999979	-96.8666699999999992
1953	\N	\N	EDL	Eldoret	0.405399999999999983	35.2235999999999976
1954	\N	\N	EDM	Les Ajoncs	46.7000000000000028	-1.38333299999999992
1955	\N	\N	EDO	Edremit/korfez	39.5833319999999986	27.0333329999999989
1956	\N	\N	EDQ	Erandique	14.233333	-88.4166639999999973
1957	\N	\N	EDR	Edward River	-14.9000000000000004	141.616669999999999
1958	\N	\N	EDW	Edwards AFB	35	-117.916663999999997
1959	\N	\N	EED	Needles	34.8500000000000014	-114.616669999999999
1960	\N	\N	EEK	Eek	60.2166670000000011	-162.016660000000002
1961	\N	\N	EEN	Dillant-Hopkins	42.9008329999999987	-72.2708360000000027
1962	\N	\N	EFB	Eight Fathom Bight	58	-135.733339999999998
1963	\N	\N	EFD	Ellington Field	29.6000000000000014	-95.1500000000000057
1964	\N	\N	EFG	Efogi	-9.15000000000000036	147.666670000000011
1965	\N	\N	EFK	Newport	44.8894420000000025	-72.230000000000004
1966	\N	\N	EFW	Municipal	42.0166660000000007	-94.3833300000000008
1967	\N	\N	EGA	Engati	-6.91666700000000034	146.099999999999994
1968	\N	\N	EGC	Roumanieres	44.8500000000000014	0.483333000000000013
1969	\N	\N	EGE	Eagle County	39.639879999999998	-106.913470000000004
1970	\N	\N	EGI	Duke Field	30.4833339999999993	-86.5
1971	\N	\N	EGL	Neghelli	5.28333299999999983	39.7166670000000011
1972	\N	\N	EGN	Geneina	13.4875000000000007	22.4694439999999993
1973	\N	\N	EGO	Belgorod	50.6333300000000008	36.6499999999999986
1974	\N	\N	EGP	Maverick Co	28.702223	-100.480549999999994
1975	\N	\N	EGV	Eagle River	45.9291699999999992	-89.265829999999994
1976	\N	\N	EHL	El Bolson	-42	-71.75
1977	\N	\N	EHM	Cape Newenham	58.6472199999999972	-162.060560000000009
1978	\N	\N	EHT	Rentschler	41.7666660000000007	-72.6500000000000057
1979	\N	\N	EIA	Popondetta	-8.11666699999999963	147.633330000000001
1980	\N	\N	EIB	Eisenach	50.9833339999999993	10.483333
1981	\N	\N	EIE	Eniseysk	58.4666670000000011	92.1166699999999992
1982	\N	\N	EIH	Einasleigh	-18.5	144.099999999999994
1983	\N	\N	EIL	Eielson AFB	64.8499999999999943	-147.71665999999999
1984	\N	\N	EIN	Eindhoven	51.4579540000000009	5.39179500000000012
1985	\N	\N	EIS	Beef Island	18.4438899999999997	-64.5427799999999934
1986	\N	\N	EIY	Ein Yahav	30.6333330000000004	35.1833340000000021
1987	\N	\N	EJA	Variguies	7.01583299999999976	-73.7991640000000046
1988	\N	\N	EJT	Enijet	6.08333299999999966	171.949999999999989
1989	\N	\N	EKA	Murray Field	40.8049999999999997	-124.114999999999995
1990	\N	\N	EKB	Ekibastuz	51.5833319999999986	75.2166699999999935
1991	\N	\N	EKD	Elkedra	-21.1499999999999986	135.550000000000011
1992	\N	\N	EKE	Ekereku	5.91666700000000034	-59.8833300000000008
1993	\N	\N	EKI	Municipal	41.7222200000000001	-85.9922260000000023
1994	\N	\N	EKN	Elkins	38.8894420000000025	-79.8577800000000053
1995	\N	\N	EKO	Elko Regional	40.8238899999999987	-115.789720000000003
1996	\N	\N	EKT	Eskilstuna	59.3666699999999992	16.5333329999999989
1997	\N	\N	EKX	Elizabethtown	37.6888900000000007	-85.9277799999999985
1998	\N	\N	ELA	Eagle Lake	29.5833319999999986	-96.3333360000000027
1999	\N	\N	ELB	San Bernado	9.04888900000000085	-73.9741700000000009
2000	\N	\N	ELC	Elcho Island	-12.0198169999999998	135.569799999999987
2001	\N	\N	ELD	Goodwin Field	33.2205539999999999	-92.8147199999999941
2002	\N	\N	ELE	El Real	8.16666700000000034	-77.8333360000000027
2003	\N	\N	ELG	Djamet	30.567499999999999	2.86472199999999999
2004	\N	\N	ELI	Elim	64.6136099999999942	-162.270280000000014
2005	\N	\N	ELJ	El Recreo	2	-73.8333360000000027
2006	\N	\N	ELK	Municipal	35.4166680000000014	-99.4166639999999973
2007	\N	\N	ELL	Ellisras	-23.7166670000000011	27.6833320000000001
2008	\N	\N	ELM	Elmira Corning Regional	42.1630400000000023	-76.895859999999999
2009	\N	\N	ELN	Bowers Field	46.9833339999999993	-120.566665999999998
2010	\N	\N	ELO	Eldorado	-26.5	-54.7333339999999993
2011	\N	\N	ELP	El Paso International Airport	31.7989479999999993	-106.396000000000001
2012	\N	\N	ELQ	Gassim Regional Airport	26.3050290000000011	43.7681770000000014
2013	\N	\N	ELR	Elelim	-3.81666699999999981	140.066669999999988
2014	\N	\N	ELS	East London	-33.0384370000000018	27.8289200000000001
2015	\N	\N	ELT	Tour Sinai City	28.2166670000000011	33.6333300000000008
2016	\N	\N	ELV	Elfin Cove SPB	58.1833340000000021	-136.316669999999988
2017	\N	\N	ELW	Ellamar	60.8999999999999986	-146.233339999999998
2018	\N	\N	ELX	El Tigre	8.88333300000000037	-64.2666700000000048
2019	\N	\N	ELY	Yelland	39.3019450000000035	-114.841939999999994
2020	\N	\N	ELZ	Municipal	42.1166699999999992	-77.9500000000000028
2021	\N	\N	EMA	East Midlands	52.8258700000000019	-1.33059499999999997
2022	\N	\N	EMB	Embarkadero	37.6252799999999965	-122.375
2023	\N	\N	EME	Emden	53.3666699999999992	7.20000000000000018
2024	\N	\N	EMG	Empangeni	-28.75	31.8999999999999986
2025	\N	\N	EMI	Emirau	-1.64999999999999991	149.983339999999998
2026	\N	\N	EML	Emmen	47.0925000000000011	8.30472199999999994
2027	\N	\N	EMM	Kemerer	41.7833329999999989	-110.549999999999997
2028	\N	\N	EMN	Nema	16.6000000000000014	-7.28333299999999983
2029	\N	\N	EMO	Emo	-9.15000000000000036	147.949999999999989
2030	\N	\N	EMP	Emporia	38.3325000000000031	-96.1908339999999953
2031	\N	\N	EMS	Embessa	-9.44999999999999929	148.866669999999999
2032	\N	\N	EMT	El Monte	34.0833319999999986	-118.033330000000007
2033	\N	\N	EMX	El Maiten	-42.0333329999999989	-71.1500000000000057
2034	\N	\N	EMY	El Minya	28.1000000000000014	30.75
2035	\N	\N	ENB	Eneabba West	-30.0833319999999986	114.983329999999995
2036	\N	\N	ENC	Essey	48.6916659999999979	6.23166699999999985
2037	\N	\N	END	Vance AFB	36.3999999999999986	-97.8833300000000008
2038	\N	\N	ENF	Enontekio	68.3499999999999943	23.4166680000000014
2039	\N	\N	ENI	El Nido	11.2055559999999996	119.412779999999998
2040	\N	\N	ENJ	El Naranjo	17.3333319999999986	-90.1666639999999973
2041	\N	\N	ENK	Enniskillen St. Angelo	54.3500000000000014	-7.63333300000000037
2042	\N	\N	ENL	Municipal	38.5166660000000007	-89.1333300000000008
2043	\N	\N	ENN	Municipal	64.5666659999999979	-149.116669999999999
2044	\N	\N	ENO	Teniente Prim Alarcon	-27.25	-55.8333319999999986
2045	\N	\N	ENQ	Coronel E Soto Cano AB	14.3691669999999991	-87.6172260000000023
2046	\N	\N	ENS	Twente	52.2716670000000008	6.87833299999999959
2047	\N	\N	ENT	Enewetak Island	11.5	162.25
2048	\N	\N	ENU	Enugu	6.47204800000000002	7.56771999999999956
2049	\N	\N	ENV	Wendover	40.7333339999999993	-114.033330000000007
2050	\N	\N	ENW	Kenosha Regional Airport	42.5833319999999986	-87.8166659999999979
2051	\N	\N	EOH	Enrique Olaya Herrera International Airport	6.2186659999999998	-75.5863999999999976
2052	\N	\N	EOK	Keokuk	40.4583319999999986	-91.4300000000000068
2053	\N	\N	EOR	El Dorado	6.73333300000000001	-61.8833300000000008
2054	\N	\N	EOS	Neosho	36.8666699999999992	-94.3666699999999992
2055	\N	\N	EOZ	Elorza	7.16666700000000034	-69.5333300000000065
2056	\N	\N	EPA	El Palomar	-34.6083339999999993	-58.6124999999999972
2057	\N	\N	EPG	Browns	40.8666699999999992	-96.1333300000000008
2058	\N	\N	EPH	Ephrata	47.3041699999999992	-119.512500000000003
2059	\N	\N	EPI	Epi	-16.7166670000000011	168.25
2060	\N	\N	EPN	Epena	1.36666700000000008	17.5333329999999989
2061	\N	\N	EPR	Esperance	-33.6824799999999982	121.830389999999994
2062	\N	\N	EPS	Arroyo Barril International	19.25	-69.5
2063	\N	\N	EPT	Eliptamin	-5.03333299999999983	141.666670000000011
2064	\N	\N	EPU	Parnu	58.4188880000000026	24.4727780000000017
2065	\N	\N	EQS	Esquel	-42.9097200000000001	-71.1424999999999983
2066	\N	\N	ERA	Erigavo	10.6166669999999996	47.3999999999999986
2067	\N	\N	ERB	Ernabella	-26.2833329999999989	132.116669999999999
2068	\N	\N	ERC	Erzincan	39.711666000000001	39.5169449999999998
2069	\N	\N	ERD	Berdyansk	46.7333339999999993	36.7833329999999989
2070	\N	\N	ERE	Erave	-6.63333300000000037	143.900000000000006
2071	\N	\N	ERF	Erfurt	50.9749150000000029	10.9611630000000009
2072	\N	\N	ERH	Moulay Ali Cherif	31.9499999999999993	-4.40000000000000036
2073	\N	\N	ERI	International	42.0831400000000002	-80.1820299999999975
2074	\N	\N	ERN	Eirunepe	-6.58333299999999966	-69.8833300000000008
2075	\N	\N	ERO	Coast Guard	-22.6166669999999996	17.0833319999999986
2076	\N	\N	ERR	Errol	44.7833329999999989	-71.1333300000000008
2077	\N	\N	ERT	Erdenet	49.0666659999999979	104.150000000000006
2078	\N	\N	ERU	Erume	-8.41666700000000034	147.083329999999989
2079	\N	\N	ERV	Kerrville	30.0500000000000007	-99.1333300000000008
2080	\N	\N	ERZ	Erzurum Hava Alani	39.9555549999999968	41.1736099999999965
2081	\N	\N	ESB	Esenboga International	40.1149399999999972	32.9931449999999984
2082	\N	\N	ESC	Delta County Airport	45.7205539999999999	-87.086669999999998
2083	\N	\N	ESD	Orcas Island	48.7083319999999986	-122.912499999999994
2084	\N	\N	ESE	Ensenada	31.8666669999999996	-116.616669999999999
2085	\N	\N	ESF	Esler Field	31.3949999999999996	-92.2969400000000064
2086	\N	\N	ESG	Mariscal Estigarribia	-22.0333329999999989	-60.6166699999999992
2087	\N	\N	ESH	Shoreham	50.8333319999999986	-0.299999999999999989
2088	\N	\N	ESI	Espinosa	-15	-44
2089	\N	\N	ESK	Eskisehir	39.7841379999999987	30.5821110000000012
2090	\N	\N	ESN	Easton	38.8027760000000015	-76.0677799999999991
2091	\N	\N	ESO	Espanola	36.1000000000000014	-106.033330000000007
2092	\N	\N	ESP	Birchwood-Pocono	40.9833339999999993	-75.2000000000000028
2093	\N	\N	ESR	El Salvador	-26.3152769999999983	-69.7652800000000042
2094	\N	\N	ESS	Essen	51.403889999999997	6.94166699999999981
2095	\N	\N	EST	Municipal	43.3999999999999986	-94.8333360000000027
2096	\N	\N	ESU	Essaouira	31.3975000000000009	-9.68166699999999913
2097	\N	\N	ESW	State	47.2333339999999993	-121.183334000000002
2098	\N	\N	ETB	West Bend	43.4166680000000014	-88.1833340000000021
2099	\N	\N	ETD	Etadunna	-27.5	138
2100	\N	\N	ETE	Genda Wuha	12.9333329999999993	36.1666680000000014
2101	\N	\N	ETN	Municipal	32.3833300000000008	-98.8333360000000027
2102	\N	\N	ETS	Municipal	31.3166679999999999	-85.8499999999999943
2103	\N	\N	ETZ	Metz-nancy-lorraine	48.9816500000000019	6.24300299999999986
2104	\N	\N	EUA	Kaufana	-21.3770120000000006	-174.95698999999999
2105	\N	\N	EUC	Eucla	-31.7166670000000011	128.866669999999999
2106	\N	\N	EUE	Eureka	39.5	-115.916663999999997
2107	\N	\N	EUF	Weedon Field	31.8999999999999986	-85.1500000000000057
2108	\N	\N	EUG	Eugene	44.1191979999999973	-123.211969999999994
2109	\N	\N	EUM	Neumuenster	54.0666659999999979	9.96666699999999928
2110	\N	\N	EUO	Paratebueno	4.37999999999999989	-73.2000000000000028
2111	\N	\N	EUQ	Evelio Javier	10.7750000000000004	121.941665999999998
2112	\N	\N	EVA	Landing Strip	30.3500000000000014	-94.0666659999999979
2113	\N	\N	EVD	Eva Downs	-18.0166660000000007	134.866669999999999
2114	\N	\N	EVE	Evenes	68.4966660000000047	16.6797220000000017
2115	\N	\N	EVH	Evans Head	-29.1000000000000014	153.416670000000011
2116	\N	\N	EVM	Eveleth	47.4263880000000029	-92.4958340000000021
2117	\N	\N	EVN	Zvartnots International	40.1527200000000022	44.3980499999999978
2118	\N	\N	EVW	Evanston	41.2666660000000007	-110.966669999999993
2119	\N	\N	EVX	Evreux	49.0166660000000007	1.14999999999999991
2120	\N	\N	EWD	Wildman Lake	56.456389999999999	-159.762220000000013
2121	\N	\N	EWE	Ewer	-5.48333300000000001	138.083329999999989
2122	\N	\N	EWI	Enarotali	-3.96666700000000017	136.333329999999989
2123	\N	\N	EWK	City-County	38.0333329999999989	-97.3666699999999992
2124	\N	\N	EWN	Simmons Nott	35.0783419999999992	-77.0346200000000039
2125	\N	\N	EWO	Ewo	-0.883333000000000035	14.8000000000000007
2126	\N	\N	EWR	Newark Liberty International	40.689070000000001	-74.1787599999999969
2127	\N	\N	EXI	SPB	58.4208339999999993	-135.447219999999987
2128	\N	\N	EXM	Exmouth Gulf	-22.25	114.25
2129	\N	\N	EXT	Exeter	50.731110000000001	-3.410968
2130	\N	\N	EYL	Yelimane	15.1333330000000004	-10.5666670000000007
2131	\N	\N	EYR	Yerington	39	-119.25
2132	\N	\N	EYS	Eliye Springs	3.25	35.9666670000000011
2133	\N	\N	EYW	International	24.5535740000000011	-81.7550099999999986
2134	\N	\N	EZS	Elazig	38.6083339999999993	39.2916680000000014
2135	\N	\N	FAA	Faranah	10.0333330000000007	-10.75
2136	\N	\N	FAB	Farnborough	51.2833329999999989	-0.766666999999999987
2137	\N	\N	FAC	Faaite	-16.6833320000000001	-145.333329999999989
2138	\N	\N	FAF	Felker AAF	37.1666680000000014	-76.5999999999999943
2139	\N	\N	FAG	Fagurholsmyri	63.8833300000000008	-16.6499999999999986
2140	\N	\N	FAH	Farah	32.3666699999999992	62.1166699999999992
2141	\N	\N	FAJ	Diego Jimenez Torres	18.3388880000000007	-65.5022199999999941
2142	\N	\N	FAK	False Island	57.5305559999999971	-135.21665999999999
2143	\N	\N	FAL	Falcon State	26.5833319999999986	-99.1333300000000008
2144	\N	\N	FAM	Regional	37.7808339999999987	-90.421670000000006
2145	\N	\N	FAQ	Freida River	-4.61666699999999963	141.958329999999989
2146	\N	\N	FAR	Hector Field	46.9195300000000017	-96.8255099999999942
2147	\N	\N	FAS	Faskrudsfjordur	64.9500000000000028	-14.016667
2148	\N	\N	FAT	Fresno Air Terminal Airport	36.7696230000000028	-119.720240000000004
2149	\N	\N	FAY	Municipal	34.9913200000000018	-78.8872199999999992
2150	\N	\N	FAZ	Fasa	28.9333320000000001	53.7000000000000028
2151	\N	\N	FBD	Faizabad	37.1000000000000014	70.5666659999999979
2152	\N	\N	FBG	Simmons AAF	35.1666680000000014	-79.0166700000000048
2153	\N	\N	FBK	Ft Wainwright	64.8333360000000027	-147.699999999999989
2154	\N	\N	FBL	Municipal	44.2999999999999972	-93.2666700000000048
2155	\N	\N	FBM	Luano	-11.5908329999999999	27.5291670000000011
2156	\N	\N	FBR	Fort Bridger	41.3166659999999979	-110.383330000000001
2157	\N	\N	FBY	Municipal	40.1333300000000008	-97.1833340000000021
2158	\N	\N	FCB	Ficksburg Sentra Oes	-28.8249999999999993	27.9083329999999989
2159	\N	\N	FCH	Fresno-Chandler	36.7333339999999993	-119.783330000000007
2160	\N	\N	FCM	Flying Cloud	44.9833339999999993	-93.2666700000000048
2161	\N	\N	FCN	Cuxhaven/Nordholz	53.7830539999999999	8.66666700000000034
2162	\N	\N	FCS	Butts AAF	38.8333319999999986	-104.816665999999998
2163	\N	\N	FCT	Firing Center AAF	46.6000000000000014	-120.516670000000005
2164	\N	\N	FCY	Municipal	34.9500000000000028	-90.7666700000000048
2165	\N	\N	FDE	Bringeland	61.3917799999999971	5.762073
2166	\N	\N	FDF	Lamentin	14.5960610000000006	-60.9999469999999988
2167	\N	\N	FDK	Frederick Municipal	39.4166680000000014	-77.4166639999999973
2168	\N	\N	FDR	Municipal	34.3833300000000008	-99.0166700000000048
2169	\N	\N	FDU	Bandundu	-3.30555600000000016	17.3833330000000004
2170	\N	\N	FDY	Findlay	41.0333329999999989	-84.5333300000000065
2171	\N	\N	FEA	Fetlar	60.5833319999999986	-0.966667000000000054
2172	\N	\N	FEB	Sanfebagar	29.2333339999999993	81.2166699999999935
2173	\N	\N	FEC	Feira De Santana	-12.2025000000000006	-38.9061129999999977
2174	\N	\N	FEG	Fergana	40.3502769999999984	71.7336099999999988
2175	\N	\N	FEJ	Feijo	-8.15000000000000036	-70.3499999999999943
2176	\N	\N	FEK	Ferkessedougou	9.59999999999999964	-5.20000000000000018
2177	\N	\N	FEL	Fuerstenfeldbruck	48.2000000000000028	11.266667
2178	\N	\N	FEP	Albertus	42.2833329999999989	-89.5999999999999943
2179	\N	\N	FES	San Fernando	36.4666670000000011	-6.18333300000000019
2180	\N	\N	FET	Municipal	41.4333340000000021	-96.5
2181	\N	\N	FEW	Warren AFB	41.1333300000000008	-104.816665999999998
2182	\N	\N	FFA	First Flight	36.0166660000000007	-75.6666639999999973
2183	\N	\N	FFD	RAF Station	51.7333339999999993	-1.78333300000000006
2184	\N	\N	FFL	Municipal	40.9333340000000021	-91.9500000000000028
2185	\N	\N	FFM	Fergus Falls	46.2833329999999989	-96.0666659999999979
2186	\N	\N	FFO	Patterson AFB	39.75	-84.2000000000000028
2187	\N	\N	FFT	Capital City	38.1822200000000009	-84.9050000000000011
2188	\N	\N	FFU	Futaleufu	-43.2000000000000028	-71.8166659999999979
2189	\N	\N	FGD	Fderik	22.6750000000000007	-12.7319440000000004
2190	\N	\N	FGL	Fox Glacier	-43.4666670000000011	170.016660000000002
2191	\N	\N	FGR	Fuengirola	36.5333329999999989	-4.63333300000000037
2192	\N	\N	FGU	Fangatau	-16.0500000000000007	-141.833329999999989
2193	\N	\N	FHU	Municipal	31.5888880000000007	-110.343056000000004
2194	\N	\N	FHZ	Fakahina	-15.9909499999999998	-140.164459999999991
2195	\N	\N	FIC	Fire Cove	55.7777799999999999	-131.537499999999994
2196	\N	\N	FID	Elizabeth Field	41	-72
2197	\N	\N	FIE	Fair Isle	59.5	-1.6666669999999999
2198	\N	\N	FIG	Fria	10.3499999999999996	-13.5666670000000007
2199	\N	\N	FIK	Finke	-25.5666679999999999	134.583329999999989
2200	\N	\N	FIL	Municipal	38.9583319999999986	-112.362499999999997
2201	\N	\N	FIN	Finschhafen	-6.62750000000000039	147.863889999999998
2202	\N	\N	FIV	Five Finger	57.2666660000000007	-133.633330000000001
2203	\N	\N	FIZ	Fitzroy Crossing	-18.1783329999999985	125.554169999999999
2204	\N	\N	FKB	Karlsruhe/Baden-Baden	48.7810330000000008	8.08975200000000072
2205	\N	\N	FKI	Kisangani	0.516666999999999987	25.1999999999999993
2206	\N	\N	FKJ	Fukui	36.139719999999997	136.226670000000013
2207	\N	\N	FKL	Chess-Lambertin	41.3791659999999979	-79.8597199999999958
2208	\N	\N	FKN	Municipal	36.6833340000000021	-76.9333340000000021
2209	\N	\N	FKS	Fukushima Airport	37.226664999999997	140.432790000000011
2210	\N	\N	FLA	Capitolio	1.588889	-75.5588900000000052
2211	\N	\N	FLB	Cangapara	-6.79999999999999982	-43.0333329999999989
2212	\N	\N	FLC	Falls Creek	-36.8333319999999986	143.28334000000001
2213	\N	\N	FLD	Fond Du Lac	43.7716670000000008	-88.4844400000000064
2214	\N	\N	FLE	Fort Lee AAF	37.2166670000000011	-77.4000000000000057
2215	\N	\N	FLF	Schaferhaus	54.7722199999999972	9.38333300000000037
2216	\N	\N	FLH	Flotta	58.5	-3
2217	\N	\N	FLI	Flateyri	65.9833299999999952	-23.6999999999999993
2218	\N	\N	FLJ	Falls Bay	60.0324999999999989	-148.008330000000001
2219	\N	\N	FLM	Filadelfia	-22.3500000000000014	-60.0333329999999989
2220	\N	\N	FLO	Florence	34.1888900000000007	-79.7244400000000013
2221	\N	\N	FLP	Flippin	36.2999999999999972	-92.5833360000000027
2222	\N	\N	FLR	Peretola	43.8021280000000033	11.2019889999999993
2223	\N	\N	FLT	Flat	62.4541660000000007	-157.986660000000001
2224	\N	\N	FLU	Flushing	40.7755549999999971	-73.8344400000000007
2225	\N	\N	FLV	Sherman AAF	39.3666699999999992	-94.9166639999999973
2226	\N	\N	FLX	Municipal	39.4666670000000011	-118.783330000000007
2227	\N	\N	FLY	Finley	-35.6499999999999986	145.583329999999989
2228	\N	\N	FMA	El Pucu	-26.2127780000000001	-58.2349999999999994
2229	\N	\N	FMC	Five Mile	66.9166639999999973	-149.84165999999999
2230	\N	\N	FME	Tipton AAF	39.1038629999999969	-76.8441399999999959
2231	\N	\N	FMG	Flamingo	10.4166670000000003	-85.7833300000000065
2232	\N	\N	FMH	Otis AFB	41.6666680000000014	-70.5499999999999972
2233	\N	\N	FMI	Kalemie	-5.87833299999999959	29.2452770000000015
2234	\N	\N	FMM	Memmingen-Allgäu	47.9886100000000013	10.2394440000000007
2235	\N	\N	FMN	Municipal	36.741109999999999	-108.229163999999997
2236	\N	\N	FMS	Municipal	40.6588899999999995	-91.3275000000000006
2237	\N	\N	FNB	Neubrandenburg	53.6027800000000028	13.3072219999999994
2238	\N	\N	FNC	Madeira	32.6931229999999999	-16.7756350000000012
2239	\N	\N	FNE	Fane	-8.59999999999999964	147.233339999999998
2240	\N	\N	FNG	Fada Ngourma	12.0666670000000007	0.349999999999999978
2241	\N	\N	FNH	Fincha	9.58333299999999966	37.4333340000000021
2242	\N	\N	FNK	Fin Creek	69.5	-147.583329999999989
2243	\N	\N	FNL	Municipalcipal Airport	40.5833319999999986	-105.083336000000003
2244	\N	\N	FNR	SPB	58.3333319999999986	-134.583329999999989
2245	\N	\N	FNT	Bishop International Airport	42.9738120000000023	-83.7389100000000042
2246	\N	\N	FOA	Foula	60.1666680000000014	-2.0833330000000001
2247	\N	\N	FOB	Fort Bragg	39.4744450000000029	-123.794439999999994
2248	\N	\N	FOC	Fuzhou	25.9312299999999993	119.669229999999999
2249	\N	\N	FOD	Fort Dodge Regional	42.552500000000002	-94.1897199999999941
2250	\N	\N	FOG	Gino Lisa	41.4339900000000014	15.5443669999999994
2251	\N	\N	FOK	Suffolk County	40.8333319999999986	-72.6666639999999973
2252	\N	\N	FOM	Foumban	5.75	10.8333329999999997
2253	\N	\N	FOO	Numfoor	-1.05000000000000004	134.900000000000006
2254	\N	\N	FOP	Morris AAF	33.6166699999999992	-84.3666699999999992
2255	\N	\N	FOR	Pinto Martins	-3.7790729999999999	-38.5408359999999988
2256	\N	\N	FOS	Forrest	-30.8166679999999999	128.050000000000011
2257	\N	\N	FOT	Forster	-32.1833340000000021	151.516660000000002
2258	\N	\N	FOU	Fougamou	-1.19999999999999996	10.7833330000000007
2259	\N	\N	FOX	Fox	64	-147
2260	\N	\N	FOY	Foya	8.36666699999999963	-10.2166669999999993
2261	\N	\N	FPR	St Lucie County	27.4499999999999993	-80.3333360000000027
2262	\N	\N	FPY	Perry-Foley	30.1166669999999996	-83.5833360000000027
2263	\N	\N	FRB	Forbes	-33.3999999999999986	148.050000000000011
2264	\N	\N	FRC	Franca	-20.5519449999999999	-47.4375
2265	\N	\N	FRE	Fera Island	-8.09999999999999964	159.583329999999989
2266	\N	\N	FRG	Republic Field	40.7333339999999993	-73.4166639999999973
2267	\N	\N	FRH	Municipal	38.5499999999999972	-86.6166699999999992
2268	\N	\N	FRI	Marshall AAF	39.0833319999999986	-96.7833300000000065
2269	\N	\N	FRK	Fregate Island	-4.58333299999999966	55.9666670000000011
2270	\N	\N	FRL	Luigi Ridolfi	44.1985699999999966	12.0707599999999999
2271	\N	\N	FRM	Fairmont	43.6472199999999972	-94.4236149999999981
2272	\N	\N	FRN	Bryant AAF	61.25	-149.683330000000012
2273	\N	\N	FRP	Fresh Water Bay	57.8458329999999989	-135.025000000000006
2274	\N	\N	FRQ	Feramin	-5.41666700000000034	141.699999999999989
2275	\N	\N	FRR	Front Royal-Warren County	38.9166680000000014	-78.2000000000000028
2276	\N	\N	FRS	Santa Elena	16.9166680000000014	-89.8833300000000008
2277	\N	\N	FRT	Frutillar	-41.125	-73.0652800000000013
2278	\N	\N	FRU	Manas (Bishkek)	43.0535799999999966	74.4694499999999948
2279	\N	\N	FRW	Francistown	-21.1600000000000001	27.4825000000000017
2280	\N	\N	FRY	Fryeburg	44.0166660000000007	-70.9833299999999952
2281	\N	\N	FRZ	Fritzlar Airbase	51.1166699999999992	9.26666699999999999
2282	\N	\N	FSC	Sud Corse	41.4986340000000027	9.09822300000000084
2283	\N	\N	FSD	Joe Foss Field Airport	43.580295999999997	-96.7311499999999995
2284	\N	\N	FSI	Henry Post AAF	34.6507229999999993	-98.4199749999999938
2285	\N	\N	FSK	Municipal	37.8333319999999986	-94.7000000000000028
2286	\N	\N	FSL	Fossil Downs	-18.1999999999999993	125.799999999999997
2287	\N	\N	FSM	Regional	35.3412399999999991	-94.3589000000000055
2288	\N	\N	FSN	Haley AAF	42.1499999999999986	-87.9666699999999935
2289	\N	\N	FSP	Saint-pierre Pointe-blanche	46.9166680000000014	-56.1666680000000014
2290	\N	\N	FSS	Kinloss	57.6499999999999986	-3.56666699999999981
2291	\N	\N	FST	Pecos County	30.8938880000000005	-102.878889999999998
2292	\N	\N	FSU	Fort Sumner	34.4666670000000011	-104.25
2293	\N	\N	FTA	Futuna Airport	-19.4166680000000014	170.25
2294	\N	\N	FTE	El Calafate	-50.2842249999999993	-72.0536960000000022
2295	\N	\N	FTI	Fitiuta	-14.2166669999999993	-169.449999999999989
2296	\N	\N	FTK	Godman AAF	37.8999999999999986	-85.9500000000000028
2297	\N	\N	FTL	Fortuna Ledge	61.8833300000000008	-162.083329999999989
2298	\N	\N	FTW	Meacham Field	32.75	-97.3333360000000027
2299	\N	\N	FTX	Owando	-0.983333000000000013	16.0083330000000004
2300	\N	\N	FTY	Fulton County	33.7833329999999989	-84.5166700000000048
2301	\N	\N	FUB	Fulleborn	-6.06666699999999981	150.650000000000006
2302	\N	\N	FUL	Municipal	33.8666699999999992	-117.974999999999994
2303	\N	\N	FUM	Fuma	-6.38333300000000037	142.433330000000012
2304	\N	\N	FUN	International	-8.51666699999999999	179.208329999999989
2305	\N	\N	FVL	Flora Valey	-18.2833329999999989	128.416670000000011
2306	\N	\N	FVR	Forrest River Airport	-15.2530560000000008	127.833336000000003
2307	\N	\N	FWA	Municipal/Baer Field	40.9866600000000005	-85.1877099999999956
2308	\N	\N	FWH	Fort Worth NAS Jrb/Carswell Field	32.7638900000000035	-97.2999999999999972
2309	\N	\N	FWL	Farewell	62.5097239999999985	-153.889450000000011
2310	\N	\N	FWM	Heliport	56.8166659999999979	-5.11666699999999963
2311	\N	\N	FXM	Flaxman Island	70.2000000000000028	-146
2312	\N	\N	FXO	Cuamba	-14.8052779999999995	36.5269430000000028
2313	\N	\N	FXY	Municipal	43.2666660000000007	-93.6500000000000057
2314	\N	\N	FYM	Municipal	35.1499999999999986	-86.5666659999999979
2315	\N	\N	FYT	Faya	17.9166680000000014	19.1166669999999996
2316	\N	\N	FYU	Fort Yukon	66.5698100000000039	-145.248199999999997
2317	\N	\N	FYV	Municipal (Drake Field)	36.0036130000000014	-94.1700000000000017
2318	\N	\N	FZO	Filton	51.5166660000000007	-2.5833330000000001
2319	\N	\N	GAA	Guamal	9.15000000000000036	-74.2333299999999952
2320	\N	\N	GAB	Gabbs	38.8666699999999992	-117.916663999999997
2321	\N	\N	GAC	Gracias	14.5966670000000001	-88.5938900000000018
2322	\N	\N	GAD	Municipal	33.9736100000000008	-86.0872200000000021
2323	\N	\N	GAE	Gabes	33.8833300000000008	10.0333330000000007
2324	\N	\N	GAF	Gafsa	34.4166680000000014	8.8166670000000007
2325	\N	\N	GAG	Gage	36.3500000000000014	-99.8833300000000008
2326	\N	\N	GAH	Gayndah	-25.4333320000000001	151.483339999999998
2327	\N	\N	GAI	Montgomery County	39.1499999999999986	-77.2000000000000028
2328	\N	\N	GAK	Gakona	62.3333319999999986	-145.316669999999988
2329	\N	\N	GAL	Galena	64.7379799999999932	-156.941859999999991
2330	\N	\N	GAN	Gan Airport	-0.690003000000000033	73.1565400000000068
2331	\N	\N	GAO	Los Canos	20.0847230000000003	-75.1586099999999959
2332	\N	\N	GAP	Gusap	-6.5	146.333329999999989
2333	\N	\N	GAQ	Gao	16.2486110000000004	-0.00138900000000000004
2334	\N	\N	GAR	Garaina	-7.87333299999999969	147.137499999999989
2335	\N	\N	GAS	Garissa	-0.450000000000000011	39.6499999999999986
2336	\N	\N	GAT	Tallard	44.5499999999999972	6.08333299999999966
2337	\N	\N	GAU	Borjhar	26.1059820000000009	91.5888099999999952
2338	\N	\N	GAV	Gag Island	-26	130.883330000000001
2339	\N	\N	GAW	Gangaw	22.1666680000000014	94.1333300000000008
2340	\N	\N	GAX	Gamba	-2.76666699999999999	9.98333300000000001
2341	\N	\N	GAZ	Guasopa	-9.19999999999999929	152.933330000000012
2342	\N	\N	GBA	Big Bay	-15	166
2343	\N	\N	GBC	Gasuke	-6.09999999999999964	141.733339999999998
2344	\N	\N	GBD	Great Bend	38.3472200000000001	-98.8641700000000014
2345	\N	\N	GBF	Negarbo	-6.58333299999999966	144.666670000000011
2346	\N	\N	GBG	Galesburg	40.9386099999999971	-90.4288899999999956
2347	\N	\N	GBH	Galbraith Lake	68.4666699999999935	-149.483339999999998
2348	\N	\N	GBI	Auxiliary Airfield	26.6666680000000014	-78.5
2349	\N	\N	GBJ	Les Bases	15.8666669999999996	-61.2666660000000007
2350	\N	\N	GBK	Gbangbatok	7.79999999999999982	-12.3666669999999996
2351	\N	\N	GBL	Goulburn Island	-11.5500000000000007	133.433330000000012
2352	\N	\N	GBM	Garbaharey	3.3333330000000001	42.1833340000000021
2353	\N	\N	GBN	San Giovanni Rotondo	41.701667999999998	15.730556
2354	\N	\N	GBO	Baltimore Greenbelt T	39.2666660000000007	-76.75
2355	\N	\N	GBP	Gamboola	-16.5500000000000007	143.666670000000011
2356	\N	\N	GBR	Walter J. Koladza Airport	42.2000000000000028	-73.3666699999999992
2357	\N	\N	GBS	Port Fitzroy	-36.1333300000000008	175.333329999999989
2358	\N	\N	GBT	Gorgan	36.9085099999999997	54.4105149999999966
2359	\N	\N	GBU	Khashm El Girba	14.9263890000000004	35.8888900000000035
2360	\N	\N	GBV	Gibb River	-15.6500000000000004	126.633330000000001
2361	\N	\N	GCA	Guacamaya	2.31666699999999981	-75.5
2362	\N	\N	GCC	Campbell County	44.3463550000000026	-105.532684000000003
2363	\N	\N	GCH	Gachsaran	30.3333319999999986	50.8166659999999979
2364	\N	\N	GCI	Guernsey	49.4327550000000002	-2.59504400000000013
2365	\N	\N	GCJ	Grand Central	-26.2333339999999993	28.1499999999999986
2366	\N	\N	GCN	National Park	35.9519420000000025	-112.147499999999994
2367	\N	\N	GCV	Gravatai	-29.9416679999999999	-50.9941669999999974
2368	\N	\N	GCY	Municipal	36.2166670000000011	-82.8499999999999943
2369	\N	\N	GDA	Gounda	9.33333299999999966	21.1666680000000014
2370	\N	\N	GDC	Donaldson Center	34.7999999999999972	-82.3499999999999943
2371	\N	\N	GDD	Gordon Downs	-18.7166670000000011	128.550000000000011
2372	\N	\N	GDE	Gode/Iddidole	5.90222200000000008	43.6283340000000024
2373	\N	\N	GDG	Magdagachi	53.4666670000000011	125.799999999999997
2374	\N	\N	GDH	Golden Horn Lodge SPB	59.7166670000000011	-158.166670000000011
2375	\N	\N	GDI	Gordil	9.73333300000000001	21.5833319999999986
2376	\N	\N	GDJ	Gandajika	-6.76666699999999999	23.9666670000000011
2377	\N	\N	GDM	Municipal	42.5666659999999979	-71.9833299999999952
2378	\N	\N	GDN	Lech Walesa	54.3809779999999989	18.4686549999999983
2379	\N	\N	GDO	Vare Maria	7.23333300000000001	-70.7999999999999972
2380	\N	\N	GDP	Guadalupe	-6.78194400000000019	-43.5816700000000026
2381	\N	\N	GDQ	Gondar	12.5144439999999992	37.4455570000000009
2382	\N	\N	GDV	Dawson Community	47.1388900000000035	-104.806945999999996
2383	\N	\N	GDW	Gladwin	43.9833339999999993	-84.4833299999999952
2384	\N	\N	GDX	Magadan	59.9166680000000014	150.71665999999999
2385	\N	\N	GDZ	Gelendzik	44.5666659999999979	38.0166660000000007
2386	\N	\N	GEB	Gebe	0.0833330000000000043	129.416670000000011
2387	\N	\N	GEC	Gecitkale	35.2333339999999993	33.7166670000000011
2388	\N	\N	GED	Sussex County	38.6883300000000006	-75.3575000000000017
2389	\N	\N	GEE	George Town	-18.2833329999999989	143.550000000000011
2390	\N	\N	GEF	Geva Airstrip	-7.57833299999999976	156.59778
2391	\N	\N	GEG	Spokane International	47.6251499999999979	-117.537636000000006
2392	\N	\N	GEI	Green Islands	-4.5	154.166670000000011
2393	\N	\N	GEK	Ganes Creek	63.1000000000000014	-156.433330000000012
2394	\N	\N	GEL	Sepe Tiaraju	-28.2811100000000017	-54.168056
2395	\N	\N	GEN	Oslo - Gardermoen Airport	37.3833300000000008	-4.76666699999999999
2396	\N	\N	GEO	Cheddi Jagan International	6.5038330000000002	-58.2530799999999971
2397	\N	\N	GER	Rafael Cabrera	21.8374999999999986	-82.7800000000000011
2398	\N	\N	GET	Geraldton	-28.7960780000000014	114.70205
2399	\N	\N	GEV	Gallivare	67.1344449999999995	20.8166679999999999
2400	\N	\N	GEW	Gewoia	-9.30000000000000071	148.46665999999999
2401	\N	\N	GEX	Geelong	-38.1333300000000008	144.349999999999994
2402	\N	\N	GEY	South Big Horn County	44.5	-108.049999999999997
2403	\N	\N	GFA	Malmstrom AFB	47.5	-111.283330000000007
2404	\N	\N	GFB	Togiak Fish	59.0166660000000007	-160.050000000000011
2405	\N	\N	GFD	Pope Field	39.7833329999999989	-85.7666700000000048
2406	\N	\N	GFE	Grenfell	-33.8999999999999986	148.183330000000012
2407	\N	\N	GFK	Grand Forks	47.9487999999999985	-97.1758700000000033
2408	\N	\N	GFL	Warren County	43.3444440000000029	-73.609170000000006
2409	\N	\N	GFO	Bartica	6.41666700000000034	-58.5833319999999986
2410	\N	\N	GFR	Granville	48.8833300000000008	-1.56666700000000003
2411	\N	\N	GFY	Grootfontein	-19.6000000000000014	18.1333330000000004
2412	\N	\N	GGC	Lumbala	-12.6500000000000004	22.5666679999999999
2413	\N	\N	GGD	Gregory Downs	-18.6333330000000004	139.233339999999998
2414	\N	\N	GGE	Georgetown	33.3833300000000008	-79.2833300000000065
2415	\N	\N	GGL	Gilgal	8.33333299999999966	-77.0833360000000027
2416	\N	\N	GGN	Gagnoa	6.13333300000000037	-5.93333300000000019
2417	\N	\N	GGO	Guiglo	6.33333299999999966	-7.75
2418	\N	\N	GGR	Garoe	8.28333300000000072	48.3333319999999986
2419	\N	\N	GGS	Gobernador Gregores	-48.7666660000000007	-70.25
2420	\N	\N	GGT	Exuma International	23.5640180000000008	-75.8724749999999943
2421	\N	\N	GGW	International	48.2127759999999981	-106.615555000000001
2422	\N	\N	GHC	Great Harbour	25.7380560000000003	-77.840280000000007
2423	\N	\N	GHE	Garachine	8.03333300000000072	-78.25
2424	\N	\N	GHF	Giebelstadt	49.6499999999999986	9.96666699999999928
2425	\N	\N	GHM	Municipal	35.7833329999999989	-87.4666699999999935
2426	\N	\N	GHN	Guanghan	30.4666670000000011	106.650000000000006
2427	\N	\N	GHU	Gualeguaychu	-33.0041659999999979	-58.6122200000000007
2428	\N	\N	GIB	North Front	36.1537629999999979	-5.34927099999999989
2429	\N	\N	GIC	Boigu Island	-9.23333300000000001	142.21665999999999
2430	\N	\N	GID	Gitega	-3.4166669999999999	29.9166680000000014
2431	\N	\N	GIF	Gilbert Field	28.0666679999999999	-81.75
2432	\N	\N	GII	Siguiri	11.516667	-9.16666700000000034
2433	\N	\N	GIM	Miele Mimbale	-0.0166670000000000013	11.4000000000000004
2434	\N	\N	GIR	Girardot	4.29999999999999982	-74.7999999999999972
2435	\N	\N	GIS	Gisborne	-38.6619340000000022	177.982280000000003
2436	\N	\N	GIT	Geita	-2.79999999999999982	32.2000000000000028
2437	\N	\N	GIU	Sigiriya Slaf Base	7.95640839999999994	80.7595754000000028
2438	\N	\N	GIY	Giyani	-23.2833329999999989	30.6666680000000014
2439	\N	\N	GIZ	Jazan	16.8989490000000018	42.5823439999999991
2440	\N	\N	GJM	Guajara-Mirim	-10.7833330000000007	-65.3666699999999992
2441	\N	\N	GJR	Gjogur	65.9833299999999952	-21.3500000000000014
2442	\N	\N	GKA	Goroka	-6.07524399999999964	145.392930000000007
2443	\N	\N	GKE	Geilenkirchen	50.9666670000000011	6.13333300000000037
2444	\N	\N	GKH	Gorkha	28	84.6749999999999972
2445	\N	\N	GKL	Great Keppel Island	-23.1833320000000001	150.941669999999988
2446	\N	\N	GKN	Gulkana	62.1552769999999981	-145.452220000000011
2447	\N	\N	GKO	Kongoboumba	-0.0833330000000000043	11.4666669999999993
2448	\N	\N	GKT	Gatlinburg	35.8513900000000021	-83.5186099999999954
2449	\N	\N	GLC	Geladi	6.96666700000000017	46.4166680000000014
2450	\N	\N	GLD	Renner Field	39.3702770000000015	-101.699449999999999
2451	\N	\N	GLE	Municipal	33.6333300000000008	-97.1333300000000008
2452	\N	\N	GLF	Golfito	8.651389	-83.1808300000000003
2453	\N	\N	GLG	Glengyle	-24.8166679999999999	139.599999999999994
2454	\N	\N	GLH	Greenville	33.4844440000000034	-90.9849999999999994
2455	\N	\N	GLI	Glen Innes	-29.6766660000000009	151.690830000000005
2456	\N	\N	GLL	Klanten Airport	60.7000000000000028	8.94999999999999929
2457	\N	\N	GLM	Glenormiston	-22.9166680000000014	138.833329999999989
2458	\N	\N	GLN	Goulimime	29.0166660000000007	-10.0666670000000007
2459	\N	\N	GLP	Gulgubip	-5.28333299999999983	141.516660000000002
2460	\N	\N	GLQ	Glennallen	62.1166699999999992	-145.550000000000011
2461	\N	\N	GLR	Otsego County	45.0333329999999989	-84.6666639999999973
2462	\N	\N	GLS	Scholes Field	29.2674999999999983	-94.8602750000000015
2463	\N	\N	GLT	Gladstone	-23.8714699999999986	151.223510000000005
2464	\N	\N	GLW	Municipal	37	-85.9166639999999973
2465	\N	\N	GLX	Galela	1.8333330000000001	127.833336000000003
2466	\N	\N	GLY	Goldsworthy	-20.0833319999999986	119.666663999999997
2467	\N	\N	GLZ	Gilze-Rijen	51.5833319999999986	4.75
2468	\N	\N	GMA	Gemena	3.23499999999999988	19.768612000000001
2469	\N	\N	GMB	Gambela	8.28333300000000072	34.5833319999999986
2470	\N	\N	GMC	Guerima	49.4333340000000021	-2.60000000000000009
2471	\N	\N	GME	Gomel	52.4166680000000014	31
2472	\N	\N	GMI	Gasmata Island	-6.29999999999999982	150.333329999999989
2473	\N	\N	GMM	Gamboma	-1.93333299999999997	15.8666669999999996
2474	\N	\N	GMN	Greymouth	-42.4500000000000028	171.199999999999989
2475	\N	\N	GMR	Gambier Island	-23.0839999999999996	-134.887570000000011
2476	\N	\N	GMS	Guimaraes	-2.14999999999999991	-44.7000000000000028
2477	\N	\N	GMT	Granite Mountain	65.4055560000000042	-161.277500000000003
2478	\N	\N	GMU	Greenville Downtown	34.8500000000000014	-82.3833300000000008
2479	\N	\N	GMV	Monument Valley	37.0019449999999992	-110.202780000000004
2480	\N	\N	GNA	Grodna	53.6666680000000014	23.8000000000000007
2481	\N	\N	GNG	Gooding	42.9333340000000021	-114.716669999999993
2482	\N	\N	GNM	Guanambi	-14.3000000000000007	-42.7833329999999989
2483	\N	\N	GNN	Ghinnir	7.15000000000000036	40.7166670000000011
2484	\N	\N	GNR	General Roca	-39.9833339999999993	-67.5999999999999943
2485	\N	\N	GNS	Binaka	1.25	97.5
2486	\N	\N	GNT	Milan	35.1499999999999986	-107.866669999999999
2487	\N	\N	GNU	Goodnews Bay	59.1124999999999972	-161.580549999999988
2488	\N	\N	GNZ	Ghanzi	-21.6999999999999993	21.6666680000000014
2489	\N	\N	GOB	Goba	7.01388899999999982	39.980556
2490	\N	\N	GOC	Gora	-9.16666700000000034	148.816669999999988
2491	\N	\N	GOE	Gonalia	-5.36666699999999963	151.849999999999994
2492	\N	\N	GOF	Goodfellow AFB	31.4666670000000011	-100.433334000000002
2493	\N	\N	GOG	Gobabis	-22.5047229999999985	18.9747219999999999
2494	\N	\N	GOH	Nuuk	64.1819459999999964	-51.7250000000000014
2495	\N	\N	GOI	Goa International	15.3845340000000004	73.8398300000000063
2496	\N	\N	GOK	Guthrie	35.8833300000000008	-97.4166639999999973
2497	\N	\N	GOL	State	42.4166680000000014	-124.416663999999997
2498	\N	\N	GON	New London	41.3288879999999992	-72.0463900000000024
2499	\N	\N	GOO	Goondiwindi	-28.5244450000000001	150.319439999999986
2500	\N	\N	GOP	Gorakhpur	26.7468620000000001	83.4437599999999975
2501	\N	\N	GOR	Gore	8.15555600000000069	35.5380549999999999
2502	\N	\N	GOS	Gosford	-33.4333340000000021	151.349999999999994
2503	\N	\N	GOT	Landvetter	57.666640000000001	12.2948780000000006
2504	\N	\N	GOY	Amparai	7.33333299999999966	81.6166699999999992
2505	\N	\N	GOZ	Gorna Oriahovitsa	43.1166699999999992	25.6666680000000014
2506	\N	\N	GPA	Araxos Airport	38.25	21.7333339999999993
2507	\N	\N	GPB	Tancredo Thomaz Faria	-25.3333319999999986	-51.5
2508	\N	\N	GPL	Guapiles	10.1999999999999993	-83.7999999999999972
2509	\N	\N	GPN	Garden Point	-11.766667	130.016660000000002
2510	\N	\N	GPO	General Pico	-35.6333300000000008	-63.7666660000000007
2511	\N	\N	GQQ	Galion	40.7366680000000017	-82.7572250000000054
2512	\N	\N	GRA	Gamarra	8.33333299999999966	-73.7000000000000028
2513	\N	\N	GRB	Austin-straubel Field	44.4928469999999976	-88.121894999999995
2514	\N	\N	GRC	Grand Cess	4.59999999999999964	-8.16666700000000034
2515	\N	\N	GRD	Greenwood	34.2513900000000007	-82.1583300000000065
2516	\N	\N	GRE	Municipal	38.8833300000000008	-89.4166639999999973
2517	\N	\N	GRF	Gray AAF	47.0833319999999986	-122.579170000000005
2518	\N	\N	GRG	Gardez	33.6166699999999992	69.1166699999999992
2519	\N	\N	GRH	Garuahi	-10.2249999999999996	150.550000000000011
2520	\N	\N	GRI	Grand Island	40.9672199999999975	-98.3066599999999937
2521	\N	\N	GRJ	George	-34.0014800000000008	22.3822350000000014
2522	\N	\N	GRL	Garasa	-7.95000000000000018	147.183330000000012
2523	\N	\N	GRM	Devils Track	46.6666680000000014	-85.9833299999999952
2524	\N	\N	GRN	Gordon	42.7999999999999972	-102.200000000000003
2525	\N	\N	GRO	Girona-Costa Brava	41.8980400000000017	2.76638299999999981
2526	\N	\N	GRP	Gurupi	-11.6666670000000003	-49.2166670000000011
2527	\N	\N	GRS	Baccarini	42.7619439999999997	11.0705559999999998
2528	\N	\N	GRT	Gujrat	32.6666680000000014	74.0333300000000065
2529	\N	\N	GRV	Groznyj	43.3333319999999986	45.75
2530	\N	\N	GRY	Grimsey	66.5666659999999979	-18.0166660000000007
2531	\N	\N	GRZ	Thalerhof	46.9941249999999968	15.4449280000000009
2532	\N	\N	GSA	Long Pasia	4.41666700000000034	115.766670000000005
2533	\N	\N	GSB	Seymour Johnson AFB	35.3833300000000008	-77.9833299999999952
2534	\N	\N	GSC	Gascoyne Junction	-25.1666680000000014	115.25
2535	\N	\N	GSE	Gothenburg City Airport	57.7777499999999975	11.8645130000000005
2536	\N	\N	GSH	Goshen	41.5833319999999986	-85.8333360000000027
2537	\N	\N	GSI	Guadalcanal	-9.53333300000000072	160.199999999999989
2538	\N	\N	GSL	Taltheilei Narrows	62.5974999999999966	-111.544439999999994
2539	\N	\N	GSM	Gheshm	26.7577779999999983	55.9052769999999981
2540	\N	\N	GSN	Mount Gunson	-31.6666680000000014	137.766660000000002
2541	\N	\N	GSO	Piedmont Triad International	36.1053240000000031	-79.9372999999999934
2542	\N	\N	GSQ	Shark Elowainat	22.5833319999999986	28.7166670000000011
2543	\N	\N	GSR	Gardo	9.5	49.0499999999999972
2544	\N	\N	GSS	Sabi Sabi	-25.1166669999999996	30.8000000000000007
2545	\N	\N	GST	Gustavus Airport	58.427500000000002	-135.705000000000013
2546	\N	\N	GSU	Gedaref	14.0333330000000007	35.4666670000000011
2547	\N	\N	GSY	Binbrook	53.5833319999999986	-0.0833330000000000043
2548	\N	\N	GTA	Gatokae Aerodrom	-8.76666699999999999	158.183330000000012
2549	\N	\N	GTB	Genting	2.11666700000000008	111.700000000000003
2550	\N	\N	GTC	Green Turtle	26.25	-77.3666699999999992
2551	\N	\N	GTE	Alyangula	-13.9738869999999995	136.460019999999986
2552	\N	\N	GTF	International	47.4818879999999979	-111.356359999999995
2553	\N	\N	GTG	Municipal	45.7833329999999989	-92.6833340000000021
2554	\N	\N	GTI	Guettin	54.3833300000000008	12.3166670000000007
2555	\N	\N	GTK	Sungei Tekai	2.60000000000000009	102.916663999999997
2556	\N	\N	GTN	Glentanner	-43.7666660000000007	170.136110000000002
2557	\N	\N	GTS	Granites	-26.9666670000000011	133.616669999999999
2558	\N	\N	GTT	Georgetown	-18.4166680000000014	143.78334000000001
2559	\N	\N	GTW	Holesov	49.2000000000000028	17.5166660000000007
2560	\N	\N	GTY	Gettysburg	39.8333319999999986	-77.2333299999999952
2561	\N	\N	GUA	La Aurora	14.5880709999999993	-90.5306800000000038
2562	\N	\N	GUB	Guerrero Negro	28.0333329999999989	-114.066665999999998
2563	\N	\N	GUC	Gunnison	38.5338899999999995	-106.938890000000001
2564	\N	\N	GUD	Goundam	16.3575000000000017	-3.6097220000000001
2565	\N	\N	GUE	Guriaso	-3.5833330000000001	141.583329999999989
2566	\N	\N	GUF	Edwards	30.1666680000000014	-87.5833360000000027
2567	\N	\N	GUG	Guari	-8.51666699999999999	146.900000000000006
2568	\N	\N	GUH	Gunnedah	-30.9499999999999993	150.233339999999998
2569	\N	\N	GUI	Guiria	10.5666670000000007	-62.2999999999999972
2570	\N	\N	GUJ	Guaratingueta	-22.8166679999999999	-45.2166670000000011
2571	\N	\N	GUL	Goulburn	-34.75	149.71665999999999
2572	\N	\N	GUM	Guam International	13.4927869999999999	144.804859999999991
2573	\N	\N	GUN	Gunter AFB	32.3833300000000008	-86.3166659999999979
2574	\N	\N	GUO	Gualaco	15.1166669999999996	-86.1333300000000008
2575	\N	\N	GUP	Senator Clark	35.5111119999999971	-108.786670000000001
2576	\N	\N	GUQ	Guanare	9.02527800000000013	-69.75
2577	\N	\N	GUS	Grissom AFB	40.75	-86.0666659999999979
2578	\N	\N	GUT	Guetersloh	51.8999999999999986	8.38333300000000037
2579	\N	\N	GUU	Grundarfjordur	64.9666699999999935	-23.1666680000000014
2580	\N	\N	GUV	Mougulu	-6.28333299999999983	142.416670000000011
2581	\N	\N	GUW	Atyrau International	47.1228139999999982	51.8295559999999966
2582	\N	\N	GUX	Guna	24.6666680000000014	77.3166659999999979
2583	\N	\N	GUY	Guymon	36.6827770000000015	-101.507773999999998
2584	\N	\N	GUZ	Guarapari	-20.6499999999999986	-40.4916699999999992
2585	\N	\N	GVE	Municipal	38.1333300000000008	-78.2000000000000028
2586	\N	\N	GVI	Green River	-3.96666700000000017	141.150000000000006
2587	\N	\N	GVL	Lee Gilmer Memorial	34.2999999999999972	-83.8333360000000027
2588	\N	\N	GVP	Greenvale	-15.7833330000000007	144.616669999999999
2589	\N	\N	GVT	Majors Field	33.0666659999999979	-96.0616700000000066
2590	\N	\N	GVW	Richards-Gebaur	38.8833300000000008	-94.5333300000000065
2591	\N	\N	GVX	Sandviken	60.5938870000000023	16.9547209999999993
2592	\N	\N	GWA	Gwa	21	94
2593	\N	\N	GWE	Gweru	-19.4358329999999988	29.86111
2594	\N	\N	GWL	Gwalior	26.293887999999999	78.230000000000004
2595	\N	\N	GWN	Gnarowein	-6.56666699999999981	146.25
2596	\N	\N	GWO	Leflore	33.4949999999999974	-90.0888900000000064
2597	\N	\N	GWS	Glenwood Springs	39.5831680000000006	-107.414410000000004
2598	\N	\N	GWT	Westerland - Sylt	54.9152800000000028	8.34305600000000069
2599	\N	\N	GWV	Glendale	43.1166699999999992	-87.9500000000000028
2600	\N	\N	GWY	Carnmore	53.2833329999999989	-9.03333300000000072
2601	\N	\N	GXG	Negage	-7.78333299999999983	15.4499999999999993
2602	\N	\N	GXQ	Ten. Vidal	-45.5888899999999992	-72.0986099999999936
2603	\N	\N	GXX	Yagoua	10.358333	15.2375000000000007
2604	\N	\N	GXY	Weld County	40.4166680000000014	-104.700000000000003
2605	\N	\N	GYA	Guayaramerin	-10.8300000000000001	-65.3616640000000046
2606	\N	\N	GYE	Jose Joaquin De Olmedo	-2.14265399999999984	-79.8803199999999975
2607	\N	\N	GYI	Gisenyi	-1.68333299999999997	29.25
2608	\N	\N	GYL	Argyle	-16.3333319999999986	128.666670000000011
2609	\N	\N	GYM	Gen Jose M Yanez	27.9555569999999989	-110.93056
2610	\N	\N	GYP	Gympie	-26.1833320000000001	152.633330000000001
2611	\N	\N	GYR	Litchfield	33.4333340000000021	-112.349999999999994
2612	\N	\N	GZA	Gaza - Yaser Arafat International Airport	31.2463900000000017	34.2761100000000027
2613	\N	\N	GZI	Ghazni	33	68.4166639999999973
2614	\N	\N	GZM	Gozo Heliport	36.0416680000000014	14.2083329999999997
2615	\N	\N	GZP	Gazipasa Airport	36.2993000000000023	32.301400000000001
2616	\N	\N	GZT	Gaziantep	36.944935000000001	37.473747000000003
2617	\N	\N	GZW	Ghazvin	36.2333339999999993	50.0333329999999989
2618	\N	\N	HAB	Marion County	34.1499999999999986	-88.0999999999999943
2619	\N	\N	HAC	Hachijo Jima	33.1179470000000009	139.78121999999999
2620	\N	\N	HAD	Halmstad	56.6809349999999981	12.8150049999999993
2621	\N	\N	HAE	Havasupai	36.230556	-112.669439999999994
2622	\N	\N	HAF	Half Moon	37.4666670000000011	-122.433334000000002
2623	\N	\N	HAI	Dr Haines	41.9500000000000028	-85.6333300000000008
2624	\N	\N	HAJ	Hanover Airport	52.4592549999999989	9.69476599999999955
2625	\N	\N	HAK	Haikou	19.9416119999999992	110.457170000000005
2626	\N	\N	HAL	Halali	-19.9666670000000011	13.0666670000000007
2627	\N	\N	HAM	Hamburg Airport	53.6312799999999967	10.0064139999999995
2628	\N	\N	HAN	Noibai International	21.2141839999999995	105.802825999999996
2629	\N	\N	HAO	Hamilton	39.3999999999999986	-84.5666659999999979
2630	\N	\N	HAQ	Hanimaadhoo	6.74843300000000035	73.1683799999999991
2631	\N	\N	HAR	Capital City	40.2161100000000005	-76.8522200000000026
2632	\N	\N	HAT	Heathlands	-19.7208329999999989	140.583329999999989
2633	\N	\N	HAU	Haugesund	59.3447650000000024	5.21590299999999996
2634	\N	\N	HAV	Jose Marti International	22.9984499999999983	-82.4081800000000015
2635	\N	\N	HAW	Haverfordwest	51.7999999999999972	-4.96666700000000017
2636	\N	\N	HAX	Hatbox Field	35.75	-95.4166639999999973
2637	\N	\N	HAY	Haycock	65.2166699999999935	-161.166670000000011
2638	\N	\N	HAZ	Hatzfeldthaven	-4.43333300000000019	145.183330000000012
2639	\N	\N	HBA	Hobart	-42.837257000000001	147.505189999999999
2640	\N	\N	HBB	Industrial Airpark	32.7000000000000028	-103.133330000000001
2641	\N	\N	HBC	Hanus Bay	57.5	-135.916670000000011
2642	\N	\N	HBD	Habi	-6.33305600000000002	142.497770000000003
2643	\N	\N	HBG	The Hattiesburg-Bobby L. Chain Mun.	31.3166679999999999	-89.2666700000000048
2644	\N	\N	HBH	Hobart Bay	57.4083329999999989	-133.46665999999999
2645	\N	\N	HBI	Harbour Island	25.5166660000000007	-76.5999999999999943
2646	\N	\N	HBN	Flamingo	12	106
2647	\N	\N	HBO	Municipal	40.1666680000000014	-95.9500000000000028
2648	\N	\N	HBR	Hobart	35.0166660000000007	-99.0999999999999943
2649	\N	\N	HBT	Hafr Albatin	27.9115520000000004	45.5229720000000029
2650	\N	\N	HBX	Hubli	15.3587380000000007	75.0860799999999955
2651	\N	\N	HCA	Howard County	32.303609999999999	-101.433890000000005
2652	\N	\N	HCB	Shoal Cove	55.4500000000000028	-131.28334000000001
2653	\N	\N	HCC	Columbia County	42.293056	-73.7105559999999969
2654	\N	\N	HCM	Eil	7.91666700000000034	49.7999999999999972
2655	\N	\N	HCN	Hengchun	21.9333320000000001	120.833336000000003
2656	\N	\N	HCQ	Halls Creek	-18.2333339999999993	127.666663999999997
2657	\N	\N	HCW	Cheraw	34.7000000000000028	-79.8833300000000008
2658	\N	\N	HDA	Hidden Falls	57.2000000000000028	-134.849999999999994
2659	\N	\N	HDB	Heidelberg	49.4166680000000014	8.69999999999999929
2660	\N	\N	HDD	Hyderabad	25.322222	68.3638899999999978
2661	\N	\N	HDE	Brewster Field	40.4333340000000021	-99.3833300000000008
2662	\N	\N	HDF	Heringsdorf	53.8782500000000013	14.138242
2663	\N	\N	HDH	Dillingham Airfield	21.4666670000000011	-157.96665999999999
2664	\N	\N	HDM	Hamadan	34.8671459999999982	48.5373200000000011
2665	\N	\N	HDN	Yampa Valley	40.4848100000000031	-107.220764000000003
2666	\N	\N	HDR	Havadarya	27.0500000000000007	56.1666680000000014
2667	\N	\N	HDS	Hoedspruit Airport	-24.3500000000000014	30.9499999999999993
2668	\N	\N	HEB	Henzada	17.6333330000000004	95.4666699999999935
2669	\N	\N	HED	Herendeen	55.8333319999999986	-160.833329999999989
2670	\N	\N	HEE	Thompson-Robbins	34.5333329999999989	-90.5999999999999943
2671	\N	\N	HEI	Heide-Buesum	54.1555559999999971	8.90277799999999964
2672	\N	\N	HEL	Helsinki-vantaa	60.3179500000000033	24.9664499999999983
2673	\N	\N	HEM	Helsinki-malmi	60.25	25.0500000000000007
2674	\N	\N	HEN	Hendon	51.5833319999999986	-0.233333000000000013
2675	\N	\N	HEO	Haelogo	-9.13333300000000037	147.583329999999989
2676	\N	\N	HES	State	45.8500000000000014	-119.283330000000007
2677	\N	\N	HET	Hohhot	40.8547129999999967	111.814155999999997
2678	\N	\N	HEV	Huelva	37.2666660000000007	-6.95000000000000018
2679	\N	\N	HEX	Santo Domingo Herrera	18.4750000000000014	-69.9749999999999943
2680	\N	\N	HEY	Hanchey Army Heliport	31.4166680000000014	-84.5333300000000065
2681	\N	\N	HEZ	Hardy-Anders	31.6147209999999994	-91.2963900000000024
2682	\N	\N	HFA	Haifa	32.8118199999999973	35.0401799999999994
2683	\N	\N	HFD	Brainard	41.7330550000000002	-72.6500000000000057
2684	\N	\N	HFE	Shanghai	31.8500000000000014	117.283330000000007
2685	\N	\N	HFF	Mackall AAF	35.0333329999999989	-79.5666659999999979
2686	\N	\N	HFN	Hornafjordur	64.2833300000000065	-15.266667
2687	\N	\N	HFS	Hagfors	60.0174999999999983	13.5691670000000002
2688	\N	\N	HFT	Hammerfest	70.6799900000000036	23.6758670000000002
2689	\N	\N	HGA	Hargeisa	9.51583300000000065	44.0916670000000011
2690	\N	\N	HGD	Hughenden	-20.8188899999999997	144.224439999999987
2691	\N	\N	HGH	Hangzhou	30.236934999999999	120.432360000000003
2692	\N	\N	HGL	Helgoland	54.1869429999999994	7.91666700000000034
2693	\N	\N	HGN	Mae Hong Son	19.2996799999999986	97.9752299999999963
2694	\N	\N	HGO	Korhogo	9.41388899999999929	-5.61666699999999963
2695	\N	\N	HGS	Hastings	8.39305599999999963	-13.1300000000000008
2696	\N	\N	HGT	Hunter AAF	35.9666670000000011	-121.150000000000006
2697	\N	\N	HGU	Kagamuga	-5.82876700000000003	144.297380000000004
2698	\N	\N	HGZ	Hogatza	66.1916659999999979	-155.668880000000001
2699	\N	\N	HHE	Hachinohe	40.5491680000000017	141.47084000000001
2700	\N	\N	HHH	Hilton Head	32.2166670000000011	-80.6833340000000021
2701	\N	\N	HHI	Wheeler AFB	21.5	-158.03334000000001
2702	\N	\N	HHN	Frankfurt-Hahn	49.9483340000000027	7.2641669999999996
2703	\N	\N	HHP	H K Heliport	22.3180559999999986	114.200000000000003
2704	\N	\N	HHQ	Hua Hin Airport	12.6273999999999997	99.9514499999999941
2705	\N	\N	HHR	Hawthorne	33.9269450000000035	-118.336389999999994
2706	\N	\N	HHZ	Hikueru	-17.5333329999999989	-142.53334000000001
2707	\N	\N	HIB	Chisholm	47.3886099999999999	-92.8386100000000027
2708	\N	\N	HID	Horn Island	-10.5833329999999997	142.28334000000001
2709	\N	\N	HIE	Regional	44.3658330000000021	-71.5486149999999981
2710	\N	\N	HIF	Hill AFB	41.2166670000000011	-111.966669999999993
2711	\N	\N	HIG	Highbury	-16.4166680000000014	143.150000000000006
2712	\N	\N	HIH	Hook Island	-20.1666680000000014	148.949999999999989
2713	\N	\N	HII	Municipal	34.5683330000000026	-114.355279999999993
2714	\N	\N	HIJ	International	34.4361099999999993	132.919450000000012
2715	\N	\N	HIK	Hickam AFB	21.3166679999999999	-157.866669999999999
2716	\N	\N	HIL	Shillavo	6.08333299999999966	44.7666660000000007
2717	\N	\N	HIM	Hingurakgoda	8.05000000000000071	80.9711099999999959
2718	\N	\N	HIO	Portland	45.5166660000000007	-122.983329999999995
2719	\N	\N	HIP	Headingly	-21.3166679999999999	138.28334000000001
2720	\N	\N	HIR	Henderson International	-9.42859200000000008	160.048190000000005
2721	\N	\N	HIT	Haivaro	-6.93333300000000019	143.066669999999988
2722	\N	\N	HIW	Hiroshima West	34.3636100000000013	132.416380000000004
2723	\N	\N	HJJ	Zhi Jiang	27.4413899999999984	109.699719999999999
2724	\N	\N	HJR	Khajuraho	24.8187469999999983	79.9164200000000022
2725	\N	\N	HJT	Khujirt	46.8999999999999986	102.766670000000005
2726	\N	\N	HKA	Municipal	35.9333340000000021	-89.9166639999999973
2727	\N	\N	HKD	Hakodate	41.7761270000000025	140.815809999999999
2728	\N	\N	HKG	Hong Kong International	22.3152480000000004	113.936490000000006
2729	\N	\N	HKK	Hokitika Airport	-42.7149119999999982	170.983460000000008
2730	\N	\N	HKN	Hoskins	-5.45687600000000028	150.402999999999992
2731	\N	\N	HKS	Hawkins Field	32.2999999999999972	-90.2000000000000028
2732	\N	\N	HKT	Phuket International	8.10761899999999969	98.3064349999999934
2733	\N	\N	HKV	Haskovo	41.9333340000000021	25.5500000000000007
2734	\N	\N	HKY	Hickory	35.7386100000000013	-81.3916700000000048
2735	\N	\N	HLA	Lanseria	-25.9378430000000009	27.9264319999999984
2736	\N	\N	HLB	Hillenbrand	39.2999999999999972	-85.2166699999999935
2737	\N	\N	HLC	Hill City	39.3666699999999992	-99.8499999999999943
2738	\N	\N	HLD	Hailar	49.2098730000000018	119.806539999999998
2739	\N	\N	HLF	Hultsfred - Vimmerby	57.5263899999999992	15.8277780000000003
2740	\N	\N	HLG	Ohio County	40.1833340000000021	-80.6500000000000057
2741	\N	\N	HLH	Ulanhot	46.1934899999999971	122.001480000000001
2742	\N	\N	HLI	Hollister	36.8500000000000014	-121.400000000000006
2743	\N	\N	HLL	Hillside	-21.7833329999999989	119.333336000000003
2744	\N	\N	HLM	Park Township	42.7833329999999989	-86.1166699999999992
2745	\N	\N	HLR	Fort Hood AAF	31.1166669999999996	-97.7333299999999952
2746	\N	\N	HLS	St Helens	-41.2666660000000007	148.25
2747	\N	\N	HLT	Hamilton	-37.6499999999999986	142.060560000000009
2748	\N	\N	HLU	Houailou	-21.0333329999999989	166.066669999999988
2749	\N	\N	HLV	Helenvale	-15.6833329999999993	145.199999999999989
2750	\N	\N	HLW	Hluhluwe	-28.0166660000000007	32.25
2751	\N	\N	HLY	Anglesey Airport	53.2999999999999972	-4.63333300000000037
2752	\N	\N	HLZ	Hamilton	-37.8662199999999984	175.336029999999994
2753	\N	\N	HME	Oued Irara Airport	31.6753029999999995	6.14543600000000012
2754	\N	\N	HMG	Hermannsburg	-23.9499999999999993	132.75
2755	\N	\N	HMJ	Khmelnitskiy	49.4166680000000014	27
2756	\N	\N	HMN	Holloman AFB	32.8999999999999986	-105.950000000000003
2757	\N	\N	HMR	Hamar Airport	60.7999999999999972	11.1166669999999996
2758	\N	\N	HMT	Ryan Field	33.7333339999999993	-117.025000000000006
2759	\N	\N	HNB	Municipal	38.2999999999999972	-86.9500000000000028
2760	\N	\N	HNC	Hatteras	35.2166670000000011	-75.7000000000000028
2761	\N	\N	HNE	Tahneta Pass	61.8833300000000008	-147.333329999999989
2762	\N	\N	HNG	Hienghene	-20.6666680000000014	164.900000000000006
2763	\N	\N	HNI	Heiweni	22.2130569999999992	159.446949999999987
2764	\N	\N	HNL	Honolulu International	21.3258319999999983	-157.921660000000003
2765	\N	\N	HNN	Honinabi	-6.13333300000000037	142.233339999999998
2766	\N	\N	HNS	Municipal	59.2458340000000021	-135.518889999999999
2767	\N	\N	HNX	Hanna	41.8333319999999986	-106.5
2768	\N	\N	HNY	Hengyang	26.8500000000000014	112.5
2769	\N	\N	HOA	Hola	-1	40
2770	\N	\N	HOB	Lea County	32.6886099999999971	-103.216939999999994
2771	\N	\N	HOC	Komako	-7.41666700000000034	145.883330000000001
2772	\N	\N	HOD	Hodeidah Airport	14.7556379999999994	42.970478
2773	\N	\N	HOH	Hohenems-Dornbirn	47.3833300000000008	9.69999999999999929
2774	\N	\N	HOI	Hao Island	-18.0624800000000008	-140.96529000000001
2775	\N	\N	HOK	Hooker Creek	-18.3350000000000009	130.632499999999993
2776	\N	\N	HOL	Holikachu	62.8666699999999992	-159.650000000000006
2777	\N	\N	HOO	Nhon Co	12.009722	107.688059999999993
2778	\N	\N	HOP	Campbell AAF	36.8666699999999992	-87.4833299999999952
2779	\N	\N	HOQ	Hof	50.289164999999997	11.8622219999999992
2780	\N	\N	HOS	Oscar Reguera	-37.4166680000000014	-70.2166699999999935
2781	\N	\N	HOT	Memorial Field	34.4788899999999998	-93.0961099999999959
2782	\N	\N	HOV	Hovden	62.1797869999999975	6.07880199999999959
2783	\N	\N	HOX	Homalin	24.8666669999999996	94.9166639999999973
2784	\N	\N	HOY	Hoy Island	58.8333319999999986	-3.29999999999999982
2785	\N	\N	HPB	Hooper Bay	61.5250780000000006	-166.145859999999999
2786	\N	\N	HPE	Hope Vale	-14.6666670000000003	144.916670000000011
2787	\N	\N	HPT	Municipal	42.75	-93.2000000000000028
2788	\N	\N	HPV	Princeville	22.2124999999999986	-159.446670000000012
2789	\N	\N	HPY	Baytown Airport	29.7333339999999993	-94.9666699999999935
2790	\N	\N	HQM	Bowerman	46.971110000000003	-123.935554999999994
2791	\N	\N	HRA	Mansehra	34.3333319999999986	73.2000000000000028
2792	\N	\N	HRB	Harbin	45.6208529999999968	126.236440000000002
2793	\N	\N	HRC	Zhairem	48.4666670000000011	70.4666699999999935
2794	\N	\N	HRE	Harare	-17.9186300000000003	31.0992490000000004
2795	\N	\N	HRG	Hurghada	27.1891560000000005	33.8055000000000021
2796	\N	\N	HRJ	Chaurjhari	28	82.3333360000000027
2797	\N	\N	HRK	Kharkov	49.9207800000000006	36.2811850000000007
2798	\N	\N	HRN	Heliport	-23.4333320000000001	151.916670000000011
2799	\N	\N	HRO	Boone County	36.2616650000000007	-93.1555560000000042
2800	\N	\N	HRR	Herrera	3.21666700000000017	-75.8499999999999943
2801	\N	\N	HRS	Harrismith Airport	-26.2333339999999993	29.1000000000000014
2802	\N	\N	HRT	Linton-On-Ouse	54	-1.55000000000000004
2803	\N	\N	HRY	Henbury	-24.5833319999999986	133.25
2804	\N	\N	HRZ	Horizontina	-27.6383319999999983	-54.3405569999999969
2805	\N	\N	HSB	Raleigh	37.7333339999999993	-88.5333300000000065
2806	\N	\N	HSC	Shaoguan	24.8333319999999986	113.616669999999999
2807	\N	\N	HSH	Henderson Executive	35.9683339999999987	-115.119159999999994
2808	\N	\N	HSI	Hastings	40.605556	-98.4269400000000019
2809	\N	\N	HSK	Huesca-Pirineos	42.0809300000000022	-0.323469000000000007
2810	\N	\N	HSM	Horsham	-36.6666680000000014	142.166670000000011
2811	\N	\N	HSN	Zhoushan	29.9352589999999985	122.356909999999999
2812	\N	\N	HSP	Ingalls Field	37.9505580000000009	-79.8338849999999951
2813	\N	\N	HSS	Hissar	29.1666680000000014	75.7999999999999972
2814	\N	\N	HST	AFB	25.4833339999999993	-80.4833299999999952
2815	\N	\N	HSZ	Hsinchu	24.8166679999999999	120.933334000000002
2816	\N	\N	HTB	Terre-de-Bas	15.7166669999999993	-61.6333300000000008
2817	\N	\N	HTG	Hatanga	71.9666699999999935	102.5
2818	\N	\N	HTH	Hawthorne	38.5333329999999989	-118.633330000000001
2819	\N	\N	HTL	Roscommon County	44.4480549999999965	-84.711110000000005
2820	\N	\N	HTM	Khatgal	50.4500000000000028	100.166663999999997
2821	\N	\N	HTO	East Hampton	40.9594420000000028	-72.2516600000000011
2822	\N	\N	HTR	Hateruma	24.0500000000000007	123.799999999999997
2823	\N	\N	HTU	Hopetoun	-35.7000000000000028	142.366669999999999
2824	\N	\N	HTW	Lawrence County Airpark	36.8333319999999986	-76.2833300000000065
2825	\N	\N	HTZ	Hato Corozal	6.03333299999999983	-72.6333300000000008
2826	\N	\N	HUA	Redstone AAF	34.7333339999999993	-86.5833360000000027
2827	\N	\N	HUB	Humbert River	-16.5	130.75
2828	\N	\N	HUC	Humacao Airport	18.1400000000000006	-65.8011099999999942
2829	\N	\N	HUD	Humboldt	42.7333339999999993	-94.2166699999999935
2830	\N	\N	HUF	Hulman Field	39.4544449999999998	-87.3075000000000045
2831	\N	\N	HUG	Huehuetenango	15.3333329999999997	-91.4666699999999935
2832	\N	\N	HUJ	Hugo	34.0166660000000007	-95.5166700000000048
2833	\N	\N	HUK	Hukuntsi	-23.9833339999999993	21.75
2834	\N	\N	HUL	International	46.1333300000000008	-67.7999999999999972
2835	\N	\N	HUM	Terrebonne	29.5669439999999994	-90.6608350000000058
2836	\N	\N	HUQ	Houn	29.5	15.5
2837	\N	\N	HUT	Hutchinson	38.0680539999999965	-97.8611149999999981
2838	\N	\N	HUU	Huanuco	-9.86666699999999963	-76.2166699999999935
2839	\N	\N	HUV	Hudiksvall	61.7333339999999993	17.1166669999999996
2840	\N	\N	HUX	Huatulco	15.7683330000000002	-96.2355600000000067
2841	\N	\N	HUZ	Huizhou	23.0833319999999986	114.366669999999999
2842	\N	\N	HVA	Analalava	-14.6333330000000004	47.7666660000000007
2843	\N	\N	HVB	Hervey Bay	-25.3198679999999996	152.885210000000001
2844	\N	\N	HVE	Intermediate	38.3666699999999992	-110.716669999999993
2845	\N	\N	HVK	Holmavik	65.7000000000000028	-22.4666670000000011
2846	\N	\N	HVN	New Haven	41.2652780000000021	-72.8883359999999954
2847	\N	\N	HVR	City County	48.5444450000000032	-109.761110000000002
2848	\N	\N	HVS	Municipal	34.3833300000000008	-80.0666659999999979
2849	\N	\N	HWA	Hawabango	-7.43333300000000019	145.96665999999999
2850	\N	\N	HWD	Air Terminal	37.6666680000000014	-122.083336000000003
2851	\N	\N	HWI	SPB	58.1177800000000033	-134.754169999999988
2852	\N	\N	HWK	Wilpena Pound	-31.7166670000000011	138.416670000000011
2853	\N	\N	HWN	Hwange Nat Park	-19.3625000000000007	26.5183329999999984
2854	\N	\N	HWO	North Perry	26	-80.1500000000000057
2855	\N	\N	HXX	Hay	-34.5166660000000007	144.833329999999989
2856	\N	\N	HYA	Barnstable	41.6658329999999992	-70.2805560000000042
2857	\N	\N	HYC	High Wycombe	51.6166699999999992	-0.75
2858	\N	\N	HYD	Hyderabad Airport	17.2399999999999984	78.4280550000000005
2859	\N	\N	HYF	Hayfields	-3.63333299999999992	143.050000000000011
2860	\N	\N	HYN	Huangyan	28.558095999999999	121.416749999999993
2861	\N	\N	HYR	Municipal	46.0244450000000001	-91.4444400000000002
2862	\N	\N	HYV	Hyvinkaa	60.6541670000000011	24.884443000000001
2863	\N	\N	HZB	Merville/Calonne	50.6166699999999992	2.64999999999999991
2864	\N	\N	HZG	Hanzhong	32.9833339999999993	107.183334000000002
2865	\N	\N	HZL	Hazleton	40.9863900000000001	-75.9911100000000062
2866	\N	\N	HZV	Hazyview	-25.0666679999999999	31.1305559999999986
2867	\N	\N	IAA	Igarka	67.4333340000000021	86.6333300000000008
2868	\N	\N	IAB	Mcconnell AFB	37.6811399999999992	-97.2761699999999934
2869	\N	\N	IAN	Bob Barker Memorial	66.9755549999999999	-160.430560000000014
2870	\N	\N	IAQ	Bahregan	28.9333320000000001	50.8333319999999986
2871	\N	\N	IAU	Iaura	-9.78333300000000072	148.099999999999994
2872	\N	\N	IBI	Iboki	-5.5533330000000003	149.190280000000001
2873	\N	\N	IBO	Ibo	-12.3333329999999997	40.5833319999999986
2874	\N	\N	IBP	Iberia	-11.3666669999999996	-69.5833360000000027
2875	\N	\N	ICA	Icabaru	4.33333299999999966	-61.7333339999999993
2876	\N	\N	ICK	Nieuw Nickerie	5.93333300000000019	-56.9833339999999993
2877	\N	\N	ICL	Municipal	40.7333339999999993	-95.0333300000000065
2878	\N	\N	ICN	Seoul (Incheon)	37.448523999999999	126.451229999999995
2879	\N	\N	ICO	Sicogon Island	11.4333329999999993	123.266670000000005
2880	\N	\N	ICR	Nicaro	20.9833339999999993	-75.9749999999999943
2881	\N	\N	ICT	Mid-Continent	37.6530460000000033	-97.428955000000002
2882	\N	\N	ICY	Icy Bay	60	-141.25
2883	\N	\N	IDA	Fanning Field	43.5148539999999997	-112.067509999999999
2884	\N	\N	IDB	Idre	61.8666699999999992	12.6833329999999993
2885	\N	\N	IDF	Idiofa	-5.03333299999999983	19.6000000000000014
2886	\N	\N	IDG	Municipal	42.3500000000000014	-95.4666699999999935
2887	\N	\N	IDI	ndiana County Airport (Jimmy Stewart Field)	40.6166699999999992	-79.1500000000000057
2888	\N	\N	IDK	Indulkana	-26.9666670000000011	133.324999999999989
2889	\N	\N	IDN	Indagen	-6.20000000000000018	147.25
2890	\N	\N	IDO	Rio	-11.5666670000000007	-50.6666680000000014
2891	\N	\N	IDP	Independence	37.2333339999999993	-95.7000000000000028
2892	\N	\N	IDR	Devi Ahilyabai Holkar	22.7286509999999993	75.8094399999999951
2893	\N	\N	IEG	Babimost	51.9333340000000021	15.516667
2894	\N	\N	IEJ	Iejima	26.7333339999999993	127.799999999999997
2895	\N	\N	IES	Riesa	51.2999999999999972	13.2833330000000007
2896	\N	\N	IFA	Iowa Falls	42.5166660000000007	-93.2666700000000048
2897	\N	\N	IFF	Iffley	-18.8999999999999986	141.21665999999999
2898	\N	\N	IFH	Hesa	32.9166680000000014	51.5499999999999972
2899	\N	\N	IFL	Innisfail	-17.5500000000000007	146.016660000000002
2900	\N	\N	IFO	Ivano-Frankovsk	48.8875349999999997	24.7075649999999989
2901	\N	\N	IFP	Laughlin Bullhead International	35.1656339999999972	-114.556950000000001
2902	\N	\N	IGB	Ingeniero Jacobacci	-41.2999999999999972	-69.5833360000000027
2903	\N	\N	IGE	Iguela	-1.9166669999999999	9.3166670000000007
2904	\N	\N	IGH	Ingham	-18.7166670000000011	146.166670000000011
2905	\N	\N	IGN	Maria Cristina	8.13111100000000064	124.214164999999994
2906	\N	\N	IGO	Chigorodo	7.68166700000000002	-76.6866700000000066
2907	\N	\N	IGR	Cataratas	-25.731504000000001	-54.4763499999999965
2908	\N	\N	IHA	Niihama	33.9166680000000014	133.266660000000002
2909	\N	\N	IHC	Inhaca	-26	32.9333340000000021
2910	\N	\N	IHN	Qishn	15.0500000000000007	50.0499999999999972
2911	\N	\N	IHO	Ihosy	-22.4166680000000014	46.1166699999999992
2912	\N	\N	IHR	Iran Shahr	27.2283650000000002	60.7180600000000013
2913	\N	\N	IHU	Ihu	-7.90000000000000036	145.383330000000001
2914	\N	\N	IIA	Inishmaan	53.0833319999999986	-9.53333300000000072
2915	\N	\N	IIL	Ilaam	33.5863700000000023	46.3992349999999973
2916	\N	\N	IIN	Nishinoomote	30.7166670000000011	130.983339999999998
2917	\N	\N	IIS	Nissan Island	-4.33333299999999966	154.34165999999999
2918	\N	\N	IJK	Izhevsk	56.8333319999999986	53.4666670000000011
2919	\N	\N	IJU	J. Batista Bos Filho Airport	-28.4166680000000014	-53.9166680000000014
2920	\N	\N	IJX	Municipal	39.774166000000001	-90.2372199999999935
2921	\N	\N	IKB	Wilkes County	36.1499999999999986	-81.1500000000000057
2922	\N	\N	IKI	Iki	33.7455560000000006	129.788330000000002
2923	\N	\N	IKK	Greater Kankakee	41.3833300000000008	-88.25
2924	\N	\N	IKL	Ikela	-1.6666669999999999	23.6666680000000014
2925	\N	\N	IKO	Nikolski AFS	52.9416659999999979	-168.849999999999994
2926	\N	\N	IKP	Inkerman	-16.25	141.5
2927	\N	\N	IKT	Irkutsk	52.2733080000000001	104.356070000000003
2928	\N	\N	ILA	Illaga	-3.64999999999999991	133.733339999999998
2929	\N	\N	ILB	Ilha Solteira	-20.3333319999999986	-51.3333319999999986
2930	\N	\N	ILE	Municipal	31.0863900000000015	-97.6866700000000066
2931	\N	\N	ILF	Ilford	56.0666659999999979	-95.6166699999999992
2932	\N	\N	ILG	Greater Wilmington	39.6783330000000021	-75.6075000000000017
2933	\N	\N	ILH	Illis Airbase	49.4699999999999989	10.3900000000000006
2934	\N	\N	ILI	Iliamna	59.7527770000000018	-154.90834000000001
2935	\N	\N	ILK	Ilaka	-20.3333319999999986	47.1666680000000014
2936	\N	\N	ILL	Willmar	45.1152760000000015	-95.0852799999999974
2937	\N	\N	ILN	Clinton Field	39.4930570000000003	-83.7408300000000025
2938	\N	\N	ILO	Iloilo International	10.7143119999999996	122.543884000000006
2939	\N	\N	ILP	Ile Des Pins	-22.5897219999999983	167.447499999999991
2940	\N	\N	ILQ	Ilo	-17.6666680000000014	-71.3333360000000027
2941	\N	\N	ILR	Ilorin	8.5	4.53333299999999983
2942	\N	\N	ILU	Kilaguni	-2.89999999999999991	38.0499999999999972
2943	\N	\N	ILX	Ileg	-5.48000000000000043	145.830000000000013
2944	\N	\N	ILY	Glenegedale	55.6819460000000035	-6.25416699999999981
2945	\N	\N	IMA	Iamalele	-9.46666699999999928	150.5
2946	\N	\N	IMB	Imbaimadai	5.71666700000000017	-60.2833329999999989
2947	\N	\N	IMD	Imonda	-3.43333300000000019	141.199999999999989
2948	\N	\N	IMG	Inhaminga	-18.4333320000000001	35
2949	\N	\N	IMI	Ine Island	6.98333300000000001	171.616669999999999
2950	\N	\N	IMK	Simikot	29.9666670000000011	81.8166659999999979
2951	\N	\N	IML	Imperial	40.5166660000000007	-101.650000000000006
2952	\N	\N	IMM	Immokalee	26.4166680000000014	-81.4166639999999973
2953	\N	\N	IMN	Imane	-6.70000000000000018	146.083329999999989
2954	\N	\N	IMO	Zemio	5.03333299999999983	25.0833319999999986
2955	\N	\N	IMP	Imperatriz	-5.53194400000000019	-47.480556
2956	\N	\N	INA	Inta	66.0666659999999979	60.1000000000000014
2957	\N	\N	INB	Independence	17.5472220000000014	-88.2999999999999972
2958	\N	\N	INC	Yinchuan	38.3500000000000014	106.349999999999994
2959	\N	\N	INE	Chinde	-18.6166669999999996	36.3999999999999986
2960	\N	\N	INF	Newark Liberty International	19.6166669999999996	5.86666699999999963
2961	\N	\N	ING	Lago Argentino	-50.5833319999999986	-72.6666639999999973
2962	\N	\N	INH	Inhambane	-23.8744429999999994	35.4083329999999989
2963	\N	\N	INI	Constantine The Great International	43.3338899999999967	21.8516669999999991
2964	\N	\N	INJ	Injune	-25.8833330000000004	148.53334000000001
2965	\N	\N	INK	Wink	31.75	-103.150000000000006
2966	\N	\N	INM	Innamincka	-27.75	140.733339999999998
2967	\N	\N	INN	Innsbruck-kranebitten	47.2574499999999986	11.3514669999999995
2968	\N	\N	INO	Inongo	-1.94999999999999996	18.2791670000000011
2969	\N	\N	INQ	Inisheer	53.0333329999999989	-9.4333329999999993
2970	\N	\N	INS	Af Aux	36.5833319999999986	-115.666663999999997
2971	\N	\N	INT	Smith-Reynolds	36.1352770000000021	-80.2255549999999999
2972	\N	\N	INU	Nauru International	-0.533332999999999946	166.916670000000011
2973	\N	\N	INV	Inverness	57.5393449999999973	-4.06373799999999985
2974	\N	\N	INW	Winslow-Lindbergh	35.024166000000001	-110.724999999999994
2975	\N	\N	INX	Inanwatan	-2.1666669999999999	132.233339999999998
2976	\N	\N	INY	Inyati	-24.7833329999999989	31.3833330000000004
2977	\N	\N	INZ	In Salah	27.25	2.51666699999999999
2978	\N	\N	IOA	Ioannina	39.6966669999999979	20.8258319999999983
2979	\N	\N	IOK	Iokea	-8.40000000000000036	146.266660000000002
2980	\N	\N	IOM	Ronaldsway	54.0867700000000013	-4.63473000000000024
2981	\N	\N	ION	Impfondo	1.61333299999999991	18.0619429999999994
2982	\N	\N	IOP	Ioma	-8.34999999999999964	147.75
2983	\N	\N	IOR	Kilronan	53.1166699999999992	-9.75
2984	\N	\N	IOS	Eduardo Gomes	-14.8138889999999996	-39.0300000000000011
2985	\N	\N	IOU	Ile Ouen	-22.4638880000000007	166.783050000000003
2986	\N	\N	IOW	Iowa City	41.6666680000000014	-91.5333300000000065
2987	\N	\N	IPE	Ipil	7.78333299999999983	122.583336000000003
2988	\N	\N	IPG	Ipiranga	-3.21666700000000017	-65.9500000000000028
2989	\N	\N	IPH	Sultan Azlan Shah Airport	4.56694400000000034	101.095830000000007
2990	\N	\N	IPU	Ipiau	-14.1333330000000004	-39.7333339999999993
2991	\N	\N	IPW	Ipswich	52.0666659999999979	1.1666669999999999
2992	\N	\N	IQM	Qiemo	38.1333300000000008	85.5333300000000065
2993	\N	\N	IQN	Qingyang	35.8001000000000005	107.604399999999998
2994	\N	\N	IQT	C.F. Secada	-3.78509800000000007	-73.3028400000000033
2995	\N	\N	IRA	Kirakira	-10.5	161.833329999999989
2996	\N	\N	IRB	Municipal	30.6999999999999993	-101.933334000000002
2997	\N	\N	IRC	Circle City	65.8291700000000048	-144.063889999999986
2998	\N	\N	IRD	Ishurdi	24.1333330000000004	89.0527799999999985
2999	\N	\N	IRE	Irece	-11.3000000000000007	-41.8666699999999992
3000	\N	\N	IRG	Lockhart River	-12.7888889999999993	143.3125
3001	\N	\N	IRJ	Capitan Vicente Almando	-29.3833330000000004	-66.7833300000000065
3002	\N	\N	IRK	Municipal	40.0925000000000011	-92.5438900000000046
3003	\N	\N	IRN	Iriona	15.9499999999999993	-85.1833340000000021
3004	\N	\N	IRO	Birao	10.1863890000000001	22.7138880000000007
3005	\N	\N	IRP	Matari	2.78194400000000019	27.6308329999999991
3006	\N	\N	IRS	Kirsch Municipal	41.8166659999999979	-85.4352800000000059
3007	\N	\N	ISA	Mount Isa	-20.6676369999999991	139.491790000000009
3008	\N	\N	ISB	Islamabad International	33.6097070000000002	73.1050999999999931
3009	\N	\N	ISD	Iscuande	2.46666700000000017	-77.9833299999999952
3010	\N	\N	ISE	Isparta	37.866109999999999	30.3822210000000013
3011	\N	\N	ISG	Ishigaki	24.3369450000000001	124.168890000000005
3012	\N	\N	ISH	Ischia	40.7333339999999993	13.9499999999999993
3013	\N	\N	ISI	Isisford	-24.2633319999999983	144.423339999999996
3014	\N	\N	ISJ	Isla Mujeres	21.2666660000000007	-86.75
3015	\N	\N	ISK	Gandhinagar Airport	19.9669419999999995	73.8112639999999942
3016	\N	\N	ISL	Isabel Pass	63.5	-145.03334000000001
3017	\N	\N	ISM	Kissimmee Gateway	28.4499999999999993	-81.3333360000000027
3018	\N	\N	ISO	Stallings Field	35.326667999999998	-77.6166699999999992
3019	\N	\N	ISP	Long Island Mac Arthur	40.7893139999999974	-73.0975499999999982
3020	\N	\N	ISQ	Schoolcraft County	45.9500000000000028	-86.25
3021	\N	\N	ISS	Wiscasset	44	-69.6666639999999973
3022	\N	\N	ISW	Alexander Field	44.360280000000003	-89.8388900000000064
3023	\N	\N	ITA	Itacoatiara	-3.13333299999999992	-58.4166680000000014
3024	\N	\N	ITE	Itubera	-13.6999999999999993	-39.2000000000000028
3025	\N	\N	ITH	Tompkins County	42.4903400000000033	-76.4635899999999964
3026	\N	\N	ITI	Itambacuri	-18	-41.5
3027	\N	\N	ITK	Itokama	-9.30000000000000071	148.199999999999989
3028	\N	\N	ITM	Itami	34.7909739999999985	135.44171
3029	\N	\N	ITN	Itabuna	-14.8000000000000007	-39.2999999999999972
3030	\N	\N	ITO	Hilo International	19.7145650000000003	-155.039629999999988
3031	\N	\N	ITP	Itaperuna	-21.2188899999999983	-41.875
3032	\N	\N	ITQ	Itaqui	-29.1333330000000004	-56.5499999999999972
3033	\N	\N	ITR	Hidroeletrica	-18.4450000000000003	-49.2141700000000029
3034	\N	\N	IUL	Ilu	-3.73333300000000001	138.166670000000011
3035	\N	\N	IUM	Summit Lake	54.3333319999999986	-122.666663999999997
3036	\N	\N	IUS	Inus	-5.81666699999999981	155.166670000000011
3037	\N	\N	IVA	Ambanja	-13.6422220000000003	48.4577799999999996
3038	\N	\N	IVG	Ivangrad	42.8390270000000015	19.8620279999999987
3039	\N	\N	IVH	Ivishak	69.4000000000000057	-148.25
3040	\N	\N	IVO	Chivolo	9.51666699999999999	-74.5333300000000065
3041	\N	\N	IVR	Inverell	-29.883896	151.140559999999994
3042	\N	\N	IVW	Inverway	-17.8333319999999986	129.633330000000001
3043	\N	\N	IWA	Ivanova	56.9429549999999978	40.9445460000000026
3044	\N	\N	IWD	Gogebic County	46.5255549999999971	-90.1316699999999997
3045	\N	\N	IWO	Iwo Jima Airbase	24.7833329999999989	141.316669999999988
3046	\N	\N	IWS	West Houston	29.8166679999999999	-95.6666639999999973
3047	\N	\N	IXA	Singerbhil	23.8926000000000016	91.2445139999999952
3048	\N	\N	IXB	Bagdogra	26.6848799999999997	88.3248140000000035
3049	\N	\N	IXC	Chandigarh	30.6749210000000012	76.797386000000003
3050	\N	\N	IXD	Bamrauli	25.4397219999999997	81.7361149999999981
3051	\N	\N	IXH	Kailashahar	24.3072219999999994	92.0088899999999938
3052	\N	\N	IXI	North Lakhimpur	27.2902769999999997	94.0888900000000064
3053	\N	\N	IXK	Keshod	21.3194450000000018	70.2708360000000027
3054	\N	\N	IXM	Madurai	9.83747100000000074	78.0911200000000036
3055	\N	\N	IXN	Khowai	24.0638889999999996	91.6033299999999997
3056	\N	\N	IXP	Pathankot	32.2166670000000011	75.6333300000000008
3057	\N	\N	IXQ	Kamalpur	24.1325000000000003	91.8155600000000049
3058	\N	\N	IXR	Birsa Munda International	23.3181919999999998	85.3228500000000025
3059	\N	\N	IXS	Kumbhirgram	24.9160180000000011	92.9792560000000066
3060	\N	\N	IXT	Pasighat	28.0166660000000007	95.3333360000000027
3061	\N	\N	IXU	Chikkalthana	19.8664650000000016	75.3972100000000012
3062	\N	\N	IXV	Along	28.1999999999999993	94.8166659999999979
3063	\N	\N	IXW	Sonari	22.8130570000000006	86.1688900000000046
3064	\N	\N	IXY	Kandla	23.11111	70.1041639999999973
3065	\N	\N	IXZ	Port Blair	11.6500830000000004	92.7322699999999998
3066	\N	\N	IYK	Kern County	35.6566660000000013	-117.829170000000005
3067	\N	\N	IZT	Ixtepec	16.5691659999999992	-95.1083299999999952
3068	\N	\N	JAA	Jalalabad	34.4333340000000021	70.4666699999999935
3069	\N	\N	JAB	Jabiru	-12.6597220000000004	132.891940000000005
3070	\N	\N	JAC	Jackson Hole	43.6028060000000011	-110.736130000000003
3071	\N	\N	JAD	Jandakot	-32.0833319999999986	115.883330000000001
3072	\N	\N	JAE	Technology Park	33.6380580000000009	-84.4244460000000032
3073	\N	\N	JAF	Kankesanturai	9.79166700000000034	80.0750000000000028
3074	\N	\N	JAG	Jacobabad	28.3000000000000007	68.4500000000000028
3075	\N	\N	JAJ	Perimeter Mall	33.6352770000000021	-84.421670000000006
3076	\N	\N	JAK	Jacmel Regional Airport	18.240556999999999	-72.5186099999999954
3077	\N	\N	JAL	Jalapa	19.4722210000000011	-96.7819439999999958
3078	\N	\N	JAM	Jambol	42.5166660000000007	26.4833339999999993
3079	\N	\N	JAN	Jackson-evers	32.3098949999999974	-90.0749600000000044
3080	\N	\N	JAO	Beaver Ruin	33.6463899999999967	-84.4327799999999939
3081	\N	\N	JAP	Punta Renes	9.96666699999999928	-84.8333360000000027
3082	\N	\N	JAQ	Jacquinot Bay	-5.59999999999999964	151.516660000000002
3083	\N	\N	JAR	Jahrom	28.5166660000000007	53.5499999999999972
3084	\N	\N	JAS	County	30.9333320000000001	-94.0166700000000048
3085	\N	\N	JAT	Jabot	7.75	168.96665999999999
3086	\N	\N	JAX	Jacksonville,	30.491657	-81.6830599999999976
3087	\N	\N	JBC	Boston City Heliport	42.3438870000000023	-71.0494460000000032
3088	\N	\N	JBK	Berkeley	37.8666699999999992	-122.299999999999997
3089	\N	\N	JBP	Commerce Bus. Plaza	33.9866680000000017	-118.159719999999993
3090	\N	\N	JBR	Jonesboro	35.8299999999999983	-90.6483300000000014
3091	\N	\N	JBS	Hacienda Bus.Park Heliport	37.6997220000000013	-121.900000000000006
3092	\N	\N	JBT	City Landing	60.7999999999999972	-161.75
3093	\N	\N	JCA	Croisette Heliport	43.5388900000000021	7.04444400000000037
3094	\N	\N	JCB	Joacaba	-27.1666680000000014	-51.5166660000000007
3095	\N	\N	JCD	Downtown Heliport	17.6999999999999993	-64.7833300000000065
3096	\N	\N	JCE	Convention Center Heliport	37.8166659999999979	-122.266670000000005
3097	\N	\N	JCH	Qasigiannguit	68.8151500000000027	-51.2013299999999987
3098	\N	\N	JCI	New Century Aircenter Airport	38.8333319999999986	-94.9000000000000057
3099	\N	\N	JCJ	Chuja Heliport	33.9444429999999997	126.327780000000004
3100	\N	\N	JCK	Julia Creek	-20.5833319999999986	141.699999999999989
3101	\N	\N	JCM	Jacobina	-11.1833329999999993	-40.5166660000000007
3102	\N	\N	JCO	Heliport	36.0166660000000007	14.3333329999999997
3103	\N	\N	JCR	Jacareacanga	-5.98333300000000001	-57.5333329999999989
3104	\N	\N	JCT	Kimble County	30.4833339999999993	-99.7666700000000048
3105	\N	\N	JCU	Ceuta Heliport	35.899166000000001	-5.33833300000000044
3106	\N	\N	JCX	Citicorp Plaza Heliport	34.0666659999999979	-118.25
3107	\N	\N	JCY	Johnson	30.2833329999999989	-98.4166639999999973
3108	\N	\N	JDA	John Day	44.4166680000000014	-118.950000000000003
3109	\N	\N	JDB	Downtown Heliport	32.7666660000000007	-97.3166659999999979
3110	\N	\N	JDH	Jodhpur	26.2639479999999992	73.0505500000000012
3111	\N	\N	JDN	Jordan	47.3166659999999979	-106.883330000000001
3112	\N	\N	JDP	Heliport De Paris	48.8166659999999979	2.28333299999999983
3113	\N	\N	JDT	Downtown Heliport	44.9833339999999993	-93.2666700000000048
3114	\N	\N	JDX	Central Bus. District	29.7666660000000007	-95.3333360000000027
3115	\N	\N	JDY	Heliport	33.9333340000000021	-118.116669999999999
3116	\N	\N	JDZ	Jingdezhen	29.3354900000000001	117.178790000000006
3117	\N	\N	JED	King Abdulaziz International	21.6702329999999996	39.150578000000003
3118	\N	\N	JEE	Jeremie	18.6622219999999999	-74.1697199999999981
3119	\N	\N	JEF	Memorial	38.5922199999999975	-92.1563900000000018
3120	\N	\N	JEJ	Jeh	7.56991600000000009	168.965129999999988
3121	\N	\N	JEM	Heliport	37.8333319999999986	-122.299999999999997
3122	\N	\N	JEQ	Jequie	-13.8499999999999996	-40.0833319999999986
3123	\N	\N	JER	Jersey	49.205295999999997	-2.19434400000000007
3124	\N	\N	JFM	Heliport	-32.0499999999999972	115.75
3125	\N	\N	JFN	Ashtabula	41.7333339999999993	-80.7666700000000048
3126	\N	\N	JGA	Govardhanpur	22.4633329999999987	70.0119499999999988
3127	\N	\N	JGB	Jagdalpur	19.0666679999999999	82.0333300000000065
3128	\N	\N	JGC	Heliport	35.9519420000000025	-112.147499999999994
3129	\N	\N	JGE	Heliport	34.8999999999999986	128.683330000000012
3130	\N	\N	JGL	Galleria Heliport	33.8861119999999971	-84.4669399999999939
3131	\N	\N	JGN	Jiayuguan	39.8333319999999986	98.4166639999999973
3132	\N	\N	JGP	Greenway Plaza Heliport	29.6666680000000014	-95.25
3133	\N	\N	JGQ	Transco Twr Galleria	29.7666660000000007	-95.4666699999999935
3134	\N	\N	JGR	Heliport	61.2333339999999993	-48.1000000000000014
3135	\N	\N	JGS	Ji An/Jing Gang Shan	26.8997209999999995	114.737499999999997
3136	\N	\N	JGX	Heliport	34.1666680000000014	-118.283330000000007
3137	\N	\N	JHC	Island Heliport	40.7833329999999989	-74.0999999999999943
3138	\N	\N	JHE	Heliport	56.0333329999999989	12.6999999999999993
3139	\N	\N	JHM	Kapalua West Maui	20.9621940000000002	-156.675690000000003
3140	\N	\N	JHY	Hyatt Regency Heliport	42.3666699999999992	-71.1027760000000058
3141	\N	\N	JIA	Juina	-11.5	-58.8833300000000008
3142	\N	\N	JIB	Ambouli	11.5523609999999994	43.149676999999997
3143	\N	\N	JID	City Of Industry Heliport	34	-118
3144	\N	\N	JIK	Ikaria	37.6666680000000014	26.3333319999999986
3145	\N	\N	JIL	Jilin	43.8666699999999992	126.650000000000006
3146	\N	\N	JIN	Jinja	0.456388999999999989	33.1922229999999985
3147	\N	\N	JIO	International Heliport	34.0666659999999979	-117.650000000000006
3148	\N	\N	JIP	Jipijapa	-1	-80.6666639999999973
3149	\N	\N	JIR	Jiri	27.6333330000000004	86.2333299999999952
3150	\N	\N	JIU	Jiujiang	29.6999999999999993	115.966669999999993
3151	\N	\N	JIW	Jiwani	25.0833319999999986	61.8166659999999979
3152	\N	\N	JJI	Juanjui	-7.15000000000000036	-76.7166699999999935
3153	\N	\N	JJN	Jinjiang	24.8028089999999999	118.587295999999995
3154	\N	\N	JKH	Chios	38.3457950000000025	26.1423360000000002
3155	\N	\N	JKR	Janakpur	26.7083319999999986	85.9238900000000001
3156	\N	\N	JKV	Cherokee County	31.9666670000000011	-95.3333360000000027
3157	\N	\N	JLA	Quartz Creek	60.4833339999999993	-149.849999999999994
3158	\N	\N	JLB	Heliport	33.8175000000000026	-118.151110000000003
3159	\N	\N	JLD	Heliport	56.0499999999999972	12.6999999999999993
3160	\N	\N	JLH	US Army Heliport	42.0833319999999986	-87.9833299999999952
3161	\N	\N	JLN	Joplin Regional	37.1497230000000016	-94.4977800000000059
3162	\N	\N	JLR	Jabalpur	22.6666680000000014	79.9249999999999972
3163	\N	\N	JLS	Jales	-20.1666680000000014	-50.5499999999999972
3164	\N	\N	JLX	Union Station Heliport	34.1666680000000014	-118.333336000000003
3165	\N	\N	JMA	Marriot Astrodome	29.9833339999999993	-95.3400000000000034
3166	\N	\N	JMB	Jamba	-14.6999999999999993	16.0833319999999986
3167	\N	\N	JMC	Marin County	37.8786130000000014	-122.509720000000002
3168	\N	\N	JMD	Market Centre Heliport	32.7999999999999972	-97.3333360000000027
3169	\N	\N	JMH	Marriott Heliport	42.0333329999999989	-88.0833360000000027
3170	\N	\N	JMK	Mikonos	37.4361099999999993	25.3444439999999993
3171	\N	\N	JMM	Malmo Harbour Heliport	55.6000000000000014	13
3172	\N	\N	JMN	Municipal Heliport	44.1666680000000014	-94.0166700000000048
3173	\N	\N	JMO	Jomsom	28.7833329999999989	83.7333299999999952
3174	\N	\N	JMS	Jamestown	46.9299999999999997	-98.6783300000000025
3175	\N	\N	JMU	Jiamusi	46.8453939999999989	130.455410000000001
3176	\N	\N	JMY	Mammy Yoko Heliport	8.48333300000000001	-13.266667
3177	\N	\N	JNA	Januaria	-15.4741669999999996	-44.3858340000000027
3178	\N	\N	JNG	Jining	35.4166680000000014	116.533330000000007
3179	\N	\N	JNH	North Park Inn Heliport	32.8166659999999979	-97.3499999999999943
3180	\N	\N	JNI	Junin	-34.5833319999999986	-60.9666670000000011
3181	\N	\N	JNN	Nanortalik	60.1341669999999979	-45.2336120000000008
3182	\N	\N	JNP	Heliport	33.6166699999999992	-117.933334000000002
3183	\N	\N	JNU	Boundary Bay	58.3593199999999968	-134.583390000000009
3184	\N	\N	JNX	Naxos Airport	37.1000000000000014	25.3833330000000004
3185	\N	\N	JNZ	Jinzhou	41.1166699999999992	121.016670000000005
3186	\N	\N	JOC	Centerport Heliport	33.6666680000000014	-117.869445999999996
3187	\N	\N	JOE	Joensuu	62.6567879999999988	29.6135400000000004
3188	\N	\N	JOG	Adisutjipto	-7.78557200000000016	110.437060000000002
3189	\N	\N	JOH	Port Saint Johns	-31.6166669999999996	29.5333329999999989
3190	\N	\N	JOI	Lauro Carneiro De Loyola	-26.2333339999999993	-48.7833329999999989
3191	\N	\N	JOL	Jolo	6.05527800000000038	121.008889999999994
3192	\N	\N	JOM	Njombe	-9.35444400000000087	34.7713899999999967
3193	\N	\N	JON	Johnston Island	16.7333339999999993	-169.53334000000001
3194	\N	\N	JOP	Josephstaal	-4.75	145.016660000000002
3195	\N	\N	JOR	The City Heliport	33.7833329999999989	-117.849999999999994
3196	\N	\N	JOS	Jos	9.86805599999999927	8.89305599999999963
3197	\N	\N	JOT	Municipal	41.5333329999999989	-88.0833360000000027
3198	\N	\N	JPA	Castro Pinto	-7.14535699999999974	-34.9481600000000014
3199	\N	\N	JPD	Heliport	34.1499999999999986	-118.150000000000006
3200	\N	\N	JPN	Pentagon Army	38.7666660000000007	-77.0666659999999979
3201	\N	\N	JPR	Ji-Parana	-10.8705560000000006	-61.8466700000000031
3202	\N	\N	JPT	Park Ten Heliport	29.7863879999999988	-95.8116700000000066
3203	\N	\N	JPU	La Defense Heliport	48.8666699999999992	2.3333330000000001
3204	\N	\N	JQF	Savelovsky Railway Station	35.4020840000000021	-80.7971399999999988
3205	\N	\N	JRA	West 30th St Heliport	40.75	-74.0074999999999932
3206	\N	\N	JRB	Downtown Manhattan Heliport	40.7041660000000007	-74.0083300000000008
3207	\N	\N	JRC	Municipalcipal Heliport	44.0166660000000007	-92.4666699999999935
3208	\N	\N	JRD	Heliport	33.9833339999999993	-117.366669999999999
3209	\N	\N	JRE	East 60th Street Heliport	40.7541659999999979	-73.9708300000000065
3210	\N	\N	JRK	Arsuk	61.1666680000000014	-48.4166680000000014
3211	\N	\N	JRN	Juruena	-10.3055559999999993	-58.4888880000000029
3212	\N	\N	JRS	Atarot	31.8674999999999997	35.2144430000000028
3213	\N	\N	JSA	Jaisalmer	26.9166680000000014	70.9000000000000057
3214	\N	\N	JSD	Sikorsky Heliport	41.2000000000000028	-73.1333300000000008
3215	\N	\N	JSG	San Rafael Heliport	37.9666670000000011	-122.533330000000007
3216	\N	\N	JSH	Sitia	35.2166670000000011	26.1166669999999996
3217	\N	\N	JSI	Skiathos	39.1805570000000003	23.5055559999999986
3218	\N	\N	JSK	Municipalcipal Heliport	45.5499999999999972	-94.1666639999999973
3219	\N	\N	JSL	Steel Pier Heliport	39.3333319999999986	-74.4500000000000028
3220	\N	\N	JSM	Jose De San Martin	-44.0666659999999979	-70.4333340000000021
3221	\N	\N	JSN	Sherman Oaks Heliport	34.0666659999999979	-118.25
3222	\N	\N	JSO	Sodertalje Heliport	59.2000000000000028	17.6499999999999986
3223	\N	\N	JSP	Seogwipo Heliport	33.4833339999999993	126.566665999999998
3224	\N	\N	JSR	Jessore	23.1769600000000011	89.1606450000000024
3225	\N	\N	JST	Cambria County	40.3166659999999979	-78.8344400000000007
3226	\N	\N	JTI	Jatai	-17.8294449999999998	-51.7747230000000016
3227	\N	\N	JTO	Heliport	34.1666680000000014	-118.833336000000003
3228	\N	\N	JTR	Santorini (Thira)	36.3999999999999986	25.4833339999999993
3229	\N	\N	JTY	Astypalaia	36.5666659999999979	26.3666669999999996
3230	\N	\N	JUA	Juara	-11.3333329999999997	-57.4666670000000011
3231	\N	\N	JUC	Universal City Heliport	34.0833319999999986	-118.266670000000005
3232	\N	\N	JUI	Juist	53.6833340000000021	7.06666699999999981
3233	\N	\N	JUJ	El Cadillal	-24.3999999999999986	-65.0833360000000027
3234	\N	\N	JUL	Juliaca	-15.4641669999999998	-70.1544399999999939
3235	\N	\N	JUM	Jumla	29.2736109999999989	82.1919400000000024
3236	\N	\N	JUN	Jundah	-24.8333319999999986	143.066669999999988
3237	\N	\N	JUO	Jurado	7.11666699999999963	-77.75
3238	\N	\N	JUP	Cable Heliport	34.1000000000000014	-117.633330000000001
3239	\N	\N	JUR	Jurien Bay	-30.2666660000000007	115.049999999999997
3240	\N	\N	JUT	Juticalpa	14.6733329999999995	-86.2930499999999938
3241	\N	\N	JVA	Ankavandra	-18.8000000000000007	45.2833329999999989
3242	\N	\N	JVI	Central Jersey Regional Airport	42.7833329999999989	-104.616669999999999
3243	\N	\N	JVL	Rock County	42.6833340000000021	-89.0166700000000048
3244	\N	\N	JWA	Jwaneng	-24.6000000000000014	24.6666680000000014
3245	\N	\N	JWC	Warner Cntr Bus. Plaza	34.0666659999999979	-118.25
3246	\N	\N	JWH	Westchase Hilton Heliport	29.73611	-95.4177799999999934
3247	\N	\N	JWL	Woodlawns	30.1505569999999992	-95.4713899999999995
3248	\N	\N	JWN	Zanjan	36.7744179999999972	48.3698539999999966
3249	\N	\N	JXN	Reynolds Municipal	42.258890000000001	-84.4613899999999944
3250	\N	\N	JYR	Jiroft	28.7166670000000011	57.6666680000000014
3251	\N	\N	JYV	Jyvaskyla	62.4036199999999965	25.6814299999999989
3252	\N	\N	KAB	Kariba	-16.5183329999999984	28.8852790000000006
3253	\N	\N	KAE	SPB	56.9666670000000011	-133.949999999999989
3254	\N	\N	KAF	Karato	-6.28333299999999983	155.349999999999994
3255	\N	\N	KAG	Gangneung	37.7522200000000012	128.949720000000013
3256	\N	\N	KAH	City Heliport	-37.8166659999999979	144.96665999999999
3257	\N	\N	KAI	Kaieteur	5.88333300000000037	-60.6194460000000035
3258	\N	\N	KAJ	Kajaani	64.277780000000007	27.6888889999999996
3259	\N	\N	KAK	Kar	-4.66666700000000034	146
3260	\N	\N	KAM	Kamaran Island	15.3499999999999996	41.6666680000000014
3261	\N	\N	KAN	Aminu Kano International Airport	12.0455489999999994	8.52227099999999993
3262	\N	\N	KAO	Kuusamo	65.9902799999999985	29.2338890000000013
3263	\N	\N	KAP	Kapanga	-8.5	22.6666680000000014
3264	\N	\N	KAQ	Kamulai	-8.13333300000000037	146.816669999999988
3265	\N	\N	KAR	Kamarang	5.88333300000000037	-60.6166699999999992
3266	\N	\N	KAS	Karasburg	-28	18.7333339999999993
3267	\N	\N	KAT	Kaitaia	-35.0662840000000031	173.285419999999988
3268	\N	\N	KAU	Kauhava	63.1000000000000014	23.0833319999999986
3269	\N	\N	KAV	Kavanayen	5.66666700000000034	-61.7666660000000007
3270	\N	\N	KAW	Kawthaung	10.0500000000000007	98.5166700000000048
3271	\N	\N	KAX	Kalbarri	-27.8666669999999996	114.133330000000001
3272	\N	\N	KAY	Wakaya Island	-17.0411110000000008	178.566120000000012
3273	\N	\N	KBA	Kabala	9.33333299999999966	-12
3274	\N	\N	KBB	Kirkimbie	-17.7666660000000007	129.21665999999999
3275	\N	\N	KBC	Birch Creek	66.2666700000000048	-145.800000000000011
3276	\N	\N	KBD	Kimberley Downs	-17.3333319999999986	124.349999999999994
3277	\N	\N	KBE	Hot Springs SPB	55.9294429999999991	-131.569999999999993
3278	\N	\N	KBF	Karubaga	-3.71666700000000017	138.449999999999989
3279	\N	\N	KBG	Kabalega Falls	2.32944400000000007	31.4963900000000017
3280	\N	\N	KBH	Kalat	29.1333330000000004	66.5166700000000048
3281	\N	\N	KBI	Kribi	2.95000000000000018	9.91666700000000034
3282	\N	\N	KBJ	Kings Canyon	-24.25	131.494450000000001
3283	\N	\N	KBK	Klag Bay	57.6666680000000014	-136.166670000000011
3284	\N	\N	KBL	Khwaja Rawash	34.560690000000001	69.211519999999993
3285	\N	\N	KBM	Kabwum	-6.16666700000000034	147.166670000000011
3286	\N	\N	KBN	Kabinda	-6.11666699999999963	24.5333329999999989
3287	\N	\N	KBO	Kabalo	-6.08805599999999991	26.9166680000000014
3288	\N	\N	KBP	Boryspil (Borispol)	50.3412440000000032	30.8952060000000017
3289	\N	\N	KBQ	Kasungu	-33.4666670000000011	13.016667
3290	\N	\N	KBR	Sultan Ismail Petra	6.17056999999999967	102.29092
3291	\N	\N	KBS	Bo	7.94388900000000042	-11.7619439999999997
3292	\N	\N	KBT	Kaben	9.16666700000000034	170.916670000000011
3293	\N	\N	KBU	Kotabaru	-3.3333330000000001	116.333336000000003
3294	\N	\N	KBW	Chignik Bay	56.2833329999999989	-158.383330000000001
3295	\N	\N	KBX	Kambuaya	-1	132.25
3296	\N	\N	KBY	Streaky Bay	-33	134
3297	\N	\N	KBZ	Kaikoura	-42.4166680000000014	173.683330000000012
3298	\N	\N	KCB	Tepoe Airstrip	3.14999999999999991	-55.7166670000000011
3299	\N	\N	KCC	Coffman Cove SPB	55.9833339999999993	-132.833329999999989
3300	\N	\N	KCD	Kamur	-6.20000000000000018	138.71665999999999
3301	\N	\N	KCE	Collinsville	-20.5500000000000007	147.866669999999999
3302	\N	\N	KCF	Kadanwari	27.1999999999999993	69.1500000000000057
3303	\N	\N	KCH	Kuching	1.48416700000000001	110.340835999999996
3304	\N	\N	KCI	Kon	-8.34999999999999964	127.049999999999997
3305	\N	\N	KCJ	Komaio	-7.26666699999999999	143.599999999999994
3306	\N	\N	KCM	Kahramanmaras	37.5344430000000031	36.9505580000000009
3307	\N	\N	KCN	SPB	53.3999999999999986	-167.550000000000011
3308	\N	\N	KCO	Cengiz Topel	40.75	29.8333319999999986
3309	\N	\N	KCP	Kamenets-podolskiy	48.6833340000000021	26.6166669999999996
3310	\N	\N	KCR	Colorado Creek	63.5700000000000003	-155.990000000000009
3311	\N	\N	KCS	Kings Creek Station	-24.3833330000000004	131.683330000000012
3312	\N	\N	KCT	Koggala	5.98305600000000037	80.3330500000000001
3313	\N	\N	KCU	Masindi	1.68333299999999997	31.7166670000000011
3314	\N	\N	KDA	Kolda	12.8833330000000004	-14.9666669999999993
3315	\N	\N	KDB	Kambalda	-30	120
3316	\N	\N	KDC	Kandi	11.1166669999999996	2.9166669999999999
3317	\N	\N	KDD	Khuzdar	27.7805560000000007	66.6305540000000036
3318	\N	\N	KDE	Koroba	-5.68333300000000019	142.733339999999998
3319	\N	\N	KDH	Kandahar	31.5069450000000018	65.8474999999999966
3320	\N	\N	KDI	Wolter Monginsidi	-4.08550099999999983	122.409546000000006
3321	\N	\N	KDK	Municipal	57.8072200000000009	-152.370000000000005
3322	\N	\N	KDL	Kardla	58.9833339999999993	22.8000000000000007
3323	\N	\N	KDM	Kaadedhdhoo	0.491526999999999992	72.9959300000000013
3324	\N	\N	KDN	Ndende	-2.5	11.1666670000000003
3325	\N	\N	KDP	Kandep	-5.86666699999999963	143.5
3326	\N	\N	KDQ	Kamberatoro	-3.60555599999999998	141.050000000000011
3327	\N	\N	KDR	Kandrian	41.6166699999999992	25.3333319999999986
3328	\N	\N	KDS	Kamaran Downs	-24.3333319999999986	139.166670000000011
3329	\N	\N	KDT	Kamphangsaen	14.0999999999999996	99.9166639999999973
3330	\N	\N	KDV	Kandavu	-19.0539680000000011	178.15607
3331	\N	\N	KDW	Vic. Resevour Kandy	7.29999999999999982	80.6333300000000008
3332	\N	\N	KDY	Mahaweli	7.46666700000000017	80.5166700000000048
3333	\N	\N	KDZ	Polgolla Reservoir	7.33055500000000038	80.6416700000000048
3334	\N	\N	KEA	Keisah	-7.03333299999999983	140.03334000000001
3335	\N	\N	KEB	Nanwalek	59.3527800000000028	-151.922230000000013
3336	\N	\N	KEC	Kasenga	-10.3333329999999997	28.75
3337	\N	\N	KED	Kaedi	16.1613879999999988	-13.5077780000000001
3338	\N	\N	KEE	Kelle	-0.0833330000000000043	14.5333330000000007
3339	\N	\N	KEG	Keglsugl	-5.79999999999999982	145.083329999999989
3340	\N	\N	KEH	Kenmore Air Harbor	47.7550000000000026	-122.25806
3341	\N	\N	KEI	Kepi	-6.56666699999999981	139.333329999999989
3342	\N	\N	KEJ	Kemerovo	55.2805669999999978	86.1162300000000016
3343	\N	\N	KEK	Ekwok	59.3552779999999984	-157.477499999999992
3344	\N	\N	KEL	Kiel-Holtenau	54.3808330000000026	10.1433330000000002
3345	\N	\N	KEM	Kemi/Tornio	65.780060000000006	24.5767699999999998
3346	\N	\N	KEN	Kenema	7.88333300000000037	-11.1833329999999993
3347	\N	\N	KEO	Odienne	9.49000000000000021	-7.57083300000000037
3348	\N	\N	KEP	Nepalganj	28.1325000000000003	81.5763850000000019
3349	\N	\N	KEQ	Kebar	-5.83333299999999966	134.833329999999989
3350	\N	\N	KER	Kerman	30.2587779999999995	56.9619199999999992
3351	\N	\N	KES	Kelsey	56.0166660000000007	-96.5
3352	\N	\N	KEU	Kelly Bar	67.9166639999999973	-162.28334000000001
3353	\N	\N	KEV	Halli	61.5833319999999986	24.75
3354	\N	\N	KEW	Keewaywin	52.9922200000000032	-92.8388900000000064
3355	\N	\N	KEX	Kanabea	-7.48333300000000001	145.916670000000011
3356	\N	\N	KEY	Kericho	-0.366667000000000021	35.2833329999999989
3357	\N	\N	KEZ	Kelaniya River	6.98333300000000001	79.9166639999999973
3358	\N	\N	KFA	Kiffa	16.5888880000000007	-11.4052779999999991
3359	\N	\N	KFG	Kalkurung	-17.4333320000000001	130.816669999999988
3360	\N	\N	KGA	Kananga	-5.90000000000000036	22.4166680000000014
3361	\N	\N	KGB	Konge	-6.13333300000000037	147.650000000000006
3362	\N	\N	KGC	Kingscote	-35.7093050000000005	137.523320000000012
3363	\N	\N	KGD	Khrabrovo	54.8826559999999972	20.5866450000000007
3364	\N	\N	KGE	Kagau	-8.16499999999999915	157.586099999999988
3365	\N	\N	KGG	Kedougou	12.5708330000000004	-12.2172219999999996
3366	\N	\N	KGH	Yongai	-4.83333299999999966	142.666670000000011
3367	\N	\N	KGI	Kalgoorlie	-30.7852460000000008	121.457920000000001
3368	\N	\N	KGJ	Karonga	-9.95777799999999935	33.8922230000000013
3369	\N	\N	KGK	New Koliganek	59.7999999999999972	-157.233339999999998
3370	\N	\N	KGL	Kigalin International	-1.96304199999999995	30.1350140000000017
3371	\N	\N	KGM	Kungum	-5.17999999999999972	39.7800000000000011
3372	\N	\N	KGN	Kasongo Lunda	-6.58333299999999966	16.8166679999999999
3373	\N	\N	KGO	Kirovograd	48.5499999999999972	32.2999999999999972
3374	\N	\N	KGR	Kulgera	-25.8333319999999986	133.03334000000001
3375	\N	\N	KGS	Kos Island International Airport	36.793056	27.0952780000000004
3376	\N	\N	KGU	Keningau	5.35666699999999985	116.161940000000001
3377	\N	\N	KGW	Kagi	-9.05000000000000071	146.833329999999989
3378	\N	\N	KGY	Kingaroy	-26.5500000000000007	151.833329999999989
3379	\N	\N	KGZ	Glacier Creek	61.4500000000000028	-142.383330000000001
3380	\N	\N	KHA	Khaneh	36.7333339999999993	45.1499999999999986
3381	\N	\N	KHC	Kerch	45.3666699999999992	36.4500000000000028
3382	\N	\N	KHG	Kashi	39.5349730000000008	76.0110700000000037
3383	\N	\N	KHJ	Kauhajoki	62.4630549999999971	22.3947220000000016
3384	\N	\N	KHK	Khark Island	29.2616669999999992	50.3236119999999971
3385	\N	\N	KHM	Khamti	25.9935130000000001	95.6796499999999952
3386	\N	\N	KHN	Nanchang	28.8599010000000007	115.907844999999995
3387	\N	\N	KHO	Khoka Moya	-24.5833319999999986	31.4166680000000014
3388	\N	\N	KHR	Kharkhorin	46.7833329999999989	102.849999999999994
3389	\N	\N	KHT	Khost	35	72
3390	\N	\N	KHU	Kremenchug	49.1000000000000014	33.4500000000000028
3391	\N	\N	KHV	Novyy	48.5245630000000006	135.168610000000001
3392	\N	\N	KHW	Khwai River Lodge	-19	23.5
3393	\N	\N	KHY	Khoy	38.4291699999999992	44.9713899999999995
3394	\N	\N	KHZ	Kauehi	-15.766667	-145.116669999999999
3395	\N	\N	KIA	Kaiapit	-6.26666699999999999	146.25
3396	\N	\N	KIB	SPB	55.8936119999999974	-159.567499999999995
3397	\N	\N	KIC	Mesa Del Rey	36.2166670000000011	-121.133330000000001
3398	\N	\N	KIE	Aropa	-6.31666699999999981	155.71665999999999
3399	\N	\N	KIG	Koinghaas	-30.1999999999999993	17.2666660000000007
3400	\N	\N	KII	Kibuli	-9.01638900000000021	142.695279999999997
3401	\N	\N	KIK	Kirkuk	35.5166660000000007	44.2833329999999989
3402	\N	\N	KIL	Kilwa	-8.40000000000000036	28.0500000000000007
3403	\N	\N	KIM	Kimberley	-28.8058340000000008	24.7663900000000012
3404	\N	\N	KIN	Norman Manley	17.9377500000000012	-76.7781599999999997
3405	\N	\N	KIO	Kili Island	5.65000000000000036	169.199999999999989
3406	\N	\N	KIP	Kickapoo	33.8999999999999986	-98.5
3407	\N	\N	KIQ	Kira	-8.11666699999999963	147.349999999999994
3408	\N	\N	KIR	Kerry	52.181477000000001	-9.53566600000000086
3409	\N	\N	KIS	Kisumu	-0.0849459999999999937	34.7374999999999972
3410	\N	\N	KIT	Kithira	36.2916680000000014	23.0249999999999986
3411	\N	\N	KIU	Kiunga	-1.73333300000000001	41.5166660000000007
3412	\N	\N	KIV	International Airport Chisinau	46.9354439999999968	28.9349670000000003
3413	\N	\N	KIW	Southdowns	-12.8394440000000003	28.230556
3414	\N	\N	KIY	Kilwa	-8.91194400000000009	39.5116650000000007
3415	\N	\N	KIZ	Kikinonda	-8.65000000000000036	147.916670000000011
3416	\N	\N	KJK	Kortrijk	50.8172229999999985	3.20166700000000004
3417	\N	\N	KJP	Kerama	26.0833319999999986	127.333336000000003
3418	\N	\N	KJU	Kamiraba	-2.88333299999999992	151.25
3419	\N	\N	KKC	Khon Kaen	16.4646700000000017	102.787490000000005
3420	\N	\N	KKD	Kokoda	-8.88615300000000019	147.731220000000008
3421	\N	\N	KKE	Kerikeri/Bay of Islands	-35.2632830000000013	173.91237000000001
3422	\N	\N	KKF	Kagvik Creek	67.5999999999999943	-163.5
3423	\N	\N	KKG	Konawaruk	5.26666699999999999	-59.8166659999999979
3424	\N	\N	KKH	Kongiganak	59.9666670000000011	-162.75
3425	\N	\N	KKJ	Kita Kyushu	33.8343729999999994	130.9435
3426	\N	\N	KKK	Kalakaket AFS	64.4249999999999972	-156.841109999999986
3427	\N	\N	KKL	Karluk Lake SPB	57.5499999999999972	-154.53334000000001
3428	\N	\N	KKM	Lop Buri	14.8000000000000007	100.616669999999999
3429	\N	\N	KKN	Hoeybuktmoen	69.7235000000000014	29.8911839999999991
3430	\N	\N	KKO	Kaikohe	-35.4527780000000021	173.816669999999988
3431	\N	\N	KKP	Koolburra	-15.5833329999999997	143.949999999999989
3432	\N	\N	KKT	Kentland	40.7666660000000007	-87.4500000000000028
3433	\N	\N	KKU	Ekuk	58.8125	-158.560560000000009
3434	\N	\N	KKW	Kikwit	-5.036111	18.7802770000000017
3435	\N	\N	KKX	Kikaiga Shima	28.3213879999999989	129.928050000000013
3436	\N	\N	KKY	Kilkenny	52.6499999999999986	-7.25
3437	\N	\N	KKZ	Koh Kong	11.6333330000000004	102.966669999999993
3438	\N	\N	KLB	Kalabo	-14.9758329999999997	22.644444
3439	\N	\N	KLC	Kaolack	14.0833329999999997	-16.5
3440	\N	\N	KLD	Migalovo	56.9166680000000014	35.9166680000000014
3441	\N	\N	KLE	Kaele	10.1166669999999996	14.4499999999999993
3442	\N	\N	KLF	Kaluga	54.5	36.2666660000000007
3443	\N	\N	KLG	Municipal	61.5325800000000029	-160.346499999999992
3444	\N	\N	KLH	Kolhapur	16.6666680000000014	74.3333360000000027
3445	\N	\N	KLI	Kota Koli	-4.16666700000000034	21.75
3446	\N	\N	KLK	Kalokol	-6.78333299999999983	25.7833329999999989
3447	\N	\N	KLM	Kalaleh	37.3666699999999992	55.4500000000000028
3448	\N	\N	KLN	Larsen SPB	57.5333329999999989	-154
3449	\N	\N	KLP	Kelp Bay	57.5499999999999972	-134.866669999999999
3450	\N	\N	KLQ	Keluang	-2.68333300000000019	103.900000000000006
3451	\N	\N	KLR	Kalmar	56.6850000000000023	16.2872219999999999
3452	\N	\N	KLS	Longview	46.1499999999999986	-122.900000000000006
3453	\N	\N	KLT	Kaiserslautern	49.4333340000000021	7.75
3454	\N	\N	KLU	Alpe Adria	46.6501239999999981	14.324192
3455	\N	\N	KLY	Kalima	-2.54999999999999982	26.5333329999999989
3456	\N	\N	KLZ	Kleinzee	-29.6833320000000001	17.0666679999999999
3457	\N	\N	KMA	Kerema	-7.96170199999999983	145.771549999999991
3458	\N	\N	KMB	Koinambe	-5.5	144.633330000000001
3459	\N	\N	KMF	Kamina	-7.61666699999999963	145.995830000000012
3460	\N	\N	KMG	Kunming	25.1019439999999996	102.929169999999999
3461	\N	\N	KMH	Kuruman	-27.4666670000000011	23.4666670000000011
3462	\N	\N	KMI	Miyazaki	31.8724980000000002	131.44147000000001
3463	\N	\N	KMJ	Kumamoto	32.8341330000000013	130.857990000000001
3464	\N	\N	KMK	Makabana	-3.48333300000000001	12.6166669999999996
3465	\N	\N	KML	Kamileroi	-19.3666669999999996	140.050000000000011
3466	\N	\N	KMM	Kimam	-3.6666669999999999	136.166670000000011
3467	\N	\N	KMN	Kamina	-8.64111100000000043	25.25
3468	\N	\N	KMO	Manokotak SPB	58.9844440000000034	-159.035830000000004
3469	\N	\N	KMP	J.G.H. Van Der Wath	-26.5336110000000005	18.1000000000000014
3470	\N	\N	KMR	Karimui	-6.5	144.866669999999999
3471	\N	\N	KMT	Kampot	10.5999999999999996	104.166663999999997
3472	\N	\N	KMU	Kismayu	-0.41666700000000001	42.8416670000000011
3473	\N	\N	KMV	Kalemyo	23.1833320000000001	94.0499999999999972
3474	\N	\N	KMX	Khamis Mushait	18.3000000000000007	42.7166670000000011
3475	\N	\N	KMY	Moser Bay	57.5333329999999989	-154.150000000000006
3476	\N	\N	KMZ	Kaoma	-14.7988890000000008	24.8033329999999985
3477	\N	\N	KNA	Vina del Mar	-33.0333329999999989	-71.5666659999999979
3478	\N	\N	KNB	Kanab	37.0499999999999972	-112.533330000000007
3479	\N	\N	KND	Kindu	-2.92249999999999988	25.9138890000000011
3480	\N	\N	KNE	Kanainj	-5.28333299999999983	144.699999999999989
3481	\N	\N	KNF	Marham RAF	52.75	0.400000000000000022
3482	\N	\N	KNG	Kaimana	-3.64999999999999991	133.75
3483	\N	\N	KNI	Katanning	-33.7000000000000028	117.549999999999997
3484	\N	\N	KNJ	Kindamba	-3.95000000000000018	14.516667
3485	\N	\N	KNK	Kakhonak	59.4333340000000021	-154.849999999999994
3486	\N	\N	KNL	Kelanoa	-6	147.5
3487	\N	\N	KNM	Kaniama	-7.51666699999999999	24.1833320000000001
3488	\N	\N	KNN	Kankan	10.3975000000000009	-9.30555599999999927
3489	\N	\N	KNP	Capanda	-9.76694400000000051	15.4502780000000008
3490	\N	\N	KNR	Jam	27.8180559999999986	52.350833999999999
3491	\N	\N	KNS	King Island	-39.8797759999999997	143.881679999999989
3492	\N	\N	KNT	Municipal	36.230556	-90.034719999999993
3493	\N	\N	KNV	Knights Inlet	50.6833340000000021	-125.833336000000003
3494	\N	\N	KNW	New Stuyahok	59.452219999999997	-157.329730000000012
3495	\N	\N	KNX	Kununurra	-15.7840310000000006	128.712680000000006
3496	\N	\N	KNY	Kinoosao	57.0666659999999979	-102.033330000000007
3497	\N	\N	KNZ	Kenieba	12.8433329999999994	-11.2524999999999995
3498	\N	\N	KOA	Kona International Airport	19.7361739999999983	-156.041079999999994
3499	\N	\N	KOD	Kotabangun	-0.266666999999999987	116.583336000000003
3500	\N	\N	KOF	Komatipoort	-25.4333320000000001	31.9333320000000001
3501	\N	\N	KOG	Khong	15.5666670000000007	105.816665999999998
3502	\N	\N	KOH	Koolatah	-15.9666669999999993	142.416670000000011
3503	\N	\N	KOI	Orkney Island	58.9580569999999966	-2.90055599999999991
3504	\N	\N	KOJ	Kagoshima	31.8012240000000013	130.715620000000001
3505	\N	\N	KOK	Kruunupyy	63.7188379999999981	23.1330680000000015
3506	\N	\N	KOL	Koumala	8.5	21.25
3507	\N	\N	KOM	Komo-Manda	-6.13333300000000037	143.633330000000001
3508	\N	\N	KON	Kontum	14.3541670000000003	108.021384999999995
3509	\N	\N	KOO	Kongolo	-5.38333300000000037	27
3510	\N	\N	KOQ	Koethen	51.7166670000000011	11.9499999999999993
3511	\N	\N	KOR	Kokoro	-7.80833300000000019	146.550000000000011
3512	\N	\N	KOU	Koulamoutou	-1.11666700000000008	12.5083330000000004
3513	\N	\N	KOV	Kokshetau	53.3166659999999979	69.4000000000000057
3514	\N	\N	KOW	Ganzhou	25.8516669999999991	114.776664999999994
3515	\N	\N	KOX	Kokonao	-4.71666700000000017	136.416670000000011
3516	\N	\N	KOZ	Ouzinkie SPB	57.9166680000000014	-152.5
3517	\N	\N	KPA	Kopiago	-5.38333300000000037	142.550000000000011
3518	\N	\N	KPB	Point Baker SPB	56.3333319999999986	-133.583329999999989
3519	\N	\N	KPC	Port Clarence	65.2544400000000024	-166.855829999999997
3520	\N	\N	KPD	King Of Prussia	40.0833319999999986	-75.4000000000000057
3521	\N	\N	KPE	Yapsiei	-4.04999999999999982	141.166670000000011
3522	\N	\N	KPF	Kondubol	-8.5330560000000002	142.511950000000013
3523	\N	\N	KPG	Kurupung	6.46666700000000017	-59.1666680000000014
3524	\N	\N	KPH	Pauloff Harbor SPB	54.4500000000000028	-162.683330000000012
3525	\N	\N	KPI	Kapit	2.01055599999999979	112.92944
3526	\N	\N	KPK	Parks SPB	57.4336130000000011	-153.900000000000006
3527	\N	\N	KPL	Kapal	-8.63305599999999984	142.824450000000013
3528	\N	\N	KPM	Kompiam	-5.38333300000000037	143.933330000000012
3529	\N	\N	KPN	Kipnuk SPB	59.9333340000000021	-164.050000000000011
3530	\N	\N	KPP	Kalpowar	-19.9666670000000011	143.933330000000012
3531	\N	\N	KPS	Kempsey	-31.0833319999999986	152.766660000000002
3532	\N	\N	KPT	Jackpot	41.9833339999999993	-114.666663999999997
3533	\N	\N	KPV	Perryville SPB	55.9066660000000013	-159.14500000000001
3534	\N	\N	KQL	Kol	-5.65000000000000036	144.866669999999999
3535	\N	\N	KRA	Kerang	-35.6666680000000014	143.916670000000011
3536	\N	\N	KRB	Karumba	-17.4566669999999995	140.831940000000003
3537	\N	\N	KRC	Kerinci	-1.71666699999999994	101.25
3538	\N	\N	KRD	Kurundi	-20.5166660000000007	134.666670000000011
3539	\N	\N	KRE	Kirundo	-3.3333330000000001	29
3540	\N	\N	KRF	Kramfors	63.0494419999999991	17.7727779999999989
3541	\N	\N	KRG	Karasabai	4.01666699999999999	-59.5166660000000007
3542	\N	\N	KRI	Kikori	-7.48333300000000001	144.266660000000002
3543	\N	\N	KRJ	Karawari	-4.61666699999999963	143.516660000000002
3544	\N	\N	KRM	Karanambo	3.75	-59.3166659999999979
3545	\N	\N	KRN	Kiruna	67.8222200000000015	20.3458329999999989
3546	\N	\N	KRP	Karup	56.2999999999999972	9.11666699999999963
3547	\N	\N	KRQ	Kramatorsk	48.7166670000000011	37.6166699999999992
3548	\N	\N	KRR	Pashkovsky	45.0341379999999987	39.1390039999999999
3549	\N	\N	KRS	Kjevik	58.2025500000000022	8.07373199999999969
3550	\N	\N	KRU	Kerau	-8.30000000000000071	147.083329999999989
3551	\N	\N	KRV	Kerio Valley	2.98333300000000001	36.1166699999999992
3552	\N	\N	KRW	Turkmanbashi	40.0833319999999986	53.0833319999999986
3553	\N	\N	KRX	Kar Kar	-4.5	145.96665999999999
3554	\N	\N	KRY	Karamay	45.6166699999999992	84.8833300000000008
3555	\N	\N	KRZ	Kiri	-1.48333300000000001	19
3556	\N	\N	KSB	Kasanombe	-6.38333300000000037	147.016660000000002
3557	\N	\N	KSD	Karlstad	59.3602830000000026	13.4720589999999998
3558	\N	\N	KSE	Kasese	0.185555999999999999	30.100833999999999
3559	\N	\N	KSF	Kassel-Calden	51.4158550000000005	9.38085799999999992
3560	\N	\N	KSG	Kisengan	-6.34999999999999964	146.71665999999999
3561	\N	\N	KSI	Kissidougou	9.1833329999999993	-10.0999999999999996
3562	\N	\N	KSJ	Kasos Island	35.4213900000000024	26.9166680000000014
3563	\N	\N	KSK	Karlskoga	59.3166659999999979	14.5500000000000007
3564	\N	\N	KSL	Kassala	15.3902780000000003	36.3422199999999975
3565	\N	\N	KSM	Saint Marys	62.0586660000000023	-163.294890000000009
3566	\N	\N	KSP	Kosipe	-8.55000000000000071	147.46665999999999
3567	\N	\N	KSR	Federal No 1	56.2333339999999993	-160.233059999999995
3568	\N	\N	KSS	Sikasso	11.3000000000000007	-5.58333299999999966
3569	\N	\N	KST	Kosti	13.1333330000000004	32.7166670000000011
3570	\N	\N	KSU	Kvernberget	63.1147229999999979	7.84444400000000019
3571	\N	\N	KSV	Springvale	-23.5500000000000007	140.683330000000012
3572	\N	\N	KSW	Kiryat Shmona	33.2166670000000011	35.5666659999999979
3573	\N	\N	KSX	Yasuru	-6.59999999999999964	146.183330000000012
3574	\N	\N	KSZ	Kotlas	61.2333339999999993	46.7000000000000028
3575	\N	\N	KTA	Karratha	-20.7082599999999992	116.770060000000001
3576	\N	\N	KTC	Katiola	8.16666700000000034	-5.16666700000000034
3577	\N	\N	KTD	Kitadaito	25.9499999999999993	131.300000000000011
3578	\N	\N	KTE	Kerteh	4.53833299999999973	103.428330000000003
3579	\N	\N	KTF	Takaka	-40.8500000000000014	172.800000000000011
3580	\N	\N	KTG	Ketapang	-1.8333330000000001	109.983329999999995
3581	\N	\N	KTH	SPB	59.9666670000000011	-158.333329999999989
3582	\N	\N	KTI	Kratie	12.5	106.049999999999997
3583	\N	\N	KTK	Kanua	-5.338889	154.75
3584	\N	\N	KTN	International	55.3565499999999986	-131.708699999999993
3585	\N	\N	KTO	Kato	4.65000000000000036	-59.8166659999999979
3586	\N	\N	KTP	Tinson	17.9875000000000007	-76.8233299999999986
3587	\N	\N	KTQ	Kitee	62.1658329999999992	30.0766680000000015
3588	\N	\N	KTR	Tindal	-14.4574999999999996	132.2714
3589	\N	\N	KTS	Brevig Mission	65.3294450000000069	-166.471660000000014
3590	\N	\N	KTT	Kittila	67.6959460000000064	24.8590279999999986
3591	\N	\N	KTU	Kota	25	76.5
3592	\N	\N	KTV	Kamarata	5.75	-62.4166680000000014
3593	\N	\N	KTW	Pyrzowice	50.4708329999999989	19.0740300000000005
3594	\N	\N	KTX	Koutiala	12.4166670000000003	-5.38333300000000037
3595	\N	\N	KTY	Katukurunda Slaf Base	6	80.2999999999999972
3596	\N	\N	KUA	Kuantan	3.78076500000000015	103.215180000000004
3597	\N	\N	KUC	Kuria	0.233333000000000013	173.383330000000001
3598	\N	\N	KUE	Kukundu	-8.01666699999999999	156
3599	\N	\N	KUG	Kubin Island	-10.233333	142.300000000000011
3600	\N	\N	KUI	Kawau Island	-36.4166680000000014	174.833329999999989
3601	\N	\N	KUJ	Kushimoto	33.4333340000000021	135.78334000000001
3602	\N	\N	KUK	Kasigluk	60.8760869999999983	-162.521240000000006
3603	\N	\N	KUM	Yakushima	30.3855550000000001	130.659160000000014
3604	\N	\N	KUN	Kaunas	54.8999999999999986	23.9166680000000014
3605	\N	\N	KUO	Kuopio	63.0089070000000007	27.7886960000000016
3606	\N	\N	KUP	Kupiano	-10.0916669999999993	148.166670000000011
3607	\N	\N	KUQ	Kuri	-7.13333300000000037	143.266660000000002
3608	\N	\N	KUR	Kuran-O-Munjan	38.3999999999999986	71.1166699999999992
3609	\N	\N	KUU	Kullu Manali	31.9833339999999993	77.0999999999999943
3610	\N	\N	KUV	Gunsan	35.9833339999999993	126.75
3611	\N	\N	KUW	Kugururok River	67.9666699999999935	-161.983339999999998
3612	\N	\N	KUX	Kuyol	-5.37833299999999959	141.630549999999999
3613	\N	\N	KUY	Kamusi Airport	-7.42750000000000021	143.123889999999989
3614	\N	\N	KUZ	Gunsan Airbase	37.7166670000000011	128.816669999999988
3615	\N	\N	KVB	Skovde	58.4500000000000028	13.9666669999999993
3616	\N	\N	KVD	Gyandzha	40.7333339999999993	46.3166659999999979
3617	\N	\N	KVE	Kitava	-8.66666700000000034	151.333329999999989
3618	\N	\N	KVG	Kavieng	-2.5807500000000001	150.806530000000009
3619	\N	\N	KVK	Kirovsk	67.5833360000000027	33.5833319999999986
3620	\N	\N	KVL	Kivalina	67.731669999999994	-164.547230000000013
3621	\N	\N	KVU	Korolevu	-17.7666660000000007	178
3622	\N	\N	KVX	Kirov	58.5	49.3500000000000014
3623	\N	\N	KWB	Karimunjawa	-5.83333299999999966	110.5
3624	\N	\N	KWD	Kawadjia	-1.94999999999999996	124.969999999999999
3625	\N	\N	KWE	Guiyang	26.5442159999999987	106.79598
3626	\N	\N	KWF	Waterfall SPB	55.2972219999999979	-133.241669999999999
3627	\N	\N	KWG	Krivoy Rog	48.0499999999999972	33.2166670000000011
3628	\N	\N	KWH	Khwahan	33.9166680000000014	66.3333360000000027
3629	\N	\N	KWI	Kuwait International	29.2401160000000004	47.9712519999999998
3630	\N	\N	KWJ	Gwangju	35.1401749999999993	126.810209999999998
3631	\N	\N	KWK	Kwigillingok	59.8333319999999986	-163.133330000000001
3632	\N	\N	KWL	Guilin	25.1333330000000004	110.316665999999998
3633	\N	\N	KWM	Kowanyama	-15.4875000000000007	141.748340000000013
3634	\N	\N	KWO	Kawito	-7.98333300000000001	142.816669999999988
3635	\N	\N	KWP	Village SPB	57.7669449999999998	-153.550000000000011
3636	\N	\N	KWR	Kwai Harbour	-8.5666670000000007	160.733339999999998
3637	\N	\N	KWS	Kwailabesi Aerodrom	41.3501929999999973	-71.8068999999999988
3638	\N	\N	KWT	Kwethluk	60.8088869999999986	-161.4375
3639	\N	\N	KWU	Mansion House	22.3166679999999999	114.216669999999993
3640	\N	\N	KWV	Kurwina	-6.18333300000000019	155.333329999999989
3641	\N	\N	KWX	Kiwai Island	-8.58333299999999966	143.416670000000011
3642	\N	\N	KWY	Kiwayu	-2.01666699999999999	41.2666660000000007
3643	\N	\N	KWZ	Kolwezi	-10.766667	25.5069450000000018
3644	\N	\N	KXA	Kasaan SPB	55.5377769999999984	-132.395829999999989
3645	\N	\N	KXE	Klerksdorp	-26.8666669999999996	26.7166670000000011
3646	\N	\N	KXF	Koro Island	-17.3333319999999986	179.833329999999989
3647	\N	\N	KXR	Karoola	-5.15000000000000036	154.583329999999989
3648	\N	\N	KXU	Katiu	-16.3394429999999993	-144.403060000000011
3649	\N	\N	KYE	Kleyate	34.5861099999999979	36.0027770000000018
3650	\N	\N	KYF	Yeelirrie	-27.2777789999999989	120.075000000000003
3651	\N	\N	KYI	Yalata Mission	-31.4833339999999993	131.866669999999999
3652	\N	\N	KYL	Port Largo	25.0666679999999999	-80.4666699999999935
3653	\N	\N	KYN	Milton Keynes	52.0342800000000025	-0.77410699999999999
3654	\N	\N	KYO	Topp Of Tampa	28.2166670000000011	-82.3666699999999992
3655	\N	\N	KYS	Kayes	14.4319439999999997	-11.4394439999999999
3656	\N	\N	KYT	Kyauktaw	21.3999999999999986	94.1333300000000008
3657	\N	\N	KYX	Yalumet	-6.18333300000000019	147.016660000000002
3658	\N	\N	KZB	Zachar Bay SPB	57.5499999999999972	-153.75
3659	\N	\N	KZC	Kompong-Chhna	12.3333329999999997	104.583336000000003
3660	\N	\N	KZD	Krakor	12.5333330000000007	104.200000000000003
3661	\N	\N	KZF	Kaintiba	-7.46666700000000017	146
3662	\N	\N	KZG	Kitzingen	49.7333339999999993	10.1500000000000004
3663	\N	\N	KZH	Kizhuyak	57.5833319999999986	-153.150000000000006
3664	\N	\N	KZI	Philippos Airport	40.2886120000000005	21.8419440000000016
3665	\N	\N	KZO	Kzyl-Orda	44.7122230000000016	65.5928799999999939
3666	\N	\N	KZS	Kastelorizo	36.0833319999999986	29.3333319999999986
3667	\N	\N	LAA	Lamar Field	38.0686099999999996	-102.690280000000001
3668	\N	\N	LAB	Lablab	-5.63333300000000037	148.066669999999988
3669	\N	\N	LAC	Layang-Layang Airstrip	7.40000000000000036	113.849999999999994
3670	\N	\N	LAD	4 de Fevereiro	-8.84795100000000012	13.2348619999999997
3671	\N	\N	LAF	Purdue University	40.4119450000000029	-86.9336100000000016
3672	\N	\N	LAG	La Guaira	10.5999999999999996	-66.9333340000000021
3673	\N	\N	LAH	Labuha	-0.616666999999999965	127.483329999999995
3674	\N	\N	LAJ	Lages	-27.8000000000000007	-50.3166659999999979
3675	\N	\N	LAK	Aklavik	68.222219999999993	-134.985839999999996
3676	\N	\N	LAM	Los Alamos	35.8833300000000008	-106.316665999999998
3677	\N	\N	LAN	Capital City	42.7741850000000028	-84.589579999999998
3678	\N	\N	LAO	Laoag International Airport	18.1824070000000013	120.534130000000005
3679	\N	\N	LAR	General Brees Field	41.3136099999999971	-105.673060000000007
3680	\N	\N	LAS	Mc Carran International	36.0869450000000001	-115.148600000000002
3681	\N	\N	LAT	La Uribe	4.75	-74.0499999999999972
3682	\N	\N	LAU	Lamu	-2.25	40.9116670000000013
3683	\N	\N	LAV	Lalomalava	-14.016667	-171.733339999999998
3684	\N	\N	LAW	Municipal	34.5697199999999967	-98.4161150000000049
3685	\N	\N	LAY	Ladysmith	-28.5666679999999999	29.75
3686	\N	\N	LAZ	Bom Jesus Da Lapa	-13.2569440000000007	-43.4125000000000014
3687	\N	\N	LBB	Lubbock Preston Smith International	33.6562199999999976	-101.822299999999998
3688	\N	\N	LBC	Lübeck Blankensee	53.8052700000000002	10.7011620000000001
3689	\N	\N	LBF	Lee Bird Field	41.1283340000000024	-100.696669999999997
3690	\N	\N	LBG	Le Bourget	48.9719430000000031	2.44249999999999989
3691	\N	\N	LBH	Palm Beach SPB	-33.9441679999999977	151.175829999999991
3692	\N	\N	LBI	Le Sequestre	43.9333340000000021	2.14999999999999991
3693	\N	\N	LBK	Liboi	0.383332999999999979	40.9666670000000011
3694	\N	\N	LBL	Municipal	37.0444450000000032	-100.960555999999997
3695	\N	\N	LBM	Luabo	-18.5	36.1666680000000014
3696	\N	\N	LBN	Lake Baringo	0.66666700000000001	36.0833319999999986
3697	\N	\N	LBO	Lusambo	-4.96666700000000017	23.4499999999999993
3698	\N	\N	LBP	Long Banga Airfield	3.20000000000000018	115.400000000000006
3699	\N	\N	LBQ	Lambarene	-0.714721999999999968	10.2394440000000007
3700	\N	\N	LBR	Labrea	-7.25	-64.8499999999999943
3701	\N	\N	LBT	Lumberton	34.6140400000000028	-79.0601099999999946
3702	\N	\N	LBV	Libreville	0.456963000000000008	9.40985200000000077
3703	\N	\N	LBW	Long Bawan	0.58333299999999999	115.166663999999997
3704	\N	\N	LBX	Lubang	13.8655559999999998	120.105000000000004
3705	\N	\N	LBY	Montoir	47.2888900000000021	-2.34583299999999983
3706	\N	\N	LBZ	Lukapa	-8.38333300000000037	20.6666680000000014
3707	\N	\N	LCB	Pontes e Lacerda	-13.0133329999999994	-59.9986099999999993
3708	\N	\N	LCC	Galatina	40.2427800000000033	18.1333330000000004
3709	\N	\N	LCD	Louis Trichardt	-23.0166660000000007	29.7166670000000011
3710	\N	\N	LCE	Goloson International	15.7405559999999998	-86.8572199999999981
3711	\N	\N	LCF	Las Vegas	15.6677780000000002	-88.9477799999999945
3712	\N	\N	LCG	La Coruna	43.3023600000000002	-8.38192300000000046
3713	\N	\N	LCH	Municipal	30.1311110000000006	-93.2255549999999999
3714	\N	\N	LCI	Municipal	43.571390000000001	-71.4211099999999988
3715	\N	\N	LCJ	Lodz Lublinek	51.7219430000000031	19.3983330000000009
3716	\N	\N	LCL	La Coloma	22.2833329999999989	-83.6166699999999992
3717	\N	\N	LCM	La Cumbre	-30.9666670000000011	-64.5
3718	\N	\N	LCN	Balcanoona	-30.5166660000000007	139.349999999999994
3719	\N	\N	LCO	Lague	-2.45000000000000018	14.5333330000000007
3720	\N	\N	LCP	Loncopue	-38.0833319999999986	-70.6666639999999973
3721	\N	\N	LCR	La Chorrera	-0.733333000000000013	-73.0166700000000048
3722	\N	\N	LCS	Las Canas	10.4188890000000001	-85.1041639999999973
3723	\N	\N	LCV	Lucca	43.8333319999999986	10.5833329999999997
3724	\N	\N	LDA	Malda	25.0333329999999989	88.1500000000000057
3725	\N	\N	LDB	Londrina	-23.3284570000000002	-51.1377140000000026
3726	\N	\N	LDC	Lindeman Island	-21	149
3727	\N	\N	LDG	Leshukonskoye	64.9000000000000057	45.75
3728	\N	\N	LDI	Kikwetu	-9.84583300000000072	39.7594449999999995
3729	\N	\N	LDJ	Linden	40.6166699999999992	-74.25
3730	\N	\N	LDK	Hovby	58.5	13.1666670000000003
3731	\N	\N	LDM	Mason County	44.0753330000000005	-86.4791639999999973
3732	\N	\N	LDN	Lamidanda	27.25	86.7166699999999935
3733	\N	\N	LDO	Ladouanie	4.21666700000000017	-55.2333339999999993
3734	\N	\N	LDR	Lodar	13.9000000000000004	45.8666699999999992
3735	\N	\N	LDU	Lahad Datu	5.03527799999999992	118.32611
3736	\N	\N	LDV	Landivisiau	48.5	-4.09999999999999964
3737	\N	\N	LDW	Lansdowne	-17.8833330000000004	126.650000000000006
3738	\N	\N	LDX	St-Laurent du Maroni	5.48333300000000001	-54.0499999999999972
3739	\N	\N	LDY	Eglinton (City of Derry)	55.0395660000000007	-7.15583499999999972
3740	\N	\N	LDZ	Londolozi	-24.8000000000000007	31.5
3741	\N	\N	LEA	Learmonth	-22.239882999999999	114.094269999999995
3742	\N	\N	LEB	White River	43.6293599999999984	-72.3100050000000039
3743	\N	\N	LEE	Leesburg	28.8333319999999986	-81.8166659999999979
3744	\N	\N	LEF	Lebakeng	-29.7833329999999989	28.5833319999999986
3745	\N	\N	LEG	Aleg	17.1666680000000014	-13.9499999999999993
3746	\N	\N	LEH	Octeville	49.5388900000000021	0.0886109999999999953
3747	\N	\N	LEI	Almeria	36.8479839999999967	-2.3718729999999999
3748	\N	\N	LEJ	Halle	51.420259999999999	12.2212019999999999
3749	\N	\N	LEK	Labe	11.3333329999999997	-12.2972219999999997
3750	\N	\N	LEL	Lake Evella	-12.5083330000000004	135.800000000000011
3751	\N	\N	LEM	Lemmon	45.9408340000000024	-102.15889
3752	\N	\N	LEO	Leconi	-1.56666700000000003	14.2166669999999993
3753	\N	\N	LEP	Leopoldina	-21.4666670000000011	-42.6666680000000014
3754	\N	\N	LER	Leinster	-27.8333319999999986	120.616669999999999
3755	\N	\N	LES	Lesobeng	-29.6666680000000014	27.6666680000000014
3756	\N	\N	LET	Gen. A.V. Cobo	-4.19638899999999992	-69.9394450000000063
3757	\N	\N	LEV	Levuka Airfield	-17.6833320000000001	178.833329999999989
3758	\N	\N	LEW	Auburn	44.1000000000000014	-70.2333299999999952
3759	\N	\N	LEX	Blue Grass	38.0376199999999969	-84.597920000000002
3760	\N	\N	LEY	Lelystad	52.4666670000000011	5.53333299999999983
3761	\N	\N	LEZ	La Esperanza	14.25	-88.1666639999999973
3762	\N	\N	LFB	Lumbo	-15.0333330000000007	40.6666680000000014
3763	\N	\N	LFI	Langley AFB	37.0833319999999986	-76.5
3764	\N	\N	LFK	Lufkin Angelina County	31.2341669999999993	-94.750275000000002
3765	\N	\N	LFM	Lamerd	27.3741200000000013	53.1909259999999975
3766	\N	\N	LFN	Franklin	36.1000000000000014	-78.2999999999999972
3767	\N	\N	LFO	Kelafo	5.66666700000000034	44.3333319999999986
3768	\N	\N	LFP	Lakefield	-15.0500000000000007	144.005549999999999
3769	\N	\N	LFR	La Fria	8.24055599999999977	-72.2722239999999942
3770	\N	\N	LFT	Lafayette Regional	30.2085100000000004	-91.9932699999999954
3771	\N	\N	LFW	Lome	6.167103	1.2503470000000001
3772	\N	\N	LGA	La Guardia	40.7742539999999991	-73.871619999999993
3773	\N	\N	LGB	Long Beach Municipal	33.8181950000000029	-118.144490000000005
3774	\N	\N	LGC	Calloway	33.0075000000000003	-85.0708300000000008
3775	\N	\N	LGD	La Grande	45.2897219999999976	-118.004999999999995
3776	\N	\N	LGE	Lake Gregory	-20.1333330000000004	127.566665999999998
3777	\N	\N	LGF	Laguna AAF	32.7166670000000011	-114.616669999999999
3778	\N	\N	LGH	Leigh Creek	-30.4666670000000011	138.416670000000011
3779	\N	\N	LGI	Deadmans Cay	23.1794429999999991	-75.0905499999999932
3780	\N	\N	LGK	Langakawi International	6.34217399999999998	99.7313999999999936
3781	\N	\N	LGL	Long Lellang	4.18333300000000019	114.25
3782	\N	\N	LGM	Laiagam	-4.33333299999999966	145.416670000000011
3783	\N	\N	LGN	Linga Linga	-5.68333300000000019	149.416670000000011
3784	\N	\N	LGO	Langeoog	53.7666660000000007	7.53333299999999983
3785	\N	\N	LGQ	Lago Agrio	0.100000000000000006	-76.8833300000000008
3786	\N	\N	LGR	Cochrane	-47.1666680000000014	-72
3787	\N	\N	LGS	Malargue	-35.5	-69.5833360000000027
3788	\N	\N	LGT	Las Gaviotas	9.16666700000000034	-74.5
3789	\N	\N	LGU	Cache	41.7875000000000014	-111.855000000000004
3790	\N	\N	LGX	Lugh Ganane	3.79999999999999982	42.0499999999999972
3791	\N	\N	LGY	Lagunillas	8.51666699999999999	-71.4000000000000057
3792	\N	\N	LGZ	Leguizamo	37.7558330000000026	20.8883319999999983
3793	\N	\N	LHA	Black Forest	48.3333319999999986	7.88333300000000037
3794	\N	\N	LHB	Lost Harbor Sea Port	54.2333339999999993	-165.599999999999994
3795	\N	\N	LHE	Alama Iqbal International	31.5208319999999986	74.402780000000007
3796	\N	\N	LHG	Lightning Ridge	-29.4583319999999986	147.983339999999998
3797	\N	\N	LHI	Lereh	-3.13333299999999992	139.900000000000006
3798	\N	\N	LHK	Guanghua	32.2666660000000007	111.633330000000001
3799	\N	\N	LHN	Lishan	23.4333320000000001	121.299999999999997
3800	\N	\N	LHP	Lehu	-6.5	155.699999999999989
3801	\N	\N	LHR	Heathrow	51.4696039999999968	-0.453566000000000025
3802	\N	\N	LHS	Las Heras	-32.8500000000000014	-68.8166659999999979
3803	\N	\N	LHU	Lianshulu	-18.1163880000000006	23.3916660000000007
3804	\N	\N	LHV	W T Piper Memorial	41.1333300000000008	-77.4500000000000028
3805	\N	\N	LHW	Lanzhou Airport	36.0333329999999989	103.866669999999999
3806	\N	\N	LIA	Liangping	30.8166679999999999	107.700000000000003
3807	\N	\N	LIB	Limbunya	-17.1999999999999993	129.800000000000011
3808	\N	\N	LIC	Municipal	39.2666660000000007	-103.683334000000002
3809	\N	\N	LIE	Libenge	3.62361099999999992	18.63889
3810	\N	\N	LIF	Lifou	-20.7666660000000007	167.25
3811	\N	\N	LIG	Bellegarde	45.8621800000000022	1.17624499999999999
3812	\N	\N	LIH	Lihue	21.9782049999999991	-159.349439999999987
3813	\N	\N	LII	Mulia	-3.73333300000000001	137.96665999999999
3814	\N	\N	LIJ	Long Island	54.9291699999999992	-132.808330000000012
3815	\N	\N	LIK	Likiep Island	9.8166670000000007	169.316669999999988
3816	\N	\N	LIN	Linate	45.4609570000000005	9.27915699999999966
3817	\N	\N	LIO	Limon International Airport	9.95583300000000015	-83.0211099999999931
3818	\N	\N	LIP	Lins	-21.6666680000000014	-49.75
3819	\N	\N	LIQ	Lisala	2.1722220000000001	21.4958320000000001
3820	\N	\N	LIR	Daniel Oduber International	10.6000049999999995	-85.5383900000000068
3821	\N	\N	LIV	Livengood	65.5166700000000048	-148.666670000000011
3822	\N	\N	LIW	Loikaw	19.6886100000000006	97.2169399999999939
3823	\N	\N	LIX	Likoma	-12.0833329999999997	34.7333339999999993
3824	\N	\N	LIY	Wright AAF	31.8500000000000014	-81.5999999999999943
3825	\N	\N	LIZ	Loring AFB	42.0333329999999989	-78.6333300000000008
3826	\N	\N	LJA	Lodja	-3.39722200000000019	23.4444450000000018
3827	\N	\N	LJC	Intercontinental	36.2666660000000007	-85.75
3828	\N	\N	LJN	Brazoria County	29.038333999999999	-95.4569500000000062
3829	\N	\N	LJU	Brnik	46.2310200000000009	14.4549719999999997
3830	\N	\N	LKA	Larantuka	-8.34999999999999964	122.983329999999995
3831	\N	\N	LKC	Lekana	-2.31666699999999981	14.5999999999999996
3832	\N	\N	LKD	Lakeland Downs	-15.8166670000000007	144.949999999999989
3833	\N	\N	LKG	Lokichoggio	4.23333300000000001	34.3500000000000014
3834	\N	\N	LKI	Lakeside USAF	46.7833329999999989	-92.0999999999999943
3835	\N	\N	LKK	Kulik Lake	59.8166659999999979	-158.833329999999989
3836	\N	\N	LKP	Lake Placid	44.2833329999999989	-73.9833299999999952
3837	\N	\N	LKR	Las Khoreh	11.1500000000000004	48.2000000000000028
3838	\N	\N	LKS	Lakeside	30.5008340000000011	-98.1469400000000007
3839	\N	\N	LKU	Lake Rudolf	3.4166669999999999	35.8833300000000008
3840	\N	\N	LKV	Lake County	42.1666680000000014	-120.400000000000006
3841	\N	\N	LKY	Lake Manyara	-3.5	36.4166680000000014
3842	\N	\N	LKZ	RAF Lakenheath	52.4916699999999992	0.676089999999999969
3843	\N	\N	LLE	Malelane	-25.4666670000000011	31.5666679999999999
3844	\N	\N	LLG	Chillagoe	-17.1333330000000004	144.53334000000001
3845	\N	\N	LLH	Las Limas	15.4430560000000003	-87.8988899999999944
3846	\N	\N	LLI	Lalibela	12.016667	39.0666659999999979
3847	\N	\N	LLL	Lissadell	-16.5666679999999999	128.633330000000001
3848	\N	\N	LLM	Long Lama	3.76666699999999999	114.466669999999993
3849	\N	\N	LLN	Kelila	-3.75	138.666670000000011
3850	\N	\N	LLP	Linda Downs	-23.1666680000000014	138.699999999999989
3851	\N	\N	LLS	Las Lomitas	-24.7166670000000011	-60.5833319999999986
3852	\N	\N	LLU	Alluitsup Paa	60.4641700000000029	-45.5688900000000032
3853	\N	\N	LLW	Kumuzu International Airport	-13.7800390000000004	33.7801970000000011
3854	\N	\N	LLX	Lyndonville	44.5	-72.0166700000000048
3855	\N	\N	LLY	Burlington County	39.9166680000000014	-74.75
3856	\N	\N	LMA	Lake Minchumina	63.8833300000000008	-152.316669999999988
3857	\N	\N	LMB	Salima	-13.75	34.5833319999999986
3858	\N	\N	LMD	Los Menucos	-40.8333319999999986	-68.1333300000000008
3859	\N	\N	LME	Arnage	48	1.25
3860	\N	\N	LMG	Lamassa	-4.70000000000000018	152.75
3861	\N	\N	LMH	Limon	15.8666669999999996	-85.5499999999999972
3862	\N	\N	LMI	Lumi	-3.48333300000000001	142.03334000000001
3863	\N	\N	LML	Lae Island	8.91666700000000034	166.25
3864	\N	\N	LMM	Federal (Valle Del Fuerte)	25.8166679999999999	-108.983329999999995
3865	\N	\N	LMO	RAF Station	57.7166670000000011	-3.3333330000000001
3866	\N	\N	LMQ	Marsa Brega	30.3794439999999994	19.5794449999999998
3867	\N	\N	LMR	Lime Acres	-28.3666669999999996	23.4499999999999993
3868	\N	\N	LMS	Winston County	33.1166699999999992	-89.0499999999999972
3869	\N	\N	LMT	Kingsley Field	42.1630549999999999	-121.735830000000007
3870	\N	\N	LMX	Lopez De Micay	3.04999999999999982	-77.5499999999999972
3871	\N	\N	LMY	Lake Murray	-6.83333299999999966	141.366669999999999
3872	\N	\N	LMZ	Palma	-10.766667	40.4833339999999993
3873	\N	\N	LNA	Palm Beach County Park	26.7166670000000011	-80.0499999999999972
3874	\N	\N	LNC	Lengbati	-6.36666699999999963	147.366669999999999
3875	\N	\N	LND	Hunt Field	42.8333319999999986	-108.733329999999995
3876	\N	\N	LNF	Munbil	-4.86666699999999963	141.21665999999999
3877	\N	\N	LNG	Lese	-8.16666700000000034	146.116669999999999
3878	\N	\N	LNH	Lake Nash	-20.9499999999999993	138
3879	\N	\N	LNI	Dew Station	70.9166639999999973	-153.25
3880	\N	\N	LNJ	Lincang	23.7441059999999986	100.026245000000003
3881	\N	\N	LNK	Lincoln	40.8461759999999998	-96.7547100000000029
3882	\N	\N	LNM	Langimar	-7.21666700000000017	146.21665999999999
3883	\N	\N	LNN	Lost Nation	41.6333300000000008	-81.4166639999999973
3884	\N	\N	LNO	Leonora	-28.8793450000000007	121.316924999999998
3885	\N	\N	LNP	Wise	36.9833339999999993	-82.5666659999999979
3886	\N	\N	LNQ	Loani	-10.4333329999999993	150.150000000000006
3887	\N	\N	LNR	Tri County	43.1833340000000021	-90.2000000000000028
3888	\N	\N	LNS	Lancaster	40.1211130000000011	-76.2997199999999935
3889	\N	\N	LNX	Smolensk	54.7999999999999972	32.0499999999999972
3890	\N	\N	LNZ	Blue Danube	48.2398700000000034	14.1933450000000008
3891	\N	\N	LOA	Lorraine	-19	139.900000000000006
3892	\N	\N	LOB	Los Andes	-29.9666670000000011	-71.5333300000000065
3893	\N	\N	LOC	Lock	-33.5499999999999972	135.75
3894	\N	\N	LOF	Loen	7.91666700000000034	169.916670000000011
3895	\N	\N	LOG	Longview	46.1166699999999992	-122.883330000000001
3896	\N	\N	LOI	Helmuth Baungartem	-27.1597210000000011	-49.5427779999999984
3897	\N	\N	LOL	Derby Field	40.0583340000000021	-118.566665999999998
3898	\N	\N	LOM	Francisco P. V. Y R.	21.2666660000000007	-101.933334000000002
3899	\N	\N	LOQ	Lobatse	-25.1902769999999983	25.6819440000000014
3900	\N	\N	LOR	Lowe Army Heliport	31.5	-85.4333340000000021
3901	\N	\N	LOS	Murtala Muhammed	6.57787100000000002	3.32117800000000019
3902	\N	\N	LOT	Lewis Lockport	41.5833319999999986	-88.0499999999999972
3903	\N	\N	LOU	Bowman Field Airport	38.2666660000000007	-85.75
3904	\N	\N	LOV	Monclova	26.8999999999999986	-101.416663999999997
3905	\N	\N	LOW	Louisa	38	-77.9666699999999935
3906	\N	\N	LOX	Los Tablones Airport	14.9700000000000006	-90.1700000000000017
3907	\N	\N	LOY	Loyangalani	2.75	36.7166670000000011
3908	\N	\N	LOZ	Corbin-london	37.0872230000000016	-84.0769399999999933
3909	\N	\N	LPC	Lompoc Airport	34.6333300000000008	-120.450000000000003
3910	\N	\N	LPD	La Pedrera	-1.30000000000000004	-69.7166699999999935
3911	\N	\N	LPE	La Primavera	3.73333300000000001	-76.2166699999999935
3912	\N	\N	LPG	La Plata	-34.9166680000000014	-57.9500000000000028
3913	\N	\N	LPI	Linkoping	58.4069440000000029	15.6569439999999993
3914	\N	\N	LPJ	Pijiguaos	7	-67.6666639999999973
3915	\N	\N	LPK	Lipetsk	52.6166699999999992	39.6000000000000014
3916	\N	\N	LPN	Leron Plains	-6.58000000000000007	146.449999999999989
3917	\N	\N	LPO	Municipal	41.6000000000000014	-86.7166699999999935
3918	\N	\N	LPP	Lappeenranta	61.0461120000000008	28.1566679999999998
3919	\N	\N	LPQ	Luang Prabang	19.8970550000000017	102.163709999999995
3920	\N	\N	LPS	Lopez Island	48.4827769999999987	-122.935554999999994
3921	\N	\N	LPT	Lampang	18.274166000000001	99.5072250000000054
3922	\N	\N	LPU	Long Apung	1.70709099999999991	114.969986000000006
3923	\N	\N	LPW	Little Port Walter	56.3833300000000008	-134.833329999999989
3924	\N	\N	LPX	Liepaja	56.5166660000000007	21.1000000000000014
3925	\N	\N	LQK	Pickens	34.8833300000000008	-82.7000000000000028
3926	\N	\N	LQM	Puerto Leguizamo	-0.299999999999999989	-74.5833360000000027
3927	\N	\N	LQN	Qala Nau	34.9500000000000028	63.6666680000000014
3928	\N	\N	LRA	Larisa	39.6511100000000027	22.4638880000000007
3929	\N	\N	LRB	Leribe	-28.9666670000000011	28
3930	\N	\N	LRD	International	27.5436669999999992	-99.4551239999999979
3931	\N	\N	LRE	Longreach	-23.4394740000000006	144.271469999999994
3932	\N	\N	LRF	Little Rock AFB	34.9166680000000014	-92.1500000000000057
3933	\N	\N	LRG	Lora Lai	27.8500000000000014	65.0833360000000027
3934	\N	\N	LRI	Lorica	9.03333300000000072	-75.7000000000000028
3935	\N	\N	LRJ	Municipal	42.7999999999999972	-96.1666639999999973
3936	\N	\N	LRK	Coast Guard	-16.120000000000001	-68.3199999999999932
3937	\N	\N	LRL	Niamtougou	9.83333299999999966	1.13333299999999992
3938	\N	\N	LRM	Casa de Campo International	18.4166680000000014	-68.9000000000000057
3939	\N	\N	LRN	Larson AFB	47.1333300000000008	-119.283330000000007
3940	\N	\N	LRO	Sharpe AAF	39.5499999999999972	-94.3333360000000027
3941	\N	\N	LRQ	Laurie River	56.2166670000000011	-101
3942	\N	\N	LRR	Lar Airport	27.6696899999999992	54.3827599999999975
3943	\N	\N	LRT	Lann Bihoue	47.7537400000000005	-3.43639399999999995
3944	\N	\N	LRU	Municipal	32.2908329999999992	-106.921670000000006
3945	\N	\N	LRV	Los Roques	11.8333329999999997	-66.75
3946	\N	\N	LSA	Losuia	-8.36388900000000035	151.025000000000006
3947	\N	\N	LSB	Lordsburg	32.4166680000000014	-108.666663999999997
3948	\N	\N	LSC	La Florida	-29.9172970000000014	-71.2036899999999946
3949	\N	\N	LSD	Blue Grass Station Army Heliport	38.0317136000000033	-84.495135899999994
3950	\N	\N	LSE	Municipal	43.8752440000000021	-91.2643360000000001
3951	\N	\N	LSF	Lawson AAF	32.3404999999999987	-84.9860460000000018
3952	\N	\N	LSH	Lashio	22.9666670000000011	97.75
3953	\N	\N	LSJ	Long Island	-5.33333299999999966	147.083329999999989
3954	\N	\N	LSK	Lusk	42.7880820000000028	-104.445526000000001
3955	\N	\N	LSL	Los Chiles	11.0333330000000007	-84.7000000000000028
3956	\N	\N	LSM	Lawas	4.00277800000000017	118.008330000000001
3957	\N	\N	LSN	Los Banos	37.0666659999999979	-120.849999999999994
3958	\N	\N	LSO	Talmont	46.5	-1.78333300000000006
3959	\N	\N	LSP	Josefa Camejo	11.7771550000000005	-70.1496099999999956
3960	\N	\N	LSQ	Los Angeles	-37.3975000000000009	-72.4227750000000015
3961	\N	\N	LSR	Lost River	59.5499999999999972	-139.733339999999998
3962	\N	\N	LSS	Terre-de-Haut	15.8669440000000002	-61.576667999999998
3963	\N	\N	LST	Launceston	-41.5435099999999977	147.20532
3964	\N	\N	LSU	Long Sukang	4.54999999999999982	115.5
3965	\N	\N	LSV	Nellis AFB	36.2999999999999972	-115.799999999999997
3966	\N	\N	LSW	Lhoksumawe	5.16666700000000034	97.1666639999999973
3967	\N	\N	LSX	Lhok Sukon	5.06666699999999981	97.3166659999999979
3968	\N	\N	LSZ	Losinj Airport	44.5669439999999994	14.3858329999999999
3969	\N	\N	LTA	Letaba	-23.8333319999999986	30.1499999999999986
3970	\N	\N	LTB	Latrobe	-41.2333339999999993	146.400000000000006
3971	\N	\N	LTC	Lai	9.41666700000000034	16.3000000000000007
3972	\N	\N	LTD	Ghadames	30.1291679999999999	9.50972200000000001
3973	\N	\N	LTF	Leitre	-2.8333330000000001	141.616669999999999
3974	\N	\N	LTG	Langtang	28.2333339999999993	85.5999999999999943
3975	\N	\N	LTH	Lathrop Wells	36.6333300000000008	-116.383330000000001
3976	\N	\N	LTI	Altai	46.6499999999999986	96.4166639999999973
3977	\N	\N	LTK	Latakia	35.407352000000003	35.943992999999999
3978	\N	\N	LTL	Lastourville	-0.83333299999999999	12.7166669999999993
3979	\N	\N	LTM	Lethem	3.37166699999999997	-59.7899999999999991
3980	\N	\N	LTN	Luton Airport	51.8797700000000006	-0.376232000000000011
3981	\N	\N	LTP	Lyndhurst	-30.2833329999999989	138.349999999999994
3982	\N	\N	LTR	Letterkenny	54.9500000000000028	-7.73333300000000001
3983	\N	\N	LTS	Altus AFB	34.6966669999999979	-99.3380599999999987
3984	\N	\N	LTT	La Mole	43.2833329999999989	6.63333300000000037
3985	\N	\N	LTV	Lotusvale	-17.0500000000000007	141.383330000000001
3986	\N	\N	LTW	St Marys County	38.25	-76.6666639999999973
3987	\N	\N	LTX	Cotopaxi International	-0.901110999999999995	-78.6025000000000063
3988	\N	\N	LUA	Lukla	27.6833320000000001	86.7333299999999952
3989	\N	\N	LUB	Lumid Pau	2.39999999999999991	-59.4333340000000021
3990	\N	\N	LUC	Laucala Island	-16.75	179.416670000000011
3991	\N	\N	LUD	Luderitz	-26.6863899999999994	15.2438889999999994
3992	\N	\N	LUE	Lucenec	48.3333319999999986	19.6666680000000014
3993	\N	\N	LUF	Luke AFB	33.6166699999999992	-111.916663999999997
3994	\N	\N	LUH	Ludhiana Sahnewal Airport	30.8999999999999986	75.8499999999999943
3995	\N	\N	LUI	La Union	13.3333329999999997	-87.8499999999999943
3996	\N	\N	LUK	Cincinnati Municipal-Lunken Field	39.0333329999999989	-84.6666639999999973
3997	\N	\N	LUL	Hesler-Noble Field	31.6666680000000014	-89.1666639999999973
3998	\N	\N	LUM	Mangshi	24.4052800000000012	98.5318999999999932
3999	\N	\N	LUP	Kalaupapa	21.2111109999999989	-156.974439999999987
4000	\N	\N	LUQ	San Luis	-33.2744450000000001	-66.3586099999999988
4001	\N	\N	LUR	Cape Lisburne	68.8758299999999934	-166.106950000000012
4002	\N	\N	LUS	Lusanga	-4.8046540000000002	18.7188850000000002
4003	\N	\N	LUT	Laura Station	-15.4333329999999993	144.816669999999988
4004	\N	\N	LUU	Laura	-15.6666670000000003	144.166670000000011
4005	\N	\N	LUW	Bubung / Aminuddin Amir	-0.933332999999999968	122.783330000000007
4006	\N	\N	LUX	Findel	49.6311099999999996	6.20953900000000036
4007	\N	\N	LVA	Entrammes	48.0666659999999979	-0.766666999999999987
4008	\N	\N	LVB	Dos Galpoes	-30.8333319999999986	-55.6166699999999992
4009	\N	\N	LVD	Lime Village	61.3500000000000014	-155.46665999999999
4010	\N	\N	LVI	Livingstone	-17.8205570000000009	25.822222
4011	\N	\N	LVK	Livermore	37.6938900000000032	-121.817220000000006
4012	\N	\N	LVL	Lawrenceville	36.75	-77.8333360000000027
4013	\N	\N	LVM	Mission Field	45.6666680000000014	-110.566665999999998
4014	\N	\N	LVO	Laverton	-28.6333330000000004	122.366669999999999
4015	\N	\N	LVP	Lavan	26.8102780000000003	53.356110000000001
4016	\N	\N	LVS	Las Vegas	35.6000000000000014	-105.216669999999993
4017	\N	\N	LWA	Lwbak	17.3500000000000014	121.183334000000002
4018	\N	\N	LWB	Greenbrier Valley	37.8597219999999979	-80.398610000000005
4019	\N	\N	LWC	Lawrence	39.0091669999999979	-95.2175000000000011
4020	\N	\N	LWE	Lewoleba	-8.5	123.366669999999999
4021	\N	\N	LWH	Lawn Hill	-18.5833319999999986	138.583329999999989
4022	\N	\N	LWI	Lowai	-6.31666699999999981	146.583329999999989
4023	\N	\N	LWL	Harriet Field	41.1166699999999992	-114.966669999999993
4024	\N	\N	LWM	Lawrence	42.7175000000000011	-71.1225000000000023
4025	\N	\N	LWO	Snilow	49.8164179999999988	23.9553179999999983
4026	\N	\N	LWR	Leeuwarden	53.25	5.79999999999999982
4027	\N	\N	LWS	Nez Perce County Rgnl	46.3747200000000035	-117.014439999999993
4028	\N	\N	LWT	Municipal	47.0511100000000013	-109.471109999999996
4029	\N	\N	LWV	Municipal	38.7333339999999993	-87.6833340000000021
4030	\N	\N	LXG	Luang Namtha	21.0500000000000007	101.466669999999993
4031	\N	\N	LXN	Lexington	40.7833329999999989	-99.75
4032	\N	\N	LXU	Lukulu	-14.4166670000000003	23.1999999999999993
4033	\N	\N	LXV	Leadville	39.2202800000000025	-106.316109999999995
4034	\N	\N	LYA	Luoyang	34.7363619999999997	112.385409999999993
4035	\N	\N	LYC	Lycksele	64.5507099999999951	18.7096699999999991
4036	\N	\N	LYE	RAF Station	51.5166660000000007	-1.96666699999999994
4037	\N	\N	LYG	Lianyungang	34.5659369999999981	118.876980000000003
4038	\N	\N	LYK	Lunyuk	-9	117.266670000000005
4039	\N	\N	LYN	Bron	45.7308299999999974	4.94333299999999998
4040	\N	\N	LYO	Lyons-Rice County Municipal	38.3500000000000014	-98.2000000000000028
4041	\N	\N	LYP	Faisalabad	31.3630430000000011	72.9875700000000052
4042	\N	\N	LYR	Svalbard	78.2088849999999951	15.8000000000000007
4043	\N	\N	LYS	St-Exupéry	45.721423999999999	5.08033399999999968
4044	\N	\N	LYT	Lady Elliot Island	-24.1166669999999996	152.699999999999989
4045	\N	\N	LYU	Ely	47.8238899999999987	-91.8291700000000048
4046	\N	\N	LYX	London Ashford International (Ferryfield)	50.9500000000000028	0.933332999999999968
4047	\N	\N	LZA	Luiza	-7.66666700000000034	22.5
4048	\N	\N	LZH	Liuzhou	24.206156	109.398430000000005
4049	\N	\N	LZI	Luozi	-4.90000000000000036	14
4050	\N	\N	LZM	Luzamba	-9.05000000000000071	18.0833319999999986
4051	\N	\N	LZN	Nangan	26.1594450000000016	119.958336000000003
4052	\N	\N	LZR	Lizard Island	-14.6666670000000003	145.46665999999999
4053	\N	\N	LZU	Gwinnett County Airport	34.0807500000000019	-84.0737799999999993
4054	\N	\N	LZY	Nyingchi	29.309076000000001	94.335883999999993
4055	\N	\N	MAA	Madras International (Meenambakkam)	12.9822670000000002	80.1637800000000027
4056	\N	\N	MAC	Smart	32.8333319999999986	-83.6333300000000008
4057	\N	\N	MAD	Barajas	40.4651500000000013	-3.57020900000000019
4058	\N	\N	MAE	Madera	36.9500000000000028	-120.066665999999998
4059	\N	\N	MAF	Midland International	31.937145000000001	-102.208169999999996
4060	\N	\N	MAG	Madang	-5.21085200000000004	145.787839999999989
4061	\N	\N	MAI	Mangochi	-14.5	35.25
4062	\N	\N	MAJ	Amata Kabua International	7.06871700000000036	171.282499999999999
4063	\N	\N	MAK	Malakal	9.55555599999999927	31.644444
4064	\N	\N	MAL	Mangole	-1.8333330000000001	125.916663999999997
4065	\N	\N	MAM	Matamoros	25.7702789999999986	-97.523610000000005
4066	\N	\N	MAN	Ringway International Airport	53.3629069999999999	-2.27335399999999987
4067	\N	\N	MAP	Mamai	-10.3333329999999997	149.5
4068	\N	\N	MAQ	Mae Sot	16.6666680000000014	98.5833360000000027
4069	\N	\N	MAR	La Chinita	10.5555640000000004	-71.7235100000000045
4070	\N	\N	MAS	Momote	-2.05666700000000002	147.424440000000004
4071	\N	\N	MAT	Matadi	-5.7983330000000004	13.4416670000000007
4072	\N	\N	MAV	Maloelap Island	8.75	171.099999999999994
4073	\N	\N	MAW	Malden	36.605556	-89.9888899999999978
4074	\N	\N	MAX	Matam	15.5930560000000007	-13.3236109999999996
4075	\N	\N	MAY	Mangrove Cay	24.2897220000000011	-77.6802749999999946
4076	\N	\N	MAZ	Eugenio M De Hostos	18.2577779999999983	-67.1488899999999944
4077	\N	\N	MBA	Moi International	-4.03270000000000017	39.6032500000000027
4078	\N	\N	MBB	Marble Bar	-21.25	119.583336000000003
4079	\N	\N	MBC	Mbigou	-2	12
4080	\N	\N	MBD	Mafikeng International Airport	-25.8166679999999999	25.5
4081	\N	\N	MBE	Monbetsu	44.2666660000000007	143.383330000000001
4082	\N	\N	MBF	Mount Buffalo	-36.75	146.75
4083	\N	\N	MBG	Mobridge	45.5333329999999989	-100.433334000000002
4084	\N	\N	MBH	Maryborough	-25.5166660000000007	152.713330000000013
4085	\N	\N	MBJ	Sangster International	18.4984649999999995	-77.9166299999999978
4086	\N	\N	MBK	Matupa	-10.0574999999999992	-54.9327770000000015
4087	\N	\N	MBL	Blacker	44.2738879999999995	-86.2533339999999953
4088	\N	\N	MBM	Mkambati	-31.2833329999999989	29.9666670000000011
4089	\N	\N	MBN	Mt Barnett	-15	125
4090	\N	\N	MBO	Mamburao	13.2113890000000005	120.60333
4091	\N	\N	MBP	Moyobamba	-6.20000000000000018	-77.1666639999999973
4092	\N	\N	MBQ	Mbarara	-0.616666999999999965	30.6499999999999986
4093	\N	\N	MBR	Mbout	16.0333329999999989	-12.5833329999999997
4094	\N	\N	MBS	MBS International	43.5333899999999971	-84.0907440000000008
4095	\N	\N	MBU	Mbambanakira	-9.73333300000000001	160.75
4096	\N	\N	MBV	Masa	-6.34999999999999964	147.633330000000001
4097	\N	\N	MBW	Moorabbin	-37.975833999999999	145.102219999999988
4098	\N	\N	MBX	Maribor International Airport	46.5499999999999972	15.6500000000000004
4099	\N	\N	MBY	Moberly	39.4638899999999992	-92.4266700000000014
4100	\N	\N	MBZ	Maues	-3.39999999999999991	-57.7000000000000028
4101	\N	\N	MCA	Macenta	8.55000000000000071	-9.46666699999999928
4102	\N	\N	MCB	Pike County	31.1755560000000003	-90.4694439999999958
4103	\N	\N	MCC	Mcclellan AFB	38.6762239999999977	-121.405945000000003
4104	\N	\N	MCD	Mackinac Island	45.8666699999999992	-84.6333300000000008
4105	\N	\N	MCE	Merced Municipal Airport	37.2847200000000001	-120.512780000000006
4106	\N	\N	MCF	Mac Dill AFB	27.9499999999999993	-82.4500000000000028
4107	\N	\N	MCG	Mcgrath	62.978749999999998	-155.657639999999986
4108	\N	\N	MCH	Machala	-3.26666699999999999	-79.9833299999999952
4109	\N	\N	MCJ	Maicao	11.391667	-72.2416699999999992
4110	\N	\N	MCK	Mccook	40.2638900000000035	-100.668049999999994
4111	\N	\N	MCL	Mt Mckinley	63.8759730000000019	-149.006400000000014
4112	\N	\N	MCN	Lewis B Wilson	32.7019900000000021	-83.6486500000000035
4113	\N	\N	MCQ	Miskolc	48.1166699999999992	20.8333319999999986
4114	\N	\N	MCR	Melchor De Menco	17	-92.0083300000000008
4115	\N	\N	MCS	Monte Caseros	-30.2708319999999986	-57.6411099999999976
4116	\N	\N	MCU	Gueret (Lepaud)	46.3500000000000014	2.60000000000000009
4117	\N	\N	MCW	Mason City Municipal	43.1569440000000029	-93.3294450000000069
4118	\N	\N	MCX	Makhachkala	42.8209500000000034	47.6561099999999982
4119	\N	\N	MDA	Martindale Army Heliport	29.4166680000000014	-98.5
4120	\N	\N	MDB	Melinda	16.9986110000000004	-88.3205600000000004
4121	\N	\N	MDC	Samratulangi	1.54353300000000004	124.922030000000007
4122	\N	\N	MDD	Airpark	32	-102.049999999999997
4123	\N	\N	MDF	Medford	45.1499999999999986	-90.3333360000000027
4124	\N	\N	MDG	Mudanjiang	44.5349429999999984	129.583850000000012
4125	\N	\N	MDH	Southern Illinois	37.7813870000000023	-89.2469399999999951
4126	\N	\N	MDI	Makurdi	7.75	8.53333300000000072
4127	\N	\N	MDJ	City-county	44.8123050000000021	-121.281000000000006
4128	\N	\N	MDK	Mbandaka	0.0233329999999999996	18.2922210000000014
4129	\N	\N	MDL	Mandalay International	21.9400520000000014	96.0875000000000057
4130	\N	\N	MDM	Munduku	-4.63333300000000037	143.449999999999989
4131	\N	\N	MDN	Jefferson Proving Grd	38.7333339999999993	-85.3833300000000008
4132	\N	\N	MDO	Intermediate	59.4530559999999966	-146.300000000000011
4133	\N	\N	MDP	Mindiptana	-5.83333299999999966	140.833329999999989
4134	\N	\N	MDQ	Mar Del Plata	-37.9347229999999982	-57.5722239999999985
4135	\N	\N	MDR	Medfra	63.1069450000000032	-154.71665999999999
4136	\N	\N	MDS	Middle Caicos	21.7833329999999989	-71.7166699999999935
4137	\N	\N	MDV	Medouneu	0.949999999999999956	10.7833330000000007
4138	\N	\N	MDW	Midway	41.7881360000000015	-87.740870000000001
4139	\N	\N	MDX	Mercedes	-29.1672210000000014	-58.0755580000000009
4140	\N	\N	MDY	Sand Island Field	28.1999999999999993	-177.383330000000001
4141	\N	\N	MDZ	El Plumerillo	-32.8278899999999965	-68.7989100000000064
4142	\N	\N	MEC	Manta	-0.953034999999999966	-80.6839999999999975
4143	\N	\N	MED	Mohammad Bin Abdulaziz	24.5443689999999997	39.6989670000000032
4144	\N	\N	MEE	Mare	-21.4823109999999993	168.036090000000002
4145	\N	\N	MEF	Melfi	11.0500000000000007	17.9499999999999993
4146	\N	\N	MEI	Key Field	32.3372230000000016	-88.7491700000000066
4147	\N	\N	MEJ	Meadville	41.6333300000000008	-80.1666639999999973
4148	\N	\N	MEK	Meknes	33.8833300000000008	-5.53333299999999983
4149	\N	\N	MEM	Memphis International	35.0445800000000034	-89.9822599999999966
4150	\N	\N	MEN	Brenoux	44.5	3.53333299999999983
4151	\N	\N	MEO	Dare County Regional	35.9191670000000016	-75.6952739999999977
4152	\N	\N	MEP	Mersing	2.4166669999999999	103.833336000000003
4153	\N	\N	MER	Castle AFB	37.2999999999999972	-120.483329999999995
4154	\N	\N	MET	Moreton	-12.75	142.766660000000002
4155	\N	\N	MEU	Monte Dourado	-0.883333000000000035	-52.5833319999999986
4156	\N	\N	MEV	Douglas County	39	-119.75
4157	\N	\N	MEW	Mweka	-4.84999999999999964	21.5666679999999999
4158	\N	\N	MEY	Meghauli	27.57639	84.2313900000000046
4159	\N	\N	MEZ	Messina	-22.3666669999999996	29.8333319999999986
4160	\N	\N	MFA	Mafia	-7.91388900000000017	39.6649999999999991
4161	\N	\N	MFB	Monfort	0.616666999999999965	-69.75
4162	\N	\N	MFC	Mafeteng	-29.75	27.3000000000000007
4163	\N	\N	MFD	Lahm Municipal	40.8200000000000003	-82.5127800000000065
4164	\N	\N	MFF	Moanda	-1.53694400000000009	13.2708329999999997
4165	\N	\N	MFG	Muzaffarabad	34.3666699999999992	73.4666699999999935
4166	\N	\N	MFH	Mesquite	36.8361099999999979	-114.058610000000002
4167	\N	\N	MFI	Municipal	44.633890000000001	-90.1866700000000066
4168	\N	\N	MFJ	Moala	-18.5666679999999999	179.933330000000012
4169	\N	\N	MFL	Mount Full Stop	-19.6666680000000014	144.900000000000006
4170	\N	\N	MFN	Milford Sound	-44.6694450000000032	167.911120000000011
4171	\N	\N	MFO	Manguna	-5.56666699999999981	151.78334000000001
4172	\N	\N	MFP	Manners Creek	-22.1000000000000014	137.983339999999998
4173	\N	\N	MFQ	Maradi	13.5024999999999995	7.12527799999999978
4174	\N	\N	MFS	Miraflores	5.16666700000000034	-73.25
4175	\N	\N	MFT	Machu Picchu	-13.1166669999999996	-72.5666659999999979
4176	\N	\N	MFV	Accomack County	37.6333300000000008	-75.7833300000000065
4177	\N	\N	MFW	Magaruque	-21.9722210000000011	35.5916670000000011
4178	\N	\N	MFX	Meribel	45.4166680000000014	6.56666699999999981
4179	\N	\N	MFZ	Mesalia	-6.13333300000000037	149.116669999999999
4180	\N	\N	MGA	Augusto C Sandino	12.144838	-86.1712650000000053
4181	\N	\N	MGB	Mount Gambier	-37.7440720000000027	140.782710000000009
4182	\N	\N	MGC	Michigan City Airport	41.7000000000000028	-86.8166659999999979
4183	\N	\N	MGD	Magdalena	-13.3252780000000008	-64.124724999999998
4184	\N	\N	MGE	Dobbins AFB	33.9166680000000014	-84.5166700000000048
4185	\N	\N	MGF	Regional De Maringa SBMG	-23.3836119999999994	-51.9333340000000021
4186	\N	\N	MGG	Margarima	-6.03333299999999983	143.366669999999999
4187	\N	\N	MGH	Margate	-30.9166680000000014	30.25
4188	\N	\N	MGI	Aransas National Wildlife Refuge	28.25	-96.5
4189	\N	\N	MGJ	Orange County	41.5166660000000007	-74.2666700000000048
4190	\N	\N	MGK	Mong Ton	20.2833329999999989	98.9000000000000057
4191	\N	\N	MGL	Moenchen-gl. - Dus Exp	51.3527800000000028	6.54444400000000037
4192	\N	\N	MGM	Dannelly Field	32.3050420000000003	-86.3902899999999931
4193	\N	\N	MGN	Baracoa	9.2880559999999992	-74.8449999999999989
4194	\N	\N	MGO	Manega	-1.73333300000000001	10.2166669999999993
4195	\N	\N	MGP	Manga	-4.03333299999999983	152.96665999999999
4196	\N	\N	MGQ	Mogadishu International Airport	2.01333299999999982	45.3133300000000006
4197	\N	\N	MGR	Moultrie Municipal	31.0694450000000018	-83.8027799999999985
4198	\N	\N	MGT	Milingimbi	-12.0937029999999996	134.893519999999995
4199	\N	\N	MGU	Manaung	18.9583319999999986	93.7388899999999978
4200	\N	\N	MGV	Margaret River	-18.6166669999999996	126.866669999999999
4201	\N	\N	MGW	Morgantown	39.6427759999999978	-79.9158299999999997
4202	\N	\N	MGX	Moabi	-2.25	11
4203	\N	\N	MGY	Dayton-Wright Brothers Airport	39.9333340000000021	-84.2544400000000024
4204	\N	\N	MHA	Mahdia	5.25	-59.1499999999999986
4205	\N	\N	MHB	Mechanics Bay	-36.8449999999999989	174.784729999999996
4206	\N	\N	MHC	Macmahon Camp 4	-42.346110000000003	-73.7138900000000064
4207	\N	\N	MHE	Municipal	43.7752759999999981	-98.0380549999999999
4208	\N	\N	MHF	Morichal	2.14999999999999991	-70.5833360000000027
4209	\N	\N	MHG	Mannheim Airport	49.4765780000000035	8.52108100000000057
4210	\N	\N	MHH	International	26.5134280000000011	-77.0771199999999936
4211	\N	\N	MHI	Musha	11	43
4212	\N	\N	MHK	Municipal	39.1422230000000013	-96.6688900000000046
4213	\N	\N	MHL	Memorial Municipal	39.1166699999999992	-93.2000000000000028
4214	\N	\N	MHM	Intermediate	63.8691669999999974	-152.285830000000004
4215	\N	\N	MHN	Mullen	42.0499999999999972	-101.016670000000005
4216	\N	\N	MHO	Mount House	-17.1333330000000004	125.766670000000005
4217	\N	\N	MHQ	Mariehamn	60.1233330000000024	19.8966670000000008
4218	\N	\N	MHR	Sacramento Mather Airport	38.0499999999999972	-121.933334000000002
4219	\N	\N	MHS	Rep	41.3166659999999979	-122.316665999999998
4220	\N	\N	MHU	Mount Hotham	-36.9666670000000011	147.183330000000012
4221	\N	\N	MHV	Kern County	35.0666659999999979	-118.150000000000006
4222	\N	\N	MHW	Monteagudo	-19.8324999999999996	-63.9666670000000011
4223	\N	\N	MHX	Manihiki Island	-10.3666669999999996	-161
4224	\N	\N	MHY	Morehead	-8.69999999999999929	141.633330000000001
4225	\N	\N	MHZ	Mildenhall Airport	52.3666699999999992	0.483333000000000013
4226	\N	\N	MIA	Miami International Airport	25.7959999999999994	-80.2782399999999967
4227	\N	\N	MIB	Minot AFB	48.2333339999999993	-101.299999999999997
4228	\N	\N	MIC	Crystal	45.0619429999999994	-93.3538900000000069
4229	\N	\N	MIE	Delaware County	40.2397229999999979	-85.3944500000000062
4230	\N	\N	MIF	Roy Hurd Memorial	31.6000000000000014	-102.900000000000006
4231	\N	\N	MIH	Mitchell Plateau	-26.4833339999999993	147.96665999999999
4232	\N	\N	MII	Dr Gastao Vidigal	-22.1999999999999993	-49.9333340000000021
4233	\N	\N	MIJ	Mili Island	6.08333299999999966	171.75
4234	\N	\N	MIK	Mikkeli	61.6838869999999986	27.2130569999999992
4235	\N	\N	MIM	Merimbula	-36.9100460000000012	149.902019999999993
4236	\N	\N	MIN	Minnipa	-32.8333319999999986	134.833329999999989
4237	\N	\N	MIP	Mitspeh Ramon	30.6000000000000014	34.7999999999999972
4238	\N	\N	MIQ	Simón Bolívar International	41.3019450000000035	-95.8944500000000062
4239	\N	\N	MIT	Kern County	35.5	-119.266670000000005
4240	\N	\N	MIU	Maiduguri	11.8441670000000006	13.0680560000000003
4241	\N	\N	MIV	Millville	39.3999999999999986	-75.0333300000000065
4242	\N	\N	MIW	Municipal	42.1666680000000014	-92.9166639999999973
4243	\N	\N	MIX	Miriti	-6.25	-59
4244	\N	\N	MIY	Mittiebah	-18.8099999999999987	137.080000000000013
4245	\N	\N	MIZ	Mainoru	-14	134.099999999999994
4246	\N	\N	MJA	Manja	-21.4166680000000014	44.3166659999999979
4247	\N	\N	MJB	Mejit Island	10.2833330000000007	170.883330000000001
4248	\N	\N	MJC	Man	7.3816670000000002	-7.52833299999999994
4249	\N	\N	MJD	Mohenjodaro	27.3363900000000015	68.1416700000000048
4250	\N	\N	MJE	Majkin	9	170
4251	\N	\N	MJF	Kjaerstad	65.7843900000000019	13.2183279999999996
4252	\N	\N	MJG	Mayajigua	21.7583330000000004	-79
4253	\N	\N	MJI	Mitiga	32.8972199999999972	13.2777779999999996
4254	\N	\N	MJJ	Moki	-5.70000000000000018	145.25
4255	\N	\N	MJK	Shark Bay	-25.8881590000000017	113.576949999999997
4256	\N	\N	MJL	Mouila	-1.81777799999999989	10.9241670000000006
4257	\N	\N	MJM	Mbuji-Mayi	-6.15000000000000036	23.6333330000000004
4258	\N	\N	MJO	Mount Etjo Lodge	-21.0183329999999984	16.4691679999999998
4259	\N	\N	MJP	Manjimup	-34.2333339999999993	116.099999999999994
4260	\N	\N	MJQ	Jackson	43.6166699999999992	-95.0166700000000048
4261	\N	\N	MJR	Miramar	-38.25	-57.8333319999999986
4262	\N	\N	MJS	Maganja Da Costa	-25.3500000000000014	32.2199999999999989
4263	\N	\N	MJU	Mamuju	-2.5	118.833336000000003
4264	\N	\N	MJV	San Javier	37.7752100000000013	-0.81903999999999999
4265	\N	\N	MJW	Mahenye	-21.2333339999999993	32.3333319999999986
4266	\N	\N	MJX	Robert J. Miller	39.9666670000000011	-74.2000000000000028
4267	\N	\N	MJY	Mangunjaya	-2.73333300000000001	103.566665999999998
4268	\N	\N	MKA	Marianske Lazne	49.9833339999999993	12.7166669999999993
4269	\N	\N	MKB	Mekambo	1.05000000000000004	13.8333329999999997
4270	\N	\N	MKC	Downtown	39.1241699999999994	-94.5919399999999939
4271	\N	\N	MKF	Mckenna AAF	32.4666670000000011	-84.9833299999999952
4272	\N	\N	MKG	Muskegon	43.1705550000000002	-86.2374999999999972
4273	\N	\N	MKH	Mokhotlong	-29.1666680000000014	29.1666680000000014
4274	\N	\N	MKJ	Makoua	-0.0202780000000000009	15.5766670000000005
4275	\N	\N	MKK	Molokai	21.1527789999999989	-157.099999999999994
4276	\N	\N	MKL	Mc Kellar-Sipes Regional	35.6013900000000021	-88.9152760000000058
4277	\N	\N	MKN	Malekolon	-4.01666699999999999	153.675000000000011
4278	\N	\N	MKO	Davis Field	35.6605569999999972	-95.3666699999999992
4279	\N	\N	MKR	Meekatharra	-26.6111299999999993	118.545959999999994
4280	\N	\N	MKS	Mekane Selam	11.6833329999999993	38.1499999999999986
4281	\N	\N	MKT	Municipal	44.2236100000000008	-93.918334999999999
4282	\N	\N	MKU	Makokou	0.55916699999999997	12.8611109999999993
4283	\N	\N	MKV	Mt Cavenagh	-25.9666670000000011	133.25
4284	\N	\N	MKY	Mackay	-21.176285	149.18180000000001
4285	\N	\N	MKZ	Batu Berendam	2.26416700000000004	102.253333999999995
4286	\N	\N	MLA	Malta International	35.8497770000000031	14.4954009999999993
4287	\N	\N	MLC	Mc Alester	34.8802799999999991	-95.7849999999999966
4288	\N	\N	MLD	Malad City	42.2000000000000028	-112.450000000000003
4289	\N	\N	MLE	Malé International Airport	4.20138899999999982	73.5244450000000001
4290	\N	\N	MLF	Milford	38.4333340000000021	-113.016670000000005
4291	\N	\N	MLG	Abdul Rahman Saleh	-7.93061500000000041	112.710989999999995
4292	\N	\N	MLH	Euroairport France	47.5993229999999983	7.532864
4293	\N	\N	MLI	Quad-City	41.4538960000000003	-90.5061100000000067
4294	\N	\N	MLJ	Baldwin County	33.0833319999999986	-83.2333299999999952
4295	\N	\N	MLK	Malta	48.4944149999999965	-107.909499999999994
4296	\N	\N	MLL	Marshall	61.8658330000000021	-162.068900000000014
4297	\N	\N	MLM	Francisco J. Múgica Internacional	19.8435099999999984	-101.026929999999993
4298	\N	\N	MLN	Melilla	35.2770769999999985	-2.9574729999999998
4299	\N	\N	MLP	Malabang	7.6183329999999998	124.057500000000005
4300	\N	\N	MLQ	Malalaua	-7.99166699999999963	146.085000000000008
4301	\N	\N	MLR	Millicent	-37.4833339999999993	140.016660000000002
4302	\N	\N	MLS	Municipal	46.4305570000000003	-105.880554000000004
4303	\N	\N	MLU	Municipal	32.5118399999999994	-92.0436550000000011
4304	\N	\N	MLV	Merluna	-13.016667	142.983339999999998
4305	\N	\N	MLW	Sprigg Payne	6.28944399999999959	-10.7583330000000004
4306	\N	\N	MLX	Malatya	38.3544430000000034	38.2536130000000014
4307	\N	\N	MLY	Manley Hot Springs	64.9966660000000047	-150.643049999999988
4308	\N	\N	MLZ	Cerro Largo	-32.3333319999999986	-54.2000000000000028
4309	\N	\N	MMB	Memanbetsu	43.8999999999999986	144.167219999999986
4310	\N	\N	MMC	Ciudad Mante	22.8333319999999986	-99
4311	\N	\N	MMD	Maridor	25.8413889999999995	131.247219999999999
4312	\N	\N	MME	Tees Valley	54.5122259999999983	-1.43401299999999998
4313	\N	\N	MMF	Mamfe	5.71666700000000017	9.30000000000000071
4314	\N	\N	MMG	Mount Magnet	-28.0833319999999986	117.849999999999994
4315	\N	\N	MMI	McMinn County	35.5230299999999986	-84.6757000000000062
4316	\N	\N	MMJ	Matsumoto	36.2333339999999993	137.96665999999999
4317	\N	\N	MMK	Murmansk	68.7850949999999983	32.7591549999999998
4318	\N	\N	MML	Municipal-Ryan Field	44.4472239999999985	-95.8174999999999955
4319	\N	\N	MMM	Middlemount	-22.8024999999999984	148.704730000000012
4320	\N	\N	MMN	Minute Man Airfield	42.4333340000000021	-71.5
4321	\N	\N	MMP	Mompos	9.26166699999999921	-74.4361099999999993
4322	\N	\N	MMQ	Mbala	-8.85722200000000015	31.3361109999999989
4323	\N	\N	MMR	Camp Maybry AHP	30.2833329999999989	-97.75
4324	\N	\N	MMS	Selfs	34.2666660000000007	-90.2666700000000048
4325	\N	\N	MMT	Mc Entire ANG Base	33.9366699999999994	-81.1155550000000005
4326	\N	\N	MMU	Municipal	40.7991680000000017	-74.4158299999999997
4327	\N	\N	MMV	Mal	45.1899999999999977	-123.140000000000001
4328	\N	\N	MMW	Moma	-16.7833329999999989	39.0666659999999979
4329	\N	\N	MNA	Melangguane	4.04999999999999982	126.700000000000003
4330	\N	\N	MNB	Moanda	-5.92694399999999977	12.3527780000000007
4331	\N	\N	MNC	Nacala	-14.4800000000000004	40.7086100000000002
4332	\N	\N	MND	Medina	4.51666699999999999	-73.2833300000000065
4333	\N	\N	MNE	Mungeranie	-28	138.599999999999994
4334	\N	\N	MNF	Mana Island Airstrip	-17.6333330000000004	177.116669999999999
4335	\N	\N	MNG	Maningrida	-12.0549199999999992	134.23227
4336	\N	\N	MNH	Minneriya	7.75	83
4337	\N	\N	MNI	Gerald's Airport	16.75	-62.2333339999999993
4338	\N	\N	MNJ	Mananjary	-21.1999999999999993	48.3666699999999992
4339	\N	\N	MNK	Maiana	1	173
4340	\N	\N	MNM	Menominee	45.1216659999999976	-87.6361100000000022
4341	\N	\N	MNN	Municipal	40.5833319999999986	-83.1333300000000008
4342	\N	\N	MNO	Manono	-7.28805600000000009	27.3938880000000005
4343	\N	\N	MNP	Maron	14.0452779999999997	-83.3836100000000044
4344	\N	\N	MNQ	Monto	-24.8833330000000004	151.099999999999994
4345	\N	\N	MNR	Mongu	-15.2255559999999992	23.1577780000000004
4346	\N	\N	MNT	Minto	64.894999999999996	-149.170839999999998
4347	\N	\N	MNU	Maulmyine	16.4416679999999999	97.6694399999999945
4348	\N	\N	MNV	Mountain Valley	-14.1166669999999996	133.833329999999989
4349	\N	\N	MNW	Macdonald Downs	-22.4499999999999993	135.21665999999999
4350	\N	\N	MNX	Manicore	-5.81666699999999981	-61.2833329999999989
4351	\N	\N	MNY	Mono	-7.34999999999999964	155.566669999999988
4352	\N	\N	MNZ	Manassas Regional Airport/Harry P. Davis Field	38.7219430000000031	-77.5180600000000055
4353	\N	\N	MOA	Orestes Acosta	20.5	-74.8833300000000008
4354	\N	\N	MOB	Mobile Regional Airport	30.6810860000000005	-88.2447499999999962
4355	\N	\N	MOC	Montes Claros	-16.7077789999999986	-43.8172229999999985
4356	\N	\N	MOD	Municipal	37.6269449999999992	-120.955280000000002
4357	\N	\N	MOE	Momeik	23.1000000000000014	96.6500000000000057
4358	\N	\N	MOG	Mong Hsat	20.5333329999999989	99.2666700000000048
4359	\N	\N	MOJ	Moengo	5.75	-54.3333319999999986
4360	\N	\N	MOM	Moudjeria	17.75	-12.5
4361	\N	\N	MON	Mount Cook Airport	-43.7666660000000007	170.136110000000002
4362	\N	\N	MOO	Moomba	-27.5	149.833329999999989
4363	\N	\N	MOP	Municipal	43.6166699999999992	-84.7333299999999952
4364	\N	\N	MOQ	Morondava	-20.2836110000000005	44.3183330000000026
4365	\N	\N	MOR	Moore-Murrell	36.2166670000000011	-83.2999999999999972
4366	\N	\N	MOS	Intermediate	64.6955600000000004	-162.043329999999997
4367	\N	\N	MOX	Municipal	45.5833319999999986	-95.9166639999999973
4368	\N	\N	MOY	Monterrey	4.8841669999999997	-72.8952799999999996
4369	\N	\N	MPC	Muko-Muko	-2.54999999999999982	101.099999999999994
4370	\N	\N	MPD	Mirpur Khas	25.6499999999999986	69.0333300000000065
4371	\N	\N	MPE	Griswold	41.2833329999999989	-72.5999999999999943
4372	\N	\N	MPF	Mapoda	-7.96666700000000017	143.166670000000011
4373	\N	\N	MPG	Makini	-6.53333299999999983	147.71665999999999
4374	\N	\N	MPI	Mamitupo	9.57833300000000065	-79.8430560000000042
4375	\N	\N	MPJ	Petit Jean Park	35.1499999999999986	-92.7333299999999952
4376	\N	\N	MPK	Mokpo	34.7566679999999977	126.385000000000005
4377	\N	\N	MPM	Maputo International	-25.9243890000000015	32.5742899999999977
4378	\N	\N	MPN	Mount Pleasant	-51.8166659999999979	-58.4500000000000028
4379	\N	\N	MPO	Mt Pocono	41.1333300000000008	-75.3666699999999992
4380	\N	\N	MPQ	Maan	30.1666680000000014	35.7666660000000007
4381	\N	\N	MPR	Mcpherson	38.3743600000000029	-97.763306
4382	\N	\N	MPS	Mount Pleasant	33.1666680000000014	-94.9833299999999952
4383	\N	\N	MPT	Maliana	-8.0666670000000007	125.25
4384	\N	\N	MPU	Mapua	-2.89999999999999991	151.400000000000006
4385	\N	\N	MPV	Edward F Knapp State	44.2033350000000027	-72.5666659999999979
4386	\N	\N	MPW	Mariupol	47.1000000000000014	37.5499999999999972
4387	\N	\N	MPX	Miyanmin	-4.90000000000000036	141.616669999999999
4388	\N	\N	MPY	Maripasoula	3.6666669999999999	-54.0333329999999989
4389	\N	\N	MPZ	Municipal	40.9666670000000011	-91.5499999999999972
4390	\N	\N	MQA	Mandora	-19.75	120.833336000000003
4391	\N	\N	MQB	Municipal	40.4525000000000006	-90.6213900000000052
4392	\N	\N	MQC	Miquelon Airport	47.0499999999999972	-56.3333319999999986
4393	\N	\N	MQD	Maquinchao	-41.25	-68.7333299999999952
4394	\N	\N	MQE	Marqua	-22.8166679999999999	137.349999999999994
4395	\N	\N	MQG	Midgard	-22.0833319999999986	17.3666669999999996
4396	\N	\N	MQH	Municipal	-13.5333330000000007	-48.2333339999999993
4397	\N	\N	MQI	Quincy	42.25	-71
4398	\N	\N	MQK	San Matias	-16.3344440000000013	-58.3855549999999965
4399	\N	\N	MQL	Mildura	-34.230834999999999	142.084550000000007
4400	\N	\N	MQO	Malam	-8.70388900000000021	142.651109999999989
4401	\N	\N	MQQ	Moundou	8.625	16.0733339999999991
4402	\N	\N	MQR	Mosquera	2.5	-78.4166639999999973
4403	\N	\N	MQS	Mustique	12.8883329999999994	-61.1819460000000035
4404	\N	\N	MQT	Sawyer International	46.3536100000000033	-87.3952799999999996
4405	\N	\N	MQU	Mariquita	5.21666700000000017	-74.8833300000000008
4406	\N	\N	MQV	Mostaganem	35.8999999999999986	0.0833330000000000043
4407	\N	\N	MQW	Telfair-Wheeler	32.2077799999999996	-83.000275000000002
4408	\N	\N	MQX	Makale	13.4683329999999994	39.5263899999999992
4409	\N	\N	MQY	Smyrna	35.9833339999999993	-86.5
4410	\N	\N	MQZ	Margaret River	-33.9333340000000021	115.099999999999994
4411	\N	\N	MRA	Misurata	32.3999999999999986	15.0666670000000007
4412	\N	\N	MRB	Eastern Wv Regional Airport/Shepherd Field	39.4016700000000029	-77.9849999999999994
4413	\N	\N	MRC	Maury County	35.6166699999999992	-87.0333300000000065
4414	\N	\N	MRD	A Carnevalli	8.58333299999999966	-71.1577759999999984
4415	\N	\N	MRE	Mara Lodges	-1.30036799999999997	35.0588499999999996
4416	\N	\N	MRF	Municipal	30.3000000000000007	-104.016670000000005
4417	\N	\N	MRG	Mareeba	-17	145.46665999999999
4418	\N	\N	MRH	May River	-8.46666699999999928	145.333329999999989
4419	\N	\N	MRI	Merrill Field	61.2333339999999993	-149.900000000000006
4420	\N	\N	MRJ	Marcala	14.1636109999999995	-88.0333300000000065
4421	\N	\N	MRK	Marco Island	25.9444450000000018	-81.7238899999999973
4422	\N	\N	MRL	Miners Lake	-20.0666679999999999	145.583329999999989
4423	\N	\N	MRM	Manare	-9.16666700000000034	147.599999999999994
4424	\N	\N	MRN	Lenoir	35.75	-81.6833340000000021
4425	\N	\N	MRP	Marla	-27	135
4426	\N	\N	MRQ	Marinduque	13.3630560000000003	121.823610000000002
4427	\N	\N	MRR	Macara	-4.38333300000000037	-79.9333340000000021
4428	\N	\N	MRT	Moroak	-14.483333	133.416670000000011
4429	\N	\N	MRU	Sir Seewoosagur Ramgoolam International	-20.4319969999999991	57.676630000000003
4430	\N	\N	MRW	Maribo	54.6858330000000024	11.4350000000000005
4431	\N	\N	MRY	Monterey Peninsula	36.587296000000002	-121.850814999999997
4432	\N	\N	MSA	Muskrat Dam	53.8166659999999979	-91.9833299999999952
4433	\N	\N	MSB	Marigot SPB	18.0666679999999999	-63.0666659999999979
4434	\N	\N	MSC	Falcon Field	33.4166680000000014	-111.833336000000003
4435	\N	\N	MSD	Mt Pleasant	39.5247230000000016	-111.474440000000001
4436	\N	\N	MSE	Kent International	51.3500000000000014	1.35000000000000009
4437	\N	\N	MSF	Mount Swan	-22.5166660000000007	135
4438	\N	\N	MSG	Matsaile	-29.7333339999999993	28.75
4439	\N	\N	MSH	Masirah	20.6805549999999982	58.8916660000000007
4440	\N	\N	MSI	Masalembo	-5.58333299999999966	114.433334000000002
4441	\N	\N	MSK	Mastic Point	25.0333329999999989	-78
4442	\N	\N	MSM	Masi Manimba	-4.76666699999999999	17.9166680000000014
4443	\N	\N	MSN	Dane County Regional	43.136375000000001	-89.346500000000006
4444	\N	\N	MSO	Missoula International	46.9189640000000026	-114.083209999999994
4445	\N	\N	MSQ	Minsk National 2	53.8897249999999985	28.0324419999999996
4446	\N	\N	MSS	Richards Field	44.9377799999999965	-74.8466640000000041
4447	\N	\N	MSU	Moshoeshoe International	-29.3013900000000014	27.5055559999999986
4448	\N	\N	MSV	Sullivan County International	41.7013900000000035	-74.7950000000000017
4449	\N	\N	MSX	Mossendjo	-2.95000000000000018	12.733333
4450	\N	\N	MSY	Louis Armstrong New Orléans International Airport	29.9845639999999989	-90.2563899999999961
4451	\N	\N	MTA	Matamata	-37.8166659999999979	175.766660000000002
4452	\N	\N	MTB	Monte Libano	8.0666670000000007	-75.4666699999999935
4453	\N	\N	MTC	Selfridge ANGB	42.5833319999999986	-82.8833300000000008
4454	\N	\N	MTD	Mt Sandford	-17	130.566669999999988
4455	\N	\N	MTE	Monte Alegre	-1.98333300000000001	-54.0666659999999979
4456	\N	\N	MTF	Mizan Teferi	6.96666700000000017	35.5333329999999989
4457	\N	\N	MTG	Mato Grosso	-14	-55
4458	\N	\N	MTH	The Florida Keys Marathon	24.7194439999999993	-81.0513899999999978
4459	\N	\N	MTI	Mosteiros	15	-24.4333320000000001
4460	\N	\N	MTJ	Montrose Regional Airport	38.5102899999999977	-107.896960000000007
4461	\N	\N	MTK	Makin Island	3	174
4462	\N	\N	MTL	Maitland	-32.7333339999999993	151.550000000000011
4463	\N	\N	MTM	SPB	55.1333300000000008	-131.583329999999989
4464	\N	\N	MTN	Glenn L Martin	39.3216669999999979	-76.4116700000000009
4465	\N	\N	MTO	Coles County Memorial	39.4786100000000033	-88.2783359999999959
4466	\N	\N	MTP	Montauk Airport	41.0744439999999997	-71.9236149999999981
4467	\N	\N	MTQ	Mitchell	-26.5833319999999986	147.96665999999999
4468	\N	\N	MTS	Matsapha International	-26.5203300000000013	31.3141330000000018
4469	\N	\N	MTT	Minatitlan	17.9833339999999993	-94.5166700000000048
4470	\N	\N	MTU	Montepuez	-13.1333330000000004	38.9833339999999993
4471	\N	\N	MTW	Municipal	44.1297229999999985	-87.6822200000000009
4472	\N	\N	MTX	Metro Field	64.8166659999999979	-147.866669999999999
4473	\N	\N	MTZ	Masada	33.2333339999999993	35.75
4474	\N	\N	MUA	Munda	-8.3279399999999999	157.269710000000003
4475	\N	\N	MUB	Maun	-19.9708329999999989	23.4305549999999982
4476	\N	\N	MUC	Franz Josef Strauss	48.3530039999999985	11.7901430000000005
4477	\N	\N	MUD	Mueda	-11.6666670000000003	39.5166660000000007
4478	\N	\N	MUE	Kamuela	20.0124999999999993	-155.673339999999996
4479	\N	\N	MUF	Muting	-7.5	140.333329999999989
4480	\N	\N	MUG	Mulege	26.9166680000000014	-111.983329999999995
4481	\N	\N	MUH	Mersa Matruh	31.3500000000000014	27.25
4482	\N	\N	MUI	Muir AAF	40.447581999999997	-76.5966099999999983
4483	\N	\N	MUJ	Mui	6.33333299999999966	35
4484	\N	\N	MUK	Mauke Island	-19.3333319999999986	-158.5
4485	\N	\N	MUL	Spence	31.1833320000000001	-83.7833300000000065
4486	\N	\N	MUN	Quiriquire	9.74938399999999916	-63.1569330000000022
4487	\N	\N	MUO	Mountain Home AFB	43.1333300000000008	-115.683334000000002
4488	\N	\N	MUP	Mulga Park	-31.1333330000000004	141.050000000000011
4489	\N	\N	MUQ	Muccan	-20.6666680000000014	120
4490	\N	\N	MUS	Marcus Island	24.2899999999999991	153.97999999999999
4491	\N	\N	MUT	Muscatine	41.3666699999999992	-91.144999999999996
4492	\N	\N	MUU	Mount Union	40.3833300000000008	-77.8833300000000008
4493	\N	\N	MUV	Mustin Alf	39.8680570000000003	-75.2486099999999993
4494	\N	\N	MUW	Mascara-Ghriss	35.3333319999999986	0.149999999999999994
4495	\N	\N	MUX	Multan International	30.1995070000000005	71.4149799999999999
4496	\N	\N	MUY	Mouyondzi	-3.98333300000000001	13.9194440000000004
4497	\N	\N	MUZ	Musoma	-1.49722200000000005	33.7999999999999972
4498	\N	\N	MVA	Reykiahlid	65.6166699999999992	-16.9666670000000011
4499	\N	\N	MVB	Franceville/Mvengue	-1.64999999999999991	13.4333329999999993
4500	\N	\N	MVC	Monroe - Walton County	31.5166660000000007	-87.3333360000000027
4501	\N	\N	MVD	Carrasco International	-34.841152000000001	-56.0264659999999992
4502	\N	\N	MVE	Montevideo-Chippewa	44.9500000000000028	-95.7166699999999935
4503	\N	\N	MVF	Dixsept Rosado	-5.16666700000000034	-37.25
4504	\N	\N	MVG	Mevang	0.116667000000000007	11.0833329999999997
4505	\N	\N	MVH	Macksville	-30.75	152.900000000000006
4506	\N	\N	MVI	Manetai	-6	155.333329999999989
4507	\N	\N	MVJ	Marlboro	18.0216670000000008	-77.4952799999999939
4508	\N	\N	MVK	Mulka	-27.25	138
4509	\N	\N	MVL	Morrisville-Stowe	44.5666659999999979	-72.5999999999999943
4510	\N	\N	MVM	Monument Valley	36.7027780000000021	-110.233329999999995
4511	\N	\N	MVN	Mt Vernon-Outland	38.3230549999999965	-88.8586099999999988
4512	\N	\N	MVO	Mongo	12.1999999999999993	18.7833329999999989
4513	\N	\N	MVP	Mitu	1.13333299999999992	-70.0499999999999972
4514	\N	\N	MVQ	Mogilev	53.9500000000000028	30.1333330000000004
4515	\N	\N	MVR	Salam	10.4522220000000008	14.2563890000000004
4516	\N	\N	MVS	Aeroporto Max Feffer	-18.0833319999999986	-39.5666659999999979
4517	\N	\N	MVU	Musgrave	-14.1666670000000003	143.683330000000012
4518	\N	\N	MVV	Megeve	45.8166659999999979	6.65000000000000036
4519	\N	\N	MVW	Skagit Regional	48.4166680000000014	-122.333336000000003
4520	\N	\N	MVX	Minvoul	2.14999999999999991	12.1333330000000004
4521	\N	\N	MVZ	Masvingo	-20.0541669999999996	30.860555999999999
4522	\N	\N	MWA	Williamson County	37.7519449999999992	-89.0163900000000012
4523	\N	\N	MWB	Morawa	-29.2041660000000007	116.022499999999994
4524	\N	\N	MWC	Lawrence J Timmerman	43.0333329999999989	-87.9166639999999973
4525	\N	\N	MWD	Mianwali	32.5499999999999972	71.5499999999999972
4526	\N	\N	MWE	Merowe	18.4499999999999993	31.8333319999999986
4527	\N	\N	MWG	Marawaka	-6.13333300000000037	146.133330000000001
4528	\N	\N	MWH	Grant County	47.2049999999999983	-119.315560000000005
4529	\N	\N	MWI	Maramuni	-5.15000000000000036	143.483339999999998
4530	\N	\N	MWJ	Matthews Ridge	6.54999999999999982	-59.8999999999999986
4531	\N	\N	MWK	Matak	3.29999999999999982	106.266670000000005
4532	\N	\N	MWL	Mineral Wells Airport	32.7833329999999989	-98.0666659999999979
4533	\N	\N	MWM	Windom Municipal	43.9166680000000014	-95.0999999999999943
4534	\N	\N	MWN	Mwadui	-3.54999999999999982	33.6000000000000014
4535	\N	\N	MWO	Hook Field	39.5166660000000007	-84.4000000000000057
4536	\N	\N	MWP	Mountain	28	85.3333360000000027
4537	\N	\N	MWQ	Magwe	20.1666680000000014	94.9411099999999948
4538	\N	\N	MWS	Mount Wilson	34.2166670000000011	-118.066665999999998
4539	\N	\N	MWT	Moolawatana	-28.5	138
4540	\N	\N	MWU	Mussau	-1.5	149.666670000000011
4541	\N	\N	MWV	Mundulkiri	12.4605560000000004	107.190833999999995
4542	\N	\N	MWY	Miranda Downs	-25.7833329999999989	141.516660000000002
4543	\N	\N	MWZ	Mwanza	-2.44122100000000009	32.9232250000000022
4544	\N	\N	MXA	Municipal	35.8833300000000008	-90.1833340000000021
4545	\N	\N	MXB	Masamba	-2.3333330000000001	120.333336000000003
4546	\N	\N	MXC	San Juan County	37.8833300000000008	-109.366669999999999
4547	\N	\N	MXD	Marion Downs	-23.3333319999999986	139.599999999999994
4548	\N	\N	MXE	Maxton	34.7166670000000011	-79.3333360000000027
4549	\N	\N	MXF	Maxwell AFB	32.3833300000000008	-86.3166659999999979
4550	\N	\N	MXG	Marlborough	42.3333319999999986	-71.5499999999999972
4551	\N	\N	MXI	Imelda Romualdez Marcos	6.91666700000000034	126.25
4552	\N	\N	MXJ	Minna	9.61666699999999963	6.53333299999999983
4553	\N	\N	MXK	Mindik	-6.38333300000000037	147.616669999999999
4554	\N	\N	MXM	Morombe	-21.75	43.3666699999999992
4555	\N	\N	MXN	Morlaix	48.6000000000000014	-3.81666699999999981
4556	\N	\N	MXO	Municipal	42.25	-91.2000000000000028
4557	\N	\N	MXR	Mirgorod	49.9666670000000011	33.6000000000000014
4558	\N	\N	MXS	Maota Savaii Island	-13.7166669999999993	-172.233339999999998
4559	\N	\N	MXT	Maintirano	-18.047777	44.0327800000000025
4560	\N	\N	MXU	Mullewa	-28.5500000000000007	115.516670000000005
4561	\N	\N	MXW	Mandalgobi	45.7666660000000007	106.283330000000007
4562	\N	\N	MXY	Mccarthy	61.4706100000000006	-142.937360000000012
4563	\N	\N	MYB	Mayoumba	-3.45000000000000018	10.6833329999999993
4564	\N	\N	MYC	Maracay	10.5	-68.1666639999999973
4565	\N	\N	MYD	Malindi	-3.23075499999999982	40.1004799999999975
4566	\N	\N	MYE	Miyake Jima	34.0694429999999997	139.5625
4567	\N	\N	MYF	Montgomery Field	32.7166670000000011	-117.150000000000006
4568	\N	\N	MYG	Mayaguana	22.3766670000000012	-73.018330000000006
4569	\N	\N	MYH	Marble Canyon	36.8125	-111.645836000000003
4570	\N	\N	MYI	Murray Island	-9.92006600000000027	144.064969999999988
4571	\N	\N	MYJ	Matsuyama	33.8222239999999985	132.704160000000002
4572	\N	\N	MYK	May Creek	61.4166680000000014	-142.916670000000011
4573	\N	\N	MYL	Mccall	44.9166680000000014	-116.099999999999994
4574	\N	\N	MYM	Monkey Mountain	4.59999999999999964	-59.6333300000000008
4575	\N	\N	MYN	Mareb	15.483333	45.3333319999999986
4576	\N	\N	MYO	Myroodah	-18.1166669999999996	124.266670000000005
4577	\N	\N	MYP	Mary	37.6666680000000014	61.8333319999999986
4578	\N	\N	MYQ	Mysore	12.3000000000000007	76.6500000000000057
4579	\N	\N	MYR	Myrtle Beach AFB	33.6826739999999987	-78.922939999999997
4580	\N	\N	MYT	Myitkyina	25.3541680000000014	97.2988900000000001
4581	\N	\N	MYV	Yuba County	39.0980569999999972	-121.569725000000005
4582	\N	\N	MYW	Mtwara	-10.338889	40.1936099999999996
4583	\N	\N	MYX	Menyamya	-7.20000000000000018	146.016660000000002
4584	\N	\N	MYZ	Monkey Bay	-14.0999999999999996	34.5333329999999989
4585	\N	\N	MZB	Mocimboa Praia	-11.3561110000000003	40.3541680000000014
4586	\N	\N	MZC	Mitzic	0.783332999999999946	11.5666670000000007
4587	\N	\N	MZD	Mendez	-2.73333300000000001	-78.3166659999999979
4588	\N	\N	MZE	Manatee	17.0833319999999986	-89.5999999999999943
4589	\N	\N	MZF	Mzamba(Wild Coast Sun)	-32.75	28.5
4590	\N	\N	MZH	Merzifon	40.8833300000000008	35.5333329999999989
4591	\N	\N	MZI	Mopti	14.5083330000000004	-4.08499999999999996
4592	\N	\N	MZJ	Marana	32.5166660000000007	-111.333336000000003
4593	\N	\N	MZK	Marakei	1.98333300000000001	173.666670000000011
4594	\N	\N	MZM	Frescaty	49.072499999999998	6.13444400000000023
4595	\N	\N	MZN	Minj	-5.90555599999999981	144.676670000000001
4596	\N	\N	MZO	Sierra Maestra	20.3249999999999993	-77.1288899999999984
4597	\N	\N	MZP	Motueka	-41.1166699999999992	173
4598	\N	\N	MZQ	Mkuze	-27.6333330000000004	32.0499999999999972
4599	\N	\N	MZR	Mazar-i-sharif	36.7091899999999995	67.2084899999999976
4600	\N	\N	MZS	Mostyn	4.61666699999999963	118.150000000000006
4601	\N	\N	MZT	Gen Rafael Buelna	23.1673149999999985	-106.270150000000001
4602	\N	\N	MZU	Muzaffarpur	26.1166669999999996	85.3833300000000008
4603	\N	\N	MZX	Mena	6.34999999999999964	39.7166670000000011
4604	\N	\N	MZY	Mossel Bay	-34.1833340000000021	22.0833319999999986
4605	\N	\N	MZZ	Marion	40.4908330000000021	-85.6794399999999996
4606	\N	\N	NAB	Albany NAS	31.5833319999999986	-84.1666639999999973
4607	\N	\N	NAD	Macanal	2.56666699999999981	-67.5833360000000027
4608	\N	\N	NAE	Natitingou	10.3833330000000004	1.36666700000000008
4609	\N	\N	NAF	Banaina	2.75	117.049999999999997
4610	\N	\N	NAG	Dr. Babasaheb Ambedkar International	21.0900360000000013	79.056359999999998
4611	\N	\N	NAI	Annai	3.75	-59
4612	\N	\N	NAJ	Nakhichevan	39.1902770000000018	45.4588899999999967
4613	\N	\N	NAK	Nakhon Ratchasima	14.9333329999999993	102.083336000000003
4614	\N	\N	NAL	Nalchik	43.5333329999999989	43.7000000000000028
4615	\N	\N	NAM	Namlea	-3.29999999999999982	127.099999999999994
4616	\N	\N	NAO	Nanchong	30.8000000000000007	106.066665999999998
4617	\N	\N	NAP	Capodichino	40.8861119999999971	14.2916670000000003
4618	\N	\N	NAR	Nare	6.20000000000000018	-74.5833360000000027
4619	\N	\N	NAS	Nassau International	25.0482230000000001	-77.4637759999999957
4620	\N	\N	NAT	Augusto Severo	-5.91678700000000024	-35.2502440000000021
4621	\N	\N	NAV	Nevsehir	38.6333300000000008	34.7166670000000011
4622	\N	\N	NAW	Narathiwat	6.51666699999999999	101.75
4623	\N	\N	NAX	Kalaeloa John Rodgers Field	21.3000000000000007	-158.116669999999999
4624	\N	\N	NAY	Nanyuan Airport	39.7824999999999989	116.387780000000006
4625	\N	\N	NAZ	Nana	-14.8666669999999996	-74.9500000000000028
4626	\N	\N	NBA	Nambaiyufa	-6.25	145.233339999999998
4627	\N	\N	NBB	Barrancominas	3.3333330000000001	-70.3333360000000027
4628	\N	\N	NBC	Naberevnye Chelny	55.5641249999999971	52.1034099999999967
4629	\N	\N	NBG	NAS/Alvin Callendar	29.8333319999999986	-90.0333300000000065
4630	\N	\N	NBH	Nambucca Heads	-30.6333330000000004	152.983339999999998
4631	\N	\N	NBL	San Blas	9.30000000000000071	-79
4632	\N	\N	NBP	Battery Pk City/N. Cov	40.7061119999999974	-74.0216700000000003
4633	\N	\N	NBU	NAS	39.5499999999999972	-107.316665999999998
4634	\N	\N	NBV	Cana Brava	-17.3833330000000004	-45.8666699999999992
4635	\N	\N	NCA	North Caicos	21.9333320000000001	-71.9833299999999952
4636	\N	\N	NCE	Cote D'azur International Airport	43.6604900000000029	7.20523199999999964
4637	\N	\N	NCG	Nueva Casas Grandes	30.4166680000000014	-107.916663999999997
4638	\N	\N	NCH	Nachingwea	-10.3638890000000004	38.7749999999999986
4639	\N	\N	NCI	Necocli	8.48333300000000001	-76.75
4640	\N	\N	NCN	New Chenega	60.0783100000000019	-147.99772999999999
4641	\N	\N	NCO	NAS	41	-71
4642	\N	\N	NCQ	Atlanta NAS	33.9166680000000014	-84.5166700000000048
4643	\N	\N	NCR	San Carlos	11.25	-84.8333360000000027
4644	\N	\N	NCS	Newcastle	-27.774166000000001	29.9899999999999984
4645	\N	\N	NCT	Guanacaste	10.1388890000000007	-85.4449999999999932
4646	\N	\N	NCY	Annecy-Meythe	45.9305570000000003	6.10083299999999973
4647	\N	\N	NDA	Bandanaira	-4.53333299999999983	129.900000000000006
4648	\N	\N	NDB	Nouadhibou	20.9341679999999997	-17.028334000000001
4649	\N	\N	NDC	Nanded	19.1833320000000001	77.3166659999999979
4650	\N	\N	NDD	Sumbe	-11.1666670000000003	13.8666669999999996
4651	\N	\N	NDE	Mandera	3.93333300000000019	41.8666699999999992
4652	\N	\N	NDF	Ndalatandos	-9.33333299999999966	14.8333329999999997
4653	\N	\N	NDG	Qiqihar	47.3166659999999979	123.916663999999997
4654	\N	\N	NDI	Namudi	-9.4333329999999993	148.266660000000002
4655	\N	\N	NDJ	N'Djamena	12.1290560000000003	15.0342149999999997
4656	\N	\N	NDK	Namdrik Island	5.63333300000000037	168.116669999999999
4657	\N	\N	NDL	Ndele	8.41666700000000034	20.6000000000000014
4658	\N	\N	NDM	Mendi	9.8166670000000007	35.0833319999999986
4659	\N	\N	NDN	Nadunumu	-9.13333300000000037	147.683330000000012
4660	\N	\N	NDO	La Palma Del Condado	37.3833300000000008	-6.58333299999999966
4661	\N	\N	NDP	Ellyson NAS	30.4725000000000001	-87.1883299999999934
4662	\N	\N	NDS	Sandstone	-27.9833339999999993	119.299999999999997
4663	\N	\N	NDV	USN Heliport	38.8666699999999992	-77
4664	\N	\N	NEA	Brunswick Golden Isles	31.25	-81.4666699999999935
4665	\N	\N	NEC	Necochea	-38.5666659999999979	-58.75
4666	\N	\N	NEF	Neftekamsk	56.1000000000000014	54.3500000000000014
4667	\N	\N	NEG	Negril	18.3083320000000001	-78.3333360000000027
4668	\N	\N	NEJ	Nejjo	9.5	35.4666670000000011
4669	\N	\N	NEK	Nekemt	9.0666670000000007	36.5
4670	\N	\N	NEL	Naec	40.0166660000000007	-74.3166659999999979
4671	\N	\N	NEN	Olf Usn	30.3166679999999999	-81.8499999999999943
4672	\N	\N	NER	Neryungri	56.6499999999999986	124.599999999999994
4673	\N	\N	NES	East 34th St Landing	40.7433320000000023	-73.9749999999999943
4674	\N	\N	NET	New Bight	24.3200000000000003	-75.4500000000000028
4675	\N	\N	NEU	Sam Neua	20.4166680000000014	104.066665999999998
4676	\N	\N	NEW	Lakefront	30.0394439999999996	-90.0266649999999942
4677	\N	\N	NFB	Detroit NAF	42.9666670000000011	-82.9666699999999935
4678	\N	\N	NFG	Nefteyugansk	61.1333300000000008	73.0499999999999972
4679	\N	\N	NFL	NAS	39.4666670000000011	-118.783330000000007
4680	\N	\N	NFR	Nafoora	29.2166670000000011	21.5833319999999986
4681	\N	\N	NGA	Young	-34.25	148.25
4682	\N	\N	NGB	Lishe International Airport	29.8204150000000006	121.462395000000001
4683	\N	\N	NGC	North Rim	36.389719999999997	-112.129165999999998
4684	\N	\N	NGD	Captain Auguste George	18.7166670000000011	-64.2999999999999972
4685	\N	\N	NGE	Ngaoundéré	7.35638900000000007	13.5613890000000001
4686	\N	\N	NGI	Ngau Island	-18	179.333329999999989
4687	\N	\N	NGL	Ngala Airfield	2.45000000000000018	21.5500000000000007
4688	\N	\N	NGN	Nargana	9.56861100000000064	-79.25
4689	\N	\N	NGP	NAS	27.6999999999999993	-97.2833300000000065
4690	\N	\N	NGR	Ningerum	-6.5	141
4691	\N	\N	NGS	Nagasaki	32.9144000000000005	129.922580000000011
4692	\N	\N	NGU	NAS Chambers	35.8333319999999986	-76.2833300000000065
4693	\N	\N	NGW	Cabaniss Field	27.7833329999999989	-97.4000000000000057
4694	\N	\N	NGX	Manang	27.7005559999999988	85.3630500000000012
4695	\N	\N	NGZ	NAS	37.7666660000000007	-122.25
4696	\N	\N	NHA	Nha Trang	12.2279119999999999	109.196659999999994
4697	\N	\N	NHD	Minhad AB	25.0237559999999988	55.3736529999999973
4698	\N	\N	NHF	New Halfa	15.3499999999999996	35.7333339999999993
4699	\N	\N	NHK	Patuxent River NAS	38.2999999999999972	-76.4333340000000021
4700	\N	\N	NHS	Nushki	29.5833319999999986	66
4701	\N	\N	NHT	Northolt	51.5333329999999989	-0.366667000000000021
4702	\N	\N	NHX	Barin Olf Osn	30.3999999999999986	-87.6833340000000021
4703	\N	\N	NHZ	NAS	43.9166680000000014	-69.9666699999999935
4704	\N	\N	NIA	Nimba	7.49111100000000008	-8.59166699999999928
4705	\N	\N	NIC	Nicosia International	35.1511100000000027	33.2722199999999972
4706	\N	\N	NIE	Niblack	55.0666659999999979	-132.150000000000006
4707	\N	\N	NIF	Nifty	-21.6750000000000007	121.586110000000005
4708	\N	\N	NIG	Nikunau	-1.3333330000000001	176.416670000000011
4709	\N	\N	NIK	Niokolo Koba	13.0666670000000007	-12.7166669999999993
4710	\N	\N	NIM	Niamey	13.4765339999999991	2.17715799999999993
4711	\N	\N	NIN	Ninilchik	60.0666659999999979	-151.733339999999998
4712	\N	\N	NIO	Nioki	-2.75	17.6999999999999993
4713	\N	\N	NIP	Jacksonville NAS	30.25	-81.6805599999999998
4714	\N	\N	NIR	Chase Field NAS	28.3999999999999986	-97.75
4715	\N	\N	NIS	Simberi	-2.6666669999999999	152
4716	\N	\N	NIT	Niort	46.3166659999999979	-0.450000000000000011
4717	\N	\N	NIX	Nioro	15.2391670000000001	-9.57722200000000079
4718	\N	\N	NJA	Atsugi NAS	35.4166680000000014	139.349999999999994
4719	\N	\N	NJK	El Centro NAF	32.8372230000000016	-115.574719999999999
4720	\N	\N	NKA	Nkan	0.699999999999999956	9.98333300000000001
4721	\N	\N	NKB	Noonkanbah	-18.5500000000000007	124.849999999999994
4722	\N	\N	NKC	Nouakchott	18.0981479999999983	-15.9520409999999995
4723	\N	\N	NKD	Sinak	-5.84999999999999964	110.466669999999993
4724	\N	\N	NKL	Nkolo	-1.98333300000000001	16.4666670000000011
4725	\N	\N	NKM	Komaki AFB	35.2538899999999984	136.919569999999993
4726	\N	\N	NKN	Nankina	-5.83333299999999966	143.449999999999989
4727	\N	\N	NKO	Ankokoambo	-16.5833319999999986	-44.4500000000000028
4728	\N	\N	NKS	Nkongsamba	4.95000000000000018	9.9333329999999993
4729	\N	\N	NKU	Nkaus	-29.5	28
4730	\N	\N	NKV	Nichen Cove	55.8500000000000014	-133.21665999999999
4731	\N	\N	NKX	Miramar MS	32.8666699999999992	-117.116669999999999
4732	\N	\N	NKY	Nkayi	-4.21666700000000017	13.3000000000000007
4733	\N	\N	NLC	Lemoore NAS (Reeves Field)	36.2999999999999972	-119.766670000000005
4734	\N	\N	NLE	Jerry Tyler Memorial	41.8416670000000011	-86.2249999999999943
4735	\N	\N	NLF	Darnley Island	-9.58451499999999967	143.786900000000003
4736	\N	\N	NLG	Nelson Lagoon	56.0013900000000007	-161.152500000000003
4737	\N	\N	NLL	Nullagine	-21.75	120.200000000000003
4738	\N	\N	NLS	Nicholson	-18.0508330000000008	128.895829999999989
4739	\N	\N	NLU	Santa Lucia	19.3999999999999986	-99.1500000000000057
4740	\N	\N	NMA	Namangan	40.9833339999999993	71.5999999999999943
4741	\N	\N	NMB	Daman	20.4166680000000014	72.9500000000000028
4742	\N	\N	NMG	San Miguel	8.36666699999999963	-78.2833300000000065
4743	\N	\N	NMN	Nomane	-16.3166679999999999	145.066669999999988
4744	\N	\N	NMP	New Moon	-20.1666680000000014	143.96665999999999
4745	\N	\N	NMR	Nappa Merry	-27.6000000000000014	141.116669999999999
4746	\N	\N	NMS	Namsang	20.8833330000000004	97.75
4747	\N	\N	NMT	Namtu	23.0833319999999986	97.4000000000000057
4748	\N	\N	NMU	Namu	8	168.133330000000001
4749	\N	\N	NNA	NAF	34.2666660000000007	-6.66666700000000034
4750	\N	\N	NNB	Santa Ana	-10.8333329999999997	162.5
4751	\N	\N	NND	Nangade	-11.0833329999999997	39.1000000000000014
4752	\N	\N	NNG	Nanning	22.6132099999999987	108.167500000000004
4753	\N	\N	NNI	Namutoni	-18.8166679999999999	16.9166680000000014
4754	\N	\N	NNK	Naknek	58.7333339999999993	-157.016940000000005
4755	\N	\N	NNL	Nondalton	59.9785269999999997	-154.837770000000006
4756	\N	\N	NNM	Naryan-Mar	67.6166699999999992	53.1499999999999986
4757	\N	\N	NNR	Connemara	53.2166670000000011	-9.46666699999999928
4758	\N	\N	NNU	Nanuque	-17.8166679999999999	-40.3333319999999986
4759	\N	\N	NNX	Nunukan	4.15000000000000036	117.650000000000006
4760	\N	\N	NNY	Nanyang	32.9836999999999989	112.613050000000001
4761	\N	\N	NOA	Nowra	-34.9505580000000009	150.537499999999994
4762	\N	\N	NOB	Nosara Beach	9.97639799999999966	-85.6530499999999932
4763	\N	\N	NOC	Ireland West Airport Knock	53.9140000000000015	-8.81046800000000019
4764	\N	\N	NOD	Norden	53.5833319999999986	7.20000000000000018
4765	\N	\N	NOG	Nogales	31.3333319999999986	-110.933334000000002
4766	\N	\N	NOH	Chicago NAS	41.8805539999999965	-87.6166699999999992
4767	\N	\N	NOI	Novorossijsk	44.7166670000000011	37.7666660000000007
4768	\N	\N	NOJ	Nojabrxsk	63.1767299999999992	75.2945899999999995
4769	\N	\N	NOK	Nova Xavantina	-14.6902779999999993	-52.3486100000000008
4770	\N	\N	NOL	Nakolik River	67.9000000000000057	-160.71665999999999
4771	\N	\N	NOM	Nomad River	-6.29999999999999982	142.21665999999999
4772	\N	\N	NON	Nonouti	-0.68055600000000005	174.349999999999994
4773	\N	\N	NOO	Naoro	-9.19999999999999929	147.53334000000001
4774	\N	\N	NOR	Nordfjordur	65.1666639999999973	-22
4775	\N	\N	NOT	Novato	38.1433329999999984	-122.55583
4776	\N	\N	NOU	Tontouta	-22.0163900000000012	166.216109999999986
4777	\N	\N	NPA	Pensacola NAS	30.4166680000000014	-87.2166699999999935
4778	\N	\N	NPE	Hawkes Bay	-39.4666700000000006	176.872250000000008
4779	\N	\N	NPG	Nipa	-6.13333300000000037	143.366669999999999
4780	\N	\N	NPH	Nephi	39.7388880000000029	-111.870834000000002
4781	\N	\N	NPL	New Plymouth	-39.0101299999999966	174.17931999999999
4782	\N	\N	NPO	Nangapinoh	-0.33333299999999999	111.733329999999995
4783	\N	\N	NPP	Napperby	-22.5	132.683330000000012
4784	\N	\N	NPT	State	41.5308339999999987	-71.2824999999999989
4785	\N	\N	NPU	San Pedro Uraba	4.95000000000000018	-71.9166639999999973
4786	\N	\N	NQA	Millington Regional Jetport	35.1333300000000008	-90.0499999999999972
4787	\N	\N	NQI	NAS	27.5166660000000007	-97.8666699999999992
4788	\N	\N	NQL	Niquelandia	-14	-48.9833339999999993
4789	\N	\N	NQN	Neuquen	-38.9500000000000028	-68.1522199999999998
4790	\N	\N	NQT	Nottingham Airport	52.9666670000000011	-1.1666669999999999
4791	\N	\N	NQU	Nuqui	5.70000000000000018	-77.2833300000000065
4792	\N	\N	NQX	Key West NAS /Boca Chica Field (private U. S. Navy )	24.5500000000000007	-81.7999999999999972
4793	\N	\N	NQY	Newquay Cornwall Airport	50.4374499999999983	-4.99792199999999998
4794	\N	\N	NRA	Narrandera	-34.705643000000002	146.51169999999999
4795	\N	\N	NRB	Ns	30.3333319999999986	-81.6500000000000057
4796	\N	\N	NRC	Aux Field	37.3833300000000008	-121.099999999999994
4797	\N	\N	NRD	Norderney	53.8333319999999986	7.16666700000000034
4798	\N	\N	NRE	Namrole	-3.81666699999999981	126.716669999999993
4799	\N	\N	NRG	Narrogin	-32.9333340000000021	117.166663999999997
4800	\N	\N	NRI	Shangri-la	35.1666680000000014	-99.8333360000000027
4801	\N	\N	NRK	Kungsangen	58.5832979999999992	16.2323929999999983
4802	\N	\N	NRL	North Ronaldsay	59.3702770000000015	-2.43333300000000019
4803	\N	\N	NRM	Nara	15.25	-7.28333299999999983
4804	\N	\N	NRR	Roosevelt NAS	18.25	-65.6388850000000019
4805	\N	\N	NRS	NAS	32.8372230000000016	-115.574719999999999
4806	\N	\N	NRY	Newry	-16.0166660000000007	129.233339999999998
4807	\N	\N	NSB	North SPB	25.7749999999999986	-79.25
4808	\N	\N	NSE	Whiting Field NAS	30.6333330000000004	-87.0499999999999972
4809	\N	\N	NSF	Andrews NAF	38.8166659999999979	-76.8333360000000027
4810	\N	\N	NSH	Now Shahr	36.6666680000000014	51.5
4811	\N	\N	NSI	Nsimalen International	3.7022219999999999	11.5502780000000005
4812	\N	\N	NSK	Norilsk	69.323120000000003	87.3398059999999958
4813	\N	\N	NSM	Norseman	-32.2000000000000028	121.75
4814	\N	\N	NSN	Nelson	-41.2999760000000009	173.224979999999988
4815	\N	\N	NSO	Scone	-32.0361100000000008	150.83250000000001
4816	\N	\N	NSP	NAF	14.5	120.900000000000006
4817	\N	\N	NST	Nakhon Si Thammarat	8.46666699999999928	99.9500000000000028
4818	\N	\N	NSV	Noosaville	-26.4166680000000014	153.03334000000001
4819	\N	\N	NSX	Hovercraft/Launch Pt	18.5	-64.3666699999999992
4820	\N	\N	NSY	NAS Sigonella	37.3999999999999986	14.9333329999999993
4821	\N	\N	NTA	Natadola	-18.0833319999999986	177.316669999999988
4822	\N	\N	NTC	Santa Carolina	-13.3666669999999996	33.8500000000000014
4823	\N	\N	NTD	Point Mugu NAS (Naval Base Ventura County	34.1499999999999986	-119.200000000000003
4824	\N	\N	NTE	Nantes Atlantique	47.157623000000001	-1.60140199999999999
4825	\N	\N	NTG	Nantong	32.0729200000000034	120.9756
4826	\N	\N	NTI	Bintuni	-2.3333330000000001	133.25
4827	\N	\N	NTJ	Manti-Ephraim	39.2666660000000007	-111.633330000000001
4828	\N	\N	NTL	Williamtown	-32.8045919999999995	151.840059999999994
4829	\N	\N	NTM	Miracema Do Norte	-9.1833329999999993	-48.5
4830	\N	\N	NTN	Normanton	-17.6853979999999993	141.073070000000001
4831	\N	\N	NTO	Santo Antao	17.0666679999999999	-25.0833319999999986
4832	\N	\N	NTR	Aeropuerto del Norte International Airport	25.6666680000000014	-100.316665999999998
4833	\N	\N	NTT	Kuini Lavenia	-15.5	-174
4834	\N	\N	NTU	NAS	36.8166659999999979	-76.0333300000000065
4835	\N	\N	NTX	Natuna Ranai	3.95000000000000018	108.383330000000001
4836	\N	\N	NUB	Numbulwar	-14.2716670000000008	135.716379999999987
4837	\N	\N	NUD	En Nahud	12.75	28.4166680000000014
4838	\N	\N	NUE	Nürnberg	49.4941669999999974	11.0770619999999997
4839	\N	\N	NUG	Nuguria	-3.46666700000000017	150.816669999999988
4840	\N	\N	NUH	Nunchia	5.61666699999999963	-72.2166699999999935
4841	\N	\N	NUI	Nuiqsut	70.2097239999999942	-151.005549999999999
4842	\N	\N	NUJ	Nojeh	35.2000000000000028	48.6666680000000014
4843	\N	\N	NUK	Nukutavake	-19.1833320000000001	-138.699999999999989
4844	\N	\N	NUN	Saufley NAS	30.4725000000000001	-87.1883299999999934
4845	\N	\N	NUP	Nunapitchuk	60.894444	-162.46665999999999
4846	\N	\N	NUQ	Moffett Field	37.3833300000000008	-122.083336000000003
4847	\N	\N	NUR	Nullarbor	-31.4333320000000001	130.916670000000011
4848	\N	\N	NUT	Nutuve	-5.63333300000000037	151.383330000000001
4849	\N	\N	NUW	Whidbey Island NAS (Ault Field)	48.3519440000000031	-122.655829999999995
4850	\N	\N	NVD	Nevada	37.8513900000000021	-94.3038899999999956
4851	\N	\N	NVG	Nueva Guinea	11.6666670000000003	-84.4500000000000028
4852	\N	\N	NVI	Navoi International Airport	40.115000000000002	65.1591640000000041
4853	\N	\N	NVP	Novo Aripuana	-5.13333300000000037	-60.3666699999999992
4854	\N	\N	NVR	Novgorod	58.5166660000000007	31.3000000000000007
4855	\N	\N	NVS	Nevers	47	3.14999999999999991
4856	\N	\N	NVT	Navegantes	-26.8666669999999996	-48.6333300000000008
4857	\N	\N	NVY	Neyveli	11.5999999999999996	79.4333340000000021
4858	\N	\N	NWA	Moheli	-12.2833330000000007	43.7666660000000007
4859	\N	\N	NWH	Parlin Field	43.3666699999999992	-72.1666639999999973
4860	\N	\N	NWP	NS	47.2999999999999972	-53.9666670000000011
4861	\N	\N	NWS	Pier 11/Wall St. SPB	40.7030559999999966	-74.0105599999999981
4862	\N	\N	NWT	Nowata	-9.98333300000000001	149.733339999999998
4863	\N	\N	NXX	Willow Grove NAS	40.2000000000000028	-75.1333300000000008
4864	\N	\N	NYE	Nyeri	-0.41666700000000001	36.9500000000000028
4865	\N	\N	NYG	Quantico NAS	38.5166660000000007	-77.2833300000000065
4866	\N	\N	NYI	Sunyani	7.33333299999999966	-2.3333330000000001
4867	\N	\N	NYK	Nanyuki	0.0166670000000000013	37.0666659999999979
4868	\N	\N	NYN	Nyngan	-31.5666679999999999	147.183330000000012
4869	\N	\N	NYO	Skavsta	58.7842500000000001	16.9228670000000001
4870	\N	\N	NZA	Nzagi	-8.38333300000000037	-21.4333320000000001
4871	\N	\N	NZE	Nzerekore	7.80833300000000019	-8.70277800000000035
4872	\N	\N	NZH	Manzhouli	49.5705900000000028	117.331630000000004
4873	\N	\N	NZW	South Weymouth	42.1666680000000014	-70.9333340000000021
4874	\N	\N	NZY	North Island NAS	32.7000000000000028	-117.200000000000003
4875	\N	\N	OAG	Springhill	-33.3815999999999988	149.124470000000002
4876	\N	\N	OAM	Oamaru	-44.9702800000000025	171.08189999999999
4877	\N	\N	OAN	Olanchito	15.5044439999999994	-86.5747199999999992
4878	\N	\N	OAR	Marina Municipal	36.6166699999999992	-121.916663999999997
4879	\N	\N	OAX	Xoxocotlan	17.0008830000000017	-96.7216339999999946
4880	\N	\N	OBA	Oban	-21	139
4881	\N	\N	OBC	Obock	11.983333	43.2666660000000007
4882	\N	\N	OBD	Obano	-3.89999999999999991	136.199999999999989
4883	\N	\N	OBE	County	27.25	-80.8333360000000027
4884	\N	\N	OBF	Oberpfaffenhofen	48.0833319999999986	11.2833330000000007
4885	\N	\N	OBI	Obidos	-1.9166669999999999	-55.5166660000000007
4886	\N	\N	OBL	Zoersel	51.2666660000000007	4.75
4887	\N	\N	OBM	Morobe	-7.75	147.599999999999994
4888	\N	\N	OBN	Oban Airport	56.4652749999999983	-5.39649399999999968
4889	\N	\N	OBS	Vals-Lanas	44.6666680000000014	4.70000000000000018
4890	\N	\N	OBT	Oakland/Coliseum Stat	39.3999999999999986	-79.4166639999999973
4891	\N	\N	OBX	Obo	-7.58333299999999966	141.316669999999988
4892	\N	\N	OBY	Ittoqqortoormiit	70.5833360000000027	-21.6666680000000014
4893	\N	\N	OCA	Ocean Reef	25.3252769999999998	-80.2747200000000021
4894	\N	\N	OCC	Coca	-0.462170999999999998	-76.9859600000000057
4895	\N	\N	OCE	Municipal	38.3166659999999979	-75.1166699999999992
4896	\N	\N	OCF	Taylor Field	29.1755560000000003	-82.2269440000000031
4897	\N	\N	OCH	A L Mangham Jr. Regional	31.5833319999999986	-94.7000000000000028
4898	\N	\N	OCI	Oceanic	60.25	-147.866669999999999
4899	\N	\N	OCJ	Boscobel	18.4005569999999992	-76.9697199999999953
4900	\N	\N	OCN	Municipal	33.2186129999999977	-117.35333
4901	\N	\N	OCV	Aguasclaras	8.25	-73.3333360000000027
4902	\N	\N	OCW	Warren Field	35.5499999999999972	-77.0499999999999972
4903	\N	\N	ODA	Ouadda	8.00388899999999914	22.4016669999999998
4904	\N	\N	ODB	Cordoba	37.8411100000000005	-4.84722200000000036
4905	\N	\N	ODD	Oodnadatta	-27.5502779999999987	135.449999999999989
4906	\N	\N	ODE	Beldringe	55.4763900000000021	10.3286110000000004
4907	\N	\N	ODH	RAF Station	51.25	-0.949999999999999956
4908	\N	\N	ODJ	Ouanda Djalle	8.91666700000000034	22.8833330000000004
4909	\N	\N	ODL	Cordillo Downs	-26.7166670000000011	140.633330000000001
4910	\N	\N	ODN	Long Seridan	4.03333299999999983	115.066665999999998
4911	\N	\N	ODR	Ord River	-17.5	128.800000000000011
4912	\N	\N	ODS	Odessa International	46.4410099999999986	30.676718000000001
4913	\N	\N	ODW	Oak Harbor	48.2513900000000007	-122.686109999999999
4914	\N	\N	OEA	Oneal	38.6833340000000021	-87.5333300000000065
4915	\N	\N	OEC	Ocussi	-9.20500000000000007	124.341669999999993
4916	\N	\N	OEL	Orel	52.9833339999999993	36.1000000000000014
4917	\N	\N	OEM	Vincent Fayks	3.35000000000000009	-55.4500000000000028
4918	\N	\N	OEO	Municipal	45.2999999999999972	-92.7000000000000028
4919	\N	\N	OES	San Antonio Oeste	-40.7333339999999993	-64.9500000000000028
4920	\N	\N	OFJ	Olafsfjordur	65.5833360000000027	-19.8333319999999986
4921	\N	\N	OFK	Stefan Field	41.9841649999999973	-97.4341660000000047
4922	\N	\N	OFU	Airstrip	-14.1666670000000003	-169.699999999999989
4923	\N	\N	OGA	Searle Field	41.1333300000000008	-101.716669999999993
4924	\N	\N	OGB	Municipal	33.5	-80.8666699999999992
4925	\N	\N	OGE	Ogeranang	-6.46666700000000017	147.46665999999999
4926	\N	\N	OGL	Ogle	6.79999999999999982	-58.105556
4927	\N	\N	OGN	Yonaguni Jima	24.4611109999999989	122.976389999999995
4928	\N	\N	OGO	Abengourou	6.70000000000000018	-3.45000000000000018
4929	\N	\N	OGR	Bongor	10.2894439999999996	15.3833330000000004
4930	\N	\N	OGS	Ogdensburg	44.6816669999999974	-75.4658359999999959
4931	\N	\N	OGV	Ongava Game Reserve	-22.1799999999999997	18.5300000000000011
4932	\N	\N	OGX	Ain Beida	31.9166680000000014	5.40000000000000036
4933	\N	\N	OGZ	Vladikavkaz	43.2000000000000028	44.6000000000000014
4934	\N	\N	OHA	Royal Air Force Base	-40.2083319999999986	175.386670000000009
4935	\N	\N	OHC	AFS	63.3263900000000035	-168.968889999999988
4936	\N	\N	OHD	Ohrid	41.1850000000000023	20.7430549999999982
4937	\N	\N	OHI	Oshakati	-17.7833329999999989	15.8000000000000007
4938	\N	\N	OHO	Okhotsk	59.4166680000000014	143.050000000000011
4939	\N	\N	OHR	Wyk Auf Foehr	54.6858330000000024	8.52916699999999928
4940	\N	\N	OHT	Kohat	33.5833319999999986	71.4333340000000021
4941	\N	\N	OIA	Ourilandia	-6.76130299999999984	-51.0489999999999995
4942	\N	\N	OIC	Eaton	42.5333329999999989	-75.5333300000000065
4943	\N	\N	OIL	Splane Memorial	41.4333340000000021	-79.7000000000000028
4944	\N	\N	OIR	Okushiri	42.1666680000000014	139.516660000000002
4945	\N	\N	OJC	Johnson Executive	38.8500000000000014	-94.7333299999999952
4946	\N	\N	OKB	Fraser Island	-25.25	153.166670000000011
4947	\N	\N	OKE	Okino Erabu	27.4316670000000009	128.705549999999988
4948	\N	\N	OKF	Okaukuejo	-19.1666680000000014	16
4949	\N	\N	OKG	Okoyo	-1.46666699999999994	15
4950	\N	\N	OKH	Cottesmor RAF	52.6666680000000014	-0.716667000000000054
4951	\N	\N	OKI	Oki Island	36.1666680000000014	133.316669999999988
4952	\N	\N	OKK	Kokomo	40.5297199999999975	-86.0580599999999976
4953	\N	\N	OKM	Okmulgee	35.6166699999999992	-95.9666699999999935
4954	\N	\N	OKN	Okondja	-1	14.0083330000000004
4955	\N	\N	OKO	Yokota AFB	35.75	139.349999999999994
4956	\N	\N	OKP	Oksapmin	-5.25	142.083329999999989
4957	\N	\N	OKQ	Okaba	-8.09999999999999964	139.699999999999989
4958	\N	\N	OKR	Yorke Island	-9.75159299999999973	143.405560000000008
4959	\N	\N	OKS	Oshkosh	41.3999999999999986	-102.349999999999994
4960	\N	\N	OKT	Oktiabrskij	54.4333340000000021	53.3833300000000008
4961	\N	\N	OKU	Mokuti Lodge	-18.8083320000000001	17.0500000000000007
4962	\N	\N	OKV	Okao	-5.56111100000000036	141.036669999999987
4963	\N	\N	OKY	Oakey	-27.4066679999999998	151.735000000000014
4964	\N	\N	OLA	Orland	63.7000000000000028	9.61666699999999963
4965	\N	\N	OLB	Costa Smeralda	40.9031450000000021	9.51482299999999981
4966	\N	\N	OLD	Old Town	44.9333340000000021	-68.6500000000000057
4967	\N	\N	OLE	Municipal	42.2408330000000021	-78.3766600000000011
4968	\N	\N	OLF	International	48.0947230000000019	-105.566389999999998
4969	\N	\N	OLI	Rif	65	-23.9833339999999993
4970	\N	\N	OLJ	Olpoi	-14.8846050000000005	166.560030000000012
4971	\N	\N	OLK	Fuerte Olimpo	-21.9969439999999992	-57.8830570000000009
4972	\N	\N	OLM	Olympia	46.9736100000000008	-122.903335999999996
4973	\N	\N	OLN	Colonia Sarmiento	-45.5700000000000003	-69
4974	\N	\N	OLO	Olomouc	49.6333300000000008	17.1999999999999993
4975	\N	\N	OLP	Olympic Dam	-30.4838979999999999	136.884109999999993
4976	\N	\N	OLQ	Olsobip	-5.46666700000000017	141.5
4977	\N	\N	OLS	International	31.4166680000000014	-110.849999999999994
4978	\N	\N	OLU	Columbus Municipal	41.4472239999999985	-97.3416699999999935
4979	\N	\N	OLV	Olive Branch Airport	34.9666670000000011	-89.8333360000000027
4980	\N	\N	OLY	Olney-Noble	38.7166670000000011	-88.0833360000000027
4981	\N	\N	OMA	Eppley Airfield	41.2995700000000028	-95.8997200000000021
4982	\N	\N	OMB	Omboue	-1.60000000000000009	9.26666699999999999
4983	\N	\N	OMC	Ormoc	11.0500000000000007	124.566665999999998
4984	\N	\N	OMD	Oranjemund	-28.5833319999999986	16.4499999999999993
4985	\N	\N	OMF	King Hussein	32.3500000000000014	36.25
4986	\N	\N	OMG	Omega	-18	22.0666679999999999
4987	\N	\N	OMI	Omidieh	30.8333319999999986	49.5333329999999989
4988	\N	\N	OMJ	Omura	32.9244419999999991	129.936110000000014
4989	\N	\N	OMK	Municipal	48.4166680000000014	-119.516670000000005
4990	\N	\N	OML	Omkalai	-6.18555600000000005	144.958329999999989
4991	\N	\N	OMM	Marmul	18.1333330000000004	55.2666660000000007
4992	\N	\N	OMO	Mostar	43.2855569999999972	17.846665999999999
4993	\N	\N	OMR	Oradea	47.0275000000000034	21.9030549999999984
4994	\N	\N	OMY	Oddor Meanche	13.8166670000000007	104.966669999999993
4995	\N	\N	ONA	Municipal	44.076667999999998	-91.7061099999999954
4996	\N	\N	ONB	Ononge	-8.58333299999999966	147.199999999999989
4997	\N	\N	OND	Ondangwa	-17.8854959999999998	15.9422329999999999
4998	\N	\N	ONE	Onepusu	-9.16666700000000034	161.066669999999988
4999	\N	\N	ONG	Mornington	-16.6625580000000006	139.17004
5000	\N	\N	ONH	Municipal	42.4827769999999987	-75.000559999999993
5001	\N	\N	ONI	Moanamani	-3.3333330000000001	135.5
5002	\N	\N	ONJ	Odate Noshiro	40.1964150000000018	140.373829999999998
5003	\N	\N	ONL	Municipal	42.4500000000000028	-98.6500000000000057
5004	\N	\N	ONM	Socorro	34.0666659999999979	-106.900000000000006
5005	\N	\N	ONN	Onion Bay	58.2333339999999993	-152.833329999999989
5006	\N	\N	ONO	Ontario Municipal Airport	44.0227780000000024	-117.013885000000002
5007	\N	\N	ONP	Newport	44.6333300000000008	-124.049999999999997
5008	\N	\N	ONQ	Zonguldak	41.5166660000000007	32.1000000000000014
5009	\N	\N	ONR	Monkira	-24.8166679999999999	140.566669999999988
5010	\N	\N	ONS	Onslow	-21.6666680000000014	115.099999999999994
5011	\N	\N	ONU	Ono I Lau	-16.3333319999999986	179
5012	\N	\N	ONX	Enrique Adolfo Jimenez	9.34999999999999964	-79.9000000000000057
5013	\N	\N	ONY	Olney	33.3666699999999992	-98.75
5014	\N	\N	OOA	Municipal	41.2999999999999972	-92.6500000000000057
5015	\N	\N	OOK	Toksook Bay	60.5319440000000029	-165.108339999999998
5016	\N	\N	OOL	Gold Coast (coolangatta)	-28.1661639999999984	153.513139999999993
5017	\N	\N	OOM	Cooma	-36.3083340000000021	148.973330000000004
5018	\N	\N	OOR	Mooraberree	-25.0500000000000007	141.233339999999998
5019	\N	\N	OOT	Onotoa	-1.9166669999999999	175.566669999999988
5020	\N	\N	OPA	Kopasker	66.4166639999999973	-16.4833339999999993
5021	\N	\N	OPB	Open Bay	-4.93333300000000019	151.666670000000011
5022	\N	\N	OPI	Oenpelli	-12.3333329999999997	133.066669999999988
5023	\N	\N	OPL	St Landry Parish	30.5333329999999989	-92.0833360000000027
5024	\N	\N	OPO	Francisco Sá Carneiro	41.2377740000000017	-8.67027200000000065
5025	\N	\N	OPS	Sinop	-11.8785729999999994	-55.5815600000000032
5026	\N	\N	OPU	Balimo	-8.03333300000000072	142.933330000000012
5027	\N	\N	OPW	Opuwa	-18.0666679999999999	13.8333329999999997
5028	\N	\N	ORA	Oran	-23.3333319999999986	-64.1666639999999973
5029	\N	\N	ORB	Orebro-bofors	59.225757999999999	15.0475429999999992
5030	\N	\N	ORC	Orocue	4.90000000000000036	-71.3333360000000027
5031	\N	\N	ORE	Orleans	47.9166680000000014	1.89999999999999991
5032	\N	\N	ORF	Norfolk International Airport	36.8985819999999975	-76.2062899999999956
5033	\N	\N	ORG	Zorg En Hoop	5.80944400000000005	-55.1911130000000014
5034	\N	\N	ORH	Worcester Regional Airport	42.2691700000000026	-71.874440000000007
5035	\N	\N	ORI	Port Lions SPB	57.8861119999999971	-152.843889999999988
5036	\N	\N	ORJ	Orinduik	4.71666700000000017	-60.0333329999999989
5037	\N	\N	ORL	Orlando Executive	28.5441670000000016	-81.3355559999999969
5038	\N	\N	ORM	Northampton	52.2333339999999993	-0.900000000000000022
5039	\N	\N	ORO	Yoro	15.1252779999999998	-87.1338899999999938
5040	\N	\N	ORP	Orapa	-21	24.5
5041	\N	\N	ORQ	Heliport	41.1166699999999992	-73.3666699999999992
5042	\N	\N	ORR	Yorketown	-35.0333329999999989	137.583329999999989
5043	\N	\N	ORS	Waterport	-18.6333330000000004	146.483339999999998
5044	\N	\N	ORT	Northway	62.9619450000000001	-141.92389
5045	\N	\N	ORV	Curtis Memorial	66.8291700000000048	-161.023599999999988
5046	\N	\N	ORW	Ormara	25.3000000000000007	64.5833360000000027
5047	\N	\N	ORX	Oriximina	-1.75	-55.8666699999999992
5048	\N	\N	ORZ	Orange Walk	17.1666680000000014	-88.75
5049	\N	\N	OSB	Osage Beach	38.114370000000001	-92.6821699999999993
5050	\N	\N	OSC	Wurtsmith AFB	44.4333340000000021	-83.3333360000000027
5051	\N	\N	OSD	Åre Östersund Airport	63.1986119999999971	14.4944439999999997
5052	\N	\N	OSE	Omora	-7.83333299999999966	147.083329999999989
5053	\N	\N	OSG	Ossima	-2.96666700000000017	141.333329999999989
5054	\N	\N	OSH	Wittman Field	43.9838900000000024	-88.5569459999999964
5055	\N	\N	OSK	Oskarshamn	57.2666660000000007	16.4333320000000001
5056	\N	\N	OSL	Gardermoen	60.194189999999999	11.1004109999999994
5057	\N	\N	OSN	Osan AB	37.0833319999999986	127.033330000000007
5058	\N	\N	OSS	Osh International Airport	40.6076899999999981	72.7864799999999974
5059	\N	\N	OSU	Ohio State University	40.0780559999999966	-83.0733299999999986
5060	\N	\N	OSX	Attala County	33.0666659999999979	-89.5833360000000027
5061	\N	\N	OSZ	Koszalin	54.0427779999999984	16.264444000000001
5062	\N	\N	OTA	Mota	11.0666670000000007	37.8833300000000008
5063	\N	\N	OTC	Bol	13.4333329999999993	14.733333
5064	\N	\N	OTD	Contadora	8.66666700000000034	-79.5666659999999979
5065	\N	\N	OTG	Worthington	43.6522199999999998	-95.5836099999999931
5066	\N	\N	OTH	North Bend	43.4188880000000026	-124.239999999999995
5067	\N	\N	OTJ	Otjiwarongo	-20.4305549999999982	16.6625000000000014
5068	\N	\N	OTL	Boutilimit	17.75	-14.6666670000000003
5069	\N	\N	OTM	Industrial	41.1063880000000026	-92.4491649999999936
5070	\N	\N	OTN	Green	38.8666699999999992	-87.4500000000000028
5071	\N	\N	OTO	Vor	35.0666659999999979	-105.933334000000002
5072	\N	\N	OTR	Coto 47	8.5666670000000007	-82.9333340000000021
5073	\N	\N	OTS	Anacortes	48.4991699999999994	-122.661109999999994
5074	\N	\N	OTU	Otu	7	-74.7166699999999935
5075	\N	\N	OTV	Ontong Java	-5.51388899999999982	159.522780000000012
5076	\N	\N	OTY	Oria	-6.59999999999999964	155.766660000000002
5077	\N	\N	OTZ	Kotzebue	66.8880539999999968	-162.605829999999997
5078	\N	\N	OUA	Ouagadougou	12.3550190000000004	-1.51428300000000005
5079	\N	\N	OUD	Les Anglades	34.7833329999999989	-1.93333299999999997
5080	\N	\N	OUE	Ouesso	1.61666700000000008	16.04861
5081	\N	\N	OUG	Ouahigouya	13.516667	-2.3333330000000001
5082	\N	\N	OUH	Oudtshoorn	-33.6033329999999992	22.1883340000000011
5083	\N	\N	OUI	Ban Houei	18.9361110000000004	102.670829999999995
5084	\N	\N	OUM	Oum Hadjer	13.2166669999999993	19.6166669999999996
5085	\N	\N	OUN	Max Westheimer	35.2166670000000011	-97.4333340000000021
5086	\N	\N	OUR	Batouri	4.4730559999999997	14.3636110000000006
5087	\N	\N	OUS	Ourinhos	-22.9666670000000011	-49.9166680000000014
5088	\N	\N	OUT	Bousso	10.483333	16.7166670000000011
5089	\N	\N	OUU	Ouanga	-2.98333300000000001	10.3000000000000007
5090	\N	\N	OVA	Bekily	-24.2325000000000017	45.3049999999999997
5091	\N	\N	OVB	Tolmachevo	55.0090100000000035	82.6670000000000016
5092	\N	\N	OVD	Asturias	43.5589099999999974	-6.03209399999999984
5093	\N	\N	OVE	Oroville	39.5	-121.616669999999999
5094	\N	\N	OVG	Overberg (FAOB)	-34.5516659999999973	20.2358319999999985
5095	\N	\N	OVL	Ovalle	-30.5666679999999999	-71
5096	\N	\N	OVR	Olavarria	-36.8888900000000035	-60.2277800000000028
5097	\N	\N	OWA	Owatonna	44.1000000000000014	-93.1666639999999973
5098	\N	\N	OWB	Daviess County	37.7408330000000021	-87.1658299999999997
5099	\N	\N	OWD	Memorial	42	-71
5100	\N	\N	OWE	Owendo	0.349999999999999978	9.48333300000000001
5101	\N	\N	OWK	Central Maine Airport of Norridgewock	44.7166670000000011	-69.7999999999999972
5102	\N	\N	OXB	Osvaldo Vieira International	11.8888890000000007	-15.6572220000000009
5103	\N	\N	OXC	Waterbury-oxford	41.4791680000000014	-73.1363900000000058
5104	\N	\N	OXD	Miami University	39.860280000000003	-84.7611100000000022
5105	\N	\N	OXF	Oxford (Kidlington)	51.7666660000000007	-1.25
5106	\N	\N	OXO	Orientos	-27.6666680000000014	141.333329999999989
5107	\N	\N	OXR	Ventura	34.2011099999999999	-119.206389999999999
5108	\N	\N	OXY	Morney	-25.3500000000000014	141.366669999999999
5109	\N	\N	OYA	Goya	-29.1033329999999992	-59.2166670000000011
5110	\N	\N	OYE	Oyem	1.56666700000000003	11.5833329999999997
5111	\N	\N	OYG	Moyo	3.64999999999999991	31.7166670000000011
5112	\N	\N	OYK	Oiapoque	3.88333299999999992	-51.7833329999999989
5113	\N	\N	OYL	Moyale	3.53333299999999983	39.0499999999999972
5114	\N	\N	OYN	Ouyen	-35.0666659999999979	142.333329999999989
5115	\N	\N	OYO	Tres Arroyos	-38.3666699999999992	-60.25
5116	\N	\N	OYP	St-Georges de lOyapock	3.89999999999999991	-51.7999999999999972
5117	\N	\N	OYS	Yosemite Ntl Park	37.8500000000000014	-119.549999999999997
5118	\N	\N	OZA	Ozona Municipalcipal	30.7166670000000011	-101.216669999999993
5119	\N	\N	OZH	Zaporozhye	47.8674999999999997	35.3158340000000024
5120	\N	\N	OZI	Bobadilla	37.6625000000000014	-24.8999999999999986
5121	\N	\N	OZP	Moron	37.2491699999999994	-5.75944400000000023
5122	\N	\N	OZR	Cairns AAF	31.4499999999999993	-85.6666639999999973
5123	\N	\N	OZU	Montilla	37.6000000000000014	-4.63333300000000037
5124	\N	\N	OZZ	Ouarzazate	30.9166680000000014	-6.91666700000000034
5125	\N	\N	PAA	Pa-an	16.8927779999999998	97.6783300000000025
5126	\N	\N	PAB	Bilaspur	31.3166679999999999	76.8333360000000027
5127	\N	\N	PAC	Paitilla-Marcos A. Gelabert	8.98333300000000001	-79.2166699999999935
5128	\N	\N	PAD	Paderborn/lippstadt	51.6103319999999997	8.6198320000000006
5129	\N	\N	PAE	Snohomish County - Paine Field	47.9097200000000001	-122.284450000000007
5130	\N	\N	PAF	Pakuba	2.20000000000000018	31.6166669999999996
5131	\N	\N	PAG	Pagadian	7.8266669999999996	123.457499999999996
5132	\N	\N	PAH	Barkley Regional	37.0611099999999993	-88.7724999999999937
5133	\N	\N	PAJ	Para Chinar	33.8999999999999986	70.0999999999999943
5134	\N	\N	PAK	Port Allen	21.9333320000000001	-159.616669999999999
5135	\N	\N	PAL	Palanquero	52.1499999999999986	-74.6500000000000057
5136	\N	\N	PAM	Tyndall AFB	30.1666680000000014	-85.6833340000000021
5137	\N	\N	PAN	Pattani	6.77722200000000008	101.158330000000007
5138	\N	\N	PAO	Palo Alto	37.460835000000003	-122.113889999999998
5139	\N	\N	PAQ	Palmer Municipalcipal	61.6000000000000014	-149.116669999999999
5140	\N	\N	PAU	Pauk	21.4499999999999993	94.5166700000000048
5141	\N	\N	PAV	Paulo Afonso	-9.39777800000000063	-38.2222200000000001
5142	\N	\N	PAW	Pambwa	-11.4166670000000003	154.03334000000001
5143	\N	\N	PAX	Port De Paix	19.9333320000000001	-72.8416699999999935
5144	\N	\N	PAY	Pamol	5.99305600000000016	117.394450000000006
5145	\N	\N	PBA	Point Barrow	71.2833300000000065	-156.766660000000002
5146	\N	\N	PBB	Paranaiba	-19.6666680000000014	-51.1833340000000021
5147	\N	\N	PBC	Hermanos Serdan International	19.1350000000000016	-98.3675000000000068
5148	\N	\N	PBD	Porbandar	21.6472230000000003	69.6569439999999958
5149	\N	\N	PBE	Puerto Berrio	6.48333300000000001	-74.4833299999999952
5150	\N	\N	PBF	Grider Field	34.1755560000000003	-91.9355549999999937
5151	\N	\N	PBI	International	26.6888849999999991	-80.090440000000001
5152	\N	\N	PBJ	Paama	-16.4333320000000001	168.21665999999999
5153	\N	\N	PBK	Pack Creek	57.7999999999999972	-134.699999999999989
5154	\N	\N	PBL	Puerto Cabello	10.4791670000000003	-68.0736100000000022
5155	\N	\N	PBN	Porto Amboim	-10.6999999999999993	13.75
5156	\N	\N	PBO	Paraburdoo	-23.1739080000000008	117.748000000000005
5157	\N	\N	PBP	Punta Islita	10.4166670000000003	-85.1666639999999973
5158	\N	\N	PBQ	Pimenta Bueno	-11.6999999999999993	-61.2000000000000028
5159	\N	\N	PBR	Puerto Barrios	15.7230559999999997	-88.606110000000001
5160	\N	\N	PBS	Patong Beach	7.89527800000000024	98.2916639999999973
5161	\N	\N	PBT	Puerto Leda	-20.6166669999999996	-58.0269430000000028
5162	\N	\N	PBU	Putao	27.3333319999999986	97.4166639999999973
5163	\N	\N	PBV	Porto Dos Gauchos	-11.516667	-57.3333319999999986
5164	\N	\N	PBW	Palibelo	9.52999999999999936	-0.220000000000000001
5165	\N	\N	PBX	Porto Alegre Do Norte	-10.8608329999999995	-51.6844439999999992
5166	\N	\N	PBY	Hamilton/Proserpine	-20.2833329999999989	148.833329999999989
5167	\N	\N	PBZ	Plettenberg Bay	-34.0874999999999986	23.3291660000000007
5168	\N	\N	PCA	Portage Creek	58.9013899999999992	-157.701950000000011
5169	\N	\N	PCB	Pondok Cabe	-6.34999999999999964	106.766670000000005
5170	\N	\N	PCC	Puerto Rico	1.89999999999999991	-75.1500000000000057
5171	\N	\N	PCD	Prairie du Chien Municipal Airport	43.0166660000000007	-91.1166699999999992
5172	\N	\N	PCE	Painter Creek	57.164164999999997	-157.433060000000012
5173	\N	\N	PCG	Paso Caballos	17.2600000000000016	-90.2472199999999987
5174	\N	\N	PCH	Palacios	15	-89
5175	\N	\N	PCJ	Puerto La Victoria	-22.2688880000000005	-57.928609999999999
5176	\N	\N	PCK	Porcupine Creek	67.2288900000000069	-150.28334000000001
5177	\N	\N	PCL	Captain Rolden International Airport	-8.33333299999999966	-74.6333300000000008
5178	\N	\N	PCM	Playa Del Carmen	20.6000000000000014	-87.0999999999999943
5179	\N	\N	PCN	Koromiko	-41.3500000000000014	174.03334000000001
5180	\N	\N	PCO	Punta Colorada	23.5833319999999986	-109.5
5181	\N	\N	PCP	Principe	1.6666669999999999	7.41666700000000034
5182	\N	\N	PCQ	Bounneua	21.6458319999999986	101.905829999999995
5183	\N	\N	PCR	Puerto Carreno	6.18333300000000019	-67.6333300000000008
5184	\N	\N	PCS	Picos	-7.08333299999999966	-41.4666670000000011
5185	\N	\N	PCT	Princeton	40.3500000000000014	-74.6500000000000057
5186	\N	\N	PCU	Pearl River County	30.4333320000000001	-89.6833340000000021
5187	\N	\N	PCV	Punta Chivato	27.0833319999999986	-112
5188	\N	\N	PDB	Pedro Bay	59.7833329999999989	-154.116669999999999
5189	\N	\N	PDC	Mueo	-21.3166679999999999	165
5190	\N	\N	PDD	Ponta de Ouro	-26.7830559999999984	32.8805539999999965
5191	\N	\N	PDE	Pandie Pandie	-26	138.666670000000011
5192	\N	\N	PDF	Prado	-17.3500000000000014	-39.2166670000000011
5193	\N	\N	PDG	Minangkabau International Airport	-0.786667000000000005	100.280556000000004
5194	\N	\N	PDI	Pindiu	-6.5	147.583329999999989
5195	\N	\N	PDK	Dekalb-Peachtree	33.8833300000000008	-84.25
5196	\N	\N	PDL	Nordela (São Miguel Island)	37.7438470000000024	-25.6964679999999994
5197	\N	\N	PDN	Parndana	-35.9166680000000014	138.083329999999989
5198	\N	\N	PDO	Pendopo	-3.28333299999999983	103.866669999999999
5199	\N	\N	PDR	Presidente Dutra	-5.31111100000000036	-44.4802779999999984
5200	\N	\N	PDT	Pendleton	45.6983340000000027	-118.836110000000005
5201	\N	\N	PDU	Paysandu	-32.3658330000000021	-58.0641669999999976
5202	\N	\N	PDV	Plovdiv	42.2999999999999972	24.7166670000000011
5203	\N	\N	PDZ	Pedernales	9.96666699999999928	-62.2333339999999993
5204	\N	\N	PEA	Penneshaw	-35.7333339999999993	137.933330000000012
5205	\N	\N	PEB	Pebane	-17.1666680000000014	38.1333300000000008
5206	\N	\N	PEC	Pelican SPB	57.9500000000000028	-136.233339999999998
5207	\N	\N	PED	Pardubice	50.0133319999999983	15.7386110000000006
5208	\N	\N	PEE	Bolshoye Savino	57.9200250000000025	56.0191799999999986
5209	\N	\N	PEF	Peenemuende	54.1666680000000014	13.766667
5210	\N	\N	PEG	Sant Egidio	43.1333300000000008	12.3666669999999996
5211	\N	\N	PEH	Pehuajo	-35.8500000000000014	-61.8666699999999992
5212	\N	\N	PEJ	Peschiei	41.701667999999998	15.730556
5213	\N	\N	PEL	Pelaneng	-30.5500000000000007	27.9166680000000014
5214	\N	\N	PEP	Peppimenarti	-14.1500000000000004	130.099999999999994
5215	\N	\N	PEQ	Pecos City	31.4333320000000001	-103.5
5216	\N	\N	PER	Perth International	-31.9336030000000015	115.960235999999995
5217	\N	\N	PEU	Puerto Lempira	15.2166669999999993	-83.7666700000000048
5218	\N	\N	PEV	Pecs Pogany	69.7833300000000065	170.599999999999994
5219	\N	\N	PEW	Peshawar	33.9890820000000033	71.5192499999999995
5220	\N	\N	PEY	Penong	-31.9166680000000014	133.016660000000002
5221	\N	\N	PEZ	Penza	53.1185199999999966	45.0230499999999978
5222	\N	\N	PFA	Paf Warren	58.6666680000000014	-156.833329999999989
5223	\N	\N	PFB	Passo Fundo	-28.25	-52.3333319999999986
5224	\N	\N	PFC	Pacific City State	45.2333339999999993	-123.950000000000003
5225	\N	\N	PFD	Port Frederick	57.9500000000000028	-135.650000000000006
5226	\N	\N	PFJ	Patreksfjordur	65.0333300000000065	-19.0083330000000004
5227	\N	\N	PFN	Bay County	30.2070849999999993	-85.6830900000000071
5228	\N	\N	PFO	International	34.7115500000000026	32.4891050000000021
5229	\N	\N	PFQ	Parsabad	39.6068899999999999	47.877519999999997
5230	\N	\N	PFR	Ilebo	-4.31666699999999981	20.5833319999999986
5231	\N	\N	PGB	Pangoa	-7.01666699999999999	141.550000000000011
5232	\N	\N	PGC	Grant County	39	-79.1166699999999992
5233	\N	\N	PGE	Yegepa	-7.13333300000000037	146.150000000000006
5234	\N	\N	PGF	Llabanere	42.7410160000000019	2.86818300000000015
5235	\N	\N	PGG	Progresso	-6.95416699999999999	-55.4611099999999979
5236	\N	\N	PGH	Pantnagar	29.0319439999999993	79.4736099999999936
5237	\N	\N	PGI	Chitato	-7.33333299999999966	20.8000000000000007
5238	\N	\N	PGK	Pangkalpinang	-2.16401699999999986	106.137069999999994
5239	\N	\N	PGL	Jackson County	30.3833330000000004	-88.5166700000000048
5240	\N	\N	PGM	Port Graham	59.3500000000000014	-151.833329999999989
5241	\N	\N	PGN	Pangia	-6.29999999999999982	144.199999999999989
5242	\N	\N	PGO	Stevens Field	37.2686119999999974	-107.050835000000006
5243	\N	\N	PGP	Porto Alegre	0.0333330000000000015	6.53333299999999983
5244	\N	\N	PGR	Paragould Kirk Field	36.0333329999999989	-90.5
5245	\N	\N	PGS	Peach Springs	35.5333329999999989	-113.416663999999997
5246	\N	\N	PGV	Pitt-Greenville	35.6333300000000008	-77.3852799999999945
5247	\N	\N	PGX	Bassillac	45.1833340000000021	0.716667000000000054
5248	\N	\N	PHA	Phan Rang	11.6333330000000004	108.950000000000003
5249	\N	\N	PHB	Santos Dumont	-2.89166699999999999	-41.7383349999999993
5250	\N	\N	PHC	Port Harcourt	5.0065059999999999	6.94990000000000041
5251	\N	\N	PHD	Harry Clever Field	40.5	-81.4500000000000028
5252	\N	\N	PHE	Port Hedland	-20.3779450000000004	118.631640000000004
5253	\N	\N	PHG	Port Harcourt City	5.03333299999999983	6.83333299999999966
5254	\N	\N	PHH	Phan Thiet	10.9000000000000004	108.066665999999998
5255	\N	\N	PHI	Pinheiro	-2.51666699999999999	-45.0833319999999986
5256	\N	\N	PHJ	Port Hunter	-32.9166680000000014	151.766660000000002
5257	\N	\N	PHK	Palm Beach Co Glades	26.8166679999999999	-80.6666639999999973
5258	\N	\N	PHN	St Clair County International	42.9130549999999999	-82.5261100000000027
5259	\N	\N	PHP	Philip	44.3333319999999986	-101.666663999999997
5260	\N	\N	PHR	Pacific Harbor	-18.1999999999999993	178.050000000000011
5261	\N	\N	PHS	Phitsanulok	16.7713070000000002	100.281199999999998
5262	\N	\N	PHT	Henry County	36.3336100000000002	-88.3833300000000008
5263	\N	\N	PHU	Phu Vinh	9.94999999999999929	106.333336000000003
5264	\N	\N	PHW	Phalaborwa	-23.9336100000000016	31.1561100000000017
5265	\N	\N	PHY	Phetchabun	16.6819440000000014	101.198329999999999
5266	\N	\N	PHZ	Phi Phi Island	8.16666700000000034	98.2833300000000065
5267	\N	\N	PIA	Greater Peoria	40.6664299999999983	-89.6901199999999932
5268	\N	\N	PIB	Hattiesburg-Laurel Regional	31.4675000000000011	-89.336669999999998
5269	\N	\N	PIC	Pine Cay	21.8833330000000004	-72.0999999999999943
5270	\N	\N	PID	Paradise Island	25.0833319999999986	-77.2999999999999972
5271	\N	\N	PIF	Pingtung	22.7050039999999989	120.490234000000001
5272	\N	\N	PIG	Pitinga	-24.75	-51.7166670000000011
5273	\N	\N	PIH	Pocatello	42.913333999999999	-112.594443999999996
5274	\N	\N	PII	Phillips Field	64.8638899999999978	-147.713879999999989
5275	\N	\N	PIL	Pilar	-26.8666669999999996	-58.3333319999999986
5276	\N	\N	PIM	Garden Harris County	32.8666699999999992	-84.8333360000000027
5277	\N	\N	PIN	Parintins	-2.6692079999999998	-56.7700269999999989
5278	\N	\N	PIO	Pisco	-13.75	-76.2166699999999935
5279	\N	\N	PIP	Pilot Point	57.5636099999999971	-157.560840000000013
5280	\N	\N	PIQ	Pipillipai	5.5	-59
5281	\N	\N	PIV	Pirapora	-17.3386120000000012	-44.9322200000000009
5282	\N	\N	PIW	Pikwitonei	55.7000000000000028	-97.3333360000000027
5283	\N	\N	PIX	Pico Island	38.4666670000000011	-28.3000000000000007
5284	\N	\N	PIZ	Dew Station	69.75	-163.166670000000011
5285	\N	\N	PJB	Payson	34.2611119999999971	-111.341669999999993
5286	\N	\N	PJC	Pedro Juan Caballero	-22.5	-55.6666680000000014
5287	\N	\N	PJG	Panjgur	26.9666670000000011	64.0999999999999943
5288	\N	\N	PJS	Port San Juan	60.0486099999999965	-148.063889999999986
5289	\N	\N	PJZ	Puerto Juarez	21.1666680000000014	-86.8333360000000027
5290	\N	\N	PKB	Wood County	39.3455539999999999	-81.4388900000000007
5291	\N	\N	PKD	Park Rapids	46.898335000000003	-95.0716699999999975
5292	\N	\N	PKE	Parkes	-33.138454000000003	148.232900000000001
5293	\N	\N	PKF	Park Falls	45.9333340000000021	-90.5333300000000065
5294	\N	\N	PKG	Pangkor Airport	4.21666700000000017	100.700000000000003
5295	\N	\N	PKH	Alexion	37.3013880000000029	23.1472230000000003
5296	\N	\N	PKJ	Playa Grande	15.6425000000000001	-90.7619499999999988
5297	\N	\N	PKK	Pakokku	21.3433320000000002	95.1063900000000046
5298	\N	\N	PKL	Pakatoa Island	-37.8069460000000035	174.85333
5299	\N	\N	PKM	Port Kaituma	7.73333300000000001	-59.8833300000000008
5300	\N	\N	PKO	Parakou	9.34999999999999964	2.61666700000000008
5301	\N	\N	PKP	Puka Puka	-14.75	-138.96665999999999
5302	\N	\N	PKR	Pokhara	28.197222	83.9861149999999981
5303	\N	\N	PKS	Paksane	18.3666669999999996	103.683334000000002
5304	\N	\N	PKT	Port Keats	-14.25	129.53334000000001
5305	\N	\N	PKU	Sultan Syarif Kasim Ii	0.464563000000000004	101.446883999999997
5306	\N	\N	PKV	Pskov	57.8166659999999979	28.3000000000000007
5307	\N	\N	PKW	Selebi-Phikwe	-22.0500000000000007	27.8166679999999999
5308	\N	\N	PKY	Cilik Riwut (Tjilik Riwoet)	-2.2239580000000001	113.945785999999998
5309	\N	\N	PLA	Planadas	3.29999999999999982	-75.7000000000000028
5310	\N	\N	PLC	Planeta Rica	8.41666700000000034	-75.5999999999999943
5311	\N	\N	PLD	Playa Samara	10.25	-85.4166639999999973
5312	\N	\N	PLE	Paiela	-5.38333300000000037	142.983339999999998
5313	\N	\N	PLF	Pala	9.38333300000000037	14.9333329999999993
5314	\N	\N	PLH	Plymouth	50.4223369999999989	-4.1100089999999998
5315	\N	\N	PLI	Palm Island	12.3499999999999996	-61.2333339999999993
5316	\N	\N	PLJ	Placencia	16.5333329999999989	-88.3527760000000058
5317	\N	\N	PLK	M. Graham Clark - Taney County	36.6499999999999986	-93.2166699999999935
5318	\N	\N	PLL	Ponta Pelada	-3.14555600000000002	-59.9844440000000034
5319	\N	\N	PLM	Mahmud Badaruddin Ii	-2.90014599999999989	104.698610000000002
5320	\N	\N	PLN	Emmet County	45.5708300000000008	-84.7927799999999934
5321	\N	\N	PLO	Port Lincoln	-34.6033329999999992	135.874539999999996
5322	\N	\N	PLP	La Palma	8.33333299999999966	-78.1333300000000008
5323	\N	\N	PLQ	Palanga International	55.9500000000000028	21.0833319999999986
5324	\N	\N	PLR	St Clair County	33.5833319999999986	-86.2833300000000065
5325	\N	\N	PLS	International	21.7691669999999995	-72.268330000000006
5326	\N	\N	PLT	Plato	9.78333300000000072	-74.7833300000000065
5327	\N	\N	PLU	Pampulha	-19.75	-43.75
5328	\N	\N	PLV	Poltava	49.5833319999999986	34.5333329999999989
5329	\N	\N	PLX	Semipalatinsk	50.3333319999999986	80.25
5330	\N	\N	PLY	Plymouth	41.3652760000000015	-86.3016700000000014
5331	\N	\N	PMA	Wawi	-5.24222199999999994	39.8019450000000035
5332	\N	\N	PMB	Intermediate	49	-98.0833360000000027
5333	\N	\N	PMD	La Palmdale Regional Airport	34.6274999999999977	-118.083336000000003
5334	\N	\N	PME	Portsmouth	50.7999999999999972	-1.0833330000000001
5335	\N	\N	PMF	Giuseppe Verdi	44.7999999999999972	10.3333329999999997
5336	\N	\N	PMG	International	-22.5500000000000007	-55.7000000000000028
5337	\N	\N	PMH	Greater Portsmouth Regional	38.75	-82.9833299999999952
5338	\N	\N	PMK	Palm Island	-18.3333319999999986	146.666670000000011
5339	\N	\N	PMM	Phanom Sarakham	13.75	101.349999999999994
5340	\N	\N	PMN	Pumani	-9.71666699999999928	149.400000000000006
5341	\N	\N	PMO	Punta Raisi	38.1865230000000011	13.1047790000000006
5342	\N	\N	PMP	Pimaga	-6.66666700000000034	143.416670000000011
5343	\N	\N	PMQ	Perito Moreno	-46.5363899999999973	-70.9836099999999988
5344	\N	\N	PMS	Palmyra	34.6000000000000014	38.25
5345	\N	\N	PMT	Paramakotoi	7.56666699999999981	-57.1833340000000021
5346	\N	\N	PMU	SPB	61.9833339999999993	-160.333329999999989
5347	\N	\N	PMX	Metropolitan	42.1499999999999986	-72.3166659999999979
5348	\N	\N	PMY	El Tehuelche	-42.7333339999999993	-65.0666659999999979
5349	\N	\N	PMZ	Palmar Sur	8.95083600000000068	-83.4659800000000018
5350	\N	\N	PNA	Pamplona	42.7674980000000033	-1.63934700000000011
5351	\N	\N	PNB	Porto Nacional	-10.6999999999999993	-48.4166680000000014
5352	\N	\N	PNC	Ponca City	36.7280579999999972	-97.0994400000000013
5353	\N	\N	PND	Punta Gorda	16.1000000000000014	-88.8166659999999979
5354	\N	\N	PNE	North Philadelphia	40.0802759999999978	-75.0125000000000028
5355	\N	\N	PNG	Paranagua	-25.5166660000000007	-48.5
5356	\N	\N	PNH	Phnom Penh International	11.5461109999999998	104.84778
5357	\N	\N	PNJ	Peng Lai/Sha He Kou	37.8088869999999986	120.812775000000002
5358	\N	\N	PNL	Pantelleria	36.8136099999999971	11.9661109999999997
5359	\N	\N	PNN	Princeton	45.2333339999999993	-67.5666659999999979
5360	\N	\N	PNO	Pinotepa Nacional	16.3425000000000011	-98.0694400000000002
5361	\N	\N	PNR	Pointe-Noire	-4.80979899999999994	11.882377
5362	\N	\N	PNS	Regional	30.4759430000000009	-87.1941599999999966
5363	\N	\N	PNT	Teniente J. Gallardo	-51.6833340000000021	-72.5166700000000048
5364	\N	\N	PNU	Panguitch	37.8333319999999986	-112.383330000000001
5365	\N	\N	PNV	Panevezys	55.7333339999999993	24.3833330000000004
5366	\N	\N	PNX	Grayson County	33.6388900000000035	-96.6111149999999981
5367	\N	\N	PNZ	Internacional	-9.39333300000000015	-40.4905550000000005
5368	\N	\N	POB	Pope AFB	35.0499999999999972	-78.8833300000000008
5369	\N	\N	POC	Brackett Field	34.0333329999999989	-117.516670000000005
5370	\N	\N	POD	Podor	16.6666680000000014	-14.9666669999999993
5371	\N	\N	POE	Polk AAF	31.0458339999999993	-93.1922200000000061
5372	\N	\N	POF	Earl Fields Memorial	36.7111099999999979	-90.3138900000000007
5373	\N	\N	POG	Port Gentil	-0.719964000000000048	8.75358400000000003
5374	\N	\N	POH	Pocahontas Municipal	42.7422200000000032	-94.644165000000001
5375	\N	\N	POI	Potosi	-19.543056	-65.7236099999999936
5376	\N	\N	POJ	Patos De Minas	-18.6716669999999993	-46.4908330000000021
5377	\N	\N	POM	Jackson Field	-9.44430799999999948	147.214460000000003
5378	\N	\N	PON	Poptun	16.3500000000000014	-89.4333340000000021
5379	\N	\N	POO	Pocos De Caldas	-21.8413889999999995	-46.5675000000000026
5380	\N	\N	POP	La Union	19.7549419999999998	-70.5631499999999932
5381	\N	\N	POQ	Polk Inlet	55.3500000000000014	-132.5
5382	\N	\N	POS	Piarco International	10.6020889999999994	-61.3394130000000004
5383	\N	\N	POT	Ken Jones	18.1983339999999991	-76.5355500000000006
5384	\N	\N	POU	Dutchess County	41.6280560000000008	-73.8827739999999977
5385	\N	\N	POV	Presov	49	21.25
5386	\N	\N	POW	Portoroz	45.5166660000000007	13.5833329999999997
5387	\N	\N	POX	Paris Cergy Pontoise	49.0499999999999972	2.10000000000000009
5388	\N	\N	POY	Powell	44.75	-108.766670000000005
5389	\N	\N	PPA	Perry Lefors Field	35.5333329999999989	-100.966669999999993
5390	\N	\N	PPC	Prospect Creek	66.796670000000006	-150.699999999999989
5391	\N	\N	PPE	Puerto Penasco	31.3833330000000004	-113.5
5392	\N	\N	PPF	Tri-City	37.3322220000000016	-95.5086100000000044
5393	\N	\N	PPG	International	-14.3263890000000007	-170.696400000000011
5394	\N	\N	PPH	Peraitepuy	4.58333299999999966	-61.5166660000000007
5395	\N	\N	PPI	Port Pirie	-33.2333339999999993	138
5396	\N	\N	PPJ	Pulau Panjang	-0.633333000000000035	103.299999999999997
5397	\N	\N	PPK	Petropavlovsk	54.7833329999999989	69.1833340000000021
5398	\N	\N	PPL	Phaplu	27.5166660000000007	86.5999999999999943
5399	\N	\N	PPM	Pompano Beach	26.25	-80.1166699999999992
5400	\N	\N	PPN	Machangara	2.45000000000000018	-76.6088900000000024
5401	\N	\N	PPO	Powell Point	24.8999999999999986	-76.3499999999999943
5402	\N	\N	PPP	Whitsunday Coast	-20.4889219999999987	148.551940000000002
5403	\N	\N	PPR	Pasir Pangarayan	0.83333299999999999	100.366669999999999
5404	\N	\N	PPU	Papun	18.0666679999999999	97.4500000000000028
5405	\N	\N	PPV	Port Protection	56.3333319999999986	-133.666670000000011
5406	\N	\N	PPW	Papa Westray	59.3512649999999979	-2.89897399999999994
5407	\N	\N	PPX	Param	-9.9958329999999993	149.59165999999999
5408	\N	\N	PPY	Pouso Alegre	-22.288333999999999	-45.9188880000000026
5409	\N	\N	PPZ	Puerto Paez	6.2261110000000004	-67.4469449999999995
5410	\N	\N	PQC	Duong Dong	10.2237220000000004	103.963239999999999
5411	\N	\N	PQM	Palenque	17.5	-92.0083300000000008
5412	\N	\N	PQS	Pilot Station	61.9347229999999982	-162.89054999999999
5413	\N	\N	PRB	Paso Robles	35.6705550000000002	-120.625829999999993
5414	\N	\N	PRC	Prescott	34.6499999999999986	-112.424164000000005
5415	\N	\N	PRD	Pardoo	-20.1000000000000014	119.116669999999999
5416	\N	\N	PRE	Pore	5.70000000000000018	-71.9833299999999952
5417	\N	\N	PRF	Port Johnson	55.1333300000000008	-132
5418	\N	\N	PRJ	Capri	40.5499999999999972	14.233333
5419	\N	\N	PRK	Prieska	-29.6666680000000014	22.6999999999999993
5420	\N	\N	PRL	Port Oceanic	60.2083319999999986	-147.819439999999986
5421	\N	\N	PRM	Portimao	37.1333300000000008	-8.53333300000000072
5422	\N	\N	PRN	Pristina International	42.5736119999999971	21.0355570000000007
5423	\N	\N	PRO	Perry Municipal	41.8500000000000014	-94.0999999999999943
5424	\N	\N	PRP	Propriano	41.6666680000000014	8.90000000000000036
5425	\N	\N	PRQ	Pres. Roque Saenz Pena	-26.8333319999999986	-60.6666680000000014
5426	\N	\N	PRR	Paruima	5.79999999999999982	-61.0499999999999972
5427	\N	\N	PRS	Parasi	-8.16666700000000034	158
5428	\N	\N	PRT	Coast Guard Heliport	58.3500000000000014	-134.550000000000011
5429	\N	\N	PRU	Prome	18.8249999999999993	95.2686099999999954
5430	\N	\N	PRV	Prerov	49.5902799999999999	17.2083319999999986
5431	\N	\N	PRW	Prentice	45.5499999999999972	-90.2833300000000065
5432	\N	\N	PRX	Cox Field	33.6366650000000007	-95.4502800000000065
5433	\N	\N	PRY	Wonderboom Airport.	-25.6544440000000016	28.2208329999999989
5434	\N	\N	PRZ	Prineville	44.2999999999999972	-120.849999999999994
5435	\N	\N	PSA	Galileo Galilei	43.6987099999999984	10.399915
5436	\N	\N	PSB	Bellefonte	40.8833300000000008	-78.0858300000000014
5437	\N	\N	PSC	Tri-cities	46.2590939999999975	-119.115200000000002
5438	\N	\N	PSD	Port Said	31.2666660000000007	32.2999999999999972
5439	\N	\N	PSF	Pittsfield	42.4266659999999973	-73.2916639999999973
5440	\N	\N	PSH	St Peter	54.5	8.11666699999999963
5441	\N	\N	PSI	Pasni	25.3000000000000007	63.3611099999999965
5442	\N	\N	PSK	New River Valley	37.1372220000000013	-80.6786100000000062
5443	\N	\N	PSL	Perth	56.2333339999999993	-3.56666699999999981
5444	\N	\N	PSM	Pease International	43.179585000000003	-70.8827200000000062
5445	\N	\N	PSN	Palestine Municipalcipal Airport	31.7833329999999989	-95.7166699999999935
5446	\N	\N	PSO	Cano	1.46666699999999994	-77.25
5447	\N	\N	PSQ	SPB	39.8680570000000003	-75.2486099999999993
5448	\N	\N	PSS	Posadas	-27.3838879999999989	-55.9675000000000011
5449	\N	\N	PST	Preston	20.75	-75.6666639999999973
5450	\N	\N	PSU	Putussibau	0.83333299999999999	112.933334000000002
5451	\N	\N	PSV	Papa Stour	60.3166659999999979	-1.69999999999999996
5452	\N	\N	PSW	Passos	-20.7166670000000011	-46.6166699999999992
5453	\N	\N	PSX	Palacios	28.6999999999999993	-96.25
5454	\N	\N	PSY	Port Stanley	-51.7000000000000028	-57.8500000000000014
5455	\N	\N	PSZ	Puerto Suarez	-18.9666670000000011	-57.7999999999999972
5456	\N	\N	PTA	Port Alsworth	60.2000000000000028	-145.333329999999989
5457	\N	\N	PTB	Dinwiddie County Airport	37.2166670000000011	-77.4000000000000057
5458	\N	\N	PTC	Port Alice	55.783610000000003	-133.585000000000008
5459	\N	\N	PTD	Port Alexander	56.25	-134.650000000000006
5460	\N	\N	PTF	Malololailai	-17.7833329999999989	177.21665999999999
5461	\N	\N	PTG	Polokwane	-23.9166680000000014	29.9666670000000011
5462	\N	\N	PTH	Port Heiden	56.9566700000000026	-158.637499999999989
5463	\N	\N	PTI	Port Douglas	-16.48611	145.463879999999989
5464	\N	\N	PTJ	Portland	-38.3841669999999979	141.625
5465	\N	\N	PTK	Pontiac	42.6647219999999976	-83.4113899999999973
5466	\N	\N	PTL	Port Armstrong	56.2972219999999979	-134.662499999999994
5467	\N	\N	PTM	Palmarito	7.56666699999999981	-70.1833340000000021
5468	\N	\N	PTN	Williams Memorial	29.7083319999999986	-91.3375000000000057
5469	\N	\N	PTO	Pato Branco	-26.2166670000000011	-52.6666680000000014
5470	\N	\N	PTP	Le Raizet	16.2674999999999983	-61.5263899999999992
5471	\N	\N	PTQ	Porto de Moz	-1.73888899999999991	-52.2444460000000035
5472	\N	\N	PTR	Pleasant Harbour	57.75	-152.833329999999989
5473	\N	\N	PTS	Atkinson Municipal Airport	37.4466669999999979	-94.7305499999999938
5474	\N	\N	PTT	Pratt	37.7166670000000011	-98.75
5475	\N	\N	PTV	Porterville	36.0666659999999979	-119.016670000000005
5476	\N	\N	PTW	Pottstown/Limerick	40.25	-75.6333300000000008
5477	\N	\N	PTX	Pitalito	1.85000000000000009	-76.0333300000000065
5478	\N	\N	PTZ	Pastaza	-2	-77
5479	\N	\N	PUA	Puas	-2.39999999999999991	150.233339999999998
5480	\N	\N	PUB	Memorial	38.2927779999999984	-104.496110000000002
5481	\N	\N	PUC	Carbon County	39.6097219999999979	-110.752780000000001
5482	\N	\N	PUD	Puerto Deseado	-47.75	-65.9166639999999973
5483	\N	\N	PUE	Puerto Obaldia	8.66694000000000031	-77.4169399999999968
5484	\N	\N	PUH	Pochutla	15.733333	-96.4666699999999935
5485	\N	\N	PUI	Pureni	-5.83333299999999966	142.833329999999989
5486	\N	\N	PUK	Pukarua	-18.296125	-137.017840000000007
5487	\N	\N	PUL	Poulsbo	47.7333339999999993	-122.650000000000006
5488	\N	\N	PUM	Pomala	-4.18333300000000019	121.616669999999999
5489	\N	\N	PUN	Punia	-1.36666700000000008	26.3333319999999986
5490	\N	\N	PUO	Prudhoe Bay	70.2513900000000007	-148.336939999999998
5491	\N	\N	PUP	Po	11.1833329999999993	-1.1666669999999999
5492	\N	\N	PUQ	Pres Ibanez	-53.005355999999999	-70.8430699999999973
5493	\N	\N	PUR	Puerto Rico	-11.1125000000000007	-67.519999999999996
5494	\N	\N	PUT	Puttaprathe	14.1333330000000004	77.7833300000000065
5495	\N	\N	PUU	Puerto Asis	0.533332999999999946	-76.5333300000000065
5496	\N	\N	PUV	Poum	-20.2944430000000011	164.101400000000012
5497	\N	\N	PUW	Pullman-Moscow Regional Airport	46.7447200000000009	-117.105000000000004
5498	\N	\N	PUX	Puerto Varas	-40.3402799999999999	-72.9444400000000002
5499	\N	\N	PUZ	Puerto Cabezas	14.0452779999999997	-83.3836100000000044
5500	\N	\N	PVA	Providencia	13.3499999999999996	-81.3499999999999943
5501	\N	\N	PVC	Provincetown	42.0719449999999995	-70.2216640000000041
5502	\N	\N	PVE	El Porvenir	9	-81
5503	\N	\N	PVF	Placerville	38.7166670000000011	-120.799999999999997
5504	\N	\N	PVH	Governador Jorge Teixeira	-8.71431100000000036	-63.8983080000000001
5505	\N	\N	PVI	Edu Chaves	-23.0666679999999999	-52.4666670000000011
5506	\N	\N	PVO	Reales Tamarindos	-1.03333300000000006	-80.4666699999999935
5507	\N	\N	PVS	Provideniya	64.3833300000000008	-173.243329999999986
5508	\N	\N	PVU	Provo	40.2180559999999971	-111.722219999999993
5509	\N	\N	PVW	Hale County	34.1833340000000021	-101.716669999999993
5510	\N	\N	PVY	Pope Vanoy	59.3166659999999979	-154.916670000000011
5511	\N	\N	PVZ	Casement	41.7166670000000011	-81.25
5512	\N	\N	PWA	Wiley Post	35.4666670000000011	-97.5333300000000065
5513	\N	\N	PWD	Sherwood	48.7833329999999989	-104.566665999999998
5514	\N	\N	PWE	Pevek	69.7833300000000065	170.599999999999994
5515	\N	\N	PWI	Beles	11.3333329999999997	36.4166680000000014
5516	\N	\N	PWK	Pal-Waukee	42.1141659999999973	-87.9016649999999942
5517	\N	\N	PWL	Purwokerto	-7.46666700000000017	109.150000000000006
5518	\N	\N	PWN	Pitts Town	22.8333319999999986	-74.3499999999999943
5519	\N	\N	PWO	Pweto	-8.46666699999999928	28.8999999999999986
5520	\N	\N	PWR	Port Walter	56.3833300000000008	-134.650000000000006
5521	\N	\N	PWT	Bremerton	47.4849999999999994	-122.763335999999995
5522	\N	\N	PXL	Polacca	35.7999999999999972	-110.333336000000003
5523	\N	\N	PXO	Porto Santo	33.0700229999999991	-16.3450150000000001
5524	\N	\N	PXR	Surin	14.8666669999999996	103.5
5525	\N	\N	PXS	Puerto De Santa Maria	36.6000000000000014	-6.21666700000000017
5526	\N	\N	PYA	Puerto Boyaca	5.96666700000000017	-74.5999999999999943
5527	\N	\N	PYB	Jeypore	18.8333319999999986	82.6333300000000008
5528	\N	\N	PYC	Playon Chico	9.57444399999999973	-79.605834999999999
5529	\N	\N	PYE	Penrhyn Island	-9.01666699999999999	-158.03334000000001
5530	\N	\N	PYJ	Polyarnyj	66.4166639999999973	112.049999999999997
5531	\N	\N	PYL	Perry SPB	35.0333329999999989	-92.8166659999999979
5532	\N	\N	PYM	Plymouth	41.9666670000000011	-70.6833340000000021
5533	\N	\N	PYN	Payan	1.81666700000000003	-78.1333300000000008
5534	\N	\N	PYO	Putumayo	0.0833330000000000043	-75.9000000000000057
5535	\N	\N	PYR	Andravida	37.6833340000000021	21.4666670000000011
5536	\N	\N	PYV	Yaviza	8.16666700000000034	-77.8333360000000027
5537	\N	\N	PYX	Pattaya	12.9499999999999993	100.883330000000001
5538	\N	\N	PZA	Casanare	5.87777800000000017	-71.8850000000000051
5539	\N	\N	PZE	Penzance	50.1119419999999991	-5.51611100000000043
5540	\N	\N	PZI	Pan Zhi Hua Bao An Ying	26.5387340000000016	101.793859999999995
5541	\N	\N	PZK	Puka Puka Island	-10.8833330000000004	-165.816669999999988
5542	\N	\N	PZL	Zulu Inyala	-27.8666669999999996	32.2999999999999972
5543	\N	\N	PZY	Piestany	48.6333300000000008	17.8333319999999986
5544	\N	\N	QAW	Ft Mcclellan Bus Station	33.659825699999999	-85.8316317999999967
5545	\N	\N	QBC	Bella Coola	52.3333319999999986	-126.666663999999997
5546	\N	\N	QBF	Vail Bus Station	39.6402637999999996	-106.374195499999999
5547	\N	\N	QDU	Station	51.2249429000000021	6.77565240000000024
5548	\N	\N	QFK	Harbour	62.0499999999999972	5.36666699999999963
5549	\N	\N	QFQ	Harbour	61.9500000000000028	5.09999999999999964
5550	\N	\N	QGQ	Heliport	67.9405600000000049	-53.6227799999999988
5551	\N	\N	QGV	Neu Isenburg	50.0499999999999972	8.6833329999999993
5552	\N	\N	QJI	Heliport	68.8333360000000027	-52
5553	\N	\N	QKL	Koeln Hauptbahnhof	50.8999999999999986	7.18299999999999983
5554	\N	\N	QMV	Montvale	41.0333329999999989	-74.0166700000000048
5555	\N	\N	QNY	Marine Air Terminal	40.75	-74
5556	\N	\N	QPG	Paya Lebar	1.35000000000000009	103.900000000000006
5557	\N	\N	QQW	London-Waterloo	51.509999999999998	0.0599999999999999978
5558	\N	\N	QRA	Rand/Germiston	-26.1402779999999986	28.2427789999999987
5559	\N	\N	QRW	Warri	5.59448699999999999	5.81928200000000029
5560	\N	\N	QSG	Sonderborg	54.9138110000000026	9.79217799999999983
5561	\N	\N	QUB	Ubari	26.6000000000000014	12.766667
5562	\N	\N	QUP	Heliport	70.0499999999999972	-52
5563	\N	\N	QWF	Fort Collins Bus Servi	40.5852602000000005	-105.084423000000001
5564	\N	\N	QWG	Wilgrove Air Park	35.2166670000000011	-80.8499999999999943
5565	\N	\N	QYW	Vieux Port	43.5388900000000021	7.04444400000000037
5566	\N	\N	QZD	Szeged	46.2537002999999984	20.1460289999999986
5567	\N	\N	RAA	Rakanda	-4.5	152.166670000000011
5568	\N	\N	RAC	John H. Batten Field	42.6833340000000021	-87.8499999999999943
5569	\N	\N	RAG	Raglan	-37.8333319999999986	174.866669999999999
5570	\N	\N	RAI	Francisco Mendes	14.9453209999999999	-23.4865670000000009
5571	\N	\N	RAK	Menara	31.6018749999999997	-8.02690199999999976
5572	\N	\N	RAL	Riverside Municipalcipal	33.951667999999998	-117.442220000000006
5573	\N	\N	RAM	Ramingining	-12	134.816669999999988
5574	\N	\N	RAN	La Spreta	44.3666699999999992	12.2233330000000002
5575	\N	\N	RAO	Leite Lopes	-21.1358339999999991	-47.773335000000003
5576	\N	\N	RAQ	Sugimanuru	-4.91666700000000034	122.583336000000003
5577	\N	\N	RAR	Rarotonga	-21.1999199999999988	-159.798519999999996
5578	\N	\N	RAS	Rasht	37.3218150000000009	49.6195870000000028
5579	\N	\N	RAT	Raduzhnyi	62.5	77
5580	\N	\N	RAV	Cravo Norte	6.31666699999999981	-70.1833340000000021
5581	\N	\N	RAW	Arawa	-6.25	155.583329999999989
5582	\N	\N	RAX	Oram	-9.67222199999999965	148.03334000000001
5583	\N	\N	RAZ	Rawala Kot	33.8416670000000011	73.8333360000000027
5584	\N	\N	RBB	Borba	-4.40000000000000036	-59.5833319999999986
5585	\N	\N	RBC	Robinvale	-34.6666680000000014	142.75
5586	\N	\N	RBD	Redbird	32.6808320000000023	-96.8683300000000003
5587	\N	\N	RBE	Ratanakiri	13.6666670000000003	106.983329999999995
5588	\N	\N	RBF	Big Bear City Airport	34.2666660000000007	-116.849999999999994
5589	\N	\N	RBG	Roseburg Municipal Airport	43.2388880000000029	-123.359719999999996
5590	\N	\N	RBH	Brooks Lodge	58.5499999999999972	-155.800000000000011
5591	\N	\N	RBI	Rabi	15	-179
5592	\N	\N	RBJ	Rebun	45.3833300000000008	141.03334000000001
5593	\N	\N	RBK	French Valley	33.5666659999999979	-117.116669999999999
5594	\N	\N	RBL	Red Bluff Fss	40.1565549999999973	-122.272919999999999
5595	\N	\N	RBM	Wallmuhle	48.9019430000000028	12.5197219999999998
5596	\N	\N	RBN	Fort Jefferson	24.6166669999999996	-82.8666699999999992
5597	\N	\N	RBO	Robore	-18.3444439999999993	-59.7552799999999991
5598	\N	\N	RBP	Rabaraba	-9.99861100000000036	149.833329999999989
5599	\N	\N	RBQ	Rurrenabaque	-14.4499999999999993	-67.5499999999999972
5600	\N	\N	RBR	Pres. Medici	-9.96666699999999928	-67.7999999999999972
5601	\N	\N	RBS	Orbost	-37.7000000000000028	148.5
5602	\N	\N	RBT	Marsabit	2.3333330000000001	37.9833339999999993
5603	\N	\N	RBU	Roebourne	-20.8000000000000007	117.166663999999997
5604	\N	\N	RBW	Lowcountry Regional	32.8999999999999986	-80.6666639999999973
5605	\N	\N	RBY	Ruby	64.730000000000004	-155.460829999999987
5606	\N	\N	RCA	Ellsworth AFB	44.0833319999999986	-103.233329999999995
5607	\N	\N	RCE	Roche Harbor	48.5833319999999986	-123.166663999999997
5608	\N	\N	RCK	Coffield	30.6499999999999986	-97
5609	\N	\N	RCL	Redcliffe	-27.2070350000000012	153.073329999999999
5610	\N	\N	RCM	Richmond	-20.7038900000000012	143.116669999999999
5611	\N	\N	RCN	American River	-35.8333319999999986	138
5612	\N	\N	RCO	Saint Agnant	45.8905559999999966	-0.980555999999999983
5613	\N	\N	RCP	Cinder River	57.0830569999999966	-157.805560000000014
5614	\N	\N	RCQ	Reconquista	-29.1833320000000001	-59.7000000000000028
5615	\N	\N	RCR	Fulton County	41.0666659999999979	-86.2166699999999935
5616	\N	\N	RCS	Rochester	51.3500000000000014	0.5
5617	\N	\N	RCT	Miller Field	43.8833300000000008	-85.5166700000000048
5618	\N	\N	RCU	Rio Cuarto	-33.1655579999999972	-64.331665000000001
5619	\N	\N	RDA	Rockhampton Downs	-18.9499999999999993	135.166670000000011
5620	\N	\N	RDB	Red Dog	67.75	-163.666670000000011
5621	\N	\N	RDC	Redencao	-8.03027799999999914	-49.9799999999999969
5622	\N	\N	RDE	Merdey	-1.5833330000000001	133.333329999999989
5623	\N	\N	RDG	Municipalcipal/Spaatz Field	40.3786130000000014	-75.9638900000000064
5624	\N	\N	RDM	Roberts Field	44.2542720000000003	-121.162895000000006
5625	\N	\N	RDN	LTS Pulau Redang	5.76527800000000035	103.00694
5626	\N	\N	RDR	Grand Forks AFB	46.8333319999999986	-96.75
5627	\N	\N	RDS	Rincon de los Sauces	-37.3833300000000008	-68.9000000000000057
5628	\N	\N	RDT	Richard Toll	16.4372219999999984	-15.6572220000000009
5629	\N	\N	REA	Reao	-18.5	-136.400000000000006
5630	\N	\N	REB	Rechlin	53.3500000000000014	12.7166669999999993
5631	\N	\N	RED	Mifflin County	40.6833340000000021	-77.6166699999999992
5632	\N	\N	REE	Reese AFB	33.5833319999999986	-101.849999999999994
5633	\N	\N	REG	Tito Menniti	38.0752799999999993	15.6508330000000004
5634	\N	\N	REH	Rehoboth Beach	38.7000000000000028	-75.0999999999999943
5635	\N	\N	REI	Regina	4.31666699999999981	-52.1333300000000008
5636	\N	\N	REL	Almirante Zar	-43.2333339999999993	-65.3233299999999986
5637	\N	\N	REN	Orenburg	51.7910499999999985	55.4566999999999979
5638	\N	\N	REO	Rome State	42.8333319999999986	-117.616669999999999
5639	\N	\N	REP	Siem Reap	13.408436	103.815926000000005
5640	\N	\N	RER	Base Aerea Del Sur	14.5202779999999994	-91.6969449999999995
5641	\N	\N	REW	Rewa	24.5333329999999989	81.2999999999999972
5642	\N	\N	REX	Gen Lucio Blanco	26.0124999999999993	-98.230000000000004
5643	\N	\N	REY	Reyes	-14.3166670000000007	-67.2666700000000048
5644	\N	\N	REZ	Resende	-22.4780559999999987	-44.481110000000001
5645	\N	\N	RFA	Rafai	4.98333300000000001	23.9666670000000011
5646	\N	\N	RFG	Rooke Field	28.3333319999999986	-97.3499999999999943
5647	\N	\N	RFK	Rollang Field	32.9666670000000011	-90.8166659999999979
5648	\N	\N	RFN	Raufarhofn	66.4166639999999973	-15.016667
5649	\N	\N	RFR	Rio Frio	10.3333329999999997	-83.8833300000000008
5650	\N	\N	RFS	Rosita	13.8833330000000004	-84.4000000000000057
5651	\N	\N	RGA	Rio Grande	-53.7791670000000011	-67.75
5652	\N	\N	RGE	Porgera	-5.41666700000000034	143.150000000000006
5653	\N	\N	RGH	Balurghat	25.25	88.7333299999999952
5654	\N	\N	RGI	Rangiroa	-14.956334	-147.659150000000011
5655	\N	\N	RGL	Internacional	-51.6166699999999992	-69.2833300000000065
5656	\N	\N	RGN	Mingaladon	16.900068000000001	96.1341550000000069
5657	\N	\N	RGR	Ranger Municipalcipal	32.4666670000000011	-98.6833340000000021
5658	\N	\N	RGT	Japura	-0.400000000000000022	102.549999999999997
5659	\N	\N	RHA	Reykholar	65.1666639999999973	-21.4166680000000014
5660	\N	\N	RHD	Rio Hondo	-27.5333329999999989	-64.9500000000000028
5661	\N	\N	RHE	Reims	49.3108330000000024	4.05055600000000027
5662	\N	\N	RHG	Ruhengeri	-1.5	29.6000000000000014
5663	\N	\N	RHI	Oneida County	45.625706000000001	-89.462530000000001
5664	\N	\N	RHL	Roy Hill	-22.75	120
5665	\N	\N	RHN	Rosh Pina	-27.9666670000000011	16.6999999999999993
5666	\N	\N	RHO	Diagoras	36.4018670000000029	28.0906769999999995
5667	\N	\N	RHP	Ramechhap	27.3333319999999986	86.0833360000000027
5668	\N	\N	RHV	Reid-Hillview	37.3333319999999986	-121.883330000000001
5669	\N	\N	RIA	Base Aerea De Santa Maria	-29.7105560000000004	-53.6875
5670	\N	\N	RIB	Gen Buech	-11.0069440000000007	-66.0930560000000042
5671	\N	\N	RIC	Richmond International Airport	37.5061099999999996	-77.3225000000000051
5672	\N	\N	RID	Richmond Municipalcipal Airport	39.8333319999999986	-84.9000000000000057
5673	\N	\N	RIE	Rice Lake	45.4786100000000033	-91.7236099999999936
5674	\N	\N	RIF	Reynolds	38.741109999999999	-112.094443999999996
5675	\N	\N	RIG	Rio Grande	-32.0833319999999986	-52.1666680000000014
5676	\N	\N	RIJ	Rioja	-6.04999999999999982	-77.1500000000000057
5677	\N	\N	RIK	Carrillo	9.86666699999999963	-85.4833299999999952
5678	\N	\N	RIL	Garfield County	39.5333329999999989	-107.783330000000007
5679	\N	\N	RIM	Rodriguez De Mendoza	-6	-78
5680	\N	\N	RIN	Ringi Cove	-8.19999999999999929	157.03334000000001
5681	\N	\N	RIR	Riverside Fla-Bob	33.9833339999999993	-117.366669999999999
5682	\N	\N	RIT	Rio Tigre	7.83333299999999966	-80.7999999999999972
5683	\N	\N	RIV	March ARB	33.9833339999999993	-117.366669999999999
5684	\N	\N	RIW	Riverton Regional	43.0644449999999992	-108.456950000000006
5685	\N	\N	RIX	Riga International	56.9220800000000011	23.979807000000001
5686	\N	\N	RIY	Riyan Mukalla	14.6669990000000006	49.3736839999999972
5687	\N	\N	RIZ	Rio Alzucar	8.25	-80.8333360000000027
5688	\N	\N	RJB	Rajbiraj	26.4833339999999993	86.8333360000000027
5689	\N	\N	RJI	Rajouri	33.3686099999999968	74.3024999999999949
5690	\N	\N	RJK	Rijeka	45.2158299999999969	14.5683330000000009
5691	\N	\N	RJN	Rafsanjan	30.2969439999999999	56.0566669999999974
5692	\N	\N	RKC	Yreka	41.7333339999999993	-122.633330000000001
5693	\N	\N	RKE	Roskilde Airport	55.5833319999999986	12.1333330000000004
5694	\N	\N	RKH	Rock Hill	34.9166680000000014	-81.0166700000000048
5695	\N	\N	RKI	Rokot	-0.949999999999999956	100.75
5696	\N	\N	RKO	Sipora	-2.0833330000000001	116
5697	\N	\N	RKP	Aransas County	28.0333329999999989	-97.0499999999999972
5698	\N	\N	RKR	Robert S Kerr	35.0499999999999972	-94.6166699999999992
5699	\N	\N	RKU	Kairuku	-8.8166670000000007	146.516660000000002
5700	\N	\N	RKV	Reykjavik Domestic	64.1310600000000051	-21.9324760000000012
5701	\N	\N	RKW	Rockwood Municipal Airport	35.8666699999999992	-84.6833340000000021
5702	\N	\N	RKY	Rokeby	-13.1666670000000003	143.433330000000012
5703	\N	\N	RLA	National	38.1277770000000018	-91.7780499999999932
5704	\N	\N	RLD	Richland	46.3083340000000021	-119.30556
5705	\N	\N	RLG	Laage	53.9200000000000017	12.266667
5706	\N	\N	RLI	Reilly AHP	33.6666680000000014	-85.8499999999999943
5707	\N	\N	RLO	Valle Del Conlara	-32.3844449999999995	-65.5524999999999949
5708	\N	\N	RLP	Rosella Plains	-18	145
5709	\N	\N	RLT	Arlit	18.7833329999999989	7.36666699999999963
5710	\N	\N	RLU	Bornite Upper	67.75	-156
5711	\N	\N	RMB	Buraimi	24.25	55.7833329999999989
5712	\N	\N	RMD	Ramagundam	18.7666660000000007	79.4000000000000057
5713	\N	\N	RME	Griffiss AFB	43.2166670000000011	-75.4500000000000028
5714	\N	\N	RMF	Marsa Alam International	25.5557860000000012	34.5927769999999981
5715	\N	\N	RMG	Richard B Russell	34.3513900000000021	-85.1586099999999959
5716	\N	\N	RMI	Miramare	44.0229530000000011	12.6195939999999993
5717	\N	\N	RMK	Renmark	-34.2000000000000028	140.683330000000012
5718	\N	\N	RMN	Rumginae	-6.16666700000000034	141.166670000000011
5719	\N	\N	RMP	Rampart	65.5083300000000008	-150.140269999999987
5720	\N	\N	RMQ	Chingchuankang	24.249293999999999	120.601309999999998
5721	\N	\N	RMS	Ramstein	49.4500000000000028	7.54999999999999982
5722	\N	\N	RNA	Ulawa Airport	-9.86444400000000066	161.983059999999995
5723	\N	\N	RNB	Kallinge	56.2583300000000008	15.2611109999999996
5724	\N	\N	RNC	Warren County	35.8370820000000023	-85.9381599999999963
5725	\N	\N	RND	Randolph AFB	29.4166680000000014	-98.5
5726	\N	\N	RNE	Renaison	46.0533330000000021	4.00083300000000008
5727	\N	\N	RNG	Rangely	40.0947230000000019	-108.760559999999998
5728	\N	\N	RNH	New Richmond Municipal Airport	45.1333300000000008	-92.5499999999999972
5729	\N	\N	RNI	Corn Island	12.1500000000000004	-83.0666659999999979
5730	\N	\N	RNJ	Yoronjima	27.0333329999999989	128.433330000000012
5731	\N	\N	RNO	Reno-Tahoe International	39.505783000000001	-119.775695999999996
5732	\N	\N	RNP	Rongelap Island	11.1500000000000004	166.883330000000001
5733	\N	\N	RNR	Robinson River	-10.1333330000000004	147.75
5734	\N	\N	RNT	Renton	47.5	-122.216669999999993
5735	\N	\N	RNU	Ranau	5.95000000000000018	116.666663999999997
5736	\N	\N	RNZ	Rensselaer	40.9500000000000028	-87.1500000000000057
5737	\N	\N	ROA	Roanoke Regional Airport	37.3205099999999987	-79.9703800000000058
5738	\N	\N	ROB	Roberts International	6.23972200000000043	-10.3588889999999996
5739	\N	\N	ROD	Robertson	-33.8166659999999979	19.8999999999999986
5740	\N	\N	ROG	Rogers	36.3722229999999982	-94.106669999999994
5741	\N	\N	ROH	Robinhood	-18.25	144
5742	\N	\N	ROI	Roi Et Airport	16.115278	103.776949999999999
5743	\N	\N	ROK	Rockhampton	-23.377993	150.478409999999997
5744	\N	\N	ROL	Roosevelt	40.2999999999999972	-109.983329999999995
5745	\N	\N	RON	Rondon	6.29999999999999982	-71.0833360000000027
5746	\N	\N	ROO	Rondonopolis	-16.4333320000000001	-54.7166670000000011
5747	\N	\N	ROP	Rota	14.1715680000000006	145.244079999999997
5748	\N	\N	ROS	Fisherton	-32.9333340000000021	-60.7833329999999989
5749	\N	\N	ROT	Rotorua	-38.1098199999999991	176.317460000000011
5750	\N	\N	ROU	Rousse	43.6833340000000021	26.0500000000000007
5751	\N	\N	ROV	Rostov	47.25	39.75
5752	\N	\N	ROW	Industrial	33.2997200000000007	-104.530000000000001
5753	\N	\N	ROX	Roseau Municipal Airport	48.8500000000000014	-95.7666700000000048
5754	\N	\N	ROY	Rio Mayo	-45.6666680000000014	-70.25
5755	\N	\N	RPA	Rolpa	26.9833339999999993	87.3333360000000027
5756	\N	\N	RPB	Roper Bar	-14.733333	134.733339999999998
5757	\N	\N	RPM	Ngukurr	-14.9333329999999993	134
5758	\N	\N	RPN	Rosh Pina	32.9816670000000016	35.5711099999999973
5759	\N	\N	RPR	Raipur	21.1845600000000012	81.7397500000000008
5760	\N	\N	RPV	Roper Valley	-14.9666669999999993	134.03334000000001
5761	\N	\N	RPX	Roundup	46.4333340000000021	-108.533330000000007
5762	\N	\N	RRA	Ronda	36.75	-5.16666700000000034
5763	\N	\N	RRE	Marree	-29.6499999999999986	138.066669999999988
5764	\N	\N	RRI	Barora	-7.5	158.266660000000002
5765	\N	\N	RRK	Rourkela	22.2566659999999992	84.8147199999999941
5766	\N	\N	RRL	Merrill Municipal Airport	45.1833340000000021	-89.6833340000000021
5767	\N	\N	RRM	Marromeu	-18.3333319999999986	35.9333340000000021
5768	\N	\N	RRN	Serra Norte	-11	-59
5769	\N	\N	RRO	Sorrento	40.6166699999999992	14.3666669999999996
5770	\N	\N	RRT	Warroad	48.8999999999999986	-95.2999999999999972
5771	\N	\N	RRV	Robinson River	-16.75	136.96665999999999
5772	\N	\N	RSA	Santa Rosa	-36.5666659999999979	-64.2666700000000048
5773	\N	\N	RSB	Roseberth	-25.8333319999999986	139.633330000000001
5774	\N	\N	RSD	S Eleuthera	24.8916660000000007	-76.1780550000000005
5775	\N	\N	RSE	Rose Bay	-33.7999999999999972	151.21665999999999
5776	\N	\N	RSG	Serra Pelada	-5.95000000000000018	-49.6499999999999986
5777	\N	\N	RSI	Rio Sidra	8.96666699999999928	-80.3333360000000027
5778	\N	\N	RSJ	Rosario SPB	48.6333300000000008	-122.849999999999994
5779	\N	\N	RSK	Ransiki	-1.5	134.183330000000012
5780	\N	\N	RSL	Russell	38.8833300000000008	-98.8499999999999943
5781	\N	\N	RSN	Ruston	32.5166660000000007	-92.6333300000000008
5782	\N	\N	RSP	Raspberry Strait	58.1666680000000014	-154.833329999999989
5783	\N	\N	RSS	Roseires	11.7833330000000007	34.3999999999999986
5784	\N	\N	RST	International	43.9107929999999982	-92.4897699999999929
5785	\N	\N	RSX	Rouses Point	44.9847219999999979	-73.3522200000000026
5786	\N	\N	RTA	Rotuma Island	-12.4824999999999999	177.071100000000001
5787	\N	\N	RTC	Ratnagiri	17	73.3166659999999979
5788	\N	\N	RTD	Rotunda	26.8666669999999996	-82.2666700000000048
5789	\N	\N	RTE	Marguerite Bay	55.7000000000000028	-131.633330000000001
5790	\N	\N	RTI	Roti	-10.8833330000000004	122.966669999999993
5791	\N	\N	RTL	Spirit Lake	47.9500000000000028	-116.866669999999999
5792	\N	\N	RTM	Rotterdam Zestienhoven	51.9489480000000015	4.43360600000000016
5793	\N	\N	RTN	Crews Field	36.7413900000000027	-104.501114000000001
5794	\N	\N	RTP	Rutland Plains	-15.5999999999999996	141.833329999999989
5795	\N	\N	RTS	Rottnest Island	-32.0069429999999997	115.536670000000001
5796	\N	\N	RTY	Merty	-28.25	139
5797	\N	\N	RUF	Yuruf	-3.63333299999999992	140.933330000000012
5798	\N	\N	RUG	Rugao	32.3883319999999983	120.555274999999995
5799	\N	\N	RUH	King Khaled International	24.9592899999999993	46.7028770000000009
5800	\N	\N	RUI	Ruidoso Sierra Blanca Regional Airport	33.360832000000002	-105.662499999999994
5801	\N	\N	RUK	Rukumkot	28.625	82.4666699999999935
5802	\N	\N	RUM	Rumjatar	27.3166679999999999	86.5333300000000065
5803	\N	\N	RUP	Rupsi	26.1499999999999986	89.9166639999999973
5804	\N	\N	RUT	Rutland	43.5294460000000001	-72.9483299999999986
5805	\N	\N	RUU	Ruti	-5.18333300000000019	144.150000000000006
5806	\N	\N	RUV	Rubelsanto	15.8333329999999997	-90.3333360000000027
5807	\N	\N	RUY	Copan	15	-88
5808	\N	\N	RVA	Farafangana	-22.8019449999999999	47.8194429999999997
5809	\N	\N	RVC	Rivercess	5.46666700000000017	-9.58333299999999966
5810	\N	\N	RVD	Rio Verde	-17.7166670000000011	-50.9333340000000021
5811	\N	\N	RVE	Los Colonizadores	6.91666700000000034	-71.9000000000000057
5812	\N	\N	RVK	Ryumsjoen	64.8833300000000008	11.233333
5813	\N	\N	RVN	Rovaniemi	66.5590440000000001	25.8296090000000014
5814	\N	\N	RVO	Reivilo	-27.6000000000000014	24.1333330000000004
5815	\N	\N	RVR	Green River	38.9666670000000011	-110.25
5816	\N	\N	RVS	R.Lloyd Jones	36.1499999999999986	-95.9666699999999935
5817	\N	\N	RVT	Ravensthorpe	-33.7855569999999972	120.201385000000002
5818	\N	\N	RVY	Rivera	-30.9708329999999989	-55.4791680000000014
5819	\N	\N	RWB	Rowan Bay	56.75	-134.133330000000001
5820	\N	\N	RWF	Redwood Falls Municipal	44.5	-95.0999999999999943
5821	\N	\N	RWI	Rocky Mount-wilson	35.8544430000000034	-77.8905599999999936
5822	\N	\N	RWL	Rawlins	41.8044429999999991	-107.201385000000002
5823	\N	\N	RWN	Rovno	50.6000000000000014	26.1499999999999986
5824	\N	\N	RWS	Sumare	-22.8005560000000003	-47.1922229999999985
5825	\N	\N	RXA	Raudha	15.4333329999999993	44.2166670000000011
5826	\N	\N	RYB	Rybinsk	58.1333300000000008	38.8666699999999992
5827	\N	\N	RYG	Moss Airport	59.3790300000000002	10.8001609999999992
5828	\N	\N	RYN	Medis	45.6166699999999992	-1.01666699999999999
5829	\N	\N	RYO	Rio Turbio	-51.5833319999999986	-72.2166699999999935
5830	\N	\N	RZA	Santa Cruz	-50	-68.5333300000000065
5831	\N	\N	RZH	Quartz Hill	34.6666680000000014	-118
5832	\N	\N	RZN	Ryazan	54.6333300000000008	39.5833319999999986
5833	\N	\N	RZP	CLR Airport	10.7624999999999993	119.50667
5834	\N	\N	RZR	Ramsar	36.9046250000000029	50.6824399999999997
5835	\N	\N	RZS	Sawan	26.9666670000000011	68.8666699999999992
5836	\N	\N	RZZ	Halifax County	36.4666670000000011	-77.6666639999999973
5837	\N	\N	SAA	Shively Field	41.4450000000000003	-106.810000000000002
5838	\N	\N	SAC	Executive	38.0499999999999972	-121.933334000000002
5839	\N	\N	SAD	Safford	32.8333319999999986	-109.716669999999993
5840	\N	\N	SAE	Sangir	-8.36666699999999963	118.333336000000003
5841	\N	\N	SAF	Santa Fe	35.6174999999999997	-106.088329999999999
5842	\N	\N	SAG	Sagwon	69.3666699999999992	-148.699999999999989
5843	\N	\N	SAK	Saudarkrokur	65.75	-19.6499999999999986
5844	\N	\N	SAM	Salamo	-9.65000000000000036	150.808330000000012
5845	\N	\N	SAN	San Diego International Airport	32.7319370000000021	-117.197310000000002
5846	\N	\N	SAQ	San Andros	25.0500000000000007	-78.0499999999999972
5847	\N	\N	SAR	Sparta Community	38.1333300000000008	-89.7000000000000028
5848	\N	\N	SAS	Salton City	33.3166659999999979	-115.983329999999995
5849	\N	\N	SAU	Sawu	-10.483333	121.900000000000006
5850	\N	\N	SAY	Siena	43.25	11.25
5851	\N	\N	SAZ	Sasstown	4.66666700000000034	-8.4333329999999993
5852	\N	\N	SBB	Santa Barbara Ba	7.78333299999999983	-71.1666639999999973
5853	\N	\N	SBC	Selbang	-5.31666699999999981	141.75
5854	\N	\N	SBD	Norton AFB	34.1166699999999992	-117.233329999999995
5855	\N	\N	SBE	Suabi	-6.09999999999999964	142.28334000000001
5856	\N	\N	SBF	Sardeh Band	33.6166699999999992	68.5333300000000065
5857	\N	\N	SBG	Maimun Saleh	5.54999999999999982	95.3333360000000027
5858	\N	\N	SBI	Sambailo	12.483333	-13.3000000000000007
5859	\N	\N	SBJ	Sao Mateus	-18.5833319999999986	-39.7333339999999993
5860	\N	\N	SBK	Saint Brieuc-Armor	48.5130580000000009	-2.80888900000000019
5861	\N	\N	SBL	Yacuma	-13.7166669999999993	-65.4500000000000028
5862	\N	\N	SBM	Memorial	43.7716670000000008	-87.8522200000000026
5863	\N	\N	SBO	Salina	39.0291670000000011	-111.837500000000006
5864	\N	\N	SBQ	Sibi	29.5500000000000007	67.8833300000000008
5865	\N	\N	SBR	Saibai Island	-9.38333300000000037	142.633330000000001
5866	\N	\N	SBS	Steamboat Springs	40.5166660000000007	-106.862499999999997
5867	\N	\N	SBT	Tri-City	34.1000000000000014	-117.283330000000007
5868	\N	\N	SBU	Springbok	-29.6886100000000006	17.9394440000000017
5869	\N	\N	SBV	Sabah	-5.33333299999999966	155.016660000000002
5870	\N	\N	SBW	Sibu	2.25499699999999992	111.98657
5871	\N	\N	SBX	Shelby	48.5	-111.849999999999994
5872	\N	\N	SBZ	Sibiu	45.7897570000000016	24.0935290000000002
5873	\N	\N	SCA	Santa Catalina	10.5999999999999996	-75.2833300000000065
5874	\N	\N	SCB	State	41.6499999999999986	-96.6666639999999973
5875	\N	\N	SCD	Sulaco	14.9161110000000008	-87.2666700000000048
5876	\N	\N	SCF	Scottsdale Municipalcipal	33.6166699999999992	-111.916663999999997
5877	\N	\N	SCG	Spring Creek	-38.0166660000000007	142.416670000000011
5878	\N	\N	SCH	Schenectady County	42.8500000000000014	-73.9333340000000021
5879	\N	\N	SCJ	Smith Cove	55.4166680000000014	-132.333329999999989
5880	\N	\N	SCK	Stockton Metropolitan Airport	37.894444	-121.239170000000001
5881	\N	\N	SCN	Ensheim	49.220089999999999	7.11270500000000006
5882	\N	\N	SCO	Shevchenko	43.8666699999999992	51.1000000000000014
5883	\N	\N	SCP	St Crepin	45.4166680000000014	0.616666999999999965
5884	\N	\N	SCR	Scranton Municipal	41.4166680000000014	-75.6666639999999973
5885	\N	\N	SCT	Socotra	12.6275460000000006	53.9092449999999985
5886	\N	\N	SCU	Antonio Maceo	19.9691679999999998	-75.8358300000000014
5887	\N	\N	SCV	Salcea	47.6894449999999992	26.3561119999999995
5888	\N	\N	SCW	Syktyvkar	61.6666680000000014	50.7666660000000007
5889	\N	\N	SCX	Salina Cruz	16.1666680000000014	-95.2000000000000028
5890	\N	\N	SCZ	Santa Cruz Island	-11.6166669999999996	166.849999999999994
5891	\N	\N	SDB	Langebaanweg	-33.0666659999999979	18
5892	\N	\N	SDC	Sandcreek	3.3333330000000001	-58.1666680000000014
5893	\N	\N	SDD	Lubango	-14.9244439999999994	13.5766670000000005
5894	\N	\N	SDE	Santiago Del Estero	-27.7652779999999986	-64.3222200000000015
5895	\N	\N	SDH	Santa Rosa Copan	14.7772220000000001	-88.7763900000000064
5896	\N	\N	SDI	Saidor	-5.54999999999999982	146.5
5897	\N	\N	SDK	Sandakan	5.89687699999999992	118.061840000000004
5898	\N	\N	SDL	Sundsvall/harnosand	62.5216500000000011	17.4381470000000007
5899	\N	\N	SDM	Brown Field Municipalcipal	32.5722239999999985	-116.980000000000004
5900	\N	\N	SDO	Ryotsu Sado Island	38.1333300000000008	138.416670000000011
5901	\N	\N	SDP	Sand Point Municipal	55.3166659999999979	-160.513890000000004
5902	\N	\N	SDR	Santander	43.4230840000000029	-3.8244530000000001
5903	\N	\N	SDS	Sado Shima	38	138.416670000000011
5904	\N	\N	SDT	Saidu Sharif	34.75	72.3499999999999943
5905	\N	\N	SDV	Sde Dov	32.104885000000003	34.7878570000000025
5906	\N	\N	SDX	Sedona	34.8666699999999992	-111.766670000000005
5907	\N	\N	SEE	Gillespie Field	32.8261099999999999	-116.972219999999993
5908	\N	\N	SEF	Sebring Regional Airport	27.5	-81.4166639999999973
5909	\N	\N	SEG	Penn Valley	40.8500000000000014	-76.8499999999999943
5910	\N	\N	SEH	Senggeh	-3.43333300000000019	140.816669999999988
5911	\N	\N	SEI	Senhor Do Bonfim	-10.4499999999999993	-40.1833340000000021
5912	\N	\N	SEM	Craig AFB	32.2261120000000005	-87.0872200000000021
5913	\N	\N	SEO	Seguela	7.96666700000000017	-6.66666700000000034
5914	\N	\N	SEP	Clark Field	32.2166670000000011	-98.2000000000000028
5915	\N	\N	SEQ	Sungai Pakning	-0.800000000000000044	114.066665999999998
5916	\N	\N	SER	Freeman Municipalcipal	38.9666670000000011	-85.8833300000000008
5917	\N	\N	SES	Selfield	32.7261120000000005	-87.0872200000000021
5918	\N	\N	SET	San Esteban	15.3166670000000007	-85.8666699999999992
5919	\N	\N	SEU	Seronera	-2.38333299999999992	34.8166659999999979
5920	\N	\N	SEV	Severodoneck	48.8999999999999986	38.5499999999999972
5921	\N	\N	SEW	Siwa	29.1833320000000001	25.5166660000000007
5922	\N	\N	SEY	Selibaby	15.1822219999999994	-12.2061109999999999
5923	\N	\N	SFC	St Francois	16.25	-61.2833329999999989
5924	\N	\N	SFD	Las Flecheras	7.88527799999999957	-67.4391600000000011
5925	\N	\N	SFE	San Fernando	16.6000000000000014	120.299999999999997
5926	\N	\N	SFF	Felts Field	47.6666680000000014	-117.400000000000006
5927	\N	\N	SFG	Esperance	18.1005549999999999	-63.0488900000000001
5928	\N	\N	SFH	San Felipe	31	-114.866669999999999
5929	\N	\N	SFJ	Kangerlussuaq	67.0122199999999992	-50.7197230000000019
5930	\N	\N	SFK	Soure	-0.699999999999999956	-48.5222199999999972
5931	\N	\N	SFL	Sao Filipe	14.9000000000000004	-24.5166660000000007
5932	\N	\N	SFM	Sanford	43.4333340000000021	-70.7666700000000048
5933	\N	\N	SFN	Santa Fe	-31.7166670000000011	-60.8166659999999979
5934	\N	\N	SFP	Surfers Paradise	-28	153
5935	\N	\N	SFR	San Fernando	34.2666660000000007	-118.433334000000002
5936	\N	\N	SFU	Safia	-9.66666700000000034	148.666670000000011
5937	\N	\N	SFV	Santa Fe Do Sul	-19.8333319999999986	-50.1666680000000014
5938	\N	\N	SFW	Santa Fe	8.83333299999999966	-81.1666639999999973
5939	\N	\N	SFX	San Felix	8.21666699999999928	-62.3833300000000008
5940	\N	\N	SFZ	North Central	41.9166680000000014	-71.5666659999999979
5941	\N	\N	SGA	Sheghnan	38.0333329999999989	71.7166699999999935
5942	\N	\N	SGB	Singaua	-6.70000000000000018	147.133330000000001
5943	\N	\N	SGC	Surgut	61.3399160000000023	73.4095300000000037
5944	\N	\N	SGE	Siegerland Airport	50.8500000000000014	8
5945	\N	\N	SGF	Springfield-Branson Rg	37.2423700000000011	-93.3822600000000023
5946	\N	\N	SGG	Simanggang	1.22277799999999992	111.460555999999997
5947	\N	\N	SGH	Springfield	39.9166680000000014	-83.7999999999999972
5948	\N	\N	SGI	Sargodha Airport	32.1666680000000014	72.6666639999999973
5949	\N	\N	SGJ	Sagarai	-10.4666669999999993	150.150000000000006
5950	\N	\N	SGK	Sangapi	-5.08333299999999966	144.766660000000002
5951	\N	\N	SGL	Sangley Point NAS	14.5999999999999996	120.950000000000003
5952	\N	\N	SGM	San Ignacio	27.4499999999999993	-113
5953	\N	\N	SGN	Tan Son Nhat International	10.8130450000000007	106.662475999999998
5954	\N	\N	SGO	St George	-28.0533329999999985	148.593889999999988
5955	\N	\N	SGP	Shay Gap	-20.8166679999999999	120.233329999999995
5956	\N	\N	SGQ	Sanggata	0.5	117.333336000000003
5957	\N	\N	SGR	Sugar Land Regional	29.6988890000000012	-95.4077759999999984
5958	\N	\N	SGS	Sanga Sanga	5.23333300000000001	121.150000000000006
5959	\N	\N	SGT	Stuttgart Municipalcipal	34.5	-91.5333300000000065
5960	\N	\N	SGU	St. George Municipal	37.032626999999998	-113.510170000000002
5961	\N	\N	SGV	Sierra Grande	-41.5666659999999979	-65.3499999999999943
5962	\N	\N	SGW	Saginaw Bay	58.4776000000000025	-134.157800000000009
5963	\N	\N	SGX	Songea	-10.6866669999999999	35.5775000000000006
5964	\N	\N	SGY	Skagway Municipal	59.4605559999999969	-135.315550000000002
5965	\N	\N	SGZ	Songkhla	7.18388899999999975	100.616669999999999
5966	\N	\N	SHA	Shanghai Hongqiao International	31.1968150000000009	121.341970000000003
5967	\N	\N	SHC	Indaselassie	12.983333	39.1333300000000008
5968	\N	\N	SHD	Shenandoah Valley	38.2638900000000035	-78.8966700000000003
5969	\N	\N	SHE	Shenyang	41.8610839999999982	123.426925999999995
5970	\N	\N	SHI	Shimojishima	24.8166679999999999	125.150000000000006
5971	\N	\N	SHJ	Sharjah	25.3208729999999989	55.5202900000000028
5972	\N	\N	SHK	Sehonghong	-29.4750000000000014	27.8333319999999986
5973	\N	\N	SHL	Barapani	25.5666679999999999	91.8833300000000008
5974	\N	\N	SHM	Shirahama	33.6613899999999973	135.358059999999995
5975	\N	\N	SHN	Sanderson Field	47.2338900000000024	-123.138885000000002
5976	\N	\N	SHO	Seolak	38.1333300000000008	128.599999999999994
5977	\N	\N	SHP	Qinhuangdao	39.9652140000000031	119.716560000000001
5978	\N	\N	SHQ	Southport	-27.951944000000001	153.427780000000013
5979	\N	\N	SHR	Sheridan	44.774166000000001	-106.977220000000003
5980	\N	\N	SHS	Shashi	30.3166679999999999	112.233329999999995
5981	\N	\N	SHT	Shepparton	-36.3833300000000008	145.433330000000012
5982	\N	\N	SHU	Smith Point	-11.1333330000000004	132.133330000000001
5983	\N	\N	SHV	Regional	32.4547099999999986	-93.8283839999999998
5984	\N	\N	SHW	Sharurah	17.4694600000000015	47.1119839999999996
5985	\N	\N	SHZ	Seshutes	-29.1666680000000014	28
5986	\N	\N	SIA	Xiguan	34.441040000000001	108.758740000000003
5987	\N	\N	SIB	Sibiti	-3.73333300000000001	13.4000000000000004
5988	\N	\N	SIE	Sines	37.9333340000000021	-8.84999999999999964
5989	\N	\N	SIH	Silgadi Doti	29.2666660000000007	80.9749999999999943
5990	\N	\N	SII	Sidi Ifni	29.3999999999999986	-10.1999999999999993
5991	\N	\N	SIJ	Siglufjordur	66.1666639999999973	-18.9333320000000001
5992	\N	\N	SIK	Memorial	36.8666699999999992	-89.5499999999999972
5993	\N	\N	SIL	Sila	-8.33333299999999966	147.5
5994	\N	\N	SIM	Simbai	-5.25	144.53334000000001
5995	\N	\N	SIO	Smithton	-40.835835000000003	145.081670000000003
5996	\N	\N	SIQ	Dabo	-0.5	104.416663999999997
5997	\N	\N	SIR	Sion	46.25	7.33333299999999966
5998	\N	\N	SIS	Sishen	-27.9166680000000014	22.9833339999999993
5999	\N	\N	SIU	Siuna	13.7272219999999994	-84.777780000000007
6000	\N	\N	SIV	County	39.1000000000000014	-87.4000000000000057
6001	\N	\N	SIW	Sibisa	2.66999999999999993	98.9300000000000068
6002	\N	\N	SIX	Singleton	-32.5666659999999979	151.166670000000011
6003	\N	\N	SIY	Siskiyou County	41.7333339999999993	-122.533330000000007
6004	\N	\N	SIZ	Sissano	-3	142.050000000000011
6005	\N	\N	SJA	San Juan	-15.3499999999999996	-75.1500000000000057
6006	\N	\N	SJB	San Joaquin	-13.0833329999999997	-64.7999999999999972
6007	\N	\N	SJD	Los Cabos	23.1623540000000006	-109.717285000000004
6008	\N	\N	SJE	San Jose Del Gua	2.5833330000000001	-72.6666639999999973
6009	\N	\N	SJF	St John Island	18.3333319999999986	-64.75
6010	\N	\N	SJG	San Pedro Jagua	9.40000000000000036	-75.0666659999999979
6011	\N	\N	SJH	San Juan Del Cesar	10.766667	-73.0166700000000048
6012	\N	\N	SJI	San Jose	12.3597640000000002	121.045689999999993
6013	\N	\N	SJJ	Sarajevo	43.8266869999999997	18.3360650000000014
6014	\N	\N	SJK	Sao Jose Dos Campos	-23.1833320000000001	-46.1166699999999992
6015	\N	\N	SJL	Da Cachoeira	-0.148332999999999993	-66.9855600000000067
6016	\N	\N	SJM	San Juan	18.8333319999999986	-71.2333299999999952
6017	\N	\N	SJN	St. Johns Industrial Air Park	34.5	-109.349999999999994
6018	\N	\N	SJO	Juan Santamaría International	9.99823800000000062	-84.2040800000000047
6019	\N	\N	SJP	Sao Jose Do Rio Preto	-20.8166679999999999	-49.4166680000000014
6020	\N	\N	SJQ	Sesheke	-17.4833339999999993	24.2833329999999989
6021	\N	\N	SJR	San Juan D Ur	8.76666699999999999	-76.5333300000000065
6022	\N	\N	SJS	San Jose	-17.827223	-60.7383349999999993
6023	\N	\N	SJT	Mathis Field	31.3597220000000014	-100.494445999999996
6024	\N	\N	SJU	Luis Munoz Marin International	18.4374029999999998	-66.0046839999999975
6025	\N	\N	SJV	San Javier	-16.2333339999999993	-62.4166680000000014
6026	\N	\N	SJW	Daguocun	38.2743759999999966	114.694429999999997
6027	\N	\N	SJX	Sartaneja	18.3000000000000007	-88.3333360000000027
6028	\N	\N	SJY	Ilmajoki	62.6931999999999974	22.8352849999999989
6029	\N	\N	SKA	Fairchild AFB	47.6666680000000014	-117.400000000000006
6030	\N	\N	SKB	Robert L Bradshaw International	17.3108429999999984	-62.7139700000000033
6031	\N	\N	SKC	Suki	-8.08333299999999966	141.800000000000011
6032	\N	\N	SKD	Samarkand	39.6962169999999972	66.9908499999999947
6033	\N	\N	SKE	Skien	59.1827770000000015	9.5625
6034	\N	\N	SKF	Kelly AFB	29.4166680000000014	-98.5
6035	\N	\N	SKI	Skikda	36.8333319999999986	6.96666700000000017
6036	\N	\N	SKJ	Sitkinak Cgs	56.5327800000000025	-154.113889999999998
6037	\N	\N	SKL	Broadford	57.3333319999999986	-6.25
6038	\N	\N	SKM	Skeldon	5.87777800000000017	-57.1749999999999972
6039	\N	\N	SKN	Skagen	68.5791499999999985	15.032921
6040	\N	\N	SKP	Alexander The Great Airport	41.9564900000000023	21.6287200000000013
6041	\N	\N	SKQ	Sekakes	-29.6499999999999986	28.1666680000000014
6042	\N	\N	SKR	Shakiso	5.88333300000000037	38.9666670000000011
6043	\N	\N	SKS	Vojens	55.2219430000000031	9.26472200000000079
6044	\N	\N	SKT	Sialkot International	32.5333329999999989	74.5
6045	\N	\N	SKV	Mount Sinai	28.5	33.9500000000000028
6046	\N	\N	SKW	Intermediate	61.9658299999999969	-151.188610000000011
6047	\N	\N	SKX	Saransk	54.1666680000000014	45.1666680000000014
6048	\N	\N	SKY	Griffing Sandusky	41.4500000000000028	-83
6049	\N	\N	SKZ	Sukkur	27.7233599999999996	68.7957999999999998
6050	\N	\N	SLA	Gen Belgrano	-24.8442170000000004	-65.4784899999999936
6051	\N	\N	SLB	Storm Lake Municipal Airport	42.6333300000000008	-95.2000000000000028
6052	\N	\N	SLD	Sliac	48.6333300000000008	19.1333330000000004
6053	\N	\N	SLE	Mcnary Field	44.9952770000000015	-123.025000000000006
6054	\N	\N	SLF	Sulayel	20.4666670000000011	45.6166699999999992
6055	\N	\N	SLG	Smith Field	36.1833340000000021	-94.5333300000000065
6056	\N	\N	SLH	Sola	-13.8833330000000004	167.550000000000011
6057	\N	\N	SLI	Solwezi	-12.1722219999999997	26.3666669999999996
6058	\N	\N	SLJ	Stellar Air Park	33.2988900000000001	-111.915559999999999
6059	\N	\N	SLK	Adirondack	44.3827799999999968	-74.206665000000001
6060	\N	\N	SLL	Salalah	17.0381239999999998	54.1069370000000021
6061	\N	\N	SLM	Matacan	40.9666670000000011	-5.65000000000000036
6062	\N	\N	SLO	Leckrone	38.6333300000000008	-88.9500000000000028
6063	\N	\N	SLR	Sulphur Springs	33.1333300000000008	-95.5999999999999943
6064	\N	\N	SLS	Silistra	44.0563900000000004	27.1805549999999982
6065	\N	\N	SLT	Salida	38.5333329999999989	-106
6066	\N	\N	SLV	Simla	31.1166669999999996	77.1500000000000057
6067	\N	\N	SLW	Saltillo	25.5500000000000007	-100.916663999999997
6068	\N	\N	SLX	Salt Cay	21.3333319999999986	-71.2016699999999929
6069	\N	\N	SLY	Salekhard	66.5833360000000027	66.5999999999999943
6070	\N	\N	SMB	Cerro Sombrero	-52.7383349999999993	-69.3427800000000047
6071	\N	\N	SMC	Santa Maria	8.16666700000000034	-77.0499999999999972
6072	\N	\N	SMD	Smith Field	41.0666659999999979	-85.1500000000000057
6073	\N	\N	SME	Pulaski County	37.0833319999999986	-84.5999999999999943
6074	\N	\N	SMG	Santa Maria	-12.5	-72
6075	\N	\N	SMH	Sapmanga	-6.08333299999999966	146.75
6076	\N	\N	SMJ	Sim	-7.56666699999999981	146.983339999999998
6077	\N	\N	SML	Estate Airstrip	23.5833319999999986	-75.2680600000000055
6078	\N	\N	SMM	Semporna	4.41666700000000034	118.833336000000003
6079	\N	\N	SMN	Salmon	45.1833340000000021	-113.916663999999997
6080	\N	\N	SMO	Santa Monica	34.0166660000000007	-118.5
6081	\N	\N	SMP	Stockholm	-4.56666699999999981	151.96665999999999
6082	\N	\N	SMR	Simon Bolivar	11.1171319999999998	-74.2327039999999982
6083	\N	\N	SMS	Sainte Marie	-17.0833319999999986	49.8166659999999979
6084	\N	\N	SMT	Sun Moon Lake	23.8833330000000004	120.933334000000002
6085	\N	\N	SMU	Sheep Mountain	61.7999999999999972	-147.666670000000011
6086	\N	\N	SMV	Samedan	46.5347200000000001	9.88555599999999934
6087	\N	\N	SMW	Smara	26.7333339999999993	-11.6833329999999993
6088	\N	\N	SMX	Public	34.9050000000000011	-120.45778
6089	\N	\N	SMY	Simenti	13.1666670000000003	-13.1666670000000003
6090	\N	\N	SMZ	Stoelmans Eiland	4.34305599999999981	-54.3999999999999986
6091	\N	\N	SNA	John Wayne	33.6802020000000013	-117.860534999999999
6092	\N	\N	SNB	Snake Bay	-11.4166670000000003	130.666670000000011
6093	\N	\N	SNC	Salinas	-2.20000000000000018	-80.9833299999999952
6094	\N	\N	SND	Seno	16.6666680000000014	105.016670000000005
6095	\N	\N	SNF	San Felipe	10.2802779999999991	-68.7538899999999984
6096	\N	\N	SNG	San Ignacio De Velasco	-16.3830570000000009	-60.9763900000000021
6097	\N	\N	SNH	Stanthorpe	-28.6499999999999986	151.949999999999989
6098	\N	\N	SNI	R.E. Murray	5.0330560000000002	-9.06361099999999986
6099	\N	\N	SNJ	San Julian	22.0833319999999986	-84.1500000000000057
6100	\N	\N	SNK	Winston Field	32.7166670000000011	-100.900000000000006
6101	\N	\N	SNL	Shawnee Municipal	35.3333319999999986	-96.9166639999999973
6102	\N	\N	SNM	San Ignacio De M	-14.9663889999999995	-65.6355599999999981
6103	\N	\N	SNN	Shannon	52.6924800000000033	-8.92038999999999938
6104	\N	\N	SNO	Sakon Nakhon	17.2833329999999989	104.099999999999994
6105	\N	\N	SNQ	San Quintin	30.5	-116
6106	\N	\N	SNR	Montoir	47.2911100000000033	-2.18222199999999988
6107	\N	\N	SNS	Salinas	36.6666680000000014	-121.650000000000006
6108	\N	\N	SNT	Sabana De Torres	7.66666700000000034	-73
6109	\N	\N	SNU	Abel Santa Maria	22.4919429999999991	-79.9419400000000024
6110	\N	\N	SNV	Santa Elena	4.54999999999999982	-61.1166699999999992
6111	\N	\N	SNY	Sidney	41.0994450000000029	-102.982500000000002
6112	\N	\N	SNZ	Santa Cruz	-6.21666700000000017	-36.0166660000000007
6113	\N	\N	SOA	Soc Trang	9.61666699999999963	105.833336000000003
6114	\N	\N	SOB	Sármellék/Balaton	46.7134700000000009	17.2404440000000001
6115	\N	\N	SOC	Adi Sumarmo	-7.51583000000000023	110.75667
6116	\N	\N	SOD	Sorocaba	-23.4833339999999993	-47.4500000000000028
6117	\N	\N	SOE	Souanke	2	14.1666670000000003
6118	\N	\N	SOH	Solita	9.19999999999999929	-71.7666700000000048
6119	\N	\N	SOI	South Molle Island	-20.75	148.583329999999989
6120	\N	\N	SOJ	Sorkjosen	69.7833300000000065	20.9333320000000001
6121	\N	\N	SOK	Semongkong	-29.8333319999999986	28.5
6122	\N	\N	SOL	Solomon	64.5608399999999989	-164.440280000000001
6123	\N	\N	SOM	Edmundo Barrios	8.94916699999999921	-64.1458360000000027
6124	\N	\N	SOO	Soderhamn	61.2999999999999972	17.0500000000000007
6125	\N	\N	SOP	Pinehurst-S. Pines	35.2376099999999965	-79.3887940000000043
6126	\N	\N	SOQ	Jefman	-0.89021399999999995	131.290590000000009
6127	\N	\N	SOR	Al Thaurah	34.3999999999999986	40.1666680000000014
6128	\N	\N	SOT	Sodankyla	67.3833300000000008	26.6166669999999996
6129	\N	\N	SOV	Seldovia	59.4425000000000026	-151.704160000000002
6130	\N	\N	SOW	Show Low	34.2644420000000025	-110.004165999999998
6131	\N	\N	SOX	Alberto Lleras Camargo	5.71666700000000017	-72.9333340000000021
6132	\N	\N	SOY	Stronsay	59.1540529999999976	-2.64049500000000004
6133	\N	\N	SOZ	Solenzara	41.8833300000000008	9.38333300000000037
6134	\N	\N	SPA	Spartanburg, Downtown Memorial	34.9500000000000028	-81.9166639999999973
6135	\N	\N	SPB	SPB	18.3500000000000014	-64.9166639999999973
6136	\N	\N	SPC	La Palma	28.6263889999999996	-17.7555559999999986
6137	\N	\N	SPE	Sepulot	4.71222199999999969	116.456950000000006
6138	\N	\N	SPF	Black Hills	44.5	-103.866669999999999
6139	\N	\N	SPH	Sopu	-9	147.766660000000002
6140	\N	\N	SPI	Capital	39.8441660000000013	-89.6788899999999956
6141	\N	\N	SPJ	Eleftherios Venizelos	36.9833339999999993	22.5333329999999989
6142	\N	\N	SPM	Spangdahlem	50.0654699999999977	6.83591700000000024
6143	\N	\N	SPN	Saipan International	15.1221779999999999	145.723250000000007
6144	\N	\N	SPO	San Pablo	37.3833300000000008	-5.75
6145	\N	\N	SPP	Menongue	-14.6374999999999993	17.7255549999999999
6146	\N	\N	SPQ	Catalina SPB	33.7505570000000006	-118.272779999999997
6147	\N	\N	SPR	San Pedro	17.9111119999999993	-87.9686099999999982
6148	\N	\N	SPS	Sheppard AFB	33.9883349999999993	-98.4919399999999996
6149	\N	\N	SPT	Sipitang	5.08333299999999966	115.549999999999997
6150	\N	\N	SPV	Sepik Plains	-3.81666699999999981	144.5
6151	\N	\N	SPW	Spencer Municipal	43.1638900000000021	-95.2008359999999954
6152	\N	\N	SPX	Spaceland	29.7666660000000007	-95.4333340000000021
6153	\N	\N	SPY	San Pedro	4.7302780000000002	-6.62694399999999995
6154	\N	\N	SPZ	Springdale Municipal	36.1833340000000021	-94.1666639999999973
6155	\N	\N	SQA	Santa Ynez	34.0666659999999979	-118.566665999999998
6156	\N	\N	SQB	Santa Ana	9.3166670000000007	-74.5833360000000027
6157	\N	\N	SQC	Southern Cross	-31.25	119.349999999999994
6158	\N	\N	SQE	San Luis De Pale	-12.0666670000000007	-77
6159	\N	\N	SQF	Solano	2	-66.9666699999999935
6160	\N	\N	SQG	Sintang	0.0833330000000000043	111.583336000000003
6161	\N	\N	SQH	Na-San	21.2180560000000007	104.025000000000006
6162	\N	\N	SQI	Whiteside County	41.740000000000002	-89.6808300000000003
6163	\N	\N	SQK	Sidi Barani	31.6000000000000014	25.9333320000000001
6164	\N	\N	SQL	San Carlos	37.4833339999999993	-122.25
6165	\N	\N	SQM	São Miguel de Aragao	-13.3166670000000007	-50.2166670000000011
6166	\N	\N	SQN	Sanana	-2.20000000000000018	125.916663999999997
6167	\N	\N	SQO	Gunnarn	64.9622200000000021	17.8000000000000007
6168	\N	\N	SQQ	Siauliai International	55.9333340000000021	23.3166679999999999
6169	\N	\N	SQR	Inco Soroako Waws	-3.1666669999999999	122.666663999999997
6170	\N	\N	SQS	Matthew Spain	17.1833320000000001	-89.0333300000000065
6171	\N	\N	SQU	Saposoa	-6.95000000000000018	-76.75
6172	\N	\N	SQV	Sequim Valley Airport	48.0977800000000002	-123.185280000000006
6173	\N	\N	SQW	Skive Airport	56.5666659999999979	9.03333300000000072
6174	\N	\N	SQX	Sao Miguel do Oeste	-26.7805560000000007	-53.5027770000000018
6175	\N	\N	SQY	Sao Lourenco Do Sul	-31.3827779999999983	-52.0322230000000019
6176	\N	\N	SQZ	RAF Station	53.2999999999999972	-0.58333299999999999
6177	\N	\N	SRA	Santa Rosa	-27.8666669999999996	-54.4833339999999993
6178	\N	\N	SRB	Santa Rosa	-10.5999999999999996	-67.3333360000000027
6179	\N	\N	SRC	Searcy	35.25	-91.7333299999999952
6180	\N	\N	SRD	San Ramon	-13.2833330000000007	-64.7166699999999935
6181	\N	\N	SRE	Juana Azurduy de Padilla	-19.0077779999999983	-65.3016700000000014
6182	\N	\N	SRF	Hamilton Field	38.0152780000000021	-122.522223999999994
6183	\N	\N	SRG	Achmad Yani	-6.97915500000000044	110.378550000000004
6184	\N	\N	SRH	Sarh	9.08333299999999966	18.3833330000000004
6185	\N	\N	SRI	Samarinda	-0.5	117.150000000000006
6186	\N	\N	SRJ	Capitan G Q Guardia	-14.8166670000000007	-66.8333360000000027
6187	\N	\N	SRL	Santa Rosalia	27.1999999999999993	-112.25
6188	\N	\N	SRM	Sandringham	-24.0500000000000007	139.066669999999988
6189	\N	\N	SRN	Strahan	-42.1499999999999986	145.316669999999988
6190	\N	\N	SRO	Santana Ramos	9.91694400000000087	-126.066940000000002
6191	\N	\N	SRP	Stord Airport	59.8333319999999986	5.41666700000000034
6192	\N	\N	SRR	Dunwich	33.360832000000002	-105.662499999999994
6193	\N	\N	SRS	Cartagena	8.65000000000000036	-75.1333300000000008
6194	\N	\N	SRT	Soroti	1.69999999999999996	33.6166699999999992
6195	\N	\N	SRU	Skypark	36.9666670000000011	-122.016670000000005
6196	\N	\N	SRV	Stony River	61.7911100000000033	-156.586099999999988
6197	\N	\N	SRW	Rowan County	35.6666680000000014	-80.4833299999999952
6198	\N	\N	SRX	Sert	31.0609169999999999	16.6120359999999998
6199	\N	\N	SRY	Dashte Naz	36.6357270000000028	53.1972769999999997
6200	\N	\N	SRZ	El Trompillo	-17.8041669999999996	-63.1724999999999994
6201	\N	\N	SSB	SPB	17.75	-64.75
6202	\N	\N	SSC	Shaw AFB	33.8999999999999986	-80.1166699999999992
6203	\N	\N	SSD	San Felipe	1.9166669999999999	-67.0999999999999943
6204	\N	\N	SSE	Sholapur	17.6333330000000004	75.9333340000000021
6205	\N	\N	SSF	Stinson Municipalcipal	29.4166680000000014	-98.5
6206	\N	\N	SSG	Malbo	3.7577910000000001	8.71609600000000029
6207	\N	\N	SSI	Malcolm Mckinnon	31.1659159999999993	-81.4634700000000009
6208	\N	\N	SSJ	Stokka	65.9599460000000022	12.4765180000000004
6209	\N	\N	SSK	Sturt Creek	-19.1999999999999993	128.133330000000001
6210	\N	\N	SSL	Santa Rosalia	1.46666699999999994	-72.2333299999999952
6211	\N	\N	SSN	Seoul AB	37.4500000000000028	127.116669999999999
6212	\N	\N	SSO	Sao Lourenco	-22.1166669999999996	-45.0499999999999972
6213	\N	\N	SSP	Silver Plains	-13.983333	143.550000000000011
6214	\N	\N	SSQ	La Sarre	48.9166680000000014	-79.1666639999999973
6215	\N	\N	SSR	Sara	-15.5	168.300000000000011
6216	\N	\N	SSS	Siassi	-5.61666699999999963	147.816669999999988
6217	\N	\N	SST	Santa Teresita	-33.4166680000000014	-60.7833329999999989
6218	\N	\N	SSU	Greenbrier	37.7999999999999972	-80.2999999999999972
6219	\N	\N	SSV	Siasi	5.5	120.816665999999998
6220	\N	\N	SSW	Stuart Island	48.6728799999999993	-123.175740000000005
6221	\N	\N	SSZ	Santos	-23.9333320000000001	-46.3666699999999992
6222	\N	\N	STA	Stauning Vestjyllands Airport	55.9902760000000015	8.35500000000000043
6223	\N	\N	STB	L Delicias	9.03333300000000072	-71.9500000000000028
6224	\N	\N	STC	Saint Cloud Regional	45.5499999999999972	-94.1666639999999973
6225	\N	\N	STD	Mayo Guerrero	7.58333299999999966	-72.0666659999999979
6226	\N	\N	STE	Stevens Point	44.5452769999999987	-89.5308299999999946
6227	\N	\N	STF	Stephen Island	-9.5	143.566669999999988
6228	\N	\N	STG	St George Island	56.6000000000000014	-169.552500000000009
6229	\N	\N	STH	Strathmore	-17.8333319999999986	142.583329999999989
6230	\N	\N	STJ	Rosecrans Memorial	39.9605559999999969	-94.9249999999999972
6231	\N	\N	STK	Crosson Field	40.616109999999999	-103.267219999999995
6232	\N	\N	STM	Eduardo Gomes	-2.42488599999999987	-54.7863899999999973
6233	\N	\N	STP	Downtown	44.9333340000000021	-93.0666659999999979
6234	\N	\N	STQ	St Marys	41.4333340000000021	-78.5666659999999979
6235	\N	\N	STR	Stuttgart Echterdingen	48.6907300000000021	9.1936239999999998
6236	\N	\N	STS	Sonoma County	38.508890000000001	-122.811670000000007
6237	\N	\N	STU	Santa Cruz	18.2666660000000007	-88.4500000000000028
6238	\N	\N	STW	Stavropol	45.3333319999999986	42.0083300000000008
6239	\N	\N	STZ	Confresa	-10.3002780000000005	-50.4500000000000028
6240	\N	\N	SUA	Witham Field	27.1999999999999993	-80.25
6241	\N	\N	SUC	Schloredt	44.3999999999999986	-104.383330000000001
6242	\N	\N	SUD	Stroud	35.75	-96.6833340000000021
6243	\N	\N	SUE	Door County	44.8438870000000023	-87.4213900000000024
6244	\N	\N	SUF	Lamezia Terme	38.9100150000000014	16.2449720000000006
6245	\N	\N	AGM	Tasiilaq	65.5999999999999943	-37.6833340000000021
6246	\N	\N	AJI	Agri	39.6499999999999986	43.0249999999999986
6247	\N	\N	AKI	Akiak	60.9055559999999971	-161.223330000000004
6248	\N	\N	AKU	Aksu	41.2599829999999983	80.2926199999999994
6249	\N	\N	AKY	Civil	20.1302780000000006	92.8802799999999991
6250	\N	\N	ALF	Alta	69.9771649999999994	23.3558079999999997
6251	\N	\N	ANV	Anvik	62.6477780000000024	-160.188889999999986
6252	\N	\N	ATD	Atoifi	-8.86666699999999963	161.03334000000001
6253	\N	\N	AUQ	Atuona	-9.76932399999999923	-139.009780000000006
6254	\N	\N	AWD	Aniwa	-19.25	169.5
6255	\N	\N	AXK	Ataq	13.8666669999999996	46.2999999999999972
6256	\N	\N	BBN	Bario	3.68333300000000019	115.466669999999993
6257	\N	\N	BEW	Beira	-19.7988050000000015	34.9019199999999969
6258	\N	\N	BOO	Bodo	67.2726200000000034	14.367839
6259	\N	\N	BUA	Buka	-5.42244300000000035	154.672879999999992
6260	\N	\N	BUZ	Bushehr	28.958283999999999	50.8254239999999982
6261	\N	\N	BVC	Rabil	16.0833319999999986	-22.8333319999999986
6262	\N	\N	BXB	Babo	-2.54999999999999982	133.416670000000011
6263	\N	\N	CAZ	Cobar	-31.5350000000000001	145.793329999999997
6264	\N	\N	CGM	Mambajao	18.8999999999999986	121.916663999999997
6265	\N	\N	CIZ	Coari	-4.08333299999999966	-63.1333300000000008
6266	\N	\N	CMI	University Of Illinois Willard	40.0396649999999994	-88.2690499999999929
6267	\N	\N	CRM	National	12.483333	124.583336000000003
6268	\N	\N	CUQ	Coen	-13.7638890000000007	143.113329999999991
6269	\N	\N	CZE	Coro	11.4158329999999992	-69.6819459999999964
6270	\N	\N	DAM	International	33.4111699999999985	36.5124899999999997
6271	\N	\N	DRG	Deering	66.0712000000000046	-162.759890000000013
6272	\N	\N	DWD	Dawadmi	24.4455449999999992	44.128700000000002
6273	\N	\N	EGM	Sege	-8.57795600000000036	157.875059999999991
6274	\N	\N	EGX	Egegik	58.2077799999999996	-157.370290000000011
6275	\N	\N	ETH	Eilat	29.5556160000000006	34.9535699999999991
6276	\N	\N	FEZ	Sais	33.9307900000000018	-4.98213799999999996
6277	\N	\N	FNI	Garons	43.75	4.41666700000000034
6278	\N	\N	GHT	Ghat	24.9666670000000011	10.1666670000000003
6279	\N	\N	GJL	Jijel	36.7999999999999972	5.88333300000000037
6280	\N	\N	GLV	Golovin	64.544169999999994	-163.037499999999994
6281	\N	\N	GPI	Guapi	2.5	-78.3416699999999935
6282	\N	\N	GXF	Seiyun	15.9617939999999994	48.7870860000000022
6283	\N	\N	GZO	Gizo	-8.11666699999999963	156.833329999999989
6284	\N	\N	HAS	Hail	27.4381580000000014	41.6904830000000004
6285	\N	\N	HEH	Heho	20.743862	96.7934099999999944
6286	\N	\N	HMI	Hami	42.9166680000000014	93.4166639999999973
6287	\N	\N	HOR	Horta	38.5200000000000031	-28.7172219999999996
6288	\N	\N	HSG	Saga	33.1538279999999972	130.302780000000013
6289	\N	\N	HUH	Huahine	-16.6896820000000012	-151.028259999999989
6290	\N	\N	HVD	Khovd	48.0166660000000007	91.6500000000000057
6291	\N	\N	HYL	SPB	55.4826300000000003	-132.650620000000004
6292	\N	\N	IBE	Ibague	4.42394800000000021	-75.1385800000000046
6293	\N	\N	IPA	Ipota	-18.75	169.183330000000012
6294	\N	\N	IXJ	Satwari	32.6807700000000025	74.8428300000000064
6295	\N	\N	JAU	Jauja	-11.75	-75.25
6296	\N	\N	JEG	Aasiaat	68.7000000000000028	-52.75
6297	\N	\N	JHS	Sisimiut	66.936940000000007	-53.7041660000000007
6298	\N	\N	JNS	Heliport	60.9166680000000014	-46.0499999999999972
6299	\N	\N	KAL	Kaltag	64.3219449999999995	-158.736109999999996
6300	\N	\N	KAZ	Kau	1.1666669999999999	127.866669999999999
6301	\N	\N	KCZ	Kochi	33.5476880000000008	133.674849999999992
6302	\N	\N	KHD	Khorramabad	33.4386099999999971	48.2808339999999987
6303	\N	\N	KLW	Klawock	55.5549999999999997	-133.099999999999994
6304	\N	\N	KNQ	Kone	-21.0533329999999985	164.837780000000009
6305	\N	\N	KOE	Eltari	-10.1685359999999996	123.667249999999996
6306	\N	\N	KRT	Civil	15.5922169999999998	32.5496979999999994
6307	\N	\N	KSA	Kosrae	5.35247799999999962	162.956600000000009
6308	\N	\N	KUD	Kudat	6.92499999999999982	116.83417
6309	\N	\N	KYK	Karluk	57.5661130000000014	-154.449999999999989
6310	\N	\N	LBU	Labuan	5.29435500000000037	115.249160000000003
6311	\N	\N	LNE	Lonorore	-15.860106	168.17007000000001
6312	\N	\N	LPM	Lamap	-16.4666670000000011	167.816669999999988
6313	\N	\N	LUO	Luena	-11.5	20.1666680000000014
6314	\N	\N	LWY	Lawas	4.91666700000000034	115.416663999999997
6315	\N	\N	LYI	Linyi	35.0474779999999981	118.407070000000004
6316	\N	\N	MAU	Maupiti	-16.427385000000001	-152.242359999999991
6317	\N	\N	MBI	Mbeya	-8.91472199999999937	33.4619450000000001
6318	\N	\N	MCT	Seeb	23.5880779999999994	58.2902199999999979
6319	\N	\N	MFK	Matsu	26.1666680000000014	119.916663999999997
6320	\N	\N	MGZ	Myeik	12.4499999999999993	98.6166699999999992
6321	\N	\N	MHD	Mashad	36.2271730000000005	59.6416499999999985
6322	\N	\N	MKM	Mukah	2.90694400000000019	112.079719999999995
6323	\N	\N	MMY	Hirara	24.7791980000000009	125.297780000000003
6324	\N	\N	MOL	Aro	62.7473030000000023	7.26211800000000007
6325	\N	\N	MQM	Mardin	37.2233000000000018	40.6317000000000021
6326	\N	\N	MRS	Marseille Provence Airport	43.4417800000000014	5.22213700000000003
6327	\N	\N	MRX	Mahshahr	30.5355570000000007	49.1672200000000004
6328	\N	\N	MSR	Mus	38.7250000000000014	41.625
6329	\N	\N	MST	Maastricht/aachen	50.915619999999997	5.76882699999999993
6330	\N	\N	MWF	Maewo	-15.1666670000000003	168.166670000000011
6331	\N	\N	MXH	Moro	-6.35250000000000004	143.250550000000004
6332	\N	\N	MXV	Moron	49.6333300000000008	100.166663999999997
6333	\N	\N	MXX	Mora	60.958120000000001	14.5045289999999998
6334	\N	\N	MYY	Miri	4.32526100000000024	113.983115999999995
6335	\N	\N	MZG	Makung	23.5691659999999992	119.618613999999994
6336	\N	\N	MZV	Mulu,	4.03333299999999983	114.799999999999997
6337	\N	\N	MZW	Mechria	33.5219420000000028	-0.283055999999999974
6338	\N	\N	NAQ	Qaanaaq	77.4856400000000036	-69.3748599999999982
6339	\N	\N	NCL	Newcastle Airport	55.0370640000000009	-1.71062899999999996
6340	\N	\N	NEV	Vance Winkworth Amory International	17.2049999999999983	-62.5925000000000011
6341	\N	\N	NIB	Nikolai	63.0166660000000007	-154.383330000000001
6342	\N	\N	NKI	Naukiti	55.3666699999999992	-133.21665999999999
6343	\N	\N	NNT	Nan	18.8000000000000007	100.783330000000007
6344	\N	\N	NUS	Norsup	-16.0583320000000001	167.400000000000006
6345	\N	\N	NVA	La Marguita	2.94682399999999989	-75.2955249999999978
6346	\N	\N	ODY	Oudomxai	20.5833319999999986	104.166663999999997
6347	\N	\N	OER	Ornskoldsvik	63.4125820000000004	18.9920730000000013
6348	\N	\N	OIT	Oita	33.4772379999999998	131.73236
6349	\N	\N	OME	Nome	64.5113900000000058	-165.441669999999988
6350	\N	\N	OMH	Urmieh	37.6625250000000023	45.0587700000000027
6351	\N	\N	ORN	Es Senia	35.6200180000000017	-0.60610799999999998
6352	\N	\N	OZC	Labo	8.18196700000000021	123.845410000000001
6353	\N	\N	PBH	Paro	27.4333320000000001	89.4166639999999973
6354	\N	\N	PIK	Prestwick	55.5084299999999971	-4.61128599999999977
6355	\N	\N	PIT	Pittsburgh International	40.4958499999999972	-80.2565699999999964
6356	\N	\N	PKN	Pangkalanbuun	-2.70000000000000018	111.666663999999997
6357	\N	\N	PSJ	Poso	-1.38333299999999992	120.733329999999995
6358	\N	\N	PUJ	Punta Cana International	18.5624770000000012	-68.3640000000000043
6359	\N	\N	PZH	Zhob	31.3333319999999986	69.5
6360	\N	\N	RES	Resistencia	-27.45139	-59.0508349999999993
6361	\N	\N	RFP	Raiatea	-16.7250039999999984	-151.46665999999999
6362	\N	\N	RKS	Sweetwater County	41.5963899999999995	-109.065833999999995
6363	\N	\N	RMA	Roma	-26.5435519999999983	148.779429999999991
6364	\N	\N	RSU	Yeosu	34.8419000000000025	127.612669999999994
6365	\N	\N	RUA	Arua	3.03333299999999983	30.9333320000000001
6366	\N	\N	RUR	Rurutu	-22.4333320000000001	-151.333329999999989
6367	\N	\N	SAT	San Antonio International	29.5249370000000013	-98.4726399999999984
6368	\N	\N	SAX	Sambu	8.03333300000000072	-78.0833360000000027
6369	\N	\N	SBH	Gustaf III (St-Jean)	17.8999999999999986	-62.8500000000000014
6370	\N	\N	SDQ	Aeropuerto de las Américas	18.4301239999999993	-69.6767399999999952
6371	\N	\N	SHB	Nakashibetsu	43.5721970000000027	144.956130000000002
6372	\N	\N	SIF	Simara	27.1635629999999999	84.9791950000000043
6373	\N	\N	STY	Salto	-31.4366659999999989	-57.9883349999999993
6374	\N	\N	SUG	Surigao	9.75888899999999992	125.479163999999997
6375	\N	\N	TET	Matundo	-16.1033329999999992	33.6388900000000035
6376	\N	\N	TGH	Tongoa	-16.9036100000000005	168.546660000000003
6377	\N	\N	TVU	Matei	-16.6930559999999986	179.874159999999989
6378	\N	\N	UAH	Ua Huka	-8.9333329999999993	-139.550000000000011
6379	\N	\N	UGI	Uganik	57.8833300000000008	-153.5
6380	\N	\N	VTZ	Vishakhapatnam	17.7281510000000004	83.2267499999999956
6381	\N	\N	WIC	Wick	58.456944	-3.08666699999999983
6382	\N	\N	YYZ	Lester B. Pearson International	43.6815830000000034	-79.6114599999999939
6383	\N	\N	NLP	Nelspruit Airport	-25.5008340000000011	30.9138890000000011
6384	\N	\N	HRI	Mattala Rajapaksa International Airport	0	0
6385	\N	\N	SUH	Sur	22.5333329999999989	59.4833339999999993
6386	\N	\N	SUI	Babusheri	42.8666699999999992	41.1166699999999992
6387	\N	\N	SUJ	Satu Mare	47.7000000000000028	22.8833330000000004
6388	\N	\N	SUK	Samcheok	37.4944460000000035	129.136950000000013
6389	\N	\N	SUL	Sui	28.6488900000000015	69.1724999999999994
6390	\N	\N	SUM	Sumter Municipal Airport	33.8999999999999986	-80.1166699999999992
6391	\N	\N	SUN	Sun Valley	43.5064700000000002	-114.300820000000002
6392	\N	\N	SUO	Sun River	43.9166680000000014	-121.5
6393	\N	\N	SUP	Trunojoyo	-7.06666699999999981	113.933334000000002
6394	\N	\N	SUQ	Sucua	-2.46666700000000017	-78.1666639999999973
6395	\N	\N	SUS	Spirit Of St Louis	38.75	-90.3666699999999992
6396	\N	\N	SUT	Sumbawanga	-7.96666700000000017	31.6166669999999996
6397	\N	\N	SUU	Travis AFB	38.2625000000000028	-121.926940000000002
6398	\N	\N	SUW	Richard I Bong Airport	46.6911130000000014	-92.1033299999999997
6399	\N	\N	SUX	Sioux Gateway	42.4019430000000028	-96.3841699999999975
6400	\N	\N	SUZ	Suria	-9.13333300000000037	147.599999999999994
6401	\N	\N	SVC	Grant County	32.6319429999999997	-108.153890000000004
6402	\N	\N	SVD	E. T. Joshua	13.1460399999999993	-61.2103800000000007
6403	\N	\N	SVE	Susanville	40.4166680000000014	-120.650000000000006
6404	\N	\N	SVF	Save	8.03333300000000072	2.48333300000000001
6405	\N	\N	SVH	Statesville Municipal	35.7833329999999989	-80.8833300000000008
6406	\N	\N	SVK	Silver Creek	16.7253000000000007	-88.3400000000000034
6407	\N	\N	SVL	Savonlinna	61.9500000000000028	28.9499999999999993
6408	\N	\N	SVN	Hunter AAF	32.0833319999999986	-81.0999999999999943
6409	\N	\N	SVQ	San Pablo	37.4234769999999983	-5.90013599999999983
6410	\N	\N	SVS	Stevens Village	66.0094449999999995	-149.094159999999988
6411	\N	\N	SVT	Savuti	-18.6333330000000004	24.0833319999999986
6412	\N	\N	SVU	Savusavu	-16.7988280000000003	179.339130000000011
6413	\N	\N	SVV	San Salvador De	7	-62
6414	\N	\N	SVW	Sparrevohn AFS	61.0974999999999966	-155.572219999999987
6415	\N	\N	SVY	Savo	-9.13333300000000037	159.800000000000011
6416	\N	\N	SVZ	San Antonio	7.84305599999999981	-72.438059999999993
6417	\N	\N	SWA	Shantou	23.4302370000000018	116.758589999999998
6418	\N	\N	SWB	Shaw River	-21.5166660000000007	119.366669999999999
6419	\N	\N	SWC	Stawell	-37.0666659999999979	142.766660000000002
6420	\N	\N	SWD	Seward	60.1333300000000008	-149.418059999999997
6421	\N	\N	SWE	Siwea	-6.28333299999999983	147.550000000000011
6422	\N	\N	SWG	Satwag	-6.16666700000000034	147.300000000000011
6423	\N	\N	SWH	Swan Hill	-35.3833300000000008	143.616669999999999
6424	\N	\N	SWJ	South West Bay	-16.25	167.166670000000011
6425	\N	\N	SWL	Spanish Wells	25.5399999999999991	-76.75
6426	\N	\N	SWM	Suia-Missu	-11.2166669999999993	-53.25
6427	\N	\N	SWN	Sahiwal	30.75	73.1333300000000008
6428	\N	\N	SWO	Searcy Field	36.1588899999999995	-97.0855559999999969
6429	\N	\N	SWP	Swakopmund	-22.6833320000000001	14.5666670000000007
6430	\N	\N	SWQ	Brang Bidji	-8.5	117.416663999999997
6431	\N	\N	SWR	Silur	-4.53333299999999983	153.050000000000011
6432	\N	\N	SWS	Fairwood Comm	51.6333300000000008	-3.95000000000000018
6433	\N	\N	SWT	Strzhewoi	60.5	77
6434	\N	\N	SWU	Suwon	37.2833329999999989	127.016670000000005
6435	\N	\N	SWV	Shikarpur	27.9499999999999993	68.6333300000000008
6436	\N	\N	SWW	Sweetwater	32.4666670000000011	-100.400000000000006
6437	\N	\N	SWX	Shakawe	-18.3833330000000004	21.8333319999999986
6438	\N	\N	SWY	Sitiawan	4.21666700000000017	100.700000000000003
6439	\N	\N	SXA	Sialum	-6.03333299999999983	147.616669999999999
6440	\N	\N	SXB	Entzheim	48.5448760000000021	7.62767399999999984
6441	\N	\N	SXC	Avalo Vor/WP	33.5	-118.416663999999997
6442	\N	\N	SXE	Sale	-38.1666680000000014	147
6443	\N	\N	SXG	Senanga	-16.1194440000000014	23.2819439999999993
6444	\N	\N	SXH	Sehulea	-9.98333300000000001	151.183330000000012
6445	\N	\N	SXI	Sirri Island	25.9166680000000014	54.5333329999999989
6446	\N	\N	SXJ	Shanshan	42.8166659999999979	90.2333299999999952
6447	\N	\N	SXK	Saumlaki	-7.96666700000000017	131.316669999999988
6448	\N	\N	SXL	Sligo	54.2833329999999989	-8.46666699999999928
6449	\N	\N	SXN	Suapan	-20.5500000000000007	26.1166669999999996
6450	\N	\N	SXP	Sheldon SPB	62.5333329999999989	-164.833329999999989
6451	\N	\N	SXQ	Soldotna	60.4755549999999999	-151.036390000000011
6452	\N	\N	SXR	Srinagar	34.0023079999999993	74.7626340000000056
6453	\N	\N	SXS	Sahabat 16	5.08972200000000008	119.091669999999993
6454	\N	\N	SXT	Taman Negara	4.33055599999999963	102.39667
6455	\N	\N	SXU	Soddu	6.83611099999999983	37.7749999999999986
6456	\N	\N	SXV	Salem	11.6500000000000004	78.1666639999999973
6457	\N	\N	SXW	Sauren	-5.97138900000000028	148.95304999999999
6458	\N	\N	SXX	Sao Felix Do Xingu	-6.63333300000000037	-51.9833339999999993
6459	\N	\N	SXY	Sidney	42.3166659999999979	-75.4000000000000057
6460	\N	\N	SXZ	Siirt	37.9799999999999969	41.8400000000000034
6461	\N	\N	SYA	Shemya AFB	52.7175000000000011	174.089449999999999
6462	\N	\N	SYC	Shiringayoc	-11.9000000000000004	-69.1666639999999973
6463	\N	\N	SYD	Kingsford Smith	-33.9329219999999978	151.179900000000004
6464	\N	\N	SYE	Sadah	16.8666669999999996	43.6166699999999992
6465	\N	\N	SYF	Silva Bay	49.1499999999999986	-123.697220000000002
6466	\N	\N	SYH	Syangboche	27.8099999999999987	86.7099999999999937
6467	\N	\N	SYI	Bomar Field	35.5608330000000024	-86.4424999999999955
6468	\N	\N	SYK	Stykkisholmur	65.0999999999999943	-22.8000000000000007
6469	\N	\N	SYL	Roberts AAF	35.75	-120.700000000000003
6470	\N	\N	SYN	Carleton	32.1333300000000008	-101.799999999999997
6471	\N	\N	SYP	Santiago	8.09999999999999964	-80.9833299999999952
6472	\N	\N	SYQ	Tobias Bolaños International	9.94999999999999929	-84.1333300000000008
6473	\N	\N	SYS	Yeosu	34.8338899999999967	127.61694
6474	\N	\N	SYT	Charolais Bourgogne S.	46.3999999999999986	4.03333299999999983
6475	\N	\N	SYU	Warraber Island	-10.2083329999999997	142.816669999999988
6476	\N	\N	SYV	Sylvester	31.5166660000000007	-83.8333360000000027
6477	\N	\N	SYW	Sehwen Sharif	26.4166680000000014	67.8499999999999943
6478	\N	\N	SYX	Fenghuang International (Phoenix International)	18.3106299999999997	109.409706
6479	\N	\N	SYY	Stornoway	58.2136270000000025	-6.32199500000000025
6480	\N	\N	SYZ	Shahid Dastghaib International	29.5461300000000016	52.589970000000001
6481	\N	\N	SZC	Guanacaste	10.2547219999999992	-85.5841700000000003
6482	\N	\N	SZE	Semera Airport	11.5	41.0833319999999986
6483	\N	\N	SZF	Carsamba	41.2573799999999977	36.5550580000000025
6484	\N	\N	SZG	W. A. Mozart	47.7912249999999972	12.9973310000000009
6485	\N	\N	SZH	Senipah	-0.966667000000000054	117.133330000000001
6486	\N	\N	SZI	Zaisan	47.7000000000000028	84.8666699999999992
6487	\N	\N	SZJ	Siguanea	21.6333330000000004	-82.9500000000000028
6488	\N	\N	SZK	Skukuza	-24.9624999999999986	31.5861109999999989
6489	\N	\N	SZL	Whiteman AFB	38.7666660000000007	-93.7333299999999952
6490	\N	\N	SZM	Sesriem	-24.5833319999999986	15.8333329999999997
6491	\N	\N	SZN	Santa Cruz Island	34.0605550000000008	-119.915000000000006
6492	\N	\N	SZP	Oxnard	34.3500000000000014	-119.066665999999998
6493	\N	\N	SZQ	Saenz Pena	-34.6166699999999992	-58.5333329999999989
6494	\N	\N	SZR	Stara Zagora	42.4333340000000021	25.6166669999999996
6495	\N	\N	SZS	Stewart Island	-47	167.866669999999999
6496	\N	\N	SZT	San Cristobal Airport	16.6905560000000008	-92.544169999999994
6497	\N	\N	SZU	Segou	13.4333329999999993	-6.28333299999999983
6498	\N	\N	SZV	Suzhou	31.3000000000000007	120.633330000000001
6499	\N	\N	SZW	Parchim Airport	53.4333340000000021	11.7833330000000007
6500	\N	\N	SZY	Mazury	52.4361099999999993	20.9383340000000011
6501	\N	\N	TAA	Tarapaina	-9.40000000000000036	161.349999999999994
6502	\N	\N	TAC	D.Z. Romualdez	11.2268399999999993	125.025919999999999
6503	\N	\N	TAD	Las Animas	37.3055570000000003	-104.325000000000003
6504	\N	\N	TAF	Tafaraoui	35.6277770000000018	-0.610555999999999988
6505	\N	\N	TAH	Tanna	-19.4584450000000011	169.22820999999999
6506	\N	\N	TAJ	Tadji	-3.18333300000000019	142.416670000000011
6507	\N	\N	TAK	Takamatsu	34.2190170000000009	134.018249999999995
6508	\N	\N	TAL	Ralph Calhoun	65.1749999999999972	-152.108059999999995
6509	\N	\N	TAN	Tangalooma	-27.0833319999999986	153.25
6510	\N	\N	TAO	Qingdao	36.2658839999999998	120.382360000000006
6511	\N	\N	TAP	Tapachula International	14.9097220000000004	-92.2530600000000049
6512	\N	\N	TAQ	Tarcoola	-30.6833320000000001	134.550000000000011
6513	\N	\N	TAR	M. A. Grottag	40.5177759999999978	17.4019429999999993
6514	\N	\N	TAS	Tashkent International	41.2627140000000026	69.2661899999999946
6515	\N	\N	TAT	Poprad/Tatry	49.0719449999999995	20.240278
6516	\N	\N	TAU	Tauramena	5	-72.7333299999999952
6517	\N	\N	TAV	Tau Island Airport	-14.25	-169.449999999999989
6518	\N	\N	TAW	Tacuarembo	-31.75	-55.9166680000000014
6519	\N	\N	TAX	Taliabu	-1.76666699999999999	124.799999999999997
6520	\N	\N	TAZ	Dashoguz	41.8333319999999986	59.9666670000000011
6521	\N	\N	TBA	Tabibuga	-5.54999999999999982	144.633330000000001
6522	\N	\N	TBB	Dong Tac	13.0441669999999998	109.33972
6523	\N	\N	TBC	Tuba City	36.1333300000000008	-111.233329999999995
6524	\N	\N	TBD	Timbiqui	2.76666699999999999	-77.7000000000000028
6525	\N	\N	TBE	Timbunke	-4.20000000000000018	143.516660000000002
6526	\N	\N	TBF	Tabiteuea North	-1.23194399999999993	174.780000000000001
6527	\N	\N	TBG	Tabubil	-5.27472199999999969	141.227000000000004
6528	\N	\N	TBH	Romblon	12.3161199999999997	122.080560000000006
6529	\N	\N	TBJ	Tabarka	36.9783329999999992	8.87638899999999964
6530	\N	\N	TBK	Timber Creek	-15.6500000000000004	130.483339999999998
6531	\N	\N	TBL	Tableland	-17.3000000000000007	126.833336000000003
6532	\N	\N	TBM	Tumbang Samba	-3.25	112.583336000000003
6533	\N	\N	TBO	Tabora	-5.07249999999999979	32.8374999999999986
6534	\N	\N	TBQ	Tarabo	12.3000000000000007	22.75
6535	\N	\N	TBR	Statesboro-Bulloch County Airport	32.4902760000000015	-81.7355600000000067
6536	\N	\N	TBS	Novo Alexeyevka International	41.6740649999999988	44.9589580000000026
6537	\N	\N	TBT	Internacional	-4.23333300000000001	-69.9333340000000021
6538	\N	\N	TBU	Fua'amotu International	-21.2411700000000003	-175.141310000000004
6539	\N	\N	TBV	Tabal	10.0388889999999993	169.947219999999987
6540	\N	\N	TBW	Tambov	52.7166670000000011	41.4333340000000021
6541	\N	\N	TBY	Tsabong	-26.0666679999999999	22.4666670000000011
6542	\N	\N	TCA	Tennant Creek	-19.6380559999999988	134.180829999999986
6543	\N	\N	TCC	Tucumcari	35.1666680000000014	-103.733329999999995
6544	\N	\N	TCE	Tulcea	45.1833340000000021	28.8166679999999999
6545	\N	\N	TCF	Tocoa	15.6588890000000003	-85.9947200000000009
6546	\N	\N	TCH	Tchibanga	-2.81666699999999981	11
6547	\N	\N	TCJ	Torembi Airport	-4.01666699999999999	143.133330000000001
6548	\N	\N	TCK	Tinboli Airport	-4.08333299999999966	143.383330000000001
6549	\N	\N	TCL	Van De Graaf	33.221110000000003	-87.6108300000000071
6550	\N	\N	TCM	McChord AFB	47.1766659999999973	-122.564610000000002
6551	\N	\N	TCN	Tehuacan	18.4997219999999984	-97.4177799999999934
6552	\N	\N	TCP	Taba International	29.5500000000000007	34.9166680000000014
6553	\N	\N	TCR	Tuticorin	8.71666699999999928	78.0333300000000065
6554	\N	\N	TCS	Truth or Consequences	33.1333300000000008	-107.25
6555	\N	\N	TCU	Thaba Nchu	-29.2833329999999989	26.8666669999999996
6556	\N	\N	TCW	Tocumwal	-35.8166659999999979	145.599999999999994
6557	\N	\N	TCX	Tabas	33.6799999999999997	56.9013899999999992
6558	\N	\N	TCY	Terrace Bay	-19.9833339999999993	13
6559	\N	\N	TDA	Trinidad	5.42361100000000018	-71.7244400000000013
6560	\N	\N	TDB	Tetabedi	-8.99722200000000072	148.433330000000012
6561	\N	\N	TDD	Trinidad	-14.8226130000000005	-64.9193099999999959
6562	\N	\N	TDG	Tandag	9.5	126.008330000000001
6563	\N	\N	TDJ	Tadjoura	11.7833330000000007	42.8999999999999986
6564	\N	\N	TDK	Taldy-Kurgan	45.1499999999999986	78.4333340000000021
6565	\N	\N	TDL	Tandil	-37.3333319999999986	-59.0833319999999986
6566	\N	\N	TDN	Theda Station	-14.75	126.516670000000005
6567	\N	\N	TDO	Winlock	46.4333340000000021	-122.849999999999994
6568	\N	\N	TDR	Theodore	-24.9833339999999993	150.083329999999989
6569	\N	\N	TDV	Tanandava	-21.6999999999999993	43.7333339999999993
6570	\N	\N	TDW	Tradewind	35.2166670000000011	-101.833336000000003
6571	\N	\N	TDX	Trat	12.2739530000000006	102.318669999999997
6572	\N	\N	TDZ	Toledo	41.6499999999999986	-83.5499999999999972
6573	\N	\N	TEA	Tela	15.7716670000000008	-87.4877800000000008
6574	\N	\N	TEB	Teterboro	40.8497240000000019	-74.062224999999998
6575	\N	\N	TEC	Telemaco Borba	-24.3158320000000003	-50.6516700000000029
6576	\N	\N	TED	Thisted	57.0722239999999985	8.70333300000000065
6577	\N	\N	TEF	Telfer	-21.7130569999999992	122.212220000000002
6578	\N	\N	TEG	Tenkodogo	11.9000000000000004	-0.316666999999999976
6579	\N	\N	TEH	Tetlin	63.1333300000000008	-142.516660000000002
6580	\N	\N	TEI	Tezu	27.9499999999999993	96.1333300000000008
6581	\N	\N	TEK	Tatitlek	60.8666699999999992	-146.683330000000012
6582	\N	\N	TEL	Telupid	5.58333299999999966	117.116669999999999
6583	\N	\N	TEM	Temora	-34.4166680000000014	147.5
6584	\N	\N	TEN	Tongren	27.8836900000000014	109.299019999999999
6585	\N	\N	TEO	Terapo	-8.08333299999999966	146.066669999999988
6586	\N	\N	TEP	Teptep	-5.84999999999999964	146.5
6587	\N	\N	TER	Lajes Ab	38.7540740000000028	-27.0875699999999995
6588	\N	\N	TES	Tessenei	15.1166669999999996	36.6833340000000021
6589	\N	\N	TEU	Manapouri	-45.4194450000000032	167.726400000000012
6590	\N	\N	TEX	Telluride Regional	37.9333340000000021	-107.816665999999998
6591	\N	\N	TEY	Thingeyri	65.8833300000000008	-23.4499999999999993
6592	\N	\N	TEZ	Salonibari	26.7108330000000009	92.7961099999999988
6593	\N	\N	TFB	Tifalmin	-5.1183329999999998	141.41776999999999
6594	\N	\N	TFF	Tefe	-3.36666700000000008	-64.7000000000000028
6595	\N	\N	TFL	Teofilo Otoni	-17.8500000000000014	-41.5
6596	\N	\N	TFM	Telefomin	-5.18333300000000019	141.633330000000001
6597	\N	\N	TFR	Ramadan	30.1174999999999997	31.4008329999999987
6598	\N	\N	TFT	Taftan	28.5833319999999986	61.3666699999999992
6599	\N	\N	TGB	Tagbita	1.4166669999999999	126.783330000000007
6600	\N	\N	TGD	Golubovci	42.3680230000000009	19.246023000000001
6601	\N	\N	TGE	Sharpe Field	32.4666670000000011	-85.6833340000000021
6602	\N	\N	TGG	Sultan Mahmood	5.38050400000000018	103.10642
6603	\N	\N	TGI	Tingo Maria	-9.30000000000000071	-76.0166700000000048
6604	\N	\N	TGJ	Tiga	-21.0983580000000011	167.802930000000003
6605	\N	\N	TGL	Tagula	-11.5	153.5
6606	\N	\N	TGM	Transilvania	46.5333329999999989	24.5333329999999989
6607	\N	\N	TGN	La Trobe Regional	-38.2000000000000028	146.566669999999988
6608	\N	\N	TGO	Tongliao	43.5570099999999982	122.204605000000001
6609	\N	\N	TGQ	Tangara da Serra	-14.6563890000000008	-57.4486119999999971
6610	\N	\N	TGR	Touggourt	33.0583340000000021	6.08472200000000019
6611	\N	\N	TGS	Chokwe	-24.6166669999999996	32.4166680000000014
6612	\N	\N	TGT	Tanga	-5.0894440000000003	39.0702799999999968
6613	\N	\N	TGU	Toncontin	14.0601230000000008	-87.2197199999999953
6614	\N	\N	THA	Tullahoma/William Northern Field	35.3666699999999992	-86.1833340000000021
6615	\N	\N	THB	Thaba-Tseka	-28.8333319999999986	29.5
6616	\N	\N	THC	Tchien	6.06666699999999981	-8.13333300000000037
6617	\N	\N	THG	Thangool	-24.5	150.566669999999988
6618	\N	\N	THH	Taharoa	-38.2000000000000028	174.71665999999999
6619	\N	\N	THI	Tichitt	18.4499999999999993	-9.5
6620	\N	\N	THK	Thakhek	17.3999999999999986	104.816665999999998
6621	\N	\N	THL	Tachilek	20.4499999999999993	99.9500000000000028
6622	\N	\N	THM	Thompsonfield	39.1833340000000021	-91.9833299999999952
6623	\N	\N	THN	Trollhattan	58.2666660000000007	12.3000000000000007
6624	\N	\N	THO	Thorshofn	66.2000000000000028	-15.3333329999999997
6625	\N	\N	THP	Hot Springs	43.6499999999999986	-108.216669999999993
6626	\N	\N	THR	Mehrabad (Qualeh Morgeh)	35.6915320000000023	51.321869999999997
6627	\N	\N	THS	Sukhothai	17.2230570000000007	99.8222200000000015
6628	\N	\N	THT	Tamchakett	17.2333339999999993	-10.8166670000000007
6629	\N	\N	THV	York Airport	39.9500000000000028	-76.7166699999999935
6630	\N	\N	THY	Thohoyandou	-22.8833330000000004	30.5500000000000007
6631	\N	\N	THZ	Tahoua	14.8727780000000003	5.26388899999999982
6632	\N	\N	TIA	Rinas Mother Teresa	41.4191319999999976	19.713280000000001
6633	\N	\N	TIB	Tibu	8.63333300000000037	-72.7333299999999952
6634	\N	\N	TIC	Tinak Island	7.04999999999999982	171.78334000000001
6635	\N	\N	TID	Bouchekif Abde Al-hafidh Boussof	35.4666670000000011	1.35000000000000009
6636	\N	\N	TIE	Tippi	7.20111100000000004	35.4152800000000028
6637	\N	\N	TIG	Tingwon	-2.60000000000000009	149.78334000000001
6638	\N	\N	TIH	Tikehau Atoll	-15.1186389999999999	-148.233800000000002
6639	\N	\N	TIK	Tinker AFB	35.4166680000000014	-97.3833300000000008
6640	\N	\N	TIL	Inverlake	50.5	-1.03000000000000003
6641	\N	\N	TIM	Timika	-4.52566600000000019	136.887480000000011
6642	\N	\N	TIO	Tilin	20	96
6643	\N	\N	TIP	International	32.6698900000000023	13.1442789999999992
6644	\N	\N	TIQ	Tinian International	14.9943190000000008	145.626339999999999
6645	\N	\N	TIR	Tirupati	13.6357210000000002	79.5429299999999984
6646	\N	\N	TIS	Thursday Island	-10.5	142.050000000000011
6647	\N	\N	TIU	Timaru	-44.303448000000003	171.226319999999987
6648	\N	\N	TIW	Industrial	47.2705569999999966	-122.573059999999998
6649	\N	\N	TIX	Space Coast Regional	28.5122220000000013	-80.7994460000000032
6650	\N	\N	TIY	Tidjikja	18.5666679999999999	-11.4166670000000003
6651	\N	\N	TJB	Tanjung Balai	2.9166669999999999	99.7333299999999952
6652	\N	\N	TJC	Ticantiki	9.40833300000000072	-78.4888899999999978
6653	\N	\N	TJG	Tanjung Warukin	-1.39999999999999991	103.966669999999993
6654	\N	\N	TJH	Tajima	35.5091669999999979	134.789719999999988
6655	\N	\N	TJI	Capiro	15.9258330000000008	-85.9394450000000063
6656	\N	\N	TJK	Tokat	40.3022229999999979	36.3677800000000033
6657	\N	\N	TJM	Roschino	57.181828000000003	65.3502399999999994
6658	\N	\N	TJN	Takume	-15.8505559999999992	-142.266940000000005
6659	\N	\N	TJQ	Bulutumbang	-2.75	107.650000000000006
6660	\N	\N	TJV	Thanjavur	10.8000000000000007	79.2000000000000028
6661	\N	\N	TKA	Talkeetna	62.3222239999999985	-150.090000000000003
6662	\N	\N	TKB	Tekadu	-7.66666700000000034	146.550000000000011
6663	\N	\N	TKC	Tiko	4.11666699999999963	9.33333299999999966
6664	\N	\N	TKD	Takoradi	4.89166699999999999	-1.77499999999999991
6665	\N	\N	TKE	Tenakee SPB	57.7833329999999989	-135.21665999999999
6666	\N	\N	TKF	Truckee-Tahoe	39.3250000000000028	-120.141670000000005
6667	\N	\N	TKG	Branti	-5.24278300000000019	105.175799999999995
6668	\N	\N	TKH	Nakhon Sawan	15.25	100.349999999999994
6669	\N	\N	TKI	Tokeen	55.9375	-133.324999999999989
6670	\N	\N	TKK	Truk	7.45744600000000002	151.842009999999988
6671	\N	\N	TKL	Taku SPB	58	-134
6672	\N	\N	TKM	El Peten	17.2263890000000011	-89.605000000000004
6673	\N	\N	TKN	Tokunoshima	27.8333319999999986	128.883330000000001
6674	\N	\N	TKO	Tlokoeng	-29.2333339999999993	28.8833330000000004
6675	\N	\N	TKP	Takapoto	-15.4499999999999993	-145.141660000000002
6676	\N	\N	TKQ	Kigoma	-4.88499999999999979	29.6700000000000017
6677	\N	\N	TKR	Thakurgaon	26.0166660000000007	88.4000000000000057
6678	\N	\N	TKS	Tokushima	34.1390230000000017	134.594830000000002
6679	\N	\N	TKT	Tak	16.8783320000000003	99.1522199999999998
6680	\N	\N	TKV	Tatakoto	-17.2833329999999989	-138.333329999999989
6681	\N	\N	TKW	Tekin	-5.25	142.150000000000006
6682	\N	\N	TKY	Turkey Creek	-17.0666679999999999	128.25
6683	\N	\N	TKZ	Tokoroa	-38.2166670000000011	175.833329999999989
6684	\N	\N	TLB	Tarbela	34.1333300000000008	72.8166659999999979
6685	\N	\N	TLD	Limpopo Valley	-22.1833320000000001	29.1166669999999996
6686	\N	\N	TLF	Telida	63.6666680000000014	-152.5
6687	\N	\N	TLG	Tulagi Island	-9.09999999999999964	160.150000000000006
6688	\N	\N	TLI	Tolitoli	1.03333300000000006	120.816665999999998
6689	\N	\N	TLJ	Tatalina AFS	62.8852770000000021	-155.968060000000008
6690	\N	\N	TLO	Tol	-4.98333300000000001	152.03334000000001
6691	\N	\N	TLP	Tumolbil	-4.78333299999999983	141.016660000000002
6692	\N	\N	TLR	Mefford Field	36.2166670000000011	-119.349999999999994
6693	\N	\N	TLS	Blagnac	43.6300700000000035	1.3743209999999999
6694	\N	\N	TLU	Tolu	9.51666699999999999	-75.5833360000000027
6695	\N	\N	TLV	Ben Gurion International	32.0004539999999977	34.8707429999999974
6696	\N	\N	TLW	Talasea	-5.36666699999999963	150.016660000000002
6697	\N	\N	TLX	Talca	-35.4666670000000011	-71.6666639999999973
6698	\N	\N	TLZ	Catalao	-18.1666680000000014	-47.9500000000000028
6699	\N	\N	TMA	Henry Tift Myers	31.4333320000000001	-83.4833299999999952
6700	\N	\N	TMB	Tamiami	25.6499999999999986	-80.4333340000000021
6701	\N	\N	TMC	Tjilik Riwut	-9.34027799999999964	119.183059999999998
6702	\N	\N	TMD	Timbedra	16.2366680000000017	-8.15416699999999928
6703	\N	\N	TME	Tame	6.5	-71.7666700000000048
6704	\N	\N	TMG	Tomanggong	5.40000000000000036	118.650000000000006
6705	\N	\N	TMH	Tanahmerah	-6.08333299999999966	140.266660000000002
6706	\N	\N	TMI	Tumling Tar	27.3000000000000007	87.2000000000000028
6707	\N	\N	TMK	Tamky	15.5666670000000007	108.483329999999995
6708	\N	\N	TML	Tamale	9.40694399999999931	-0.879167000000000032
6709	\N	\N	TMN	Tamana Island	-2.48333300000000001	175.983339999999998
6710	\N	\N	TMO	Tumeremo	7.29999999999999982	-61.5
6711	\N	\N	TMP	Tampere-pirkkala	61.4204500000000024	23.6175630000000005
6712	\N	\N	TMQ	Tambao	14.7833330000000007	0.0833330000000000043
6713	\N	\N	TMS	Sao Tome Island	0.378332999999999975	6.72499999999999964
6714	\N	\N	TMT	Trombetas	-1.9166669999999999	-55.5833319999999986
6715	\N	\N	TMU	Tambor	9.73333300000000001	-85.0166700000000048
6716	\N	\N	TMW	Tamworth Regional Airport	-31.0844999999999985	150.848500000000001
6717	\N	\N	TMX	Timimoun	29.2333339999999993	0.283333000000000002
6718	\N	\N	TMY	Tiom	-3.95000000000000018	138.416670000000011
6719	\N	\N	TMZ	Thames	-37.1166699999999992	175.566669999999988
6720	\N	\N	TNA	Jinan	36.8576899999999981	117.206879999999998
6721	\N	\N	TNB	Tanah Grogot	-1.9166669999999999	116.200000000000003
6722	\N	\N	TNC	Tin City Afs	65.5638900000000007	-167.918880000000001
6723	\N	\N	TND	Trinidad	21.8000000000000007	-80
6724	\N	\N	TNE	Tanegashima	30.5411110000000008	130.954160000000002
6725	\N	\N	TNF	Toussus-le-noble	48.7508300000000006	2.11305599999999982
6726	\N	\N	TNG	Boukhalef	35.7262879999999967	-5.91289800000000021
6727	\N	\N	TNH	Tonghua Liuhe	41.75	125.950000000000003
6728	\N	\N	TNI	Satna	24.5643250000000002	80.8518100000000004
6729	\N	\N	TNJ	Kidjang	0.919166999999999956	104.536109999999994
6730	\N	\N	TNL	Ternopol	49.5666659999999979	25.6000000000000014
6731	\N	\N	TNM	Teniente R. Marsh Martin	-62.1905560000000008	-58.9863900000000001
6732	\N	\N	TNO	Tamarindo	10.3140330000000002	-85.8154750000000064
6733	\N	\N	TNP	Twentynine Palms	34.1188900000000004	-115.935000000000002
6734	\N	\N	TNQ	Teraina	4.70000000000000018	-160.333329999999989
6735	\N	\N	TNS	Tungsten	62	-127.666663999999997
6736	\N	\N	TNU	Newton Municipal Airport	41.7000000000000028	-93.0499999999999972
6737	\N	\N	TNV	Tabuaeran	3.8333330000000001	-159.349999999999994
6738	\N	\N	TNX	Stung Treng	13.5333330000000007	106.033330000000007
6739	\N	\N	TNZ	Tosontsengel	48.7397229999999979	98.2752760000000052
6740	\N	\N	TOA	Torrance Airport	33.8333319999999986	-118.316665999999998
6741	\N	\N	TOC	Toccoa RG Letourneau Field	34.5833319999999986	-83.3166659999999979
6742	\N	\N	TOF	Tomsk	56.5	84.9666699999999935
6743	\N	\N	TOH	Torres Airstrip	-13.1666670000000003	166.75
6744	\N	\N	TOI	Troy Municipal Airport	31.8000000000000007	-85.9666699999999935
6745	\N	\N	TOJ	Torrejon AFB	40.4555549999999968	-3.54666699999999979
6746	\N	\N	TOK	Torokina	-6.23333300000000001	155.333329999999989
6747	\N	\N	TOL	Toledo Express	41.5925000000000011	-83.8068999999999988
6748	\N	\N	TOM	Tombouctou	16.7322220000000002	-3.00527800000000012
6749	\N	\N	TON	Tonu	-6.34999999999999964	155.59165999999999
6750	\N	\N	TOO	San Vito	8.83333299999999966	-82.9666699999999935
6751	\N	\N	TOP	Philip Billard	39.0697199999999967	-95.6225000000000023
6752	\N	\N	TOQ	Barriles	-22.1361099999999986	-70.0613859999999988
6753	\N	\N	TOR	Torrington Municipal Airport	42.0666659999999979	-104.183334000000002
6754	\N	\N	TOS	Tromso/langnes	69.6798299999999955	18.9073430000000009
6755	\N	\N	TOT	Coronie	5.88333300000000037	-56.3166659999999979
6756	\N	\N	TOW	Toledo	-24.6986099999999986	-53.6961099999999973
6757	\N	\N	TOX	Tobolsk	58.1333300000000008	68.2333299999999952
6758	\N	\N	TOZ	Touba	8.28333300000000072	-7.68333300000000019
6759	\N	\N	TPA	Tampa International	27.9798699999999982	-82.5354159999999979
6760	\N	\N	TPC	Tarapoa	-1.4166669999999999	-76.7833300000000065
6761	\N	\N	TPG	Taiping	4.84999999999999964	100.733329999999995
6762	\N	\N	TPH	Tonopah Airport	38.0666659999999979	-117.233329999999995
6763	\N	\N	TPI	Tapini	-8.36666699999999963	146.983339999999998
6764	\N	\N	TPJ	Taplejung Suketar	27.3500000000000014	87.6833340000000021
6765	\N	\N	TPK	Tapaktuan	3.26666699999999999	97.1833340000000021
6766	\N	\N	TPL	Draughon-miller Central Texas Regional	31.1502780000000001	-97.4091640000000041
6767	\N	\N	TPN	Tiputini	-0.766666999999999987	-75.5333300000000065
6768	\N	\N	TPO	Tanalian Point	60.1666680000000014	-154.333329999999989
6769	\N	\N	TPP	Tarapoto	-6.51111099999999965	-76.398610000000005
6770	\N	\N	TPR	Tom Price	-22.75	117.666663999999997
6771	\N	\N	TPT	Tapeta	6.48333300000000001	-8.86666699999999963
6772	\N	\N	TPU	Tikapur	28.5500000000000007	81.1916659999999979
6773	\N	\N	TPX	Tupai	-16.2833329999999989	-151.833329999999989
6774	\N	\N	TQN	Taluqan	36.7666660000000007	69.5333300000000065
6775	\N	\N	TQS	Tres Esquinas	0.733333000000000013	-75.2333299999999952
6776	\N	\N	TRA	Tarama	24.6499999999999986	124.700000000000003
6777	\N	\N	TRB	Gonzalo	8.07833300000000065	-76.7480549999999937
6778	\N	\N	TRC	Francisco Sarabia	25.5630659999999992	-103.398740000000004
6779	\N	\N	TRH	Trona	35.8127799999999965	-117.325835999999995
6780	\N	\N	TRJ	Tarakbits	-5.61666699999999963	141.050000000000011
6781	\N	\N	TRL	Terrell Field	32.735832000000002	-96.2750000000000057
6782	\N	\N	TRM	Thermal	33.6305539999999965	-116.936109999999999
6783	\N	\N	TRN	Sandro Pertini (caselle)	45.1914560000000023	7.64304900000000043
6784	\N	\N	TRQ	Tarauaca	-8.09999999999999964	-70.75
6785	\N	\N	TRR	China Bay	8.53694400000000009	81.1833340000000021
6786	\N	\N	TRS	Ronchi Dei Legionari	45.8207799999999992	13.4856780000000001
6787	\N	\N	TRT	Tremonton	41.7166670000000011	-112.166663999999997
6788	\N	\N	TRU	Trujillo	-8.08999999999999986	-79.1149999999999949
6789	\N	\N	TRW	Bonriki	1.35833300000000001	172.941669999999988
6790	\N	\N	TRX	Memorial	40.0833319999999986	-93.6166699999999992
6791	\N	\N	TRY	Tororo	0.699999999999999956	34.1833340000000021
6792	\N	\N	TRZ	Civil	10.7621680000000008	78.7072399999999988
6793	\N	\N	TSA	Taipei Songshan (Sung Shan)	25.0627899999999997	121.551925999999995
6794	\N	\N	TSB	Tsumeb	-19.2666660000000007	17.7333339999999993
6795	\N	\N	TSC	Taisha	-2.38333299999999992	-77.5
6796	\N	\N	TSD	Tshipise	-22.6166669999999996	30.1666680000000014
6797	\N	\N	TSE	Astana	51.0278100000000023	71.4612000000000052
6798	\N	\N	TSG	Intermediate	63.3500000000000014	-143.5
6799	\N	\N	TSH	Tshikapa	-6.44111100000000025	20.7972220000000014
6800	\N	\N	TSI	Tsili Tsili	-6.84999999999999964	146.349999999999994
6801	\N	\N	TSJ	Tsushima	34.2861499999999992	129.326369999999997
6802	\N	\N	TSK	Taskul	-2.56666699999999981	150.416670000000011
6803	\N	\N	TSL	Tamuin	21.9833339999999993	-98.75
6804	\N	\N	TSM	Taos	36.4591670000000008	-105.675280000000001
6805	\N	\N	TSN	Tianjin Binhai International	39.1226270000000014	117.3399
6806	\N	\N	TSO	Tresco	49.9455570000000009	-6.33138899999999971
6807	\N	\N	TSP	Kern County	35.1375000000000028	-118.441665999999998
6808	\N	\N	TSQ	Torres	-29.3324999999999996	-49.7461130000000011
6809	\N	\N	TSR	Timisoara (traian Vuia) International	45.8099249999999998	21.3201199999999993
6810	\N	\N	TSS	East 34th St Heliport	40.7666660000000007	-74.1666639999999973
6811	\N	\N	TSU	Tabiteuea South	-1.4166669999999999	174.833329999999989
6812	\N	\N	TSV	Townsville International	-19.2565060000000017	146.770800000000008
6813	\N	\N	TSW	Tsewi	-6.96666700000000017	146.03334000000001
6814	\N	\N	TSX	Tanjung Santan	-0.0833330000000000043	117.433334000000002
6815	\N	\N	TSY	Tasikmalaya	-7.29999999999999982	108.200000000000003
6816	\N	\N	TSZ	Tsetserleg	47.7333339999999993	101.766670000000005
6817	\N	\N	TTA	Tan Tan	28.4499999999999993	-11.0833329999999997
6818	\N	\N	TTB	Arbatax	39.9166680000000014	9.6833329999999993
6819	\N	\N	TTC	Taltal	-25.5177779999999998	-70.4222199999999958
6820	\N	\N	TTD	Troutdale	45.8999999999999986	-122.650000000000006
6821	\N	\N	TTG	Tartagal	-22.5333329999999989	-63.8333319999999986
6822	\N	\N	TTH	Thumrait	17.6333330000000004	54
6823	\N	\N	TTI	Tetiaroa Island	-17.0833319999999986	-149.5
6824	\N	\N	TTL	Turtle Island	-16.8333319999999986	179
6825	\N	\N	TTM	Tablon De Tamara	5.71666700000000017	-72.0999999999999943
6826	\N	\N	TTO	Britton Municipal Airport	45.7999999999999972	-97.75
6827	\N	\N	TTQ	Tortuquero	10.5666670000000007	-83.5166700000000048
6828	\N	\N	TTR	Tana Toraja	-3.04256400000000005	119.820939999999993
6829	\N	\N	TTS	Tsaratanana	-16.7333339999999993	47.6000000000000014
6830	\N	\N	TTU	Sania Ramel	35.5833319999999986	-5.31666699999999981
6831	\N	\N	TUC	Benj Matienzo	-26.8333319999999986	-65.2000000000000028
6832	\N	\N	TUD	Tambacounda	13.7361109999999993	-13.6583330000000007
6833	\N	\N	TUE	Tupile	9.57249999999999979	-79.4872199999999935
6834	\N	\N	TUF	St Symphorien	47.4283330000000021	0.727500000000000036
6835	\N	\N	TUG	Tuguegarao	17.6411109999999987	121.731669999999994
6836	\N	\N	TUH	Arnold AFS	35.3666699999999992	-86.2166699999999935
6837	\N	\N	TUJ	Tum	5.83333299999999966	35.5666659999999979
6838	\N	\N	TUK	Turbat International Airport	25.9833339999999993	63.0666659999999979
6839	\N	\N	TUL	Tulsa International	36.1898079999999993	-95.8901000000000039
6840	\N	\N	TUM	Tumut	-35.2999999999999972	148.21665999999999
6841	\N	\N	TUP	Lemons Municipalcipal	34.258890000000001	-88.7672199999999947
6842	\N	\N	TUQ	Tougan	13	-3
6843	\N	\N	TUS	Tucson International Airport	32.1206900000000033	-110.937370000000001
6844	\N	\N	TUT	Tauta	-5.5	145.566669999999988
6845	\N	\N	TUV	Tucupita	9.09166699999999928	-62.0499999999999972
6846	\N	\N	TUW	Tubala	8.83333299999999966	-77.6666639999999973
6847	\N	\N	TUX	Tumbler Ridge	55.1000000000000014	-121.083336000000003
6848	\N	\N	TUY	Tulum	20.2166670000000011	-87.4666699999999935
6849	\N	\N	TUZ	Tucuma	-21.8833330000000004	-50.5
6850	\N	\N	TVA	Morafenobe	-17.8494430000000008	44.9191670000000016
6851	\N	\N	TVI	Thomasville Municipal Airport	30.9024999999999999	-83.8805540000000036
6852	\N	\N	TVL	South Lake Tahoe	38.8941700000000026	-119.994445999999996
6853	\N	\N	TVY	Dawe	14.0999999999999996	98.2000000000000028
6854	\N	\N	TWA	Twin Hills	59.1666680000000014	-159.991669999999999
6855	\N	\N	TWB	Toowoomba	-27.5422210000000014	151.913900000000012
6856	\N	\N	TWD	Port Townsend	48.1166699999999992	-122.766670000000005
6857	\N	\N	TWE	Taylor	65.7333299999999952	-164.849999999999994
6858	\N	\N	TWF	Joslin Field - Magic Valley Regional	42.4819450000000032	-114.486664000000005
6859	\N	\N	TWH	Two Harbors	33.4249999999999972	-118.508330000000001
6860	\N	\N	TWN	Tewantin	-26.3999999999999986	153.050000000000011
6861	\N	\N	TWP	Torwood	-17.3666669999999996	143.75
6862	\N	\N	TWY	Tawa	-7.26666699999999999	146.066669999999988
6863	\N	\N	TWZ	Pukaki/Twizel	-44.2341649999999973	170.117220000000003
6864	\N	\N	TXF	Teixeira de Freitas	-7.13333300000000037	-37.1833340000000021
6865	\N	\N	TXG	Taichung	24.1499999999999986	120.646109999999993
6866	\N	\N	TXK	Texarkana Municipal	33.456389999999999	-93.9891700000000014
6867	\N	\N	TXL	Berlin-tegel / Otto Lilienthal	52.5539440000000013	13.291722
6868	\N	\N	TXM	Teminabuan	-1.43333299999999997	132.016660000000002
6869	\N	\N	TXN	Tunxi	29.7296200000000006	118.256460000000004
6870	\N	\N	TXR	Tanbar	-25.8500000000000014	141.916670000000011
6871	\N	\N	TXU	Tabou	4.43333300000000019	-7.36666699999999963
6872	\N	\N	TYA	Tula	54.2000000000000028	37.6166699999999992
6873	\N	\N	TYB	Tibooburra	-29.456944	142.06223
6874	\N	\N	TYD	Tynda	55.2833329999999989	124.733329999999995
6875	\N	\N	TYE	Tyonek	61.0166660000000007	-151.333329999999989
6876	\N	\N	TYF	Torsby Airport	60.1544839999999965	12.9966100000000004
6877	\N	\N	TYG	Thylungra	-26.0986119999999993	143.455549999999988
6878	\N	\N	TYL	Talara	-4.56472199999999972	-81.2527800000000013
6879	\N	\N	TYM	Staniel Cay	24.1499999999999986	-76.4333340000000021
6880	\N	\N	TYN	Taiyuan	37.754997000000003	112.62585
6881	\N	\N	TYP	Tobermorey	-22.2833329999999989	137.96665999999999
6882	\N	\N	TYR	Tyler Pounds Regional Airport	32.3515969999999982	-95.4101200000000063
6883	\N	\N	TYS	Mc Ghee Tyson	35.80565	-83.9897299999999944
6884	\N	\N	TYT	Treinta-y-Tres	-33.2666660000000007	-54.2833329999999989
6885	\N	\N	TYZ	Taylor	34.4666670000000011	-110.083336000000003
6886	\N	\N	TZA	Municipal	17.5163900000000012	-88.1916659999999979
6887	\N	\N	TZM	Tizimin	21.1666680000000014	-88.1500000000000057
6888	\N	\N	TZN	South Andros	24.1649999999999991	-77.5852799999999974
6889	\N	\N	TZX	Trabzon	40.9941900000000032	39.7816800000000015
6890	\N	\N	UAB	Adana-Incirlik Airbase	37.0002799999999965	35.4183299999999974
6891	\N	\N	UAC	San Luis Rio Colorado	32.4500000000000028	-114.799999999999997
6892	\N	\N	UAE	Mount Aue	-6.23333300000000001	144.650000000000006
6893	\N	\N	UAI	Suai	-9.30000000000000071	125.283330000000007
6894	\N	\N	UAL	Luau	-11	22.5
6895	\N	\N	UAM	Andersen AFB	13.4666669999999993	144.766660000000002
6896	\N	\N	UAQ	San Juan	-31.5500000000000007	-68.5166700000000048
6897	\N	\N	UAS	Samburu	0.466666999999999998	37.5499999999999972
6898	\N	\N	UAX	Uaxactun	17.3938880000000005	-89.6327739999999977
6899	\N	\N	UBA	Uberaba	-19.7763880000000007	-47.9583319999999986
6900	\N	\N	UBB	Mabuiag Island	-9.94999999999999929	142.183330000000012
6901	\N	\N	UBI	Buin	-6.71666700000000017	155.699999999999989
6902	\N	\N	UBP	Muang Ubon	15.2464910000000007	104.870679999999993
6903	\N	\N	UBR	Ubrub	-3.6666669999999999	140.849999999999994
6904	\N	\N	UBS	Lowndes County	33.4666670000000011	-88.3833300000000008
6905	\N	\N	UBT	Ubatuba	-23.4333320000000001	-45.0833319999999986
6906	\N	\N	UBU	Kalumburu	-14.3000000000000007	126.650000000000006
6907	\N	\N	UCA	Oneida County	43.1413879999999992	-75.3802799999999991
6908	\N	\N	UCC	Yucca Flat	37	-116.049999999999997
6909	\N	\N	UCE	Eunice	30.5	-92.4166639999999973
6910	\N	\N	UCK	Lutsk	50.75	25.3333319999999986
6911	\N	\N	UCN	Buchanan	5.95000000000000018	-10.0333330000000007
6912	\N	\N	UCY	Everett-Stewart	36.4333340000000021	-89.0499999999999972
6913	\N	\N	UDA	Undarra	-18.1833320000000001	144.599999999999994
6914	\N	\N	UDD	Bermuda Dunes	33.735832000000002	-116.267219999999995
6915	\N	\N	UDE	Volkel	51.6666680000000014	5.61666699999999963
6916	\N	\N	UDI	Eduardo Gomes	-18.8999999999999986	-48.2333339999999993
6917	\N	\N	UDJ	Uzhgorod	48.6376199999999983	22.2732139999999994
6918	\N	\N	UDN	Airfield	46.0333329999999989	13.1833329999999993
6919	\N	\N	UDO	Udomxay	19.1333330000000004	103.816665999999998
6920	\N	\N	UEE	Queenstown	-42.0833319999999986	145.550000000000011
6921	\N	\N	UEL	Quelimane	-17.8472210000000011	36.8655550000000005
6922	\N	\N	UER	Puertollano	38.7000000000000028	-4.11666699999999963
6923	\N	\N	UES	Waukesha	43.038333999999999	-88.230000000000004
6924	\N	\N	UFA	Ufa International Airport	54.5654030000000034	55.8845439999999982
6925	\N	\N	UGA	Bulgan	48.7999999999999972	103.549999999999997
6926	\N	\N	UGB	Ugashik Bay	57.5522229999999979	-157.551119999999997
6927	\N	\N	UGC	Urgench	41.5848349999999982	60.633029999999998
6928	\N	\N	UGN	Memorial	42.3666699999999992	-87.8333360000000027
6929	\N	\N	UGO	Uige	-7.81666699999999981	15.1500000000000004
6930	\N	\N	UGS	Ugashik	57.5333329999999989	-157.416670000000011
6931	\N	\N	UGT	Umnugobitour	43.7527770000000018	104.127780000000001
6932	\N	\N	UGU	Zugapa	-3.73333300000000001	137.03334000000001
6933	\N	\N	UHE	Kunovice	49.0666659999999979	17.4499999999999993
6934	\N	\N	UIK	Ust-Ilimsk	58.1333300000000008	102.549999999999997
6935	\N	\N	UIL	Quillayute State	47.8999999999999986	-124.633330000000001
6936	\N	\N	UIN	Quincy M Baldwin Field	39.9441679999999977	-91.1972200000000015
6937	\N	\N	UIO	Mariscal Sucre	-0.145527999999999991	-78.4905300000000068
6938	\N	\N	UIQ	Quine Hill	-17	168.166670000000011
6939	\N	\N	UIR	Quirindi	-31.5	150.516660000000002
6940	\N	\N	UIT	Jaluit Island	5.83333299999999966	169.616669999999999
6941	\N	\N	UJE	Ujae Island	9.08333299999999966	165.666670000000011
6942	\N	\N	UKI	Ukiah	39.1266669999999976	-123.200000000000003
6943	\N	\N	UKN	Waukon Municipal Airport	43.2666660000000007	-91.4833299999999952
6944	\N	\N	UKR	Mukeiras	13.9333329999999993	45.6833340000000021
6945	\N	\N	UKS	Belbek	44.6916659999999979	33.576667999999998
6946	\N	\N	UKT	Upper Bucks	40.4333340000000021	-75.3499999999999943
6947	\N	\N	UKU	Nuku	-3.68333300000000019	142.46665999999999
6948	\N	\N	UKX	Ust-Kut	56.8500000000000014	105.733329999999995
6949	\N	\N	ULA	San Julian	-49.3166659999999979	-67.6666639999999973
6950	\N	\N	ULB	Ulei	-16.4166680000000014	168.333329999999989
6951	\N	\N	ULC	Los Cerrillos	-33.4897229999999979	-70.6947250000000054
6952	\N	\N	ULD	Ulundi	-28.2833329999999989	31.4333320000000001
6953	\N	\N	ULE	Sule	-4.93333300000000019	151.266660000000002
6954	\N	\N	ULG	Ulgit	48.9666670000000011	89.9666699999999935
6955	\N	\N	ULI	Ulithi	10.016667	139.800000000000011
6956	\N	\N	ULL	Mull	56.4500000000000028	-6
6957	\N	\N	ULM	New Ulm	44.321390000000001	-94.500559999999993
6958	\N	\N	ULN	Chinggis Khaan International	47.8527500000000003	106.763270000000006
6959	\N	\N	ULQ	Farfan	4.09722200000000036	-76.2291639999999973
6960	\N	\N	ULS	Mulatos	8.65000000000000036	-76.75
6961	\N	\N	ULU	Gulu	2.78333299999999983	32.2999999999999972
6962	\N	\N	ULX	Ulusaba	-24.7833329999999989	31.3500000000000014
6963	\N	\N	UMA	Punta De Maisi	20.2399999999999984	-74.1500000000000057
6964	\N	\N	UMB	North Shore	53.3766669999999976	-167.887499999999989
6965	\N	\N	UMC	Umba	-7.01666699999999999	145.96665999999999
6966	\N	\N	UMD	Uummannaq	70.6688900000000046	-52.1177800000000033
6967	\N	\N	UMI	Quincemil	-13.25	-70.6666639999999973
6968	\N	\N	UMM	Summit	63.3166659999999979	-149.316669999999988
6969	\N	\N	UMR	Woomera	-31.1499999999999986	136.816669999999988
6970	\N	\N	UMT	Umiat	69.4166639999999973	-152.333329999999989
6971	\N	\N	UMU	Ernesto Geisel	-23.7983319999999985	-53.3133300000000006
6972	\N	\N	UMY	Sumy	50.9333340000000021	34.7833329999999989
6973	\N	\N	UNA	Una	-15.3533329999999992	-38.9972229999999982
6974	\N	\N	UNC	Unguia	8.03333300000000072	-77.0833360000000027
6975	\N	\N	UND	Kunduz	36.6605569999999972	68.9091640000000041
6976	\N	\N	UNE	Qachas Nek	-30.1666680000000014	27.1666680000000014
6977	\N	\N	UNG	Kiunga	-6.12555199999999989	141.286010000000005
6978	\N	\N	UNI	Union Island	13.5	-61
6979	\N	\N	UNK	Unalakleet	63.8819269999999975	-160.799440000000004
6980	\N	\N	UNR	Underkhaan	47.3166659999999979	110.666663999999997
6981	\N	\N	UNS	Umnak	53.25	-168.333329999999989
6982	\N	\N	UNT	Baltasound	60.7666660000000007	-0.849999999999999978
6983	\N	\N	UNU	Dodge County	58.2999999999999972	-134.416670000000011
6984	\N	\N	UOL	Buol	1.1666669999999999	121.433334000000002
6985	\N	\N	UON	Muong Sai	20.6999999999999993	101.983329999999995
6986	\N	\N	UOS	Franklin County	35.1833340000000021	-85.9000000000000057
6987	\N	\N	UOX	University-Oxford	34.3844449999999995	-89.5349999999999966
6988	\N	\N	UPA	Punta Alegre	22.3833330000000004	-78.8166659999999979
6989	\N	\N	UPB	Playa Baracoa	23.0327780000000004	-82.5794450000000069
6990	\N	\N	UPG	Hasanudin	-5.05831199999999992	119.54589
6991	\N	\N	UPL	Upala	10.7833330000000007	-85.0333300000000065
6992	\N	\N	UPN	Uruapan	19.4111119999999993	-102.047219999999996
6993	\N	\N	UPP	Upolu Point	20.2680569999999989	-155.862500000000011
6994	\N	\N	UPR	Upiara	-8.53333300000000072	142.633330000000001
6995	\N	\N	UPV	Upavon	51.2999999999999972	-1.81666700000000003
6996	\N	\N	UQE	Queen	58.8766669999999976	-158.431669999999997
6997	\N	\N	URB	Ernesto Pochler	-20.7833329999999989	-51.5666659999999979
6998	\N	\N	URC	Urumqi	43.9012600000000006	87.4751499999999993
6999	\N	\N	URD	Burg Feuerstein	49.7999999999999972	11.1333330000000004
7000	\N	\N	URE	Kuressaare	58.2166670000000011	22.5
7001	\N	\N	URG	Ruben Berta	-29.7816679999999998	-57.038333999999999
7002	\N	\N	URI	Uribe	3.21666700000000017	-74.4000000000000057
7003	\N	\N	URM	Uriman	5.34166700000000017	-62.7583300000000008
7004	\N	\N	URN	Urgoon	32.9500000000000028	69.1833340000000021
7005	\N	\N	URO	Boos	49.3886099999999999	1.1875
7006	\N	\N	URR	Urrao	6.33333299999999966	-76.1833340000000021
7007	\N	\N	URS	Kursk	51.75	36.2666660000000007
7008	\N	\N	URT	Surat Thani	9.13386500000000012	99.1431960000000032
7009	\N	\N	URU	Uroubi	-9.5	148.566669999999988
7010	\N	\N	URY	Gurayat	31.4096219999999988	37.2750050000000002
7011	\N	\N	URZ	Uruzgan	32.8999999999999986	66.6166699999999992
7012	\N	\N	USI	Mabaruma	8.16666700000000034	-59.8333319999999986
7013	\N	\N	USL	Useless Loop	-25.9666670000000011	113.116669999999999
7014	\N	\N	USO	Usino	-5.5	145.433330000000012
7015	\N	\N	USQ	Usak	38.6822200000000009	29.4719450000000016
7016	\N	\N	USS	Sancti Spiritus	21.8666669999999996	-79.5499999999999972
7017	\N	\N	UST	St Augustine	29.9499999999999993	-81.3333360000000027
7018	\N	\N	UTA	Mutare	-18.9666670000000011	32.6666680000000014
7019	\N	\N	UTB	Muttaburra	-22.5874999999999986	144.525000000000006
7020	\N	\N	UTC	Soesterberg	52.0833319999999986	5.16666700000000034
7021	\N	\N	UTD	Nutwood Downs	-15.8166670000000007	134.166670000000011
7022	\N	\N	UTG	Quthing	-30.5	27.6000000000000014
7023	\N	\N	UTH	Udon Thani	17.386610000000001	102.774506000000002
7024	\N	\N	UTI	Utti	60.8999999999999986	26.9333320000000001
7025	\N	\N	UTK	Utirik Island	11.233333	169.866669999999999
7026	\N	\N	UTL	Torremolinos	36.6333300000000008	-4.5
7027	\N	\N	UTM	Tunica Municipalcipal Airport	34.6676939999999973	-90.3676700000000039
7028	\N	\N	UTN	Upington	-28.4005569999999992	21.2533320000000003
7029	\N	\N	UTO	Indian Mountain AFS	65.9933300000000003	-153.701660000000004
7030	\N	\N	UTR	Uttaradit	17.6694430000000011	100.243889999999993
7031	\N	\N	UTT	Umtata	-31.5833319999999986	28.7833329999999989
7032	\N	\N	UTU	Ustupo	9.66666700000000034	-78.8333360000000027
7033	\N	\N	UTW	Queenstown	-31.8666669999999996	26.8666669999999996
7034	\N	\N	UUA	Bugulma	54.6166699999999992	52.8166659999999979
7035	\N	\N	UUK	Kuparuk	70.4166639999999973	-148.916670000000011
7036	\N	\N	UUN	Baruun-Urt	46.6833340000000021	113.283330000000007
7037	\N	\N	UUU	Manumu	-8.99972200000000022	147.46665999999999
7038	\N	\N	UVA	Garner Field	29.201944000000001	-99.7349999999999994
7039	\N	\N	UVE	Ouvea	-20.6424200000000013	166.571979999999996
7040	\N	\N	UVF	Hewanorra	13.7355560000000008	-60.952219999999997
7041	\N	\N	UVL	Kharga	25.4750000000000014	30.590834000000001
7042	\N	\N	UVO	Uvol	-5.97499999999999964	150.96665999999999
7043	\N	\N	UWA	Ware	42.2666660000000007	-72.2333299999999952
7044	\N	\N	UYL	Nyala	12.0716669999999997	24.8947220000000016
7045	\N	\N	UZC	Uzice-Ponikve	43.8988340000000008	19.6974030000000013
7046	\N	\N	UZH	Unayzah	26.1000000000000014	43.9333340000000021
7047	\N	\N	UZU	Curuzu Cuatia	-29.7788889999999995	-58.0955539999999999
7048	\N	\N	VAB	Yavarate	1.11666700000000008	-70.75
7049	\N	\N	VAC	Varrelbusch	52.9166680000000014	8.05000000000000071
7050	\N	\N	VAD	Moody AFB	30.8333319999999986	-83.2833300000000065
7051	\N	\N	VAF	Chabeuil	44.9202769999999987	4.97027800000000042
7052	\N	\N	VAG	Maj. Brig. Trompowsky	-21.5500000000000007	-45.4333340000000021
7053	\N	\N	VAH	Vallegrande	-18.4833339999999993	-64.0999999999999943
7054	\N	\N	VAI	Vanimo	-2.69472200000000006	141.301940000000002
7055	\N	\N	VAL	Valenca	-13.3333329999999997	-39.0833319999999986
7056	\N	\N	VAO	Suavanao Airstrip	-7.56666699999999981	158.666670000000011
7057	\N	\N	VAP	Valparaiso	-33.0333329999999989	-71.6666639999999973
7058	\N	\N	VAT	Vatomandry	-19.2833329999999989	48.8333319999999986
7059	\N	\N	VAU	Vatukoula	-17.5	177.866669999999999
7060	\N	\N	VBG	Vandenberg AFB	34.6333300000000008	-120.466669999999993
7061	\N	\N	VBS	Brescia Montichiari	45.4254460000000009	10.3265449999999994
7062	\N	\N	VBV	Vanuabalavu	-17.2333339999999993	-178.949999999999989
7063	\N	\N	VCA	Can Tho	10.0472219999999997	105.766390000000001
7064	\N	\N	VCB	View Cove	55.0833319999999986	-133.016660000000002
7065	\N	\N	VCD	Victoria River Downs	-16.3999999999999986	131
7066	\N	\N	VCE	Marco Polo	45.5022850000000005	12.3379469999999998
7067	\N	\N	VCF	Valcheta	-40.7000000000000028	-66.1500000000000057
7068	\N	\N	VCH	Vichadero	-31.7333339999999993	-54.25
7069	\N	\N	VCR	Carora	10.1833329999999993	-70.0833360000000027
7070	\N	\N	VCT	County-Foster	28.8511099999999985	-96.9144440000000031
7071	\N	\N	VCV	Southern California Logistics	34.5333329999999989	-117.299999999999997
7072	\N	\N	VDA	Ovda	29.9520149999999994	34.9339000000000013
7073	\N	\N	VDB	Valdres Lufthavn Leirin	61.0833319999999986	9.33333299999999966
7074	\N	\N	VDE	Hierro	27.8139690000000002	-17.8849370000000008
7075	\N	\N	VDI	Vidalia Municipal Airport	32.2166670000000011	-82.4166639999999973
7076	\N	\N	VDP	Valle De Pascua	9.22138900000000028	-65.9911100000000062
7077	\N	\N	VDR	Villa Dolores	-31.9411099999999983	-65.1422199999999947
7078	\N	\N	VDZ	Valdez Municipal	61.1325000000000003	-146.238889999999998
7079	\N	\N	VEG	Maikwak	5.54999999999999982	-59.2833329999999989
7080	\N	\N	VER	Las Bajadas	19.1422750000000015	-96.1832100000000025
7081	\N	\N	VEV	Barakoma	-7.84999999999999964	159.550000000000011
7082	\N	\N	VEX	Tioga Municipal Airport	41.9166680000000014	-77.1333300000000008
7083	\N	\N	VEY	Vestmannaeyjar	63.4263880000000029	-20.2777789999999989
7084	\N	\N	VGA	Vijayawada	16.5294440000000016	80.7972199999999958
7085	\N	\N	VGD	Vologda	59.2833329999999989	39.9500000000000028
7086	\N	\N	VGG	Vangrieng	62.5300000000000011	11.0700000000000003
7087	\N	\N	VGO	Vigo	42.2245520000000027	-8.63402499999999939
7088	\N	\N	VGS	General Villegas	-35.0833319999999986	-63
7089	\N	\N	VGT	North Air Terminal	36.0966700000000031	-115.168890000000005
7090	\N	\N	VGZ	Villagarzon	1.06666700000000003	-76.7166699999999935
7091	\N	\N	VHC	Saurimo	-9.75	20.5500000000000007
7092	\N	\N	VHM	Vilhelmina	64.6166699999999992	16.6499999999999986
7093	\N	\N	VHN	Culberson County	31.0500000000000007	-104.833336000000003
7094	\N	\N	VHY	Charmeil	46.1655579999999972	3.40972199999999992
7095	\N	\N	VHZ	Vahitahi	-18.5833319999999986	-138.833329999999989
7096	\N	\N	VIA	Vienna	-27.0083330000000004	-51.1361119999999971
7097	\N	\N	VIB	Villa Constitucion	25.0583320000000001	-111.700000000000003
7098	\N	\N	VIC	Trissino	45.5499999999999972	11.5500000000000007
7099	\N	\N	VIE	Vienna International	48.1197200000000009	16.5635830000000013
7100	\N	\N	VIF	Vieste	41.8852770000000021	16.1769449999999999
7101	\N	\N	VIG	El Vigia	8.63333300000000037	-71.6500000000000057
7102	\N	\N	VIH	Rolla National	38.1333300000000008	-91.7666700000000048
7103	\N	\N	VIJ	Spanish Town	18.4502699999999997	-64.4277340000000009
7104	\N	\N	VIK	Airstrip	69.6800000000000068	-146.900000000000006
7105	\N	\N	VIN	Vinnica	49.2333339999999993	28.4833339999999993
7106	\N	\N	VIQ	Viqueque	-8.88333300000000037	126.366669999999999
7107	\N	\N	VIS	Visalia	36.3194429999999997	-119.393889999999999
7108	\N	\N	VIU	Viru Harbour Airstrip	-8.5	157.666670000000011
7109	\N	\N	VIV	Vivigani	-9.33055599999999963	150.34165999999999
7110	\N	\N	VIX	Eurico Sales	-20.2568100000000015	-40.2895660000000007
7111	\N	\N	VIY	Villa Coublay	48.774166000000001	2.19166699999999981
7112	\N	\N	VJB	Xai Xai	-25.0333329999999989	33.6166699999999992
7113	\N	\N	VJI	Virginia Highlands	36.6861099999999993	-82.0333300000000065
7114	\N	\N	VJQ	Gurue	-15.4166670000000003	36.9666670000000011
7115	\N	\N	VKG	Rach Gia	10.0833329999999997	105.083336000000003
7116	\N	\N	VKO	Vnukovo	55.6031499999999994	37.2920999999999978
7117	\N	\N	VKS	Vicksburg	32.3500000000000014	-90.8499999999999943
7118	\N	\N	VKT	Vorkuta	67.4833299999999952	63.9833339999999993
7119	\N	\N	VKW	West Kavik	69.7666700000000048	-146.916670000000011
7120	\N	\N	VLA	Vandalia	38.9666670000000011	-89.0999999999999943
7121	\N	\N	VLE	J t Robidoux	35.6499999999999986	-112.183334000000002
7122	\N	\N	VLK	Volgodonsk	47.6833340000000021	42.0833319999999986
7123	\N	\N	VLL	Valladolid	41.7058099999999996	-4.84462599999999988
7124	\N	\N	VLM	Villamontes	-21.25	-63.5
7125	\N	\N	VLO	Stolport	38.1166699999999992	-122.233329999999995
7126	\N	\N	VLP	Vila Rica	-10.0155560000000001	-51.1222229999999982
7127	\N	\N	VLR	Vallenar	-28.5916670000000011	-70.7616649999999936
7128	\N	\N	VLU	Velikiye Luki	56.3833300000000008	30.6166669999999996
7129	\N	\N	VME	Villa Mercedes	-33.6333300000000008	-65.4166639999999973
7130	\N	\N	VMI	INC	-22.25	-58
7131	\N	\N	VMU	Baimuru	-7.5	144.800000000000011
7132	\N	\N	VNA	Saravane	15.6927780000000006	106.426109999999994
7133	\N	\N	VNC	Venice Municipalcipal	27.0666679999999999	-82.4333340000000021
7134	\N	\N	VND	Vangaindrano	-23.3500000000000014	47.5666659999999979
7135	\N	\N	VNE	Meucon	47.6499999999999986	-2.76666699999999999
7136	\N	\N	VNG	Viengxay	18.9333320000000001	102.5
7137	\N	\N	VNO	Vilnius	54.6430780000000027	25.2796060000000011
7138	\N	\N	VNR	Vanrook	-16.8666669999999996	141.916670000000011
7139	\N	\N	VNS	Varanasi	25.4496970000000005	82.8537299999999988
7140	\N	\N	VNX	Vilanculos	-22.0166660000000007	35.2833329999999989
7141	\N	\N	VOG	Volgograd	48.7920000000000016	44.3548049999999989
7142	\N	\N	VOH	Vohemar	-13.3666669999999996	50
7143	\N	\N	VOI	Voinjama	8.41666700000000034	-9.75
7144	\N	\N	VOK	Volk Field	43.9333340000000021	-90.2833300000000065
7145	\N	\N	VOL	Nea Anchialos	39.3833300000000008	22.9311100000000003
7146	\N	\N	VOT	Votuporanga	-20.4333320000000001	-49.8833300000000008
7147	\N	\N	VOZ	Chertovitskoye	51.8123549999999966	39.2269969999999972
7148	\N	\N	VPS	Eglin AFB	30.4959130000000016	-86.5494599999999963
7149	\N	\N	VPZ	Porter County	41.4525000000000006	-87.0052799999999991
7150	\N	\N	VQQ	Cecil Field	30.3333319999999986	-81.6500000000000057
7151	\N	\N	VRA	Juan Gualberto Gomez	23.0398959999999988	-81.436940000000007
7152	\N	\N	VRB	Vero Beach Municipal	27.6524999999999999	-80.4136100000000056
7153	\N	\N	VRE	Vredendal	-31.6666680000000014	18.5
7154	\N	\N	VRK	Varkaus	62.2999999999999972	27.9333320000000001
7155	\N	\N	VRL	Vila Real	41.2999999999999972	-7.75
7156	\N	\N	VRO	Kawama	23.1333330000000004	-81.2999999999999972
7157	\N	\N	VRS	Versailles	38.4333340000000021	-92.8499999999999943
7158	\N	\N	VRU	Vryburg	-26.9166680000000014	24.75
7159	\N	\N	VRY	Stolport (Not operational)	67.6666639999999973	12.6833329999999993
7160	\N	\N	VSE	Viseu	40.6499999999999986	-7.91666700000000034
7161	\N	\N	VSF	State	42.1166699999999992	-72.5833360000000027
7162	\N	\N	VSG	Lugansk	48.5666659999999979	39.3333319999999986
7163	\N	\N	VSO	Phuoclong	9.4333329999999993	105.466669999999993
7164	\N	\N	VST	Vasteras/Hasslo	59.5891700000000029	16.6305559999999986
7165	\N	\N	VTA	Victoria	14.9499999999999993	-87.4000000000000057
7166	\N	\N	VTB	Vitebsk	55.1333300000000008	30.3666669999999996
7167	\N	\N	VTF	Vatulele	-18.5500000000000007	177.616669999999999
7168	\N	\N	VTG	Vung Tau	10.3744440000000004	107.09111
7169	\N	\N	VTL	Vittel	48.2000000000000028	5.95000000000000018
7170	\N	\N	VTN	Miller Field	42.8666699999999992	-100.549999999999997
7171	\N	\N	VTU	Las Tunas	20.9666670000000011	-76.9500000000000028
7172	\N	\N	VUP	Valledupar	10.4366669999999999	-73.2527800000000013
7173	\N	\N	VUU	Mvuu Camp	-15.6833329999999993	35
7174	\N	\N	VVB	Mahanoro	-19.8333319999999986	48.7999999999999972
7175	\N	\N	VVC	La Vanguardia	4.07888900000000021	-73.5666659999999979
7176	\N	\N	VVK	Vastervik	57.75	16.6333330000000004
7177	\N	\N	VXE	San Pedro	16.8356129999999986	-25.0575709999999994
7178	\N	\N	VXO	Smaland Airport	56.9250949999999989	14.7320460000000004
7179	\N	\N	VYD	Vryheid	-27.7833329999999989	30.8000000000000007
7180	\N	\N	VYS	Illinois Valley Regnl	41.3333319999999986	-89.1333300000000008
7181	\N	\N	WAB	Wabag	-5.48333300000000001	143.733339999999998
7182	\N	\N	WAC	Waca	7.16666700000000034	37.1666680000000014
7183	\N	\N	WAD	Andriamena	-17.4499999999999993	47.5166660000000007
7184	\N	\N	WAF	Wana	32.3333319999999986	69.5333300000000065
7185	\N	\N	WAG	Wanganui	-39.9609219999999965	175.024439999999998
7186	\N	\N	WAH	Wahpeton	46.2666660000000007	-96.5999999999999943
7187	\N	\N	WAI	Antsohihy	-14.9166670000000003	47.9500000000000028
7188	\N	\N	WAJ	Wawoi Falls	-7.79999999999999982	143.266660000000002
7189	\N	\N	WAK	Ankazoabo	-22.3000000000000007	44.5333329999999989
7190	\N	\N	WAL	Wallops Flight Center	37.9333340000000021	-75.3833300000000008
7191	\N	\N	WAM	Ambatondrazaka	-17.8000000000000007	48.4333340000000021
7192	\N	\N	WAN	Waverney	-25.3666669999999996	141.933330000000012
7193	\N	\N	WAO	Wabo	-7.49508599999999969	144.824299999999994
7194	\N	\N	WAP	Alto Palena	-43.6166699999999992	-71.7999999999999972
7195	\N	\N	WAQ	Antsalova	-18.6999999999999993	44.6166699999999992
7196	\N	\N	WAR	Waris	-3.11666700000000008	140.883330000000001
7197	\N	\N	WAT	Waterford	52.1888659999999973	-7.08008199999999999
7198	\N	\N	WAU	Wauchope	-31.4666670000000011	152.75
7199	\N	\N	WAV	Kalkgurung	-17.4833339999999993	130.949999999999989
7200	\N	\N	WAW	Frederic Chopin	52.1709060000000022	20.9732899999999987
7201	\N	\N	WAX	Zwara	51.2166670000000011	-55.3833300000000008
7202	\N	\N	WAY	Greene County	39.75	-77.5833360000000027
7203	\N	\N	WAZ	Warwick	-28.1499999999999986	151.949999999999989
7204	\N	\N	WBA	Wahai	-2.81666699999999981	129.483339999999998
7205	\N	\N	WBC	Wapolu	-9.3166670000000007	150.349999999999994
7206	\N	\N	WBD	Befandriana	-15.1999999999999993	48.4833339999999993
7207	\N	\N	WBE	Bealanana	-14.5333330000000007	48.7000000000000028
7208	\N	\N	WBG	Schleswig-jagel	54.4500000000000028	9.51666699999999999
7209	\N	\N	WBI	Broker Inn	40.0166660000000007	-105.283330000000007
7210	\N	\N	WBM	Wapenamanda	-5.61666699999999963	143.916670000000011
7211	\N	\N	WBN	Cummings Park	42.4666670000000011	-71.1500000000000057
7212	\N	\N	WBO	Beroroha	-21.6000000000000014	45.1333300000000008
7213	\N	\N	WBR	Big Rapids	43.7000000000000028	-85.4833299999999952
7214	\N	\N	WBU	Boulder Municipal	40.039164999999997	-105.225555
7215	\N	\N	WBW	Wilkes-Barre/Wyoming Valley	41.2333339999999993	-75.8833300000000008
7216	\N	\N	WCA	Gamboa	-42.5	-73.8333360000000027
7217	\N	\N	WCH	Chaiten	-42.9166680000000014	-72.7166699999999935
7218	\N	\N	WCR	Chandalar	67.5055540000000036	-148.5
7219	\N	\N	WDA	Wadi Ain	14.8666669999999996	45.5499999999999972
7220	\N	\N	WDB	Deep Bay	55.5833319999999986	-131.75
7221	\N	\N	WDG	Enid Woodring Mun.	36.3836099999999973	-97.7908299999999997
7222	\N	\N	WDH	Hosea Kutako International (J. G. Strijdom)	-22.4873450000000012	17.463201999999999
7223	\N	\N	WDI	Wondai	-26.3333319999999986	151.816669999999988
7224	\N	\N	WDN	Waldron Island	48.7166670000000011	-123.033330000000007
7225	\N	\N	WDR	Winder	33.9833339999999993	-83.7166699999999935
7226	\N	\N	WDY	Kodiak Fss	57.7833329999999989	-152.400000000000006
7227	\N	\N	WEA	Parker County	32.7666660000000007	-97.7999999999999972
7228	\N	\N	WED	Wedau	-10.0999999999999996	150.083329999999989
7229	\N	\N	WEF	Weifang	36.6410750000000007	119.113470000000007
7230	\N	\N	WEL	Welkom	-28	26.75
7231	\N	\N	WEP	Weam	-10.0666670000000007	148.166670000000011
7232	\N	\N	WET	Wagethe	-4.16666700000000034	135.833329999999989
7233	\N	\N	WEW	Wee Waa	-30.2333339999999993	149.433330000000012
7234	\N	\N	WFB	Waterfront SPB	55.3580550000000002	-131.668329999999997
7235	\N	\N	WFD	Woodford	53.3380549999999971	-2.14888900000000005
7236	\N	\N	WFI	Fianarantsoa	-21.4666670000000011	47.0833319999999986
7237	\N	\N	WFK	Frenchville	47.3500000000000014	-68.3333360000000027
7238	\N	\N	WGA	Forest Hill	-35.1599199999999996	147.466260000000005
7239	\N	\N	WGB	Bahawalnagar	30	73.25
7240	\N	\N	WGC	Warangal	17.9166680000000014	79.5999999999999943
7241	\N	\N	WGE	Walgett	-30.0333329999999989	148.133330000000001
7242	\N	\N	WGN	Waitangi	-36.2669449999999998	174.099999999999994
7243	\N	\N	WGO	Winchester Regional	39.1411099999999976	-78.1427800000000019
7244	\N	\N	WGP	Waingapu	-9.66666700000000034	120.299999999999997
7245	\N	\N	WGT	Wangaratta	-36.3666699999999992	146.333329999999989
7246	\N	\N	WGU	Wagau	-6.79999999999999982	146.800000000000011
7247	\N	\N	WGY	Wagny	0.516666999999999987	10.4333329999999993
7248	\N	\N	WHD	SPB	55.9166680000000014	-130.083329999999989
7249	\N	\N	WHF	Wadi Halfa	21.75	31.5
7250	\N	\N	WHH	Hiltons Har H	40.0305559999999971	-105.234719999999996
7251	\N	\N	WHK	Whakatane	-37.9246750000000006	176.917480000000012
7252	\N	\N	WHL	Welshpool	-38.6888900000000007	146.449999999999989
7253	\N	\N	WHO	Franz Josef	-43.3833300000000008	170.183330000000012
7254	\N	\N	WHP	Whiteman	34.0499999999999972	-118.25
7255	\N	\N	WHS	Whalsay	60.3666699999999992	-0.983333000000000013
7256	\N	\N	WHT	Wharton	29.3166679999999999	-96.0999999999999943
7257	\N	\N	WHU	Wuhu	31.3666669999999996	118.366669999999999
7258	\N	\N	WIE	Air Base	50.0833319999999986	8.23333300000000001
7259	\N	\N	WIK	Surfdale	-36.8333319999999986	175.083329999999989
7260	\N	\N	WIO	Wilcannia	-31.0833319999999986	143.550000000000011
7261	\N	\N	WIR	Wairoa	-39.0333329999999989	177.416670000000011
7262	\N	\N	WIU	Witu	-4.66666700000000034	149.5
7263	\N	\N	WJA	Woja	7.45365300000000008	168.552960000000013
7264	\N	\N	WJF	William J Fox	34.7000000000000028	-118.133330000000001
7265	\N	\N	WKA	Wanaka	-44.7233599999999996	169.244249999999994
7266	\N	\N	WKB	Warracknabeal	-36.1499999999999986	142.433330000000012
7267	\N	\N	WKF	Waterkloof AFB	-30.3166679999999999	25.3000000000000007
7268	\N	\N	WKI	Hwange	-18.3625000000000007	26.5183329999999984
7269	\N	\N	WKK	Aleknagik	59.2777799999999999	-158.611109999999996
7270	\N	\N	WKL	Waikoloa Airport	19.8500000000000014	-156.333329999999989
7271	\N	\N	WKN	Wakunai	-5.86666699999999963	155.21665999999999
7272	\N	\N	WLA	Wallal	-19.7833329999999989	120.666663999999997
7273	\N	\N	WLB	Labouchere Bay	56.2916680000000014	-133.65834000000001
7274	\N	\N	WLC	Walcha	-30.9833339999999993	151.599999999999994
7275	\N	\N	WLD	Arkansas City	37.1669430000000034	-97.0502800000000008
7276	\N	\N	WLG	Wellington International	-41.3290369999999996	174.812160000000006
7277	\N	\N	WLL	Wollogorang	-17.6166669999999996	137.916670000000011
7278	\N	\N	WLM	Waltham	42.3852770000000021	-71.2513900000000007
7279	\N	\N	WLN	Little Naukati	55.8666699999999992	-133.21665999999999
7280	\N	\N	WLO	Waterloo	-16.6333330000000004	129.316669999999988
7281	\N	\N	WLR	Loring	55.6666680000000014	-131.666670000000011
7282	\N	\N	WLS	Wallis Island	-13.233333	-176.166670000000011
7283	\N	\N	WLW	Glenn County	39.8833300000000008	-122.349999999999994
7284	\N	\N	WMA	Mandritsara	-15.8333329999999997	48.8333319999999986
7285	\N	\N	WMB	Warrnambool	-38.2950000000000017	142.448329999999999
7286	\N	\N	WMC	Winnemucca	40.9666670000000011	-117.733329999999995
7287	\N	\N	WMD	Mandabe	-21.0333329999999989	44.9500000000000028
7288	\N	\N	WME	Mount Keith	-27.2872219999999999	120.549446000000003
7289	\N	\N	WMH	Mountain Home	36.3333319999999986	-92.3833300000000008
7290	\N	\N	WMK	SPB	55.7333339999999993	-132.183330000000012
7291	\N	\N	WML	Malaimbandy	-20.3500000000000014	45.5499999999999972
7292	\N	\N	WMN	Maroantsetra	-15.4333329999999993	49.6833340000000021
7293	\N	\N	WMO	White Mountain	64.686940000000007	-163.406659999999988
7294	\N	\N	WMP	Mampikony	-16.0749999999999993	47.5972200000000001
7295	\N	\N	WMR	Mananara	-16.1619430000000008	49.7705569999999966
7296	\N	\N	WMV	Madirovalo	-16.4499999999999993	46.5666659999999979
7297	\N	\N	WNA	Napakiak SPB	60.7000000000000028	-162.116669999999999
7298	\N	\N	WNC	Naukati Bay SPB	55.8541680000000014	-133.224999999999994
7299	\N	\N	WND	Windarra	-28.2666660000000007	121.833336000000003
7300	\N	\N	WNE	Wora Na Ye	-1.35000000000000009	9.33333299999999966
7301	\N	\N	WNN	Wunnummin Lake	52.9166680000000014	-89.1666639999999973
7302	\N	\N	WNS	Nawabshah	26.2194439999999993	68.3922199999999947
7303	\N	\N	WNU	Wanuma	-4.90000000000000036	145.316669999999988
7304	\N	\N	WNZ	Wenzhou	27.915659999999999	120.847380000000001
7305	\N	\N	WOA	Wonenara	-6.79999999999999982	145.883330000000001
7306	\N	\N	WOD	Wood River	38.8666699999999992	-90.0833360000000027
7307	\N	\N	WOE	Woensdrecht	51.4358330000000024	4.33499999999999996
7308	\N	\N	WOK	Wonken	5.25	-61.7333339999999993
7309	\N	\N	WOL	Wollongong	-34.5666659999999979	150.78334000000001
7310	\N	\N	WON	Wondoola	-18.5833319999999986	140.900000000000006
7311	\N	\N	WOO	Woodchopper	65.3333360000000027	-143.53334000000001
7312	\N	\N	WOR	Moramba	-14.8833330000000004	47.2833329999999989
7313	\N	\N	WOT	Wonan	23.4166680000000014	119.5
7314	\N	\N	WOW	Willow	61.8333319999999986	-150.166670000000011
7315	\N	\N	WPA	Puerto Aisen	-45.3999999999999986	-72.7000000000000028
7316	\N	\N	WPB	Port Berge	-15.5500000000000007	47.6666680000000014
7317	\N	\N	WPC	Pincher Creek	49.4833339999999993	-113.950000000000003
7318	\N	\N	WPK	Wrotham Park	-16.6333330000000004	144
7319	\N	\N	WPL	Powell Lake	50.1833340000000021	-124.400000000000006
7320	\N	\N	WPM	Wipim	-8.8166670000000007	143.03334000000001
7321	\N	\N	WPO	North Fork Valley	38.8666699999999992	-107.599999999999994
7322	\N	\N	WPR	Porvenir	-53.25	-70.3333360000000027
7323	\N	\N	WPU	Puerto Williams	-54.9500000000000028	-68.25
7324	\N	\N	WRA	Warder	6.96666700000000017	45.3333319999999986
7325	\N	\N	WRB	Robins AFB	32.6955570000000009	-83.6477799999999974
7326	\N	\N	WRE	Whangarei	-35.7674200000000013	174.364030000000014
7327	\N	\N	WRG	Wrangell SPB	56.4844440000000034	-132.366669999999999
7328	\N	\N	WRH	Wrench Creek	68.25	-162.28334000000001
7329	\N	\N	WRI	Mc Guire AFB	40.155307999999998	-74.6501700000000028
7330	\N	\N	WRL	Worland Municipalcipal	43.9675000000000011	-107.953059999999994
7331	\N	\N	WRO	Copernicus Airport	51.1048199999999966	16.8994029999999995
7332	\N	\N	WRW	Warrawagine	-20.8666669999999996	120.716669999999993
7333	\N	\N	WRY	Westray	59.3500000000000014	-2.95000000000000018
7334	\N	\N	WRZ	Wirawila	6.25166700000000031	81.2383350000000064
7335	\N	\N	WSA	Wasua	-8.28333300000000072	142.866669999999999
7336	\N	\N	WSB	SPB	39.3666699999999992	-119.733329999999995
7337	\N	\N	WSD	Condron AAF	32.3833300000000008	-106.483329999999995
7338	\N	\N	WSF	Sarichef	54.5833319999999986	-164.916670000000011
7339	\N	\N	WSG	County	40.1666680000000014	-80.25
7340	\N	\N	WSH	Brookhaven	40.75	-72.8333360000000027
7341	\N	\N	WSJ	San Juan SPB	57.731110000000001	-153.318330000000003
7342	\N	\N	WSM	Wiseman	67.4016649999999942	-150.116669999999999
7343	\N	\N	WSN	South Naknek	58.7186129999999977	-156.934169999999995
7344	\N	\N	WSO	Washabo	5.21666700000000017	-57.1833340000000021
7345	\N	\N	WSP	Waspam	14.6833329999999993	-84.0166700000000048
7346	\N	\N	WSR	Wasior	-2.71666700000000017	134.5
7347	\N	\N	WST	Westerly State	41.3501929999999973	-71.8068999999999988
7348	\N	\N	WSU	Wasu	-5.95000000000000018	147.233339999999998
7349	\N	\N	WSX	Westsound	48.6666680000000014	-122.883330000000001
7350	\N	\N	WSZ	Westport	-41.7400200000000012	171.578579999999988
7351	\N	\N	WTA	Tambohorano	-17.4833339999999993	43.9666670000000011
7352	\N	\N	WTD	West End	26.6861110000000004	-78.975830000000002
7353	\N	\N	WTE	Wotje Island	9.44999999999999929	170.266660000000002
7354	\N	\N	WTL	Tuntutuliak	60.3500000000000014	-162.633330000000001
7355	\N	\N	WTN	RAF Station	53.1666680000000014	-0.516666999999999987
7356	\N	\N	WTO	Wotho Island	10.1666670000000003	166.03334000000001
7357	\N	\N	WTP	Woitape	-8.55000000000000071	147.25
7358	\N	\N	WTR	White River	33.8500000000000014	-109.966669999999993
7359	\N	\N	WTS	Tsiroanomandidy	-18.7572210000000013	46.0544429999999991
7360	\N	\N	WTT	Wantoat	-6.04999999999999982	146.400000000000006
7361	\N	\N	WTZ	Whitianga	-36.8312999999999988	175.677999999999997
7362	\N	\N	WUD	Wudinna	-33.0166660000000007	135.619450000000001
7363	\N	\N	WUG	Wau	-7.33750000000000036	146.718340000000012
7364	\N	\N	WUH	Tianhe International	30.7765979999999999	114.209625000000003
7365	\N	\N	WUM	Wasum	-6.04999999999999982	149.333329999999989
7366	\N	\N	WUN	Wiluna	-26.6333330000000004	120.216669999999993
7367	\N	\N	WUS	Wuyishan	27.7166670000000011	117.966669999999993
7368	\N	\N	WUU	Wau	7.74638899999999975	27.985277
7369	\N	\N	WUV	Wuvulu Island	-1.75	142.833329999999989
7370	\N	\N	WUZ	Changzhoudao	23.4560619999999993	111.251909999999995
7371	\N	\N	WVI	Watsonville	36.9166680000000014	-121.75
7372	\N	\N	WVK	Manakara	-22.1166669999999996	48.0166660000000007
7373	\N	\N	WVL	Robert Lafleur	44.5338899999999995	-69.6758350000000064
7374	\N	\N	WVN	Wilhelmshaven	53.5333329999999989	8.11666699999999963
7375	\N	\N	WWA	Wasilla	61.5833319999999986	-149.433330000000012
7376	\N	\N	WWD	Cape May County	39.0063900000000032	-74.9088899999999995
7377	\N	\N	WWI	Woodie Woodie	-21.6333330000000004	121.233329999999995
7378	\N	\N	WWR	West Woodward	36.4361099999999993	-99.5263900000000064
7379	\N	\N	WWY	West Wyalong	-33.9333340000000021	147.25
7380	\N	\N	WYA	Whyalla	-33.0524100000000018	137.52197000000001
7381	\N	\N	WYB	SPB	55.9166680000000014	-131.833329999999989
7382	\N	\N	WYE	Yengema	8.61666699999999963	-11.0588890000000006
7383	\N	\N	WYN	Wyndham	-15.5072220000000005	128.137499999999989
7384	\N	\N	WZY	Paradise Island Seaplane Base	25.0824999999999996	-77.3272249999999985
7385	\N	\N	XAL	Alamos	27.0166660000000007	-108.933334000000002
7386	\N	\N	XAP	Aeroporto Municipalcipal Chapeco	-27.0886120000000012	-52.6297229999999985
7387	\N	\N	XAR	Aribinda	14.233333	-0.866666999999999965
7388	\N	\N	XAU	Saul	3.61666700000000008	-53.2000000000000028
7389	\N	\N	XAY	Xayabury	18.6666680000000014	104.716669999999993
7390	\N	\N	XBB	Blubber Bay	50	-123
7391	\N	\N	XBE	Bearskin Lake	53.9500000000000028	-90.9833299999999952
7392	\N	\N	XBG	Bogande	12.983333	-0.133333000000000007
7393	\N	\N	XBL	Buno Bedelle	8.44999999999999929	36.3333319999999986
7394	\N	\N	XBN	Biniguni	-9.63333300000000037	149.300000000000011
7395	\N	\N	XBO	Boulsa	12.6500000000000004	-0.566667000000000032
7396	\N	\N	XBR	Brockville	44.5833319999999986	-75.6833340000000021
7397	\N	\N	XBW	Killineq	42.6499999999999986	-80.8199999999999932
7398	\N	\N	XCL	Cluff Lake	59	-107
7399	\N	\N	XCM	Chatham	42.3999999999999986	-82.1833340000000021
7400	\N	\N	XCN	Coron Airport	12.016667	120.200000000000003
7401	\N	\N	XCO	Colac	-38.3500000000000014	143.583329999999989
7402	\N	\N	XCR	Vatry International	48.7677759999999978	4.20111100000000004
7403	\N	\N	XDE	Diebougou	10.9666669999999993	-3.25
7404	\N	\N	XDJ	Djibo	14.0999999999999996	-1.63333299999999992
7405	\N	\N	XDV	Pr. George Railway	53.9184800000000024	-122.776584
7406	\N	\N	XDY	Sudbury Jct Railway	46.6300000000000026	-80.7999999999999972
7407	\N	\N	XEA	Vancouver Railway.	49.2612260000000006	-123.113926800000002
7408	\N	\N	XEN	Xingcheng	40.7333339999999993	118.616669999999999
7409	\N	\N	XEO	Harbour	69.3333360000000027	-51
7410	\N	\N	XER	Strasbourg Bus Service	48.5399999999999991	7.63999999999999968
7411	\N	\N	XES	Lake Geneva Aire Estates Airport	42.6277770000000018	-88.4280550000000005
7412	\N	\N	XEX	Aerogare	48.8333319999999986	2.64999999999999991
7413	\N	\N	XFA	Lille Flanders RailwaySv	50.629249999999999	3.0572560000000002
7414	\N	\N	XFN	Xiangfan	32.1515580000000014	112.286270000000002
7415	\N	\N	XFY	Sainte-Foy Railway	46.8032826000000028	-71.2427959999999985
7416	\N	\N	XFZ	Charny	46.7166670000000011	-71.25
7417	\N	\N	XGA	Gaoua	10.3333329999999997	-3.18333300000000019
7418	\N	\N	XGB	Gare Montparnasse	49.0166660000000007	2.56527800000000017
7419	\N	\N	XGG	Gorom-Gorom	14.4333329999999993	-0.233333000000000013
7420	\N	\N	XGL	Granville Lake	56.2333339999999993	-100.549999999999997
7421	\N	\N	XGN	Xangongo	-16.75	14.9722220000000004
7422	\N	\N	XHN	Guillemins, Raiway Stn	50.6333300000000008	5.56665999999999972
7423	\N	\N	XHW	Alice Springs Railway	-23.7002103999999996	133.880611399999992
7424	\N	\N	XHX	Adelaide Keswick Railway	-34.928621200000002	138.599959399999989
7425	\N	\N	XIC	Xichang	27.9819220000000008	102.187645000000003
7426	\N	\N	XIE	Xienglom	19.6499999999999986	100.833336000000003
7427	\N	\N	XIG	Xinguara	-6.96666700000000017	-48.7999999999999972
7428	\N	\N	XIK	Central Station	45.4636810000000011	9.18817139999999988
7429	\N	\N	XIL	Xilinhot	43.918762000000001	115.959239999999994
7430	\N	\N	XIN	Xingning	24	116
7431	\N	\N	XIX	Porta Nuova Railway	45.4383278000000033	10.9917622999999995
7432	\N	\N	XJE	Railway Service	55.2299999999999969	9.25999999999999979
7433	\N	\N	XJG	Darwin Railway	-12.4628198000000001	130.841769400000004
7434	\N	\N	XKA	Kantchari	12.483333	1.51666699999999999
7435	\N	\N	XKH	Xieng Khouang	19.3000000000000007	103.366669999999999
7436	\N	\N	XKO	Kemano	53.5666659999999979	-127.933334000000002
7437	\N	\N	XKS	Kasabonika	53.5200000000000031	-88.6466700000000003
7438	\N	\N	XKY	Kaya	13.0833329999999997	-1.0833330000000001
7439	\N	\N	XLB	Lac Brochet	58.6000000000000014	-101.466669999999993
7440	\N	\N	XLF	Leaf Bay	59	-69
7441	\N	\N	XLJ	Quebec Stn. Railway	46.8032826000000028	-71.2427959999999985
7442	\N	\N	XLM	St Lambert Railway	45.5088889000000023	-73.5541666999999961
7443	\N	\N	XLO	Long Xuyen	10.3333329999999997	105.466669999999993
7444	\N	\N	XLS	St Louis	16.0502779999999987	-16.4602779999999989
7445	\N	\N	XLU	Leo	11.0999999999999996	-2.10000000000000009
7446	\N	\N	XLW	Lemwerder	53.1666680000000014	8.59999999999999964
7447	\N	\N	XMA	Maramag	7.76666699999999999	125
7448	\N	\N	XMC	Mallacoota	-37.6000000000000014	149.71665999999999
7449	\N	\N	XMD	Madison	44	-97.1166699999999992
7450	\N	\N	XMG	Mahendranagar	28.9666670000000011	80.2000000000000028
7451	\N	\N	XMI	Masasi	-10.7166669999999993	38.7999999999999972
7452	\N	\N	XML	Minlaton	-35	137.5
7453	\N	\N	XMN	Xiamen	24.5368819999999985	118.127499999999998
7454	\N	\N	XMP	Macmillan Pass	62.8666699999999992	-135.916670000000011
7455	\N	\N	XMY	Yam Island	-10.483333	142.449999999999989
7456	\N	\N	XNA	Northwest Arkansas Regional	36.2752570000000034	-94.2971100000000035
7457	\N	\N	XNG	Quang Ngai	15.1136110000000006	108.775829999999999
7458	\N	\N	XNN	Xining	36.5253220000000027	102.037540000000007
7459	\N	\N	XNT	Xingtai	37.1000000000000014	114.5
7460	\N	\N	XNU	Nouna	12.733333	-3.86666700000000008
7461	\N	\N	XPA	Pama	11.25	0.699999999999999956
7462	\N	\N	XPG	Gare du Nord Railway	48.8566140000000004	2.35222189999999998
7463	\N	\N	XPJ	Montpellier Railway	43.6107689999999977	3.87671600000000005
7464	\N	\N	XPK	Pukatawagan	55.7666660000000007	-101.233329999999995
7465	\N	\N	XPL	Coronel Enrique Soto Cano AB	14.4166670000000003	-87.6166699999999992
7466	\N	\N	XPP	Poplar River	53	-97.2999999999999972
7467	\N	\N	XPR	Pine Ridge	43.0166660000000007	-102.516670000000005
7468	\N	\N	XPU	West Kuparuk	70.3333360000000027	-149.333329999999989
7469	\N	\N	XPZ	Harbour	43.2833329999999989	6.63333300000000037
7470	\N	\N	XQP	Quepos	9.43914599999999915	-84.133349999999993
7471	\N	\N	XQU	Qualicum	49.3401530000000008	-124.395870000000002
7472	\N	\N	XRF	Marseille Railway	43.2964819999999975	5.36978000000000044
7473	\N	\N	XRH	Richmond AFB	-33.6000000000000014	150.768889999999999
7474	\N	\N	XRJ	Termini Railway.	41.8905197999999999	12.4942486000000006
7475	\N	\N	XRK	Paveletskiy Railway.	55.7557860000000005	37.6176329999999979
7476	\N	\N	XRR	Ross River	61.9833339999999993	-132.449999999999989
7477	\N	\N	XRY	Jerez De La Frontera	36.7506139999999988	-6.06453500000000023
7478	\N	\N	XSD	Test Range	38.0333329999999989	-117.233329999999995
7479	\N	\N	XSE	Sebba	13.4333329999999993	0.533332999999999946
7480	\N	\N	XSI	South Indian Lake	56.7999999999999972	-98.9166639999999973
7481	\N	\N	XSM	St Marys	38.2833329999999989	-76.6333300000000008
7482	\N	\N	XSO	Siocon	7.70000000000000018	122.150000000000006
7483	\N	\N	XSP	Seletar	1.36666700000000008	103.966669999999993
7484	\N	\N	XTG	Thargomindah	-27.9666670000000011	143.766660000000002
7485	\N	\N	XTL	Tadoule Lake	58.7166670000000011	-98.4833299999999952
7486	\N	\N	XTO	Taroom	-25.4333320000000001	149.800000000000011
7487	\N	\N	XTR	Tara	-27.2833329999999989	150.46665999999999
7488	\N	\N	XTT	Etoile	48.8566140000000004	2.35222189999999998
7489	\N	\N	XVL	Vinh Long	10.25	105.950000000000003
7490	\N	\N	XVQ	Santa Lucia Railway	45.4343362999999982	12.3387843999999998
7491	\N	\N	XVY	Mestre Railway.	45.4343362999999982	12.3387843999999998
7492	\N	\N	XWC	Suedbahnhof Railway	48.2081743000000031	16.3738188999999998
7493	\N	\N	XWK	Karlskrona RailwaySvc.	56.2700000000000031	15.2699999999999996
7494	\N	\N	XWW	Westbahnhof Railway	48.2081743000000031	16.3738188999999998
7495	\N	\N	XWZ	Nykoping	58.7531377999999975	17.0085328999999987
7496	\N	\N	XXK	Katrineholm	58.9959169999999986	16.2061774000000014
7497	\N	\N	XYA	Yandina	-9.11666699999999963	159.21665999999999
7498	\N	\N	XYB	Borlange Railway	60.4856047000000032	15.4363016999999996
7499	\N	\N	XYD	Lyon Part-Dieu	46.240000000000002	5.15000000000000036
7500	\N	\N	XYE	Ye	15.25	97.8499999999999943
7501	\N	\N	XYH	Helsingborg Railway	56.2432000000000016	12.8615092000000004
7502	\N	\N	XYL	Lyon Perrache RailwaySvc	45.7640430000000009	4.83565899999999971
7503	\N	\N	XYQ	Angelholm Railway	56.2432000000000016	12.8615092000000004
7504	\N	\N	XYR	Yellow River	-3.88333299999999992	141.78334000000001
7505	\N	\N	XZA	Zabre	11.1333330000000004	-1
7506	\N	\N	XZN	Avignon Railway	43.9493170000000006	4.8055279999999998
7507	\N	\N	YAA	Anahim Lake	52.4500000000000028	-125.299999999999997
7508	\N	\N	YAB	Arctic Bay	73.0333300000000065	-85.1833340000000021
7509	\N	\N	YAC	Cat Lake	51.7166670000000011	-91.8166659999999979
7510	\N	\N	YAD	Moose Lake	50.3833300000000008	-105.533330000000007
7511	\N	\N	YAE	Alta Lake	50.1666680000000014	-123
7512	\N	\N	YAF	Asbestos Hill	45.7666660000000007	-71.9500000000000028
7513	\N	\N	YAH	Lagrande 4	53.75	-73.6500000000000057
7514	\N	\N	YAI	Chillan	-36.6000000000000014	-72.1166699999999992
7515	\N	\N	YAJ	Lyall Harbour	48.7999999999999972	-123.200000000000003
7516	\N	\N	YAL	Alert Bay	50.5833319999999986	-126.916663999999997
7517	\N	\N	YAN	Yangambi	0.783332999999999946	24.3999999999999986
7518	\N	\N	YAO	Yaounde Airport	3.83361099999999988	11.5236110000000007
7519	\N	\N	YAQ	Maple Bay	48.8166659999999979	-123.616669999999999
7520	\N	\N	YAR	Lagrande 3	53.5499999999999972	-76.2000000000000028
7521	\N	\N	YAS	Yasawa Island	-16.7833329999999989	177.516660000000002
7522	\N	\N	YAT	Attawapiskat	52.9416659999999979	-82.4000000000000057
7523	\N	\N	YAU	Kattiniq/donaldson	61.6627769999999984	-73.3169400000000024
7524	\N	\N	YAV	Miners Bay	48.8666699999999992	-123.299999999999997
7525	\N	\N	YAW	Shearwater	44.8666699999999992	-63.6166699999999992
7526	\N	\N	YAX	Angling Lake	53.2519449999999992	-89.5649999999999977
7527	\N	\N	YAY	St Anthony	51.3666699999999992	-55.5833319999999986
7528	\N	\N	YAZ	Tofino Airport	49.0769420000000025	-125.776390000000006
7529	\N	\N	YBA	Banff	51.1666680000000014	-115.566665999999998
7530	\N	\N	YBC	Baie Comeau	49.2000000000000028	-68.2666700000000048
7531	\N	\N	YBD	New Westminster	49.2166670000000011	-122.900000000000006
7532	\N	\N	YBE	Uranium City	59.5666659999999979	-108.483329999999995
7533	\N	\N	YBF	Bamfield	48.8333319999999986	-125.133330000000001
7534	\N	\N	YBG	Bagotville	48.3222239999999985	-70.9886099999999942
7535	\N	\N	YBI	Black Tickle	53.4500000000000028	-55.7333339999999993
7536	\N	\N	YBJ	Baie Johan Beetz	50.5	-62.9166680000000014
7537	\N	\N	YBK	Baker Lake	64.2999999999999972	-96.0833360000000027
7538	\N	\N	YBM	Bronson Creek	56.7000000000000028	-131
7539	\N	\N	YBN	Borden	46.2999999999999972	-63.7833329999999989
7540	\N	\N	YBO	Bob Quinn Lake	56.9666670000000011	-130.25
7541	\N	\N	YBQ	Telegraph Harbour	48.9833339999999993	-123.650000000000006
7542	\N	\N	YBS	Musselwhite	52.6066670000000016	-90.3769450000000063
7543	\N	\N	YBT	Brochet	57.8833300000000008	-101.666663999999997
7544	\N	\N	YBV	Berens River	52.355556	-97.0166700000000048
7545	\N	\N	YBW	Springbank	48.75	-123.233329999999995
7546	\N	\N	YBX	Blanc Sablon	51.4333340000000021	-57.2166670000000011
7547	\N	\N	YBY	Bonnyville	54.2666660000000007	-110.733329999999995
7548	\N	\N	YBZ	Toronto Downtown	43.6535239999999973	-79.3839068999999995
7549	\N	\N	YCA	Courtenay	49.6833340000000021	-124.983329999999995
7550	\N	\N	YCB	Cambridge Bay	69.0999999999999943	-105.133330000000001
7551	\N	\N	YCC	Regional	45.1000000000000014	-74.5666659999999979
7552	\N	\N	YCE	Centralia	43.2833329999999989	-81.4833299999999952
7553	\N	\N	YCF	Cortes Bay	50.0666659999999979	-124.933334000000002
7554	\N	\N	YCG	Castlegar	49.2955550000000002	-117.632225000000005
7555	\N	\N	YCH	Miramichi	47.0140079999999969	-65.4474400000000003
7556	\N	\N	YCI	Caribou Island	61.9166680000000014	-113.25
7557	\N	\N	YCJ	Cape St James	51.9333340000000021	-131.016660000000002
7558	\N	\N	YCK	Colville Lake	67.0399299999999982	-126.090469999999996
7559	\N	\N	YCM	St Catharines	43.2000000000000028	-79.1666639999999973
7560	\N	\N	YCN	Cochrane	49.0666659999999979	-81.0166700000000048
7561	\N	\N	YCO	Kugluktuk	67.8333360000000027	-115.083336000000003
7562	\N	\N	YCP	Co-op Point	57.0666659999999979	-102.033330000000007
7563	\N	\N	YCQ	Chetwynd	55.6833340000000021	-121.633330000000001
7564	\N	\N	YCR	Cross Lake	54.6333300000000008	-97.7999999999999972
7565	\N	\N	YCT	Coronation	52.1000000000000014	-111.416663999999997
7566	\N	\N	YCV	Cartierville	45.5166660000000007	-73.75
7567	\N	\N	YCW	Chilliwack Municipalcipal Airport	49.1666680000000014	-121.900000000000006
7568	\N	\N	YCX	Gagetown	45.7666660000000007	-66.1666639999999973
7569	\N	\N	YCY	Clyde River	70.4166639999999973	-68.5
7570	\N	\N	YCZ	Fairmont Hot Springs	50.331944	-115.873609999999999
7571	\N	\N	YDA	Dawson City	64.0416639999999973	-139.120830000000012
7572	\N	\N	YDB	Burwash Landings	61.3500000000000014	-139.016660000000002
7573	\N	\N	YDC	Industrial Airport	53.2000000000000028	-114.966669999999993
7574	\N	\N	YDE	Paradise River	53.4333340000000021	-57.2333339999999993
7575	\N	\N	YDF	Deer Lake	49.2102700000000013	-57.3997269999999986
7576	\N	\N	YDG	Digby	44.6166699999999992	-65.7666700000000048
7577	\N	\N	YDH	Daniels Harbour	50.2166670000000011	-57.5833319999999986
7578	\N	\N	YDI	Davis Inlet	55.9333340000000021	-60.9500000000000028
7579	\N	\N	YDJ	Hatchet Lake	58.6605569999999972	-102.539444000000003
7580	\N	\N	YDK	Main Duck Island	43.9333340000000021	-76.6166699999999992
7581	\N	\N	YDL	Dease Lake	58.5833319999999986	-130.03334000000001
7582	\N	\N	YDN	Dauphin	51.1000000000000014	-100.049999999999997
7583	\N	\N	YDO	St Methode	48.8666699999999992	-72.2333299999999952
7584	\N	\N	YDQ	Dawson Creek	55.7333339999999993	-120.183334000000002
7585	\N	\N	YDR	Broadview	50.3666699999999992	-102.583336000000003
7586	\N	\N	YDS	Desolation Sound	49.965995999999997	-124.729309999999998
7587	\N	\N	YDT	Boundary Bay	49.1833340000000021	-123.183334000000002
7588	\N	\N	YDU	Kasba Lake	60.2902800000000028	-102.503333999999995
7589	\N	\N	YDV	Bloodvein	51.75	-96.7333299999999952
7590	\N	\N	YDW	Obre Lake	60.3230549999999965	-103.13306
7591	\N	\N	YDX	Doc Creek	52.0499999999999972	-128.083329999999989
7592	\N	\N	YEC	Yecheon	36.625	128.35499999999999
7593	\N	\N	YEL	Elliot Lake	46.3522219999999976	-82.563059999999993
7594	\N	\N	YEM	East Manitoulin	45.8427769999999981	-81.8580549999999931
7595	\N	\N	YEN	Estevan	49.1666680000000014	-102.983329999999995
7596	\N	\N	YEO	Yeovilton	51.0166660000000007	-2.54999999999999982
7597	\N	\N	YEP	Estevan Point	49.3833300000000008	-126.533330000000007
7598	\N	\N	YEQ	Yenkis	-5.09999999999999964	143.916670000000011
7599	\N	\N	YER	Fort Severn	56.0333329999999989	-87.8333360000000027
7600	\N	\N	YES	Yasouj	30.6997740000000015	51.5527599999999993
7601	\N	\N	YET	Edson	53.5833319999999986	-116.466669999999993
7602	\N	\N	YEU	Eureka	80	-85.9333340000000021
7603	\N	\N	YEV	Inuvik/mike Zubko	68.3066500000000048	-133.497669999999999
7604	\N	\N	YEY	Amos	48.5522229999999979	-78.25
7605	\N	\N	YFA	Fort Albany	52.2416699999999992	-81.5916699999999935
7606	\N	\N	YFC	Fredericton	45.8731599999999986	-66.5297800000000024
7607	\N	\N	YFE	Forestville	48.75	-69.0666659999999979
7608	\N	\N	YFG	Fontanges	54.5499999999999972	-71.1833340000000021
7609	\N	\N	YFH	Fort Hope	51.5593450000000004	-87.8979599999999976
7610	\N	\N	YFJ	Snare Lake	64.1905600000000049	-114.075553999999997
7611	\N	\N	YFL	Fort Reliance	62.7000000000000028	-109.133330000000001
7612	\N	\N	YFO	Flin Flon	54.6833340000000021	-101.683334000000002
7613	\N	\N	YFR	Fort Resolution	61.1833340000000021	-113.683334000000002
7614	\N	\N	YFS	Fort Simpson	61.75	-121.233329999999995
7615	\N	\N	YFX	Fox Harbour (St Lewis)	52.3666699999999992	-55.6833340000000021
7616	\N	\N	YGA	Gagnon	51.9500000000000028	-68.1333300000000008
7617	\N	\N	YGB	Gillies Bay	49.7000000000000028	-124.533330000000007
7618	\N	\N	YGC	Grande Cache	53.9166680000000014	-118.866669999999999
7619	\N	\N	YGE	Gorge Harbor	50.0833319999999986	-124.950000000000003
7620	\N	\N	YGG	Ganges Harbor	48.8500000000000014	-123.5
7621	\N	\N	YGH	Fort Good Hope	66.2666700000000048	-128.650000000000006
7622	\N	\N	YGK	Kingston	44.2195129999999992	-76.5936599999999999
7623	\N	\N	YGL	La Grande	53.6297229999999985	-77.706389999999999
7624	\N	\N	YGM	Gimli	50.6666680000000014	-97
7625	\N	\N	YGN	Greenway Sound	50.8500000000000014	-126.849999999999994
7626	\N	\N	YGO	Gods Narrows	54.5499999999999972	-94.4833299999999952
7627	\N	\N	YGQ	Geraldton	49.7333339999999993	-86.9500000000000028
7628	\N	\N	YGS	Germansen	55.7833329999999989	-124.716669999999993
7629	\N	\N	YGT	Igloolik	69.4000000000000057	-81.8166659999999979
7630	\N	\N	YGV	Havre St Pierre	50.25	-63.5833319999999986
7631	\N	\N	YGW	Kuujjuarapik	55.2791670000000011	-77.7666700000000048
7632	\N	\N	YGX	Gillam	56.3500000000000014	-94.7000000000000028
7633	\N	\N	YGY	Deception	62.1000000000000014	-74.6166699999999992
7634	\N	\N	YGZ	Grise Fiord	76.4177799999999934	-82.9572200000000066
7635	\N	\N	YHA	Port Hope Simpson	52.5333329999999989	-56.2999999999999972
7636	\N	\N	YHB	Hudson Bay	52.8666699999999992	-102.416663999999997
7637	\N	\N	YHC	Hakai Pass	51.7333339999999993	-128.116669999999999
7638	\N	\N	YHD	Dryden Municipal	49.7833329999999989	-92.8333360000000027
7639	\N	\N	YHE	Hope	49.4166680000000014	-121.416663999999997
7640	\N	\N	YHF	Hearst	49.7166670000000011	-83.6833340000000021
7641	\N	\N	YHG	Charlottetown	52.7666660000000007	-56.1000000000000014
7642	\N	\N	YHH	Harbor SPB	49.946390000000001	-125.265559999999994
7643	\N	\N	YHK	Gjoa Haven	68.6333300000000008	-95.9500000000000028
7644	\N	\N	YHM	John C. Munroe	43.1613800000000012	-79.9263100000000009
7645	\N	\N	YHN	Hornepayne	49.2166670000000011	-84.7833300000000065
7646	\N	\N	YHO	Hopedale	55.4483340000000027	-60.2294430000000034
7647	\N	\N	YHP	Poplar Hill	52.0833319999999986	-94.2999999999999972
7648	\N	\N	YHR	Chevery	50.5	-59.5
7649	\N	\N	YHS	Sechelt	49.4666670000000011	-123.75
7650	\N	\N	YHT	Haines Junction	60.75	-137.5
7651	\N	\N	YHU	St Hubert	45.5	-73.5999999999999943
7652	\N	\N	YHY	Hay River	60.8455539999999999	-115.778335999999996
7653	\N	\N	YIB	Atikokan	48.75	-91.6166699999999992
7654	\N	\N	YIF	Pakuashipi	51.2166670000000011	-58.6666680000000014
7655	\N	\N	YIG	Big Bay Marina	50.3833300000000008	-125.133330000000001
7656	\N	\N	YIH	Yichang	30.5499340000000004	111.478935000000007
7657	\N	\N	YIK	Ivujivik	62.4166680000000014	-76.0833360000000027
7658	\N	\N	YIO	Pond Inlet	72.6833340000000021	-78
7659	\N	\N	YIV	Island Lk/Garden Hill	54.2000000000000028	-94.7833300000000065
7660	\N	\N	YJF	Fort Liard	60.25	-123.466669999999993
7661	\N	\N	YJN	St Jean	45.3333319999999986	-73.3333360000000027
7662	\N	\N	YJO	Johnny Mountain	56.6666680000000014	-131.116669999999999
7663	\N	\N	YJP	Jasper-hinton	53.3191679999999977	-117.753060000000005
7664	\N	\N	YJT	Stephenville	48.5333329999999989	-58.5499999999999972
7665	\N	\N	YKA	Kamloops	50.705449999999999	-120.442024000000004
7666	\N	\N	YKC	Collins Bay	44.25	-76.5999999999999943
7667	\N	\N	YKD	Township Airport	44.2013900000000035	-81.606669999999994
7668	\N	\N	YKE	Knee Lake	53.0499999999999972	-94.6666639999999973
7669	\N	\N	YKG	Kangirsuk	60.0230829999999997	-70.0045999999999964
7670	\N	\N	YKI	Kennosao Lake	58.9799999999999969	23.8599999999999994
7671	\N	\N	YKJ	Key Lake	57.25	-105.599999999999994
7672	\N	\N	YKK	Kitkatla	53	-130
7673	\N	\N	YKL	Schefferville	54.7833329999999989	-64.8166659999999979
7674	\N	\N	YKM	Yakima Air Terminal	46.5669439999999994	-120.537779999999998
7675	\N	\N	YKN	Chan Gurney	42.9169430000000034	-97.3863900000000058
7676	\N	\N	YKQ	Waskaganish	51.4874999999999972	-78.75
7677	\N	\N	YKS	Yakutsk	62.0856059999999985	129.750059999999991
7678	\N	\N	YKU	Chisasibi	53.8068239999999989	-78.9240649999999988
7679	\N	\N	YKX	Kirkland Lake	48.1499999999999986	-80.0333300000000065
7680	\N	\N	YKY	Kindersley	51.4500000000000028	-109.166663999999997
7681	\N	\N	YKZ	Buttonville Municipalcipal	43.8666699999999992	-79.3666699999999992
7682	\N	\N	YLA	Langara	54.2333339999999993	-133.016660000000002
7683	\N	\N	YLB	Lac Biche	54.7666660000000007	-112.016670000000005
7684	\N	\N	YLD	Chapleau	47.8194429999999997	-83.3527760000000058
7685	\N	\N	YLF	LaForges	54.1833340000000021	-72.4833299999999952
7686	\N	\N	YLG	Yalgoo	-28.3500000000000014	116.666663999999997
7687	\N	\N	YLI	Ylivieska	64.0544399999999996	24.7288899999999998
7688	\N	\N	YLJ	Meadow Lake	54.5	-108.666663999999997
7689	\N	\N	YLL	Lloydminster	53.31297	-110.072716
7690	\N	\N	YLM	Clinton Creek	64.4000000000000057	-140.550000000000011
7691	\N	\N	YLN	Yilan	46.3833300000000008	129.5
7692	\N	\N	YLO	Shilo	49.7816660000000013	-99.6383359999999954
7693	\N	\N	YLP	Mingan	50.2833329999999989	-64.1500000000000057
7694	\N	\N	YLQ	La Tuque	47.5	-72.8333360000000027
7695	\N	\N	YLR	Leaf Rapids	56.5	-100.033330000000007
7696	\N	\N	YLS	Lebel-Sur-Quevillon	49.0333329999999989	-77.0166700000000048
7697	\N	\N	YLT	Alert	82.5166700000000048	-62.2833329999999989
7698	\N	\N	YLW	Kelowna Airport	49.9515400000000014	-119.381389999999996
7699	\N	\N	YLX	Long Point	59.3500000000000014	-94.6800000000000068
7700	\N	\N	YLY	Langley Regional	49.100833999999999	-122.630840000000006
7701	\N	\N	YMA	Mayo	63.6163900000000027	-135.873610000000014
7702	\N	\N	YMB	Merritt	50.1166699999999992	-120.75
7703	\N	\N	YMC	Maricourt Airstrip	56.5666659999999979	-70.8166659999999979
7704	\N	\N	YMD	Mould Bay	76.25	-119.5
7705	\N	\N	YME	Matane	48.8333319999999986	-67.5166700000000048
7706	\N	\N	YMF	Montagne Harbor	48.8166659999999979	-123.200000000000003
7707	\N	\N	YMG	Manitouwadge	49.0833319999999986	-85.8666699999999992
7708	\N	\N	YMI	Minaki	50	-94.6666639999999973
7709	\N	\N	YMJ	Moose Jaw / Air Vice Marshal C. M. Mcewen Airport	50.3833300000000008	-105.533330000000007
7710	\N	\N	YML	Charlevoix	47.6499999999999986	-70.1666639999999973
7711	\N	\N	YMM	Fort Mcmurray	56.6565900000000013	-111.223950000000002
7712	\N	\N	YMN	Makkovik	55.1666680000000014	-59.1666680000000014
7713	\N	\N	YMP	Port McNeil	50.6111099999999965	-127.097219999999993
7714	\N	\N	YMR	Merry Island	55.4833339999999993	-77.5166700000000048
7715	\N	\N	YMS	Yurimaguas	-5.90000000000000036	-76.0999999999999943
7716	\N	\N	YMT	Chibougamau	49.9166680000000014	-74.3666699999999992
7717	\N	\N	YMW	Maniwaki	46.3833300000000008	-75.9666699999999935
7718	\N	\N	YMX	Mirabel	45.6666680000000014	-74.0300000000000011
7719	\N	\N	YNA	Natashquan	50.1833340000000021	-61.7999999999999972
7720	\N	\N	YND	Executive Gatineau-Ottawa	45.4833339999999993	-75.6333300000000008
7721	\N	\N	YNE	Norway House	53.9541660000000007	-97.8458300000000065
7722	\N	\N	YNF	Deer Lake/Stephenville	48.9469449999999995	-57.9438900000000032
7723	\N	\N	YNG	Youngstown	41.2561099999999996	-80.6697199999999981
7724	\N	\N	YNI	Nitchequon	53.1666680000000014	-70.9666699999999935
7725	\N	\N	YNJ	Yanji	42.8856620000000035	129.439359999999994
7726	\N	\N	YNK	Nootka Sound	50.0833319999999986	-125.916663999999997
7727	\N	\N	YNL	Points North Landing	58.2749999999999986	-104.081109999999995
7728	\N	\N	YNM	Matagami	49.75	-77.7999999999999972
7729	\N	\N	YNN	Yandi	-22.7666660000000007	119.233329999999995
7730	\N	\N	YNP	Natuashish	55.9138900000000021	-61.1844439999999992
7731	\N	\N	YNR	Arnes	50.8333319999999986	-97
7732	\N	\N	YNS	Nemiscau	49.7416699999999992	-76.7416699999999992
7733	\N	\N	YNT	Yantai	37.4073259999999976	121.371099999999998
7734	\N	\N	YNY	Yangyang	38.0666659999999979	128.599999999999994
7735	\N	\N	YNZ	Yancheng	33.4346800000000002	120.204179999999994
7736	\N	\N	YOA	Ekati	64.6994499999999988	-110.614440000000002
7737	\N	\N	YOC	Old Crow	67.5833360000000027	-139.833329999999989
7738	\N	\N	YOD	Cold Lake	54.4666670000000011	-110.25
7739	\N	\N	YOE	Falher	55.7333339999999993	-117.25
7740	\N	\N	YOH	Oxford House	54.9500000000000028	-95.2833300000000065
7741	\N	\N	YOJ	Footner Lake	58.6183320000000023	-117.168334999999999
7742	\N	\N	YOK	Yokohama	35.4666670000000011	139.46665999999999
7743	\N	\N	YOO	Oshawa	43.9166680000000014	-78.9000000000000057
7744	\N	\N	YOP	Rainbow Lake	58.5	-119.400000000000006
7745	\N	\N	YOS	Billy Bishop Regional	44.5902799999999999	-80.8375000000000057
7746	\N	\N	YOT	Yotvata	29.8999999999999986	35.0666659999999979
7747	\N	\N	YOY	Valcartier	45	-72
7748	\N	\N	YPB	Port Alberni	49.2333339999999993	-124.799999999999997
7749	\N	\N	YPC	Paulatuk	69.3551400000000058	-124.074680000000001
7750	\N	\N	YPD	Parry Sound	45.4166680000000014	-79.9166639999999973
7751	\N	\N	YPE	Peace River	56.2277800000000028	-117.440280000000001
7752	\N	\N	YPF	Esquimalt	48.4333340000000021	-123.400000000000006
7753	\N	\N	YPG	Portage La Prairie	49.9666670000000011	-98.2999999999999972
7754	\N	\N	YPH	Inukjuak	58.4333340000000021	-78.1666639999999973
7755	\N	\N	YPI	Port Simpson	54.5	-130.333329999999989
7756	\N	\N	YPL	Pickle Lake	51.2083319999999986	-90.2083360000000027
7757	\N	\N	YPM	Pikangikum	51.8173749999999984	-93.9728700000000003
7758	\N	\N	YPN	Port Menier	49.8333319999999986	-64.2833300000000065
7759	\N	\N	YPP	Pine Point	60.8500000000000014	-114.849999999999994
7760	\N	\N	YPQ	Peterborough	44.2999999999999972	-78.3166659999999979
7761	\N	\N	YPR	Digby Island	54.2872240000000019	-130.440830000000005
7762	\N	\N	YPS	Port Hawkesbury	45.6166699999999992	-61.3500000000000014
7763	\N	\N	YPT	Pender Harbor	49.4934920000000034	-123.98066
7764	\N	\N	YPW	Powell River	49.8166659999999979	-124.5
7765	\N	\N	YPX	Puvirnituq	60.0333329999999989	-77.1666639999999973
7766	\N	\N	YPY	Fort Chipewyan	58.7625000000000028	-111.120834000000002
7767	\N	\N	YPZ	Burns Lake	54.2333339999999993	-125.766670000000005
7768	\N	\N	YQA	Muskoka	44.9666670000000011	-79.2999999999999972
7769	\N	\N	YQB	Québec	46.792037999999998	-71.3833850000000041
7770	\N	\N	YQE	Kimberley	49.6666680000000014	-115.983329999999995
7771	\N	\N	YQF	Red Deer	52.1769450000000035	-113.893330000000006
7772	\N	\N	YQG	Windsor	42.274166000000001	-82.9638900000000064
7773	\N	\N	YQH	Watson Lake	60.1236099999999993	-128.824999999999989
7774	\N	\N	YQI	Yarmouth	43.8333319999999986	-66.0833360000000027
7775	\N	\N	YQL	Lethbridge	49.6319429999999997	-112.791663999999997
7776	\N	\N	YQN	Nakina	50.1666680000000014	-86.7000000000000028
7777	\N	\N	YQQ	Comox	49.7058639999999983	-124.907814000000002
7778	\N	\N	YQR	Regina	50.4333269999999985	-104.655190000000005
7779	\N	\N	YQS	Pembroke Area Municipalcipal	42.7833329999999989	-81.2000000000000028
7780	\N	\N	YQT	Thunder Bay	48.3718399999999988	-89.3116700000000066
7781	\N	\N	YQU	Grande Prairie	55.1770739999999975	-118.873604
7782	\N	\N	YQV	Yorkton	51.2166670000000011	-102.466669999999993
7783	\N	\N	YQW	North Battleford	52.7666660000000007	-108.25
7784	\N	\N	YQX	Gander International	48.9466669999999979	-54.5633300000000006
7785	\N	\N	YQY	Sydney	46.1666680000000014	-60.0499999999999972
7786	\N	\N	YQZ	Quesnel	53.0266700000000029	-122.509720000000002
7787	\N	\N	YRA	Rae Lakes	64.1166699999999992	-117.349999999999994
7788	\N	\N	YRB	Resolute	74.7166699999999935	-94.9666699999999935
7789	\N	\N	YRD	Dean River	52.8333319999999986	-127
7790	\N	\N	YRE	Resolution Island	61.5	-65
7791	\N	\N	YRF	Cartwright	53.6826059999999998	-57.0382800000000003
7792	\N	\N	YRG	Rigolet	54.3333319999999986	-58.4166680000000014
7793	\N	\N	YRI	Riviere Du Loup	47.8333319999999986	-69.5333300000000065
7794	\N	\N	YRJ	Roberval	48.5166660000000007	-72.2166699999999935
7795	\N	\N	YRL	Red Lake	51.0687640000000016	-93.800060000000002
7796	\N	\N	YRM	Rocky Mountain House	52.3666699999999992	-114.916663999999997
7797	\N	\N	YRN	Rivers Inlet	51.4666670000000011	-127.583336000000003
7798	\N	\N	YRO	Rockcliffe St	45.4500000000000028	-75.7000000000000028
7799	\N	\N	YRQ	Trois-Rivieres	46.3500000000000014	-72.6833340000000021
7800	\N	\N	YRR	Stuart Island	50.4166680000000014	-125.166663999999997
7801	\N	\N	YRS	Red Sucker Lake	54.1666680000000014	-93.5833360000000027
7802	\N	\N	YRT	Nuuk	62.809980000000003	-92.1001899999999978
7803	\N	\N	YRV	Revelstoke	51	-118.166663999999997
7804	\N	\N	YSA	Sable Island	44	-60
7805	\N	\N	YSC	Sherbrooke	45.4166680000000014	-71.9000000000000057
7806	\N	\N	YSD	Suffield	50.2000000000000028	-111.166663999999997
7807	\N	\N	YSE	Squamish	52.1166699999999992	-101.233329999999995
7808	\N	\N	YSF	Stony Rapids	59.25	-105.833336000000003
7809	\N	\N	YSG	Lutselke	62.418610000000001	-110.075553999999997
7810	\N	\N	YSH	Smith Falls	44.9482900000000001	-75.9395899999999955
7811	\N	\N	YSI	Sans Souci	46	-80
7812	\N	\N	YSJ	Saint John	45.3294799999999967	-65.890199999999993
7813	\N	\N	YSK	Sanikiluaq	56.5499999999999972	-79.2166699999999935
7814	\N	\N	YSL	St Leonard	47.1833340000000021	-67.9000000000000057
7815	\N	\N	YSM	Fort Smith	60.0166660000000007	-111.966669999999993
7816	\N	\N	YSN	Salmon Arm	50.6833340000000021	-119.233329999999995
7817	\N	\N	YSO	Postville	54.9166680000000014	-59.9666670000000011
7818	\N	\N	YSP	Marathon	48.75	-86.3499999999999943
7819	\N	\N	YSQ	Spring Island	59.4500000000000028	-1.78000000000000003
7820	\N	\N	YSR	Nanisivik	73.75	-84.5
7821	\N	\N	YSS	Slate Island	-33.9329219999999978	151.179900000000004
7822	\N	\N	YST	Ste Therese Point	53.8500000000000014	-94.6500000000000057
7823	\N	\N	YSU	Summerside	49	-57.9833339999999993
7824	\N	\N	YSV	Saglek	58.5833319999999986	-62.5
7825	\N	\N	YSX	Shearwater	52.1333300000000008	-128.066669999999988
7826	\N	\N	YSY	Sachs Harbour	71.9914500000000004	-125.241039999999998
7827	\N	\N	YSZ	Squirrel Cove	50.0499999999999972	-124.916663999999997
7828	\N	\N	YTA	Pembroke And Area Airport	45.8616680000000017	-77.249440000000007
7829	\N	\N	YTB	Hartley Bay	53.4166680000000014	-129.25
7830	\N	\N	YTC	Sturdee	57.2000000000000028	-127.150000000000006
7831	\N	\N	YTD	Thicket Portage	55.3166659999999979	-97.7000000000000028
7832	\N	\N	YTE	Cape Dorset	64.2333299999999952	-76.5333300000000065
7833	\N	\N	YTF	Alma	48.5333329999999989	-71.6666639999999973
7834	\N	\N	YTG	Sullivan Bay	50.8833300000000008	-126.799999999999997
7835	\N	\N	YTI	Triple Island	-29.456944	142.06223
7836	\N	\N	YTJ	Terrace Bay	48.75	-87.1666639999999973
7837	\N	\N	YTK	Tulugak	59.5	-77.75
7838	\N	\N	YTL	Big Trout	53.8159399999999977	-89.8895200000000045
7839	\N	\N	YTM	La Macaza	46.5155559999999966	-74.7552799999999991
7840	\N	\N	YTN	Riviere Au Tonnerre	50.2833329999999989	-64.75
7841	\N	\N	YTP	Seaplane Base	49.1544460000000001	-125.408060000000006
7842	\N	\N	YTQ	Tasiujuaq	58.6677999999999997	-69.9563299999999941
7843	\N	\N	YTR	Trenton	44.1000000000000014	-77.5833360000000027
7844	\N	\N	YTT	Tisdale	52.8500000000000014	-104.066665999999998
7845	\N	\N	YTU	Tasu	49.1000000000000014	-124.933334000000002
7846	\N	\N	YTX	Telegraph Creek	57.8999999999999986	-131.150000000000006
7847	\N	\N	YUA	Yuanmou	25.6499999999999986	101.916663999999997
7848	\N	\N	YUB	Tuktoyaktuk	69.4363859999999988	-133.025000000000006
7849	\N	\N	YUE	Yuendumu	-22.2666660000000007	131.816669999999988
7850	\N	\N	YUT	Repulse Bay	66.5333300000000065	-86.25
7851	\N	\N	YUX	Hall Beach	68.7833300000000065	-81.25
7852	\N	\N	YUY	Rouyn-Noranda	48.2055549999999968	-78.8305600000000055
7853	\N	\N	YVB	Bonaventure	48.0499999999999972	-65.4833299999999952
7854	\N	\N	YVC	La Ronge	55.0833319999999986	-105.333336000000003
7855	\N	\N	YVD	Yeva	-7.54999999999999982	146.188889999999986
7856	\N	\N	YVE	Vernon Regional Airport	50.25	-119.333336000000003
7857	\N	\N	YVG	Vermilion	53.3500000000000014	-110.816665999999998
7858	\N	\N	YVM	Qikiqtarjuaq	67.5833360000000027	-63.8333319999999986
7859	\N	\N	YVO	Aéroport Régional De Val-d'or	48.0526049999999998	-77.7885799999999961
7860	\N	\N	YVP	Kuujjuaq	58.1002399999999994	-68.41798
7861	\N	\N	YVQ	Norman Wells	65.2778550000000024	-126.793369999999996
7862	\N	\N	YVR	Vancouver International	49.1946999999999974	-123.179190000000006
7863	\N	\N	YVT	Buffalo Narrows	55.8666699999999992	-108.466669999999993
7864	\N	\N	YVV	Wiarton/Keppel Airport	44.6666680000000014	-81.1666639999999973
7865	\N	\N	YVZ	Deer Lake	52.6666680000000014	-94.5
7866	\N	\N	YWA	Petawawa	45.8999999999999986	-77.2833300000000065
7867	\N	\N	YWB	Kangiqsujuaq	61.6000000000000014	-71.9500000000000028
7868	\N	\N	YWF	Downtown Waterfront Heliport	44.6333300000000008	-63.5833319999999986
7869	\N	\N	YWL	Williams Lake	52.1847229999999982	-122.044439999999994
7870	\N	\N	YWM	Williams Harbour	52.3354380000000035	-56.0128199999999978
7871	\N	\N	YWN	Winisk	55.25	-85.1166699999999992
7872	\N	\N	YWO	Lupin	65.7583300000000008	-111.25
7873	\N	\N	YWQ	Chute-Des-Passes	49.8872220000000013	-71.2538899999999984
7874	\N	\N	YWR	White River	48.5833319999999986	-85.3333360000000027
7875	\N	\N	YWS	Whistler	50.1499999999999986	-122.966669999999993
7876	\N	\N	YWY	Wrigley	63.2105559999999969	-123.438614000000001
7877	\N	\N	YXC	Cranbrook	49.614370000000001	-115.787025
7878	\N	\N	YXD	Edmonton City Centre (Blatchford Field) Airport	53.5666659999999979	-113.516670000000005
7998	\N	\N	ZLT	La Tabatiere	50.8280559999999966	-58.9760100000000023
7879	\N	\N	YXE	John G. Diefenbaker International	52.169704000000003	-106.690370000000001
7880	\N	\N	YXF	Snake River	59.0333329999999989	-122.433334000000002
7881	\N	\N	YXI	Killaloe	45.5499999999999972	-77.4166639999999973
7882	\N	\N	YXJ	Fort St John	56.2478830000000016	-120.734369999999998
7883	\N	\N	YXK	Rimouski	48.4333340000000021	-68.5499999999999972
7884	\N	\N	YXL	Sioux Lookout	50.1152080000000026	-91.9030000000000058
7885	\N	\N	YXN	Whale Cove	62.2333339999999993	-92.5999999999999943
7886	\N	\N	YXP	Pangnirtung	66.1333300000000008	-65.7333299999999952
7887	\N	\N	YXQ	Beaver Creek	62	-141
7888	\N	\N	YXR	Earlton	47.6972239999999985	-79.8519440000000031
7889	\N	\N	YXU	London International	43.0280199999999979	-81.1496499999999941
7890	\N	\N	YXX	Abbotsford	49.0255549999999971	-122.361946000000003
7891	\N	\N	YXY	Whitehorse International	60.7166670000000011	-135.066669999999988
7892	\N	\N	YXZ	Wawa Airport	47.9624999999999986	-84.7858350000000058
7893	\N	\N	YYA	Big Bay Yacht Club	50.3999999999999986	-123.133330000000001
7894	\N	\N	YYB	North Bay	46.3568229999999986	-79.4272500000000008
7895	\N	\N	YYC	Calgary International Airport	51.1313930000000028	-114.010549999999995
7896	\N	\N	YYE	Fort Nelson	58.8333319999999986	-122.583336000000003
7897	\N	\N	YYF	Penticton	49.4647199999999998	-119.599999999999994
7898	\N	\N	YYG	Charlottetown	46.285896000000001	-63.1317370000000011
7899	\N	\N	YYH	Taloyoak	69.5333300000000065	-93.5166700000000048
7900	\N	\N	YYI	Rivers	50.0333329999999989	-100.233329999999995
7901	\N	\N	YYL	Lynn Lake	56.8666699999999992	-101.066665999999998
7902	\N	\N	YYM	Cowley	49.8666699999999992	-114.166663999999997
7903	\N	\N	YYN	Swift Current	50.2833329999999989	-107.833336000000003
7904	\N	\N	YYQ	Churchill Airport	58.748190000000001	-94.0744899999999973
7905	\N	\N	YYR	Goose Bay	53.3135339999999971	-60.4123999999999981
7906	\N	\N	YYT	St. John's International	47.6128199999999993	-52.7433400000000034
7907	\N	\N	YYU	Kapuskasing	49.4125000000000014	-82.4708300000000065
7908	\N	\N	YYW	Armstrong	50.2833329999999989	-89.0333300000000065
7909	\N	\N	YYY	Mont Joli	48.6000000000000014	-68.2000000000000028
7910	\N	\N	YZA	Ashcroft	50.6666680000000014	-121.333336000000003
7911	\N	\N	YZC	Beatton River	57.4333340000000021	-121.333336000000003
7912	\N	\N	YZE	Gore Bay	45.8852770000000021	-82.5677799999999991
7913	\N	\N	YZF	Yellowknife	62.4708669999999984	-114.4375
7914	\N	\N	YZH	Slave Lake	55.2999999999999972	-114.783330000000007
7915	\N	\N	YZM	Buchans	48.8333319999999986	-56.8666699999999992
7916	\N	\N	YZP	Sandspit	53.2544439999999994	-131.81277
7917	\N	\N	YZS	Coral Harbour	64.2000000000000028	-83.3666699999999992
7918	\N	\N	YZT	Port Hardy	50.6805570000000003	-127.363889999999998
7919	\N	\N	YZU	Whitecourt	54.1499999999999986	-115.783330000000007
7920	\N	\N	YZV	Sept-Iles	50.2175099999999972	-66.2640399999999943
7921	\N	\N	YZW	Teslin	60.1666680000000014	-132.71665999999999
7922	\N	\N	YZX	Greenwood	49.1666680000000014	-118.666663999999997
7923	\N	\N	YZZ	Trail Regional Airport	49.0666659999999979	-117.599999999999994
7924	\N	\N	ZAA	Alice Arm	55.4833339999999993	-129.483339999999998
7925	\N	\N	ZAC	York Landing	56.0833319999999986	-96.0999999999999943
7926	\N	\N	ZAJ	Zaranj	31.1000000000000014	61.9833339999999993
7927	\N	\N	ZAM	Zamboanga International	6.91929399999999983	122.062256000000005
7928	\N	\N	ZAO	Laberandie	44.4500000000000028	1.44999999999999996
7929	\N	\N	ZAR	Zaria	11	7.66666700000000034
7930	\N	\N	ZAY	De Keyserlei Bus Station	51.2199200000000019	4.39625000000000021
7931	\N	\N	ZAZ	Zaragoza	41.6638599999999997	-1.00746599999999997
7932	\N	\N	ZBD	Jiang Men Ferry	29.7050960000000011	116.001981999999998
7933	\N	\N	ZBE	Dolni Benesov	49.8833300000000008	16.8666669999999996
7934	\N	\N	ZBF	Bathurst	47.6291659999999979	-65.7394400000000019
7935	\N	\N	ZBK	Zabljak	43.1499999999999986	19.1166669999999996
7936	\N	\N	ZBL	Biloela	-24.3999999999999986	150.516660000000002
7937	\N	\N	ZBM	Bromont	45.3166659999999979	-72.8333360000000027
7938	\N	\N	ZBO	Bowen	-20.0166660000000007	148.21665999999999
7939	\N	\N	ZBU	Aarhus Limo	56.1629390000000015	10.2039209999999994
7940	\N	\N	ZBV	Beaver Creek Bus Station	39.6402637999999996	-106.374195499999999
7941	\N	\N	ZBY	Sayaboury	19.25	101.700000000000003
7942	\N	\N	ZCL	La Calera	22.8000000000000007	-102.549999999999997
7943	\N	\N	ZCP	Foshan Ferry	23.0215479999999992	113.121415999999996
7944	\N	\N	ZDH	Basel SBB station	47.3250999999999991	7.35229999999999961
7945	\N	\N	ZDU	ScotRailway	56.4614282000000003	-2.96811090000000011
7946	\N	\N	ZEC	Secunda	-27	28
7947	\N	\N	ZEF	Nanhai Ferry	36.4002499999999998	-80.8106899999999939
7948	\N	\N	ZEG	Senggo	-5.98333300000000001	139.366669999999999
7949	\N	\N	ZEL	Bella Bella	52.1666680000000014	-128.099999999999994
7950	\N	\N	ZEM	East Main	52.25	-78.5166700000000048
7951	\N	\N	ZEN	Zenag	-6.95000000000000018	146.616669999999999
7952	\N	\N	ZEP	Victoria Railway	51.509999999999998	0.0599999999999999978
7953	\N	\N	ZER	Zero	27.6333330000000004	93.8333360000000027
7954	\N	\N	ZFA	Faro	63.2166670000000011	-133.366669999999999
7955	\N	\N	ZFB	Old Fort Bay	51.5833319999999986	-57.9166680000000014
7956	\N	\N	ZFD	Fond Du Lac	59.3166659999999979	-107.166663999999997
7957	\N	\N	ZFJ	Rennes	48.1134750000000011	-1.67570799999999998
7958	\N	\N	ZFL	South Trout Lake	50.8333319999999986	-93.6500000000000057
7959	\N	\N	ZFQ	Gare de Bordeaux	44.8377890000000008	-0.579180000000000028
7960	\N	\N	ZFU	Aruja	-23.3964515999999989	-46.3214443999999972
7961	\N	\N	ZFW	Fairview	56.0666659999999979	-118.383330000000001
7962	\N	\N	ZFZ	Buffalo Depew Rr	42.8864468000000016	-78.8783688999999981
7963	\N	\N	ZGD	New London Railway	29.1071199999999983	110.445689999999999
7964	\N	\N	ZGF	Grand Forks	49.0166660000000007	-118.433334000000002
7965	\N	\N	ZGI	Gods River	54.6833340000000021	-94.1666639999999973
7966	\N	\N	ZGL	South Galway	-25.6833320000000001	142.116669999999999
7967	\N	\N	ZGM	Ngoma	-15.9583329999999997	25.9344439999999992
7968	\N	\N	ZGN	Zhongshan Ferry Port	22.6132099999999987	108.167500000000004
7969	\N	\N	ZGO	Gotha Railway	23.4302370000000018	116.758589999999998
7970	\N	\N	ZGR	Little Grand Rapids	52.0666659999999979	-95.4666699999999935
7971	\N	\N	ZGS	Gethsemani	50.3333319999999986	-60.6666680000000014
7972	\N	\N	ZGU	Gaua	-14.2200860000000002	167.588269999999994
7973	\N	\N	ZHA	Zhanjiang	21.2147269999999999	110.362719999999996
7974	\N	\N	ZHC	N Philadelphia RailwaySt	34.5275200000000027	113.840239999999994
7975	\N	\N	ZHI	Grenchen	47.1935849999999988	7.39544509999999988
7976	\N	\N	ZHM	Shamshernagar	24.3986109999999989	91.9211099999999988
7977	\N	\N	ZHP	High Prairie	55.3999999999999986	-116.483329999999995
7978	\N	\N	ZHZ	Halle Railway	51.4299999999999997	12.2400000000000002
7979	\N	\N	ZIC	Victoria	-38.2166670000000011	-72.3333360000000027
7980	\N	\N	ZIF	Fallowfield Railway	45.4115719999999996	-75.6981940000000009
7981	\N	\N	ZIG	Ziguinchor	12.5561109999999996	-16.2758329999999987
7982	\N	\N	ZIH	Internacional	17.6067830000000001	-101.464066000000003
7983	\N	\N	ZIP	Harbour (Eolie Island)	49.8716659999999976	11.6466670000000008
7984	\N	\N	ZIU	Railway	22.2707149999999992	113.576725999999994
7985	\N	\N	ZIV	ScotRailway	57.4766948999999983	-4.23145349999999976
7986	\N	\N	ZJG	Jenpeg	54.519444	-98.0461099999999988
7987	\N	\N	ZJN	Swan River	52.1166699999999992	-101.233329999999995
7988	\N	\N	ZJS	Jena Railway	18.3106299999999997	109.409706
7989	\N	\N	ZKB	Kasaba Bay	-8.5222219999999993	30.6597210000000011
7990	\N	\N	ZKD	Leningradskiy Railway	55.7557860000000005	37.6176329999999979
7991	\N	\N	ZKE	Kaschechewan	52.3333319999999986	-81.3333360000000027
7992	\N	\N	ZKG	Kegaska	50.1888900000000007	-61.2916680000000014
7993	\N	\N	ZKL	Steenkool	-2.10277799999999981	133.516660000000002
7994	\N	\N	ZKM	Sette Cama	-2.53333299999999983	9.75
7995	\N	\N	ZLG	El Gouera	20.8422219999999996	-17.0783330000000007
7996	\N	\N	ZLK	Moscovskiy Railway Stn	59.9390390000000011	30.3157850000000018
7997	\N	\N	ZLO	Manzanillo	19.1133330000000008	-104.350555
7999	\N	\N	ZMD	Sena Madureira	-9.08333299999999966	-68.75
8000	\N	\N	ZMF	Beverello Harbor	40.8400968999999989	14.2516356999999996
8001	\N	\N	ZMI	Mergellina Railway	40.8400968999999989	14.2516356999999996
8002	\N	\N	ZMJ	Mergellina Harbour	40.8400968999999989	14.2516356999999996
8003	\N	\N	ZML	Milwaukee General Mitchell	43.0387948999999992	-87.9065334000000007
8004	\N	\N	ZMM	Zamora	19.9833339999999993	-102.266670000000005
8005	\N	\N	ZMS	S.M. Novella Rail.Svc	45.1312799999999967	110.170720000000003
8006	\N	\N	ZMY	Harbour	30.5500000000000007	116.433329999999998
8007	\N	\N	ZNC	Nyac	61	-160
8008	\N	\N	ZND	Zinder	13.7794439999999998	8.98305599999999949
8009	\N	\N	ZNG	Negginan	53	-97.2666700000000048
8010	\N	\N	ZNU	Namu	51.8500000000000014	-127.866669999999999
8011	\N	\N	ZNZ	Kisauni	-6.21846600000000027	39.2211840000000009
8012	\N	\N	ZOF	Ocean Falls	52.3666699999999992	-127.700000000000003
8013	\N	\N	ZOS	Cañal Bajo	-40.6077769999999987	-73.0555599999999998
8014	\N	\N	ZPB	Sachigo Lake	53.8905559999999966	-92.1952739999999977
8015	\N	\N	ZPC	Pucon	-39.7638900000000035	-71.6333300000000008
8016	\N	\N	ZPH	Zephyrhills	28.2333339999999993	-82.1833340000000021
8017	\N	\N	ZPO	Pine House	55.5166660000000007	-106.583336000000003
8018	\N	\N	ZQF	Fohren	49.8639999999999972	6.78699999999999992
8019	\N	\N	ZQN	Queenstown	-45.022038000000002	168.739100000000008
8020	\N	\N	ZQS	Queen Charlotte Island	53	-132
8021	\N	\N	ZQW	Zweibruecken Airport	49.2151599999999974	7.3997080000000004
8022	\N	\N	ZRD	Richmond VA Railway	37.5429790000000025	-77.4690920000000034
8023	\N	\N	ZRJ	Round Lake	52.9500000000000028	-91.3166659999999979
8024	\N	\N	ZRL	Lancaster  Railway	40.0378754999999984	-76.305514400000007
8025	\N	\N	ZRM	Sarmi	-1.85000000000000009	138.75
8026	\N	\N	ZRT	Hartford  Railway	41.7637111000000019	-72.6850931999999972
8027	\N	\N	ZRU	Boston RT128 Railway	42.3584308000000007	-71.0597731999999951
8028	\N	\N	ZRV	Providence Railway	41.8239890999999986	-71.4128343000000001
8029	\N	\N	ZRZ	New Carrolton RR	38.8951118000000022	-77.0363657999999987
8030	\N	\N	ZSJ	Sandy Lake	53.0333329999999989	-93.2333299999999952
8031	\N	\N	ZSP	St Paul	47.9166680000000014	-69.25
8032	\N	\N	ZSS	Sassandra	4.92444400000000027	-6.13555600000000023
8033	\N	\N	ZST	Stewart	55.9333340000000021	-129.983339999999998
8034	\N	\N	ZSW	Seal Cove	54.3333319999999986	-130.28334000000001
8035	\N	\N	ZTB	Tete-a-La Baleine	50.7166670000000011	-59.3333319999999986
8036	\N	\N	ZTD	Schenectady Railway	42.8142431999999999	-73.9395686999999953
8037	\N	\N	ZTE	Rochester NY Railway	43.1610000000000014	-77.6110000000000042
8038	\N	\N	ZTJ	Princeton JT Railway	40.3487180999999993	-74.6590472000000034
8039	\N	\N	ZTM	Shamattawa	55.858665000000002	-92.0863999999999976
8040	\N	\N	ZTN	Trenton RailwaySTN	39.9523349999999979	-75.1637889999999942
8041	\N	\N	ZTO	Boston South Railway	42.3584308000000007	-71.0597731999999951
8042	\N	\N	ZTR	Zhitomir Airport	50.25	28.6499999999999986
8043	\N	\N	ZTS	Tahsis	49.9333340000000021	-126.666663999999997
8044	\N	\N	ZTT	Cottbus Railway	51.7607292000000001	14.3274884999999994
8045	\N	\N	ZTY	Boston BKBAY Railway	42.3584308000000007	-71.0597731999999951
8046	\N	\N	ZUA	Utica N Railway	32.1038169999999994	80.0542760000000015
8047	\N	\N	ZUC	Ignace	49.5	-91.8333360000000027
8048	\N	\N	ZUD	Ancud	-42	-73.8333360000000027
8049	\N	\N	ZUH	Zhuhai Airport	22.0117870000000018	113.370599999999996
8050	\N	\N	ZUL	Zilfi	26.25	44.8333319999999986
8051	\N	\N	ZVA	Miandrivazo	-19.5	45.4666670000000011
8052	\N	\N	ZVE	New Haven Railway	41.3081527000000008	-72.9281576999999999
8053	\N	\N	ZVG	Springvale	-17.8666669999999996	127.583336000000003
8054	\N	\N	ZVK	Savannakhet	16.5536120000000011	104.762500000000003
8055	\N	\N	ZVM	Messe-BF Railway Servi	52.3720683000000022	9.73568610000000056
8056	\N	\N	ZVR	Hanover Railway	52.3720683000000022	9.73568610000000056
8057	\N	\N	ZWA	Andapa	-14.6500000000000004	49.6166699999999992
8058	\N	\N	ZWB	Williamsburg Railway	36.9787588000000014	-76.4280030000000039
8059	\N	\N	ZWI	Wilmington Railway	50.730556	12.5444440000000004
8060	\N	\N	ZWL	Wollaston Lake	58.1000000000000014	-103.183334000000002
8061	\N	\N	ZWR	Kota Kinabalu Port	5.97647399999999962	116.115776999999994
8062	\N	\N	ZWS	Stuttgart Hauptbahnhof	39.5349730000000008	76.0110700000000037
8063	\N	\N	ZWW	Newport News Railway	43.9012600000000006	87.4751499999999993
8064	\N	\N	ZXP	ScotRailway	56.409413200000003	-3.44752800000000015
8065	\N	\N	ZXS	Exchangest Railway	42.8864468000000016	-78.8783688999999981
8066	\N	\N	ZXT	Heydar Aliyev	40.4849999999999994	49.9836120000000008
8067	\N	\N	ZYD	Lisbon TP	40.0323679999999982	124.280810000000002
8068	\N	\N	ZYF	Faro TP	37.0153596999999976	-7.93511300000000031
8069	\N	\N	ZYL	Osmani International	24.9575980000000008	91.8704759999999965
8070	\N	\N	ZYN	Railway	43.836699000000003	4.36005399999999987
8071	\N	\N	ZYQ	Syracuse  Railway	43.0481221000000005	-76.1474244000000056
8072	\N	\N	ZYZ	Berchem Railway	51.2199200000000019	4.39625000000000021
8073	\N	\N	ZZU	Mzuzu	-11.4427780000000006	34.0127799999999993
8074	\N	\N	ZZV	Zanesville	39.9333340000000021	-82.0166700000000048
8075	\N	\N	ZMH	108 Mile Ranch	51.7455560000000006	-121.339164999999994
8076	\N	\N	YJC	A Coruna Railway Station	43.3708730999999972	-8.39583499999999994
8077	\N	\N	XHJ	Aachen Hbf Railway Station	50.7754384999999999	6.08151020000000031
8078	\N	\N	ZTG	Aalborg Railway Station	57.0288109999999975	9.91777100000000011
8079	\N	\N	ZJH	Aarhus H Railway Station	19.9416119999999992	110.457170000000005
8080	\N	\N	ZID	Aarhus Bus Station	56.1629390000000015	10.2039209999999994
8081	\N	\N	ZXA	Aberdeen Railway Station	57.147491500000001	-2.09539700000000018
8082	\N	\N	ZVJ	EK Bus Station	24.4666667000000011	54.3666667000000032
8083	\N	\N	AOM	Adam	40.7387579999999971	140.689220000000006
8084	\N	\N	ZII	Adelaide Ferry Port	-34.928621200000002	138.599959399999989
8085	\N	\N	YIE	Yiershi	47.3100000000000023	119.910835000000006
8086	\N	\N	ZVH	EK Bus Station	24.2074999999999996	55.7447221999999982
8087	\N	\N	IQA	Al Asad Air Base	63.7517500000000013	-68.5365800000000007
8088	\N	\N	NJF	Al-Ashraf International	31.9935630000000018	44.3891869999999997
8089	\N	\N	ULH	Majeed Bin Abdulaziz	26.6166669999999996	37.8666649999999976
8090	\N	\N	XJJ	Albacete Bus Station	38.9976515999999975	-1.86007009999999995
8091	\N	\N	EEM	Albacete Railway Station	38.9976515999999975	-1.86007009999999995
8092	\N	\N	ZLY	Albany Railway Station	32.8399000000000001	97.0378999999999934
8093	\N	\N	YJE	Alicante Railway Station	38.3452100000000016	-0.480994499999999992
8094	\N	\N	ZYA	Amsterdam Centraal Railway Station	52.3730556000000007	4.89222219999999997
8095	\N	\N	DVD	Andavadoaka	-22.0783330000000007	43.2591669999999979
8096	\N	\N	QXG	Angers Railway Station	47.4784190000000024	-0.563166000000000055
8097	\N	\N	VLY	Valley	53.2503600000000006	-4.52901699999999963
8098	\N	\N	ZWE	Antwerp Central Railway Station	49.2151599999999974	7.3997080000000004
8099	\N	\N	ZAF	Arles Railway Station	39.1202770000000015	30.1169450000000012
8100	\N	\N	ATC	Arthur's Town	24.6286099999999983	-75.6713900000000024
8101	\N	\N	XNZ	Auckland Ferry Port	-36.8484596999999994	174.763331499999993
8102	\N	\N	AKS	Gwaunaru'u	-8.69777799999999957	160.680829999999986
8103	\N	\N	CII	Cildir	47.9027799999999999	-112.312224999999998
8104	\N	\N	OAI	Bagram	34.959614000000002	69.2705100000000016
8105	\N	\N	AEB	Youjiang	23.7194700000000012	106.967770000000002
8106	\N	\N	XJB	Barcelona Bus Station	41.3879170000000016	2.1699187000000002
8107	\N	\N	YJD	Franca Railway Station	-24.8333319999999986	143.066669999999988
8108	\N	\N	YJB	Sants Railway Station	-35.2722199999999972	150.822219999999987
8109	\N	\N	ZBA	Basel Bad Railway Station	40.0785369999999972	116.587100000000007
8110	\N	\N	PQD	Pasikudha SPB	7.70999999999999996	81.6800000000000068
8111	\N	\N	RLK	Tianjitai	40.9263880000000029	107.738889999999998
8112	\N	\N	EYK	Beloyarsky	63.6966820000000027	66.7012100000000032
8113	\N	\N	EZV	Berezovo	63.9245829999999984	65.0448499999999967
8114	\N	\N	QFV	Bergen Railway Station	60.3333319999999986	5.33333299999999966
8115	\N	\N	BER	Brandenburg	52.3666699999999992	13.5033329999999996
8116	\N	\N	QPP	Berlin Hbf Railway Station	52.523405099999998	13.4113998999999993
8117	\N	\N	QWB	Ostbahnhof Railway Station	52.523405099999998	13.4113998999999993
8118	\N	\N	QWC	Zoo Railway Station	52.523405099999998	13.4113998999999993
8119	\N	\N	NWU	Bermuda NAS	32.75	-65
8120	\N	\N	ZDJ	Bern Railway Station	46.9479222000000007	7.44460850000000018
8121	\N	\N	YJI	Abando Railway Station	-36.5166660000000007	148.616669999999999
8122	\N	\N	ZBC	Colmore Row Bus Station	42.2373919999999998	118.910889999999995
8123	\N	\N	QQN	New Street Rail Station	52.4829614000000007	-1.89359199999999994
8124	\N	\N	VBM	Blue Mountain	57.8575000000000017	-157.086669999999998
8125	\N	\N	ODO	Bodaybo	57.8663900000000027	114.242500000000007
8126	\N	\N	BQG	Bogorodskoye	52.3783340000000024	140.448329999999999
8127	\N	\N	IBT	Bologna Central Railway Station	44.4941902999999996	11.3465185000000002
8128	\N	\N	ZBN	Bolzano/Bozen Bus Station	46.4967152999999982	11.3580047999999998
8129	\N	\N	BZQ	Bolzano/Bozen Railway Station	46.4967152999999982	11.3580047999999998
8130	\N	\N	TGP	Podkamennaya Tunguska	61.5900000000000034	89.9794499999999999
8131	\N	\N	XJF	Falun Bus Station	60.4856047000000032	15.4363016999999996
8132	\N	\N	XWF	Falun C Railway Station	60.4856047000000032	15.4363016999999996
8133	\N	\N	UAR	Bouarfa	51.1537099999999967	51.5385630000000035
8134	\N	\N	XHH	Boulder Bus Station	40.0149856000000028	-105.270545600000005
8135	\N	\N	ZRG	Bratislava Bus Station	48.1700000000000017	17.2100000000000009
8136	\N	\N	ZQU	Wolfsburg Rail Station	52.2641478000000035	10.5263802999999996
8137	\N	\N	BQD	Brindisi Railway Station	40.6361752999999979	17.9389909000000003
8138	\N	\N	XQN	Brisbane Ferry Port	-27.4709330999999999	153.023502400000012
8139	\N	\N	ZDN	Brno Bus Station	49.2000000000000028	16.6099999999999994
8140	\N	\N	ZYR	Midi Railway Station	-1	-1
8141	\N	\N	XXJ	Deli Railway Station	47.4984055999999981	19.0407578000000015
8142	\N	\N	XXQ	Keleti Railway Station	47.4984055999999981	19.0407578000000015
8143	\N	\N	HBU	Bulgan, Hovd	46.1022219999999976	91.586110000000005
8144	\N	\N	BUR	Bob Hope	34.1961900000000014	-118.354110000000006
8145	\N	\N	RGS	Burgos	42.3549399999999991	-3.62294999999999989
8146	\N	\N	KJI	Kanas	48.2216700000000031	86.9961100000000016
8147	\N	\N	RUE	Butembo	35.2600940000000023	-93.0973000000000042
8148	\N	\N	XFF	Calais-Frethun Rail Station	50.9512900000000002	1.85868600000000006
8149	\N	\N	OAZ	Camp Bastion	31.1000000000000014	61.9833339999999993
8150	\N	\N	CTJ	Caserta Railway Station	33.7602499999999992	-85.1702999999999975
8151	\N	\N	CYW	Celaya	20.5500000000000007	-100.900000000000006
8152	\N	\N	QDK	Greyhound Bus Station	30.0555549999999982	70.5027800000000013
8153	\N	\N	CHI	Chicago FSS	41.8781135999999989	-87.6297981999999962
8154	\N	\N	ZUN	Chicago Union Railway Station	41.8781135999999989	-87.6297981999999962
8155	\N	\N	QUG	Goodwood	50.9416659999999979	-0.842247999999999997
8156	\N	\N	JUH	Jiuhuashan	19.2222210000000011	72.847219999999993
8157	\N	\N	CKW	Christmas Creek Mine	52.4305570000000003	-108.747219999999999
8158	\N	\N	XAD	Churchill Railway Station	58.7554560000000023	-94.1124690000000044
8159	\N	\N	XJI	Ciudad Real Railway Station	38.9860962999999998	-3.92726290000000011
8160	\N	\N	COE	Coeur D'Alene	47.6833340000000021	-116.766670000000005
8161	\N	\N	BNJ	Bonn Hbf Railway Station	50.9406644999999969	6.95991149999999958
8162	\N	\N	QKU	Messe/Deutz Rail Station	50.9406644999999969	6.95991149999999958
8163	\N	\N	BYV	Beira Lake SPB	6.92746800000000018	79.8483580000000046
8164	\N	\N	ZGH	Copenhagen H Rail Station	28.1933359999999986	113.214590000000001
8165	\N	\N	XOJ	Cordoba Central Railway Station	37.8847267000000016	-4.77915169999999989
8166	\N	\N	OTT	Andre Maggi	-9.90221499999999999	-58.5812870000000032
8167	\N	\N	CXB	Cox's Bazar	21.4499999999999993	91.9666699999999935
8168	\N	\N	QJJ	FlightLink Bus Station	34.7698020999999997	-84.9702228000000019
8169	\N	\N	DCY	Yading	38.7043600000000012	-87.2473300000000052
8170	\N	\N	DQA	Sartu	46.5873599999999968	125.228409999999997
8171	\N	\N	XVG	Darlington Railway Station	47.051639999999999	-94.2399999999999949
8172	\N	\N	DHB	Deer Harbor	48.6183970000000016	-123.005960000000002
8173	\N	\N	IAO	Sayak Airport	9.85888899999999957	126.013885000000002
8174	\N	\N	QWM	Longmont Bus Station	39.7391536000000016	-104.984703400000001
8175	\N	\N	DCN	RAAF Curtin	-17.5737020000000008	123.823229999999995
8176	\N	\N	YIP	Willow Run	42.2333339999999993	-83.5333300000000065
8177	\N	\N	DRV	Dharavandhoo Island	5.15611100000000011	73.1302799999999991
8178	\N	\N	DTI	Diamantina	-18.2308039999999991	-43.6478460000000013
8179	\N	\N	ZFG	Sheffield Bus Station	53.5230412000000015	-1.13376220000000005
8180	\N	\N	DRK	Drake Bay	8.71962000000000081	-83.644599999999997
8181	\N	\N	DRX	Dresden Bus Station	51.1300000000000026	13.7699999999999996
8182	\N	\N	XIR	Dresden Hbf Railway Station	51.1300000000000026	13.7699999999999996
8183	\N	\N	DCG	Dubai Creek SPB	25.2644443999999986	55.3116667000000035
8184	\N	\N	XEU	Hyatt Rgncy EY Bus Station	25.2644443999999986	55.3116667000000035
8185	\N	\N	ZXZ	Jumeirah Beach Bus Station	25.2644443999999986	55.3116667000000035
8186	\N	\N	XMB	Marina Mall EY Bus Station	7.45000000000000018	-4.33333299999999966
8187	\N	\N	XVU	Durham Railway Station	54.509999999999998	-1.42999999999999994
8188	\N	\N	ZXE	Waverley Railway Station	55.9501755000000003	-3.18753589999999987
8189	\N	\N	YED	Namao Field	53.5	-113.5
8190	\N	\N	XZL	Edmonton Railway Station	53.5480000000000018	-113.489999999999995
8191	\N	\N	ZYE	Eindhoven Railway Station	51.4416420000000016	5.4697224999999996
8192	\N	\N	EBH	El Bayadh	33.717804000000001	1.09410500000000011
8193	\N	\N	ERQ	Elrose Mine	-20.9766669999999991	141.008600000000001
8194	\N	\N	QEQ	Embrach/Rorbas Railway Station	69.25	-53.5666659999999979
8195	\N	\N	QYE	Enschede Railway Station	52.2203374999999994	6.89596379999999964
8196	\N	\N	ERL	Saiwusu International	43.4266739999999984	112.09845
8197	\N	\N	XIU	Erfurt Hbf Railway Station	50.9737341000000015	11.0224350999999992
8198	\N	\N	ESA	Esa'Ala	-9.73333300000000001	150.816669999999988
8199	\N	\N	ZBB	Esbjerg Railway Station	55.4764660000000021	8.45940500000000029
8200	\N	\N	XFJ	Eskilstuna C Rail Station	59.3664681999999999	16.5084271999999999
8201	\N	\N	FIR	Firenze C.M. Raiway Station	43.7687323999999975	11.2569013000000009
8202	\N	\N	FOI	Foggia Railway Station	41.4622918999999968	15.5447457999999994
8203	\N	\N	FBA	Fonte Boa	-2.53121200000000002	-66.0845400000000041
8204	\N	\N	QWH	Loveland Bus Station	40.5852602000000005	-105.084423000000001
8205	\N	\N	FXE	Fort Lauderdale Executive	26.0666679999999999	-80.1500000000000057
8206	\N	\N	ZFT	Fort Lauderdale Railway Station	26.1223084000000014	-80.1433786000000055
8207	\N	\N	JHL	Albian	57.2238899999999973	-111.418890000000005
8208	\N	\N	HZP	Horizon	57.3816679999999977	-111.70111
8209	\N	\N	FSA	CZ Bus Station	23.0215479999999992	113.121415999999996
8210	\N	\N	FVM	Fuvahmulak	-0.309443999999999997	73.4327799999999939
8211	\N	\N	XDD	Gaspe Railway Station	48.9029450000000026	-64.4786830000000037
8212	\N	\N	QYU	Gavle C Railway Station	60.6746161000000015	17.1418308999999986
8213	\N	\N	ZHT	Geneva Railway Station	46.1983922000000007	6.14229610000000026
8214	\N	\N	ZGG	Glasgow Central Railway Station	23.3878610000000009	113.297340000000005
8215	\N	\N	GLB	San Calos Apache	5.95000000000000018	-10.0333330000000007
8216	\N	\N	GMO	Lawanti	10.2980560000000008	10.8988890000000005
8217	\N	\N	ZHH	Gossau SG Railway Station	30.7765979999999999	114.209625000000003
8218	\N	\N	XWL	Goteborg C Railway Station	57.6969943000000001	11.9864999999999995
8219	\N	\N	YJG	Granada Railway Station	37.1764873999999992	-3.59792909999999999
8220	\N	\N	ZEX	Guetersloh Hbf Railway Station	51.9049057000000005	8.39274969999999954
8221	\N	\N	GYU	Liupanshan	40.8333319999999986	43.8999999999999986
8222	\N	\N	HPA	Salote Pilolevu	-19.7785380000000011	-174.340879999999999
8223	\N	\N	XUN	Hailey Bus Station	43.6971294000000015	-114.351717199999996
8224	\N	\N	XDG	Halifax Railway Station	44.6488810000000029	-63.5753119999999967
8225	\N	\N	OBZ	Hamburg Bus Station	53.5538129999999981	9.99158599999999986
8226	\N	\N	ZMB	Hamburg Hbf Railway Station	53.5538129999999981	9.99158599999999986
8227	\N	\N	HDG	Handan	36.5258329999999987	114.424999999999997
8228	\N	\N	HBZ	Hannover Bus Station	35.6168899999999979	-92.1300800000000066
8229	\N	\N	HRM	Tilrempt	33.1666680000000014	3.20000000000000018
8230	\N	\N	ZHL	Heerbrugg Railway Station	34.7363619999999997	112.385409999999993
8231	\N	\N	QHD	Heidelberg Hbf Railway Station	49.4018997000000013	8.68028499999999958
8232	\N	\N	ZHN	Herzogenbuchsee Railway Station	32.9836999999999989	112.613050000000001
8233	\N	\N	QYI	Hilversum Railway Station	52.2263340000000014	5.18123500000000003
8234	\N	\N	QDI	Dornbirn Bus Station	47.3608100000000007	9.68670999999999971
8235	\N	\N	XUG	Holmestrand Railway Station	-19.0500000000000007	23.0666679999999999
8236	\N	\N	HMS	Homeshore	58.2944450000000032	-135.347229999999996
8237	\N	\N	XJH	Hong Kong Harbour	22.2478599000000017	114.203384299999996
8238	\N	\N	HIA	Lianshui	33.7875000000000014	119.127780000000001
8239	\N	\N	YNH	Hudson Hope	56	-121.900000000000006
8240	\N	\N	XUA	Huesca Railway Station	42.1401024000000035	-0.408897999999999984
8241	\N	\N	PPD	Palmas Del Mar	18.1499999999999986	-65.8333360000000027
8242	\N	\N	HUW	Humaita	53.5834469999999996	-0.348669000000000007
8243	\N	\N	HTV	Huntsville	30.7166670000000011	-95.5499999999999972
8244	\N	\N	BPM	Begumpet	17.4491140000000016	78.4718299999999971
8245	\N	\N	IBR	Ibaraki	36.1816669999999974	140.414719999999988
8246	\N	\N	IRM	Igrim	63.2007559999999984	64.4339449999999943
8247	\N	\N	IDY	Ile d'Yeu	46.7178699999999978	-2.38869400000000009
8248	\N	\N	JCN	Incheon Heliport	37.4666670000000011	126.599999999999994
8249	\N	\N	ZIN	Interlaken Ost Rail Station	13.7794439999999998	8.98305599999999949
8250	\N	\N	IRU	Iranamadu SPB	35.9210550000000026	139.506740000000008
8251	\N	\N	RLR	Relais de la Reine	-22.6452770000000001	45.3236119999999971
8252	\N	\N	IVI	Isla Viveros	69.4000000000000057	-148.25
8253	\N	\N	BVV	Burevestnik AFB	44.9286460000000005	147.613370000000003
8254	\N	\N	IWK	Iwakuni	34.1352770000000021	132.235549999999989
8255	\N	\N	IGL	Cigli AB	38.3188900000000032	27.1594450000000016
8256	\N	\N	YJW	Jerez Railway Station	36.6865617999999998	-6.13717250000000014
8257	\N	\N	JGD	Jiagedaqi	50.3705560000000006	124.116669999999999
8258	\N	\N	JBD	CZ Bus Station	29.7050960000000011	116.001981999999998
8259	\N	\N	JIC	Jinchuan	38.5419430000000034	102.348609999999994
8260	\N	\N	JXA	Xingkaihu	45.3060839999999985	130.996749999999992
8261	\N	\N	IZA	Reg. da Zona da Mata	-21.5130559999999988	-43.1730579999999975
8262	\N	\N	JKL	Kalymnos Island	36.9633329999999987	26.9405560000000008
8263	\N	\N	KGT	Kangding	30.1574999999999989	101.734719999999996
8264	\N	\N	KYY	Karamay Bus Station	45.5798890000000014	84.889206999999999
8265	\N	\N	ZIK	Karlovy Vary Bus Station	50.2322052000000028	12.8712765000000005
8266	\N	\N	ZCC	Baden-Baden Railway Station	49.0080847999999989	8.40375629999999951
8267	\N	\N	XET	Karlsruhe Bus Station	49.0080847999999989	8.40375629999999951
8268	\N	\N	ZFY	Katowice Bus Station	50.2648919000000021	19.0237814999999983
8269	\N	\N	DKA	Katsina	13.0037120000000002	7.66080299999999959
8270	\N	\N	KVR	Kavalerovo	44.2668650000000028	135.035699999999991
8271	\N	\N	XEG	Kingston Railway Station	44.2635649999999998	-76.5033600000000007
8272	\N	\N	NLO	N'dolo	-4.32500000000000018	15.3263890000000007
8273	\N	\N	KCK	Kirensk	39.1583329999999989	-94.6500000000000057
8274	\N	\N	XJK	Klaipeda Bus Station	55.710802600000001	21.1318064999999997
8275	\N	\N	ZBT	Kolding Railway Station	39.1226270000000014	117.3399
8276	\N	\N	XZD	Kongsvinger Railway Station	60.1875	12.0016669999999994
8277	\N	\N	KKQ	Krasnoselkup	65.7079599999999999	82.4560550000000063
8278	\N	\N	ZHU	Kreuzlingen Railway Station	22.0117870000000018	113.370599999999996
8279	\N	\N	XKR	Kristiansand Railway Station	58.150936999999999	7.99619259999999965
8280	\N	\N	XKL	Sentral Railway Station	3.13900300000000021	101.686854999999994
8281	\N	\N	TJU	Kulyab	37.9883349999999993	69.8066599999999937
8282	\N	\N	UKY	Kyoto	35	135.75
8283	\N	\N	LOO	L'Mekrareg	33.8333319999999986	2.98333300000000001
8284	\N	\N	CWF	Chennault International.	30.3059179999999984	-93.231890000000007
8285	\N	\N	LCQ	Lake City	30.3205570000000009	-82.668610000000001
8286	\N	\N	ZUK	Lake Cook Road Railway Station	30.1574999999999989	101.734719999999996
8287	\N	\N	LTZ	Lamezia Terme Central Railway Station	38.9099999999999966	16.2399999999999984
8288	\N	\N	LTU	Latur	18.4095520000000015	76.4662900000000008
8289	\N	\N	ZLN	Le Mans Railway Station	48.0061099999999996	0.199556000000000011
8290	\N	\N	LCZ	Lecce Railway Station	40.353291200000001	18.1740145999999996
8291	\N	\N	ZFC	Bradford Bus Station	53.8371263000000013	-1.4722291999999999
8292	\N	\N	ZLZ	Leeds Bus Station	37.5689350000000033	105.152529999999999
8293	\N	\N	XIT	Leipzig Hbf Rail Station	51.4299999999999997	12.2400000000000002
8294	\N	\N	ULK	Lensk	60.7224799999999973	114.831519999999998
8295	\N	\N	EEU	Leon Railway Station	42.5998763999999994	-5.57175200000000004
8296	\N	\N	LLB	Libo	25.4524769999999982	107.961913999999993
8297	\N	\N	XDB	Europe Railway Station	50.629249999999999	3.0572560000000002
8298	\N	\N	LQS	Lingshui Railway Station	43.8266869999999997	18.3360650000000014
8299	\N	\N	ILD	Alguaire	41.7288360000000011	0.543301999999999952
8300	\N	\N	XQE	Ebbsfleet International Rail Station	51.509999999999998	0.0599999999999999978
8301	\N	\N	QQU	Euston Railway Station	51.509999999999998	0.0599999999999999978
8302	\N	\N	QQK	Kings Cross Rail Station	51.509999999999998	0.0599999999999999978
8303	\N	\N	ZLS	Liverpool St Rail Station	51.509999999999998	0.0599999999999999978
8304	\N	\N	QQP	Paddington Railway Station	-1	-1
8305	\N	\N	SEN	Southend	51.5727770000000021	0.70138900000000004
8306	\N	\N	QQS	St Pancras International RailSt	51.509999999999998	0.0599999999999999978
8307	\N	\N	XOF	Stratford International Rail Station	51.509999999999998	0.0599999999999999978
8308	\N	\N	XDQ	London Railway Station	42.9870000000000019	-81.2510000000000048
8309	\N	\N	QLO	Los Angeles Ferry Port	34.0522342000000009	-118.243684900000005
8310	\N	\N	NCP	Cubi Pt NAS	16	121
8311	\N	\N	VAM	Maamigili	55.4638899999999992	9.45833299999999966
8312	\N	\N	ZYT	Maastricht Railway Station	50.8513682000000031	5.69097249999999999
8313	\N	\N	XZM	Macau Ferry	22.1638446000000009	113.554993699999997
8314	\N	\N	QMP	FlightLink Bus Station	32.8406945999999991	-83.6324022000000014
8315	\N	\N	XOC	Atocha Railway St.	40.416690899999999	-3.70034539999999978
8316	\N	\N	XTI	Chamartin Railway St.	40.416690899999999	-3.70034539999999978
8317	\N	\N	YJM	Malaga Railway Station	36.719648399999997	-4.42001630000000034
8318	\N	\N	XFP	Malmo C Railway Station	55.6099999999999994	13.0039999999999996
8319	\N	\N	XFR	Malmo Syd Railway Station	55.6099999999999994	13.0039999999999996
8320	\N	\N	ZMP	Manchester Bus Station	53.4807125000000028	-2.23437650000000021
8321	\N	\N	QQM	Piccadilly Railway Station	-1	-1
8322	\N	\N	YMU	Mansons Landing SPB	50.0714499999999987	-124.983689999999996
8323	\N	\N	RMY	Mariposa-Yosemite	42.261806	-85.0045240000000035
8324	\N	\N	ZYY	Marnardal Railway Station	42.8856620000000035	129.439359999999994
8325	\N	\N	YMH	Mary's Harbour	52.2999999999999972	-55.8333319999999986
8326	\N	\N	MFY	Mayfa'ah	13.6666670000000003	46.0083300000000008
8327	\N	\N	SSY	M'banza Congo	-6.2738889999999996	14.2441669999999991
8328	\N	\N	XOM	Melbourne Ferry Port	-37.813186899999998	144.962979600000011
8329	\N	\N	JJM	Mulika Lodge	0.233194000000000012	38.1833340000000021
8330	\N	\N	ZBS	Mesa Bus Station	38.2743759999999966	114.694429999999997
8331	\N	\N	XZI	Lorraine TGV Rail Station	49.1196660000000023	6.17690499999999965
8332	\N	\N	AZP	Atizapan	19.4166680000000014	-99.0999999999999943
8333	\N	\N	TNT	Dade Collier	25.7833329999999989	-80.1833340000000021
8334	\N	\N	JDM	Miami Downtown Heliport	25.75	-80.25
8335	\N	\N	OPF	Opa Locka	25.8999999999999986	-80.2833300000000065
8336	\N	\N	MPB	Miami Sea Plane Base	25.75	-80.1666639999999973
8337	\N	\N	MIO	Miami	36.8833300000000008	-94.9000000000000057
8338	\N	\N	ZMC	Miedzyzdroje Bus Station	48.1333300000000008	114.900000000000006
8339	\N	\N	XNC	Cadorna Railway Station	45.4636810000000011	9.18817139999999988
8340	\N	\N	IPR	Porta Garibaldi Station	45.4636810000000011	9.18817139999999988
8341	\N	\N	IMR	Rogoredo Railway Station	45.4636810000000011	9.18817139999999988
8342	\N	\N	OHE	Gulian	52.921129999999998	122.420590000000004
8343	\N	\N	XDP	Moncton Railway Station	46.1158330000000021	-64.803055999999998
8344	\N	\N	ROF	Yreka Rohrer Field	41.7281984999999978	-122.5278007
8345	\N	\N	VDT	Montevideo Bus Station	-34.8836111000000031	-56.181944399999999
8346	\N	\N	XAX	Dorval Railway Station	45.5088889000000023	-73.5541666999999961
8347	\N	\N	YMY	Downtown Railway Station	45.5088889000000023	-73.5541666999999961
8348	\N	\N	JQO	Belorussky Railway Station	55.7557860000000005	37.6176329999999979
8349	\N	\N	GPD	Mount Gordon Mine	-19.9994450000000015	139.91776999999999
8350	\N	\N	ZPE	Osnabrueck Hbf Rail Station	52.092070200000002	7.61057459999999963
8351	\N	\N	ZMU	Munich Hbf Railway Station	47.8527500000000003	106.763270000000006
8352	\N	\N	XUT	Murcia Railway Station	37.9834449000000021	-1.12988970000000011
8353	\N	\N	YMK	Mys-Kamenny	68.4684299999999979	73.5957300000000032
8354	\N	\N	YCD	Nanaimo	49.0499999999999972	-123.866669999999999
8355	\N	\N	ZNA	Nanaimo Harbour	49.0529300000000035	-123.874849999999995
8356	\N	\N	NFF	CZ Bus Station	36.2800000000000011	-80.7900000000000063
8357	\N	\N	QJZ	Nantes Railway Station	47.2183709999999977	-1.55362099999999992
8358	\N	\N	INP	Naples Central Railway Station	40.8400968999999989	14.2516356999999996
8359	\N	\N	NYT	Nay Pyi Taw	19.6224999999999987	96.2013850000000019
8360	\N	\N	IGT	Sleptsovskaya	43.3177799999999991	45.0016669999999976
8361	\N	\N	KDJ	Ndjole-Ville	-0.149999999999999994	10.766667
8362	\N	\N	XNY	39th Street Ferry	40.759999999999998	-74.0030000000000001
8363	\N	\N	ZYP	Penn Railway Station	40.7143528000000003	-74.0059731000000056
8364	\N	\N	WTC	World Trade Center	40.7000000000000028	-74.0166700000000048
8365	\N	\N	NIU	Niau	-16.1219880000000018	-146.373250000000013
8366	\N	\N	NFO	Mata'aho	-15.5999999999999996	-175.650000000000006
8367	\N	\N	NMC	Norman's Cay	24.5936100000000017	-76.8199999999999932
8368	\N	\N	XYK	Norrkoping C Rail Station	58.5947017000000017	16.1836072999999985
8369	\N	\N	OBK	Sky Harbor	42.1166699999999992	-87.8166659999999979
8370	\N	\N	ZGB	Nottingham Bus Station	21.5403330000000004	109.287850000000006
8371	\N	\N	XNM	Nottingham Railway Station	52.9551147000000029	-1.14917179999999997
8372	\N	\N	WMI	Modlin	52.4511099999999999	20.6516669999999998
8373	\N	\N	ZAQ	Nuremberg Hbf Railway Station	41.5616600000000034	46.6647869999999969
8374	\N	\N	NUA	Gregory's Lake	6.96666700000000017	80.7666700000000048
8375	\N	\N	NYA	Nyagan	62.101073999999997	65.605630000000005
8376	\N	\N	ARZ	N'zeto	-7.5	13.5
8377	\N	\N	MKI	Mboki	5.31666699999999981	25.9499999999999993
8378	\N	\N	ZIM	Odense Bus Station	55.4037560000000013	10.4023699999999995
8379	\N	\N	ZBQ	Odense Railway Station	55.4037560000000013	10.4023699999999995
8380	\N	\N	OHH	Novostroyka	53.5166660000000007	142.883330000000001
8381	\N	\N	XJC	Olomouc Main Railway Station	49.5953878999999986	17.2518720999999999
8382	\N	\N	ZGJ	Brugge Railway Station	51.2166666999999975	2.89999999999999991
8383	\N	\N	XWR	Orebro C Railway Station	59.2737550000000013	15.2075394999999993
8384	\N	\N	ZZN	Nationaltheatret RailS	59.913868800000003	10.7522453999999996
8385	\N	\N	XZO	Oslo S Railway Station	59.913868800000003	10.7522453999999996
8386	\N	\N	XJV	Ostrava Main Railway Station	49.8412714999999977	18.2902482999999982
8387	\N	\N	XGE	Ottawa Bus Station	45.4115719999999996	-75.6981940000000009
8388	\N	\N	XHG	Ottawa Bus Station	45.4115719999999996	-75.6981940000000009
8389	\N	\N	XDS	Ottawa Railway Station	45.4115719999999996	-75.6981940000000009
8390	\N	\N	OLL	Ollombo	32.0044169999999966	-92.2291639999999973
8391	\N	\N	PYY	Pai	19.3716660000000012	98.4366700000000066
8392	\N	\N	EEP	Pamplona Railway Station	58.4188880000000026	24.4727780000000017
8393	\N	\N	XJP	Pardubice Main Railway Station	50.0378280999999987	15.7808335
8394	\N	\N	XHP	Gare de l'Est Rail Station	48.8566140000000004	2.35222189999999998
8395	\N	\N	XJY	Massy TGV Rail Station	48.8566140000000004	2.35222189999999998
8396	\N	\N	XPO	Perth Ferry Port	-31.9522222000000014	115.858888899999997
8397	\N	\N	PNF	Peterson's Point	58.6833340000000021	-156.833329999999989
8398	\N	\N	ZFV	Philadelphia Railway Station	-1	-1
8399	\N	\N	TLY	Plastun	44.8146500000000003	136.289279999999991
8400	\N	\N	XOP	Poitiers Railway Station	46.5802240000000012	0.340374999999999983
8401	\N	\N	PGZ	Sant'Ana	-25.0833319999999986	-50.1499999999999986
8402	\N	\N	ZYJ	Porto TP Bus Station	41.1499680000000012	-8.61024259999999941
8403	\N	\N	PFL	Florenc Bus Station	50.0878113999999997	14.4204597999999997
8404	\N	\N	XYJ	Holesovice Railway Station	50.0878113999999997	14.4204597999999997
8405	\N	\N	XYG	Prague Main Railway Station	50.0878113999999997	14.4204597999999997
8406	\N	\N	VOD	Vodochody	50.0878113999999997	14.4204597999999997
8407	\N	\N	LOP	Lombok International	-8.75732200000000027	116.276669999999996
8408	\N	\N	XDW	Prince Rupert Railway Station	54.3061450000000008	-130.310881999999992
8409	\N	\N	PVB	Punta Del Este Bus Station	42.7435570000000027	-90.5439149999999984
8410	\N	\N	RNM	Qarn Alam	33.0890539999999973	-117.036389999999997
8411	\N	\N	YQJ	April Point SPB	50.1967500000000015	-125.267480000000006
8412	\N	\N	XLK	Levis Railway Station	46.8032826000000028	-71.2427959999999985
8413	\N	\N	GNF	Gansner Field	33.9753070000000008	-89.9322800000000058
8414	\N	\N	RAF	Rafaela	29.6000000000000014	34.8500000000000014
8415	\N	\N	ZIR	Randers Railway Station	24.9638880000000007	53.1527799999999999
8416	\N	\N	RRR	Raroia	-16.0448589999999989	-142.475560000000002
8417	\N	\N	ZPL	Recklinghausen Hbf Railway Station	24.4052800000000012	98.5318999999999932
8418	\N	\N	BZF	Benton Field	40.5865396000000018	-122.391675399999997
8419	\N	\N	YRC	Refuge Cove SPB	48.526764	-71.0573399999999964
8420	\N	\N	VDU	Tom O'Connor Oilfield	28.3000000000000007	-97.2833300000000065
8421	\N	\N	RCC	Reggio di Calabria Central Railway Station	38.0700000000000003	15.6500000000000004
8422	\N	\N	XIZ	Champagne-Ardenne TGV	49.2583290000000034	4.03169600000000017
8423	\N	\N	REQ	Reko Diq	-5.06494700000000009	-73.8666699999999992
8424	\N	\N	EER	Reus Railway Station	41.1548178999999976	1.10867599999999999
8425	\N	\N	RXE	Madison County	43.839109999999998	-111.851060000000004
8426	\N	\N	ZRX	Riesa Railway Station	51.3001422000000034	13.3021036000000006
8427	\N	\N	RMT	Rimatara	-22.6387830000000001	-152.805160000000001
8428	\N	\N	IRR	Ostiense Railway Station	41.8905197999999999	12.4942486000000006
8429	\N	\N	IRT	Tiburtina Railway Station	41.8905197999999999	12.4942486000000006
8430	\N	\N	XXY	Ronneby Railway Station	56.2700000000000031	15.2699999999999996
8431	\N	\N	ROZ	US Naval Station	43.1194460000000035	-7.50277800000000017
8432	\N	\N	QRH	Rotterdam Centraal Railway Station	51.9166680000000014	4.5
8433	\N	\N	RBX	Rumbek	6.82524300000000039	29.6695300000000017
8434	\N	\N	QFZ	Saarbruecken Hbf Railway Station	49.2348506000000015	6.99440159999999977
8435	\N	\N	AHW	Saih Rawl	31.3429199999999994	48.7466799999999978
8436	\N	\N	OLR	Salerno Air Base	34.0231670000000008	36.1303330000000003
8437	\N	\N	QSR	Pontecagnano	40.6201480000000004	14.9208400000000001
8438	\N	\N	ZSB	Salzburg Hbf Railway Station	47.8094899999999967	13.0550099999999993
8439	\N	\N	ZSQ	Salzwedel Railway Station	36.2658839999999998	120.382360000000006
8440	\N	\N	JCC	China Basin Heliport	37.75	-122.416663999999997
8441	\N	\N	ZJO	San Jose Bus Station	37.3393857000000011	-121.894955499999995
8442	\N	\N	YJH	San Sebastian Railway Station	43.320811599999999	-1.98444740000000008
8443	\N	\N	ZSH	Santa Fe Bus Station	30.236934999999999	120.432360000000003
8444	\N	\N	ETR	Santa Rosa Regional	-3.4522219999999999	-79.961669999999998
8445	\N	\N	YJL	Santander Railway Station	-20.5833319999999986	141.699999999999989
8446	\N	\N	JDR	Sao Joao Del Rei	-21.0879569999999994	-44.2301000000000002
8447	\N	\N	OKD	Okadama	43.1103740000000002	141.382000000000005
8448	\N	\N	XDX	Sarnia Railway Station	42.9847999999999999	-82.360590000000002
8449	\N	\N	INR	Kincheloe AFB	46.5	-84.3499999999999943
8450	\N	\N	ZSR	Schwerin Hbf Railway Station	53.6257429999999999	11.416893
8451	\N	\N	SED	Min'hat Hashnayim	31.1499999999999986	35.3833300000000008
8452	\N	\N	LEU	Seo de Urgel	42.4166680000000014	1.46666699999999994
8453	\N	\N	XQA	Santa Justa Railway Station	37.3826400000000021	-5.99629510000000021
8454	\N	\N	RUD	Shahrud	36.4267919999999989	55.0946240000000032
8455	\N	\N	EKS	Shakhtersk	45.2678530000000023	-111.65034
8456	\N	\N	HNZ	CZ Bus Station	36.4656099999999981	-78.6416700000000048
8457	\N	\N	FYG	Fuyong Ferry Port	22.5430990000000016	114.057867999999999
8458	\N	\N	ZYX	Yantian Ferry Port	22.5430990000000016	114.057867999999999
8459	\N	\N	LWK	Lerwick/Tingwall	60.1499999999999986	-1.14999999999999991
8460	\N	\N	SCS	Scatsta	60.4368249999999989	-1.29497200000000001
8461	\N	\N	LSI	Sumburgh	59.8778879999999987	-1.28711099999999989
8462	\N	\N	NGQ	Ngari Gunsa/Ali Kunsha	32.1038169999999994	80.0542760000000015
8463	\N	\N	NOP	Sinop	42.0174999999999983	35.0688900000000032
8464	\N	\N	ZKN	Skive Railway Station	56.5635559999999984	9.03214200000000034
8465	\N	\N	ZSL	Sligo Bus Station	54.2706068999999971	-8.47152789999999989
8466	\N	\N	HMB	Mubarak International	26.3388770000000001	31.7371669999999995
8467	\N	\N	OVS	Sovetsky	61.3320900000000009	63.6018869999999978
8468	\N	\N	ZSF	Springfield Railway Station	25.9312299999999993	119.669229999999999
8469	\N	\N	ZSV	St Louis Railway Station	38.6270025000000032	-90.1994042000000036
8470	\N	\N	ZKH	St Moritz Railway Station	46.4930499999999967	9.8360599999999998
8471	\N	\N	SVM	St Pauls	-10.3666669999999996	142.116669999999999
8472	\N	\N	ZWC	Stavanger Railway Station	38.1333300000000008	85.5333300000000065
8473	\N	\N	XEV	Stockholm C Rail Station	59.3327881000000019	18.0644880999999984
8474	\N	\N	ZSX	Stralsund Railway Station	54.3630770999999982	12.7249198000000003
8475	\N	\N	XWG	Strasbourg Railway Station	48.5831480000000013	7.74788199999999971
8476	\N	\N	SFS	Subic Bay International	14.7855559999999997	120.267219999999995
8477	\N	\N	ZSO	Suhl Railway Station	31.8500000000000014	117.283330000000007
8478	\N	\N	XYZ	Harnosand Railway Station	62.3908357999999978	17.3069157000000011
8479	\N	\N	XXZ	Sundsvall C Rail Station	62.3908357999999978	17.3069157000000011
8480	\N	\N	ZSZ	Swakopmund Railway Station	-22.6741010000000003	14.5278399999999994
8481	\N	\N	XYS	Sydney Ferry Port	-33.8689008999999999	151.207091399999996
8482	\N	\N	ZFX	Szczecin Bus Station	53.4285437999999999	14.5528116000000001
8483	\N	\N	TGK	Taganrog	47.2433779999999999	38.8640169999999969
8484	\N	\N	YFT	Taipa Ferry Port	-18.1783329999999985	125.554169999999999
8485	\N	\N	TPF	Peter O'Knight	27.9499999999999993	-82.4500000000000028
8486	\N	\N	XTP	Tampere Bus Station	61.4978555	23.7596327999999986
8487	\N	\N	TVS	Sannuhe	39.7239999999999966	117.993449999999996
8488	\N	\N	TGC	Tanjung Manis	2.17631500000000022	111.20335
8489	\N	\N	TQL	Tarko-Sale	64.9213400000000007	77.7973559999999935
8490	\N	\N	ZTL	Telluride Bus Station	37.9374938999999998	-107.812285200000005
8491	\N	\N	TNW	Jumandy	62.6661950000000019	-153.711199999999991
8492	\N	\N	TCZ	Tuofeng	24.9393789999999989	98.482024999999993
8493	\N	\N	ZYH	The Hague Centraal Railway Station	45.6208529999999968	126.236440000000002
8494	\N	\N	XDZ	The Pas Railway Station	53.9699999999999989	-101.090000000000003
8495	\N	\N	TJJ	Tianjin Bus Station	39.0841580000000022	117.200982999999994
8496	\N	\N	THQ	Maijishan	34.5562359999999984	105.865009999999998
8497	\N	\N	TDT	Tanda Tula	-24.5333329999999989	31.3000000000000007
8498	\N	\N	LMJ	Tokyo Bus Station	35.6894874999999985	139.691706399999987
8499	\N	\N	XLQ	Guildwood Railway Station	43.6535239999999973	-79.3839068999999995
8500	\N	\N	RAD	Road Town	18.427778	-64.6208340000000021
8501	\N	\N	TOV	West End SPB	18.4499999999999993	-64.5833360000000027
8502	\N	\N	TTK	Hale Railway Station	51.5833319999999986	-0.0833330000000000043
8503	\N	\N	XZV	Toulon Railway Station	43.1205410000000029	6.12863899999999973
8504	\N	\N	XSH	St-Pierre-Corps RailSt	47.3941439999999972	0.684840000000000004
8505	\N	\N	XJT	Tours Railway Station	47.3941439999999972	0.684840000000000004
8506	\N	\N	THW	Harbour SPB	8.56915099999999974	81.2329100000000039
8507	\N	\N	TDP	Trompeteros	15.543056	-61.3091659999999976
8508	\N	\N	XZT	Trondheim S Rail Station	63.4305148999999986	10.3950528000000002
8509	\N	\N	EEL	Tudela Railway Station	53.1202770000000015	6.57555599999999973
8510	\N	\N	ZTC	Turin Bus Station	45.0705620999999965	7.68661860000000008
8511	\N	\N	TPY	Porta Nuova Railway Station	45.0705620999999965	7.68661860000000008
8512	\N	\N	ITT	Porta Susa Railway Station	70.5833360000000027	-21.6666680000000014
8513	\N	\N	THX	Turukhansk	65.7972199999999958	87.9352800000000059
8514	\N	\N	UTS	Ust-Tsilma	65.4333340000000021	52.2000000000000028
8515	\N	\N	OGM	Ogobsucum	83.3822250000000054	-77.9332660000000033
8516	\N	\N	UIZ	Berz-Macomb	42.6166699999999992	-83.0499999999999972
8517	\N	\N	UYU	Uyuni	-20.4463000000000008	-66.848399999999998
8518	\N	\N	XHK	Valence TGV Railway Station	44.9333930000000024	4.89236000000000004
8519	\N	\N	YJV	Valencia Railway Station	39.4907321999999965	-0.455882400000000021
8520	\N	\N	XJN	Valladolid Bus Station	41.6529433999999981	-4.7283811
8521	\N	\N	XIV	Campo Grande Rail Station	41.6529433999999981	-4.7283811
8522	\N	\N	VAV	Lupepau'u	-18.5860120000000002	-173.968289999999996
8523	\N	\N	VNT	Ventspils	27.3000000000000007	87.2000000000000028
8524	\N	\N	VNZ	Vicenza Railway Station	45.5459053000000011	11.5403070000000003
8525	\N	\N	XWT	Mitte CAT Rail Station	48.2081743000000031	16.3738188999999998
8526	\N	\N	YJR	Vigo Railway Station	42.2313564000000028	-8.71244710000000033
8527	\N	\N	ZLA	Villars-sur-Ollon Railway Station	36.0333329999999989	103.866669999999999
8528	\N	\N	VPG	Vipingo	-3.84277800000000003	39.8049999999999997
8529	\N	\N	WKR	Walker's Cay	27.2666660000000007	-78.4000000000000057
8530	\N	\N	ZWU	Washington Union Railway Station	38.8951118000000022	-77.0363657999999987
8531	\N	\N	ZLD	Weinfelden Railway Station	40.2000000000000028	94.6833340000000021
8532	\N	\N	WEC	Wenchang Railway Station	49.2000000000000028	9.92500000000000071
8533	\N	\N	WNH	Puzhehei	23.3749070000000003	104.242559999999997
8534	\N	\N	ZWP	West Palm Beach Railway Station	26.7153424000000008	-80.0533745999999979
8535	\N	\N	WIB	Wilbarger County	0.464563000000000004	101.446883999999997
8536	\N	\N	ZWH	Windhoek Railway Station	-22.5589039999999983	17.0824810000000014
8537	\N	\N	XEC	Windsor Railway Station	42.2800000000000011	-82.9599999999999937
8538	\N	\N	XEF	Winnipeg Railway Station	49.8860829999999993	-97.1529210000000063
8539	\N	\N	ZWN	Wittenberge Railway Station	53	11.75
8540	\N	\N	WIT	Wittenoom	-22.2666660000000007	118.333336000000003
8541	\N	\N	WOS	Wonsan	50.2166670000000011	-126.616669999999999
8542	\N	\N	RKZ	Peace	29.3519439999999996	89.3100000000000023
8543	\N	\N	ENY	Ershilipu	36.6393660000000025	109.551479999999998
8544	\N	\N	YTY	Taizhou	32.5630570000000006	119.718890000000002
8545	\N	\N	ERG	Yerbogachen	61.2749999999999986	108.030000000000001
8546	\N	\N	LDS	Lindu	47.7518269999999987	129.017989999999998
8547	\N	\N	YUS	Batang	32.8399000000000001	97.0378999999999934
8548	\N	\N	DEE	Mendeleyevo	43.9583999999999975	145.682999999999993
8549	\N	\N	OZG	Zagora	30.2671430000000008	-5.8524560000000001
8550	\N	\N	ZIZ	Zamzama	26.7333339999999993	67.6666639999999973
8551	\N	\N	ZTU	Zaqatala	41.5616600000000034	46.6647869999999969
8552	\N	\N	YZY	Ganzhou	38.8074999999999974	100.660835000000006
8553	\N	\N	HHS	CZ Bus Station	13.0700000000000003	42.6383319999999983
8554	\N	\N	ZHY	Xiangshan	37.5689350000000033	105.152529999999999
8555	\N	\N	ZUI	Jiuzhou Ferry Port	22.2707149999999992	113.576725999999994
8556	\N	\N	ZLL	Zofingen Railway Station	36.0499999999999972	103.849999999999994
8557	\N	\N	ZZO	Zonalnoye	50.6666680000000014	142.75
8558	\N	\N	ZLP	HB Railway Station	47.3673470000000023	8.55000249999999973
8559	\N	\N	ZLQ	Oerlikon Railway Station	47.3673470000000023	8.55000249999999973
8560	\N	\N	БТГ	Batagay	67.6550000000000011	134.641667000000012
8561	\N	\N	ABA	Abakan	53.7166670000000011	91.5
8562	\N	\N	ABZ	Dyce	57.2002529999999965	-2.20418599999999998
8563	\N	\N	AHB	Abha	18.2342900000000014	42.6575739999999968
8564	\N	\N	ABI	Municipal	32.4094430000000031	-99.6797260000000023
8565	\N	\N	AUH	Abu Dhabi International	24.4269120000000015	54.6459729999999979
8566	\N	\N	ACU	Achutupo	9.57638900000000071	-79.7244400000000013
8567	\N	\N	ADA	Adana	36.9850300000000018	35.2973599999999976
8568	\N	\N	AZR	Adrar	27.8833330000000004	-0.283333000000000002
8569	\N	\N	ADF	Adiyaman	37.75	38.2666660000000007
8570	\N	\N	AGX	Agatti Island	10.8289670000000005	72.179869999999994
8571	\N	\N	AHE	Ahe Airport	-14.4280559999999998	-146.256939999999986
8572	\N	\N	AGR	Kheria	27.1583329999999989	77.9627760000000052
8573	\N	\N	WSY	Whitsunday Airstrip	-20.5027769999999983	148.752780000000001
8574	\N	\N	AJL	Aizawl	23.838985000000001	92.6248199999999997
8575	\N	\N	KKI	Spb	60.9069440000000029	-161.422230000000013
8576	\N	\N	AXT	Akita	39.6117699999999999	140.22014999999999
8577	\N	\N	KQA	Akutan	54.1333300000000008	-165.78334000000001
8578	\N	\N	ABT	Al-Aqiq	20.2940100000000001	41.6400199999999998
8579	\N	\N	ABY	Dougherty County	31.5322229999999983	-84.1961100000000044
8580	\N	\N	ALB	Albany International	42.7452770000000015	-73.8095550000000031
8581	\N	\N	ALL	Albenga	44.0499999999999972	8.21666699999999928
8582	\N	\N	ADH	Aldan	58.6000000000000014	125.400000000000006
8583	\N	\N	AES	Vigra	62.5596430000000012	6.11660499999999985
8584	\N	\N	HBE	Borg el Arab	30.9222339999999996	29.6865039999999993
8585	\N	\N	ALY	El Nohza	31.1925449999999991	29.9530579999999986
8586	\N	\N	AXD	Dimokritos	40.8567850000000021	25.9448930000000004
8587	\N	\N	AET	Allakaket	66.5616700000000066	-152.65834000000001
8588	\N	\N	ABE	Lehigh Valley International	40.6515729999999991	-75.4343640000000022
8589	\N	\N	ARD	Alor Island	-8.6833329999999993	124.533330000000007
8590	\N	\N	GUR	Gurney	-10.3108330000000006	150.338609999999989
8591	\N	\N	AAT	Altay	47.7503620000000026	88.0844400000000007
8592	\N	\N	AMY	Ambatomainty	-17.6833320000000001	45.6666680000000014
8593	\N	\N	AMQ	Pattimura	-3.70499599999999996	128.088879999999989
8594	\N	\N	AMS	Schiphol	52.3090699999999984	4.76338500000000042
8595	\N	\N	ANC	Ted Stevens Anchorage International Airport	61.1744419999999991	-149.996379999999988
8596	\N	\N	AUY	Aneityum	-20.3333319999999986	169.666670000000011
8597	\N	\N	ANE	Marce	47.4666670000000011	-0.550000000000000044
8598	\N	\N	AGN	Angoon	57.5038869999999989	-134.583329999999989
8599	\N	\N	ANI	Aniak	61.5743980000000022	-159.536969999999997
8600	\N	\N	ANK	Etimesgut	39.9833339999999993	32.8333319999999986
8601	\N	\N	AQG	Anqing	30.5824999999999996	117.050899999999999
8602	\N	\N	TNR	Ivato International Airport	-18.7996310000000015	47.4750299999999967
8603	\N	\N	AOJ	Aomori	40.7387579999999971	140.689220000000006
8604	\N	\N	FGI	Fagali I	-13.8333329999999997	-171.733339999999998
8605	\N	\N	ARW	Arad	46.1833340000000021	21.2666660000000007
8606	\N	\N	RAE	Arar	30.9030279999999991	41.1371150000000014
8607	\N	\N	AUC	Arauca	7.0716669999999997	-70.7425000000000068
8608	\N	\N	RKA	Aratika-Nord	-15.4852989999999995	-145.46887000000001
8609	\N	\N	AAX	Araxa	-19.5680559999999986	-46.9291699999999992
8610	\N	\N	ARC	Arctic Village	68.1375000000000028	-145.524439999999998
8611	\N	\N	AXM	El Eden	4.45286899999999974	-75.7680399999999992
8612	\N	\N	YEK	Arviat	61.1166699999999992	-94.0499999999999972
8613	\N	\N	PGU	Persian Gulf International	27.3839590000000008	52.735515999999997
8614	\N	\N	AVL	Asheville Regional Airport	35.4350799999999992	-82.5373150000000066
8615	\N	\N	HTS	Tri-state/Milton	38.3669429999999991	-82.5561139999999938
8616	\N	\N	ASO	Asosa	10.0472219999999997	34.5366670000000013
8617	\N	\N	ASW	Aswan	23.9680210000000002	32.8248180000000005
8618	\N	\N	ATZ	Assiut	27.0333329999999989	31
8619	\N	\N	ATH	Athens International Airport "Eleftherios Venizelos"	37.9363499999999974	23.9464860000000002
8620	\N	\N	ATL	Hartsfield-jackson Atlanta International	33.6400679999999994	-84.4440299999999979
8621	\N	\N	ACY	Atlantic City International	39.4507029999999972	-74.5722350000000063
8622	\N	\N	ATT	Atmautluak	60.8669429999999991	-162.267500000000013
8623	\N	\N	ATK	Atqasuk	70.5	-157.333329999999989
8624	\N	\N	AKL	Auckland International	-37.0047870000000003	174.78352000000001
8625	\N	\N	AGS	Bush Field	33.3736650000000026	-81.9734339999999975
8626	\N	\N	YPJ	Aupaluk	59.2999999999999972	-69.6666639999999973
8627	\N	\N	AUS	Austin-bergstrom International	30.2025450000000006	-97.6670600000000064
8628	\N	\N	AXU	Axum	14.1208329999999993	38.7166670000000011
8629	\N	\N	GYD	Heydar Aliyev International (Bina International)	40.4624859999999984	50.0503900000000002
8630	\N	\N	BAS	Balalae	-6.98333300000000001	155.883330000000001
8631	\N	\N	GPS	Baltra	-0.434721999999999997	-90.2827759999999984
8632	\N	\N	BKO	Bamako	12.5409260000000007	-7.94795099999999977
8633	\N	\N	BDH	Bandar Lengeh	26.5294859999999986	54.829146999999999
8634	\N	\N	BWN	Bandar Seri Begwan International Airport	4.94519700000000029	114.933750000000003
8635	\N	\N	BKK	Suvarnabhumi International	13.6930619999999994	100.752044999999995
8636	\N	\N	BNX	Banja Luka	44.9333340000000021	17.3000000000000007
8637	\N	\N	BAZ	Barbelos	-0.966944000000000026	-62.9336130000000011
8638	\N	\N	BRI	Palese	41.1338799999999978	16.7639099999999992
8639	\N	\N	BTI	Barter Island	70.1347200000000015	-143.578339999999997
8640	\N	\N	BSO	Basco	20.4530560000000001	121.977776000000006
8641	\N	\N	BIA	Poretta	42.5476150000000004	9.480124
8642	\N	\N	BHS	Raglan	-33.4138700000000028	149.655180000000001
8643	\N	\N	BTR	Ryan	30.5325370000000014	-91.1569060000000064
8644	\N	\N	BUS	Batum	41.610832000000002	41.6005549999999999
8645	\N	\N	BYN	Bayankhongor	46.1000000000000014	100.683334000000002
8646	\N	\N	CBH	Leger	31.6477779999999989	-2.25972200000000001
8647	\N	\N	BEU	Bedourie	-24.2300000000000004	139.444999999999993
8648	\N	\N	LAQ	La Braq	32.7886120000000005	21.9641669999999998
8649	\N	\N	BHY	Beihai	21.5403330000000004	109.287850000000006
8650	\N	\N	PEK	Beijing Capital International	40.0785369999999972	116.587100000000007
8651	\N	\N	BEY	Beirut Rafic Hariri Airport	33.8260730000000009	35.4930799999999991
8652	\N	\N	BJA	Bejaia	36.75	5.08333299999999966
8653	\N	\N	BEL	Val De Cans	-1.38986499999999991	-48.4800030000000035
8654	\N	\N	BHD	George Best Belfast City	54.6145199999999988	-5.87021499999999996
8655	\N	\N	BFS	Aldergrove International Airport	54.6623949999999965	-6.21761599999999959
8656	\N	\N	IXG	Sambre	15.8586109999999998	74.6183300000000003
8657	\N	\N	BZE	Philip S. W. Goldson International	17.5391669999999991	-88.3083340000000021
8658	\N	\N	BNY	Bellona	-11.3000000000000007	159.816669999999988
8659	\N	\N	CNF	Tancredo Neves International Airport	-19.6324180000000013	-43.9632149999999982
8660	\N	\N	BBO	Berbera	10.4194440000000004	45.0063900000000032
8661	\N	\N	BRN	Belp	46.9117279999999965	7.50356000000000023
8662	\N	\N	BTT	Bettles	66.9152760000000058	-151.526379999999989
8663	\N	\N	BMO	Bhamo	24.2738900000000015	97.2516600000000011
8664	\N	\N	BHO	Bhopal	23.2847609999999996	77.3417699999999968
8665	\N	\N	BIO	Bilbao	43.3055340000000015	-2.90580799999999995
8666	\N	\N	BIU	Bildudalur	65.8333360000000027	-23.9833339999999993
8667	\N	\N	BTU	Bintulu	3.17177199999999981	113.043459999999996
8668	\N	\N	XBJ	Birjand	32.8990500000000026	59.2549899999999994
8669	\N	\N	BHH	Bisha	19.9945090000000008	42.6184840000000023
8670	\N	\N	BQS	Blagoveschensk	50.4166680000000014	127.400000000000006
8671	\N	\N	BFN	Bloemfontein	-29.0958539999999992	26.2975160000000017
8672	\N	\N	BOY	Borgo	11.1636109999999995	-4.32444399999999973
8673	\N	\N	BPL	Alashankou	44.9042320000000004	82.0241850000000028
8674	\N	\N	BYO	Bonito Airport	-21.2294449999999983	-56.4561119999999974
8675	\N	\N	RNN	Bornholm	55.0655560000000008	14.7577780000000001
8676	\N	\N	BSA	Bossaso	11.2833330000000007	49.1499999999999986
8677	\N	\N	BOS	Logan International	42.3664599999999965	-71.0201799999999963
8678	\N	\N	BQL	Boulia	-22.8999999999999986	139.900000000000006
8679	\N	\N	SRQ	Sarasota/Bradenton International	27.38748	-82.5532800000000009
8680	\N	\N	YBR	Brandon	49.8999999999999986	-99.9500000000000028
8681	\N	\N	BKG	Branson	36.5320800000000006	-93.2005500000000069
8682	\N	\N	BTK	Bratsk	56.3666699999999992	101.816665999999998
8683	\N	\N	BGI	Grantley Adams International	13.0807319999999994	-59.4878349999999969
8684	\N	\N	TRI	Tri-cities Regional	36.481110000000001	-82.4078499999999963
8685	\N	\N	BNN	Bronnoy	65.4616999999999933	12.2157719999999994
8686	\N	\N	BRO	South Padre Is. International	25.9088899999999995	-97.4233300000000071
8687	\N	\N	BQK	Glynco Jetport	31.1666680000000014	-81.4833299999999952
8688	\N	\N	CRL	Charleroi Brussels South	50.4566960000000009	4.45170300000000019
8689	\N	\N	OTP	Henri Coanda International	44.571156000000002	26.077062999999999
8690	\N	\N	BBU	Baneasa	44.4959339999999983	26.080995999999999
8691	\N	\N	BUN	Buenaventura	3.82500000000000018	-76.9958340000000021
8692	\N	\N	EZE	Ezeiza Ministro Pistarini	-34.812730000000002	-58.5398330000000016
8693	\N	\N	YBH	Bull Harbour	50.8999999999999986	-127.916663999999997
8694	\N	\N	BOJ	Bourgas	42.4166680000000014	27.2833329999999989
8695	\N	\N	BFV	Buri Ram	15.2269439999999996	103.255279999999999
8696	\N	\N	PUS	Gimhae	35.1793169999999975	128.948730000000012
8697	\N	\N	USU	Francisco Reyes	12.0999999999999996	120.166663999999997
8698	\N	\N	BXU	Butuan	8.94799899999999937	125.481229999999996
8699	\N	\N	CAH	Ca Mau	9.17555600000000027	105.17944
8700	\N	\N	CFC	Cacador	-26.7905559999999987	-50.9413869999999989
8701	\N	\N	OAL	Cacoal	-11.4338890000000006	-61.4825000000000017
8702	\N	\N	CAG	Elmas	39.2543330000000026	9.06067299999999953
8703	\N	\N	CJC	El Loa	-22.4950849999999996	-68.9084299999999956
8704	\N	\N	CMW	Ign Agramonte International	21.4186119999999995	-77.8497239999999948
8705	\N	\N	YBL	Campbell River	49.9517250000000033	-125.268129999999999
8706	\N	\N	CKZ	Canakkale	40.1333300000000008	26.3999999999999986
8707	\N	\N	CUN	Cancún International	21.040457	-86.8744350000000054
8708	\N	\N	CKS	Carajas	-6.11474899999999977	-50.0019449999999992
8709	\N	\N	CCF	Salvaza	43.2166670000000011	2.31666699999999981
8710	\N	\N	CUP	Carupano	10.6588890000000003	-63.2625000000000028
8711	\N	\N	CAS	Anfa	33.5597229999999982	-7.66305600000000009
8712	\N	\N	CMN	Mohamed V	33.3666699999999992	-7.58666700000000027
8713	\N	\N	MPH	Malay	11.9252629999999993	121.952100000000002
8714	\N	\N	CBT	Catumbela	-12.483333	13.483333
8715	\N	\N	CAQ	Caucasia	7.59999999999999964	-75.25
8716	\N	\N	CXJ	Campo Dos Bugres	-29.1666680000000014	-51.1833340000000021
8717	\N	\N	CAY	Rochambeau	4.81666699999999981	-52.3666699999999992
8718	\N	\N	CYB	Gerrard-Smith	19.6901909999999987	-79.8794099999999929
8719	\N	\N	CYO	Cayo Largo Del Sur	21.6166669999999996	-81.5166700000000048
8720	\N	\N	CED	Ceduna	-32.1237799999999964	133.701220000000006
8721	\N	\N	CDR	Chadron	42.8350000000000009	-103.09778
8722	\N	\N	CHQ	Souda	35.5401999999999987	24.1403730000000003
8723	\N	\N	CHS	Charleston, AFB Municipal	32.8843540000000019	-80.0371549999999985
8724	\N	\N	YCL	Charlo	47.9833339999999993	-66.3333360000000027
8725	\N	\N	CHT	Karewa	-43.7999999999999972	-176.349999999999994
8726	\N	\N	YCS	Chesterfield Inlet	63.3333319999999986	-90.7166699999999935
8727	\N	\N	VAK	Chevak	61.5286100000000005	-165.590270000000004
8728	\N	\N	CYS	Cheyenne	41.1558339999999987	-104.816665999999998
8729	\N	\N	CYI	Chiayi	23.4666670000000011	120.383330000000001
8730	\N	\N	RFD	Greater Rockford Airport	42.3036400000000015	-89.2221150000000023
8731	\N	\N	GYY	Gary/Chicago International	41.6166699999999992	-87.4166639999999973
8732	\N	\N	CKX	Chicken	64.0677799999999991	-141.949170000000009
8733	\N	\N	CIC	Chico	39.7958339999999993	-121.856669999999994
8734	\N	\N	CIF	Chifeng	42.2373919999999998	118.910889999999995
8735	\N	\N	KCQ	Chignik	56.2611119999999971	-158.777770000000004
8736	\N	\N	KCG	Fisheries	56.3108330000000024	-158.373610000000014
8737	\N	\N	KCL	Lagoon	56.3083340000000021	-158.531939999999992
8738	\N	\N	VPY	Chimoio	-19.1333330000000004	33.4833339999999993
8739	\N	\N	HTA	Chita	52.0333329999999989	113.299999999999997
8740	\N	\N	COQ	Choibalsan	48.1333300000000008	114.900000000000006
8741	\N	\N	XCH	Christmas Island	-10.5	105.666663999999997
8742	\N	\N	ICI	Cicia	-17.75	-179.333329999999989
8743	\N	\N	CXP	Tunggul Wulung	-7.73333300000000001	109
8744	\N	\N	CVG	Cincinnati/Northern Kentucky	39.0555000000000021	-84.6614500000000021
8745	\N	\N	CME	Ciudad Del Carmen	18.6510299999999987	-91.8027340000000009
8746	\N	\N	CJS	Abraham Gonzalez International	31.6359299999999983	-106.436099999999996
8747	\N	\N	CEN	Ciudad Obregon	27.3919449999999998	-109.839164999999994
8748	\N	\N	CVM	Ciudad Victoria	23.7138880000000007	-98.965280000000007
8749	\N	\N	CFE	Clermont/Ferrand Auvergne International (Aulnat)	45.7803200000000032	3.16389299999999984
8750	\N	\N	BKL	Burke Lakefront	41.5169449999999998	-81.6833340000000021
8751	\N	\N	CIJ	Capitan Anibal Arab	-11.026389	-68.7527800000000013
8752	\N	\N	CCK	Cocos Islands	-12.1666670000000003	96.9166639999999973
8753	\N	\N	COL	Isle Of Coll	56.6166699999999992	-6.61666699999999963
8754	\N	\N	RML	Ratmalana	6.81944399999999984	79.8875000000000028
8755	\N	\N	CSA	Isle Of Colonsay	56.0833319999999986	-6.20000000000000018
8756	\N	\N	COS	Colorado Springs	38.7971300000000028	-104.700559999999996
8757	\N	\N	CAE	Metropolitan Airport	33.9469070000000031	-81.1250100000000032
8758	\N	\N	GTR	Golden Triangle Reg.	33.4500000000000028	-88.5999999999999943
8759	\N	\N	CMH	Port Columbus International	39.9981799999999978	-82.8849639999999965
8760	\N	\N	LCK	Rickenbacker	39.8166659999999979	-82.9333340000000021
8761	\N	\N	CRD	Comodoro Rivadavia	-45.7872240000000019	-67.4627760000000052
8762	\N	\N	CDJ	Conceicao Do Araguaia	-8.23333300000000001	-49.2833329999999989
8763	\N	\N	CND	Kogalniceanu	44.3500000000000014	28.4833339999999993
8764	\N	\N	CPH	Kastrup	55.6290499999999994	12.6476009999999999
8765	\N	\N	ORK	Cork	51.8466450000000023	-8.4891400000000008
8766	\N	\N	CRP	Corpus Christi International Airport	27.7748130000000018	-97.5024899999999946
8767	\N	\N	CBO	Awang	7.16141200000000033	124.214640000000003
8768	\N	\N	COO	Cotonou	6.35309699999999999	2.38527099999999992
8769	\N	\N	CZS	International Airport Cruzeiro Do Sul	-7.58333299999999966	-72.7833300000000065
8770	\N	\N	CUE	Cuenca	-2.88934300000000022	-78.9868900000000025
8771	\N	\N	CPX	Culebra	18.3000000000000007	-65.3166659999999979
8772	\N	\N	KME	Kamembe	-2.46666700000000017	28.9166680000000014
8773	\N	\N	TAE	Daegu	35.8992539999999991	128.637879999999996
8774	\N	\N	VIL	Dakhla	23.7133329999999987	-15.9350000000000005
8775	\N	\N	DLZ	Dalanzadgad	43.9666670000000011	104.683334000000002
8776	\N	\N	DLU	Dali	25.6513500000000008	100.323160000000001
8777	\N	\N	DFW	Dallas/Fort Worth International	32.8974600000000024	-97.0361249999999984
8778	\N	\N	DAR	Dar Es Salam International Airport	-6.87353300000000011	39.2021099999999976
8779	\N	\N	DAU	Daru	-9.08351000000000042	143.206050000000005
8780	\N	\N	DAT	Datong	40.0555400000000006	113.481359999999995
8781	\N	\N	DAX	Daxian	31.1350119999999997	107.42689
8782	\N	\N	DEZ	Al Jafrah	35.2875500000000031	40.1868059999999971
8783	\N	\N	DNZ	Cardak	37.7872240000000019	29.7033330000000007
8784	\N	\N	DEN	Denver International	39.8493899999999996	-104.672843999999998
8785	\N	\N	DSK	Dera Ismail Khan	31.9166680000000014	70.9000000000000057
8786	\N	\N	DTW	Detroit Metropolitan Wayne County	42.207810000000002	-83.3560499999999962
8787	\N	\N	DIJ	Dijon	47.2708319999999986	5.088889
8788	\N	\N	DJE	Djerba-Zarzis	33.8711800000000025	10.7751450000000002
8789	\N	\N	DNK	Dnepropetrovsk	48.3687400000000025	35.094459999999998
8790	\N	\N	DOB	Dobo Airport	-5.75	134
8791	\N	\N	DOD	Dodoma	-6.16666700000000034	35.7502799999999965
8792	\N	\N	DLE	Tavaux	47.0499999999999972	5.43333300000000019
8793	\N	\N	DCF	Cane Field	15.5	-61.3333319999999986
8794	\N	\N	DOY	Dongying	37.5183329999999984	118.787779999999998
8795	\N	\N	DOU	Dourados	-22.2027779999999986	-54.9255560000000003
8796	\N	\N	DWC	Dubai World Central	24.918056	55.1752779999999987
8797	\N	\N	XNB	Chelsea Twr EY Bus Station	25.2644443999999986	55.3116667000000035
8798	\N	\N	DUB	Dublin International	53.4272800000000032	-6.24357000000000006
8799	\N	\N	DUS	Düsseldorf International Airport	51.2783280000000019	6.76557999999999993
8800	\N	\N	NRN	Weeze	51.5992850000000018	6.15016799999999986
8801	\N	\N	DRO	La Plata	37.159950000000002	-107.751075999999998
8802	\N	\N	VIR	Virginia	-29.7666660000000007	31.0666679999999999
8803	\N	\N	RDU	Raleigh-durham International Airport	35.8735920000000021	-78.790859999999995
8804	\N	\N	DYU	Dushanbe	38.5489400000000018	68.8172799999999967
8805	\N	\N	IPC	Mataveri International	-27.1166669999999996	-109.366669999999999
8806	\N	\N	EOI	Eday	59.1833340000000021	-2.78333299999999983
8807	\N	\N	YEG	Edmonton International Airport	53.3073770000000025	-113.584045000000003
8808	\N	\N	EDA	Edna Bay	55.9500000000000028	-133.666670000000011
8809	\N	\N	EGS	Egilsstadir	65.277780000000007	-14.4027779999999996
8810	\N	\N	ELF	El Fasher	13.6166669999999996	25.3166679999999999
8811	\N	\N	ELU	Guemar	33.5166660000000007	6.78333299999999983
8812	\N	\N	EYP	El Yopal	5.32072900000000004	-72.3862840000000034
8813	\N	\N	EBA	Marina Di Campo	42.7666660000000007	10.2833330000000007
8814	\N	\N	ESL	Elista	46.3666699999999992	44.3333319999999986
8815	\N	\N	EMD	Emerald	-23.5686099999999996	148.174399999999991
8816	\N	\N	EMK	Emmonak	62.7769430000000028	-164.520829999999989
8817	\N	\N	ENE	Ende	-8.83333299999999966	121.650000000000006
8818	\N	\N	NBE	Zine El Abidine Ben Ali International Airport	36.0758319999999983	10.4386109999999999
8819	\N	\N	ENH	Enshi	30.3219339999999988	109.482010000000002
8820	\N	\N	EBB	Entebbe	0.0451109999999999983	32.4431840000000022
8821	\N	\N	EPL	Mirecourt	48.3258319999999983	6.06944399999999984
8822	\N	\N	EBL	Erbil International (irbil Northwest)	36.2374999999999972	43.9630549999999971
8823	\N	\N	IFN	Isfahan International	32.7456859999999992	51.8763799999999975
8824	\N	\N	AOE	Anadolu University	39.8100000000000023	30.519444
8825	\N	\N	ESM	Esmeraldas	0.966667000000000054	-79.625
8826	\N	\N	SON	Pekoa	-15.5082509999999996	167.218729999999994
8827	\N	\N	FKQ	Fak Fak	-2.9166669999999999	132.300000000000011
8828	\N	\N	FAV	Fakarava	-16.0534859999999995	-145.652250000000009
8829	\N	\N	KFP	False Pass	54.8491670000000013	-163.409160000000014
8830	\N	\N	FAO	Faro	37.0206450000000018	-7.96854499999999977
8831	\N	\N	FAE	Vagar	62.0666659999999979	-7.26666699999999999
8832	\N	\N	FEN	Fernando De Noronha	-3.85000000000000009	-32.4166680000000014
8833	\N	\N	FLS	Flinders Island	-40.0949999999999989	147.996669999999995
8834	\N	\N	MSL	Sheffield	34.7486099999999993	-87.6161100000000062
8835	\N	\N	FLW	Santa Cruz	39.4666670000000011	-31.1499999999999986
8836	\N	\N	FRO	Flora	61.58643	5.02457699999999985
8837	\N	\N	FLL	Fort Lauderdale–Hollywood International	26.0714910000000017	-80.1449049999999943
8838	\N	\N	TBN	Forney AAF	37.7413900000000027	-92.1405599999999936
8839	\N	\N	FMY	Page Field	26.5833319999999986	-81.8666699999999992
8840	\N	\N	RSW	Southwest Florida International	26.5428350000000002	-81.7543299999999959
8841	\N	\N	FON	Fortuna	10.4000000000000004	-84.4833299999999952
8842	\N	\N	FUO	Fuoshan	23.1333330000000004	113.283330000000007
8843	\N	\N	FRA	Frankfurt International Airport	50.0507350000000031	8.57077300000000086
8844	\N	\N	FRD	Friday Harbor	48.5248070000000027	-123.026499999999999
8845	\N	\N	FBS	Friday Harbor SPB	48.543610000000001	-123.006110000000007
8846	\N	\N	FDH	Friedrichshafen	47.6727750000000015	9.52348199999999956
8847	\N	\N	FUE	Fuerteventura	28.4506049999999995	-13.8698929999999994
8848	\N	\N	FUJ	Fukue	32.6678280000000001	128.837619999999987
8849	\N	\N	FUK	Fukuoka	33.5842859999999988	130.443900000000014
8850	\N	\N	FUT	Futuna Island	-14.25	-178.150000000000006
8851	\N	\N	FUG	Fuyang	32.8666699999999992	115.700000000000003
8852	\N	\N	GLK	Galcaio	6.76666699999999999	47.4333340000000021
8853	\N	\N	GAM	Gambell	63.7765959999999978	-171.713549999999998
8854	\N	\N	GCK	Garden City Municipal Airport	37.928609999999999	-100.72972
8855	\N	\N	GOU	Garoua	9.33611100000000071	13.3755559999999996
8856	\N	\N	YGP	Michel Pouliot	48.7666660000000007	-64.4833299999999952
8857	\N	\N	GAY	Gaya	24.7466679999999997	84.9458300000000008
8858	\N	\N	GHA	Noumerate	32.3822199999999967	3.80055599999999982
8859	\N	\N	GIL	Gilgit	35.9197199999999981	74.3322399999999988
8860	\N	\N	GOQ	Golmud	36.4046329999999969	94.7893100000000004
8861	\N	\N	GOM	Goma	-1.66999999999999993	29.2349999999999994
8862	\N	\N	RGK	Gorno-Altaysk	51.9691660000000013	85.8363899999999944
8863	\N	\N	GTO	Tolotio	0.639039000000000024	122.850876
8864	\N	\N	GVR	Governador Valadares	-18.8502790000000005	-41.9333340000000021
8865	\N	\N	GHB	Governors Harbour	25.2804889999999993	-76.3248799999999932
8866	\N	\N	GFN	Grafton	-29.7595209999999994	153.028339999999986
8867	\N	\N	GRW	Graciosa Island	39.0909540000000035	-28.0279580000000017
8868	\N	\N	FLG	Pulliam Field	35.1377799999999993	-111.671670000000006
8869	\N	\N	GCW	Grand Canyon West	36.0721100000000021	-113.9495
8870	\N	\N	GCM	Owen Roberts International	19.2963699999999996	-81.3577899999999943
8871	\N	\N	GRR	Gerald R. Ford International	42.8850100000000012	-85.5297400000000039
8872	\N	\N	GDT	Grand Turk Island	21.4666670000000011	-71.1333300000000008
8873	\N	\N	GPZ	Grand Rapids	47.2144430000000028	-93.5111100000000022
8874	\N	\N	KGX	Grayling	62.8952799999999996	-160.0625
8875	\N	\N	GBZ	Great Barrier Island	-36.25	175.416670000000011
8876	\N	\N	GNI	Green Island	23.1000000000000014	121.466669999999993
8877	\N	\N	GSP	Greenville Spartanburg International Airport	34.8905680000000018	-82.2170600000000036
8878	\N	\N	GND	Point Salines International	12.0041670000000007	-61.7861100000000008
8879	\N	\N	GFF	Griffith	-34.255431999999999	146.062700000000007
8880	\N	\N	GRQ	Eelde	53.1202770000000015	6.57555599999999973
8881	\N	\N	GTZ	Kirawira B	-2.16083299999999978	34.2255549999999999
8882	\N	\N	GDL	Don Miguel Hidalgo y Costilla International	20.5251979999999996	-103.299210000000002
8883	\N	\N	GJA	Guanaja	16.4450000000000003	-85.9058299999999946
8884	\N	\N	GYS	Guang Yuan	32.3950000000000031	105.699719999999999
8885	\N	\N	NBW	Guantanamo NAS	20.1666680000000014	-75.2333299999999952
8886	\N	\N	GPT	Gulfport-Biloxi International	30.4132840000000009	-89.072029999999998
8887	\N	\N	GWD	Gwadar	25.230556	62.3388899999999992
8888	\N	\N	LWN	Gyoumri	40.7166670000000011	43.8333319999999986
8889	\N	\N	HPH	Catbi	20.8233150000000009	106.727324999999993
8890	\N	\N	XFW	Finkenwerder	52.5358349999999987	9.83694500000000005
8891	\N	\N	HTI	Hamilton Island	-20.3517499999999991	148.948469999999986
8892	\N	\N	HNM	Hana	20.7958339999999993	-156.018889999999999
8893	\N	\N	HNA	Hanamaki	39.4269260000000017	141.130770000000012
8894	\N	\N	HRL	Valley International	26.2234820000000006	-97.6622540000000043
8895	\N	\N	MDT	Harrisburg International	40.1960070000000016	-76.7560600000000051
8896	\N	\N	BDL	Bradley International	41.9295299999999997	-72.6847000000000065
8897	\N	\N	HAA	Hasvik	70.4666699999999935	22.1499999999999986
8898	\N	\N	HDY	Hat Yai	6.93676400000000015	100.393559999999994
8899	\N	\N	HTY	Hatay	36.3645440000000022	36.2805699999999973
8900	\N	\N	HIS	Hayman Island	-20.0666679999999999	148.866669999999999
8901	\N	\N	HYS	Municipal	38.846110000000003	-99.274169999999998
8902	\N	\N	HKB	Healy Lake	63.8666699999999992	-148.96665999999999
8903	\N	\N	HEK	Heihe	50.2166670000000011	127.433334000000002
8904	\N	\N	HLN	Helena	46.6105200000000011	-111.990179999999995
8905	\N	\N	HMV	Hemavan	65.7277760000000058	15.2730560000000004
8906	\N	\N	HEA	Herat	34.2126960000000011	62.225990000000003
8907	\N	\N	HMO	Gen Pesqueira Garcia	29.0899050000000017	-111.051704000000001
8908	\N	\N	JBQ	Dr.Joaquin Balaguer	18.5757310000000011	-69.9814400000000063
8909	\N	\N	HOF	Alahsa	25.2947829999999989	49.4874599999999987
8910	\N	\N	HOG	Frank Pais	20.7852780000000017	-76.3149999999999977
8911	\N	\N	HCR	Holy Cross	62.1888900000000007	-159.77167
8912	\N	\N	HOM	Homer	59.6432399999999987	-151.493159999999989
8913	\N	\N	HVG	Valan	70.9833299999999952	25.8333319999999986
8914	\N	\N	HNH	Hoonah	58.0980569999999972	-135.403339999999986
8915	\N	\N	HTN	Hotan	37.0404359999999997	79.8724500000000006
8916	\N	\N	HOE	Houeisay	20.5	103.75
8917	\N	\N	IAH	George Bush Intercontinental	29.9833339999999993	-95.3400000000000034
8918	\N	\N	HUN	Hualien	24.0257639999999988	121.613433999999998
8919	\N	\N	NOV	Huambo	-12.8055559999999993	15.7572220000000005
8920	\N	\N	HUI	Phu Bai	16.398223999999999	107.700873999999999
8921	\N	\N	HUS	Municipal	66.0405599999999993	-154.263339999999999
8922	\N	\N	HUE	Humera	14.25	36.5833319999999986
8923	\N	\N	HSV	Huntsville International - Carl T. Jones Field	34.6485699999999994	-86.7748399999999975
8924	\N	\N	HON	Howes	44.3836099999999973	-98.226389999999995
8925	\N	\N	HZK	Husavik	65.9552800000000019	-17.427778
8926	\N	\N	HSL	Huslia	65.7025000000000006	-156.375
8927	\N	\N	HYG	SPB	55.2066700000000026	-132.826660000000004
8928	\N	\N	IAS	Iasi	47.1769869999999969	27.6169930000000008
8929	\N	\N	IBA	Ibadan	7.43194399999999966	3.911111
8930	\N	\N	IBZ	Ibiza	38.8765950000000018	1.3678030000000001
8931	\N	\N	IGD	Igdir	39.9744450000000029	43.8797229999999985
8932	\N	\N	QFI	Heliport	68.1666639999999973	-53.25
8933	\N	\N	IGG	Igiugig	59.3166659999999979	-155.900000000000006
8934	\N	\N	QRY	Heliport	68.1500000000000057	-53.4500000000000028
8935	\N	\N	YGR	Iles De La Madeleine	47.3666699999999992	-61.8999999999999986
8936	\N	\N	XIQ	Harbour	69	-51
8937	\N	\N	VVZ	Illizi	26.5333329999999989	8.55000000000000071
8938	\N	\N	JAV	Ilulissat	69.2344400000000064	-51.0511100000000013
8939	\N	\N	IMF	Municipal	24.7645699999999991	93.8970640000000003
8940	\N	\N	IAM	In Amenas	28.0511109999999988	9.63805600000000062
8941	\N	\N	IGA	Inagua	20.9833339999999993	-73.6666639999999973
8942	\N	\N	IND	Indianapolis International	39.7145160000000033	-86.2980500000000035
8943	\N	\N	INL	Falls International	48.5630570000000006	-93.4041699999999935
8944	\N	\N	IVC	Invercargill	-46.4154320000000027	168.321750000000009
8945	\N	\N	IPN	Usiminas	-19.5	-42.5333329999999989
8946	\N	\N	IPI	San Luis	0.866388999999999965	-77.711669999999998
8947	\N	\N	YFB	Iqaluit	63.7517500000000013	-68.5365800000000007
8948	\N	\N	IQQ	Cavancha	-20.547937000000001	-70.1784799999999933
8949	\N	\N	IRI	Nduli	-7.67055600000000037	35.7502799999999965
8950	\N	\N	IMT	Ford	45.8155560000000008	-88.1141700000000014
8951	\N	\N	IST	Ataturk	40.976664999999997	28.8152769999999983
8952	\N	\N	ITB	Itaituba	-4.28333299999999983	-55.9833339999999993
8953	\N	\N	IVL	Ivalo	68.6111149999999981	27.4155559999999987
8954	\N	\N	IWJ	Iwami	34.6763880000000029	131.790279999999996
8955	\N	\N	IZO	Izumo	35.4148500000000013	132.885760000000005
8956	\N	\N	JAI	Sanganeer	26.8207720000000016	75.8015099999999933
8957	\N	\N	CGK	Soekarno-Hatta International	-6.13064300000000006	106.655524999999997
8958	\N	\N	JQE	Jaque	7.5	-78.1666639999999973
8959	\N	\N	DJJ	Sentani	-2.56988700000000003	140.512990000000002
8960	\N	\N	JIJ	Jigiga	9.36666699999999963	42.7666660000000007
8961	\N	\N	JIM	Jimma	7.6544439999999998	36.8211099999999973
8962	\N	\N	JHG	Gasa	21.9734209999999983	100.766459999999995
8963	\N	\N	HIN	Sacheon	35.0926299999999998	128.086759999999998
8964	\N	\N	JNB	Oliver Reginald Tambo International (Jan Smuts International)	-26.1326639999999983	28.2313140000000011
8965	\N	\N	JHB	Sultan Ismail International	1.63888900000000004	103.670829999999995
8966	\N	\N	JKG	Axamo	57.7501000000000033	14.0704969999999996
8967	\N	\N	JRH	Rowriah	26.7344839999999984	94.184899999999999
8968	\N	\N	AJF	Jouf	29.7886680000000013	40.1014860000000013
8969	\N	\N	JDO	Regional Do Cariri	-7.20000000000000018	-39.3166659999999979
8970	\N	\N	JUB	Juba	4.8661979999999998	31.6016919999999999
8971	\N	\N	KDO	Kadhdhoo	1.88333299999999992	73.5166700000000048
8972	\N	\N	KAD	Kaduna	10.5958330000000007	7.44027800000000017
8973	\N	\N	OGG	Kahului	20.8928830000000012	-156.438629999999989
8974	\N	\N	GGM	Kakamega	0.266425000000000023	34.7833329999999989
8975	\N	\N	AZO	Kalamazoo/Battle Creek International	42.2399640000000005	-85.5565600000000046
8976	\N	\N	KLX	Kalamata	37.0694429999999997	22.0277789999999989
8977	\N	\N	KLO	Kalibo	11.6871519999999993	122.381829999999994
8978	\N	\N	FCA	Glacier Park International	48.307304000000002	-114.253150000000005
8979	\N	\N	KAC	Kameshli	37.0310249999999996	41.2055599999999984
8980	\N	\N	QPW	Heliport	68.25	-53.5
8981	\N	\N	XGR	Kangiqsualujjuaq	58.5	-65.9833299999999952
8982	\N	\N	KNU	Kanpur	26.4027789999999989	80.4124999999999943
8983	\N	\N	MCI	Kansas City International Airport	39.2938079999999985	-94.7199250000000035
8984	\N	\N	KHI	Quaid-e-azam International	24.8999859999999984	67.1682799999999958
8985	\N	\N	KLV	Karlovy Vary	50.2000000000000028	12.9166670000000003
8986	\N	\N	KSY	Kars	40.5516659999999973	43.085835000000003
8987	\N	\N	KSQ	Karshi	38.8098099999999988	65.7753100000000046
8988	\N	\N	KAA	Kasama	-10.2158329999999999	31.129999999999999
8989	\N	\N	BBK	Kasane	-17.8166679999999999	25.1499999999999986
8990	\N	\N	MPA	Mpacha	-17.5	24.2666660000000007
8991	\N	\N	KTM	Tribhuvan International	27.6999050000000011	85.3565700000000049
8992	\N	\N	KKR	Kaukura Atoll	-15.7833330000000007	-146.666670000000011
8993	\N	\N	KZN	Kazan	55.6084400000000016	49.2982399999999998
8994	\N	\N	EAR	Kearney	40.7283329999999992	-98.9988859999999988
8995	\N	\N	EFL	Kefalonia Istland International Airport	38.1180570000000003	20.5055559999999986
8996	\N	\N	ENA	Kenai	60.5652100000000004	-151.246440000000007
8997	\N	\N	KET	Keng Tung	21.3000000000000007	99.6166699999999992
8998	\N	\N	YQK	Kenora	49.7875000000000014	-94.3583299999999952
8999	\N	\N	KSH	Kermanshah	34.3559150000000031	47.1451259999999976
9000	\N	\N	HMA	Khanty-Mansiysk	61.026130000000002	69.097139999999996
9001	\N	\N	KHS	Khasab	26.1639389999999992	56.2350599999999972
9002	\N	\N	KHE	Kherson	46.6752779999999987	32.6277770000000018
9003	\N	\N	LBD	Khudzhand	40.2198869999999999	69.6965000000000003
9004	\N	\N	IEV	Zhulyany	50.4019430000000028	30.4508319999999983
9005	\N	\N	GRK	Robert Gray AAF	31.0618209999999983	-97.8209149999999994
9006	\N	\N	YLC	Kimmirut	62.8500000000000014	-69.8833300000000008
9007	\N	\N	KVC	King Cove	55.0549999999999997	-162.313340000000011
9008	\N	\N	KMC	King Khalid Military	27.9112819999999999	45.5234949999999969
9009	\N	\N	IGM	Kingman	35.2566679999999977	-113.939999999999998
9010	\N	\N	KNH	Shang-Yi	24.4205550000000002	118.344443999999996
9011	\N	\N	CXI	Cassidy International Airport	1.96666699999999994	-157.449999999999989
9012	\N	\N	KIH	Kish Island	26.5322759999999995	53.9720840000000024
9013	\N	\N	KTL	Kitale	0.974110999999999949	34.9592480000000023
9014	\N	\N	YKF	Kitchener-Waterloo Regional	43.4552229999999966	-80.3750299999999953
9015	\N	\N	KKB	SPB	58.1833340000000021	-152.349999999999994
9016	\N	\N	QJE	Heliport	68.8333360000000027	-53.1666680000000014
9017	\N	\N	YKT	Klemtu	52.5940299999999965	-128.521680000000003
9018	\N	\N	OBU	Kobuk/Wien	66.9105500000000006	-156.883330000000001
9019	\N	\N	USM	Koh Samui	9.55531500000000023	100.062799999999996
9020	\N	\N	KMQ	Komatsu	36.4023699999999977	136.413420000000002
9021	\N	\N	KXK	Komsomolsk Na Amure	50.3999999999999986	136.949999999999989
9022	\N	\N	KYA	Konya	37.9791680000000014	32.5622200000000035
9023	\N	\N	KRL	Korla	41.6898959999999974	86.1243400000000037
9024	\N	\N	ROR	Babelthuap/Koror	7.36412200000000006	134.532900000000012
9025	\N	\N	KSC	Barca	48.6666680000000014	21.25
9026	\N	\N	KSN	Kostanay	53.2000000000000028	63.5499999999999972
9027	\N	\N	BKI	Kota-Kinabalu International Airport	5.92396100000000025	116.050749999999994
9028	\N	\N	KOT	Kotlik	63.0297199999999975	-163.560270000000003
9029	\N	\N	KOC	Koumac	-20.5	164.416670000000011
9030	\N	\N	KKA	Koyuk	64.9394450000000063	-161.150000000000006
9031	\N	\N	KYU	Koyukuk	64.8780600000000049	-157.713060000000013
9032	\N	\N	KBV	Krabi	8.09728100000000062	98.9806200000000018
9033	\N	\N	KID	Kristianstad	55.9194450000000032	14.088889
9034	\N	\N	KUL	Kuala Lumpur International Airport (klia)	2.75567200000000012	101.705389999999994
9035	\N	\N	SZB	Sultan Abdul Aziz Shah	3.1306440000000002	101.558075000000002
9036	\N	\N	AKF	Kufrah	24.1999999999999993	23.3333319999999986
9037	\N	\N	YBB	Kugaaruk	68.8833300000000008	-89.8499999999999943
9038	\N	\N	SVP	Kuito (Silva Porto)	-12.4041669999999993	16.9566669999999995
9039	\N	\N	KUS	Kulusuk	65.5666659999999979	-37.1166699999999992
9040	\N	\N	KMS	Kumasi	6.71250000000000036	-1.59111099999999994
9041	\N	\N	UEO	Kumejima	26.365278	126.719443999999996
9042	\N	\N	KCA	Kuqa	41.1666680000000014	83.7000000000000028
9043	\N	\N	KRO	Kurgan	55.4333340000000021	65.2999999999999972
9044	\N	\N	KUH	Kushiro	43.045650000000002	144.196820000000002
9045	\N	\N	KZR	Zafer	39.1202770000000015	30.1169450000000012
9046	\N	\N	KUT	Kopitnari	42.25	42.7000000000000028
9047	\N	\N	KWA	Kwajalein	8.72084300000000034	167.721949999999993
9048	\N	\N	KYP	Kyaukpyu	19.4333320000000001	93.5333300000000065
9049	\N	\N	KYZ	Kyzyl	51.7000000000000028	94.4666699999999935
9050	\N	\N	LPB	El Alto	-16.508890000000001	-68.1769000000000034
9051	\N	\N	LRH	Laleu	46.1805570000000003	-1.18583299999999991
9052	\N	\N	EUN	Hassan I	27.1333330000000004	-13.2166669999999993
9053	\N	\N	LBS	Labasa	-16.4662149999999983	179.33766
9054	\N	\N	LBJ	Mutiara	-8.51666699999999999	119.883330000000001
9055	\N	\N	LAE	Nadzab	-6.56269399999999958	146.727569999999986
9056	\N	\N	LKB	Lakeba	-18.1999999999999993	179.199999999999989
9057	\N	\N	LAL	Municipal	27.9888900000000014	-82.0147249999999985
9058	\N	\N	LKL	Banak	70.0677799999999991	24.9736119999999993
9059	\N	\N	LMC	Lamacarena	3.31666699999999981	-73.9000000000000057
9060	\N	\N	LNB	Lamen Bay	-16.5833319999999986	168.183330000000012
9061	\N	\N	LMP	Lampedusa	35.5	12.6166669999999996
9062	\N	\N	LNY	Lanai City	20.7900850000000013	-156.950490000000002
9063	\N	\N	LEQ	Lands End	50.0499999999999972	-5.73333300000000001
9064	\N	\N	LUV	Langgur	-5.66666700000000034	132.71665999999999
9065	\N	\N	LAI	Servel	48.7541659999999979	-3.48194399999999993
9066	\N	\N	LCA	Larnaca	34.8808670000000021	33.6259900000000016
9067	\N	\N	BLD	Boulder City	35.9833339999999993	-114.833336000000003
9068	\N	\N	LZC	Lazaro Cardenas	18	-102.216669999999993
9069	\N	\N	LPY	Loudes	45.0833319999999986	3.76666699999999999
9070	\N	\N	LTQ	Le Touquet	50.5150000000000006	1.62805599999999995
9071	\N	\N	LGP	Legazpi	13.1521299999999997	123.730199999999996
9072	\N	\N	IXL	Bakula Rimpoche	34.140349999999998	77.5474600000000009
9073	\N	\N	LKN	Leknes	68.1542100000000062	13.6148640000000007
9074	\N	\N	LEC	Chapada Diamantina	-12.4800000000000004	-41.2811129999999977
9075	\N	\N	LEN	Leon	42.5905699999999996	-5.64628999999999959
9076	\N	\N	LRS	Leros	37.5166660000000007	26.7833329999999989
9077	\N	\N	KLL	Levelock	59.1186099999999968	-156.863329999999991
9078	\N	\N	LXA	Gonggar/Lhasa	29.2930500000000009	90.900509999999997
9079	\N	\N	LGG	Liege Airport	50.6433329999999984	5.46014900000000036
9080	\N	\N	LNV	Lihir Island	-3.04322299999999979	152.627199999999988
9081	\N	\N	LJG	Lijiang	26.6833320000000001	100.25
9082	\N	\N	LIL	Lesquin	50.5720499999999973	3.10606699999999991
9083	\N	\N	LMN	Limbang	4.66666700000000034	115
9084	\N	\N	LXS	Limnos	39.9239040000000003	25.2334460000000007
9085	\N	\N	HZH	Liping	26.320212999999999	109.153809999999993
9086	\N	\N	LSY	Lismore	-28.8366529999999983	153.263370000000009
9087	\N	\N	LPL	Liverpool John Lennon	53.337615999999997	-2.85490500000000003
9088	\N	\N	LOK	Lodwar	3.14999999999999991	35.6000000000000014
9089	\N	\N	LOE	Loei	17.4499999999999993	101.733329999999995
9090	\N	\N	RJL	Agoncillo	42.456944	-2.32361100000000009
9091	\N	\N	LOH	Camilo Ponce Enríquez Airport	-3.99361100000000002	-79.3736099999999993
9092	\N	\N	LCY	London City Airport	51.5	0.0500000000000000028
9093	\N	\N	LGW	Gatwick	51.1568070000000006	-0.161863000000000007
9094	\N	\N	STN	Stansted	51.8892669999999967	0.26270300000000002
9095	\N	\N	LKH	Long Akah	3.31293399999999982	114.785659999999993
9096	\N	\N	HAP	Long Island	-20.5	148.75
9097	\N	\N	LOD	Longana	-15.3166670000000007	167.96665999999999
9098	\N	\N	LCX	Liancheng	25.6755560000000003	116.745559999999998
9099	\N	\N	LDH	Lord Howe Island	-31.5408079999999984	159.078159999999997
9100	\N	\N	LTO	Loreto	25.9833339999999993	-111.349999999999994
9101	\N	\N	LAX	Los Angeles International	33.943398000000002	-118.408280000000005
9102	\N	\N	VNY	Van Nuys	34.2000000000000028	-118.5
9103	\N	\N	SDF	Louisville International (Standiford Field)	38.1863749999999982	-85.7417899999999946
9104	\N	\N	LUZ	Lushan	51.2319450000000032	22.6902769999999983
9105	\N	\N	LKO	Amausi	26.7642570000000006	80.8841859999999997
9106	\N	\N	LUG	Lugano	46.0166660000000007	8.96666699999999928
9107	\N	\N	LLA	Kallax	65.5493900000000025	22.1235870000000006
9108	\N	\N	LUN	Lusaka	-15.3250170000000008	28.4457470000000008
9109	\N	\N	LXR	Luxor	25.6749200000000002	32.6996839999999978
9110	\N	\N	LZO	Luzhou	28.8447570000000013	105.379019999999997
9111	\N	\N	LYH	Preston-glenn Field	37.3269420000000025	-79.2011099999999999
9112	\N	\N	MEA	Macae	-22.3500000000000014	-41.7999999999999972
9113	\N	\N	MCP	Internacional	0.0498950000000000018	-51.0683819999999997
9114	\N	\N	MFM	Macau International	22.1565879999999993	113.572850000000003
9115	\N	\N	MCZ	Palmares	-9.51252099999999956	-35.8004460000000009
9116	\N	\N	MJN	Amborovy	-15.6658329999999992	46.3530579999999972
9117	\N	\N	SEZ	Seychelles International Airport	-4.67127499999999962	55.5112799999999993
9118	\N	\N	MMZ	Maimana	35.9166680000000014	64.7333299999999952
9119	\N	\N	MMO	Vila Do Maio	15.25	-23.1666680000000014
9120	\N	\N	MKP	Makemo	-16.5879210000000015	-143.654359999999997
9121	\N	\N	MEG	Malange	-9.53333300000000072	16.3333319999999986
9122	\N	\N	MMX	Sturup	55.5387569999999968	13.3637270000000008
9123	\N	\N	MMH	Mammoth Lakes	37.6311099999999996	-118.851389999999995
9124	\N	\N	MHT	Manchester-boston Regional Airport	42.9278600000000026	-71.4384399999999999
9125	\N	\N	MGS	Mangaia Island	-21.9333320000000001	-157.933330000000012
9126	\N	\N	IXE	Bajpe	12.9635429999999996	74.8901440000000065
9127	\N	\N	XMH	Manihi	-14.4379500000000007	-146.070510000000013
9128	\N	\N	JSU	Heliport	65.4166639999999973	-52.8999999999999986
9129	\N	\N	MNL	Ninoy Aquino International	14.5096019999999992	121.012510000000006
9130	\N	\N	MZL	Santaguida	5.02900499999999973	-75.4687799999999953
9131	\N	\N	MKW	Rendani	-0.893055999999999961	134.052780000000013
9132	\N	\N	MNS	Mansa	-11.125	28.8666669999999996
9133	\N	\N	MAB	Maraba	-5.36666699999999963	-49.1666680000000014
9134	\N	\N	RUS	Marau Sound	-8.5	161.25
9135	\N	\N	MVY	Martha's Vineyard	41.3893360000000001	-70.6118199999999945
9136	\N	\N	MUR	Marudi	4.18333300000000019	114.316665999999998
9137	\N	\N	MBT	Masbate	12.3666669999999996	123.066665999999998
9138	\N	\N	MSW	Massawa International	15.6033329999999992	39.4411130000000014
9139	\N	\N	ZMT	Masset	54.0166660000000007	-132.150000000000006
9140	\N	\N	MRO	Masterton/Hood Aerodrome	-40.9750000000000014	175.633330000000001
9141	\N	\N	MVT	Mataiva	-14.8333329999999997	-148.416670000000011
9142	\N	\N	MOF	Waioti	-8.63333300000000037	122.25
9143	\N	\N	MES	Polonia	3.56111099999999992	98.6727750000000015
9144	\N	\N	MDE	Jose Maria Cordova	6.17138200000000037	-75.4282100000000071
9145	\N	\N	MEH	Mehamn	71.0333300000000065	27.8333319999999986
9146	\N	\N	MXZ	Meixian	24.2668110000000006	116.104489999999998
9147	\N	\N	MYU	Ellis Field	60.3727799999999988	-166.268049999999988
9148	\N	\N	AVV	Avalon	-38.02637	144.47308000000001
9149	\N	\N	MEB	Essendon	-37.7366680000000017	144.897500000000008
9150	\N	\N	MEL	Tullamarine	-37.6696129999999982	144.84978000000001
9151	\N	\N	MDU	Mendi	-6.15861099999999961	143.650000000000006
9152	\N	\N	MAH	Mahon	39.8647459999999967	4.22625600000000023
9153	\N	\N	MKQ	Mopah	-8.51666699999999999	140.5
9154	\N	\N	MID	Rejon	20.9338230000000003	-89.6637499999999932
9155	\N	\N	MEQ	Seunagan	4.15000000000000036	96.1166699999999992
9156	\N	\N	MXL	Mexicali	32.6281999999999996	-115.248215000000002
9157	\N	\N	MEX	Internacional Benito Juarez	19.4352780000000003	-99.0727799999999945
9158	\N	\N	MFU	Mfuwe	-13.266667	31.9333320000000001
9159	\N	\N	MIG	Mian Yang	31.4311100000000003	104.738050000000001
9160	\N	\N	BGY	Bergamo - Orio al Serio	45.6653140000000022	9.6987129999999997
9161	\N	\N	MXP	Milano Malpensa	45.627403000000001	8.71236999999999995
9162	\N	\N	MLT	Millinocket	45.6499999999999986	-68.7166699999999935
9163	\N	\N	MLO	Milos	36.6961099999999973	24.4750000000000014
9164	\N	\N	MRV	Mineralnye Vodyj	44.2181050000000013	43.0858149999999966
9165	\N	\N	MSP	Minneapolis - St. Paul International	44.8830150000000003	-93.2109200000000016
9166	\N	\N	MOT	International	48.2597239999999985	-101.280829999999995
9167	\N	\N	MHP	Minsk International 1	53.8500000000000014	27.5500000000000007
9168	\N	\N	MJZ	Mirnyj	62.5333329999999989	114.033330000000007
9169	\N	\N	MSJ	Misawa	40.696316000000003	141.386899999999997
9170	\N	\N	MIS	Misima Island	-10.5	152.84165999999999
9171	\N	\N	MOI	Mitiaro Island	-19.841660000000001	-157.711209999999994
9172	\N	\N	MQN	Mo I Rana	66.3646499999999975	14.3027479999999994
9173	\N	\N	MCM	Fontvieille Heliport	43.7333339999999993	7.41666700000000034
9174	\N	\N	YQM	Greater Moncton International Airport	46.104773999999999	-64.6812299999999993
9175	\N	\N	MTR	S. Jeronimo	8.82503499999999974	-75.8239200000000011
9176	\N	\N	MTY	Gen Mariano Escobedo	25.7765699999999995	-100.114395000000002
9177	\N	\N	YUL	Pierre Elliott Trudeau International	45.4577140000000028	-73.7499099999999999
9178	\N	\N	MOZ	Temae	-17.4904329999999995	-149.764139999999998
9179	\N	\N	YMO	Moosonee	51.2911100000000033	-80.6041639999999973
9180	\N	\N	MOV	Moranbah	-22.0605699999999985	148.074420000000003
9181	\N	\N	MRZ	Moree	-29.4963459999999991	149.850189999999998
9182	\N	\N	YVA	Iconi	-11.5319439999999993	43.2611119999999971
9183	\N	\N	HAH	Prince Said Ibrahim In	-11.5372749999999993	43.2749200000000016
9184	\N	\N	OTI	Pitu	2.8333330000000001	128.5
9185	\N	\N	MYA	Moruya	-35.9025099999999995	150.147169999999988
9186	\N	\N	DME	Domodedovo	55.4145660000000007	37.8994939999999971
9187	\N	\N	OSM	Mosul	36.3074999999999974	43.1494450000000001
9188	\N	\N	MTV	Mota Lava	-13.6666670000000003	167.666670000000011
9189	\N	\N	MWX	Muan International	34.9914050000000003	126.382810000000006
9190	\N	\N	DGE	Mudgee	-32.5666659999999979	149.616669999999999
9191	\N	\N	FMO	Münster Osnabrück International	52.1300540000000012	7.69492799999999999
9192	\N	\N	MPP	Mulatupo	9	-77.8666699999999992
9193	\N	\N	BOM	Chhatrapati Shivaji International (Sahar International)	19.0955089999999998	72.8749700000000047
9194	\N	\N	NBX	Nabire	-3.36666700000000008	135.433330000000012
9195	\N	\N	NAN	Nadi International	-17.7532700000000006	177.451609999999988
9196	\N	\N	NDR	Nador	34.9888880000000029	-3.02833299999999994
9197	\N	\N	NYM	Nadym	65.4833299999999952	72.7166699999999935
9198	\N	\N	NGO	Chu-Bu Centrair International (Central Japan International)	34.8583339999999993	136.80528000000001
9199	\N	\N	NAH	Naha	3.71666700000000017	125.366669999999999
9200	\N	\N	NBO	Jomo Kenyatta International	-1.31916699999999998	36.9257800000000032
9201	\N	\N	WIL	Wilson	-1.31801799999999991	36.8132480000000015
9202	\N	\N	NUU	Nakuru	-0.299999999999999989	36.1499999999999986
9203	\N	\N	MSZ	Namibe	-15.2086109999999994	12.1608330000000002
9204	\N	\N	APL	Nampula	-15.1016670000000008	39.2872240000000019
9205	\N	\N	OSY	Namsos	64.4727299999999985	11.5700020000000006
9206	\N	\N	PKA	SPB	60.710835000000003	-161.75806
9207	\N	\N	NAU	Napuka Island	-14.1666670000000003	-141.583329999999989
9208	\N	\N	NAC	Naracoorte	-36.9500000000000028	140.833329999999989
9209	\N	\N	NAA	Narrabri	-30.3182900000000011	149.829119999999989
9210	\N	\N	UAK	Narsarsuaq	61.1666680000000014	-45.3166659999999979
9211	\N	\N	NVK	Framnes	68.4249999999999972	17.4250000000000007
9212	\N	\N	ARA	Acadiana Regional	30.0377790000000005	-91.8838899999999938
9213	\N	\N	JFK	John F Kennedy International	40.6423339999999982	-73.7881699999999938
9214	\N	\N	SWF	Stewart	41.498429999999999	-74.1010399999999976
9215	\N	\N	ZNE	Newman	-23.4165169999999989	119.801370000000006
9216	\N	\N	CXR	Cam Ranh	11.9936109999999996	109.224999999999994
9217	\N	\N	GOV	Nhulunbuy	-12.2695950000000007	136.82265000000001
9218	\N	\N	IAG	International	43.1000000000000014	-78.9500000000000028
9219	\N	\N	QMK	Heliport	68.25	-52.8333319999999986
9220	\N	\N	NME	Nightmute	60.4710460000000012	-164.700839999999999
9221	\N	\N	KIJ	Niigata	37.9519919999999971	139.113249999999994
9222	\N	\N	IUE	Hanan	-19.0833319999999986	-169.933330000000012
9223	\N	\N	NJC	Nizhnevartovsk	60.9476000000000013	76.4914500000000004
9224	\N	\N	GOJ	Nizhniy Novgorod	56.2186129999999977	43.7897639999999981
9225	\N	\N	WTK	Noatak	67.563059999999993	-162.984160000000003
9226	\N	\N	NGK	Nogliki	51.7999999999999972	143.166670000000011
9227	\N	\N	NLK	Norfolk Island	-29.0425000000000004	167.939439999999991
9228	\N	\N	YNO	North Spirit Lake	52.5	-92.4166639999999973
9229	\N	\N	NTB	Notodden	59.5833319999999986	9.28333300000000072
9230	\N	\N	GEA	Magenta	-22.2605359999999983	166.470779999999991
9231	\N	\N	NLD	International Quetzalcoatl	27.4347230000000017	-99.5666659999999979
9232	\N	\N	NHV	Nuku Hiva	-8.79521399999999964	-140.222229999999996
9233	\N	\N	NCU	Nukus	42.4833339999999993	59.6333300000000008
9234	\N	\N	NUL	Nulato	64.7277760000000058	-158.076660000000004
9235	\N	\N	NYU	Nyaung-u	21.1753430000000016	94.9283199999999994
9236	\N	\N	OBO	Obihiro	42.7320020000000014	143.212430000000012
9237	\N	\N	OGD	Municipal	41.196390000000001	-112.010829999999999
9238	\N	\N	OKJ	Okayama	34.7602199999999968	133.852769999999992
9239	\N	\N	OKA	Naha	26.1958330000000004	127.645836000000003
9240	\N	\N	OKC	Will Rogers World Airport	35.395629999999997	-97.5960900000000038
9241	\N	\N	OKL	Oksibil	-5.09999999999999964	140.666670000000011
9242	\N	\N	OLH	Old Harbor SPB	57.2041660000000007	-153.300000000000011
9243	\N	\N	KOY	Olga Bay SPB	57.1622240000000019	-154.227499999999992
9244	\N	\N	OMS	Omsk	54.9574550000000031	73.3166999999999973
9245	\N	\N	VPE	Ondjiva	-17.0500000000000007	15.6999999999999993
9246	\N	\N	ONT	Ontario International	34.0606799999999978	-117.597650000000002
9247	\N	\N	KYD	Orchid Island	22.0833319999999986	121.5
9248	\N	\N	MCO	Orlando International	28.4321769999999994	-81.3083040000000068
9249	\N	\N	OSW	Orsk	51.2000000000000028	58.5666659999999979
9250	\N	\N	KIX	Kansai International	34.4353300000000004	135.24396999999999
9251	\N	\N	OIM	Oshima	34.7791670000000011	139.365000000000009
9252	\N	\N	OSR	Mosnov	49.6955200000000019	18.1212839999999993
9253	\N	\N	OFI	Ouango Fitini	9.59999999999999964	-4.03333299999999983
9254	\N	\N	OUK	Outer Skerries	60.4166680000000014	-0.75
9255	\N	\N	JFR	Frederikshab	62.0002799999999965	-49.7002799999999993
9256	\N	\N	PGA	Page	36.9263880000000029	-111.447220000000002
9257	\N	\N	PJA	Pajala	67.2466660000000047	23.0749999999999993
9258	\N	\N	PSP	Palm Springs Metropolitan Area	33.8229749999999996	-116.508446000000006
9259	\N	\N	PMW	Palmas	-10.2416669999999996	-48.3527800000000028
9260	\N	\N	PMR	Palmerston North	-40.3235320000000002	175.621260000000007
9261	\N	\N	PLW	Mutiara	-0.917945000000000011	119.906710000000004
9262	\N	\N	ECP	NW Florida Beaches Int	30.3578030000000005	-85.7989199999999954
9263	\N	\N	PRA	Parana	-31.7950000000000017	-60.4799999999999969
9264	\N	\N	PPQ	Paraparaumu	-40.8999999999999986	174.983339999999998
9265	\N	\N	ORY	Orly	48.7282829999999976	2.35970000000000013
9266	\N	\N	PAS	Paros	37.0666659999999979	25.1000000000000014
9267	\N	\N	PAT	Patna	25.5948899999999995	85.0906700000000029
9268	\N	\N	PUF	Pau-Pyrénées	43.3823470000000029	-0.413573000000000024
9269	\N	\N	PWQ	Pavlodar	52.1833340000000021	77.0666659999999979
9270	\N	\N	YPO	Peawanuck	54.9833339999999993	-85.4333340000000021
9271	\N	\N	PEX	Pechora	65.1166699999999992	57.1333300000000008
9272	\N	\N	PET	Federal	-31.7180560000000007	-52.3244439999999997
9273	\N	\N	PEI	Matecana	4.81594500000000014	-75.736534000000006
9274	\N	\N	PSR	Liberi	42.4372200000000035	14.1872220000000002
9275	\N	\N	PHL	Philadelphia International	39.8764099999999999	-75.243300000000005
9276	\N	\N	TTN	Trenton Mercer Airport	40.2780569999999969	-74.8125
9277	\N	\N	AZA	Williams Gateway	33.3077770000000015	-111.655556000000004
9278	\N	\N	PRH	Phrae	18.1499999999999986	100.133330000000001
9279	\N	\N	PDS	Piedras Negras	28.6999999999999993	-100.516670000000005
9280	\N	\N	PIR	Pierre	44.3803630000000027	-100.293189999999996
9281	\N	\N	PZB	Pietermaritzburg Oribi	-29.6430469999999993	30.3967379999999991
9282	\N	\N	PIU	Piura	-5.2016669999999996	-80.6133350000000064
9283	\N	\N	PTU	Platinum	59.0113899999999987	-161.816939999999988
9284	\N	\N	PBG	Plattsburgh International	44.7000000000000028	-73.4833299999999952
9285	\N	\N	PXU	Pleiku	14.0063460000000006	108.008960000000002
9286	\N	\N	KPO	Pohang	35.9837100000000021	129.433750000000003
9287	\N	\N	PNI	Pohnpei	6.98094699999999957	158.203339999999997
9288	\N	\N	PHO	Point Hope	68.3499999999999943	-166.800000000000011
9289	\N	\N	PIS	Biard	46.5861099999999979	0.306389000000000022
9290	\N	\N	PSE	Mercedita	18.0107019999999984	-66.5635450000000048
9291	\N	\N	PNY	Pondicherry	12.016667	79.7999999999999972
9292	\N	\N	PNK	Supadio	-0.147350000000000009	109.405330000000006
9293	\N	\N	PNP	Girua	-8.80747399999999914	148.308729999999997
9294	\N	\N	PMV	Del Caribe International (Gen. Santiago Marino)	10.9171890000000005	-63.968989999999998
9295	\N	\N	CLM	Fairchild International	48.1218829999999969	-123.495109999999997
9296	\N	\N	PUG	Port Augusta	-32.5	137.766660000000002
9297	\N	\N	PLZ	Port Elizabeth	-33.9837100000000021	25.611422000000001
9298	\N	\N	PQQ	Port Macquarie	-31.4314019999999985	152.867230000000006
9299	\N	\N	PML	AFS	56.0055539999999965	-160.558330000000012
9300	\N	\N	PZU	Port Sudan	19.5777779999999986	37.2138899999999992
9301	\N	\N	VLI	Bauerfield	-17.7018529999999998	168.319500000000005
9302	\N	\N	KPR	Port Williams SPB	58.4333340000000021	-152.583329999999989
9303	\N	\N	POA	Salgado Filho	-29.989609999999999	-51.1770899999999997
9304	\N	\N	PAZ	Tajin	20.5166660000000007	-97.4672240000000016
9305	\N	\N	POZ	Lawica	52.4143260000000026	16.8288440000000001
9306	\N	\N	PRI	Praslin Island	-4.32388300000000037	55.6923140000000032
9307	\N	\N	PVK	Aktion	38.9263880000000029	20.7658330000000007
9308	\N	\N	YPA	Glass Field	53.2166670000000011	-105.683334000000002
9309	\N	\N	SCC	Prudhoe Bay/Deadhorse	70.203636000000003	-148.460109999999986
9310	\N	\N	PYH	Puerto Ayacucho	5.59999999999999964	-67.5
9311	\N	\N	PXM	Puerto Escondido	15.8499999999999996	-97.0833360000000027
9312	\N	\N	PJM	Puerto Jimenez	8.58333299999999966	-83.3333360000000027
9313	\N	\N	PMC	Tepual	-41.4337269999999975	-73.0983099999999979
9314	\N	\N	PEM	Puerto Maldonado	-12.5833329999999997	-69.2333299999999952
9315	\N	\N	PVR	Licenciado Gustavo Díaz Ordaz International	20.6782970000000006	-105.248980000000003
9316	\N	\N	PDP	Capitan Corbeta CA Curbelo International Airport	-34.9144440000000031	-54.9191670000000016
9317	\N	\N	PGD	Charlotte County	26.9191670000000016	-81.9913899999999956
9318	\N	\N	FNJ	Sunan International	39.2000000000000028	125.666663999999997
9319	\N	\N	JQA	Qaarsut	70.7319399999999945	-52.7027780000000021
9320	\N	\N	BPX	Bangda	30.5558340000000008	97.106669999999994
9321	\N	\N	JJU	Heliport	60.7166670000000011	-46.0333329999999989
9322	\N	\N	JGO	Qeqertarsuaq	69.25	-53.5666659999999979
9323	\N	\N	YQC	Quaqtaq	61.3333319999999986	-69.6333300000000008
9324	\N	\N	UET	Quetta	30.2492659999999987	66.9490360000000067
9325	\N	\N	QRO	Ingeniero Fernando Espinoza Gutiérrez International	20.6000000000000014	-100.383330000000001
9326	\N	\N	UIH	Qui Nhon	13.7661110000000004	109.226389999999995
9327	\N	\N	ULP	Quilpie	-26.6333330000000004	144.300000000000011
9328	\N	\N	UIP	Pluguffan	47.9744450000000029	-4.17083300000000001
9329	\N	\N	KWN	Kwinhagak	59.7611119999999971	-161.833329999999989
9330	\N	\N	JUZ	Juzhou	28.9666670000000011	118.833336000000003
9331	\N	\N	RBA	Sale	34.0361369999999965	-6.7486189999999997
9332	\N	\N	RAB	Tokua	-4.33333299999999966	152.366669999999999
9333	\N	\N	RAH	Rafha	29.623463000000001	43.488785
9334	\N	\N	RYK	Sheikh Zayed International	28.3917800000000007	70.2866199999999992
9335	\N	\N	RVV	Raivavae	-25.8833330000000004	-147.650000000000006
9336	\N	\N	RAJ	Civil	22.3086739999999999	70.7823499999999939
9337	\N	\N	RJH	Rajshahi	24.4333320000000001	88.6166699999999992
9338	\N	\N	UNN	Ranong	9.8527780000000007	98.6291659999999979
9339	\N	\N	RAP	Regional	44.0375820000000004	-103.061179999999993
9340	\N	\N	RKT	Ras Al Khaimah	25.6161980000000007	55.9436949999999982
9341	\N	\N	RDV	Red Devil	61.7872240000000019	-157.346939999999989
9342	\N	\N	RDD	Redding	40.5057680000000033	-122.299909999999997
9343	\N	\N	RNL	Rennell	-11.6666670000000003	160.300000000000011
9344	\N	\N	RNS	St Jacques	48.0680660000000017	-1.72624899999999992
9345	\N	\N	REU	Reus	41.1461029999999965	1.15331899999999998
9346	\N	\N	KEF	Keflavik International	63.9977650000000011	-22.6242829999999984
9347	\N	\N	GIG	Galeao Antonio Carlos Jobim	-22.8146529999999998	-43.2465100000000007
9348	\N	\N	SDU	Santos Dumont	-22.9115409999999997	-43.1670950000000033
9349	\N	\N	RCH	Riohacha	11.5291669999999993	-72.9244460000000032
9350	\N	\N	RIS	Rishiri	45.1833340000000021	141.25
9351	\N	\N	RTB	Roatan	16.3182089999999995	-86.5272199999999998
9352	\N	\N	ROC	Greater Rochester International	43.1279749999999993	-77.6654300000000006
9353	\N	\N	RDZ	Marcillac	44.4105950000000007	2.48386599999999991
9354	\N	\N	RRG	Rodrigues Island	-19.75	63.3500000000000014
9355	\N	\N	CIA	Ciampino	41.7990649999999988	12.5909870000000002
9356	\N	\N	FCO	Leonardo Da Vinci (Fiumicino)	41.7945939999999965	12.2503460000000004
9357	\N	\N	RRS	Roros	62.5791660000000007	11.3455560000000002
9358	\N	\N	RET	Stolport	67.4833299999999952	12.0833329999999997
9359	\N	\N	RCY	Rum Cay	23.6666680000000014	-74.9666699999999935
9360	\N	\N	NDU	Rundu	-17.9499999999999993	19.7166670000000011
9361	\N	\N	RTG	Ruteng	-8.59999999999999964	120.450000000000003
9362	\N	\N	RZE	Jasionka	50.1152500000000032	22.0313300000000005
9363	\N	\N	SAB	J. Yrausquin	17.6499999999999986	-63.2166670000000011
9364	\N	\N	SNX	Sabana De Mar	19.1166669999999996	-69.4000000000000057
9365	\N	\N	SPD	Saidpur	25.7833329999999989	88.9000000000000057
9366	\N	\N	SNP	Saint Paul Island	57.1522199999999998	-170.217219999999998
9367	\N	\N	SLN	Salina	38.7908329999999992	-97.6525000000000034
9368	\N	\N	YZG	Salluit	62.2000000000000028	-75.6333300000000008
9369	\N	\N	SBY	Wicomico Regional	38.343119999999999	-75.5172649999999948
9370	\N	\N	SLC	Salt Lake City International	40.7856450000000024	-111.980675000000005
9371	\N	\N	KUF	Kurumoch	53.5078200000000024	50.1474199999999968
9372	\N	\N	SQT	China Straits Airstrip	-10.5500000000000007	150.683330000000012
9373	\N	\N	SVB	Sambava	-14.2769440000000003	50.1749999999999972
9374	\N	\N	SMI	Samos	37.6914500000000032	26.9144170000000003
9375	\N	\N	SMQ	Sampit	-3.0833330000000001	113.049999999999997
9376	\N	\N	ADZ	San Andres Island	12.5860470000000007	-81.7022099999999938
9377	\N	\N	SCI	San Cristobal	7.76666699999999999	-72.2333299999999952
9378	\N	\N	BRC	International	-41.1459660000000014	-71.1610900000000015
9379	\N	\N	SCY	San Cristobal	-0.83333299999999999	-89.4333340000000021
9380	\N	\N	CLD	Mc Clellan-Palomar Airport	33.1166699999999992	-117.266670000000005
9381	\N	\N	TQR	San Domino Island	42.1166699999999992	15.483333
9382	\N	\N	SFO	San Francisco International	37.6152149999999992	-122.389880000000005
9383	\N	\N	SIC	Sinop Airport	42.0174999999999983	35.0688900000000032
9384	\N	\N	SIG	Isla Grande	18.4588889999999992	-66.1027760000000058
9385	\N	\N	SBP	San Luis County Regional Airport	35.2391130000000032	-120.640625
9386	\N	\N	SLP	San Luis Potosi	22.2554659999999984	-100.936806000000004
9387	\N	\N	SAP	Ramon Villeda Morales International	15.4562449999999991	-87.9277950000000033
9388	\N	\N	SAL	El Salvador International	13.4451260000000001	-89.0572300000000041
9389	\N	\N	SVI	San Vicente	2.14999999999999991	-74.7666700000000048
9390	\N	\N	GMZ	La Gomera	28.0166660000000007	-17.1999999999999993
9391	\N	\N	SDG	Sanandaj	35.2514719999999997	47.0137670000000014
9392	\N	\N	SDN	Sandane	61.7666660000000007	6.21666700000000017
9393	\N	\N	NDY	Sanday	59.25	-2.5833330000000001
9394	\N	\N	GNY	Guney Anadolu Projesi	37.0941660000000013	38.8469430000000031
9395	\N	\N	SFQ	Sanliurfa	37.0852780000000024	38.8500000000000014
9396	\N	\N	SBA	Santa Barbara Metropolitan Area	34.4328349999999972	-119.836479999999995
9397	\N	\N	VVI	Viru Viru International	-17.6482330000000012	-63.1404879999999977
9398	\N	\N	IRZ	Tapuruquara	-0.380296000000000023	-64.996025000000003
9399	\N	\N	SXO	Sao Felix Do Araguaia	-11.5999999999999996	-50.6499999999999986
9400	\N	\N	SJZ	Sao Jorge Island	38.6646160000000023	-28.1684300000000007
9401	\N	\N	SNE	Preguica	16.5869450000000001	-24.2886099999999985
9402	\N	\N	CGH	Congonhas International Airport	-23.6269020000000012	-46.6595569999999995
9403	\N	\N	GRU	Aeroporto Internacional Guarulhos	-23.4256689999999992	-46.4819260000000014
9404	\N	\N	OLC	Sen. Eunice Micheles	-3.47086899999999998	-68.9585299999999961
9405	\N	\N	VCP	Viracopos (Campinas International)	-23.0098920000000007	-47.1416740000000019
9406	\N	\N	YZR	Sarnia	42.9972229999999982	-82.3111099999999993
9407	\N	\N	CIU	Chippewa County	46.5	-84.3499999999999943
9408	\N	\N	YAM	Sault Sainte Marie	46.4853019999999972	-84.4999499999999983
9409	\N	\N	SVA	Savoonga	63.6909300000000016	-170.486790000000013
9410	\N	\N	SCM	SPB	61.8463899999999995	-165.593889999999988
9411	\N	\N	BFF	Western Neb. Regional	41.8752799999999965	-103.601110000000006
9412	\N	\N	SYB	Seal Bay	58.1666680000000014	-152.5
9413	\N	\N	BFI	Boeing Field/King County International Airport	47.5371000000000024	-122.303700000000006
9414	\N	\N	LKE	Kenmore Air Harbor SPB	47.6274999999999977	-122.331665000000001
9415	\N	\N	SEA	Seattle-Tacoma International	47.4438400000000016	-122.301734999999994
9416	\N	\N	SEB	Sebha	27.0166660000000007	14.4625000000000004
9417	\N	\N	WLK	Selawik	66.6027760000000058	-159.983339999999998
9418	\N	\N	SDJ	Sendai	38.1355549999999965	140.92389
9419	\N	\N	GMP	Gimpo Airport	37.5592880000000022	126.803510000000003
9420	\N	\N	ZRI	Serui	-1.88333299999999992	136.233339999999998
9421	\N	\N	SFA	Sfax Thyna	34.7166670000000011	10.6833329999999993
9422	\N	\N	SHX	Shageluk	62.6958300000000008	-159.566669999999988
9423	\N	\N	SKK	Shaktoolik	64.3241649999999936	-161.138890000000004
9424	\N	\N	SSH	Sharm el-Sheikh International Airport	27.9793570000000003	34.3852540000000033
9425	\N	\N	SHY	Shinyanga	-3.6081850000000002	33.504486
9426	\N	\N	SHH	Shishmaref	66.2569400000000002	-166.058330000000012
9427	\N	\N	FSZ	Mount Fuji	34.7961120000000008	138.189439999999991
9428	\N	\N	SYO	Shonai	38.8094439999999992	139.790559999999999
9429	\N	\N	SHG	Shungnak	66.8897249999999985	-157.157780000000002
9430	\N	\N	SDY	Richland Municipalcipal	47.706944	-104.191940000000002
9431	\N	\N	SYM	Simao	22.7965699999999991	100.962220000000002
9432	\N	\N	SIP	Simferopol	45.0206569999999999	33.998190000000001
9433	\N	\N	SIN	Singapore Changi	1.36117299999999997	103.990204000000006
9434	\N	\N	SIT	Sitka	57.0486099999999965	-135.233339999999998
9435	\N	\N	KDU	Skardu	35.2999999999999972	75.7333299999999952
9436	\N	\N	VAS	Sivas	39.8138900000000007	36.9041670000000011
9437	\N	\N	SKU	Skiros	38.9166680000000014	24.5666679999999999
9438	\N	\N	SLQ	Sleetmute	61.7049999999999983	-157.166670000000011
9439	\N	\N	YYD	Smithers	54.8255580000000009	-127.180274999999995
9440	\N	\N	AER	Sochi/Adler International Airport	43.448839999999997	39.9411050000000003
9441	\N	\N	SOF	Sofia	42.6883430000000033	23.4144299999999994
9442	\N	\N	SOG	Haukasen	61.1581270000000004	7.13698799999999967
9443	\N	\N	CSH	Solovky	65.0294399999999939	35.7333339999999993
9444	\N	\N	XSC	International	21.5158330000000007	-71.5297240000000016
9445	\N	\N	SPU	Split	43.5365260000000021	16.2994599999999998
9446	\N	\N	STX	Henry E Rohlsen	17.701944000000001	-64.7986149999999981
9447	\N	\N	STL	Lambert-St. Louis International	38.7422800000000009	-90.365870000000001
9448	\N	\N	SXM	Princess Juliana International	18.0447220000000002	-63.114060000000002
9449	\N	\N	SMK	St Michael	63.484295000000003	-162.111819999999994
9450	\N	\N	SPG	Whitted	27.7669449999999998	-82.625275000000002
9451	\N	\N	LED	Pulkovo	59.8060839999999985	30.3082999999999991
9452	\N	\N	RVH	Rzhevka	59.9833339999999993	30.6000000000000014
9453	\N	\N	SVG	Sola	58.8821500000000029	5.62919699999999956
9454	\N	\N	RUN	Gillot	-20.8919999999999995	55.5118750000000034
9455	\N	\N	WBB	Stebbins	63.5193599999999989	-162.288729999999987
9456	\N	\N	ZSE	St Pierre dela Reunion	-21.3333319999999986	55.4833339999999993
9457	\N	\N	YSB	Sudbury	46.6229599999999991	-80.7959199999999953
9458	\N	\N	ISU	Sulaimaniyah International	35.5608000000000004	45.3147159999999971
9459	\N	\N	NTY	Pilanesberg	-26.0333329999999989	27.9166680000000014
9460	\N	\N	SUB	Juanda	-7.38386999999999993	112.777240000000006
9461	\N	\N	STV	Surat	21.1176589999999997	72.7452550000000002
9462	\N	\N	SKH	Kadmandu	28.3333319999999986	82.5083300000000008
9463	\N	\N	SUV	Nausori	-18.0458849999999984	178.559809999999999
9464	\N	\N	EVG	Sveg	62.0333329999999989	14.3499999999999996
9465	\N	\N	SVJ	Helle	68.2449799999999982	14.6677739999999996
9466	\N	\N	SYR	Syracuse Hancock International Airport	43.1139829999999975	-76.1122299999999967
9467	\N	\N	JSY	Syros Island	37.4236099999999965	24.9499999999999993
9468	\N	\N	SZZ	Goleniow	53.5935249999999996	14.8946109999999994
9469	\N	\N	TUU	Tabuk	28.3757839999999995	36.6082880000000017
9470	\N	\N	TCG	Tacheng	46.6666680000000014	83.3333360000000027
9471	\N	\N	PPT	Faa'a	-17.5596299999999985	-149.609379999999987
9472	\N	\N	TIF	Taif	21.4803640000000016	40.5526849999999968
9473	\N	\N	TPE	Taiwan Taoyuan International (Chiang Kai Shek International)	25.07639	121.223889999999997
9474	\N	\N	TTT	Taitung	22.75	121.099999999999994
9475	\N	\N	TAI	Al Janad	13.6855530000000005	44.1343460000000007
9476	\N	\N	TKX	Takaroa	-14.4577489999999997	-145.026399999999995
9477	\N	\N	TCT	Takotna	62.9927800000000033	-156.065550000000002
9478	\N	\N	TLH	Tallahassee Regional Airport	30.3957820000000005	-84.3444400000000059
9479	\N	\N	TLL	Ulemiste	59.4166219999999967	24.7987019999999987
9480	\N	\N	TMR	Aguemar	22.8147219999999997	5.45916699999999988
9481	\N	\N	PIE	St. Petersburg-Clearwater International	27.9120039999999996	-82.6951099999999997
9482	\N	\N	TJS	Tanjung Selor	2.85000000000000009	117.366669999999999
9483	\N	\N	TRK	Juwata	3.3272219999999999	117.565280000000001
9484	\N	\N	TCD	Tarapaca	-2.93333300000000019	-69.7666700000000048
9485	\N	\N	DMB	Zhambyl	42.8999999999999986	71.3666699999999992
9486	\N	\N	TRO	Taree	-31.8902719999999995	152.508960000000002
9487	\N	\N	TGV	Targovishte	42.4166680000000014	24.5
9488	\N	\N	TII	Tirinkot	32.8666699999999992	65.6333300000000008
9489	\N	\N	TJA	Tarija	-21.5541669999999996	-64.7458340000000021
9490	\N	\N	TIZ	Tari	-5.86055599999999988	142.940550000000002
9491	\N	\N	TAY	Tartu	58.3333319999999986	26.7333339999999993
9492	\N	\N	XEQ	Harbour	60.2666660000000007	-44.6333300000000008
9493	\N	\N	TUO	Taupo	-38.7414320000000032	176.082349999999991
9494	\N	\N	IKA	Imam Khomeini Airport	35.4086300000000023	51.1548000000000016
9495	\N	\N	TRG	Tauranga	-37.6709299999999985	176.197720000000004
9496	\N	\N	TEQ	Corlu	40.9666670000000011	27.5
9497	\N	\N	TLA	Teller	65.2716700000000003	-166.35499999999999
9498	\N	\N	ZCO	Maquehue	-38.7703550000000021	-72.638450000000006
9499	\N	\N	TFS	Sur Reina Sofia	28.0444430000000011	-16.5725000000000016
9500	\N	\N	TPQ	Tepic	21.5	-104.900000000000006
9501	\N	\N	THE	Senador Petrônio Portella	-5.0633499999999998	-42.8210869999999986
9502	\N	\N	TMJ	Termez	37.2805019999999985	67.3189540000000051
9503	\N	\N	TTE	Babullah	0.800000000000000044	127.400000000000006
9504	\N	\N	SNW	Thandwe	18.4538760000000011	94.3003800000000041
9505	\N	\N	TBI	New Bright	24.3150000000000013	-75.4536099999999976
9506	\N	\N	YQD	Clearwater	53.9666670000000011	-101.099999999999994
9507	\N	\N	TVF	Regional	48.0661130000000014	-96.1850000000000023
9508	\N	\N	TRV	Thiruvananthapuram International	8.47612600000000072	76.9190700000000049
9509	\N	\N	YTH	Thompson	55.7975300000000018	-97.8605000000000018
9510	\N	\N	KTB	Thorne Bay	55.6883300000000006	-132.534999999999997
9511	\N	\N	IKS	Tiksi	71.7000000000000028	128.900000000000006
9512	\N	\N	YTS	Timmins	48.5663720000000012	-81.3716399999999993
9513	\N	\N	TIN	Tindouf	27.7166670000000011	-8.16666700000000034
9514	\N	\N	TOD	Tioman	2.75	104.166663999999997
9515	\N	\N	TRE	Tiree	56.5005570000000006	-6.87138899999999975
9516	\N	\N	TIV	Tivat	42.4036100000000005	18.7255549999999999
9517	\N	\N	TLM	Zenata	35.0166660000000007	-1.44999999999999996
9518	\N	\N	TMM	Tamatave	-18.1099999999999994	49.3922230000000013
9519	\N	\N	TOB	Tobruk	31.8541680000000014	23.9172210000000014
9520	\N	\N	TOG	Togiak Village	59.0566669999999974	-160.38221999999999
9521	\N	\N	HND	Haneda Airport	35.5490700000000004	139.78452999999999
9522	\N	\N	NRT	Narita International Airport	35.7732120000000009	140.387439999999998
9523	\N	\N	FTU	Marillac	-25.0380549999999999	46.9555549999999968
9524	\N	\N	TLE	Tulear	-23.389723	43.7241670000000013
9525	\N	\N	FOE	Forbes Field	38.9525000000000006	-95.6624999999999943
9526	\N	\N	YTZ	Toronto City Centre Airport	43.6320229999999967	-79.3958499999999958
9527	\N	\N	TTJ	Tottori	35.5259130000000027	134.167560000000009
9528	\N	\N	TLN	Le Palyvestre	43.0934900000000027	6.15930300000000042
9529	\N	\N	TOY	Toyama	36.6424499999999966	137.189449999999994
9530	\N	\N	TOE	Tozeur	33.9166680000000014	8.13333300000000037
9531	\N	\N	TST	Trang	7.5	99.6166699999999992
9532	\N	\N	TPS	Birgi	37.9013860000000022	12.4958650000000002
9533	\N	\N	TCB	Treasure Cay	26.7349999999999994	-77.3722199999999987
9534	\N	\N	TRD	Værnes	63.4542849999999987	10.9178630000000005
9535	\N	\N	TUR	Tucurui	-3.70000000000000018	-49.7333339999999993
9536	\N	\N	TFI	Tufi	-9.05000000000000071	149.333329999999989
9537	\N	\N	ZFN	Tulita	64.9166639999999973	-125.566665999999998
9538	\N	\N	TLT	Tuluksak	61.0988899999999973	-160.96472
9539	\N	\N	TCO	La Florida	1.81666700000000003	-78.7666700000000048
9540	\N	\N	TBP	Tumbes	-3.56666699999999981	-80.4166639999999973
9541	\N	\N	TUN	Carthage	36.8476220000000012	10.2170900000000007
9542	\N	\N	TNK	Tununak	60.5708300000000008	-165.266660000000002
9543	\N	\N	TUI	Turaif	31.6887299999999996	38.7338299999999975
9544	\N	\N	TKU	Turku	60.5127939999999995	22.2809799999999996
9545	\N	\N	UDR	Dabok	24.6191899999999997	73.8912660000000017
9546	\N	\N	UCT	Ukhta	63.5666659999999979	53.7999999999999972
9547	\N	\N	UUD	Ulan-ude, Baykal	51.8333319999999986	107.5
9548	\N	\N	USN	Ulsan	35.593670000000003	129.355970000000013
9549	\N	\N	YHI	Holman	70.7166699999999935	-117.716669999999993
9550	\N	\N	ULV	Baratayevka	54.2683329999999984	48.226664999999997
9551	\N	\N	UME	Umea	63.7933299999999974	20.2895399999999988
9552	\N	\N	YUD	Umiujaq	56.5361100000000008	-76.518330000000006
9553	\N	\N	JUV	Heliport	72.7852800000000002	-56.1508329999999987
9554	\N	\N	URJ	Uraj	60.1166699999999992	64.8333360000000027
9555	\N	\N	URA	Uralsk / Podstepnyy	51.1537099999999967	51.5385630000000035
9556	\N	\N	USK	Usinsk	65.9500000000000028	57.3999999999999986
9557	\N	\N	UKK	Ust-kamenogorsk	50.0257229999999993	82.5056000000000012
9558	\N	\N	USH	Islas Malvinas Argentinas International	-54.8393480000000011	-68.3124499999999983
9559	\N	\N	UTP	Utapao	12.6833329999999993	101.016670000000005
9560	\N	\N	UII	Utila	16.0916670000000011	-86.8875000000000028
9561	\N	\N	QUO	Akwa Ibom International	4.87646300000000021	8.08569299999999913
9562	\N	\N	VAA	Vaasa	63.0435500000000033	21.7601219999999991
9563	\N	\N	BDQ	Vadodara	22.3290770000000016	73.2156999999999982
9564	\N	\N	VDS	Vadso	70.0649999999999977	29.8452780000000004
9565	\N	\N	ZAL	Pichoy	-39.7916680000000014	-73.2394400000000019
9566	\N	\N	VLD	Regional	30.7838899999999995	-83.2772199999999998
9567	\N	\N	VLC	Valencia	39.4917900000000017	-0.473474999999999979
9568	\N	\N	VLN	Arturo Michelena International Airport	10.1542899999999996	-67.9224799999999931
9569	\N	\N	VLV	Carvajal	9.33916699999999977	-70.5858300000000014
9570	\N	\N	VLS	Valesdir	-16.8000000000000007	168.199999999999989
9571	\N	\N	VAN	Ferit Melen Airport	38.4586100000000002	43.3322220000000016
9572	\N	\N	CXH	Coal Harbour	49.2666660000000007	-123.116669999999999
9573	\N	\N	VAW	Vardoe	70.3547200000000004	31.0455550000000002
9574	\N	\N	VAR	Varna	43.2372599999999991	27.8290959999999998
9575	\N	\N	VUS	Velikij Ustyug	60.7666660000000007	46.3166659999999979
9576	\N	\N	VEE	Venetie	67.0230559999999969	-146.411120000000011
9577	\N	\N	TSF	S. Angelo	45.6551130000000001	12.2044440000000005
9578	\N	\N	VEL	Vernal	40.4388900000000007	-109.510279999999995
9579	\N	\N	VRN	Valerio Catullo	45.4023299999999992	10.9067959999999999
9580	\N	\N	YWH	Victoria Inner Harbor	48.4166680000000014	-123.366669999999999
9581	\N	\N	VFA	Victoria Falls	-18.0930560000000007	25.8402789999999989
9582	\N	\N	VDM	Viedma	-40.8500000000000014	-63.0166660000000007
9583	\N	\N	VTE	Wattay	17.9754310000000004	102.567719999999994
9584	\N	\N	VQS	Vieques	18.1340889999999995	-65.4880299999999949
9585	\N	\N	BVH	Vilhena	-12.7166669999999993	-60.1166699999999992
9586	\N	\N	VLG	Villa Gesell	-38.0166660000000007	-57.5833319999999986
9587	\N	\N	VSA	Capitan Carlos Rovirosa	17.9924299999999988	-92.8189849999999979
9588	\N	\N	VII	Vinh City	18.6999999999999993	105.633330000000001
9589	\N	\N	VRC	Virac	13.5833329999999997	124.200000000000003
9590	\N	\N	VBY	Visby	57.6604460000000003	18.3381539999999994
9591	\N	\N	VDC	Vitoria Da Conquista	-14.8833330000000004	-40.8666699999999992
9592	\N	\N	VIT	Vitoria	42.8333319999999986	-2.5
9593	\N	\N	ACT	Municipal	31.6091329999999999	-97.2232099999999946
9594	\N	\N	YWK	Wabush	52.9263150000000024	-66.8739999999999952
9595	\N	\N	AIN	Wainwright	70.6333300000000008	-160.03334000000001
9596	\N	\N	NTQ	Noto Airport	37.2946779999999976	136.956799999999987
9597	\N	\N	WJR	Wajir	1.76666699999999999	40.6000000000000014
9598	\N	\N	WKJ	Hokkaido	45.3994300000000024	141.79740000000001
9599	\N	\N	WVB	Rooikop	-22.9786110000000008	14.5172220000000003
9600	\N	\N	WMX	Wamena	-4.11666699999999963	138.933330000000012
9601	\N	\N	WXN	Wanxian	30.7996790000000011	108.426950000000005
9602	\N	\N	DCA	Ronald Reagan Washington National Airport	38.8534360000000021	-77.0434599999999961
9603	\N	\N	YWP	Webequie	52.9597199999999972	-87.3688899999999933
9604	\N	\N	EJH	Wedjh	26.2077160000000013	36.474809999999998
9605	\N	\N	WEH	Weihai	37.1881399999999971	122.236069999999998
9606	\N	\N	YNC	Wemindji	53	-78.8166659999999979
9607	\N	\N	HPN	Westchester County Apt	41.0686719999999994	-73.7038900000000012
9608	\N	\N	WWK	Boram	-3.58003399999999994	143.669160000000005
9609	\N	\N	YLE	Wha Ti	63.1499999999999986	-117.266670000000005
9610	\N	\N	WWP	Whale Pass	56.6666680000000014	-133.833329999999989
9611	\N	\N	ISN	Sloulin Field International	48.1761100000000013	-103.636110000000002
9612	\N	\N	ILM	Wilmington International	34.2670499999999976	-77.9106299999999976
9613	\N	\N	ERS	Eros	-22.6166669999999996	17.0833319999999986
9614	\N	\N	WNR	Windorah	-25.4166680000000014	142.666670000000011
9615	\N	\N	WIN	Winton	-22.3500000000000014	143.066669999999988
9616	\N	\N	WUX	Wuxi	31.4928899999999992	120.424379999999999
9617	\N	\N	NLT	Nalati	43.4322200000000009	83.3822250000000054
9618	\N	\N	XUZ	Xuzhou	34.0529250000000019	117.554079999999999
9619	\N	\N	YAK	Yakutat	59.5091669999999979	-139.659729999999996
9620	\N	\N	GAJ	Junmachi	38.4106450000000024	140.365829999999988
9621	\N	\N	YAP	Yap International	9.49771499999999946	138.086729999999989
9622	\N	\N	IAR	Yaroslavl	57.6166699999999992	39.8833300000000008
9623	\N	\N	SVX	Koltsovo International	56.7503359999999972	60.804313999999998
9624	\N	\N	YBP	Yibin	28.7976589999999995	104.543949999999995
9625	\N	\N	YIW	Yiwu	29.3445630000000008	120.028809999999993
9626	\N	\N	YIN	Yining	43.9519999999999982	81.3314400000000006
9627	\N	\N	LLF	LingLing	26.3455559999999984	111.612219999999994
9628	\N	\N	UYN	Yulin	38.2741550000000004	109.730379999999997
9629	\N	\N	YCU	Yun Cheng	35.0180000000000007	110.992999999999995
9630	\N	\N	UUS	Yuzhno-Sakhalinsk	46.9666670000000011	142.75
9631	\N	\N	ZAD	Zadar	44.0977800000000002	15.3566669999999998
9632	\N	\N	ZAG	Pleso	45.7332419999999971	16.0615200000000016
9633	\N	\N	ZTH	Zakinthos International Airport	37.7558330000000026	20.8883319999999983
9634	\N	\N	DYG	Dayong	29.1071199999999983	110.445689999999999
9635	\N	\N	ZAT	Zhaotong	27.3166679999999999	103.799999999999997
9636	\N	\N	OUZ	Zouerate	22.7333339999999993	-12.3499999999999996
9637	\N	\N	ANS	Andahuaylas	-13.7166669999999993	-73.355834999999999
9638	\N	\N	PVD	T. F. Green Airport	41.726309999999998	-71.4363199999999949
9639	\N	\N	SXF	Berlin-Schoenefeld	52.3702770000000015	13.521388
9640	\N	\N	SYJ	Sirjan	29.5501229999999993	55.6649170000000026
9641	\N	\N	SZA	Soyo	-6.03333299999999983	12.4166670000000003
9642	\N	\N	TBZ	Tabriz	38.1228499999999997	46.2442739999999972
9643	\N	\N	TCQ	Tacna	-18.0633340000000011	-70.2788900000000041
9644	\N	\N	VXC	Lichinga	-13.2833330000000007	35.25
9645	\N	\N	YNB	Yanbu	24.1407339999999984	38.0630200000000016
9646	\N	\N	YOG	Ogoki	51.6666680000000014	-85.9166639999999973
9647	\N	\N	YOL	Yola	9.26611100000000043	12.4322219999999994
9648	\N	\N	YUM	International	32.6686059999999969	-114.599266
9649	\N	\N	YWJ	Deline	65.1666639999999973	-123.5
9650	\N	\N	YXT	Terrace	54.4655569999999969	-128.574450000000013
9651	\N	\N	ZAH	Zahedan	29.4757560000000005	60.9003299999999967
9652	\N	\N	ZBR	Chah- Bahar	25.436478000000001	60.379562
9653	\N	\N	ZFM	Fort Mcpherson	67.4777760000000058	-134.952769999999987
9654	\N	\N	ZTA	Tureira	-20.8166679999999999	-138.5
9655	\N	\N	ZYI	Zunyi	27.6666680000000014	106.833336000000003
9656	\N	\N	NBS	Changbaishan	42.0833319999999986	127.599999999999994
9657	\N	\N	JTC	Arealva	-22.1659579999999998	-49.0722900000000024
9658	\N	\N	VDH	Dong Hoi	17.5150000000000006	106.590549999999993
9659	\N	\N	JJA	Jajao	-8.21665999999999919	159.266660000000002
9660	\N	\N	LLK	Lankaran	38.7420299999999997	48.8240929999999977
9661	\N	\N	QOW	Sam Mbakwe International	5.42786599999999986	7.20167599999999997
9662	\N	\N	JIQ	Wulingshan	29.517557	108.829184999999995
9663	\N	\N	XIY	Xianyang	34.4411539999999974	108.756050000000002
\.


--
-- Name: airports_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('airports_id_seq', 9663, true);


--
-- Data for Name: bucket_lists; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY bucket_lists (id, title, email) FROM stdin;
1	Europe Bucket List	meals012@yahoo.com
2	My Bucket List	lrgraham14@gmail.com
4	Europe Bucket List	lrgraham14@gmail.com
19	My Bucket	meals012@yahoo.com
20	Australia	meals012@yahoo.com
24	My Bucket List	monkeyloverxo13@aim.com
25	My Bucket List	meals012@yahoo.com
26	Hackbright	meals012@yahoo.com
\.


--
-- Name: bucket_lists_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('bucket_lists_id_seq', 26, true);


--
-- Data for Name: cities; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY cities (id, country_id, name, code) FROM stdin;
1	\N	State College	SCE
2	\N	Arrabury	AAB
3	\N	El Arish	AAC
4	\N	Annaba	AAE
5	\N	Apalachicola	AAF
6	\N	Arapoti	AAG
7	\N	Aachen	AAH
8	\N	Arraias	AAI
9	\N	Awaradam	AAJ
10	\N	Aranuka	AAK
11	\N	Aalborg	AAL
12	\N	Mala Mala	AAM
13	\N	Al Ain	AAN
14	\N	Anaco	AAO
15	\N	Anapa	AAQ
16	\N	Aarhus	AAR
17	\N	Apalapsili	AAS
18	\N	Altay	AAT
19	\N	Asau	AAU
20	\N	Surallah	AAV
21	\N	Adrar	AZR
22	\N	Araracuara	ACR
23	\N	Argyle	GYL
24	\N	Chiang Mai	CNX
25	\N	Johor Bahru	JHB
26	\N	Abbottabad	AAW
27	\N	Araxa	AAX
28	\N	Quetzaltenango	AAZ
29	\N	Abakan	ABA
30	\N	Albacete	ABC
31	\N	Abadan	ABD
32	\N	Allentown	ABE
33	\N	Abaiang	ABF
34	\N	Abingdon	ABG
35	\N	Alpha	ABH
36	\N	Abidjan	ABJ
37	\N	Kabri Dar	ABK
38	\N	Bamaga	ABM
39	\N	Albina	ABN
40	\N	Aboisso	ABO
41	\N	Atkamba	ABP
42	\N	Albuquerque	ABQ
43	\N	Aberdeen	ABR
44	\N	Abu Simbel	ABS
45	\N	Abuja	ABV
46	\N	Abau	ABW
47	\N	Albury	ABX
48	\N	Albany	ABY
49	\N	Aberdeen	ABZ
50	\N	Bellaire	ACB
51	\N	Accra	ACC
52	\N	Acandi	ACD
53	\N	Anuradhapura	ACJ
54	\N	Aguaclara	ACL
55	\N	Arica	ACM
56	\N	Acuna	ACN
57	\N	Sahand	ACP
58	\N	Achinsk	ACS
59	\N	Waco	ACT
60	\N	Achutupo	ACU
61	\N	Zabol	ACZ
62	\N	Adana	ADA
63	\N	Andakombe	ADC
64	\N	Addis Ababa	ADD
65	\N	Aden	ADE
66	\N	Adrian	ADG
67	\N	Aldan	ADH
68	\N	Arandis	ADI
69	\N	Adelaide	ADL
70	\N	Andes	ADN
71	\N	Andamooka	ADO
72	\N	Kodiak	ADQ
73	\N	Andrews	ADR
74	\N	Ada	ADT
75	\N	Ardabil	ADU
76	\N	Camp Springs	ADW
77	\N	St Andrews	ADX
78	\N	Alldays	ADY
79	\N	Abemama Atoll	AEA
80	\N	Aleneva	AED
81	\N	Algeciras	AEI
82	\N	Aseki	AEK
83	\N	Albert Lea	AEL
84	\N	Aioun El Atrouss	AEO
85	\N	Sochi	AER
86	\N	Aalesund	AES
87	\N	Abu Musa	AEU
88	\N	Alexandria	AEX
89	\N	Akureyri	AEY
90	\N	San Rafael	AFA
91	\N	Port Alfred	AFD
92	\N	Amalfi	AFI
93	\N	Alta Floresta	AFL
94	\N	Jaffrey	AFN
95	\N	Afton	AFO
96	\N	Afore	AFR
97	\N	Afutara	AFT
98	\N	Afyon	AFY
99	\N	Agadir	AGA
100	\N	Anggi	AGD
101	\N	Wangerooge	AGE
102	\N	Agen	AGF
103	\N	Angoram	AGG
104	\N	Angelholm	AGH
105	\N	Wageningen	AGI
106	\N	Aguni	AGJ
107	\N	Kagua	AGK
108	\N	Wanigela	AGL
109	\N	Tasiilaq	AGM
110	\N	Angoon	AGN
111	\N	Magnolia	AGO
112	\N	Malaga	AGP
113	\N	Agrinion	AGQ
114	\N	Agra	AGR
115	\N	Aguascalientes	AGU
116	\N	Acarigua	AGV
117	\N	Agnew	AGW
118	\N	Aggeneys	AGZ
119	\N	Abha	AHB
120	\N	Herlong	AHC
121	\N	Arapahoe	AHF
122	\N	Amery	AHH
123	\N	Amahai	AHI
124	\N	Aishalton	AHL
125	\N	Athens	AHN
126	\N	Ahuas	AHS
127	\N	Amchitka	AHT
128	\N	Ambatolahy	AHY
129	\N	Alpe D Huez	AHZ
130	\N	Anita Bay	AIB
131	\N	Airok	AIC
132	\N	Anderson	AID
133	\N	Aiome	AIE
134	\N	Assis	AIF
135	\N	Yalinga	AIG
136	\N	Aiambak	AIH
137	\N	Alisabieh	AII
138	\N	Aiken	AIK
139	\N	Ailigandi	AIL
140	\N	Ailuk Island	AIM
141	\N	Atlantic	AIO
142	\N	Ailinglapalap Island	AIP
143	\N	Aripuana	AIR
144	\N	Arorae Island	AIS
145	\N	Aitutaki	AIT
146	\N	Atiu Island	AIU
147	\N	Aliceville	AIV
148	\N	Ai-ais	AIW
149	\N	Kaiser	AIZ
150	\N	Sakaka Al Jouf	AJF
151	\N	Agri	AJI
152	\N	Akjoujt	AJJ
153	\N	Araak	AJK
154	\N	Anjouan	AJN
155	\N	Arvidsjaur	AJR
156	\N	Abreojos	AJS
157	\N	Aracaju	AJU
158	\N	Agades	AJY
159	\N	Ankang	AKA
160	\N	Atka	AKB
161	\N	Akola	AKD
162	\N	Akieni	AKE
163	\N	Anguganak	AKG
164	\N	Al Kharj	AKH
165	\N	Akiak	AKI
166	\N	Asahikawa	AKJ
167	\N	Akhiok	AKK
168	\N	Zakouma	AKM
169	\N	Akron	AKO
170	\N	Astraksetra	AKQ
171	\N	Akure	AKR
172	\N	Akrotiri	AKT
173	\N	Aksu	AKU
174	\N	Aghajari	AKW
175	\N	Aktyubinsk	AKX
176	\N	Sittwe	AKY
177	\N	Almaty	ALA
178	\N	Alicante	ALC
179	\N	Alerta	ALD
180	\N	Alpine	ALE
181	\N	Alta	ALF
182	\N	Algiers	ALG
183	\N	Alice	ALI
184	\N	Alexander Bay	ALJ
185	\N	Asela	ALK
186	\N	Albenga	ALL
187	\N	Alamogordo	ALM
188	\N	Alton	ALN
189	\N	Waterloo	ALO
190	\N	Aleppo	ALP
191	\N	Alegrete	ALQ
192	\N	Alexandra	ALR
193	\N	Alamosa	ALS
194	\N	Alenquer	ALT
195	\N	Alula	ALU
196	\N	Walla Walla	ALW
197	\N	Alexander City	ALX
198	\N	Alexandria	ALY
199	\N	Amarillo	AMA
200	\N	Ambilobe	AMB
201	\N	Am Timan	AMC
202	\N	Ahmedabad	AMD
203	\N	Alto Molocue	AME
204	\N	Ama	AMF
205	\N	Amboin	AMG
206	\N	Arba Mintch	AMH
207	\N	Almenara	AMJ
208	\N	Puerto Armuellas	AML
209	\N	Amman	AMM
210	\N	Alma	AMN
211	\N	Mao	AMO
212	\N	Ampanihy	AMP
213	\N	Ambon	AMQ
214	\N	Arno	AMR
215	\N	Amsterdam	AMS
216	\N	Amata	AMT
217	\N	Amanab	AMU
218	\N	Amderma	AMV
219	\N	Ames	AMW
220	\N	Ammaroo	AMX
221	\N	Ardmore	AMZ
222	\N	Anaheim	ANA
223	\N	Anniston	ANB
224	\N	Anderson	AND
225	\N	Angouleme	ANG
226	\N	Anuha Island Resort	ANH
227	\N	Aniak	ANI
228	\N	Zanaga	ANJ
229	\N	Andulo	ANL
230	\N	Antalaha	ANM
231	\N	Annette Island	ANN
232	\N	Angoche	ANO
233	\N	Annapolis	ANP
234	\N	Angola	ANQ
235	\N	St Anton	ANT
236	\N	Anvik	ANV
237	\N	Ainsworth	ANW
238	\N	Andenes	ANX
239	\N	Anthony	ANY
240	\N	Angus Downs	ANZ
241	\N	Aroa	AOA
242	\N	Annanberg	AOB
243	\N	Altenburg	AOC
244	\N	Abou Deia	AOD
245	\N	Anshan	AOG
246	\N	Lima	AOH
247	\N	Ancona	AOI
248	\N	Aomori	AOJ
249	\N	Paso De Los Libres	AOL
250	\N	Arona	AON
251	\N	Martinsburg	AOO
252	\N	Alor Setar	AOR
253	\N	Aosta	AOT
254	\N	Attopeu	AOU
255	\N	Apolo	APB
256	\N	Napa	APC
257	\N	San Juan Aposento	APE
258	\N	Bowling Green	APH
259	\N	Apiay	API
260	\N	Apataki	APK
261	\N	Apartado	APO
262	\N	Asapa	APP
263	\N	Arapiraca	APQ
264	\N	April River	APR
265	\N	Anapolis	APS
266	\N	Jasper	APT
267	\N	Apucarana	APU
268	\N	Apple Valley	APV
269	\N	Apia	APW
270	\N	Arapongas	APX
271	\N	Alto Parnaiba	APY
272	\N	Zapala	APZ
273	\N	Araraquara	AQA
274	\N	Quiche	AQB
275	\N	Anqing	AQG
276	\N	Aqaba	AQJ
277	\N	Ariquemes	AQM
278	\N	Arequipa	AQP
279	\N	Saqani	AQS
280	\N	Alyeska	AQY
281	\N	New Iberia	ARA
282	\N	Alor Island	ARD
283	\N	Arecibo	ARE
284	\N	Acaricuara	ARF
285	\N	Walnut Ridge	ARG
286	\N	Arica	ARI
287	\N	Arso	ARJ
288	\N	Arusha	ARK
289	\N	Arly	ARL
290	\N	Armidale	ARM
291	\N	Arboletas	ARO
292	\N	Aragip	ARP
293	\N	Arauquita	ARQ
294	\N	Alto Rio Senguerr	ARR
295	\N	Aragarcas	ARS
296	\N	Minocqua	ARV
297	\N	Arad	ARW
298	\N	Neptune	ARX
299	\N	Ararat	ARY
300	\N	Assab	ASA
301	\N	Ashgabat	ASB
302	\N	Ascension	ASC
303	\N	Andros Town	ASD
304	\N	Aspen	ASE
305	\N	Astrakhan	ASF
306	\N	Ashburton	ASG
307	\N	Nashua	ASH
308	\N	Georgetown	ASI
309	\N	Amami	ASJ
310	\N	Yamoussoukro	ASK
311	\N	Marshall	ASL
312	\N	Talladega	ASN
313	\N	Asosa	ASO
314	\N	Austin	ASQ
315	\N	Kayseri	ASR
316	\N	Astoria	AST
317	\N	Asuncion	ASU
318	\N	Aswan	ASW
319	\N	Ashland	ASX
320	\N	Ashley	ASY
321	\N	Asirim	ASZ
322	\N	Anta	ATA
323	\N	Atbara	ATB
324	\N	Atoifi	ATD
325	\N	Antlers	ATE
326	\N	Ambato	ATF
327	\N	Attock	ATG
328	\N	Artigas	ATI
329	\N	Antsirabe	ATJ
330	\N	Atqasuk	ATK
331	\N	Namatanai	ATN
332	\N	Athens	ATO
333	\N	Aitape	ATP
334	\N	Amritsar	ATQ
335	\N	Atar	ATR
336	\N	Artesia	ATS
337	\N	Attu Island	ATU
338	\N	Ati	ATV
339	\N	Appleton	ATW
340	\N	Atbasar	ATX
341	\N	Assiut	ATZ
342	\N	Aruba	AUA
343	\N	Itauba	AUB
344	\N	Arauca	AUC
345	\N	Augustus Downs	AUD
346	\N	Abu Rudeis	AUE
347	\N	Auxerre	AUF
348	\N	Abu Dhabi	AUH
349	\N	Aua Island	AUI
350	\N	Ambunti	AUJ
351	\N	Aur Island	AUL
352	\N	Austin	AUM
353	\N	Auburn	AUN
354	\N	Auburn	AUO
355	\N	Agaun	AUP
356	\N	Atuona	AUQ
357	\N	Aurillac	AUR
358	\N	Atauro	AUT
359	\N	Aumo	AUV
360	\N	Aneityum	AUY
361	\N	Aurora	AUZ
362	\N	Auvergne	AVG
363	\N	Ciego De Avila	AVI
364	\N	Arvaikheer	AVK
365	\N	Fletcher	AVL
366	\N	Avignon	AVN
367	\N	Avon Park	AVO
368	\N	Wilkes-Barre	AVP
369	\N	Avu Avu	AVU
370	\N	Avalon	AVX
371	\N	Awassa	AWA
372	\N	Awaba	AWB
373	\N	Aniwa	AWD
374	\N	Alowe	AWE
375	\N	Wake Island	AWK
376	\N	West Memphis	AWM
377	\N	Alton Downs	AWN
378	\N	Austral Downs	AWP
379	\N	Awar	AWR
380	\N	Ahwaz	AWZ
381	\N	Anguilla	AXA
382	\N	Alexandria Bay	AXB
383	\N	Aramac	AXC
384	\N	Alexandroupolis	AXD
385	\N	Xanxere	AXE
386	\N	Algona	AXG
387	\N	Ataq	AXK
388	\N	Alexandria	AXL
389	\N	Armenia	AXM
390	\N	Alexandria	AXN
391	\N	Axum	AXU
392	\N	Wapakoneta	AXV
393	\N	Angel Fire	AXX
394	\N	Ayapel	AYA
395	\N	Ayacucho	AYC
396	\N	Alroy Downs	AYD
397	\N	Fort Devens	AYE
398	\N	Yaguara	AYG
399	\N	Yari	AYI
400	\N	Arkalyk	AYK
401	\N	Anthony Lagoon	AYL
402	\N	Anyang	AYN
403	\N	Ayolas	AYO
404	\N	Ayacucho	AYP
405	\N	Ayers Rock	AYQ
406	\N	Ayr	AYR
407	\N	Waycross	AYS
408	\N	Antalya	AYT
409	\N	Aiyura	AYU
410	\N	Ayawasi	AYW
411	\N	Amityville	AYZ
412	\N	Amazon Bay	AZB
413	\N	Yazd	AZD
414	\N	Apatzingan	AZG
415	\N	Andizhan	AZN
416	\N	Kalamazoo	AZO
417	\N	El Catey	AZS
418	\N	Zapatoca	AZT
419	\N	Ambriz	AZZ
420	\N	Bialla	BAA
421	\N	Barranca De Upia	BAC
422	\N	Barcelonnette	BAE
423	\N	Westfield	BAF
424	\N	Baguio	BAG
425	\N	Manama	BAH
426	\N	Buenos Aires	BAI
427	\N	Bali	BAJ
428	\N	Baku	BAK
429	\N	Batman	BAL
430	\N	Battle Mountain	BAM
431	\N	Basongo	BAN
432	\N	Ban Mak Khaen	BAO
433	\N	Baibara	BAP
434	\N	Baker Island	BAR
435	\N	Balalae	BAS
436	\N	Barretos	BAT
437	\N	Baotou	BAV
438	\N	Biawonque	BAW
439	\N	Barnaul	BAX
440	\N	Baia Mare	BAY
441	\N	Barbelos	BAZ
442	\N	Benson	BBB
443	\N	Bay City	BBC
444	\N	Brady	BBD
445	\N	Burlington	BBF
446	\N	Butaritari	BBG
447	\N	Barth	BBH
448	\N	Bitburg	BBJ
449	\N	Kasane	BBK
450	\N	Battambang	BBM
451	\N	Berbera	BBO
452	\N	Bembridge	BBP
453	\N	Barbuda	BBQ
454	\N	Basse Terre	BBR
455	\N	Yateley	BBS
456	\N	Berberati	BBT
457	\N	Bereby	BBV
458	\N	Broken Bow	BBW
459	\N	Blue Bell	BBX
460	\N	Bambari	BBY
461	\N	Zambezi	BBZ
462	\N	Baracoa	BCA
463	\N	Blacksburg	BCB
464	\N	Bear Creek	BCC
465	\N	Bacolod	BCD
466	\N	Bryce	BCE
467	\N	Bouca	BCF
468	\N	Bemichi	BCG
469	\N	Baucau	BCH
470	\N	Baca Grande	BCJ
471	\N	Bolwarra	BCK
472	\N	Barra Colorado	BCL
473	\N	Barcelona	BCN
474	\N	Jinka	BCO
475	\N	Bambu	BCP
476	\N	Brack	BCQ
477	\N	Boca Do Acre	BCR
478	\N	Belle Chasse	BCS
479	\N	Boca Raton	BCT
480	\N	Bauchi	BCU
481	\N	Belmopan	BCV
482	\N	Benguera Island	BCW
483	\N	Beloreck	BCX
484	\N	Bulchi	BCY
485	\N	Bickerton Island	BCZ
486	\N	St. George	BDA
487	\N	Bundaberg	BDB
488	\N	Barra Do Corda	BDC
489	\N	Badu Island	BDD
490	\N	Baudette	BDE
491	\N	Bradford	BDF
492	\N	Blanding	BDG
493	\N	Bird Island	BDI
494	\N	Bondoukou	BDK
495	\N	Windsor Locks	BDL
496	\N	Bandirma	BDM
497	\N	Badin	BDN
498	\N	Bandung	BDO
499	\N	Bhadrapur	BDP
500	\N	Bridgeport	BDR
501	\N	Gbadolite	BDT
502	\N	Moba	BDV
503	\N	Bedford Downs	BDW
504	\N	Broadus	BDX
505	\N	Bandon	BDY
506	\N	Baindoung	BDZ
507	\N	Bereina	BEA
508	\N	Benbecula	BEB
509	\N	Bedford	BED
510	\N	Beagle Bay	BEE
511	\N	Bluefields	BEF
512	\N	Belgrade	BEG
513	\N	Benton Harbor	BEH
514	\N	Beica	BEI
515	\N	Tanjung Redep	BEJ
516	\N	Bareli	BEK
517	\N	Belem	BEL
518	\N	Bellary	BEP
519	\N	Bury St Edmunds	BEQ
520	\N	Berlin	BER
521	\N	Bethel	BET
522	\N	Bedourie	BEU
523	\N	Beer Sheba	BEV
524	\N	Beira	BEW
525	\N	Beirut	BEY
526	\N	Beru	BEZ
527	\N	Bahia Negra	BFA
528	\N	Blue Fox Bay	BFB
529	\N	Bloomfield	BFC
530	\N	Bielefeld	BFE
531	\N	Scottsbluff	BFF
532	\N	Bullfrog Basin	BFG
533	\N	Bakersfield	BFL
534	\N	Buffalo Range	BFO
535	\N	Beaver Falls	BFP
536	\N	Bahia Pinas	BFQ
537	\N	Bedford	BFR
538	\N	Belfast	BFS
539	\N	Beaufort	BFT
540	\N	Bengbu	BFU
541	\N	Buri Ram	BFV
542	\N	Sidi Belabbes	BFW
543	\N	Bafoussam	BFX
544	\N	Booue	BGB
545	\N	Braganca	BGC
546	\N	Borger	BGD
547	\N	Bainbridge	BGE
548	\N	Bangui	BGF
549	\N	Boghe	BGH
550	\N	Bridgetown	BGI
551	\N	Borgarfjordur Eystri	BGJ
552	\N	Big Creek	BGK
553	\N	Baglung	BGL
554	\N	Binghamton	BGM
555	\N	Bergen	BGO
556	\N	Bongo	BGP
557	\N	Big Lake	BGQ
558	\N	Bangor	BGR
559	\N	Bagdad	BGT
560	\N	Bangassou	BGU
561	\N	Bento Goncalves	BGV
562	\N	Baghdad	BGW
563	\N	Bage	BGX
564	\N	Braga	BGZ
565	\N	Bahia De Caraquez	BHA
566	\N	Bhurban	BHC
567	\N	Bahia Cupica	BHF
568	\N	Brus Laguna	BHG
569	\N	Bisha	BHH
570	\N	Bahia Blanca	BHI
571	\N	Bhuj	BHJ
572	\N	Bukhara	BHK
573	\N	Bahia Angeles	BHL
574	\N	Beihan	BHN
575	\N	Bhojpur	BHP
576	\N	Broken Hill	BHQ
577	\N	Bharatpur	BHR
578	\N	Bathurst	BHS
579	\N	Brighton Downs	BHT
580	\N	Bhavnagar	BHU
581	\N	Bahawalpur	BHV
582	\N	Beihai	BHY
583	\N	Belo Horizonte	BHZ
584	\N	Bastia	BIA
585	\N	Baidoa	BIB
586	\N	Big Creek	BIC
587	\N	Block Island	BID
588	\N	Beatrice	BIE
589	\N	Big Delta	BIG
590	\N	Bishop	BIH
591	\N	Bikini Atoll	BII
592	\N	Biliau	BIJ
593	\N	Billings	BIL
594	\N	Bimini	BIM
595	\N	Bamiyan	BIN
596	\N	Bilbao	BIO
597	\N	Bulimba	BIP
598	\N	Biarritz	BIQ
599	\N	Biratnagar	BIR
600	\N	Baitadi	BIT
601	\N	Billiluna	BIW
602	\N	Aek Godang	AEG
603	\N	Al-Baha	ABT
604	\N	Al Ghaydah	AAY
605	\N	Alderney	ACI
606	\N	Alitak	ALZ
607	\N	Alotau	GUR
608	\N	Ambatomainty	AMY
609	\N	Amboseli	ASV
610	\N	Amook	AOS
611	\N	Anaa	AAA
612	\N	Angers	ANE
613	\N	Ankara	ANK
614	\N	Arctic Bay	YAB
615	\N	Asaloyeh	PGU
616	\N	Astypalaia Island	JTY
617	\N	Athens	ATH
618	\N	Atlantic City	AIY
619	\N	Attawapiskat	YAT
620	\N	Augusta	AGS
621	\N	Babo	BXB
622	\N	Bacau	BCM
623	\N	Baker Lake	YBK
624	\N	Bandar Abbas	BND
625	\N	Bandar Lengeh	BDH
626	\N	Banjarmasin	BDJ
627	\N	Bar Harbor	BHB
628	\N	Bario	BBN
629	\N	Barranquilla	BAQ
630	\N	Barreiras	BRA
631	\N	Batticaloa	BTC
632	\N	Baubau	BUW
633	\N	Belize City	BZE
634	\N	Bemidji	BJI
635	\N	Bangalore	BLR
636	\N	Bhopal	BHO
637	\N	Bhubaneswar	BBI
638	\N	Bildudalur	BIU
639	\N	Birmingham	BHX
640	\N	Birmingham	BHM
641	\N	Bismarck	BIS
642	\N	Blagoveschensk	BQS
643	\N	Blenheim	BHE
644	\N	Bloemfontein	BFN
645	\N	Bobo Dioulasso	BOY
646	\N	Bocas Del Toro	BOC
647	\N	Bodaybo	ODO
648	\N	Bonaventure	YVB
649	\N	Coen	CUQ
650	\N	Adak Island	ADK
651	\N	Zarafshan	AFS
652	\N	Sabzevar	AFZ
653	\N	Ahe	AHE
654	\N	Alghero	AHO
655	\N	Al Hoceima	AHU
656	\N	Anaktuvuk	AKP
657	\N	Alpena	APN
658	\N	Aurukun Mission	AUU
659	\N	Araguaina	AUX
660	\N	Aviano	AVB
661	\N	Spring Point	AXP
662	\N	Arutua	AXR
663	\N	Barcaldine	BCI
664	\N	Bongouanou	BGG
665	\N	Biak	BIK
666	\N	Bojnord	BJB
667	\N	Banmethuot	BMV
668	\N	Bria	BIV
669	\N	Biloxi	BIX
670	\N	Bisho	BIY
671	\N	Bimin	BIZ
672	\N	Bejaia	BJA
673	\N	Broomfield	BJC
674	\N	Bakkafjordur	BJD
675	\N	Batsfjord	BJF
676	\N	Bolaang	BJG
677	\N	Bajhang	BJH
678	\N	Wooster	BJJ
679	\N	Benjina	BJK
680	\N	Banjul	BJL
681	\N	Bajone	BJN
682	\N	Bermejo	BJO
683	\N	Braganca Paulista	BJP
684	\N	Bahar Dar	BJR
685	\N	Beijing	BJS
686	\N	Bentota River	BJT
687	\N	Bajura	BJU
688	\N	Bajawa	BJW
689	\N	Badajoz	BJZ
690	\N	Bikaner	BKB
691	\N	Breckenridge	BKD
692	\N	Baker	BKE
693	\N	Katmai National Park	BKF
694	\N	Kekaha	BKH
695	\N	Kota-Kinabalu	BKI
696	\N	Boke	BKJ
697	\N	Bangkok	BKK
698	\N	Bakalalan	BKM
699	\N	Bamako	BKO
700	\N	Barkly Downs	BKP
701	\N	Bokoro	BKR
702	\N	Bengkulu	BKS
703	\N	Blackstone	BKT
704	\N	Betioky	BKU
705	\N	Brookings	BKX
706	\N	Bukavu	BKY
707	\N	Bukoba	BKZ
708	\N	Balboa	BLB
709	\N	Bali	BLC
710	\N	Princeton	BLF
711	\N	Belaga	BLG
712	\N	Blythe	BLH
713	\N	Bellingham	BLI
714	\N	Batna	BLJ
715	\N	Belmar - Farmingdale	BLM
716	\N	Benalla	BLN
717	\N	Blonduos	BLO
718	\N	Bellavista	BLP
719	\N	Bologna	BLQ
720	\N	Bollon	BLS
721	\N	Blackwater	BLT
722	\N	Blue Canyon	BLU
723	\N	Belleville	BLV
724	\N	Waimanalo	BLW
725	\N	Belluno	BLX
726	\N	Belmullet	BLY
727	\N	Bumba	BMB
728	\N	Brigham City	BMC
729	\N	Belo	BMD
730	\N	Broome	BME
731	\N	Bakouma	BMF
732	\N	Bloomington	BMG
733	\N	Bomai	BMH
734	\N	Baramita	BMJ
735	\N	Borkum	BMK
736	\N	Berlin	BML
737	\N	Bitam	BMM
738	\N	Bamerny	BMN
739	\N	Brampton Island	BMP
740	\N	Bamburi	BMQ
741	\N	Baltrum Island	BMR
742	\N	Brumado	BMS
743	\N	Bima	BMU
744	\N	Big Mountain	BMX
745	\N	Bamu	BMZ
746	\N	Boende	BNB
747	\N	Beni	BNC
748	\N	Baranof	BNF
749	\N	Banning	BNG
750	\N	Benin City	BNI
751	\N	Ballina	BNK
752	\N	Barnwell	BNL
753	\N	Bodinumu	BNM
754	\N	Bronnoysund	BNN
755	\N	Burns	BNO
756	\N	Bannu	BNP
757	\N	Baganga	BNQ
758	\N	Banfora	BNR
759	\N	Barinas	BNS
760	\N	Bundi	BNT
761	\N	Blumenau	BNU
762	\N	Boana	BNV
763	\N	Boone	BNW
764	\N	Banja Luka	BNX
765	\N	Bellona	BNY
766	\N	Banz	BNZ
767	\N	Boma	BOA
768	\N	Bora Bora	BOB
769	\N	Bordeaux	BOD
770	\N	Boundji	BOE
771	\N	Bogota	BOG
772	\N	Bourgas	BOJ
773	\N	Brookings	BOK
774	\N	Ballykelly	BOL
775	\N	Mumbai	BOM
776	\N	Kralendijk	BON
777	\N	Bodo	BOO
778	\N	Bouar	BOP
779	\N	Boku	BOQ
780	\N	Boston	BOS
781	\N	Boset	BOT
782	\N	Bourges	BOU
783	\N	Boang	BOV
784	\N	Bartow	BOW
785	\N	Borroloola	BOX
786	\N	Bozoum	BOZ
787	\N	Bethpage	BPA
788	\N	Boridi	BPB
789	\N	Bamenda	BPC
790	\N	Bapi	BPD
791	\N	Bagan	BPE
792	\N	Batuna	BPF
793	\N	Barra Do Garcas	BPG
794	\N	Bislig	BPH
795	\N	Big Piney	BPI
796	\N	Biangabip	BPK
797	\N	Balikpapan	BPN
798	\N	Porto Seguro	BPS
799	\N	Beppu	BPU
800	\N	Bangda	BPX
801	\N	Besalampy	BPY
802	\N	Baler	BQA
803	\N	Bubaque	BQE
804	\N	Bagani	BQI
805	\N	Boulia	BQL
806	\N	Bouna	BQO
807	\N	Barra	BQQ
808	\N	Brest	BQT
809	\N	Bequia	BQU
810	\N	Balgo Hills	BQW
811	\N	Barreirinhas	BRB
812	\N	Bremen	BRE
813	\N	Whitesburg	BRG
814	\N	Brahman	BRH
815	\N	Bari	BRI
816	\N	Bright	BRJ
817	\N	Bourke	BRK
818	\N	Burlington	BRL
819	\N	Barquisimeto	BRM
820	\N	Berne	BRN
821	\N	Brownsville	BRO
822	\N	Biaru	BRP
823	\N	Brno	BRQ
824	\N	Bristol	BRS
825	\N	Bathurst Island	BRT
826	\N	Brussels	BRU
827	\N	Bremerhaven	BRV
828	\N	Barahona	BRX
829	\N	Bardstown	BRY
830	\N	Borotou	BRZ
831	\N	Bossaso	BSA
832	\N	Brasilia	BSB
833	\N	Bahia Solano	BSC
834	\N	Baoshan	BSD
835	\N	Sematan	BSE
836	\N	Pohakuloa	BSF
837	\N	Bata	BSG
838	\N	Brighton	BSH
839	\N	Blairsville	BSI
840	\N	Bairnsdale	BSJ
841	\N	Biskra	BSK
842	\N	Bishe-kola	BSM
843	\N	Bossangoa	BSN
844	\N	Basco	BSO
845	\N	Bensbach	BSP
846	\N	Bisbee	BSQ
847	\N	Balsas	BSS
848	\N	Bost	BST
849	\N	Basankusu	BSU
850	\N	Besakoa	BSV
851	\N	Boswell Bay	BSW
852	\N	Bassein	BSX
853	\N	Bardera	BSY
854	\N	Bartletts	BSZ
855	\N	Yaoundé	BTA
856	\N	Betou	BTB
857	\N	Brunette Downs	BTD
858	\N	Bonthe	BTE
859	\N	Bountiful	BTF
860	\N	Batangafo	BTG
861	\N	Banda Aceh	BTJ
862	\N	Bratsk	BTK
863	\N	Battle Creek	BTL
864	\N	Butte	BTM
865	\N	Bennettsville	BTN
866	\N	Botopasie	BTO
867	\N	Butler	BTP
868	\N	Butare	BTQ
869	\N	Baton Rouge	BTR
870	\N	Bratislava	BTS
871	\N	Bettles	BTT
872	\N	Bintulu	BTU
873	\N	Batu Licin	BTW
874	\N	Betoota	BTX
875	\N	Beatty	BTY
876	\N	Burwell	BUB
877	\N	Burketown	BUC
878	\N	Buenos Aires	BUE
879	\N	Benguela	BUG
880	\N	Bokondini	BUI
881	\N	Boussaada	BUJ
882	\N	Albuq	BUK
883	\N	Bulolo	BUL
884	\N	Butler	BUM
885	\N	Burao	BUO
886	\N	Bhatinda	BUP
887	\N	Bulawayo	BUQ
888	\N	Batumi	BUS
889	\N	Bella Union	BUV
890	\N	Bunia	BUX
891	\N	Bunbury	BUY
892	\N	Bushehr	BUZ
893	\N	Boa Vista	BVB
894	\N	Boa Vista	BVC
895	\N	Beaver Inlet	BVD
896	\N	Brive-La-Gaillarde	BVE
897	\N	Bua	BVF
898	\N	Berlevag	BVG
899	\N	Birdsville	BVI
900	\N	Huacaraje	BVK
901	\N	Baures	BVL
902	\N	Belmonte	BVM
903	\N	Bartlesville	BVO
904	\N	Bolovip	BVP
905	\N	Brava	BVR
906	\N	Breves	BVS
907	\N	Beluga	BVU
908	\N	Batavia Downs	BVW
909	\N	Batesville	BVX
910	\N	Beverly	BVY
911	\N	Beverley Springs	BVZ
912	\N	Bhairawa	BWA
913	\N	Barrow Island	BWB
914	\N	Brawley	BWC
915	\N	Brownwood	BWD
916	\N	Braunschweig	BWE
917	\N	Barrow-In-Furness	BWF
918	\N	Bowling Green	BWG
919	\N	Butterworth	BWH
920	\N	Bawan	BWJ
921	\N	Bol	BWK
922	\N	Blackwell	BWL
923	\N	Bowman	BWM
924	\N	Bandar Seri Begawan	BWN
925	\N	Balakovo	BWO
926	\N	Bewani	BWP
927	\N	Brewarrina	BWQ
928	\N	Blaine	BWS
929	\N	Bogalusa	BXA
930	\N	Boxborough	BXC
931	\N	Bade	BXD
932	\N	Bakel	BXE
933	\N	Belburn	BXF
934	\N	Bendigo	BXG
935	\N	Balhash	BXH
936	\N	Boundiali	BXI
937	\N	Buckeye	BXK
938	\N	Blue Lagoon	BXL
939	\N	Batom	BXM
940	\N	Buochs	BXO
941	\N	Borrego Springs	BXS
942	\N	Bontang	BXT
943	\N	Butuan	BXU
944	\N	Breiddalsvik	BXV
945	\N	Borama	BXX
946	\N	Bunsil	BXZ
947	\N	Boundary	BYA
948	\N	Dibaa	BYB
949	\N	Yacuiba	BYC
950	\N	Beidah	BYD
951	\N	Buffalo	BYG
952	\N	Rupert	BYI
953	\N	Bouake	BYK
954	\N	Bella Yella	BYL
955	\N	Bayamo	BYM
956	\N	Bunyu	BYQ
957	\N	Laeso Island	BYR
958	\N	Fort Irwin	BYS
959	\N	Bantry	BYT
960	\N	Bayreuth	BYU
961	\N	Blakely Island	BYW
962	\N	Baniyala	BYX
963	\N	Bonanza	BZA
964	\N	Bazaruto Island	BZB
965	\N	Buzios	BZC
966	\N	Balranald	BZD
967	\N	Bydgoszcz	BZG
968	\N	Bumi Hills	BZH
969	\N	Balikesir	BZI
970	\N	Briansk	BZK
971	\N	Barisal	BZL
972	\N	Bergen Op Zoom	BZM
973	\N	Bolzano	BZO
974	\N	Bizant	BZP
975	\N	Beziers	BZR
976	\N	Brazoria	BZT
977	\N	Buta	BZU
978	\N	Beltsy	BZY
979	\N	Catacamas	CAA
980	\N	Cabinda	CAB
981	\N	Cascavel	CAC
982	\N	Cadillac	CAD
983	\N	Carauari	CAF
984	\N	Cagliari	CAG
985	\N	Ca Mau	CAH
986	\N	Cairo	CAI
987	\N	Canaima	CAJ
988	\N	Camiri	CAM
989	\N	Clayton	CAO
990	\N	Cap Haitien	CAP
991	\N	Caucasia	CAQ
992	\N	Caribou	CAR
993	\N	Cat Island	CAT
994	\N	Caruaru	CAU
995	\N	Cazombo	CAV
996	\N	Carlisle	CAX
997	\N	Cayenne	CAY
998	\N	Cobar	CAZ
999	\N	Corner Bay	CBA
1000	\N	Cochabamba	CBB
1001	\N	Cherrabun	CBC
1002	\N	Car Nicobar	CBD
1003	\N	Cumberland	CBE
1004	\N	Council Bluffs	CBF
1005	\N	Cambridge	CBG
1006	\N	Béchar	CBH
1007	\N	Cabo Rojo	CBJ
1008	\N	Colby	CBK
1009	\N	Ciudad Bolivar	CBL
1010	\N	Cirebon	CBN
1011	\N	Cotabato	CBO
1012	\N	Coimbra	CBP
1013	\N	Calabar	CBQ
1014	\N	Canberra	CBR
1015	\N	Cabimas	CBS
1016	\N	Catumbela	CBT
1017	\N	Cottbus	CBU
1018	\N	Coban	CBV
1019	\N	Campo Mourao	CBW
1020	\N	Condobolin	CBX
1021	\N	Canobie	CBY
1022	\N	Cabin Creek	CBZ
1023	\N	Fort Chaffee	CCA
1024	\N	Upland	CCB
1025	\N	Cayo Coco	CCC
1026	\N	Carcassonne	CCF
1027	\N	Crane	CCG
1028	\N	Chile Chico	CCH
1029	\N	Concordia	CCI
1030	\N	Kozhikode	CCJ
1031	\N	Chinchilla	CCL
1032	\N	Chakcharan	CCN
1033	\N	Carimagua	CCO
1034	\N	Cachoeira	CCQ
1035	\N	Concord	CCR
1036	\N	Caracas	CCS
1037	\N	Colonia Catriel	CCT
1038	\N	Cowell	CCW
1039	\N	Caceres	CCX
1040	\N	Charles City	CCY
1041	\N	Chub Cay	CCZ
1042	\N	Cooinda	CDA
1043	\N	Cauquira	CDD
1044	\N	Caledonia	CDE
1045	\N	Camden	CDH
1046	\N	Cachoeiro Itapemirim	CDI
1047	\N	Conceicao Do Araguaia	CDJ
1048	\N	Cedar Key	CDK
1049	\N	Candle	CDL
1050	\N	Camden	CDN
1051	\N	Cradock	CDO
1052	\N	Cuddapah	CDP
1053	\N	Croydon	CDQ
1054	\N	Childress	CDS
1055	\N	Camden	CDU
1056	\N	Caldwell	CDW
1057	\N	Cagayan De Sulu	CDY
1058	\N	Cadiz	CDZ
1059	\N	Cebu	CEB
1060	\N	Crescent City	CEC
1061	\N	Cherepovets	CEE
1062	\N	Chicopee	CEF
1063	\N	Chester	CEG
1064	\N	Chelinda	CEH
1065	\N	Chiang Rai	CEI
1066	\N	Cape Eleuthera	CEL
1067	\N	Central	CEM
1068	\N	Waco Kungo	CEO
1069	\N	Concepcion	CEP
1070	\N	Cannes	CEQ
1071	\N	Cherbourg	CER
1072	\N	Cessnock	CES
1073	\N	Cholet	CET
1074	\N	Clemson	CEU
1075	\N	Connersville	CEV
1076	\N	Crestview	CEW
1077	\N	Chena Hot Springs	CEX
1078	\N	Murray	CEY
1079	\N	Cortez	CEZ
1080	\N	Coffee Point	CFA
1081	\N	Bryan	CFD
1082	\N	Clermont-Ferrand	CFE
1083	\N	Cafunfo	CFF
1084	\N	Cienfuegos	CFG
1085	\N	Clifton Hills	CFH
1086	\N	Camfield	CFI
1087	\N	Confreza	CFO
1088	\N	Carpentaria Downs	CFP
1089	\N	Creston	CFQ
1090	\N	Caen	CFR
1091	\N	Coffs Harbour	CFS
1092	\N	Clifton	CFT
1093	\N	Kerkyra	CFU
1094	\N	Coffeyville	CFV
1095	\N	Craig	CGA
1096	\N	Cuiaba	CGB
1097	\N	Cape Gloucester	CGC
1098	\N	Cambridge	CGE
1099	\N	Casiguran	CGG
1100	\N	Cape Girardeau	CGI
1101	\N	Chingola	CGJ
1102	\N	Camiguin	CGM
1103	\N	Cologne	CGN
1104	\N	Zhengzhou	CGO
1105	\N	Changchun	CGQ
1106	\N	Campo Grande	CGR
1107	\N	College Park	CGS
1108	\N	Chinguitti	CGT
1109	\N	Ciudad Guayana	CGU
1110	\N	Caiguna	CGV
1111	\N	Casa Grande	CGZ
1112	\N	Chattanooga	CHA
1113	\N	Chilas	CHB
1114	\N	Jinhae	CHF
1115	\N	Chachapoyas	CHH
1116	\N	Chicago	CHI
1117	\N	Chipinge	CHJ
1118	\N	Chickasha	CHK
1119	\N	Challis	CHL
1120	\N	Chimbote	CHM
1121	\N	Jeonju	CHN
1122	\N	Charlottesville	CHO
1123	\N	Circle Hot Springs	CHP
1124	\N	Chateauroux	CHR
1125	\N	Chatham Island	CHT
1126	\N	Chaves	CHV
1127	\N	Jiuquan	CHW
1128	\N	Changuinola	CHX
1129	\N	Choiseul Bay	CHY
1130	\N	Chiloquin	CHZ
1131	\N	Cedar Rapids	CID
1132	\N	Collie	CIE
1133	\N	Chifeng	CIF
1134	\N	Craig	CIG
1135	\N	Changzhi	CIH
1136	\N	Cobija	CIJ
1137	\N	Council	CIL
1138	\N	Cimitarra	CIM
1139	\N	Carroll	CIN
1140	\N	Concepcion	CIO
1141	\N	Chiquimula	CIQ
1142	\N	Cairo	CIR
1143	\N	Canton Island	CIS
1144	\N	Shimkent	CIT
1145	\N	Chomley	CIV
1146	\N	Chiclayo	CIX
1147	\N	Comiso	CIY
1148	\N	Coari	CIZ
1149	\N	Cajamarca	CJA
1150	\N	Coimbatore	CJB
1151	\N	Calama	CJC
1152	\N	Candilejas	CJD
1153	\N	Chilko Lake	CJH
1154	\N	Cheongju	CJJ
1155	\N	Chitral	CJL
1156	\N	Chumphon	CJM
1157	\N	El Cajon	CJN
1158	\N	Ciudad Juarez	CJS
1159	\N	Comitan	CJT
1160	\N	Cherokee	CKA
1161	\N	Cherkassy	CKC
1162	\N	Clear Lake	CKE
1163	\N	Chongqing	CKG
1164	\N	Croker Island	CKI
1165	\N	Cherokee	CKK
1166	\N	Chkalovsky	CKL
1167	\N	Clarksdale	CKM
1168	\N	Crookston	CKN
1169	\N	Cornelio Procopio	CKO
1170	\N	Crane Island	CKR
1171	\N	Carajas	CKS
1172	\N	Sarakhs	CKT
1173	\N	Clarksville	CKV
1174	\N	Chicken	CKX
1175	\N	Conakry	CKY
1176	\N	Canakkale	CKZ
1177	\N	Comilla	CLA
1178	\N	Clearlake	CLC
1179	\N	Coalinga	CLG
1180	\N	Coolah	CLH
1181	\N	Clintonville	CLI
1182	\N	Cluj-Napoca	CLJ
1183	\N	College Station	CLL
1184	\N	Port Angeles	CLM
1185	\N	Carolina	CLN
1186	\N	Cali	CLO
1187	\N	Clarks Point	CLP
1188	\N	Colima	CLQ
1189	\N	Calipatria	CLR
1190	\N	Chehalis	CLS
1191	\N	Columbus	CLU
1192	\N	Clorinda	CLX
1193	\N	Calvi	CLY
1194	\N	Calabozo	CLZ
1195	\N	Camocim	CMC
1196	\N	Cootamundra	CMD
1197	\N	Chambery	CMF
1198	\N	Chi Mei	CMJ
1199	\N	Club Makokola	CMK
1200	\N	Camooweal	CML
1201	\N	Carmelita	CMM
1202	\N	Obbia	CMO
1203	\N	Santana Do Araguaia	CMP
1204	\N	Clermont	CMQ
1205	\N	Colmar	CMR
1206	\N	Scusciuban	CMS
1207	\N	Cameta	CMT
1208	\N	Kundiawa	CMU
1209	\N	Coromandel	CMV
1210	\N	Camaguey	CMW
1211	\N	Hancock	CMX
1212	\N	Sparta	CMY
1213	\N	Caia	CMZ
1214	\N	Cananea	CNA
1215	\N	Coonamble	CNB
1216	\N	Coconut Island	CNC
1217	\N	Canon City	CNE
1218	\N	Cognac	CNG
1219	\N	Claremont	CNH
1220	\N	Changhai	CNI
1221	\N	Concordia	CNK
1222	\N	Sindal	CNL
1223	\N	Chino	CNO
1224	\N	Chanaral	CNR
1225	\N	Cairns	CNS
1226	\N	Charata	CNT
1227	\N	Chanute	CNU
1228	\N	Canavieiras	CNV
1229	\N	Moab	CNY
1230	\N	Cangamba	CNZ
1231	\N	Columbia	COA
1232	\N	Coolibah	COB
1233	\N	Concordia	COC
1234	\N	Condoto	COG
1235	\N	Cooch Behar	COH
1236	\N	Cocoa	COI
1237	\N	Coonabarabran	COJ
1238	\N	Coleman	COM
1239	\N	Concord	CON
1240	\N	Cotonou	COO
1241	\N	Cooperstown	COP
1242	\N	Cordoba	COR
1243	\N	Colorado Springs	COS
1244	\N	Cotulla	COT
1245	\N	Covilha	COV
1246	\N	Coquimbo	COW
1247	\N	Congo Town	COX
1248	\N	Coolawanyah	COY
1249	\N	Constanza	COZ
1250	\N	Cape Palmas	CPA
1251	\N	Capurgana	CPB
1252	\N	Coober Pedy	CPD
1253	\N	Campeche	CPE
1254	\N	Cepu	CPF
1255	\N	Carmen De Patagones	CPG
1256	\N	Copenhagen	CPH
1257	\N	Cape Orford	CPI
1258	\N	Chaparral	CPL
1259	\N	Compton	CPM
1260	\N	Cape Rodney	CPN
1261	\N	Copiapo	CPO
1262	\N	Campinas	CPQ
1263	\N	Cape Town	CPT
1264	\N	Cururupu	CPU
1265	\N	Campina Grande	CPV
1266	\N	Culebra	CPX
1267	\N	Canarana	CQA
1268	\N	Calais	CQF
1269	\N	Cape Flattery	CQP
1270	\N	Costa Marques	CQS
1271	\N	Caquetania	CQT
1272	\N	Craiova	CRA
1273	\N	Collarenebri	CRB
1274	\N	Cartago	CRC
1275	\N	Comodoro Rivadavia	CRD
1276	\N	Carnot	CRF
1277	\N	Cherribah	CRH
1278	\N	Coorabie	CRJ
1279	\N	Catarman	CRM
1280	\N	Corcoran	CRO
1281	\N	Corpus Christi	CRP
1282	\N	Caravelas	CRQ
1283	\N	Ceres	CRR
1284	\N	Corsicana	CRS
1285	\N	Crossett	CRT
1286	\N	Carriacou Island	CRU
1287	\N	Crotone	CRV
1288	\N	Charleston	CRW
1289	\N	Corinth	CRX
1290	\N	Carlton Hill	CRY
1291	\N	Turkmenabad	CRZ
1292	\N	Caransebes	CSB
1293	\N	Canas	CSC
1294	\N	Cresswell Downs	CSD
1295	\N	Crested Butte	CSE
1296	\N	Creil	CSF
1297	\N	Columbus	CSG
1298	\N	Solovetsky	CSH
1299	\N	Casino	CSI
1300	\N	Cape St Jacques	CSJ
1301	\N	San Luis Obispo	CSL
1302	\N	Carson City	CSN
1303	\N	Cape Spencer	CSP
1304	\N	Creston	CSQ
1305	\N	Casuarito	CSR
1306	\N	Cassilandia	CSS
1307	\N	Castaway	CST
1308	\N	Santa Cruz Do Sul	CSU
1309	\N	Crossville	CSV
1310	\N	Colorado do Oeste	CSW
1311	\N	Changsha	CSX
1312	\N	Cheboksary	CSY
1313	\N	Coronel Suarez	CSZ
1314	\N	Catania	CTA
1315	\N	Cut Bank	CTB
1316	\N	Catamarca	CTC
1317	\N	Chitre	CTD
1318	\N	Carti	CTE
1319	\N	Coatepeque	CTF
1320	\N	Cartagena	CTG
1321	\N	Coatesville	CTH
1322	\N	Cuito Cuanavale	CTI
1323	\N	Carrollton	CTJ
1324	\N	Canton	CTK
1325	\N	Chetumal	CTM
1326	\N	Cooktown	CTN
1327	\N	Calverton	CTO
1328	\N	Carutapera	CTP
1329	\N	Santa Vitoria	CTQ
1330	\N	Cattle Creek	CTR
1331	\N	Le Castellet	CTT
1332	\N	Chengdu	CTU
1333	\N	Cottonwood	CTW
1334	\N	Cortland	CTX
1335	\N	Cross City	CTY
1336	\N	Clinton	CTZ
1337	\N	Ciudad Constitucion	CUA
1338	\N	Cucuta	CUC
1339	\N	Caloundra	CUD
1340	\N	Cuenca	CUE
1341	\N	Cudal	CUG
1342	\N	Cushing	CUH
1343	\N	Currillo	CUI
1344	\N	Culion	CUJ
1345	\N	Cumana	CUM
1346	\N	Cancun	CUN
1347	\N	Caruru	CUO
1348	\N	Carupano	CUP
1349	\N	Columbus	CUS
1350	\N	Cutral	CUT
1351	\N	Chihuahua	CUU
1352	\N	Casigua	CUV
1353	\N	Cube Cove	CUW
1354	\N	Cue	CUY
1355	\N	Cuzco	CUZ
1356	\N	Chungribu	CVB
1357	\N	Cleve	CVC
1358	\N	Covenas	CVE
1359	\N	Courchevel	CVF
1360	\N	Caviahue	CVH
1361	\N	Caleta Olivia	CVI
1362	\N	Cuernavaca	CVJ
1363	\N	Cape Vogel	CVL
1364	\N	Ciudad Victoria	CVM
1365	\N	Carnarvon	CVQ
1366	\N	Culver City	CVR
1367	\N	Coventry	CVT
1368	\N	Chernovtsy	CWC
1369	\N	Callaway Gardens	CWG
1370	\N	Clinton	CWI
1371	\N	Cardiff	CWL
1372	\N	Campbellpore	CWP
1373	\N	Cowarie	CWR
1374	\N	Center Island	CWS
1375	\N	Cowra	CWT
1376	\N	Corowa	CWW
1377	\N	Caicara Del Orinoco	CXA
1378	\N	Chitina	CXC
1379	\N	Coldfoot	CXF
1380	\N	Calexico	CXL
1381	\N	Candala	CXN
1382	\N	Conroe	CXO
1383	\N	Cilacap	CXP
1384	\N	Christmas Creek	CXQ
1385	\N	Charters Towers	CXT
1386	\N	Cat Cays	CXY
1387	\N	Les Cayes	CYA
1388	\N	Caye Chapel	CYC
1389	\N	Crystal Lake	CYE
1390	\N	Corryong	CYG
1391	\N	Coyoles	CYL
1392	\N	Chatham	CYM
1393	\N	Calbayog	CYP
1394	\N	Colonia	CYR
1395	\N	Cheyenne	CYS
1396	\N	Yakataga	CYT
1397	\N	Cuyo	CYU
1398	\N	Cherskiy	CYX
1399	\N	Cauayan	CYZ
1400	\N	Chichen Itza	CZA
1401	\N	Cruz Alta	CZB
1402	\N	Copper Centre	CZC
1403	\N	Coro	CZE
1404	\N	Cape Romanzof	CZF
1405	\N	Corozal	CZH
1406	\N	Cascade Locks	CZK
1407	\N	Cozumel	CZM
1408	\N	Chisana	CZN
1409	\N	Chistochina	CZO
1410	\N	Cape Pole	CZP
1411	\N	Carrizo Springs	CZT
1412	\N	Corozal	CZU
1413	\N	Czestochowa	CZW
1414	\N	Changzhou	CZX
1415	\N	Cluny	CZY
1416	\N	Campo	CZZ
1417	\N	Fort Belvoir	DAA
1418	\N	Daytona Beach	DAB
1419	\N	Dhaka	DAC
1420	\N	Da Nang	DAD
1421	\N	Daup	DAF
1422	\N	Daggett	DAG
1423	\N	Dathina	DAH
1424	\N	Dauan Island	DAJ
1425	\N	Dakhla Oasis	DAK
1426	\N	Damascus	DAM
1427	\N	Danville	DAN
1428	\N	Dabo	DAO
1429	\N	Gokuleshwar	DAP
1430	\N	Great Bear Lake	DAS
1431	\N	Datong	DAT
1432	\N	Daru	DAU
1433	\N	David	DAV
1434	\N	Daxian	DAX
1435	\N	Darwaz	DAZ
1436	\N	Dalbandin	DBA
1437	\N	Dabaa City	DBB
1438	\N	Dhanbad	DBD
1439	\N	Debra Marcos	DBM
1440	\N	Dublin	DBN
1441	\N	Debepare	DBP
1442	\N	Dubuque	DBQ
1443	\N	Dubois	DBS
1444	\N	Debra Tabor	DBT
1445	\N	Dambula	DBU
1446	\N	Dubrovnik	DBV
1447	\N	Dalby	DBY
1448	\N	Decimomannu	DCI
1449	\N	Dahl Creek	DCK
1450	\N	Decatur	DCR
1451	\N	Duncan Town	DCT
1452	\N	Decatur	DCU
1453	\N	Daydream Island	DDI
1454	\N	Dodoima	DDM
1455	\N	Delta Downs	DDN
1456	\N	Dorado	DDP
1457	\N	Dera Ghazi Khan	DEA
1458	\N	Debrecen	DEB
1459	\N	Dehra Dun	DED
1460	\N	Dezful	DEF
1461	\N	Decorah	DEH
1462	\N	Denis Island	DEI
1463	\N	New Delhi	DEL
1464	\N	Dembidollo	DEM
1465	\N	Denver	DEN
1466	\N	Dearborn	DEO
1467	\N	Deparizo	DEP
1468	\N	Derim	DER
1469	\N	Desroches	DES
1470	\N	Defiance	DFI
1471	\N	Drumduff	DFP
1472	\N	Dangriga	DGA
1473	\N	Danger Bay	DGB
1474	\N	Degahbur	DGC
1475	\N	Dalgaranga	DGD
1476	\N	Mudgee	DGE
1477	\N	Douglas Lake	DGF
1478	\N	Daugo	DGG
1479	\N	Dugong	DGK
1480	\N	Dongguan	DGM
1481	\N	Dahlgren	DGN
1482	\N	Durango	DGO
1483	\N	Daugavpils	DGP
1484	\N	Dargaville	DGR
1485	\N	Dumaguete	DGT
1486	\N	Dedougou	DGU
1487	\N	Douglas	DGW
1488	\N	Dhahran	DHA
1489	\N	Durham Downs	DHD
1490	\N	Dhangarhi	DHI
1491	\N	Dhala	DHL
1492	\N	Dharamsala	DHM
1493	\N	Dalhart	DHT
1494	\N	Dibrugarh	DIB
1495	\N	Diqing	DIG
1496	\N	Dijon	DIJ
1497	\N	Dili	DIL
1498	\N	Dimbokro	DIM
1499	\N	Diomede Island	DIO
1500	\N	Diapaga	DIP
1501	\N	Divinopolis	DIQ
1502	\N	Loubomo	DIS
1503	\N	Diu	DIU
1504	\N	Divo	DIV
1505	\N	Diyarbakir	DIY
1506	\N	Djougou	DJA
1507	\N	Jambi	DJB
1508	\N	Djerba	DJE
1509	\N	Djambala	DJM
1510	\N	Delta Junction	DJN
1511	\N	Daloa	DJO
1512	\N	Djupivogur	DJU
1513	\N	Dunk Island	DKI
1514	\N	Dunkirk	DKK
1515	\N	Dakar	DKR
1516	\N	Dikson	DKS
1517	\N	Docker River	DKV
1518	\N	Douala	DLA
1519	\N	Dalbertis	DLB
1520	\N	Dalian	DLC
1521	\N	Dole	DLE
1522	\N	Dulkaninna	DLK
1523	\N	Dillon	DLL
1524	\N	Dillon	DLN
1525	\N	Dolomi	DLO
1526	\N	The Dalles	DLS
1527	\N	Delissaville	DLV
1528	\N	Dillons Bay	DLY
1529	\N	Zhambyl	DMB
1530	\N	Doomadgee	DMD
1531	\N	Dammam	DMM
1532	\N	Deming	DMN
1533	\N	Sedalia	DMO
1534	\N	Dhamar	DMR
1535	\N	Diamantino	DMT
1536	\N	Dunbar	DNB
1537	\N	Dundee	DND
1538	\N	Derna	DNF
1539	\N	Doongan	DNG
1540	\N	Dunhuang	DNH
1541	\N	Wad Medani	DNI
1542	\N	Dnepropetrovsk	DNK
1543	\N	Denham	DNM
1544	\N	Dalton	DNN
1545	\N	Dianopolis	DNO
1546	\N	Dang	DNP
1547	\N	Deniliquin	DNQ
1548	\N	Denison	DNS
1549	\N	Dinangat	DNU
1550	\N	Danville	DNV
1551	\N	Dinder	DNX
1552	\N	Denizli	DNZ
1553	\N	Doany	DOA
1554	\N	Dornoch	DOC
1555	\N	Djoemoe	DOE
1556	\N	Dora Bay	DOF
1557	\N	Dongola	DOG
1558	\N	Doha	DOH
1559	\N	Doini	DOI
1560	\N	Donetsk	DOK
1561	\N	Deauville	DOL
1562	\N	Dos Lagunas	DON
1563	\N	Dorobisoro	DOO
1564	\N	Dolpa	DOP
1565	\N	Dori	DOR
1566	\N	Dios	DOS
1567	\N	Dover-Cheswold	DOV
1568	\N	Dongara	DOX
1569	\N	Dongying	DOY
1570	\N	Dieppe	DPE
1571	\N	Dugway	DPG
1572	\N	Deer Park	DPK
1573	\N	Dipolog	DPL
1574	\N	Devonport	DPO
1575	\N	Denpasar	DPS
1576	\N	Dumpu	DPU
1577	\N	Mercury	DRA
1578	\N	Dirico	DRC
1579	\N	Dorunda Station	DRD
1580	\N	Drummond Island	DRE
1581	\N	Drift River	DRF
1582	\N	Dabra	DRH
1583	\N	De Ridder	DRI
1584	\N	Drietabbetje	DRJ
1585	\N	Dirranbandi	DRN
1586	\N	Durrie	DRR
1587	\N	Dresden	DRS
1588	\N	Del Rio	DRT
1589	\N	Drummond	DRU
1590	\N	Darwin	DRW
1591	\N	Drysdale River	DRY
1592	\N	Dschang	DSC
1593	\N	La Desirade	DSD
1594	\N	Dessie	DSE
1595	\N	Dilasag	DSG
1596	\N	Destin	DSI
1597	\N	Dera Ismail Khan	DSK
1598	\N	Ordos (Dongsheng)	DSN
1599	\N	Dansville	DSV
1600	\N	Delta	DTA
1601	\N	Datadawai	DTD
1602	\N	Daet	DTE
1603	\N	Death Valley	DTH
1604	\N	Detroit Lakes	DTL
1605	\N	Dortmund	DTM
1606	\N	Decatur Island	DTR
1607	\N	Durant	DUA
1608	\N	Dublin	DUB
1609	\N	Duncan	DUC
1610	\N	Dunedin	DUD
1611	\N	Dundo	DUE
1612	\N	Corolla	DUF
1613	\N	Douglas	DUG
1614	\N	Dukuduk	DUK
1615	\N	Dumai	DUM
1616	\N	Dundas	DUN
1617	\N	Diavik	DVK
1618	\N	Devils Lake	DVL
1619	\N	Davenport	DVN
1620	\N	Davao	DVO
1621	\N	Davenport Downs	DVP
1622	\N	Daly River	DVR
1623	\N	Dwangwa	DWA
1624	\N	Soalala	DWB
1625	\N	Dixie	DXD
1626	\N	Danbury	DXR
1627	\N	Dysart	DYA
1628	\N	Dayong	DYG
1629	\N	Doylestown	DYL
1630	\N	Diamantina Lakes	DYM
1631	\N	Anadyr	DYR
1632	\N	Dushanbe	DYU
1633	\N	Daly Waters	DYW
1634	\N	Codazzi	DZI
1635	\N	Zhezkazgan	DZN
1636	\N	Durazno	DZO
1637	\N	Dazu	DZU
1638	\N	Eagle	EAA
1639	\N	Abbse	EAB
1640	\N	Emae	EAE
1641	\N	Kwajalein Atoll	EAL
1642	\N	Nejran	EAM
1643	\N	Wheatland	EAN
1644	\N	Mulhouse	EAP
1645	\N	San Sebastian	EAS
1646	\N	El Obeid	EBD
1647	\N	Esbjerg	EBJ
1648	\N	Erbil	EBL
1649	\N	El Borma	EBM
1650	\N	Ebadon	EBN
1651	\N	Ebon	EBO
1652	\N	Webster City	EBS
1653	\N	St Etienne	EBU
1654	\N	Ebolowa	EBW
1655	\N	East Tawas	ECA
1656	\N	Elizabeth City	ECG
1657	\N	Echuca	ECH
1658	\N	El Encanto	ECO
1659	\N	El Charco	ECR
1660	\N	Newcastle	ECS
1661	\N	Eldebba	EDB
1662	\N	Erldunda	EDD
1663	\N	Edenton	EDE
1664	\N	Edgewood	EDG
1665	\N	El Dorado	EDK
1666	\N	Eldoret	EDL
1667	\N	La Roche	EDM
1668	\N	Erandique	EDQ
1669	\N	Edwards	EDW
1670	\N	Needles	EED
1671	\N	Eek	EEK
1672	\N	Keene	EEN
1673	\N	Eight Fathom Bight	EFB
1674	\N	Efogi	EFG
1675	\N	Newport	EFK
1676	\N	Kefalonia	EFL
1677	\N	East Fork	EFO
1678	\N	Jefferson	EFW
1679	\N	Engati	EGA
1680	\N	Bergerac	EGC
1681	\N	Vail	EGE
1682	\N	Neghelli	EGL
1683	\N	Sege	EGM
1684	\N	Geneina	EGN
1685	\N	Belgorod	EGO
1686	\N	Eagle Pass	EGP
1687	\N	Egilsstadir	EGS
1688	\N	Eagle River	EGV
1689	\N	Egegik	EGX
1690	\N	El Bolson	EHL
1691	\N	Cape Newenham	EHM
1692	\N	East Hartford	EHT
1693	\N	Eia	EIA
1694	\N	Eisenach	EIB
1695	\N	Eniseysk	EIE
1696	\N	Einasleigh	EIH
1697	\N	Ein Yahav	EIY
1698	\N	Barrancabermeja	EJA
1699	\N	Wedjh	EJH
1700	\N	Mili Atoll	EJT
1701	\N	Eureka	EKA
1702	\N	Ekibastuz	EKB
1703	\N	Elkedra	EKD
1704	\N	Ekereku	EKE
1705	\N	Elkhart	EKI
1706	\N	Elkins	EKN
1707	\N	Eskilstuna	EKT
1708	\N	Elizabethtown	EKX
1709	\N	Eagle Lake	ELA
1710	\N	El Banco	ELB
1711	\N	El Real	ELE
1712	\N	El Golea	ELG
1713	\N	Elim	ELI
1714	\N	El Recreo	ELJ
1715	\N	Elk City	ELK
1716	\N	Ellisras	ELL
1717	\N	Ellensburg	ELN
1718	\N	Eldorado	ELO
1719	\N	Buraidah	ELQ
1720	\N	Elelim	ELR
1721	\N	East London	ELS
1722	\N	Tour Sinai City	ELT
1723	\N	El Oued	ELU
1724	\N	Ellamar	ELW
1725	\N	El Tigre	ELX
1726	\N	Ely	ELY
1727	\N	Wellsville	ELZ
1728	\N	Emden	EME
1729	\N	Empangeni	EMG
1730	\N	Emirau	EMI
1731	\N	Luzern	EML
1732	\N	Kemerer	EMM
1733	\N	Nema	EMN
1734	\N	Emo	EMO
1735	\N	Emporia	EMP
1736	\N	Embessa	EMS
1737	\N	El Monte	EMT
1738	\N	El Maiten	EMX
1739	\N	El Minya	EMY
1740	\N	Eneabba West	ENB
1741	\N	Ende	ENE
1742	\N	Enshi	ENH
1743	\N	El Naranjo	ENJ
1744	\N	Enniskillen	ENK
1745	\N	Centralia	ENL
1746	\N	Nenana	ENN
1747	\N	Encarnacion	ENO
1748	\N	Coronel E Soto Cano AB	ENQ
1749	\N	Enschede	ENS
1750	\N	Enewetak Island	ENT
1751	\N	Wendover	ENV
1752	\N	Kenosha	ENW
1753	\N	Eday	EOI
1754	\N	Keokuk	EOK
1755	\N	El Dorado	EOR
1756	\N	Neosho	EOS
1757	\N	Elorza	EOZ
1758	\N	El Palomar	EPA
1759	\N	Weeping Water	EPG
1760	\N	Ephrata	EPH
1761	\N	Epi	EPI
1762	\N	Epinal	EPL
1763	\N	Epena	EPN
1764	\N	Samana	EPS
1765	\N	Eliptamin	EPT
1766	\N	Parnu	EPU
1767	\N	Erigavo	ERA
1768	\N	Ernabella	ERB
1769	\N	Erzincan	ERC
1770	\N	Berdyansk	ERD
1771	\N	Erave	ERE
1772	\N	Er-Rachidia	ERH
1773	\N	Erie	ERI
1774	\N	Eldred Rock	ERO
1775	\N	Errol	ERR
1776	\N	Erdenet	ERT
1777	\N	Erume	ERU
1778	\N	Kerrville	ERV
1779	\N	Erzurum	ERZ
1780	\N	Ensenada	ESE
1781	\N	Mariscal Estigarribia	ESG
1782	\N	Espinosa	ESI
1783	\N	Elista	ESL
1784	\N	Esmeraldas	ESM
1785	\N	Easton	ESN
1786	\N	Espanola	ESO
1787	\N	East Stroudsburg	ESP
1788	\N	Essen	ESS
1789	\N	Estherville	EST
1790	\N	Essaouira	ESU
1791	\N	Easton	ESW
1792	\N	West Bend	ETB
1793	\N	Etadunna	ETD
1794	\N	Genda Wuha	ETE
1795	\N	Eilat	ETH
1796	\N	Eastland	ETN
1797	\N	Enterprise	ETS
1798	\N	Metz	ETZ
1799	\N	Eua	EUA
1800	\N	Eucla	EUC
1801	\N	Eureka	EUE
1802	\N	Eufaula	EUF
1803	\N	Eugene	EUG
1804	\N	Neumuenster	EUM
1805	\N	Paratebueno	EUO
1806	\N	Antique	EUQ
1807	\N	Evadale	EVA
1808	\N	Eva Downs	EVD
1809	\N	Sveg	EVG
1810	\N	Evans Head	EVH
1811	\N	Eveleth	EVM
1812	\N	Yerevan	EVN
1813	\N	Evanston	EVW
1814	\N	Evreux	EVX
1815	\N	New Bedford	EWB
1816	\N	Wildman Lake	EWD
1817	\N	Ewer	EWE
1818	\N	Enarotali	EWI
1819	\N	Newton	EWK
1820	\N	New Bern	EWN
1821	\N	Ewo	EWO
1822	\N	Excursion Inlet	EXI
1823	\N	Exmouth Gulf	EXM
1824	\N	Exeter	EXT
1825	\N	Yelimane	EYL
1826	\N	Yerington	EYR
1827	\N	Eliye Springs	EYS
1828	\N	Key West	EYW
1829	\N	Faranah	FAA
1830	\N	Farnborough	FAB
1831	\N	Faaite	FAC
1832	\N	Sorvágur	FAE
1833	\N	Fort Eustis	FAF
1834	\N	Fagurholsmyri	FAG
1835	\N	Farah	FAH
1836	\N	Fairbanks	FAI
1837	\N	Fajardo	FAJ
1838	\N	False Island	FAK
1839	\N	Roma	FAL
1840	\N	Farmington	FAM
1841	\N	Faro	FAO
1842	\N	Freida River	FAQ
1843	\N	Faskrudsfjordur	FAS
1844	\N	Fresno	FAT
1845	\N	Fayetteville	FAY
1846	\N	Fasa	FAZ
1847	\N	Faizabad	FBD
1848	\N	Francisco Beltrao	FBE
1849	\N	Faribault	FBL
1850	\N	Fort Bridger	FBR
1851	\N	Fairbury	FBY
1852	\N	Kalispell	FCA
1853	\N	Ficksburg	FCB
1854	\N	Cuxhaven	FCN
1855	\N	Forrest City	FCY
1856	\N	Forde	FDE
1857	\N	Fort De France	FDF
1858	\N	Friedrichshafen	FDH
1859	\N	Frederick	FDK
1860	\N	Frederick	FDR
1861	\N	Bandundu	FDU
1862	\N	Findlay	FDY
1863	\N	Fetlar	FEA
1864	\N	Sanfebagar	FEB
1865	\N	Feira De Santana	FEC
1866	\N	Fergana	FEG
1867	\N	Feijo	FEJ
1868	\N	Ferkessedougou	FEK
1869	\N	Fuerstenfeldbruck	FEL
1870	\N	Freeport	FEP
1871	\N	San Fernando	FES
1872	\N	Fremont	FET
1873	\N	Fez	FEZ
1874	\N	Kill Devil Hills	FFA
1875	\N	Fairford	FFD
1876	\N	Fairfield	FFL
1877	\N	Fergus Falls	FFM
1878	\N	Frankfort	FFT
1879	\N	Futaleufu	FFU
1880	\N	Fderik	FGD
1881	\N	Fox Glacier	FGL
1882	\N	Fuengirola	FGR
1883	\N	Sierra Vista	FHU
1884	\N	Fire Cove	FIC
1885	\N	Fishers Island	FID
1886	\N	Fair Isle	FIE
1887	\N	Fria	FIG
1888	\N	Finke	FIK
1889	\N	Fillmore	FIL
1890	\N	Finschhafen	FIN
1891	\N	Five Finger Coast Guard Heliport	FIV
1892	\N	Fitzroy Crossing	FIZ
1893	\N	Al-fujairah	FJR
1894	\N	Fukui	FKJ
1895	\N	Franklin	FKN
1896	\N	Florencia	FLA
1897	\N	Floriano	FLB
1898	\N	Falls Creek	FLC
1899	\N	Fond Du Lac	FLD
1900	\N	Flensburg	FLF
1901	\N	Flotta	FLH
1902	\N	Flateyri	FLI
1903	\N	Falls Bay	FLJ
1904	\N	Fort Lauderdale	FLL
1905	\N	Filadelfia	FLM
1906	\N	Florianopolis	FLN
1907	\N	Flippin	FLP
1908	\N	Flinders Island	FLS
1909	\N	Flat	FLT
1910	\N	Fort Leavenworth	FLV
1911	\N	Finley	FLY
1912	\N	Formosa	FMA
1913	\N	Five Mile	FMC
1914	\N	Fort Meade	FME
1915	\N	Flamingo	FMG
1916	\N	Falmouth	FMH
1917	\N	Kalemie	FMI
1918	\N	Farmington	FMN
1919	\N	Greven	FMO
1920	\N	Fort Madison	FMS
1921	\N	Fort Myers	FMY
1922	\N	Freetown	FNA
1923	\N	Neubrandenburg	FNB
1924	\N	Funchal	FNC
1925	\N	Fane	FNE
1926	\N	Fada Ngourma	FNG
1927	\N	Fincha	FNH
1928	\N	Pyongyang	FNJ
1929	\N	Fin Creek	FNK
1930	\N	Fort Collins	FNL
1931	\N	Funter Bay	FNR
1932	\N	Flint	FNT
1933	\N	Foula	FOA
1934	\N	Fort Bragg	FOB
1935	\N	Fuzhou	FOC
1936	\N	Foggia	FOG
1937	\N	Westhampton	FOK
1938	\N	Foumban	FOM
1939	\N	Numfoor	FOO
1940	\N	Forest Park	FOP
1941	\N	Fortaleza	FOR
1942	\N	Forrest	FOS
1943	\N	Forster	FOT
1944	\N	Fougamou	FOU
1945	\N	Fox	FOX
1946	\N	Foya	FOY
1947	\N	Freeport	FPO
1948	\N	Fort Pierce	FPR
1949	\N	Perry	FPY
1950	\N	Frankfurt	FRA
1951	\N	Forbes	FRB
1952	\N	Franca	FRC
1953	\N	Friday Harbor	FRD
1954	\N	Farmingdale	FRG
1955	\N	French Lick	FRH
1956	\N	Fort Riley	FRI
1957	\N	Fregate Island	FRK
1958	\N	Forli	FRL
1959	\N	Fairmont	FRM
1960	\N	Fort Richardson	FRN
1961	\N	Floro	FRO
1962	\N	Fresh Water Bay	FRP
1963	\N	Feramin	FRQ
1964	\N	Front Royal	FRR
1965	\N	Flores	FRS
1966	\N	Frutillar	FRT
1967	\N	Fryeburg	FRY
1968	\N	Fritzlar	FRZ
1969	\N	Sioux Falls	FSD
1970	\N	Fort Sill	FSI
1971	\N	Fort Scott	FSK
1972	\N	Fossil Downs	FSL
1973	\N	Fort Smith	FSM
1974	\N	Fort Sheridan	FSN
1975	\N	Forres	FSS
1976	\N	Fort Stockton	FST
1977	\N	Fort Sumner	FSU
1978	\N	El Calafate	FTE
1979	\N	Fitiuta	FTI
1980	\N	Fort Knox	FTK
1981	\N	Fortuna Ledge	FTL
1982	\N	Fort Dauphin	FTU
1983	\N	Fort Worth	FTW
1984	\N	Owando	FTX
1985	\N	Fulleborn	FUB
1986	\N	Puerto del Rosario	FUE
1987	\N	Fuyang	FUG
1988	\N	Fukue	FUJ
1989	\N	Fukuoka	FUK
1990	\N	Fullerton	FUL
1991	\N	Fuma	FUM
1992	\N	Fuoshan	FUO
1993	\N	Flora Valley	FVL
1994	\N	Forrest River	FVR
1995	\N	Fort Wayne	FWA
1996	\N	Farewell	FWL
1997	\N	Fort William	FWM
1998	\N	Flaxman Island	FXM
1999	\N	Cuamba	FXO
2000	\N	Forest City	FXY
2001	\N	Fayetteville	FYM
2002	\N	Faya	FYT
2003	\N	Fayetteville	FYV
2004	\N	Guamal	GAA
2005	\N	Gabbs	GAB
2006	\N	Gracias	GAC
2007	\N	Gadsden	GAD
2008	\N	Gabes	GAE
2009	\N	Gafsa	GAF
2010	\N	Gage	GAG
2011	\N	Gayndah	GAH
2012	\N	Gaithersburg	GAI
2013	\N	Yamagata	GAJ
2014	\N	Gakona	GAK
2015	\N	Gambell	GAM
2016	\N	Gan Island	GAN
2017	\N	Guantanamo	GAO
2018	\N	Gusap	GAP
2019	\N	Gao	GAQ
2020	\N	Garaina	GAR
2021	\N	Garissa	GAS
2022	\N	Gap	GAT
2023	\N	Gawahati	GAU
2024	\N	Gag Island	GAV
2025	\N	Gangaw	GAW
2026	\N	Gamba	GAX
2027	\N	Gaya	GAY
2028	\N	Guasopa	GAZ
2029	\N	Big Bay	GBA
2030	\N	Gasuke	GBC
2031	\N	Gaborone	GBE
2032	\N	Negarbo	GBF
2033	\N	Galesburg	GBG
2034	\N	Galbraith Lake	GBH
2035	\N	Grand Bahama	GBI
2036	\N	Marie Galante	GBJ
2037	\N	Gbangbatok	GBK
2038	\N	Goulburn Island	GBL
2039	\N	Garbaharey	GBM
2040	\N	San Giovanni Rotondo	GBN
2041	\N	Gamboola	GBP
2042	\N	Great Barrington	GBR
2043	\N	Port Fitzroy	GBS
2044	\N	Khashm El Girba	GBU
2045	\N	Gibb River	GBV
2046	\N	Guacamaya	GCA
2047	\N	Gillette	GCC
2048	\N	Gachsaran	GCH
2049	\N	Guernsey	GCI
2050	\N	Gravatai	GCV
2051	\N	Greenville	GCY
2052	\N	Gounda	GDA
2053	\N	Gordon Downs	GDD
2054	\N	Magdagachi	GDG
2055	\N	Golden Horn Lodge	GDH
2056	\N	Gordil	GDI
2057	\N	Gandajika	GDJ
2058	\N	Gardner	GDM
2059	\N	Gdansk	GDN
2060	\N	Guasdualito	GDO
2061	\N	Guadalupe	GDP
2062	\N	Gondar	GDQ
2063	\N	Gladwin	GDW
2064	\N	Magadan	GDX
2065	\N	Gelendzik	GDZ
2066	\N	Gebe	GEB
2067	\N	Gecitkale	GEC
2068	\N	Georgetown	GED
2069	\N	George Town	GEE
2070	\N	Geva	GEF
2071	\N	Green Islands	GEI
2072	\N	Ganes Creek	GEK
2073	\N	Santo Angelo	GEL
2074	\N	Nueva Gerona	GER
2075	\N	Gewoia	GEW
2076	\N	Greybull	GEY
2077	\N	Togiak Fish	GFB
2078	\N	Greenfield	GFD
2079	\N	Grenfell	GFE
2080	\N	Glens Falls	GFL
2081	\N	Bartica	GFO
2082	\N	Granville	GFR
2083	\N	Grootfontein	GFY
2084	\N	Lumbala	GGC
2085	\N	Gregory Downs	GGD
2086	\N	Georgetown	GGE
2087	\N	Gilgal	GGL
2088	\N	Gagnoa	GGN
2089	\N	Guiglo	GGO
2090	\N	Garoe	GGR
2091	\N	Gobernador Gregores	GGS
2092	\N	Ghardaïa	GHA
2093	\N	Great Harbour	GHC
2094	\N	Garachine	GHE
2095	\N	Giebelstadt	GHF
2096	\N	Centerville	GHM
2097	\N	Guanghan	GHN
2098	\N	Ghat	GHT
2099	\N	Gualeguaychu	GHU
2100	\N	Gibraltar	GIB
2101	\N	Boigu Island	GIC
2102	\N	Gitega	GID
2103	\N	Winter Haven	GIF
2104	\N	Siguiri	GII
2105	\N	Gilgit	GIL
2106	\N	Miele Mimbale	GIM
2107	\N	Girardot	GIR
2108	\N	Gisborne	GIS
2109	\N	Geita	GIT
2110	\N	Giyani	GIY
2111	\N	Jazan	GIZ
2112	\N	Guanaja	GJA
2113	\N	Guajara-Mirim	GJM
2114	\N	Gjogur	GJR
2115	\N	Grand Junction	GJT
2116	\N	Goroka	GKA
2117	\N	Geilenkirchen	GKE
2118	\N	Gorkha	GKH
2119	\N	Great Keppel Island	GKL
2120	\N	Gulkana	GKN
2121	\N	Kongoboumba	GKO
2122	\N	Gatlinburg	GKT
2123	\N	Glasgow	GLA
2124	\N	Geladi	GLC
2125	\N	Goodland	GLD
2126	\N	Gainesville	GLE
2127	\N	Golfito	GLF
2128	\N	Glengyle	GLG
2129	\N	Glen Innes	GLI
2130	\N	Galcaio	GLK
2131	\N	Gol	GLL
2132	\N	Glenormiston	GLM
2133	\N	Goulimime	GLN
2134	\N	Gloucester	GLO
2135	\N	Gulgubip	GLP
2136	\N	Glennallen	GLQ
2137	\N	Gaylord	GLR
2138	\N	Galveston	GLS
2139	\N	Gladstone	GLT
2140	\N	Golovin	GLV
2141	\N	Glasgow	GLW
2142	\N	Goldsworthy	GLY
2143	\N	Breda	GLZ
2144	\N	Gemena	GMA
2145	\N	Gambela	GMB
2146	\N	Guerima	GMC
2147	\N	Gomel	GME
2148	\N	Gasmata Island	GMI
2149	\N	Gamboma	GMM
2150	\N	Greymouth	GMN
2151	\N	Guimaraes	GMS
2152	\N	Granite Mountain	GMT
2153	\N	Monument Valley Gldngs	GMV
2154	\N	San Sebas De La Gomera	GMZ
2155	\N	Grodna	GNA
2156	\N	Gooding	GNG
2157	\N	Green Island	GNI
2158	\N	Guanambi	GNM
2159	\N	Ghinnir	GNN
2160	\N	General Roca	GNR
2161	\N	Gunungsitoli	GNS
2162	\N	Grants	GNT
2163	\N	Gainesville	GNV
2164	\N	Ghanzi	GNZ
2165	\N	Genova	GOA
2166	\N	Goba	GOB
2167	\N	Gora	GOC
2168	\N	Gonalia	GOE
2169	\N	Gobabis	GOG
2170	\N	Nuuk	GOH
2171	\N	Goa	GOI
2172	\N	Nizhniy Novgorod	GOJ
2173	\N	Guthrie	GOK
2174	\N	Gold Beach	GOL
2175	\N	Goma	GOM
2176	\N	New London	GON
2177	\N	Goondiwindi	GOO
2178	\N	Gorakhpur	GOP
2179	\N	Golmud	GOQ
2180	\N	Gore	GOR
2181	\N	Gosford	GOS
2182	\N	Gothenburg	GOT
2183	\N	Garoua	GOU
2184	\N	Gove	GOV
2185	\N	Gal Oya	GOY
2186	\N	Gorna Oriahovitsa	GOZ
2187	\N	Patras	GPA
2188	\N	Guarapuava	GPB
2189	\N	Guapi	GPI
2190	\N	Guapiles	GPL
2191	\N	Garden Point	GPN
2192	\N	General Pico	GPO
2193	\N	Grand Rapids	GPZ
2194	\N	Galion	GQQ
2195	\N	Gamarra	GRA
2196	\N	Green Bay	GRB
2197	\N	Grand Cess	GRC
2198	\N	Greenwood	GRD
2199	\N	Greenville	GRE
2200	\N	Gardez	GRG
2201	\N	Garuahi	GRH
2202	\N	Grand Island	GRI
2203	\N	George	GRJ
2204	\N	Garasa	GRL
2205	\N	Grand Marais	GRM
2206	\N	Gordon	GRN
2207	\N	Gurupi	GRP
2208	\N	Groningen	GRQ
2209	\N	Grosseto	GRS
2210	\N	Gujrat	GRT
2211	\N	Groznyj	GRV
2212	\N	Granada	GRX
2213	\N	Grimsey	GRY
2214	\N	Graz	GRZ
2215	\N	Long Pasia	GSA
2216	\N	Goldsboro	GSB
2217	\N	Gascoyne Junction	GSC
2218	\N	Goshen	GSH
2219	\N	Guadalcanal	GSI
2220	\N	Taltheilei Narrows	GSL
2221	\N	Mount Gunson	GSN
2222	\N	Greensboro	GSO
2223	\N	Shark Elowainat	GSQ
2224	\N	Gardo	GSR
2225	\N	Sabi Sabi	GSS
2226	\N	Gedaref	GSU
2227	\N	Grimsby	GSY
2228	\N	Genting	GTB
2229	\N	Green Turtle	GTC
2230	\N	Great Falls	GTF
2231	\N	Grantsburg	GTG
2232	\N	Guettin	GTI
2233	\N	Sungei Tekai	GTK
2234	\N	Gorontalo	GTO
2235	\N	Granites	GTS
2236	\N	Georgetown	GTT
2237	\N	Zlin	GTW
2238	\N	Gettysburg	GTY
2239	\N	Guatemala City	GUA
2240	\N	Guerrero Negro	GUB
2241	\N	Goundam	GUD
2242	\N	Guriaso	GUE
2243	\N	Gulf Shores	GUF
2244	\N	Guari	GUG
2245	\N	Gunnedah	GUH
2246	\N	Guiria	GUI
2247	\N	Guaratingueta	GUJ
2248	\N	Goulburn	GUL
2249	\N	Agana	GUM
2250	\N	Gualaco	GUO
2251	\N	Gallup	GUP
2252	\N	Guanare	GUQ
2253	\N	Guetersloh	GUT
2254	\N	Grundarfjordur	GUU
2255	\N	Mougulu	GUV
2256	\N	Atyrau	GUW
2257	\N	Guna	GUX
2258	\N	Guymon	GUY
2259	\N	Geneva	GVA
2260	\N	Gordonsville	GVE
2261	\N	Green River	GVI
2262	\N	Gainesville	GVL
2263	\N	Greenvale	GVP
2264	\N	Governador Valadares	GVR
2265	\N	Greenville	GVT
2266	\N	Grandview	GVW
2267	\N	Gavle	GVX
2268	\N	Gwa	GWA
2269	\N	Gwadar	GWD
2270	\N	Gweru	GWE
2271	\N	Gwalior	GWL
2272	\N	Gnarowein	GWN
2273	\N	Greenwood	GWO
2274	\N	Glenwood Springs	GWS
2275	\N	Westerland	GWT
2276	\N	Glendale	GWV
2277	\N	Galway	GWY
2278	\N	Seiyun	GXF
2279	\N	Negage	GXG
2280	\N	Coyhaique	GXQ
2281	\N	Yagoua	GXX
2282	\N	Greeley	GXY
2283	\N	Guayaramerin	GYA
2284	\N	Guayaquil	GYE
2285	\N	Gisenyi	GYI
2286	\N	Guaymas	GYM
2287	\N	Gympie	GYP
2288	\N	Goodyear	GYR
2289	\N	Guang Yuan	GYS
2290	\N	Rafah	GZA
2291	\N	Ghazni	GZI
2292	\N	Gozo	GZM
2293	\N	Gizo	GZO
2294	\N	Gaziantep	GZT
2295	\N	Ghazvin	GZW
2296	\N	Hasvik	HAA
2297	\N	Hamilton	HAB
2298	\N	Halmstad	HAD
2299	\N	Havasupai	HAE
2300	\N	Half Moon	HAF
2301	\N	The Hague	HAG
2302	\N	Three Rivers	HAI
2303	\N	Haikou	HAK
2304	\N	Halali	HAL
2305	\N	Hamburg	HAM
2306	\N	Hanoi	HAN
2307	\N	Hamilton	HAO
2308	\N	Hail	HAS
2309	\N	Heathlands	HAT
2310	\N	Haugesund	HAU
2311	\N	Havana	HAV
2312	\N	Haverfordwest	HAW
2313	\N	Haycock	HAY
2314	\N	Hatzfeldthaven	HAZ
2315	\N	Hobart	HBA
2316	\N	Hanus Bay	HBC
2317	\N	Habi	HBD
2318	\N	Hobart Bay	HBH
2319	\N	Harbour Island	HBI
2320	\N	Phu-bon	HBN
2321	\N	Humboldt	HBO
2322	\N	Hobart	HBR
2323	\N	Big Spring	HCA
2324	\N	Shoal Cove	HCB
2325	\N	Hudson	HCC
2326	\N	Eil	HCM
2327	\N	Hengchun	HCN
2328	\N	Halls Creek	HCQ
2329	\N	Cheraw	HCW
2330	\N	Hidden Falls	HDA
2331	\N	Heidelberg	HDB
2332	\N	Holdrege	HDE
2333	\N	Oahu	HDH
2334	\N	Hamadan	HDM
2335	\N	Havadarya	HDR
2336	\N	Hat Yai	HDY
2337	\N	Herat	HEA
2338	\N	Henzada	HEB
2339	\N	Herendeen	HED
2340	\N	Helena	HEE
2341	\N	Heide-Buesum	HEI
2342	\N	Helsinki	HEL
2343	\N	Haelogo	HEO
2344	\N	Heraklion	HER
2345	\N	Hermiston	HES
2346	\N	Huelva	HEV
2347	\N	Natchez	HEZ
2348	\N	Haifa	HFA
2349	\N	Hefei (Luogang Airport)	HFE
2350	\N	Hoffman	HFF
2351	\N	Hornafjordur	HFN
2352	\N	Hagfors	HFS
2353	\N	Hammerfest	HFT
2354	\N	Hargeisa	HGA
2355	\N	Hughenden	HGD
2356	\N	Hangzhou	HGH
2357	\N	Higlieg	HGI
2358	\N	Helgoland	HGL
2359	\N	Korhogo	HGO
2360	\N	Jolon	HGT
2361	\N	Hogatza	HGZ
2362	\N	Hachinohe	HHE
2363	\N	Wahiawa	HHI
2364	\N	Hawthorne	HHR
2365	\N	Horn Island	HID
2366	\N	Whitefield	HIE
2367	\N	Highbury	HIG
2368	\N	Hook Island	HIH
2369	\N	Lake Havasu City	HII
2370	\N	Hiroshima	HIJ
2371	\N	Shillavo	HIL
2372	\N	Hingurakgoda	HIM
2373	\N	Jinju	HIN
2374	\N	Hillsboro	HIO
2375	\N	Headingly	HIP
2376	\N	Honiara	HIR
2377	\N	Hivaro	HIT
2378	\N	Khajuraho	HJR
2379	\N	Khujirt	HJT
2380	\N	Healy Lake	HKB
2381	\N	Hakodate	HKD
2382	\N	Hong Kong	HKG
2383	\N	Hokitika	HKK
2384	\N	Phuket	HKT
2385	\N	Haskovo	HKV
2386	\N	Hickory	HKY
2387	\N	Batesville	HLB
2388	\N	Hill City	HLC
2389	\N	Hultsfred	HLF
2390	\N	Wheeling	HLG
2391	\N	Ulanhot	HLH
2392	\N	Hollister	HLI
2393	\N	Hillside	HLL
2394	\N	Holland	HLM
2395	\N	Helena	HLN
2396	\N	St Helens	HLS
2397	\N	Hamilton	HLT
2398	\N	Houailou	HLU
2399	\N	Helenvale	HLV
2400	\N	Hluhluwe	HLW
2401	\N	Holyhead	HLY
2402	\N	Khanty-Mansiysk	HMA
2403	\N	Hermannsburg	HMG
2404	\N	Hami	HMI
2405	\N	Khmelnitskiy	HMJ
2406	\N	Hermosillo	HMO
2407	\N	Hamar	HMR
2408	\N	Hemet	HMT
2409	\N	Hemavan	HMV
2410	\N	Hanamaki	HNA
2411	\N	Huntingburg	HNB
2412	\N	Hatteras	HNC
2413	\N	Tahneta Pass Lodge	HNE
2414	\N	Hienghene	HNG
2415	\N	Hoonah	HNH
2416	\N	Heiweni	HNI
2417	\N	Hana	HNM
2418	\N	Honinabi	HNN
2419	\N	Hanna	HNX
2420	\N	Hengyang	HNY
2421	\N	Hola	HOA
2422	\N	Komako	HOC
2423	\N	Hodeidah	HOD
2424	\N	Houeisay	HOE
2425	\N	Holguin	HOG
2426	\N	Hohenems	HOH
2427	\N	Hooker Creek	HOK
2428	\N	Holikachu	HOL
2429	\N	Quanduc	HOO
2430	\N	Hopkinsville	HOP
2431	\N	Hof	HOQ
2432	\N	Horta	HOR
2433	\N	Chos Malal	HOS
2434	\N	Hot Springs	HOT
2435	\N	Fort Kobbe	HOW
2436	\N	Homalin	HOX
2437	\N	Hoy Island	HOY
2438	\N	Hope Vale	HPE
2439	\N	Haiphong	HPH
2440	\N	Hampton	HPT
2441	\N	Baytown	HPY
2442	\N	Hoquiam	HQM
2443	\N	Mansehra	HRA
2444	\N	Harbin	HRB
2445	\N	Zhairem	HRC
2446	\N	Harare	HRE
2447	\N	Hurghada	HRG
2448	\N	Chaurjhari	HRJ
2449	\N	Kharkov	HRK
2450	\N	Heron Island	HRN
2451	\N	Herrera	HRR
2452	\N	Harrismith	HRS
2453	\N	Harrogate	HRT
2454	\N	Henbury	HRY
2455	\N	Horizontina	HRZ
2456	\N	Harrisburg	HSB
2457	\N	Shaoguan	HSC
2458	\N	Saga	HSG
2459	\N	Hastings	HSI
2460	\N	Huesca	HSK
2461	\N	Horsham	HSM
2462	\N	Zhoushan	HSN
2463	\N	Hot Springs	HSP
2464	\N	Hissar	HSS
2465	\N	Homestead	HST
2466	\N	Hsinchu	HSZ
2467	\N	Chita	HTA
2468	\N	Terre-de-Bas	HTB
2469	\N	Hawthorne	HTH
2470	\N	Houghton	HTL
2471	\N	Khatgal	HTM
2472	\N	Hotan	HTN
2473	\N	East Hampton	HTO
2474	\N	Hateruma	HTR
2475	\N	Huntington	HTS
2476	\N	Hopetoun	HTU
2477	\N	Huntington	HTW
2478	\N	Hato Corozal	HTZ
2479	\N	Humbert River	HUB
2480	\N	Humacao	HUC
2481	\N	Humboldt	HUD
2482	\N	Humera	HUE
2483	\N	Terre Haute	HUF
2484	\N	Huehuetenango	HUG
2485	\N	Huahine	HUH
2486	\N	Hue	HUI
2487	\N	Hugo	HUJ
2488	\N	Hukuntsi	HUK
2489	\N	Houlton	HUL
2490	\N	Houma	HUM
2491	\N	Hualien	HUN
2492	\N	Houn	HUQ
2493	\N	Hughes	HUS
2494	\N	Hutchinson	HUT
2495	\N	Huanuco	HUU
2496	\N	Hudiksvall	HUV
2497	\N	Huatulco	HUX
2498	\N	Humberside	HUY
2499	\N	Huizhou	HUZ
2500	\N	Analalava	HVA
2501	\N	Hervey Bay	HVB
2502	\N	Khovd	HVD
2503	\N	Hanksville	HVE
2504	\N	Honningsvag	HVG
2505	\N	Holmavik	HVK
2506	\N	Havre	HVR
2507	\N	Hartsville	HVS
2508	\N	Hawabango	HWA
2509	\N	Hayward	HWD
2510	\N	Hawk Inlet	HWI
2511	\N	Hawker	HWK
2512	\N	Hwange Nat Park	HWN
2513	\N	Hollywood	HWO
2514	\N	Hay	HXX
2515	\N	Hyannis	HYA
2516	\N	High Wycombe	HYC
2517	\N	Hyderabad	HYD
2518	\N	Hayfields	HYF
2519	\N	Hollis	HYL
2520	\N	Taizhou	HYN
2521	\N	Hayward	HYR
2522	\N	Hays	HYS
2523	\N	Hyvinkaa	HYV
2524	\N	Hazebrouck	HZB
2525	\N	Hanzhong	HZG
2526	\N	Liping City	HZH
2527	\N	Husavik	HZK
2528	\N	Hazleton	HZL
2529	\N	Hazyview	HZV
2530	\N	Igarka	IAA
2531	\N	Niagara Falls	IAG
2532	\N	In Amenas	IAM
2533	\N	Kiana	IAN
2534	\N	Bahregan	IAQ
2535	\N	Iaura	IAU
2536	\N	Ibadan	IBA
2537	\N	Ibague	IBE
2538	\N	Iboki	IBI
2539	\N	Indigo Bay Lodge	IBL
2540	\N	Ibo	IBO
2541	\N	Iberia	IBP
2542	\N	Ibiza	IBZ
2543	\N	Icabaru	ICA
2544	\N	Cicia	ICI
2545	\N	Nieuw Nickerie	ICK
2546	\N	Clarinda	ICL
2547	\N	Sicogon Island	ICO
2548	\N	Nicaro	ICR
2549	\N	Wichita	ICT
2550	\N	Icy Bay	ICY
2551	\N	Idre	IDB
2552	\N	Ila Da Chilonzuene	IDC
2553	\N	Idiofa	IDF
2554	\N	Ida Grove	IDG
2555	\N	Indiana	IDI
2556	\N	Indulkana	IDK
2557	\N	Indagen	IDN
2558	\N	Santa Isabel Do Morro	IDO
2559	\N	Independence	IDP
2560	\N	Zielona Gora	IEG
2561	\N	Iejima	IEJ
2562	\N	Riesa	IES
2563	\N	Iowa Falls	IFA
2564	\N	Iffley	IFF
2565	\N	Hesa	IFH
2566	\N	Isafjordur	IFJ
2567	\N	Innisfail	IFL
2568	\N	Isfahan	IFN
2569	\N	Ivano-Frankovsk	IFO
2570	\N	Bullhead City	IFP
2571	\N	Inagua	IGA
2572	\N	Ingeniero Jacobacci	IGB
2573	\N	Iguela	IGE
2574	\N	Ingham	IGH
2575	\N	Iligan	IGN
2576	\N	Chigorodo	IGO
2577	\N	Ingolstadt-manching	IGS
2578	\N	Iguassu Falls	IGU
2579	\N	Niihama	IHA
2580	\N	Inhaca	IHC
2581	\N	Qishn	IHN
2582	\N	Ihosy	IHO
2583	\N	Iran Shahr	IHR
2584	\N	Ihu	IHU
2585	\N	Galloway	IIA
2586	\N	Ilaam	IIL
2587	\N	Nishinoomote	IIN
2588	\N	Nissan Island	IIS
2589	\N	Izhevsk	IJK
2590	\N	Ijui	IJU
2591	\N	Jacksonville	IJX
2592	\N	Wilkesboro	IKB
2593	\N	Iki	IKI
2594	\N	Kankakee	IKK
2595	\N	Ikela	IKL
2596	\N	Inkerman	IKP
2597	\N	Tiksi	IKS
2598	\N	Irkutsk	IKT
2599	\N	Illaga	ILA
2600	\N	Ilha Solteira	ILB
2601	\N	Ilford	ILF
2602	\N	Illisheim	ILH
2603	\N	Iliamna	ILI
2604	\N	Ilaka	ILK
2605	\N	Willmar	ILL
2606	\N	Wilmington	ILM
2607	\N	Wilmington	ILN
2608	\N	Iloilo	ILO
2609	\N	Ile Des Pins	ILP
2610	\N	Ilo	ILQ
2611	\N	Ilorin	ILR
2612	\N	Kilaguni	ILU
2613	\N	Ileg	ILX
2614	\N	Zilina	ILZ
2615	\N	Iamalele	IMA
2616	\N	Imbaimadai	IMB
2617	\N	Imonda	IMD
2618	\N	Imphal	IMF
2619	\N	Inhaminga	IMG
2620	\N	Ine Island	IMI
2621	\N	Simikot	IMK
2622	\N	Imperial	IML
2623	\N	Immokalee	IMM
2624	\N	Imane	IMN
2625	\N	Zemio	IMO
2626	\N	Iron Mountain	IMT
2627	\N	Inta	INA
2628	\N	Chinde	INE
2629	\N	In Guezzam	INF
2630	\N	Lago Argentino	ING
2631	\N	Inhambane	INH
2632	\N	Nis	INI
2633	\N	Injune	INJ
2634	\N	Wink	INK
2635	\N	International Falls	INL
2636	\N	Innamincka	INM
2637	\N	Innsbruck	INN
2638	\N	Inongo	INO
2639	\N	Inisheer	INQ
2640	\N	Indian Springs	INS
2641	\N	Winston Salem	INT
2642	\N	Winslow	INW
2643	\N	Inanwatan	INX
2644	\N	Inyati	INY
2645	\N	Iokea	IOK
2646	\N	Impfondo	ION
2647	\N	Ioma	IOP
2648	\N	Inishmore	IOR
2649	\N	Ilheus	IOS
2650	\N	Ile Ouen	IOU
2651	\N	Iowa City	IOW
2652	\N	Ipota	IPA
2653	\N	Ipil	IPE
2654	\N	Ipiranga	IPG
2655	\N	Ipoh	IPH
2656	\N	Ipiales	IPI
2657	\N	Imperial	IPL
2658	\N	Ipatinga	IPN
2659	\N	Williamsport	IPT
2660	\N	Ipiau	IPU
2661	\N	Ipswich	IPW
2662	\N	Qiemo	IQM
2663	\N	Iquique	IQQ
2664	\N	Iquitos	IQT
2665	\N	Iraan	IRB
2666	\N	Circle	IRC
2667	\N	Ishurdi	IRD
2668	\N	Irece	IRE
2669	\N	Iringa	IRI
2670	\N	La Rioja	IRJ
2671	\N	Kirksville	IRK
2672	\N	Iriona	IRN
2673	\N	Birao	IRO
2674	\N	Isiro	IRP
2675	\N	Sturgis	IRS
2676	\N	Islamabad	ISB
2677	\N	Iscuande	ISD
2678	\N	Isparta	ISE
2679	\N	Ishigaki	ISG
2680	\N	Ischia	ISH
2681	\N	Isisford	ISI
2682	\N	Isla Mujeres	ISJ
2683	\N	Nasik	ISK
2684	\N	Isabel Pass	ISL
2685	\N	Kissimmee	ISM
2686	\N	Kinston	ISO
2687	\N	Manistique	ISQ
2688	\N	Wiscasset	ISS
2689	\N	Istanbul	IST
2690	\N	Wisconsin Rapids	ISW
2691	\N	Itacoatiara	ITA
2692	\N	Itubera	ITE
2693	\N	Itambacuri	ITI
2694	\N	Itokama	ITK
2695	\N	Itabuna	ITN
2696	\N	Itaperuna	ITP
2697	\N	Itaqui	ITQ
2698	\N	Itumbiara	ITR
2699	\N	Niue Island	IUE
2700	\N	Ilu	IUL
2701	\N	Summit Lake	IUM
2702	\N	Inus	IUS
2703	\N	Ambanja	IVA
2704	\N	Invercargill	IVC
2705	\N	Berane	IVG
2706	\N	Ivishak	IVH
2707	\N	Ivalo	IVL
2708	\N	Chivolo	IVO
2709	\N	Inverell	IVR
2710	\N	Inverway	IVW
2711	\N	Ivanova	IWA
2712	\N	Iwami	IWJ
2713	\N	Iwo Jima Vol	IWO
2714	\N	Agartala	IXA
2715	\N	Bagdogra	IXB
2716	\N	Chandigarh	IXC
2717	\N	Allahabad	IXD
2718	\N	Mangalore	IXE
2719	\N	Belgaum	IXG
2720	\N	Kailashahar	IXH
2721	\N	Lilabari	IXI
2722	\N	Jammu	IXJ
2723	\N	Keshod	IXK
2724	\N	Leh	IXL
2725	\N	Khowai	IXN
2726	\N	Pathankot	IXP
2727	\N	Kamalpur	IXQ
2728	\N	Pasighat	IXT
2729	\N	Aurangabad	IXU
2730	\N	Along	IXV
2731	\N	Jamshedpur	IXW
2732	\N	Kandla	IXY
2733	\N	Port Blair	IXZ
2734	\N	Izmir	IZM
2735	\N	Izumo	IZO
2736	\N	Ixtepec	IZT
2737	\N	Jalalabad	JAA
2738	\N	Jabiru	JAB
2739	\N	Jaffna	JAF
2740	\N	Jacobabad	JAG
2741	\N	Jaipur	JAI
2742	\N	Jacmel	JAK
2743	\N	Jambol	JAM
2744	\N	Jackson	JAN
2745	\N	Punta Renes	JAP
2746	\N	Jacquinot Bay	JAQ
2747	\N	Jahrom	JAR
2748	\N	Jasper	JAS
2749	\N	Jabot	JAT
2750	\N	Jauja	JAU
2751	\N	Berkeley	JBK
2752	\N	Pleasanton	JBS
2753	\N	Jacobina	JCM
2754	\N	Comino	JCO
2755	\N	Jacareacanga	JCR
2756	\N	Junction	JCT
2757	\N	Ceuta	JCU
2758	\N	Johnson	JCY
2759	\N	John Day	JDA
2760	\N	Jodhpur	JDH
2761	\N	Jordan	JDN
2762	\N	Downey	JDY
2763	\N	Jingdezhen	JDZ
2764	\N	Jeddah	JED
2765	\N	Jeremie	JEE
2766	\N	Jefferson City	JEF
2767	\N	Aasiaat	JEG
2768	\N	Jeh	JEJ
2769	\N	Emeryville	JEM
2770	\N	Jequie	JEQ
2771	\N	Fremantle	JFM
2772	\N	Jefferson	JFN
2773	\N	Paamiut	JFR
2774	\N	Jamnagar	JGA
2775	\N	Jagdalpur	JGB
2776	\N	Geoje	JGE
2777	\N	Jiayuguan	JGN
2778	\N	Groennedal	JGR
2779	\N	Jinghong	JHG
2780	\N	Sisimiut	JHS
2781	\N	Jamestown	JHW
2782	\N	Juina	JIA
2783	\N	Djibouti	JIB
2784	\N	Jijiga	JIJ
2785	\N	Jilin	JIL
2786	\N	Jimma	JIM
2787	\N	Jinja	JIN
2788	\N	Jipijapa	JIP
2789	\N	Jiri	JIR
2790	\N	Jiujiang	JIU
2791	\N	Jiwani	JIW
2792	\N	Juanjui	JJI
2793	\N	Jinjiang	JJN
2794	\N	Jonkoping	JKG
2795	\N	Chios	JKH
2796	\N	Janakpur	JKR
2797	\N	Jakarta	JKT
2798	\N	Jacksonville	JKV
2799	\N	Cooper Lodge	JLA
2800	\N	Landskrona	JLD
2801	\N	Arlington Heights	JLH
2802	\N	Jabalpur	JLR
2803	\N	Jales	JLS
2804	\N	Jamba	JMB
2805	\N	Sausalito	JMC
2806	\N	Schaumburg	JMH
2807	\N	Jomsom	JMO
2808	\N	Jiamusi	JMU
2809	\N	Januaria	JNA
2810	\N	Johannesburg	JNB
2811	\N	Jining	JNG
2812	\N	Junin	JNI
2813	\N	Nanortalik	JNN
2814	\N	Newport Beach	JNP
2815	\N	Naxos	JNX
2816	\N	Jinzhou	JNZ
2817	\N	Joensuu	JOE
2818	\N	Yogyakarta	JOG
2819	\N	Port Saint Johns	JOH
2820	\N	Jolo	JOL
2821	\N	Njombe	JOM
2822	\N	Johnston Island	JON
2823	\N	Josephstaal	JOP
2824	\N	Jos	JOS
2825	\N	Joliet	JOT
2826	\N	Pasadena	JPD
2827	\N	Ji-Parana	JPR
2828	\N	Qaarsut	JQA
2829	\N	Jaque	JQE
2830	\N	Jorhat	JRH
2831	\N	Arsuk	JRK
2832	\N	Juruena	JRN
2833	\N	Kilimanjaro	JRO
2834	\N	Jerusalem	JRS
2835	\N	Jaisalmer	JSA
2836	\N	Stratford	JSD
2837	\N	Jose De San Martin	JSM
2838	\N	Sodertalje	JSO
2839	\N	Jessore	JSR
2840	\N	Jatai	JTI
2841	\N	Thousand Oaks	JTO
2842	\N	Juara	JUA
2843	\N	Juist	JUI
2844	\N	Jujuy	JUJ
2845	\N	Juliaca	JUL
2846	\N	Jumla	JUM
2847	\N	Jundah	JUN
2848	\N	Jurado	JUO
2849	\N	Jurien Bay	JUR
2850	\N	Juticalpa	JUT
2851	\N	Ankavandra	JVA
2852	\N	Manville	JVI
2853	\N	Janesville	JVL
2854	\N	Jwaneng	JWA
2855	\N	Zanjan	JWN
2856	\N	Jiroft	JYR
2857	\N	Jyvaskyla	JYV
2858	\N	Song Pan	JZH
2859	\N	Kasama	KAA
2860	\N	Kariba	KAB
2861	\N	Kameshli	KAC
2862	\N	Kaduna	KAD
2863	\N	Kake	KAE
2864	\N	Karato	KAF
2865	\N	Gangneung	KAG
2866	\N	Kaieteur	KAI
2867	\N	Kajaani	KAJ
2868	\N	Kar	KAK
2869	\N	Kaltag	KAL
2870	\N	Kamaran Island	KAM
2871	\N	Kano	KAN
2872	\N	Kuusamo	KAO
2873	\N	Kapanga	KAP
2874	\N	Kamulai	KAQ
2875	\N	Kamarang	KAR
2876	\N	Karasburg	KAS
2877	\N	Kaitaia	KAT
2878	\N	Kauhava	KAU
2879	\N	Kavanayen	KAV
2880	\N	Kawthaung	KAW
2881	\N	Kalbarri	KAX
2882	\N	Wakaya Island	KAY
2883	\N	Kau	KAZ
2884	\N	Kabala	KBA
2885	\N	Kirkimbie	KBB
2886	\N	Kimberley Downs	KBD
2887	\N	Bell Island	KBE
2888	\N	Karubaga	KBF
2889	\N	Kabalega Falls	KBG
2890	\N	Kalat	KBH
2891	\N	Kribi	KBI
2892	\N	Kings Canyon	KBJ
2893	\N	Klag Bay	KBK
2894	\N	Kabul	KBL
2895	\N	Kabwum	KBM
2896	\N	Kabinda	KBN
2897	\N	Kabalo	KBO
2898	\N	Kasungu	KBQ
2899	\N	Kota Bharu	KBR
2900	\N	Bo	KBS
2901	\N	Kaben	KBT
2902	\N	Kotabaru	KBU
2903	\N	Kambuaya	KBX
2904	\N	Streaky Bay	KBY
2905	\N	Kaikoura	KBZ
2906	\N	Kuqa	KCA
2907	\N	Kasikasima	KCB
2908	\N	Kamur	KCD
2909	\N	Collinsville	KCE
2910	\N	Kuching	KCH
2911	\N	Kon	KCI
2912	\N	Komaio	KCJ
2913	\N	Kirensk	KCK
2914	\N	Kahramanmaras	KCM
2915	\N	Chernofski	KCN
2916	\N	Kocaeli	KCO
2917	\N	Kamenets-podolskiy	KCP
2918	\N	Colorado Creek	KCR
2919	\N	Kings Creek Station	KCS
2920	\N	Koggala	KCT
2921	\N	Masindi	KCU
2922	\N	Kolda	KDA
2923	\N	Kambalda	KDB
2924	\N	Kandi	KDC
2925	\N	Khuzdar	KDD
2926	\N	Koroba	KDE
2927	\N	Kendari	KDI
2928	\N	Kardla	KDL
2929	\N	Kaadedhdhoo	KDM
2930	\N	Ndende	KDN
2931	\N	Kadhdhoo	KDO
2932	\N	Kandep	KDP
2933	\N	Kamberatoro	KDQ
2934	\N	Kandrian	KDR
2935	\N	Kamaran Downs	KDS
2936	\N	Kamphangsaen	KDT
2937	\N	Skardu	KDU
2938	\N	Kandavu	KDV
2939	\N	Kandy	KDW
2940	\N	Mahaweli	KDY
2941	\N	Katugastota	KDZ
2942	\N	Keisah	KEA
2943	\N	Kasenga	KEC
2944	\N	Kaedi	KED
2945	\N	Kelle	KEE
2946	\N	Keglsugl	KEG
2947	\N	Kenmore Air Harbor	KEH
2948	\N	Kepi	KEI
2949	\N	Kemerovo	KEJ
2950	\N	Kiel	KEL
2951	\N	Kemi	KEM
2952	\N	Kenema	KEN
2953	\N	Odienne	KEO
2954	\N	Nepalganj	KEP
2955	\N	Kebar	KEQ
2956	\N	Kerman	KER
2957	\N	Kelsey	KES
2958	\N	Kelly Bar	KEU
2959	\N	Kuorevesi	KEV
2960	\N	Keewaywin	KEW
2961	\N	Kanabea	KEX
2962	\N	Kericho	KEY
2963	\N	Kelaniya	KEZ
2964	\N	Kiffa	KFA
2965	\N	Kalkurung	KFG
2966	\N	Kananga	KGA
2967	\N	Konge	KGB
2968	\N	Karaganda	KGF
2969	\N	Kedougou	KGG
2970	\N	Yongai	KGH
2971	\N	Kalgoorlie	KGI
2972	\N	Karonga	KGJ
2973	\N	New Koliganek	KGK
2974	\N	Kigali	KGL
2975	\N	Kungum	KGM
2976	\N	Kasongo Lunda	KGN
2977	\N	Kirovograd	KGO
2978	\N	Kogalym	KGP
2979	\N	Kulgera	KGR
2980	\N	Kos	KGS
2981	\N	Keningau	KGU
2982	\N	Kagi	KGW
2983	\N	Kingaroy	KGY
2984	\N	Glacier Creek	KGZ
2985	\N	Khaneh	KHA
2986	\N	Kerch	KHC
2987	\N	Khorramabad	KHD
2988	\N	Kherson	KHE
2989	\N	Kaohsiung	KHH
2990	\N	Karachi	KHI
2991	\N	Kauhajoki	KHJ
2992	\N	Khark Island	KHK
2993	\N	Khamti	KHM
2994	\N	Nanchang	KHN
2995	\N	Khoka Moya	KHO
2996	\N	Kharkhorin	KHR
2997	\N	Khasab	KHS
2998	\N	Khost	KHT
2999	\N	Kremenchug	KHU
3000	\N	Khwai River Lodge	KHW
3001	\N	Khoy	KHY
3002	\N	Kauehi	KHZ
3003	\N	Kaiapit	KIA
3004	\N	Ivanof Bay	KIB
3005	\N	King City	KIC
3006	\N	Kristianstad	KID
3007	\N	Kieta	KIE
3008	\N	Koinghaas	KIG
3009	\N	Kibuli	KII
3010	\N	Niigata	KIJ
3011	\N	Kirkuk	KIK
3012	\N	Kilwa	KIL
3013	\N	Kimberley	KIM
3014	\N	Kingston	KIN
3015	\N	Kili Island	KIO
3016	\N	Kira	KIQ
3017	\N	Kithira	KIT
3018	\N	Kiunga	KIU
3019	\N	Chisinau	KIV
3020	\N	Kitwe	KIW
3021	\N	Kilwa	KIY
3022	\N	Kikinonda	KIZ
3023	\N	Krasnojarsk	KJA
3024	\N	Kortrijk	KJK
3025	\N	Kerama	KJP
3026	\N	Kamiraba	KJU
3027	\N	Koyuk	KKA
3028	\N	Kitoi Bay	KKB
3029	\N	Khon Kaen	KKC
3030	\N	Kokoda	KKD
3031	\N	Kagvik Creek	KKF
3032	\N	Konawaruk	KKG
3033	\N	Asaba	ABB
3034	\N	Bandar Mahshahr	MRX
3035	\N	Bardufoss	BDU
3036	\N	Barra	BRR
3037	\N	Barter Island	BTI
3038	\N	Batam	BTH
3039	\N	Beef Island	EIS
3040	\N	Beida	LAQ
3041	\N	Bhamo	BMO
3042	\N	Borlange	BLE
3043	\N	Bucaramanga	BGA
3044	\N	Buckland	BKC
3045	\N	Buffalo	BUF
3046	\N	Bull Harbour	YBH
3047	\N	Burgos	RGS
3048	\N	Cape Barren Island	CBI
3049	\N	Cape Dorset	YTE
3050	\N	Cayman Brac Island	CYB
3051	\N	Charlo	YCL
3052	\N	Chiayi	CYI
3053	\N	Chokurdah	CKH
3054	\N	Christmas Island	XCH
3055	\N	Churchill Falls	ZUM
3056	\N	Ciudad Del Este	AGT
3057	\N	Isle Of Coll	COL
3058	\N	Isle Of Colonsay	CSA
3059	\N	Con Dao	VCS
3060	\N	Contadora	OTD
3061	\N	Corvo Island	CVU
3062	\N	Craig Cove	CCV
3063	\N	Cruzeiro Do Sul	CZS
3064	\N	Curacao	CUR
3065	\N	Dakhla	VIL
3066	\N	Dar Es Salaam	DAR
3067	\N	Dawadmi	DWD
3068	\N	Derby	DRB
3069	\N	Djanet	DJG
3070	\N	Dominica	DOM
3071	\N	Dubbo	DBO
3072	\N	Durango	DRO
3073	\N	Dutch Harbor	DUT
3074	\N	Easter Island	IPC
3075	\N	Eau Claire	EAU
3076	\N	Edmonton	YEA
3077	\N	Eindhoven	EIN
3078	\N	Eirunepe	ERN
3079	\N	Ekwok	KEK
3080	\N	El Bagre	EBG
3081	\N	El Dorado	ELD
3082	\N	El Fasher	ELF
3083	\N	Elba Island	EBA
3084	\N	Enfidha	NBE
3085	\N	Fakahina	FHZ
3086	\N	Fangatau	FGU
3087	\N	Gode	GDE
3088	\N	Gulfport	GPT
3089	\N	Gunnison	GUC
3090	\N	Gyoumri	LWN
3091	\N	Hagerstown	HGR
3092	\N	Hailar	HLD
3093	\N	Sun Valley	SUN
3094	\N	Hamilton Island	HTI
3095	\N	Hanover	HAJ
3096	\N	Hao Island	HOI
3097	\N	Higuero	JBQ
3098	\N	Hikueru	HHZ
3099	\N	Alahsa	HOF
3100	\N	Hooper Bay	HPB
3101	\N	Hoskins	HKN
3102	\N	Houston	HOU
3103	\N	Zhi Jiang	HJJ
3104	\N	Tunxi	TXN
3105	\N	Hubli	HBX
3106	\N	Humaita	HUW
3107	\N	Ibaraki	IBR
3108	\N	Igdir	IGD
3109	\N	Iginniarfik	QFI
3110	\N	Ikerasaarsuk	QRY
3111	\N	Islay	ILY
3112	\N	Kakhonak	KNK
3113	\N	Keng Tung	KET
3114	\N	Kochi	KCZ
3115	\N	Lamacarena	LMC
3116	\N	Belep Island	BMY
3117	\N	Bussellton	BQB
3118	\N	San Carlos DeBariloche	BRC
3119	\N	Buka	BUA
3120	\N	Vilhena	BVH
3121	\N	Bam	BXR
3122	\N	Bayankhongor	BYN
3123	\N	Cold Bay	CDB
3124	\N	Canouan Island	CIW
3125	\N	Cunnamulla	CMA
3126	\N	Neerlerit Inaat	CNP
3127	\N	Choibalsan	COQ
3128	\N	Shahre-kord	CQD
3129	\N	Ciudad Real	CQM
3130	\N	Cap Skirring	CSK
3131	\N	Charleville	CTL
3132	\N	Caye Caulker	CUK
3133	\N	Clovis	CVN
3134	\N	Corazon De Jesus	CZJ
3135	\N	Den Helder	DHR
3136	\N	Antsiranana	DIE
3137	\N	Dali City	DLU
3138	\N	Dobo	DOB
3139	\N	Eastsound	ESD
3140	\N	Shoreham By Sea	ESH
3141	\N	Fernando De Noronha	FEN
3142	\N	St Pierre	FSP
3143	\N	Futuna Island	FUT
3144	\N	Fort Yukon	FYU
3145	\N	Gorgan	GBT
3146	\N	Grand Canyon	GCN
3147	\N	George Town	GGT
3148	\N	Gambier Island	GMR
3149	\N	Galapagos Island	GPS
3150	\N	Gatokae	GTA
3151	\N	Hachijo Jima	HAC
3152	\N	Hanimaadhoo	HAQ
3153	\N	Hoedspruit	HDS
3154	\N	Nauru Island	INU
3155	\N	Isle Of Man	IOM
3156	\N	St Marys, Isles Of Scilly	ISC
3157	\N	Julia Creek	JCK
3158	\N	Jersey	JER
3159	\N	Ikaria Island	JIK
3160	\N	Maniitsoq	JSU
3161	\N	Birch Creek	KBC
3162	\N	Kadanwari	KCF
3163	\N	Kingscote	KGC
3164	\N	Kagau	KGE
3165	\N	Kongiganak	KKH
3166	\N	Lifou	LIF
3167	\N	Hatanga	HTG
3168	\N	Juba	JUB
3169	\N	Kalibo	KLO
3170	\N	Pattaya	UTP
3171	\N	El Paso	ELP
3172	\N	Funafuti Atoll	FUN
3173	\N	Le Touquet	LTQ
3174	\N	Makung	MZG
3175	\N	Mosquera	MQR
3176	\N	Pune	PNQ
3177	\N	Nimes	FNI
3178	\N	Lae	LAE
3179	\N	La Paz	LAP
3180	\N	Ras Al Khaimah	RKT
3181	\N	Santiago	SCU
3182	\N	Gonggar	LXA
3183	\N	Samsun	SZF
3184	\N	Farranfore	KIR
3185	\N	Maulmyine	MNU
3186	\N	Hambantota	HRI
3187	\N	Kalakaket	KKK
3188	\N	Karluk Lake	KKL
3189	\N	Lop Buri	KKM
3190	\N	Kirkenes	KKN
3191	\N	Kaikohe	KKO
3192	\N	Koolburra	KKP
3193	\N	Kaukura Atoll	KKR
3194	\N	Kentland	KKT
3195	\N	Ekuk	KKU
3196	\N	Kikwit	KKW
3197	\N	Kikaiga Shima	KKX
3198	\N	Kilkenny	KKY
3199	\N	Koh Kong	KKZ
3200	\N	Kalabo	KLB
3201	\N	Kaolack	KLC
3202	\N	Tver	KLD
3203	\N	Kaele	KLE
3204	\N	Kaluga	KLF
3205	\N	Kolhapur	KLH
3206	\N	Kota Koli	KLI
3207	\N	Kalokol	KLK
3208	\N	Kelp Bay	KLP
3209	\N	Keluang	KLQ
3210	\N	Kalmar	KLR
3211	\N	Kelso	KLS
3212	\N	Kaiserslautern	KLT
3213	\N	Klagenfurt	KLU
3214	\N	Klawock	KLW
3215	\N	Kalima	KLY
3216	\N	Kleinzee	KLZ
3217	\N	Kerema	KMA
3218	\N	Koinambe	KMB
3219	\N	Kamembe	KME
3220	\N	Kamina	KMF
3221	\N	Kunming	KMG
3222	\N	Kuruman	KMH
3223	\N	Kumamoto	KMJ
3224	\N	Makabana	KMK
3225	\N	Kamileroi	KML
3226	\N	Kimam	KMM
3227	\N	Kamina	KMN
3228	\N	Manokotak	KMO
3229	\N	Keetmanshoop	KMP
3230	\N	Komatsu	KMQ
3231	\N	Karimui	KMR
3232	\N	Kumasi	KMS
3233	\N	Kampot	KMT
3234	\N	Kismayu	KMU
3235	\N	Khamis Mushait	KMX
3236	\N	Kaoma	KMZ
3237	\N	Vina del Mar	KNA
3238	\N	Kanab	KNB
3239	\N	Kindu	KND
3240	\N	Kanainj	KNE
3241	\N	Kings Lynn	KNF
3242	\N	Kaimana	KNG
3243	\N	Kinmen	KNH
3244	\N	Katanning	KNI
3245	\N	Kindamba	KNJ
3246	\N	Kelanoa	KNL
3247	\N	Kaniama	KNM
3248	\N	Kankan	KNN
3249	\N	Capanda	KNP
3250	\N	Kone	KNQ
3251	\N	Kangan	KNR
3252	\N	Kennett	KNT
3253	\N	Kanpur	KNU
3254	\N	Knights Inlet	KNV
3255	\N	New Stuyahok	KNW
3256	\N	Kununurra	KNX
3257	\N	Kinoosao	KNY
3258	\N	Kenieba	KNZ
3259	\N	Koumac	KOC
3260	\N	Kotabangun	KOD
3261	\N	Kupang	KOE
3262	\N	Komatipoort	KOF
3263	\N	Khong	KOG
3264	\N	Koolatah	KOH
3265	\N	Kagoshima	KOJ
3266	\N	Koumala	KOL
3267	\N	Komo-Manda	KOM
3268	\N	Kontum	KON
3269	\N	Kongolo	KOO
3270	\N	Nakhon Phanom	KOP
3271	\N	Koethen	KOQ
3272	\N	Kokoro	KOR
3273	\N	Koulamoutou	KOU
3274	\N	Kokshetau	KOV
3275	\N	Ganzhou	KOW
3276	\N	Kokonao	KOX
3277	\N	Olga Bay	KOY
3278	\N	Ouzinkie	KOZ
3279	\N	Kopiago	KPA
3280	\N	Port Clarence	KPC
3281	\N	King Of Prussia	KPD
3282	\N	Yapsiei	KPE
3283	\N	Kondubol	KPF
3284	\N	Kurupung	KPG
3285	\N	Pauloff Harbor	KPH
3286	\N	Kapit	KPI
3287	\N	Parks	KPK
3288	\N	Kapal	KPL
3289	\N	Kompiam	KPM
3290	\N	Pohang	KPO
3291	\N	Kalpowar	KPP
3292	\N	Kempsey	KPS
3293	\N	Jackpot	KPT
3294	\N	Port Bailey	KPY
3295	\N	Akutan	KQA
3296	\N	Kol	KQL
3297	\N	Kerang	KRA
3298	\N	Karumba	KRB
3299	\N	Kerinci	KRC
3300	\N	Kurundi	KRD
3301	\N	Kirundo	KRE
3302	\N	Kramfors	KRF
3303	\N	Karasabai	KRG
3304	\N	Kikori	KRI
3305	\N	Karawari	KRJ
3306	\N	Krakow	KRK
3307	\N	Korla	KRL
3308	\N	Karanambo	KRM
3309	\N	Kiruna	KRN
3310	\N	Kurgan	KRO
3311	\N	Karup	KRP
3312	\N	Kramatorsk	KRQ
3313	\N	Kristiansand	KRS
3314	\N	Khartoum	KRT
3315	\N	Kerau	KRU
3316	\N	Kerio Valley	KRV
3317	\N	Turkmenbashi	KRW
3318	\N	Kar Kar	KRX
3319	\N	Karamay	KRY
3320	\N	Kiri	KRZ
3321	\N	Kasanombe	KSB
3322	\N	Kosice	KSC
3323	\N	Karlstad	KSD
3324	\N	Kasese	KSE
3325	\N	Kassel	KSF
3326	\N	Kisengan	KSG
3327	\N	Kermanshah	KSH
3328	\N	Kissidougou	KSI
3329	\N	Karlskoga	KSK
3330	\N	Kassala	KSL
3331	\N	Kostanay	KSN
3332	\N	Kosipe	KSP
3333	\N	Karshi	KSQ
3334	\N	Sandy River	KSR
3335	\N	Sikasso	KSS
3336	\N	Kosti	KST
3337	\N	Springvale	KSV
3338	\N	Kiryat Shmona	KSW
3339	\N	Yasuru	KSX
3340	\N	Kars	KSY
3341	\N	Kotlas	KSZ
3342	\N	Karratha	KTA
3343	\N	Katiola	KTC
3344	\N	Kitadaito	KTD
3345	\N	Kerteh	KTE
3346	\N	Takaka	KTF
3347	\N	Ketapang	KTG
3348	\N	Tikchik	KTH
3349	\N	Kratie	KTI
3350	\N	Kanua	KTK
3351	\N	Kitale	KTL
3352	\N	Kathmandu	KTM
3353	\N	Kato	KTO
3354	\N	Kitee	KTQ
3355	\N	Katherine	KTR
3356	\N	Kittila	KTT
3357	\N	Kota	KTU
3358	\N	Kamarata	KTV
3359	\N	Katowice	KTW
3360	\N	Koutiala	KTX
3361	\N	Katukurunda	KTY
3362	\N	Kuantan	KUA
3363	\N	Kuria	KUC
3364	\N	Kudat	KUD
3365	\N	Kukundu	KUE
3366	\N	Samara	KUF
3367	\N	Kubin Island	KUG
3368	\N	Kushiro	KUH
3369	\N	Kawau Island	KUI
3370	\N	Kushimoto	KUJ
3371	\N	Kuala Lumpur	KUL
3372	\N	Yakushima	KUM
3373	\N	Kaunas	KUN
3374	\N	Kuopio	KUO
3375	\N	Kupiano	KUP
3376	\N	Kuri	KUQ
3377	\N	Kuran-O-Munjan	KUR
3378	\N	Kutaisi	KUT
3379	\N	Gunsan	KUV
3380	\N	Kugururok River	KUW
3381	\N	Kuyol	KUX
3382	\N	Kamusi	KUY
3383	\N	Gunsan AB	KUZ
3384	\N	Kavala	KVA
3385	\N	Skovde	KVB
3386	\N	Gyandzha	KVD
3387	\N	Kitava	KVE
3388	\N	Kavieng	KVG
3389	\N	Kirovsk	KVK
3390	\N	Korolevu	KVU
3391	\N	Kirov	KVX
3392	\N	Kwajalein	KWA
3393	\N	Karimunjawa	KWB
3394	\N	Kawadjia	KWD
3395	\N	Guiyang	KWE
3396	\N	Waterfall	KWF
3397	\N	Krivoy Rog	KWG
3398	\N	Khwahan	KWH
3399	\N	Kuwait City	KWI
3400	\N	Gwangju	KWJ
3401	\N	Guilin	KWL
3402	\N	Kawito	KWO
3403	\N	Kwai Harbour	KWR
3404	\N	Kwailabesi	KWS
3405	\N	Mansion House	KWU
3406	\N	Kurwina	KWV
3407	\N	Kiwai Island	KWX
3408	\N	Kiwayu	KWY
3409	\N	Kolwezi	KWZ
3410	\N	Klerksdorp	KXE
3411	\N	Koro Island	KXF
3412	\N	Karoola	KXR
3413	\N	Katiu	KXU
3414	\N	Konya	KYA
3415	\N	Orchid Island	KYD
3416	\N	Tripoli	KYE
3417	\N	Yeelirrie	KYF
3418	\N	Yalata Mission	KYI
3419	\N	Karluk	KYK
3420	\N	Key Largo	KYL
3421	\N	Milton Keynes	KYN
3422	\N	Kyaukpyu	KYP
3423	\N	Kayes	KYS
3424	\N	Kyauktaw	KYT
3425	\N	Koyukuk	KYU
3426	\N	Yalumet	KYX
3427	\N	Kyzyl	KYZ
3428	\N	Zachar Bay	KZB
3429	\N	Kompong-Chhna	KZC
3430	\N	Krakor	KZD
3431	\N	Kaintiba	KZF
3432	\N	Kitzingen	KZG
3433	\N	Kizhuyak	KZH
3434	\N	Kozani	KZI
3435	\N	Kazan	KZN
3436	\N	Kzyl-Orda	KZO
3437	\N	Kastelorizo	KZS
3438	\N	Lamar	LAA
3439	\N	Lablab	LAB
3440	\N	Pulau Layang-Layang Island	LAC
3441	\N	Luanda	LAD
3442	\N	Lafayette	LAF
3443	\N	La Guaira	LAG
3444	\N	Lages	LAJ
3445	\N	Aklavik	LAK
3446	\N	Lakeland	LAL
3447	\N	Los Alamos	LAM
3448	\N	Lansing	LAN
3449	\N	Laoag	LAO
3450	\N	Las Vegas	LAS
3451	\N	La Uribe	LAT
3452	\N	Lalomalava	LAV
3453	\N	Los Angeles	LAX
3454	\N	Ladysmith	LAY
3455	\N	Bom Jesus Da Lapa	LAZ
3456	\N	Leeds	LBA
3457	\N	Khudzhand	LBD
3458	\N	North Platte	LBF
3459	\N	Albi	LBI
3460	\N	Labuan Bajo	LBJ
3461	\N	Liboi	LBK
3462	\N	Luabo	LBM
3463	\N	Lake Baringo	LBN
3464	\N	Lusambo	LBO
3465	\N	Long Banga	LBP
3466	\N	Lambarene	LBQ
3467	\N	Labrea	LBR
3468	\N	Lumberton	LBT
3469	\N	Labuan	LBU
3470	\N	Libreville	LBV
3471	\N	Long Bawan	LBW
3472	\N	Lubang	LBX
3473	\N	La Baule-Escoublac	LBY
3474	\N	Lukapa	LBZ
3475	\N	Larnaca	LCA
3476	\N	Pontes e Lacerda	LCB
3477	\N	Lecce	LCC
3478	\N	Louis Trichardt	LCD
3479	\N	La Ceiba	LCE
3480	\N	Rio Dulce	LCF
3481	\N	La Coruna	LCG
3482	\N	Lake Charles	LCH
3483	\N	Laconia	LCI
3484	\N	Lodz	LCJ
3485	\N	La Coloma	LCL
3486	\N	La Cumbre	LCM
3487	\N	Balcanoona	LCN
3488	\N	Lague	LCO
3489	\N	Loncopue	LCP
3490	\N	Las Canas	LCS
3491	\N	Lucca	LCV
3492	\N	Malda	LDA
3493	\N	Londrina	LDB
3494	\N	Lindeman Island	LDC
3495	\N	Lindi	LDI
3496	\N	Linden	LDJ
3497	\N	Lidkoping	LDK
3498	\N	Ludington	LDM
3499	\N	Lamidanda	LDN
3500	\N	Ladouanie	LDO
3501	\N	Lodar	LDR
3502	\N	Landivisiau	LDV
3503	\N	Lansdowne	LDW
3504	\N	St Laurent du Maroni	LDX
3505	\N	Derry	LDY
3506	\N	Londolozi	LDZ
3507	\N	Learmonth	LEA
3508	\N	White River	LEB
3509	\N	Lencois	LEC
3510	\N	Saint Petersburg	LED
3511	\N	Leesburg	LEE
3512	\N	Lebakeng	LEF
3513	\N	Aleg	LEG
3514	\N	Le Havre	LEH
3515	\N	Almeria	LEI
3516	\N	Leipzig-Halle	LEJ
3517	\N	Labe	LEK
3518	\N	Lake Evella	LEL
3519	\N	Lemmon	LEM
3520	\N	Leon	LEN
3521	\N	Leconi	LEO
3522	\N	Leopoldina	LEP
3523	\N	Leinster	LER
3524	\N	Lesobeng	LES
3525	\N	Bureta	LEV
3526	\N	Lewiston	LEW
3527	\N	Lelystad	LEY
3528	\N	La Esperanza	LEZ
3529	\N	Lumbo	LFB
3530	\N	Lamerd	LFM
3531	\N	Louisburg	LFN
3532	\N	Kelafo	LFO
3533	\N	Lakefield	LFP
3534	\N	La Fria	LFR
3535	\N	Lome	LFW
3536	\N	Long Beach	LGB
3537	\N	La Grange	LGC
3538	\N	La Grande	LGD
3539	\N	Lake Gregory	LGE
3540	\N	Liege	LGG
3541	\N	Leigh Creek	LGH
3542	\N	Long Island	LGI
3543	\N	Langkawi	LGK
3544	\N	Long Lellang	LGL
3545	\N	Laiagam	LGM
3546	\N	Linga Linga	LGN
3547	\N	Langeoog	LGO
3548	\N	Legazpi	LGP
3549	\N	Lago Agrio	LGQ
3550	\N	Cochrane	LGR
3551	\N	Las Gaviotas	LGT
3552	\N	Logan	LGU
3553	\N	Lugh Ganane	LGX
3554	\N	Lagunillas	LGY
3555	\N	Leguizamo	LGZ
3556	\N	Lahr	LHA
3557	\N	Lost Harbor	LHB
3558	\N	Lahore	LHE
3559	\N	Lightning Ridge	LHG
3560	\N	Lereh	LHI
3561	\N	Guanghua	LHK
3562	\N	Lishan	LHN
3563	\N	Lehu	LHP
3564	\N	Las Heras	LHS
3565	\N	Caprivi	LHU
3566	\N	Lock Haven	LHV
3567	\N	Lanzhou	LHW
3568	\N	Liangping	LIA
3569	\N	Limbunya	LIB
3570	\N	Limon	LIC
3571	\N	Libenge	LIE
3572	\N	Mulia	LII
3573	\N	Long Island	LIJ
3574	\N	Likiep Island	LIK
3575	\N	Lille	LIL
3576	\N	Lima	LIM
3577	\N	Limon	LIO
3578	\N	Lins	LIP
3579	\N	Lisala	LIQ
3580	\N	Liberia	LIR
3581	\N	Lisbon	LIS
3582	\N	Livengood	LIV
3583	\N	Loikaw	LIW
3584	\N	Likoma Island	LIX
3585	\N	Hinesville	LIY
3586	\N	Limestone	LIZ
3587	\N	Lodja	LJA
3588	\N	Lijiang City	LJG
3589	\N	Lake Jackson	LJN
3590	\N	Ljubljana	LJU
3591	\N	Lakeba	LKB
3592	\N	Lekana	LKC
3593	\N	Lakeland Downs	LKD
3594	\N	Kulik Lake	LKK
3595	\N	Leknes	LKN
3596	\N	Lucknow	LKO
3597	\N	Lake Placid	LKP
3598	\N	Las Khoreh	LKR
3599	\N	Lakeside	LKS
3600	\N	Lake Rudolf	LKU
3601	\N	Lakeview	LKV
3602	\N	Lulea	LLA
3603	\N	Malelane	LLE
3604	\N	Chillagoe	LLG
3605	\N	Las Limas	LLH
3606	\N	Lissadell	LLL
3607	\N	Long Lama	LLM
3608	\N	Kelila	LLN
3609	\N	Linda Downs	LLP
3610	\N	Las Lomitas	LLS
3611	\N	Lyndonville	LLX
3612	\N	Mount Holly	LLY
3613	\N	Lake Minchumina	LMA
3614	\N	Salima	LMB
3615	\N	Los Menucos	LMD
3616	\N	Le Mans	LME
3617	\N	Lamassa	LMG
3618	\N	Limon	LMH
3619	\N	Lumi	LMI
3620	\N	Lae Island	LML
3621	\N	Los Mochis	LMM
3622	\N	Limbang	LMN
3623	\N	Lossiemouth	LMO
3624	\N	Lampedusa	LMP
3625	\N	Marsa Brega	LMQ
3626	\N	Lime Acres	LMR
3627	\N	Louisville	LMS
3628	\N	Klamath Falls	LMT
3629	\N	Lopez De Micay	LMX
3630	\N	Lake Murray	LMY
3631	\N	Palma	LMZ
3632	\N	Lamen Bay	LNB
3633	\N	Lengbati	LNC
3634	\N	Lander	LND
3635	\N	Munbil	LNF
3636	\N	Lese	LNG
3637	\N	Lake Nash	LNH
3638	\N	Lonely	LNI
3639	\N	Langimar	LNM
3640	\N	Willoughby	LNN
3641	\N	Leonora	LNO
3642	\N	Wise	LNP
3643	\N	Loani	LNQ
3644	\N	Lone Rock	LNR
3645	\N	Lanai City	LNY
3646	\N	Linz	LNZ
3647	\N	Lorraine	LOA
3648	\N	Los Andes	LOB
3649	\N	Lock	LOC
3650	\N	Longana	LOD
3651	\N	Loei	LOE
3652	\N	Loen	LOF
3653	\N	Longview	LOG
3654	\N	Catamayo	LOH
3655	\N	Lontras	LOI
3656	\N	Lodwar	LOK
3657	\N	Lovelock	LOL
3658	\N	Lagos De Moreno	LOM
3659	\N	London	LON
3660	\N	Lobatse	LOQ
3661	\N	Lagos	LOS
3662	\N	Lockport	LOT
3663	\N	Monclova	LOV
3664	\N	Louisa	LOW
3665	\N	Los Tablones	LOX
3666	\N	Loyangalani	LOY
3667	\N	London	LOZ
3668	\N	La Paz	LPB
3669	\N	Lompoc	LPC
3670	\N	La Primavera	LPE
3671	\N	La Plata	LPG
3672	\N	Linkoping	LPI
3673	\N	Pijiguaos	LPJ
3674	\N	Lipetsk	LPK
3675	\N	Liverpool	LPL
3676	\N	Lamap	LPM
3677	\N	Leron Plains	LPN
3678	\N	Laporte	LPO
3679	\N	Long Apung	LPU
3680	\N	Little Port Walter	LPW
3681	\N	Liepaja	LPX
3682	\N	Le Puy	LPY
3683	\N	Pickens	LQK
3684	\N	Qala Nau	LQN
3685	\N	Larisa	LRA
3686	\N	Leribe	LRB
3687	\N	Laredo	LRD
3688	\N	Lora Lai	LRG
3689	\N	Lorica	LRI
3690	\N	Lemars	LRJ
3691	\N	Lincoln Rock	LRK
3692	\N	Niamtougou	LRL
3693	\N	La Romana	LRM
3694	\N	Lathrop	LRO
3695	\N	Laurie River	LRQ
3696	\N	Lar	LRR
3697	\N	Leros	LRS
3698	\N	Las Cruces	LRU
3699	\N	Los Roques	LRV
3700	\N	Losuia	LSA
3701	\N	Lordsburg	LSB
3702	\N	La Serena	LSC
3703	\N	Lashio	LSH
3704	\N	Long Island	LSJ
3705	\N	Lusk	LSK
3706	\N	Los Chiles	LSL
3707	\N	Long Semado	LSM
3708	\N	Los Banos	LSN
3709	\N	Les Sables	LSO
3710	\N	Las Piedras	LSP
3711	\N	Los Angeles	LSQ
3712	\N	Lost River	LSR
3713	\N	Terre-de-Haut	LSS
3714	\N	Launceston	LST
3715	\N	Long Sukang	LSU
3716	\N	Lhok Sukon	LSX
3717	\N	Mali Losinj	LSZ
3718	\N	Tzaneen	LTA
3719	\N	Latrobe	LTB
3720	\N	Lai	LTC
3721	\N	Leitre	LTF
3722	\N	Langtang	LTG
3723	\N	Lathrop Wells	LTH
3724	\N	Latakia	LTK
3725	\N	Lastourville	LTL
3726	\N	Lethem	LTM
3727	\N	Lyndhurst	LTP
3728	\N	Letterkenny	LTR
3729	\N	Saint Tropez	LTT
3730	\N	Lotusvale	LTV
3731	\N	Leonardtown	LTW
3732	\N	Lukla	LUA
3733	\N	Lumid Pau	LUB
3734	\N	Laucala Island	LUC
3735	\N	Luderitz	LUD
3736	\N	Lucenec	LUE
3737	\N	Lugano	LUG
3738	\N	Ludhiana	LUH
3739	\N	La Union	LUI
3740	\N	Lusaka	LUN
3741	\N	Luena	LUO
3742	\N	Kalaupapa	LUP
3743	\N	Lusanga	LUS
3744	\N	Laura Station	LUT
3745	\N	Laura	LUU
3746	\N	Langgur	LUV
3747	\N	Luwuk	LUW
3748	\N	Luxembourg	LUX
3749	\N	Laval	LVA
3750	\N	Livramento	LVB
3751	\N	Lime Village	LVD
3752	\N	Livermore	LVK
3753	\N	Lawrenceville	LVL
3754	\N	Livingston	LVM
3755	\N	Laverton	LVO
3756	\N	Lavan	LVP
3757	\N	Las Vegas	LVS
3758	\N	Lwbak	LWA
3759	\N	Lawrence	LWC
3760	\N	Lewoleba	LWE
3761	\N	Lawn Hill	LWH
3762	\N	Lowai	LWI
3763	\N	Wells	LWL
3764	\N	Lawrence	LWM
3765	\N	Lviv	LWO
3766	\N	Leeuwarden	LWR
3767	\N	Lawrenceville	LWV
3768	\N	Lexington	LXN
3769	\N	Luxor	LXR
3770	\N	Lukulu	LXU
3771	\N	Leadville	LXV
3772	\N	Lycksele	LYC
3773	\N	Lyneham	LYE
3774	\N	Lianyungang	LYG
3775	\N	Linyi	LYI
3776	\N	Lunyuk	LYK
3777	\N	Lyons	LYO
3778	\N	Faisalabad	LYP
3779	\N	Longyearbyen	LYR
3780	\N	Lyon	LYS
3781	\N	Lady Elliot Island	LYT
3782	\N	Ely	LYU
3783	\N	Luiza	LZA
3784	\N	Lazaro Cardenas	LZC
3785	\N	Liuzhou	LZH
3786	\N	Luozi	LZI
3787	\N	Luzamba	LZM
3788	\N	Luzhou	LZO
3789	\N	Lizard Island	LZR
3790	\N	Lawrenceville	LZU
3791	\N	Chennai	MAA
3792	\N	Maraba	MAB
3793	\N	Madrid	MAD
3794	\N	Madera	MAE
3795	\N	Midland	MAF
3796	\N	Menorca	MAH
3797	\N	Mangochi	MAI
3798	\N	Majuro	MAJ
3799	\N	Malakal	MAK
3800	\N	Mangole	MAL
3801	\N	Matamoros	MAM
3802	\N	Manchester	MAN
3803	\N	Manaus	MAO
3804	\N	Mamai	MAP
3805	\N	Maracaibo	MAR
3806	\N	Matadi	MAT
3807	\N	Maupiti	MAU
3808	\N	Maloelap Island	MAV
3809	\N	Malden	MAW
3810	\N	Matam	MAX
3811	\N	Mangrove Cay	MAY
3812	\N	Mayaguez	MAZ
3813	\N	Mombasa	MBA
3814	\N	Marble Bar	MBB
3815	\N	Mbigou	MBC
3816	\N	Mmabatho	MBD
3817	\N	Monbetsu	MBE
3818	\N	Mount Buffalo	MBF
3819	\N	Mobridge	MBG
3820	\N	Maryborough	MBH
3821	\N	Mbeya	MBI
3822	\N	Matupa	MBK
3823	\N	Mkambati	MBM
3824	\N	Mount Barnett	MBN
3825	\N	Mamburao	MBO
3826	\N	Moyobamba	MBP
3827	\N	Mbarara	MBQ
3828	\N	Mbout	MBR
3829	\N	Saginaw	MBS
3830	\N	Mbambanakira	MBU
3831	\N	Masa	MBV
3832	\N	Maribor	MBX
3833	\N	Moberly	MBY
3834	\N	Maues	MBZ
3835	\N	Macenta	MCA
3836	\N	Mccomb	MCB
3837	\N	Mackinac Island	MCD
3838	\N	Merced	MCE
3839	\N	Mcgrath	MCG
3840	\N	Machala	MCH
3841	\N	Maicao	MCJ
3842	\N	Mccook	MCK
3843	\N	Mount Mckinley	MCL
3844	\N	Monte Carlo	MCM
3845	\N	Macon	MCN
3846	\N	Miskolc	MCQ
3847	\N	Melchor De Menco	MCR
3848	\N	Monte Caseros	MCS
3849	\N	Muscat	MCT
3850	\N	Montlucon	MCU
3851	\N	Makhachkala	MCX
3852	\N	Maceio	MCZ
3853	\N	Melinda	MDB
3854	\N	Manado	MDC
3855	\N	Medford	MDF
3856	\N	Mudanjiang	MDG
3857	\N	Carbondale	MDH
3858	\N	Makurdi	MDI
3859	\N	Madras	MDJ
3860	\N	Mbandaka	MDK
3861	\N	Mandalay	MDL
3862	\N	Munduku	MDM
3863	\N	Middleton Island	MDO
3864	\N	Mindiptana	MDP
3865	\N	Medfra	MDR
3866	\N	Middle Caicos	MDS
3867	\N	Mendi	MDU
3868	\N	Medouneu	MDV
3869	\N	Mercedes	MDX
3870	\N	Midway Island	MDY
3871	\N	Mendoza	MDZ
3872	\N	Macae	MEA
3873	\N	Manta	MEC
3874	\N	Melfi	MEF
3875	\N	Melanje	MEG
3876	\N	Meridian	MEI
3877	\N	Meadville	MEJ
3878	\N	Meknes	MEK
3879	\N	Melbourne	MEL
3880	\N	Memphis	MEM
3881	\N	Mende	MEN
3882	\N	Manteo	MEO
3883	\N	Mersing	MEP
3884	\N	Meulaboh	MEQ
3885	\N	Medan	MES
3886	\N	Moreton	MET
3887	\N	Monte Dourado	MEU
3888	\N	Minden	MEV
3889	\N	Mweka	MEW
3890	\N	Mexico City	MEX
3891	\N	Meghauli	MEY
3892	\N	Messina	MEZ
3893	\N	Mafia	MFA
3894	\N	Monfort	MFB
3895	\N	Mafeteng	MFC
3896	\N	Mansfield	MFD
3897	\N	Moanda	MFF
3898	\N	Muzaffarabad	MFG
3899	\N	Mesquite	MFH
3900	\N	Marshfield	MFI
3901	\N	Moala	MFJ
3902	\N	Matsu	MFK
3903	\N	Mount Full Stop	MFL
3904	\N	Macau	MFM
3905	\N	Milford Sound	MFN
3906	\N	Manguna	MFO
3907	\N	Manners Creek	MFP
3908	\N	Maradi	MFQ
3909	\N	Medford	MFR
3910	\N	Miraflores	MFS
3911	\N	Machu Picchu	MFT
3912	\N	Mfuwe	MFU
3913	\N	Melfa	MFV
3914	\N	Magaruque	MFW
3915	\N	Meribel	MFX
3916	\N	Mesalia	MFZ
3917	\N	Managua	MGA
3918	\N	Mount Gambier	MGB
3919	\N	Michigan City	MGC
3920	\N	Magdalena	MGD
3921	\N	Marietta	MGE
3922	\N	Margarima	MGG
3923	\N	Margate	MGH
3924	\N	Matagorda Island	MGI
3925	\N	Montgomery	MGJ
3926	\N	Mong Ton	MGK
3927	\N	Montgomery	MGM
3928	\N	Magangue	MGN
3929	\N	Manega	MGO
3930	\N	Manga	MGP
3931	\N	Mogadishu	MGQ
3932	\N	Moultrie	MGR
3933	\N	Manaung	MGU
3934	\N	Margaret River Station	MGV
3935	\N	Morgantown	MGW
3936	\N	Moabi	MGX
3937	\N	Myeik	MGZ
3938	\N	Mahdia	MHA
3939	\N	Mashad	MHD
3940	\N	Mitchell	MHE
3941	\N	Morichal	MHF
3942	\N	Mannheim	MHG
3943	\N	Musha	MHI
3944	\N	Manhattan	MHK
3945	\N	Marshall	MHL
3946	\N	Minchumina	MHM
3947	\N	Mullen	MHN
3948	\N	Mount House	MHO
3949	\N	Mariehamn	MHQ
3950	\N	Mount Shasta	MHS
3951	\N	Manchester	MHT
3952	\N	Mojave	MHV
3953	\N	Monteagudo	MHW
3954	\N	Manihiki Island	MHX
3955	\N	Morehead	MHY
3956	\N	Mildenhall	MHZ
3957	\N	Miami	MIA
3958	\N	Merida	MID
3959	\N	Muncie	MIE
3960	\N	Monahans	MIF
3961	\N	Mitchell Plateau	MIH
3962	\N	Mili Island	MIJ
3963	\N	Mikkeli	MIK
3964	\N	Milan	MIL
3965	\N	Merimbula	MIM
3966	\N	Minnipa	MIN
3967	\N	Mitspeh Ramon	MIP
3968	\N	Monastir	MIR
3969	\N	Shafter	MIT
3970	\N	Maiduguri	MIU
3971	\N	Millville	MIV
3972	\N	Marshalltown	MIW
3973	\N	Miriti	MIX
3974	\N	Mittiebah	MIY
3975	\N	Mainoru	MIZ
3976	\N	Manja	MJA
3977	\N	Mejit Island	MJB
3978	\N	Man	MJC
3979	\N	Majkin	MJE
3980	\N	Mayajigua	MJG
3981	\N	Moki	MJJ
3982	\N	Monkey Mia	MJK
3983	\N	Mouila	MJL
3984	\N	Mount Etjo Lodge	MJO
3985	\N	Manjimup	MJP
3986	\N	Jackson	MJQ
3987	\N	Miramar	MJR
3988	\N	Maganja Da Costa	MJS
3989	\N	Mytilene	MJT
3990	\N	Murcia	MJV
3991	\N	Mahenye	MJW
3992	\N	Toms River	MJX
3993	\N	Mangunjaya	MJY
3994	\N	Marianske Lazne	MKA
3995	\N	Mekambo	MKB
3996	\N	Mokhotlong	MKH
3997	\N	Makoua	MKJ
3998	\N	Malekolon	MKN
3999	\N	Makemo	MKP
4000	\N	Merauke	MKQ
4001	\N	Meekatharra	MKR
4002	\N	Mekane Selam	MKS
4003	\N	Mankato	MKT
4004	\N	Makokou	MKU
4005	\N	Mount Cavenagh	MKV
4006	\N	Manokwari	MKW
4007	\N	Mackay	MKY
4008	\N	Malacca	MKZ
4009	\N	Gudja	MLA
4010	\N	Mc Alester	MLC
4011	\N	Malad City	MLD
4012	\N	Male	MLE
4013	\N	Milford	MLF
4014	\N	Milledgeville	MLJ
4015	\N	Malta	MLK
4016	\N	Morelia	MLM
4017	\N	Melilla	MLN
4018	\N	Milos	MLO
4019	\N	Malabang	MLP
4020	\N	Malalaua	MLQ
4021	\N	Millicent	MLR
4022	\N	Millinocket	MLT
4023	\N	Monroe	MLU
4024	\N	Merluna	MLV
4025	\N	Malatya	MLX
4026	\N	Manley Hot Springs	MLY
4027	\N	Melo	MLZ
4028	\N	Malmo	MMA
4029	\N	Mante	MMC
4030	\N	Minami Daito	MMD
4031	\N	Teesside	MME
4032	\N	Mamfe	MMF
4033	\N	Mount Magnet	MMG
4034	\N	Mammoth Lakes	MMH
4035	\N	Athens	MMI
4036	\N	Matsumoto	MMJ
4037	\N	Murmansk	MMK
4038	\N	Marshall	MML
4039	\N	Middlemount	MMM
4040	\N	Stow	MMN
4041	\N	Maio	MMO
4042	\N	Mompos	MMP
4043	\N	Mbala	MMQ
4044	\N	Marks	MMS
4045	\N	Mal	MMV
4046	\N	Moma	MMW
4047	\N	Miyako Jima	MMY
4048	\N	Maimana	MMZ
4049	\N	Moanda	MNB
4050	\N	Nacala	MNC
4051	\N	Medina	MND
4052	\N	Mungeranie	MNE
4053	\N	Mana Island	MNF
4054	\N	Minneriya	MNH
4055	\N	Mananjary	MNJ
4056	\N	Maiana	MNK
4057	\N	Manila	MNL
4058	\N	Menominee	MNM
4059	\N	Marion	MNN
4060	\N	Manono	MNO
4061	\N	Maron	MNP
4062	\N	Monto	MNQ
4063	\N	Mongu	MNR
4064	\N	Mansa	MNS
4065	\N	Minto	MNT
4066	\N	Mountain Valley	MNV
4067	\N	Macdonald Downs	MNW
4068	\N	Manicore	MNX
4069	\N	Mono	MNY
4070	\N	Manassas	MNZ
4071	\N	Moa	MOA
4072	\N	Mobile	MOB
4073	\N	Montes Claros	MOC
4074	\N	Momeik	MOE
4075	\N	Maumere	MOF
4076	\N	Mong Hsat	MOG
4077	\N	Moengo	MOJ
4078	\N	Molde	MOL
4079	\N	Moudjeria	MOM
4080	\N	Mount Cook	MON
4081	\N	Moomba	MOO
4082	\N	Mount Pleasant	MOP
4083	\N	Morondava	MOQ
4084	\N	Morristown	MOR
4085	\N	Moses Point	MOS
4086	\N	Mountain Village	MOU
4087	\N	Moscow	MOW
4088	\N	Morris	MOX
4089	\N	Monterrey	MOY
4090	\N	Moorea	MOZ
4091	\N	Mpacha	MPA
4092	\N	Muko-Muko	MPC
4093	\N	Mirpur Khas	MPD
4094	\N	Madison	MPE
4095	\N	Mapoda	MPF
4096	\N	Makini	MPG
4097	\N	Mamitupo	MPI
4098	\N	Morrilton	MPJ
4099	\N	Mokpo	MPK
4100	\N	Montpellier	MPL
4101	\N	Maputo	MPM
4102	\N	Mount Pleasant	MPN
4103	\N	Mount Pocono	MPO
4104	\N	Mulatupo	MPP
4105	\N	Maan	MPQ
4106	\N	Mcpherson	MPR
4107	\N	Mount Pleasant	MPS
4108	\N	Maliana	MPT
4109	\N	Mapua	MPU
4110	\N	Montpelier	MPV
4111	\N	Mariupol	MPW
4112	\N	Miyanmin	MPX
4113	\N	Maripasoula	MPY
4114	\N	Mount Pleasant	MPZ
4115	\N	Mandora	MQA
4116	\N	Macomb	MQB
4117	\N	Miquelon	MQC
4118	\N	Maquinchao	MQD
4119	\N	Marqua	MQE
4120	\N	Magnitogorsk	MQF
4121	\N	Midgard	MQG
4122	\N	Minacu	MQH
4123	\N	Quincy	MQI
4124	\N	San Matias	MQK
4125	\N	Mildura	MQL
4126	\N	Malam	MQO
4127	\N	Moundou	MQQ
4128	\N	Mustique Island	MQS
4129	\N	Mariquita	MQU
4130	\N	Mostaganem	MQV
4131	\N	Mc Rae	MQW
4132	\N	Makale	MQX
4133	\N	Smyrna	MQY
4134	\N	Margaret River	MQZ
4135	\N	Misurata	MRA
4136	\N	Martinsburg	MRB
4137	\N	Columbia	MRC
4138	\N	Merida	MRD
4139	\N	Mara Lodges	MRE
4140	\N	Marfa	MRF
4141	\N	Mareeba	MRG
4142	\N	May River	MRH
4143	\N	Marcala	MRJ
4144	\N	Marco Island	MRK
4145	\N	Miners Lake	MRL
4146	\N	Manare	MRM
4147	\N	Morganton	MRN
4148	\N	Masterton	MRO
4149	\N	Marla	MRP
4150	\N	Marinduque	MRQ
4151	\N	Macara	MRR
4152	\N	Marseille	MRS
4153	\N	Moroak	MRT
4154	\N	Mineralnye Vody	MRV
4155	\N	Maribo	MRW
4156	\N	Monterey	MRY
4157	\N	Mesa	MSC
4158	\N	Mount Pleasant	MSD
4159	\N	Manston	MSE
4160	\N	Mount Swan	MSF
4161	\N	Matsaile	MSG
4162	\N	Masirah	MSH
4163	\N	Masalembo	MSI
4164	\N	Mastic Point	MSK
4165	\N	Masi Manimba	MSM
4166	\N	Minsk	MSQ
4167	\N	Mus	MSR
4168	\N	Maastricht	MST
4169	\N	Maseru	MSU
4170	\N	Monticello	MSV
4171	\N	Massawa	MSW
4172	\N	Mossendjo	MSX
4173	\N	New Orleans	MSY
4174	\N	Namibe	MSZ
4175	\N	Matamata	MTA
4176	\N	Monte Libano	MTB
4177	\N	Mount Sandford	MTD
4178	\N	Monte Alegre	MTE
4179	\N	Mizan Teferi	MTF
4180	\N	Mato Grosso	MTG
4181	\N	Marathon	MTH
4182	\N	Mosteiros	MTI
4183	\N	Makin Island	MTK
4184	\N	Maitland	MTL
4185	\N	Metlakatla	MTM
4186	\N	Mattoon	MTO
4187	\N	Montauk	MTP
4188	\N	Mitchell	MTQ
4189	\N	Monteria	MTR
4190	\N	Minatitlan	MTT
4191	\N	Montepuez	MTU
4192	\N	Mota Lava	MTV
4193	\N	Manitowoc	MTW
4194	\N	Monterrey	MTY
4195	\N	Masada	MTZ
4196	\N	Maun	MUB
4197	\N	Munich	MUC
4198	\N	Mueda	MUD
4199	\N	Kamuela	MUE
4200	\N	Muting	MUF
4201	\N	Mulege	MUG
4202	\N	Fort Indiantown	MUI
4203	\N	Mui	MUJ
4204	\N	Mauke Island	MUK
4205	\N	Maturin	MUN
4206	\N	Mulga Park	MUP
4207	\N	Muccan	MUQ
4208	\N	Marudi	MUR
4209	\N	Marcus Island	MUS
4210	\N	Muscatine	MUT
4211	\N	Mount Union	MUU
4212	\N	Mascara-Ghriss	MUW
4213	\N	Mouyondzi	MUY
4214	\N	Musoma	MUZ
4215	\N	Myvatn	MVA
4216	\N	Franceville	MVB
4217	\N	Monroeville	MVC
4218	\N	Montevideo	MVD
4219	\N	Montevideo	MVE
4220	\N	Mossoro	MVF
4221	\N	Mevang	MVG
4222	\N	Macksville	MVH
4223	\N	Manetai	MVI
4224	\N	Mandeville	MVJ
4225	\N	Mulka	MVK
4226	\N	Stowe	MVL
4227	\N	Kayenta	MVM
4228	\N	Mount Vernon	MVN
4229	\N	Mongo	MVO
4230	\N	Mitu	MVP
4231	\N	Maroua	MVR
4232	\N	Mucuri	MVS
4233	\N	Mataiva	MVT
4234	\N	Musgrave	MVU
4235	\N	Megeve	MVV
4236	\N	Mount Vernon	MVW
4237	\N	Minvoul	MVX
4238	\N	Masvingo	MVZ
4239	\N	Morawa	MWB
4240	\N	Mianwali	MWD
4241	\N	Merowe	MWE
4242	\N	Maewo	MWF
4243	\N	Marawaka	MWG
4244	\N	Moses Lake	MWH
4245	\N	Maramuni	MWI
4246	\N	Matthews Ridge	MWJ
4247	\N	Matak	MWK
4248	\N	Mineral Wells	MWL
4249	\N	Windom	MWM
4250	\N	Mwadui	MWN
4251	\N	Middletown	MWO
4252	\N	Magwe	MWQ
4253	\N	Motswari	MWR
4254	\N	Mount Wilson	MWS
4255	\N	Moolawatana	MWT
4256	\N	Mussau	MWU
4257	\N	Mundulkiri	MWV
4258	\N	Miranda Downs	MWY
4259	\N	Manila	MXA
4260	\N	Masamba	MXB
4261	\N	Monticello	MXC
4262	\N	Marion Downs	MXD
4263	\N	Maxton	MXE
4264	\N	Marlborough	MXG
4265	\N	Mati	MXI
4266	\N	Minna	MXJ
4267	\N	Mindik	MXK
4268	\N	Morombe	MXM
4269	\N	Morlaix	MXN
4270	\N	Monticello	MXO
4271	\N	Mirgorod	MXR
4272	\N	Maota Savaii Island	MXS
4273	\N	Maintirano	MXT
4274	\N	Mullewa	MXU
4275	\N	Moron	MXV
4276	\N	Mandalgobi	MXW
4277	\N	Mora	MXX
4278	\N	Mccarthy	MXY
4279	\N	Meixian	MXZ
4280	\N	Moruya	MYA
4281	\N	Mayoumba	MYB
4282	\N	Maracay	MYC
4283	\N	Malindi	MYD
4284	\N	Mayaguana	MYG
4285	\N	Marble Canyon	MYH
4286	\N	Murray Island	MYI
4287	\N	Matsuyama	MYJ
4288	\N	May Creek	MYK
4289	\N	Mccall	MYL
4290	\N	Monkey Mountain	MYM
4291	\N	Mareb	MYN
4292	\N	Myroodah	MYO
4293	\N	Mary	MYP
4294	\N	Mysore	MYQ
4295	\N	Myrtle Beach	MYR
4296	\N	Myitkyina	MYT
4297	\N	Marysville	MYV
4298	\N	Mtwara	MYW
4299	\N	Menyamya	MYX
4300	\N	Miri	MYY
4301	\N	Monkey Bay	MYZ
4302	\N	Mocimboa Praia	MZB
4303	\N	Mitzic	MZC
4304	\N	Mendez	MZD
4305	\N	Manatee	MZE
4306	\N	Mzamba(Wild Coast Sun)	MZF
4307	\N	Merzifon	MZH
4308	\N	Mopti	MZI
4309	\N	Marana	MZJ
4310	\N	Marakei	MZK
4311	\N	Manizales	MZL
4312	\N	Minj	MZN
4313	\N	Manzanillo	MZO
4314	\N	Motueka	MZP
4315	\N	Mkuze	MZQ
4316	\N	Mostyn	MZS
4317	\N	Mazatlan	MZT
4318	\N	Muzaffarpur	MZU
4319	\N	Mena	MZX
4320	\N	Mossel Bay	MZY
4321	\N	Marion	MZZ
4322	\N	Macanal	NAD
4323	\N	Natitingou	NAE
4324	\N	Banaina	NAF
4325	\N	Nagpur	NAG
4326	\N	Annai	NAI
4327	\N	Nakhichevan	NAJ
4328	\N	Nakhon Ratchasima	NAK
4329	\N	Nalchik	NAL
4330	\N	Namlea	NAM
4331	\N	Nadi	NAN
4332	\N	Napoli	NAP
4333	\N	Qaanaaq	NAQ
4334	\N	Nare	NAR
4335	\N	Natal	NAT
4336	\N	Nevsehir	NAV
4337	\N	Narathiwat	NAW
4338	\N	Kapolei	NAX
4339	\N	Star Habour	NAZ
4340	\N	Nambaiyufa	NBA
4341	\N	Barrancominas	NBB
4342	\N	Naberevnye Chelny	NBC
4343	\N	Nambucca Heads	NBH
4344	\N	San Blas	NBL
4345	\N	Glenview	NBU
4346	\N	Cana Brava	NBV
4347	\N	North Caicos	NCA
4348	\N	Nice	NCE
4349	\N	Paloma Grande	NCG
4350	\N	Nachingwea	NCH
4351	\N	Necocli	NCI
4352	\N	New Chenega	NCN
4353	\N	Quonset Point	NCO
4354	\N	San Carlos	NCR
4355	\N	Newcastle	NCS
4356	\N	Nicoya	NCT
4357	\N	Nukus	NCU
4358	\N	Annecy	NCY
4359	\N	Bandanaira	NDA
4360	\N	Nouadhibou	NDB
4361	\N	Nanded	NDC
4362	\N	Sumbe	NDD
4363	\N	Mandera	NDE
4364	\N	Ndalatandos	NDF
4365	\N	Qiqihar	NDG
4366	\N	Namudi	NDI
4367	\N	N'Djamena	NDJ
4368	\N	Namdrik Island	NDK
4369	\N	Ndele	NDL
4370	\N	Mendi	NDM
4371	\N	Nadunumu	NDN
4372	\N	La Palma Del Condado	NDO
4373	\N	Nador	NDR
4374	\N	Sandstone	NDS
4375	\N	Anacostia	NDV
4376	\N	Glynco	NEA
4377	\N	Necochea	NEC
4378	\N	Negril	NEG
4379	\N	Nejjo	NEJ
4380	\N	Nekemt	NEK
4381	\N	Lakehurst	NEL
4382	\N	Whitehouse	NEN
4383	\N	Neryungri	NER
4384	\N	New Bight	NET
4385	\N	Sam Neua	NEU
4386	\N	Nevis	NEV
4387	\N	Nafoora	NFR
4388	\N	Young	NGA
4389	\N	Ningbo	NGB
4390	\N	Anegada	NGD
4391	\N	Ngaoundéré	NGE
4392	\N	Ngau Island	NGI
4393	\N	Ngala	NGL
4394	\N	Nargana	NGN
4395	\N	Nagoya	NGO
4396	\N	Ningerum	NGR
4397	\N	Nagasaki	NGS
4398	\N	Manang	NGX
4399	\N	Alameda	NGZ
4400	\N	New Halfa	NHF
4401	\N	Patuxent River	NHK
4402	\N	Nushki	NHS
4403	\N	Northolt	NHT
4404	\N	Nuku Hiva	NHV
4405	\N	Foley	NHX
4406	\N	Nimba	NIA
4407	\N	Nikolai	NIB
4408	\N	Nicosia	NIC
4409	\N	Niblack	NIE
4410	\N	Nifty	NIF
4411	\N	Nikunau	NIG
4412	\N	Niokolo Koba	NIK
4413	\N	Niamey	NIM
4414	\N	Ninilchik	NIN
4415	\N	Nioki	NIO
4416	\N	Beeville	NIR
4417	\N	Simberi Island	NIS
4418	\N	Niort	NIT
4419	\N	Nioro	NIX
4420	\N	Atsugi	NJA
4421	\N	Nizhnevartovsk	NJC
4422	\N	Nkan	NKA
4423	\N	Noonkanbah	NKB
4424	\N	Nouakchott	NKC
4425	\N	Sinak	NKD
4426	\N	Nanjing	NKG
4427	\N	Naukiti	NKI
4428	\N	Nkolo	NKL
4429	\N	Nankina	NKN
4430	\N	Ankokoambo	NKO
4431	\N	Nkongsamba	NKS
4432	\N	Nkaus	NKU
4433	\N	Nichen Cove	NKV
4434	\N	Nkayi	NKY
4435	\N	Ndola	NLA
4436	\N	Lemoore	NLC
4437	\N	Niles	NLE
4438	\N	Darnley Island	NLF
4439	\N	Nullagine	NLL
4440	\N	Nelspruit	NLP
4441	\N	Nicholson	NLS
4442	\N	Nikolaev	NLV
4443	\N	Namangan	NMA
4444	\N	Daman	NMB
4445	\N	San Miguel	NMG
4446	\N	Nomane	NMN
4447	\N	New Moon	NMP
4448	\N	Nappa Merry	NMR
4449	\N	Namsang	NMS
4450	\N	Namtu	NMT
4451	\N	Namu	NMU
4452	\N	Kenitra	NNA
4453	\N	Nangade	NND
4454	\N	Namutoni	NNI
4455	\N	Naknek	NNK
4456	\N	Nondalton	NNL
4457	\N	Naryan-Mar	NNM
4458	\N	Spiddal	NNR
4459	\N	Nan	NNT
4460	\N	Nanuque	NNU
4461	\N	Nunukan	NNX
4462	\N	Nanyang	NNY
4463	\N	Nowra	NOA
4464	\N	Nosara Beach	NOB
4465	\N	Knock	NOC
4466	\N	Norden	NOD
4467	\N	Nova Xavantina	NOK
4468	\N	Nakolik River	NOL
4469	\N	Nomad River	NOM
4470	\N	Rotima	NON
4471	\N	Naoro	NOO
4472	\N	Nordfjordur	NOR
4473	\N	Nossi-Be	NOS
4474	\N	Novato	NOT
4475	\N	Noumea	NOU
4476	\N	Huambo	NOV
4477	\N	Nipa	NPG
4478	\N	Nephi	NPH
4479	\N	New Plymouth	NPL
4480	\N	Nangapinoh	NPO
4481	\N	Napperby	NPP
4482	\N	Newport	NPT
4483	\N	San Pedro Uraba	NPU
4484	\N	Kingsville	NQI
4485	\N	Niquelandia	NQL
4486	\N	Neuquen	NQN
4487	\N	Nottingham	NQT
4488	\N	Nuqui	NQU
4489	\N	Mayport	NRB
4490	\N	Crows Landing	NRC
4491	\N	Norderney	NRD
4492	\N	Namrole	NRE
4493	\N	Narrogin	NRG
4494	\N	Shangri-la	NRI
4495	\N	Nara	NRM
4496	\N	Roosevelt Roads	NRR
4497	\N	Imperial Beach	NRS
4498	\N	Newry	NRY
4499	\N	Milton	NSE
4500	\N	Norseman	NSM
4501	\N	Scone	NSO
4502	\N	Sangley Point	NSP
4503	\N	Nakhon Si Thammarat	NST
4504	\N	Noosaville	NSV
4505	\N	Nord Sound	NSX
4506	\N	Natadola	NTA
4507	\N	Notodden	NTB
4508	\N	Santa Carolina	NTC
4509	\N	Port Hueneme	NTD
4510	\N	Nantes	NTE
4511	\N	Bintuni	NTI
4512	\N	Manti	NTJ
4513	\N	Newcastle	NTL
4514	\N	Miracema Do Norte	NTM
4515	\N	Santo Antao	NTO
4516	\N	Niuatoputapu	NTT
4517	\N	Oceana	NTU
4518	\N	Sun City	NTY
4519	\N	Numbulwar	NUB
4520	\N	En Nahud	NUD
4521	\N	Nürnberg	NUE
4522	\N	Hatton	NUF
4523	\N	Nuguria	NUG
4524	\N	Nunchia	NUH
4525	\N	Nojeh	NUJ
4526	\N	Nukutavake	NUK
4527	\N	Mountain View	NUQ
4528	\N	Nullarbor	NUR
4529	\N	Norsup	NUS
4530	\N	Nutuve	NUT
4531	\N	Nakuru	NUU
4532	\N	Neiva	NVA
4533	\N	Nevada	NVD
4534	\N	Nueva Guinea	NVG
4535	\N	Narvik	NVK
4536	\N	Novo Aripuana	NVP
4537	\N	Novgorod	NVR
4538	\N	Nevers	NVS
4539	\N	Neyveli	NVY
4540	\N	Moheli	NWA
4541	\N	Newport	NWH
4542	\N	Norwich	NWI
4543	\N	Argentia	NWP
4544	\N	Nowata	NWT
4545	\N	Willow Grove	NXX
4546	\N	New York	NYC
4547	\N	Nyeri	NYE
4548	\N	Quantico	NYG
4549	\N	Sunyani	NYI
4550	\N	Nanyuki	NYK
4551	\N	Nadym	NYM
4552	\N	Nyngan	NYN
4553	\N	Nzagi	NZA
4554	\N	Nzerekore	NZE
4555	\N	Manzhouli	NZH
4556	\N	South Weymouth	NZW
4557	\N	Orange	OAG
4558	\N	Jacksonville	OAJ
4559	\N	Cacoal	OAL
4560	\N	Oamaru	OAM
4561	\N	Olanchito	OAN
4562	\N	Oaxaca	OAX
4563	\N	Oban	OBA
4564	\N	Obock	OBC
4565	\N	Obano	OBD
4566	\N	Okeechobee	OBE
4567	\N	Oberpfaffenhofen	OBF
4568	\N	Obidos	OBI
4569	\N	Zoersel	OBL
4570	\N	Morobe	OBM
4571	\N	Oban	OBN
4572	\N	Aubenas	OBS
4573	\N	Oakland	OBT
4574	\N	Kobuk	OBU
4575	\N	Obo	OBX
4576	\N	Ocean Reef	OCA
4577	\N	Ocean City	OCE
4578	\N	Ocala	OCF
4579	\N	Nacogdoches	OCH
4580	\N	Oceanic	OCI
4581	\N	Ocho Rios	OCJ
4582	\N	Oceanside	OCN
4583	\N	Ocana	OCV
4584	\N	Washington	OCW
4585	\N	Ouadda	ODA
4586	\N	Oodnadatta	ODD
4587	\N	Odense	ODE
4588	\N	Odiham	ODH
4589	\N	Ouanda Djalle	ODJ
4590	\N	Cordillo Downs	ODL
4591	\N	Ord River	ODR
4592	\N	Odessa	ODS
4593	\N	Oak Harbor	ODW
4594	\N	Oudomxay	ODY
4595	\N	Vincennes	OEA
4596	\N	Ocussi	OEC
4597	\N	Paloemeu	OEM
4598	\N	Osceola	OEO
4599	\N	Ornskoldsvik	OER
4600	\N	San Antonio Oeste	OES
4601	\N	Ouango Fitini	OFI
4602	\N	Olafsfjordur	OFJ
4603	\N	Norfolk	OFK
4604	\N	Vaoto	OFU
4605	\N	Ogallala	OGA
4606	\N	Orangeburg	OGB
4607	\N	Ogden	OGD
4608	\N	Ogeranang	OGE
4609	\N	Maui	OGG
4610	\N	Ogle	OGL
4611	\N	Yonaguni Jima	OGN
4612	\N	Abengourou	OGO
4613	\N	Bongor	OGR
4614	\N	Ongava Game Reserve	OGV
4615	\N	Ohakea	OHA
4616	\N	Northeast Cape	OHC
4617	\N	Ohrid	OHD
4618	\N	Oshakati	OHI
4619	\N	Okhotsk	OHO
4620	\N	Wyk Auf Foehr	OHR
4621	\N	Kohat	OHT
4622	\N	Ourilandia	OIA
4623	\N	Norwich	OIC
4624	\N	Oil City	OIL
4625	\N	Okushiri	OIR
4626	\N	Oita	OIT
4627	\N	Okinawa	OKA
4628	\N	Orchid Beach	OKB
4629	\N	Oklahoma City	OKC
4630	\N	Okino Erabu	OKE
4631	\N	Okaukuejo	OKF
4632	\N	Okoyo	OKG
4633	\N	Oakham	OKH
4634	\N	Oki Island	OKI
4635	\N	Kokomo	OKK
4636	\N	Oksibil	OKL
4637	\N	Okmulgee	OKM
4638	\N	Okondja	OKN
4639	\N	Oksapmin	OKP
4640	\N	Okaba	OKQ
4641	\N	Yorke Island	OKR
4642	\N	Oshkosh	OKS
4643	\N	Oktiabrskij	OKT
4644	\N	Mokuti Lodge	OKU
4645	\N	Okao	OKV
4646	\N	Oakey	OKY
4647	\N	Orland	OLA
4648	\N	Olbia	OLB
4649	\N	Old Town	OLD
4650	\N	Olean	OLE
4651	\N	Olafsvik	OLI
4652	\N	Olpoi	OLJ
4653	\N	Fuerte Olimpo	OLK
4654	\N	Olympia	OLM
4655	\N	Colonia Sarmiento	OLN
4656	\N	Olomouc	OLO
4657	\N	Olsobip	OLQ
4658	\N	Nogales	OLS
4659	\N	Columbus	OLU
4660	\N	Olive Branch	OLV
4661	\N	Olney	OLY
4662	\N	Omboue	OMB
4663	\N	Ormoc	OMC
4664	\N	Oranjemund	OMD
4665	\N	Nome	OME
4666	\N	Mafraq	OMF
4667	\N	Omega	OMG
4668	\N	Urmieh	OMH
4669	\N	Omidieh	OMI
4670	\N	Omura	OMJ
4671	\N	Omak	OMK
4672	\N	Omkalai	OML
4673	\N	Marmul	OMM
4674	\N	Mostar	OMO
4675	\N	Oradea	OMR
4676	\N	Omsk	OMS
4677	\N	Oddor Meanche	OMY
4678	\N	Winona	ONA
4679	\N	Ononge	ONB
4680	\N	Ondangwa	OND
4681	\N	Onepusu	ONE
4682	\N	Oneonta	ONH
4683	\N	Moanamani	ONI
4684	\N	Oneill	ONL
4685	\N	Socorro	ONM
4686	\N	Onion Bay	ONN
4687	\N	Ontario	ONO
4688	\N	Newport	ONP
4689	\N	Monkira	ONR
4690	\N	Onslow	ONS
4691	\N	Ono I Lau	ONU
4692	\N	Colon	ONX
4693	\N	Olney	ONY
4694	\N	Oskaloosa	OOA
4695	\N	Cooma	OOM
4696	\N	Mooraberree	OOR
4697	\N	Onotoa	OOT
4698	\N	Kopasker	OPA
4699	\N	Open Bay	OPB
4700	\N	Oenpelli	OPI
4701	\N	Opelousas	OPL
4702	\N	Porto	OPO
4703	\N	Sinop	OPS
4704	\N	Balimo	OPU
4705	\N	Opuwa	OPW
4706	\N	Oran	ORA
4707	\N	Orebro	ORB
4708	\N	Orocue	ORC
4709	\N	Orleans	ORE
4710	\N	Orinduik	ORJ
4711	\N	Cork	ORK
4712	\N	Northampton	ORM
4713	\N	Oran	ORN
4714	\N	Yoro	ORO
4715	\N	Orapa	ORP
4716	\N	Norwalk	ORQ
4717	\N	Yorketown	ORR
4718	\N	Orpheus Island Resort	ORS
4719	\N	Northway	ORT
4720	\N	Oruro	ORU
4721	\N	Ormara	ORW
4722	\N	Oriximina	ORX
4723	\N	Orange Walk	ORZ
4724	\N	Osage Beach	OSB
4725	\N	Oscoda	OSC
4726	\N	Ostersund	OSD
4727	\N	Omora	OSE
4728	\N	Ossima	OSG
4729	\N	Oshkosh	OSH
4730	\N	Osijek	OSI
4731	\N	Oskarshamn	OSK
4732	\N	Mosul	OSM
4733	\N	Osan	OSN
4734	\N	Ostrava	OSR
4735	\N	Osh	OSS
4736	\N	Orsk	OSW
4737	\N	Kosciusko	OSX
4738	\N	Namsos	OSY
4739	\N	Koszalin	OSZ
4740	\N	Mota	OTA
4741	\N	Bol	OTC
4742	\N	Worthington	OTG
4743	\N	Pitu	OTI
4744	\N	Otjiwarongo	OTJ
4745	\N	Boutilimit	OTL
4746	\N	Ottumwa	OTM
4747	\N	Oaktown	OTN
4748	\N	Otto	OTO
4749	\N	Coto 47	OTR
4750	\N	Anacortes	OTS
4751	\N	Ontong Java	OTV
4752	\N	Oria	OTY
4753	\N	Kotzebue	OTZ
4754	\N	Ouagadougou	OUA
4755	\N	Oujda	OUD
4756	\N	Ouesso	OUE
4757	\N	Ouahigouya	OUG
4758	\N	Oudtshoorn	OUH
4759	\N	Ban Houei	OUI
4760	\N	Oulu	OUL
4761	\N	Oum Hadjer	OUM
4762	\N	Norman	OUN
4763	\N	Batouri	OUR
4764	\N	Ourinhos	OUS
4765	\N	Bousso	OUT
4766	\N	Ouanga	OUU
4767	\N	Zouerate	OUZ
4768	\N	Bekily	OVA
4769	\N	Novosibirsk	OVB
4770	\N	Oviedo	OVD
4771	\N	Oroville	OVE
4772	\N	Overberg	OVG
4773	\N	Ovalle	OVL
4774	\N	Olavarria	OVR
4775	\N	Owatonna	OWA
4776	\N	Norwood	OWD
4777	\N	Owendo	OWE
4778	\N	Norridgewock	OWK
4779	\N	Bissau	OXB
4780	\N	Oxford	OXC
4781	\N	Oxford	OXD
4782	\N	Oxford	OXF
4783	\N	Orientos	OXO
4784	\N	Ventura	OXR
4785	\N	Morney	OXY
4786	\N	Goya	OYA
4787	\N	Oyem	OYE
4788	\N	Moyo	OYG
4789	\N	Oiapoque	OYK
4790	\N	Moyale	OYL
4791	\N	Ouyen	OYN
4792	\N	Tres Arroyos	OYO
4793	\N	St Georges de lOyapock	OYP
4794	\N	Yosemite	OYS
4795	\N	Ozona	OZA
4796	\N	Ozamis City	OZC
4797	\N	Zaporozhye	OZH
4798	\N	Bobadilla	OZI
4799	\N	Ozark	OZR
4800	\N	Montilla	OZU
4801	\N	Ouarzazate	OZZ
4802	\N	Pa-an	PAA
4803	\N	Bilaspur	PAB
4804	\N	Paderborn	PAD
4805	\N	Everett	PAE
4806	\N	Pakuba	PAF
4807	\N	Pagadian	PAG
4808	\N	Para Chinar	PAJ
4809	\N	Hanapepe	PAK
4810	\N	Palanquero	PAL
4811	\N	Pattani	PAN
4812	\N	Palo Alto	PAO
4813	\N	Palmer	PAQ
4814	\N	Paris	PAR
4815	\N	Paros	PAS
4816	\N	Pauk	PAU
4817	\N	Paulo Afonso	PAV
4818	\N	Pambwa	PAW
4819	\N	Port De Paix	PAX
4820	\N	Pamol	PAY
4821	\N	Poza Rica	PAZ
4822	\N	Paranaiba	PBB
4823	\N	Puerto Berrio	PBE
4824	\N	Pine Bluff	PBF
4825	\N	Paro	PBH
4826	\N	Paama	PBJ
4827	\N	Pack Creek	PBK
4828	\N	Puerto Cabello	PBL
4829	\N	Porto Amboim	PBN
4830	\N	Pimenta Bueno	PBQ
4831	\N	Puerto Barrios	PBR
4832	\N	Patong Beach	PBS
4833	\N	Puerto Leda	PBT
4834	\N	Putao	PBU
4835	\N	Porto Dos Gauchos	PBV
4836	\N	Palibelo	PBW
4837	\N	Porto Alegre Do Norte	PBX
4838	\N	Peppers Palm Bay	PBY
4839	\N	Plettenberg Bay	PBZ
4840	\N	Portage Creek	PCA
4841	\N	Puerto Rico	PCC
4842	\N	Prairie Du Chien	PCD
4843	\N	Painter Creek	PCE
4844	\N	Paso Caballos	PCG
4845	\N	Palacios	PCH
4846	\N	Puerto La Victoria	PCJ
4847	\N	Porcupine Creek	PCK
4848	\N	Pucallpa	PCL
4849	\N	Playa Del Carmen	PCM
4850	\N	Picton	PCN
4851	\N	Punta Colorada	PCO
4852	\N	Principe	PCP
4853	\N	Phongsaly	PCQ
4854	\N	Picos	PCS
4855	\N	Princeton	PCT
4856	\N	Picayune	PCU
4857	\N	Punta Chivato	PCV
4858	\N	Puerto Inirida	PDA
4859	\N	Pedro Bay	PDB
4860	\N	Mueo	PDC
4861	\N	Ponta de Ouro	PDD
4862	\N	Pandie Pandie	PDE
4863	\N	Prado	PDF
4864	\N	Padang	PDG
4865	\N	Pindiu	PDI
4866	\N	Ponta Delgada	PDL
4867	\N	Parndana	PDN
4868	\N	Pendopo	PDO
4869	\N	Presidente Dutra	PDR
4870	\N	Piedras Negras	PDS
4871	\N	Paysandu	PDU
4872	\N	Plovdiv	PDV
4873	\N	Portland	PDX
4874	\N	Pedernales	PDZ
4875	\N	Penneshaw	PEA
4876	\N	Pebane	PEB
4877	\N	Pelican	PEC
4878	\N	Pardubice	PED
4879	\N	Perm	PEE
4880	\N	Peenemuende	PEF
4881	\N	Perugia	PEG
4882	\N	Pehuajo	PEH
4883	\N	Pereira	PEI
4884	\N	Peschiei	PEJ
4885	\N	Pelaneng	PEL
4886	\N	Puerto Maldonado	PEM
4887	\N	Peppimenarti	PEP
4888	\N	Pecos City	PEQ
4889	\N	Perth	PER
4890	\N	Petrozavodsk	PES
4891	\N	Pecs	PEV
4892	\N	Peshawar	PEW
4893	\N	Penong	PEY
4894	\N	Penza	PEZ
4895	\N	Paf Warren	PFA
4896	\N	Pacific City	PFC
4897	\N	Port Frederick	PFD
4898	\N	Patreksfjordur	PFJ
4899	\N	Paphos	PFO
4900	\N	Ilebo	PFR
4901	\N	Page	PGA
4902	\N	Pangoa	PGB
4903	\N	Petersburg	PGC
4904	\N	Punta Gorda	PGD
4905	\N	Yegepa	PGE
4906	\N	Pantnagar	PGH
4907	\N	Chitato	PGI
4908	\N	Pangkalpinang	PGK
4909	\N	Pascagoula	PGL
4910	\N	Pangia	PGN
4911	\N	Pagosa Springs	PGO
4912	\N	Porto Alegre	PGP
4913	\N	Paragould	PGR
4914	\N	Peach Springs	PGS
4915	\N	Greenville	PGV
4916	\N	Perigueux	PGX
4917	\N	Phan Rang	PHA
4918	\N	Parnaiba	PHB
4919	\N	Port Harcourt	PHC
4920	\N	New Philadelphia	PHD
4921	\N	Newport News	PHF
4922	\N	Phan Thiet	PHH
4923	\N	Pinheiro	PHI
4924	\N	Pahokee	PHK
4925	\N	Port Huron	PHN
4926	\N	Philip	PHP
4927	\N	Pacific Harbor	PHR
4928	\N	Phitsanulok	PHS
4929	\N	Paris	PHT
4930	\N	Phu Vinh	PHU
4931	\N	Phalaborwa	PHW
4932	\N	Phoenix	PHX
4933	\N	Phetchabun	PHY
4934	\N	Phi Phi Island	PHZ
4935	\N	Pine Cay	PIC
4936	\N	Pingtung	PIF
4937	\N	Pitinga	PIG
4938	\N	Pilar	PIL
4939	\N	Pine Mountain	PIM
4940	\N	Pisco	PIO
4941	\N	Pipillipai	PIQ
4942	\N	Poitiers	PIS
4943	\N	Pittsburgh	PIT
4944	\N	Piura	PIU
4945	\N	Pirapora	PIV
4946	\N	Pikwitonei	PIW
4947	\N	Pajala	PJA
4948	\N	Payson	PJB
4949	\N	Pedro Juan Caballero	PJC
4950	\N	Port San Juan	PJS
4951	\N	Puerto Juarez	PJZ
4952	\N	Parkersburg	PKB
4953	\N	Petropavlovsk-Kamchats	PKC
4954	\N	Park Rapids	PKD
4955	\N	Park Falls	PKF
4956	\N	Pangkor	PKG
4957	\N	Porto Kheli	PKH
4958	\N	Playa Grande	PKJ
4959	\N	Pakokku	PKK
4960	\N	Pakatoa Island	PKL
4961	\N	Port Kaituma	PKM
4962	\N	Pangkalanbuun	PKN
4963	\N	Parakou	PKO
4964	\N	Puka Puka	PKP
4965	\N	Pokhara	PKR
4966	\N	Paksane	PKS
4967	\N	Port Keats	PKT
4968	\N	Pekanbaru	PKU
4969	\N	Pskov	PKV
4970	\N	Selebi-Phikwe	PKW
4971	\N	Pakse	PKZ
4972	\N	Planadas	PLA
4973	\N	Planeta Rica	PLC
4974	\N	Playa Samara	PLD
4975	\N	Paiela	PLE
4976	\N	Pala	PLF
4977	\N	Plymouth	PLH
4978	\N	Palm Island	PLI
4979	\N	Placencia	PLJ
4980	\N	Point Lookout	PLK
4981	\N	Palembang	PLM
4982	\N	Port Lincoln	PLO
4983	\N	La Palma	PLP
4984	\N	Klaipeda	PLQ
4985	\N	Pell City	PLR
4986	\N	Plato	PLT
4987	\N	Poltava	PLV
4988	\N	Palu	PLW
4989	\N	Plymouth	PLY
4990	\N	Port Elizabeth	PLZ
4991	\N	Pembina	PMB
4992	\N	Puerto Montt	PMC
4993	\N	Palmdale	PMD
4994	\N	Portsmouth	PME
4995	\N	Ponta Pora	PMG
4996	\N	Portsmouth	PMH
4997	\N	Palm Island	PMK
4998	\N	Phanom Sarakham	PMM
4999	\N	Pumani	PMN
5000	\N	Palermo	PMO
5001	\N	Pimaga	PMP
5002	\N	Palmerston North	PMR
5003	\N	Palmyra	PMS
5004	\N	Paramakotoi	PMT
5005	\N	Paimiut	PMU
5006	\N	Palmer	PMX
5007	\N	Puerto Madryn	PMY
5008	\N	Palmar	PMZ
5009	\N	Pamplona	PNA
5010	\N	Porto Nacional	PNB
5011	\N	Ponca City	PNC
5012	\N	Punta Gorda	PND
5013	\N	Paranagua	PNG
5014	\N	Phnom Penh	PNH
5015	\N	Pohnpei	PNI
5016	\N	Peng Lai	PNJ
5017	\N	Pontianak	PNK
5018	\N	Princeton	PNN
5019	\N	Pinotepa Nacional	PNO
5020	\N	Popondetta	PNP
5021	\N	Pointe-Noire	PNR
5022	\N	Puerto Natales	PNT
5023	\N	Panguitch	PNU
5024	\N	Panevezys	PNV
5025	\N	Sherman-Denison	PNX
5026	\N	Porto Alegre	POA
5027	\N	La Verne	POC
5028	\N	Podor	POD
5029	\N	Fort Polk	POE
5030	\N	Poplar Bluff	POF
5031	\N	Port Gentil	POG
5032	\N	Pocahontas	POH
5033	\N	Potosi	POI
5034	\N	Pemba	POL
5035	\N	Poptun	PON
5036	\N	Pocos De Caldas	POO
5037	\N	Polk Inlet	POQ
5038	\N	Pori	POR
5039	\N	Port Antonio	POT
5040	\N	Poughkeepsie	POU
5041	\N	Presov	POV
5042	\N	Portoroz	POW
5043	\N	Powell	POY
5044	\N	Poznan	POZ
5045	\N	Pampa	PPA
5046	\N	Presidente Prudente	PPB
5047	\N	Prospect Creek	PPC
5048	\N	Puerto Penasco	PPE
5049	\N	Parsons	PPF
5050	\N	Pago Pago	PPG
5051	\N	Peraitepuy	PPH
5052	\N	Port Pirie	PPI
5053	\N	Pulau Panjang	PPJ
5054	\N	Phaplu	PPL
5055	\N	Pompano Beach	PPM
5056	\N	Popayan	PPN
5057	\N	Powell Point	PPO
5058	\N	Paraparaumu	PPQ
5059	\N	Pasir Pangarayan	PPR
5060	\N	Papeete	PPT
5061	\N	Papun	PPU
5062	\N	Port Protection	PPV
5063	\N	Papa Westray	PPW
5064	\N	Param	PPX
5065	\N	Pouso Alegre	PPY
5066	\N	Puerto Paez	PPZ
5067	\N	Phu Quoc	PQC
5068	\N	Presque Isle	PQI
5069	\N	Palenque	PQM
5070	\N	Qeqertaq	PQT
5071	\N	Parana	PRA
5072	\N	Paso Robles	PRB
5073	\N	Pardoo	PRD
5074	\N	Pore	PRE
5075	\N	Port Johnson	PRF
5076	\N	Prague	PRG
5077	\N	Phrae	PRH
5078	\N	Praslin Island	PRI
5079	\N	Capri	PRJ
5080	\N	Prieska	PRK
5081	\N	Port Oceanic	PRL
5082	\N	Portimao	PRM
5083	\N	Perry	PRO
5084	\N	Propriano	PRP
5085	\N	Pres. Roque Saenz Pena	PRQ
5086	\N	Paruima	PRR
5087	\N	Parasi	PRS
5088	\N	Point Retreat	PRT
5089	\N	Prome	PRU
5090	\N	Prerov	PRV
5091	\N	Prentice	PRW
5092	\N	Paris	PRX
5093	\N	Pretoria	PRY
5094	\N	Prineville	PRZ
5095	\N	Pisa	PSA
5096	\N	Bellefonte	PSB
5097	\N	Port Said	PSD
5098	\N	Ponce	PSE
5099	\N	Pittsfield	PSF
5100	\N	Petersburg	PSG
5101	\N	St Peter	PSH
5102	\N	Pasni	PSI
5103	\N	Poso	PSJ
5104	\N	Dublin	PSK
5105	\N	Perth	PSL
5106	\N	Palestine	PSN
5107	\N	Pasto	PSO
5108	\N	Palm Springs	PSP
5109	\N	Pescara	PSR
5110	\N	Posadas	PSS
5111	\N	Preston	PST
5112	\N	Papa Stour	PSV
5113	\N	Passos	PSW
5114	\N	Palacios	PSX
5115	\N	Port Stanley	PSY
5116	\N	Puerto Suarez	PSZ
5117	\N	Port Alsworth	PTA
5118	\N	Petersburg	PTB
5119	\N	Port Alice	PTC
5120	\N	Port Alexander	PTD
5121	\N	Malololailai	PTF
5122	\N	Port Douglas	PTI
5123	\N	Portland	PTJ
5124	\N	Pontiac	PTK
5125	\N	Port Armstrong	PTL
5126	\N	Palmarito	PTM
5127	\N	Patterson	PTN
5128	\N	Pato Branco	PTO
5129	\N	Porto de Moz	PTQ
5130	\N	Pleasant Harbour	PTR
5131	\N	Pittsburg	PTS
5132	\N	Pratt	PTT
5133	\N	Porterville	PTV
5134	\N	Pottstown	PTW
5135	\N	Pitalito	PTX
5136	\N	Panama City	PTY
5137	\N	Pastaza	PTZ
5138	\N	Puas	PUA
5139	\N	Price	PUC
5140	\N	Puerto Deseado	PUD
5141	\N	Pau	PUF
5142	\N	Port Augusta	PUG
5143	\N	Pochutla	PUH
5144	\N	Pureni	PUI
5145	\N	Higuey	PUJ
5146	\N	Pukarua	PUK
5147	\N	Poulsbo	PUL
5148	\N	Pomala	PUM
5149	\N	Punia	PUN
5150	\N	Prudhoe Bay	PUO
5151	\N	Po	PUP
5152	\N	Puerto Rico	PUR
5153	\N	Busan	PUS
5154	\N	Puttaparthi	PUT
5155	\N	Puerto Asis	PUU
5156	\N	Poum	PUV
5157	\N	Puerto Varas	PUX
5158	\N	Pula	PUY
5159	\N	Puerto Cabezas	PUZ
5160	\N	Providencia	PVA
5161	\N	Provincetown	PVC
5162	\N	El Porvenir	PVE
5163	\N	Placerville	PVF
5164	\N	Paranavai	PVI
5165	\N	Preveza	PVK
5166	\N	Portoviejo	PVO
5167	\N	Puerto Vallarta	PVR
5168	\N	Provideniya	PVS
5169	\N	Plainview	PVW
5170	\N	Pope Vanoy	PVY
5171	\N	Painesville	PVZ
5172	\N	Plentywood	PWD
5173	\N	Pevek	PWE
5174	\N	Pawi	PWI
5175	\N	Purwokerto	PWL
5176	\N	Pitts Town	PWN
5177	\N	Pweto	PWO
5178	\N	Pavlodar	PWQ
5179	\N	Port Walter	PWR
5180	\N	Bremerton	PWT
5181	\N	Polacca	PXL
5182	\N	Surin	PXR
5183	\N	Puerto De Santa Maria	PXS
5184	\N	Puerto Boyaca	PYA
5185	\N	Jeypore	PYB
5186	\N	Penrhyn Island	PYE
5187	\N	Puerto Ayacucho	PYH
5188	\N	Perry Island	PYL
5189	\N	Plymouth	PYM
5190	\N	Payan	PYN
5191	\N	Putumayo	PYO
5192	\N	Pyrgos	PYR
5193	\N	Yaviza	PYV
5194	\N	Pattaya	PYX
5195	\N	Paz De Ariporo	PZA
5196	\N	Pietermaritzburg	PZB
5197	\N	Penzance	PZE
5198	\N	Zhob	PZH
5199	\N	Panzhihua	PZI
5200	\N	Puka Puka	PZK
5201	\N	Phinda	PZL
5202	\N	Puerto Ordaz	PZO
5203	\N	Piestany	PZY
5204	\N	Copper Mountain	QCE
5205	\N	Selje	QFK
5206	\N	Maloy	QFQ
5207	\N	Attu	QGQ
5208	\N	Per	QGY
5209	\N	Husum	QHU
5210	\N	Skagen Z7	QJV
5211	\N	Keystone	QKS
5212	\N	Lausanne	QLS
5213	\N	Montvale	QMV
5214	\N	Queretaro	QRO
5215	\N	Winter Park	QWP
5216	\N	Szeged	QZD
5217	\N	Rakanda	RAA
5218	\N	Racine	RAC
5219	\N	Arar	RAE
5220	\N	Raglan	RAG
5221	\N	Rafha	RAH
5222	\N	Marrakech	RAK
5223	\N	Riverside	RAL
5224	\N	Ramingining	RAM
5225	\N	Ravenna	RAN
5226	\N	Ribeirao Preto	RAO
5227	\N	Rapid City	RAP
5228	\N	Raha	RAQ
5229	\N	Rarotonga	RAR
5230	\N	Rasht	RAS
5231	\N	Raduzhnyi	RAT
5232	\N	Cravo Norte	RAV
5233	\N	Arawa	RAW
5234	\N	Oram	RAX
5235	\N	Rawala Kot	RAZ
5236	\N	Rabat	RBA
5237	\N	Borba	RBB
5238	\N	Robinvale	RBC
5239	\N	Ratanakiri	RBE
5240	\N	Big Bear	RBF
5241	\N	Roseburg	RBG
5242	\N	Brooks Lodge	RBH
5243	\N	Rabi	RBI
5244	\N	Rebun	RBJ
5245	\N	Rancho	RBK
5246	\N	Red Bluff	RBL
5247	\N	Straubing	RBM
5248	\N	Fort Jefferson	RBN
5249	\N	Robore	RBO
5250	\N	Rabaraba	RBP
5251	\N	Rurrenabaque	RBQ
5252	\N	Orbost	RBS
5253	\N	Marsabit	RBT
5254	\N	Roebourne	RBU
5255	\N	Ramata	RBV
5256	\N	Walterboro	RBW
5257	\N	Ruby	RBY
5258	\N	Richards Bay	RCB
5259	\N	Rockdale	RCK
5260	\N	Redcliffe	RCL
5261	\N	Richmond	RCM
5262	\N	American River	RCN
5263	\N	Rochefort	RCO
5264	\N	Cinder River	RCP
5265	\N	Reconquista	RCQ
5266	\N	Rochester	RCR
5267	\N	Rochester	RCS
5268	\N	Reed City	RCT
5269	\N	Rio Cuarto	RCU
5270	\N	Rockhampton Downs	RDA
5271	\N	Red Dog	RDB
5272	\N	Redencao	RDC
5273	\N	Merdey	RDE
5274	\N	Reading	RDG
5275	\N	Redmond	RDM
5276	\N	Red River	RDR
5277	\N	Rincon de los Sauces	RDS
5278	\N	Richard Toll	RDT
5279	\N	Reao	REA
5280	\N	Rechlin	REB
5281	\N	Recife	REC
5282	\N	Reedsville	RED
5283	\N	Reggio Calabria	REG
5284	\N	Rehoboth Beach	REH
5285	\N	Regina	REI
5286	\N	Reykjavik	REK
5287	\N	Trelew	REL
5288	\N	Orenburg	REN
5289	\N	Rome	REO
5290	\N	Siem Reap	REP
5291	\N	Retalhuleu	RER
5292	\N	Resistencia	RES
5293	\N	Reus	REU
5294	\N	Rewa	REW
5295	\N	Reynosa	REX
5296	\N	Reyes	REY
5297	\N	Resende	REZ
5298	\N	Rafai	RFA
5299	\N	Refugio	RFG
5300	\N	Anguilla	RFK
5301	\N	Raufarhofn	RFN
5302	\N	Raiatea	RFP
5303	\N	Rio Frio	RFR
5304	\N	Rosita	RFS
5305	\N	Rio Grande	RGA
5306	\N	Porgera	RGE
5307	\N	Balurghat	RGH
5308	\N	Rangiroa	RGI
5309	\N	Rio Gallegos	RGL
5310	\N	Yangon	RGN
5311	\N	Ranger	RGR
5312	\N	Rengat	RGT
5313	\N	Reykholar	RHA
5314	\N	Reims	RHE
5315	\N	Ruhengeri	RHG
5316	\N	Rhinelander	RHI
5317	\N	Roy Hill	RHL
5318	\N	Rosh Pina	RHN
5319	\N	Rhodes	RHO
5320	\N	Ramechhap	RHP
5321	\N	Riberalta	RIB
5322	\N	Richmond	RID
5323	\N	Rice Lake	RIE
5324	\N	Richfield	RIF
5325	\N	Rioja	RIJ
5326	\N	Carrillo	RIK
5327	\N	Rifle	RIL
5328	\N	Rodriguez De Mendoza	RIM
5329	\N	Ringi Cove	RIN
5330	\N	Rio de Janeiro	RIO
5331	\N	Rishiri	RIS
5332	\N	Rio Tigre	RIT
5333	\N	Riga	RIX
5334	\N	Rio Alzucar	RIZ
5335	\N	Rajahmundry	RJA
5336	\N	Rajbiraj	RJB
5337	\N	Rajouri	RJI
5338	\N	Rijeka	RJK
5339	\N	Logrono	RJL
5340	\N	Rafsanjan	RJN
5341	\N	Yreka	RKC
5342	\N	Rock Hill	RKH
5343	\N	Rokot	RKI
5344	\N	Sipora	RKO
5345	\N	Rockport	RKP
5346	\N	Poteau	RKR
5347	\N	Rock Springs	RKS
5348	\N	Yule Island	RKU
5349	\N	Rockwood	RKW
5350	\N	Rokeby	RKY
5351	\N	Rolla	RLA
5352	\N	Richland	RLD
5353	\N	Merlo	RLO
5354	\N	Rosella Plains	RLP
5355	\N	Arlit	RLT
5356	\N	Bornite	RLU
5357	\N	Roma	RMA
5358	\N	Buraimi	RMB
5359	\N	Ramagundam	RMD
5360	\N	Rome	RMG
5361	\N	Rimini	RMI
5362	\N	Renmark	RMK
5363	\N	Rumginae	RMN
5364	\N	Rampart	RMP
5365	\N	Ramstein	RMS
5366	\N	Arona	RNA
5367	\N	Ronneby	RNB
5368	\N	Mcminnville	RNC
5369	\N	Roanne	RNE
5370	\N	Rangely	RNG
5371	\N	New Richmond	RNH
5372	\N	Corn Island	RNI
5373	\N	Yoronjima	RNJ
5374	\N	Rennell	RNL
5375	\N	Reno	RNO
5376	\N	Robinson River	RNR
5377	\N	Renton	RNT
5378	\N	Ranau	RNU
5379	\N	Rensselaer	RNZ
5380	\N	Rochester	ROC
5381	\N	Robertson	ROD
5382	\N	Rogers	ROG
5383	\N	Robinhood	ROH
5384	\N	Rockhampton	ROK
5385	\N	Roosevelt	ROL
5386	\N	Rome	ROM
5387	\N	Rondon	RON
5388	\N	Rota	ROP
5389	\N	Rosario	ROS
5390	\N	Rotorua	ROT
5391	\N	Rousse	ROU
5392	\N	Roseau	ROX
5393	\N	Rio Mayo	ROY
5394	\N	Rolpa	RPA
5395	\N	Roper Bar	RPB
5396	\N	Ngukurr	RPM
5397	\N	Rosh Pina	RPN
5398	\N	Raipur	RPR
5399	\N	Roper Valley	RPV
5400	\N	Roundup	RPX
5401	\N	Ronda	RRA
5402	\N	Marree	RRE
5403	\N	Barora	RRI
5404	\N	Rourkela	RRK
5405	\N	Merrill	RRL
5406	\N	Marromeu	RRM
5407	\N	Serra Norte	RRN
5408	\N	Naples	RRO
5409	\N	Warroad	RRT
5410	\N	Robinson River	RRV
5411	\N	Santa Rosa	RSA
5412	\N	Roseberth	RSB
5413	\N	Serra Pelada	RSG
5414	\N	Rio Sidra	RSI
5415	\N	Rosario	RSJ
5416	\N	Ransiki	RSK
5417	\N	Russell	RSL
5418	\N	Ruston	RSN
5419	\N	Raspberry Strait	RSP
5420	\N	Roseires	RSS
5421	\N	Rouses Point	RSX
5422	\N	Roatan	RTB
5423	\N	Ratnagiri	RTC
5424	\N	Rotunda	RTD
5425	\N	Marguerite Bay	RTE
5426	\N	Ruteng	RTG
5427	\N	Roti	RTI
5428	\N	Spirit Lake	RTL
5429	\N	Rotterdam	RTM
5430	\N	Raton	RTN
5431	\N	Rutland Plains	RTP
5432	\N	Rottnest Island	RTS
5433	\N	Saratov	RTW
5434	\N	Merty	RTY
5435	\N	Arua	RUA
5436	\N	Yuruf	RUF
5437	\N	Rugao	RUG
5438	\N	Riyadh	RUH
5439	\N	Ruidoso	RUI
5440	\N	Rukumkot	RUK
5441	\N	Rumjatar	RUM
5442	\N	Rupsi	RUP
5443	\N	Marau Sound	RUS
5444	\N	Rutland	RUT
5445	\N	Ruti	RUU
5446	\N	Rubelsanto	RUV
5447	\N	Copan	RUY
5448	\N	Farafangana	RVA
5449	\N	Rivercess	RVC
5450	\N	Rio Verde	RVD
5451	\N	Saravena	RVE
5452	\N	Rovaniemi	RVN
5453	\N	Reivilo	RVO
5454	\N	Green River	RVR
5455	\N	Rivera	RVY
5456	\N	Rowan Bay	RWB
5457	\N	Redwood Falls	RWF
5458	\N	Rocky Mount	RWI
5459	\N	Rawlins	RWL
5460	\N	Rovno	RWN
5461	\N	Sumare	RWS
5462	\N	Raudha	RXA
5463	\N	Roxas City	RXS
5464	\N	Rybinsk	RYB
5465	\N	Rahim Yar Khan	RYK
5466	\N	Royan	RYN
5467	\N	Rio Turbio	RYO
5468	\N	Santa Cruz	RZA
5469	\N	Rzeszow	RZE
5470	\N	Ryazan	RZN
5471	\N	Taytay Sandoval	RZP
5472	\N	Roanoke Rapids	RZZ
5473	\N	Saratoga	SAA
5474	\N	Safford	SAD
5475	\N	Sangir	SAE
5476	\N	Sagwon	SAG
5477	\N	Sanaa	SAH
5478	\N	Saudarkrokur	SAK
5479	\N	Salamo	SAM
5480	\N	San Diego	SAN
5481	\N	Sao Paulo	SAO
5482	\N	San Andros	SAQ
5483	\N	Sparta	SAR
5484	\N	Salton City	SAS
5485	\N	Sawu	SAU
5486	\N	Savannah	SAV
5487	\N	Siena	SAY
5488	\N	Sasstown	SAZ
5489	\N	Santa Barbara	SBA
5490	\N	Santa Barbara de Barinas	SBB
5491	\N	Selbang	SBC
5492	\N	Suabi	SBE
5493	\N	Sardeh Band	SBF
5494	\N	Sabang	SBG
5495	\N	Gustavia	SBH
5496	\N	Koundara	SBI
5497	\N	Sao Mateus	SBJ
5498	\N	Tremuson	SBK
5499	\N	Santa Ana	SBL
5500	\N	Sheboygan	SBM
5501	\N	South Bend	SBN
5502	\N	Sibi	SBQ
5503	\N	Saibai Island	SBR
5504	\N	Steamboat Springs	SBS
5505	\N	San Bernardino	SBT
5506	\N	Springbok	SBU
5507	\N	Sabah	SBV
5508	\N	Shelby	SBX
5509	\N	Sibiu	SBZ
5510	\N	Santa Catalina	SCA
5511	\N	Scribner	SCB
5512	\N	Sulaco	SCD
5513	\N	Spring Creek	SCG
5514	\N	Schenectady	SCH
5515	\N	San Cristobal	SCI
5516	\N	Smith Cove	SCJ
5517	\N	Saarbruecken	SCN
5518	\N	Aktau	SCO
5519	\N	St Crepin	SCP
5520	\N	Socotra	SCT
5521	\N	Suceava	SCV
5522	\N	Syktyvkar	SCW
5523	\N	Salina Cruz	SCX
5524	\N	Puerto Baquerizo Moreno	SCY
5525	\N	Santa Cruz Island	SCZ
5526	\N	Saldanha Bay	SDB
5527	\N	Sandcreek	SDC
5528	\N	Sanandaj	SDG
5529	\N	Santa Rosa Copan	SDH
5530	\N	Saidor	SDI
5531	\N	Sandakan	SDK
5532	\N	Sundsvall	SDL
5533	\N	Sandane	SDN
5534	\N	Ryotsu Sado Island	SDO
5535	\N	Santo Domingo	SDQ
5536	\N	Santander	SDR
5537	\N	Sado Shima	SDS
5538	\N	Saidu Sharif	SDT
5539	\N	Sedona	SDX
5540	\N	Sidney	SDY
5541	\N	Seattle	SEA
5542	\N	Sebha	SEB
5543	\N	Sebring	SEF
5544	\N	Selinsgrove	SEG
5545	\N	Senggeh	SEH
5546	\N	Senhor Do Bonfim	SEI
5547	\N	Seoul	SEL
5548	\N	Seguela	SEO
5549	\N	Stephenville	SEP
5550	\N	Sungai Pakning	SEQ
5551	\N	Seymour	SER
5552	\N	Selma	SES
5553	\N	San Esteban	SET
5554	\N	Severodoneck	SEV
5555	\N	Siwa	SEW
5556	\N	Selibaby	SEY
5557	\N	St Francois	SFC
5558	\N	San Fernando De Apure	SFD
5559	\N	San Fernando	SFE
5560	\N	San Felipe	SFH
5561	\N	Soure	SFK
5562	\N	Sanford	SFM
5563	\N	Surfers Paradise	SFP
5564	\N	San Fernando	SFR
5565	\N	Skelleftea	SFT
5566	\N	Safia	SFU
5567	\N	Santa Fe Do Sul	SFV
5568	\N	Santa Fe	SFW
5569	\N	San Felix	SFX
5570	\N	Pawtucket	SFZ
5571	\N	Sheghnan	SGA
5572	\N	Singaua	SGB
5573	\N	Surgut	SGC
5574	\N	Siegen	SGE
5575	\N	Springfield	SGF
5576	\N	Simanggang	SGG
5577	\N	Springfield	SGH
5578	\N	Sargodha	SGI
5579	\N	Sagarai	SGJ
5580	\N	Sangapi	SGK
5581	\N	San Ignacio	SGM
5582	\N	Ho Chi Minh City	SGN
5583	\N	St George	SGO
5584	\N	Shay Gap	SGP
5585	\N	Sanggata	SGQ
5586	\N	Stuttgart	SGT
5587	\N	Saint George	SGU
5588	\N	Sierra Grande	SGV
5589	\N	Saginaw Bay	SGW
5590	\N	Songea	SGX
5591	\N	Songkhla	SGZ
5592	\N	Shanghai	SHA
5593	\N	Nakashibetsu	SHB
5594	\N	Shenyang	SHE
5595	\N	Shimojishima	SHI
5596	\N	Sharjah	SHJ
5597	\N	Sehonghong	SHK
5598	\N	Shillong	SHL
5599	\N	Shelton	SHN
5600	\N	Sokcho	SHO
5601	\N	Qinhuangdao	SHP
5602	\N	Southport	SHQ
5603	\N	Shashi	SHS
5604	\N	Shepparton	SHT
5605	\N	Smith Point	SHU
5606	\N	Shreveport	SHV
5607	\N	Sharurah	SHW
5608	\N	Shinyanga	SHY
5609	\N	Seshutes	SHZ
5610	\N	Sibiti	SIB
5611	\N	Sinop	SIC
5612	\N	Sines	SIE
5613	\N	Simara	SIF
5614	\N	Silgadi Doti	SIH
5615	\N	Sidi Ifni	SII
5616	\N	Siglufjordur	SIJ
5617	\N	Sikeston	SIK
5618	\N	Sila	SIL
5619	\N	Simbai	SIM
5620	\N	Singapore	SIN
5621	\N	Smithton	SIO
5622	\N	Singkep	SIQ
5623	\N	Sion	SIR
5624	\N	Sishen	SIS
5625	\N	Siuna	SIU
5626	\N	Sullivan	SIV
5627	\N	Sibisa	SIW
5628	\N	Singleton	SIX
5629	\N	Montague	SIY
5630	\N	Sissano	SIZ
5631	\N	San Juan	SJA
5632	\N	San Joaquin	SJB
5633	\N	San Jose	SJC
5634	\N	St John Island	SJF
5635	\N	San Pedro Jagua	SJG
5636	\N	San Juan Del Cesar	SJH
5637	\N	San Jose	SJI
5638	\N	Sarajevo	SJJ
5639	\N	Sao Jose Dos Campos	SJK
5640	\N	San Juan	SJM
5641	\N	St Johns	SJN
5642	\N	San José	SJO
5643	\N	Sao Jose Do Rio Preto	SJP
5644	\N	Sesheke	SJQ
5645	\N	San Juan D Ur	SJR
5646	\N	San Jose	SJS
5647	\N	San Angelo	SJT
5648	\N	San Javier	SJV
5649	\N	Shijiazhuang	SJW
5650	\N	Sartaneja	SJX
5651	\N	Seinajoki	SJY
5652	\N	Suki	SKC
5653	\N	Samarkand	SKD
5654	\N	Thessaloniki	SKG
5655	\N	Skikda	SKI
5656	\N	Sitkinak Island	SKJ
5657	\N	Isle Of Skye	SKL
5658	\N	Skeldon	SKM
5659	\N	Sokoto	SKO
5660	\N	Skopje	SKP
5661	\N	Sekakes	SKQ
5662	\N	Shakiso	SKR
5663	\N	Vojens	SKS
5664	\N	Sialkot	SKT
5665	\N	Skiros	SKU
5666	\N	Santa Katarina	SKV
5667	\N	Skwentna	SKW
5668	\N	Saransk	SKX
5669	\N	Sandusky	SKY
5670	\N	Salta	SLA
5671	\N	Storm Lake	SLB
5672	\N	Salt Lake City	SLC
5673	\N	Sliac	SLD
5674	\N	Salem	SLE
5675	\N	Sulayel	SLF
5676	\N	Siloam Springs	SLG
5677	\N	Sola	SLH
5678	\N	Solwezi	SLI
5679	\N	Chandler	SLJ
5680	\N	Saranac Lake	SLK
5681	\N	Salalah	SLL
5682	\N	Salamanca	SLM
5683	\N	San Luis Potosi	SLP
5684	\N	Sulphur Springs	SLR
5685	\N	Silistra	SLS
5686	\N	Salida	SLT
5687	\N	Castries	SLU
5688	\N	Simla	SLV
5689	\N	Saltillo	SLW
5690	\N	Salt Cay	SLX
5691	\N	Salekhard	SLY
5692	\N	São Luis	SLZ
5693	\N	Santa Maria	SMA
5694	\N	Cerro Sombrero	SMB
5695	\N	Santa Maria	SMC
5696	\N	Somerset	SME
5697	\N	Santa Maria	SMG
5698	\N	Sapmanga	SMH
5699	\N	Samos	SMI
5700	\N	Sim	SMJ
5701	\N	Semporna	SMM
5702	\N	Salmon	SMN
5703	\N	Santa Monica	SMO
5704	\N	Stockholm	SMP
5705	\N	Sun Moon Lake	SMT
5706	\N	Sheep Mountain	SMU
5707	\N	St Moritz	SMV
5708	\N	Smara	SMW
5709	\N	Santa Maria	SMX
5710	\N	Simenti	SMY
5711	\N	Stoelmans Eiland	SMZ
5712	\N	Snake Bay	SNB
5713	\N	Salinas	SNC
5714	\N	Seno	SND
5715	\N	San Felipe	SNF
5716	\N	San Ignacio De Velasco	SNG
5717	\N	Stanthorpe	SNH
5718	\N	Sinoe	SNI
5719	\N	San Julian	SNJ
5720	\N	Snyder	SNK
5721	\N	Shawnee	SNL
5722	\N	San Ignacio De M	SNM
5723	\N	San Quintin	SNQ
5724	\N	Salinas	SNS
5725	\N	Sabana De Torres	SNT
5726	\N	Santa Elena	SNV
5727	\N	Sabana De Mar	SNX
5728	\N	Sidney	SNY
5729	\N	Santa Cruz	SNZ
5730	\N	Soc Trang	SOA
5731	\N	Sorocaba	SOD
5732	\N	Souanke	SOE
5733	\N	Sofia	SOF
5734	\N	Sogndal	SOG
5735	\N	Solita	SOH
5736	\N	South Molle Island	SOI
5737	\N	Semongkong	SOK
5738	\N	Solomon	SOL
5739	\N	San Tome	SOM
5740	\N	Soderhamn	SOO
5741	\N	Southern Pines	SOP
5742	\N	Sorong	SOQ
5743	\N	Al Thaurah	SOR
5744	\N	Sodankyla	SOT
5745	\N	Seldovia	SOV
5746	\N	Sogamoso	SOX
5747	\N	Solenzara	SOZ
5748	\N	Spartanburg	SPA
5749	\N	Saidpur	SPD
5750	\N	Sepulot	SPE
5751	\N	Spearfish	SPF
5752	\N	Saint Petersburg	SPG
5753	\N	Sopu	SPH
5754	\N	Sapporo	SPK
5755	\N	Spangdahlem	SPM
5756	\N	Menongue	SPP
5757	\N	San Pedro	SPQ
5758	\N	San Pedro	SPR
5759	\N	Sipitang	SPT
5760	\N	Split	SPU
5761	\N	Sepik Plains	SPV
5762	\N	Spencer	SPW
5763	\N	San Pedro	SPY
5764	\N	Springdale	SPZ
5765	\N	Santa Ynez	SQA
5766	\N	Santa Ana	SQB
5767	\N	Southern Cross	SQC
5768	\N	San Luis De Pale	SQE
5769	\N	Solano	SQF
5770	\N	Sintang	SQG
5771	\N	Son-La	SQH
5772	\N	Sterling Rockfalls	SQI
5773	\N	Sidi Barani	SQK
5774	\N	San Carlos	SQL
5775	\N	São Miguel de Aragao	SQM
5776	\N	Sanana	SQN
5777	\N	Storuman	SQO
5778	\N	Siauliai	SQQ
5779	\N	Soroako	SQR
5780	\N	San Ignacio	SQS
5781	\N	Saposoa	SQU
5782	\N	Sequim	SQV
5783	\N	Skive	SQW
5784	\N	Sao Miguel do Oeste	SQX
5785	\N	Sao Lourenco Do Sul	SQY
5786	\N	Scampton	SQZ
5787	\N	Santa Rosa	SRA
5788	\N	Santa Rosa	SRB
5789	\N	Searcy	SRC
5790	\N	San Ramon	SRD
5791	\N	San Rafael	SRF
5792	\N	Semarang	SRG
5793	\N	Sarh	SRH
5794	\N	Samarinda	SRI
5795	\N	San Borja	SRJ
5796	\N	Santa Rosalia	SRL
5797	\N	Sandringham	SRM
5798	\N	Strahan	SRN
5799	\N	Santana Ramos	SRO
5800	\N	Stord	SRP
5801	\N	Sarasota	SRQ
5802	\N	Stradbroke Island	SRR
5803	\N	San Marcos	SRS
5804	\N	Soroti	SRT
5805	\N	Santa Cruz	SRU
5806	\N	Salisbury	SRW
5807	\N	Sert	SRX
5808	\N	Salvador	SSA
5809	\N	San Felipe	SSD
5810	\N	Sholapur	SSE
5811	\N	Malabo	SSG
5812	\N	Sandnessjoen	SSJ
5813	\N	Sturt Creek	SSK
5814	\N	Santa Rosalia	SSL
5815	\N	Sao Lourenco	SSO
5816	\N	Silver Plains	SSP
5817	\N	La Sarre	SSQ
5818	\N	Sara	SSR
5819	\N	Siassi	SSS
5820	\N	Santa Teresita	SST
5821	\N	White Sulphur Springs	SSU
5822	\N	Siasi	SSV
5823	\N	Stuart Island	SSW
5824	\N	Santos	SSZ
5825	\N	Skjern	STA
5826	\N	Santa Barbara Ed	STB
5827	\N	Stevens Point	STE
5828	\N	Stephen Island	STF
5829	\N	Strathmore	STH
5830	\N	St Joseph	STJ
5831	\N	Sterling	STK
5832	\N	St Louis	STL
5833	\N	Santarem	STM
5834	\N	Stockholm	STO
5835	\N	St Marys	STQ
5836	\N	Santa Rosa	STS
5837	\N	Charlotte Amalie	STT
5838	\N	Santa Cruz	STU
5839	\N	Surat	STV
5840	\N	Salto	STY
5841	\N	Santa Terezinha	STZ
5842	\N	Stuart	SUA
5843	\N	Surabaya	SUB
5844	\N	Sundance	SUC
5845	\N	Stroud	SUD
5846	\N	Sturgeon Bay	SUE
5847	\N	Sur	SUH
5848	\N	Sukhumi	SUI
5849	\N	Satu Mare	SUJ
5850	\N	Samcheok	SUK
5851	\N	Sui	SUL
5852	\N	Sun River	SUO
5853	\N	Sumenep	SUP
5854	\N	Sucua	SUQ
5855	\N	Sumbawanga	SUT
5856	\N	Superior	SUW
5857	\N	Sioux City	SUX
5858	\N	Suria	SUZ
5859	\N	Susanville	SVE
5860	\N	Save	SVF
5861	\N	Stavanger	SVG
5862	\N	Statesville	SVH
5863	\N	Svolvaer	SVJ
5864	\N	Savonlinna	SVL
5865	\N	Kuito	SVP
5866	\N	Sevilla	SVQ
5867	\N	Stevens Village	SVS
5868	\N	Savuti	SVT
5869	\N	San Salvador De	SVV
5870	\N	Sparrevohn	SVW
5871	\N	Ekaterinburg	SVX
5872	\N	Savo	SVY
5873	\N	San Antonio	SVZ
5874	\N	Shantou	SWA
5875	\N	Shaw River	SWB
5876	\N	Stawell	SWC
5877	\N	Seward	SWD
5878	\N	Siwea	SWE
5879	\N	Satwag	SWG
5880	\N	Swan Hill	SWH
5881	\N	South West Bay	SWJ
5882	\N	Spanish Wells	SWL
5883	\N	Suia-Missu	SWM
5884	\N	Sahiwal	SWN
5885	\N	Stillwater	SWO
5886	\N	Swakopmund	SWP
5887	\N	Sumbawa	SWQ
5888	\N	Silur	SWR
5889	\N	Swansea	SWS
5890	\N	Strzhewoi	SWT
5891	\N	Suwon	SWU
5892	\N	Shikarpur	SWV
5893	\N	Sweetwater	SWW
5894	\N	Shakawe	SWX
5895	\N	Sitiawan	SWY
5896	\N	Sialum	SXA
5897	\N	Sale	SXE
5898	\N	Senanga	SXG
5899	\N	Sehulea	SXH
5900	\N	Sirri Island	SXI
5901	\N	Shanshan	SXJ
5902	\N	Sligo	SXL
5903	\N	Suapan	SXN
5904	\N	Sao Felix Do Araguaia	SXO
5905	\N	Soldotna	SXQ
5906	\N	Sahabat 16	SXS
5907	\N	Taman Negara	SXT
5908	\N	Soddu	SXU
5909	\N	Salem	SXV
5910	\N	Sauren	SXW
5911	\N	Sao Felix Do Xingu	SXX
5912	\N	Sidney	SXY
5913	\N	Siirt	SXZ
5914	\N	Shemya	SYA
5915	\N	Seal Bay	SYB
5916	\N	Shiringayoc	SYC
5917	\N	Sydney	SYD
5918	\N	Sadah	SYE
5919	\N	Silva Bay	SYF
5920	\N	Syangboche	SYH
5921	\N	Shelbyville	SYI
5922	\N	Stykkisholmur	SYK
5923	\N	Simao	SYM
5924	\N	Stanton	SYN
5925	\N	Shonai	SYO
5926	\N	Santiago	SYP
5927	\N	Suncheon	SYS
5928	\N	Saint Yan	SYT
5929	\N	Sue Island	SYU
5930	\N	Sylvester	SYV
5931	\N	Sehwen Sharif	SYW
5932	\N	Sanya	SYX
5933	\N	Shiraz	SYZ
5934	\N	Soyo	SZA
5935	\N	Santa Cruz	SZC
5936	\N	Semera	SZE
5937	\N	Salzburg	SZG
5938	\N	Senipah	SZH
5939	\N	Zaisan	SZI
5940	\N	Siguanea	SZJ
5941	\N	Skukuza	SZK
5942	\N	Kansas	SZL
5943	\N	Sesriem	SZM
5944	\N	Santa Paula	SZP
5945	\N	Saenz Pena	SZQ
5946	\N	Stara Zagora	SZR
5947	\N	Stewart Island	SZS
5948	\N	S.Cristobal deL Casas	SZT
5949	\N	Segou	SZU
5950	\N	Suzhou	SZV
5951	\N	Schwerin	SZW
5952	\N	Shenzhen	SZX
5953	\N	Szymany	SZY
5954	\N	Szczecin	SZZ
5955	\N	Tarapaina	TAA
5956	\N	Tobago	TAB
5957	\N	Tacloban	TAC
5958	\N	Trinidad	TAD
5959	\N	Daegu	TAE
5960	\N	Tagbilaran	TAG
5961	\N	Taiz	TAI
5962	\N	Takamatsu	TAK
5963	\N	Tanana	TAL
5964	\N	Tampico	TAM
5965	\N	Tangalooma	TAN
5966	\N	Qingdao	TAO
5967	\N	Tapachula	TAP
5968	\N	Tarcoola	TAQ
5969	\N	Taranto	TAR
5970	\N	Tashkent	TAS
5971	\N	Poprad	TAT
5972	\N	Tauramena	TAU
5973	\N	Fiti'Uta Village	TAV
5974	\N	Tacuarembo	TAW
5975	\N	Taliabu	TAX
5976	\N	Tartu	TAY
5977	\N	Dashoguz	TAZ
5978	\N	Tabibuga	TBA
5979	\N	Tuy Hoa	TBB
5980	\N	Tuba City	TBC
5981	\N	Timbiqui	TBD
5982	\N	Timbunke	TBE
5983	\N	Tabiteuea North	TBF
5984	\N	Tabubil	TBG
5985	\N	Tabarka	TBJ
5986	\N	Timber Creek	TBK
5987	\N	Tableland	TBL
5988	\N	Tumbang Samba	TBM
5989	\N	Tumbes	TBP
5990	\N	Tarabo	TBQ
5991	\N	Statesboro	TBR
5992	\N	Tbilisi	TBS
5993	\N	Tabal	TBV
5994	\N	Tambov	TBW
5995	\N	Tsabong	TBY
5996	\N	Tennant Creek	TCA
5997	\N	Tucumcari	TCC
5998	\N	Tarapaca	TCD
5999	\N	Tulcea	TCE
6000	\N	Tocoa	TCF
6001	\N	Tacheng	TCG
6002	\N	Tchibanga	TCH
6003	\N	Tenerife	TCI
6004	\N	Torembi	TCJ
6005	\N	Tinboli	TCK
6006	\N	Tuscaloosa	TCL
6007	\N	Tehuacan	TCN
6008	\N	Tacna	TCQ
6009	\N	Truth Or Consequences	TCS
6010	\N	Takotna	TCT
6011	\N	Thaba Nchu	TCU
6012	\N	Tocumwal	TCW
6013	\N	Terrace Bay	TCY
6014	\N	Trinidad	TDA
6015	\N	Tetabedi	TDB
6016	\N	Tandag	TDG
6017	\N	Tadjoura	TDJ
6018	\N	Taldy-Kurgan	TDK
6019	\N	Tandil	TDL
6020	\N	Theda	TDN
6021	\N	Toledo	TDO
6022	\N	Theodore	TDR
6023	\N	Sasereme	TDS
6024	\N	Tanandava	TDV
6025	\N	Tela	TEA
6026	\N	Teterboro	TEB
6027	\N	Telemaco Borba	TEC
6028	\N	Thisted	TED
6029	\N	Tbessa	TEE
6030	\N	Telfer	TEF
6031	\N	Tenkodogo	TEG
6032	\N	Tetlin	TEH
6033	\N	Tezu	TEI
6034	\N	Tatitlek	TEK
6035	\N	Temora	TEM
6036	\N	Tongren	TEN
6037	\N	Terapo	TEO
6038	\N	Teptep	TEP
6039	\N	Tekirdag	TEQ
6040	\N	Tessenei	TES
6041	\N	Tete	TET
6042	\N	Te Anau	TEU
6043	\N	Thingeyri	TEY
6044	\N	Tezpur	TEZ
6045	\N	Tifalmin	TFB
6046	\N	Taormina	TFC
6047	\N	Tefe	TFF
6048	\N	Tufi	TFI
6049	\N	Teofilo Otoni	TFL
6050	\N	Telefomin	TFM
6051	\N	Ramadan	TFR
6052	\N	Taftan	TFT
6053	\N	Tagbita	TGB
6054	\N	Podgorica	TGD
6055	\N	Tuskegee	TGE
6056	\N	Tongoa	TGH
6057	\N	Tingo Maria	TGI
6058	\N	Tagula	TGL
6059	\N	Traralgon	TGN
6060	\N	Tongliao	TGO
6061	\N	Tangara da Serra	TGQ
6062	\N	Touggourt	TGR
6063	\N	Chokwe	TGS
6064	\N	Tanga	TGT
6065	\N	Targovishte	TGV
6066	\N	Tuxtla Gutierrez	TGZ
6067	\N	Tullahoma	THA
6068	\N	Thaba-Tseka	THB
6069	\N	Tchien	THC
6070	\N	Taharoa	THH
6071	\N	Tichitt	THI
6072	\N	Thakhek	THK
6073	\N	Tachilek	THL
6074	\N	Thompsonfield	THM
6075	\N	Trollhattan	THN
6076	\N	Thorshofn	THO
6077	\N	Thermopolis	THP
6078	\N	Tehran	THR
6079	\N	Sukhothai (sawankolok)	THS
6080	\N	Tamchakett	THT
6081	\N	Pituffik	THU
6082	\N	York	THV
6083	\N	Thohoyandou	THY
6084	\N	Tahoua	THZ
6085	\N	Tirana	TIA
6086	\N	Tibu	TIB
6087	\N	Tinak Island	TIC
6088	\N	Tiaret	TID
6089	\N	Tippi	TIE
6090	\N	Taif	TIF
6091	\N	Tingwon	TIG
6092	\N	Tikehau Atoll	TIH
6093	\N	Tirinkot	TII
6094	\N	Tijuana	TIJ
6095	\N	Inverlake	TIL
6096	\N	Tindouf	TIN
6097	\N	Tilin	TIO
6098	\N	Tripoli	TIP
6099	\N	Tirupati	TIR
6100	\N	Thursday Island	TIS
6101	\N	Tivat	TIV
6102	\N	Tacoma	TIW
6103	\N	Titusville	TIX
6104	\N	Tidjikja	TIY
6105	\N	Tarija	TJA
6106	\N	Tanjung Balai	TJB
6107	\N	Ticantiki	TJC
6108	\N	Tanjung Warukin	TJG
6109	\N	Trujillo	TJI
6110	\N	Tokat	TJK
6111	\N	Tyumen	TJM
6112	\N	Takume	TJN
6113	\N	Thanjavur	TJV
6114	\N	Talkeetna	TKA
6115	\N	Tekadu	TKB
6116	\N	Tiko	TKC
6117	\N	Takoradi	TKD
6118	\N	Tenakee Springs	TKE
6119	\N	Truckee	TKF
6120	\N	Bandar Lampung	TKG
6121	\N	Takhli	TKH
6122	\N	Tokeen	TKI
6123	\N	Tok	TKJ
6124	\N	Taku Lodge	TKL
6125	\N	Tikal	TKM
6126	\N	Tokunoshima	TKN
6127	\N	Tlokoeng	TKO
6128	\N	Takapoto	TKP
6129	\N	Kigoma	TKQ
6130	\N	Thakurgaon	TKR
6131	\N	Tokushima	TKS
6132	\N	Tak	TKT
6133	\N	Turku	TKU
6134	\N	Tatakoto	TKV
6135	\N	Tekin	TKW
6136	\N	Takaroa	TKX
6137	\N	Turkey Creek	TKY
6138	\N	Tokoroa	TKZ
6139	\N	Teller	TLA
6140	\N	Tarbela	TLB
6141	\N	Tuli Block	TLD
6142	\N	Telida	TLF
6143	\N	Tulagi Island	TLG
6144	\N	Tallahassee	TLH
6145	\N	Tolitoli	TLI
6146	\N	Tatalina	TLJ
6147	\N	Tallinn	TLL
6148	\N	Tol	TLO
6149	\N	Tumolbil	TLP
6150	\N	Tulare	TLR
6151	\N	Toulouse	TLS
6152	\N	Tolu	TLU
6153	\N	Tel Aviv Yafo	TLV
6154	\N	Talasea	TLW
6155	\N	Talca	TLX
6156	\N	Catalao	TLZ
6157	\N	Tifton	TMA
6158	\N	Timbedra	TMD
6159	\N	Tame	TME
6160	\N	Tomanggong	TMG
6161	\N	Tanahmerah	TMH
6162	\N	Termez	TMJ
6163	\N	Tamky	TMK
6164	\N	Tamatave	TMM
6165	\N	Tamana Island	TMN
6166	\N	Tumeremo	TMO
6167	\N	Tampere	TMP
6168	\N	Tambao	TMQ
6169	\N	Tamanrasset	TMR
6170	\N	Tambor	TMU
6171	\N	Tamworth	TMW
6172	\N	Timimoun	TMX
6173	\N	Tiom	TMY
6174	\N	Thames	TMZ
6175	\N	Jinan	TNA
6176	\N	Tanah Grogot	TNB
6177	\N	Tin City	TNC
6178	\N	Trinidad	TND
6179	\N	Tanegashima	TNE
6180	\N	Toussus-Le-Noble	TNF
6181	\N	Tangier	TNG
6182	\N	Tonghua	TNH
6183	\N	Satna	TNI
6184	\N	Tununak	TNK
6185	\N	Ternopol	TNL
6186	\N	Teniente R. Marsh Martin	TNM
6187	\N	Tainan	TNN
6188	\N	Twentynine Palms	TNP
6189	\N	Teraina	TNQ
6190	\N	Tungsten	TNS
6191	\N	Newton	TNU
6192	\N	Tabuaeran	TNV
6193	\N	Stung Treng	TNX
6194	\N	Torrance	TOA
6195	\N	Tobruk	TOB
6196	\N	Toccoa	TOC
6197	\N	Tioman	TOD
6198	\N	Tomsk	TOF
6199	\N	Togiak Village	TOG
6200	\N	Troy	TOI
6201	\N	Torokina	TOK
6202	\N	Tombouctou	TOM
6203	\N	Tonu	TON
6204	\N	San Vito	TOO
6205	\N	Topeka	TOP
6206	\N	Tocopilla	TOQ
6207	\N	Torrington	TOR
6208	\N	Tromso	TOS
6209	\N	Totness	TOT
6210	\N	Touho	TOU
6211	\N	Tortola	TOV
6212	\N	Toledo	TOW
6213	\N	Tobolsk	TOX
6214	\N	Toyama	TOY
6215	\N	Touba	TOZ
6216	\N	Tarapoa	TPC
6217	\N	Taipei	TPE
6218	\N	Taiping	TPG
6219	\N	Tonopah	TPH
6220	\N	Tapini	TPI
6221	\N	Taplejung	TPJ
6222	\N	Tapaktuan	TPK
6223	\N	Temple	TPL
6224	\N	Tiputini	TPN
6225	\N	Tanalian Point	TPO
6226	\N	Tom Price	TPR
6227	\N	Tapeta	TPT
6228	\N	Tikapur	TPU
6229	\N	Tupai	TPX
6230	\N	Taluqan	TQN
6231	\N	Tres Esquinas	TQS
6232	\N	Taramajima	TRA
6233	\N	Turbo	TRB
6234	\N	Torreon	TRC
6235	\N	Trondheim	TRD
6236	\N	Tauranga	TRG
6237	\N	Trona	TRH
6238	\N	Blountville	TRI
6239	\N	Tarakbits	TRJ
6240	\N	Terrell	TRL
6241	\N	Thermal	TRM
6242	\N	Turin	TRN
6243	\N	Taree	TRO
6244	\N	Tree Point	TRP
6245	\N	Tarauaca	TRQ
6246	\N	Trincomalee	TRR
6247	\N	Trieste	TRS
6248	\N	Tremonton	TRT
6249	\N	Tarawa	TRW
6250	\N	Trenton	TRX
6251	\N	Tororo	TRY
6252	\N	Tsumeb	TSB
6253	\N	Taisha	TSC
6254	\N	Tshipise	TSD
6255	\N	Astana	TSE
6256	\N	Tanacross	TSG
6257	\N	Tshikapa	TSH
6258	\N	Tsili Tsili	TSI
6259	\N	Taskul	TSK
6260	\N	Tamuin	TSL
6261	\N	Taos	TSM
6262	\N	Tianjin	TSN
6263	\N	Tehachapi	TSP
6264	\N	Torres	TSQ
6265	\N	Timisoara	TSR
6266	\N	Trang	TST
6267	\N	Tabiteuea South	TSU
6268	\N	Townsville	TSV
6269	\N	Tsewi	TSW
6270	\N	Tanjung Santan	TSX
6271	\N	Tasikmalaya	TSY
6272	\N	Tsetserleg	TSZ
6273	\N	Tan Tan	TTA
6274	\N	Tortoli	TTB
6275	\N	Taltal	TTC
6276	\N	Troutdale	TTD
6277	\N	Ternate	TTE
6278	\N	Tartagal	TTG
6279	\N	Thumrait	TTH
6280	\N	Tetiaroa Island	TTI
6281	\N	Tablon De Tamara	TTM
6282	\N	Britton	TTO
6283	\N	Tana Toraja	TTR
6284	\N	Tsaratanana	TTS
6285	\N	Taitung	TTT
6286	\N	Tucuman	TUC
6287	\N	Tambacounda	TUD
6288	\N	Tupile	TUE
6289	\N	Tours	TUF
6290	\N	Tuguegarao	TUG
6291	\N	Tum	TUJ
6292	\N	Tulsa	TUL
6293	\N	Tumut	TUM
6294	\N	Tunis	TUN
6295	\N	Taupo	TUO
6296	\N	Tupelo	TUP
6297	\N	Tougan	TUQ
6298	\N	Tauta	TUT
6299	\N	Tabuk	TUU
6300	\N	Tucupita	TUV
6301	\N	Tubala	TUW
6302	\N	Tumbler Ridge	TUX
6303	\N	Tulum	TUY
6304	\N	Tucuma	TUZ
6305	\N	Morafenobe	TVA
6306	\N	Traverse City	TVC
6307	\N	Thief River Falls	TVF
6308	\N	Thomasville	TVI
6309	\N	South Lake Tahoe	TVL
6310	\N	Twin Hills	TWA
6311	\N	Port Townsend	TWD
6312	\N	Taylor	TWE
6313	\N	Tewantin	TWN
6314	\N	Torwood	TWP
6315	\N	Tawau	TWU
6316	\N	Tawa	TWY
6317	\N	Teixeira de Freitas	TXF
6318	\N	Taichung	TXG
6319	\N	Teminabuan	TXM
6320	\N	Tanbar	TXR
6321	\N	Tabou	TXU
6322	\N	Tula	TYA
6323	\N	Tibooburra	TYB
6324	\N	Tynda	TYD
6325	\N	Tyonek	TYE
6326	\N	Thylungra	TYG
6327	\N	Talara	TYL
6328	\N	Staniel Cay	TYM
6329	\N	Taiyuan	TYN
6330	\N	Tokyo	TYO
6331	\N	Tobermorey	TYP
6332	\N	Knoxville	TYS
6333	\N	Treinta-y-Tres	TYT
6334	\N	Taylor	TYZ
6335	\N	Tuzla	TZL
6336	\N	Tizimin	TZM
6337	\N	South Andros	TZN
6338	\N	Trabzon	TZX
6339	\N	San Luis Rio Colorado	UAC
6340	\N	Mount Aue	UAE
6341	\N	Suai	UAI
6342	\N	Luau	UAL
6343	\N	Uaxactun	UAX
6344	\N	Uberaba	UBA
6345	\N	Mabuiag Island	UBB
6346	\N	Buin	UBI
6347	\N	Ube	UBJ
6348	\N	Ubon Ratchathni	UBP
6349	\N	Ubrub	UBR
6350	\N	Ubatuba	UBT
6351	\N	Kalumburu	UBU
6352	\N	Utica	UCA
6353	\N	Yucca Flat	UCC
6354	\N	Eunice	UCE
6355	\N	Lutsk	UCK
6356	\N	Buchanan	UCN
6357	\N	Ukhta	UCT
6358	\N	Union City	UCY
6359	\N	Undarra	UDA
6360	\N	Uden	UDE
6361	\N	Uberlandia	UDI
6362	\N	Uzhgorod	UDJ
6363	\N	Udine	UDN
6364	\N	Udomxay	UDO
6365	\N	Udaipur	UDR
6366	\N	Queenstown	UEE
6367	\N	Kumejima	UEO
6368	\N	Puertollano	UER
6369	\N	Waukesha	UES
6370	\N	Quetta	UET
6371	\N	Ufa	UFA
6372	\N	Bulgan	UGA
6373	\N	Urgench	UGC
6374	\N	Waukegan	UGN
6375	\N	Uige	UGO
6376	\N	Ugashik	UGS
6377	\N	Umnugobitour	UGT
6378	\N	Zugapa	UGU
6379	\N	Uherske Hradiste	UHE
6380	\N	Quibdo	UIB
6381	\N	Ust-Ilimsk	UIK
6382	\N	Quillayute	UIL
6383	\N	Quito	UIO
6384	\N	Quimper	UIP
6385	\N	Quine Hill	UIQ
6386	\N	Quirindi	UIR
6387	\N	Jaluit Island	UIT
6388	\N	Ujae Island	UJE
6389	\N	Ukiah	UKI
6390	\N	Waukon	UKN
6391	\N	Mukeiras	UKR
6392	\N	Quakertown	UKT
6393	\N	Nuku	UKU
6394	\N	Ust-Kut	UKX
6395	\N	San Julian	ULA
6396	\N	Ulei	ULB
6397	\N	Ulundi	ULD
6398	\N	Sule	ULE
6399	\N	Ulithi	ULI
6400	\N	Mull	ULL
6401	\N	New Ulm	ULM
6402	\N	Ulaangom	ULO
6403	\N	Quilpie	ULP
6404	\N	Tulua	ULQ
6405	\N	Mulatos	ULS
6406	\N	Gulu	ULU
6407	\N	Ulusaba	ULX
6408	\N	Punta De Maisi	UMA
6409	\N	Umba	UMC
6410	\N	Umea	UME
6411	\N	Quincemil	UMI
6412	\N	Summit	UMM
6413	\N	Woomera	UMR
6414	\N	Umiat	UMT
6415	\N	Umuarama	UMU
6416	\N	Sumy	UMY
6417	\N	Una	UNA
6418	\N	Unguia	UNC
6419	\N	Kunduz	UND
6420	\N	Qachas Nek	UNE
6421	\N	Kiunga	UNG
6422	\N	Union Island	UNI
6423	\N	Ranong	UNN
6424	\N	Underkhaan	UNR
6425	\N	Unst Shetland Island	UNT
6426	\N	Juneau	UNU
6427	\N	Buol	UOL
6428	\N	Muong Sai	UON
6429	\N	Sewanee	UOS
6430	\N	Oxford	UOX
6431	\N	Punta Alegre	UPA
6432	\N	Upala	UPL
6433	\N	Uruapan	UPN
6434	\N	Upolu Point	UPP
6435	\N	Upiara	UPR
6436	\N	Upavon	UPV
6437	\N	Queen	UQE
6438	\N	Urubupunga	URB
6439	\N	Urumqi	URC
6440	\N	Burg Feuerstein	URD
6441	\N	Kuressaare	URE
6442	\N	Uribe	URI
6443	\N	Uraj	URJ
6444	\N	Uriman	URM
6445	\N	Urgoon	URN
6446	\N	Rouen	URO
6447	\N	Urrao	URR
6448	\N	Surat Thani	URT
6449	\N	Uroubi	URU
6450	\N	Gurayat	URY
6451	\N	Uruzgan	URZ
6452	\N	Ushuaia	USH
6453	\N	Mabaruma	USI
6454	\N	Usinsk	USK
6455	\N	Useless Loop	USL
6456	\N	Usino	USO
6457	\N	Usak	USQ
6458	\N	Sancti Spiritus	USS
6459	\N	St Augustine	UST
6460	\N	Busuanga	USU
6461	\N	Mutare	UTA
6462	\N	Muttaburra	UTB
6463	\N	Utrecht	UTC
6464	\N	Nutwood Downs	UTD
6465	\N	Quthing	UTG
6466	\N	Udon Thani	UTH
6467	\N	Valkeala	UTI
6468	\N	Utirik Island	UTK
6469	\N	Torremolinos	UTL
6470	\N	Tunica	UTM
6471	\N	Upington	UTN
6472	\N	Utopia Creek	UTO
6473	\N	Uttaradit	UTR
6474	\N	Ustupo	UTU
6475	\N	Queenstown	UTW
6476	\N	Bugulma	UUA
6477	\N	Kuparuk	UUK
6478	\N	Baruun-Urt	UUN
6479	\N	Yuzhno-Sakhalinsk	UUS
6480	\N	Manumu	UUU
6481	\N	Uvalde	UVA
6482	\N	Kharga	UVL
6483	\N	Uvol	UVO
6484	\N	Ware	UWA
6485	\N	Nyala	UYL
6486	\N	Uzice	UZC
6487	\N	Unayzah	UZH
6488	\N	Curuzu Cuatia	UZU
6489	\N	Vaasa	VAA
6490	\N	Yavarate	VAB
6491	\N	Varrelbusch	VAC
6492	\N	Valence	VAF
6493	\N	Varginha	VAG
6494	\N	Vallegrande	VAH
6495	\N	Chevak	VAK
6496	\N	Valenca	VAL
6497	\N	Van	VAN
6498	\N	Suavanao	VAO
6499	\N	Valparaiso	VAP
6500	\N	Varna	VAR
6501	\N	Vatomandry	VAT
6502	\N	Vatukoula	VAU
6503	\N	Vanuabalavu	VBV
6504	\N	Visby	VBY
6505	\N	Can Tho	VCA
6506	\N	View Cove	VCB
6507	\N	Victoria River Downs	VCD
6508	\N	Venice	VCE
6509	\N	Valcheta	VCF
6510	\N	Vichadero	VCH
6511	\N	Carora	VCR
6512	\N	Victorville	VCV
6513	\N	Vidalia	VDI
6514	\N	Valle De Pascua	VDP
6515	\N	Villa Dolores	VDR
6516	\N	Vadso	VDS
6517	\N	Maikwak	VEG
6518	\N	Veracruz	VER
6519	\N	Barakoma	VEV
6520	\N	Tioga	VEX
6521	\N	Victoria Falls	VFA
6522	\N	Vologda	VGD
6523	\N	Vangrieng	VGG
6524	\N	Vigo	VGO
6525	\N	General Villegas	VGS
6526	\N	Villagarzon	VGZ
6527	\N	Van Horn	VHN
6528	\N	Vichy	VHY
6529	\N	Vahitahi	VHZ
6530	\N	Videira	VIA
6531	\N	Villa Constitucion	VIB
6532	\N	Vicenza	VIC
6533	\N	Vienna	VIE
6534	\N	Vieste	VIF
6535	\N	El Vigia	VIG
6536	\N	Vichy	VIH
6537	\N	Vinh City	VII
6538	\N	Spanish Town	VIJ
6539	\N	Kavik	VIK
6540	\N	Vinnica	VIN
6541	\N	Viqueque	VIQ
6542	\N	Vitoria	VIT
6543	\N	Viru	VIU
6544	\N	Vivigani	VIV
6545	\N	Vitoria	VIX
6546	\N	Xai Xai	VJB
6547	\N	Abingdon	VJI
6548	\N	Gurue	VJQ
6549	\N	Rach Gia	VKG
6550	\N	Vicksburg	VKS
6551	\N	Vorkuta	VKT
6552	\N	West Kavik	VKW
6553	\N	Vandalia	VLA
6554	\N	Manises	VLC
6555	\N	Valle	VLE
6556	\N	Villa Gesell	VLG
6557	\N	Port Vila	VLI
6558	\N	Volgodonsk	VLK
6559	\N	Valladolid	VLL
6560	\N	Villamontes	VLM
6561	\N	Vallejo	VLO
6562	\N	Vila Rica	VLP
6563	\N	Vallenar	VLR
6564	\N	Velikiye Luki	VLU
6565	\N	Vallemi	VMI
6566	\N	Baimuru	VMU
6567	\N	Saravane	VNA
6568	\N	Venice	VNC
6569	\N	Vangaindrano	VND
6570	\N	Vannes	VNE
6571	\N	Viengxay	VNG
6572	\N	Vilnius	VNO
6573	\N	Vanrook	VNR
6574	\N	Varanasi	VNS
6575	\N	Volgograd	VOG
6576	\N	Vohemar	VOH
6577	\N	Voinjama	VOI
6578	\N	Camp Douglas	VOK
6579	\N	Volos	VOL
6580	\N	Votuporanga	VOT
6581	\N	Voronezh	VOZ
6582	\N	Ondjiva	VPE
6583	\N	Vopnafjordur	VPN
6584	\N	Valparaiso	VPZ
6585	\N	Varadero	VRA
6586	\N	Vero Beach	VRB
6587	\N	Virac	VRC
6588	\N	Vredendal	VRE
6589	\N	Vila Real	VRL
6590	\N	Verona	VRN
6591	\N	Matanzas	VRO
6592	\N	Versailles	VRS
6593	\N	Vryburg	VRU
6594	\N	Vaeroy	VRY
6595	\N	Viseu	VSE
6596	\N	Springfield	VSF
6597	\N	Lugansk	VSG
6598	\N	Phuoclong	VSO
6599	\N	Victoria	VTA
6600	\N	Vitebsk	VTB
6601	\N	Vientiane	VTE
6602	\N	Vatulele	VTF
6603	\N	Vung Tau	VTG
6604	\N	Vittel	VTL
6605	\N	Valentine	VTN
6606	\N	Las Tunas	VTU
6607	\N	Vishakhapatnam	VTZ
6608	\N	Valledupar	VUP
6609	\N	Mvuu Camp	VUU
6610	\N	Mahanoro	VVB
6611	\N	Vastervik	VVK
6612	\N	Illizi	VVZ
6613	\N	Lichinga	VXC
6614	\N	Sao Vicente	VXE
6615	\N	Vryheid	VYD
6616	\N	Peru	VYS
6617	\N	Wales	WAA
6618	\N	Wabag	WAB
6619	\N	Waca	WAC
6620	\N	Andriamena	WAD
6621	\N	Wana	WAF
6622	\N	Wanganui	WAG
6623	\N	Wahpeton	WAH
6624	\N	Antsohihy	WAI
6625	\N	Wawoi Falls	WAJ
6626	\N	Ankazoabo	WAK
6627	\N	Chincoteague	WAL
6628	\N	Ambatondrazaka	WAM
6629	\N	Waverney	WAN
6630	\N	Wabo	WAO
6631	\N	Alto Palena	WAP
6632	\N	Antsalova	WAQ
6633	\N	Waris	WAR
6634	\N	Washington	WAS
6635	\N	Waterford	WAT
6636	\N	Wauchope	WAU
6637	\N	Wave Hill	WAV
6638	\N	Warsaw	WAW
6639	\N	Zwara	WAX
6640	\N	Waynesburg	WAY
6641	\N	Warwick	WAZ
6642	\N	Wahai	WBA
6643	\N	Wapolu	WBC
6644	\N	Befandriana	WBD
6645	\N	Bealanana	WBE
6646	\N	Schleswig-jagel	WBG
6647	\N	Wapenamanda	WBM
6648	\N	Woburn	WBN
6649	\N	Beroroha	WBO
6650	\N	Beaver	WBQ
6651	\N	Big Rapids	WBR
6652	\N	Boulder	WBU
6653	\N	Castro	WCA
6654	\N	Chaiten	WCH
6655	\N	Chandalar	WCR
6656	\N	Wadi Ain	WDA
6657	\N	Deep Bay	WDB
6658	\N	Enid	WDG
6659	\N	Windhoek	WDH
6660	\N	Wondai	WDI
6661	\N	Waldron Island	WDN
6662	\N	Winder	WDR
6663	\N	Weatherford	WEA
6664	\N	Wedau	WED
6665	\N	Weifang	WEF
6666	\N	Weihai	WEH
6667	\N	Weipa	WEI
6668	\N	Welkom	WEL
6669	\N	Weam	WEP
6670	\N	Wagethe	WET
6671	\N	Wee Waa	WEW
6672	\N	Woodford	WFD
6673	\N	Fianarantsoa	WFI
6674	\N	Frenchville	WFK
6675	\N	Bahawalnagar	WGB
6676	\N	Warangal	WGC
6677	\N	Walgett	WGE
6678	\N	Waitangi	WGN
6679	\N	Winchester	WGO
6680	\N	Waingapu	WGP
6681	\N	Wangaratta	WGT
6682	\N	Wagau	WGU
6683	\N	Wagny	WGY
6684	\N	Hyder	WHD
6685	\N	Wadi Halfa	WHF
6686	\N	Whakatane	WHK
6687	\N	Welshpool	WHL
6688	\N	Franz Josef	WHO
6689	\N	Whalsay	WHS
6690	\N	Wharton	WHT
6691	\N	Wuhu	WHU
6692	\N	Wick	WIC
6693	\N	Wiesbaden	WIE
6694	\N	Surfdale	WIK
6695	\N	Winton	WIN
6696	\N	Wilcannia	WIO
6697	\N	Wairoa	WIR
6698	\N	Witu	WIU
6699	\N	Woja	WJA
6700	\N	Lancaster	WJF
6701	\N	Wajir	WJR
6702	\N	Wanaka	WKA
6703	\N	Warracknabeal	WKB
6704	\N	Hwange	WKI
6705	\N	Aleknagik	WKK
6706	\N	Waikoloa	WKL
6707	\N	Wakunai	WKN
6708	\N	Wallal	WLA
6709	\N	Labouchere Bay	WLB
6710	\N	Walcha	WLC
6711	\N	Winfield	WLD
6712	\N	Wellington	WLG
6713	\N	Walaha	WLH
6714	\N	Selawik	WLK
6715	\N	Wollogorang	WLL
6716	\N	Waltham	WLM
6717	\N	Little Naukati	WLN
6718	\N	Waterloo	WLO
6719	\N	Loring	WLR
6720	\N	Willows	WLW
6721	\N	Mandritsara	WMA
6722	\N	Warrnambool	WMB
6723	\N	Winnemucca	WMC
6724	\N	Mandabe	WMD
6725	\N	Mount Keith	WME
6726	\N	Mountain Home	WMH
6727	\N	Meyers Chuck	WMK
6728	\N	Malaimbandy	WML
6729	\N	Mampikony	WMP
6730	\N	Mananara	WMR
6731	\N	Madirovalo	WMV
6732	\N	Wamena	WMX
6733	\N	Tuxekan Island	WNC
6734	\N	Windarra	WND
6735	\N	Wora Na Ye	WNE
6736	\N	Naga	WNP
6737	\N	Windorah	WNR
6738	\N	Nawabshah	WNS
6739	\N	Wanuma	WNU
6740	\N	Wenzhou	WNZ
6741	\N	Wonenara	WOA
6742	\N	Wood River	WOD
6743	\N	Woensdrecht	WOE
6744	\N	Wonken	WOK
6745	\N	Wollongong	WOL
6746	\N	Wondoola	WON
6747	\N	Woodchopper	WOO
6748	\N	Ankorefo	WOR
6749	\N	Willow	WOW
6750	\N	Puerto Aisen	WPA
6751	\N	Port Berge	WPB
6752	\N	Pincher Creek	WPC
6753	\N	Wrotham Park	WPK
6754	\N	Powell Lake	WPL
6755	\N	Wipim	WPM
6756	\N	Paonia	WPO
6757	\N	Porvenir	WPR
6758	\N	Puerto Williams	WPU
6759	\N	Warder	WRA
6760	\N	Whangarei	WRE
6761	\N	Wrench Creek	WRH
6762	\N	Wrightstown	WRI
6763	\N	Wroclaw	WRO
6764	\N	Warrawagine	WRW
6765	\N	Westray	WRY
6766	\N	Wirawila	WRZ
6767	\N	Wasua	WSA
6768	\N	Steamboat Bay	WSB
6769	\N	White Sands	WSD
6770	\N	Sarichef	WSF
6771	\N	Washington	WSG
6772	\N	Shirley	WSH
6773	\N	San Juan	WSJ
6774	\N	Wiseman	WSM
6775	\N	Washabo	WSO
6776	\N	Waspam	WSP
6777	\N	Wasior	WSR
6778	\N	Wasu	WSU
6779	\N	Airlie Beach	WSY
6780	\N	Westport	WSZ
6781	\N	Tambohorano	WTA
6782	\N	West End	WTD
6783	\N	Wotje Island	WTE
6784	\N	Waddington	WTN
6785	\N	Wotho Island	WTO
6786	\N	Woitape	WTP
6787	\N	White River	WTR
6788	\N	Tsiroanomandidy	WTS
6789	\N	Wantoat	WTT
6790	\N	Whitianga	WTZ
6791	\N	Wudinna	WUD
6792	\N	Wau	WUG
6793	\N	Wuhan	WUH
6794	\N	Berezovo	EZV
6795	\N	Labuha	LAH
6796	\N	Laghouat	LOO
6797	\N	Lankaran	LLK
6798	\N	Lawas	LWY
6799	\N	Lleida	ILD
6800	\N	Qianjiang	JIQ
6801	\N	Ambler	ABL
6802	\N	Arcata	ACV
6803	\N	Adiyaman	ADF
6804	\N	Aizawl	AJL
6805	\N	Kalaleh	KLM
6806	\N	Kalamata	KLX
6807	\N	Kalaymyo	KMV
6808	\N	Orkney Island	KOI
6809	\N	Port Williams	KPR
6810	\N	Kosrae	KSA
6811	\N	Bhuntar Kullu	KUU
6812	\N	Kowanyama	KWM
6813	\N	Lands End	LEQ
6814	\N	Malargue	LGS
6815	\N	Lokichoggio	LKG
6816	\N	Lingling	LLF
6817	\N	Alluitsup Paa	LLU
6818	\N	Lopez Island	LPS
6819	\N	Altai	LTI
6820	\N	Cape Lisburne	LUR
6821	\N	Little Cayman	LYB
6822	\N	Nangan	LZN
6823	\N	Lin Zhi	LZY
6824	\N	Manus Island	MAS
6825	\N	Manistee	MBL
6826	\N	Mare	MEE
6827	\N	Mc Allen	MFE
6828	\N	Milingimbi	MGT
6829	\N	Mount Hotham	MHU
6830	\N	Misima Island	MIS
6831	\N	Mohenjodaro	MJD
6832	\N	Mbuji-Mayi	MJM
6833	\N	Hoolehua	MKK
6834	\N	Gerald's Park	MNI
6835	\N	Mo I Rana	MQN
6836	\N	Muskrat Dam	MSA
6837	\N	Munda	MUA
6838	\N	Moro	MXH
6839	\N	Mulu	MZV
6840	\N	Mechria	MZW
6841	\N	Naha	NAH
6842	\N	Rundu	NDU
6843	\N	Nelson Lagoon	NLG
6844	\N	Narrandera	NRA
6845	\N	Now Shahr	NSH
6846	\N	Sigonella	NSY
6847	\N	Normanton	NTN
6848	\N	Wajima	NTQ
6849	\N	Coca	OCC
6850	\N	Cordoba	ODB
6851	\N	Long Seridan	ODN
6852	\N	Olympic Dam	OLP
6853	\N	Paraburdoo	PBO
6854	\N	Punta Islita	PBP
6855	\N	Pico Island	PIX
6856	\N	Port Moller	PML
6857	\N	Perito Moreno	PMQ
6858	\N	Proserpine	PPP
6859	\N	Pointe-a-pitre	PTP
6860	\N	Provo	PVU
6861	\N	Bella Coola	QBC
6862	\N	Akunnaaq	QCU
6863	\N	Kitsissuarsuit	QJE
6864	\N	Ikamiut	QJI
6865	\N	Warri	QRW
6866	\N	Sétif	QSF
6867	\N	Ubari	QUB
6868	\N	Saqqaq	QUP
6869	\N	Redang	RDN
6870	\N	Red Devil	RDV
6871	\N	Riyan Mukalla	RIY
6872	\N	Rongelap Island	RNP
6873	\N	Koror	ROR
6874	\N	St Denis de la Reunion	RUN
6875	\N	Sawan	RZS
6876	\N	Saba Island	SAB
6877	\N	Scammon Bay	SCM
6878	\N	Santiago De Compostela	SCQ
6879	\N	Santiago Del Estero	SDE
6880	\N	Seronera	SEU
6881	\N	Kangerlussuaq	SFJ
6882	\N	Sal	SID
6883	\N	Sitka	SIT
6884	\N	San Jose Del Gua	SJE
6885	\N	St Michael	SMK
6886	\N	Stella Maris	SML
6887	\N	Sainte Marie	SMS
6888	\N	Sao Nicolau	SNE
6889	\N	Espiritu Santo	SON
6890	\N	Eastleigh near Southampton	SOU
6891	\N	Sault Sainte Marie	SSM
6892	\N	Santo Domingo	STD
6893	\N	Savoonga	SVA
6894	\N	St Vincent	SVD
6895	\N	Savusavu	SVU
6896	\N	Sheldon Point	SXP
6897	\N	Stornoway	SYY
6898	\N	Tanna	TAH
6899	\N	The Bight	TBI
6900	\N	Fort Leonard Wood	TBN
6901	\N	Tabas	TCX
6902	\N	Thangool	THG
6903	\N	Tembagapura	TIM
6904	\N	Tinian	TIQ
6905	\N	Tari	TIZ
6906	\N	Toyooka	TJH
6907	\N	Truk	TKK
6908	\N	Trombetas	TMT
6909	\N	Tanjung Pinang	TNJ
6910	\N	Tosontsengel	TNZ
6911	\N	Torres	TOH
6912	\N	Toledo	TOL
6913	\N	Tarapoto	TPP
6914	\N	Dawe	TVY
6915	\N	Ua Pou	UAP
6916	\N	Ulgit	ULG
6917	\N	Ujung Pandang	UPG
6918	\N	Koh Samui	USM
6919	\N	Ouvea	UVE
6920	\N	Valesdir	VLS
6921	\N	Westsound	WSX
6922	\N	Wau	WUU
6923	\N	Bearskin Lake	XBE
6924	\N	Hedemora	XXU
6925	\N	St Anthony	YAY
6926	\N	Blanc Sablon	YBX
6927	\N	Colville Lake	YCK
6928	\N	Desolation Sound	YDS
6929	\N	Fort Severn	YER
6930	\N	Uyuni	UYU
6931	\N	Wenshan	WNH
6932	\N	Xigaze/Rikaze	RKZ
6933	\N	Xinyuan	NLT
6934	\N	Yushu	YUS
6935	\N	Yuzhno-Kurilsk	DEE
6936	\N	Qurghonteppa	KQT
6937	\N	Orel	OEL
6938	\N	Sulaimaniyah	ISU
6939	\N	Newcastle	NCL
6940	\N	Palma Mallorca	PMI
6941	\N	Florence	FLR
6942	\N	Milwaukee	MKE
6943	\N	Vineyard Haven	MVY
6944	\N	Odate Noshiro	ONJ
6945	\N	Puebla Atlixco	PBC
6946	\N	Rostock-laage	RLG
6947	\N	Santa Cruz De La Palma	SPC
6948	\N	Uralsk	URA
6949	\N	Vitoria Da Conquista	VDC
6950	\N	Valverde	VDE
6951	\N	Lydd	LYX
6952	\N	Kalymnos Island	JKL
6953	\N	Suva	SUV
6954	\N	Altenrhein	ACH
6955	\N	Carrickfinn	CFN
6956	\N	Ceduna	CED
6957	\N	Saipan	SPN
6958	\N	Natashquan	YNA
6959	\N	Kona	KOA
6960	\N	Turtle Island	TTL
6961	\N	Roervik	RVK
6962	\N	Kish Island	KIH
6963	\N	Kiev	IEV
6964	\N	Nelson	NSN
6965	\N	Dzaoudzi	DZA
6966	\N	Sigiriya	GIU
6967	\N	Abéché	AEH
6968	\N	Wasum	WUM
6969	\N	Wiluna	WUN
6970	\N	Wuvulu Island	WUV
6971	\N	Wuxi	WUX
6972	\N	Wuzhou	WUZ
6973	\N	Walvis Bay	WVB
6974	\N	Watsonville	WVI
6975	\N	Manakara	WVK
6976	\N	Waterville	WVL
6977	\N	Wilhelmshaven	WVN
6978	\N	Wasilla	WWA
6979	\N	Wildwood	WWD
6980	\N	Woodie Woodie	WWI
6981	\N	Woodward	WWR
6982	\N	Newtok	WWT
6983	\N	West Wyalong	WWY
6984	\N	Wanxian	WXN
6985	\N	Whyalla	WYA
6986	\N	Yes Bay	WYB
6987	\N	Yengema	WYE
6988	\N	Wyndham	WYN
6989	\N	West Yellowstone	WYS
6990	\N	Alamos	XAL
6991	\N	Aribinda	XAR
6992	\N	Saul	XAU
6993	\N	Xayabury	XAY
6994	\N	Blubber Bay	XBB
6995	\N	Bogande	XBG
6996	\N	Birjand	XBJ
6997	\N	Buno Bedelle	XBL
6998	\N	Biniguni	XBN
6999	\N	Boulsa	XBO
7000	\N	Brockville	XBR
7001	\N	Killineq	XBW
7002	\N	Cluff Lake	XCL
7003	\N	Chatham	XCM
7004	\N	Puerto Princesa City	XCN
7005	\N	Colac	XCO
7006	\N	Diebougou	XDE
7007	\N	Djibo	XDJ
7008	\N	Xingcheng	XEN
7009	\N	Oqatsut	XEO
7010	\N	Lake Geneva	XES
7011	\N	Gaoua	XGA
7012	\N	Gorom-Gorom	XGG
7013	\N	Granville Lake	XGL
7014	\N	Xangongo	XGN
7015	\N	Kangiqsualujjuaq	XGR
7016	\N	Xienglom	XIE
7017	\N	Xinguara	XIG
7018	\N	Ahmed Al Jaber	XIJ
7019	\N	Xilinhot	XIL
7020	\N	Xingning	XIN
7021	\N	Al Udeid	XJD
7022	\N	Kitzbuehl	XJS
7023	\N	Kantchari	XKA
7024	\N	Sandnes	XKC
7025	\N	Xieng Khouang	XKH
7026	\N	Kemano	XKO
7027	\N	Kaya	XKY
7028	\N	Lac Brochet	XLB
7029	\N	Leaf Bay	XLF
7030	\N	Long Xuyen	XLO
7031	\N	St Louis	XLS
7032	\N	Leo	XLU
7033	\N	Lemwerder	XLW
7034	\N	Maramag	XMA
7035	\N	Mallacoota	XMC
7036	\N	Madison	XMD
7037	\N	Mahendranagar	XMG
7038	\N	Manihi	XMH
7039	\N	Masasi	XMI
7040	\N	Minlaton	XML
7041	\N	Xiamen	XMN
7042	\N	Macmillan Pass	XMP
7043	\N	Macas	XMS
7044	\N	Yam Island	XMY
7045	\N	Quang Ngai	XNG
7046	\N	Xining	XNN
7047	\N	Xingtai	XNT
7048	\N	Nouna	XNU
7049	\N	Pama	XPA
7050	\N	Pukatawagan	XPK
7051	\N	Comayagua	XPL
7052	\N	Poplar River	XPP
7053	\N	Port Klang	XPQ
7054	\N	Pine Ridge	XPR
7055	\N	West Kuparuk	XPU
7056	\N	Pavones	XQP
7057	\N	Qualicum	XQU
7058	\N	Ross River	XRR
7059	\N	Jerez De La Frontera	XRY
7060	\N	Sebba	XSE
7061	\N	St Marys	XSM
7062	\N	Siocon	XSO
7063	\N	Tadoule Lake	XTL
7064	\N	Taroom	XTO
7065	\N	Tara	XTR
7066	\N	Storekvina	XUV
7067	\N	Storen	XUW
7068	\N	Vinh Long	XVL
7069	\N	Hassleholm	XWP
7070	\N	Enkoping	XWQ
7071	\N	Nykoping	XWZ
7072	\N	Alvesta	XXA
7073	\N	Katrineholm	XXK
7074	\N	Yandina	XYA
7075	\N	Herrljunga	XYC
7076	\N	Ye	XYE
7077	\N	Flen	XYI
7078	\N	Falkenberg	XYM
7079	\N	Kristinehamn	XYN
7080	\N	Karlshamn	XYO
7081	\N	Yellow River	XYR
7082	\N	Solvesborg	XYU
7083	\N	Sala	XYX
7084	\N	Zabre	XZA
7085	\N	Cat Lake	YAC
7086	\N	Moose Lake	YAD
7087	\N	Alta Lake	YAE
7088	\N	Asbestos Hill	YAF
7089	\N	Lagrande 4	YAH
7090	\N	Chillan	YAI
7091	\N	Lyall Harbour	YAJ
7092	\N	Alert Bay	YAL
7093	\N	Yangambi	YAN
7094	\N	Yaounde	YAO
7095	\N	Maple Bay	YAQ
7096	\N	Lagrande 3	YAR
7097	\N	Yasawa Island	YAS
7098	\N	Kattiniq	YAU
7099	\N	Miners Bay	YAV
7100	\N	Tofino	YAZ
7101	\N	Banff	YBA
7102	\N	Kugaaruk	YBB
7103	\N	Baie Comeau	YBC
7104	\N	New Westminster	YBD
7105	\N	Uranium City	YBE
7106	\N	Bamfield	YBF
7107	\N	Bagotville	YBG
7108	\N	Black Tickle	YBI
7109	\N	Baie Johan Beetz	YBJ
7110	\N	Campbell River	YBL
7111	\N	Bronson Creek	YBM
7112	\N	Borden	YBN
7113	\N	Bobquinn Lake	YBO
7114	\N	Yibin	YBP
7115	\N	Telegraph Harbour	YBQ
7116	\N	Brandon	YBR
7117	\N	Opapamiska Lake	YBS
7118	\N	Brochet	YBT
7119	\N	Berens River	YBV
7120	\N	Bonnyville	YBY
7121	\N	Courtenay	YCA
7122	\N	Cornwall	YCC
7123	\N	Centralia	YCE
7124	\N	Cortes Bay	YCF
7125	\N	Miramichi	YCH
7126	\N	Caribou Island	YCI
7127	\N	Cape St James	YCJ
7128	\N	St Catharines	YCM
7129	\N	Co-op Point	YCP
7130	\N	Chetwynd	YCQ
7131	\N	Chesterfield Inlet	YCS
7132	\N	Coronation	YCT
7133	\N	Yun Cheng	YCU
7134	\N	Cartierville	YCV
7135	\N	Chilliwack	YCW
7136	\N	Gagetown	YCX
7137	\N	Fairmont Hot Springs	YCZ
7138	\N	Burwash Landings	YDB
7139	\N	Drayton Valley	YDC
7140	\N	Paradise River	YDE
7141	\N	Digby	YDG
7142	\N	Daniels Harbour	YDH
7143	\N	Davis Inlet	YDI
7144	\N	Hatchet Lake	YDJ
7145	\N	Main Duck Island	YDK
7146	\N	Dease Lake	YDL
7147	\N	Dauphin	YDN
7148	\N	Dolbeau	YDO
7149	\N	Nain	YDP
7150	\N	Broadview	YDR
7151	\N	Kasba Lake	YDU
7152	\N	Bloodvein	YDV
7153	\N	Obre Lake	YDW
7154	\N	Doc Creek	YDX
7155	\N	Yecheon	YEC
7156	\N	Arviat	YEK
7157	\N	Elliot Lake	YEL
7158	\N	Manitowaning	YEM
7159	\N	Estevan	YEN
7160	\N	Yeovilton	YEO
7161	\N	Estevan Point	YEP
7162	\N	Yenkis	YEQ
7163	\N	Yasouj	YES
7164	\N	Edson	YET
7165	\N	Eureka	YEU
7166	\N	Amos	YEY
7167	\N	Forestville	YFE
7168	\N	Fontanges	YFG
7169	\N	Fort Hope	YFH
7170	\N	Fort Reliance	YFL
7171	\N	Fort Resolution	YFR
7172	\N	Fox Harbour (St Lewis)	YFX
7173	\N	Gagnon	YGA
7174	\N	Gillies Bay	YGB
7175	\N	Grande Cache	YGC
7176	\N	Gorge Harbor	YGE
7177	\N	Ganges Harbor	YGG
7178	\N	Yonago	YGJ
7179	\N	La Grande	YGL
7180	\N	Gimli	YGM
7181	\N	Greenway Sound	YGN
7182	\N	Gods Narrows	YGO
7183	\N	Gaspe	YGP
7184	\N	Geraldton	YGQ
7185	\N	Iles De La Madeleine	YGR
7186	\N	Germansen	YGS
7187	\N	Gillam	YGX
7188	\N	Deception	YGY
7189	\N	Port Hope Simpson	YHA
7190	\N	Hudson Bay	YHB
7191	\N	Hakai Pass	YHC
7192	\N	Dryden	YHD
7193	\N	Hope	YHE
7194	\N	Hearst	YHF
7195	\N	Hornepayne	YHN
7196	\N	Chevery	YHR
7197	\N	Sechelt	YHS
7198	\N	Haines Junction	YHT
7199	\N	Atikokan	YIB
7200	\N	Pakuashipi	YIF
7201	\N	Big Bay Marina	YIG
7202	\N	Yichang	YIH
7203	\N	Yining	YIN
7204	\N	Island Lake	YIV
7205	\N	Yiwu	YIW
7206	\N	Fort Liard	YJF
7207	\N	St Jean	YJN
7208	\N	Johnny Mountain	YJO
7209	\N	Jasper-hinton	YJP
7210	\N	Kamloops	YKA
7211	\N	Collins Bay	YKC
7212	\N	Kincardine	YKD
7213	\N	Knee Lake	YKE
7214	\N	Kennosao Lake	YKI
7215	\N	Key Lake	YKJ
7216	\N	Kitkatla	YKK
7217	\N	Yakima	YKM
7218	\N	Yankton	YKN
7219	\N	Yakutsk	YKS
7220	\N	Kirkland Lake	YKX
7221	\N	Kindersley	YKY
7222	\N	Langara	YLA
7223	\N	Lac Biche	YLB
7224	\N	Chapleau	YLD
7225	\N	Wha Ti	YLE
7226	\N	LaForges	YLF
7227	\N	Yalgoo	YLG
7228	\N	Ylivieska	YLI
7229	\N	Meadow Lake	YLJ
7230	\N	Clinton Creek	YLM
7231	\N	Yilan	YLN
7232	\N	Shilo	YLO
7233	\N	Mingan	YLP
7234	\N	La Tuque	YLQ
7235	\N	Leaf Rapids	YLR
7236	\N	Lebel-Sur-Quevillon	YLS
7237	\N	Alert	YLT
7238	\N	Kelowna	YLW
7239	\N	Long Point	YLX
7240	\N	Langley	YLY
7241	\N	Mayo	YMA
7242	\N	Merritt	YMB
7243	\N	Maricourt Airstrip	YMC
7244	\N	Mould Bay	YMD
7245	\N	Matane	YME
7246	\N	Montagne Harbor	YMF
7247	\N	Manitouwadge	YMG
7248	\N	Minaki	YMI
7249	\N	Moose Jaw	YMJ
7250	\N	Murray Bay	YML
7251	\N	Makkovik	YMN
7252	\N	Moosonee	YMO
7253	\N	Port McNeil	YMP
7254	\N	Montreal	YMQ
7255	\N	Merry Island	YMR
7256	\N	Yurimaguas	YMS
7257	\N	Maniwaki	YMW
7258	\N	Yanbu	YNB
7259	\N	Wemindji	YNC
7260	\N	Norway House	YNE
7261	\N	Corner Brook	YNF
7262	\N	Youngstown	YNG
7263	\N	Nitchequon	YNI
7264	\N	Nootka Sound	YNK
7265	\N	Matagami	YNM
7266	\N	Yandicoogina	YNN
7267	\N	Natuashish	YNP
7268	\N	Arnes	YNR
7269	\N	Nemiscau	YNS
7270	\N	Yangyang	YNY
7271	\N	Yancheng	YNZ
7272	\N	Ekati	YOA
7273	\N	Old Crow	YOC
7274	\N	Cold Lake	YOD
7275	\N	Falher	YOE
7276	\N	Oxford House	YOH
7277	\N	Yokohama	YOK
7278	\N	Yola	YOL
7279	\N	Owen Sound	YOS
7280	\N	Yotvata	YOT
7281	\N	Ottawa	YOW
7282	\N	Valcartier	YOY
7283	\N	Parry Sound	YPD
7284	\N	Peace River	YPE
7285	\N	Esquimalt	YPF
7286	\N	Portage La Prairie	YPG
7287	\N	Port Simpson	YPI
7288	\N	Port Menier	YPN
7289	\N	Peawanuck	YPO
7290	\N	Pine Point	YPP
7291	\N	Peterborough	YPQ
7292	\N	Prince Rupert	YPR
7293	\N	Port Hawkesbury	YPS
7294	\N	Pender Harbor	YPT
7295	\N	Burns Lake	YPZ
7296	\N	Muskoka	YQA
7297	\N	Québec City	YQB
7298	\N	Quaqtaq	YQC
7299	\N	Kimberley	YQE
7300	\N	Windsor	YQG
7301	\N	Watson Lake	YQH
7302	\N	Yarmouth	YQI
7303	\N	Kenora	YQK
7304	\N	Lethbridge	YQL
7305	\N	Nakina	YQN
7306	\N	Comox	YQQ
7307	\N	Regina	YQR
7308	\N	St Thomas	YQS
7309	\N	Thunder Bay	YQT
7310	\N	Yorkton	YQV
7311	\N	North Battleford	YQW
7312	\N	Gander	YQX
7313	\N	Quesnel	YQZ
7314	\N	Rae Lakes	YRA
7315	\N	Dean River	YRD
7316	\N	Resolution Island	YRE
7317	\N	Cartwright	YRF
7318	\N	Rigolet	YRG
7319	\N	Riviere Du Loup	YRI
7320	\N	Roberval	YRJ
7321	\N	Rocky Mountain House	YRM
7322	\N	Owekeno Village	YRN
7323	\N	Trois-Rivieres	YRQ
7324	\N	Stuart Island	YRR
7325	\N	Rankin Inlet	YRT
7326	\N	Revelstoke	YRV
7327	\N	Sable Island	YSA
7328	\N	Sherbrooke	YSC
7329	\N	Suffield	YSD
7330	\N	Squamish	YSE
7331	\N	Stony Rapids	YSF
7332	\N	Smith Falls	YSH
7333	\N	Sans Souci	YSI
7334	\N	Saint John	YSJ
7335	\N	St Leonard	YSL
7336	\N	Salmon Arm	YSN
7337	\N	Postville	YSO
7338	\N	Marathon	YSP
7339	\N	Spring Island	YSQ
7340	\N	Nanisivik	YSR
7341	\N	Slate Island	YSS
7342	\N	Summerside	YSU
7343	\N	Saglek	YSV
7344	\N	Shearwater	YSX
7345	\N	Squirrel Cove	YSZ
7346	\N	Pembroke	YTA
7347	\N	Hartley Bay	YTB
7348	\N	Sturdee	YTC
7349	\N	Thicket Portage	YTD
7350	\N	Alma	YTF
7351	\N	Sullivan Bay	YTG
7352	\N	Triple Island	YTI
7353	\N	Terrace Bay	YTJ
7354	\N	Tulugak	YTK
7355	\N	Big Trout	YTL
7356	\N	Riviere Au Tonnerre	YTN
7357	\N	Toronto	YTO
7358	\N	Tasiujuaq	YTQ
7359	\N	Trenton	YTR
7360	\N	Tisdale	YTT
7361	\N	Tasu	YTU
7362	\N	Telegraph Creek	YTX
7363	\N	Yuanmou	YUA
7364	\N	Umiujaq	YUD
7365	\N	Yuendumu	YUE
7366	\N	La Ronge	YVC
7367	\N	Yeva	YVD
7368	\N	Vernon	YVE
7369	\N	Vermilion	YVG
7370	\N	Val-d'or	YVO
7371	\N	Buffalo Narrows	YVT
7372	\N	Wiarton	YVV
7373	\N	Petawawa	YWA
7374	\N	Deline	YWJ
7375	\N	Wabush	YWK
7376	\N	Williams Lake	YWL
7377	\N	Winisk	YWN
7378	\N	Lupin	YWO
7379	\N	Webequie	YWP
7380	\N	Chute-Des-Passes	YWQ
7381	\N	Whistler	YWS
7382	\N	Wrigley	YWY
7383	\N	Saskatoon	YXE
7384	\N	Snake River	YXF
7385	\N	Medicine Hat	YXH
7386	\N	Killaloe	YXI
7387	\N	Rimouski	YXK
7388	\N	Beaver Creek	YXQ
7389	\N	Earlton	YXR
7390	\N	Prince George	YXS
7391	\N	Terrace	YXT
7392	\N	Whitehorse	YXY
7393	\N	Wawa	YXZ
7394	\N	Big Bay Yacht Club	YYA
7395	\N	North Bay	YYB
7396	\N	Penticton	YYF
7397	\N	Charlottetown	YYG
7398	\N	Rivers	YYI
7399	\N	Lynn Lake	YYL
7400	\N	Cowley	YYM
7401	\N	Swift Current	YYN
7402	\N	Happy Valley-Goose Bay	YYR
7403	\N	Armstrong	YYW
7404	\N	Mont Joli	YYY
7405	\N	Ashcroft	YZA
7406	\N	Beatton River	YZC
7407	\N	Gore Bay	YZE
7408	\N	Slave Lake	YZH
7409	\N	Buchans	YZM
7410	\N	Sandspit	YZP
7411	\N	Whitecourt	YZU
7412	\N	Teslin	YZW
7413	\N	Greenwood	YZX
7414	\N	Trail	YZZ
7415	\N	Alice Arm	ZAA
7416	\N	York Landing	ZAC
7417	\N	Zadar	ZAD
7418	\N	Zagreb	ZAG
7419	\N	Zahedan	ZAH
7420	\N	Zaranj	ZAJ
7421	\N	Valdivia	ZAL
7422	\N	Cahors	ZAO
7423	\N	Zaria	ZAR
7424	\N	Shunde	ZAS
7425	\N	Zhaotong	ZAT
7426	\N	Aue	ZAU
7427	\N	Pan Yu	ZAX
7428	\N	Zaragoza	ZAZ
7429	\N	Jiang Men	ZBD
7430	\N	Zabreh	ZBE
7431	\N	Zabljak	ZBK
7432	\N	Bromont	ZBM
7433	\N	Bowen	ZBO
7434	\N	Sayaboury	ZBY
7435	\N	Xin Hui	ZBZ
7436	\N	Tai Shan	ZCA
7437	\N	Zacatecas	ZCL
7438	\N	Secunda	ZEC
7439	\N	Nanhai	ZEF
7440	\N	Senggo	ZEG
7441	\N	Zenag	ZEN
7442	\N	Zero	ZER
7443	\N	Faro	ZFA
7444	\N	Old Fort Bay	ZFB
7445	\N	South Trout Lake	ZFL
7446	\N	Aruja	ZFU
7447	\N	Fairview	ZFW
7448	\N	Gera	ZGA
7449	\N	Goerlitz	ZGE
7450	\N	Grand Forks	ZGF
7451	\N	Gods River	ZGI
7452	\N	South Galway	ZGL
7453	\N	Ngoma	ZGM
7454	\N	Zhongshan	ZGN
7455	\N	Gotha	ZGO
7456	\N	Little Grand Rapids	ZGR
7457	\N	Gethsemani	ZGS
7458	\N	Greifswald	ZGW
7459	\N	Zhanjiang	ZHA
7460	\N	Grenchen	ZHI
7461	\N	Shamshernagar	ZHM
7462	\N	High Prairie	ZHP
7463	\N	Victoria	ZIC
7464	\N	Vulcano	ZIE
7465	\N	Ziguinchor	ZIG
7466	\N	Ixtapa	ZIH
7467	\N	Lipari	ZIP
7468	\N	Lianhuashan	ZIY
7469	\N	Panarea	ZJE
7470	\N	Jenpeg	ZJG
7471	\N	Procida	ZJJ
7472	\N	Swan River	ZJN
7473	\N	Jena	ZJS
7474	\N	Tanjung Pelepas	ZJT
7475	\N	Stromboli	ZJX
7476	\N	Ponza	ZJY
7477	\N	Kasaba Bay	ZKB
7478	\N	Kegaska	ZKG
7479	\N	Steenkool	ZKL
7480	\N	Sette Cama	ZKM
7481	\N	El Gouera	ZLG
7482	\N	La Tabatiere	ZLT
7483	\N	Pasir Gudang	ZLW
7484	\N	Sena Madureira	ZMD
7485	\N	Zamora	ZMM
7486	\N	Masset	ZMT
7487	\N	Huangpu	ZMY
7488	\N	Nyac	ZNC
7489	\N	Zinder	ZND
7490	\N	Newman	ZNE
7491	\N	Negginan	ZNG
7492	\N	Namu	ZNU
7493	\N	Zanzibar	ZNZ
7494	\N	Ocean Falls	ZOF
7495	\N	Pucon	ZPC
7496	\N	Zephyrhills	ZPH
7497	\N	Pine House	ZPO
7498	\N	Trier	ZQF
7499	\N	Queenstown	ZQN
7500	\N	Queen Charlotte Island	ZQS
7501	\N	Zurich	ZRH
7502	\N	Serui	ZRI
7503	\N	Round Lake	ZRJ
7504	\N	Sarmi	ZRM
7505	\N	Fiumicino	ZRR
7506	\N	Zurs	ZRS
7507	\N	Sandy Lake	ZSJ
7508	\N	St Paul	ZSP
7509	\N	Sassandra	ZSS
7510	\N	Stewart	ZST
7511	\N	Dessau	ZSU
7512	\N	Humen	ZTI
7513	\N	Shamattawa	ZTM
7514	\N	Zhitomir	ZTR
7515	\N	Tahsis	ZTS
7516	\N	Chemnitz	ZTZ
7517	\N	Ignace	ZUC
7518	\N	Ancud	ZUD
7519	\N	Zhuhai	ZUH
7520	\N	Zilfi	ZUL
7521	\N	Miandrivazo	ZVA
7522	\N	Savannakhet	ZVK
7523	\N	Andapa	ZWA
7524	\N	Wollaston Lake	ZWL
7525	\N	Kota Kinabalu	ZWR
7526	\N	Zunyi	ZYI
7527	\N	Sylhet	ZYL
7528	\N	Mzuzu	ZZU
7529	\N	Zanesville	ZZV
7530	\N	Agatti Island	AGX
7531	\N	Atambua	ABU
7532	\N	Auki	AKS
7533	\N	Balmaceda	BBA
7534	\N	Ciudad Del Carmen	CME
7535	\N	Cocos Islands	CCK
7536	\N	Crooked Island	CRI
7537	\N	Del Carmen	IAO
7538	\N	Deirezzor	DEZ
7539	\N	Elcho Island	ELC
7540	\N	Kutahya	KZR
7541	\N	Allakaket	AET
7542	\N	Wainwright	AIN
7543	\N	Ilimanaq	XIQ
7544	\N	Kasabonika	XKS
7545	\N	South Indian Lake	XSI
7546	\N	Thargomindah	XTG
7547	\N	Avesta Krylbo	XYP
7548	\N	Anahim Lake	YAA
7549	\N	Angling Lake	YAX
7550	\N	Dawson City	YDA
7551	\N	Fort Albany	YFA
7552	\N	Snare Lake	YFJ
7553	\N	Poplar Hill	YHP
7554	\N	Klemtu	YKT
7555	\N	Fort Mcmurray	YMM
7556	\N	Points North Landing	YNL
7557	\N	Pickle Lake	YPL
7558	\N	Pikangikum	YPM
7559	\N	Povungnituk	YPX
7560	\N	Sydney	YQY
7561	\N	Resolute	YRB
7562	\N	Red Sucker Lake	YRS
7563	\N	Ste Therese Point	YST
7564	\N	Mont Tremblant	YTM
7565	\N	Williams Harbour	YWM
7566	\N	Bella Bella	ZEL
7567	\N	East Main	ZEM
7568	\N	Fond Du Lac	ZFD
7569	\N	Gaua	ZGU
7570	\N	Kaschechewan	ZKE
7571	\N	Sachigo Lake	ZPB
7572	\N	San Salvador	ZSA
7573	\N	St Pierre dela Reunion	ZSE
7574	\N	Tureira	ZTA
7575	\N	Tete-a-La Baleine	ZTB
7576	\N	Zakinthos	ZTH
7577	\N	Akron/Canton	CAK
7578	\N	Anglesey	VLY
7579	\N	Arthur's Town	ATC
7580	\N	Baltimore	BWI
7581	\N	Bedwell Harbor	YBW
7582	\N	Burbank	BUR
7583	\N	Bursa	YEI
7584	\N	Charleston	CHS
7585	\N	Columbus	UBS
7586	\N	Deer Harbor	DHB
7587	\N	Drake Bay	DRK
7588	\N	Elrose Mine	ERQ
7589	\N	Handan	HDG
7590	\N	Harrisburg	HAR
7591	\N	Huai'an	HIA
7592	\N	Igrim	IRM
7593	\N	Iwakuni	IWK
7594	\N	Monrovia	MLW
7595	\N	Mys-Kamenny	YMK
7596	\N	Okha	OHH
7597	\N	Pai	PYY
7598	\N	Puente Genil	GEN
7599	\N	Rimatara	RMT
7600	\N	San Jose	SYQ
7601	\N	Santa Rosa	ETR
7602	\N	Shakhtersk	EKS
7603	\N	Shiquanhe	NGQ
7604	\N	Sinop	NOP
7605	\N	Taganrog	TGK
7606	\N	Tanjung Manis	TGC
7607	\N	Tarko-Sale	TQL
7608	\N	Turukhansk	THX
7609	\N	St. Georges	GND
7610	\N	Cagayan De Oro	CGY
7611	\N	Dickwella	DIW
7612	\N	108 Mile Ranch	ZMH
7613	\N	Aabenraa	XNR
7614	\N	Aalbaek	XOA
7615	\N	Aarau	ZDA
7616	\N	Aberdeen	APG
7617	\N	Adam	AOM
7618	\N	Adareil	AEE
7619	\N	Adelboden	ZDB
7620	\N	Aershan	YIE
7621	\N	Aigle	ZDC
7622	\N	Aix-en-Provence	QXB
7623	\N	Akaslompolo	XHC
7624	\N	Al	XXR
7625	\N	Al Asad	IQA
7626	\N	Al Fallujah	TQD
7627	\N	Al Najaf	NJF
7628	\N	Al Ula	ULH
7629	\N	Albany	CVO
7630	\N	Albert	BYF
7631	\N	Aldershot	XLY
7632	\N	Alexandria	XFS
7633	\N	Almelo	QYL
7634	\N	Altus	LTS
7635	\N	Alvdal	XJA
7636	\N	Amersfoort	QYM
7637	\N	Amherst	XZK
7638	\N	Ampara	ADP
7639	\N	Andalsnes	XGI
7640	\N	Andavadoaka	DVD
7641	\N	Andoas	AOP
7642	\N	Ankisatra	TZO
7643	\N	Ansbach	QOB
7644	\N	Apeldoorn	QYP
7645	\N	Appenzell	ZAP
7646	\N	Aratika	RKA
7647	\N	Arboga	XXT
7648	\N	Arbon	ZDD
7649	\N	Ardmore	ADM
7650	\N	Arendal	XGD
7651	\N	Arles	ZAF
7652	\N	Arna	XHT
7653	\N	Arnhem	ZYM
7654	\N	Arosa	ZDE
7655	\N	Artvin	XHQ
7656	\N	Arvika	XYY
7657	\N	Aschaffenburg	ZCB
7658	\N	Ashford	QDH
7659	\N	Ashland	AHM
7660	\N	Asker	XGU
7661	\N	Aydin	CII
7662	\N	Baden	ZDG
7663	\N	Bagram	OAI
7664	\N	Bahja	BJQ
7665	\N	Baishan	NBS
7666	\N	Baleela	BJE
7667	\N	Bar River	YEB
7668	\N	Basingstoke	XQB
7669	\N	Bath	QQX
7670	\N	Bauru	JTC
7671	\N	Bayannur	RLK
7672	\N	Beaumont	BPT
7673	\N	Beckwourth	NVN
7674	\N	Bedford	XQD
7675	\N	Beja	BYJ
7676	\N	Belleville	XVV
7677	\N	Bellinzona	ZDI
7678	\N	Beloyarsky	EYK
7679	\N	Ben Slimane	GMD
7680	\N	Benson	BEX
7681	\N	Berkak	XUB
7682	\N	Berwick-upon-Tweed	XQG
7683	\N	Best	QWZ
7684	\N	Biala Podlaska	BXP
7685	\N	Biel/Bienne	ZDK
7686	\N	Bintulu	ZMK
7687	\N	Bjerka	ZMZ
7688	\N	Blue Mountain	VBM
7689	\N	Blytheville	BYH
7690	\N	Bo	XXC
7691	\N	Bo'ao	BPO
7692	\N	Bochum	QBO
7693	\N	Bogorodskoye	BQG
7694	\N	Bole	BPL
7695	\N	Bor	TGP
7696	\N	Bouarfa	UAR
7697	\N	Brampton	XPN
7698	\N	Brande	ZMW
7699	\N	Brandon	LKZ
7700	\N	Brantford	XFV
7701	\N	Brasov	XHV
7702	\N	Breckenridge	QKB
7703	\N	Bregenz	XGZ
7704	\N	Brig	ZDL
7705	\N	Brize Norton	BZZ
7706	\N	Bronderslev	XAQ
7707	\N	Brumunddal	ZVB
7708	\N	Brunswick	NHZ
7709	\N	Bryne	XOB
7710	\N	Buchs SG	ZDO
7711	\N	Bulgan, Hovd	HBU
7712	\N	Bullocks Flat	QZM
7713	\N	Burgdorf	ZDP
7714	\N	Burqin	KJI
7715	\N	Butembo	RUE
7716	\N	Cabin Plant	DCP
7717	\N	Cambridge	JHY
7718	\N	Camp Bastion	OAZ
7719	\N	Campbellton	XAZ
7720	\N	Cape Dyer	YVN
7721	\N	Capreol	XAW
7722	\N	Carleton	XON
7723	\N	Caro	TZC
7724	\N	Cartagena	XUF
7725	\N	Cascade	ICS
7726	\N	Casselman	XZB
7727	\N	Castellon de la Plana	CDT
7728	\N	Cayo Las Brujas	BWW
7729	\N	Celaya	CYW
7730	\N	Chambord	XCI
7731	\N	Champery	ZDQ
7732	\N	Chandler	XDL
7733	\N	Chateau-d'Oex	ZDR
7734	\N	Chefornak	CYF
7735	\N	Chemainus	XHS
7736	\N	Chesterfield	ZFI
7737	\N	Chiasso	ZDS
7738	\N	Chichester	QUG
7739	\N	Chignik	KCL
7740	\N	Chiusa/Klausen	ZAK
7741	\N	Chizhou	JUH
7742	\N	Christmas Creek Mine	CKW
7743	\N	Chur	ZDT
7744	\N	Clearwater	CLW
7745	\N	Clinton	CSM
7746	\N	Cloudbreak	KFE
7747	\N	Cobourg	XGJ
7748	\N	Cochrane	YCN
7749	\N	Coeur D'Alene	COE
7750	\N	Coningsby	QCY
7751	\N	Corvera	RMU
7752	\N	Coteau	XGK
7753	\N	Cotriguacu	OTT
7754	\N	Cox's Bazar	CXB
7755	\N	Crackenback Village	QWL
7756	\N	Crewe	XVC
7757	\N	Curitiba.	BFH
7758	\N	Dallas	DFW
7759	\N	Daocheng	DCY
7760	\N	Daqing	DQA
7761	\N	Darlington	XVG
7762	\N	Davos	ZDV
7763	\N	Degerfors	XXD
7764	\N	Delemont	ZDW
7765	\N	Derby	XQH
7766	\N	Deventer	QYV
7767	\N	Dewsbury	ZEQ
7768	\N	Deyang	DEY
7769	\N	Diamantina	DTI
7770	\N	Didcot	XPW
7771	\N	Dietikon	ZDX
7772	\N	Disneyland Paris	XED
7773	\N	Dombas	XGP
7774	\N	Dong Hoi	VDH
7775	\N	Dongguan	XHO
7776	\N	Dover	QQD
7777	\N	Drachten	QYC
7778	\N	Drammen	XND
7779	\N	Drangedal	ZVD
7780	\N	Drummondville	XDM
7781	\N	Duisburg	DUI
7782	\N	Duncan/Quam	DUQ
7783	\N	Duqm	JNJ
7784	\N	Dwyer	DWR
7785	\N	Egersund	XRD
7786	\N	Einsiedeln	ZDZ
7787	\N	El Bayadh	EBH
7788	\N	Electric City	GCD
7789	\N	Elverum	XUC
7790	\N	Embrach/Rorbas	QEQ
7791	\N	Engelberg	ZHB
7792	\N	Erenhot	ERL
7793	\N	Esa'Ala	ESA
7794	\N	Fahud	FAU
7795	\N	Fairfield	SUU
7796	\N	Falkoping	XYF
7797	\N	Fallon	NFL
7798	\N	Fauske	ZXO
7799	\N	Filton	FZO
7800	\N	Finse	XKN
7801	\N	Flam	XGH
7802	\N	Flemingsberg	XEW
7803	\N	Florence	FMU
7804	\N	Fluelen	ZHD
7805	\N	Fonte Boa	FBA
7806	\N	Font-Romeu	QZF
7807	\N	Fort Bragg	FBG
7808	\N	Fort MacKay	HZP
7809	\N	Frankfurt (Oder)	ZFR
7810	\N	Frauenfeld	ZHE
7811	\N	Fredericia	ZBJ
7812	\N	Fredericton Junction	XFC
7813	\N	Frederikshavn	QFH
7814	\N	Fredrikstad	XKF
7815	\N	Freiburg	QFB
7816	\N	Fribourg	ZHF
7817	\N	Fulda	ZEE
7818	\N	Fuvahmulak	FVM
7819	\N	Gananoque	XGW
7820	\N	Garden City	JHC
7821	\N	Garmisch-Partenkirchen	ZEI
7822	\N	Geelong	GEX
7823	\N	Gelsenkirchen	ZEJ
7824	\N	Georgetown	XHM
7825	\N	Giessen	ZQY
7826	\N	Gjerstad	XGS
7827	\N	Gjovik	ZYG
7828	\N	Glarus	ZHG
7829	\N	Glencoe	XZC
7830	\N	Glendale	JGX
7831	\N	Glenview	ZWV
7832	\N	Globe	GLB
7833	\N	Goettingen	ZEU
7834	\N	Gokceada	GKD
7835	\N	Gombe	GMO
7836	\N	Gossau SG	ZHH
7837	\N	Graasten	XRA
7838	\N	Grande-Riviere	XDO
7839	\N	Grangeville	IDH
7840	\N	Grantham	XGM
7841	\N	Grants Pass	GTP
7842	\N	Grimsby	XGY
7843	\N	Grindelwald	ZHJ
7844	\N	Grong	XKG
7845	\N	Grumeti	GTZ
7846	\N	Gstaad	ZHK
7847	\N	Guarapari	QDL
7848	\N	Guderup	ZFK
7849	\N	Guelph	XIA
7850	\N	Guyuan	GYU
7851	\N	Ha'Apai	HPA
7852	\N	Hagen	ZEY
7853	\N	Halden	XKD
7854	\N	Hallsberg	XWM
7855	\N	Hamm	ZNB
7856	\N	Harwich	QQH
7857	\N	Hassi R'mel	HRM
7858	\N	Hatay	HTY
7859	\N	Hattiesburg	HBG
7860	\N	Haugastol	ZWJ
7861	\N	Havana	UPB
7862	\N	Heerbrugg	ZHL
7863	\N	Heerenveen	QYZ
7864	\N	Heimdal	XUE
7865	\N	Hengelo	QYH
7866	\N	Herning	ZRY
7867	\N	Hervey	XDU
7868	\N	Herzogenaurach	XHI
7869	\N	Herzogenbuchsee	ZHN
7870	\N	Heviz	HVZ
7871	\N	Hilversum	QYI
7872	\N	Hirtshals	XAJ
7873	\N	Hjerkinn	YVH
7874	\N	Hjorring	QHJ
7875	\N	Holbrook	HBK
7876	\N	Holmestrand	XUG
7877	\N	Holstebro	QWO
7878	\N	Homeshore	HMS
7879	\N	Honefoss	XHF
7880	\N	Hope Bay	UZM
7881	\N	Horn River	DHO
7882	\N	Horsens	ZIL
7883	\N	Houston	ZHO
7884	\N	Hudson's  Hope	YNH
7885	\N	Huntingdon	XHU
7886	\N	Huntsville	HTV
7887	\N	Ikast	QLZ
7888	\N	Ile d'Yeu	IDY
7889	\N	Incheon	JCN
7890	\N	Ingersoll	XIB
7891	\N	Interlaken	ZIN
7892	\N	Iranamadu	IRU
7893	\N	Isabela Island	IBB
7894	\N	Isalo	RLR
7895	\N	Ischgl	XOI
7896	\N	Isla Viveros	IVI
7897	\N	Iturup Island	BVV
7898	\N	Jacksonville	LRF
7899	\N	Jajao	JJA
7900	\N	Jasper	YJA
7901	\N	Jeongseok	JDG
7902	\N	Jiagedaqi	JGD
7903	\N	Jinchang	JIC
7904	\N	Jixi	JXA
7905	\N	Joliette	XJL
7906	\N	Jonquiere	XJQ
7907	\N	Kadugli	KDX
7908	\N	Kakamega	GGM
7909	\N	Kandersteg	ZHR
7910	\N	Kangding	KGT
7911	\N	Kapolei	JRF
7912	\N	Karaj	PYK
7913	\N	Katsina	DKA
7914	\N	Kavalerovo	KVR
7915	\N	Kennewick	VSK
7916	\N	Kil	XXN
7917	\N	Kiwigana Lodge	DKL
7918	\N	Kjellerup	QJW
7919	\N	Klosters	ZHS
7920	\N	Kneeland	NLN
7921	\N	Koblenz	ZNV
7922	\N	Kolding	ZBT
7923	\N	Kolobrzeg	QJY
7924	\N	Kongsberg	XKB
7925	\N	Kongsvinger	XZD
7926	\N	Koping	XXI
7927	\N	Koppang	YVK
7928	\N	Kouvola	QVY
7929	\N	Krasnoselkup	KKQ
7930	\N	Kreuzlingen	ZHU
7931	\N	Kuantan	ZJB
7932	\N	Kuching	ZGY
7933	\N	Kulyab	TJU
7934	\N	Kumla	XXV
7935	\N	Kyoto	UKY
7936	\N	La Chaux-de-Fonds	ZHV
7937	\N	La Graciosa	GGA
7938	\N	Lac Edouard	XEE
7939	\N	Ladysmith	XEH
7940	\N	Lake City	LCQ
7941	\N	Lake Cook Road	ZUK
7942	\N	Lancaster	XQL
7943	\N	Langenthal	ZHW
7944	\N	Langford	XEJ
7945	\N	Larvik	XKK
7946	\N	Latur	LTU
7947	\N	Le Creusot/Montceau	XCC
7948	\N	Le Locle	ZJA
7949	\N	Leeton	QLE
7950	\N	Leicester	QEW
7951	\N	Lekhwair	LKW
7952	\N	Leksand	XXO
7953	\N	Lenzburg	ZJC
7954	\N	Lenzerheide/Lai	ZJD
7955	\N	Levanger	XUH
7956	\N	Levi	XGX
7957	\N	Libo	LLB
7958	\N	Lichfield	XQT
7959	\N	Lillehammer	XXL
7960	\N	Lillestrom	XKI
7961	\N	Limburg	ZNW
7962	\N	Lindau	QII
7963	\N	Lingshui	LQS
7964	\N	Lobito	LLT
7965	\N	Locarno	ZJI
7966	\N	Lorca	XJR
7967	\N	Loughborough	XQI
7968	\N	Lucas Do Rio Verde	LVR
7969	\N	Lucerne	QLJ
7970	\N	Ludwigslust	ZLU
7971	\N	Lueneburg	ZOG
7972	\N	Lugoj	LGJ
7973	\N	Lund	XGC
7974	\N	Luosto	ZLV
7975	\N	Lutherstadt Wittenberg	ZWT
7976	\N	Lysaker	XUI
7977	\N	Lyss	ZJL
7978	\N	Maamigili	VAM
7979	\N	Macclesfield	XMZ
7980	\N	Madison	MDN
7981	\N	Mainz	QMZ
7982	\N	Makkah	QCA
7983	\N	Malvinas	VVN
7984	\N	Mansfield	ZMA
7985	\N	Mansons Landing	YMU
7986	\N	Mariposa	RMY
7987	\N	Market Harborough	XQM
7988	\N	Marnardal	ZYY
7989	\N	Martigny	ZJM
7990	\N	Mary River	YMV
7991	\N	Mary's Harbour	YMH
7992	\N	Matapedia	XLP
7993	\N	Maxville	XID
7994	\N	Mayfa'ah	MFY
7995	\N	M'banza Congo	SSY
7996	\N	Melville	XEK
7997	\N	Merano/Meran	ZMR
7998	\N	Meru-Kinna	JJM
7999	\N	Miami	MIO
8000	\N	Miedzyzdroje	ZMC
8001	\N	Mildred Lake	NML
8002	\N	Minden	ZOM
8003	\N	Miramichi	XEY
8004	\N	Mjolby	XXM
8005	\N	Modena	ZMO
8006	\N	Moelv	XUJ
8007	\N	Mohe	OHE
8008	\N	Mons	QMO
8009	\N	Montreux	ZJP
8010	\N	Moramanga	OHB
8011	\N	Morges	ZJQ
8012	\N	Moron	OZP
8013	\N	Moss	XKM
8014	\N	Motherwell	XQW
8015	\N	Mountain Home	MUO
8016	\N	Mt Clemens	MTC
8017	\N	Muelheim an der Ruhr	ZOO
8018	\N	Mukhaizna	UKH
8019	\N	Muskogee	MKO
8020	\N	Myrdal	XOL
8021	\N	Namur	QNM
8022	\N	Nanaimo	YCD
8023	\N	Nansha	NSZ
8024	\N	Napanee	XIF
8025	\N	Nassjo	XWX
8026	\N	Nay Pyi Taw	NYT
8027	\N	Nazran	IGT
8028	\N	Ndjole	KDJ
8029	\N	Nelaug	XHL
8030	\N	Nesbyen	XUL
8031	\N	Neslandsvatn	XUM
8032	\N	Neuchatel	QNC
8033	\N	Nevatim	VTM
8034	\N	New Carlisle	XEL
8035	\N	New Richmond	XEM
8036	\N	Newark	XNK
8037	\N	Newark	EWR
8038	\N	Newport	XNE
8039	\N	Niagara Falls	XLV
8040	\N	Niau	NIU
8041	\N	Niuafo'ou	NFO
8042	\N	Nogales	NOG
8043	\N	Nogliki	NGK
8044	\N	Nordagutu	XUO
8045	\N	Norman's Cay	NMC
8046	\N	Northallerton	XNO
8047	\N	Northbrook	OBK
8048	\N	Novo Progresso	NPR
8049	\N	Nuneaton	XNV
8050	\N	Nuwara Eliya	NUA
8051	\N	Nyborg	ZIB
8052	\N	Nykobing Mors	ZAW
8053	\N	Nykobing Sjaelland	ZIJ
8054	\N	Nyon	ZRN
8055	\N	N'zeto	ARZ
8056	\N	Oakdale	ODC
8057	\N	Oakville	XOK
8058	\N	Oberhausen	ZOY
8059	\N	Obo	MKI
8060	\N	Offenburg	ZPA
8061	\N	Oldenburg	ZPD
8062	\N	Olten	ZJU
8063	\N	Opinaca	YOI
8064	\N	Oppdal	XOD
8065	\N	Orang	RGO
8066	\N	Orange	JOR
8067	\N	Oristano	FNU
8068	\N	Oro Station	YLK
8069	\N	Orzola	OZL
8070	\N	Osborne Mine	OSO
8071	\N	Oshawa	QWA
8072	\N	Otta	XOR
8073	\N	Oyo	OLL
8074	\N	Padova	QPA
8075	\N	Paradise	PYS
8076	\N	Parent	XFE
8077	\N	Parksville	XPB
8078	\N	Pasewalk	ZSK
8079	\N	Passau	ZPF
8080	\N	Paterswolde	QYT
8081	\N	Patos De Minas	QPT
8082	\N	Penang	ZJR
8083	\N	Penrith	XPF
8084	\N	Perce	XFG
8085	\N	Perisher Valley	QPV
8086	\N	Peru	GUS
8087	\N	Peterborough	XVH
8088	\N	Peterson's Point	PNF
8089	\N	Plastun	TLY
8090	\N	Ploiesti	QPL
8091	\N	Pointe-aux-Trembles	XPX
8092	\N	Pondok Cabe	PCB
8093	\N	Ponta Grossa	PGZ
8094	\N	Ponta Pelada	PLL
8095	\N	Pontresina	ZJV
8096	\N	Porsgrunn	XKP
8097	\N	Port Hope	XPH
8098	\N	Port-Daniel	XFI
8099	\N	Potchefstroom	PCF
8100	\N	Pothuvil	AYY
8101	\N	Praya	LOP
8102	\N	Prescott	XII
8103	\N	Preston	XPT
8104	\N	Progresso	PGG
8105	\N	Prominent Hill	PXH
8106	\N	Prudhoe Bay/Deadhorse	SCC
8107	\N	Puerto San Jose	GSJ
8108	\N	Pyha	XPY
8109	\N	Qarn Alam	RNM
8110	\N	Qayyarah	RQW
8111	\N	Qionghai	QHX
8112	\N	Quadra Island	YQJ
8113	\N	Quincy	GNF
8114	\N	Rade	ZXX
8115	\N	Rafaela	RAF
8116	\N	Ramsgate	QQR
8117	\N	Randers	ZIR
8118	\N	Rapperswil	ZJW
8119	\N	Raroia	RRR
8120	\N	Rastatt	ZRW
8121	\N	Raufoss	ZMQ
8122	\N	Reading	XRE
8123	\N	Recklinghausen	ZPL
8124	\N	Refuge Cove	YRC
8125	\N	Regensburg	ZPM
8126	\N	Reggio nell'Emilia	ZRO
8127	\N	Reko Diq	REQ
8128	\N	Rena	XKE
8129	\N	Resita	QRS
8130	\N	Rexburg	RXE
8131	\N	Richmond	XRH
8132	\N	Ringebu	XUQ
8133	\N	Riviere-a-Pierre	XRP
8134	\N	Rockford	RMC
8135	\N	Rognan	ZXM
8136	\N	Rome	RME
8137	\N	Roosendaal	ZYO
8138	\N	Rorschach	ZJZ
8139	\N	Rota	ROZ
8140	\N	Rugby	XRU
8141	\N	Rugeley	XRG
8142	\N	Ruka	XHD
8143	\N	Rumbek	RBX
8144	\N	Runcorn	XRC
8145	\N	Rygge	ZXU
8146	\N	Saariselka	XGQ
8147	\N	Saas-Fee	ZKI
8148	\N	Sackville	XKV
8149	\N	Saih Rawl	AHW
8150	\N	Saint Hyacinthe	XIM
8151	\N	Salerno	OLR
8152	\N	Salina	SBO
8153	\N	Salina Island	ZIQ
8154	\N	Salisbury	XSR
8155	\N	Salzwedel	ZSQ
8156	\N	Samjiyon	YJS
8157	\N	San Miguel	SYL
8158	\N	San Pablo	SPO
8159	\N	San Pedro de Alcantara	ZRC
8160	\N	Sandefjord	ZYS
8161	\N	Sandvika	ZYW
8162	\N	Santa Clara	ZSM
8163	\N	Santa Fe	ZSH
8164	\N	Sao Carlos	QSC
8165	\N	Sapezal	AZL
8166	\N	Sargans	ZKA
8167	\N	Sarnen	ZKC
8168	\N	Sarpsborg	XKQ
8169	\N	Sassnitz	ZSI
8170	\N	Schaffhausen	ZKJ
8171	\N	Schoena	ZSC
8172	\N	Schwanheide	ZSD
8173	\N	Schwyz	ZKK
8174	\N	Scottsdale	ZSY
8175	\N	Sedom	SED
8176	\N	Seefeld	XOW
8177	\N	Segovia	XOU
8178	\N	Senneterre	XFK
8179	\N	Seo de Urgel	LEU
8180	\N	Severac-le-Chateau	ZBH
8181	\N	Shahrud	RUD
8182	\N	Shank	OAA
8183	\N	Sharana	OAS
8184	\N	Shawinigan	XFL
8185	\N	Shawnigan	XFM
8186	\N	Shekou	ZYK
8187	\N	Shindand	OAH
8188	\N	Shizuoka	FSZ
8189	\N	Siegburg	ZPY
8190	\N	Sierre/Siders	ZKO
8191	\N	Silkeborg	XAH
8192	\N	Sira	XOQ
8193	\N	Ski	YVS
8194	\N	Skoppum	XUR
8195	\N	Slayton	NSL
8196	\N	Smiggin Holes	QZC
8197	\N	Snap Lake	YNX
8198	\N	Snartemo	XUS
8199	\N	Soelden	XOO
8200	\N	Sohag	HMB
8201	\N	Solingen	ZIO
8202	\N	Solothurn	ZKS
8203	\N	Sondok	DSO
8204	\N	Sonneberg	ZSG
8205	\N	Soria	XJO
8206	\N	Sotkamo	XQS
8207	\N	Sovetskaya Gavan	GVN
8208	\N	Sparta	SPJ
8209	\N	Springvale	ZVG
8210	\N	St Gallen	QGL
8211	\N	St Margrethen	ZKF
8212	\N	St Marys	XIO
8213	\N	St Pauls	SVM
8214	\N	Stafford	XVB
8215	\N	Stamford	ZTF
8216	\N	Steinkjer	XKJ
8217	\N	Stendal	ZSN
8218	\N	Stevenage	XVJ
8219	\N	St-Genis	QXK
8220	\N	Stirling	XWB
8221	\N	Stjordal	XUU
8222	\N	Stockport	XVA
8223	\N	Stoke-on-Trent	XWH
8224	\N	Strangnas	XFH
8225	\N	Stratford	XFD
8226	\N	Strathroy	XTY
8227	\N	Struer	QWQ
8228	\N	Sturtevant	ZTV
8229	\N	Subic Bay	SFS
8230	\N	Suhl	ZSO
8231	\N	Sulsted	QYQ
8232	\N	Sumter	SSC
8233	\N	Sunchales	NCJ
8234	\N	Sursee	ZKU
8235	\N	Svendborg	QXV
8236	\N	Swindon	XWS
8237	\N	Taichung	RMQ
8238	\N	Taipa	YFT
8239	\N	Tamky	VCL
8240	\N	Tarragona	QGN
8241	\N	Taschereau	XFO
8242	\N	Tena	TNW
8243	\N	Tengchong	TCZ
8244	\N	Thalwil	ZKV
8245	\N	Thirsk	XTK
8246	\N	Thredbo	QTH
8247	\N	Thun	ZTK
8248	\N	Tianshui	THQ
8249	\N	Tierp	XFU
8250	\N	Tillamook	OTK
8251	\N	Timbavati	TDT
8252	\N	Tissa Tank	TTW
8253	\N	Toledo	XTJ
8254	\N	Tonsberg	XKW
8255	\N	Tottenham	TTK
8256	\N	Trompeteros	TDP
8257	\N	Truro	XLZ
8258	\N	Tsuen Wan	ZTW
8259	\N	Tudela	EEL
8260	\N	Turpan	TLQ
8261	\N	Tynset	ZMX
8262	\N	Uljin	UJN
8263	\N	Ulm	QUL
8264	\N	Umnak Island	UMB
8265	\N	Uppsala	QYX
8266	\N	Urengoy	UEN
8267	\N	Ustaoset	XUX
8268	\N	Ust-Tsilma	UTS
8269	\N	Ustupu Island	OGM
8270	\N	Utica	UIZ
8271	\N	Uzwil	ZKX
8272	\N	Valenciennes	XVS
8273	\N	Varandey	VRI
8274	\N	Varberg	XWV
8275	\N	Vava'u	VAV
8276	\N	Vegarshei	ZYV
8277	\N	Vejle	XVX
8278	\N	Vennesla	XXE
8279	\N	Ventspils	VNT
8280	\N	Verbier	ZKY
8281	\N	Verdal	XXG
8282	\N	Vestbjerg	QXF
8283	\N	Vevey	ZKZ
8284	\N	Viborg	ZGX
8285	\N	Vidyanagar	VDY
8286	\N	Villarrica	ZVC
8287	\N	Villars-sur-Ollon	ZLA
8288	\N	Vinstra	XKZ
8289	\N	Vipingo	VPG
8290	\N	Visp	ZLB
8291	\N	Voss	XVK
8292	\N	Vuokatti	XVM
8293	\N	Waedenswil	ZLC
8294	\N	Wakefield	XWD
8295	\N	Walker's Cay	WKR
8296	\N	Wanning	WXJ
8297	\N	Warnemuende	ZWD
8298	\N	Warrington	XWN
8299	\N	Watford	XWA
8300	\N	Weinfelden	ZLD
8301	\N	Wellingborough	XWE
8302	\N	Wenchang	WEC
8303	\N	Wengen	ZLE
8304	\N	West Branch	WBK
8305	\N	Wettingen	ZLF
8306	\N	Wetzikon	ZKW
8307	\N	Weymont	XFQ
8308	\N	Whidbey Island	NUW
8309	\N	White River	YWR
8310	\N	Wigan	XWI
8311	\N	Wil	ZLH
8312	\N	Wilbarger	WIB
8313	\N	Wildwood	WWS
8314	\N	Willcox	CWX
8315	\N	Winterthur	ZLI
8316	\N	Wismar	ZWM
8317	\N	Wittenberge	ZWN
8318	\N	Wittenoom	WIT
8319	\N	Woergl	QXZ
8320	\N	Woking	XWO
8321	\N	Wolverhampton	XVW
8322	\N	Wonsan	WOS
8323	\N	Woodstock	XIP
8324	\N	Worms	ZQV
8325	\N	Wuerzburg	QWU
8326	\N	Wuppertal	UWP
8327	\N	Wyoming	XWY
8328	\N	Wyton	QUY
8329	\N	Yan'an	ENY
8330	\N	Yerbogachen	ERG
8331	\N	Yeysk	EIK
8332	\N	Yllasjarvi	XHA
8333	\N	York	QQY
8334	\N	Yverdon-les-Bains	ZLJ
8335	\N	Zagora	OZG
8336	\N	Zamzama	ZIZ
8337	\N	Zaqatala	ZTU
8338	\N	Zermatt	QZB
8339	\N	Zhangjiakou	ZQZ
8340	\N	Zhangye	YZY
8341	\N	Zittau	ZIT
8342	\N	Zofingen	ZLL
8343	\N	Zonalnoye	ZZO
8344	\N	Zug	ZLM
8345	\N	Fort Benning	LSF
8346	\N	Sugar Land	SGR
8347	\N	Batagay	БТГ
8348	\N	Abbotsford	YXX
8349	\N	Abilene	ABI
8350	\N	Aguadilla	BQN
8351	\N	Ajaccio	AJA
8352	\N	Alakanuk	AUK
8353	\N	Alliance	AIA
8354	\N	Altamira	ATM
8355	\N	Anchorage	ANC
8356	\N	An Shun	AVA
8357	\N	St. John's	ANU
8358	\N	Antofagasta	ANF
8359	\N	Arctic Village	ARC
8360	\N	Arkhangelsk	ARH
8361	\N	Atlanta	ATL
8362	\N	Auckland	AKL
8363	\N	Bonito	BYO
8364	\N	Bordj Badji Mokhtar	BMW
8365	\N	Bournemouth	BOH
8366	\N	Bozeman	BZN
8367	\N	Bradford	BFD
8368	\N	Brainerd	BRD
8369	\N	Brisbane	BNE
8370	\N	Bucharest	BUH
8371	\N	Buenaventura	BUN
8372	\N	Cabo Frio	CFB
8373	\N	Caldas Novas	CLV
8374	\N	Cambridge Bay	YCB
8375	\N	Campbeltown	CAL
8376	\N	Carlsbad	CNM
8377	\N	Casablanca	CAS
8378	\N	Castlegar	YCG
8379	\N	Castres	DCM
8380	\N	Caxias Do Sul	CXJ
8381	\N	Cayo Largo Del Sur	CYO
8382	\N	Cedar City	CDC
8383	\N	Chah-bahar	ZBR
8384	\N	Champaign	CMI
8385	\N	Changde	CGD
8386	\N	Chaoyang	CHG
8387	\N	Charlotte	CLT
8388	\N	Chelyabinsk	CEK
8389	\N	Chibougamau	YMT
8390	\N	Chipata	CIP
8391	\N	Chisholm	HIB
8392	\N	Christchurch	CHC
8393	\N	Clarksburg	CKB
8394	\N	Cloncurry	CNJ
8395	\N	Clyde River	YCY
8396	\N	Cody	COD
8397	\N	Coffman Cove	KCC
8398	\N	Colombo	CMB
8399	\N	Columbia	COU
8400	\N	Columbia	CAE
8401	\N	Columbus	CMH
8402	\N	Constantine	CZL
8403	\N	Coral Harbour	YZS
8404	\N	Cordova	CDV
8405	\N	Elmira	ELM
8406	\N	Corrientes	CNQ
8407	\N	Cranbrook	YXC
8408	\N	Crooked Creek	CKD
8409	\N	Curitiba	CWB
8410	\N	Dalaman	DLM
8411	\N	Dalat	DLI
8412	\N	Dandong	DDG
8413	\N	Dawson Creek	YDQ
8414	\N	Decatur	DEC
8415	\N	Deer Lake	YDF
8416	\N	Deer Lake	YVZ
8417	\N	Des Moines	DSM
8418	\N	Detroit	DTT
8419	\N	Dickinson	DIK
8420	\N	Dien Bien Phu	DIN
8421	\N	Dillingham	DLG
8422	\N	Dimapur	DMU
8423	\N	Dinard	DNR
8424	\N	Dodge City	DDC
8425	\N	Dodoma	DOD
8426	\N	Dubai	DXB
8427	\N	El Nido	ENI
8428	\N	El Salvador	ESR
8429	\N	El Yopal	EYP
8430	\N	Elazig	EZS
8431	\N	Enontekio	ENF
8432	\N	Enugu	ENU
8433	\N	Erfurt	ERF
8434	\N	Escanaba	ESC
8435	\N	Eskisehir	ESK
8436	\N	Esperance	EPR
8437	\N	Esquel	EQS
8438	\N	Evansville	EVV
8439	\N	Fak Fak	FKQ
8440	\N	Fakarava	FAV
8441	\N	Fera Island	FRE
8442	\N	Figari	FSC
8443	\N	Sheffield	MSL
8444	\N	Florence	FLO
8445	\N	Flores Island	FLW
8446	\N	Fort Chipewyan	YPY
8447	\N	Fort Dodge	FOD
8448	\N	Fort Good Hope	YGH
8449	\N	Fort Frances	YAG
8450	\N	Fort Mcpherson	ZFM
8451	\N	Fort Nelson	YYE
8452	\N	Fort Simpson	YFS
8453	\N	Fort St John	YXJ
8454	\N	Franklin	FKL
8455	\N	Friday Harbor	FBS
8456	\N	Fukushima	FKS
8457	\N	Futuna Island	FTA
8458	\N	Gabala	GBB
8459	\N	Galela	GLX
8460	\N	Gallivare	GEV
8461	\N	Garden City	GCK
8462	\N	Gary	GYY
8463	\N	General Santos	GES
8464	\N	Geraldton	GET
8465	\N	Ghadames	LTD
8466	\N	Gheshm	GSM
8467	\N	Gerona	GRO
8468	\N	Gjoa Haven	YHK
8469	\N	Kilgore	GGG
8470	\N	Glasgow	GGW
8471	\N	Glendive	GDV
8472	\N	Gold Coast	OOL
8473	\N	Goodnews Bay	GNU
8474	\N	Gorno-Altaysk	RGK
8475	\N	Governors Harbour	GHB
8476	\N	Graciosa Island	GRW
8477	\N	Grand Canyon West	GCW
8478	\N	Grand Turk Island	GDT
8479	\N	Great Barrier Island	GBZ
8480	\N	Great Bend	GBD
8481	\N	Greenville	GLH
8482	\N	Grise Fiord	YGZ
8483	\N	Groote Eylandt	GTE
8484	\N	Guadalajara	GDL
8485	\N	Guangzhou	CAN
8486	\N	Harrison	HRO
8487	\N	Hartford	HFD
8488	\N	Hassi Messaoud	HME
8489	\N	Havre St Pierre	YGV
8490	\N	Hayden	HDN
8491	\N	Hayman Island	HIS
8492	\N	Heho	HEH
8493	\N	Heringsdorf	HDF
8494	\N	High Level	YOJ
8495	\N	Hohhot	HET
8496	\N	Honolulu	HNL
8497	\N	Imperatriz	IMP
8498	\N	In Salah	INZ
8499	\N	Indaselassie	SHC
8500	\N	Independence	INB
8501	\N	Indianapolis	IND
8502	\N	Indore	IDR
8503	\N	Inverness	INV
8504	\N	Inyokern	IYK
8505	\N	Ioannina	IOA
8506	\N	Ironwood	IWD
8507	\N	Ittoqqortoormiit	OBY
8508	\N	Jackson	JAC
8509	\N	Jamestown	JMS
8510	\N	Jalapa	JAL
8511	\N	Ji An	JGS
8512	\N	Jijel	GJL
8513	\N	Joao Pessoa	JPA
8514	\N	Johnstown	JST
8515	\N	Joinville	JOI
8516	\N	Jonesboro	JBR
8517	\N	Juazeiro Do Norte	JDO
8518	\N	Juiz De Fora	JDF
8519	\N	Kaliningrad	KGD
8520	\N	Kandahar	KDH
8521	\N	Kangaatsiaq	QPW
8522	\N	Kangiqsujuaq	YWB
8523	\N	Kansas City	MKC
8524	\N	Lahaina	JHM
8525	\N	Kapuskasing	YYU
8526	\N	Karlovy Vary	KLV
8527	\N	Karlsruhe	FKB
8528	\N	Karpathos	AOK
8529	\N	Kasaan	KXA
8530	\N	Kashi	KHG
8531	\N	Kasos Island	KSJ
8532	\N	Kastoria	KSO
8533	\N	Lihue	LIH
8534	\N	Ketchikan	KTN
8535	\N	Kimmirut	YLC
8536	\N	King Island	KNS
8537	\N	King Khalid Mil. City	KMC
8538	\N	King Salmon	AKN
8539	\N	Kingfisher Lake	KIF
8540	\N	Kinshasa	FIH
8541	\N	Kirakira	IRA
8542	\N	Christmas Island	CXI
8543	\N	Kisangani	FKI
8544	\N	Kisumu	KIS
8545	\N	Kita Kyushu	KKJ
8546	\N	Kokkola	KOK
8547	\N	Komsomolsk Na Amure	KXK
8548	\N	Krasnodar	KRR
8549	\N	Kufrah	AKF
8550	\N	Kugluktuk	YCO
8551	\N	Kuujjuarapik	YGW
8552	\N	Kwigillingok	KWK
8553	\N	La Chorrera	LCR
8554	\N	La Crosse	LSE
8555	\N	La Pedrera	LPD
8556	\N	Laayoune	EUN
8557	\N	Labasa	LBS
8558	\N	Lafayette	LFT
8559	\N	Lake Manyara	LKY
8560	\N	Lamezia Terme	SUF
8561	\N	Lampang	LPT
8562	\N	Lancaster	LNS
8563	\N	Lannion	LAI
8564	\N	Lansdowne House	YLH
8565	\N	Lappeenranta	LPP
8566	\N	Larantuka	LKA
8567	\N	Lensk	ULK
8568	\N	Lewisburg	LWB
8569	\N	Lewiston	LWS
8570	\N	Lexington	LEX
8571	\N	Liberal	LBL
8572	\N	Lihir Island	LNV
8573	\N	Limnos	LXS
8574	\N	Limoges	LIG
8575	\N	Lincoln	LNK
8576	\N	Lincang	LNJ
8577	\N	Livingstone	LVI
8578	\N	Lloydminster	YLL
8579	\N	Lockhart River	IRG
8580	\N	Long Akah	LKH
8581	\N	Long Island	HAP
8582	\N	Longyan	LCX
8583	\N	Lonorore	LNE
8584	\N	Lord Howe Island	LDH
8585	\N	Loreto	LTO
8586	\N	Lorient	LRT
8587	\N	Luang Namtha	LXG
8588	\N	Luang Prabang	LPQ
8589	\N	Lubumbashi	FBM
8590	\N	Lushan	LUZ
8591	\N	Luoyang	LYA
8592	\N	Lutselke	YSG
8593	\N	Luzon Island	NCP
8594	\N	Lynchburg	LYH
8595	\N	Madang	MAG
8596	\N	Madison	MSN
8597	\N	Madurai	IXM
8598	\N	Mae Hong Son	HGN
8599	\N	Mae Sot	MAQ
8600	\N	Mahe Island	SEZ
8601	\N	Malang	MLG
8602	\N	Mamuju	MJU
8603	\N	Mangaia Island	MGS
8604	\N	Mangshi	LUM
8605	\N	Manzanillo	ZLO
8606	\N	Mar Del Plata	MDQ
8607	\N	Maroantsetra	WMN
8608	\N	Marquette	MQT
8609	\N	Marsh Harbour	MHH
8610	\N	Marshall	MLL
8611	\N	Masbate	MBT
8612	\N	Mason City	MCW
8613	\N	Plaisance	MRU
8614	\N	Mcarthur River	MCV
8615	\N	Medellin	MDE
8616	\N	Mehamn	MEH
8617	\N	Melangguane	MNA
8618	\N	Melbourne	MLB
8619	\N	Memanbetsu	MMB
8620	\N	Mersa Matruh	MUH
8621	\N	Mian Yang	MIG
8622	\N	Mirnyj	MJZ
8623	\N	Missoula	MSO
8624	\N	Mitiaro Island	MOI
8625	\N	Miyake Jima	MYE
8626	\N	Miyazaki	KMI
8627	\N	Moranbah	MOV
8628	\N	Moree	MRZ
8629	\N	Mornington	ONG
8630	\N	Moroni	YVA
8631	\N	Moser Bay	KMY
8632	\N	Mosjoen	MJF
8633	\N	Mount Hagen	HGU
8634	\N	Mount Isa	ISA
8635	\N	Mountain	MWP
8636	\N	Muan	MWX
8637	\N	Mukah	MKM
8638	\N	Multan	MUX
8639	\N	Muskegon	MKG
8640	\N	Mwanza	MWZ
8641	\N	Mikonos	JMK
8642	\N	Nabire	NBX
8643	\N	Nairobi	NBO
8644	\N	Nampula	APL
8645	\N	Nanchong	NAO
8646	\N	Nanning	NNG
8647	\N	Nantong	NTG
8648	\N	Nantucket	ACK
8649	\N	Nanwalek	KEB
8650	\N	Napier	NPE
8651	\N	Naples	APF
8652	\N	Napuka Island	NAU
8653	\N	Naracoorte	NAC
8654	\N	Narsaq	JNS
8655	\N	Nashville	BNA
8656	\N	Natuna Ranai	NTX
8657	\N	Navegantes	NVT
8658	\N	New Haven	HVN
8659	\N	Newburgh	SWF
8660	\N	Nha Trang	NHA
8661	\N	Niaqornaarsuk	QMK
8662	\N	Norfolk	ORF
8663	\N	Norfolk Island	NLK
8664	\N	Norilsk	NSK
8665	\N	Norman Wells	YVQ
8666	\N	Norrkoping	NRK
8667	\N	North Bend	OTH
8668	\N	North Eleuthera	ELH
8669	\N	North Spirit Lake	YNO
8670	\N	North Ronaldsay	NRL
8671	\N	Novokuznetsk	NOZ
8672	\N	Novy Urengoy	NUX
8673	\N	Nowy Dwor Mazowiecki	WMI
8674	\N	Nojabrxsk	NOJ
8675	\N	Nuevo Laredo	NLD
8676	\N	Nunapitchuk	NUP
8677	\N	Nyaung-u	NYU
8678	\N	Nyagan	NYA
8679	\N	Oakland	OAK
8680	\N	Obihiro	OBO
8681	\N	Ogdensburg	OGS
8682	\N	Ogoki	YOG
8683	\N	Okayama	OKJ
8684	\N	Old Harbor	OLH
8685	\N	Ontario	ONT
8686	\N	Orsta-Volda	HOV
8687	\N	Osaka	OSA
8688	\N	Oshima	OIM
8689	\N	Osorno	ZOS
8690	\N	Otu	OTU
8691	\N	Ouargla	OGX
8692	\N	Outer Skerries	OUK
8693	\N	Owensboro	OWB
8694	\N	Paducah	PAH
8695	\N	Palangkaraya	PKY
8696	\N	Panama City	PFN
8697	\N	Pangnirtung	YXP
8698	\N	Panjgur	PJG
8699	\N	Pantelleria	PNL
8700	\N	Paramaribo	PBM
8701	\N	Parkes	PKE
8702	\N	Parsabad	PFQ
8703	\N	Passo Fundo	PFB
8704	\N	Pechora	PEX
8705	\N	Pellston	PLN
8706	\N	Pemba	PMA
8707	\N	Pendleton	PDT
8708	\N	Pensacola	PNS
8709	\N	Peoria	PIA
8710	\N	Perpignan	PGF
8711	\N	Perryville	KPV
8712	\N	Petrolina	PNZ
8713	\N	Philadelphia	PHL
8714	\N	Pilot Station	PQS
8715	\N	Plattsburgh	PBG
8716	\N	Playon Chico	PYC
8717	\N	Pleiku	PXU
8718	\N	Pocatello	PIH
8719	\N	Point Baker	KPB
8720	\N	Polokwane	PTG
8721	\N	Polyarnyj	PYJ
8722	\N	Pond Inlet	YIO
8723	\N	Pondicherry	PNY
8724	\N	Edward River	EDR
8725	\N	Port Graham	PGM
8726	\N	Port Heiden	PTH
8727	\N	Port Moresby	POM
8728	\N	Port Of Spain	POS
8729	\N	Port Sudan	PZU
8730	\N	Portland	PWM
8731	\N	Powell River	YPW
8732	\N	Praia	RAI
8733	\N	Prescott	PRC
8734	\N	Pristina	PRN
8735	\N	Providenciales	PLS
8736	\N	Puerto Carreno	PCR
8737	\N	Puerto Jimenez	PJM
8738	\N	Puerto Leguizamo	LQM
8739	\N	Puerto Lempira	PEU
8740	\N	Puerto Obaldia	PUE
8741	\N	Puerto Plata	POP
8742	\N	Punta Arenas	PUQ
8743	\N	Maldonado	PDP
8744	\N	Putussibau	PSU
8745	\N	Qaisumah	AQI
8746	\N	Qaqortoq	JJU
8747	\N	Qikiqtarjuaq	YVM
8748	\N	Qingyang	IQN
8749	\N	Quelimane	UEL
8750	\N	Juzhou	JUZ
8751	\N	Rabaul	RAB
8752	\N	Rainbow Lake	YOP
8753	\N	Rairua	RVV
8754	\N	Rajkot	RAJ
8755	\N	Ramsar	RZR
8756	\N	Ranchi	IXR
8757	\N	Ravensthorpe	RVT
8758	\N	Redding	RDD
8759	\N	Repulse Bay	YUT
8760	\N	Richmond	RIC
8761	\N	Rio Branco	RBR
8762	\N	Rio Grande	RIG
8763	\N	Rio Hondo	RHD
8764	\N	Riohacha	RCH
8765	\N	Riverton	RIW
8766	\N	Roanoke	ROA
8767	\N	Roche Harbor	RCE
8768	\N	Rochester	RST
8769	\N	Rock Sound	RSD
8770	\N	Rockland	RKD
8771	\N	Rodrigues Island	RRG
8772	\N	Roi Et	ROI
8773	\N	Rondonopolis	ROO
8774	\N	Rost	RET
8775	\N	Rotuma Island	RTA
8776	\N	Rouyn-Noranda	YUY
8777	\N	Rum Cay	RCY
8778	\N	Rurutu	RUR
8779	\N	Russian Mission	RSH
8780	\N	Sachs Harbour	YSY
8781	\N	Sacramento	SAC
8782	\N	Saint Cloud	STC
8783	\N	Saint Marys	KSM
8784	\N	Saint Paul Island	SNP
8785	\N	Sakon Nakhon	SNO
8786	\N	Salem	SLO
8787	\N	Salluit	YSW
8788	\N	Salisbury-Ocean City	SBY
8789	\N	Samarai Island	SQT
8790	\N	Sambava	SVB
8791	\N	Sambu	SAX
8792	\N	Samburu	UAS
8793	\N	Sampit	SMQ
8794	\N	San Andres Island	ADZ
8795	\N	San Domino Island	TQR
8796	\N	San Francisco	SFO
8797	\N	San Jose Del Cabo	SJD
8798	\N	San Juan	SJU
8799	\N	San Luis	LUQ
8800	\N	San Martin DeLos Andes	CPC
8801	\N	San Salvador	SAL
8802	\N	Sand Point	SDP
8803	\N	Sanday	NDY
8804	\N	Sanga Sanga	SGS
8805	\N	Sanliurfa	SFQ
8806	\N	Santa Ana	SNA
8807	\N	Santa Ana	NNB
8808	\N	Santa Clara	SNU
8809	\N	Santa Fe	SFN
8810	\N	Santa Isabel Rio Negro	IRZ
8811	\N	Santa Maria	RIA
8812	\N	Santa Marta	SMR
8813	\N	Santiago	SCL
8814	\N	Santiago	STI
8815	\N	Sao Gabriel	SJL
8816	\N	Sao Joao Del Rei	JDR
8817	\N	Sao Jorge Island	SJZ
8818	\N	Sao Paulo de Olivenca	OLC
8819	\N	Sao Tome Island	TMS
8820	\N	Sary	SRY
8821	\N	Sault Sainte Marie	YAM
8822	\N	Saumlaki	SXK
8823	\N	Saurimo	VHC
8824	\N	Schefferville	YKL
8825	\N	Semipalatinsk	PLX
8826	\N	Sendai	SDJ
8827	\N	Sfax	SFA
8828	\N	Shannon	SNN
8829	\N	Sharm el-Sheikh	SSH
8830	\N	Sheridan	SHR
8831	\N	Shetland Islands	SDZ
8832	\N	Shirahama	SHM
8833	\N	Sihanoukville	KOS
8834	\N	Silchar	IXS
8835	\N	Silver City	SVC
8836	\N	Silver Creek	SVK
8837	\N	Sioux Lookout	YXL
8838	\N	Sirjan	SYJ
8839	\N	Sitia	JSH
8840	\N	Skiathos	JSI
8841	\N	Skien	SKE
8842	\N	Sivas	VAS
8843	\N	Solo City	SOC
8844	\N	Sonderborg	SGD
8845	\N	Sorkjosen	SOJ
8846	\N	South Caicos	XSC
8847	\N	South Naknek	WSN
8848	\N	Sovetsky	OVS
8849	\N	Springfield	SFY
8850	\N	Christiansted	STX
8851	\N	St Eustatius	EUX
8852	\N	St George Island	STG
8853	\N	St. John's	YYT
8854	\N	Basseterre	SKB
8855	\N	Philipsburg	SXM
8856	\N	St Martin	SFG
8857	\N	Stephenville	YJT
8858	\N	St Nazaire	SNR
8859	\N	Stokmarknes	SKN
8860	\N	Stony River	SRV
8861	\N	Stronsay	SOY
8862	\N	Stuttgart	STR
8863	\N	Sucre	SRE
8864	\N	Sukkur	SKZ
8865	\N	Summer Beaver	SUR
8866	\N	Sunshine Coast	MCY
8867	\N	Surkhet	SKH
8868	\N	Syros Island	JSY
8869	\N	Taba	TCP
8870	\N	Tabora	TBO
8871	\N	Tamale	TML
8872	\N	Tamarindo	TNO
8873	\N	Tambolaka	TMC
8874	\N	Tampa	TPA
8875	\N	Tangshan	TVS
8876	\N	Tanjung Pandan	TJQ
8877	\N	Tanjung Selor	TJS
8878	\N	Tirgu Mures	TGM
8879	\N	Tasiuasaq	XEQ
8880	\N	Taveuni	TVU
8881	\N	Tawitawi	TWT
8882	\N	Tegucigalpa	TGU
8883	\N	Teller Mission	KTS
8884	\N	Telluride	TEX
8885	\N	Telupid	TEL
8886	\N	Temuco	ZCO
8887	\N	Tepic	TPQ
8888	\N	Terceira Island	TER
8889	\N	Teresina	THE
8890	\N	Texarkana	TXK
8891	\N	Thandwe	SNW
8892	\N	Santorini (Thira)	JTR
8893	\N	Tiga	TGJ
8894	\N	Timaru	TIU
8895	\N	Tiree	TRE
8896	\N	Tiruchirapally	TRZ
8897	\N	Toksook Bay	OOK
8898	\N	Tulear	TLE
8899	\N	Toowoomba	TWB
8900	\N	Tortuquero	TTQ
8901	\N	Tottori	TTJ
8902	\N	Hyeres	TLN
8903	\N	Tozeur	TOE
8904	\N	Treasure Cay	TCB
8905	\N	Tsushima	TSJ
8906	\N	Tubuai	TUB
8907	\N	Tuktoyaktuk	YUB
8908	\N	Tulcan	TUA
8909	\N	Tulita	ZFN
8910	\N	Tumling Tar	TMI
8911	\N	Tuntutuliak	WTL
8912	\N	Turaif	TUI
8913	\N	Turbat	TUK
8914	\N	Twin Falls	TWF
8915	\N	Ua Huka	UAH
8916	\N	Uganik	UGI
8917	\N	Ukunda	UKA
8918	\N	Ulaanbaatar	ULN
8919	\N	Ulan-ude	UUD
8920	\N	Uliastai	ULZ
8921	\N	Ulsan	USN
8922	\N	Ulyanovsk	ULY
8923	\N	Umtata	UTT
8924	\N	Unalakleet	UNK
8925	\N	Upernavik	JUV
8926	\N	Uruguaiana	URG
8927	\N	Ust-kamenogorsk	UKK
8928	\N	Utila	UII
8929	\N	Uummannaq	UMD
8930	\N	Uyo	QUO
8931	\N	Valdosta	VLD
8932	\N	Valera	VLV
8933	\N	Valparaiso	VPS
8934	\N	Vancouver	YVR
8935	\N	Vanimo	VAI
8936	\N	Vardoe	VAW
8937	\N	Velikij Ustyug	VUS
8938	\N	Vestmannaeyjar	VEY
8939	\N	Victoria	YYJ
8940	\N	Victoria	VCT
8941	\N	Vilanculos	VNX
8942	\N	Villa Mercedes	VME
8943	\N	Villahermosa	VSA
8944	\N	Visalia	VIS
8945	\N	Vladikavkaz	OGZ
8946	\N	Vladivostok	VVO
8947	\N	Wadi Ad Dawasir	WAE
8948	\N	Wagga Wagga	WGA
8949	\N	Wallis Island	WLS
8950	\N	Waskaganish	YKQ
8951	\N	Watertown	ART
8952	\N	Watertown	ATY
8953	\N	Wausau	AUW
8954	\N	Wenatchee	EAT
8955	\N	Westchester County	HPN
8956	\N	White Mountain	WMO
8957	\N	Wichita Falls	SPS
8958	\N	Williston	ISN
8959	\N	Wilmington	ILG
8960	\N	Wolf Point	OLF
8961	\N	Wonan	WOT
8962	\N	WonJu	WJU
8963	\N	Worcester	ORH
8964	\N	Wu Hai	WUA
8965	\N	Wunnummin Lake	WNN
8966	\N	Wuyishan	WUS
8967	\N	Xi'an	SIA
8968	\N	Xiangfan	XFN
8969	\N	Xichang	XIC
8970	\N	Xingyi	ACX
8971	\N	Xuzhou	XUZ
8972	\N	Yangzhou	YTY
8973	\N	Yanji	YNJ
8974	\N	Yantai	YNT
8975	\N	Yap	YAP
8976	\N	Yaroslavl	IAR
8977	\N	Yellowknife	YZF
8978	\N	Yeosu	RSU
8979	\N	Yichun	LDS
8980	\N	Yinchuan	INC
8981	\N	Yulin	UYN
8982	\N	Zhongwei	ZHY
8983	\N	Akulivik	AKV
8984	\N	Albany	ALH
8985	\N	Mataram	AMI
8986	\N	Andahuaylas	ANS
8987	\N	Ann Arbor	ARB
8988	\N	Aracatuba	ARU
8989	\N	Atmautluak	ATT
8990	\N	Augusta	AUG
8991	\N	Akita	AXT
8992	\N	Vadodara	BDQ
8993	\N	Benghazi	BEN
8994	\N	Bujumbura	BJM
8995	\N	León	BJX
8996	\N	Branson	BKG
8997	\N	Blackall	BKQ
8998	\N	Beckley	BKW
8999	\N	Barcelona	BLA
9000	\N	Blackpool	BLK
9001	\N	Blantyre	BLZ
9002	\N	Budapest	BUD
9003	\N	Burnie	BWT
9004	\N	Campos	CAW
9005	\N	Criciuma	CCM
9006	\N	Concepcion	CCP
9007	\N	Chadron	CDR
9008	\N	Cacador	CFC
9009	\N	Chlef	CFK
9010	\N	Chittagong	CGP
9011	\N	Chuathbaluk	CHU
9012	\N	Chico	CIC
9013	\N	Chalkyitsik	CIK
9014	\N	Corumba	CMG
9015	\N	Constanta	CND
9016	\N	Casper	CPR
9017	\N	Cochstedt	CSO
9018	\N	Cuneo	CUF
9019	\N	Culiacan	CUL
9020	\N	Covington	CVG
9021	\N	Dayton	DAY
9022	\N	Dadu	DDU
9023	\N	Dothan	DHN
9024	\N	Dire Dawa	DIR
9025	\N	Jayapura	DJJ
9026	\N	Duluth	DLH
9027	\N	Dalanzadgad	DLZ
9028	\N	Dourados	DOU
9029	\N	Deering	DRG
9030	\N	Du Bois	DUJ
9031	\N	Kearney	EAR
9032	\N	Edna Bay	EDA
9033	\N	Edremit	EDO
9034	\N	Elko	EKO
9035	\N	Elfin Cove	ELV
9036	\N	Emerald	EMD
9037	\N	Emmonak	EMK
9038	\N	Kenai	ENA
9039	\N	Erechim	ERM
9040	\N	Fortuna	FON
9041	\N	Bishkek	FRU
9042	\N	Francistown	FRW
9043	\N	Galena	GAL
9044	\N	Georgetown	GEO
9045	\N	Griffith	GFF
9046	\N	Grafton	GFN
9047	\N	Gustavus	GST
9048	\N	Goiania	GYN
9049	\N	Holy Cross	HCR
9050	\N	Hyderabad	HDD
9051	\N	Hamilton	HLZ
9052	\N	Haines	HNS
9053	\N	Hobbs	HOB
9054	\N	Homer	HOM
9055	\N	Huron	HON
9056	\N	Huslia	HSL
9057	\N	Hydaburg	HYG
9058	\N	Igiugig	IGG
9059	\N	Kingman	IGM
9060	\N	Iguazu	IGR
9061	\N	Nikolski	IKO
9062	\N	Killeen	ILE
9063	\N	Islip	ISP
9064	\N	Itaituba	ITB
9065	\N	Ithaca	ITH
9066	\N	Hilo	ITO
9067	\N	Ilulissat	JAV
9068	\N	Joacaba	JCB
9069	\N	Qasigiannguit	JCH
9070	\N	Qeqertarsuaq	JGO
9071	\N	Joplin	JLN
9072	\N	Juneau	JNU
9073	\N	Yoshkar-Ola	JOK
9074	\N	Jackson	JXN
9075	\N	False Pass	KFP
9076	\N	Grayling	KGX
9077	\N	Kerikeri	KKE
9078	\N	Akiachak	KKI
9079	\N	Kalskag	KLG
9080	\N	Levelock	KLL
9081	\N	Larsen Bay	KLN
9082	\N	Kotlik	KOT
9083	\N	Kipnuk	KPN
9084	\N	Thorne Bay	KTB
9085	\N	Kasigluk	KUK
9086	\N	Kulusuk	KUS
9087	\N	King Cove	KVC
9088	\N	Kivalina	KVL
9089	\N	Quinhagak	KWN
9090	\N	West Point	KWP
9091	\N	Kwethluk	KWT
9092	\N	Laramie	LAR
9093	\N	Lawton	LAW
9094	\N	Lubbock	LBB
9095	\N	Latrobe	LBE
9096	\N	Lourdes	LDE
9097	\N	Leshukonskoye	LDG
9098	\N	Lahad Datu	LDU
9099	\N	Leticia	LET
9100	\N	Lakselv	LKL
9101	\N	Lalibela	LLI
9102	\N	Lilongwe	LLW
9103	\N	Longreach	LRE
9104	\N	Lhoksumawe	LSW
9105	\N	Lismore	LSY
9106	\N	Latacunga	LTX
9107	\N	Laurel	LUL
9108	\N	Lewistown	LWT
9109	\N	Montego Bay	MBJ
9110	\N	Macapa	MCP
9111	\N	Madinah	MED
9112	\N	Maringa	MGF
9113	\N	Marilia	MII
9114	\N	Majunga	MJN
9115	\N	Jackson	MKL
9116	\N	Moline	MLI
9117	\N	Miles City	MLS
9118	\N	Morristown	MMU
9119	\N	Maningrida	MNG
9120	\N	Modesto	MOD
9121	\N	Minot	MOT
9122	\N	Mardin	MQM
9123	\N	Misawa	MSJ
9124	\N	Massena	MSS
9125	\N	Montrose	MTJ
9126	\N	Manzini	MTS
9127	\N	Marion	MWA
9128	\N	Mexicali	MXL
9129	\N	Mekoryuk	MYU
9130	\N	Narrabri	NAA
9131	\N	Nassau	NAS
9132	\N	Nightmute	NME
9133	\N	Newquay	NQY
9134	\N	Nuiqsut	NUI
9135	\N	Nulato	NUL
9136	\N	Zonguldak	ONQ
9137	\N	Port Lions	ORI
9138	\N	Noorvik	ORV
9139	\N	Ostend	OST
9140	\N	Patna	PAT
9141	\N	Pelotas	PET
9142	\N	Point Hope	PHO
9143	\N	Parintins	PIN
9144	\N	Pilot Point	PIP
9145	\N	Pierre	PIR
9146	\N	Point Lay	PIZ
9147	\N	Napaskiak	PKA
9148	\N	Porlamar	PMV
9149	\N	Palmas	PMW
9150	\N	Pasco	PSC
9151	\N	Platinum	PTU
9152	\N	Pueblo	PUB
9153	\N	Pullman	PUW
9154	\N	Porto Velho	PVH
9155	\N	Porto Santo	PXO
9156	\N	Rodez	RDZ
9157	\N	Rajshahi	RJH
9158	\N	Marsa Alam	RMF
9159	\N	Rønne	RNN
9160	\N	Rennes	RNS
9161	\N	Roswell	ROW
9162	\N	Roros	RRS
9163	\N	San Pedro Sula	SAP
9164	\N	Lubango	SDD
9165	\N	São Filipe	SFL
9166	\N	Skagway	SGY
9167	\N	Staunton	SHD
9168	\N	Shungnak	SHG
9169	\N	Shishmaref	SHH
9170	\N	Shageluk	SHX
9171	\N	Simferopol	SIP
9172	\N	Shaktoolik	SKK
9173	\N	Salina	SLN
9174	\N	Sleetmute	SLQ
9175	\N	Show Low	SOW
9176	\N	Santa Cruz	SRZ
9177	\N	San Vicente	SVI
9178	\N	Strasbourg	SXB
9179	\N	Tablas	TBH
9180	\N	Tabatinga	TBT
9181	\N	Nuku'alofa	TBU
9182	\N	Tumaco	TCO
9183	\N	Tuticorin	TCR
9184	\N	Trinidad	TDD
9185	\N	Tlemcen	TLM
9186	\N	Tuluksak	TLT
9187	\N	Antananarivo	TNR
9188	\N	Trapani	TPS
9189	\N	Tarakan	TRK
9190	\N	Trujillo	TRU
9191	\N	Tetuan	TTU
9192	\N	Tucurui	TUR
9193	\N	Torsby	TYF
9194	\N	Tyler	TYR
9195	\N	Narsarsuaq	UAK
9196	\N	San Juan	UAQ
9197	\N	Qui Nhon	UIH
9198	\N	Quincy	UIN
9199	\N	Sevastopol	UKS
9200	\N	Viedma	VDM
9201	\N	Valdez	VDZ
9202	\N	Venetie	VEE
9203	\N	Vernal	VEL
9204	\N	Valencia	VLN
9205	\N	Vieques	VQS
9206	\N	Joroinen	VRK
9207	\N	Villavicencio	VVC
9208	\N	Växjö	VXO
9209	\N	Stebbins	WBB
9210	\N	Wakkanai	WKJ
9211	\N	Napakiak	WNA
9212	\N	Wrangell	WRG
9213	\N	Worland	WRL
9214	\N	Westerly	WST
9215	\N	Noatak	WTK
9216	\N	Wewak	WWK
9217	\N	Whale Pass	WWP
9218	\N	Chapeco	XAP
9219	\N	Yakutat	YAK
9220	\N	Cross Lake	YCR
9221	\N	Inuvik	YEV
9222	\N	Iqaluit	YFB
9223	\N	Flin Flon	YFO
9224	\N	Kingston	YGK
9225	\N	Igloolik	YGT
9226	\N	Charlottetown	YHG
9227	\N	Holman	YHI
9228	\N	Hopedale	YHO
9229	\N	Hay River	YHY
9230	\N	Ivujivik	YIK
9231	\N	Kangirsuk	YKG
9232	\N	Chisasibi	YKU
9233	\N	Prince Albert	YPA
9234	\N	Port Alberni	YPB
9235	\N	Paulatuk	YPC
9236	\N	Inukjuak	YPH
9237	\N	Aupaluk	YPJ
9238	\N	The Pas	YQD
9239	\N	Red Deer	YQF
9240	\N	Grande Prairie	YQU
9241	\N	Red Lake	YRL
9242	\N	Sudbury	YSB
9243	\N	Sanikiluaq	YSK
9244	\N	Fort Smith	YSM
9245	\N	Thompson	YTH
9246	\N	Timmins	YTS
9247	\N	Yuma	YUM
9248	\N	Hall Beach	YUX
9249	\N	Kuujjuaq	YVP
9250	\N	Whale Cove	YXN
9251	\N	Smithers	YYD
9252	\N	Taloyoak	YYH
9253	\N	Churchill	YYQ
9254	\N	Sarnia	YZR
9255	\N	Port Hardy	YZT
9256	\N	Sept-Iles	YZV
9257	\N	Zamboanga	ZAM
9258	\N	Biloela	ZBL
9259	\N	Baise	AEB
9260	\N	Barrow	BRW
9261	\N	Brunswick	SSI
9262	\N	Dharavandhoo Island	DRV
9263	\N	Mount Gordon Mine	GPD
9264	\N	Orlando	ORL
9265	\N	Ovda	VDA
9266	\N	Owerri	QOW
9267	\N	Antwerp	ANR
9268	\N	Alice Springs	ASP
9269	\N	Basra	BSR
9270	\N	Brazzaville	BZV
9271	\N	Lefkosa	ECN
9272	\N	Harstad-narvik	EVE
9273	\N	Fargo	FAR
9274	\N	Heihe	HEK
9275	\N	Huntsville	HSV
9276	\N	Smolensk	LNX
9277	\N	La Rochelle	LRH
9278	\N	Caticlan	MPH
9279	\N	Mogilev	MVQ
9280	\N	Neftekamsk	NEF
9281	\N	Nefteyugansk	NFG
9282	\N	Novorossijsk	NOI
9283	\N	Navoi	NVI
9284	\N	Petropavlovsk	PPK
9285	\N	Krabi	KBV
9286	\N	Hua Hin	HHQ
9287	\N	Edinburgh	EDI
9288	\N	Calgary	YYC
9289	\N	Winnipeg	YWG
9290	\N	Thiruvananthapuram	TRV
9291	\N	Durban	DUR
9292	\N	Kochi	COK
9293	\N	Kolkata	CCU
9294	\N	Entebbe	EBB
9295	\N	Arrecife	ACE
9296	\N	Albany	ALB
9297	\N	Austin	AUS
9298	\N	Brindisi	BDS
9299	\N	Billund	BLL
9300	\N	Burlington	BTV
9301	\N	Chania	CHQ
9302	\N	Cleveland	CLE
9303	\N	Dusseldorf	DUS
9304	\N	Memmingen	FMM
9305	\N	Spokane	GEG
9306	\N	Jacksonville	JAX
9307	\N	Khabarovsk	KHV
9308	\N	Little Rock	LIT
9309	\N	Las Palmas	LPA
9310	\N	Minneapolis	MSP
9311	\N	Omaha	OMA
9312	\N	Oslo	OSL
9313	\N	Porbandar	PBD
9314	\N	Penang	PEN
9315	\N	Puerto Princesa	PPS
9316	\N	Providence	PVD
9317	\N	Raleigh	RDU
9318	\N	Rostov	ROV
9319	\N	Louisville	SDF
9320	\N	Sármellék	SOB
9321	\N	Stavropol	STW
9322	\N	Surigao	SUG
9323	\N	Srinagar	SXR
9324	\N	Tucson	TUS
9325	\N	Kursk	URS
9326	\N	Fagernes	VDB
9327	\N	Vijayawada	VGA
9328	\N	Vilhelmina	VHM
9329	\N	Halifax	YHZ
9330	\N	Salerno	QSR
9331	\N	Doncaster	DSA
9332	\N	Greenville	GSP
9333	\N	Hilton Head	HHH
9334	\N	Kitchener-Waterloo	YKF
9335	\N	Georgetown	GCM
9336	\N	Grand Forks	GFK
9337	\N	Moncton	YQM
9338	\N	Bathurst	ZBF
9339	\N	Ciudad Obregon	CEN
9340	\N	Idaho Falls	IDA
9341	\N	San Antonio	SAT
9342	\N	Bloomington	BMI
9343	\N	London	YXU
9344	\N	Port Hedland	PHE
9345	\N	Jeju	CJU
9346	\N	Grand Rapids	GRR
9347	\N	Puerto Escondido	PXM
9348	\N	Asmara	ASM
9349	\N	Brest	BES
9350	\N	Port Macquarie	PQQ
9351	\N	Milas	BJV
9352	\N	Boise	BOI
9353	\N	Syracuse	SYR
9354	\N	Kuala Terengganu	TGG
9355	\N	Fredericton	YFC
9356	\N	Trat	TDX
9357	\N	Sibu	SBW
9358	\N	Tabriz	TBZ
9359	\N	Chimoio	VPY
9360	\N	West Palm Beach	PBI
9361	\N	Springfield	SPI
9362	\N	Mazar-i-sharif	MZR
9363	\N	Harlingen	HRL
9364	\N	Lamu	LAU
9365	\N	Alanya	GZP
9366	\N	Iasi	IAS
9367	\N	Port Au Prince	PAP
9368	\N	Acapulco	ACA
9369	\N	Kostroma	KMW
\.


--
-- Name: cities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('cities_id_seq', 9369, true);


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY countries (id, code, name) FROM stdin;
1	NC	New Caledonia
2	MT	Malta
3	BN	Brunei
4	BT	Bhutan
5	BZ	Belize
6	CA	Canada
7	AD	Andorra
8	AU	Australia
9	BS	Bahamas
10	CY	Cyprus
11	AW	Aruba
12	BH	Bahrain
13	BB	Barbados
14	EE	Estonia
15	CR	Costa Rica
16	EG	Egypt
17	GB	United Kingdom
18	KR	South Korea
19	CU	Cuba
20	JM	Jamaica
21	CL	Chile
22	KW	Kuwait
23	ES	Spain
24	HK	Hong Kong
25	KI	Kiribati
26	KM	Comoros
27	ET	Ethiopia
28	KH	Cambodia
29	IE	Ireland
30	AI	Anguilla
31	BM	Bermuda
32	JE	Jersey
33	IS	Iceland
34	LA	Laos
35	HT	Haiti
36	LT	Lithuania
37	MC	Monaco
38	MQ	Martinique
39	BQ	Bonaire, Saint Eustatius and Saba 
40	EH	Western Sahara
41	NR	Nauru
42	PW	Palau
43	TL	East Timor
44	AQ	Antarctica
45	CZ	Czech Republic
46	LY	Libya
47	LB	Lebanon
48	LI	Liechtenstein
49	LK	Sri Lanka
50	LU	Luxembourg
51	LV	Latvia
52	MA	Morocco
53	ME	Montenegro
54	OM	Oman
55	TN	Tunisia
56	MV	Maldives
57	NP	Nepal
58	PH	Philippines
59	PG	Papua New Guinea
60	PY	Paraguay
61	PA	Panama
62	QA	Qatar
63	RE	Reunion
64	RW	Rwanda
65	SC	Seychelles
66	SI	Slovenia
67	TW	Taiwan
68	NE	Niger
69	NG	Nigeria
70	CN	China
71	GN	Guinea
72	GU	Guam
73	BG	Bulgaria
74	AT	Austria
75	BF	Burkina Faso
76	HU	Hungary
77	AZ	Azerbaijan
78	GA	Gabon
79	DO	Dominican Republic
80	AL	Albania
81	BR	Brazil
82	FJ	Fiji
83	ZW	Zimbabwe
84	ZA	South Africa
85	YE	Yemen
86	XK	Kosovo
87	VE	Venezuela
88	TM	Turkmenistan
89	TH	Thailand
90	TD	Chad
91	TG	Togo
92	US	United States
93	SD	Sudan
94	SA	Saudi Arabia
95	RO	Romania
96	PK	Pakistan
97	PE	Peru
98	NO	Norway
99	NL	Netherlands
100	NI	Nicaragua
101	SV	El Salvador
102	MW	Malawi
103	IR	Iran
104	MN	Mongolia
105	PL	Poland
106	KZ	Kazakhstan
107	HR	Croatia
108	MY	Malaysia
109	IT	Italy
110	SR	Suriname
111	JO	Jordan
112	MX	Mexico
113	KG	Kyrgyzstan
114	ID	Indonesia
115	GY	Guyana
116	HN	Honduras
117	GP	Guadeloupe
118	GH	Ghana
119	GE	Georgia
120	FR	France
121	CO	Colombia
122	CI	Ivory Coast
123	CM	Cameroon
124	IN	India
125	AM	Armenia
126	DE	Germany
127	BO	Bolivia
128	BJ	Benin
129	DZ	Algeria
130	BD	Bangladesh
131	BE	Belgium
132	CH	Switzerland
133	SK	Slovakia
134	SN	Senegal
135	TR	Turkey
136	SE	Sweden
137	SG	Singapore
138	TV	Tuvalu
139	ML	Mali
140	GD	Grenada
141	YT	Mayotte
142	VU	Vanuatu
143	WS	Samoa
144	TT	Trinidad and Tobago
145	KE	Kenya
146	GM	Gambia
147	NU	Niue
148	TO	Tonga
149	SX	Sint Maarten
150	CV	Cape Verde
151	FM	Micronesia
152	PS	Palestinian Territory
153	GW	Guinea-Bissau
154	BI	Burundi
155	LC	Saint Lucia
156	SZ	Swaziland
157	UA	Ukraine
158	SO	Somalia
159	IL	Israel
160	BY	Belarus
161	IM	Isle of Man
162	LS	Lesotho
163	CK	Cook Islands
164	VI	U.S. Virgin Islands
165	DM	Dominica
166	AG	Antigua and Barbuda
167	PF	French Polynesia
168	CD	Democratic Republic of the Congo
169	NA	Namibia
170	MO	Macao
171	SH	Saint Helena
172	ZM	Zambia
173	MG	Madagascar
174	GF	French Guiana
175	KN	Saint Kitts and Nevis
176	ST	Sao Tome and Principe
177	AF	Afghanistan
178	KP	North Korea
179	GL	Greenland
180	GG	Guernsey
181	PM	Saint Pierre and Miquelon
182	CC	Cocos Islands
183	FO	Faroe Islands
184	IO	British Indian Ocean Territory
185	GI	Gibraltar
186	MH	Marshall Islands
187	NF	Norfolk Island
188	SJ	Svalbard and Jan Mayen
189	PN	Pitcairn
190	PR	Puerto Rico
191	SB	Solomon Islands
192	TF	French Southern Territories
193	VG	British Virgin Islands
194	MM	Myanmar
195	MF	Saint Martin
196	GS	South Georgia and the South Sandwich Islands
197	SS	South Sudan
198	BW	Botswana
199	AX	Aland Islands
200	BL	Saint Barthélemy
201	VA	Vatican
202	SM	San Marino
203	TC	Turks and Caicos Islands
204	MZ	Mozambique
205	HM	Heard Island and McDonald Islands
206	MP	Northern Mariana Islands
207	KY	Cayman Islands
208	AS	American Samoa
209	EC	Ecuador
210	DJ	Djibouti
211	DK	Denmark
212	FI	Finland
213	JP	Japan
214	MD	Moldova
215	MU	Mauritius
216	NZ	New Zealand
217	PT	Portugal
218	BA	Bosnia and Herzegovina
219	AR	Argentina
220	VC	Saint Vincent and the Grenadines
221	UY	Uruguay
222	UZ	Uzbekistan
223	UG	Uganda
224	TJ	Tajikistan
225	SY	Syria
226	MK	Macedonia
227	SL	Sierra Leone
228	RS	Serbia
229	MR	Mauritania
230	GQ	Equatorial Guinea
231	GT	Guatemala
232	IQ	Iraq
233	CG	Republic of the Congo
234	UM	United States Minor Outlying Islands
235	AO	Angola
236	TZ	Tanzania
237	CW	Curaçao
238	TK	Tokelau
239	ER	Eritrea
240	LR	Liberia
241	MS	Montserrat
242	VN	Vietnam
243	BV	Bouvet Island
244	AE	United Arab Emirates
245	CX	Christmas Island
246	FK	Falkland Islands
247	WF	Wallis and Futuna
248	CF	Central African Republic
249	GR	Greece
250	RU	Russia
\.


--
-- Name: countries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('countries_id_seq', 250, true);


--
-- Data for Name: friends; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY friends (id, "user", fb_friend) FROM stdin;
1	lrgraham14@gmail.com	meals012@yahoo.com
2	meals012@yahoo.com	lrgraham14@gmail.com
14	monkeyloverxo13@aim.com	lrgraham14@gmail.com
15	monkeyloverxo13@aim.com	meals012@yahoo.com
16	meals012@yahoo.com	monkeyloverxo13@aim.com
\.


--
-- Name: friends_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('friends_id_seq', 16, true);


--
-- Data for Name: journals; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY journals (id, priv_item_id, title, date) FROM stdin;
\.


--
-- Name: journals_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('journals_id_seq', 1, false);


--
-- Data for Name: private_items; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY private_items (id, public_item_id, list_id, tour_link, checked_off, date_created, date_completed, priority) FROM stdin;
11	16	1		f	2017-04-17 19:54:50.861064	\N	\N
4	9	1	None	f	2017-04-16 06:24:19.724105	\N	\N
5	2	1	None	t	2017-04-16 15:52:25.799669	\N	\N
3	11	1	None	t	2017-04-16 05:50:11.919536	\N	\N
6	4	1	None	f	2017-04-16 15:52:30.664375	\N	\N
7	12	1		t	2017-04-16 19:57:00.5474	\N	\N
36	8	2	\N	f	2017-04-20 16:59:11.889884	\N	\N
37	9	2	\N	f	2017-04-20 16:59:17.091262	\N	\N
38	7	2	\N	f	2017-04-20 16:59:29.058902	\N	\N
39	7	24	\N	f	2017-04-20 18:48:10.035429	\N	\N
40	7	1	\N	f	2017-04-20 18:50:20.849524	\N	\N
41	20	1		f	2017-04-20 19:06:08.28548	\N	\N
\.


--
-- Name: private_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('private_items_id_seq', 41, true);


--
-- Data for Name: public_items; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY public_items (id, title, latitude, longitude, country, address, image, description, retired) FROM stdin;
1	Smell the lavender fields in Provence, France	44.0144936000000015	6.21164380000004979	France	Provence, France	https://s3-us-west-1.amazonaws.com/wanderlist-images/Tour_eiffel_at_sunrise_from_the_trocadero.jpg	\N	f
2	Visit Neuschwanstein Castle	47.5575740000000025	10.7498003999999998	Germany	Neuschwansteinstraße 20, 87645 Schwangau, Germany	https://s3-us-west-1.amazonaws.com/wanderlist-images/Castle_Neuschwanstein.jpg	\N	f
3	Stay in an igloo in Finland	68.3335069999999973	27.3367040000001005	Finland	Kiilopääntie 9, 99830 Saariselkä, Finland	https://s3-us-west-1.amazonaws.com/wanderlist-images/igloos_finland.jpg	\N	f
4	Hear the toll of Big Ben in London, England	51.5007292000000021	-0.124625400000014	United Kingdom	Westminster, London SW1A 0AA, UK	https://s3-us-west-1.amazonaws.com/wanderlist-images/big_ben_london_england.jpg	\N	f
5	Walk through the tulip fields in the Netherlands	52.2700188000000026	4.54638929999998975	Netherlands	Stationsweg 166A, 2161 AM Lisse, Netherlands	https://s3-us-west-1.amazonaws.com/wanderlist-images/8527983e67c2c117f75c8a044663e8f4.jpg	\N	f
6	Kayak on Moraine Lake in Alberta, Canada	51.3217416000000028	-116.1860049	Canada	Moraine Lake, Improvement District No. 9, AB T0L, Canada	https://s3-us-west-1.amazonaws.com/wanderlist-images/morainelake.jpg	\N	f
7	Hike Machu Picchu	-13.1631412000000001	-72.5449629000000016	Peru	Peru	https://s3-us-west-1.amazonaws.com/wanderlist-images/machupicchu.jpg	\N	f
8	Dive the Great Barrier Reef, Australia	-18.2870668000000016	147.699191799999994	Australia	Great Barrier Reef, QLD, Australia	https://s3-us-west-1.amazonaws.com/wanderlist-images/great-barrier-reef.jpg	\N	f
9	See a Kangaroo in Australia	-25.2743980000000015	133.775136000000003	Australia	Australia	https://s3-us-west-1.amazonaws.com/wanderlist-images/kangarooaustralia.jpg	\N	f
10	See the bright colors of Grand Prismatic Spring in Yellowstone National Park	44.5251236000000006	-110.838127200000002	United States	Grand Prismatic Spring, Wyoming, USA	https://s3-us-west-1.amazonaws.com/wanderlist-images/grand_prismatic_yellowstone.jpg	\N	f
11	Look down the Cliffs of Moher in Ireland	52.9715368000000026	-9.43088250000005068	Ireland	Cliffs of Moher, Lislorkan North, Co. Clare, Ireland	https://s3-us-west-1.amazonaws.com/wanderlist-images/Cliffs-of-Moher-Small.jpg	\N	f
12	San mateo	37.386051700000003	-122.083851100000004	United States	Mountain View, CA, USA	https://s3-us-west-1.amazonaws.com/wanderlist-images/8527983e67c2c117f75c8a044663e8f4.jpg		f
13	See Arenal Volcano	10.4626262000000008	-84.7031794000000104	Costa Rica	Arenal Volcano, Alajuela Province, San Carlos, Costa Rica	https://s3-us-west-1.amazonaws.com/wanderlist-images/Untitled-1.png		f
14	Float down a Bamboo Raft	18.4073893999999996	-77.1031345000000101	Jamaica	Ocho Rios, Jamaica	https://s3-us-west-1.amazonaws.com/wanderlist-images/Untitled-1.png		f
15	Hear the swiss cow bells rings	45.9836110000000033	7.65833299999997053	Switzerland	Matterhorn Glacier, 3920 Zermatt, Switzerland	https://s3-us-west-1.amazonaws.com/wanderlist-images/Untitled-1.png		f
16	See the Eiffel Tower	48.8583700999999877	2.29448130000002948	France	Champ de Mars, 5 Avenue Anatole France, 75007 Paris, France	https://s3-us-west-1.amazonaws.com/wanderlist-images/Tour_eiffel_at_sunrise_from_the_trocadero.jpg		f
17	see the Cologne Cathedral	50.9412526999999997	6.95813729999997577	Germany	Kölner Dom, 50667 Köln, Germany	https://s3-us-west-1.amazonaws.com/wanderlist-images/Untitled-1.png		f
18	See Cologne Cathedral	50.9412526999999997	6.95813729999997577	Germany	Kölner Dom, 50667 Köln, Germany	https://s3-us-west-1.amazonaws.com/wanderlist-images/Untitled-1.png		f
19	Visit Hallstatt, Austria	47.5622341999999989	13.6492617000000109	Austria	Hallstatt, Austria	https://s3-us-west-1.amazonaws.com/wanderlist-images/Untitled-1.png		f
20	See the Great Blue Hole	17.316047600000001	-87.5351438000000144	Belize	Belize City, Belize	https://s3-us-west-1.amazonaws.com/wanderlist-images/111Belize-Blue-Hole.jpg		f
\.


--
-- Name: public_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('public_items_id_seq', 20, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY users (email, username, password, first_name, last_name, facebook_id, profile_picture) FROM stdin;
meals012@yahoo.com	meals012	1620696111278140	Amelia	Green	1620696111278140	https://scontent.xx.fbcdn.net/v/t1.0-1/p200x200/14355166_1403906742957079_9064765905759793451_n.jpg?oh=2125cb3be1de9462109ad2a34e08eef3&oe=5982F23E
lrgraham14@gmail.com	alex14	10213132765333723	Alex	Graham	10213132765333723	https://scontent.xx.fbcdn.net/v/t1.0-1/p200x200/13001081_10209735659048189_5803947470796642393_n.jpg?oh=3885c70a22baf30d2266ea0b179655d5&oe=5990567F
monkeyloverxo13@aim.com	erin	10212161538461748	Erin	Green	10212161538461748	https://scontent.xx.fbcdn.net/v/t1.0-1/p200x200/16649010_10211675900001090_747028812165887132_n.jpg?oh=d162375784bf738d3e660d9b826a8747&oe=598EF3BF
\.


--
-- Name: airlines_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY airlines
    ADD CONSTRAINT airlines_pkey PRIMARY KEY (id);


--
-- Name: airports_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY airports
    ADD CONSTRAINT airports_pkey PRIMARY KEY (id);


--
-- Name: bucket_lists_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY bucket_lists
    ADD CONSTRAINT bucket_lists_pkey PRIMARY KEY (id);


--
-- Name: cities_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY cities
    ADD CONSTRAINT cities_pkey PRIMARY KEY (id);


--
-- Name: countries_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (id);


--
-- Name: friends_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY friends
    ADD CONSTRAINT friends_pkey PRIMARY KEY (id);


--
-- Name: journals_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY journals
    ADD CONSTRAINT journals_pkey PRIMARY KEY (id);


--
-- Name: private_items_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY private_items
    ADD CONSTRAINT private_items_pkey PRIMARY KEY (id);


--
-- Name: public_items_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public_items
    ADD CONSTRAINT public_items_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (email);


--
-- Name: airports_city_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY airports
    ADD CONSTRAINT airports_city_id_fkey FOREIGN KEY (city_id) REFERENCES cities(id);


--
-- Name: airports_country_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY airports
    ADD CONSTRAINT airports_country_id_fkey FOREIGN KEY (country_id) REFERENCES countries(id);


--
-- Name: bucket_lists_email_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY bucket_lists
    ADD CONSTRAINT bucket_lists_email_fkey FOREIGN KEY (email) REFERENCES users(email);


--
-- Name: cities_country_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY cities
    ADD CONSTRAINT cities_country_id_fkey FOREIGN KEY (country_id) REFERENCES countries(id);


--
-- Name: friends_fb_friend_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY friends
    ADD CONSTRAINT friends_fb_friend_fkey FOREIGN KEY (fb_friend) REFERENCES users(email);


--
-- Name: friends_user_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY friends
    ADD CONSTRAINT friends_user_fkey FOREIGN KEY ("user") REFERENCES users(email);


--
-- Name: journals_priv_item_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY journals
    ADD CONSTRAINT journals_priv_item_id_fkey FOREIGN KEY (priv_item_id) REFERENCES private_items(id);


--
-- Name: private_items_list_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY private_items
    ADD CONSTRAINT private_items_list_id_fkey FOREIGN KEY (list_id) REFERENCES bucket_lists(id);


--
-- Name: private_items_public_item_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY private_items
    ADD CONSTRAINT private_items_public_item_id_fkey FOREIGN KEY (public_item_id) REFERENCES public_items(id);


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

