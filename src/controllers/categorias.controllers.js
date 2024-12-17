import { getConnection } from "../database/connection.js";
import sql from "mssql";

export const getCategorias = async (req, res) => {
  const pool = await getConnection();
  const result = await pool.request().query("select *from categoriaproductos");
  console.log(result);
  res.json(result.recordset);
};

export const getCategoria = async (req, res) => {
  const pool = await getConnection();
  const result = await pool
    .request()
    .input("id", sql.Int, req.params.id)
    .query("select * from categoriaproductos where id=@id");

  if (result.rowsAffected[0] === 0) {
    return res.status(404).json({ message: "Categoria no encontrada" });
  }
  return res.json(result.recordset[0]);
};

export const crearCategoria = async (req, res) => {
  const pool = await getConnection();
  const result = await pool
    .request()
    .input("usuario", sql.Int, req.body.usuario)
    .input("nombre", sql.VarChar, req.body.nombre)
    .input("estado", sql.Int, req.body.estado)
    .input("fecha_creacion", sql.DateTime, req.body.fecha_creacion)
    .query(
      "Execute SPICatProductos @usuario,@nombre,@estado,@fecha_creacion; SELECT top 1 id from categoriaproductos order by id desc;"
    );
  res.json({
    id: result.recordset[0].id,
    usuario: req.body.usuario,
    nombre: req.body.nombre,
    estado: req.body.estado,
    fecha_creacion: req.body.fecha_creacion,
  });
};

export const actualizarCategoria = async (req, res) => {
  const pool = await getConnection();
  const result = await pool
    .request()
    .input("id", sql.Int, req.params.id)
    .input("usuario", sql.Int, req.body.usuario)
    .input("nombre", sql.VarChar, req.body.nombre)
    .input("estado", sql.Int, req.body.estado)
    .input("fecha_creacion", sql.DateTime, req.body.fecha_creacion)
    .query(
      "Execute SPUCatProductos @id,@usuario,@nombre,@estado,@fecha_creacion"
    );

  if (result.rowsAffected[0] === 0) {
    return res.status(404).json({ message: "Categoria no encontrada" });
  }
  res.json({
    id: req.params.id,
    usuario: req.body.usuario,
    nombre: req.body.nombre,
    estado: req.body.estado,
    fecha_creacion: req.body.fecha_creacion,
  });
};

