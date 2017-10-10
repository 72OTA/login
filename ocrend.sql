-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-10-2017 a las 14:22:58
-- Versión del servidor: 10.1.25-MariaDB
-- Versión de PHP: 7.1.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ocrend`
--
CREATE DATABASE IF NOT EXISTS `ocrend` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `ocrend`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa`
--

DROP TABLE IF EXISTS `empresa`;
CREATE TABLE `empresa` (
  `id_empresa` int(11) NOT NULL,
  `nombre` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `telefono` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `impuesto` double NOT NULL,
  `tipo_moneda` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `direccion` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `ciudad` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `comuna` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `region` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `ext_logo` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Truncar tablas antes de insertar `empresa`
--

TRUNCATE TABLE `empresa`;
--
-- Volcado de datos para la tabla `empresa`
--

INSERT INTO `empresa` (`id_empresa`, `nombre`, `telefono`, `email`, `impuesto`, `tipo_moneda`, `direccion`, `ciudad`, `comuna`, `region`, `ext_logo`) VALUES
(1, 'WYS LTDA', '+56 9', 'contacto@wys.cl', 19, '$', 'Por Ahi', 'Santiago', 'Santiago', 'Metropolitana', 'jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblmenu`
--

DROP TABLE IF EXISTS `tblmenu`;
CREATE TABLE `tblmenu` (
  `id_menu` int(10) UNSIGNED NOT NULL,
  `PosI` int(10) UNSIGNED NOT NULL,
  `descripcion` varchar(45) CHARACTER SET latin1 NOT NULL,
  `glyphicon` varchar(50) CHARACTER SET latin1 DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Truncar tablas antes de insertar `tblmenu`
--

TRUNCATE TABLE `tblmenu`;
--
-- Volcado de datos para la tabla `tblmenu`
--

INSERT INTO `tblmenu` (`id_menu`, `PosI`, `descripcion`, `glyphicon`) VALUES
(1, 1, 'PLATAFORMA', 'fa-headphones'),
(99, 99, 'ADMINISTRACIÓN', 'fa-user'),
(2, 2, 'RR HH', 'fa-users'),
(4, 4, 'OPERACIONES', 'fa-tachometer'),
(3, 3, 'REDES', 'fa-sitemap'),
(5, 5, 'PREVENCION', 'fa-fire-extinguisher'),
(6, 6, 'TEST', 'fa-tachometer');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblperfiles`
--

DROP TABLE IF EXISTS `tblperfiles`;
CREATE TABLE `tblperfiles` (
  `id` int(11) UNSIGNED NOT NULL,
  `nombre` varchar(35) CHARACTER SET latin1 NOT NULL,
  `id_menu` int(10) NOT NULL DEFAULT '0',
  `id_submenu` int(10) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Truncar tablas antes de insertar `tblperfiles`
--

TRUNCATE TABLE `tblperfiles`;
--
-- Volcado de datos para la tabla `tblperfiles`
--

INSERT INTO `tblperfiles` (`id`, `nombre`, `id_menu`, `id_submenu`) VALUES
(78, 'HD_SUPERVISOR', 5, 1),
(77, 'HD_SUPERVISOR', 4, 1),
(79, 'HD_USUARIO', 1, 1),
(76, 'HD_SUPERVISOR', 3, 1),
(75, 'HD_SUPERVISOR', 2, 1),
(74, 'HD_SUPERVISOR', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblperfilesuser`
--

DROP TABLE IF EXISTS `tblperfilesuser`;
CREATE TABLE `tblperfilesuser` (
  `id` int(11) NOT NULL,
  `id_user` varchar(50) CHARACTER SET latin1 NOT NULL,
  `id_menu` int(10) UNSIGNED NOT NULL,
  `id_submenu` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Truncar tablas antes de insertar `tblperfilesuser`
--

TRUNCATE TABLE `tblperfilesuser`;
--
-- Volcado de datos para la tabla `tblperfilesuser`
--

INSERT INTO `tblperfilesuser` (`id`, `id_user`, `id_menu`, `id_submenu`) VALUES
(1, '10', 1, 1),
(1, '11', 1, 1),
(1, '12', 1, 1),
(1, '13', 1, 1),
(1, '2', 1, 1),
(1, '2', 2, 1),
(1, '2', 3, 1),
(1, '2', 4, 1),
(1, '2', 5, 1),
(1, '3', 1, 1),
(1, '4', 1, 1),
(1, '4', 2, 1),
(1, '5', 1, 1),
(1, '6', 1, 1),
(1, '7', 1, 1),
(1, '8', 1, 1),
(1, '9', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblsubmenu`
--

DROP TABLE IF EXISTS `tblsubmenu`;
CREATE TABLE `tblsubmenu` (
  `id_menu` int(10) UNSIGNED NOT NULL,
  `id_submenu` int(10) UNSIGNED NOT NULL,
  `PosS` int(10) UNSIGNED NOT NULL,
  `url` varchar(100) CHARACTER SET latin1 NOT NULL,
  `descripcion` varchar(45) CHARACTER SET latin1 NOT NULL,
  `estado` smallint(5) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Truncar tablas antes de insertar `tblsubmenu`
--

TRUNCATE TABLE `tblsubmenu`;
--
-- Volcado de datos para la tabla `tblsubmenu`
--

INSERT INTO `tblsubmenu` (`id_menu`, `id_submenu`, `PosS`, `url`, `descripcion`, `estado`) VALUES
(99, 2, 2, 'administracion/usuario', 'Usuarios', 1),
(99, 3, 3, 'administracion/perfiles', 'Perfiles', 1),
(2, 1, 1, 'rrhh', 'Principal', 1),
(1, 1, 1, 'plataforma', 'Principal', 1),
(3, 1, 1, 'redes', 'Principal', 1),
(5, 1, 1, 'prevencion', 'Principal', 1),
(4, 1, 1, 'operaciones', 'Principal', 1),
(99, 1, 1, 'administracion', 'Principal', 1),
(99, 4, 4, 'administracion/empresa', 'Datos Empresa', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id_user` int(11) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `fono` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `cargo` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `pass` varchar(90) COLLATE utf8_unicode_ci NOT NULL,
  `tmp_pass` varchar(90) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(90) COLLATE utf8_unicode_ci NOT NULL,
  `perfil` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `rol` smallint(1) NOT NULL DEFAULT '0',
  `estado` smallint(1) NOT NULL DEFAULT '1',
  `foto` smallint(1) NOT NULL DEFAULT '0',
  `name_foto` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `pagina_inicio` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Truncar tablas antes de insertar `users`
--

TRUNCATE TABLE `users`;
--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id_user`, `name`, `email`, `fono`, `cargo`, `pass`, `tmp_pass`, `token`, `perfil`, `rol`, `estado`, `foto`, `name_foto`, `pagina_inicio`) VALUES
(1, 'ADMINISTRADOR DE SISTEMA', 'admin@wys.cl', '+56 555CORRIENTEE', 'ADMINISTRADOR SISTEMA', '$2a$10$9af81aa5eb4b6c474ce28OszU/gzJ0m228cqmbBHK5YOb6lh1LVLC', '', '', 'DEFINIDO', 1, 1, 1, '1.jpg', 'administracion'),
(2, 'JORGE JARA', 'jjara@wys.cl', '+56988397298', 'Supervisor HD', '$2a$10$e1bb281b478e8fd0c335cOshRICjNlTqb1McoFLaScnITXbnoJOC.', '', '', 'HD_SUPERVISOR', 0, 0, 1, '2.jpg', 'plataforma'),
(3, 'PRUEBA DE EÃ‘E Y ÃCÃ‰NTÃ“Ã“Ã“Ã“Ã“Ã“Ã“', 'prueba@wys.cl', '111111111', 'otro', '$2a$10$687c1d9982b3f6742eb71u.p.anfVdE3biHUIMf3wADqg7dl9.ZRi', '', '', 'HD_USUARIO', 0, 1, 1, '3.jpg', 'portal'),
(4, 'OTRO1', 'otro@wys.cl', '1', '1', '$2a$10$56623cd296fe02cf71a27uYr0W1bu/jPI8SWLdrx1RHm1Mj1h4dyC', '', '', 'DEFINIDO', 0, 1, 0, '', 'portal'),
(5, 'OTRO2', 'otro2@otro.cl', '1', '1', '$2a$10$c9430121755f8051615c7eTGbhbxhOCHtx/qbP7d2oAGmBsz2Kznq', '', '', 'DEFINIDO', 0, 1, 0, '', 'portal'),
(6, 'otro3', 'otro3@otro.cl', '', '', '$2a$10$adb8bf12568c963c73c19u1K0nJclJg5MqnI1mtgEajTMwulfcclK', '', '', 'DEFINIDO', 0, 1, 0, '', ''),
(7, 'otro4', 'otro4@otro.cl', '', '', '$2a$10$8b74198346f00bd964ec7O2.Wh5yYtiNrW8fFq2D.aWZmeaMPhaXO', '', '', 'DEFINIDO', 0, 1, 0, '', ''),
(8, 'otro5', 'otro5@otro.cl', '', '', '$2a$10$d29ae9464f94d617c16b4uIvhqUPzkazsTwVuN9NEKsIgpCcyddl6', '', '', 'DEFINIDO', 0, 1, 0, '', ''),
(9, 'otro6', 'otro6@otro.cl', '', '', '$2a$10$ec73a76206c8c0f4ca1faOEiMkqF5njOePKvLAOFbQRhngaTDqitG', '', '', 'DEFINIDO', 0, 1, 0, '', ''),
(10, 'otro7', 'otro7@otro.cl', '', '', '$2a$10$ec39d6636a77381369a5cu/iurTkQfcsNbaZdpOsIx8et9njmq1AW', '', '', 'DEFINIDO', 0, 1, 0, '', ''),
(11, 'otro8', 'otro8@otro.cl', '', '', '$2a$10$8343232abeed6565252baugen86eC3CIfPGUtT5dHxy.HK4koA352', '', '', 'DEFINIDO', 0, 1, 0, '', ''),
(12, 'OTRO9', 'otro9@otro.cl', '0', 'EJEcutivo hd', '$2a$10$4b9062b407ce44806a040uOzdDuBK4WL5wY0nSDN8.nI6Ldw5vRaC', '', '', 'DEFINIDO', 1, 1, 0, '', 'portal'),
(13, 'otro10', 'otro10@otro.cl', '1', 'otro', '$2a$10$414bc350596fcd9f33070ur9KJF0jXc4rI5XeXE00j8n2vQhp.d/i', '', '', 'DEFINIDO', 0, 1, 0, '', 'portal');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `empresa`
--
ALTER TABLE `empresa`
  ADD PRIMARY KEY (`id_empresa`);

--
-- Indices de la tabla `tblmenu`
--
ALTER TABLE `tblmenu`
  ADD PRIMARY KEY (`id_menu`);

--
-- Indices de la tabla `tblperfiles`
--
ALTER TABLE `tblperfiles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tblperfilesuser`
--
ALTER TABLE `tblperfilesuser`
  ADD PRIMARY KEY (`id_user`,`id_menu`,`id_submenu`,`id`) USING BTREE;

--
-- Indices de la tabla `tblsubmenu`
--
ALTER TABLE `tblsubmenu`
  ADD PRIMARY KEY (`id_menu`,`id_submenu`) USING BTREE;

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `empresa`
--
ALTER TABLE `empresa`
  MODIFY `id_empresa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `tblmenu`
--
ALTER TABLE `tblmenu`
  MODIFY `id_menu` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;
--
-- AUTO_INCREMENT de la tabla `tblperfiles`
--
ALTER TABLE `tblperfiles`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;
--
-- AUTO_INCREMENT de la tabla `tblperfilesuser`
--
ALTER TABLE `tblperfilesuser`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tblsubmenu`
--
ALTER TABLE `tblsubmenu`
  MODIFY `id_submenu` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
