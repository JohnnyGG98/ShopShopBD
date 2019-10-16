CREATE TABLE "Usuarios"(
  id_usuario BIGSERIAL NOT NULL,
  user_nick character varying(50) NOT NULL UNIQUE,
  user_pass character varying(100) NOT NULL,
  user_tipo character varying(1) NOT NULL DEFAULT 'C',
  user_activo BOOLEAN NOT NULL DEFAULT 'true',
  CONSTRAINT usuario_pk PRIMARY KEY("id_usuario")
) WITH (OIDS = FALSE);

CREATE TABLE "Roles"(
  id_rol INT NOT NULL,
  rol_nombre CHARACTER VARYING(50) NOT NULL,
  rol_activo BOOLEAN NOT NULL DEFAULT 'true',
  CONSTRAINT rol_pk PRIMARY KEY("id_rol")
) WITH (OIDS = FALSE);
