-- Al ingresar una nueva imagen principa
CREATE OR REPLACE FUNCTION new_img_principal()
RETURNS TRIGGER AS $new_img_principal$
BEGIN
  IF new.ima_principal THEN
    UPDATE producto."Imagenes"
    SET ima_principal = false
    WHERE id_producto = new.id_producto;
  END IF;
  RETURN NEW;
END;
$new_img_principal$ LANGUAGE plpgsql;

CREATE TRIGGER img_principal
BEFORE INSERT OR UPDATE
ON producto."Imagenes" FOR EACH ROW
EXECUTE PROCEDURE new_img_principal();
