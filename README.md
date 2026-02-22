# Mysql_1st_Training_Space
En este repositorio estaré practicando SQL desde cero, no como profesor sino como un alumno que no sabe nada del tema... Quieres acompañarme?
select first_name, last_name from actor; -- #Muestra solo las columnas first  and last name de la tabla actor

select title, release_year, language_id from film; -#Muestra solo el titulo, año de lanzamiento y el language ID de film

SELECT DISTINCT city_id, city FROM city; --- #Muestra los valores únicos que están en ciry_id y city en city

select * from payment;

SELECT * FROM payment WHERE amount > 2 AND amount <9; -- #Muestra todos la tabla pero filtrando por los valores que están entre 2 y 9

SELECT * FROM actor ORDER BY first_name, last_update, actor_id; -- #Muestra toda la tabla pero ordenado primero por firs name, despues por last update y ultimo actor id

SELECT first_name FROM actor ORDER BY last_name DESC; 

SELECT first_name, last_name
FROM actor 
WHERE last_name LIKE 'G%'; ## Muestra solo first name, last name de la tabal actor, filtrando por los last name que inicien con G

SELECT * 
FROM actor
WHERE NOT first_name LIKE '%A%' AND last_name LIKE 'D%'; --- #tabla actor filtrado por esas dos condiciones combinadas con AND. Es decir, actores cuyo nombre no tiene "A" y cuyo apellido empieza por "D"

SELECT * 
FROM actor
WHERE NOT first_name LIKE '%A%' AND last_name LIKE 'D%'
ORDER BY actor_id DESC
LIMIT 3;

# Mysql_1st_Training_Space
En este repositorio estaré practicando SQL desde cero, no como profesor sino como un alumno que no sabe nada del tema... Quieres acompañarme?
select first_name, last_name from actor; -- #Muestra solo las columnas first  and last name de la tabla actor

select title, release_year, language_id from film; -#Muestra solo el titulo, año de lanzamiento y el language ID de film

SELECT DISTINCT city_id, city FROM city; --- #Muestra los valores únicos que están en ciry_id y city en city

select * from payment;

SELECT * FROM payment WHERE amount > 2 AND amount <9; -- #Muestra todos la tabla pero filtrando por los valores que están entre 2 y 9

SELECT * FROM actor ORDER BY first_name, last_update, actor_id; -- #Muestra toda la tabla pero ordenado primero por firs name, despues por last update y ultimo actor id

SELECT first_name FROM actor ORDER BY last_name DESC; 

SELECT first_name, last_name
FROM actor 
WHERE last_name LIKE 'G%'; ## Muestra solo first name, last name de la tabal actor, filtrando por los last name que inicien con G

SELECT * 
FROM actor
WHERE NOT first_name LIKE '%A%' AND last_name LIKE 'D%'; --- #tabla actor filtrado por esas dos condiciones combinadas con AND. Es decir, actores cuyo nombre no tiene "A" y cuyo apellido empieza por "D"

SELECT * 
FROM actor
WHERE NOT first_name LIKE '%A%' AND last_name LIKE 'D%'
ORDER BY actor_id DESC
LIMIT 3;

SELECT * FROM actor
WHERE last_update IS NOT NULL AND actor_id >50; -- #Manejando los NULL y NOT NULL con los AND
SELECT * FROM inventory;




SELECT MAX(film_id) FROM inventory
WHERE store_id = 2; -- #Manejando los Max y Min


SELECT AVG (Precio)
FROM productos; -- #Muestra el Promedio del Precio

SELECT * FROM productos
WHERE `Categoria` IN ('Ni el sabe','Ryzark');  -- #Comando 'IN' ayuda a filtrar por valores de texto más especificos

SELECT `Nombre`, `Categoria`, `Stock`, `Fecha_Registro` as 'Registro' -- #Comando AS Crea un Nuevo Alias para la columna  
FROM productos
WHERE `Precio` BETWEEN 500.51 AND 100000.00; -- #Comando 'IN' ayuda a filtrar por valores númericos más especificos 

SELECT `Fecha_Registro`
FROM productos;

SELECT COUNT(Precio) as Cuenta_Precio, Precio, COUNT(Stock) as Cuenta_Stock -- # GROUP BY y ORDER BY por Precio, donde Precio está entre 750 y 5,500 y donde stock es mayor a 0
FROM productos
WHERE Precio BETWEEN 700 AND 5500 AND  Stock > 2 
GROUP BY Precio 
ORDER BY Precio ASC;

SELECT * FROM productos;

INSERT INTO Productos (Nombre, Categoria, Precio, Stock) -- #Crea una Nueva Fila 
VALUES 
('Mencho', 'Finisima', 45698.65, 45);

UPDATE Productos -- #Actualiza los valores de la fila Categoria y Stock donde Producto ID sea Mayor que 5 y Precio = 750.35
SET Categoria = 'Test', Stock = 55
WHERE ProductoID >5 AND Precio =750.35;


SELECT Categoria, COUNT(Stock) as Cuenta_Registro, AVG(Precio) as Total_Precio, SUM(Stock) as Total_Stock  -- #La cláusula HAVING se agregó a SQL porque la palabra clave WHERE no se puede usar con funciones agregadas.
FROM productos -- #Muestra los resultados de Todas las categorias donde el Nombre no sea 'Laptop Dell Inspiration', donde la suma de Stock sea mayor
WHERE Nombre <> 'Laptop Dell Inspiration'
GROUP BY Categoria
HAVING SUM(Stock) > 10
ORDER BY AVG(Precio) DESC;



CREATE TABLE Clientes (  --#Crear tablas
Client_ID INT AUTO_INCREMENT PRIMARY KEY,
Nombre VARCHAR(50) NOT NULL,
Email VARCHAR(50));

CREATE TABLE Cuentas (
ID INT AUTO_INCREMENT PRIMARY KEY,
Client_ID INT NOT NULL,
Tipo VARCHAR(50) NOT NULL,
Saldo INT,
FOREIGN KEY (Client_ID) REFERENCES Clientes(Client_ID));

CREATE TABLE Movimientos (
ID INT AUTO_INCREMENT PRIMARY KEY,
Cuenta_ID INT NOT NULL,
Fecha DATE NOT NULL,
Tipo VARCHAR(50) NOT NULL,
Monto INT,
FOREIGN KEY (Cuenta_ID) REFERENCES Cuentas(ID));

INSERT INTO `tiendaonline_test`.`movimientos` (`id`, `cuenta_id`, `fecha`, `tipo`, `monto`) --#INGRESARLE DATOS
VALUES (2,16,'2025-10-23','deposit',437.41),
(3,32,'2025-2-2','deposit',4890.14),
(4,35,'2025-12-2','deposit',650.67),
(5,31,'2026-1-26','deposit',1332.63),
(6,56,'2024-12-31','withdrawal',-4822.17),
(7,60,'2025-7-2','deposit',3567.62),
(8,26,'2024-6-26','withdrawal',-2196.12),
(9,34,'2025-6-25','withdrawal',-613.81),
(10,15,'2024-2-12','deposit',1697.05),
(11,38,'2024-2-4','deposit',2946.32),
(12,1,'2025-6-28','deposit',3542.13),
(13,4,'2024-11-12','deposit',346.33),
(14,3,'2025-5-27','withdrawal',-363.58),
(15,16,'2025-12-4','withdrawal',-3348.2),
(16,14,'2025-2-5','deposit',3619.53),
(17,57,'2025-6-1','withdrawal',-1222.56),
(18,31,'2025-9-1','withdrawal',-960.15),
(19,7,'2025-3-13','withdrawal',-1777.94),
(20,27,'2024-6-3','withdrawal',-4320.55),
(21,4,'2025-12-1','deposit',312.46),
(22,47,'2025-2-18','withdrawal',-4004.96),
(23,7,'2024-2-18','deposit',966.03),
(24,35,'2024-8-28','withdrawal',-709.51),
(25,12,'2025-6-9','withdrawal',-2318.51),
(26,56,'2026-1-17','deposit',2221.22),
(27,56,'2024-4-27','deposit',262.44),
(28,35,'2024-2-25','deposit',4845.29),
(29,60,'2024-12-13','deposit',839.89),
(30,32,'2024-2-24','withdrawal',-1076.6),
(31,26,'2024-9-2','deposit',831.54),
(32,1,'2025-5-29','withdrawal',-1333.36),
(33,51,'2025-8-28','withdrawal',-1433.39),
(34,45,'2024-3-18','withdrawal',-782.44),
(35,19,'2025-5-15','deposit',4843.86),
(36,38,'2024-8-10','deposit',3742.4),
(37,4,'2024-3-27','deposit',2925.05),
(38,33,'2024-11-28','deposit',293.83),
(39,33,'2025-2-3','deposit',4258.2),
(40,5,'2024-9-3','deposit',3379.31),
(41,16,'2024-10-14','withdrawal',-608.23),
(42,57,'2024-7-30','deposit',2898.81),
(43,3,'2024-7-31','deposit',2101.93),
(44,38,'2025-2-6','withdrawal',-4674.18),
(45,14,'2024-2-28','withdrawal',-1201.04),
(46,26,'2025-12-5','deposit',3361.73),
(47,20,'2024-7-5','withdrawal',-1587.72),
(48,49,'2025-9-5','deposit',56.48),
(49,40,'2024-11-10','deposit',375.57),
(50,14,'2025-1-30','withdrawal',-670.96),
(51,23,'2025-1-30','deposit',4397.56),
(52,24,'2024-12-8','withdrawal',-797.16),
(53,54,'2025-7-12','withdrawal',-3062.27),
(54,52,'2025-7-3','deposit',3342.64),
(55,36,'2025-9-8','withdrawal',-4659.46),
(56,7,'2025-7-16','deposit',1329.68),
(57,57,'2024-7-1','deposit',3714.66),
(58,10,'2025-11-29','withdrawal',-1415.96),
(59,14,'2024-10-10','withdrawal',-1025.95),
(60,41,'2025-1-23','withdrawal',-2531.99),
(61,17,'2025-3-16','deposit',470.57),
(62,28,'2025-6-5','withdrawal',-229.99),
(63,22,'2025-4-1','deposit',3189.2),
(64,17,'2025-2-26','deposit',3708.74),
(65,36,'2024-3-9','withdrawal',-2808.93),
(66,8,'2025-6-8','deposit',4725.8),
(67,45,'2025-11-17','deposit',2732.5),
(68,54,'2024-12-24','withdrawal',-2916.72),
(69,10,'2024-12-11','withdrawal',-645.95),
(70,20,'2025-5-10','withdrawal',-4495.92),
(71,51,'2025-11-8','deposit',4495.63),
(72,14,'2024-4-28','deposit',3338),
(73,23,'2024-8-3','withdrawal',-4869.45),
(74,48,'2024-11-27','deposit',4629.56),
(75,16,'2024-6-23','deposit',4881.27),
(76,52,'2024-6-13','deposit',4408.27),
(77,2,'2024-5-15','deposit',3685.46),
(78,22,'2025-6-1','withdrawal',-4013.15),
(79,56,'2024-9-21','deposit',1341.36),
(80,51,'2024-7-10','deposit',1918.88),
(81,3,'2025-6-13','withdrawal',-1119.94),
(82,53,'2024-5-5','withdrawal',-1754.8),
(83,53,'2025-12-4','deposit',1122.39),
(84,43,'2024-8-8','deposit',1998.35),
(85,18,'2024-6-24','deposit',4834.78),
(86,18,'2024-8-5','withdrawal',-3210.99),
(87,26,'2024-8-10','withdrawal',-4696.79),
(88,8,'2024-6-18','withdrawal',-901.05),
(89,17,'2025-7-17','deposit',550.93),
(90,28,'2025-7-21','withdrawal',-3645.44),
(91,21,'2024-8-11','withdrawal',-3034.98),
(92,33,'2024-11-25','deposit',1932.13),
(93,37,'2025-2-25','deposit',1281.07),
(94,46,'2025-10-20','withdrawal',-18.44),
(95,60,'2025-5-11','deposit',1827.47),
(96,5,'2024-6-26','withdrawal',-3119.55),
(97,43,'2024-6-7','deposit',3601.57),
(98,20,'2025-8-5','withdrawal',-3337.8),
(99,21,'2024-11-14','withdrawal',-3489.07),
(100,36,'2024-2-10','deposit',967.28),
(101,43,'2025-1-15','withdrawal',-3389.82),
(102,58,'2025-12-7','deposit',3081.42),
(103,20,'2025-5-5','withdrawal',-2744.21),
(104,1,'2025-3-31','withdrawal',-1441.7),
(105,28,'2025-12-2','withdrawal',-2330.29),
(106,29,'2026-1-24','deposit',2560.76),
(107,51,'2025-9-20','deposit',3297.67),
(108,19,'2025-1-9','withdrawal',-476),
(109,49,'2025-3-24','deposit',3367.25),
(110,15,'2025-5-5','deposit',745.3),
(111,3,'2024-1-29','deposit',4919.84),
(112,40,'2024-11-19','deposit',2282.53),
(113,57,'2025-7-28','deposit',3594.55),
(114,25,'2025-3-17','withdrawal',-2004.27),
(115,10,'2025-9-13','deposit',4464.37),
(116,56,'2025-4-3','deposit',3894.32),
(117,15,'2024-12-11','deposit',4022.51),
(118,45,'2025-6-26','withdrawal',-260.59),
(119,16,'2024-11-12','deposit',2287.74),
(120,52,'2026-1-26','withdrawal',-3341.21),
(121,36,'2025-1-23','withdrawal',-4750.7),
(122,58,'2025-5-10','withdrawal',-3067.14),
(123,47,'2024-3-16','withdrawal',-4154.54),
(124,36,'2025-3-5','withdrawal',-4487.07),
(125,48,'2025-7-3','withdrawal',-2255.85),
(126,49,'2024-12-15','deposit',4200.92),
(127,18,'2025-11-19','withdrawal',-3137.47),
(128,18,'2026-1-19','withdrawal',-396.64),
(129,19,'2024-10-28','deposit',1365.86),
(130,21,'2024-2-15','deposit',700.49),
(131,15,'2024-9-1','withdrawal',-3472.81),
(132,46,'2024-12-28','deposit',330.5),
(133,27,'2025-12-18','withdrawal',-2717.63),
(134,27,'2025-6-23','deposit',1042.1),
(135,27,'2025-5-13','withdrawal',-4525.14),
(136,38,'2025-10-1','deposit',4285.09),
(137,49,'2024-6-11','withdrawal',-2390.13),
(138,23,'2024-3-18','withdrawal',-3769.84),
(139,55,'2024-8-23','withdrawal',-2695.72),
(140,48,'2025-10-17','deposit',2446.27),
(141,18,'2025-3-18','withdrawal',-2433.35),
(142,25,'2024-12-5','withdrawal',-3347.68),
(143,52,'2025-12-9','withdrawal',-3623.67),
(144,54,'2025-3-13','withdrawal',-4598.51),
(145,40,'2025-12-2','deposit',4535.58),
(146,38,'2025-3-19','deposit',428.9),
(147,28,'2025-11-3','deposit',4335.59),
(148,12,'2024-4-21','deposit',1308.18),
(149,21,'2024-3-12','deposit',2278.95),
(150,22,'2024-10-19','withdrawal',-1398.5),
(151,54,'2025-6-10','withdrawal',-1268.83),
(152,6,'2024-5-4','withdrawal',-106.72),
(153,35,'2024-10-15','deposit',4999.54),
(154,23,'2024-3-31','deposit',3254.22),
(155,50,'2024-12-8','deposit',3773.62),
(156,16,'2024-8-14','deposit',4197.75),
(157,40,'2025-4-22','deposit',1200.34),
(158,31,'2025-6-1','deposit',2824.21),
(159,14,'2025-5-2','withdrawal',-3500.33),
(160,50,'2024-8-9','withdrawal',-847.27),
(161,39,'2025-10-5','deposit',3891.18),
(162,11,'2024-9-11','withdrawal',-549.41),
(163,2,'2024-7-17','withdrawal',-2883.23),
(164,59,'2024-10-2','withdrawal',-1989.31),
(165,46,'2025-6-28','deposit',389.22),
(166,45,'2025-8-24','deposit',518.49),
(167,50,'2025-12-20','withdrawal',-4252.96),
(168,39,'2024-11-7','deposit',3983.17),
(169,37,'2025-4-24','deposit',1742.55),
(170,28,'2026-1-22','withdrawal',-354.09),
(171,42,'2025-2-18','withdrawal',-73.13),
(172,27,'2024-5-26','withdrawal',-536.64),
(173,24,'2025-5-26','withdrawal',-3539.47),
(174,28,'2025-4-28','deposit',3671.64),
(175,42,'2026-1-11','withdrawal',-3083.4),
(176,59,'2025-11-23','withdrawal',-2329.72),
(177,53,'2024-5-7','withdrawal',-1618.3),
(178,16,'2024-6-2','deposit',1401.85),
(179,29,'2024-2-24','deposit',3754.88),
(180,37,'2025-10-25','withdrawal',-1688.62),
(181,32,'2024-5-27','withdrawal',-917.38),
(182,14,'2025-7-19','withdrawal',-3991.18),
(183,22,'2024-9-17','withdrawal',-4402.8),
(184,45,'2025-3-10','withdrawal',-2783.4),
(185,34,'2025-12-14','deposit',437.21),
(186,47,'2024-12-15','withdrawal',-2448),
(187,49,'2024-8-22','deposit',3456.14),
(188,42,'2025-1-6','withdrawal',-2246.39),
(189,2,'2026-1-23','deposit',1478.24),
(190,26,'2024-8-2','deposit',1537.97),
(191,38,'2025-8-22','withdrawal',-2371.57),
(192,34,'2024-12-28','withdrawal',-2133.26),
(193,48,'2024-8-31','withdrawal',-1765.53),
(194,30,'2025-11-5','withdrawal',-1540.05),
(195,15,'2024-5-24','deposit',3609.21),
(196,21,'2024-8-15','deposit',3716.98),
(197,49,'2024-9-15','deposit',965.79),
(198,48,'2025-1-25','withdrawal',-1389.73),
(199,38,'2026-1-7','withdrawal',-4902.75),
(200,54,'2025-6-13','deposit',1488.27),
(201,24,'2025-2-4','deposit',1518.32),
(202,46,'2024-5-5','deposit',1378.81),
(203,4,'2024-9-14','withdrawal',-3490.11),
(204,9,'2025-8-3','withdrawal',-521.91),
(205,1,'2025-11-30','withdrawal',-2352.29),
(206,29,'2025-3-31','withdrawal',-929.97),
(207,4,'2024-3-20','withdrawal',-4705.91),
(208,31,'2025-10-23','deposit',4112.36),
(209,26,'2024-9-17','withdrawal',-379.67),
(210,41,'2024-1-30','deposit',767.12),
(211,52,'2024-3-18','withdrawal',-435.05),
(212,16,'2025-11-10','deposit',2794.78),
(213,27,'2024-12-5','deposit',3880.71),
(214,25,'2024-6-5','withdrawal',-4543.44),
(215,20,'2024-7-8','withdrawal',-1533.85),
(216,40,'2024-2-25','deposit',3052.06),
(217,48,'2025-7-16','deposit',4738.48),
(218,14,'2024-8-24','deposit',1330.58),
(219,6,'2024-7-21','deposit',1206.93),
(220,36,'2024-5-9','deposit',791.1),
(221,27,'2024-7-29','withdrawal',-3449.96),
(222,31,'2025-3-12','withdrawal',-172.87),
(223,19,'2024-5-25','withdrawal',-3517.91),
(224,30,'2025-2-6','deposit',3440.05),
(225,60,'2024-2-20','withdrawal',-3941.26),
(226,41,'2025-5-23','deposit',2131.44),
(227,35,'2025-5-7','deposit',3241.7),
(228,59,'2024-6-17','withdrawal',-4134.89),
(229,5,'2024-5-24','deposit',837.95),
(230,20,'2025-2-7','withdrawal',-2201.38),
(231,30,'2025-3-12','withdrawal',-3501.67),
(232,18,'2026-1-20','withdrawal',-2194.42),
(233,39,'2025-10-25','deposit',4448.22),
(234,48,'2026-1-2','withdrawal',-3022.53),
(235,2,'2024-7-25','deposit',1152.33),
(236,44,'2024-6-15','deposit',4997.87),
(237,44,'2024-3-21','withdrawal',-2885.47),
(238,49,'2025-12-10','deposit',2357.8),
(239,42,'2025-3-21','withdrawal',-4581.2),
(240,12,'2025-2-23','withdrawal',-3177.58),
(241,32,'2024-6-6','deposit',2355.35),
(242,27,'2024-6-24','withdrawal',-1612.08),
(243,7,'2024-8-26','deposit',1655.72),
(244,45,'2025-3-26','withdrawal',-1448.21),
(245,26,'2024-4-13','deposit',2279.58),
(246,21,'2026-1-18','withdrawal',-1623.14),
(247,50,'2025-5-1','withdrawal',-4325.9),
(248,53,'2025-2-2','deposit',3291.73),
(249,35,'2024-3-14','withdrawal',-2072.11),
(250,13,'2024-3-25','withdrawal',-3116.94),
(251,32,'2025-9-13','withdrawal',-3802.35),
(252,14,'2024-9-4','withdrawal',-2750.61),
(253,60,'2024-8-13','withdrawal',-2196.2),
(254,45,'2025-10-11','withdrawal',-615.92),
(255,41,'2024-6-7','deposit',3551.82),
(256,20,'2026-1-21','deposit',2765.73),
(257,6,'2024-12-21','deposit',4961.36),
(258,59,'2025-6-2','deposit',2312.62),
(259,8,'2025-1-24','deposit',2496.89),
(260,46,'2025-7-3','withdrawal',-2549.27),
(261,18,'2025-6-28','withdrawal',-4175.27),
(262,31,'2025-6-22','deposit',2289.36),
(263,10,'2025-2-25','withdrawal',-961.15),
(264,39,'2025-11-11','deposit',4321.49),
(265,18,'2025-6-13','withdrawal',-1705.98),
(266,51,'2025-1-15','withdrawal',-4104.54),
(267,19,'2025-7-2','withdrawal',-4189),
(268,38,'2024-7-6','withdrawal',-4327.65),
(269,29,'2025-10-31','withdrawal',-1732.17),
(270,36,'2024-7-25','withdrawal',-2282.17),
(271,21,'2024-2-6','deposit',4904.07),
(272,16,'2025-1-16','withdrawal',-1175.48),
(273,50,'2024-12-11','withdrawal',-227.8),
(274,48,'2025-2-25','withdrawal',-3529.09),
(275,52,'2024-12-15','withdrawal',-1936.53),
(276,43,'2025-10-17','deposit',2481.69),
(277,3,'2025-8-16','deposit',2516.43),
(278,38,'2024-12-9','withdrawal',-4349.8),
(279,56,'2024-12-21','withdrawal',-507.56),
(280,59,'2024-11-7','withdrawal',-86.58),
(281,10,'2025-7-22','withdrawal',-4355.96),
(282,10,'2024-2-6','deposit',2352.76),
(283,17,'2025-4-6','withdrawal',-3120.06),
(284,26,'2024-10-23','deposit',4260.31),
(285,55,'2024-8-15','withdrawal',-4771.16),
(286,41,'2026-1-10','withdrawal',-4363.19),
(287,3,'2025-1-28','deposit',1181.5),
(288,44,'2025-12-6','withdrawal',-4987.16),
(289,48,'2024-2-1','deposit',2175.52),
(290,7,'2024-5-7','deposit',2223.96),
(291,45,'2024-11-3','withdrawal',-4518.09),
(292,3,'2024-8-17','withdrawal',-3982.76),
(293,19,'2025-8-12','withdrawal',-1880.46),
(294,10,'2025-10-26','deposit',2660.52),
(295,37,'2025-3-30','deposit',858.22),
(296,6,'2025-3-27','withdrawal',-3102.35),
(297,16,'2024-5-15','withdrawal',-4565.02),
(298,10,'2025-6-18','deposit',2311.14),
(299,17,'2025-5-15','withdrawal',-1284.08),
(300,1,'2025-7-24','withdrawal',-4507.04);


SELECT m.Cuenta_ID, cl.Nombre, cu.Tipo, m.Fecha, m.Tipo, m.Monto, cu.Saldo -- #Alias y Conexión
FROM Clientes as cl, Cuentas as cu, Movimientos as m
WHERE cl.CLient_ID = cu.Cuenta_ID AND cu.Cuenta_ID = m.Cuenta_ID
ORDER BY m.Fecha ASC;


PROYECTO GESTIÓN DE CUENTAS BANCARIAS

SELECT  -- #Saldo actual por cuenta.
	cu.Cuenta_ID,
	cu.Tipo, 
	cu.Saldo + SUM(m.Monto)  AS Saldo_Actual
FROM Cuentas as cu 
LEFT JOIN Movimientos as m 
	ON cu.Cuenta_ID = m.Cuenta_ID 
GROUP BY cu.Cuenta_ID, cu.Tipo, cu.Saldo;



SELECT  -- Historial de movimientos de un cliente
	cl.Client_ID,
    cu.Cuenta_ID,
    m.Fecha,
    m.Tipo,
    m.Monto
FROM Clientes AS cl
LEFT JOIN cuentas AS cu 
	ON cl.Client_ID = cu.Client_ID
LEFT JOIN movimientos AS m 
	ON cu.Cuenta_ID = m.Cuenta_ID
WHERE cl.Client_ID = 5
ORDER BY m.fecha;


SELECT -- Total de depósitos y retiros en un periodo.
	m.Tipo,
    COUNT(m.Tipo) as Total_Movimiento,
    SUM(m.Monto) as Total
FROM movimientos as M
WHERE year(m.Fecha) = '2025'
GROUP BY m.Tipo;


## PROYECTO Registro de Inversionstas 


CREATE TABLE Inversionistas (
	Inversionista_ID INT NOT NULL PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL
);

CREATE TABLE Inversiones (
	Inversion_ID INT NOT NULL PRIMARY KEY,
    Inversionista_ID INT NOT NULL,
    Tipo VARCHAR(25),
    Monto_inicial INT DEFAULT 0,
    Fecha_iniciO DATE,
    FOREIGN KEY (Inversionista_ID) REFERENCES Inversionistas(Inversionista_ID)
);

CREATE TABLE Rendimientos (
	Rent_ID INT NOT NULL PRIMARY KEY,
    Inversion_ID INT NOT NULL,
    Fecha DATE,
    Monto INT,
    FOREIGN KEY (Inversion_ID) REFERENCES Inversiones(Inversion_ID)
);


SELECT  -- #Rendimiento total por inversión
	ins.Inversion_ID,
    ins.Monto_inicial, 
    SUM(r.Monto) AS Rendimientos,
    ins.Monto_Inicial + SUM(r.Monto) as Saldo_final
FROM Rendimientos AS r
LEFT JOIN inversiones AS ins 
	ON r.Inversion_ID = ins.Inversion_ID
GROUP BY ins.Inversion_ID;

SELECT -- #- Ranking de inversiones más rentables.
	ins.Tipo,
    SUM(ins.Monto_inicial) AS Inversion_Incial,
    SUM(r.Monto) as RENT,
    SUM(ins.Monto_inicial) + SUM(r.Monto) AS Total_Final,
    CONCAT(
		ROUND((((SUM(ins.Monto_inicial) + SUM(r.Monto))/SUM(ins.Monto_inicial))-1)*100,2),"%"
        ) AS Rent
FROM Rendimientos AS r
LEFT JOIN inversiones AS ins 
	ON r.Inversion_ID = ins.Inversion_ID
LEFT JOIN inversionistas AS it 
	ON ins.Inversion_ID = it.Inversionista_ID
GROUP BY ins.Tipo
ORDER BY (((SUM(ins.Monto_inicial) + SUM(r.Monto))/SUM(ins.Monto_inicial))-1)*100 DESC;


## Select Data _ Curso de JOINS

CREATE DATABASE VentasJoins;
USE VentasJoins;
-- Tabla de Clientes
CREATE TABLE Clientes (
    ClienteID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre    VARCHAR(100) NOT NULL,
    Email     VARCHAR(150) NOT NULL UNIQUE
);
-- Tabla de Productos
CREATE TABLE Productos (
    ProductoID INT AUTO_INCREMENT PRIMARY KEY,
    NombreProd VARCHAR(100) NOT NULL,
    Categoria  VARCHAR(50)  NOT NULL,
    Precio     DECIMAL(10,2) NOT NULL
);
-- Tabla de Tiendas
CREATE TABLE Tiendas (
    TiendaID INT AUTO_INCREMENT PRIMARY KEY,
    NombreTienda VARCHAR(100) NOT NULL,
    Ciudad       VARCHAR(100) NOT NULL
);
-- Tabla de Ventas (relación muchos a muchos entre Clientes y Productos, con Tienda)
CREATE TABLE Ventas (
    VentaID     INT AUTO_INCREMENT PRIMARY KEY,
    ClienteID   INT NOT NULL,
    ProductoID  INT NOT NULL,
    TiendaID    INT NOT NULL,
    FechaVenta  DATE NOT NULL,
    Cantidad    INT  NOT NULL,
    PrecioUnit  DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID),
    FOREIGN KEY (ProductoID) REFERENCES Productos(ProductoID),
    FOREIGN KEY (TiendaID) REFERENCES Tiendas(TiendaID)
);
SELECT * FROM Productos;
SELECT * FROM Ventas;
SELECT * FROM Tiendas;
SELECT * FROM Clientes;


-- INNER JOIN
SELECT 
	v.VentaID, 
    v.ProductoID, 
    v.TiendaID, 
    v.FechaVenta, 
    (ROUND((v.Cantidad)*(v.PrecioUnit),2)) AS Importe,
    c.ClienteID,
    c.Nombre,
    c.Email
FROM
ventasjoins.Ventas AS v
INNER JOIN Clientes AS c ON v.ClienteID = c.ClienteID;

SELECT -- Muestra todas las ventas realizadas incluyendo el nombre del cliente que las hizo.
	v.VentaID, 
    v.ProductoID, 
    v.TiendaID, 
    v.FechaVenta, 
    (ROUND((v.Cantidad)*(v.PrecioUnit),2)) AS Importe,
    c.ClienteID,
    c.Nombre,
    c.Email
FROM
ventasjoins.Ventas AS v
INNER JOIN Clientes AS c ON v.ClienteID = c.ClienteID;

-- Obtén la lista de todos los clientes y muestra también la información de sus compras, si las tienen. Identifica qué clientes aparecen sin compras.

SELECT 
    c.ClienteID,
    c.Nombre,
    p.NombreProd,
    p.Categoria,
    t.NombreTienda,
    t.`Ciudad`,
    (ROUND((v.Cantidad)*(v.PrecioUnit),2)) AS Importe
FROM clientes AS c
INNER JOIN ventas AS v ON c.`ClienteID` =v.`ClienteID`
INNER JOIN productos AS p ON v.`ProductoID`=p.`ProductoID`
INNER JOIN tiendas AS t ON t.`TiendaID`=v.`TiendaID`;

SELECT 
    c.Nombre,
    SUM(ROUND((v.Cantidad)*(v.PrecioUnit),2)) AS Comprado,
    COUNT((p.Categoria)) AS Total_Comprado,
    ROUND(AVG((v.Cantidad)*(v.PrecioUnit)),2) AS Promedio_Compra
FROM clientes AS c
INNER JOIN ventas AS v ON c.`ClienteID` =v.`ClienteID`
INNER JOIN productos AS p ON v.`ProductoID`=p.`ProductoID`
INNER JOIN tiendas AS t ON t.`TiendaID`=v.`TiendaID`
GROUP BY c.ClienteID
ORDER BY Comprado DESC;

-- Muestra todos los productos junto con las ventas en las que participaron. ¿Qué producto aparece sin ventas?

SELECT 
    p.`NombreProd`,
    v.FechaVenta,
    v.Cantidad,
    c.Nombre,
    t.NombreTienda AS Tienda
FROM
productos p
LEFT JOIN Ventas v 
    ON p.`ProductoID`=v.`ProductoID`
INNER JOIN Clientes c
    ON v.`ClienteID`=c.`ClienteID`
INNER JOIN Tiendas t
    ON v.`TiendaID`=t.`TiendaID`
ORDER BY v.`FechaVenta` ASC; 



-- 1) Limpiar datos en orden correcto (hija -> padres)
DELETE FROM Ventas;
DELETE FROM Productos;
DELETE FROM Clientes;
DELETE FROM Tiendas;

-- 2) Reiniciar AUTO_INCREMENT (equivalente a reseed)
ALTER TABLE Ventas AUTO_INCREMENT = 1;
ALTER TABLE Clientes AUTO_INCREMENT = 1;
ALTER TABLE Productos AUTO_INCREMENT = 1;
ALTER TABLE Tiendas AUTO_INCREMENT = 1;

-- 3) Insertar datos que DEJEN HUECOS para que el LEFT JOIN muestre NULL

-- Clientes: 2 con compras, 2 sin compras
INSERT INTO Clientes (Nombre, Email) VALUES
('Ana Pérez', 'ana@example.com'),      -- con compras
('Luis Gómez', 'luis@example.com'),    -- con compras
('María Torres', 'maria@example.com'), -- SIN compras
('Carlos Díaz', 'carlos@example.com'); -- SIN compras

-- Productos: 3 vendidos, 1 NUNCA vendido (Teclado)
INSERT INTO Productos (NombreProd, Categoria, Precio) VALUES
('Laptop Lenovo',   'Electrónica', 2500),   -- vendido
('Mouse Logitech',  'Accesorios',   50),    -- vendido
('Teclado MS',      'Accesorios',   80),    -- NUNCA vendido
('Monitor Samsung', 'Electrónica', 1200);   -- vendido

-- Tiendas: 2 con ventas, 1 SIN ventas (Sur)
INSERT INTO Tiendas (NombreTienda, Ciudad) VALUES
('SelectData Centro', 'Bogotá'),   -- con ventas
('SelectData Norte',  'Medellín'), -- con ventas
('SelectData Sur',    'Cali');     -- SIN ventas

-- Ventas (solo para Ana y Luis; María/Carlos quedan sin compras)
INSERT INTO Ventas (ClienteID, ProductoID, TiendaID, FechaVenta, Cantidad, PrecioUnit) VALUES
(1, 1, 1, '2024-01-10', 1, 2500), -- Ana compra laptop en Bogotá
(2, 2, 2, '2024-01-15', 2,   50), -- Luis compra mouse en Medellín
(1, 4, 2, '2024-02-05', 1, 1200); -- Ana compra monitor en Medellín


SELECT * FROM Productos;
SELECT * FROM Ventas;
SELECT * FROM Tiendas;
SELECT * FROM Clientes;

SELECT
    c.Nombre,
    SUM(ROUND((v.Cantidad)*(v.PrecioUnit),2)) AS Comprado,
    COUNT((v.FechaVenta)) AS Total_Comprado,
    ROUND(AVG((v.Cantidad)*(v.PrecioUnit)),2) AS Promedio_Compra
FROM clientes c
LEFT JOIN ventas v ON c.`ClienteID`=v.`ClienteID`
GROUP BY c.`Nombre`;

-- Muestra todos los productos junto con las ventas en las que participaron. ¿Qué producto aparece sin ventas?
SELECT 
    p.`NombreProd`,
    p.`Categoria`,
    COUNT(v.`VentaID`) AS Total_Comprado,
    SUM(ROUND((v.Cantidad)*(v.PrecioUnit),2)) AS Comprado
FROM productos p
LEFT JOIN ventas v ON p.`ProductoID`=v.`ProductoID`
GROUP BY p.`NombreProd`, p.`Categoria`
ORDER BY Comprado DESC;

 
--Haz una consulta que devuelva todos los clientes y todas las ventas, incluso si no tienen relación entre sí. ¿Dónde aparecen los valores nulos?
SELECT 
    c.ClienteID,
    c.Nombre,
    v.VentaID,
    v.FechaVenta,
    v.Cantidad,
    v.PrecioUnit
FROM clientes AS c
LEFT JOIN ventas AS v 
    ON c.ClienteID = v.ClienteID

UNION

-- Ventas con o sin clientes
SELECT 
    c.ClienteID,
    c.Nombre,
    v.VentaID,
    v.FechaVenta,
    v.Cantidad,
    v.PrecioUnit
FROM clientes AS c
RIGHT JOIN ventas AS v 
    ON c.ClienteID = v.ClienteID

ORDER BY ClienteID, VentaID;

--Realiza un reporte completo que muestre: cliente, producto, tienda, cantidad y fecha de cada venta.

SELECT 
    c.Nombre,
    p.NombreProd,
    p.Categoria,
    t.NombreTienda,
    t.Ciudad,
    v.FechaVenta,
    v.Cantidad,
    v.PrecioUnit,
    ROUND((v.Cantidad)*(v.PrecioUnit),2) AS Comprado

FROM ventas AS v
LEFT JOIN clientes AS c ON v.`ClienteID`=c.`ClienteID`
LEFT JOIN productos AS p ON v.`ProductoID`=p.`ProductoID`
LEFT JOIN tiendas AS t ON v.`TiendaID`=t.`TiendaID`;


-- Encuentra a los clientes que nunca han realizado compras.

SELECT
    c.Nombre
FROM clientes AS c
LEFT JOIN ventas AS v ON c.`ClienteID`=v.`ClienteID`
WHERE v.`VentaID` IS NULL;



--Encuentra los productos que nunca se han vendido.
SELECT
    p.NombreProd
FROM productos AS p
LEFT JOIN ventas AS v ON p.`ProductoID`=v.`ProductoID`
WHERE v.`VentaID` IS NULL;

-- Muestra todas las tiendas con sus ventas. Identifica qué tienda aparece sin ventas.
SELECT
    t.`NombreTienda`,
    t.`Ciudad`,
    v.FechaVenta,
    v.Cantidad,
    ROUND((v.Cantidad)*(v.PrecioUnit),2) AS Comprado

FROM tiendas AS t
LEFT JOIN ventas AS v ON t.`TiendaID`=v.`TiendaID`;

-- Construye una consulta que muestre para cada cliente su última compra (pista: deberás combinar JOIN con funciones de agrupación o subconsultas).
SELECT
    c.`Nombre`,
    c.`Email`,
    v.`Cantidad`,
    v.`FechaVenta`,
    ROUND((v.Cantidad)*(v.PrecioUnit),2) AS Comprado

FROM clientes as c
INNER JOIN ventas AS v 
    ON c.`ClienteID`=v.`ClienteID`
WHERE v.`FechaVenta` = (
    SELECT MAX(v2.`FechaVenta`)
    FROM ventas AS v2
    WHERE v2.`ClienteID` =c.`ClienteID`
);



## SELECT DATA CURSO DE UNIONS Y SUBCONSULTAS

CREATE TABLE Clientes_Online (
    ClienteID INT PRIMARY KEY,
    Nombre VARCHAR(100),
    Ciudad VARCHAR(100)
);

CREATE TABLE Clientes_Tienda (
    ClienteID INT PRIMARY KEY,
    Nombre VARCHAR(100),
    Ciudad VARCHAR(100)
);

-- Insertamos registros
INSERT INTO Clientes_Online (ClienteID, Nombre, Ciudad) VALUES
(1, 'Ana Pérez', 'Bogotá'),
(2, 'Luis Gómez', 'Medellín'),
(3, 'María Torres', 'Bogotá');

INSERT INTO Clientes_Tienda (ClienteID, Nombre, Ciudad) VALUES
(2, 'Luis Gómez', 'Medellín'),   -- Duplicado con Online
(3, 'María Torres', 'Bogotá'),   -- Duplicado con Online
(4, 'Carlos Díaz', 'Cali');


SELECT COUNT(*) C
FROM (
	SELECT * FROM Clientes_Online
	UNION ALL
	SELECT * FROM Clientes_Tienda
) AS C;




SELECT * FROM Productos;
SELECT * FROM Ventas;
SELECT * FROM Tiendas;
SELECT * FROM Clientes;

-- SUBCONSULTA total gastado por clientes
SELECT
    c.`Nombre`,
    (SELECT
        SUM(v.`Cantidad`*v.`PrecioUnit`)
    FROM ventas AS v
    WHERE v.`ClienteID`=c.`ClienteID`) AS Comprado
FROM clientes AS c
HAVING Comprado IS NOT NULL;


-- SUBCONSULTA clientes que no compraron "La subconsulta está dentro del WHERE"
SELECT 
    c.Nombre
FROM clientes as c 
WHERE c.`ClienteID` NOT IN (SELECT v.`ClienteID` FROM ventas AS v );


-- Obtén el producto más caro vendido usando una subconsulta dentro de la cláusula WHERE.

SELECT
    p.`NombreProd`,
    p.`Categoria`,
    (SELECT 
        MAX(v.`PrecioUnit`)    
    FROM ventas AS v
    WHERE v.`ProductoID`= p.`ProductoID`) AS Valor_Maximo
FROM productos AS p
ORDER BY Valor_Maximo DESC
LIMIT 1;


--Lista el nombre y correo de los clientes cuya compra total supere el gasto promedio de todos los clientes.

SELECT
    c.`Nombre`,
    c.`Email`,
    (SUM(V.`Cantidad`*V.`PrecioUnit`)) AS Compra_Total,
    (SELECT
         AVG(V.`Cantidad`*V.`PrecioUnit`)
    FROM ventas AS V
    ) AS Promedio
FROM clientes AS c
LEFT JOIN ventas as V ON c.`ClienteID`=V.`ClienteID`
GROUP BY 2;c.`Nombre`, c.Email
HAVING Compra_Total > Promedio;


--Encuentra el nombre de los productos cuya cantidad total vendida sea mayor que la cantidad promedio de todos los productos.
SELECT
    p.`NombreProd`,
    SUM(v.`Cantidad`) AS Total_Vendido,
    (SELECT 
        AVG(v.`Cantidad`)
    FROM ventas AS v           
    ) AS Promedio_Vendido

FROM productos AS p
LEFT JOIN ventas AS v ON p.`ProductoID`=v.`ProductoID`
GROUP BY p.`NombreProd`
HAVING Total_Vendido > Promedio_Vendido;

--Muestra las ventas realizadas en la misma fecha que la primera venta registrada.
SELECT
    *
FROM ventas v
WHERE v.`FechaVenta` = (SELECT MIN(v.`FechaVenta`) FROM ventas as v);



-- Lista las tiendas que no han tenido ninguna venta usando una subconsulta.
SELECT 
    t.NombreTienda
FROM tiendas AS t
WHERE t.`TiendaID` NOT IN (SELECT v.`TiendaID` FROM ventas AS v );


--Muestra el cliente con la mayor cantidad de compras (más número de ventas realizadas).
SELECT
    c.`Nombre`,
    (SELECT 
        COUNT(v.`Cantidad`)
    FROM ventas as v
    WHERE v.`ClienteID`=c.`ClienteID`) AS Max_Cantidad
FROM clientes AS c
LEFT JOIN ventas AS v ON c.`ClienteID`=v.`ClienteID`
ORDER BY Max_Cantidad DESC
LIMIT 1;


-- Obtén los productos nunca vendidos utilizando una subconsulta.
SELECT 
    p.NombreProd
FROM productos as p 
WHERE p.`ProductoID` NOT IN (SELECT v.`ProductoID` FROM ventas AS v );


-- Lista las ventas cuyo importe total (Cantidad × PrecioUnit) sea mayor que el importe promedio de todas las ventas.
SELECT
    c.`Nombre`,
    (SUM(v.`Cantidad`*v.`PrecioUnit`)) AS Importe, 
    (SELECT 
        AVG(v.`Cantidad`*v.`PrecioUnit`)
    FROM ventas AS v) AS Promedio_Total
FROM clientes AS c
LEFT JOIN ventas AS v ON v.`ClienteID`=c.`ClienteID`
GROUP BY c.`Nombre`
HAVING Importe > Promedio_Total;



-- Proyecto SQL Básico Total Transacciones procesadas
SELECT 
	COUNT(*) AS Numero_Transacciones,
    SUM(Amount) AS Total_Transaccionado
FROM proyecto_sql_returns.transacciones;


-- Proyecto SQL Básico Porcentaje de Transacciones y total retornado
SELECT 
	Trans_status, 
	COUNT(*) AS Numero_Transacciones,
    SUM(Amount) AS Total_Transaccionado,
    (SELECT
		SUM(Amount)
    FROM proyecto_sql_returns.transacciones) AS Total,
    round(
		(SUM(Amount)/
		(SELECT
			SUM(Amount)
		FROM proyecto_sql_returns.transacciones)*100),2) AS Weight,
    AVG(days_to_settle) AS Average_Days
FROM proyecto_sql_returns.transacciones
GROUP BY Trans_status
ORDER BY Total_Transaccionado DESC;


-- Proyecto SQL Intermedio: DSO =SUM(Amount*days to settle)/ amount
SELECT
    c.customer_id,
	round(SUM(t.amount*t.days_to_settle)/SUM(t.amount),2) AS DSO
FROM proyecto_sql_returns.transacciones AS t
LEFT JOIN proyecto_sql_returns.clientes AS c ON t.customer_id = c.customer_id
WHERE t.Trans_status = 'SETTLED'
GROUP BY c.customer_id
ORDER BY DSO desc;

-- Proyecto SQL Intermedio:PORCENTAJE DE RETORNOS POR INDUSTRIA
SELECT
	C.industry,
    COUNT(t.customer_id) AS Total_Transacciones,
    CONCAT(ROUND((COUNT(t.customer_id)/ 
    (SELECT
		COUNT(t.amount)
    FROM proyecto_sql_returns.transacciones AS t))*100,2),'%') AS Total_Transacciones_retornadas, 
    SUM(t.amount) AS  MONTO_RETORNADO,
    CONCAT((ROUND ((SUM(t.amount)/
    (SELECT
		SUM(t.amount)
    FROM proyecto_sql_returns.transacciones AS t))*100,2)), '%')AS Porcentaje_Monto_RETORNADO
    
FROM proyecto_sql_returns.clientes AS c 
LEFT JOIN proyecto_sql_returns.transacciones AS t ON t.customer_id = c.customer_id
WHERE t.Trans_status = 'RETURNED'
GROUP BY C.industry
ORDER BY Total_Transacciones DESC;





-- Proyecto SQL Intermedio: Clientes con retorno y sus scores
SELECT
	C.customer_id,
    COUNT(C.customer_id) AS Total_Transacciones,
    CONCAT(ROUND((COUNT(C.customer_id)/ 
    (SELECT
		COUNT(t.amount)
    FROM proyecto_sql_returns.transacciones AS t))*100,2),'%') AS Total_Transacciones_retornadas, 
    SUM(t.amount) AS  MONTO_RETORNADO,
    CONCAT((ROUND ((SUM(t.amount)/
    (SELECT
		SUM(t.amount)
    FROM proyecto_sql_returns.transacciones AS t))*100,2)), '%')AS Porcentaje_Monto_RETORNADO
    
FROM proyecto_sql_returns.clientes AS c 
LEFT JOIN proyecto_sql_returns.transacciones AS t ON t.customer_id = c.customer_id
WHERE t.Trans_status = 'RETURNED'
GROUP BY C.customer_id
ORDER BY Total_Transacciones DESC;



-- -- Proyecto SQL Intermedio: CREACIÓN DE VISTAS 
CREATE VIEW proyecto_sql_reutrns.VW_DSO AS (
SELECT
	C.customer_id,
    c.credit_score,
    round(SUM(t.amount*t.days_to_settle)/SUM(t.amount),2) AS DSO,
    t.Trans_status,
	(CASE
		WHEN credit_score < 600 THEN 'ALTO'
		WHEN credit_score BETWEEN 600 AND 700 THEN 'MEDIO'
		ELSE 'BAJO'
	END) AS SCORE_VALUATION
FROM proyecto_sql_returns.clientes AS c 
LEFT JOIN proyecto_sql_returns.transacciones AS t ON t.customer_id = c.customer_id
GROUP BY C.customer_id,  t.Trans_status
ORDER BY DSO DESC
);

-- -- Proyecto SQL Intermedio: CREACIÓN DE PRODIMEINTO ALMACENADO
DELIMITER $$
CREATE PROCEDURE SP_CLIENTES_RANKEADOS_New (
IN
	Trans_Status VARCHAR(50)
				)
BEGIN
		SELECT
			C.customer_id,
			COUNT(*) AS Total_Transacciones,
			CONCAT(
				ROUND(
					(COUNT(t.transaction_id)*1.0/ 
					(SELECT
						COUNT(t.amount)
					FROM proyecto_sql_returns.transacciones AS t))*100,2),'%') AS Total_Transacciones_retornadas, 
			SUM(t.amount) AS  MONTO_RETORNADO,
			CONCAT(
				(ROUND ((SUM(t.amount)/
						(SELECT
							SUM(t.amount)
						FROM proyecto_sql_returns.transacciones AS t))
						*100,2)
				), '%'
			)AS Porcentaje_Monto_RETORNADO
			
		FROM proyecto_sql_returns.clientes AS c 
		LEFT JOIN proyecto_sql_returns.transacciones AS t 
			ON t.customer_id = c.customer_id
		WHERE t.Trans_status = @Trans_Status
		GROUP BY C.customer_id
		ORDER BY Total_Transacciones DESC;
END$$
DELIMITER ;

-- Proyecto SQL Intermedio:LLAMAR A UN PROCEDIMIENTO ALMACENADO
call proyecto_sql_returns.SP_CLIENTES_RANKEADOS('SETTLEDfilm_in_stock');

-- Proyecto SQL Intermedio: **Creación de Logins
CREATE USER 'JuanUser'@'127.0.0.1:3306'
IDENTIFIED BY "1234";

GRANT ALL PRIVILEGES 
ON
proyecto_sql_returns.* TO 'JuanUser'@'127.0.0.1:3306';



-- Proyecto SQL: Nivel "Entrevistas" - Ranking de clientes (Window functions)

SELECT 
	c.customer_id,
    RANK() 
		OVER(ORDER BY SUM(t.amount) DESC) AS Ranking_Amount,
	RANK()
		OVER(ORDER BY c.credit_score DESC) AS Ranking_score,
	RANK()
		OVER(ORDER BY
			round(
            SUM(t.amount*t.days_to_settle)/
            SUM(t.amount)
				,2)
			) AS RANKING_DSO
FROM proyecto_sql_returns.transacciones AS t 
LEFT JOIN proyecto_sql_returns.clientes AS c
	ON t.customer_id = c.customer_id
group by c.customer_id
ORDER BY RANKING_DSO;

-- Proyecto SQL: Nivel "Entrevistas" - cOHORTE POR FECHAS Y TAS DE RETORNO(Window functions)
		SELECT
			RANK()
            OVER (
            ORDER BY CONCAT(
							(ROUND ((SUM(t.amount)/
									(SELECT
										SUM(t.amount)
									FROM proyecto_sql_returns.transacciones AS t))
									*100,2)
							), '%'
							) DESC
				) AS RANKING,
			YEAR(c.signup_date),
			COUNT(*) AS Total_Transacciones,
			CONCAT(
				ROUND(
					(COUNT(t.transaction_id)*1.0/ 
					(SELECT
						COUNT(t.amount)
					FROM proyecto_sql_returns.transacciones AS t))*100,2),'%') AS Total_Transacciones_retornadas, 
			SUM(t.amount) AS  MONTO_RETORNADO,
			CONCAT(
				(ROUND ((SUM(t.amount)/
						(SELECT
							SUM(t.amount)
						FROM proyecto_sql_returns.transacciones AS t))
						*100,2)
				), '%'
				)AS Porcentaje_Monto_RETORNADO
			
		FROM proyecto_sql_returns.clientes AS c 
		LEFT JOIN proyecto_sql_returns.transacciones AS t 
			ON t.customer_id = c.customer_id
		WHERE t.Trans_status = "RETURNED"
		GROUP BY YEAR(c.signup_date);
 
 -- Proyecto SQL: Nivel "Entrevistas" - CLASIFICACIÓN DE RIESGO (Case)

 SELECT
    c.customer_id,
	round(SUM(t.amount*t.days_to_settle)/SUM(t.amount),2) AS DSO,
    c.credit_limit,
    
   CASE 
	WHEN round(SUM(t.amount*t.days_to_settle)/SUM(t.amount),2) < 5 THEN 'BAJO'
    WHEN round(SUM(t.amount*t.days_to_settle)/SUM(t.amount),2) BETWEEN 5 AND 15 THEN 'MEDIO'
	ELSE 'ALTO'
        		
   END AS Nivel_Riesgo
FROM proyecto_sql_returns.transacciones AS t
LEFT JOIN proyecto_sql_returns.clientes AS c 
	ON t.customer_id = c.customer_id
GROUP BY c.customer_id;

