-- Admins
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

-- HistorialRutasAdmin

-- Permisos

-- Rutas

CREATE OR REPLACE FUNCTION rutas_elim()
RETURNS TRIGGER AS $rutas_elim$
BEGIN
  UPDATE public."Permisos"
  SET prem_activo = new.rutas_elim
  WHERE id_ruta = old.id_ruta;
  RETURN NEW;
END;
$rutas_elim$ LANGUAGE plpgsql;

CREATE TRIGGER rutas_eliminada
BEFORE UPDATE OF rutas_elim
ON public."Rutas" FOR EACH ROW
EXECUTE PROCEDURE rutas_elim();

-- ClientesBloqueados

-- VendedoresBloqueados

-- ComentariosBloqueados

-- HistorialProductosVisitas

-- HistorialRutasVisitas

-- RolesAdmin

-- RolesRutas
