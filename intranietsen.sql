-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-10-2017 a las 20:52:12
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
-- Base de datos: `intranietsen`
--
CREATE DATABASE IF NOT EXISTS `intranietsen` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `intranietsen`;

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
(1, 'CABLE NIELSEN LTDA', '+56 9', 'contacto@nielsen.cl', 19, '$', 'Piloto Lazo 90', 'Santiago', 'Cerrillos', 'Metropolitana', 'png');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblareas`
--

DROP TABLE IF EXISTS `tblareas`;
CREATE TABLE `tblareas` (
  `id_area` int(11) NOT NULL,
  `descripcion` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Truncar tablas antes de insertar `tblareas`
--

TRUNCATE TABLE `tblareas`;
--
-- Volcado de datos para la tabla `tblareas`
--

INSERT INTO `tblareas` (`id_area`, `descripcion`) VALUES
(1, 'HELPDESK');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblcargos`
--

DROP TABLE IF EXISTS `tblcargos`;
CREATE TABLE `tblcargos` (
  `id_cargo` int(11) NOT NULL,
  `descripcion` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Truncar tablas antes de insertar `tblcargos`
--

TRUNCATE TABLE `tblcargos`;
--
-- Volcado de datos para la tabla `tblcargos`
--

INSERT INTO `tblcargos` (`id_cargo`, `descripcion`) VALUES
(1, 'Supervisor HD'),
(2, 'Ejecutivo HD'),
(3, 'Jefe HD');

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
(84, 'HD_SUPERVISOR', 5, 1),
(83, 'HD_SUPERVISOR', 4, 1),
(79, 'HD_USUARIO', 1, 1),
(82, 'HD_SUPERVISOR', 3, 1),
(81, 'HD_SUPERVISOR', 2, 1),
(80, 'HD_SUPERVISOR', 1, 1);

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
-- Estructura de tabla para la tabla `tblpersonal`
--

DROP TABLE IF EXISTS `tblpersonal`;
CREATE TABLE `tblpersonal` (
  `id_personal` int(11) NOT NULL,
  `rut` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `nombres` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `f_nacimiento` date NOT NULL,
  `fono` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `id_cargo` int(11) NOT NULL,
  `id_area` int(11) NOT NULL,
  `id_user` int(11) NOT NULL DEFAULT '0',
  `estado` smallint(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Truncar tablas antes de insertar `tblpersonal`
--

TRUNCATE TABLE `tblpersonal`;
--
-- Volcado de datos para la tabla `tblpersonal`
--

INSERT INTO `tblpersonal` (`id_personal`, `rut`, `nombres`, `f_nacimiento`, `fono`, `id_cargo`, `id_area`, `id_user`, `estado`) VALUES
(1, '15889905', 'Jorge Jara Hinojosa', '1984-04-02', '+56988397298', 1, 1, 0, 1);

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
(99, 4, 4, 'administracion/empresa', 'Datos Empresa', 1),
(2, 2, 2, 'rrhh/mantenedores_crud_masters', 'Maestros RRHH', 1),
(2, 3, 3, 'rrhh/horasextra', 'Horas Extra', 1),
(2, 4, 4, 'rrhh/revisar_horas_extras_pendientes', 'Revisar Solicitud', 1);

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
  `rut_personal` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `estado` smallint(1) NOT NULL DEFAULT '1',
  `foto` smallint(1) NOT NULL DEFAULT '0',
  `name_foto` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `pagina_inicio` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `online_fecha` int(20) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Truncar tablas antes de insertar `users`
--

TRUNCATE TABLE `users`;
--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id_user`, `name`, `email`, `fono`, `cargo`, `pass`, `tmp_pass`, `token`, `perfil`, `rol`, `rut_personal`, `estado`, `foto`, `name_foto`, `pagina_inicio`, `online_fecha`) VALUES
(1, 'ADMINISTRADOR DE SISTEMA', 'admin@wys.cl', '+56 555CORRIENTEE', 'ADMINISTRADOR SISTEMA', '$2a$10$62a30d098dcece5583056u8AaVIVdxUIEzWmRNb4E9KOXMFcFiBG.', '', '', 'DEFINIDO', 1, '0', 1, 1, '1.jpg', 'administracion', 1508784581),
(2, 'FELIPE ANDRADE', 'fava@in.cl', '+56986606669', 'Supervisor HD', '$2a$10$9b8f2f7c1796ce2a5654fe1In1xssSqlDMnp9hNnQEvJ94OFFpO7.', '', '', 'HD_SUPERVISOR', 0, '18050468', 1, 1, '2.jpg', 'plataforma', 0),
(2, 'JORGE JARA', 'jjara@wys.cl', '+56988397298', 'Supervisor HD', '$2a$10$9b8f2f7c1796ce2a5654fe1In1xssSqlDMnp9hNnQEvJ94OFFpO7.', '', '', 'HD_SUPERVISOR', 0, '15889905', 1, 1, '2.jpg', 'plataforma', 0);

--
-- Índices para tablas volcadas
--
--
-- Estructura de tabla para la tabla `tbl_horasextra`
--

DROP TABLE IF EXISTS `tbl_horasextra`;
CREATE TABLE `tbl_horasextra` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `fecha` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `rut` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `fechad` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `fechah` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `solicitante` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `motivo` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
	`estatus` VARCHAR(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Pendiente',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Truncar tablas antes de insertar `tbl_horasextra`
--

TRUNCATE TABLE `tbl_horasextra`;
--
-- Volcado de datos para la tabla `tbl_horasextra`
--
--
INSERT INTO `tbl_horasextra` (`id`,`rut`, `fechad`, `fechah`, `solicitante`, `motivo`) VALUES
('0','ejemplo1', 'ejemplofd', 'ejemplofh', 'ejemplosolicitante', 'ejemplomotivo'),
('1','ejemplo2', 'ejemplofd', 'ejemplofh', 'ejemplosolicitante', 'ejemplomotivo'),
('2','ejemplo3', 'ejemplofd', 'ejemplofh', 'ejemplosolicitante', 'ejemplomotivo');
-- --------------------------------------------------------
--
-- Indices de la tabla `empresa`
--
ALTER TABLE `empresa`
  ADD PRIMARY KEY (`id_empresa`);

--
-- Indices de la tabla `tblareas`
--
ALTER TABLE `tblareas`
  ADD PRIMARY KEY (`id_area`);

--
-- Indices de la tabla `tblcargos`
--
ALTER TABLE `tblcargos`
  ADD PRIMARY KEY (`id_cargo`);

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
-- Indices de la tabla `tblpersonal`
--
ALTER TABLE `tblpersonal`
  ADD PRIMARY KEY (`id_personal`);

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
-- AUTO_INCREMENT de la tabla `tblareas`
--
ALTER TABLE `tblareas`
  MODIFY `id_area` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `tblcargos`
--
ALTER TABLE `tblcargos`
  MODIFY `id_cargo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `tblmenu`
--
ALTER TABLE `tblmenu`
  MODIFY `id_menu` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;
--
-- AUTO_INCREMENT de la tabla `tblperfiles`
--
ALTER TABLE `tblperfiles`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;
--
-- AUTO_INCREMENT de la tabla `tblperfilesuser`
--
ALTER TABLE `tblperfilesuser`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tblpersonal`
--
ALTER TABLE `tblpersonal`
  MODIFY `id_personal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
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
