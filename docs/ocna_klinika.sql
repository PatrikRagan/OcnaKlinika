-- phpMyAdmin SQL Dump
-- version 3.4.5
-- http://www.phpmyadmin.net
--
-- Hostiteľ: localhost
-- Vygenerované:: 24.Apr, 2013 - 12:01
-- Verzia serveru: 5.5.16
-- Verzia PHP: 5.3.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Databáza: `ocna_klinika`
--

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `bydlisko`
--

CREATE TABLE IF NOT EXISTS `bydlisko` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ulica` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `cislo` tinyint(4) NOT NULL,
  `mesto` varchar(30) COLLATE utf8_bin NOT NULL,
  `psc` varchar(5) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=2 ;

--
-- Sťahujem dáta pre tabuľku `bydlisko`
--

INSERT INTO `bydlisko` (`id`, `ulica`, `cislo`, `mesto`, `psc`) VALUES
(1, 'Letná', 9, 'Košice', '04001');

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `cakacia_listina`
--

CREATE TABLE IF NOT EXISTS `cakacia_listina` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_miestnost` int(10) unsigned NOT NULL,
  `id_zaznam_cakacka` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=2 ;

--
-- Sťahujem dáta pre tabuľku `cakacia_listina`
--

INSERT INTO `cakacia_listina` (`id`, `id_miestnost`, `id_zaznam_cakacka`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `ekarta`
--

CREATE TABLE IF NOT EXISTS `ekarta` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_pacient` int(10) unsigned NOT NULL,
  `id_zaznam` int(10) unsigned NOT NULL,
  `id_zamestnanec` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=2 ;

--
-- Sťahujem dáta pre tabuľku `ekarta`
--

INSERT INTO `ekarta` (`id`, `id_pacient`, `id_zaznam`, `id_zamestnanec`) VALUES
(1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `miestnost`
--

CREATE TABLE IF NOT EXISTS `miestnost` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nazov` varchar(30) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=2 ;

--
-- Sťahujem dáta pre tabuľku `miestnost`
--

INSERT INTO `miestnost` (`id`, `nazov`) VALUES
(1, 'Operacka');

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `pacient`
--

CREATE TABLE IF NOT EXISTS `pacient` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `meno` varchar(30) CHARACTER SET latin1 NOT NULL,
  `priezvisko` varchar(50) CHARACTER SET latin1 NOT NULL,
  `rc` varchar(10) CHARACTER SET latin1 NOT NULL,
  `kontakt` varchar(200) CHARACTER SET latin1 NOT NULL,
  `poistovna_id` int(10) unsigned NOT NULL,
  `bydlisko_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=2 ;

--
-- Sťahujem dáta pre tabuľku `pacient`
--

INSERT INTO `pacient` (`id`, `meno`, `priezvisko`, `rc`, `kontakt`, `poistovna_id`, `bydlisko_id`) VALUES
(1, 'Janko', 'Hraško', '9010159065', '0901123123', 1, 1);

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `poistovna`
--

CREATE TABLE IF NOT EXISTS `poistovna` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nazov` varchar(30) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=2 ;

--
-- Sťahujem dáta pre tabuľku `poistovna`
--

INSERT INTO `poistovna` (`id`, `nazov`) VALUES
(1, 'Vseobecna');

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `zakrok`
--

CREATE TABLE IF NOT EXISTS `zakrok` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nazov` varchar(30) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=2 ;

--
-- Sťahujem dáta pre tabuľku `zakrok`
--

INSERT INTO `zakrok` (`id`, `nazov`) VALUES
(1, 'Transplantácia očnej rohovky');

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `zamestnanec`
--

CREATE TABLE IF NOT EXISTS `zamestnanec` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `meno` varchar(30) COLLATE utf8_bin NOT NULL,
  `priezvisko` varchar(50) COLLATE utf8_bin NOT NULL,
  `typ` enum('lekar','sestra','sanitar') COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=2 ;

--
-- Sťahujem dáta pre tabuľku `zamestnanec`
--

INSERT INTO `zamestnanec` (`id`, `meno`, `priezvisko`, `typ`) VALUES
(1, 'Ferko', 'Mrkva', 'lekar');

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `zaznam_cakacka`
--

CREATE TABLE IF NOT EXISTS `zaznam_cakacka` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `datetime` datetime NOT NULL,
  `poznamka` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `id_pacient` int(10) unsigned NOT NULL,
  `id_zakrok` int(10) unsigned NOT NULL,
  `id_autor` int(10) unsigned NOT NULL,
  `id_vykonal` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=2 ;

--
-- Sťahujem dáta pre tabuľku `zaznam_cakacka`
--

INSERT INTO `zaznam_cakacka` (`id`, `datetime`, `poznamka`, `id_pacient`, `id_zakrok`, `id_autor`, `id_vykonal`) VALUES
(1, '2013-04-25 15:14:13', 'Doniesť skalpel', 1, 1, 1, NULL);

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `zaznam_pobyt`
--

CREATE TABLE IF NOT EXISTS `zaznam_pobyt` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `datetime` datetime NOT NULL,
  `id_zamestnanec` int(10) unsigned NOT NULL,
  `id_miestnost` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=2 ;

--
-- Sťahujem dáta pre tabuľku `zaznam_pobyt`
--

INSERT INTO `zaznam_pobyt` (`id`, `datetime`, `id_zamestnanec`, `id_miestnost`) VALUES
(1, '2013-04-24 12:13:14', 1, 1);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
