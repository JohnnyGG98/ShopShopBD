--Faltan Activos 

--//HUMAN//Vendedores/Locales/Personas
--------------Admin.sql-----------------
--Admins
CREATE OR REPLACE FUNCTION admin_elim()
RETURNS TRIGGER AS $admin_elim$
BEGIN
  UPDATE public."HistorialRutasAdmin"
  SET hiru_activo = new.admin_elim
  WHERE id_admin = old.id_admin;

  UPDATE public."Permisos"
  SET prem_activo  = new.admin_elim
  WHERE id_permiso = old.id_permiso;

  RETURN NEW;
END;
$admin_elim$ LANGUAGE plpgsql;

CREATE TRIGGER admin_eliminada
BEFORE UPDATE OF admin_elim
ON public."Admins" FOR EACH ROW
EXECUTE PROCEDURE admin_elim();

--Rutas
CREATE OR REPLACE FUNCTION rutas_elim()
RETURNS TRIGGER AS $rutas_elim$
BEGIN
  UPDATE public."PropiedadFotos"
  SET prem_activo = new.rutas_elim
  WHERE id_ruta = old.id_ruta;

  RETURN NEW;
END;
$rutas_elim$ LANGUAGE plpgsql;

CREATE TRIGGER rutas_eliminada
BEFORE UPDATE OF rutas_elim
ON public."Rutas" FOR EACH ROW
EXECUTE PROCEDURE rutas_elim();
-------------------------------------------------------

------------------Human.sql------------------
--Clientes
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

--Personas
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

CREATE TRIGGER persponas_eliminada
BEFORE UPDATE OF personas_elim
ON public."Personas" FOR EACH ROW
EXECUTE PROCEDURE personas_elim();
--Vendedores
CREATE OR REPLACE FUNCTION vendedores_elim()
RETURNS TRIGGER AS $vendedores_elim$
BEGIN
  UPDATE public."Productos"
  SET prod_activo = new.vendedores_elim
  WHERE id_vendedor = old.id_vendedor;

  UPDATE public."Locales"
  SET loc_activo = new.vendedores_elim
  WHERE id_vendedor = old.id_vendedor;

  UPDATE public."Interesados"
  SET interesado_elim = new.propiedad_elim
  WHERE id_propiedad = old.id_propiedad;

  RETURN NEW;
END;
$propiedad_elim$ LANGUAGE plpgsql;

CREATE TRIGGER propiedad_eliminada
BEFORE UPDATE OF propiedad_elim
ON public."Propiedades" FOR EACH ROW
EXECUTE PROCEDURE propiedad_elim();




