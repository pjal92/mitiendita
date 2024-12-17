import { getConnection } from "../database/connection.js";
import sql from "mssql";
import { encrypt } from "../helpers/handleBcrypt.js"

export const getUsuarios = async (req, res) => {
    const pool = await getConnection();
    const result = await pool.request().query("select *from usuarios");
    console.log(result);
    res.json(result.recordset);
};

export const getUsuario = async (req, res) => {
    const pool = await getConnection();
    const result = await pool
        .request()
        .input("id", sql.Int, req.params.id)
        .query("select * from usuarios where id=@id");

    if (result.rowsAffected[0] === 0) {
        return res.status(404).json({ message: "Usuario no encontrada" });
    }
    return res.json(result.recordset[0]);
};

export const crearUsuario = async (req, res) => {
    const pool = await getConnection();
    const result = await pool
        .request()
        .input("rol", sql.Int, req.body.rol)
        .input("estado", sql.Int, req.body.estado)
        .input("email", sql.VarChar, req.body.email)
        .input("nombre_completo", sql.VarChar, req.body.nombre_completo)
        .input("password", sql.VarChar, await encrypt(req.body.password))
        .input("telefono", sql.VarChar, req.body.telefono)
        .input("fecha_nacimiento", sql.DateTime, req.body.fecha_nacimiento)
        .input("fecha_creacion", sql.DateTime, req.body.fecha_creacion)
        .input("cliente", sql.Int, req.body.cliente)
        .query(
            "Execute SPIUsuarios @rol,@estado,@email,@nombre_completo,@password,@telefono,@fecha_nacimiento,@fecha_creacion,@cliente; SELECT top 1 id, password from usuarios order by id desc;"
        );
    res.json({
        id: result.recordset[0].id,
        rol: req.body.rol,
        estado: req.body.estado,
        email: req.body.email,
        nombre_completo: req.body.nombre_completo,
        password: result.recordset[0].password,
        telefono: req.body.telefono,
        fecha_nacimiento: req.body.fecha_nacimiento,
        fecha_creacion: req.body.fecha_creacion,
        cliente: req.body.cliente,
    });
};

export const actualizarUsuario = async (req, res) => {
    const pool = await getConnection();
    const result = await pool
        .request()
        .input("id", sql.Int, req.params.id)
        .input("rol", sql.Int, req.body.rol)
        .input("estado", sql.Int, req.body.estado)
        .input("email", sql.VarChar, req.body.email)
        .input("nombre_completo", sql.VarChar, req.body.nombre_completo)
        .input("password", sql.VarChar, await encrypt(req.body.password))
        .input("telefono", sql.VarChar, req.body.telefono)
        .input("fecha_nacimiento", sql.DateTime, req.body.fecha_nacimiento)
        .input("fecha_creacion", sql.DateTime, req.body.fecha_creacion)
        .input("cliente", sql.Int, req.body.cliente)
        .query(
            "Execute SPUUsuarios @id,@rol,@estado,@email,@nombre_completo,@password,@telefono,@fecha_nacimiento,@fecha_creacion,@cliente"
        );

    if (result.rowsAffected[0] === 0) {
        return res.status(404).json({ message: "Usuario no encontrada" });
    }
    res.json({
        id: req.params.id,
        rol: req.body.rol,
        estado: req.body.estado,
        email: req.body.email,
        nombre_completo: req.body.nombre_completo,
        password: req.body.password,
        telefono: req.body.telefono,
        fecha_nacimiento: req.body.fecha_nacimiento,
        fecha_creacion: req.body.fecha_creacion,
        cliente: req.body.cliente,
    });
};