﻿-- ---------------------------------------------------------------------------------------
-- This source file is part of SWG:ANH (Star Wars Galaxies - A New Hope - Server Emulator)
--
-- For more information, visit http://www.swganh.com
--
-- Copyright (c) 2006 - 2012 The SWG:ANH Team
-- ---------------------------------------------------------------------------------------
-- This library is free software; you can redistribute it and/or
-- modify it under the terms of the GNU Lesser General Public
-- License as published by the Free Software Foundation; either
-- version 2.1 of the License, or (at your option) any later version.
--
-- This library is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-- Lesser General Public License for more details.
--
-- You should have received a copy of the GNU Lesser General Public
-- License along with this library; if not, write to the Free Software
-- Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
-- ---------------------------------------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

USE swganh_static;

--
-- Table structure for table `starting_items`
--

DROP TABLE IF EXISTS `starting_items`;
CREATE TABLE IF NOT EXISTS `starting_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `req_id` int(11) unsigned NOT NULL DEFAULT '0',
  `family_id` int(11) unsigned NOT NULL,
  `type_id` int(11) unsigned NOT NULL DEFAULT '0',
  `customName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_start_items_req` (`req_id`),
  KEY `fk_start_items_family` (`family_id`),
  KEY `fk_start_items_type` (`type_id`),
  CONSTRAINT `FK_starting_items_requirements` FOREIGN KEY (`req_id`) REFERENCES `starting_item_requirements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_starting_items_object_type_id` FOREIGN KEY (`type_id`) REFERENCES `objects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1033 DEFAULT CHARSET=utf8 ROW_FORMAT=REDUNDANT COMMENT='Starting Items';

--
-- Dumping data for table `starting_items`
--

/*!40000 ALTER TABLE `starting_items` DISABLE KEYS */;
INSERT INTO `starting_items` (`id`, `req_id`, `family_id`, `type_id`, `customName`) VALUES
	(1, 71, 14, 15427, NULL),
	(2, 71, 14, 15364, NULL),
	(3, 71, 14, 15433, NULL),
	(5, 71, 14, 14538, NULL),
	(6, 71, 14, 9342, NULL),
	(7, 71, 14, 10023, ''),
	(8, 61, 14, 15416, NULL),
	(9, 61, 14, 15449, NULL),
	(10, 61, 14, 15436, NULL),
	(11, 61, 14, 14538, NULL),
	(12, 61, 14, 9342, NULL),
	(13, 61, 14, 10023, ''),
	(14, 72, 14, 15427, NULL),
	(15, 72, 14, 15364, NULL),
	(16, 72, 14, 15433, NULL),
	(17, 72, 14, 14538, NULL),
	(18, 72, 14, 9342, NULL),
	(19, 72, 14, 10023, ''),
	(20, 62, 14, 15416, NULL),
	(21, 62, 14, 15449, NULL),
	(22, 62, 14, 15436, NULL),
	(23, 62, 14, 14538, NULL),
	(24, 62, 14, 9342, NULL),
	(25, 62, 14, 10023, ''),
	(26, 73, 14, 15427, NULL),
	(27, 73, 14, 15364, NULL),
	(28, 73, 14, 14538, NULL),
	(29, 73, 14, 9342, NULL),
	(30, 73, 14, 10023, ''),
	(31, 63, 14, 15416, NULL),
	(32, 63, 14, 15449, NULL),
	(33, 63, 14, 14538, NULL),
	(34, 63, 14, 9342, NULL),
	(35, 63, 14, 10023, ''),
	(36, 74, 14, 15427, NULL),
	(37, 74, 14, 15364, NULL),
	(38, 74, 14, 15433, NULL),
	(39, 74, 14, 14538, NULL),
	(40, 74, 14, 9342, NULL),
	(41, 74, 14, 10023, ''),
	(42, 64, 14, 15416, NULL),
	(43, 64, 14, 15449, NULL),
	(44, 64, 14, 15436, NULL),
	(45, 64, 14, 14538, NULL),
	(46, 64, 14, 9342, NULL),
	(47, 64, 14, 10023, ''),
	(48, 75, 14, 14538, NULL),
	(49, 75, 14, 9342, NULL),
	(50, 75, 14, 10023, ''),
	(51, 65, 14, 14538, NULL),
	(52, 65, 14, 9342, NULL),
	(53, 65, 14, 10023, ''),
	(54, 76, 14, 15427, NULL),
	(55, 76, 14, 15364, NULL),
	(56, 76, 14, 15433, NULL),
	(57, 76, 14, 14538, NULL),
	(58, 76, 14, 9342, NULL),
	(59, 76, 14, 10023, ''),
	(60, 66, 14, 15416, NULL),
	(61, 66, 14, 15449, NULL),
	(62, 66, 14, 15436, NULL),
	(63, 66, 14, 14538, NULL),
	(64, 66, 14, 9342, NULL),
	(65, 66, 14, 10023, ''),
	(66, 77, 14, 15427, NULL),
	(67, 77, 14, 15364, NULL),
	(68, 77, 14, 15433, NULL),
	(69, 77, 14, 14538, NULL),
	(70, 77, 14, 9342, NULL),
	(71, 77, 14, 10023, ''),
	(72, 67, 14, 15416, NULL),
	(73, 67, 14, 15449, NULL),
	(74, 67, 14, 15436, NULL),
	(75, 67, 14, 14538, NULL),
	(76, 67, 14, 9342, NULL),
	(77, 67, 14, 10023, ''),
	(78, 78, 14, 15427, NULL),
	(79, 78, 14, 15364, NULL),
	(80, 78, 14, 15433, NULL),
	(81, 78, 14, 14538, NULL),
	(82, 78, 14, 9342, NULL),
	(83, 78, 14, 10023, ''),
	(84, 68, 14, 15416, NULL),
	(85, 68, 14, 15449, NULL),
	(86, 68, 14, 15436, NULL),
	(87, 68, 14, 14538, NULL),
	(88, 68, 14, 9342, NULL),
	(89, 68, 14, 10023, ''),
	(90, 79, 14, 15270, NULL),
	(91, 79, 14, 15259, NULL),
	(92, 79, 14, 15232, NULL),
	(93, 79, 14, 14538, NULL),
	(94, 79, 14, 9342, NULL),
	(95, 79, 14, 10023, ''),
	(96, 69, 14, 15254, NULL),
	(97, 69, 14, 15232, NULL),
	(98, 69, 14, 15270, NULL),
	(99, 69, 14, 14538, NULL),
	(100, 69, 14, 9342, NULL),
	(101, 69, 14, 10023, ''),
	(102, 80, 14, 15427, NULL),
	(103, 80, 14, 15364, NULL),
	(104, 80, 14, 15433, NULL),
	(105, 80, 14, 14538, NULL),
	(106, 80, 14, 9342, NULL),
	(107, 80, 14, 10023, ''),
	(114, 91, 14, 15418, NULL),
	(115, 91, 14, 15286, NULL),
	(116, 91, 14, 15353, NULL),
	(117, 91, 14, 15033, NULL),
	(118, 91, 14, 10023, ''),
	(119, 81, 14, 15423, NULL),
	(120, 81, 14, 15346, NULL),
	(121, 81, 14, 15033, NULL),
	(122, 81, 14, 15109, NULL),
	(123, 81, 14, 10023, ''),
	(124, 92, 14, 15418, NULL),
	(125, 92, 14, 15286, NULL),
	(126, 92, 14, 15353, NULL),
	(127, 92, 14, 15033, NULL),
	(128, 92, 14, 10023, ''),
	(129, 82, 14, 15423, NULL),
	(130, 82, 14, 15346, NULL),
	(131, 82, 14, 15033, NULL),
	(132, 82, 14, 15109, NULL),
	(133, 82, 14, 10023, ''),
	(134, 93, 14, 15418, NULL),
	(135, 93, 14, 15286, NULL),
	(136, 93, 14, 15353, NULL),
	(137, 93, 14, 10023, ''),
	(138, 83, 14, 15423, NULL),
	(139, 83, 14, 15346, NULL),
	(141, 83, 14, 10023, ''),
	(142, 94, 14, 15418, NULL),
	(143, 94, 14, 15286, NULL),
	(144, 94, 14, 15353, NULL),
	(145, 94, 14, 15033, NULL),
	(146, 94, 14, 10023, ''),
	(147, 84, 14, 15423, NULL),
	(148, 84, 14, 15346, NULL),
	(149, 84, 14, 15033, NULL),
	(150, 84, 14, 15108, NULL),
	(151, 84, 14, 10023, ''),
	(152, 95, 14, 10023, ''),
	(153, 85, 14, 10023, ''),
	(154, 96, 14, 15418, NULL),
	(155, 96, 14, 15286, NULL),
	(156, 96, 14, 15353, NULL),
	(157, 96, 14, 15033, NULL),
	(158, 96, 14, 10023, ''),
	(159, 86, 14, 15423, NULL),
	(160, 86, 14, 15346, NULL),
	(161, 86, 14, 15033, NULL),
	(162, 86, 14, 15109, NULL),
	(163, 86, 14, 10023, ''),
	(164, 97, 14, 15418, NULL),
	(165, 97, 14, 15286, NULL),
	(166, 97, 14, 15353, NULL),
	(167, 97, 14, 15033, NULL),
	(168, 97, 14, 10023, ''),
	(169, 87, 14, 15423, NULL),
	(170, 87, 14, 15346, NULL),
	(171, 87, 14, 15033, NULL),
	(172, 87, 14, 15109, NULL),
	(173, 87, 14, 10023, ''),
	(174, 98, 14, 15418, NULL),
	(175, 98, 14, 15286, NULL),
	(176, 98, 14, 15353, NULL),
	(177, 98, 14, 15033, NULL),
	(178, 98, 14, 10023, ''),
	(179, 88, 14, 15423, NULL),
	(180, 88, 14, 15346, NULL),
	(181, 88, 14, 15033, NULL),
	(182, 88, 14, 15109, NULL),
	(183, 88, 14, 10023, ''),
	(184, 99, 14, 15251, NULL),
	(185, 99, 14, 1309, NULL),
	(186, 99, 14, 15230, NULL),
	(187, 99, 14, 10023, ''),
	(188, 89, 14, 15251, NULL),
	(189, 89, 14, 15233, NULL),
	(190, 89, 14, 15194, NULL),
	(191, 89, 14, 10023, ''),
	(192, 100, 14, 15418, NULL),
	(193, 100, 14, 15286, NULL),
	(194, 100, 14, 15353, NULL),
	(195, 100, 14, 15033, NULL),
	(196, 100, 14, 10023, ''),
	(197, 90, 14, 15423, NULL),
	(198, 90, 14, 15346, NULL),
	(199, 90, 14, 15033, NULL),
	(200, 90, 14, 15109, NULL),
	(201, 90, 14, 10023, ''),
	(202, 11, 14, 15429, NULL),
	(203, 11, 14, 15347, NULL),
	(204, 11, 14, 15433, NULL),
	(205, 11, 14, 10023, ''),
	(206, 11, 11, 10706, ''),
	(207, 1, 14, 15428, NULL),
	(208, 1, 14, 15350, NULL),
	(209, 1, 14, 15438, NULL),
	(210, 1, 14, 10023, ''),
	(211, 1, 11, 10706, NULL),
	(212, 12, 14, 15429, NULL),
	(213, 12, 14, 15347, NULL),
	(214, 12, 14, 15433, NULL),
	(215, 12, 14, 10023, ''),
	(216, 12, 11, 10706, NULL),
	(217, 2, 14, 15428, NULL),
	(218, 2, 14, 15350, NULL),
	(219, 2, 14, 15438, NULL),
	(220, 2, 14, 10023, ''),
	(221, 2, 11, 10706, NULL),
	(222, 13, 14, 15429, NULL),
	(223, 13, 14, 15347, NULL),
	(224, 13, 14, 10023, ''),
	(225, 13, 11, 10706, NULL),
	(226, 3, 14, 15428, NULL),
	(227, 3, 14, 15350, NULL),
	(228, 3, 14, 10023, ''),
	(229, 3, 11, 10706, NULL),
	(230, 14, 14, 15429, NULL),
	(231, 14, 14, 15347, NULL),
	(232, 14, 14, 15433, NULL),
	(233, 14, 14, 10023, ''),
	(234, 14, 11, 10706, NULL),
	(235, 4, 14, 15428, NULL),
	(236, 4, 14, 15350, NULL),
	(237, 4, 14, 15438, NULL),
	(238, 4, 14, 10023, ''),
	(239, 4, 11, 10706, NULL),
	(240, 15, 14, 10023, ''),
	(241, 15, 11, 10706, NULL),
	(242, 5, 14, 10023, ''),
	(243, 5, 11, 10706, NULL),
	(244, 16, 14, 15429, NULL),
	(245, 16, 14, 15347, NULL),
	(246, 16, 14, 15433, NULL),
	(247, 16, 14, 10023, ''),
	(248, 16, 11, 10706, NULL),
	(249, 6, 14, 15428, NULL),
	(250, 6, 14, 15350, NULL),
	(251, 6, 14, 15438, NULL),
	(252, 6, 14, 10023, ''),
	(253, 6, 11, 10706, NULL),
	(254, 17, 14, 15429, NULL),
	(255, 17, 14, 15347, NULL),
	(256, 17, 14, 15433, NULL),
	(257, 17, 14, 10023, ''),
	(258, 17, 11, 10706, NULL),
	(259, 7, 14, 15428, NULL),
	(260, 7, 14, 15350, NULL),
	(261, 7, 14, 15438, NULL),
	(262, 7, 14, 10023, ''),
	(263, 7, 11, 10706, NULL),
	(264, 18, 14, 15429, NULL),
	(265, 18, 14, 15347, NULL),
	(266, 18, 14, 15433, NULL),
	(267, 18, 14, 10023, ''),
	(268, 18, 11, 10706, NULL),
	(269, 8, 14, 15428, NULL),
	(270, 8, 14, 15350, NULL),
	(271, 8, 14, 15438, NULL),
	(272, 8, 14, 10023, ''),
	(273, 8, 11, 10706, NULL),
	(275, 19, 14, 15234, NULL),
	(276, 19, 14, 10023, ''),
	(278, 19, 11, 10706, NULL),
	(279, 9, 14, 15237, NULL),
	(280, 9, 14, 10023, ''),
	(281, 9, 11, 10706, NULL),
	(282, 20, 14, 15429, NULL),
	(283, 20, 14, 15347, NULL),
	(284, 20, 14, 15433, NULL),
	(285, 20, 14, 10023, ''),
	(286, 20, 11, 10706, NULL),
	(287, 10, 14, 15428, NULL),
	(288, 10, 14, 15350, NULL),
	(289, 10, 14, 15438, NULL),
	(290, 10, 14, 10023, ''),
	(291, 10, 11, 10706, NULL),
	(292, 111, 14, 15276, NULL),
	(293, 111, 14, 15343, NULL),
	(294, 111, 14, 15038, NULL),
	(295, 111, 14, 10023, ''),
	(296, 101, 14, 15421, NULL),
	(297, 101, 14, 15359, NULL),
	(298, 101, 14, 15467, NULL),
	(299, 101, 14, 15434, NULL),
	(300, 101, 14, 10023, ''),
	(301, 112, 14, 15276, NULL),
	(302, 112, 14, 15343, NULL),
	(303, 112, 14, 15038, NULL),
	(304, 112, 14, 10023, ''),
	(305, 102, 14, 15421, NULL),
	(306, 102, 14, 15359, NULL),
	(307, 102, 14, 15467, NULL),
	(308, 102, 14, 15434, NULL),
	(309, 102, 14, 10023, ''),
	(310, 113, 14, 15276, NULL),
	(311, 113, 14, 15343, NULL),
	(312, 113, 14, 10023, ''),
	(313, 103, 14, 15421, NULL),
	(314, 103, 14, 15359, NULL),
	(315, 103, 14, 15467, NULL),
	(316, 103, 14, 10023, ''),
	(317, 114, 14, 15276, NULL),
	(318, 114, 14, 15343, NULL),
	(319, 114, 14, 15038, NULL),
	(320, 114, 14, 10023, ''),
	(321, 104, 14, 15421, NULL),
	(322, 104, 14, 15359, NULL),
	(323, 104, 14, 15467, NULL),
	(324, 104, 14, 15434, NULL),
	(325, 104, 14, 10023, ''),
	(326, 115, 14, 10023, ''),
	(327, 105, 14, 10023, ''),
	(328, 116, 14, 15276, NULL),
	(329, 116, 14, 15343, NULL),
	(330, 116, 14, 15038, NULL),
	(331, 116, 14, 10023, ''),
	(332, 106, 14, 15421, NULL),
	(333, 106, 14, 15359, NULL),
	(334, 106, 14, 15467, NULL),
	(335, 106, 14, 15434, NULL),
	(336, 106, 14, 10023, ''),
	(337, 117, 14, 15276, NULL),
	(338, 117, 14, 15343, NULL),
	(339, 117, 14, 15038, NULL),
	(340, 117, 14, 10023, ''),
	(341, 107, 14, 15421, NULL),
	(342, 107, 14, 15359, NULL),
	(343, 107, 14, 15467, NULL),
	(344, 107, 14, 15434, NULL),
	(345, 107, 14, 10023, ''),
	(346, 118, 14, 15276, NULL),
	(347, 118, 14, 15343, NULL),
	(348, 118, 14, 15038, NULL),
	(349, 118, 14, 10023, ''),
	(350, 108, 14, 15421, NULL),
	(351, 108, 14, 15359, NULL),
	(352, 108, 14, 15467, NULL),
	(353, 108, 14, 15434, NULL),
	(354, 108, 14, 10023, ''),
	(355, 119, 14, 15204, NULL),
	(356, 119, 14, 15254, NULL),
	(357, 119, 14, 15230, NULL),
	(358, 119, 14, 10023, ''),
	(359, 109, 14, 15254, NULL),
	(360, 109, 14, 15232, NULL),
	(361, 109, 14, 15270, NULL),
	(362, 109, 14, 10023, ''),
	(363, 120, 14, 15276, NULL),
	(364, 120, 14, 15343, NULL),
	(365, 120, 14, 15038, NULL),
	(366, 120, 14, 10023, ''),
	(367, 110, 14, 15421, NULL),
	(368, 110, 14, 15359, NULL),
	(369, 110, 14, 15467, NULL),
	(370, 110, 14, 15434, NULL),
	(371, 110, 14, 10023, ''),
	(373, 51, 14, 15414, NULL),
	(374, 51, 14, 15351, NULL),
	(375, 51, 14, 15434, NULL),
	(376, 51, 14, 9341, NULL),
	(377, 51, 14, 10023, ''),
	(378, 41, 14, 15023, NULL),
	(379, 51, 14, 15292, NULL),
	(380, 41, 14, 15032, NULL),
	(381, 41, 14, 9341, NULL),
	(382, 41, 14, 10023, ''),
	(384, 52, 14, 15414, NULL),
	(385, 52, 14, 15351, NULL),
	(386, 52, 14, 15434, NULL),
	(387, 52, 14, 9341, NULL),
	(388, 52, 14, 10023, ''),
	(389, 42, 14, 15023, NULL),
	(390, 52, 14, 15292, NULL),
	(391, 42, 14, 15032, NULL),
	(392, 42, 14, 9341, NULL),
	(393, 42, 14, 10023, ''),
	(395, 53, 14, 15414, NULL),
	(396, 53, 14, 15351, NULL),
	(397, 53, 14, 9341, NULL),
	(398, 53, 14, 10023, ''),
	(399, 43, 14, 15023, NULL),
	(400, 53, 14, 15292, NULL),
	(401, 43, 14, 9341, NULL),
	(402, 43, 14, 10023, ''),
	(404, 54, 14, 15414, NULL),
	(405, 54, 14, 15351, NULL),
	(406, 54, 14, 15434, NULL),
	(407, 54, 14, 9341, NULL),
	(408, 54, 14, 10023, ''),
	(409, 44, 14, 15023, NULL),
	(410, 54, 14, 15292, NULL),
	(411, 44, 14, 15032, NULL),
	(412, 44, 14, 9341, NULL),
	(413, 44, 14, 10023, ''),
	(414, 55, 14, 9341, NULL),
	(415, 55, 14, 10023, ''),
	(416, 45, 14, 9341, NULL),
	(417, 45, 14, 10023, ''),
	(418, 19, 14, 15250, NULL),
	(419, 56, 14, 15414, NULL),
	(420, 56, 14, 15351, NULL),
	(421, 56, 14, 15434, NULL),
	(422, 56, 14, 9341, NULL),
	(423, 56, 14, 10023, ''),
	(424, 46, 14, 15023, NULL),
	(425, 56, 14, 15292, NULL),
	(426, 46, 14, 15032, NULL),
	(427, 46, 14, 9341, NULL),
	(428, 46, 14, 10023, ''),
	(430, 57, 14, 15414, NULL),
	(431, 57, 14, 15351, NULL),
	(432, 57, 14, 15434, NULL),
	(433, 57, 14, 9341, NULL),
	(434, 57, 14, 10023, ''),
	(435, 47, 14, 15023, NULL),
	(436, 57, 14, 15292, NULL),
	(437, 47, 14, 15032, NULL),
	(438, 47, 14, 9341, NULL),
	(439, 47, 14, 10023, ''),
	(441, 58, 14, 15414, NULL),
	(442, 58, 14, 15351, NULL),
	(443, 58, 14, 15434, NULL),
	(444, 58, 14, 9341, NULL),
	(445, 58, 14, 10023, ''),
	(446, 48, 14, 15023, NULL),
	(448, 48, 14, 15032, NULL),
	(449, 48, 14, 9341, NULL),
	(450, 48, 14, 10023, ''),
	(451, 59, 14, 15201, NULL),
	(452, 59, 14, 15254, NULL),
	(453, 59, 14, 15238, NULL),
	(454, 59, 14, 9341, NULL),
	(455, 59, 14, 10023, ''),
	(456, 49, 14, 15250, NULL),
	(457, 49, 14, 15229, NULL),
	(458, 49, 14, 9341, NULL),
	(459, 49, 14, 10023, ''),
	(461, 60, 14, 15414, NULL),
	(462, 60, 14, 15351, NULL),
	(463, 60, 14, 15434, NULL),
	(464, 60, 14, 9341, NULL),
	(465, 60, 14, 10023, ''),
	(466, 50, 14, 15023, NULL),
	(467, 60, 14, 15292, NULL),
	(468, 50, 14, 15032, NULL),
	(469, 50, 14, 9341, NULL),
	(470, 50, 14, 10023, ''),
	(471, 31, 14, 15420, NULL),
	(472, 31, 14, 15357, NULL),
	(473, 31, 14, 15434, NULL),
	(474, 31, 14, 15466, NULL),
	(475, 31, 14, 9342, NULL),
	(476, 31, 14, 10023, ''),
	(477, 21, 14, 15422, NULL),
	(478, 21, 14, 15357, NULL),
	(479, 21, 14, 15434, NULL),
	(480, 21, 14, 9342, NULL),
	(481, 21, 14, 10023, ''),
	(482, 32, 14, 15420, NULL),
	(483, 32, 14, 15357, NULL),
	(484, 32, 14, 15434, NULL),
	(485, 32, 14, 15466, NULL),
	(486, 32, 14, 9342, NULL),
	(487, 32, 14, 10023, ''),
	(488, 22, 14, 15422, NULL),
	(489, 22, 14, 15357, NULL),
	(490, 22, 14, 15434, NULL),
	(491, 22, 14, 9342, NULL),
	(492, 22, 14, 10023, ''),
	(493, 33, 14, 15420, NULL),
	(494, 33, 14, 15357, NULL),
	(495, 33, 14, 15466, NULL),
	(496, 33, 14, 9342, NULL),
	(497, 33, 14, 10023, ''),
	(498, 23, 14, 15422, NULL),
	(499, 23, 14, 15357, NULL),
	(500, 23, 14, 9342, NULL),
	(501, 23, 14, 10023, ''),
	(502, 34, 14, 15420, NULL),
	(503, 34, 14, 15357, NULL),
	(504, 34, 14, 15434, NULL),
	(505, 34, 14, 15466, NULL),
	(506, 34, 14, 9342, NULL),
	(507, 34, 14, 10023, ''),
	(508, 24, 14, 15422, NULL),
	(509, 24, 14, 15357, NULL),
	(510, 24, 14, 15434, NULL),
	(511, 24, 14, 9342, NULL),
	(512, 24, 14, 10023, ''),
	(513, 35, 14, 9342, NULL),
	(514, 35, 14, 10023, ''),
	(515, 25, 14, 9342, NULL),
	(516, 25, 14, 10023, ''),
	(517, 36, 14, 15420, NULL),
	(518, 36, 14, 15357, NULL),
	(519, 36, 14, 15434, NULL),
	(520, 36, 14, 15466, NULL),
	(521, 36, 14, 9342, NULL),
	(522, 36, 14, 10023, ''),
	(523, 26, 14, 15422, NULL),
	(524, 26, 14, 15357, NULL),
	(525, 26, 14, 15434, NULL),
	(526, 26, 14, 9342, NULL),
	(527, 26, 14, 10023, ''),
	(528, 37, 14, 15420, NULL),
	(529, 37, 14, 15357, NULL),
	(530, 37, 14, 15434, NULL),
	(531, 37, 14, 15466, NULL),
	(532, 37, 14, 9342, NULL),
	(533, 37, 14, 10023, ''),
	(534, 27, 14, 15422, NULL),
	(535, 27, 14, 15357, NULL),
	(536, 27, 14, 15434, NULL),
	(537, 27, 14, 9342, NULL),
	(538, 27, 14, 10023, ''),
	(539, 38, 14, 15420, NULL),
	(540, 38, 14, 15357, NULL),
	(541, 38, 14, 15434, NULL),
	(542, 38, 14, 15466, NULL),
	(543, 38, 14, 9342, NULL),
	(544, 38, 14, 10023, ''),
	(545, 28, 14, 15422, NULL),
	(546, 28, 14, 15357, NULL),
	(547, 28, 14, 15434, NULL),
	(548, 28, 14, 9342, NULL),
	(549, 28, 14, 10023, ''),
	(550, 39, 14, 15253, NULL),
	(551, 39, 14, 15247, NULL),
	(552, 39, 14, 9342, NULL),
	(553, 39, 14, 10023, ''),
	(554, 29, 14, 15253, NULL),
	(555, 29, 14, 15247, NULL),
	(556, 29, 14, 9342, NULL),
	(557, 29, 14, 10023, ''),
	(558, 40, 14, 15420, NULL),
	(559, 40, 14, 15357, NULL),
	(560, 40, 14, 15434, NULL),
	(561, 40, 14, 15466, NULL),
	(562, 40, 14, 9342, NULL),
	(563, 40, 14, 10023, ''),
	(564, 30, 14, 15422, NULL),
	(565, 30, 14, 15357, NULL),
	(566, 30, 14, 15434, NULL),
	(567, 30, 14, 9342, NULL),
	(568, 30, 14, 10023, ''),
	(569, 70, 14, 15416, NULL),
	(570, 70, 14, 15449, NULL),
	(571, 70, 14, 15436, NULL),
	(572, 70, 14, 14538, NULL),
	(573, 70, 14, 9342, NULL),
	(574, 70, 14, 10023, ''),
	(575, 55, 14, 15292, NULL),
	(576, 59, 14, 15292, NULL),
	(577, 9, 14, 15258, NULL),
	(578, 1, 16, 15807, NULL),
	(579, 1, 16, 15606, NULL),
	(580, 2, 16, 15807, NULL),
	(581, 2, 16, 15606, NULL),
	(582, 3, 16, 15807, NULL),
	(583, 3, 16, 15606, NULL),
	(584, 4, 16, 15807, NULL),
	(585, 4, 16, 15606, NULL),
	(586, 5, 16, 15807, NULL),
	(587, 5, 16, 15606, NULL),
	(588, 6, 16, 15606, NULL),
	(589, 6, 16, 15807, NULL),
	(590, 7, 16, 15606, NULL),
	(591, 7, 16, 15807, NULL),
	(592, 8, 16, 15606, NULL),
	(593, 8, 16, 15807, NULL),
	(594, 9, 16, 15807, NULL),
	(595, 10, 16, 15606, NULL),
	(596, 10, 16, 15807, NULL),
	(597, 11, 16, 15606, NULL),
	(598, 11, 16, 15807, NULL),
	(599, 12, 16, 15606, NULL),
	(600, 12, 16, 15807, NULL),
	(817, 13, 16, 15807, NULL),
	(818, 13, 16, 15606, NULL),
	(819, 14, 16, 15807, NULL),
	(820, 14, 16, 15606, NULL),
	(821, 15, 16, 15807, NULL),
	(822, 15, 16, 15606, NULL),
	(823, 16, 16, 15807, NULL),
	(824, 16, 16, 15606, NULL),
	(825, 17, 16, 15807, NULL),
	(826, 17, 16, 15606, NULL),
	(827, 18, 16, 15807, NULL),
	(828, 18, 16, 15606, NULL),
	(829, 19, 16, 15807, NULL),
	(830, 19, 16, 15606, NULL),
	(831, 20, 16, 15807, NULL),
	(832, 20, 16, 15606, NULL),
	(833, 21, 16, 15807, NULL),
	(834, 21, 16, 15606, NULL),
	(835, 22, 16, 15807, NULL),
	(836, 22, 16, 15606, NULL),
	(837, 23, 16, 15807, NULL),
	(838, 23, 16, 15606, NULL),
	(839, 24, 16, 15807, NULL),
	(840, 24, 16, 15606, NULL),
	(841, 25, 16, 15807, NULL),
	(842, 25, 16, 15606, NULL),
	(843, 26, 16, 15807, NULL),
	(844, 26, 16, 15606, NULL),
	(845, 27, 16, 15807, NULL),
	(846, 27, 16, 15606, NULL),
	(847, 28, 16, 15807, NULL),
	(848, 28, 16, 15606, NULL),
	(849, 29, 16, 15807, NULL),
	(850, 29, 16, 15606, NULL),
	(851, 30, 16, 15807, NULL),
	(852, 30, 16, 15606, NULL),
	(853, 31, 16, 15807, NULL),
	(854, 31, 16, 15606, NULL),
	(855, 32, 16, 15807, NULL),
	(856, 32, 16, 15606, NULL),
	(857, 33, 16, 15807, NULL),
	(858, 33, 16, 15606, NULL),
	(859, 34, 16, 15807, NULL),
	(860, 34, 16, 15606, NULL),
	(861, 35, 16, 15807, NULL),
	(862, 35, 16, 15606, NULL),
	(863, 36, 16, 15807, NULL),
	(864, 36, 16, 15606, NULL),
	(865, 37, 16, 15807, NULL),
	(866, 37, 16, 15606, NULL),
	(867, 38, 16, 15807, NULL),
	(868, 38, 16, 15606, NULL),
	(869, 39, 16, 15807, NULL),
	(870, 39, 16, 15606, NULL),
	(871, 40, 16, 15807, NULL),
	(872, 40, 16, 15606, NULL),
	(873, 41, 16, 15807, NULL),
	(874, 41, 16, 15606, NULL),
	(875, 42, 16, 15807, NULL),
	(876, 42, 16, 15606, NULL),
	(877, 43, 16, 15807, NULL),
	(878, 43, 16, 15606, NULL),
	(879, 44, 16, 15807, NULL),
	(880, 44, 16, 15606, NULL),
	(881, 45, 16, 15807, NULL),
	(882, 45, 16, 15606, NULL),
	(883, 46, 16, 15807, NULL),
	(884, 46, 16, 15606, NULL),
	(885, 47, 16, 15807, NULL),
	(886, 47, 16, 15606, NULL),
	(887, 48, 16, 15807, NULL),
	(888, 48, 16, 15606, NULL),
	(889, 49, 16, 15807, NULL),
	(890, 49, 16, 15606, NULL),
	(891, 50, 16, 15807, NULL),
	(892, 50, 16, 15606, NULL),
	(893, 51, 16, 15807, NULL),
	(894, 51, 16, 15606, NULL),
	(895, 52, 16, 15807, NULL),
	(896, 52, 16, 15606, NULL),
	(897, 53, 16, 15807, NULL),
	(898, 53, 16, 15606, NULL),
	(899, 54, 16, 15807, NULL),
	(900, 54, 16, 15606, NULL),
	(901, 55, 16, 15807, NULL),
	(902, 55, 16, 15606, NULL),
	(903, 56, 16, 15807, NULL),
	(904, 56, 16, 15606, NULL),
	(905, 57, 16, 15807, NULL),
	(906, 57, 16, 15606, NULL),
	(907, 58, 16, 15807, NULL),
	(908, 58, 16, 15606, NULL),
	(909, 59, 16, 15807, NULL),
	(910, 59, 16, 15606, NULL),
	(911, 60, 16, 15807, NULL),
	(912, 60, 16, 15606, NULL),
	(913, 61, 16, 15807, NULL),
	(914, 61, 16, 15606, NULL),
	(915, 62, 16, 15807, NULL),
	(916, 62, 16, 15606, NULL),
	(917, 63, 16, 15807, NULL),
	(918, 63, 16, 15606, NULL),
	(919, 64, 16, 15807, NULL),
	(920, 64, 16, 15606, NULL),
	(921, 65, 16, 15807, NULL),
	(922, 65, 16, 15606, NULL),
	(923, 66, 16, 15807, NULL),
	(924, 66, 16, 15606, NULL),
	(925, 67, 16, 15807, NULL),
	(926, 67, 16, 15606, NULL),
	(927, 68, 16, 15807, NULL),
	(928, 68, 16, 15606, NULL),
	(929, 69, 16, 15807, NULL),
	(930, 69, 16, 15606, NULL),
	(931, 70, 16, 15807, NULL),
	(932, 70, 16, 15606, NULL),
	(933, 71, 16, 15807, NULL),
	(934, 71, 16, 15606, NULL),
	(935, 72, 16, 15807, NULL),
	(936, 72, 16, 15606, NULL),
	(937, 73, 16, 15807, NULL),
	(938, 73, 16, 15606, NULL),
	(939, 74, 16, 15807, NULL),
	(940, 74, 16, 15606, NULL),
	(941, 75, 16, 15807, NULL),
	(942, 75, 16, 15606, NULL),
	(943, 76, 16, 15807, NULL),
	(944, 76, 16, 15606, NULL),
	(945, 77, 16, 15807, NULL),
	(946, 77, 16, 15606, NULL),
	(947, 78, 16, 15807, NULL),
	(948, 78, 16, 15606, NULL),
	(949, 79, 16, 15807, NULL),
	(950, 79, 16, 15606, NULL),
	(951, 80, 16, 15807, NULL),
	(952, 80, 16, 15606, NULL),
	(953, 81, 16, 15807, NULL),
	(954, 81, 16, 15606, NULL),
	(955, 82, 16, 15807, NULL),
	(956, 82, 16, 15606, NULL),
	(957, 83, 16, 15807, NULL),
	(958, 83, 16, 15606, NULL),
	(959, 84, 16, 15807, NULL),
	(960, 84, 16, 15606, NULL),
	(961, 85, 16, 15807, NULL),
	(962, 85, 16, 15606, NULL),
	(963, 86, 16, 15807, NULL),
	(964, 86, 16, 15606, NULL),
	(965, 87, 16, 15807, NULL),
	(966, 87, 16, 15606, NULL),
	(967, 88, 16, 15807, NULL),
	(968, 88, 16, 15606, NULL),
	(969, 89, 16, 15807, NULL),
	(970, 89, 16, 15606, NULL),
	(971, 90, 16, 15807, NULL),
	(972, 90, 16, 15606, NULL),
	(973, 91, 16, 15807, NULL),
	(974, 91, 16, 15606, NULL),
	(975, 92, 16, 15807, NULL),
	(976, 92, 16, 15606, NULL),
	(977, 93, 16, 15807, NULL),
	(978, 93, 16, 15606, NULL),
	(979, 94, 16, 15807, NULL),
	(980, 94, 16, 15606, NULL),
	(981, 95, 16, 15807, NULL),
	(982, 95, 16, 15606, NULL),
	(983, 96, 16, 15807, NULL),
	(984, 96, 16, 15606, NULL),
	(985, 97, 16, 15807, NULL),
	(986, 97, 16, 15606, NULL),
	(987, 98, 16, 15807, NULL),
	(988, 98, 16, 15606, NULL),
	(989, 99, 16, 15807, NULL),
	(990, 99, 16, 15606, NULL),
	(991, 100, 16, 15807, NULL),
	(992, 100, 16, 15606, NULL),
	(993, 101, 16, 15807, NULL),
	(994, 101, 16, 15606, NULL),
	(995, 102, 16, 15807, NULL),
	(996, 102, 16, 15606, NULL),
	(997, 103, 16, 15807, NULL),
	(998, 103, 16, 15606, NULL),
	(999, 104, 16, 15807, NULL),
	(1000, 104, 16, 15606, NULL),
	(1001, 105, 16, 15807, NULL),
	(1002, 105, 16, 15606, NULL),
	(1003, 106, 16, 15807, NULL),
	(1004, 106, 16, 15606, NULL),
	(1005, 107, 16, 15807, NULL),
	(1006, 107, 16, 15606, NULL),
	(1007, 108, 16, 15807, NULL),
	(1008, 108, 16, 15606, NULL),
	(1009, 109, 16, 15807, NULL),
	(1010, 109, 16, 15606, NULL),
	(1011, 110, 16, 15807, NULL),
	(1012, 110, 16, 15606, NULL),
	(1013, 111, 16, 15807, NULL),
	(1014, 111, 16, 15606, NULL),
	(1015, 112, 16, 15807, NULL),
	(1016, 112, 16, 15606, NULL),
	(1017, 113, 16, 15807, NULL),
	(1018, 113, 16, 15606, NULL),
	(1019, 114, 16, 15807, NULL),
	(1020, 114, 16, 15606, NULL),
	(1021, 115, 16, 15807, NULL),
	(1022, 115, 16, 15606, NULL),
	(1023, 116, 16, 15807, NULL),
	(1024, 116, 16, 15606, NULL),
	(1025, 117, 16, 15807, NULL),
	(1026, 117, 16, 15606, NULL),
	(1027, 118, 16, 15807, NULL),
	(1028, 118, 16, 15606, NULL),
	(1029, 119, 16, 15807, NULL),
	(1030, 119, 16, 15606, NULL),
	(1031, 120, 16, 15807, NULL),
	(1032, 120, 16, 15606, NULL);
/*!40000 ALTER TABLE `starting_items` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-08-27  9:42:10