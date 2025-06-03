-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 03-06-2025 a las 01:35:48
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_ventas`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrito`
--

CREATE TABLE `carrito` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `cantidad` int(11) DEFAULT 1,
  `fecha_agregado` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras`
--

CREATE TABLE `compras` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `nombre_cliente` varchar(100) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `ciudad` varchar(100) DEFAULT NULL,
  `codigo_postal` varchar(20) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `tarjeta_numero` varchar(20) DEFAULT NULL,
  `tarjeta_nombre` varchar(100) DEFAULT NULL,
  `tarjeta_expiracion` varchar(7) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras_detalles`
--

CREATE TABLE `compras_detalles` (
  `id` int(11) NOT NULL,
  `compra_id` int(11) DEFAULT NULL,
  `producto_id` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `precio` decimal(10,2) NOT NULL,
  `categoria` varchar(50) NOT NULL,
  `imagen` varchar(255) DEFAULT NULL,
  `tematica` varchar(100) DEFAULT NULL,
  `personaje` varchar(100) DEFAULT NULL,
  `estilo` varchar(100) DEFAULT NULL,
  `metadatos` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`metadatos`)),
  `fecha_agregado` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `nombre`, `descripcion`, `precio`, `categoria`, `imagen`, `tematica`, `personaje`, `estilo`, `metadatos`, `fecha_agregado`) VALUES
(40, 'Sticker Anime', 'Hatsune Miku version Cute y silly', 20.00, 'stickers', 'https://i.pinimg.com/736x/dc/e8/4b/dce84bca40bc1467bde40966af5392e2.jpg', 'Anime', 'Hatsune Miku', 'Kawai', '{\"tematica\":\"Anime\",\"personaje\":\"Hatsune Miku\",\"estilo\":\"Kawai\"}', '2025-06-02 17:28:02'),
(41, 'Sticker Cartoon', 'Gatito kawai con una guitarra electrica', 20.00, 'stickers', 'https://i.pinimg.com/736x/2a/02/51/2a0251cf2bef4e51cd7e70fc6bb7eb40.jpg', 'Animales', 'Gato', 'Kawai', '{\"tematica\":\"Animales\",\"personaje\":\"Gato\",\"estilo\":\"Kawai\"}', '2025-06-02 17:28:02'),
(42, 'Sticker Cartoon', 'Gatito kawai con un Arma pero Cute', 20.00, 'stickers', 'https://i.pinimg.com/736x/3d/66/3b/3d663b1f68344d473b3d600647557ae3.jpg', 'Animales', 'Gato', 'Kawai', '{\"tematica\":\"Animales\",\"personaje\":\"Gato\",\"estilo\":\"Kawai\"}', '2025-06-02 17:28:02'),
(43, 'Sticker Serie', 'Bingo Heeler de Bluey, con un arte alternativo a la serie', 20.00, 'stickers', 'https://i.pinimg.com/736x/c1/59/fd/c159fd1cb817f098b2b874735e777d0c.jpg', 'Serie', 'Bluey', 'Cartoon', '{\"tematica\":\"Serie\",\"personaje\":\"Bluey\",\"estilo\":\"Cartoon\"}', '2025-06-02 17:28:02'),
(44, 'Sticker Videojuego', 'Miles Tails de Sonic con cara cute viendote directamente', 20.00, 'stickers', 'https://i.pinimg.com/736x/58/81/a0/5881a010be8d5a3389dc4dc389407e8c.jpg', 'Videojuego', 'Sonic', 'Digital Minimalista', '{\"tematica\":\"Videojuego\",\"personaje\":\"Sonic\",\"estilo\":\"Digital Minimalista\"}', '2025-06-02 17:28:02'),
(45, 'Sticker Pelicula', 'La muerte y sus 3 reliquias de la saga Harry Potter', 20.00, 'stickers', 'https://i.pinimg.com/736x/d5/33/52/d533524f4b0302a538105f8d65d513b5.jpg', 'Serie', 'Harry Potter', 'Minimalista', '{\"tematica\":\"Serie\",\"personaje\":\"Harry Potter\",\"estilo\":\"Minimalista\"}', '2025-06-02 17:28:02'),
(46, 'Sticker Videojuego', 'Madeline de Celeste y el Caballerito de Hollow Knight pasando el rato', 20.00, 'stickers', 'https://i.pinimg.com/736x/e8/ad/3f/e8ad3f398e72c794e53074e593e05bc2.jpg', 'Videojuego', 'Hollow Knight', 'Cartoon', '{\"tematica\":\"Videojuego\",\"personaje\":\"Hollow Knight\",\"estilo\":\"Cartoon\"}', '2025-06-02 17:28:02'),
(47, 'Sticker Videojuego', 'Oshawott recostado pensando en Oshawott', 20.00, 'stickers', 'https://i.pinimg.com/736x/08/91/02/089102ebd9f90b7491972906de24f92e.jpg', 'Videojuego', 'Pokemon', 'Cartoon', '{\"tematica\":\"Videojuego\",\"personaje\":\"Pokemon\",\"estilo\":\"Cartoon\"}', '2025-06-02 17:28:02'),
(48, 'Sticker Videojuego', 'El caballerito de Hollow Knight escuchando Los Temerarios', 20.00, 'stickers', 'https://i.pinimg.com/736x/92/11/9e/92119e2f705152a205596b87663c5cfe.jpg', 'Videojuego', 'Hollow Knight', 'Cartoon', '{\"tematica\":\"Videojuego\",\"personaje\":\"Hollow Knight\",\"estilo\":\"Cartoon\"}', '2025-06-02 17:28:02'),
(49, 'Sticker Videojuego', 'Lamb de Cult Of The Lamb preocupadito', 20.00, 'stickers', 'https://i.pinimg.com/736x/40/9a/ab/409aab9610da037eb6c63382b5bddbd7.jpg', 'Videojuego', 'Cult of The Lamb', 'Cartoon', '{\"tematica\":\"Videojuego\",\"personaje\":\"Cult of The Lamb\",\"estilo\":\"Cartoon\"}', '2025-06-02 17:28:02'),
(50, 'Sticker Serie', 'Bodoque de 31 minutos siendo Bodoque', 20.00, 'stickers', 'https://i.pinimg.com/736x/64/3d/17/643d1749b8a9fc40e505a6d2f3bd51f0.jpg', 'Serie', '31 Minutos', 'Cartoon', '{\"tematica\":\"Serie\",\"personaje\":\"31 Minutos\",\"estilo\":\"Cartoon\"}', '2025-06-02 17:28:02'),
(51, 'Sticker Cartoon', 'Machape tierno diciendo el lema del machape', 20.00, 'stickers', 'https://i.pinimg.com/736x/ed/4b/04/ed4b0426e4023751e28fcf48ce67dfb1.jpg', 'Animales', 'Mapache', 'Cartoon', '{\"tematica\":\"Animales\",\"personaje\":\"Mapache\",\"estilo\":\"Cartoon\"}', '2025-06-02 17:28:02'),
(52, 'Sticker Cartoon', 'Gatito Hackeando las bases de datos de los bancos para tener dinero gratis', 20.00, 'stickers', 'https://i.pinimg.com/736x/6e/4c/41/6e4c411c9c1a3843af3d402e03a966ad.jpg', 'Animales', 'Gato', 'Cartoon', '{\"tematica\":\"Animales\",\"personaje\":\"Gato\",\"estilo\":\"Cartoon\"}', '2025-06-02 17:28:02'),
(53, 'Sticker Serie', 'Pinki pie de My little pony bien PDF (Pasada De Flow)', 20.00, 'stickers', 'https://i.pinimg.com/736x/f7/cc/24/f7cc247870a9fea358b37a0805ab145e.jpg', 'Serie', 'My Little Pony', 'MLP', '{\"tematica\":\"Serie\",\"personaje\":\"My Little Pony\",\"estilo\":\"MLP\"}', '2025-06-02 17:28:02'),
(54, 'Sticker Anime', 'La pequeña pecesita Ponyo de la pelicula ponyo', 20.00, 'stickers', 'https://i.pinimg.com/736x/53/a5/76/53a576b85bcf5ef87353b2432cf1e741.jpg', 'Anime', 'Ponyo', 'Ghibli', '{\"tematica\":\"Anime\",\"personaje\":\"Ponyo\",\"estilo\":\"Ghibli\"}', '2025-06-02 17:28:02'),
(55, 'Sticker Anime', 'Ohto Ai positiva de Wonder Egg Priority', 20.00, 'stickers', 'https://i.pinimg.com/736x/4e/5f/ef/4e5fef08b618018214b868e33a6619f1.jpg', 'Anime', 'Wonder Egg Priority', 'WEP', '{\"tematica\":\"Anime\",\"personaje\":\"Wonder Egg Priority\",\"estilo\":\"WEP\"}', '2025-06-02 17:28:02'),
(56, 'Sticker Videojuego', 'Foxy de Five Nights at freddy confundido y bonito', 20.00, 'stickers', 'https://i.pinimg.com/736x/c2/28/00/c228003e1b20ac324fb6deab94e3ef9a.jpg', 'Videojuego', 'Fnaf', 'Cartoon', '{\"tematica\":\"Videojuego\",\"personaje\":\"Fnaf\",\"estilo\":\"Cartoon\"}', '2025-06-02 17:28:02'),
(57, 'Sticker Videojuego', 'Lamb sonriente bonito de Cult of The Lamb', 20.00, 'stickers', 'https://i.pinimg.com/736x/b7/77/0e/b7770e41c1dcb90bdf557abb13aa8f40.jpg', 'Videojuego', 'Cult of The Lamb', 'Cartoon', '{\"tematica\":\"Videojuego\",\"personaje\":\"Cult of The Lamb\",\"estilo\":\"Cartoon\"}', '2025-06-02 17:28:02'),
(58, 'Sticker Cartoon', 'Ajolote Bonito Bebé', 20.00, 'stickers', 'https://i.pinimg.com/736x/c1/ad/93/c1ad93fdaf93a920c8d8390337a3d059.jpg', 'Animales', 'Ajolote', 'Cartoon', '{\"tematica\":\"Animales\",\"personaje\":\"Ajolote\",\"estilo\":\"Cartoon\"}', '2025-06-02 17:28:02'),
(59, 'Sticker Cartoon', 'Ajolote Bonito Mago Brujo', 20.00, 'stickers', 'https://i.pinimg.com/736x/c4/07/69/c4076978a20a226fef5a638cfb00cf17.jpg', 'Animales', 'Ajolote', 'Cartoon', '{\"tematica\":\"Animales\",\"personaje\":\"Ajolote\",\"estilo\":\"Cartoon\"}', '2025-06-02 17:28:02'),
(60, 'Sticker Videojuego', 'Mascara de Majoras, del Juego Zelda Majoras Mask', 20.00, 'stickers', 'https://i.pinimg.com/736x/8a/26/35/8a2635ce29cf32fa476db1aaa38ab5b4.jpg', 'Videojuego', 'Zelda', 'Cartoon realista', '{\"tematica\":\"Videojuego\",\"personaje\":\"Zelda\",\"estilo\":\"Cartoon realista\"}', '2025-06-02 17:28:02'),
(61, 'Sticker Anime', 'Rei ayanami nekomata chiquita', 20.00, 'stickers', 'https://i.pinimg.com/736x/fe/ab/d2/feabd242a57c371a6250bd42af1a3ca3.jpg', 'Anime', 'Evangelion', 'Cartooon', '{\"tematica\":\"Anime\",\"personaje\":\"Evangelion\",\"estilo\":\"Cartoon\"}', '2025-06-02 17:28:02'),
(62, 'Sticker Videojuego', 'Sonic con mirada tierna', 20.00, 'stickers', 'https://i.pinimg.com/736x/de/b1/da/deb1da64f1ae5b7eb695a6586876bce5.jpg', 'Videojuego', 'Sonic', 'Cartoon', '{\"tematica\":\"Videojuego\",\"personaje\":\"Sonic\",\"estilo\":\"Cartoon\"}', '2025-06-02 17:28:02'),
(63, 'Sticker Serie', 'Bluey escuchando musica', 20.00, 'stickers', 'https://i.pinimg.com/736x/17/b0/e4/17b0e43295b7ee351946a63655129fdb.jpg', 'Serie', 'Bluey', 'Cartoon', '{\"tematica\":\"Serie\",\"personaje\":\"Bluey\",\"estilo\":\"Cartoon\"}', '2025-06-02 17:28:02'),
(64, 'Poster Anime', 'Poster de la pelicula \"Kiki, Delivery service\"', 80.00, 'posters', 'https://i.pinimg.com/736x/ea/fa/c4/eafac4bdd5361fd259ec82f66977436c.jpg', 'Anime', 'kiki', 'Anime', '{\"tematica\":\"Anime\",\"personaje\":\"kiki\",\"estilo\":\"Anime\"}', '2025-06-02 17:28:02'),
(65, 'Poster Anime', 'Suki y appa de Avatar la leyenda de aang', 80.00, 'posters', 'https://i.pinimg.com/736x/9c/73/68/9c7368882b7e76214179ec168b2cf7ee.jpg', 'Anime', 'Avatar', 'Arte Digital', '{\"tematica\":\"Anime\",\"personaje\":\"Suki\",\"estilo\":\"Arte Digital\"}', '2025-06-02 17:28:02'),
(66, 'Poster Anime', 'Avatares Wang, Kyoshi, Roku, Aang y Korra', 80.00, 'posters', 'https://i.pinimg.com/736x/e4/63/5b/e4635be45312119cdf9e56ec07d5c4f3.jpg', 'Anime', 'Avatar', 'Ukiyo-e', '{\"tematica\":\"Anime\",\"personaje\":\"Avatar\",\"estilo\":\"Ukiyo-e\"}', '2025-06-02 17:28:02'),
(67, 'Poster Cartoon', 'Caricatura de una vaca siendo abducida', 80.00, 'posters', 'https://i.pinimg.com/736x/65/ad/9b/65ad9b9044285520f4eae0d1a15060ac.jpg', 'Animales', 'Vaca', 'Cartoon', '{\"tematica\":\"Animales\",\"personaje\":\"Vaca\",\"estilo\":\"Cartoon\"}', '2025-06-02 17:28:02'),
(68, 'Poster Cartoon', 'Billete de 50 pesos caricaturizado', 80.00, 'posters', 'https://i.pinimg.com/736x/8f/18/b8/8f18b8b2d332e3ff605c822f3faae165.jpg', 'Animales', 'Ajolote', 'Cartoon', '{\"tematica\":\"Animales\",\"personaje\":\"Ajolote\",\"estilo\":\"Cartoon\"}', '2025-06-02 17:28:02'),
(69, 'Poster Minimalista', 'Frase famosa de Ufologos con un ovni', 80.00, 'posters', 'https://i.pinimg.com/736x/99/35/a2/9935a250dc8c3e7e77cc1f42c4283643.jpg', 'Ovni', 'Alien', 'Minimalista', '{\"tematica\":\"Ovni\",\"personaje\":\"Alien\",\"estilo\":\"Minimalista\"}', '2025-06-02 17:28:02'),
(70, 'Poster Comic', 'Spider-Punk con su lira', 80.00, 'posters', 'https://i.pinimg.com/736x/cf/d5/d2/cfd5d2db3ff002b990cdc20b2b8cf060.jpg', 'Heroes', 'SpiderMan', 'Comic', '{\"tematica\":\"Heroes\",\"personaje\":\"Comic\",\"estilo\":\"Comic\"}', '2025-06-02 17:28:02'),
(71, 'Poster Comic', 'X-men de los 80', 80.00, 'posters', 'https://i.pinimg.com/736x/ee/c6/32/eec632e1bf81024671492bfc925706da.jpg', 'Heroes', 'Marvel', 'Comic', '{\"tematica\":\"Heroes\",\"personaje\":\"X-men\",\"estilo\":\"Comic\"}', '2025-06-02 17:28:02'),
(72, 'Poster Anime', 'Ken takakura y Momo Ayase de DanDaDan', 80.00, 'posters', 'https://i.pinimg.com/736x/c5/2c/27/c52c27885a2ff4f5f3849b3df0b19463.jpg', 'Anime', 'DanDaDan', 'Anime', '{\"tematica\":\"Anime\",\"personaje\":\"DanDaDan\",\"estilo\":\"Anime\"}', '2025-06-02 17:28:02'),
(73, 'Poster Anime', 'Personajes principales de DanDaDan', 80.00, 'posters', 'https://i.pinimg.com/736x/8b/dd/dd/8bdddd5ab781252b48ca9fd816b4c5e6.jpg', 'Anime', 'DanDaDan', 'Anime', '{\"tematica\":\"Anime\",\"personaje\":\"DanDaDan\",\"estilo\":\"Anime\"}', '2025-06-02 17:28:02'),
(74, 'Poster Comic', 'Villanos iconicos de Marvel Comics', 80.00, 'posters', 'https://i.pinimg.com/736x/b2/d2/6a/b2d26a7941fdbb087b1542b9e77a1389.jpg', 'Heroes', 'Marvel', 'Comic', '{\"tematica\":\"Heroes\",\"personaje\":\"Marvel\",\"estilo\":\"Comic\"}', '2025-06-02 17:28:02'),
(75, 'Poster Videojuego', 'Trio de Pokemons Legendarios de Hoenn', 80.00, 'posters', 'https://i.pinimg.com/736x/d0/bf/19/d0bf19938beed0c551d3ce1c61e55ee8.jpg', 'Videojuego', 'Pokemon', 'Cartoon', '{\"tematica\":\"Videojuego\",\"personaje\":\"Pokemon\",\"estilo\":\"Cartoon\"}', '2025-06-02 17:28:02'),
(76, 'Poster Pelicula', 'Sparky de Frankenweenie ', 80.00, 'posters', 'https://i.pinimg.com/736x/0a/a4/48/0aa448960e010a9e2d942af8f4d406fa.jpg', 'Pelicula', 'Frankenweenie', 'Cartoon', '{\"tematica\":\"Heroes\",\"personaje\":\"Frankenweenie\",\"estilo\":\"Cartoon\"}', '2025-06-02 17:28:02'),
(77, 'Poster Serie', 'Tom y Daly de los Simpson en un chiste grafico', 80.00, 'posters', 'https://i.pinimg.com/736x/20/c9/89/20c98974f17e34341525beebacc14834.jpg', 'Serie', 'Los Simpson', 'Cartoon', '{\"tematica\":\"Serie\",\"personaje\":\"Los Simpson\",\"estilo\":\"Cartoon\"}', '2025-06-02 17:28:02'),
(78, 'Poster Comic', 'Las Tortugas Ninja y Destructor con su Clan del Ninjas', 80.00, 'posters', 'https://i.pinimg.com/736x/fb/a9/83/fba983d46fac42c22a7c1f663ed7fbe0.jpg', 'Comic', 'Tortugas Ninja', 'Comic', '{\"tematica\":\"Comic\",\"personaje\":\"Tortugas Ninja\",\"estilo\":\"Comic\"}', '2025-06-02 17:28:02'),
(79, 'Poster Pelicula', 'Merida y un Oso de la pelicula Brave de Disney', 80.00, 'posters', 'https://i.pinimg.com/736x/15/5b/5f/155b5f245127acae953836ee4cd2f505.jpg', 'Pelicula', 'Brave', 'Minimalista', '{\"tematica\":\"Pelicula\",\"personaje\":\"Brave\",\"estilo\":\"Minimalista\"}', '2025-06-02 17:28:02'),
(80, 'Poster Anime', 'Protagonistas y Antagonistas Principales de SnK peleando', 80.00, 'posters', 'https://i.pinimg.com/736x/36/2f/8d/362f8d6edcf6c9752bc7323584a839b5.jpg', 'Anime', 'Shingeki No Kyojin', 'Anime', '{\"tematica\":\"Anime\",\"personaje\":\"Shingeki No Kyojin\",\"estilo\":\"Anime\"}', '2025-06-02 17:28:02'),
(81, 'Poster Comic', 'Mark Grayson con su traje de super heroe de Invencible', 80.00, 'posters', 'https://i.pinimg.com/736x/d9/71/53/d97153be09ae73e5c5604bf7099734f6.jpg', 'Comic', 'Invencible', 'Comic', '{\"tematica\":\"Comic\",\"personaje\":\"Invencible\",\"estilo\":\"Comic\"}', '2025-06-02 17:28:02'),
(82, 'Poster Comic', 'Mark Grayson y Atom Eve de portada de Comic', 80.00, 'posters', 'https://i.pinimg.com/736x/35/37/ce/3537ce474f79a3cc1f562e9e1ecc436b.jpg', 'Comic', 'Invencible', 'Comic', '{\"tematica\":\"Comic\",\"personaje\":\"Invencible\",\"estilo\":\"Comic\"}', '2025-06-02 17:28:02'),
(83, 'Poster Anime', 'Maga Oscura en version minimalista', 80.00, 'posters', 'https://i.pinimg.com/736x/5b/fc/0e/5bfc0e662392979c24e50da79c1560f8.jpg', 'Videojuego', 'Yu-Gi-Oh', 'Minimalista', '{\"tematica\":\"Videojuego\",\"personaje\":\"Yu-Gi-Oh\",\"estilo\":\"Minimalista\"}', '2025-06-02 17:28:02'),
(84, 'Poster Serie', 'Invazor zim en una publicidad de Cereal de forma de parodia', 80.00, 'posters', 'https://i.pinimg.com/736x/d9/b5/ba/d9b5ba3add184effb955e4f343da028b.jpg', 'Serie', 'Invazor Zim', 'Cartoon', '{\"tematica\":\"Serie\",\"personaje\":\"Invazor Zim\",\"estilo\":\"Cartoon\"}', '2025-06-02 17:28:02'),
(85, 'Poster Pelicula', 'Spidermans de varias dimensiones que aparecen en la pelicula Into the spider verse', 80.00, 'posters', 'https://i.pinimg.com/736x/dc/4e/57/dc4e57fcc688926ff149f1ca4ec6c62a.jpg', 'Comic', 'Spiderman', 'Comic', '{\"tematica\":\"Comic\",\"personaje\":\"Spiderman\",\"estilo\":\"Comic\"}', '2025-06-02 17:28:02'),
(86, 'Poster Serie', 'El perro coraje y de fondo algunas escalofriantes cosas que aparecen en Ningun lugar', 80.00, 'posters', 'https://i.pinimg.com/736x/3b/78/a9/3b78a9ebb6f1c9632885342fde16a19e.jpg', 'Serie', 'Coraje', 'Cartoon', '{\"tematica\":\"\",\"personaje\":\"\",\"estilo\":\"\"}', '2025-06-02 17:28:02'),
(87, 'Poster Videojuego', 'Personajes principales del juego Cuphead', 80.00, 'posters', 'https://i.pinimg.com/736x/f7/a5/3b/f7a53b5f33193b8e7b0c7feaba5de4f5.jpg', 'Videojuego', 'Cuphead', 'Cartoon', '{\"tematica\":\"Videojuego\",\"personaje\":\"Cuphead\",\"estilo\":\"Cartoon\"}', '2025-06-02 17:28:02'),
(88, 'Botón Cartoon', 'Gatito Payaso al oleo', 15.00, 'botones', 'https://i.pinimg.com/736x/6f/78/4b/6f784b607d8310720bf60797ae547ce7.jpg', 'Animales', 'Gato', 'Oleo', '{\"tematica\":\"Animales\",\"personaje\":\"Gato\",\"estilo\":\"Oleo\"}', '2025-06-02 17:28:02'),
(89, 'Botón Cartoon', 'Ranita cumpleañera para festejar un cumpleaños feliz', 15.00, 'botones', 'https://i.pinimg.com/736x/98/1c/dd/981cddb08e6246080cc1fa5b84375ec8.jpg', 'Animales', 'Rana', 'Cartoon', '{\"tematica\":\"Animales\",\"personaje\":\"Rana\",\"estilo\":\"Cartoon\"}', '2025-06-02 17:28:02'),
(90, 'Botón Cartoon', 'Hambuerguesa de Hamster', 15.00, 'botones', 'https://i.pinimg.com/736x/47/29/e8/4729e801cf79d2f6897f750f70db9010.jpg', 'Animales', 'Hamster', 'Cartoon', '{\"tematica\":\"Animales\",\"personaje\":\"Hamster\",\"estilo\":\"Cartoon\"}', '2025-06-02 17:28:02'),
(91, 'Botón Cartoon', 'Gatito con leña para calentarse', 15.00, 'botones', 'https://i.pinimg.com/736x/95/4c/2e/954c2ecbdc3008f713f59867ec112658.jpg', 'Animales', 'Gato', 'Digital', '{\"tematica\":\"Animales\",\"personaje\":\"Gato\",\"estilo\":\"Digital\"}', '2025-06-02 17:28:02'),
(92, 'Botón Cartoon', 'Un Unicornio en tiempo de examenes o proyectos finales', 15.00, 'botones', 'https://i.pinimg.com/736x/76/71/6e/76716e6b0c575e52832cf0f58cae6f2c.jpg', 'Animales', 'Unicornio', 'Cartoon', '{\"tematica\":\"Animales\",\"personaje\":\"Unicornio\",\"estilo\":\"Cartoon\"}', '2025-06-02 17:28:02'),
(93, 'Botón Videojuego', 'Inicial Squirtle de Agua de Pokemon Rojo en su Pokebola', 15.00, 'botones', 'https://i.pinimg.com/736x/5b/3e/97/5b3e9772cc6cdee9be7964670da3d679.jpg', 'Videojuego', 'Pokemon', 'Anime', '{\"tematica\":\"Videojuego\",\"personaje\":\"Pokemon\",\"estilo\":\"Anime\"}', '2025-06-02 17:28:02'),
(94, 'Botón Videojuego', 'Inicial Charmander de Fuego de Pokemon Rojo en su Pokebola', 15.00, 'botones', 'https://i.pinimg.com/736x/ef/76/8b/ef768b25c2d07630252b56744f7b33eb.jpg', 'Videojuego', 'Pokemon', 'Anime', '{\"tematica\":\"Videojuego\",\"personaje\":\"Pokemon\",\"estilo\":\"Anime\"}', '2025-06-02 17:28:02'),
(95, 'Botón Videojuego', 'Inicial Bulbasaur de Planta de Pokemon Rojo en su Pokebola', 15.00, 'botones', 'https://i.pinimg.com/736x/da/26/21/da26218d9439ed07134ffcfec4e2d2dc.jpg', 'Videojuego', 'Pokemon', 'Anime', '{\"tematica\":\"Videojuego\",\"personaje\":\"Pokemon\",\"estilo\":\"Anime\"}', '2025-06-02 17:28:02'),
(96, 'Botón Cartoon', 'Mapachito que baila', 15.00, 'botones', 'https://i.pinimg.com/736x/d4/0f/9f/d40f9f80eef0c3f264f1e77d129cbf42.jpg', 'Animales', 'Mapache', 'Pintura', '{\"tematica\":\"Animales\",\"personaje\":\"Mapache\",\"estilo\":\"Pintura\"}', '2025-06-02 17:28:02'),
(97, 'Botón Anime', 'Jiji, gatito negro de Kiki y unas criaturitas de el viaje de chihiro', 15.00, 'botones', 'https://i.pinimg.com/736x/b9/7c/b3/b97cb32f75ede15630430f545f29945a.jpg', 'Anime', 'Kiki', 'Ghibli', '{\"tematica\":\"Anime\",\"personaje\":\"Kiki\",\"estilo\":\"Ghibli\"}', '2025-06-02 17:28:02'),
(98, 'Botón Videojuego', 'Pokemon wooper, inspirado en un ajolote bien PDF', 15.00, 'botones', 'https://i.pinimg.com/736x/93/78/2e/93782e80a585817334dd7bead673bb27.jpg', 'Videojuego', 'Pokemon', 'Cartoon', '{\"tematica\":\"Videojuego\",\"personaje\":\"Pokemon\",\"estilo\":\"Cartoon\"}', '2025-06-02 17:28:02'),
(99, 'Botón Videojuego', 'Sonic montando una patineta igual bien PDF', 15.00, 'botones', 'https://i.pinimg.com/736x/c8/05/37/c80537de8c9494ad6639a4b126549136.jpg', 'Videojuego', 'Sonic', 'Cartoon', '{\"tematica\":\"Videojuego\",\"personaje\":\"Sonic\",\"estilo\":\"Cartoon\"}', '2025-06-02 17:28:02'),
(100, 'Botón Serie', 'Perro coraje tite porque algo se ha llevado a Muriel', 15.00, 'botones', 'https://i.pinimg.com/736x/90/99/7f/90997fac83901d16bc1409870778c47a.jpg', 'Serie', 'Coraje', 'Cartoon', '{\"tematica\":\"Serie\",\"personaje\":\"Coraje\",\"estilo\":\"Cartoon\"}', '2025-06-02 17:28:02'),
(101, 'Botón Cartoon', 'Ajolote minilista con una Halo', 15.00, 'botones', 'https://i.pinimg.com/736x/e6/8c/1f/e68c1fde6190f3ac5b439aba7b8fdaac.jpg', 'Animales', 'Ajolote', 'Minimalista', '{\"tematica\":\"Animales\",\"personaje\":\"Ajolote\",\"estilo\":\"Minimalista\"}', '2025-06-02 17:28:02'),
(102, 'Botón Cartoon', 'Cinnamoroll, el perrito no conejo de Hello kitty', 15.00, 'botones', 'https://i.pinimg.com/736x/c3/c0/f4/c3c0f4710056e7873eaf784d63028c4b.jpg', 'Anime', 'Hello Kitty', 'Sanrio', '{\"tematica\":\"Anime\",\"personaje\":\"Hello Kitty\",\"estilo\":\"Sanrio\"}', '2025-06-02 17:28:02'),
(103, 'Botón Anime', 'Jiji, gatito negro de Kiki vestido con un corbatin', 15.00, 'botones', 'https://i.pinimg.com/736x/b5/6d/60/b56d6049bc01e3df320b4ed47a5994e7.jpg', 'Anime', 'Kiki', 'Ghibli', '{\"tematica\":\"Anime\",\"personaje\":\"Kiki\",\"estilo\":\"Ghibli\"}', '2025-06-02 17:28:02'),
(104, 'Botón Cartoon', 'El pato donald con dinero como si vendiera birria', 15.00, 'botones', 'https://i.pinimg.com/736x/a5/67/7b/a5677bca722b961d9843766591d57f2c.jpg', 'Cartoon', 'Looney Toones', 'Cartoon', '{\"tematica\":\"Cartoon\",\"personaje\":\"Looney Toones\",\"estilo\":\"Cartoon\"}', '2025-06-02 17:28:02'),
(105, 'Botón Videojuego', 'Un tripulante tierno de Among Us, ¿sera un impostor?', 15.00, 'botones', 'https://i.pinimg.com/736x/5c/55/0c/5c550c08ef25f73915f3843ac3a60570.jpg', 'Videojuego', 'Among Us', 'Cartoon', '{\"tematica\":\"Videojuego\",\"personaje\":\"Among Us\",\"estilo\":\"Cartoon\"}', '2025-06-02 17:28:02'),
(106, 'Botón Videojuego', 'Una vista minimalista de Furina de Genshin Impact', 15.00, 'botones', 'https://i.pinimg.com/736x/9f/e0/40/9fe0408e7815650e2874e91ae1a8e64e.jpg', 'Videojuego', 'Genshin Impact', 'Minimalista', '{\"tematica\":\"Videojuego\",\"personaje\":\"Genshin Impact\",\"estilo\":\"Minimalista\"}', '2025-06-02 17:28:02'),
(107, 'Botón Videojuego', 'Hu tao con un estilo manga', 15.00, 'botones', 'https://i.pinimg.com/736x/15/ff/88/15ff8871c934574f4e9b429c73772665.jpg', 'Videojuego', 'Genshin Impact', 'Manga', '{\"tematica\":\"Videojuego\",\"personaje\":\"Genshin Impact\",\"estilo\":\"Manga\"}', '2025-06-02 17:28:02'),
(108, 'Botón Anime', 'Retsuko cantando Death Metal convirtiendose en Aggresive Retsuko', 15.00, 'botones', 'https://i.pinimg.com/736x/9c/27/e0/9c27e08adbedba686f456498da8da3e4.jpg', 'Anime', 'Aggretsuko', 'Anime', '{\"tematica\":\"Anime\",\"personaje\":\"Aggretsuko\",\"estilo\":\"Anime\"}', '2025-06-02 17:28:02'),
(109, 'Botón Cartoon', 'Gatito listo para un viaje largo', 15.00, 'botones', 'https://i.pinimg.com/736x/8f/6c/79/8f6c797473b370dbff7b1261df555b82.jpg', 'Animales', 'Gato', 'Cartoon', '{\"tematica\":\"Animales\",\"personaje\":\"Gato\",\"estilo\":\"Cartoon\"}', '2025-06-02 17:28:02'),
(110, 'Botón Videojuego', 'Basil en el mundo espiritual donde todo es bonito', 15.00, 'botones', 'https://i.pinimg.com/736x/89/f7/25/89f725367df61ca2d6ba009cca7d96a1.jpg', 'Videojuego', 'Omori', 'Kawai', '{\"tematica\":\"Videojuego\",\"personaje\":\"Omori\",\"estilo\":\"Kawai\"}', '2025-06-02 17:28:02'),
(111, 'Botón Anime', 'Rei ayanami estilo manga', 15.00, 'botones', 'https://i.pinimg.com/736x/05/cc/95/05cc9568c9f08e4bf70de7d1023b91db.jpg', 'Anime', 'Evangelion', 'Manga', '{\"tematica\":\"Anime\",\"personaje\":\"Evangelion\",\"estilo\":\"Manga\"}', '2025-06-02 17:28:02');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `fecha_registro` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`),
  ADD KEY `producto_id` (`producto_id`);

--
-- Indices de la tabla `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `compras_detalles`
--
ALTER TABLE `compras_detalles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `carrito`
--
ALTER TABLE `carrito`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `compras`
--
ALTER TABLE `compras`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `compras_detalles`
--
ALTER TABLE `compras_detalles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD CONSTRAINT `carrito_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`),
  ADD CONSTRAINT `carrito_ibfk_2` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
