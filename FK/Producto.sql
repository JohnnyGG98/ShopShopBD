ALTER TABLE "Productos" ADD CONSTRAINT "producto_vendedor" FOREIGN KEY ("id_vendedor") REFERENCES "Vendedores"("id_vendedor")
ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE "Productos" ADD CONSTRAINT "producto_marca" FOREIGN KEY ("id_marca")
REFERENCES "Marcas"("id_marca")
ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE "Productos" ADD CONSTRAINT "producto_unidad" FOREIGN KEY ("id_unidad")
REFERENCES "Unidades"("id_unidad")
ON UPDATE CASCADE ON DELETE CASCADE;



ALTER TABLE "ProductosCategorias" ADD CONSTRAINT
"producto_categoria_producto" FOREIGN KEY ("id_producto") REFERENCES "Productos"("id_producto") ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE "ProductosCategorias" ADD CONSTRAINT
"producto_categoria_categoria" FOREIGN KEY ("id_categoria") REFERENCES "Categorias"("id_categoria") ON UPDATE CASCADE ON DELETE CASCADE;


ALTER TABLE "ProductosStock" ADD CONSTRAINT
"producto_stock_producto" FOREIGN KEY ("id_producto") REFERENCES "Productos"("id_producto") ON UPDATE CASCADE ON DELETE CASCADE;


ALTER TABLE "Imagenes" ADD CONSTRAINT "imagen_producto" FOREIGN KEY ("id_producto") REFERENCES "Productos"("id_producto") ON UPDATE CASCADE ON DELETE CASCADE;


ALTER TABLE "Comentarios" ADD CONSTRAINT "comentario_producto" FOREIGN KEY ("id_producto")
REFERENCES "Productos"("id_producto") ON UPDATE CASCADE ON DELETE CASCADE;
