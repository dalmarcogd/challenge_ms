PGDMP     /    1        
        v            beta_db    10.3    10.4 �    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            �           1262    20831    beta_db    DATABASE     �   CREATE DATABASE beta_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Portuguese_Brazil.1252' LC_CTYPE = 'Portuguese_Brazil.1252';
    DROP DATABASE beta_db;
             postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            �           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    3                        3079    12924    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            �           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1            �            1259    20863 
   auth_group    TABLE     e   CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);
    DROP TABLE public.auth_group;
       public         postgres    false    3            �            1259    20861    auth_group_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.auth_group_id_seq;
       public       postgres    false    3    203            �           0    0    auth_group_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;
            public       postgres    false    202            �            1259    20873    auth_group_permissions    TABLE     �   CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);
 *   DROP TABLE public.auth_group_permissions;
       public         postgres    false    3            �            1259    20871    auth_group_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.auth_group_permissions_id_seq;
       public       postgres    false    3    205            �           0    0    auth_group_permissions_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;
            public       postgres    false    204            �            1259    20855    auth_permission    TABLE     �   CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);
 #   DROP TABLE public.auth_permission;
       public         postgres    false    3            �            1259    20853    auth_permission_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.auth_permission_id_seq;
       public       postgres    false    3    201            �           0    0    auth_permission_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;
            public       postgres    false    200            �            1259    20962    django_admin_log    TABLE     �  CREATE TABLE public.django_admin_log (
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
       public         postgres    false    3            �            1259    20960    django_admin_log_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.django_admin_log_id_seq;
       public       postgres    false    213    3            �           0    0    django_admin_log_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;
            public       postgres    false    212            �            1259    20845    django_content_type    TABLE     �   CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);
 '   DROP TABLE public.django_content_type;
       public         postgres    false    3            �            1259    20843    django_content_type_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.django_content_type_id_seq;
       public       postgres    false    3    199            �           0    0    django_content_type_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;
            public       postgres    false    198            �            1259    20834    django_migrations    TABLE     �   CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);
 %   DROP TABLE public.django_migrations;
       public         postgres    false    3            �            1259    20832    django_migrations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.django_migrations_id_seq;
       public       postgres    false    197    3            �           0    0    django_migrations_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;
            public       postgres    false    196            �            1259    21368    django_session    TABLE     �   CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);
 "   DROP TABLE public.django_session;
       public         postgres    false    3            �            1259    21141 "   oauth2_provider_accesstoken_id_seq    SEQUENCE     �   CREATE SEQUENCE public.oauth2_provider_accesstoken_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public.oauth2_provider_accesstoken_id_seq;
       public       postgres    false    3            �            1259    20999    oauth2_provider_accesstoken    TABLE     �  CREATE TABLE public.oauth2_provider_accesstoken (
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
       public         postgres    false    218    3            �            1259    21180 "   oauth2_provider_application_id_seq    SEQUENCE     �   CREATE SEQUENCE public.oauth2_provider_application_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public.oauth2_provider_application_id_seq;
       public       postgres    false    3            �            1259    20986    oauth2_provider_application    TABLE     I  CREATE TABLE public.oauth2_provider_application (
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
       public         postgres    false    219    3            �            1259    21246    oauth2_provider_grant_id_seq    SEQUENCE     �   CREATE SEQUENCE public.oauth2_provider_grant_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.oauth2_provider_grant_id_seq;
       public       postgres    false    3            �            1259    21010    oauth2_provider_grant    TABLE     �  CREATE TABLE public.oauth2_provider_grant (
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
       public         postgres    false    220    3            �            1259    21266 #   oauth2_provider_refreshtoken_id_seq    SEQUENCE     �   CREATE SEQUENCE public.oauth2_provider_refreshtoken_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public.oauth2_provider_refreshtoken_id_seq;
       public       postgres    false    3            �            1259    21021    oauth2_provider_refreshtoken    TABLE     �  CREATE TABLE public.oauth2_provider_refreshtoken (
    id bigint DEFAULT nextval('public.oauth2_provider_refreshtoken_id_seq'::regclass) NOT NULL,
    token character varying(255) NOT NULL,
    access_token_id bigint NOT NULL,
    application_id bigint NOT NULL,
    user_id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL
);
 0   DROP TABLE public.oauth2_provider_refreshtoken;
       public         postgres    false    221    3            �            1259    20904    user    TABLE     �  CREATE TABLE public."user" (
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
       public         postgres    false    3            �            1259    20917    user_groups    TABLE        CREATE TABLE public.user_groups (
    id integer NOT NULL,
    usermodel_id integer NOT NULL,
    group_id integer NOT NULL
);
    DROP TABLE public.user_groups;
       public         postgres    false    3            �            1259    20915    user_groups_id_seq    SEQUENCE     �   CREATE SEQUENCE public.user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.user_groups_id_seq;
       public       postgres    false    209    3            �           0    0    user_groups_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.user_groups_id_seq OWNED BY public.user_groups.id;
            public       postgres    false    208            �            1259    20902    user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.user_id_seq;
       public       postgres    false    207    3            �           0    0    user_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.user_id_seq OWNED BY public."user".id;
            public       postgres    false    206            �            1259    20925    user_user_permissions    TABLE     �   CREATE TABLE public.user_user_permissions (
    id integer NOT NULL,
    usermodel_id integer NOT NULL,
    permission_id integer NOT NULL
);
 )   DROP TABLE public.user_user_permissions;
       public         postgres    false    3            �            1259    20923    user_user_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.user_user_permissions_id_seq;
       public       postgres    false    3    211            �           0    0    user_user_permissions_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.user_user_permissions_id_seq OWNED BY public.user_user_permissions.id;
            public       postgres    false    210            �
           2604    20866    auth_group id    DEFAULT     n   ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);
 <   ALTER TABLE public.auth_group ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    202    203    203            �
           2604    20876    auth_group_permissions id    DEFAULT     �   ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);
 H   ALTER TABLE public.auth_group_permissions ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    205    204    205            �
           2604    20858    auth_permission id    DEFAULT     x   ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);
 A   ALTER TABLE public.auth_permission ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    201    200    201            �
           2604    20965    django_admin_log id    DEFAULT     z   ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);
 B   ALTER TABLE public.django_admin_log ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    212    213    213            �
           2604    20848    django_content_type id    DEFAULT     �   ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);
 E   ALTER TABLE public.django_content_type ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    198    199    199            �
           2604    20837    django_migrations id    DEFAULT     |   ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);
 C   ALTER TABLE public.django_migrations ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    197    196    197            �
           2604    20907    user id    DEFAULT     d   ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);
 8   ALTER TABLE public."user" ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    206    207    207            �
           2604    20920    user_groups id    DEFAULT     p   ALTER TABLE ONLY public.user_groups ALTER COLUMN id SET DEFAULT nextval('public.user_groups_id_seq'::regclass);
 =   ALTER TABLE public.user_groups ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    208    209    209            �
           2604    20928    user_user_permissions id    DEFAULT     �   ALTER TABLE ONLY public.user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.user_user_permissions_id_seq'::regclass);
 G   ALTER TABLE public.user_user_permissions ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    210    211    211            �          0    20863 
   auth_group 
   TABLE DATA               .   COPY public.auth_group (id, name) FROM stdin;
    public       postgres    false    203   z�       �          0    20873    auth_group_permissions 
   TABLE DATA               M   COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
    public       postgres    false    205   ��       �          0    20855    auth_permission 
   TABLE DATA               N   COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
    public       postgres    false    201   ��       �          0    20962    django_admin_log 
   TABLE DATA               �   COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
    public       postgres    false    213   ;�       �          0    20845    django_content_type 
   TABLE DATA               C   COPY public.django_content_type (id, app_label, model) FROM stdin;
    public       postgres    false    199   ��       �          0    20834    django_migrations 
   TABLE DATA               C   COPY public.django_migrations (id, app, name, applied) FROM stdin;
    public       postgres    false    197   x�       �          0    21368    django_session 
   TABLE DATA               P   COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
    public       postgres    false    222   C�       �          0    20999    oauth2_provider_accesstoken 
   TABLE DATA               {   COPY public.oauth2_provider_accesstoken (id, token, expires, scope, application_id, user_id, created, updated) FROM stdin;
    public       postgres    false    215   ��       �          0    20986    oauth2_provider_application 
   TABLE DATA               �   COPY public.oauth2_provider_application (id, client_id, redirect_uris, client_type, authorization_grant_type, client_secret, name, user_id, skip_authorization, created, updated) FROM stdin;
    public       postgres    false    214   ��       �          0    21010    oauth2_provider_grant 
   TABLE DATA               �   COPY public.oauth2_provider_grant (id, code, expires, redirect_uri, scope, application_id, user_id, created, updated) FROM stdin;
    public       postgres    false    216   4�       �          0    21021    oauth2_provider_refreshtoken 
   TABLE DATA               }   COPY public.oauth2_provider_refreshtoken (id, token, access_token_id, application_id, user_id, created, updated) FROM stdin;
    public       postgres    false    217   Q�       �          0    20904    user 
   TABLE DATA               �   COPY public."user" (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
    public       postgres    false    207    �       �          0    20917    user_groups 
   TABLE DATA               A   COPY public.user_groups (id, usermodel_id, group_id) FROM stdin;
    public       postgres    false    209   ��       �          0    20925    user_user_permissions 
   TABLE DATA               P   COPY public.user_user_permissions (id, usermodel_id, permission_id) FROM stdin;
    public       postgres    false    211   �       �           0    0    auth_group_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);
            public       postgres    false    202            �           0    0    auth_group_permissions_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);
            public       postgres    false    204            �           0    0    auth_permission_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.auth_permission_id_seq', 33, true);
            public       postgres    false    200            �           0    0    django_admin_log_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.django_admin_log_id_seq', 3, true);
            public       postgres    false    212            �           0    0    django_content_type_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.django_content_type_id_seq', 11, true);
            public       postgres    false    198            �           0    0    django_migrations_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.django_migrations_id_seq', 20, true);
            public       postgres    false    196            �           0    0 "   oauth2_provider_accesstoken_id_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.oauth2_provider_accesstoken_id_seq', 27, true);
            public       postgres    false    218            �           0    0 "   oauth2_provider_application_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.oauth2_provider_application_id_seq', 2, true);
            public       postgres    false    219            �           0    0    oauth2_provider_grant_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.oauth2_provider_grant_id_seq', 1, false);
            public       postgres    false    220            �           0    0 #   oauth2_provider_refreshtoken_id_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public.oauth2_provider_refreshtoken_id_seq', 27, true);
            public       postgres    false    221            �           0    0    user_groups_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.user_groups_id_seq', 1, false);
            public       postgres    false    208            �           0    0    user_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('public.user_id_seq', 2, true);
            public       postgres    false    206            �           0    0    user_user_permissions_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.user_user_permissions_id_seq', 33, true);
            public       postgres    false    210            �
           2606    20870    auth_group auth_group_name_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);
 H   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_name_key;
       public         postgres    false    203            �
           2606    20899 R   auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);
 |   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq;
       public         postgres    false    205    205            �
           2606    20878 2   auth_group_permissions auth_group_permissions_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_pkey;
       public         postgres    false    205            �
           2606    20868    auth_group auth_group_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_pkey;
       public         postgres    false    203            �
           2606    20885 F   auth_permission auth_permission_content_type_id_codename_01ab375a_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);
 p   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq;
       public         postgres    false    201    201            �
           2606    20860 $   auth_permission auth_permission_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_pkey;
       public         postgres    false    201            �
           2606    20971 &   django_admin_log django_admin_log_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_pkey;
       public         postgres    false    213            �
           2606    20852 E   django_content_type django_content_type_app_label_model_76bd3d3b_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);
 o   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq;
       public         postgres    false    199    199            �
           2606    20850 ,   django_content_type django_content_type_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_pkey;
       public         postgres    false    199            �
           2606    20842 (   django_migrations django_migrations_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.django_migrations DROP CONSTRAINT django_migrations_pkey;
       public         postgres    false    197                       2606    21375 "   django_session django_session_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);
 L   ALTER TABLE ONLY public.django_session DROP CONSTRAINT django_session_pkey;
       public         postgres    false    222                       2606    21129 <   oauth2_provider_accesstoken oauth2_provider_accesstoken_pkey 
   CONSTRAINT     z   ALTER TABLE ONLY public.oauth2_provider_accesstoken
    ADD CONSTRAINT oauth2_provider_accesstoken_pkey PRIMARY KEY (id);
 f   ALTER TABLE ONLY public.oauth2_provider_accesstoken DROP CONSTRAINT oauth2_provider_accesstoken_pkey;
       public         postgres    false    215                       2606    21114 K   oauth2_provider_accesstoken oauth2_provider_accesstoken_token_8af090f8_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.oauth2_provider_accesstoken
    ADD CONSTRAINT oauth2_provider_accesstoken_token_8af090f8_uniq UNIQUE (token);
 u   ALTER TABLE ONLY public.oauth2_provider_accesstoken DROP CONSTRAINT oauth2_provider_accesstoken_token_8af090f8_uniq;
       public         postgres    false    215            �
           2606    20996 E   oauth2_provider_application oauth2_provider_application_client_id_key 
   CONSTRAINT     �   ALTER TABLE ONLY public.oauth2_provider_application
    ADD CONSTRAINT oauth2_provider_application_client_id_key UNIQUE (client_id);
 o   ALTER TABLE ONLY public.oauth2_provider_application DROP CONSTRAINT oauth2_provider_application_client_id_key;
       public         postgres    false    214                        2606    21167 <   oauth2_provider_application oauth2_provider_application_pkey 
   CONSTRAINT     z   ALTER TABLE ONLY public.oauth2_provider_application
    ADD CONSTRAINT oauth2_provider_application_pkey PRIMARY KEY (id);
 f   ALTER TABLE ONLY public.oauth2_provider_application DROP CONSTRAINT oauth2_provider_application_pkey;
       public         postgres    false    214                       2606    21117 >   oauth2_provider_grant oauth2_provider_grant_code_49ab4ddf_uniq 
   CONSTRAINT     y   ALTER TABLE ONLY public.oauth2_provider_grant
    ADD CONSTRAINT oauth2_provider_grant_code_49ab4ddf_uniq UNIQUE (code);
 h   ALTER TABLE ONLY public.oauth2_provider_grant DROP CONSTRAINT oauth2_provider_grant_code_49ab4ddf_uniq;
       public         postgres    false    216                       2606    21234 0   oauth2_provider_grant oauth2_provider_grant_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.oauth2_provider_grant
    ADD CONSTRAINT oauth2_provider_grant_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.oauth2_provider_grant DROP CONSTRAINT oauth2_provider_grant_pkey;
       public         postgres    false    216                       2606    21145 M   oauth2_provider_refreshtoken oauth2_provider_refreshtoken_access_token_id_key 
   CONSTRAINT     �   ALTER TABLE ONLY public.oauth2_provider_refreshtoken
    ADD CONSTRAINT oauth2_provider_refreshtoken_access_token_id_key UNIQUE (access_token_id);
 w   ALTER TABLE ONLY public.oauth2_provider_refreshtoken DROP CONSTRAINT oauth2_provider_refreshtoken_access_token_id_key;
       public         postgres    false    217                       2606    21256 >   oauth2_provider_refreshtoken oauth2_provider_refreshtoken_pkey 
   CONSTRAINT     |   ALTER TABLE ONLY public.oauth2_provider_refreshtoken
    ADD CONSTRAINT oauth2_provider_refreshtoken_pkey PRIMARY KEY (id);
 h   ALTER TABLE ONLY public.oauth2_provider_refreshtoken DROP CONSTRAINT oauth2_provider_refreshtoken_pkey;
       public         postgres    false    217                       2606    21120 M   oauth2_provider_refreshtoken oauth2_provider_refreshtoken_token_d090daa4_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.oauth2_provider_refreshtoken
    ADD CONSTRAINT oauth2_provider_refreshtoken_token_d090daa4_uniq UNIQUE (token);
 w   ALTER TABLE ONLY public.oauth2_provider_refreshtoken DROP CONSTRAINT oauth2_provider_refreshtoken_token_d090daa4_uniq;
       public         postgres    false    217            �
           2606    20922    user_groups user_groups_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.user_groups
    ADD CONSTRAINT user_groups_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.user_groups DROP CONSTRAINT user_groups_pkey;
       public         postgres    false    209            �
           2606    20943 ;   user_groups user_groups_usermodel_id_group_id_b92f3245_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.user_groups
    ADD CONSTRAINT user_groups_usermodel_id_group_id_b92f3245_uniq UNIQUE (usermodel_id, group_id);
 e   ALTER TABLE ONLY public.user_groups DROP CONSTRAINT user_groups_usermodel_id_group_id_b92f3245_uniq;
       public         postgres    false    209    209            �
           2606    20912    user user_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public."user" DROP CONSTRAINT user_pkey;
       public         postgres    false    207            �
           2606    20930 0   user_user_permissions user_user_permissions_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.user_user_permissions
    ADD CONSTRAINT user_user_permissions_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.user_user_permissions DROP CONSTRAINT user_user_permissions_pkey;
       public         postgres    false    211            �
           2606    20957 T   user_user_permissions user_user_permissions_usermodel_id_permission_id_a6d6add3_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.user_user_permissions
    ADD CONSTRAINT user_user_permissions_usermodel_id_permission_id_a6d6add3_uniq UNIQUE (usermodel_id, permission_id);
 ~   ALTER TABLE ONLY public.user_user_permissions DROP CONSTRAINT user_user_permissions_usermodel_id_permission_id_a6d6add3_uniq;
       public         postgres    false    211    211            �
           2606    20914    user user_username_key 
   CONSTRAINT     W   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_username_key UNIQUE (username);
 B   ALTER TABLE ONLY public."user" DROP CONSTRAINT user_username_key;
       public         postgres    false    207            �
           1259    20887    auth_group_name_a6ea08ec_like    INDEX     h   CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);
 1   DROP INDEX public.auth_group_name_a6ea08ec_like;
       public         postgres    false    203            �
           1259    20900 (   auth_group_permissions_group_id_b120cbf9    INDEX     o   CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);
 <   DROP INDEX public.auth_group_permissions_group_id_b120cbf9;
       public         postgres    false    205            �
           1259    20901 -   auth_group_permissions_permission_id_84c5c92e    INDEX     y   CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);
 A   DROP INDEX public.auth_group_permissions_permission_id_84c5c92e;
       public         postgres    false    205            �
           1259    20886 (   auth_permission_content_type_id_2f476e4b    INDEX     o   CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);
 <   DROP INDEX public.auth_permission_content_type_id_2f476e4b;
       public         postgres    false    201            �
           1259    20982 )   django_admin_log_content_type_id_c4bce8eb    INDEX     q   CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);
 =   DROP INDEX public.django_admin_log_content_type_id_c4bce8eb;
       public         postgres    false    213            �
           1259    20983 !   django_admin_log_user_id_c564eba6    INDEX     a   CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);
 5   DROP INDEX public.django_admin_log_user_id_c564eba6;
       public         postgres    false    213                       1259    21377 #   django_session_expire_date_a5c62663    INDEX     e   CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);
 7   DROP INDEX public.django_session_expire_date_a5c62663;
       public         postgres    false    222                       1259    21376 (   django_session_session_key_c0390e0f_like    INDEX     ~   CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);
 <   DROP INDEX public.django_session_session_key_c0390e0f_like;
       public         postgres    false    222                       1259    21183 3   oauth2_provider_accesstoken_application_id_b22886e1    INDEX     �   CREATE INDEX oauth2_provider_accesstoken_application_id_b22886e1 ON public.oauth2_provider_accesstoken USING btree (application_id);
 G   DROP INDEX public.oauth2_provider_accesstoken_application_id_b22886e1;
       public         postgres    false    215                       1259    21115 /   oauth2_provider_accesstoken_token_8af090f8_like    INDEX     �   CREATE INDEX oauth2_provider_accesstoken_token_8af090f8_like ON public.oauth2_provider_accesstoken USING btree (token varchar_pattern_ops);
 C   DROP INDEX public.oauth2_provider_accesstoken_token_8af090f8_like;
       public         postgres    false    215                       1259    21051 ,   oauth2_provider_accesstoken_user_id_6e4c9a65    INDEX     w   CREATE INDEX oauth2_provider_accesstoken_user_id_6e4c9a65 ON public.oauth2_provider_accesstoken USING btree (user_id);
 @   DROP INDEX public.oauth2_provider_accesstoken_user_id_6e4c9a65;
       public         postgres    false    215            �
           1259    21034 3   oauth2_provider_application_client_id_03f0cc84_like    INDEX     �   CREATE INDEX oauth2_provider_application_client_id_03f0cc84_like ON public.oauth2_provider_application USING btree (client_id varchar_pattern_ops);
 G   DROP INDEX public.oauth2_provider_application_client_id_03f0cc84_like;
       public         postgres    false    214            �
           1259    21035 2   oauth2_provider_application_client_secret_53133678    INDEX     �   CREATE INDEX oauth2_provider_application_client_secret_53133678 ON public.oauth2_provider_application USING btree (client_secret);
 F   DROP INDEX public.oauth2_provider_application_client_secret_53133678;
       public         postgres    false    214            �
           1259    21036 7   oauth2_provider_application_client_secret_53133678_like    INDEX     �   CREATE INDEX oauth2_provider_application_client_secret_53133678_like ON public.oauth2_provider_application USING btree (client_secret varchar_pattern_ops);
 K   DROP INDEX public.oauth2_provider_application_client_secret_53133678_like;
       public         postgres    false    214                       1259    21037 ,   oauth2_provider_application_user_id_79829054    INDEX     w   CREATE INDEX oauth2_provider_application_user_id_79829054 ON public.oauth2_provider_application USING btree (user_id);
 @   DROP INDEX public.oauth2_provider_application_user_id_79829054;
       public         postgres    false    214            	           1259    21195 -   oauth2_provider_grant_application_id_81923564    INDEX     y   CREATE INDEX oauth2_provider_grant_application_id_81923564 ON public.oauth2_provider_grant USING btree (application_id);
 A   DROP INDEX public.oauth2_provider_grant_application_id_81923564;
       public         postgres    false    216            
           1259    21118 (   oauth2_provider_grant_code_49ab4ddf_like    INDEX     ~   CREATE INDEX oauth2_provider_grant_code_49ab4ddf_like ON public.oauth2_provider_grant USING btree (code varchar_pattern_ops);
 <   DROP INDEX public.oauth2_provider_grant_code_49ab4ddf_like;
       public         postgres    false    216                       1259    21065 &   oauth2_provider_grant_user_id_e8f62af8    INDEX     k   CREATE INDEX oauth2_provider_grant_user_id_e8f62af8 ON public.oauth2_provider_grant USING btree (user_id);
 :   DROP INDEX public.oauth2_provider_grant_user_id_e8f62af8;
       public         postgres    false    216                       1259    21207 4   oauth2_provider_refreshtoken_application_id_2d1c311b    INDEX     �   CREATE INDEX oauth2_provider_refreshtoken_application_id_2d1c311b ON public.oauth2_provider_refreshtoken USING btree (application_id);
 H   DROP INDEX public.oauth2_provider_refreshtoken_application_id_2d1c311b;
       public         postgres    false    217                       1259    21121 0   oauth2_provider_refreshtoken_token_d090daa4_like    INDEX     �   CREATE INDEX oauth2_provider_refreshtoken_token_d090daa4_like ON public.oauth2_provider_refreshtoken USING btree (token varchar_pattern_ops);
 D   DROP INDEX public.oauth2_provider_refreshtoken_token_d090daa4_like;
       public         postgres    false    217                       1259    21084 -   oauth2_provider_refreshtoken_user_id_da837fce    INDEX     y   CREATE INDEX oauth2_provider_refreshtoken_user_id_da837fce ON public.oauth2_provider_refreshtoken USING btree (user_id);
 A   DROP INDEX public.oauth2_provider_refreshtoken_user_id_da837fce;
       public         postgres    false    217            �
           1259    20945    user_groups_group_id_b76f8aba    INDEX     Y   CREATE INDEX user_groups_group_id_b76f8aba ON public.user_groups USING btree (group_id);
 1   DROP INDEX public.user_groups_group_id_b76f8aba;
       public         postgres    false    209            �
           1259    20944 !   user_groups_usermodel_id_edcb1e77    INDEX     a   CREATE INDEX user_groups_usermodel_id_edcb1e77 ON public.user_groups USING btree (usermodel_id);
 5   DROP INDEX public.user_groups_usermodel_id_edcb1e77;
       public         postgres    false    209            �
           1259    20959 ,   user_user_permissions_permission_id_9deb68a3    INDEX     w   CREATE INDEX user_user_permissions_permission_id_9deb68a3 ON public.user_user_permissions USING btree (permission_id);
 @   DROP INDEX public.user_user_permissions_permission_id_9deb68a3;
       public         postgres    false    211            �
           1259    20958 +   user_user_permissions_usermodel_id_261a7b99    INDEX     u   CREATE INDEX user_user_permissions_usermodel_id_261a7b99 ON public.user_user_permissions USING btree (usermodel_id);
 ?   DROP INDEX public.user_user_permissions_usermodel_id_261a7b99;
       public         postgres    false    211            �
           1259    20931    user_username_cf016618_like    INDEX     f   CREATE INDEX user_username_cf016618_like ON public."user" USING btree (username varchar_pattern_ops);
 /   DROP INDEX public.user_username_cf016618_like;
       public         postgres    false    207                       2606    20893 O   auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm;
       public       postgres    false    2777    201    205                       2606    20888 P   auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id;
       public       postgres    false    205    203    2782                       2606    20879 E   auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co;
       public       postgres    false    199    2772    201            $           2606    20972 G   django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co;
       public       postgres    false    213    2772    199            %           2606    20977 =   django_admin_log django_admin_log_user_id_c564eba6_fk_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_user_id FOREIGN KEY (user_id) REFERENCES public."user"(id) DEFERRABLE INITIALLY DEFERRED;
 g   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_user_id_c564eba6_fk_user_id;
       public       postgres    false    2790    213    207            (           2606    21217 R   oauth2_provider_accesstoken oauth2_provider_accesstoken_application_id_b22886e1_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.oauth2_provider_accesstoken
    ADD CONSTRAINT oauth2_provider_accesstoken_application_id_b22886e1_fk FOREIGN KEY (application_id) REFERENCES public.oauth2_provider_application(id) DEFERRABLE INITIALLY DEFERRED;
 |   ALTER TABLE ONLY public.oauth2_provider_accesstoken DROP CONSTRAINT oauth2_provider_accesstoken_application_id_b22886e1_fk;
       public       postgres    false    215    214    2816            '           2606    21160 S   oauth2_provider_accesstoken oauth2_provider_accesstoken_user_id_6e4c9a65_fk_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.oauth2_provider_accesstoken
    ADD CONSTRAINT oauth2_provider_accesstoken_user_id_6e4c9a65_fk_user_id FOREIGN KEY (user_id) REFERENCES public."user"(id) DEFERRABLE INITIALLY DEFERRED;
 }   ALTER TABLE ONLY public.oauth2_provider_accesstoken DROP CONSTRAINT oauth2_provider_accesstoken_user_id_6e4c9a65_fk_user_id;
       public       postgres    false    207    215    2790            &           2606    21108 S   oauth2_provider_application oauth2_provider_application_user_id_79829054_fk_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.oauth2_provider_application
    ADD CONSTRAINT oauth2_provider_application_user_id_79829054_fk_user_id FOREIGN KEY (user_id) REFERENCES public."user"(id) DEFERRABLE INITIALLY DEFERRED;
 }   ALTER TABLE ONLY public.oauth2_provider_application DROP CONSTRAINT oauth2_provider_application_user_id_79829054_fk_user_id;
       public       postgres    false    2790    207    214            )           2606    21222 F   oauth2_provider_grant oauth2_provider_grant_application_id_81923564_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.oauth2_provider_grant
    ADD CONSTRAINT oauth2_provider_grant_application_id_81923564_fk FOREIGN KEY (application_id) REFERENCES public.oauth2_provider_application(id) DEFERRABLE INITIALLY DEFERRED;
 p   ALTER TABLE ONLY public.oauth2_provider_grant DROP CONSTRAINT oauth2_provider_grant_application_id_81923564_fk;
       public       postgres    false    2816    216    214            *           2606    21249 G   oauth2_provider_grant oauth2_provider_grant_user_id_e8f62af8_fk_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.oauth2_provider_grant
    ADD CONSTRAINT oauth2_provider_grant_user_id_e8f62af8_fk_user_id FOREIGN KEY (user_id) REFERENCES public."user"(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.oauth2_provider_grant DROP CONSTRAINT oauth2_provider_grant_user_id_e8f62af8_fk_user_id;
       public       postgres    false    207    2790    216            +           2606    21155 U   oauth2_provider_refreshtoken oauth2_provider_refreshtoken_access_token_id_775e84e8_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.oauth2_provider_refreshtoken
    ADD CONSTRAINT oauth2_provider_refreshtoken_access_token_id_775e84e8_fk FOREIGN KEY (access_token_id) REFERENCES public.oauth2_provider_accesstoken(id) DEFERRABLE INITIALLY DEFERRED;
    ALTER TABLE ONLY public.oauth2_provider_refreshtoken DROP CONSTRAINT oauth2_provider_refreshtoken_access_token_id_775e84e8_fk;
       public       postgres    false    217    2820    215            ,           2606    21227 T   oauth2_provider_refreshtoken oauth2_provider_refreshtoken_application_id_2d1c311b_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.oauth2_provider_refreshtoken
    ADD CONSTRAINT oauth2_provider_refreshtoken_application_id_2d1c311b_fk FOREIGN KEY (application_id) REFERENCES public.oauth2_provider_application(id) DEFERRABLE INITIALLY DEFERRED;
 ~   ALTER TABLE ONLY public.oauth2_provider_refreshtoken DROP CONSTRAINT oauth2_provider_refreshtoken_application_id_2d1c311b_fk;
       public       postgres    false    214    2816    217            -           2606    21269 U   oauth2_provider_refreshtoken oauth2_provider_refreshtoken_user_id_da837fce_fk_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.oauth2_provider_refreshtoken
    ADD CONSTRAINT oauth2_provider_refreshtoken_user_id_da837fce_fk_user_id FOREIGN KEY (user_id) REFERENCES public."user"(id) DEFERRABLE INITIALLY DEFERRED;
    ALTER TABLE ONLY public.oauth2_provider_refreshtoken DROP CONSTRAINT oauth2_provider_refreshtoken_user_id_da837fce_fk_user_id;
       public       postgres    false    2790    207    217            !           2606    20937 :   user_groups user_groups_group_id_b76f8aba_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_groups
    ADD CONSTRAINT user_groups_group_id_b76f8aba_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 d   ALTER TABLE ONLY public.user_groups DROP CONSTRAINT user_groups_group_id_b76f8aba_fk_auth_group_id;
       public       postgres    false    2782    203    209                        2606    20932 8   user_groups user_groups_usermodel_id_edcb1e77_fk_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_groups
    ADD CONSTRAINT user_groups_usermodel_id_edcb1e77_fk_user_id FOREIGN KEY (usermodel_id) REFERENCES public."user"(id) DEFERRABLE INITIALLY DEFERRED;
 b   ALTER TABLE ONLY public.user_groups DROP CONSTRAINT user_groups_usermodel_id_edcb1e77_fk_user_id;
       public       postgres    false    209    207    2790            #           2606    20951 N   user_user_permissions user_user_permission_permission_id_9deb68a3_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_user_permissions
    ADD CONSTRAINT user_user_permission_permission_id_9deb68a3_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 x   ALTER TABLE ONLY public.user_user_permissions DROP CONSTRAINT user_user_permission_permission_id_9deb68a3_fk_auth_perm;
       public       postgres    false    2777    201    211            "           2606    20946 L   user_user_permissions user_user_permissions_usermodel_id_261a7b99_fk_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_user_permissions
    ADD CONSTRAINT user_user_permissions_usermodel_id_261a7b99_fk_user_id FOREIGN KEY (usermodel_id) REFERENCES public."user"(id) DEFERRABLE INITIALLY DEFERRED;
 v   ALTER TABLE ONLY public.user_user_permissions DROP CONSTRAINT user_user_permissions_usermodel_id_261a7b99_fk_user_id;
       public       postgres    false    211    207    2790            �      x������ � �      �      x������ � �      �   w  x�]�K��0D��)8�(��z�i��'�&1�v��8�����"�`����r�뵲.��2*����d���j��6 ^��F	樀-I7���S5XK�;� ��s�`��؁�W��6Հ��ȝ�m�eb⦝@I&̉��bz�*�7�Z�`�I�1\w��*���<v|CM��?H%�M�݄u�[0T֓n޶�}���A�m��,�>r�ı���RcYR�*�֩!��]�D	�E8oD��M8_���.����u�ȭ���5@Z9���� �H����ᆅ&Pa�uzn<�h�O���	,"���}��k�T�K��� ��'�|N��w�9��s�VO���`�N�o�'AL|�$�,�l�>i����Ѕ      �   �   x�}α
�0����)B�������վ��:�A(ڭ��q(
g�?�=����bЁ��,��} �R�e"�e��Rj�Ԯ�v#�`�ȳEVD쒰H~��|��Ŏ?�ؐ��$�8�N����U���3��k&/\      �   �   x�e��
�0��������t5�2mJ�~U�;9_>8|3�=��Lf����A&�j䄧�i�ǌg���ڜI����j�/�xq�:O�!�s�����4�b(�}G[�����B�m�;�Q���t�7ԣse�L$����e�����_I!_`      �   �  x���kn� �۫�1��Z*�H�n��*�W����^)X�d��p>f���X���?W�u�@?����Q����� x��M�W"�f����~QRnZ��gp��k���Dd��]o°����*(�1�����6��eG���|K��()a%*�=P��7Y?^RP�2EV
�䡔��q;A(Z��3a�[�q����>����!�Bd
���CM�Ąٱ����a*C=
���6.aC;�BXNn��͝te8�4ӀT�n:sa1M�� *�|1�{$�����.Z��z}��Z�� �a��74�)Y<�_Cs�)���ﾤ���l��*D�d(�a�����
�b��eKM1���)ܓ ���A���'�$$� �	R �a�nq�'fI� ��ô@��I�C�RAF��%#�8����L2!�,��|���/�n	      �   B  x��Kn�0 ���@"�`����A������n���I�(>}�,z���Ho4���w�#�Π�Yr��r���u�p�łl#Lt*YK&�&*AdKa��3������#Y4���m����;WT�霛�fyPY���o�&G{Xy������,��K�=7̻�RU�A�cٟ�"��4OA���qX�SW�A�Е*j��~r{r��9����g���S� ���V>�	"ȇa���a�rH�L�{2Q� ������h�!X���5�K`w���n&�-�;��%�6�z���������!^c�r�������0��,Ͽ      �   �  x���ٖ�H�����hNF�靸�����wqG�������:}���323"mOmN{��8���U6�cM����i���`P߱���%,L) ��W�΋����\� �}1�.ΥA}vA��,�kWàr�U<HvґA���%p�3&$����	�_�����z���q��.i�a}m�w&��Ky0U�`
�
g=�I/ΥC��"zk��~�u�ۅ��~h��8m�K L��I���Ō��L^���+�O�nE����nL�{��o`�L�*fR�4�W�o��1:]�آ3\�
��!P{��և{7Ra�eW��q�4��q��'����A�R���UJ���Ԑh���K�%��cXMf�}�^����Mb���$\����z��RC��r]�]�ye�N>����-�zҨ<3���D�I�~���P:�K��o��M�.5O�,���'V?,팧��b�$�1,�@�%�K��)��'6/ˋ5Ŏ����/��c�Q��Yan2�Ya��D3 �p8�ط#i9a薗���B��G$�m�dTjV�@�3�� ��VuY���Z�S2�V?�-��Zb�Y#&H����L.5��і-��fs���Z5�t-��:�Gw�f��x	����;��Q���K`h�zneZ�p~�}>6�����+'kD�m��5Jer��X.{}o�*
���c�I|�n��\������'��F�ž*�4@��#�e/��3/�;]�ഺ�vS>��@>�(!���l&� Ѵ+w�?�`�T����E���us���VX�§(�ɥ(���Z�Zl��|`3}=�f7oy�o�F��?���R�\j�F|z���f��ݺ�AS: ʍN|ӑw	i��J�S]|��3�� y���9wkl�jl�zc�q�����7�K %�M	L��7M��%e�(C��m*���yt��x�7�,[�F���i#�s�(,u���3�\j�ce�]���3Ͻ�ںUa�3v��iʈ�/J�wMg2�� �����{�c�������d�r#����e�J�:Ƀahw!����֫���j��ּ]�N��s�X�uT�=[�޲t&�����x��g��}��������bM�a'm��{��w^a��!�+�Wj�6�Qߚ����x��x�\�8���a�2z>�01�sËY�+#Uv�f�A$*�?���L��å�s��������IA	S�	ɋ6l�+�8�����a��䡍      �   �  x�}�ɮ�@ E��W��P �;A�6L2�L%���y�����=����Kzl�v��u�����^#ֻۄD��X �]�������U�&���aѪ��d�u�I_���6ND\�y�_Z����E�6\ʄ�n�)v��d�.o�
;����6�BT�9:�/9����Qݯ%�4,�,n�ɚ)���	�C��%��Nj��|��047����(�!�g���ӂ$mh�gJ1 9�d���$C�2���ѳHJ�b���@�E��O�>��ݍȣ�d�ruAR{5��(�y���9mjf;%y˜�+�C��Ҍ�`�Y�ZP�JX{�����g��!�=��Jh�]V�a#�+���X1���<���		W�����Ca�-�BQ��'�wJ}n)��w��e      �      x������ � �      �   �  x�}��ҪHF�UO�/p��ʝ����B�p��8=}��M+D��ƣu0��L���<��Byi�����Q7tk���0 �7���~a���v��h�P��B��)$�/:Y��y�OU���!�{����ٮ^߇`�p�r&[�����N�;�F����ܫ��^��Y/Z��/��p��X
Ě�/
�b�Hk8Kv=Y6�6�s�،Q4�M!;XU0�LU[�rP���;���4�UPu���t?��W�[
�E�0�
Ub�T|Q��{�3��W��E�ph�4w<�F��_�P�u�`�`�	A�M
5px��8���.ޫ,�r���&�0bFzZ��3�pA����P�u~�i�l����_f�8.e�_+{���hQP�!T����&���>���Aoi�3������ش��
�*D���&��E��E��yo֣{�S#�TC�z�n��-��\aS�&��c ��տ{yu����K��.y����� �6	�3�0*%k+�'���53�JE48���]7�#�[=,�nd��cV�F��x�BL�O�6�
}�-�W�������tIw�ճO �6	� MQ	����jR�0&�1}��=������srX]7��1& f�Z'�1�֒1��[���-����l�}�07�������O����G^]�|R�U��X�m�vzd�[�����7��=�+�p[��`�}EI[F�(��Wi������n�k����p�����-��1��������/
� 	�Ń�t��W4Ӝ1��a��*� ������rV_���|Q�%�RsN_a:����?��f�st��E��-�^CBa�K�V�O
	���"ND^�����"w����Oy���I�"p�pE#T4SҠ�`P�c�]g"�V�jȃ]�6/�C^M��]@�y�?�IM��'����h�ܲs���n`>�¾��Mi潾��=�)!��h|�BB�$���L��$إ���ϼ�b�S[��{}�`�HI�h|�B�@g+zY�y��:��v�ڇ��zz�H3��1���$PNeK��($L��ҙL����v��'�����Ҽ �L�;��f�5vb�B��ӐY�[�y�J_�}��gS�߼t�<i&^��"
ѤP[$_���2��cu���,
�<5��:�� ����RBTa���
Q��!��j      �   �   x����n�@���Sx�ր3#��&M��+��KӘ���!�5<��5��s���g�Y��tI��A.�Xn�ɳ>�_i��ݥ.�ߧ���l�mT�)4������F'/�j��2�<=�'K䒓	Bf�0���%�/�S���[a��`n�ϛzX5�0a�I\�� �g=�=� ��.�.~�m�]��-lc��U�[>p�$Q��;�q��1c�      �      x������ � �      �   ~   x���Aѳ;�H�osq�q��9�
��G�k�[��du��9���^��F�R�P �P� �(�
��B�`�(���s��dυ�y�x^8�7�����x~�x5�x%*^������&'!�     