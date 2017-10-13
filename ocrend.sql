-- --------------------------------------------------------
-- Host:                         localhost
-- Versión del servidor:         10.1.25-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win32
-- HeidiSQL Versión:             9.4.0.5174
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Volcando estructura de base de datos para ocrend
CREATE DATABASE IF NOT EXISTS `ocrend` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;
USE `ocrend`;

-- Volcando estructura para tabla ocrend.empresa
CREATE TABLE IF NOT EXISTS `empresa` (
  `id_empresa` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `telefono` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `impuesto` double NOT NULL,
  `tipo_moneda` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `direccion` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `ciudad` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `comuna` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `region` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `ext_logo` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_empresa`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla ocrend.empresa: 1 rows
DELETE FROM `empresa`;
/*!40000 ALTER TABLE `empresa` DISABLE KEYS */;
INSERT INTO `empresa` (`id_empresa`, `nombre`, `telefono`, `email`, `impuesto`, `tipo_moneda`, `direccion`, `ciudad`, `comuna`, `region`, `ext_logo`) VALUES
	(1, 'WYS LTDA', '+56 9', 'contacto@wys.cl', 19, '$', 'Por Ahi', 'Santiago', 'Santiago', 'Metropolitana', 'jpg');
/*!40000 ALTER TABLE `empresa` ENABLE KEYS */;

-- Volcando estructura para tabla ocrend.tblmenu
CREATE TABLE IF NOT EXISTS `tblmenu` (
  `id_menu` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `PosI` int(10) unsigned NOT NULL,
  `descripcion` varchar(45) CHARACTER SET latin1 NOT NULL,
  `glyphicon` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`id_menu`)
) ENGINE=MyISAM AUTO_INCREMENT=100 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla ocrend.tblmenu: 7 rows
DELETE FROM `tblmenu`;
/*!40000 ALTER TABLE `tblmenu` DISABLE KEYS */;
INSERT INTO `tblmenu` (`id_menu`, `PosI`, `descripcion`, `glyphicon`) VALUES
	(1, 1, 'PLATAFORMA', 'fa-headphones'),
	(99, 99, 'ADMINISTRACIÓN', 'fa-user'),
	(2, 2, 'RR HH', 'fa-users'),
	(4, 4, 'OPERACIONES', 'fa-tachometer'),
	(3, 3, 'REDES', 'fa-sitemap'),
	(5, 5, 'PREVENCION', 'fa-fire-extinguisher'),
	(6, 6, 'TEST', 'fa-tachometer');
/*!40000 ALTER TABLE `tblmenu` ENABLE KEYS */;

-- Volcando estructura para tabla ocrend.tblperfiles
CREATE TABLE IF NOT EXISTS `tblperfiles` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(35) CHARACTER SET latin1 NOT NULL,
  `id_menu` int(10) NOT NULL DEFAULT '0',
  `id_submenu` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=80 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla ocrend.tblperfiles: 6 rows
DELETE FROM `tblperfiles`;
/*!40000 ALTER TABLE `tblperfiles` DISABLE KEYS */;
INSERT INTO `tblperfiles` (`id`, `nombre`, `id_menu`, `id_submenu`) VALUES
	(78, 'HD_SUPERVISOR', 5, 1),
	(77, 'HD_SUPERVISOR', 4, 1),
	(79, 'HD_USUARIO', 1, 1),
	(76, 'HD_SUPERVISOR', 3, 1),
	(75, 'HD_SUPERVISOR', 2, 1),
	(74, 'HD_SUPERVISOR', 1, 1);
/*!40000 ALTER TABLE `tblperfiles` ENABLE KEYS */;

-- Volcando estructura para tabla ocrend.tblperfilesuser
CREATE TABLE IF NOT EXISTS `tblperfilesuser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` varchar(50) CHARACTER SET latin1 NOT NULL,
  `id_menu` int(10) unsigned NOT NULL,
  `id_submenu` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_user`,`id_menu`,`id_submenu`,`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla ocrend.tblperfilesuser: 17 rows
DELETE FROM `tblperfilesuser`;
/*!40000 ALTER TABLE `tblperfilesuser` DISABLE KEYS */;
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
/*!40000 ALTER TABLE `tblperfilesuser` ENABLE KEYS */;

-- Volcando estructura para tabla ocrend.tblsubmenu
CREATE TABLE IF NOT EXISTS `tblsubmenu` (
  `id_menu` int(10) unsigned NOT NULL,
  `id_submenu` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `PosS` int(10) unsigned NOT NULL,
  `url` varchar(100) CHARACTER SET latin1 NOT NULL,
  `descripcion` varchar(45) CHARACTER SET latin1 NOT NULL,
  `estado` smallint(5) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_menu`,`id_submenu`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla ocrend.tblsubmenu: 9 rows
DELETE FROM `tblsubmenu`;
/*!40000 ALTER TABLE `tblsubmenu` DISABLE KEYS */;
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
/*!40000 ALTER TABLE `tblsubmenu` ENABLE KEYS */;

-- Volcando estructura para tabla ocrend.users
CREATE TABLE IF NOT EXISTS `users` (
  `id_user` int(11) unsigned NOT NULL AUTO_INCREMENT,
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
  `pagina_inicio` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `online_fecha` int(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_user`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla ocrend.users: 13 rows
DELETE FROM `users`;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id_user`, `name`, `email`, `fono`, `cargo`, `pass`, `tmp_pass`, `token`, `perfil`, `rol`, `estado`, `foto`, `name_foto`, `pagina_inicio`, `online_fecha`) VALUES
	(1, 'ADMINISTRADOR DE SISTEMA', 'admin@wys.cl', '+56 555CORRIENTEE', 'ADMINISTRADOR SISTEMA', '$2a$10$9af81aa5eb4b6c474ce28OszU/gzJ0m228cqmbBHK5YOb6lh1LVLC', '', '', 'DEFINIDO', 1, 1, 1, '1.jpg', 'administracion', 1507841544),
	(2, 'JORGE JARA', 'jjara@wys.cl', '+56988397298', 'Supervisor HD', '$2a$10$9b8f2f7c1796ce2a5654fe1In1xssSqlDMnp9hNnQEvJ94OFFpO7.', '', '', 'HD_SUPERVISOR', 0, 1, 1, '2.jpg', 'plataforma', 0),
	(3, 'PRUEBA DE EÃ‘E Y ÃCÃ‰NTÃ“Ã“Ã“Ã“Ã“Ã“Ã“', 'prueba@wys.cl', '111111111', 'otro', '$2a$10$687c1d9982b3f6742eb71u.p.anfVdE3biHUIMf3wADqg7dl9.ZRi', '', '', 'HD_USUARIO', 0, 1, 1, '3.jpg', 'portal', 0),
	(4, 'OTRO1', 'otro@wys.cl', '1', '1', '$2a$10$56623cd296fe02cf71a27uYr0W1bu/jPI8SWLdrx1RHm1Mj1h4dyC', '', '', 'DEFINIDO', 0, 1, 0, '', 'portal', 0),
	(5, 'OTRO2', 'otro2@otro.cl', '1', '1', '$2a$10$c9430121755f8051615c7eTGbhbxhOCHtx/qbP7d2oAGmBsz2Kznq', '', '', 'DEFINIDO', 0, 1, 0, '', 'portal', 0),
	(6, 'otro3', 'otro3@otro.cl', '', '', '$2a$10$adb8bf12568c963c73c19u1K0nJclJg5MqnI1mtgEajTMwulfcclK', '', '', 'DEFINIDO', 0, 1, 0, '', '', 0),
	(7, 'otro4', 'otro4@otro.cl', '', '', '$2a$10$8b74198346f00bd964ec7O2.Wh5yYtiNrW8fFq2D.aWZmeaMPhaXO', '', '', 'DEFINIDO', 0, 1, 0, '', '', 0),
	(8, 'otro5', 'otro5@otro.cl', '', '', '$2a$10$d29ae9464f94d617c16b4uIvhqUPzkazsTwVuN9NEKsIgpCcyddl6', '', '', 'DEFINIDO', 0, 1, 0, '', '', 0),
	(9, 'otro6', 'otro6@otro.cl', '', '', '$2a$10$ec73a76206c8c0f4ca1faOEiMkqF5njOePKvLAOFbQRhngaTDqitG', '', '', 'DEFINIDO', 0, 1, 0, '', '', 0),
	(10, 'otro7', 'otro7@otro.cl', '', '', '$2a$10$ec39d6636a77381369a5cu/iurTkQfcsNbaZdpOsIx8et9njmq1AW', '', '', 'DEFINIDO', 0, 1, 0, '', '', 0),
	(11, 'otro8', 'otro8@otro.cl', '', '', '$2a$10$8343232abeed6565252baugen86eC3CIfPGUtT5dHxy.HK4koA352', '', '', 'DEFINIDO', 0, 1, 0, '', '', 0),
	(12, 'OTRO9', 'otro9@otro.cl', '0', 'EJEcutivo hd', '$2a$10$4b9062b407ce44806a040uOzdDuBK4WL5wY0nSDN8.nI6Ldw5vRaC', '', '', 'DEFINIDO', 1, 1, 0, '', 'portal', 0),
	(13, 'otro10', 'otro10@otro.cl', '1', 'otro', '$2a$10$414bc350596fcd9f33070ur9KJF0jXc4rI5XeXE00j8n2vQhp.d/i', '', '', 'DEFINIDO', 0, 1, 0, '', 'portal', 0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
