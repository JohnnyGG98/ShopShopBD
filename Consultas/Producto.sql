-- Consulta JSON
SELECT array_to_json(
  array_agg(p.*)
) AS productos FROM (
  SELECT
  p.id_producto,
  p.id_vendedor,
  p.prod_nombre,
  p.prod_precio_venta, (
    SELECT array_to_json(
      array_agg(i.*)
    ) AS imagenes FROM (
      SELECT *
      FROM producto."Imagenes" i
      WHERE i.id_producto = p.id_producto
    ) AS i
  )
  FROM producto."Productos" p
) AS p;
