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

router.get("/clientes", checkAuth, checkRolAuth(['Operador']), getClientes);
router.get("/clientes/:id", checkAuth, checkRolAuth(['Operador']), getCliente);
router.post("/clientes", checkAuth, checkRolAuth(['Operador']), crearCliente);
router.put("/clientes/:id", checkAuth, checkRolAuth(['Operador']), actualizarCliente);

export default router;
