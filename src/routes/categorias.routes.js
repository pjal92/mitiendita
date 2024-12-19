import { Router } from "express";
import {
  getCategorias,
  getCategoria,
  crearCategoria,
  actualizarCategoria,
} from "../controllers/categorias.controllers.js";
import { checkAuth } from "../middleware/auth.js";
import { checkRolAuth } from "../middleware/rolAuth.js";

const router = Router();

router.get("/categorias", checkAuth, checkRolAuth(['Operador']), getCategorias);
router.get("/categorias/:id", checkAuth, checkRolAuth(['Operador']), getCategoria);
router.post("/categorias", checkAuth, checkRolAuth(['Operador']), crearCategoria);
router.put("/categorias/:id", checkAuth, checkRolAuth(['Operador']), actualizarCategoria);

export default router;
