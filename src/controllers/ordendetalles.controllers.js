import { getConnection } from "../database/connection.js";
import sql from "mssql";

export const getOrdenes = async (req, res) => {
  const pool = await getConnection();
  const result = await pool.request()
  .input("usuario", sql.Int, req.params.usuario)
  .query("select *from orden where usuario=@usuario");
  console.log(result);
  res.json(result.recordset);
};

export const getOrden = async (req, res) => {
  const pool = await getConnection();
  const result = await pool
    .request()
    .input("id", sql.Int, req.params.id)
    .query("select * from orden where id=@id");

  if (result.rowsAffected[0] === 0) {
    return res.status(404).json({ message: "Orden no encontrada" });
  }
  return res.json(result.recordset[0]);
};

export const createOrdenDetalles = async (req, res) => {
  const pool = await getConnection();
  const result = await pool
    .request()
    .input("usuario", sql.Int, req.body.usuario)
    .input("fecha_entrega", sql.Date, req.body.fecha_entrega)
    .input("detalles", sql.NVarChar, JSON.stringify(req.body.detalles))
    .query(
      "Execute SPIOrdenConDetalles @usuario, @fecha_entrega, @detalles; SELECT top 1 id from orden order by id desc;"
    );
  res.json({
    id: result.recordset[0].id,
    fecha_entrega: req.body.fecha_entrega,
    usuario: req.body.usuario,
    detalles: req.body.detalles
  });
};

export const updateOrdenDetalles = async (req, res) => {
  const pool = await getConnection();
  const result = await pool
    .request()
    .input("id", sql.Int, req.params.id)
    .input("detalles", sql.NVarChar, JSON.stringify(req.body.detalles))
    .query(
      "Execute SPUOrdenConDetalles @id, @detalles;"
    );

  if (result.rowsAffected[0] === 0) {
    return res.status(404).json({ message: "Orden no encontrada" });
  }
  res.json({
    id: req.params.id,
    detalles: req.body.detalles
  });
};