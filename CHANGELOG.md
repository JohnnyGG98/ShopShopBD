## Cambios en la estructura de la base de datos

**12/12/2019**

Se agrego una columna, para poder guardar el numero de productos que vendio.

```sql
ALTER TABLE "vendedores" ADD COLUMN "vend_general"
TYPE INT NOT NULL DEFAULT '0';
```
