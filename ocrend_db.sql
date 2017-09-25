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
  `name` varchar(100) CHARACTER SET latin1 NOT NULL,
  `email` varchar(150) CHARACTER SET latin1 NOT NULL,
  `pass` varchar(90) CHARACTER SET latin1 NOT NULL,
  `tmp_pass` varchar(90) CHARACTER SET latin1 NOT NULL,
  `token` varchar(90) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla ocrend.users: ~0 rows (aproximadamente)
DELETE FROM `users`;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id_user`, `name`, `email`, `pass`, `tmp_pass`, `token`) VALUES
	(1, 'administrador', 'admin@nielsen.cl', '1234', '', '');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
