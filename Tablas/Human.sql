CREATE TABLE "Personas"(
  id_persona BIGSERIAL NOT NULL,
  per_primer_nombre character varying(75) NOT NULL,
  per_segundo_nombre character varying(75) DEFAULT '',
  per_primer_apellido character varying(75) NOT NULL,
  per_segundo_apellido character varying(75) DEFAULT '',
  per_identificacion character varying(15) NOT NULL,
  per_correo character varying(50) NOT NULL,
  per_sexo character varying(50) NOT NULL,
  per_fecha_registro TIMESTAMP DEFAULT now(),
  CONSTRAINT persona_pk PRIMARY KEY("id_persona")
) WITH (OIDS = FALSE);

CREATE TABLE "Usuarios"(
  id_usuario BIGSERIAL NOT NULL,
  id_persona BIGINT NOT NULL,
  user_nick character varying(50) NOT NULL UNIQUE,
  user_pass bytea NOT NULL,
  CONSTRAINT usuario_pk PRIMARY KEY("id_usuario")
) WITH (OIDS = FALSE);

CREATE TABLE "Vendedores" (
  id_vendedor BIGSERIAL NOT NULL,
  id_usuario BIGINT NOT NULL,
  vend_max_productos INT NOT NULL,
  CONSTRAINT vendedor_pk PRIMARY KEY ("id_vendedor")
) WITH (OIDS = FALSE);

CREATE TABLE "Locales" (
  id_local BIGSERIAL NOT NULL,
  id_vendedor BIGINT NOT NULL,
  loc_correo character varying(50) NOT NULL,
  loc_calle_principal character varying(150) NOT NULL,
  loc_calle_secundaria character varying(150) NOT NULL,
  CONSTRAINT local_pk PRIMARY KEY ("id_local")
) WITH (OIDS = FALSE);

CREATE TABLE "Clientes"(
  id_cliente BIGSERIAL NOT NULL,
  id_usuario BIGINT NOT NULL,
  cli_fecha_nacimiento DATE NOT NULL,
  CONSTRAINT cliente_pk PRIMARY KEY ("id_cliente")
) WITH (OIDS = FALSE);

CREATE TABLE "Calificaciones" (
  id_calificacion BIGSERIAL NOT NULL,
  id_cliente BIGINT NOT NULL,
  id_producto BIGINT NOT NULL,
  calificacion NUMERIC(2, 2),
  cal_activo BOOLEAN DEFAULT 'true',
  CONSTRAINT calificacion_pk PRIMARY KEY("id_calificacion")
) WITH (OIDS = FALSE);

CREATE TABLE "Preferencias"(
  id_preferencia BIGSERIAL NOT NULL,
  id_cliente BIGINT NOT NULL,
  id_categoria BIGINT NOT NULL,
  pref_fecha_ingreso DATE NOT NULL DEFAULT now(),
  pref_activo BOOLEAN NOT NULL DEFAULT 'true',
  CONSTRAINT preferencia_pk PRIMARY KEY("id_preferencia")
) WITH (OIDS = FALSE);

CREATE TABLE "Recomendaciones" (
  id_recomendacion BIGSERIAL NOT NULL,
  id_cliente BIGINT NOT NULL,
  recomendacion CHARACTER VARYING(255) NOT NULL,
  reco_activo BOOLEAN NOT NULL DEFAULT 'true',
  CONSTRAINT recomendacion_pk PRIMARY KEY("id_recomendacion")
) WITH (OIDS = FALSE);

CREATE TABLE "ProductosDeseados" (
  id_producto_deseado BIGSERIAL NOT NULL,
  id_cliente BIGINT NOT NULL,
  id_producto BIGINT NOT NULL,
  prde_fecha_ingreso DATE NOT NULL DEFAULT now(),
  prde_activo BOOLEAN NOT NULL DEFAULT 'true',
  CONSTRAINT producto_deseado_pk PRIMARY KEY("id_producto_deseado")
) WITH (OIDS = FALSE);
