-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-09-2017 a las 02:55:09
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
-- Volcado de datos para la tabla `tblmenu`
--

INSERT INTO `tblmenu` (`id_menu`, `PosI`, `descripcion`, `glyphicon`) VALUES
(1, 1, 'PLATAFORMA', 'fa-headphones'),
(99, 99, 'ADMINISTRACIÓN', 'fa-user'),
(2, 2, 'RR HH', 'fa-users'),
(4, 4, 'OPERACIONES', 'fa-tachometer'),
(3, 3, 'REDES', 'fa-sitemap'),
(5, 5, 'PREVENCION', 'fa-fire-extinguisher');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblperfiles`
--

DROP TABLE IF EXISTS `tblperfiles`;
CREATE TABLE `tblperfiles` (
  `nombre` varchar(35) NOT NULL,
  `Idopcion` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `idSubmenu` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tblperfiles`
--

INSERT INTO `tblperfiles` (`nombre`, `Idopcion`, `idSubmenu`) VALUES
('gerencia', 1, 1),
('gerencia', 2, 4),
('gerencia', 2, 9),
('gerencia', 3, 1),
('gerencia', 4, 1),
('gerencia', 4, 2),
('gerencia', 5, 1),
('HD_Ejecutivo', 1, 1),
('HD_Ejecutivo', 1, 4),
('HD_Ejecutivo', 1, 5),
('HD_Ejecutivo', 2, 2),
('HD_supervisor', 1, 1),
('HD_supervisor', 1, 2),
('HD_supervisor', 1, 3),
('HD_supervisor', 1, 5),
('HD_supervisor', 1, 6),
('HD_supervisor', 2, 1),
('HD_supervisor', 2, 2),
('HD_supervisor', 2, 3),
('HD_supervisor', 2, 4),
('HD_supervisor', 2, 6),
('HD_supervisor', 2, 8),
('HD_supervisor', 2, 9),
('jefatura', 1, 1),
('jefatura', 2, 3),
('jefatura', 2, 4),
('jefatura', 2, 5),
('jefatura', 2, 6),
('jefatura', 2, 7),
('jefatura', 2, 8),
('jefatura', 2, 9),
('jefatura', 3, 1),
('jefatura', 4, 1),
('jefatura', 5, 1),
('Supervisor', 1, 1),
('Supervisor', 2, 1),
('Supervisor', 2, 2),
('Supervisor', 2, 3),
('Supervisor', 2, 4),
('Supervisor_tecnico', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblperfilesuser`
--

DROP TABLE IF EXISTS `tblperfilesuser`;
CREATE TABLE `tblperfilesuser` (
  `IdUsuario` varchar(50) NOT NULL,
  `Idopcion` int(10) UNSIGNED NOT NULL,
  `idSubmenu` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tblperfilesuser`
--

INSERT INTO `tblperfilesuser` (`IdUsuario`, `Idopcion`, `idSubmenu`) VALUES
(' cvenac', 1, 1),
(' cvenac', 2, 2),
('aberga', 1, 1),
('aberga', 1, 4),
('aberga', 1, 5),
('aberga', 2, 2),
('abizas', 1, 1),
('abizas', 1, 4),
('abizas', 1, 5),
('abizas', 2, 2),
('aizqgo', 1, 1),
('aizqgo', 1, 4),
('aizqgo', 1, 5),
('aizqgo', 2, 2),
('bcoldu', 1, 1),
('bcoldu', 1, 4),
('bcoldu', 1, 5),
('bcoldu', 2, 2),
('cdiard', 1, 1),
('cdiard', 1, 4),
('cdiard', 1, 5),
('cdiard', 2, 2),
('cgonpe', 1, 1),
('cgonpe', 1, 2),
('cgonpe', 1, 3),
('cgonpe', 1, 5),
('cgonpe', 1, 6),
('cgonpe', 2, 1),
('cgonpe', 2, 2),
('cgonpe', 2, 3),
('cgonpe', 2, 4),
('cgonpe', 2, 6),
('cgonpe', 2, 8),
('cgonpe', 2, 9),
('cingod', 1, 1),
('cingod', 1, 4),
('cingod', 1, 5),
('cingod', 2, 2),
('colifu', 1, 1),
('colifu', 1, 4),
('colifu', 1, 5),
('colifu', 2, 2),
('cvenac', 1, 1),
('cvenac', 1, 4),
('cvenac', 1, 5),
('cvenac', 2, 2),
('dcovna', 1, 1),
('dcovna', 1, 2),
('dcovna', 1, 3),
('dcovna', 1, 5),
('dcovna', 1, 6),
('dcovna', 2, 1),
('dcovna', 2, 2),
('dcovna', 2, 3),
('dcovna', 2, 4),
('dcovna', 2, 6),
('dcovna', 2, 8),
('dcovna', 2, 9),
('ddomhe', 1, 1),
('ddomhe', 1, 4),
('ddomhe', 1, 5),
('ddomhe', 2, 2),
('delcas', 1, 1),
('delcas', 1, 4),
('delcas', 1, 5),
('delcas', 2, 2),
('dleidi', 1, 1),
('dleidi', 1, 4),
('dleidi', 1, 5),
('dleidi', 2, 2),
('ebrive', 1, 1),
('ebrive', 1, 4),
('ebrive', 1, 5),
('ebrive', 2, 2),
('fandva', 1, 1),
('fandva', 1, 4),
('fandva', 1, 5),
('fandva', 2, 2),
('gvalme', 1, 1),
('gvalme', 1, 4),
('gvalme', 1, 5),
('gvalme', 2, 2),
('hgutsa', 1, 1),
('hgutsa', 1, 4),
('hgutsa', 1, 5),
('hgutsa', 2, 2),
('iencgo', 1, 1),
('iencgo', 1, 4),
('iencgo', 1, 5),
('iencgo', 2, 2),
('jaceug', 1, 1),
('jaceug', 1, 4),
('jaceug', 1, 5),
('jaceug', 2, 2),
('jjarhi', 1, 1),
('jjarhi', 1, 2),
('jjarhi', 1, 3),
('jjarhi', 1, 5),
('jjarhi', 1, 6),
('jjarhi', 2, 1),
('jjarhi', 2, 2),
('jjarhi', 2, 3),
('jjarhi', 2, 4),
('jjarhi', 2, 6),
('jjarhi', 2, 8),
('jjarhi', 2, 9),
('jlopcl', 1, 1),
('jlopcl', 1, 4),
('jlopcl', 1, 5),
('jlopcl', 2, 2),
('jlopfe', 1, 1),
('jlopfe', 1, 4),
('jlopfe', 1, 5),
('jlopfe', 2, 2),
('jramqu', 1, 1),
('jramqu', 1, 4),
('jramqu', 1, 5),
('jramqu', 2, 2),
('jreydi', 1, 1),
('jreydi', 2, 3),
('jreydi', 2, 4),
('jreydi', 2, 5),
('jreydi', 2, 6),
('jreydi', 2, 7),
('jreydi', 2, 8),
('jreydi', 2, 9),
('jreydi', 3, 1),
('jreydi', 4, 1),
('jreydi', 5, 1),
('jvalgv', 1, 1),
('jvalgv', 1, 4),
('jvalgv', 1, 5),
('jvalgv', 2, 2),
('lrodma', 1, 1),
('lrodma', 1, 4),
('lrodma', 1, 5),
('lrodma', 2, 2),
('maribe', 1, 1),
('maribe', 1, 4),
('maribe', 1, 5),
('maribe', 2, 2),
('msariq', 1, 1),
('msariq', 1, 4),
('msariq', 1, 5),
('msariq', 2, 2),
('nifarp', 1, 1),
('nifarp', 1, 4),
('nifarp', 1, 5),
('nifarp', 2, 2),
('njarva', 1, 1),
('njarva', 1, 4),
('njarva', 1, 5),
('njarva', 2, 2),
('pbrasi', 1, 1),
('pbrasi', 1, 2),
('pbrasi', 1, 3),
('pbrasi', 1, 5),
('pbrasi', 1, 6),
('pbrasi', 2, 1),
('pbrasi', 2, 2),
('pbrasi', 2, 3),
('pbrasi', 2, 4),
('pbrasi', 2, 6),
('pbrasi', 2, 8),
('pbrasi', 2, 9),
('pervam', 1, 1),
('pervam', 1, 4),
('pervam', 1, 5),
('pervam', 2, 2),
('pfieol', 1, 1),
('pfieol', 1, 4),
('pfieol', 1, 5),
('pfieol', 2, 2),
('rdavfo', 1, 1),
('rdavfo', 1, 4),
('rdavfo', 1, 5),
('rdavfo', 2, 2),
('rodrigo.slier@nielsen.cl', 1, 1),
('rodrigo.slier@nielsen.cl', 2, 4),
('rodrigo.slier@nielsen.cl', 2, 9),
('rodrigo.slier@nielsen.cl', 3, 1),
('rodrigo.slier@nielsen.cl', 4, 1),
('rodrigo.slier@nielsen.cl', 4, 2),
('rodrigo.slier@nielsen.cl', 5, 1),
('rsanso', 1, 1),
('rsanso', 1, 4),
('rsanso', 1, 5),
('rsanso', 2, 2),
('rsotfe', 1, 1),
('rsotfe', 1, 4),
('rsotfe', 1, 5),
('rsotfe', 2, 2),
('rurima', 1, 1),
('rurima', 1, 4),
('rurima', 1, 5),
('rurima', 2, 2),
('rvelin', 1, 1),
('rvelin', 1, 4),
('rvelin', 1, 5),
('rvelin', 2, 2),
('salall', 1, 1),
('salall', 1, 4),
('salall', 1, 5),
('salall', 2, 2),
('saramu', 1, 1),
('saramu', 1, 4),
('saramu', 1, 5),
('saramu', 2, 2),
('vverna', 1, 1),
('vverna', 1, 4),
('vverna', 1, 5),
('vverna', 2, 2);

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
-- Volcado de datos para la tabla `tblsubmenu`
--

INSERT INTO `tblsubmenu` (`id_menu`, `id_submenu`, `PosS`, `url`, `descripcion`, `estado`) VALUES
(99, 1, 1, 'administracion/usuario', 'Usuarios', 1),
(99, 2, 2, 'administracion/perfiles', 'Perfiles', 1),
(2, 1, 1, 'rrhh', 'Principal', 1),
(1, 1, 1, 'plataforma', 'Principal', 1),
(3, 1, 1, 'redes', 'Principal', 1),
(5, 1, 1, 'prevencion', 'Principal', 1),
(4, 1, 1, 'operaciones', 'Principal', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id_user` int(11) UNSIGNED NOT NULL,
  `name` varchar(100) CHARACTER SET latin1 NOT NULL,
  `email` varchar(150) CHARACTER SET latin1 NOT NULL,
  `pass` varchar(90) CHARACTER SET latin1 NOT NULL,
  `tmp_pass` varchar(90) CHARACTER SET latin1 NOT NULL,
  `token` varchar(90) CHARACTER SET latin1 NOT NULL,
  `perfil` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id_user`, `name`, `email`, `pass`, `tmp_pass`, `token`, `perfil`, `admin`) VALUES
(1, 'administrador', 'admin@nielsen.cl', '1234', '', '', 'otro', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tblmenu`
--
ALTER TABLE `tblmenu`
  ADD PRIMARY KEY (`id_menu`);

--
-- Indices de la tabla `tblperfiles`
--
ALTER TABLE `tblperfiles`
  ADD PRIMARY KEY (`nombre`,`Idopcion`,`idSubmenu`) USING BTREE;

--
-- Indices de la tabla `tblperfilesuser`
--
ALTER TABLE `tblperfilesuser`
  ADD PRIMARY KEY (`IdUsuario`,`Idopcion`,`idSubmenu`) USING BTREE;

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
-- AUTO_INCREMENT de la tabla `tblmenu`
--
ALTER TABLE `tblmenu`
  MODIFY `id_menu` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;
--
-- AUTO_INCREMENT de la tabla `tblsubmenu`
--
ALTER TABLE `tblsubmenu`
  MODIFY `id_submenu` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
