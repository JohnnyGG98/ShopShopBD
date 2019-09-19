ALTER TABLE "Admins" ADD CONSTRAINT "admin_usuario" FOREIGN KEY ("id_usuario") REFERENCES "Usuarios"("id_usuario") ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE "HistorialRutasAdmin" ADD CONSTRAINT "historial_rutas_admin_admin" FOREIGN KEY ("id_admin") REFERENCES
"Admins"("id_admin") ON UPDATE CASCADE ON DELETE CASCADE;


ALTER TABLE "Permisos" ADD CONSTRAINT "permisos_admin" FOREIGN KEY ("id_admin") REFERENCES
"Admins"("id_admin") ON UPDATE CASCADE ON DELETE CASCADE;


ALTER TABLE "Permisos" ADD CONSTRAINT "permisos_ruta" FOREIGN KEY ("id_ruta") REFERENCES
"Rutas"("id_ruta") ON UPDATE CASCADE ON DELETE CASCADE;


ALTER TABLE "ClientesBloqueados" ADD CONSTRAINT "cliente_bloqueado_cliente" FOREIGN KEY ("id_cliente") REFERENCES
"Clientes"("id_cliente") ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE "VendedoresBloqueados" ADD CONSTRAINT "vendedor_bloqueado_vendedor" FOREIGN KEY ("id_vendedor") REFERENCES
"Vendedores"("id_vendedor") ON UPDATE CASCADE ON DELETE CASCADE;


ALTER TABLE "ComentariosBloqueados" ADD CONSTRAINT "comentario_bloqueado_comentario" FOREIGN KEY ("id_comentario") REFERENCES
"Comentarios"("id_comentario") ON UPDATE CASCADE ON DELETE CASCADE;


ALTER TABLE "HistorialProductosVisitas" ADD CONSTRAINT "historial_producto_visita_cliente" FOREIGN KEY ("id_cliente") REFERENCES
"Clientes"("id_cliente") ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE "HistorialProductosVisitas" ADD CONSTRAINT "historial_producto_visita_producto" FOREIGN KEY ("id_producto") REFERENCES
"Productos"("id_producto") ON UPDATE CASCADE ON DELETE CASCADE;


ALTER TABLE "HistorialRutasVisitas" ADD CONSTRAINT "historial_ruta_visita_cliente" FOREIGN KEY ("id_cliente") REFERENCES
"Clientes"("id_cliente") ON UPDATE CASCADE ON DELETE CASCADE;
