CREATE OR REPLACE FUNCTION llenar_datos_cliente()
RETURNS TRIGGER AS $llenar_datos_cliente$
DECLARE
identificacion CHARACTER VARYING(20) := '00';
nombre CHARACTER VARYING(255) := 'SN';
telefono CHARACTER VARYING(15) := '00';
correo CHARACTER VARYING(75) := 'SC';
direccion CHARACTER VARYING(255) := 'SD';
BEGIN

SELECT
per_identificacion,
per_primer_nombre || ' ' ||
per_segundo_nombre || ' ' ||
per_primer_apellido || ' ' ||
per_segundo_apellido AS nombre_completo,
per_telefono,
per_correo,
per_direccion
INTO
identificacion,
nombre,
telefono,
correo,
direccion
FROM human."Personas" p
WHERE p.id_persona = new.id_cliente;

new.vent_cliente_identificacion := identificacion;
new.vent_cliente_nombre := nombre;
new.vent_cliente_telefono := telefono;
new.vent_cliente_correo := correo;
new.vent_cliente_direccion := direccion;
-- Retornamos el nuevo trigger
RETURN NEW;
END;
$llenar_datos_cliente$ LANGUAGE plpgsql;


-- Actualizamos el sub total

CREATE OR REPLACE FUNCTION actualizar_subtotal()
RETURNS TRIGGER AS $actualizar_subtotal$
DECLARE
tiene_iva BOOLEAN := false;
precio_unitario NUMERIC(10, 5) := 0.0;

BEGIN

SELECT
prod_tiene_iva,
prod_precio_venta
INTO
tiene_iva,
precio_unitario
FROM producto."Productos"
WHERE id_producto = new.id_producto;

new.deve_precio_unitario := precio_unitario;
new.deve_tiene_iva := tiene_iva;
new.deve_total := precio_unitario * new.deve_num_producto;

IF tiene_iva = TRUE THEN
  UPDATE venta."Ventas"
  SET vent_subtotal_iva = vent_subtotal_iva + new.deve_total
  WHERE id_venta = new.id_venta;
ELSE
  UPDATE venta."Ventas"
  SET vent_subtotal_sin_iva = vent_subtotal_sin_iva + new.deve_total
  WHERE id_venta = new.id_venta;
END IF;

RETURN NEW;
END;
$actualizar_subtotal$ LANGUAGE plpgsql;


-- Actualizamos el total de la factura
CREATE OR REPLACE FUNCTION act_total()
RETURNS TRIGGER AS $act_total$
BEGIN

new.vent_total_iva := ( new.vent_subtotal_iva * new.vent_iva ) / 100;

new.vent_total := new.vent_total_iva + new.vent_subtotal_iva + new.vent_subtotal_sin_iva + 0.1 ;

RETURN NEW;
END;
$act_total$ LANGUAGE plpgsql;



CREATE TRIGGER ingresar_datos
BEFORE INSERT ON venta."Ventas"
FOR EACH ROW EXECUTE PROCEDURE llenar_datos_cliente();


CREATE TRIGGER actualizar_subtotal
BEFORE INSERT ON venta."DetalleVenta"
FOR EACH ROW EXECUTE PROCEDURE actualizar_subtotal();



CREATE TRIGGER total_venta_si
BEFORE UPDATE OF vent_subtotal_iva ON venta."Ventas"
FOR EACH ROW EXECUTE PROCEDURE act_total();

CREATE TRIGGER total_venta_ssi
BEFORE UPDATE OF vent_subtotal_sin_iva ON venta."Ventas"
FOR EACH ROW EXECUTE PROCEDURE act_total();
