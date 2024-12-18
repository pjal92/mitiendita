import { Router } from "express";
import { getOrdenes, getOrden, createOrdenDetalles, updateOrdenDetalles } from "../controllers/ordendetalles.controllers.js";
import { checkAuth } from "../middleware/auth.js";
import { checkRolAuth } from "../middleware/rolAuth.js";

const router = Router();

router.get("/ordenes/:usuario", checkAuth, checkRolAuth(['Administrador', 'Digitador',  'Comprador']), getOrdenes);
router.get("/orden/:id", checkAuth, checkRolAuth(['Administrador', 'Digitador',  'Comprador']), getOrden);
router.post("/orden", checkAuth, checkRolAuth(['Administrador', 'Digitador', 'Comprador']), createOrdenDetalles);
router.put("/orden/:id", checkAuth, checkRolAuth(['Administrador', 'Digitador', 'Comprador']), updateOrdenDetalles);

export default router;
