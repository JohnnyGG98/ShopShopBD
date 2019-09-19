CREATE TABLE "Usuarios"(
  id_usuario BIGSERIAL NOT NULL,
  id_rol INT NOT NULL,
  user_nick character varying(50) NOT NULL UNIQUE,
  user_pass bytea NOT NULL,
  CONSTRAINT usuario_pk PRIMARY KEY("id_usuario")
) WITH (OIDS = FALSE);

CREATE TABLE "Roles"(
  id_rol INT NOT NULL,
  rol_nombre CHARACTER VARYING(50) NOT NULL,
  rol_activo BOOLEAN NOT NULL DEFAULT 'true',
  CONSTRAINT rol_pk PRIMARY KEY("id_rol")
) WITH (OIDS = FALSE);
