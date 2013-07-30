-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Erstellungszeit: 30. Jul 2013 um 13:19
-- Server Version: 5.1.66-0+squeeze1
-- PHP-Version: 5.2.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Datenbank: `xa6137_db14`
--
CREATE DATABASE IF NOT EXISTS `xa6137_db14` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `xa6137_db14`;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `demos`
--

CREATE TABLE IF NOT EXISTS `demos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `events_id` int(11) NOT NULL,
  `release_date` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`,`events_id`),
  KEY `fk_demos_events1_idx` (`events_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=27 ;

--
-- Daten für Tabelle `demos`
--

INSERT INTO `demos` (`id`, `name`, `events_id`, `release_date`) VALUES
(1, 'tom/jones', 4, '2007'),
(3, 'liquid candy', 16, '2012'),
(4, 'iso', 6, '2011'),
(5, 'doctor', 4, '2008'),
(6, 'reunaviiva - the outline''09 invitation', 7, '2009'),
(7, 'stella lives!', 8, '2012'),
(8, 'sphaera stellarum', 6, '2011'),
(9, 'lasertime', 11, '2007'),
(10, 'sound coder', 12, '2012'),
(11, 'saigon', 10, '2010'),
(12, 'minute and a bit', 6, '2011'),
(13, 'tricade', 3, '2007'),
(14, '2600', 14, '2004'),
(15, 'hectobyte', 15, '2012'),
(17, 'drip.bin', 16, '2012'),
(19, 'triptych (preview) ', 18, '2009'),
(20, 'sicktro', 19, '2013'),
(21, 'sillyventure 2k12 invitro 	', 16, '2012'),
(22, 'sv2k11 invitro 	', 6, '2011'),
(23, 'xsqueeker 	', 6, '2011'),
(24, 'sillyfiller', 10, '2010'),
(25, 'self portrait', 8, '2012'),
(26, 'skjutpung 	', 8, '2012');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `demos_has_effects`
--

CREATE TABLE IF NOT EXISTS `demos_has_effects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `effect_ids` varchar(255) NOT NULL,
  `demo_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `timespace` varchar(255) NOT NULL,
  `screenshot` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=268 ;

--
-- Daten für Tabelle `demos_has_effects`
--

INSERT INTO `demos_has_effects` (`id`, `effect_ids`, `demo_id`, `description`, `timespace`, `screenshot`) VALUES
(1, '', 17, 'Farbverlauf weiß/grau, Stillstand der Ornamente', '00:00 - 00:04', '1.png'),
(2, '34', 17, 'Ornamente downscrolling (langsam)', '00:04 - 00:14', '2.png'),
(3, '34', 17, 'Ornamente downscolling (zunehmende Geschwindigkeit', '00:14 - 00:49', '3.png'),
(4, '30', 17, '"Rotorblatteffekt" tritt ein durch hohe Geschwindigkeit', '00:49', '4.jpg'),
(5, '34', 17, 'Scrolling scheint sich umzukehren (upscrolling)', '00:50', '5.jpg'),
(6, '34', 17, 'Ornamente upscrolling (zunehmende Geschwindigkeit)', '00:50 - 01:08', '6.jpg'),
(7, '', 17, 'Ornamente o?ffenen und schließen sich zusa?tzlich (PacMan)', '01:09 - 01:22', '7.jpg'),
(8, '34', 17, 'Ornamente downscrolling (zunehmende Geschwindigkeit)', '01:30', '8.png'),
(9, '34', 17, 'Ornamente upscrolling (langsam + PacMan)', '01:57', '9.jpg'),
(10, '34', 17, 'Ornamente upscrolling (langsam)', '02:07', '10.jpg'),
(11, '', 17, 'Stillstand der Ornamente, Farben blinken nach Reihenfolge', '02:11', '11.jpg'),
(12, '34', 17, 'Variation der Ornamente + Downscrolling langsam', '02:21', '12.png'),
(13, '34', 17, 'Variation der Ornamente + Downscrolling langsam', '02:28', '13.jpg'),
(14, '34', 17, 'Ornamente downscrolling (zunehmende Geschwindigkeit)', '02:35', '14.png'),
(15, '30', 17, '"Rotorblatteffekt" tritt ein durch hohe Geschwindigkeit', '02:48', '15.png'),
(16, '34', 17, 'Variation der Ornamente + Upscrolling', '02:51', '16.jpg'),
(17, '', 17, 'Stillstand der Oranmente, Farbblinken + PacMan', '03:21', '17.png'),
(18, '', 17, 'Stillstand der Oranmente, Farbblinken + "breiteres" PacMan', '03:26', '18.jpg'),
(19, '34', 17, 'Ornamente downscrolling + PacMan (zunehmende Geschwindigkeit)', '03:31', '19.jpg'),
(20, '34', 17, 'Variation der Ornamente + Downscrolling', '03:55', '20.png'),
(21, '34', 17, 'Variation der Ornamente + Upscrolling', '03:58', '21.jpg'),
(22, '34', 17, 'Variation der Ornamente + Upscrolling + Pacman', '04:07', '22.jpg'),
(23, '34', 17, 'Variation der Ornamente (Pfeile + Balken) + Upscrolling', '04:10', '23.jpg'),
(24, '34', 17, 'Variation der Ornamente (auseinanderlaufende Pfeile + Balken) + Upscrolling', '04:15', '24.png'),
(25, '34', 17, 'Variation der Ornamente (roll + loop) + Upscrolling', '04:20', '25.png'),
(26, '', 17, 'Stillstand der Ornamente, Farben blinken nach Reihenfolge', '04:28', '26.png'),
(27, '', 17, 'Stillstand + Wechsel Ornamente, Farben blinken nach Reihenfolge', '04:35', '27.png'),
(28, '', 8, 'Text', '0:00 – 0:06', '1.jpg'),
(29, '', 8, 'Plasma, Sinus', '0:06 – 0:22', '2.jpg'),
(30, '10', 8, 'Fade', '0:22 – 0:24', '3.jpg'),
(31, '', 8, 'Text', '0:25 – 0:30', '4.png'),
(32, '10', 8, 'Fading Bars', '0:30 – 0:32', '5.png'),
(33, '37,61', 8, 'Writer, Sinus', '0:33 – 0:56', '6.jpg'),
(34, '10', 8, 'Fading Bars', '0:56 – 0:57', '7.png'),
(35, '', 8, 'Text', '0:58 – 1:02', '8.png'),
(36, '41,22', 8, 'Dot Vector, Plasma Sphere', '1:03 – 1:21', '9.png'),
(37, '', 8, 'Text', '1:22 – 1:29', '10.png'),
(38, '38', 7, 'Sprites /blinking', '0:00 – 0:14', '1.png'),
(39, '34', 7, 'text-scrolling', '0:15 – 0:27', '2.jpg'),
(40, '25', 7, 'Raster (rolling)', '0:28 – 0:42', '3.jpg'),
(41, '34', 7, 'text-scrolling', '00:43 – 0:52', '4.jpg'),
(42, '5', 7, 'Colorbars (simple)', '0:53 – 0:59', '5.png'),
(43, '34', 7, 'text-scrolling', '1:00 – 1:06', '6.jpg'),
(44, '5', 7, 'Colorbars (2-dimensional moving)', '01:07 – 1:11', '7.jpg'),
(45, '34', 7, 'text-scrolling', '1:12 – 1:13', '8.jpg'),
(46, '5', 7, 'Colorbars (2-dimensional moving)', '1:14 – 1:20', '9.jpg'),
(47, '34', 7, 'text-scrolling', '1:21 – 1:23', '10.jpg'),
(48, '12', 7, 'Fire', '1:24 – 1:28', '11.jpg'),
(49, '34', 7, 'text-scrolling', '1:29 – 1:31', '12.jpg'),
(50, '12', 7, 'Fire', '1:32 – 1:37', '13.jpg'),
(51, '34', 7, 'text-scrolling', '1:38 – 1:40', '14.jpg'),
(52, '', 7, 'Color-scheme', '1:40 – 1:41', '15.jpg'),
(53, '34', 7, 'text-scrolling', '1:41 – 1:57', '16.jpg'),
(54, '38', 7, 'Sprites (blinking)', '1:58 – 1:59', '17.png'),
(55, '5', 7, 'Colorbars (2-dimensional moving)', '1:59 – 2:01', '18.jpg'),
(56, '25', 7, 'Raster (rolling)', '2:01 – 2:02', '19.jpg'),
(57, '5', 7, 'Colorbars', '2:02 – 2:04', '20.png'),
(58, '12', 7, 'Fire', '2:04 – 2:05', '21.jpg'),
(59, '5', 7, 'Colorbars (2-dimensional moving)', '2:06 – 2:08', '22.jpg'),
(60, '25', 7, 'Raster (rolling)', '2:08 – 2:10', '23.jpg'),
(61, '5', 7, 'Colorbars', '2:10 – 2:11', '24.png'),
(62, '12', 7, 'Fire', '2:11 – 2:13', '25.jpg'),
(63, '10,25', 7, 'Raster (rolling) / Fading', '2:13 – 2:26', '26.jpg'),
(64, '2, 10', 11, '2D Animation + Fade-Out', '00:01', ''),
(65, '27, 10', 11, 'Rasterbars, Fade', '00:03', ''),
(66, '34', 11, 'Text Scroller', '00:34', ''),
(67, '2', 11, '2D Animation', '00:46', ''),
(68, '30, 10', 11, 'Rotozoomer, Color Fade', '00:55', ''),
(69, '27', 11, 'Rasterbars', '01:02', ''),
(70, '', 11, 'Retroplasma', '01:09', ''),
(71, '2', 11, '2D Animation', '01:19', ''),
(72, '34, 27, 2, 10', 11, 'Text Scroller, Rasterbars, 2D-Animation + Fade-Out', '01:22', ''),
(73, '36, 10', 11, 'Sine-Flag, Fade', '01:40', ''),
(74, '27, 10', 11, 'Rasterbars, Fade', '01:51', ''),
(75, '2, 10', 13, '2 Color Image + Fade-Out', '00:01', ''),
(76, '10', 13, 'Text, Rasterbars + Fade-In + Fade-Out', '00:10', ''),
(77, '3, 10', 13, '3D-Wave, Color-Fade', '00:15', ''),
(78, '', 13, 'Particle-Twister, Color-Fade', '00:23', ''),
(79, '', 13, 'Mutiple 2D Object Morph, Color-Fade', '00:28', ''),
(80, '', 13, 'Particle-Twister, Color-Fade', '00:44', ''),
(81, '27', 13, 'Rasterbars, Wave-Text-Scroller', '00:55', ''),
(82, '27, 10', 13, 'Text, Rasterbars + Fade-In + Fade-Out', '01:00', ''),
(83, '', 13, 'Texture-Morph', '01:06', ''),
(84, '2', 13, '2D-Animation', '01:12', ''),
(85, '11', 13, 'Cross-Fade', '01:17', ''),
(86, '27', 13, 'Rasterbars, Wave-Text-Scroller', '01:20', ''),
(87, '27, 10', 13, 'Text, Rasterbars + Fade-In + Fade-Out', '01:28', ''),
(88, '', 13, 'Particle-Twister, Color-Fade', '01:33', ''),
(89, '27, 2', 13, 'Rasterbars, 2D-Animation', '01:48', ''),
(90, '37, 34', 13, 'Sine-Flag, Text-Scroller + Color-Fade', '01:52', ''),
(91, '34, 10', 13, 'Texture-Morph, Text-Scroller + Color-Fade', '02:00', ''),
(92, '37, 34', 13, 'Sine-Flag, Text-Scroller + Color-Fade', '02:08', ''),
(93, '34, 10', 13, 'Texture-Morph, Text-Scroller + Color-Fade', '02:17', ''),
(94, '36, 34, 10', 13, 'Sine-Flag, Text-Scroller + Color-Fade', '02:23', ''),
(95, '34', 13, 'Texture-Morph, Text-Scroller + Color-Fade', '02:30', ''),
(96, '27', 13, 'Text, Rasterbars + Fade-In + Fade-Out', '02:37', ''),
(97, '10, 34', 13, '2 Color Image + Fade-In + Fade-Out, Text-Scroller + Color-Fade', '02:53', ''),
(98, '27, 10', 13, 'Text, Rasterbars + Fade-In + Fade-Out', '03:24', ''),
(99, '11', 6, 'cross fade', '00:04', ''),
(100, '', 6, 'text gravity bounce', '00:06', ''),
(101, '', 6, 'backround color fade', '00:06', ''),
(102, '5', 6, 'color bar', '00:06', ''),
(103, '38', 6, 'sprite', '00:06', ''),
(104, '', 6, 'line animation', '00:17', ''),
(105, '62', 6, 'zoom in', '00:17', ''),
(106, '', 6, 'text scroll', '00:20', ''),
(107, '35', 6, 'short shadebob', '00:20', ''),
(108, '', 6, 'shadow', '00:20', ''),
(109, '2', 6, '2D bounce', '00:20', ''),
(110, '', 6, 'line animation', '00:27', ''),
(111, '', 6, 'wipe', '00:31', ''),
(112, '', 6, 'plasma', '00:31', ''),
(113, '', 6, 'wipe', '00:36', ''),
(114, '34', 6, 'text scroll', '00:39', ''),
(115, '35', 6, 'short shadebob', '00:39', ''),
(116, '', 6, 'shadow', '00:39', ''),
(117, '2', 6, '2D bounce', '00:39', ''),
(118, '', 6, 'teleport', '00:47', ''),
(119, '', 6, 'outline', '00:47', ''),
(120, '', 6, 'line animation', '00:55', ''),
(121, '62', 6, 'zoom in', '00:55', ''),
(122, '34', 6, 'text scroll', '01:06', ''),
(123, '35', 6, 'short shadebob', '01:06', ''),
(124, '', 6, 'shadow', '01:06', ''),
(125, '2', 6, '2D bounce', '01:06', ''),
(126, '', 6, 'line animation', '01:14', ''),
(127, '62', 6, 'zoom out', '01:14', ''),
(128, '', 6, 'wipe', '01:16', ''),
(129, '', 6, 'plasma', '01:16', ''),
(130, '', 6, 'wipe', '01:20', ''),
(131, '', 6, 'line animation', '01:22', ''),
(132, '62', 6, 'zoom in', '01:22', ''),
(133, '34', 6, 'text scroll', '01:24', ''),
(134, '35', 6, 'short shadebob', '01:24', ''),
(135, '', 6, 'shadow', '01:24', ''),
(136, '2', 6, '2D bounce', '01:24', ''),
(137, '', 6, 'teleport', '01:31', ''),
(138, '', 6, 'outline', '01:31', ''),
(139, '', 6, 'line animation', '01:38', ''),
(140, '', 6, 'wipe', '01:40', ''),
(141, '', 6, 'plasma', '01:40', ''),
(142, '', 6, 'wipe', '01:45', ''),
(143, '', 6, 'line animation', '01:47', ''),
(144, '', 6, 'text gravity bounce', '01:49', ''),
(145, '', 6, 'backround color fade', '01:49', ''),
(146, '', 6, 'color bar', '01:49', ''),
(147, '38', 6, 'sprite', '01:49', ''),
(148, '', 6, 'line animation', '02:00', ''),
(149, '62', 6, 'zoom out', '02:00', ''),
(150, '34', 6, 'text scroll', '02:03', ''),
(151, '35', 6, 'short shadebob', '02:03', ''),
(152, '', 6, 'shadow', '02:03', ''),
(153, '2', 6, '2D bounce', '02:03', ''),
(154, '', 6, 'line animation', '02:22', ''),
(155, '62', 6, 'zoom in', '02:22', ''),
(156, '34', 6, 'text scroll', '02:24', ''),
(157, '35', 6, 'short shadebob', '02:24', ''),
(158, '', 6, 'shadow', '02:24', ''),
(159, '2', 6, '2D bounce', '02:24', ''),
(160, '', 6, 'teleport', '02:32', ''),
(161, '', 6, 'outline', '02:32', ''),
(162, '', 6, 'line animation', '02:39', ''),
(163, '10', 6, 'cross fade', '02:41', ''),
(164, '10', 6, 'cross fade', '02:41', ''),
(165, '', 3, 'slide', '00:01', ''),
(166, '', 3, 'textscroll backround', '00:04', ''),
(167, '36', 3, 'sine flag', '00:14', ''),
(168, '22', 3, 'plasma', '00:14', ''),
(169, '36', 3, 'sine flag', '00:20', ''),
(170, '22', 3, 'plasma', '00:20', ''),
(171, '36', 3, 'sine flag', '00:25', ''),
(172, '22', 3, 'plasma', '00:25', ''),
(173, '36', 3, 'sine flag', '00:30', ''),
(174, '22', 3, 'plasma', '00:30', ''),
(175, '', 3, 'slide', '00:36', ''),
(176, '34', 3, 'textscroll background', '00:36', ''),
(177, '', 3, 'cavity inducing twisterbar to chew on', '00:47', ''),
(178, '27', 3, 'rasterbar', '00:48', ''),
(179, '', 3, 'slide', '01:12', ''),
(180, '34', 3, 'text scroll', '01:12', ''),
(181, '27', 3, 'rasterbar', '01:21', ''),
(182, '22', 3, 'plasma', '01:21', ''),
(183, '', 3, 'slide', '01:40', ''),
(184, '34', 3, 'textscroll background', '01:40', ''),
(185, '', 3, 'particle', '01:54', ''),
(186, '30, 3', 3, 'rotate 3D', '01:54', ''),
(187, '34', 3, 'textscroll', '02:07', ''),
(188, '38,16', 15, '2 times Three Lines falling Sprites in two Color Schemes moving to the Screenedges and fusing in the Middle.Cross-formed Interferance moving Upward every Second. Rhythm changing according to Backgrounds.', '00:00 – 01:46', ''),
(189, '', 15, 'Background Color changed to Brown. Old Color Scheme every Second for a short Moment.', '00:13 – 00:18', ''),
(190, '30', 15, 'Addition of a dark blue third Background Color Scheme into 1 Second Rotation.', '00:19 – 00:32', ''),
(191, '', 15, 'Change of Rhythm.', '00:33 – 00:38', ''),
(192, '', 15, 'Change between dark blue and red Background.', '00:39 – 00:44', ''),
(193, '16', 15, 'Dark red and blue Interferance switch in a 1:2 Ratio', '00:45 – 00:51', ''),
(194, '5,7', 15, 'Blue Colorbars added to red Background, Distortion now Blue Background with gray Colorbars. Change in Rhythm.', '00:52 – 00:57', ''),
(195, '7', 15, 'Change of Rhytm. Distortion in Colorbars.', '00:58 – 01:04', ''),
(196, '7', 15, 'Blue Distortion and Black Background switching. Change of Rhythm.', '01:05 – 01:10', ''),
(197, '7', 15, 'Black Background and Blue-Gray Distortion. Change of Rhythm.', '01:11 – 01:17', ''),
(198, '5', 15, 'Blue, Red and Black Backgrounds with Colorbars in fast switch. Change of Rhythm.', '01:18 – 01:23', ''),
(199, '5,3', 15, 'Pink BG with Blue Colorbars added. Now 4 Backgrounds rotating. Change of Rhythm.', '01:24 – 01:30', ''),
(200, '30', 15, 'Change of Rhythm. Black BG left Rotation.', '01:31 – 01:36', ''),
(201, '10', 15, 'Slower Rhythm, Fade out.', '01:37 – 01:46', ''),
(202, '2, 10', 14, 'Intro 2D Text; 6 times fade in', '00:00-00:09', ''),
(203, '34', 14, 'Atari Logo + Text, Colorbar Scroller in Logo', '00:10-00:12', ''),
(204, '34, 37', 14, 'Text with Colorbar Scroller right to left in a sinus curve', '00:13-01:34', ''),
(205, '37, 34', 14, 'Sinus Curve moving up with blue Colorbar Scroller Downwards while pushed right. Reset position after 5 sec.', '00:13-01:34', ''),
(206, '34, 30', 14, 'Checkboard Bouncing up and down with Colorbar Scroller Downwards. Simulated Rotation', '00:13-01:34', ''),
(207, '21, 39', 14, 'Text in Front layered Particles moving right with different velocity. Starfields?', '00:13-01:34', ''),
(208, '', 14, 'Two white Bars', '00:13-01:34', ''),
(209, '38,16', 15, '2 times Three Lines falling Sprites in two Color Schemes moving to the Screenedges and fusing in the Middle.Cross-formed Interferance moving Upward every Second. Rhythm changing according to Backgrounds.', '00:00 – 01:46', ''),
(210, '', 15, 'Background Color changed to Brown. Old Color Scheme every Second for a short Moment.', '00:13 – 00:18', ''),
(211, '30', 15, 'Addition of a dark blue third Background Color Scheme into 1 Second Rotation.', '00:19 – 00:32', ''),
(212, '', 15, 'Change of Rhythm.', '00:33 – 00:38', ''),
(213, '', 15, 'Change between dark blue and red Background.', '00:39 – 00:44', ''),
(214, '16', 15, 'Dark red and blue Interferance switch in a 1:2 Ratio', '00:45 – 00:51', ''),
(215, '5,7', 15, 'Blue Colorbars added to red Background, Distortion now Blue Background with gray Colorbars. Change in Rhythm.', '00:52 – 00:57', ''),
(216, '7', 15, 'Change of Rhytm. Distortion in Colorbars.', '00:58 – 01:04', ''),
(217, '7', 15, 'Blue Distortion and Black Background switching. Change of Rhythm.', '01:05 – 01:10', ''),
(218, '7', 15, 'Black Background and Blue-Gray Distortion. Change of Rhythm.', '01:11 – 01:17', ''),
(219, '5', 15, 'Blue, Red and Black Backgrounds with Colorbars in fast switch. Change of Rhythm.', '01:18 – 01:23', ''),
(220, '5,3', 15, 'Pink BG with Blue Colorbars added. Now 4 Backgrounds rotating. Change of Rhythm.', '01:24 – 01:30', ''),
(221, '30', 15, 'Change of Rhythm. Black BG left Rotation.', '01:31 – 01:36', ''),
(222, '10', 15, 'Slower Rhythm, Fade out.', '01:37 – 01:46', ''),
(223, '2, 10', 14, 'Intro 2D Text; 6 times fade in', '00:00-00:09', ''),
(224, '34', 14, 'Atari Logo + Text, Colorbar Scroller in Logo', '00:10-00:12', ''),
(225, '34, 37', 14, 'Text with Colorbar Scroller right to left in a sinus curve', '00:13-01:34', ''),
(226, '37, 34', 14, 'Sinus Curve moving up with blue Colorbar Scroller Downwards while pushed right. Reset position after 5 sec.', '00:13-01:34', ''),
(227, '34, 30', 14, 'Checkboard Bouncing up and down with Colorbar Scroller Downwards. Simulated Rotation', '00:13-01:34', ''),
(228, '21, 39', 14, 'Text in Front layered Particles moving right with different velocity. Starfields?', '00:13-01:34', ''),
(229, '', 14, 'Two white Bars', '00:13-01:34', ''),
(230, '', 4, 'Atari 1977 border logo', '00:00', 'iso-screen-0000.png'),
(231, '', 4, 'Raster color borders on', '00:02', 'iso-screen-0010.png'),
(232, '25', 4, 'Snake text writer with up to 3 independently fading and moving blocks writing "ISO"', '00:00', 'iso-screen-0020.png'),
(233, '10', 4, 'ISO logo raster colors fading in and flashing', '00:06', 'iso-screen-0030.png'),
(234, '25, 10', 4, 'ISO logo stretching vertically', '00:00', 'iso-screen-0040.png'),
(235, '', 4, 'ISO logo stretching vertically and rising up to the top of the screen', '00:00', 'iso-screen-0050.png'),
(236, '', 4, 'Snake text writer "RIBBON"', '00:15', 'iso-screen-0060.png'),
(237, '', 4, 'Falling text blocks "RIBBON" with up to 3 independent moving and fading blocks', '00:23', 'iso-screen-0070.png'),
(238, '10', 4, 'Two sprite ribbons, horizontal double sinus movement and raster colors, variant 1', '00:31', 'iso-screen-0080.png'),
(239, '38, 37', 4, 'Two sprite ribbons, horizontal double sinus movement and raster colors, flashing away', '00:35', 'iso-screen-0090.png'),
(240, '38, 37, 25', 4, 'Two sprite ribbons, horizontal double sinus movement and raster colors, variant 2', '00:36', 'iso-screen-0100.png'),
(241, '38, 37, 25', 4, 'Two sprite ribbons, horizontal double sinus movement and raster colors, flashing away', '00:40', 'iso-screen-0110.png'),
(242, '38, 37, 25', 4, 'Two sprite ribbons, horizontal double sinus movement and raster colors, variant 3', '00:42', 'iso-screen-0120.png'),
(243, '38, 37, 25', 4, 'Two sprite ribbons, horizontal double sinus movement and raster colors, flashing away', '00:45', 'iso-screen-0130.png'),
(244, '38, 37, 25', 4, 'Snake text writer "PLASMA"', '00:46', 'iso-screen-0140.png'),
(245, '', 4, 'Falling text blocks "PLASMA"', '00:53', 'iso-screen-0150.png'),
(246, '', 4, '128 colors plasma, 20x25 pixel virtual resolution, 250 actual pixels, Variant 1', '01:02', 'iso-screen-0160.png'),
(247, '22', 4, '128 colors plasma, 20x25 pixel virtual resolution, 250 actual pixels, Variant 2', '01:06', 'iso-screen-0170.png'),
(248, '25', 4, '128 colors plasma, 20x25 pixel virtual resolution, 250 actual pixels, Variant 3', '01:11', 'iso-screen-0180.png'),
(249, '25', 4, 'Snake text writer "TWIST"', '01:17', 'iso-screen-0190.png'),
(250, '', 4, 'Falling text blocks "TWIST"', '01:24', 'iso-screen-0200.png'),
(251, '', 4, 'Twister, greyscale, centered', '01:29', 'iso-screen-0210.png'),
(252, '', 4, 'Twister, golden, centered', '01:36', 'iso-screen-0220.png'),
(253, '', 4, 'Twister, blue and red, swinging horizontally', '01:42', 'iso-screen-0230.png'),
(254, '', 4, 'Snake text writer "TWIRL"', '01:48', 'iso-screen-0240.png'),
(255, '', 4, 'Falling text blocks "TWIRL"', '01:55', 'iso-screen-0250.png'),
(256, '', 4, '128 colors wheel twirl, 20x25 pixel virtual resolution, 250 actual pixels, variant 1 (rotating left and right)', '02:03', 'iso-screen-0260.png'),
(257, '30', 4, '1128 colors wheel twirl, 20x25 pixel virtual resolution, 250 actual pixels, variant 2 (zooming in and out)', '02:11', 'iso-screen-0270.png'),
(258, '62', 4, '128 colors wheel twirl, 20x25 pixel virtual resolution, 250 actual pixels, variant 3 (rotating left and right)', '02:19', 'iso-screen-0280.png'),
(259, '30', 4, 'Snake text writer "SCROLL"', '02:26', 'iso-screen-0290.png'),
(260, '', 4, 'Falling text blocks "SCROLL"', '02:33', 'iso-screen-0300.png'),
(261, '', 4, '128 colors scroll "Sillyventure", black letters', '02:38', 'iso-screen-0310.png'),
(262, '', 4, '28 colors scroll "Sillyventure", flat flashing letters', '02:49', 'iso-screen-0320.png'),
(263, '34', 4, '28 colors scroll "Sillyventure", diagonal flashing letters', '02:59', 'iso-screen-0330.png'),
(264, '34', 4, '28 colors scroll "Sillyventure", diagonal flashing letters, Vertical Stretching', '03:10', 'iso-screen-0340.png'),
(265, '34', 4, 'Pause', '03:20', 'iso-screen-0350.png'),
(266, '', 4, 'ISO logo switching off', '03:27', 'iso-screen-0360.png'),
(267, '', 4, 'Raster color borders swichting off', '03:28', 'iso-screen-0370.png');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `demos_has_groups`
--

CREATE TABLE IF NOT EXISTS `demos_has_groups` (
  `demos_id` int(11) NOT NULL,
  `groups_id` int(11) NOT NULL,
  PRIMARY KEY (`demos_id`,`groups_id`),
  KEY `fk_demos_has_groups_groups1_idx` (`groups_id`),
  KEY `fk_demos_has_groups_demos1_idx` (`demos_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `effects`
--

CREATE TABLE IF NOT EXISTS `effects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=64 ;

--
-- Daten für Tabelle `effects`
--

INSERT INTO `effects` (`id`, `name`, `parent_id`) VALUES
(1, '18-bit Color', NULL),
(2, '2D Animation', NULL),
(3, '3D', NULL),
(4, 'Blur', NULL),
(5, 'Colorbars', NULL),
(6, 'Dissolve', NULL),
(7, 'Distortion', NULL),
(8, 'Radial Distortion', 7),
(9, 'Image Distortion', 7),
(10, 'Fade', NULL),
(11, 'Cross-Fade', 10),
(12, 'Fire', NULL),
(13, 'Floor', NULL),
(14, 'Flyby', NULL),
(15, 'Image Morph', NULL),
(16, 'Interference', NULL),
(17, 'Landscape', NULL),
(18, 'Lens Flare', NULL),
(19, 'MandelZoom', NULL),
(20, 'Metaballs', NULL),
(21, 'Particles', NULL),
(22, 'Plasma', NULL),
(23, 'Plasma Cube', NULL),
(24, 'Playfields', NULL),
(25, 'Raster', NULL),
(26, 'Copper', 25),
(27, 'Raster Bars', 25),
(28, 'Raster-Interrupt', 25),
(29, 'Ribbons', NULL),
(30, 'Rotate', NULL),
(31, 'Rotating 3D', 30),
(32, 'Rotating Bitmap', 30),
(33, 'Rubber Cube', NULL),
(34, 'Scroller', NULL),
(35, 'Shadebobs', NULL),
(36, 'Sine Flag', NULL),
(37, 'Sinus', NULL),
(38, 'Sprites', NULL),
(39, 'Starfields', NULL),
(40, 'Tunnel', NULL),
(41, 'Vectors', NULL),
(42, 'Anti-aliased Vectors', 41),
(43, 'Bump-mapped Vectors', 41),
(44, 'Delay Vectors', 41),
(45, 'Dot Vectors', 41),
(46, 'Environment-mapped Vectors', 41),
(47, 'Flat Shaded Vectors', 41),
(48, 'Glenz', 41),
(49, 'Gouraud-Shaded Vectors', 41),
(50, 'Line Vectors', 41),
(51, 'Metal-Shaded Vectors', 41),
(52, 'Phong-Shaded Vectors', 41),
(53, 'Shaded Vectors', 41),
(54, 'Slime Vectors', 41),
(55, 'Texture-Mapped Vectors', 41),
(56, 'Vector Balls', 41),
(57, 'Vector World', 41),
(58, 'Voxels', NULL),
(59, 'Wobblers', NULL),
(60, 'Wormhole', NULL),
(61, 'Writer', NULL),
(62, 'Zoom/Zoomer', NULL),
(63, 'Rotozoomer', 62);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `events`
--

CREATE TABLE IF NOT EXISTS `events` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_name` varchar(45) DEFAULT NULL,
  `event_date` varchar(45) DEFAULT NULL,
  `parties_id` int(11) NOT NULL,
  `country` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `lat` varchar(45) DEFAULT NULL,
  `lng` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`,`parties_id`),
  KEY `fk_events_parties_idx` (`parties_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=20 ;

--
-- Daten für Tabelle `events`
--

INSERT INTO `events` (`id`, `event_name`, `event_date`, `parties_id`, `country`, `city`, `lat`, `lng`) VALUES
(3, 'Assembly', '2007', 4, 'Finnland', 'Helsinki', '60.173324', '24.941025'),
(4, 'The Alternative Party', '2008', 5, 'Finnland', 'Helsinki', '60.173324', '24.941025'),
(6, 'Silly Venture 2k11', '2011', 1, 'Polen', 'Danzig', '54.352025', '18.646638'),
(7, 'Numerica Artparty', '2009', 6, 'Frankreich', 'Montbéliard', '47.510356', '6.798466'),
(8, 'Revision', '2012', 7, 'Deutschland', 'Saarbrücken', '49.240157', '6.996933'),
(10, 'Silly Venture 2k10', '2010', 1, 'Polen', 'Danzig', '54.352025', '18.646638'),
(11, 'Icons 2007', '2007', 8, 'Finnland', 'Helsinki', '60.205438', '24.977193'),
(12, 'Stream 9', '2012', 3, 'Finnland', 'Tampere', '61.498151', '23.761025'),
(13, 'Stream', '2007', 3, 'Finland', 'Tampere', '61.498151', '23.761025'),
(14, 'Buenzli', '2004', 10, 'Schweiz', 'Winterthur', '47.499950', '8.737565'),
(15, 'Outline 2012', '2012', 11, 'Niederlande', 'Eersel', '51.357808', '5.315912'),
(16, 'Silly Venture 2k12', '2012', 1, 'Polen', 'Danzig', '54.352025', '18.646638'),
(18, 'Stream', '2009', 3, 'Finnland', 'Tampere', '61.498151', '23.761025'),
(19, 'Revision', '2013', 7, 'Deutschland', 'Saarbrücken', '49.240157', '6.996933');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `events_has_groups`
--

CREATE TABLE IF NOT EXISTS `events_has_groups` (
  `events_id` int(11) NOT NULL,
  `groups_id` int(11) NOT NULL,
  PRIMARY KEY (`events_id`,`groups_id`),
  KEY `fk_events_has_groups_groups1_idx` (`groups_id`),
  KEY `fk_events_has_groups_events1_idx` (`events_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `groups`
--

CREATE TABLE IF NOT EXISTS `groups` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `parties`
--

CREATE TABLE IF NOT EXISTS `parties` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Daten für Tabelle `parties`
--

INSERT INTO `parties` (`id`, `name`) VALUES
(1, 'Silly Venture'),
(3, 'Stream'),
(4, 'Assembly'),
(5, 'The Alternative Party'),
(6, 'Numerica Artparty'),
(7, 'Revision'),
(8, 'Icons'),
(10, 'Buenzli'),
(11, 'Outline');

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `demos`
--
ALTER TABLE `demos`
  ADD CONSTRAINT `fk_demos_events1` FOREIGN KEY (`events_id`) REFERENCES `events` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints der Tabelle `demos_has_groups`
--
ALTER TABLE `demos_has_groups`
  ADD CONSTRAINT `fk_demos_has_groups_demos1` FOREIGN KEY (`demos_id`) REFERENCES `demos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_demos_has_groups_groups1` FOREIGN KEY (`groups_id`) REFERENCES `groups` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints der Tabelle `events`
--
ALTER TABLE `events`
  ADD CONSTRAINT `fk_events_parties` FOREIGN KEY (`parties_id`) REFERENCES `parties` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints der Tabelle `events_has_groups`
--
ALTER TABLE `events_has_groups`
  ADD CONSTRAINT `fk_events_has_groups_events1` FOREIGN KEY (`events_id`) REFERENCES `events` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_events_has_groups_groups1` FOREIGN KEY (`groups_id`) REFERENCES `groups` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
