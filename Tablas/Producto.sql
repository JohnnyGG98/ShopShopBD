CREATE TABLE "imagenes"(
  id_imagen BIGSERIAL NOT NULL,
  id_producto BIGINT NOT NULL,
  ima_activo BOOLEAN DEFAULT 'true',
  CONSTRAINT imagen_pk PRIMARY KEY ("id_imagen")
) WITH (OIDS = FALSE);

CREATE TABLE "categorias"(
  id_categoria BIGSERIAL NOT NULL,
  cat_nombre character varying(50) NOT NULL,
  cat_codigo character varying(50) NOT NULL,
  cat_activo BOOLEAN DEFAULT 'true',
  CONSTRAINT categoria_pk PRIMARY KEY ("id_categoria")
) WITH (OIDS = FALSE);

CREATE TABLE "unidades" (
  id_unidad BIGSERIAL NOT NULL,
  unid_nombre character varying(100) NOT NULL,
  unid_codigo character varying(10) NOT NULL,
  CONSTRAINT unidad_pk PRIMARY KEY ("id_unidad")
) WITH (OIDS = FALSE);
