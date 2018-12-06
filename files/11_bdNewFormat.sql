

DROP TABLE IF EXISTS "DBO"."USUARIO_ROL" CASCADE;
DROP TABLE IF EXISTS "DBO"."USUARIO_TABLA" CASCADE;
DROP TABLE IF EXISTS "DBO"."ASIGNACION" CASCADE;
DROP TABLE IF EXISTS "DBO"."CONEXION" CASCADE;
DROP TABLE IF EXISTS "DBO"."TABLA" CASCADE;
DROP TABLE IF EXISTS "DBO"."USUARIO" CASCADE;
DROP TABLE IF EXISTS "DBO"."ROL" CASCADE;
--
-- PostgreSQL database dump
--

-- Dumped from database version 9.0.4
-- Dumped by pg_dump version 9.0.4
-- Started on 2018-06-21 14:42:01

SET client_encoding = 'UTF8';

--
-- TOC entry 7 (class 2615 OID 27100)
-- Name: ODS; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA "ODS";

ALTER SCHEMA "ODS" OWNER TO postgres;

--
-- TOC entry 325 (class 2612 OID 11574)
-- Name: plpgsql; Type: PROCEDURAL LANGUAGE; Schema: -; Owner: postgres
--

SET search_path = "ODS", pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 1517 (class 1259 OID 27101)
-- Dependencies: 7
-- Name: CTRL_CONEXIONES; Type: TABLE; Schema: ODS; Owner: postgres; Tablespace: 
--

CREATE TABLE "CTRL_CONEXIONES" (
    id bigint NOT NULL,
    version bigint NOT NULL,
    tns character varying(191),
    servidor character varying(191),
    descripcion_esquema character varying(191),
    usuario character varying(191) NOT NULL,
    contrasena character varying(191) NOT NULL,
    esquema character varying(191) NOT NULL,
    servicio character varying(191),
    base_datos character varying(191)
);


--ALTER TABLE "ODS"."CTRL_CONEXIONES" OWNER TO postgres;

--
-- TOC entry 1518 (class 1259 OID 27109)
-- Dependencies: 7
-- Name: CTRL_ROLES; Type: TABLE; Schema: ODS; Owner: postgres; Tablespace: 
--

CREATE TABLE "CTRL_ROLES" (
    id bigint NOT NULL,
    version bigint NOT NULL,
    authority character varying(255) NOT NULL
);


--ALTER TABLE "ODS"."CTRL_ROLES" OWNER TO postgres;

--
-- TOC entry 1519 (class 1259 OID 27114)
-- Dependencies: 7
-- Name: CTRL_TABLAS_ODS; Type: TABLE; Schema: ODS; Owner: postgres; Tablespace: 
--

CREATE TABLE "CTRL_TABLAS_ODS" (
    id bigint NOT NULL,
    version bigint NOT NULL,
    fecha_inicio timestamp without time zone NOT NULL,
    nombre_tabla character varying(191) NOT NULL,
    truncate boolean NOT NULL,
    id_conexion bigint NOT NULL,
    descripcion_tabla text NOT NULL,
    fecha_fin timestamp without time zone NOT NULL
);


--ALTER TABLE "ODS"."CTRL_TABLAS_ODS" OWNER TO postgres;

--
-- TOC entry 1520 (class 1259 OID 27122)
-- Dependencies: 7
-- Name: CTRL_USER_ASIGNACIONES; Type: TABLE; Schema: ODS; Owner: postgres; Tablespace: 
--

CREATE TABLE "CTRL_USER_ASIGNACIONES" (
    id bigint NOT NULL,
    version bigint NOT NULL,
    fecha_inicio timestamp without time zone NOT NULL,
    id_usuario bigint NOT NULL,
    estado boolean NOT NULL,
    fecha_fin timestamp without time zone NOT NULL
);


--ALTER TABLE "ODS"."CTRL_USER_ASIGNACIONES" OWNER TO postgres;

--
-- TOC entry 1521 (class 1259 OID 27127)
-- Dependencies: 7
-- Name: CTRL_USUARIOS; Type: TABLE; Schema: ODS; Owner: postgres; Tablespace: 
--

CREATE TABLE "CTRL_USUARIOS" (
    id bigint NOT NULL,
    version bigint NOT NULL,
    password_expired boolean NOT NULL,
    username character varying(255) NOT NULL,
    account_locked boolean NOT NULL,
    password character varying(255) NOT NULL,
    account_expired boolean NOT NULL,
    enabled boolean NOT NULL
);


--ALTER TABLE "ODS"."CTRL_USUARIOS" OWNER TO postgres;

--
-- TOC entry 1522 (class 1259 OID 27135)
-- Dependencies: 7
-- Name: CTRL_USUARIOS_ROL; Type: TABLE; Schema: ODS; Owner: postgres; Tablespace: 
--

CREATE TABLE "CTRL_USUARIOS_ROL" (
    usuario_id bigint NOT NULL,
    rol_id bigint NOT NULL
);


--ALTER TABLE "ODS"."CTRL_USUARIOS_ROL" OWNER TO postgres;

--
-- TOC entry 1523 (class 1259 OID 27140)
-- Dependencies: 7
-- Name: CTRL_USUARIOS_TABLA; Type: TABLE; Schema: ODS; Owner: postgres; Tablespace: 
--

CREATE TABLE "CTRL_USUARIOS_TABLA" (
    id bigint NOT NULL,
    version bigint NOT NULL,
    asignacion_id bigint NOT NULL,
    usuario_id bigint NOT NULL,
    tabla_id bigint NOT NULL
);


--ALTER TABLE "ODS"."CTRL_USUARIOS_TABLA" OWNER TO postgres;

--
-- TOC entry 1524 (class 1259 OID 27184)
-- Dependencies: 7
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: ODS; Owner: postgres
--

--CREATE SEQUENCE hibernate_sequence
--    START WITH 4
--    INCREMENT BY 1
--    NO MINVALUE
--    NO MAXVALUE
--    CACHE 1;


--ALTER TABLE "ODS".hibernate_sequence OWNER TO postgres;

--
-- TOC entry 1840 (class 0 OID 0)
-- Dependencies: 1524
-- Name: hibernate_sequence; Type: SEQUENCE SET; Schema: ODS; Owner: postgres
--



SET search_path = public, pg_catalog;

--
-- TOC entry 1525 (class 1259 OID 27186)
-- Dependencies: 5
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: public; Owner: postgres
--

DO
$do$
DECLARE
   _kind "char";
BEGIN
   SELECT relkind
   FROM   pg_class
   WHERE  oid::varchar = 'hibernate_sequence'  -- sequence name, optionally schema-qualified
   INTO  _kind;

   IF NOT FOUND THEN       -- name is free
      CREATE SEQUENCE hibernate_sequence
	    START WITH 1
	    INCREMENT BY 1
	    NO MINVALUE
	    NO MAXVALUE
	    CACHE 1;
   ELSIF _kind = 'S' THEN  -- sequence exists
      -- do nothing?
   ELSE                    -- object name exists for different kind
      -- do something!
   END IF;
END
$do$;

--ALTER TABLE public.hibernate_sequence OWNER TO postgres;

--
-- TOC entry 1841 (class 0 OID 0)
-- Dependencies: 1525
-- Name: hibernate_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('hibernate_sequence', 4, true);


SET search_path = "ODS", pg_catalog;

--
-- TOC entry 1828 (class 0 OID 27101)
-- Dependencies: 1517
-- Data for Name: CTRL_CONEXIONES; Type: TABLE DATA; Schema: ODS; Owner: postgres
--



--
-- TOC entry 1829 (class 0 OID 27109)
-- Dependencies: 1518
-- Data for Name: CTRL_ROLES; Type: TABLE DATA; Schema: ODS; Owner: postgres
--

INSERT INTO "CTRL_ROLES" VALUES (2, 0, 'ROLE_ROYALTY');
INSERT INTO "CTRL_ROLES" VALUES (3, 0, 'ROLE_COMMON');


--
-- TOC entry 1830 (class 0 OID 27114)
-- Dependencies: 1519
-- Data for Name: CTRL_TABLAS_ODS; Type: TABLE DATA; Schema: ODS; Owner: postgres
--



--
-- TOC entry 1831 (class 0 OID 27122)
-- Dependencies: 1520
-- Data for Name: CTRL_USER_ASIGNACIONES; Type: TABLE DATA; Schema: ODS; Owner: postgres
--



--
-- TOC entry 1832 (class 0 OID 27127)
-- Dependencies: 1521
-- Data for Name: CTRL_USUARIOS; Type: TABLE DATA; Schema: ODS; Owner: postgres
--

INSERT INTO "CTRL_USUARIOS" VALUES (1, 0, false, 'admin', false, '$2a$10$kFi1YxdWpcdU/3lT0d0YFO.2Cycw3Q00ZA8YF5G4RtIKisJgmAQX.', false, true);


--
-- TOC entry 1833 (class 0 OID 27135)
-- Dependencies: 1522
-- Data for Name: CTRL_USUARIOS_ROL; Type: TABLE DATA; Schema: ODS; Owner: postgres
--

INSERT INTO "CTRL_USUARIOS_ROL" VALUES (1, 2);
INSERT INTO "CTRL_USUARIOS_ROL" VALUES (1, 3);


--
-- TOC entry 1834 (class 0 OID 27140)
-- Dependencies: 1523
-- Data for Name: CTRL_USUARIOS_TABLA; Type: TABLE DATA; Schema: ODS; Owner: postgres
--



--
-- TOC entry 1804 (class 2606 OID 27108)
-- Dependencies: 1517 1517
-- Name: CTRL_CONEXIONES_pkey; Type: CONSTRAINT; Schema: ODS; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "CTRL_CONEXIONES"
    ADD CONSTRAINT "CTRL_CONEXIONES_pkey" PRIMARY KEY (id);


--
-- TOC entry 1806 (class 2606 OID 27113)
-- Dependencies: 1518 1518
-- Name: CTRL_ROLES_pkey; Type: CONSTRAINT; Schema: ODS; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "CTRL_ROLES"
    ADD CONSTRAINT "CTRL_ROLES_pkey" PRIMARY KEY (id);


--
-- TOC entry 1810 (class 2606 OID 27121)
-- Dependencies: 1519 1519
-- Name: CTRL_TABLAS_ODS_pkey; Type: CONSTRAINT; Schema: ODS; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "CTRL_TABLAS_ODS"
    ADD CONSTRAINT "CTRL_TABLAS_ODS_pkey" PRIMARY KEY (id);


--
-- TOC entry 1812 (class 2606 OID 27126)
-- Dependencies: 1520 1520
-- Name: CTRL_USER_ASIGNACIONES_pkey; Type: CONSTRAINT; Schema: ODS; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "CTRL_USER_ASIGNACIONES"
    ADD CONSTRAINT "CTRL_USER_ASIGNACIONES_pkey" PRIMARY KEY (id);


--
-- TOC entry 1818 (class 2606 OID 27139)
-- Dependencies: 1522 1522 1522
-- Name: CTRL_USUARIOS_ROL_pkey; Type: CONSTRAINT; Schema: ODS; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "CTRL_USUARIOS_ROL"
    ADD CONSTRAINT "CTRL_USUARIOS_ROL_pkey" PRIMARY KEY (usuario_id, rol_id);


--
-- TOC entry 1820 (class 2606 OID 27144)
-- Dependencies: 1523 1523
-- Name: CTRL_USUARIOS_TABLA_pkey; Type: CONSTRAINT; Schema: ODS; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "CTRL_USUARIOS_TABLA"
    ADD CONSTRAINT "CTRL_USUARIOS_TABLA_pkey" PRIMARY KEY (id);


--
-- TOC entry 1814 (class 2606 OID 27134)
-- Dependencies: 1521 1521
-- Name: CTRL_USUARIOS_pkey; Type: CONSTRAINT; Schema: ODS; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "CTRL_USUARIOS"
    ADD CONSTRAINT "CTRL_USUARIOS_pkey" PRIMARY KEY (id);


--
-- TOC entry 1816 (class 2606 OID 27148)
-- Dependencies: 1521 1521
-- Name: uk_i8s8n15u3kfbgca7f3nonueji; Type: CONSTRAINT; Schema: ODS; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "CTRL_USUARIOS"
    ADD CONSTRAINT uk_i8s8n15u3kfbgca7f3nonueji UNIQUE (username);


--
-- TOC entry 1808 (class 2606 OID 27146)
-- Dependencies: 1518 1518
-- Name: uk_k7n93ap90jgr7ttibcs2ue8ml; Type: CONSTRAINT; Schema: ODS; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "CTRL_ROLES"
    ADD CONSTRAINT uk_k7n93ap90jgr7ttibcs2ue8ml UNIQUE (authority);


--
-- TOC entry 1823 (class 2606 OID 27159)
-- Dependencies: 1813 1521 1522
-- Name: fk926dxhvitbkexpyuhj6q8wqkt; Type: FK CONSTRAINT; Schema: ODS; Owner: postgres
--

ALTER TABLE ONLY "CTRL_USUARIOS_ROL"
    ADD CONSTRAINT fk926dxhvitbkexpyuhj6q8wqkt FOREIGN KEY (usuario_id) REFERENCES "CTRL_USUARIOS"(id);


--
-- TOC entry 1827 (class 2606 OID 27179)
-- Dependencies: 1523 1519 1809
-- Name: fkeu4njwkv1ueute46phqn9wohd; Type: FK CONSTRAINT; Schema: ODS; Owner: postgres
--

ALTER TABLE ONLY "CTRL_USUARIOS_TABLA"
    ADD CONSTRAINT fkeu4njwkv1ueute46phqn9wohd FOREIGN KEY (tabla_id) REFERENCES "CTRL_TABLAS_ODS"(id);


--
-- TOC entry 1825 (class 2606 OID 27169)
-- Dependencies: 1520 1811 1523
-- Name: fkguv7gctm0x0m318l3y2ya8vtm; Type: FK CONSTRAINT; Schema: ODS; Owner: postgres
--

ALTER TABLE ONLY "CTRL_USUARIOS_TABLA"
    ADD CONSTRAINT fkguv7gctm0x0m318l3y2ya8vtm FOREIGN KEY (asignacion_id) REFERENCES "CTRL_USER_ASIGNACIONES"(id);


--
-- TOC entry 1824 (class 2606 OID 27164)
-- Dependencies: 1805 1522 1518
-- Name: fkiwt8javednl44k3u5ex0b0lif; Type: FK CONSTRAINT; Schema: ODS; Owner: postgres
--

ALTER TABLE ONLY "CTRL_USUARIOS_ROL"
    ADD CONSTRAINT fkiwt8javednl44k3u5ex0b0lif FOREIGN KEY (rol_id) REFERENCES "CTRL_ROLES"(id);


--
-- TOC entry 1822 (class 2606 OID 27154)
-- Dependencies: 1813 1520 1521
-- Name: fkkurx11p1mpdu5cqailuc0i8o3; Type: FK CONSTRAINT; Schema: ODS; Owner: postgres
--

ALTER TABLE ONLY "CTRL_USER_ASIGNACIONES"
    ADD CONSTRAINT fkkurx11p1mpdu5cqailuc0i8o3 FOREIGN KEY (id_usuario) REFERENCES "CTRL_USUARIOS"(id);


--
-- TOC entry 1821 (class 2606 OID 27149)
-- Dependencies: 1519 1803 1517
-- Name: fkl3b6c3hn4hh5fmqdelo7i4d0u; Type: FK CONSTRAINT; Schema: ODS; Owner: postgres
--

ALTER TABLE ONLY "CTRL_TABLAS_ODS"
    ADD CONSTRAINT fkl3b6c3hn4hh5fmqdelo7i4d0u FOREIGN KEY (id_conexion) REFERENCES "CTRL_CONEXIONES"(id);


--
-- TOC entry 1826 (class 2606 OID 27174)
-- Dependencies: 1523 1813 1521
-- Name: fkoxwv4rxik103y0uyympkgfkkd; Type: FK CONSTRAINT; Schema: ODS; Owner: postgres
--

ALTER TABLE ONLY "CTRL_USUARIOS_TABLA"
    ADD CONSTRAINT fkoxwv4rxik103y0uyympkgfkkd FOREIGN KEY (usuario_id) REFERENCES "CTRL_USUARIOS"(id);

	
-----------------------------------CONEXIONES---------------------------------------------------
COMMENT ON TABLE "ODS"."CTRL_CONEXIONES" IS 'Guarda los datos de las conexiones';
COMMENT ON COLUMN "ODS"."CTRL_CONEXIONES".id IS 'Id de la conexion';
COMMENT ON COLUMN "ODS"."CTRL_CONEXIONES".version  IS 'Campo del framework para el versionamiento';
COMMENT ON COLUMN "ODS"."CTRL_CONEXIONES".tns  IS 'TNS (net service names) nombre de servicios Oracle';
COMMENT ON COLUMN "ODS"."CTRL_CONEXIONES".servidor IS 'Ip:puerto del servidor de base de datos';
COMMENT ON COLUMN "ODS"."CTRL_CONEXIONES".usuario  IS 'Nombre del usuario de la base de datos';
COMMENT ON COLUMN "ODS"."CTRL_CONEXIONES".contrasena IS 'contrasena de la base de datos ';
COMMENT ON COLUMN "ODS"."CTRL_CONEXIONES".esquema IS 'Esquema de la base de datos';
COMMENT ON COLUMN "ODS"."CTRL_CONEXIONES".servicio IS 'Servicio de la base de datos ';
COMMENT ON COLUMN "ODS"."CTRL_CONEXIONES".descripcion_esquema IS 'Descripcion de la base de datos';
COMMENT ON COLUMN "ODS"."CTRL_CONEXIONES".base_datos IS 'Nombre de la base de datosBase de datos ';
--------------------------------------Usuario Tabla ---------------------------------------------------------------
COMMENT ON TABLE "ODS"."CTRL_USUARIOS_TABLA" IS 'Tabla intermedia entre usuarios y tablas asignadas';
COMMENT ON COLUMN "ODS"."CTRL_USUARIOS_TABLA".id IS ' Id de la tabla intermedia';
COMMENT ON COLUMN "ODS"."CTRL_USUARIOS_TABLA".version IS 'Campo del framework para el versionamiento';
COMMENT ON COLUMN "ODS"."CTRL_USUARIOS_TABLA".asignacion_id IS 'Llave foranea de la tabla asignacion';
COMMENT ON COLUMN "ODS"."CTRL_USUARIOS_TABLA".usuario_id IS 'Llave foranea de la tabla usuario';
COMMENT ON COLUMN "ODS"."CTRL_USUARIOS_TABLA".tabla_id IS 'Llave foranea de la tabla';
------------------------------------------------------------------------------------------------------------
COMMENT ON TABLE "ODS"."CTRL_USUARIOS_ROL" IS 'Tabla intermedia entre usuarios y los roles ';
COMMENT ON COLUMN "ODS"."CTRL_USUARIOS_ROL".usuario_id IS ' Llave foranea de la tabla usuario ';
COMMENT ON COLUMN "ODS"."CTRL_USUARIOS_ROL".rol_id IS ' llave foranea de la tabla rol ';
------------------------------------------------------------------------------------------------------------------------
COMMENT ON TABLE "ODS"."CTRL_USUARIOS" IS 'Contiene la informacion de los usuario';
COMMENT ON COLUMN "ODS"."CTRL_USUARIOS".id IS ' Id de los usuarios ';
COMMENT ON COLUMN "ODS"."CTRL_USUARIOS".version IS 'Campo del framework para el versionamiento';
COMMENT ON COLUMN "ODS"."CTRL_USUARIOS".password_expired IS 'Expiracion de la contrasena';
COMMENT ON COLUMN "ODS"."CTRL_USUARIOS".username IS ' nombre del usuario';
COMMENT ON COLUMN "ODS"."CTRL_USUARIOS".account_locked IS ' Cuenta bloqueada ';
COMMENT ON COLUMN "ODS"."CTRL_USUARIOS".password IS ' contrasena del usuario ';
COMMENT ON COLUMN "ODS"."CTRL_USUARIOS".account_expired IS 'Expiracion del la cuenta del usuario';
COMMENT ON COLUMN "ODS"."CTRL_USUARIOS".enabled IS ' Estado el usuario';
------------------------------------------ASIGNACIONES-------------------------------------------------------------------
COMMENT ON TABLE "ODS"."CTRL_USER_ASIGNACIONES" IS 'Contiene el usuario que sera asinado a las tablas elegidas ';
COMMENT ON COLUMN "ODS"."CTRL_USER_ASIGNACIONES".id IS 'Id de la asignacion ';
COMMENT ON COLUMN "ODS"."CTRL_USER_ASIGNACIONES".version IS ' Campo del framework para el versionamiento ';
COMMENT ON COLUMN "ODS"."CTRL_USER_ASIGNACIONES".fecha_inicio IS 'Fecha de inicion de la validez de la asignacion';
COMMENT ON COLUMN "ODS"."CTRL_USER_ASIGNACIONES".id_usuario IS 'Id foranea del usuario ';
COMMENT ON COLUMN "ODS"."CTRL_USER_ASIGNACIONES".fecha_fin IS ' fecha fin de la validez de la asignacion';
COMMENT ON COLUMN "ODS"."CTRL_USER_ASIGNACIONES".estado IS 'Campo para ver el estado de la asignacion';	
------------------------------------Tablas------------------------------------------------------------------------------
COMMENT ON TABLE "ODS"."CTRL_TABLAS_ODS" IS 'Contiene las tablas de las conexiones';
COMMENT ON COLUMN "ODS"."CTRL_TABLAS_ODS".id IS 'Id de la tabla';
COMMENT ON COLUMN "ODS"."CTRL_TABLAS_ODS".version IS ' Campo del framework para el versionamiento ';
COMMENT ON COLUMN "ODS"."CTRL_TABLAS_ODS".fecha_inicio IS ' Fecha inicio de la validez de la tabla';
COMMENT ON COLUMN "ODS"."CTRL_TABLAS_ODS".nombre_tabla IS ' Nombre de la tabla en la conexion ';
COMMENT ON COLUMN "ODS"."CTRL_TABLAS_ODS".descripcion_tabla IS ' Descripcion de la tabla ';
COMMENT ON COLUMN "ODS"."CTRL_TABLAS_ODS".fecha_fin IS 'Fecha fin de la validez de la tabla';

----------------------------------------------ROLES---------------------------------------------------------------
COMMENT ON TABLE "ODS"."CTRL_ROLES" IS 'Contiene los roles de la aplicacion Web ';
COMMENT ON COLUMN "ODS"."CTRL_ROLES".id IS 'Id del rol ';
COMMENT ON COLUMN "ODS"."CTRL_ROLES".version IS ' Campo del framework para el versionamiento ';
COMMENT ON COLUMN "ODS"."CTRL_ROLES".authority IS ' Nombre de los roles   ';
 



-- Completed on 2018-06-21 14:42:02

--
-- PostgreSQL database dump complete
--

