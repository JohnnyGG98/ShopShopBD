
CREATE TABLE "personas"(
  id_persona BIGSERIAL NOT NULL,
  per_primer_nombre character varying(75) NOT NULL,
  per_segundo_nombre character varying(75) DEFAULT '',
  per_primer_apellido character varying(75) NOT NULL,
  per_segundo_apellido character varying(75) DEFAULT '',
  per_identificacion character varying(15) NOT NULL,
  per_correo character varying(50) NOT NULL,
  per_sexo character varying(50) NOT NULL,
  CONSTRAINT persona_pk PRIMARY KEY("id_persona")
) WITH (OIDS = FALSE);

CREATE TABLE "vendedores" (
  id_vendedor BIGSERIAL NOT NULL,
  id_persona BIGINT NOT NULL,
  vend_max_productos INT NOT NULL,
  CONSTRAINT vendedor_pk PRIMARY KEY ("id_vendedor")
) WITH (OIDS = FALSE);

CREATE TABLE "locales" (
  id_local BIGSERIAL NOT NULL,
  id_vendedor BIGINT NOT NULL,
  loc_correo character varying(50) NOT NULL,
  loc_calle_principal character varying(150) NOT NULL,
  loc_calle_secundaria character varying(150) NOT NULL,
  CONSTRAINT local_pk PRIMARY KEY ("id_local")
) WITH (OIDS = FALSE);
