CREATE TABLE "Personas"(
  id_persona BIGSERIAL NOT NULL,
  id_usuario INT NOT NULL,
  id_tipo_identificacion INT NOT NULL,
  per_primer_nombre character varying(75) NOT NULL,
  per_segundo_nombre character varying(75) DEFAULT '',
  per_primer_apellido character varying(75) NOT NULL,
  per_segundo_apellido character varying(75) DEFAULT '',
  per_identificacion character varying(15) NOT NULL,
  per_correo character varying(50) NOT NULL,
  per_sexo character varying(50) NOT NULL,
  per_fecha_registro TIMESTAMP DEFAULT now(),
  per_activo BOOLEAN DEFAULT 'true',
  CONSTRAINT persona_pk PRIMARY KEY("id_persona")
) WITH (OIDS = FALSE);


CREATE TABLE "Vendedores" (
  id_vendedor BIGSERIAL NOT NULL,
  id_persona BIGINT NOT NULL,
  vend_max_productos INT NOT NULL,
  vend_descripcion TEXT NOT NULL DEFAULT '',
  vend_activo BOOLEAN DEFAULT 'true',
  CONSTRAINT vendedor_pk PRIMARY KEY ("id_vendedor")
) WITH (OIDS = FALSE);

CREATE TABLE "Locales" (
  id_local BIGSERIAL NOT NULL,
  id_vendedor BIGINT NOT NULL,
  loc_correo character varying(50) NOT NULL,
  loc_calle_principal character varying(150) NOT NULL,
  loc_calle_secundaria character varying(150) NOT NULL,
  loc_activo BOOLEAN DEFAULT 'true',
  CONSTRAINT local_pk PRIMARY KEY ("id_local")
) WITH (OIDS = FALSE);

CREATE TABLE "Clientes"(
  id_cliente BIGSERIAL NOT NULL,
  id_persona BIGINT NOT NULL,
  cli_fecha_nacimiento DATE NOT NULL,
  cli_activo BOOLEAN DEFAULT 'true',
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

CREATE TABLE "TiposIdentificacion" (
  id_tipo_identificacion INT NOT NULL,
  tiid_nombre CHARACTER VARYING(10),
  tiid_activo BOOLEAN NOT NULL DEFAULT 'true',
  CONSTRAINT tipo_identificacion_pk PRIMARY KEY("id_tipo_identificacion")
) WITH (OIDS = FALSE);
