import sql from "mssql";

const dbSettings = {
  user: "sa",
  password: "123",
  server: "localhost",
  database: "GDA00129-OT+pedroalonzo",
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
