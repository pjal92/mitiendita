import { getConnection } from "../database/connection.js";
import sql from "mssql";
import { crearUsuario } from "../controllers/usuarios.controllers.js";
import { compare } from "../helpers/handleBcrypt.js";
import { tokenSign } from "../helpers/generateToken.js";

export const loginController = async (req, res) => {
  try {
    const pool = await getConnection();
    const user = await pool
      .request()
      .input("email", sql.VarChar, req.body.email)
      .query(
        "SELECT id, rol, email, password from usuarios where email=@email"
      );

    if (user.rowsAffected[0] === 0) {
      res.status(404);
      res.send({ error: "Usuario no existe" });
      return;
    }

    const checkPassword = await compare(
      req.body.password,
      user.recordset[0].password
    );
    const tokenSession = await tokenSign(
      user.recordset[0].id,
      user.recordset[0].rol
    );
    if (checkPassword) {
      res.json({
        data: user.recordset[0],
        token: tokenSession,
      });
      return;
    }
    if (!checkPassword) {
      res.status(409);
      res.send({
        error: "Contraseña Incorrecta",
      });
      return;
    }
  } catch (error) {
    httpError(res, error);
  }
};

export const registerController = async (req, res) => {
  try {
    crearUsuario(req, res);
  } catch (error) {
    httpError(res, error);
  }
};
