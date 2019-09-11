CREATE TABLE "Productos"
(
  id_producto BIGSERIAL NOT NULL,
  id_vendedor BIGINT NOT NULL,
  id_marca BIGINT NOT NULL,
  prod_nombre CHARACTER VARYING(255) NOT NULL,
  prod_fecha_ingreso TIMESTAMP DEFAULT now(),
  prod_stock_total int NOT NULL,
  prod_precio_venta numeric NOT NULL,
  prod_descripcion TEXT NOT NULL,
  prod_restriccion_edad_max int NOT NULL,
  prod_restriccion_edad_min int NOT NULL,
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

CREATE TABLE "ProductosStock"
(
  id_producto_stock BIGSERIAL NOT NULL,
  id_producto BIGINT NOT NULL,
  prst_cantidad INT NOT NULL,
  prst_fecha_ingreso TIMESTAMP NOT NULL DEFAULT now(),
  prst_activo BOOLEAN DEFAULT 'true',
  CONSTRAINT producto_stock_pk PRIMARY KEY("id_producto_stock")
)
WITH (OIDS = FALSE);

CREATE TABLE "Imagenes"
(
  id_imagen BIGSERIAL NOT NULL,
  id_producto BIGINT NOT NULL,
  ima-url character varying(255),
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
