PGDMP     *    3        
        v            delta_db    10.3    10.4 �               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false                       1262    22012    delta_db    DATABASE     �   CREATE DATABASE delta_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Portuguese_Brazil.1252' LC_CTYPE = 'Portuguese_Brazil.1252';
    DROP DATABASE delta_db;
             postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false                       0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    3                        3079    12924    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false                       0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1            �            1259    22044 
   auth_group    TABLE     e   CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);
    DROP TABLE public.auth_group;
       public         postgres    false    3            �            1259    22042    auth_group_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.auth_group_id_seq;
       public       postgres    false    3    203                       0    0    auth_group_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;
            public       postgres    false    202            �            1259    22054    auth_group_permissions    TABLE     �   CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);
 *   DROP TABLE public.auth_group_permissions;
       public         postgres    false    3            �            1259    22052    auth_group_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.auth_group_permissions_id_seq;
       public       postgres    false    205    3                       0    0    auth_group_permissions_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;
            public       postgres    false    204            �            1259    22036    auth_permission    TABLE     �   CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);
 #   DROP TABLE public.auth_permission;
       public         postgres    false    3            �            1259    22034    auth_permission_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.auth_permission_id_seq;
       public       postgres    false    3    201                       0    0    auth_permission_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;
            public       postgres    false    200            �            1259    22098    customer_dossier    TABLE     �   CREATE TABLE public.customer_dossier (
    id integer NOT NULL,
    cpf character varying(11) NOT NULL,
    name character varying(100) NOT NULL,
    date_birth date,
    address character varying(150) NOT NULL
);
 $   DROP TABLE public.customer_dossier;
       public         postgres    false    3            �            1259    22096    customer_dossier_id_seq    SEQUENCE     �   CREATE SEQUENCE public.customer_dossier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.customer_dossier_id_seq;
       public       postgres    false    3    209                       0    0    customer_dossier_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.customer_dossier_id_seq OWNED BY public.customer_dossier.id;
            public       postgres    false    208            �            1259    22108    debt    TABLE     �   CREATE TABLE public.debt (
    id integer NOT NULL,
    value numeric(10,2) NOT NULL,
    date date NOT NULL,
    customer_dossier_id integer NOT NULL
);
    DROP TABLE public.debt;
       public         postgres    false    3            �            1259    22106    debt_id_seq    SEQUENCE     �   CREATE SEQUENCE public.debt_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.debt_id_seq;
       public       postgres    false    3    211                       0    0    debt_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.debt_id_seq OWNED BY public.debt.id;
            public       postgres    false    210            �            1259    22221    django_admin_log    TABLE     �  CREATE TABLE public.django_admin_log (
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
       public         postgres    false    3            �            1259    22219    django_admin_log_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.django_admin_log_id_seq;
       public       postgres    false    3    223                       0    0    django_admin_log_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;
            public       postgres    false    222            �            1259    22026    django_content_type    TABLE     �   CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);
 '   DROP TABLE public.django_content_type;
       public         postgres    false    3            �            1259    22024    django_content_type_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.django_content_type_id_seq;
       public       postgres    false    3    199                       0    0    django_content_type_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;
            public       postgres    false    198            �            1259    22015    django_migrations    TABLE     �   CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);
 %   DROP TABLE public.django_migrations;
       public         postgres    false    3            �            1259    22013    django_migrations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.django_migrations_id_seq;
       public       postgres    false    3    197                       0    0    django_migrations_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;
            public       postgres    false    196            �            1259    22627    django_session    TABLE     �   CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);
 "   DROP TABLE public.django_session;
       public         postgres    false    3            �            1259    22116    financial_transaction    TABLE     E  CREATE TABLE public.financial_transaction (
    id integer NOT NULL,
    value numeric(10,2) NOT NULL,
    description character varying(1000) NOT NULL,
    date date NOT NULL,
    type_transaction character varying(100) NOT NULL,
    payment_type character varying(100) NOT NULL,
    customer_dossier_id integer NOT NULL
);
 )   DROP TABLE public.financial_transaction;
       public         postgres    false    3            �            1259    22114    financial_transaction_id_seq    SEQUENCE     �   CREATE SEQUENCE public.financial_transaction_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.financial_transaction_id_seq;
       public       postgres    false    3    213                       0    0    financial_transaction_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.financial_transaction_id_seq OWNED BY public.financial_transaction.id;
            public       postgres    false    212            �            1259    22400 "   oauth2_provider_accesstoken_id_seq    SEQUENCE     �   CREATE SEQUENCE public.oauth2_provider_accesstoken_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public.oauth2_provider_accesstoken_id_seq;
       public       postgres    false    3            �            1259    22258    oauth2_provider_accesstoken    TABLE     �  CREATE TABLE public.oauth2_provider_accesstoken (
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
       public         postgres    false    228    3            �            1259    22439 "   oauth2_provider_application_id_seq    SEQUENCE     �   CREATE SEQUENCE public.oauth2_provider_application_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public.oauth2_provider_application_id_seq;
       public       postgres    false    3            �            1259    22245    oauth2_provider_application    TABLE     I  CREATE TABLE public.oauth2_provider_application (
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
       public         postgres    false    229    3            �            1259    22505    oauth2_provider_grant_id_seq    SEQUENCE     �   CREATE SEQUENCE public.oauth2_provider_grant_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.oauth2_provider_grant_id_seq;
       public       postgres    false    3            �            1259    22269    oauth2_provider_grant    TABLE     �  CREATE TABLE public.oauth2_provider_grant (
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
       public         postgres    false    230    3            �            1259    22525 #   oauth2_provider_refreshtoken_id_seq    SEQUENCE     �   CREATE SEQUENCE public.oauth2_provider_refreshtoken_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public.oauth2_provider_refreshtoken_id_seq;
       public       postgres    false    3            �            1259    22280    oauth2_provider_refreshtoken    TABLE     �  CREATE TABLE public.oauth2_provider_refreshtoken (
    id bigint DEFAULT nextval('public.oauth2_provider_refreshtoken_id_seq'::regclass) NOT NULL,
    token character varying(255) NOT NULL,
    access_token_id bigint NOT NULL,
    application_id bigint NOT NULL,
    user_id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL
);
 0   DROP TABLE public.oauth2_provider_refreshtoken;
       public         postgres    false    231    3            �            1259    22127 	   patrimony    TABLE     �   CREATE TABLE public.patrimony (
    id integer NOT NULL,
    value numeric(10,2) NOT NULL,
    description character varying(1000) NOT NULL,
    customer_dossier_id integer NOT NULL
);
    DROP TABLE public.patrimony;
       public         postgres    false    3            �            1259    22125    patrimony_id_seq    SEQUENCE     �   CREATE SEQUENCE public.patrimony_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.patrimony_id_seq;
       public       postgres    false    3    215                       0    0    patrimony_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.patrimony_id_seq OWNED BY public.patrimony.id;
            public       postgres    false    214            �            1259    22138    source_income    TABLE     �   CREATE TABLE public.source_income (
    id integer NOT NULL,
    value numeric(10,2) NOT NULL,
    description character varying(1000) NOT NULL,
    customer_dossier_id integer NOT NULL
);
 !   DROP TABLE public.source_income;
       public         postgres    false    3            �            1259    22136    source_income_id_seq    SEQUENCE     �   CREATE SEQUENCE public.source_income_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.source_income_id_seq;
       public       postgres    false    217    3                       0    0    source_income_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.source_income_id_seq OWNED BY public.source_income.id;
            public       postgres    false    216            �            1259    22085    user    TABLE     �  CREATE TABLE public."user" (
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
       public         postgres    false    3            �            1259    22150    user_groups    TABLE        CREATE TABLE public.user_groups (
    id integer NOT NULL,
    usermodel_id integer NOT NULL,
    group_id integer NOT NULL
);
    DROP TABLE public.user_groups;
       public         postgres    false    3            �            1259    22148    user_groups_id_seq    SEQUENCE     �   CREATE SEQUENCE public.user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.user_groups_id_seq;
       public       postgres    false    3    219                       0    0    user_groups_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.user_groups_id_seq OWNED BY public.user_groups.id;
            public       postgres    false    218            �            1259    22083    user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.user_id_seq;
       public       postgres    false    207    3                       0    0    user_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.user_id_seq OWNED BY public."user".id;
            public       postgres    false    206            �            1259    22158    user_user_permissions    TABLE     �   CREATE TABLE public.user_user_permissions (
    id integer NOT NULL,
    usermodel_id integer NOT NULL,
    permission_id integer NOT NULL
);
 )   DROP TABLE public.user_user_permissions;
       public         postgres    false    3            �            1259    22156    user_user_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.user_user_permissions_id_seq;
       public       postgres    false    221    3                       0    0    user_user_permissions_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.user_user_permissions_id_seq OWNED BY public.user_user_permissions.id;
            public       postgres    false    220            �
           2604    22047    auth_group id    DEFAULT     n   ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);
 <   ALTER TABLE public.auth_group ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    203    202    203            �
           2604    22057    auth_group_permissions id    DEFAULT     �   ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);
 H   ALTER TABLE public.auth_group_permissions ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    205    204    205            �
           2604    22039    auth_permission id    DEFAULT     x   ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);
 A   ALTER TABLE public.auth_permission ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    201    200    201            �
           2604    22101    customer_dossier id    DEFAULT     z   ALTER TABLE ONLY public.customer_dossier ALTER COLUMN id SET DEFAULT nextval('public.customer_dossier_id_seq'::regclass);
 B   ALTER TABLE public.customer_dossier ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    208    209    209            �
           2604    22111    debt id    DEFAULT     b   ALTER TABLE ONLY public.debt ALTER COLUMN id SET DEFAULT nextval('public.debt_id_seq'::regclass);
 6   ALTER TABLE public.debt ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    211    210    211            �
           2604    22224    django_admin_log id    DEFAULT     z   ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);
 B   ALTER TABLE public.django_admin_log ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    222    223    223            �
           2604    22029    django_content_type id    DEFAULT     �   ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);
 E   ALTER TABLE public.django_content_type ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    198    199    199            �
           2604    22018    django_migrations id    DEFAULT     |   ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);
 C   ALTER TABLE public.django_migrations ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    196    197    197            �
           2604    22119    financial_transaction id    DEFAULT     �   ALTER TABLE ONLY public.financial_transaction ALTER COLUMN id SET DEFAULT nextval('public.financial_transaction_id_seq'::regclass);
 G   ALTER TABLE public.financial_transaction ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    212    213    213            �
           2604    22130    patrimony id    DEFAULT     l   ALTER TABLE ONLY public.patrimony ALTER COLUMN id SET DEFAULT nextval('public.patrimony_id_seq'::regclass);
 ;   ALTER TABLE public.patrimony ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    215    214    215            �
           2604    22141    source_income id    DEFAULT     t   ALTER TABLE ONLY public.source_income ALTER COLUMN id SET DEFAULT nextval('public.source_income_id_seq'::regclass);
 ?   ALTER TABLE public.source_income ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    217    216    217            �
           2604    22088    user id    DEFAULT     d   ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);
 8   ALTER TABLE public."user" ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    206    207    207            �
           2604    22153    user_groups id    DEFAULT     p   ALTER TABLE ONLY public.user_groups ALTER COLUMN id SET DEFAULT nextval('public.user_groups_id_seq'::regclass);
 =   ALTER TABLE public.user_groups ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    219    218    219            �
           2604    22161    user_user_permissions id    DEFAULT     �   ALTER TABLE ONLY public.user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.user_user_permissions_id_seq'::regclass);
 G   ALTER TABLE public.user_user_permissions ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    220    221    221            �          0    22044 
   auth_group 
   TABLE DATA               .   COPY public.auth_group (id, name) FROM stdin;
    public       postgres    false    203   �      �          0    22054    auth_group_permissions 
   TABLE DATA               M   COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
    public       postgres    false    205   �      �          0    22036    auth_permission 
   TABLE DATA               N   COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
    public       postgres    false    201   	      �          0    22098    customer_dossier 
   TABLE DATA               N   COPY public.customer_dossier (id, cpf, name, date_birth, address) FROM stdin;
    public       postgres    false    209   V      �          0    22108    debt 
   TABLE DATA               D   COPY public.debt (id, value, date, customer_dossier_id) FROM stdin;
    public       postgres    false    211   �      �          0    22221    django_admin_log 
   TABLE DATA               �   COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
    public       postgres    false    223   �      �          0    22026    django_content_type 
   TABLE DATA               C   COPY public.django_content_type (id, app_label, model) FROM stdin;
    public       postgres    false    199   �      �          0    22015    django_migrations 
   TABLE DATA               C   COPY public.django_migrations (id, app, name, applied) FROM stdin;
    public       postgres    false    197   �                0    22627    django_session 
   TABLE DATA               P   COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
    public       postgres    false    232   �      �          0    22116    financial_transaction 
   TABLE DATA               �   COPY public.financial_transaction (id, value, description, date, type_transaction, payment_type, customer_dossier_id) FROM stdin;
    public       postgres    false    213                   0    22258    oauth2_provider_accesstoken 
   TABLE DATA               {   COPY public.oauth2_provider_accesstoken (id, token, expires, scope, application_id, user_id, created, updated) FROM stdin;
    public       postgres    false    225   �                 0    22245    oauth2_provider_application 
   TABLE DATA               �   COPY public.oauth2_provider_application (id, client_id, redirect_uris, client_type, authorization_grant_type, client_secret, name, user_id, skip_authorization, created, updated) FROM stdin;
    public       postgres    false    224   w                0    22269    oauth2_provider_grant 
   TABLE DATA               �   COPY public.oauth2_provider_grant (id, code, expires, redirect_uri, scope, application_id, user_id, created, updated) FROM stdin;
    public       postgres    false    226   6                0    22280    oauth2_provider_refreshtoken 
   TABLE DATA               }   COPY public.oauth2_provider_refreshtoken (id, token, access_token_id, application_id, user_id, created, updated) FROM stdin;
    public       postgres    false    227   S      �          0    22127 	   patrimony 
   TABLE DATA               P   COPY public.patrimony (id, value, description, customer_dossier_id) FROM stdin;
    public       postgres    false    215         �          0    22138    source_income 
   TABLE DATA               T   COPY public.source_income (id, value, description, customer_dossier_id) FROM stdin;
    public       postgres    false    217   J      �          0    22085    user 
   TABLE DATA               �   COPY public."user" (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
    public       postgres    false    207   }      �          0    22150    user_groups 
   TABLE DATA               A   COPY public.user_groups (id, usermodel_id, group_id) FROM stdin;
    public       postgres    false    219   :      �          0    22158    user_user_permissions 
   TABLE DATA               P   COPY public.user_user_permissions (id, usermodel_id, permission_id) FROM stdin;
    public       postgres    false    221   W                 0    0    auth_group_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);
            public       postgres    false    202                        0    0    auth_group_permissions_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);
            public       postgres    false    204            !           0    0    auth_permission_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.auth_permission_id_seq', 48, true);
            public       postgres    false    200            "           0    0    customer_dossier_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.customer_dossier_id_seq', 23, true);
            public       postgres    false    208            #           0    0    debt_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.debt_id_seq', 13, true);
            public       postgres    false    210            $           0    0    django_admin_log_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.django_admin_log_id_seq', 6, true);
            public       postgres    false    222            %           0    0    django_content_type_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.django_content_type_id_seq', 16, true);
            public       postgres    false    198            &           0    0    django_migrations_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.django_migrations_id_seq', 21, true);
            public       postgres    false    196            '           0    0    financial_transaction_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.financial_transaction_id_seq', 110, true);
            public       postgres    false    212            (           0    0 "   oauth2_provider_accesstoken_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.oauth2_provider_accesstoken_id_seq', 3, true);
            public       postgres    false    228            )           0    0 "   oauth2_provider_application_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.oauth2_provider_application_id_seq', 2, true);
            public       postgres    false    229            *           0    0    oauth2_provider_grant_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.oauth2_provider_grant_id_seq', 1, false);
            public       postgres    false    230            +           0    0 #   oauth2_provider_refreshtoken_id_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.oauth2_provider_refreshtoken_id_seq', 3, true);
            public       postgres    false    231            ,           0    0    patrimony_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.patrimony_id_seq', 8, true);
            public       postgres    false    214            -           0    0    source_income_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.source_income_id_seq', 8, true);
            public       postgres    false    216            .           0    0    user_groups_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.user_groups_id_seq', 1, false);
            public       postgres    false    218            /           0    0    user_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.user_id_seq', 1, false);
            public       postgres    false    206            0           0    0    user_user_permissions_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.user_user_permissions_id_seq', 1, false);
            public       postgres    false    220                       2606    22051    auth_group auth_group_name_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);
 H   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_name_key;
       public         postgres    false    203                       2606    22080 R   auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);
 |   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq;
       public         postgres    false    205    205            
           2606    22059 2   auth_group_permissions auth_group_permissions_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_pkey;
       public         postgres    false    205                       2606    22049    auth_group auth_group_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_pkey;
       public         postgres    false    203            �
           2606    22066 F   auth_permission auth_permission_content_type_id_codename_01ab375a_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);
 p   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq;
       public         postgres    false    201    201            �
           2606    22041 $   auth_permission auth_permission_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_pkey;
       public         postgres    false    201                       2606    22105 )   customer_dossier customer_dossier_cpf_key 
   CONSTRAINT     c   ALTER TABLE ONLY public.customer_dossier
    ADD CONSTRAINT customer_dossier_cpf_key UNIQUE (cpf);
 S   ALTER TABLE ONLY public.customer_dossier DROP CONSTRAINT customer_dossier_cpf_key;
       public         postgres    false    209                       2606    22103 &   customer_dossier customer_dossier_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.customer_dossier
    ADD CONSTRAINT customer_dossier_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.customer_dossier DROP CONSTRAINT customer_dossier_pkey;
       public         postgres    false    209                       2606    22113    debt debt_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.debt
    ADD CONSTRAINT debt_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.debt DROP CONSTRAINT debt_pkey;
       public         postgres    false    211            1           2606    22230 &   django_admin_log django_admin_log_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_pkey;
       public         postgres    false    223            �
           2606    22033 E   django_content_type django_content_type_app_label_model_76bd3d3b_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);
 o   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq;
       public         postgres    false    199    199            �
           2606    22031 ,   django_content_type django_content_type_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_pkey;
       public         postgres    false    199            �
           2606    22023 (   django_migrations django_migrations_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.django_migrations DROP CONSTRAINT django_migrations_pkey;
       public         postgres    false    197            T           2606    22634 "   django_session django_session_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);
 L   ALTER TABLE ONLY public.django_session DROP CONSTRAINT django_session_pkey;
       public         postgres    false    232                       2606    22124 0   financial_transaction financial_transaction_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.financial_transaction
    ADD CONSTRAINT financial_transaction_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.financial_transaction DROP CONSTRAINT financial_transaction_pkey;
       public         postgres    false    213            =           2606    22388 <   oauth2_provider_accesstoken oauth2_provider_accesstoken_pkey 
   CONSTRAINT     z   ALTER TABLE ONLY public.oauth2_provider_accesstoken
    ADD CONSTRAINT oauth2_provider_accesstoken_pkey PRIMARY KEY (id);
 f   ALTER TABLE ONLY public.oauth2_provider_accesstoken DROP CONSTRAINT oauth2_provider_accesstoken_pkey;
       public         postgres    false    225            @           2606    22373 K   oauth2_provider_accesstoken oauth2_provider_accesstoken_token_8af090f8_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.oauth2_provider_accesstoken
    ADD CONSTRAINT oauth2_provider_accesstoken_token_8af090f8_uniq UNIQUE (token);
 u   ALTER TABLE ONLY public.oauth2_provider_accesstoken DROP CONSTRAINT oauth2_provider_accesstoken_token_8af090f8_uniq;
       public         postgres    false    225            5           2606    22255 E   oauth2_provider_application oauth2_provider_application_client_id_key 
   CONSTRAINT     �   ALTER TABLE ONLY public.oauth2_provider_application
    ADD CONSTRAINT oauth2_provider_application_client_id_key UNIQUE (client_id);
 o   ALTER TABLE ONLY public.oauth2_provider_application DROP CONSTRAINT oauth2_provider_application_client_id_key;
       public         postgres    false    224            9           2606    22426 <   oauth2_provider_application oauth2_provider_application_pkey 
   CONSTRAINT     z   ALTER TABLE ONLY public.oauth2_provider_application
    ADD CONSTRAINT oauth2_provider_application_pkey PRIMARY KEY (id);
 f   ALTER TABLE ONLY public.oauth2_provider_application DROP CONSTRAINT oauth2_provider_application_pkey;
       public         postgres    false    224            E           2606    22376 >   oauth2_provider_grant oauth2_provider_grant_code_49ab4ddf_uniq 
   CONSTRAINT     y   ALTER TABLE ONLY public.oauth2_provider_grant
    ADD CONSTRAINT oauth2_provider_grant_code_49ab4ddf_uniq UNIQUE (code);
 h   ALTER TABLE ONLY public.oauth2_provider_grant DROP CONSTRAINT oauth2_provider_grant_code_49ab4ddf_uniq;
       public         postgres    false    226            G           2606    22493 0   oauth2_provider_grant oauth2_provider_grant_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.oauth2_provider_grant
    ADD CONSTRAINT oauth2_provider_grant_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.oauth2_provider_grant DROP CONSTRAINT oauth2_provider_grant_pkey;
       public         postgres    false    226            J           2606    22404 M   oauth2_provider_refreshtoken oauth2_provider_refreshtoken_access_token_id_key 
   CONSTRAINT     �   ALTER TABLE ONLY public.oauth2_provider_refreshtoken
    ADD CONSTRAINT oauth2_provider_refreshtoken_access_token_id_key UNIQUE (access_token_id);
 w   ALTER TABLE ONLY public.oauth2_provider_refreshtoken DROP CONSTRAINT oauth2_provider_refreshtoken_access_token_id_key;
       public         postgres    false    227            M           2606    22515 >   oauth2_provider_refreshtoken oauth2_provider_refreshtoken_pkey 
   CONSTRAINT     |   ALTER TABLE ONLY public.oauth2_provider_refreshtoken
    ADD CONSTRAINT oauth2_provider_refreshtoken_pkey PRIMARY KEY (id);
 h   ALTER TABLE ONLY public.oauth2_provider_refreshtoken DROP CONSTRAINT oauth2_provider_refreshtoken_pkey;
       public         postgres    false    227            P           2606    22379 M   oauth2_provider_refreshtoken oauth2_provider_refreshtoken_token_d090daa4_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.oauth2_provider_refreshtoken
    ADD CONSTRAINT oauth2_provider_refreshtoken_token_d090daa4_uniq UNIQUE (token);
 w   ALTER TABLE ONLY public.oauth2_provider_refreshtoken DROP CONSTRAINT oauth2_provider_refreshtoken_token_d090daa4_uniq;
       public         postgres    false    227                       2606    22135    patrimony patrimony_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.patrimony
    ADD CONSTRAINT patrimony_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.patrimony DROP CONSTRAINT patrimony_pkey;
       public         postgres    false    215            "           2606    22146     source_income source_income_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.source_income
    ADD CONSTRAINT source_income_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.source_income DROP CONSTRAINT source_income_pkey;
       public         postgres    false    217            %           2606    22155    user_groups user_groups_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.user_groups
    ADD CONSTRAINT user_groups_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.user_groups DROP CONSTRAINT user_groups_pkey;
       public         postgres    false    219            (           2606    22202 ;   user_groups user_groups_usermodel_id_group_id_b92f3245_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.user_groups
    ADD CONSTRAINT user_groups_usermodel_id_group_id_b92f3245_uniq UNIQUE (usermodel_id, group_id);
 e   ALTER TABLE ONLY public.user_groups DROP CONSTRAINT user_groups_usermodel_id_group_id_b92f3245_uniq;
       public         postgres    false    219    219                       2606    22093    user user_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public."user" DROP CONSTRAINT user_pkey;
       public         postgres    false    207            +           2606    22163 0   user_user_permissions user_user_permissions_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.user_user_permissions
    ADD CONSTRAINT user_user_permissions_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.user_user_permissions DROP CONSTRAINT user_user_permissions_pkey;
       public         postgres    false    221            .           2606    22216 T   user_user_permissions user_user_permissions_usermodel_id_permission_id_a6d6add3_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.user_user_permissions
    ADD CONSTRAINT user_user_permissions_usermodel_id_permission_id_a6d6add3_uniq UNIQUE (usermodel_id, permission_id);
 ~   ALTER TABLE ONLY public.user_user_permissions DROP CONSTRAINT user_user_permissions_usermodel_id_permission_id_a6d6add3_uniq;
       public         postgres    false    221    221                       2606    22095    user user_username_key 
   CONSTRAINT     W   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_username_key UNIQUE (username);
 B   ALTER TABLE ONLY public."user" DROP CONSTRAINT user_username_key;
       public         postgres    false    207                        1259    22068    auth_group_name_a6ea08ec_like    INDEX     h   CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);
 1   DROP INDEX public.auth_group_name_a6ea08ec_like;
       public         postgres    false    203                       1259    22081 (   auth_group_permissions_group_id_b120cbf9    INDEX     o   CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);
 <   DROP INDEX public.auth_group_permissions_group_id_b120cbf9;
       public         postgres    false    205                       1259    22082 -   auth_group_permissions_permission_id_84c5c92e    INDEX     y   CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);
 A   DROP INDEX public.auth_group_permissions_permission_id_84c5c92e;
       public         postgres    false    205            �
           1259    22067 (   auth_permission_content_type_id_2f476e4b    INDEX     o   CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);
 <   DROP INDEX public.auth_permission_content_type_id_2f476e4b;
       public         postgres    false    201                       1259    22147    cpf_idx    INDEX     C   CREATE INDEX cpf_idx ON public.customer_dossier USING btree (cpf);
    DROP INDEX public.cpf_idx;
       public         postgres    false    209                       1259    22166 "   customer_dossier_cpf_3bc48d1e_like    INDEX     r   CREATE INDEX customer_dossier_cpf_3bc48d1e_like ON public.customer_dossier USING btree (cpf varchar_pattern_ops);
 6   DROP INDEX public.customer_dossier_cpf_3bc48d1e_like;
       public         postgres    false    209                       1259    22172 !   debt_customer_dossier_id_23d3fc31    INDEX     a   CREATE INDEX debt_customer_dossier_id_23d3fc31 ON public.debt USING btree (customer_dossier_id);
 5   DROP INDEX public.debt_customer_dossier_id_23d3fc31;
       public         postgres    false    211            /           1259    22241 )   django_admin_log_content_type_id_c4bce8eb    INDEX     q   CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);
 =   DROP INDEX public.django_admin_log_content_type_id_c4bce8eb;
       public         postgres    false    223            2           1259    22242 !   django_admin_log_user_id_c564eba6    INDEX     a   CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);
 5   DROP INDEX public.django_admin_log_user_id_c564eba6;
       public         postgres    false    223            R           1259    22636 #   django_session_expire_date_a5c62663    INDEX     e   CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);
 7   DROP INDEX public.django_session_expire_date_a5c62663;
       public         postgres    false    232            U           1259    22635 (   django_session_session_key_c0390e0f_like    INDEX     ~   CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);
 <   DROP INDEX public.django_session_session_key_c0390e0f_like;
       public         postgres    false    232                       1259    22178 2   financial_transaction_customer_dossier_id_1e0f3f0f    INDEX     �   CREATE INDEX financial_transaction_customer_dossier_id_1e0f3f0f ON public.financial_transaction USING btree (customer_dossier_id);
 F   DROP INDEX public.financial_transaction_customer_dossier_id_1e0f3f0f;
       public         postgres    false    213            ;           1259    22464 3   oauth2_provider_accesstoken_application_id_b22886e1    INDEX     �   CREATE INDEX oauth2_provider_accesstoken_application_id_b22886e1 ON public.oauth2_provider_accesstoken USING btree (application_id);
 G   DROP INDEX public.oauth2_provider_accesstoken_application_id_b22886e1;
       public         postgres    false    225            >           1259    22374 /   oauth2_provider_accesstoken_token_8af090f8_like    INDEX     �   CREATE INDEX oauth2_provider_accesstoken_token_8af090f8_like ON public.oauth2_provider_accesstoken USING btree (token varchar_pattern_ops);
 C   DROP INDEX public.oauth2_provider_accesstoken_token_8af090f8_like;
       public         postgres    false    225            A           1259    22310 ,   oauth2_provider_accesstoken_user_id_6e4c9a65    INDEX     w   CREATE INDEX oauth2_provider_accesstoken_user_id_6e4c9a65 ON public.oauth2_provider_accesstoken USING btree (user_id);
 @   DROP INDEX public.oauth2_provider_accesstoken_user_id_6e4c9a65;
       public         postgres    false    225            3           1259    22293 3   oauth2_provider_application_client_id_03f0cc84_like    INDEX     �   CREATE INDEX oauth2_provider_application_client_id_03f0cc84_like ON public.oauth2_provider_application USING btree (client_id varchar_pattern_ops);
 G   DROP INDEX public.oauth2_provider_application_client_id_03f0cc84_like;
       public         postgres    false    224            6           1259    22294 2   oauth2_provider_application_client_secret_53133678    INDEX     �   CREATE INDEX oauth2_provider_application_client_secret_53133678 ON public.oauth2_provider_application USING btree (client_secret);
 F   DROP INDEX public.oauth2_provider_application_client_secret_53133678;
       public         postgres    false    224            7           1259    22295 7   oauth2_provider_application_client_secret_53133678_like    INDEX     �   CREATE INDEX oauth2_provider_application_client_secret_53133678_like ON public.oauth2_provider_application USING btree (client_secret varchar_pattern_ops);
 K   DROP INDEX public.oauth2_provider_application_client_secret_53133678_like;
       public         postgres    false    224            :           1259    22296 ,   oauth2_provider_application_user_id_79829054    INDEX     w   CREATE INDEX oauth2_provider_application_user_id_79829054 ON public.oauth2_provider_application USING btree (user_id);
 @   DROP INDEX public.oauth2_provider_application_user_id_79829054;
       public         postgres    false    224            B           1259    22452 -   oauth2_provider_grant_application_id_81923564    INDEX     y   CREATE INDEX oauth2_provider_grant_application_id_81923564 ON public.oauth2_provider_grant USING btree (application_id);
 A   DROP INDEX public.oauth2_provider_grant_application_id_81923564;
       public         postgres    false    226            C           1259    22377 (   oauth2_provider_grant_code_49ab4ddf_like    INDEX     ~   CREATE INDEX oauth2_provider_grant_code_49ab4ddf_like ON public.oauth2_provider_grant USING btree (code varchar_pattern_ops);
 <   DROP INDEX public.oauth2_provider_grant_code_49ab4ddf_like;
       public         postgres    false    226            H           1259    22324 &   oauth2_provider_grant_user_id_e8f62af8    INDEX     k   CREATE INDEX oauth2_provider_grant_user_id_e8f62af8 ON public.oauth2_provider_grant USING btree (user_id);
 :   DROP INDEX public.oauth2_provider_grant_user_id_e8f62af8;
       public         postgres    false    226            K           1259    22442 4   oauth2_provider_refreshtoken_application_id_2d1c311b    INDEX     �   CREATE INDEX oauth2_provider_refreshtoken_application_id_2d1c311b ON public.oauth2_provider_refreshtoken USING btree (application_id);
 H   DROP INDEX public.oauth2_provider_refreshtoken_application_id_2d1c311b;
       public         postgres    false    227            N           1259    22380 0   oauth2_provider_refreshtoken_token_d090daa4_like    INDEX     �   CREATE INDEX oauth2_provider_refreshtoken_token_d090daa4_like ON public.oauth2_provider_refreshtoken USING btree (token varchar_pattern_ops);
 D   DROP INDEX public.oauth2_provider_refreshtoken_token_d090daa4_like;
       public         postgres    false    227            Q           1259    22343 -   oauth2_provider_refreshtoken_user_id_da837fce    INDEX     y   CREATE INDEX oauth2_provider_refreshtoken_user_id_da837fce ON public.oauth2_provider_refreshtoken USING btree (user_id);
 A   DROP INDEX public.oauth2_provider_refreshtoken_user_id_da837fce;
       public         postgres    false    227                       1259    22184 &   patrimony_customer_dossier_id_7a0acc26    INDEX     k   CREATE INDEX patrimony_customer_dossier_id_7a0acc26 ON public.patrimony USING btree (customer_dossier_id);
 :   DROP INDEX public.patrimony_customer_dossier_id_7a0acc26;
       public         postgres    false    215                        1259    22190 *   source_income_customer_dossier_id_c1b4f7df    INDEX     s   CREATE INDEX source_income_customer_dossier_id_c1b4f7df ON public.source_income USING btree (customer_dossier_id);
 >   DROP INDEX public.source_income_customer_dossier_id_c1b4f7df;
       public         postgres    false    217            #           1259    22204    user_groups_group_id_b76f8aba    INDEX     Y   CREATE INDEX user_groups_group_id_b76f8aba ON public.user_groups USING btree (group_id);
 1   DROP INDEX public.user_groups_group_id_b76f8aba;
       public         postgres    false    219            &           1259    22203 !   user_groups_usermodel_id_edcb1e77    INDEX     a   CREATE INDEX user_groups_usermodel_id_edcb1e77 ON public.user_groups USING btree (usermodel_id);
 5   DROP INDEX public.user_groups_usermodel_id_edcb1e77;
       public         postgres    false    219            )           1259    22218 ,   user_user_permissions_permission_id_9deb68a3    INDEX     w   CREATE INDEX user_user_permissions_permission_id_9deb68a3 ON public.user_user_permissions USING btree (permission_id);
 @   DROP INDEX public.user_user_permissions_permission_id_9deb68a3;
       public         postgres    false    221            ,           1259    22217 +   user_user_permissions_usermodel_id_261a7b99    INDEX     u   CREATE INDEX user_user_permissions_usermodel_id_261a7b99 ON public.user_user_permissions USING btree (usermodel_id);
 ?   DROP INDEX public.user_user_permissions_usermodel_id_261a7b99;
       public         postgres    false    221                       1259    22165    user_username_cf016618_like    INDEX     f   CREATE INDEX user_username_cf016618_like ON public."user" USING btree (username varchar_pattern_ops);
 /   DROP INDEX public.user_username_cf016618_like;
       public         postgres    false    207                       1259    22164    username_idx    INDEX     C   CREATE INDEX username_idx ON public."user" USING btree (username);
     DROP INDEX public.username_idx;
       public         postgres    false    207            X           2606    22074 O   auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm;
       public       postgres    false    2815    205    201            W           2606    22069 P   auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id;
       public       postgres    false    2820    205    203            V           2606    22060 E   auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co;
       public       postgres    false    201    2810    199            Y           2606    22167 =   debt debt_customer_dossier_id_23d3fc31_fk_customer_dossier_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.debt
    ADD CONSTRAINT debt_customer_dossier_id_23d3fc31_fk_customer_dossier_id FOREIGN KEY (customer_dossier_id) REFERENCES public.customer_dossier(id) DEFERRABLE INITIALLY DEFERRED;
 g   ALTER TABLE ONLY public.debt DROP CONSTRAINT debt_customer_dossier_id_23d3fc31_fk_customer_dossier_id;
       public       postgres    false    211    209    2838            a           2606    22231 G   django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co;
       public       postgres    false    223    199    2810            b           2606    22236 =   django_admin_log django_admin_log_user_id_c564eba6_fk_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_user_id FOREIGN KEY (user_id) REFERENCES public."user"(id) DEFERRABLE INITIALLY DEFERRED;
 g   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_user_id_c564eba6_fk_user_id;
       public       postgres    false    2828    207    223            Z           2606    22173 T   financial_transaction financial_transactio_customer_dossier_id_1e0f3f0f_fk_customer_    FK CONSTRAINT     �   ALTER TABLE ONLY public.financial_transaction
    ADD CONSTRAINT financial_transactio_customer_dossier_id_1e0f3f0f_fk_customer_ FOREIGN KEY (customer_dossier_id) REFERENCES public.customer_dossier(id) DEFERRABLE INITIALLY DEFERRED;
 ~   ALTER TABLE ONLY public.financial_transaction DROP CONSTRAINT financial_transactio_customer_dossier_id_1e0f3f0f_fk_customer_;
       public       postgres    false    2838    213    209            e           2606    22486 R   oauth2_provider_accesstoken oauth2_provider_accesstoken_application_id_b22886e1_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.oauth2_provider_accesstoken
    ADD CONSTRAINT oauth2_provider_accesstoken_application_id_b22886e1_fk FOREIGN KEY (application_id) REFERENCES public.oauth2_provider_application(id) DEFERRABLE INITIALLY DEFERRED;
 |   ALTER TABLE ONLY public.oauth2_provider_accesstoken DROP CONSTRAINT oauth2_provider_accesstoken_application_id_b22886e1_fk;
       public       postgres    false    2873    225    224            d           2606    22419 S   oauth2_provider_accesstoken oauth2_provider_accesstoken_user_id_6e4c9a65_fk_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.oauth2_provider_accesstoken
    ADD CONSTRAINT oauth2_provider_accesstoken_user_id_6e4c9a65_fk_user_id FOREIGN KEY (user_id) REFERENCES public."user"(id) DEFERRABLE INITIALLY DEFERRED;
 }   ALTER TABLE ONLY public.oauth2_provider_accesstoken DROP CONSTRAINT oauth2_provider_accesstoken_user_id_6e4c9a65_fk_user_id;
       public       postgres    false    225    207    2828            c           2606    22367 S   oauth2_provider_application oauth2_provider_application_user_id_79829054_fk_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.oauth2_provider_application
    ADD CONSTRAINT oauth2_provider_application_user_id_79829054_fk_user_id FOREIGN KEY (user_id) REFERENCES public."user"(id) DEFERRABLE INITIALLY DEFERRED;
 }   ALTER TABLE ONLY public.oauth2_provider_application DROP CONSTRAINT oauth2_provider_application_user_id_79829054_fk_user_id;
       public       postgres    false    224    207    2828            f           2606    22481 F   oauth2_provider_grant oauth2_provider_grant_application_id_81923564_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.oauth2_provider_grant
    ADD CONSTRAINT oauth2_provider_grant_application_id_81923564_fk FOREIGN KEY (application_id) REFERENCES public.oauth2_provider_application(id) DEFERRABLE INITIALLY DEFERRED;
 p   ALTER TABLE ONLY public.oauth2_provider_grant DROP CONSTRAINT oauth2_provider_grant_application_id_81923564_fk;
       public       postgres    false    2873    224    226            g           2606    22508 G   oauth2_provider_grant oauth2_provider_grant_user_id_e8f62af8_fk_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.oauth2_provider_grant
    ADD CONSTRAINT oauth2_provider_grant_user_id_e8f62af8_fk_user_id FOREIGN KEY (user_id) REFERENCES public."user"(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.oauth2_provider_grant DROP CONSTRAINT oauth2_provider_grant_user_id_e8f62af8_fk_user_id;
       public       postgres    false    207    2828    226            h           2606    22414 U   oauth2_provider_refreshtoken oauth2_provider_refreshtoken_access_token_id_775e84e8_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.oauth2_provider_refreshtoken
    ADD CONSTRAINT oauth2_provider_refreshtoken_access_token_id_775e84e8_fk FOREIGN KEY (access_token_id) REFERENCES public.oauth2_provider_accesstoken(id) DEFERRABLE INITIALLY DEFERRED;
    ALTER TABLE ONLY public.oauth2_provider_refreshtoken DROP CONSTRAINT oauth2_provider_refreshtoken_access_token_id_775e84e8_fk;
       public       postgres    false    2877    227    225            i           2606    22476 T   oauth2_provider_refreshtoken oauth2_provider_refreshtoken_application_id_2d1c311b_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.oauth2_provider_refreshtoken
    ADD CONSTRAINT oauth2_provider_refreshtoken_application_id_2d1c311b_fk FOREIGN KEY (application_id) REFERENCES public.oauth2_provider_application(id) DEFERRABLE INITIALLY DEFERRED;
 ~   ALTER TABLE ONLY public.oauth2_provider_refreshtoken DROP CONSTRAINT oauth2_provider_refreshtoken_application_id_2d1c311b_fk;
       public       postgres    false    227    2873    224            j           2606    22528 U   oauth2_provider_refreshtoken oauth2_provider_refreshtoken_user_id_da837fce_fk_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.oauth2_provider_refreshtoken
    ADD CONSTRAINT oauth2_provider_refreshtoken_user_id_da837fce_fk_user_id FOREIGN KEY (user_id) REFERENCES public."user"(id) DEFERRABLE INITIALLY DEFERRED;
    ALTER TABLE ONLY public.oauth2_provider_refreshtoken DROP CONSTRAINT oauth2_provider_refreshtoken_user_id_da837fce_fk_user_id;
       public       postgres    false    207    2828    227            [           2606    22179 G   patrimony patrimony_customer_dossier_id_7a0acc26_fk_customer_dossier_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.patrimony
    ADD CONSTRAINT patrimony_customer_dossier_id_7a0acc26_fk_customer_dossier_id FOREIGN KEY (customer_dossier_id) REFERENCES public.customer_dossier(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.patrimony DROP CONSTRAINT patrimony_customer_dossier_id_7a0acc26_fk_customer_dossier_id;
       public       postgres    false    2838    215    209            \           2606    22185 E   source_income source_income_customer_dossier_id_c1b4f7df_fk_customer_    FK CONSTRAINT     �   ALTER TABLE ONLY public.source_income
    ADD CONSTRAINT source_income_customer_dossier_id_c1b4f7df_fk_customer_ FOREIGN KEY (customer_dossier_id) REFERENCES public.customer_dossier(id) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY public.source_income DROP CONSTRAINT source_income_customer_dossier_id_c1b4f7df_fk_customer_;
       public       postgres    false    2838    217    209            ^           2606    22196 :   user_groups user_groups_group_id_b76f8aba_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_groups
    ADD CONSTRAINT user_groups_group_id_b76f8aba_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 d   ALTER TABLE ONLY public.user_groups DROP CONSTRAINT user_groups_group_id_b76f8aba_fk_auth_group_id;
       public       postgres    false    219    203    2820            ]           2606    22191 8   user_groups user_groups_usermodel_id_edcb1e77_fk_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_groups
    ADD CONSTRAINT user_groups_usermodel_id_edcb1e77_fk_user_id FOREIGN KEY (usermodel_id) REFERENCES public."user"(id) DEFERRABLE INITIALLY DEFERRED;
 b   ALTER TABLE ONLY public.user_groups DROP CONSTRAINT user_groups_usermodel_id_edcb1e77_fk_user_id;
       public       postgres    false    219    207    2828            `           2606    22210 N   user_user_permissions user_user_permission_permission_id_9deb68a3_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_user_permissions
    ADD CONSTRAINT user_user_permission_permission_id_9deb68a3_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 x   ALTER TABLE ONLY public.user_user_permissions DROP CONSTRAINT user_user_permission_permission_id_9deb68a3_fk_auth_perm;
       public       postgres    false    2815    201    221            _           2606    22205 L   user_user_permissions user_user_permissions_usermodel_id_261a7b99_fk_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_user_permissions
    ADD CONSTRAINT user_user_permissions_usermodel_id_261a7b99_fk_user_id FOREIGN KEY (usermodel_id) REFERENCES public."user"(id) DEFERRABLE INITIALLY DEFERRED;
 v   ALTER TABLE ONLY public.user_user_permissions DROP CONSTRAINT user_user_permissions_usermodel_id_261a7b99_fk_user_id;
       public       postgres    false    2828    221    207            �      x������ � �      �      x������ � �      �   1  x���Mr� ��p
� e$�o=�H�A�Q�*��~4Э��Nj����j=	�G�NNSw��N��L�x�7ާ[�'D}Isфʥ	��U
�R�*�hw����a}Rm�Ǻa��4aA�Ǫ~q���!	�k~��2q�J� �L�]Pք��]x,��IJk���60����<~�N��/d�L�#6�Ю��6$+v�rrY���a�IU�8bYʂ4�OX��`���fC����6�}�R��~G|P��� F(_�`�G�&M`'X�x����Z>�����.[F�%d_%��t���s���9`�-ʴ�l;��8��w���H��I��w>x���ɺ�vt�1\��¢�{�
�3m� FR��` �$�(��M��"�"=�����u�������%=�A�������h)9�P�rV��H`R,"�d'��K�ǖ����F��څ��^��3/�9U+��C2��Q`��i$����ô�ϋn�Y�(�9�kH^?�)�M��'m�'�iky���)��F�M)}9��Q>�>�/Z�/�{7I��������s��O�      �   Q   x�32�40�46166��4�t/���H-�MUpI��M,J��420��50�5��*MTp�H,HM��22F�h�Mc���=... ���      �   *   x�34�4400�30�420��50"N##.Cc��\1z\\\ 	      �   �   x���AO1���_����4}��n۫\=HL�O�.[�-	���@���$�ͼD
��M���m�, םl�X5r�2�"g[�G�,��vs�T� WJ- �<&/�듸�5X��P�1�(��:�>�b�r冷=���}*r��FvGY��/n�Wq_.�8��_as^�H.@�ڜ|E��� �0�m-t��:���7)�5�ӘR��!z�i\��2����I Ws�,�7�j�ˣ���yUU�(�z�      �   �   x�e�[j�0E��Ŕ&�h��BPmMb�XF���*�t�s.\u���y���B���2�K���_F���<'5U�L�u��+�H�����l?d�{$s��G��GK����/%�l�(�����M�L{�{�RR&BC�1/h���Zr'lS���v9h�R_��Bؾy��V��=��&qV�_�o����3�ą�z(�V)\�SL����� �&?�      �   �  x���[�!E�۫�ت��2Bi� �+t���>�K��������~���m�Z�� �8�-��c����͕�+�k�x~bߔ̥0Ώ��.�ɏ����p�Q��������V�RY!��9?l!�%�1�k��r��o7��F�Z(�2�d%�'��F�Cr�)�R�+%/��y��7ű��+B�"�nn�o���m_�1fE��
QƯ{L5��ˎ�aflf����B~����:��.�4'7�u���-�϶*�4�9�k&Ko��d�9�_(A���XG���0l��e9�>n$�_����c��5����h�?ˁR$�����m"P�"�9{�ܒ�G�C:.AIn�%���9
�P�o��4�L���ՓTѣR%�6HK��oZ�L:T��1߃�-�� t�!
l��E3����h ��q��Lhj�Ȱ9G�`@#8��*	��
�*��P�����N�?�W��         @  x��Gn�@ E�����)��E�y��h3ʆb<���A��!��Sd����ӻ]�s6ܓ�|����U �[�aW^���4:�5���$ը�0��d��N|Ѱ)lh�;�����1E/1';Ey�$����`n�"��&k̒E�GZM�K��N�2������8&y�8�Z��e���ؤ[G0�hR���S��v3;
�	�����H6�KGP�V����)��@�r+no5Ve�N5�r;���P�H�@c	�%�/а�f�2U]7�%�J�N�',�Wq�jwJ�ڛPo�w��LC�����᷻���(_&�Q      �   i  x���1N�@E��Sp�D3�3��:�&�)��ʅ8cB�@|�ƍ����ų.E�(R��e�ߞ.�׏�}��&���xy~�+���n��y_KkU'	6aAe�Ƃ����h����~=���q=w����Z��D)����CC=�p��z8�C�P�CԌ�f5c�C�j�P3��qԌ�f5�G�8j�Q3��qԌ�f5��@�j&P3��	�L�f5������������������*g�4A.K{]�,M����,M����,M�����,�Qm�QU�U��N!9�J�k$�I�H�I���͑{��^&�r0*�bT�ɨ��Q!G�B�F���
�r8*�r�\�˱��	%���         �   x�����0E��W�����Kq g�hܨ" p~����n�='9H�e��vw]ڕ��B��3�`�MG�Yh�tm������tऌ��v+�0��04��/��K�2(�Y�5��`p1Xsy[��)���t�(A)�]��Jڭ��r2����d�����Au2��ֽ�O5 G(�	C��*���7�P�v��K7��Ϯ`          �  x�e�˒�@ �u���V7(t�Cp�Vy�f�"OAނ~}&�,2��ֽ�[�>��2�J��8�/l��4]�T���Y(tN1V�8�E�>c�Y׍U{�Њ�;Ə���k��<���*6I)|��ރck����dm��;�����ؑ�9����o�G��O�Z�۰��1�+��v�Ώ0Q
��Q��v0� ޙ��v�G׹=��/���d���',�5!x�����H<�8��G��:C ���F�[#�%s� �.�2v%�8n,��Yr�/�?$a�}�E�F��2'�ޕ���>x;�r��x5/����\���vo�?-֬�=s��g��l��Zۄr�2�Q̵�8e@S?����xJ�c+���;�G���i֎�[Ո�jP~���σ��P��o�I+,!�$��H����f?#o��            x������ � �         �   x�}��
�@����S�s��t�%h�k���"�l���*�8���� o���|�ޙ �Wϝpn2�^E�a�T{FC�� �q-�
$ �����3�˲�>ex��6MY�[��ƫ:�~@� hG,%@KMV��W�읥�i�qr{^���9�zԯ���3��v	۲	t��U~��/�D�      �       x���4400�30�tN,*��42����� <��      �   #   x���4400�30�N�9��(3��Ȉ+F��� ]��      �   �   x�-��
�@E��S�p�73:�@�TK�D1:�������ugs�.�eN�C)��t��4���v.Q7z(s�Z����Ň�+�ڝ����"#�t� ���9������
��bԴ	0f E
	�To̬���h�x)�{�ͬm&W�cl�ٜ8��M�0�S�j7SӴ/=s56      �      x������ � �      �      x������ � �     