import { getConnection } from "../database/connection.js";
import sql from "mssql";

export const getEstados = async (req, res) => {
  const pool = await getConnection();
  const result = await pool.request().query("select *from estados");
  console.log(result);
  res.json(result.recordset);
};

export const getEstado = async (req, res) => {
  const pool = await getConnection();
  const result = await pool
    .request()
    .input("id", sql.Int, req.params.id)
    .query("select * from estados where id=@id");

  if (result.rowsAffected[0] === 0) {
    return res.status(404).json({ message: "Estado no encontrada" });
  }
  return res.json(result.recordset[0]);
};

export const crearEstado = async (req, res) => {
  const pool = await getConnection();
  const result = await pool
    .request()
    .input("nombre", sql.VarChar, req.body.nombre)
    .query(
      "Execute SPIEstados @nombre; SELECT top 1 id from estados order by id desc;"
    );
  res.json({
    id: result.recordset[0].id,
    nombre: req.body.nombre,
  });
};

export const actualizarEstado = async (req, res) => {
  const pool = await getConnection();
  const result = await pool
    .request()
    .input("id", sql.Int, req.params.id)
    .input("nombre", sql.VarChar, req.body.nombre)
    .query(
      "Execute SPUEstados @id,@nombre"
    );

  if (result.rowsAffected[0] === 0) {
    return res.status(404).json({ message: "Estado no encontrado" });
  }
  res.json({
    id: req.params.id,
    nombre: req.body.nombre,
  });
};