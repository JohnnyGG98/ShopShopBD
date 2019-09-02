CREATE TABLE "admins"(
  id_admin BIGSERIAL NOT NULL,
  adm_user CHARACTER VARYING(255) NOT NULL,
  adm_pass BYTEA NOT NULL,
  adm_activo BOOLEAN DEFAULT 'true',
  CONSTRAINT admin_pk PRIMARY KEY ("id_admin")
) WITH (OIDS = FALSE);

CREATE TABLE "historial_rutas_admin"(
  id_historial_ruta_admin BIGSERIAL NOT NULL,
  id_admin BIGINT NOT NULL,
  hiru_ruta CHARACTER VARYING (255) NOT NULL,
	hiru_activo BOOLEAN DEFAULT 'true'
  CONSTRAINT historial_ruta_pk PRIMARY KEY ("id_historial_ruta")
) WITH (OIDS = FALSE);

CREATE TABLE "premisos"(
	id_premiso BIGSERIAL NOT NULL,
	id_admin BIGINT NOT NULL,
	id_ruta serial NOT NULL,
	prem_activo BOOLEAN DEFAULT 'true'
CONSTRAINT premiso_pk PRIMARY KEY ("id_premiso")
) WITH (OIDS = FALSE);

CREATE TABLE "rutas" (
  id_ruta serial NOT NULL,
	rut_url CHARACTER VARYING (255) NOT NULL,
	rut_activo BOOLEAN NOT NULL,
	rut_activo BOOLEAN DEFAULT 'true',
  CONSTRAINT ruta_pk PRIMARY KEY ("id_ruta")
) WITH (OIDS = FALSE);

CREATE TABLE "clientes_bloqueados"(
	id_cliente_bloqueado BIGSERIAL NOT NULL,
  id_cliente BIGINT NOT NULL,
	clbl_fecha_bloqueo TIMESTAMP DEFAULT,
	clbl_motivo_bloqueo CHARACTER VARYING(300) NOT NULL,
	clbl_activo BOOLEAN DEFAULT 'true',
	CONSTRAINT cliente_bloqueado_pk PRIMARY KEY ("id_cliente_bloqueado")
) WITH (OIDS = FALSE);


CREATE TABLE "comentarios_bloqueados"(
  id_comentario_bloqueado BIGSERIAL NOT NULL,
  id_comentario BIGINT NOT NULL,
  cobl_fecha_bloqueo  TIMESTAMP DEFAULT now(),
  cobl_motivo_bloqueo CHARACTER VARYING (255) NOT NULL,
  cobl_activo BOOLEAN DEFAULT 'true',
  CONSTRAINT comentarios_bloqueados_pk PRIMARY KEY ("id_comentarios_bloqueados")
) WITH (OIDS = FALSE);
