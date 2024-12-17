import { verifyToken } from "../helpers/generateToken.js";
import { getConnection } from "../database/connection.js";
import sql from "mssql";

export const checkRolAuth = (roles) => async (req, res, next) => {
  try {
    const token = req.headers.authorization.split(" ").pop();
    const tokenData = await verifyToken(token);
    const pool = await getConnection();
    const userData = await pool
      .request()
      .input("id", sql.Int, tokenData.id)
      .query(
        "SELECT r.nombre as rol from usuarios as u join rol as r on u.rol=r.id where u.id=@id"
      );

    if ([].concat(roles).includes(userData.recordset[0].rol)) {
      next();
    } else {
      res.status(409);
      res.send({ error: "Usuario sin permiso para acceder" });
    }
  } catch (error) {
    res.status(409);
    res.send({ error: "Usuario sin permiso para acceder" });
  }
};
