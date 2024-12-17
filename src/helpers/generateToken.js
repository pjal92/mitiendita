import jwt from "jsonwebtoken";
import { JWT_SECRET, JWT_EXPIRES } from "../config.js"

export const tokenSign = async (codigo, rol) => {
  return jwt.sign(
    {
      id: codigo,
      rol: rol,
    },
    JWT_SECRET,
    {
      expiresIn: JWT_EXPIRES,
    }
  );
};

export const verifyToken = async (token) => {
  try {
    return jwt.verify(token, JWT_SECRET);
  } catch (error) {
    return null;
  }
};