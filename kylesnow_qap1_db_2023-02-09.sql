PGDMP     8    "        
        {            qap1_kyleSnow    15.1    15.1 !    )           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            *           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            +           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            ,           1262    16548    qap1_kyleSnow    DATABASE     ?   CREATE DATABASE "qap1_kyleSnow" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_Canada.1252';
    DROP DATABASE "qap1_kyleSnow";
                postgres    false            ?            1259    16573    aircraft    TABLE     ?   CREATE TABLE public.aircraft (
    id bigint NOT NULL,
    type character varying(225) NOT NULL,
    airline_name character varying(225) NOT NULL,
    weight_kg bigint NOT NULL,
    number_of_passenger bigint NOT NULL
);
    DROP TABLE public.aircraft;
       public         heap    postgres    false            ?            1259    16614    aircraft_takeoff_land    TABLE     o   CREATE TABLE public.aircraft_takeoff_land (
    aircraft_id bigint NOT NULL,
    airport_id bigint NOT NULL
);
 )   DROP TABLE public.aircraft_takeoff_land;
       public         heap    postgres    false            ?            1259    16568    airport    TABLE     ?   CREATE TABLE public.airport (
    id bigint NOT NULL,
    airport_name character varying(225) NOT NULL,
    area_code bigint NOT NULL,
    postal_code character varying(10) NOT NULL,
    city_id bigint NOT NULL
);
    DROP TABLE public.airport;
       public         heap    postgres    false            ?            1259    16578    city    TABLE     ?   CREATE TABLE public.city (
    id bigint NOT NULL,
    city_name character varying(225) NOT NULL,
    province character varying(225) NOT NULL,
    population bigint NOT NULL,
    number_of_airports bigint NOT NULL
);
    DROP TABLE public.city;
       public         heap    postgres    false            ?            1259    16561 	   passenger    TABLE       CREATE TABLE public.passenger (
    id bigint NOT NULL,
    first_name character varying(225) NOT NULL,
    last_name character varying(225) NOT NULL,
    age bigint NOT NULL,
    phone_number character varying(20) NOT NULL,
    email character varying(225)
);
    DROP TABLE public.passenger;
       public         heap    postgres    false            ?            1259    16601    passenger_aircraft    TABLE     n   CREATE TABLE public.passenger_aircraft (
    passenger_id bigint NOT NULL,
    aircraft_id bigint NOT NULL
);
 &   DROP TABLE public.passenger_aircraft;
       public         heap    postgres    false            ?            1259    16645    passenger_airport    TABLE     l   CREATE TABLE public.passenger_airport (
    passenger_id bigint NOT NULL,
    airport_id bigint NOT NULL
);
 %   DROP TABLE public.passenger_airport;
       public         heap    postgres    false            ?            1259    16588    passenger_city    TABLE     f   CREATE TABLE public.passenger_city (
    passenger_id bigint NOT NULL,
    city_id bigint NOT NULL
);
 "   DROP TABLE public.passenger_city;
       public         heap    postgres    false            !          0    16573    aircraft 
   TABLE DATA           Z   COPY public.aircraft (id, type, airline_name, weight_kg, number_of_passenger) FROM stdin;
    public          postgres    false    216   ?&       %          0    16614    aircraft_takeoff_land 
   TABLE DATA           H   COPY public.aircraft_takeoff_land (aircraft_id, airport_id) FROM stdin;
    public          postgres    false    220   ?'                  0    16568    airport 
   TABLE DATA           T   COPY public.airport (id, airport_name, area_code, postal_code, city_id) FROM stdin;
    public          postgres    false    215   (       "          0    16578    city 
   TABLE DATA           W   COPY public.city (id, city_name, province, population, number_of_airports) FROM stdin;
    public          postgres    false    217   )                 0    16561 	   passenger 
   TABLE DATA           X   COPY public.passenger (id, first_name, last_name, age, phone_number, email) FROM stdin;
    public          postgres    false    214   ?)       $          0    16601    passenger_aircraft 
   TABLE DATA           G   COPY public.passenger_aircraft (passenger_id, aircraft_id) FROM stdin;
    public          postgres    false    219   +       &          0    16645    passenger_airport 
   TABLE DATA           E   COPY public.passenger_airport (passenger_id, airport_id) FROM stdin;
    public          postgres    false    221   m+       #          0    16588    passenger_city 
   TABLE DATA           ?   COPY public.passenger_city (passenger_id, city_id) FROM stdin;
    public          postgres    false    218   ?+       ?           2606    16577    aircraft aircraft_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.aircraft
    ADD CONSTRAINT aircraft_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.aircraft DROP CONSTRAINT aircraft_pkey;
       public            postgres    false    216            ?           2606    16572    airport airport_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.airport
    ADD CONSTRAINT airport_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.airport DROP CONSTRAINT airport_pkey;
       public            postgres    false    215            ?           2606    16582    city city_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.city
    ADD CONSTRAINT city_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.city DROP CONSTRAINT city_pkey;
       public            postgres    false    217            ?           2606    16567    passenger passenger_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.passenger
    ADD CONSTRAINT passenger_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.passenger DROP CONSTRAINT passenger_pkey;
       public            postgres    false    214            ?           2606    16609    passenger_aircraft aircraft_fk    FK CONSTRAINT     ?   ALTER TABLE ONLY public.passenger_aircraft
    ADD CONSTRAINT aircraft_fk FOREIGN KEY (aircraft_id) REFERENCES public.aircraft(id);
 H   ALTER TABLE ONLY public.passenger_aircraft DROP CONSTRAINT aircraft_fk;
       public          postgres    false    219    3205    216            ?           2606    16617 !   aircraft_takeoff_land aircraft_fk    FK CONSTRAINT     ?   ALTER TABLE ONLY public.aircraft_takeoff_land
    ADD CONSTRAINT aircraft_fk FOREIGN KEY (aircraft_id) REFERENCES public.aircraft(id);
 K   ALTER TABLE ONLY public.aircraft_takeoff_land DROP CONSTRAINT aircraft_fk;
       public          postgres    false    216    220    3205            ?           2606    16622     aircraft_takeoff_land airport_fk    FK CONSTRAINT     ?   ALTER TABLE ONLY public.aircraft_takeoff_land
    ADD CONSTRAINT airport_fk FOREIGN KEY (airport_id) REFERENCES public.airport(id);
 J   ALTER TABLE ONLY public.aircraft_takeoff_land DROP CONSTRAINT airport_fk;
       public          postgres    false    215    3203    220            ?           2606    16653    passenger_airport airport_fk    FK CONSTRAINT     ?   ALTER TABLE ONLY public.passenger_airport
    ADD CONSTRAINT airport_fk FOREIGN KEY (airport_id) REFERENCES public.airport(id);
 F   ALTER TABLE ONLY public.passenger_airport DROP CONSTRAINT airport_fk;
       public          postgres    false    3203    221    215            ?           2606    16583    airport city_fk    FK CONSTRAINT     w   ALTER TABLE ONLY public.airport
    ADD CONSTRAINT city_fk FOREIGN KEY (city_id) REFERENCES public.city(id) NOT VALID;
 9   ALTER TABLE ONLY public.airport DROP CONSTRAINT city_fk;
       public          postgres    false    3207    215    217            ?           2606    16596    passenger_city city_fk    FK CONSTRAINT     t   ALTER TABLE ONLY public.passenger_city
    ADD CONSTRAINT city_fk FOREIGN KEY (city_id) REFERENCES public.city(id);
 @   ALTER TABLE ONLY public.passenger_city DROP CONSTRAINT city_fk;
       public          postgres    false    218    217    3207            ?           2606    16591    passenger_city passenger_fk    FK CONSTRAINT     ?   ALTER TABLE ONLY public.passenger_city
    ADD CONSTRAINT passenger_fk FOREIGN KEY (passenger_id) REFERENCES public.passenger(id);
 E   ALTER TABLE ONLY public.passenger_city DROP CONSTRAINT passenger_fk;
       public          postgres    false    214    218    3201            ?           2606    16604    passenger_aircraft passenger_fk    FK CONSTRAINT     ?   ALTER TABLE ONLY public.passenger_aircraft
    ADD CONSTRAINT passenger_fk FOREIGN KEY (passenger_id) REFERENCES public.passenger(id);
 I   ALTER TABLE ONLY public.passenger_aircraft DROP CONSTRAINT passenger_fk;
       public          postgres    false    214    3201    219            ?           2606    16648    passenger_airport passenger_fk    FK CONSTRAINT     ?   ALTER TABLE ONLY public.passenger_airport
    ADD CONSTRAINT passenger_fk FOREIGN KEY (passenger_id) REFERENCES public.passenger(id);
 H   ALTER TABLE ONLY public.passenger_airport DROP CONSTRAINT passenger_fk;
       public          postgres    false    221    214    3201            !   ?   x?U?M?0??????f?3mY?ʵk7S1? ??[?)?????
??C?j{r??i??0??Z??I???|&^+????[??΃F???S?
c???? ???D?C???Z?
????۾?cǝ?3?%k??????	!se)?m???IH??.~??F&2??SBH_?_??!?3c?$oZU      %   F   x??? 1C?3.f ???똯X`7?[ ?`'?$'y??HL,?8(??)5ݦ?t?????$???          ?   x?}?AN?0???)8?q?8Y?-)*?&???X?"QK[Y)(??A?d՝????a<\?}c[>??Rd????B??~???XPů)"???lG?Cp?j@???????L>U!	??t??G??#?o???c?????)l??/)?0Ƚ;?ͬUa??IX??M?1?1;][?im??=???????h%&ll??l?????????v?k?o`???T?D???;;??XF??{??6???1T$?v?^Rз[!?z?v?      "   ?   x?E??N?0D???ȭ?*k'ns??BB??@??lC-???u???R????,?%/??>.?xt??4?1pAd?k? ???$Ŝ????'???堕?6g>?Q?͌<I<Onp;躾h?%?z?????e?b3~#n??$3??nVW?9|????%??5?????'a/?]+vemW
?8??????????>??0x??F??K??7??N           x?M??j?0E????`?FҮiC???vٍ
????I??;4???̕h?sµ?P???ă?yJח6M?~u?J??ٌ??Χ????
R|Y?K?k?R??&tͰ?1??A??C?|??S>?OK?@?[???aW??1O?7????^(??5??赀	?????`???Zl?9r8????C??B??T??QW??8&\?<΍x!?X???8??`???M>ݞ;r????uu?rEYc???7c?i???!????%+??UUUt??      $   I   x????0?j?0>1)????0????rH(?????7?x????mh?Բ?mG?>H(??2????BFd      &   S   x??? !ߤ???؋??q?#;0??He+?Ԟ?gp?H??Ŋ?????W?(UUL?G5m?-?????gC5B?} ~K??      #   /   x???  ????G{??:䱓??ն.'?O7????l?x??%?     