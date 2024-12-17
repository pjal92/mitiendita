import { verifyToken } from "../helpers/generateToken.js";

export const checkAuth = async (req, res, next) => {
  try {
    const token = req.headers.authorization.split(' ').pop();
    const tokenData = await verifyToken(token);
    if (tokenData.id) {
      next();
    } else {
      res.status(409);
      res.send({ error: "Acceso Restringido" });
    }
  } catch (error) {
    res.status(409);
    res.send({ error: "Acceso Restringido" });
  }
};

