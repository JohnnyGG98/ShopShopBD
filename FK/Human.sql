ALTER TABLE "Vendedores" ADD CONSTRAINT "vendedor_persona" FOREIGN KEY ("id_persona") REFERENCES
"Personas"("id_persona") ON UPDATE CASCADE ON DELETE CASCADE;


ALTER TABLE "Locales" ADD CONSTRAINT "local_vendedor" FOREIGN KEY ("id_vendedor") REFERENCES
"Vendedores"("id_vendedor") ON UPDATE CASCADE ON DELETE CASCADE;


ALTER TABLE "Clientes" ADD CONSTRAINT "cliente_persona" FOREIGN KEY ("id_persona") REFERENCES
"Personas"("id_persona") ON UPDATE CASCADE ON DELETE CASCADE;



ALTER TABLE "Preferencias" ADD CONSTRAINT "preferencia_cliente" FOREIGN KEY ("id_cliente") REFERENCES
"Clientes"("id_cliente") ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE "Preferencias" ADD CONSTRAINT "preferencia_categoria" FOREIGN KEY ("id_categoria") REFERENCES
"Categorias"("id_categoria") ON UPDATE CASCADE ON DELETE CASCADE;


ALTER TABLE "Recomendaciones" ADD CONSTRAINT "recomendacion_cliente" FOREIGN KEY ("id_cliente") REFERENCES
"Clientes"("id_cliente") ON UPDATE CASCADE ON DELETE CASCADE;


ALTER TABLE "ProductosDeseados" ADD CONSTRAINT "producto_deseado_cliente" FOREIGN KEY ("id_cliente") REFERENCES
"Clientes"("id_cliente") ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE "ProductosDeseados" ADD CONSTRAINT "producto_deseado_producto" FOREIGN KEY ("id_producto") REFERENCES
"Productos"("id_producto") ON UPDATE CASCADE ON DELETE CASCADE;


ALTER TABLE "Personas" ADD CONSTRAINT "persona_tipo_identificacion" FOREIGN KEY ("id_tipo_identificacion") REFERENCES
"TiposIdentificacion"("id_tipo_identificacion") ON UPDATE CASCADE ON DELETE CASCADE;
