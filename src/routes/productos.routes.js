import { Router } from "express";
import {
  getProductos,
  getProducto,
  crearProducto,
  actualizarProducto,
} from "../controllers/productos.controllers.js";
import { checkAuth } from "../middleware/auth.js";
import { checkRolAuth } from "../middleware/rolAuth.js";

const router = Router();

router.get("/productos", checkAuth, checkRolAuth(['Operador','Cliente']), getProductos);
router.get("/productos/:id", checkAuth, checkRolAuth(['Operador', 'Cliente']), getProducto);
router.post("/productos", checkAuth, checkRolAuth(['Operador']), crearProducto);
router.put("/productos/:id", checkAuth, checkRolAuth(['Operador']), actualizarProducto);

export default router;
