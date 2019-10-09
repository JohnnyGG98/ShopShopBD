## Cambios en la estructura de la base de datos

**12/12/2019**

Se agrego una columna, para poder guardar el numero de productos que vendio.

```sql
ALTER TABLE "Vendedores" ADD COLUMN "vend_general"
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

**10/09/2019**

Quite una "r" demas en id_marca de producto y se borro la columna prdo_marca.

```sql
id_marcar BIGINT NOT NULL
prod_marca CHARACTER VARYING(50) NOT NULL
```

**12/09/2019**

Agregamos la relacion de unidad con productos.

```sql
id_unidad BIGINT NOT NULL,
```

**16/09/2019**

Agregamos atributos en productos, debido a las recomendaciones.

```sql
  // Para saber si tiene iva o no
  ALTER TABLE "Productos" ADD COLUMN "prod_tiene_iva" TYPE BOOLEAN NOT NULL DEFAULT 'true';
  // Agregamos la columna para saber a que linea pertenecen
  ALTER TABLE "Productos" ADD COLUMN "id_linea" TYPE INT NOT NULL;
  // Para saber su stock maximo
  ALTER TABLE "Productos" ADD COLUMN "prod_stock_max" TYPE INT NOT NULL;
  // Para saber el stock minimo
  ALTER TABLE "Productos" ADD COLUMN "prod_stock_min" TYPE INT NOT NULL;  
```

Creamos una tabla para saber a que linea pertenecen los productos.

```sql
  CREATE TABLE "Lineas" (
    id_linea SERIAL NOT NULL,
    lin_nombre CHARACTER VARYING(100) NOT NULL,
    lin_codigo CHARACTER VARYING(20) NOT NULL,
    lin_activo BOOLEAN NOT NULL DEFAULT 'true',
    CONSTRAINT linea_pk PRIMARY KEY ("id_linea")
  ) WITH (OIDS = FALSE);
```

Agregamos una columna para almacenar una descripción del vendedor.

```sql
  ALTER TABLE "Vendedores" ADD COLUMN "vend_descripcion" TYPE TEXT NOT NULL DEFAULT '';
```

Roles de usuarios, para trabajar con una libreria de seguridad de Spring  

```sql
  CREATE TABLE "RolesAdmin"(
    id_rol_admin SERIAL NOT NULL,
    rlad_nombre CHARACTER VARYING(25),
    rlad_activo BOOLEAN NOT NULL DEFAULT 'true',
    CONSTRAINT rol_admin_pk PRIMARY KEY ("id_rol_admin")
  ) WITH (OIDS = FALSE);

  CREATE TABLE "RolesRutas"(
    id_rol_ruta SERIAL NOT NULL,
    id_rol_admin INT NOT NULL,
    id_ruta INT NOT NULL,
    roru_activo BOOLEAN NOT NULL DEFAULT 'true',
    CONSTRAINT rol_ruta_pk PRIMARY KEY ("id_rol_ruta")
  ) WITH (OIDS = FALSE);

  // Foranea en la tabla Admins
  ALTER TABLE "Admins" ADD COLUMN "id_rol_admin" TYPE INT NOT NULL;
```

**17/09/2019**

Se borro esta tabla, porque ahora es reemplazada por cardex.
```sql
CREATE TABLE "ProductosStock" (
  id_producto_stock BIGSERIAL NOT NULL,
  id_producto BIGINT NOT NULL,
  prst_cantidad INT NOT NULL,
  prst_fecha_ingreso TIMESTAMP NOT NULL DEFAULT now(),
  prst_activo BOOLEAN DEFAULT 'true',
  CONSTRAINT producto_stock_pk PRIMARY KEY("id_producto_stock")
)WITH (OIDS = FALSE);

ALTER TABLE "ProductosStock" ADD CONSTRAINT
"producto_stock_producto" FOREIGN KEY ("id_producto") REFERENCES "Productos"("id_producto") ON UPDATE CASCADE ON DELETE CASCADE;
```

Se agregaron dos nuevas tablas para tener seguimiento del producto.
```sql
CREATE TABLE "Cardex" (
  id_cardex BIGSERIAL NOT NULL,
  id_producto BIGINT NOT NULL,
  id_tipo_transaccion INT NOT NULL,
  capr_fecha_ingreso TIMESTAMP NOT NULL DEFAULT now(),
  capr_num_producto INT NOT NULL,
  capr_activo BOOLEAN NOT NULL DEFAULT 'true',
  CONSTRAINT cardex_producto_pk PRIMARY KEY("id_producto_cardex")
) WITH (OIDS = FALSE);

CREATE TABLE "TiposTransaccion" (
  id_tipo_transaccion SERIAL NOT NULL,
  titr_nombre CHARACTER VARYING(20) NOT NULL,
  titr_codigo CHARACTER VARYING(5) NOT NULL,
  titr_activo BOOLEAN NOT NULL DEFAULT 'true'
  CONSTRAINT tipo_transaccion_pk PRIMARY KEY("id_tipo_transaccion")
) WITH (OIDS = FALSE);
```
Se agrega NOT NULL al atributo rlad_nombre de la tabla "RolesAdmin"

```sql
  CREATE TABLE "RolesAdmin"(
    id_rol_admin SERIAL NOT NULL,
    rlad_nombre CHARACTER VARYING(25) NOT NULL,
    rlad_activo BOOLEAN NOT NULL DEFAULT 'true',
    CONSTRAINT rol_admin_pk PRIMARY KEY ("id_rol_admin")
  ) WITH (OIDS = FALSE);
```

**18/09/2019**

Agregando los tipos de identificacion

```sql
CREATE TABLE "TiposIdentificacion" (
  id_tipo_identificacion INT NOT NULL,
  tiid_nombre CHARACTER VARYING(10),
  tiid_activo BOOLEAN NOT NULL DEFAULT 'true',
  CONSTRAINT tipo_identificacion_pk PRIMARY KEY("id_tipo_identificacion")
) WITH (OIDS = FALSE);

ALTER TABLE "Personas" ADD COLUMN "id_tipo_identificacion" TYPE INT NOT NULL;
```

**19/09/2019**

Borrando la tabla de usuarios de human.

```sql
CREATE TABLE "Usuarios"(
  id_usuario BIGSERIAL NOT NULL,
  id_persona BIGINT NOT NULL,
  user_nick character varying(50) NOT NULL UNIQUE,
  user_pass bytea NOT NULL,
  CONSTRAINT usuario_pk PRIMARY KEY("id_usuario")
) WITH (OIDS = FALSE);
```

Agregando una foranea de usuario a persona.

```sql
id_usuario INT NOT NULL
```

Borrando las foraneas de usuario de cliente y vendedor y agregamos foraneas de persona.
```sql
-- Borrado
id_usuario BIGINT NOT NULL
-- Agregado
id_persona BIGINT NOT NULL
```

Borramos la foranea de usuarios.
```sql
ALTER TABLE "Usuarios" ADD CONSTRAINT "usuario_persona" FOREIGN KEY ("id_usuario") REFERENCES
"Personas"("id_persona") ON UPDATE CASCADE ON DELETE CASCADE;
```

Borramos roles admin y los permisos de esos roles.
```sql
CREATE TABLE "RolesAdmin"(
  id_rol_admin BIGSERIAL NOT NULL,
  rlad_nombre CHARACTER VARYING(25) NOT NULL,
  rlad_activo BOOLEAN NOT NULL DEFAULT 'true',
  CONSTRAINT rol_admin_pk PRIMARY KEY ("id_rol_admin")
) WITH (OIDS = FALSE);


CREATE TABLE "RolesRutas"(
  id_rol_ruta SERIAL NOT NULL,
  id_rol_admin INT NOT NULL,
  id_ruta INT NOT NULL,
  roru_activo BOOLEAN NOT NULL DEFAULT 'true',
  CONSTRAINT rol_ruta_pk PRIMARY KEY ("id_rol_ruta")
) WITH (OIDS = FALSE);
```

Borramos algunas columnas de Admins.

```sql
adm_user CHARACTER VARYING(255) NOT NULL
adm_pass BYTEA NOT NULL
```

Agregamos una foranea a Admins.

```sql
id_usuario BIGINT NOT NULL
```

**30/09/2019**

Cambiando calificaciones al microservicio de productos!

Arreglando la ortografia 'Kardex';

**08/10/2019**

Agregamos  una columna para saber si la imagen es la principal. 
```sql
ima_principal BOOLEAN NOT NULL
```
