CREATE TABLE "Admins"(
  id_admin BIGSERIAL NOT NULL,
  adm_user CHARACTER VARYING(255) NOT NULL,
  adm_pass BYTEA NOT NULL,
  adm_activo BOOLEAN DEFAULT 'true',
  CONSTRAINT admin_pk PRIMARY KEY ("id_admin")
) WITH (OIDS = FALSE);

CREATE TABLE "HistorialRutasAdmin"(
  id_historial_ruta_admin BIGSERIAL NOT NULL,
  id_admin BIGINT NOT NULL,
  hiru_ruta CHARACTER VARYING (255) NOT NULL,
	hiru_activo BOOLEAN DEFAULT 'true',
  CONSTRAINT historial_ruta_pk PRIMARY KEY ("id_historial_ruta_admin")
) WITH (OIDS = FALSE);

CREATE TABLE "Permisos"(
	id_permiso BIGSERIAL NOT NULL,
	id_admin BIGINT NOT NULL,
	id_ruta serial NOT NULL,
	prem_activo BOOLEAN DEFAULT 'true',
CONSTRAINT premiso_pk PRIMARY KEY ("id_permiso")
) WITH (OIDS = FALSE);

CREATE TABLE "Rutas" (
  id_ruta serial NOT NULL,
	rut_url CHARACTER VARYING (255) NOT NULL,
	rut_activo BOOLEAN NOT NULL DEFAULT 'true',
  CONSTRAINT ruta_pk PRIMARY KEY ("id_ruta")
) WITH (OIDS = FALSE);


CREATE TABLE "ClientesBloqueados"(
	id_cliente_bloqueado BIGSERIAL NOT NULL,
  id_cliente BIGINT NOT NULL,
	clbl_fecha_bloqueo TIMESTAMP NOT NULL DEFAULT now(),
	clbl_motivo_bloqueo CHARACTER VARYING(300) NOT NULL,
	clbl_activo BOOLEAN DEFAULT 'true',
	CONSTRAINT cliente_bloqueado_pk PRIMARY KEY ("id_cliente_bloqueado")
) WITH (OIDS = FALSE);

CREATE TABLE "VendedoresBloqueados"(
	id_vendedor_bloqueado BIGSERIAL NOT NULL,
  id_vendedor BIGINT NOT NULL,
	vebl_fecha_bloqueo TIMESTAMP NOT NULL DEFAULT now(),
	vebl_motivo_bloqueo CHARACTER VARYING(300) NOT NULL,
	vebl_activo BOOLEAN DEFAULT 'true',
	CONSTRAINT vendedor_bloqueado_pk PRIMARY KEY ("id_vendedor_bloqueado")
) WITH (OIDS = FALSE);

CREATE TABLE "ComentariosBloqueados"(
  id_comentario_bloqueado BIGSERIAL NOT NULL,
  id_comentario BIGINT NOT NULL,
  cobl_fecha_bloqueo  TIMESTAMP DEFAULT now() NOT NULL,
  cobl_motivo_bloqueo CHARACTER VARYING (255) NOT NULL,
  cobl_activo BOOLEAN DEFAULT 'true',
  CONSTRAINT comentarios_bloqueados_pk PRIMARY KEY ("id_comentario_bloqueado")
) WITH (OIDS = FALSE);

CREATE TABLE "HistorialProductosVisitas"(
  id_historial_producto_visita BIGSERIAL NOT NULL,
  id_cliente BIGINT NOT NULL,
  id_producto BIGINT NOT NULL,
  hprv_fecha_ingreso TIMESTAMP NOT NULL DEFAULT now(),
  hprv_activo BOOLEAN NOT NULL DEFAULT 'true',
  CONSTRAINT historial_producto_visita_pk PRIMARY KEY ("id_historial_producto_visita")
) WITH (OIDS = FALSE);

CREATE TABLE "HistorialRutasVisitas"(
  id_historial_ruta_visitas BIGSERIAL NOT NULL,
  id_cliente BIGINT NOT NULL,
  hruv_ruta character varying(255) NOT NULL,
  hruv_fecha_ingreso TIMESTAMP NOT NULL DEFAULT now(),
  hruv_activo BOOLEAN NOT NULL DEFAULT 'true',
  CONSTRAINT historial_ruta_visita_pk PRIMARY KEY ("id_historial_ruta_visitas")
)
