import sql from "mssql";
import { DB_HOST, DB_DATABASE, DB_PASSWORD, DB_USER } from "../config.js";

const dbSettings = {
  user: DB_USER,
  password: DB_PASSWORD,
  server: DB_HOST,
  database: DB_DATABASE,
  options: {
    encrypt: false,
    trustServerCertificate: true,
  }
};

export const getConnection = async () => {
  try {
    const pool = await sql.connect(dbSettings);
    return pool;
  } catch (error) {
    console.error(error);
  }
};
