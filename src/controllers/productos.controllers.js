import { getConnection } from "../database/connection.js";
import sql from "mssql";

export const getProductos = async (req, res) => {
  const pool = await getConnection();
  const result = await pool.request().query("select *from productos");
  console.log(result);
  res.json(result.recordset);
};

export const getProducto = async (req, res) => {
  const pool = await getConnection();
  const result = await pool
    .request()
    .input("id", sql.Int, req.params.id)
    .query("select * from productos where id=@id");

  if (result.rowsAffected[0] === 0) {
    return res.status(404).json({ message: "Producto no encontrado" });
  }
  return res.json(result.recordset[0]);
};

export const crearProducto = async (req, res) => {
  const pool = await getConnection();
  const result = await pool
    .request()
    .input("categoriaproducto", sql.Int, req.body.categoriaproducto)
    .input("usuario", sql.Int, req.body.usuario)
    .input("nombre", sql.VarChar, req.body.nombre)
    .input("marca", sql.VarChar, req.body.marca)
    .input("codigo", sql.VarChar, req.body.codigo)
    .input("stock", sql.Float, req.body.stock)
    .input("estado", sql.Int, req.body.estado)
    .input("precio", sql.Float, req.body.precio)
    .input("fecha_creacion", sql.DateTime, req.body.fecha_creacion)
    .input("foto", sql.Binary, req.body.foto)
    .query(
      "Execute SPIProductos @categoriaproducto,@usuario,@nombre,@marca,@codigo,@stock,@estado,@precio,@fecha_creacion,@foto; select top 1 id from Productos order by id desc;"
    );
  res.json({
    id: result.recordset[0].id,
    codigoproducto: req.body.categoriaproducto,
    usuario: req.body.usuario,
    nombre: req.body.nombre,
    marca: req.body.marca,
    codigo: req.body.codigo,
    stock: req.body.stock,
    estado: req.body.estado,
    precio: req.body.precio,
    fecha_creacion: req.body.fecha_creacion,
    foto: req.body.foto,
  });
};

export const actualizarProducto = async (req, res) => {
  const pool = await getConnection();
  const result = await pool
    .request()
    .input("id", sql.Int, req.params.id)
    .input("categoriaproducto", sql.Int, req.body.categoriaproducto)
    .input("usuario", sql.Int, req.body.usuario)
    .input("nombre", sql.VarChar, req.body.nombre)
    .input("marca", sql.VarChar, req.body.marca)
    .input("codigo", sql.VarChar, req.body.codigo)
    .input("stock", sql.Float, req.body.stock)
    .input("estado", sql.Int, req.body.estado)
    .input("precio", sql.Float, req.body.precio)
    .input("fecha_creacion", sql.DateTime, req.body.fecha_creacion)
    .input("foto", sql.Binary, req.body.foto)
    .query(
      "Execute SPUProductos @id,@categoriaproducto,@usuario,@nombre,@marca,@codigo,@stock,@estado,@precio,@fecha_creacion,@foto"
    );

  if (result.rowsAffected[0] === 0) {
    return res.status(404).json({ message: "Producto no encontrado" });
  }
  res.json({
    id: req.params.id,
    codigoproducto: req.body.categoriaproducto,
    usuario: req.body.usuario,
    nombre: req.body.nombre,
    marca: req.body.marca,
    codigo: req.body.codigo,
    stock: req.body.stock,
    estado: req.body.estado,
    precio: req.body.precio,
    fecha_creacion: req.body.fecha_creacion,
    foto: req.body.foto,
  });
};