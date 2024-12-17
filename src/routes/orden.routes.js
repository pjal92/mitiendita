import { Router } from "express";
import { crearOrdenDetalles } from "../controllers/ordendetalles.controllers.js";
import { checkAuth } from "../middleware/auth.js";
import { checkRolAuth } from "../middleware/rolAuth.js";

const router = Router();

router.post("/orden", checkAuth, checkRolAuth(['Administrador', 'Digitador', 'Comprador']), crearOrdenDetalles);

export default router;
