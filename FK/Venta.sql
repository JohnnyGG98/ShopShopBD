ALTER TABLE "Ventas" ADD CONSTRAINT "venta_cliente" FOREIGN KEY ("id_cliente") REFERENCES
"Clientes"("id_cliente") ON UPDATE CASCADE ON DELETE CASCADE;


ALTER TABLE "DetalleVenta" ADD CONSTRAINT "detalle_venta_venta" FOREIGN KEY ("id_venta") REFERENCES
"Ventas"("id_venta") ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE "DetalleVenta" ADD CONSTRAINT "producto_detalle_venta" FOREIGN KEY ("id_producto") REFERENCES
"Productos"("id_producto") ON UPDATE CASCADE ON DELETE CASCADE;
