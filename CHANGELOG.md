## Cambios en la estructura de la base de datos

**12/12/2019**

Se agrego una columna, para poder guardar el numero de productos que vendio.

```sql
ALTER TABLE "vendedores" ADD COLUMN "vend_general"
TYPE INT NOT NULL DEFAULT '0';
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
