CREATE TABLE "Productos"
(
  id_producto BIGSERIAL NOT NULL,
  id_vendedor BIGINT NOT NULL,
  id_marca BIGINT NOT NULL,
  id_unidad BIGINT NOT NULL,
  id_linea INT NOT NULL,
  prod_nombre CHARACTER VARYING(255) NOT NULL,
  prod_fecha_ingreso TIMESTAMP DEFAULT now(),
  prod_stock_min INT NOT NULL,
  prod_stock_max INT NOT NULL,
  prod_stock_total INT NOT NULL,
  prod_precio_venta NUMERIC NOT NULL,
  prod_descripcion TEXT NOT NULL,
  prod_restriccion_edad_max int NOT NULL,
  prod_restriccion_edad_min int NOT NULL,
  prod_tiene_iva BOOLEAN NOT NULL DEFAULT 'true',
  prod_activo BOOLEAN DEFAULT 'true',
  CONSTRAINT productos_pk PRIMARY KEY ("id_producto")
)
WITH (OIDS = FALSE);

CREATE TABLE "ProductosCategorias"
(
  id_producto_categoria BIGSERIAL NOT NULL,
  id_producto BIGINT NOT NULL,
  id_categoria BIGINT NOT NULL,
  prca_activo BOOLEAN DEFAULT 'true',
  CONSTRAINT producto_categoria_pk PRIMARY KEY("id_producto_categoria")
)
WITH (OIDS = FALSE);

CREATE TABLE "Marcas"
(
  id_marca BIGSERIAL NOT NULL,
  marc_nombre character varying(150) NOT NULL,
  marc_codigo character varying(50) NOT NULL,
  marc_activo BOOLEAN DEFAULT 'true',
  CONSTRAINT marca_pl PRIMARY KEY("id_marca")
)
WITH (OIDS = FALSE);


CREATE TABLE "Imagenes"
(
  id_imagen BIGSERIAL NOT NULL,
  id_producto BIGINT NOT NULL,
  ima_url character varying(255),
  ima_activo BOOLEAN DEFAULT 'true',
  CONSTRAINT imagen_pk PRIMARY KEY ("id_imagen")
)
WITH (OIDS = FALSE);

CREATE TABLE "Categorias"
(
  id_categoria BIGSERIAL NOT NULL,
  cat_nombre character varying(50) NOT NULL,
  cat_codigo character varying(50) NOT NULL,
  cat_activo BOOLEAN DEFAULT 'true',
  CONSTRAINT categoria_pk PRIMARY KEY ("id_categoria")
)
WITH (OIDS = FALSE);

CREATE TABLE "Unidades"
(
  id_unidad BIGSERIAL NOT NULL,
  unid_nombre character varying(100) NOT NULL,
  unid_codigo character varying(10) NOT NULL,
  unid_activo BOOLEAN DEFAULT 'true',
  CONSTRAINT unidad_pk PRIMARY KEY ("id_unidad")
)
WITH (OIDS = FALSE);

CREATE TABLE "Comentarios"
(
  id_comentario BIGSERIAL NOT NULL,
  id_producto BIGINT NOT NULL,
  comentario character varying(255),
  com_activo BOOLEAN DEFAULT 'true',
  CONSTRAINT comentario_pk PRIMARY KEY ("id_comentario")
)
WITH (OIDS = FALSE);

CREATE TABLE "Lineas" (
  id_linea SERIAL NOT NULL,
  lin_nombre CHARACTER VARYING(100) NOT NULL,
  lin_codigo CHARACTER VARYING(20) NOT NULL,
  lin_activo BOOLEAN NOT NULL DEFAULT 'true',
  CONSTRAINT linea_pk PRIMARY KEY ("id_linea")
) WITH (OIDS = FALSE);

/* Creando el cardex de productos  */
CREATE TABLE "Cardex" (
  id_cardex BIGSERIAL NOT NULL,
  id_producto BIGINT NOT NULL,
  id_tipo_transaccion INT NOT NULL,
  capr_fecha_ingreso TIMESTAMP NOT NULL DEFAULT now(),
  capr_num_producto INT NOT NULL,
  capr_activo BOOLEAN NOT NULL DEFAULT 'true',
  CONSTRAINT cardex_producto_pk PRIMARY KEY("id_producto_cardex")
) WITH (OIDS = FALSE);

CREATE TABLE "TiposTransaccion" (
  id_tipo_transaccion SERIAL NOT NULL,
  titr_nombre CHARACTER VARYING(20) NOT NULL,
  titr_codigo CHARACTER VARYING(5) NOT NULL,
  titr_activo BOOLEAN NOT NULL DEFAULT 'true'
  CONSTRAINT tipo_transaccion_pk PRIMARY KEY("id_tipo_transaccion")
) WITH (OIDS = FALSE);
