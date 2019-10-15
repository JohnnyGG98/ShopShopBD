-- Personas

CREATE OR REPLACE FUNCTION personas_elim()
RETURNS TRIGGER AS $personas_elim$
BEGIN
  UPDATE public."Vendedores"
  SET propiedad_foto_elim = new.propiedad_elim
  WHERE id_propiedad = old.id_propiedad;

  UPDATE public."Captadore"
  SET captador_elim = new.propiedad_elim
  WHERE id_propiedad = old.id_propiedad;

  UPDATE public."Interesados"
  SET interesado_elim = new.propiedad_elim
  WHERE id_propiedad = old.id_propiedad;

  RETURN NEW;
END;
$personas_elim$ LANGUAGE plpgsql;

CREATE TRIGGER personas_eliminada
BEFORE UPDATE OF personas_elim
ON public."Personas" FOR EACH ROW
EXECUTE PROCEDURE personas_elim();

-- Usuarios

-- Vendedores

CREATE OR REPLACE FUNCTION vendedores_elim()
RETURNS TRIGGER AS $vendedores_elim$
BEGIN
  UPDATE public."Productos"
  SET prod_activo = new.vendedores_elim
  WHERE id_vendedor = old.id_vendedor;

  UPDATE public."Locales"
  SET loc_activo = new.vendedores_elim
  WHERE id_vendedor = old.id_vendedor;

  RETURN NEW;
END;
$propiedad_elim$ LANGUAGE plpgsql;

CREATE TRIGGER vendedor_eliminado
BEFORE UPDATE OF propiedad_elim
ON public."Vendedores" FOR EACH ROW
EXECUTE PROCEDURE vendedores_elim();

-- Locales

-- Clientes

CREATE OR REPLACE FUNCTION clientes_elim()
RETURNS TRIGGER AS $clientes_elim$
BEGIN
  UPDATE public."HistorialProductosVisitas"
  SET hprv_activo = new.clientes_elim
  WHERE id_cliente = old.id_cliente;

  UPDATE public."HistorialRutasVisitas"
  SET hruv_activo = new.clientes_elim
  WHERE id_cliente = old.id_cliente;

  UPDATE public."ClientesBloqueados"
  SET clbl_activo = new.clientes_elim
  WHERE id_cliente = old.id_cliente;

  UPDATE public."Calificaciones"
  SET cal_activo = new.clientes_elim
  WHERE id_cliente = old.id_cliente;

  UPDATE public."Preferencias"
  SET pref_activo = new.clientes_elim
  WHERE id_cliente = old.id_cliente;

   UPDATE public."Recomendaciones"
  SET reco_activo = new.clientes_elim
  WHERE id_cliente = old.id_cliente;

  RETURN NEW;
END;
$clientes_elim$ LANGUAGE plpgsql;

CREATE TRIGGER clientes_eliminada
BEFORE UPDATE OF clientes_elim
ON public."Clientes" FOR EACH ROW
EXECUTE PROCEDURE clientes_elim();

-- Calificaciones

-- Preferencias

-- Recomendaciones

-- ProductosDeseados

-- TiposIdentificacion
