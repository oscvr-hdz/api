import { Router } from "express";
import { methods as usuario } from "../controllers/juego.controller";

const router=Router();
    

router.get("/", usuario.getUsers);
router.get("/:id", usuario.getUser);
router.post("/", usuario.addUser);
router.delete("/:id", usuario.deleteUser);

export default router;
