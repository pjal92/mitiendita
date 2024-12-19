import { Router } from "express";
import {
  getUsuarios,
  getUsuario,
  crearUsuario,
  actualizarUsuario,
} from "../controllers/usuarios.controllers.js";
import { checkAuth } from "../middleware/auth.js";
import { checkRolAuth } from "../middleware/rolAuth.js";

const router = Router();

router.get("/usuarios", checkAuth, checkRolAuth(['Operador']), getUsuarios);
router.get("/usuarios/:id", checkAuth, checkRolAuth(['Operador']), getUsuario);
router.post("/usuarios", checkAuth, checkRolAuth(['Operador', 'Cliente']), crearUsuario);
router.put("/usuarios/:id", checkAuth, checkRolAuth(['Operador', 'Cliente']), actualizarUsuario);

export default router;
