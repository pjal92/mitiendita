import { Router } from "express";
import {
  getEstados,
  getEstado,
  crearEstado,
  actualizarEstado,
} from "../controllers/estados.controllers.js";
import { checkAuth } from "../middleware/auth.js";
import { checkRolAuth } from "../middleware/rolAuth.js";

const router = Router();

router.get("/estados", checkAuth, checkRolAuth(['Administrador', 'Digitador']), getEstados);
router.get("/estados/:id", checkAuth, checkRolAuth(['Administrador', 'Digitador']), getEstado);
router.post("/estados", checkAuth, checkRolAuth(['Administrador']), crearEstado);
router.put("/estados/:id", checkAuth, checkRolAuth(['Administrador']), actualizarEstado);

export default router;
