import { getConnection } from "../database/connection.js";
import sql from "mssql";

export const crearOrdenDetalles = async (req, res) => {
  const pool = await getConnection();
  const result = await pool
    .request()
    .input("usuario", sql.Int, req.body.usuario)
    .input("detalles", sql.NVarChar, JSON.stringify(req.body.detalles))
    .input("fecha_entrega", sql.Date, req.body.fecha_entrega)
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
