import express from "express";
import morgan from "morgan";
import juego from "./juego";
import jwt from "jsonwebtoken";

const app = express();

app.set("port", 4000);
app.use(morgan("dev"));
app.use(express.json());

const secretKey = "secreto";

app.use((req, res, next) => {
    const token = req.header("Authorization");
    
    if (req.path === '/api/usuario' && req.method === 'POST') {
        return next();
    }

    if (!token) {
        return res.status(401).json({ message: "Token not provided" });
    }

    try {
        console.log("Token recibido:", token);
        const decoded = jwt.verify(token, secretKey); 
        req.user = decoded.nickname;
        next();
    } catch (error) {
        return res.status(401).json({ message: "Invalid token" });
    }
});

app.use("/api/usuario", juego);

export default app;


