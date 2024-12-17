import { getConnection } from "../database/connection.js";
import sql from "mssql";

export const getClientes = async (req, res) => {
    const pool = await getConnection();
    const result = await pool.request().query("select *from Clientes");
    console.log(result);
    res.json(result.recordset);
};

export const getCliente = async (req, res) => {
    const pool = await getConnection();
    const result = await pool
        .request()
        .input("id", sql.Int, req.params.id)
        .query("select * from Clientes where id=@id");

    if (result.rowsAffected[0] === 0) {
        return res.status(404).json({ message: "Cliente no encontrado" });
    }
    return res.json(result.recordset[0]);
};

export const crearCliente = async (req, res) => {
    const pool = await getConnection();
    const result = await pool
        .request()
        .input("razon_social", sql.VarChar, req.body.razon_social)
        .input("nombre_comercial", sql.VarChar, req.body.nombre_comercial)
        .input("direccion_entrega", sql.VarChar, req.body.direccion_entrega)
        .input("telefono", sql.VarChar, req.body.telefono)
        .input("email", sql.VarChar, req.body.email)
        .query(
            "Execute SPIClientes @razon_social,@nombre_comercial,@direccion_entrega,@telefono,@email; SELECT top 1 id from clientes order by id desc;"
        );
    res.json({
        id: result.recordset[0].id,
        razon_social: req.body.razon_social,
        nombre_comercial: req.body.nombre_comercial,
        direccion_entrega: req.body.direccion_entrega,
        telefono: req.body.telefono,
        email: req.body.email,
    });
};

export const actualizarCliente = async (req, res) => {
    const pool = await getConnection();
    const result = await pool
        .request()
        .input("id", sql.Int, req.params.id)
        .input("razon_social", sql.VarChar, req.body.razon_social)
        .input("nombre_comercial", sql.VarChar, req.body.nombre_comercial)
        .input("direccion_entrega", sql.VarChar, req.body.direccion_entrega)
        .input("telefono", sql.VarChar, req.body.telefono)
        .input("email", sql.VarChar, req.body.email)
        .query(
            "update Clientes set razon_social=@razon_social,nombre_comercial=@nombre_comercial,direccion_entrega=@direccion_entrega,telefono=@telefono,email=@email where id=@id"
        );

    if (result.rowsAffected[0] === 0) {
        return res.status(404).json({ message: "Cliente no encontrado" });
    }
    res.json({
        id: req.params.id,
        razon_social: req.body.razon_social,
        nombre_comercial: req.body.nombre_comercial,
        direccion_entrega: req.body.direccion_entrega,
        telefono: req.body.telefono,
        email: req.body.email,
    });
};