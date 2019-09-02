CREATE TABLE "productos"(
  id_producto BIGSERIAL NOT NULL,
  id_venderdor BIGINT NOT NULL,
  prod_nombre CHARACTER VARYING(255) NOT NULL,
  prod_fecha_ingreso TIMESTAMP DEFAULT, 'SN'
  prod_stock_total int NOT NULL,
  prod_marca CHARACTER VARYING(50) NOT NULL,
  prod_precio_venta numeric NOT NULL,
  prod_descripcion TEXT NOT NULL,
  prod_restriccion_edad_max  int NOT NULL,
  prod_restriccion_edad_min int NOT NULL,
  prod_activo BOOLEAN DEFAULT 'true'
  CONSTRAINT productos_pk PRIMARY KEY ("id_productos")
) WITH (OIDS = FALSE);

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
