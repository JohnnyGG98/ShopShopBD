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
**03/09/2019**

Se corrigió un error al momento de ejecutar el script en la BDShopShop, faltaba una coma ,


```sql
  prod_activo BOOLEAN DEFAULT 'true',
  CONSTRAINT productos_pk PRIMARY KEY ("id_producto")
) WITH (OIDS = FALSE);
```

Se corrigió un error, faltaba agregar el with(oids=false);

```sql
  prst_fecha_ingreso TIMESTAMP NOT NULL DEFAULT now(),
  CONSTRAINT producto_stock_pk PRIMARY KEY("id_producto_stock")
)WITH (OIDS = FALSE);
```

Se corrigió error en la fecha de ingreso de la tabla Productos

```sql
prod_fecha_ingreso TIMESTAMP DEFAULT now(),
```

**04/09/2019**

Se corrigio el nombre del atributo en la tabla de Marcas, para evitar futuros errores.

```sql
  marc_activo BOOLEAN DEFAULT 'true',
  ```
**05/09/2019**

Agregué que el siguiente atributo no aceptara nulls

```sql
cobl_fecha_bloqueo  TIMESTAMP DEFAULT now() NOT NULL,
```

**09/09/2019**

Nueva tabla para poder crear usuarios para el sistema, aqui unicamente se almacenaran los vendedores y clientes.

```sql
CREATE TABLE "Usuarios"(
  id_usuario BIGSERIAL NOT NULL,
  id_persona BIGINT NOT NULL,
  user_nick character varying(50) NOT NULL UNIQUE,
  user_pass bytea NOT NULL,
  CONSTRAINT usuario_pk PRIMARY KEY("id_usuario")
) WITH (OIDS = FALSE);
```

Se actualizaron las foraneas de las tablas de Vendedores y Clientes

```sql
-- Tabla Vendedores y Clientes
id_usuario BIGINT NOT NULL
```

Se agrego la columna para agregar las imagenes de los productos
```sql
ima-url character varying(255)
```
