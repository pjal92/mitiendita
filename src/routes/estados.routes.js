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

router.get("/estados", checkAuth, checkRolAuth(['Operador']), getEstados);
router.get("/estados/:id", checkAuth, checkRolAuth(['Operador']), getEstado);
router.post("/estados", checkAuth, checkRolAuth(['Operador']), crearEstado);
router.put("/estados/:id", checkAuth, checkRolAuth(['Operador']), actualizarEstado);

export default router;
