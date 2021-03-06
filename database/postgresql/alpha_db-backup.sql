PGDMP         0        
        v            alpha_db    10.3    10.4 �    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            �           1262    20254    alpha_db    DATABASE     �   CREATE DATABASE alpha_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Portuguese_Brazil.1252' LC_CTYPE = 'Portuguese_Brazil.1252';
    DROP DATABASE alpha_db;
             postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            �           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    3                        3079    12924    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            �           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1            �            1259    20286 
   auth_group    TABLE     e   CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);
    DROP TABLE public.auth_group;
       public         postgres    false    3            �            1259    20284    auth_group_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.auth_group_id_seq;
       public       postgres    false    203    3            �           0    0    auth_group_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;
            public       postgres    false    202            �            1259    20296    auth_group_permissions    TABLE     �   CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);
 *   DROP TABLE public.auth_group_permissions;
       public         postgres    false    3            �            1259    20294    auth_group_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.auth_group_permissions_id_seq;
       public       postgres    false    3    205            �           0    0    auth_group_permissions_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;
            public       postgres    false    204            �            1259    20278    auth_permission    TABLE     �   CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);
 #   DROP TABLE public.auth_permission;
       public         postgres    false    3            �            1259    20276    auth_permission_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.auth_permission_id_seq;
       public       postgres    false    201    3            �           0    0    auth_permission_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;
            public       postgres    false    200            �            1259    20356    customer    TABLE     �   CREATE TABLE public.customer (
    id integer NOT NULL,
    cpf character varying(11) NOT NULL,
    name character varying(100) NOT NULL,
    address character varying(150) NOT NULL
);
    DROP TABLE public.customer;
       public         postgres    false    3            �            1259    20354    customer_id_seq    SEQUENCE     �   CREATE SEQUENCE public.customer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.customer_id_seq;
       public       postgres    false    3    213            �           0    0    customer_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.customer_id_seq OWNED BY public.customer.id;
            public       postgres    false    212            �            1259    20366    debt    TABLE     �   CREATE TABLE public.debt (
    id integer NOT NULL,
    value numeric(10,2) NOT NULL,
    date date NOT NULL,
    customer_id integer NOT NULL
);
    DROP TABLE public.debt;
       public         postgres    false    3            �            1259    20364    debt_id_seq    SEQUENCE     �   CREATE SEQUENCE public.debt_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.debt_id_seq;
       public       postgres    false    215    3            �           0    0    debt_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.debt_id_seq OWNED BY public.debt.id;
            public       postgres    false    214            �            1259    20413    django_admin_log    TABLE     �  CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);
 $   DROP TABLE public.django_admin_log;
       public         postgres    false    3            �            1259    20411    django_admin_log_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.django_admin_log_id_seq;
       public       postgres    false    3    217            �           0    0    django_admin_log_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;
            public       postgres    false    216            �            1259    20268    django_content_type    TABLE     �   CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);
 '   DROP TABLE public.django_content_type;
       public         postgres    false    3            �            1259    20266    django_content_type_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.django_content_type_id_seq;
       public       postgres    false    3    199            �           0    0    django_content_type_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;
            public       postgres    false    198            �            1259    20257    django_migrations    TABLE     �   CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);
 %   DROP TABLE public.django_migrations;
       public         postgres    false    3            �            1259    20255    django_migrations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.django_migrations_id_seq;
       public       postgres    false    197    3            �           0    0    django_migrations_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;
            public       postgres    false    196            �            1259    20819    django_session    TABLE     �   CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);
 "   DROP TABLE public.django_session;
       public         postgres    false    3            �            1259    20592 "   oauth2_provider_accesstoken_id_seq    SEQUENCE     �   CREATE SEQUENCE public.oauth2_provider_accesstoken_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public.oauth2_provider_accesstoken_id_seq;
       public       postgres    false    3            �            1259    20450    oauth2_provider_accesstoken    TABLE     �  CREATE TABLE public.oauth2_provider_accesstoken (
    id bigint DEFAULT nextval('public.oauth2_provider_accesstoken_id_seq'::regclass) NOT NULL,
    token character varying(255) NOT NULL,
    expires timestamp with time zone NOT NULL,
    scope text NOT NULL,
    application_id bigint,
    user_id integer,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL
);
 /   DROP TABLE public.oauth2_provider_accesstoken;
       public         postgres    false    222    3            �            1259    20631 "   oauth2_provider_application_id_seq    SEQUENCE     �   CREATE SEQUENCE public.oauth2_provider_application_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public.oauth2_provider_application_id_seq;
       public       postgres    false    3            �            1259    20437    oauth2_provider_application    TABLE     I  CREATE TABLE public.oauth2_provider_application (
    id bigint DEFAULT nextval('public.oauth2_provider_application_id_seq'::regclass) NOT NULL,
    client_id character varying(100) NOT NULL,
    redirect_uris text NOT NULL,
    client_type character varying(32) NOT NULL,
    authorization_grant_type character varying(32) NOT NULL,
    client_secret character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    user_id integer,
    skip_authorization boolean NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL
);
 /   DROP TABLE public.oauth2_provider_application;
       public         postgres    false    223    3            �            1259    20697    oauth2_provider_grant_id_seq    SEQUENCE     �   CREATE SEQUENCE public.oauth2_provider_grant_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.oauth2_provider_grant_id_seq;
       public       postgres    false    3            �            1259    20461    oauth2_provider_grant    TABLE     �  CREATE TABLE public.oauth2_provider_grant (
    id bigint DEFAULT nextval('public.oauth2_provider_grant_id_seq'::regclass) NOT NULL,
    code character varying(255) NOT NULL,
    expires timestamp with time zone NOT NULL,
    redirect_uri character varying(255) NOT NULL,
    scope text NOT NULL,
    application_id bigint NOT NULL,
    user_id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL
);
 )   DROP TABLE public.oauth2_provider_grant;
       public         postgres    false    224    3            �            1259    20717 #   oauth2_provider_refreshtoken_id_seq    SEQUENCE     �   CREATE SEQUENCE public.oauth2_provider_refreshtoken_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public.oauth2_provider_refreshtoken_id_seq;
       public       postgres    false    3            �            1259    20472    oauth2_provider_refreshtoken    TABLE     �  CREATE TABLE public.oauth2_provider_refreshtoken (
    id bigint DEFAULT nextval('public.oauth2_provider_refreshtoken_id_seq'::regclass) NOT NULL,
    token character varying(255) NOT NULL,
    access_token_id bigint NOT NULL,
    application_id bigint NOT NULL,
    user_id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL
);
 0   DROP TABLE public.oauth2_provider_refreshtoken;
       public         postgres    false    225    3            �            1259    20327    user    TABLE     �  CREATE TABLE public."user" (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);
    DROP TABLE public."user";
       public         postgres    false    3            �            1259    20340    user_groups    TABLE        CREATE TABLE public.user_groups (
    id integer NOT NULL,
    usermodel_id integer NOT NULL,
    group_id integer NOT NULL
);
    DROP TABLE public.user_groups;
       public         postgres    false    3            �            1259    20338    user_groups_id_seq    SEQUENCE     �   CREATE SEQUENCE public.user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.user_groups_id_seq;
       public       postgres    false    209    3            �           0    0    user_groups_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.user_groups_id_seq OWNED BY public.user_groups.id;
            public       postgres    false    208            �            1259    20325    user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.user_id_seq;
       public       postgres    false    3    207            �           0    0    user_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.user_id_seq OWNED BY public."user".id;
            public       postgres    false    206            �            1259    20348    user_user_permissions    TABLE     �   CREATE TABLE public.user_user_permissions (
    id integer NOT NULL,
    usermodel_id integer NOT NULL,
    permission_id integer NOT NULL
);
 )   DROP TABLE public.user_user_permissions;
       public         postgres    false    3            �            1259    20346    user_user_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.user_user_permissions_id_seq;
       public       postgres    false    211    3            �           0    0    user_user_permissions_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.user_user_permissions_id_seq OWNED BY public.user_user_permissions.id;
            public       postgres    false    210            �
           2604    20289    auth_group id    DEFAULT     n   ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);
 <   ALTER TABLE public.auth_group ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    202    203    203            �
           2604    20299    auth_group_permissions id    DEFAULT     �   ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);
 H   ALTER TABLE public.auth_group_permissions ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    205    204    205            �
           2604    20281    auth_permission id    DEFAULT     x   ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);
 A   ALTER TABLE public.auth_permission ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    200    201    201            �
           2604    20359    customer id    DEFAULT     j   ALTER TABLE ONLY public.customer ALTER COLUMN id SET DEFAULT nextval('public.customer_id_seq'::regclass);
 :   ALTER TABLE public.customer ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    213    212    213            �
           2604    20369    debt id    DEFAULT     b   ALTER TABLE ONLY public.debt ALTER COLUMN id SET DEFAULT nextval('public.debt_id_seq'::regclass);
 6   ALTER TABLE public.debt ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    215    214    215            �
           2604    20416    django_admin_log id    DEFAULT     z   ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);
 B   ALTER TABLE public.django_admin_log ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    217    216    217            �
           2604    20271    django_content_type id    DEFAULT     �   ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);
 E   ALTER TABLE public.django_content_type ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    199    198    199            �
           2604    20260    django_migrations id    DEFAULT     |   ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);
 C   ALTER TABLE public.django_migrations ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    196    197    197            �
           2604    20330    user id    DEFAULT     d   ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);
 8   ALTER TABLE public."user" ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    207    206    207            �
           2604    20343    user_groups id    DEFAULT     p   ALTER TABLE ONLY public.user_groups ALTER COLUMN id SET DEFAULT nextval('public.user_groups_id_seq'::regclass);
 =   ALTER TABLE public.user_groups ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    209    208    209            �
           2604    20351    user_user_permissions id    DEFAULT     �   ALTER TABLE ONLY public.user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.user_user_permissions_id_seq'::regclass);
 G   ALTER TABLE public.user_user_permissions ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    210    211    211            �          0    20286 
   auth_group 
   TABLE DATA               .   COPY public.auth_group (id, name) FROM stdin;
    public       postgres    false    203   ��       �          0    20296    auth_group_permissions 
   TABLE DATA               M   COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
    public       postgres    false    205   ��       �          0    20278    auth_permission 
   TABLE DATA               N   COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
    public       postgres    false    201   ��       �          0    20356    customer 
   TABLE DATA               :   COPY public.customer (id, cpf, name, address) FROM stdin;
    public       postgres    false    213   ��       �          0    20366    debt 
   TABLE DATA               <   COPY public.debt (id, value, date, customer_id) FROM stdin;
    public       postgres    false    215   ��       �          0    20413    django_admin_log 
   TABLE DATA               �   COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
    public       postgres    false    217   4�       �          0    20268    django_content_type 
   TABLE DATA               C   COPY public.django_content_type (id, app_label, model) FROM stdin;
    public       postgres    false    199   �       �          0    20257    django_migrations 
   TABLE DATA               C   COPY public.django_migrations (id, app, name, applied) FROM stdin;
    public       postgres    false    197   <�       �          0    20819    django_session 
   TABLE DATA               P   COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
    public       postgres    false    226   D�       �          0    20450    oauth2_provider_accesstoken 
   TABLE DATA               {   COPY public.oauth2_provider_accesstoken (id, token, expires, scope, application_id, user_id, created, updated) FROM stdin;
    public       postgres    false    219   :�       �          0    20437    oauth2_provider_application 
   TABLE DATA               �   COPY public.oauth2_provider_application (id, client_id, redirect_uris, client_type, authorization_grant_type, client_secret, name, user_id, skip_authorization, created, updated) FROM stdin;
    public       postgres    false    218   x�       �          0    20461    oauth2_provider_grant 
   TABLE DATA               �   COPY public.oauth2_provider_grant (id, code, expires, redirect_uri, scope, application_id, user_id, created, updated) FROM stdin;
    public       postgres    false    220   d�       �          0    20472    oauth2_provider_refreshtoken 
   TABLE DATA               }   COPY public.oauth2_provider_refreshtoken (id, token, access_token_id, application_id, user_id, created, updated) FROM stdin;
    public       postgres    false    221   ��       �          0    20327    user 
   TABLE DATA               �   COPY public."user" (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
    public       postgres    false    207   ��       �          0    20340    user_groups 
   TABLE DATA               A   COPY public.user_groups (id, usermodel_id, group_id) FROM stdin;
    public       postgres    false    209   ��       �          0    20348    user_user_permissions 
   TABLE DATA               P   COPY public.user_user_permissions (id, usermodel_id, permission_id) FROM stdin;
    public       postgres    false    211   ��       �           0    0    auth_group_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);
            public       postgres    false    202            �           0    0    auth_group_permissions_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);
            public       postgres    false    204            �           0    0    auth_permission_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.auth_permission_id_seq', 39, true);
            public       postgres    false    200            �           0    0    customer_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.customer_id_seq', 3, true);
            public       postgres    false    212            �           0    0    debt_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('public.debt_id_seq', 3, true);
            public       postgres    false    214            �           0    0    django_admin_log_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.django_admin_log_id_seq', 11, true);
            public       postgres    false    216            �           0    0    django_content_type_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.django_content_type_id_seq', 13, true);
            public       postgres    false    198            �           0    0    django_migrations_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.django_migrations_id_seq', 23, true);
            public       postgres    false    196            �           0    0 "   oauth2_provider_accesstoken_id_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.oauth2_provider_accesstoken_id_seq', 40, true);
            public       postgres    false    222            �           0    0 "   oauth2_provider_application_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.oauth2_provider_application_id_seq', 4, true);
            public       postgres    false    223            �           0    0    oauth2_provider_grant_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.oauth2_provider_grant_id_seq', 1, false);
            public       postgres    false    224            �           0    0 #   oauth2_provider_refreshtoken_id_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public.oauth2_provider_refreshtoken_id_seq', 38, true);
            public       postgres    false    225            �           0    0    user_groups_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.user_groups_id_seq', 1, false);
            public       postgres    false    208                        0    0    user_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.user_id_seq', 1, false);
            public       postgres    false    206                       0    0    user_user_permissions_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.user_user_permissions_id_seq', 1, false);
            public       postgres    false    210            �
           2606    20293    auth_group auth_group_name_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);
 H   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_name_key;
       public         postgres    false    203            �
           2606    20322 R   auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);
 |   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq;
       public         postgres    false    205    205            �
           2606    20301 2   auth_group_permissions auth_group_permissions_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_pkey;
       public         postgres    false    205            �
           2606    20291    auth_group auth_group_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_pkey;
       public         postgres    false    203            �
           2606    20308 F   auth_permission auth_permission_content_type_id_codename_01ab375a_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);
 p   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq;
       public         postgres    false    201    201            �
           2606    20283 $   auth_permission auth_permission_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_pkey;
       public         postgres    false    201                       2606    20363    customer customer_cpf_key 
   CONSTRAINT     S   ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_cpf_key UNIQUE (cpf);
 C   ALTER TABLE ONLY public.customer DROP CONSTRAINT customer_cpf_key;
       public         postgres    false    213            
           2606    20361    customer customer_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.customer DROP CONSTRAINT customer_pkey;
       public         postgres    false    213                       2606    20371    debt debt_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.debt
    ADD CONSTRAINT debt_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.debt DROP CONSTRAINT debt_pkey;
       public         postgres    false    215                       2606    20422 &   django_admin_log django_admin_log_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_pkey;
       public         postgres    false    217            �
           2606    20275 E   django_content_type django_content_type_app_label_model_76bd3d3b_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);
 o   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq;
       public         postgres    false    199    199            �
           2606    20273 ,   django_content_type django_content_type_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_pkey;
       public         postgres    false    199            �
           2606    20265 (   django_migrations django_migrations_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.django_migrations DROP CONSTRAINT django_migrations_pkey;
       public         postgres    false    197            4           2606    20826 "   django_session django_session_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);
 L   ALTER TABLE ONLY public.django_session DROP CONSTRAINT django_session_pkey;
       public         postgres    false    226                       2606    20580 <   oauth2_provider_accesstoken oauth2_provider_accesstoken_pkey 
   CONSTRAINT     z   ALTER TABLE ONLY public.oauth2_provider_accesstoken
    ADD CONSTRAINT oauth2_provider_accesstoken_pkey PRIMARY KEY (id);
 f   ALTER TABLE ONLY public.oauth2_provider_accesstoken DROP CONSTRAINT oauth2_provider_accesstoken_pkey;
       public         postgres    false    219                        2606    20565 K   oauth2_provider_accesstoken oauth2_provider_accesstoken_token_8af090f8_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.oauth2_provider_accesstoken
    ADD CONSTRAINT oauth2_provider_accesstoken_token_8af090f8_uniq UNIQUE (token);
 u   ALTER TABLE ONLY public.oauth2_provider_accesstoken DROP CONSTRAINT oauth2_provider_accesstoken_token_8af090f8_uniq;
       public         postgres    false    219                       2606    20447 E   oauth2_provider_application oauth2_provider_application_client_id_key 
   CONSTRAINT     �   ALTER TABLE ONLY public.oauth2_provider_application
    ADD CONSTRAINT oauth2_provider_application_client_id_key UNIQUE (client_id);
 o   ALTER TABLE ONLY public.oauth2_provider_application DROP CONSTRAINT oauth2_provider_application_client_id_key;
       public         postgres    false    218                       2606    20618 <   oauth2_provider_application oauth2_provider_application_pkey 
   CONSTRAINT     z   ALTER TABLE ONLY public.oauth2_provider_application
    ADD CONSTRAINT oauth2_provider_application_pkey PRIMARY KEY (id);
 f   ALTER TABLE ONLY public.oauth2_provider_application DROP CONSTRAINT oauth2_provider_application_pkey;
       public         postgres    false    218            %           2606    20568 >   oauth2_provider_grant oauth2_provider_grant_code_49ab4ddf_uniq 
   CONSTRAINT     y   ALTER TABLE ONLY public.oauth2_provider_grant
    ADD CONSTRAINT oauth2_provider_grant_code_49ab4ddf_uniq UNIQUE (code);
 h   ALTER TABLE ONLY public.oauth2_provider_grant DROP CONSTRAINT oauth2_provider_grant_code_49ab4ddf_uniq;
       public         postgres    false    220            '           2606    20685 0   oauth2_provider_grant oauth2_provider_grant_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.oauth2_provider_grant
    ADD CONSTRAINT oauth2_provider_grant_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.oauth2_provider_grant DROP CONSTRAINT oauth2_provider_grant_pkey;
       public         postgres    false    220            *           2606    20596 M   oauth2_provider_refreshtoken oauth2_provider_refreshtoken_access_token_id_key 
   CONSTRAINT     �   ALTER TABLE ONLY public.oauth2_provider_refreshtoken
    ADD CONSTRAINT oauth2_provider_refreshtoken_access_token_id_key UNIQUE (access_token_id);
 w   ALTER TABLE ONLY public.oauth2_provider_refreshtoken DROP CONSTRAINT oauth2_provider_refreshtoken_access_token_id_key;
       public         postgres    false    221            -           2606    20707 >   oauth2_provider_refreshtoken oauth2_provider_refreshtoken_pkey 
   CONSTRAINT     |   ALTER TABLE ONLY public.oauth2_provider_refreshtoken
    ADD CONSTRAINT oauth2_provider_refreshtoken_pkey PRIMARY KEY (id);
 h   ALTER TABLE ONLY public.oauth2_provider_refreshtoken DROP CONSTRAINT oauth2_provider_refreshtoken_pkey;
       public         postgres    false    221            0           2606    20571 M   oauth2_provider_refreshtoken oauth2_provider_refreshtoken_token_d090daa4_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.oauth2_provider_refreshtoken
    ADD CONSTRAINT oauth2_provider_refreshtoken_token_d090daa4_uniq UNIQUE (token);
 w   ALTER TABLE ONLY public.oauth2_provider_refreshtoken DROP CONSTRAINT oauth2_provider_refreshtoken_token_d090daa4_uniq;
       public         postgres    false    221            �
           2606    20345    user_groups user_groups_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.user_groups
    ADD CONSTRAINT user_groups_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.user_groups DROP CONSTRAINT user_groups_pkey;
       public         postgres    false    209            �
           2606    20386 ;   user_groups user_groups_usermodel_id_group_id_b92f3245_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.user_groups
    ADD CONSTRAINT user_groups_usermodel_id_group_id_b92f3245_uniq UNIQUE (usermodel_id, group_id);
 e   ALTER TABLE ONLY public.user_groups DROP CONSTRAINT user_groups_usermodel_id_group_id_b92f3245_uniq;
       public         postgres    false    209    209            �
           2606    20335    user user_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public."user" DROP CONSTRAINT user_pkey;
       public         postgres    false    207                       2606    20353 0   user_user_permissions user_user_permissions_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.user_user_permissions
    ADD CONSTRAINT user_user_permissions_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.user_user_permissions DROP CONSTRAINT user_user_permissions_pkey;
       public         postgres    false    211                       2606    20400 T   user_user_permissions user_user_permissions_usermodel_id_permission_id_a6d6add3_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.user_user_permissions
    ADD CONSTRAINT user_user_permissions_usermodel_id_permission_id_a6d6add3_uniq UNIQUE (usermodel_id, permission_id);
 ~   ALTER TABLE ONLY public.user_user_permissions DROP CONSTRAINT user_user_permissions_usermodel_id_permission_id_a6d6add3_uniq;
       public         postgres    false    211    211            �
           2606    20337    user user_username_key 
   CONSTRAINT     W   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_username_key UNIQUE (username);
 B   ALTER TABLE ONLY public."user" DROP CONSTRAINT user_username_key;
       public         postgres    false    207            �
           1259    20310    auth_group_name_a6ea08ec_like    INDEX     h   CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);
 1   DROP INDEX public.auth_group_name_a6ea08ec_like;
       public         postgres    false    203            �
           1259    20323 (   auth_group_permissions_group_id_b120cbf9    INDEX     o   CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);
 <   DROP INDEX public.auth_group_permissions_group_id_b120cbf9;
       public         postgres    false    205            �
           1259    20324 -   auth_group_permissions_permission_id_84c5c92e    INDEX     y   CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);
 A   DROP INDEX public.auth_group_permissions_permission_id_84c5c92e;
       public         postgres    false    205            �
           1259    20309 (   auth_permission_content_type_id_2f476e4b    INDEX     o   CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);
 <   DROP INDEX public.auth_permission_content_type_id_2f476e4b;
       public         postgres    false    201                       1259    21384    cpf_idx    INDEX     ;   CREATE INDEX cpf_idx ON public.customer USING btree (cpf);
    DROP INDEX public.cpf_idx;
       public         postgres    false    213                       1259    20403    customer_cpf_d7d86dc7_like    INDEX     b   CREATE INDEX customer_cpf_d7d86dc7_like ON public.customer USING btree (cpf varchar_pattern_ops);
 .   DROP INDEX public.customer_cpf_d7d86dc7_like;
       public         postgres    false    213                       1259    21385    customer_idx    INDEX     D   CREATE INDEX customer_idx ON public.debt USING btree (customer_id);
     DROP INDEX public.customer_idx;
       public         postgres    false    215                       1259    20410    debt_customer_id_456bb2f4    INDEX     Q   CREATE INDEX debt_customer_id_456bb2f4 ON public.debt USING btree (customer_id);
 -   DROP INDEX public.debt_customer_id_456bb2f4;
       public         postgres    false    215                       1259    20433 )   django_admin_log_content_type_id_c4bce8eb    INDEX     q   CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);
 =   DROP INDEX public.django_admin_log_content_type_id_c4bce8eb;
       public         postgres    false    217                       1259    20434 !   django_admin_log_user_id_c564eba6    INDEX     a   CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);
 5   DROP INDEX public.django_admin_log_user_id_c564eba6;
       public         postgres    false    217            2           1259    20828 #   django_session_expire_date_a5c62663    INDEX     e   CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);
 7   DROP INDEX public.django_session_expire_date_a5c62663;
       public         postgres    false    226            5           1259    20827 (   django_session_session_key_c0390e0f_like    INDEX     ~   CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);
 <   DROP INDEX public.django_session_session_key_c0390e0f_like;
       public         postgres    false    226                       1259    20646 3   oauth2_provider_accesstoken_application_id_b22886e1    INDEX     �   CREATE INDEX oauth2_provider_accesstoken_application_id_b22886e1 ON public.oauth2_provider_accesstoken USING btree (application_id);
 G   DROP INDEX public.oauth2_provider_accesstoken_application_id_b22886e1;
       public         postgres    false    219                       1259    20566 /   oauth2_provider_accesstoken_token_8af090f8_like    INDEX     �   CREATE INDEX oauth2_provider_accesstoken_token_8af090f8_like ON public.oauth2_provider_accesstoken USING btree (token varchar_pattern_ops);
 C   DROP INDEX public.oauth2_provider_accesstoken_token_8af090f8_like;
       public         postgres    false    219            !           1259    20502 ,   oauth2_provider_accesstoken_user_id_6e4c9a65    INDEX     w   CREATE INDEX oauth2_provider_accesstoken_user_id_6e4c9a65 ON public.oauth2_provider_accesstoken USING btree (user_id);
 @   DROP INDEX public.oauth2_provider_accesstoken_user_id_6e4c9a65;
       public         postgres    false    219                       1259    20485 3   oauth2_provider_application_client_id_03f0cc84_like    INDEX     �   CREATE INDEX oauth2_provider_application_client_id_03f0cc84_like ON public.oauth2_provider_application USING btree (client_id varchar_pattern_ops);
 G   DROP INDEX public.oauth2_provider_application_client_id_03f0cc84_like;
       public         postgres    false    218                       1259    20486 2   oauth2_provider_application_client_secret_53133678    INDEX     �   CREATE INDEX oauth2_provider_application_client_secret_53133678 ON public.oauth2_provider_application USING btree (client_secret);
 F   DROP INDEX public.oauth2_provider_application_client_secret_53133678;
       public         postgres    false    218                       1259    20487 7   oauth2_provider_application_client_secret_53133678_like    INDEX     �   CREATE INDEX oauth2_provider_application_client_secret_53133678_like ON public.oauth2_provider_application USING btree (client_secret varchar_pattern_ops);
 K   DROP INDEX public.oauth2_provider_application_client_secret_53133678_like;
       public         postgres    false    218                       1259    20488 ,   oauth2_provider_application_user_id_79829054    INDEX     w   CREATE INDEX oauth2_provider_application_user_id_79829054 ON public.oauth2_provider_application USING btree (user_id);
 @   DROP INDEX public.oauth2_provider_application_user_id_79829054;
       public         postgres    false    218            "           1259    20634 -   oauth2_provider_grant_application_id_81923564    INDEX     y   CREATE INDEX oauth2_provider_grant_application_id_81923564 ON public.oauth2_provider_grant USING btree (application_id);
 A   DROP INDEX public.oauth2_provider_grant_application_id_81923564;
       public         postgres    false    220            #           1259    20569 (   oauth2_provider_grant_code_49ab4ddf_like    INDEX     ~   CREATE INDEX oauth2_provider_grant_code_49ab4ddf_like ON public.oauth2_provider_grant USING btree (code varchar_pattern_ops);
 <   DROP INDEX public.oauth2_provider_grant_code_49ab4ddf_like;
       public         postgres    false    220            (           1259    20516 &   oauth2_provider_grant_user_id_e8f62af8    INDEX     k   CREATE INDEX oauth2_provider_grant_user_id_e8f62af8 ON public.oauth2_provider_grant USING btree (user_id);
 :   DROP INDEX public.oauth2_provider_grant_user_id_e8f62af8;
       public         postgres    false    220            +           1259    20658 4   oauth2_provider_refreshtoken_application_id_2d1c311b    INDEX     �   CREATE INDEX oauth2_provider_refreshtoken_application_id_2d1c311b ON public.oauth2_provider_refreshtoken USING btree (application_id);
 H   DROP INDEX public.oauth2_provider_refreshtoken_application_id_2d1c311b;
       public         postgres    false    221            .           1259    20572 0   oauth2_provider_refreshtoken_token_d090daa4_like    INDEX     �   CREATE INDEX oauth2_provider_refreshtoken_token_d090daa4_like ON public.oauth2_provider_refreshtoken USING btree (token varchar_pattern_ops);
 D   DROP INDEX public.oauth2_provider_refreshtoken_token_d090daa4_like;
       public         postgres    false    221            1           1259    20535 -   oauth2_provider_refreshtoken_user_id_da837fce    INDEX     y   CREATE INDEX oauth2_provider_refreshtoken_user_id_da837fce ON public.oauth2_provider_refreshtoken USING btree (user_id);
 A   DROP INDEX public.oauth2_provider_refreshtoken_user_id_da837fce;
       public         postgres    false    221            �
           1259    20388    user_groups_group_id_b76f8aba    INDEX     Y   CREATE INDEX user_groups_group_id_b76f8aba ON public.user_groups USING btree (group_id);
 1   DROP INDEX public.user_groups_group_id_b76f8aba;
       public         postgres    false    209            �
           1259    20387 !   user_groups_usermodel_id_edcb1e77    INDEX     a   CREATE INDEX user_groups_usermodel_id_edcb1e77 ON public.user_groups USING btree (usermodel_id);
 5   DROP INDEX public.user_groups_usermodel_id_edcb1e77;
       public         postgres    false    209            �
           1259    20402 ,   user_user_permissions_permission_id_9deb68a3    INDEX     w   CREATE INDEX user_user_permissions_permission_id_9deb68a3 ON public.user_user_permissions USING btree (permission_id);
 @   DROP INDEX public.user_user_permissions_permission_id_9deb68a3;
       public         postgres    false    211                       1259    20401 +   user_user_permissions_usermodel_id_261a7b99    INDEX     u   CREATE INDEX user_user_permissions_usermodel_id_261a7b99 ON public.user_user_permissions USING btree (usermodel_id);
 ?   DROP INDEX public.user_user_permissions_usermodel_id_261a7b99;
       public         postgres    false    211            �
           1259    20374    user_username_cf016618_like    INDEX     f   CREATE INDEX user_username_cf016618_like ON public."user" USING btree (username varchar_pattern_ops);
 /   DROP INDEX public.user_username_cf016618_like;
       public         postgres    false    207            �
           1259    21386    username_idx    INDEX     C   CREATE INDEX username_idx ON public."user" USING btree (username);
     DROP INDEX public.username_idx;
       public         postgres    false    207            8           2606    20316 O   auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm;
       public       postgres    false    201    2791    205            7           2606    20311 P   auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id;
       public       postgres    false    2796    203    205            6           2606    20302 E   auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co;
       public       postgres    false    2786    199    201            =           2606    20404 -   debt debt_customer_id_456bb2f4_fk_customer_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.debt
    ADD CONSTRAINT debt_customer_id_456bb2f4_fk_customer_id FOREIGN KEY (customer_id) REFERENCES public.customer(id) DEFERRABLE INITIALLY DEFERRED;
 W   ALTER TABLE ONLY public.debt DROP CONSTRAINT debt_customer_id_456bb2f4_fk_customer_id;
       public       postgres    false    213    215    2826            >           2606    20423 G   django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co;
       public       postgres    false    199    2786    217            ?           2606    20428 =   django_admin_log django_admin_log_user_id_c564eba6_fk_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_user_id FOREIGN KEY (user_id) REFERENCES public."user"(id) DEFERRABLE INITIALLY DEFERRED;
 g   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_user_id_c564eba6_fk_user_id;
       public       postgres    false    217    2804    207            B           2606    20673 R   oauth2_provider_accesstoken oauth2_provider_accesstoken_application_id_b22886e1_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.oauth2_provider_accesstoken
    ADD CONSTRAINT oauth2_provider_accesstoken_application_id_b22886e1_fk FOREIGN KEY (application_id) REFERENCES public.oauth2_provider_application(id) DEFERRABLE INITIALLY DEFERRED;
 |   ALTER TABLE ONLY public.oauth2_provider_accesstoken DROP CONSTRAINT oauth2_provider_accesstoken_application_id_b22886e1_fk;
       public       postgres    false    219    2841    218            A           2606    20611 S   oauth2_provider_accesstoken oauth2_provider_accesstoken_user_id_6e4c9a65_fk_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.oauth2_provider_accesstoken
    ADD CONSTRAINT oauth2_provider_accesstoken_user_id_6e4c9a65_fk_user_id FOREIGN KEY (user_id) REFERENCES public."user"(id) DEFERRABLE INITIALLY DEFERRED;
 }   ALTER TABLE ONLY public.oauth2_provider_accesstoken DROP CONSTRAINT oauth2_provider_accesstoken_user_id_6e4c9a65_fk_user_id;
       public       postgres    false    219    2804    207            @           2606    20559 S   oauth2_provider_application oauth2_provider_application_user_id_79829054_fk_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.oauth2_provider_application
    ADD CONSTRAINT oauth2_provider_application_user_id_79829054_fk_user_id FOREIGN KEY (user_id) REFERENCES public."user"(id) DEFERRABLE INITIALLY DEFERRED;
 }   ALTER TABLE ONLY public.oauth2_provider_application DROP CONSTRAINT oauth2_provider_application_user_id_79829054_fk_user_id;
       public       postgres    false    207    2804    218            C           2606    20668 F   oauth2_provider_grant oauth2_provider_grant_application_id_81923564_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.oauth2_provider_grant
    ADD CONSTRAINT oauth2_provider_grant_application_id_81923564_fk FOREIGN KEY (application_id) REFERENCES public.oauth2_provider_application(id) DEFERRABLE INITIALLY DEFERRED;
 p   ALTER TABLE ONLY public.oauth2_provider_grant DROP CONSTRAINT oauth2_provider_grant_application_id_81923564_fk;
       public       postgres    false    220    2841    218            D           2606    20700 G   oauth2_provider_grant oauth2_provider_grant_user_id_e8f62af8_fk_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.oauth2_provider_grant
    ADD CONSTRAINT oauth2_provider_grant_user_id_e8f62af8_fk_user_id FOREIGN KEY (user_id) REFERENCES public."user"(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.oauth2_provider_grant DROP CONSTRAINT oauth2_provider_grant_user_id_e8f62af8_fk_user_id;
       public       postgres    false    2804    207    220            E           2606    20606 U   oauth2_provider_refreshtoken oauth2_provider_refreshtoken_access_token_id_775e84e8_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.oauth2_provider_refreshtoken
    ADD CONSTRAINT oauth2_provider_refreshtoken_access_token_id_775e84e8_fk FOREIGN KEY (access_token_id) REFERENCES public.oauth2_provider_accesstoken(id) DEFERRABLE INITIALLY DEFERRED;
    ALTER TABLE ONLY public.oauth2_provider_refreshtoken DROP CONSTRAINT oauth2_provider_refreshtoken_access_token_id_775e84e8_fk;
       public       postgres    false    219    2845    221            F           2606    20678 T   oauth2_provider_refreshtoken oauth2_provider_refreshtoken_application_id_2d1c311b_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.oauth2_provider_refreshtoken
    ADD CONSTRAINT oauth2_provider_refreshtoken_application_id_2d1c311b_fk FOREIGN KEY (application_id) REFERENCES public.oauth2_provider_application(id) DEFERRABLE INITIALLY DEFERRED;
 ~   ALTER TABLE ONLY public.oauth2_provider_refreshtoken DROP CONSTRAINT oauth2_provider_refreshtoken_application_id_2d1c311b_fk;
       public       postgres    false    218    2841    221            G           2606    20720 U   oauth2_provider_refreshtoken oauth2_provider_refreshtoken_user_id_da837fce_fk_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.oauth2_provider_refreshtoken
    ADD CONSTRAINT oauth2_provider_refreshtoken_user_id_da837fce_fk_user_id FOREIGN KEY (user_id) REFERENCES public."user"(id) DEFERRABLE INITIALLY DEFERRED;
    ALTER TABLE ONLY public.oauth2_provider_refreshtoken DROP CONSTRAINT oauth2_provider_refreshtoken_user_id_da837fce_fk_user_id;
       public       postgres    false    221    207    2804            :           2606    20380 :   user_groups user_groups_group_id_b76f8aba_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_groups
    ADD CONSTRAINT user_groups_group_id_b76f8aba_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 d   ALTER TABLE ONLY public.user_groups DROP CONSTRAINT user_groups_group_id_b76f8aba_fk_auth_group_id;
       public       postgres    false    2796    209    203            9           2606    20375 8   user_groups user_groups_usermodel_id_edcb1e77_fk_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_groups
    ADD CONSTRAINT user_groups_usermodel_id_edcb1e77_fk_user_id FOREIGN KEY (usermodel_id) REFERENCES public."user"(id) DEFERRABLE INITIALLY DEFERRED;
 b   ALTER TABLE ONLY public.user_groups DROP CONSTRAINT user_groups_usermodel_id_edcb1e77_fk_user_id;
       public       postgres    false    209    2804    207            <           2606    20394 N   user_user_permissions user_user_permission_permission_id_9deb68a3_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_user_permissions
    ADD CONSTRAINT user_user_permission_permission_id_9deb68a3_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 x   ALTER TABLE ONLY public.user_user_permissions DROP CONSTRAINT user_user_permission_permission_id_9deb68a3_fk_auth_perm;
       public       postgres    false    2791    211    201            ;           2606    20389 L   user_user_permissions user_user_permissions_usermodel_id_261a7b99_fk_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_user_permissions
    ADD CONSTRAINT user_user_permissions_usermodel_id_261a7b99_fk_user_id FOREIGN KEY (usermodel_id) REFERENCES public."user"(id) DEFERRABLE INITIALLY DEFERRED;
 v   ALTER TABLE ONLY public.user_user_permissions DROP CONSTRAINT user_user_permissions_usermodel_id_261a7b99_fk_user_id;
       public       postgres    false    2804    207    211            �      x������ � �      �      x������ � �      �   �  x�e�Mn�0���)8A�u�Q���&Q@�Y��5�؞Gv��Y�����\�TܗK�gk^B	w�vg��G��0_4P!�`��IߵE0D��t��q۶�2��[s ��Čm�Xr3�K��Y�����?˞;�k���M� I �)	�e��'��jQ{E{"��LV�K.?���*5�t� �/A'�j^ 3�NXý#e�ڤ��~�s�W�D��k�%5�=�#N ?���v�ӳ�B�D�'�p,�yE��M8_�Qf+z5�,�
g-�O���- i�<�$�ѿFoW*t�*ʨNˍG��x���7�����x,��/f�l>��'��i�#\�p�9��>�*xn�D2�=!��T�������m|�Axd:���k��F�x	�����U�R^|�����oO��$�a0�C��D��>�����0`      �   @   x�3�40�46166��4�t/���H-�MUpI��M,J��*MTp�H,HM��2BRlNHq� ��      �   '   x�3�4400�30�420��50"N#.cl��\1z\\\ �A      �   ;  x��һn�0�9y�(S��ŷx-k�NU@LK�DҡB�{�Z� %����'��ǈ �L�����ZHE�pa�X���N0,��t��>O]�?f��0�>�9iX$P@�s�wW�<�+)�41�ũ�/�盷HWk_�UXN�e{���{���I�g�r̎A�-��f_U]~��S��")~Y'8�pT� ��(�b�d�?b8��=D�)8#|7b�;D�he;d��=�
{c��e	f�	
�6�ƧL|Qϯ<d6D��
�l�=�-�o(($��4�����S���D�u�<R�n�vյ���������      �   �   x�e�[
� E�gSj��K!X�F�Q5���$m)�7s�=pH=Z.�3�؁,�@$mJ6x<l���D<�
>�j�#��O�h5���3�����a��d��*�zi�R���E�X���&gz2%�ib_Gq2$+J�=M���x"F�u	��|h�RU���8�M������?w4      �   �  x���Y��0 �or��@��ry!gɲ&V�mDӷۤ�����g�bc�{?,����
 жC����м�~�Fx|�V(A�W�DO�d��Ǜ��6}���}��B	J��ܺ|/����{Y�->�ɇ���v�wm�k��Hi6��;%��:Ǉ�]�*�URԮ�y;��/u߈�	�Htn^l7^ۘ�ڽ(L#�EB̎�؍?k�v�>�T��$�sivC�7rs]{q�f�.�C���<��/�e cIC�9S,�A�4_�R�T����Ŗ"R#o1�uӇ�n��ǯQ�����^�v8��u샀���J�-	�_G&&6�ږ�r;)(�1Հ��[{��xD�hU�&�N���^�Zh6��<� ���P�MWDj�V>Sb���$-**3�D(;Mɑ��A"��3,8&�e��G�!��7��ކ��8D��o@�#�R�oI���I�%�(mu��8�'���tP3%�,������8I��u��W}:��a6��      �   �  x����n�0�5<E_���'q�.F墠�U q4� �.�`?� �f^��s�s�Սn�>je^�*��;_��6���\q+�3Q�Ie�4�D2me�ob��p���%��J�b|���� ����b%A#`���+"þ(�6<�>���J��/K���&8]|��ܭ��C/��,��%���tj>���n��ta?gK�'��LAܲ�ʾ���\�ͷ�t�|6�-n�&�)�f���D[����8�)ձ�|v�S]?���/�N��Vh�N��JKE_m1�����,�����ٛ2\��fP�%��s#����k�h/��ob,�P�lB�*1w�frϗ��%�{���a�~��S��v��]m�m���곳�>;��c����ӑ {�i�v��Vk�2��
�c�	��vT��=��f�!�#���o�u�N��z�ll�K��;�|3������#(��� �<�~����P�¼      �   .  x����v�����)��Q}�6�^��7
�+�
��?xV�n'#w�f���6PK�a�|�9{l�`-nG��#��5k@��@�P���AE�� X��y�ƛk�A��������BU�ZDt�x��7Y�;x:�Stg3h{���+W�0 e0_�E�� �$��D��q�[S��!�-s��(�
��nl'NU��A��&Q�:��]��:�Z3����D�c�0��7�@I x�Bx�Ps�r=o�8��.�vK�-{�j*Tu�ڽ��/f���vt�ΰ��R��M�	�h%���I
��-�6O���BU皋��^4Zؗ�nJ6Iw����Q����N%��%H~��$�U]h��2��1u-�cU��"�.?���������PVҠf�׷D2�����AK(��R۶`�][$:���������v�{יaHT6$���@��P�!�6��e3�N`c�V=�pv�t����~*YVe/$( ��"�yO��C���Y�������v0O�Q.�'��'��`���}��:D�٥���;b[K���b�x��*�`hP��ϐ(E�x^����k���&�T�[�E��1o��ز����$ݕJD* �3����{
U��8��ڌ���rsA#rN����so�T"ZA� 4KUZ�H��:��U�y����;�!�'���z����g-c����a	B�f��D��P�!���g��@��8�mR�-]�x� ��I�lD��s���t������"�U�\KIxP#>%�h������,������*QVΐ���J)�BU�Bs��(
��"A0i�\��u����H%��(��忑�)Tu(��H��[,��V�5ߒ�X9A�4��6���	H�[�H��:Z3���n<L�;2�����m�Ƈ�}=�*��`dH/�k��P�Ԧ�it�j�;N��
v:���V�5�
��D槀sT������v�Z����ۉ]���5f�>[(��F�'��dV}�m<{���S��k]���h��R��wi�<����T��u�T����s^r�yO��#���v��ܼx��~4=�~��F8�vjW˦<� �����'{���:�Zc5�퇇�m{5;�}�z���t�y"�0-֊�H�Ӗ�i�e��h�w'l[��~����B�V 7��'+�yO��#���'b�q�����A+�W���غ�0�^HV>�~z8 �5�WUGل�>u�50^�c�3�`Q7�u�����h�D2�F���DTO��#�Y�G���}]-@L���^�� 8xg��"�+�"c���=D�a��:�2
���:3�ۣ��j��ex��`h�(͖^���C��S��j�MGv����!B���z�]�s{�6*y�UPXi�_���b��:F�;��&���ܭ����~�m_��j���K�%F�\�� �W��]�1�����������_&"��z������>��te<�^�`�?��QN�1����̓��1�	IΞp���9"�lA�`�u��D�<Y��ZN�1բc"�����C,ν��ݟ.�=^-��^!��l��AY2�����6��i����k�vx�{�cP[�fRO��>T��3=���h�5D�<����6�zw�#D�{�y>���d_��no`�T%Y(YGĠd͖<�\�Ω:Z�pJ�4pz�L:}�kႛo:�Y��g������C �-F9U�RK�3ؠ[�r����y}_��r5�f��V!���H ^:�~{$xE��:��K�;���N�H���G�{�/*|��d��p$�x��/nMQ�]��!E}      �   �  x�}�Ɏ�X�5�����x���w6�`&c3[���33~}eVu/:;���B��	]�VY=���CV�;��/[���Jw��+/��\9���Qf�YT�ރ.
?v�=�ZB˂t ��f<������U�2��ӰG<M�k�z!�O9ۈӡ:��,�c���9�Qe|0=8��(|ϬӭI��'琝-�!o^�+xz$=%#Ԋ9h1��Oo ��a1F��y��Ǽ�#����`C������)p�U3"�IrS&\訨Y��V˫J^.ח��aAS��?X����t!WG����jRM�|��#S��ש��6�H�t�t�"Y���f��9Q�*� �Z�\5�G-�ӬW*Z5��T�5�b���1-�6l����V���=A����2[������(��8	��� ��e#ye���ݭ����e�gw�̸:u?���o�/ιЗ�r̺�ű��SZ��Qk}��uf�1-���4���vԗ�S���Ԩ8����lkZ}eV��
<a�{H��Xq�8WsºW��(7��^����oC�Q��аo��r�ۏ��G�p1���8�ru�Vc9��)jń��~"��C7=M��Iy`����i�_z�+��q�Z^�Ȯ)�ybWJy9n)�(�i������>�T�v�?#H>��t��+"c�K	T��@0�D6w;�q��zi/�+Ӛ�P�j�����0 �" 	��F����C�|r��n6����O�      �      x������ � �      �   E  x�}��Ҳ<���U��TF�x�3�+�T�8ʋ�8r������TWq�{-����ؤ2Y�6�3K&�k�����'�@ `��?���_�5iPa
(�?��?f���qb߽a�D۵߳����U�F�P]y�#K���܋�A�y��Q(��>��w�f⮁�!�࿠h�@��Ң��[BKn6ٻ���Y��u��hI��a��*� �I��&��H��4,�ȴu��r��1>���>�F�n6�a�?�w�`VJ�Y� �P�d�^ŗKǛFGD����k��ί�P	 u���)	��h$>�!�L2�.�T܈uz�~��fm��.�L� ��6 zQ�[�N	�M����a��A4.�����C�� MBzFL˲��ތ:5�MRT;{�	u�)O��(��kw� �:� �dX9e�Oj(��w���{�>;���vD�m���V+�":ڀ�D\�5"��P>GU���t<�V������sxo/^� �a�L�0��h(��G+�i���9��Ւ��y �i$��1�`�|�:5��u;t�Z��^�X�C@ϥ5I�M��҉��^HJ�b}QC�Z��u9�l�ӟ!ɻ��b��~q��}��ND��H�t"��P>�ͳ������3|�x^<6��ax��٪e�]�76�D�k��5��r����Yx��eٟW$��*d�ji�o�q,5I������:��Okӗ��sG�{��^ρ#��:� ؔ�r�������m����i�8��W���[�AV����UI�a�[�.�E��8�e���r2:;nFe�EV�.��	����2��S&5��5���%�n>��v�v,z��LG��6���;Qw5��\��/j(�I�$���S����V��_]w�U��.��a˄
����P>�a�����5����Io��d�*����X�xU�B�[�Q����P>��p���س$O5;��;��+��j�u�'��	)�Ps����|r7Y=��)��Cp��MZΑ����2�u�We39G�����l}���s�M;΃r0},�vbۛ�o �O�
��-��&�_�P>}nc�p��^��e:l�r�di�����u����,S�9��P�L������Z�l���o'�it�ѥ]aLM�s���E��nW+G�)�&�SB/+�v�n͡�����N�{�B�$�f��Fs"E�w3�J���1�.��͊�S@tI�ֻ���F�/j(����d�V%��Ǜ$�v�}މ�2�Q	H=�j�E�#�Z��:b��'��0+tt?x�������'ttNm@�IWe���$(g��X5j(�y�������rF�ݫJ.��y��t���j�RC���5�ϟ����g�ަ�v��^�V�ku���wE�z����L��݋��P.��9��5��C�,V.w�x��z����w ��$ԩ�\Z���'T�����ʻ�}7��ڀ�s.�t<eU2�C���������ȫ�ct^�L���g9Gp����s�nF��@D5��E���p�{�F�W<n�lw׊z��r����z���w[�i��TM)D�m��5�L      �   �   x����j�@���S�୸��u�](D�^��PJ �n�ib݂�߸���9����<�#��ƐLB�y�rS�S,ߋz݆+{\|�����_?�Y����M�h*�&-�����U��0� �@ݡ҈Z�()"�1{�8��������s�k^u����B�5I+�Qx� ��av�c� ���ll{�b�����v�/}cn���?��x?�`fZ      �      x������ � �      �      x������ � �     