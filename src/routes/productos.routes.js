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

router.get("/productos", checkAuth, checkRolAuth(['Administrador', 'Digitador',  'Comprador']), getProductos);
router.get("/productos/:id", checkAuth, checkRolAuth(['Administrador', 'Digitador',  'Comprador']), getProducto);
router.post("/productos", checkAuth, checkRolAuth(['Administrador', 'Digitador']), crearProducto);
router.put("/productos/:id", checkAuth, checkRolAuth(['Administrador', 'Digitador']), actualizarProducto);

export default router;
