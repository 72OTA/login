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

-- Volcando estructura para tabla ocrend.tblmenu
CREATE TABLE IF NOT EXISTS `tblmenu` (
  `id_menu` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `PosI` int(10) unsigned NOT NULL,
  `descripcion` varchar(45) CHARACTER SET latin1 NOT NULL,
  `glyphicon` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`id_menu`)
) ENGINE=MyISAM AUTO_INCREMENT=100 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla ocrend.tblmenu: 6 rows
DELETE FROM `tblmenu`;
/*!40000 ALTER TABLE `tblmenu` DISABLE KEYS */;
INSERT INTO `tblmenu` (`id_menu`, `PosI`, `descripcion`, `glyphicon`) VALUES
	(1, 1, 'PLATAFORMA', 'fa-headphones'),
	(99, 99, 'ADMINISTRACIÓN', 'fa-user'),
	(2, 2, 'RR HH', 'fa-users'),
	(4, 4, 'OPERACIONES', 'fa-tachometer'),
	(3, 3, 'REDES', 'fa-sitemap'),
	(5, 5, 'PREVENCION', 'fa-fire-extinguisher');
/*!40000 ALTER TABLE `tblmenu` ENABLE KEYS */;

-- Volcando estructura para tabla ocrend.tblperfiles
CREATE TABLE IF NOT EXISTS `tblperfiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(35) NOT NULL,
  `Idopcion` int(10) NOT NULL DEFAULT '0',
  `idSubmenu` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla ocrend.tblperfiles: 2 rows
DELETE FROM `tblperfiles`;
/*!40000 ALTER TABLE `tblperfiles` DISABLE KEYS */;
INSERT INTO `tblperfiles` (`id`, `nombre`, `Idopcion`, `idSubmenu`) VALUES
	(1, 'HD_USUARIO', 0, 0),
	(2, 'HD_SUPERVISOR', 0, 0);
/*!40000 ALTER TABLE `tblperfiles` ENABLE KEYS */;

-- Volcando estructura para tabla ocrend.tblperfilesuser
CREATE TABLE IF NOT EXISTS `tblperfilesuser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` varchar(50) NOT NULL,
  `id_menu` int(10) unsigned NOT NULL,
  `id_submenu` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_user`,`id_menu`,`id_submenu`,`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla ocrend.tblperfilesuser: 3 rows
DELETE FROM `tblperfilesuser`;
/*!40000 ALTER TABLE `tblperfilesuser` DISABLE KEYS */;
INSERT INTO `tblperfilesuser` (`id`, `id_user`, `id_menu`, `id_submenu`) VALUES
	(1, '2', 1, 1),
	(1, '2', 2, 1),
	(1, '2', 99, 1);
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

-- Volcando datos para la tabla ocrend.tblsubmenu: 7 rows
DELETE FROM `tblsubmenu`;
/*!40000 ALTER TABLE `tblsubmenu` DISABLE KEYS */;
INSERT INTO `tblsubmenu` (`id_menu`, `id_submenu`, `PosS`, `url`, `descripcion`, `estado`) VALUES
	(99, 1, 1, 'administracion/usuario', 'Usuarios', 1),
	(99, 2, 2, 'administracion/perfiles', 'Perfiles', 1),
	(2, 1, 1, 'rrhh', 'Principal', 1),
	(1, 1, 1, 'plataforma', 'Principal', 1),
	(3, 1, 1, 'redes', 'Principal', 1),
	(5, 1, 1, 'prevencion', 'Principal', 1),
	(4, 1, 1, 'operaciones', 'Principal', 1);
/*!40000 ALTER TABLE `tblsubmenu` ENABLE KEYS */;

-- Volcando estructura para tabla ocrend.users
CREATE TABLE IF NOT EXISTS `users` (
  `id_user` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `fono` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `pass` varchar(90) COLLATE utf8_unicode_ci NOT NULL,
  `tmp_pass` varchar(90) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(90) COLLATE utf8_unicode_ci NOT NULL,
  `perfil` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `rol` smallint(1) NOT NULL DEFAULT '0',
  `estado` smallint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_user`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla ocrend.users: 11 rows
DELETE FROM `users`;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id_user`, `name`, `email`, `fono`, `pass`, `tmp_pass`, `token`, `perfil`, `rol`, `estado`) VALUES
	(1, 'ADMINISTRADOR', 'admin@wys.cl', '', '$2a$10$9af81aa5eb4b6c474ce28OszU/gzJ0m228cqmbBHK5YOb6lh1LVLC', '', '', 'Otro', 1, 1),
	(2, 'JORGE JARA', 'jjara@wys.cl', '+56988397298', '$2a$10$3b198d8b0da6b083e0d0auWungoG1b9KOuT2eiFpKHMj0PYWzNYuO', '', '', 'HD_SUPERVISOR', 0, 1),
	(3, 'PRUEBA DE EÃ‘E Y ÃCÃ‰NTÃ“Ã“Ã“Ã“Ã“Ã“Ã“', 'prueba@wys.cl', '', '$2a$10$ce1ffa84ee47d5f842d91ucxi453kTyce0HK3.IVixZ3TwWWHXUBi', '', '', 'HD_USUARIO', 0, 1),
	(4, 'OTRO1', 'otro@wys.cl', '', '$2a$10$56623cd296fe02cf71a27uYr0W1bu/jPI8SWLdrx1RHm1Mj1h4dyC', '', '', 'HD_USUARIO', 0, 1),
	(5, 'otro2', 'otro2@otro.cl', '', '$2a$10$c9430121755f8051615c7eTGbhbxhOCHtx/qbP7d2oAGmBsz2Kznq', '', '', 'HD_USUARIO', 0, 1),
	(6, 'otro3', 'otro3@otro.cl', '', '$2a$10$adb8bf12568c963c73c19u1K0nJclJg5MqnI1mtgEajTMwulfcclK', '', '', 'HD_USUARIO', 0, 1),
	(7, 'otro4', 'otro4@otro.cl', '', '$2a$10$8b74198346f00bd964ec7O2.Wh5yYtiNrW8fFq2D.aWZmeaMPhaXO', '', '', 'HD_USUARIO', 0, 1),
	(8, 'otro5', 'otro5@otro.cl', '', '$2a$10$d29ae9464f94d617c16b4uIvhqUPzkazsTwVuN9NEKsIgpCcyddl6', '', '', 'HD_USUARIO', 0, 1),
	(9, 'otro6', 'otro6@otro.cl', '', '$2a$10$ec73a76206c8c0f4ca1faOEiMkqF5njOePKvLAOFbQRhngaTDqitG', '', '', 'HD_USUARIO', 0, 1),
	(10, 'otro7', 'otro7@otro.cl', '', '$2a$10$ec39d6636a77381369a5cu/iurTkQfcsNbaZdpOsIx8et9njmq1AW', '', '', 'HD_USUARIO', 0, 1),
	(11, 'otro8', 'otro8@otro.cl', '', '$2a$10$8343232abeed6565252baugen86eC3CIfPGUtT5dHxy.HK4koA352', '', '', 'HD_USUARIO', 0, 1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
