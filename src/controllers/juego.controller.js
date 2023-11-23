import {getConnection} from "../database/database"
import jwt from "jsonwebtoken"; 

const secretKey = "secreto";
const nombreApellidoRegex = /^[a-zA-ZáéíóúÁÉÍÓÚüÜñÑ\s']+$/;
const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
const passwordRegex = /^\d+$/;
const dateOfBirthRegex = /^\d{4}-\d{2}-\d{2}$/;

const generateToken = (user) => {
    return jwt.sign(user, secretKey);
};


const addUser = async (req, res) => {
    try {
        const { nombre, apellido, nickname, email, contraseña, fecha_nacimiento } = req.body;

        if (
            nombre === undefined ||
            apellido === undefined ||
            nickname === undefined ||
            email === undefined ||
            contraseña === undefined ||
            fecha_nacimiento === undefined ||
            !nombreApellidoRegex.test(nombre) ||
            !nombreApellidoRegex.test(apellido) ||
            !passwordRegex.test(contraseña) ||
            !emailRegex.test(email) ||
            !dateOfBirthRegex.test(fecha_nacimiento)
        ) {
            return res.status(400).json({ message: "Bad request." });
        }

        const connection = await getConnection();
        const result = await connection.query("CALL insertar_usuario(?,?,?,?,?,?);", [
            nombre,
            apellido,
            nickname,
            email,
            contraseña,
            fecha_nacimiento,
        ]);

        const token = generateToken({ nickname });
        console.log("Token generado:", token);
        res.json({ message: "User registered successfully", token });
    } catch (error) {
        console.log(error.message);
        res.status(500).json({ error: error.message });
    }
};

const getUser=async(req, res)=>{
    try {
		const { id } = req.params;

		if (!req.user) {
            return res.status(401).json({ message: "Token not provided" });
        }

    	const connection=await getConnection();
		const result=await connection.query("SELECT * FROM usuario WHERE id_usuario = ?", id);
		res.json(result);
    } catch(error) {
    	res.status(500);
    	res.send(error.message);
    }
};

const getUsers = async (req, res) => {
    try {
        const connection = await getConnection();
        const result = await connection.query("SELECT id_usuario, nombre, apellido, nickname FROM usuario");
        res.json({ users: result });
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};

const deleteUser=async(req, res)=>{
    try {
		const { id } = req.params;
    	const connection=await getConnection();
		const result=await connection.query("DELETE FROM usuario WHERE id_usuario = ?", id);
		res.json(result);
    } catch(error) {
    	res.status(500);
    	res.send(error.message);
    }
};

export const methods = {
    getUsers,
    addUser,
	getUser,
	deleteUser
};
