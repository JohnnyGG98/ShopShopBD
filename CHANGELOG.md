## Cambios en la estructura de la base de datos

**12/12/2019**

Se agrego una columna, para poder guardar el numero de productos que vendio.

```sql
ALTER TABLE "vendedores" ADD COLUMN "vend_general"
TYPE INT NOT NULL DEFAULT '0';
```

**02/09/2019**

Se cambió la primary key de la tabla HistorialRutasAdmin

```sql
hiru_activo BOOLEAN DEFAULT 'true',
CONSTRAINT historial_ruta_pk PRIMARY KEY ("id_historial_ruta_admin")
```
Faltaba la coma en una de la líneas de la tabla Permisos
```sql
prem_activo BOOLEAN NOT NULL DEFAULT 'true',
```
Faltaba el valor por defecto en la tabla ClientesBloqueados, por esto se cambió a no nulos
```sql
clbl_fecha_bloqueo TIMESTAMP NOT NULL,
```
Faltaba el valor por defecto en la tabla VendedoresBloquedos
```sql
vebl_fecha_bloqueo TIMESTAMP NOT NULL,
```

Se cambió el nombre de la clave primaria en la asignación de la clave de la tabla Permisos
```sql
CONSTRAINT premiso_pk PRIMARY KEY ("id_premiso")
```

El atributo rut_activo se implementó dos veces, por lo que se procedió a eliminar y asignar el default en el otro que estaba
```sql
rut_activo BOOLEAN NOT NULL DEFAULT 'true',
```

Se cambió el nombre del atributo de asignación para la clave primaria, ya que estaba mal ingresado
```sql
  CONSTRAINT comentarios_bloqueados_pk PRIMARY KEY ("id_comentario_bloqueado")
  ```
