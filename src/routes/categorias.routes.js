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

router.get("/categorias", checkAuth, checkRolAuth(['Administrador', 'Digitador']), getCategorias);
router.get("/categorias/:id", checkAuth, checkRolAuth(['Administrador', 'Digitador']), getCategoria);
router.post("/categorias", checkAuth, checkRolAuth(['Administrador', 'Digitador']), crearCategoria);
router.put("/categorias/:id", checkAuth, checkRolAuth(['Administrador', 'Digitador']), actualizarCategoria);

export default router;
