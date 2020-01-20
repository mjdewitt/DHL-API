
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;


-- --------------------------------------------------------

--
-- Table structure for table `dhl_postcode_format`
--

CREATE TABLE IF NOT EXISTS `dhl_postcode_format` (
  `ctry_cde` char(2) NOT NULL,
  `ctry_name` varchar(40) NOT NULL,
  `format` char(12) NOT NULL,
  `sig_chars` int(11) NOT NULL,
  `id` int(11) unsigned NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=123 DEFAULT CHARSET=latin1 PACK_KEYS=1;

--
-- Dumping data for table `dhl_postcode_format`
--

INSERT INTO `dhl_postcode_format` (`ctry_cde`, `ctry_name`, `format`, `sig_chars`, `id`) VALUES
('AD', 'ANDORRA', '99999', 5, 2),
('AD', 'ANDORRA', 'AA999', 5, 3),
('AM', 'ARMENIA', '9999', 4, 4),
('AR', 'ARGENTINA', '9999', 4, 5),
('AS', 'AMERICAN SAMOA', '99999', 5, 6),
('AT', 'AUSTRIA', '9999', 4, 7),
('AU', 'AUSTRALIA', '9999', 4, 8),
('AZ', 'AZERBAIJAN', '999999', 6, 9),
('AZ', 'AZERBAIJAN', '9999', 4, 10),
('BA', 'BOSNIA AND HERZEGOVINA', '99999', 5, 11),
('BD', 'BANGLADESH', '9999', 4, 12),
('BE', 'BELGIUM', '9999', 4, 13),
('BG', 'BULGARIA', '9999', 4, 14),
('BN', 'BRUNEI', 'AA9999', 6, 15),
('BR', 'BRAZIL', '99999', 5, 16),
('BR', 'BRAZIL', '99999-999', 5, 17),
('BR', 'BRAZIL', '99999999', 5, 18),
('BY', 'BELARUS', '999999', 6, 19),
('CA', 'CANADA', 'A9A 9A', 6, 20),
('CA', 'CANADA', 'A9A 9A9', 6, 21),
('CH', 'SWITZERLAND', '9999', 4, 22),
('CN', 'CHINA, PEOPLES REPUBLIC', '999999', 6, 23),
('CO', 'COLOMBIA', '999999', 6, 24),
('CU', 'CUBA', '99999', 5, 25),
('CY', 'CYPRUS', '9999', 4, 26),
('CZ', 'CZECH REPUBLIC, THE', '999 99', 6, 27),
('DE', 'GERMANY', '99999', 5, 28),
('DK', 'DENMARK', '9999', 4, 29),
('DZ', 'ALGERIA', '99999', 5, 30),
('EC', 'ECUADOR', '999999', 6, 31),
('EE', 'ESTONIA', '99999', 5, 32),
('ES', 'SPAIN', '99999', 5, 33),
('FI', 'FINLAND', '99999', 5, 34),
('FM', 'MICRONESIA, FEDERATED STATES OF', '99999', 5, 35),
('FO', 'FAROE ISLANDS', '999', 3, 36),
('FR', 'FRANCE', '99999', 5, 37),
('GB', 'UNITED KINGDOM', 'AA9A 9AA', 6, 38),
('GB', 'UNITED KINGDOM', 'A99 9AA', 5, 39),
('GB', 'UNITED KINGDOM', 'A9A 9AA', 5, 40),
('GB', 'UNITED KINGDOM', 'A9 9AA', 4, 41),
('GB', 'UNITED KINGDOM', 'AA99 9AA', 6, 42),
('GB', 'UNITED KINGDOM', 'AA9 9AA', 5, 43),
('GE', 'GEORGIA', '9999', 4, 44),
('GF', 'FRENCH GUYANA', '99999', 5, 45),
('GG', 'GUERNSEY', 'AA99 9AA', 4, 46),
('GG', 'GUERNSEY', 'AA9 9AA', 3, 47),
('GL', 'GREENLAND', '9999', 4, 48),
('GP', 'GUADELOUPE', '99999', 5, 49),
('GR', 'GREECE', '999 99', 6, 50),
('GU', 'GUAM', '99999', 5, 51),
('GU', 'GUAM', '99999-9999', 5, 52),
('HR', 'CROATIA', '99999', 5, 53),
('HU', 'HUNGARY', '9999', 4, 54),
('IC', 'CANARY ISLANDS, THE', '99999', 5, 55),
('ID', 'INDONESIA', '99999', 5, 56),
('IL', 'ISRAEL', '9999999', 7, 57),
('IN', 'INDIA', '999999', 6, 58),
('IS', 'ICELAND', '999', 3, 59),
('IT', 'ITALY', '99999', 5, 60),
('JE', 'JERSEY', 'AA9 9AA', 3, 61),
('JP', 'JAPAN', '999-9999', 8, 62),
('KG', 'KYRGYZSTAN', '999999', 6, 63),
('KH', 'CAMBODIA', '99999', 5, 64),
('KR', 'KOREA, REPUBLIC OF (SOUTH K.)', '99999', 5, 65),
('KV', 'KOSOVO', '99999', 5, 66),
('KZ', 'KAZAKHSTAN', '999999', 6, 67),
('LI', 'LIECHTENSTEIN', '9999', 4, 68),
('LT', 'LITHUANIA', '99999', 5, 69),
('LU', 'LUXEMBOURG', '9999', 4, 70),
('LV', 'LATVIA', '9999', 4, 71),
('MA', 'MOROCCO', '99999', 5, 72),
('MC', 'MONACO', '99999', 5, 73),
('MD', 'MOLDOVA, REPUBLIC OF', '9999', 4, 74),
('ME', 'MONTENEGRO, REPUBLIC OF', '99999', 5, 75),
('MG', 'MADAGASCAR', '999', 3, 76),
('MH', 'MARSHALL ISLANDS', '99999', 5, 77),
('MK', 'MACEDONIA, REPUBLIC OF', '9999', 4, 78),
('MN', 'MONGOLIA', '999999', 6, 79),
('MN', 'MONGOLIA', '99999', 5, 80),
('MP', 'COMMONWEALTH NO. MARIANA ISLANDS', '99999', 5, 81),
('MQ', 'MARTINIQUE', '99999', 5, 82),
('MV', 'MALDIVES', '99999', 5, 83),
('MV', 'MALDIVES', '9999', 4, 84),
('MX', 'MEXICO', '99999', 5, 85),
('MY', 'MALAYSIA', '99999', 5, 86),
('NC', 'NEW CALEDONIA', '99999', 5, 87),
('NL', 'NETHERLANDS, THE', '9999', 4, 88),
('NL', 'NETHERLANDS, THE', '9999 AA', 4, 89),
('NO', 'NORWAY', '9999', 4, 90),
('NZ', 'NEW ZEALAND', '9999', 4, 91),
('PG', 'PAPUA NEW GUINEA', '999', 3, 92),
('PH', 'PHILIPPINES, THE', '9999', 4, 93),
('PK', 'PAKISTAN', '99999', 5, 94),
('PL', 'POLAND', '99-999', 6, 95),
('PR', 'PUERTO RICO', '99999', 5, 96),
('PT', 'PORTUGAL', '9999-999', 8, 97),
('PW', 'PALAU', '99999', 5, 98),
('RE', 'REUNION, ISLAND OF', '99999', 5, 99),
('RO', 'ROMANIA', '999999', 6, 100),
('RS', 'SERBIA, REPUBLIC OF', '99999', 5, 101),
('RU', 'RUSSIAN FEDERATION, THE', '999999', 6, 102),
('SE', 'SWEDEN', '999 99', 6, 103),
('SG', 'SINGAPORE', '999999', 6, 104),
('SH', 'SAINT HELENA', 'AAAA 9AA', 8, 105),
('SI', 'SLOVENIA', '9999', 4, 106),
('SK', 'SLOVAKIA', '999 99', 6, 107),
('SM', 'SAN MARINO', '99999', 5, 108),
('SZ', 'SWAZILAND', 'A999', 4, 109),
('TH', 'THAILAND', '99999', 5, 110),
('TN', 'TUNISIA', '9999', 4, 111),
('TR', 'TURKEY', '99999', 5, 112),
('TW', 'TAIWAN', '999', 3, 113),
('TW', 'TAIWAN', '99999', 5, 114),
('UA', 'UKRAINE', '99999', 5, 115),
('US', 'UNITED STATES OF AMERICA', '99999', 5, 116),
('US', 'UNITED STATES OF AMERICA', '99999-9999', 5, 117),
('UZ', 'UZBEKISTAN', '999999', 6, 118),
('VI', 'VIRGIN ISLANDS (US)', '99999', 5, 119),
('XY', 'ST. BARTHELEMY', '99999', 5, 120),
('YT', 'MAYOTTE', '99999', 5, 121),
('ZA', 'SOUTH AFRICA', '9999', 4, 122);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dhl_postcode_format`
--
ALTER TABLE `dhl_postcode_format`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `dhl_postcode_format`
--
ALTER TABLE `dhl_postcode_format`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=123;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
