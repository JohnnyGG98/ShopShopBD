CREATE OR REPLACE FUNCTION llenar_datos_cliente()
RETURNS TRIGGER AS $llenar_datos_cliente$
DECLARE
identificacion CHARACTER VARYING(20) := '00';
nombre CHARACTER VARYING(255) := 'SN';
celular CHARACTER VARYING(15) := '00';
telefono CHARACTER VARYING(15) := '00';
correo CHARACTER VARYING(75) := 'SC';
direccion CHARACTER VARYING(255) := 'SD';
BEGIN




END;
$llenar_datos_cliente$ LANGUAGE plpgsql;
