import express from "express";
import productosRoutes from "./routes/productos.routes.js";
import categoriasRoutes from "./routes/categorias.routes.js";
import estadosRoutes from "./routes/estados.routes.js";
import usuariosRoutes from "./routes/usuarios.routes.js";
import clientesRoutes from "./routes/clientes.routes.js";
import authRoutes from "./routes/auth.routes.js";
import ordenRoutes from "./routes/orden.routes.js";

const app = express();

app.use(express.json());

app.use(productosRoutes);
app.use(categoriasRoutes);
app.use(ordenRoutes);
app.use(estadosRoutes);
app.use(usuariosRoutes);
app.use(clientesRoutes);
app.use(authRoutes);

export default app;
