import { Router } from "express";
import { getOrdenes, getOrden, createOrdenDetalles, updateOrdenDetalles } from "../controllers/ordendetalles.controllers.js";
import { checkAuth } from "../middleware/auth.js";
import { checkRolAuth } from "../middleware/rolAuth.js";

const router = Router();

router.get("/ordenes/:usuario", checkAuth, checkRolAuth(['Operador', 'Operador']), getOrdenes);
router.get("/orden/:id", checkAuth, checkRolAuth(['Operador', 'Cliente']), getOrden);
router.post("/orden", checkAuth, checkRolAuth(['Operador', 'Cliente']), createOrdenDetalles);
router.put("/orden/:id", checkAuth, checkRolAuth(['Operador', 'Cliente']), updateOrdenDetalles);

export default router;
