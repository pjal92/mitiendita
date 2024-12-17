import { Router } from "express";
import {
  getClientes,
  getCliente,
  crearCliente,
  actualizarCliente,
} from "../controllers/clientes.controllers.js";
import { checkAuth } from "../middleware/auth.js";
import { checkRolAuth } from "../middleware/rolAuth.js";

const router = Router();

router.get("/clientes", checkAuth, checkRolAuth(['Administrador', 'Digitador']), getClientes);
router.get("/clientes/:id", checkAuth, checkRolAuth(['Administrador', 'Digitador']), getCliente);
router.post("/clientes", checkAuth, checkRolAuth(['Administrador', 'Digitador']), crearCliente);
router.put("/clientes/:id", checkAuth, checkRolAuth(['Administrador', 'Digitador']), actualizarCliente);

export default router;
