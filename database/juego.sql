/*
	Oscar Noel Hernández García
*/
CREATE DATABASE videojuego;
USE videojuego;

CREATE TABLE usuario(id_usuario INT AUTO_INCREMENT PRIMARY KEY,
					 nombre VARCHAR(100) NOT NULL,
                     apellido VARCHAR(100) NOT NULL,
					 nickname VARCHAR(30) NOT NULL,
                     email VARCHAR(100) NOT NULL,
                     contraseña VARCHAR(100) NOT NULL,
                     fecha_nacimiento DATE NOT NULL,
                     inicio TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
					 experiencia INT DEFAULT 0,
                     nivel INT DEFAULT 0,
                     oro INT DEFAULT 5000,
                     cartas INT DEFAULT 3,
                     UNIQUE (nickname, email));

CREATE TABLE recompenzas(id_recompensa INT AUTO_INCREMENT PRIMARY KEY, 
                         nivel INT NOT NULL,
                         recompensa VARCHAR(30) NOT NULL,
                         cantidad_recompensa INT NOT NULL);
                         
CREATE TABLE cat_reclamo(id_reclamo INT PRIMARY KEY,
						 reclamado VARCHAR(30));
                         
CREATE TABLE rel_usuario_recompensa(id_relacion INT AUTO_INCREMENT PRIMARY key,
									id_usuario INT NOT NULL,
                                    temporada INT NOT NULL,
                                    dia INT NOT NULL,
									FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario) ON DELETE CASCADE,
                                    recompensa INT NOT NULL,
                                    FOREIGN KEY (recompensa) REFERENCES recompenzas(id_recompensa) ON DELETE CASCADE,
                                    contador_recompensa INT,
                                    reclamo_recompensa INT NOT NULL DEFAULT 2,
                                    FOREIGN KEY (reclamo_recompensa) REFERENCES cat_reclamo(id_reclamo) ON DELETE CASCADE,
                                    UNIQUE (id_usuario, temporada, dia));

DELIMITER $$
CREATE PROCEDURE insertar_usuario(nombre1 VARCHAR(100), apellido1 VARCHAR(100), nickname1 VARCHAR(30),email1 VARCHAR(100), contraseña1 VARCHAR(100), fecha_nacimiento1 DATE)
BEGIN
	IF TIMESTAMPDIFF(YEAR, fecha_nacimiento1, CURDATE()) >= 18 THEN
		INSERT INTO usuario(nombre, apellido, nickname, email, contraseña, fecha_nacimiento) VALUES(nombre1, apellido1, nickname1, email1, contraseña1, fecha_nacimiento1);
	ELSE
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'necesitas ser mayor de 18 años';
	END IF;
END$$

/*
	Insertar valores de prueba
*/

INSERT INTO recompenzas(nivel, recompensa, cantidad_recompensa) VALUES(1, "cofre normal", 1);
INSERT INTO recompenzas(nivel, recompensa, cantidad_recompensa) VALUES(2, "cofre normal", 1);
INSERT INTO recompenzas(nivel, recompensa, cantidad_recompensa) VALUES(3, "cofre normal", 1);
INSERT INTO recompenzas(nivel, recompensa, cantidad_recompensa) VALUES(4, "cofre normal", 1);
INSERT INTO recompenzas(nivel, recompensa, cantidad_recompensa) VALUES(5, "cofre normal", 1);

INSERT INTO recompenzas(nivel, recompensa, cantidad_recompensa) VALUES(1, "cofre raro", 1);
INSERT INTO recompenzas(nivel, recompensa, cantidad_recompensa) VALUES(2, "cofre raro", 1);
INSERT INTO recompenzas(nivel, recompensa, cantidad_recompensa) VALUES(3, "cofre raro", 1);
INSERT INTO recompenzas(nivel, recompensa, cantidad_recompensa) VALUES(4, "cofre raro", 1);
INSERT INTO recompenzas(nivel, recompensa, cantidad_recompensa) VALUES(5, "cofre raro", 1);

INSERT INTO recompenzas(nivel, recompensa, cantidad_recompensa) VALUES(1, "cofre legendario", 1);
INSERT INTO recompenzas(nivel, recompensa, cantidad_recompensa) VALUES(2, "cofre legendario", 1);
INSERT INTO recompenzas(nivel, recompensa, cantidad_recompensa) VALUES(3, "cofre legendario", 1);
INSERT INTO recompenzas(nivel, recompensa, cantidad_recompensa) VALUES(4, "cofre legendario", 1);
INSERT INTO recompenzas(nivel, recompensa, cantidad_recompensa) VALUES(5, "cofre legendario", 1);

INSERT INTO recompenzas(nivel, recompensa, cantidad_recompensa) VALUES(1, "oro", 1000);
INSERT INTO recompenzas(nivel, recompensa, cantidad_recompensa) VALUES(1, "oro", 1250);
INSERT INTO recompenzas(nivel, recompensa, cantidad_recompensa) VALUES(1, "oro", 1800);
INSERT INTO recompenzas(nivel, recompensa, cantidad_recompensa) VALUES(2, "oro", 2000);
INSERT INTO recompenzas(nivel, recompensa, cantidad_recompensa) VALUES(2, "oro", 2250);
INSERT INTO recompenzas(nivel, recompensa, cantidad_recompensa) VALUES(2, "oro", 2850);
INSERT INTO recompenzas(nivel, recompensa, cantidad_recompensa) VALUES(3, "oro", 3000);
INSERT INTO recompenzas(nivel, recompensa, cantidad_recompensa) VALUES(3, "oro", 3300);
INSERT INTO recompenzas(nivel, recompensa, cantidad_recompensa) VALUES(3, "oro", 3900);
INSERT INTO recompenzas(nivel, recompensa, cantidad_recompensa) VALUES(4, "oro", 4000);
INSERT INTO recompenzas(nivel, recompensa, cantidad_recompensa) VALUES(4, "oro", 4500);
INSERT INTO recompenzas(nivel, recompensa, cantidad_recompensa) VALUES(4, "oro", 5000);
INSERT INTO recompenzas(nivel, recompensa, cantidad_recompensa) VALUES(5, "oro", 5300);
INSERT INTO recompenzas(nivel, recompensa, cantidad_recompensa) VALUES(5, "oro", 6500);

INSERT INTO recompenzas(nivel, recompensa, cantidad_recompensa) VALUES(1, "gemas", 5);
INSERT INTO recompenzas(nivel, recompensa, cantidad_recompensa) VALUES(1, "gemas", 7);
INSERT INTO recompenzas(nivel, recompensa, cantidad_recompensa) VALUES(1, "gemas", 9);
INSERT INTO recompenzas(nivel, recompensa, cantidad_recompensa) VALUES(2, "gemas", 10);
INSERT INTO recompenzas(nivel, recompensa, cantidad_recompensa) VALUES(2, "gemas", 14);
INSERT INTO recompenzas(nivel, recompensa, cantidad_recompensa) VALUES(2, "gemas", 18);
INSERT INTO recompenzas(nivel, recompensa, cantidad_recompensa) VALUES(3, "gemas", 20);
INSERT INTO recompenzas(nivel, recompensa, cantidad_recompensa) VALUES(3, "gemas", 25);
INSERT INTO recompenzas(nivel, recompensa, cantidad_recompensa) VALUES(3, "gemas", 30);
INSERT INTO recompenzas(nivel, recompensa, cantidad_recompensa) VALUES(4, "gemas", 35);
INSERT INTO recompenzas(nivel, recompensa, cantidad_recompensa) VALUES(4, "gemas", 40);
INSERT INTO recompenzas(nivel, recompensa, cantidad_recompensa) VALUES(4, "gemas", 47);
INSERT INTO recompenzas(nivel, recompensa, cantidad_recompensa) VALUES(5, "gemas", 50);
INSERT INTO recompenzas(nivel, recompensa, cantidad_recompensa) VALUES(5, "gemas", 60);
INSERT INTO recompenzas(nivel, recompensa, cantidad_recompensa) VALUES(5, "gemas", 80);

INSERT INTO recompenzas(nivel, recompensa, cantidad_recompensa) VALUES(1, "pergamino", 1);
INSERT INTO recompenzas(nivel, recompensa, cantidad_recompensa) VALUES(1, "pergamino", 2);
INSERT INTO recompenzas(nivel, recompensa, cantidad_recompensa) VALUES(1, "pergamino", 3);
INSERT INTO recompenzas(nivel, recompensa, cantidad_recompensa) VALUES(2, "pergamino", 3);
INSERT INTO recompenzas(nivel, recompensa, cantidad_recompensa) VALUES(2, "pergamino", 4);
INSERT INTO recompenzas(nivel, recompensa, cantidad_recompensa) VALUES(2, "pergamino", 5);
INSERT INTO recompenzas(nivel, recompensa, cantidad_recompensa) VALUES(3, "pergamino", 4);
INSERT INTO recompenzas(nivel, recompensa, cantidad_recompensa) VALUES(3, "pergamino", 5);
INSERT INTO recompenzas(nivel, recompensa, cantidad_recompensa) VALUES(3, "pergamino", 6);
INSERT INTO recompenzas(nivel, recompensa, cantidad_recompensa) VALUES(4, "pergamino", 5);
INSERT INTO recompenzas(nivel, recompensa, cantidad_recompensa) VALUES(4, "pergamino", 6);
INSERT INTO recompenzas(nivel, recompensa, cantidad_recompensa) VALUES(4, "pergamino", 7);
INSERT INTO recompenzas(nivel, recompensa, cantidad_recompensa) VALUES(5, "pergamino", 7);
INSERT INTO recompenzas(nivel, recompensa, cantidad_recompensa) VALUES(5, "pergamino", 8);
INSERT INTO recompenzas(nivel, recompensa, cantidad_recompensa) VALUES(5, "pergamino", 9);

INSERT INTO recompenzas(nivel, recompensa, cantidad_recompensa) VALUES(1, "experiencia", 50);
INSERT INTO recompenzas(nivel, recompensa, cantidad_recompensa) VALUES(1, "experiencia", 75);
INSERT INTO recompenzas(nivel, recompensa, cantidad_recompensa) VALUES(1, "experiencia", 100);
INSERT INTO recompenzas(nivel, recompensa, cantidad_recompensa) VALUES(2, "experiencia", 100);
INSERT INTO recompenzas(nivel, recompensa, cantidad_recompensa) VALUES(2, "experiencia", 130);
INSERT INTO recompenzas(nivel, recompensa, cantidad_recompensa) VALUES(2, "experiencia", 155);
INSERT INTO recompenzas(nivel, recompensa, cantidad_recompensa) VALUES(3, "experiencia", 160);
INSERT INTO recompenzas(nivel, recompensa, cantidad_recompensa) VALUES(3, "experiencia", 200);
INSERT INTO recompenzas(nivel, recompensa, cantidad_recompensa) VALUES(3, "experiencia", 240);
INSERT INTO recompenzas(nivel, recompensa, cantidad_recompensa) VALUES(4, "experiencia", 250);
INSERT INTO recompenzas(nivel, recompensa, cantidad_recompensa) VALUES(4, "experiencia", 300);
INSERT INTO recompenzas(nivel, recompensa, cantidad_recompensa) VALUES(4, "experiencia", 340);
INSERT INTO recompenzas(nivel, recompensa, cantidad_recompensa) VALUES(5, "experiencia", 400);
INSERT INTO recompenzas(nivel, recompensa, cantidad_recompensa) VALUES(5, "experiencia", 500);
INSERT INTO recompenzas(nivel, recompensa, cantidad_recompensa) VALUES(5, "experiencia", 600);

INSERT INTO cat_reclamo VALUES(1, 'RECLAMADO');
INSERT INTO cat_reclamo VALUES(2, 'NO RECLAMADO');
INSERT INTO cat_reclamo VALUES(3, 'RECOMPENSAS COMPLETAS');

/*
	El store procedure "obtener_recompensa(id_usuario, fecha_inicio)" realiza la distribucion de las recompensas a cada usuario segun su nivel con
    la restriccion de que la recompensa no se repita mas de tres veces y que las recompensas de dos dias consecutivos sean distintas. 
    El argumento fecha_inicio corresponde al primer dia de la primer temporada del juego y será único, no sera necesario actualizar este 
    argumento posteriormente ni para futuras temporadas.
*/

DELIMITER $$
CREATE PROCEDURE 
	obtener_recompensa(id_usuario INT, fecha_inicio DATE)
BEGIN	

    DECLARE recompensa1 INT;
    DECLARE dia INT;
    DECLARE temporada INT;
    
    SET dia = CURDATE() - fecha_inicio;
    SET recompensa1 = (SELECT id_recompensa FROM recompenzas AS a 
					   LEFT JOIN usuario AS b ON a.nivel = b.nivel WHERE b.id_usuario = id_usuario ORDER BY RAND() LIMIT 1);
	SET temporada = CEILING((CURDATE() - fecha_inicio) / 40); 
        
	IF (SELECT COUNT(id_relacion) FROM rel_usuario_recompensa) != 0 THEN
		IF recompensa1 = (SELECT recompensa FROM rel_usuario_recompensa AS a WHERE a.dia = (dia - 1) AND a.id_usuario = id_usuario) THEN 
			CALL obtener_recompensa(id_usuario, dia);
		END IF;
	END IF;
                       
    IF recompensa1 NOT IN (SELECT recompensa FROM rel_usuario_recompensa AS a WHERE a.id_usuario = id_usuario AND a.temporada = temporada) THEN
		INSERT INTO rel_usuario_recompensa(id_usuario, temporada, dia, recompensa) VALUES(id_usuario, temporada, dia, recompensa1);
        UPDATE rel_usuario_recompensa AS a SET contador_recompensa = 1 WHERE a.recompensa = recompensa1 AND a.id_usuario = id_usuario;
        
    ELSEIF recompensa1 IN (SELECT recompensa FROM rel_usuario_recompensa AS a WHERE a.id_usuario = id_usuario AND a.temporada = temporada) AND
		   (SELECT contador_recompensa FROM rel_usuario_recompensa AS a WHERE recompensa1 = a.recompensa AND a.id_usuario = id_usuario 
		   AND a.temporada = temporada) = 2 THEN
		   INSERT INTO rel_usuario_recompensa(id_usuario, temporada, dia, recompensa) VALUES(id_usuario, temporada, dia, recompensa1);
		   UPDATE rel_usuario_recompensa AS a SET contador_recompensa = 3 WHERE a.recompensa = recompensa1 AND a.id_usuario = id_usuario AND a.dia = dia;
            
	ELSEIF recompensa1 IN (SELECT recompensa FROM rel_usuario_recompensa AS a WHERE a.id_usuario = id_usuario AND a.temporada = temporada) AND
		   (SELECT contador_recompensa FROM rel_usuario_recompensa AS a WHERE recompensa1 = a.recompensa AND a.id_usuario = id_usuario
           AND a.temporada = temporada) = 1 THEN
		   INSERT INTO rel_usuario_recompensa(id_usuario, temporada, dia, recompensa) VALUES(id_usuario, temporada, dia, recompensa1);
		   UPDATE rel_usuario_recompensa AS a SET contador_recompensa = 2 WHERE a.recompensa = recompensa1 AND a.id_usuario = id_usuario AND a.dia = dia;
	
	ELSE 
		CALL obtener_recompensa(id_usuario, fecha_inicio);
	END IF;
    
    IF (SELECT COUNT(recompensa) FROM rel_usuario_recompensa AS a WHERE a.id_usuario = id_usuario AND a.temporada = temporada) > 30 THEN
		UPDATE rel_usuario_recompensa AS a SET reclamo_recompensa = 3 WHERE a.id_usuario = id_usuario AND a.temporada = temporada;
	END IF;
END $$

/*
	El store procedure "recompensa_diaria()" le asigna a cada usuario una recompensa diaria por lo cual este store procedure se
    pretende ejecutar una vez al dia usando un EVENT que se ejecute cada dia a las 00:00:00
*/

DELIMITER $$
CREATE PROCEDURE recompensa_diaria()
BEGIN	
	DECLARE i INT DEFAULT 1;
    WHILE i <= (SELECT COUNT(id_usuario) FROM usuario) DO 
		/*
        IMPORTANTE. Especificar un dia antes en que se quierer iniciar la temporada 1 (ejemplo: si se quiere iniciar la temporada en '2000-01-01' la fecha ingresada será
        '1999-12-31'), esta fecha es unica y no debe modificarse posteriormente para futuras temporadas
        */
		CALL obtener_recompensa(i, '2022-11-27');
        SET i = i + 1;
	END WHILE;
END $$

/*
	El store procedure "reclamar_recompensa(temporada, id_usuario, dia)" se ejecutara cada vez que el usuario reclame una recompensa y al ser
    los valores "temporada", "id_usuario" y "dia" unicos en la tabla rel_usuario_recompensa, podemos asegurar que la recompensa que se les da 
    a los usuarios es una cada dia
*/
    
DELIMITER $$
CREATE PROCEDURE reclamar_recompensa(temporada INT, id_usuario INT, dia INT)
BEGIN
	IF (SELECT reclamo_recompensa FROM rel_usuario_recompensa AS a WHERE a.temporada = temporada AND a.id_usuario = id_usuario AND a.dia = dia) = 3 THEN
		UPDATE rel_usuario_recompensa AS a SET reclamo_recompensa = 3 WHERE a.temporada = temporada AND a.id_usuario = id_usuario AND a.dia = dia; 
	ELSE
		UPDATE rel_usuario_recompensa AS a SET reclamo_recompensa = 1 WHERE a.temporada = temporada AND a.id_usuario = id_usuario AND a.dia = dia; 
	END IF;
END $$

CREATE EVENT mievento
ON SCHEDULE AT '2022-11-28' + INTERVAL 1 DAY
DO CALL recompensa_diaria();