-- Esquema
CREATE SCHEMA "venta";

-- Tablas

CREATE TABLE venta."Ventas"(
  id_venta BIGSERIAL NOT NULL,
  id_cliente BIGINT NOT NULL,
  vent_cliente_identificacion CHARACTER VARYING(20) NOT NULL DEFAULT '0000000000',
  vent_cliente_nombre CHARACTER VARYING(255) NOT NULL DEFAULT '',
  vent_cliente_telefono CHARACTER VARYING(15) NOT NULL DEFAULT '',
  vent_cliente_correo CHARACTER VARYING(75) NOT NULL DEFAULT '',
  vent_cliente_direccion CHARACTER VARYING(255) NOT NULL DEFAULT '',
  vent_fecha_ingreso TIMESTAMP NOT NULL DEFAULT now(),
  vent_subtotal_iva NUMERIC(15, 5) NOT NULL DEFAULT 0,
  vent_subtotal_sin_iva NUMERIC(15, 5) NOT NULL DEFAULT 0,
  vent_iva NUMERIC(5, 2) NOT NULL DEFAULT 12,
  vent_total_iva NUMERIC(8, 2) NOT NULL DEFAULT 0,
  vent_total NUMERIC(15, 5) NOT NULL DEFAULT 0,
  vent_activo BOOLEAN NOT NULL DEFAULT 'true',
  CONSTRAINT venta_pk PRIMARY KEY("id_venta")
) WITH (OIDS = FALSE);

CREATE TABLE venta."DetalleVenta" (
  id_detalle_venta BIGSERIAL NOT NULL,
  id_venta BIGINT NOT NULL,
  id_producto BIGINT NOT NULL,
  deve_num_producto INT NOT NULL DEFAULT 0,
  deve_precio_unitario NUMERIC(10, 5) NOT NULL DEFAULT 0,
  deve_total NUMERIC(15, 5) NOT NULL DEFAULT 0,
  deve_tiene_iva BOOLEAN NOT NULL DEFAULT 'false',
  deve_activo BOOLEAN NOT NULL DEFAULT 'true',
  CONSTRAINT detalle_venta_pk PRIMARY KEY("id_detalle_venta")
) WITH (OIDS = FALSE);
