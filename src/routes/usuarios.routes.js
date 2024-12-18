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

router.get("/usuarios", checkAuth, checkRolAuth(['Administrador']), getUsuarios);
router.get("/usuarios/:id", checkAuth, checkRolAuth(['Administrador']), getUsuario);
router.post("/usuarios", checkAuth, checkRolAuth(['Administrador', 'Comprador']), crearUsuario);
router.put("/usuarios/:id", checkAuth, checkRolAuth(['Administrador', 'Comprador']), actualizarUsuario);

export default router;
