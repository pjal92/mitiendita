import jwt from "jsonwebtoken";
import "dotenv/config";

export const tokenSign = async (codigo, role) => {
  return jwt.sign(
    {
      id: codigo,
      rol: role,
    },
    process.env.JWT_SECRET,
    {
      expiresIn: "24h",
    }
  );
};

export const verifyToken = async (token) => {
  try {
    return jwt.verify(token, process.env.JWT_SECRET);
  } catch (error) {
    return null;
  }
};

export const decodeSign = (token) => {};
