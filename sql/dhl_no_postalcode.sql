
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;


-- --------------------------------------------------------

--
-- Table structure for table `dhl_no_postalcode`
--

CREATE TABLE IF NOT EXISTS `dhl_no_postalcode` (
  `ctry_cde` char(2) NOT NULL,
  `ctry_name` char(40) NOT NULL,
  `id` int(11) unsigned NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=135 DEFAULT CHARSET=latin1 PACK_KEYS=1;

--
-- Dumping data for table `dhl_no_postalcode`
--

INSERT INTO `dhl_no_postalcode` (`ctry_cde`, `ctry_name`, `id`) VALUES
('AE', 'UNITED ARAB EMIRATES', 2),
('AF', 'AFGHANISTAN', 3),
('AG', 'ANTIGUA', 4),
('AI', 'ANGUILLA', 5),
('AL', 'ALBANIA', 6),
('AN', 'NETHERLANDS ANTILLES', 7),
('AO', 'ANGOLA', 8),
('AW', 'ARUBA', 9),
('BB', 'BARBADOS', 10),
('BF', 'BURKINA FASO', 11),
('BH', 'BAHRAIN', 12),
('BI', 'BURUNDI', 13),
('BJ', 'BENIN', 14),
('BM', 'BERMUDA', 15),
('BO', 'BOLIVIA', 16),
('BS', 'BAHAMAS', 17),
('BT', 'BHUTAN', 18),
('BW', 'BOTSWANA', 19),
('BZ', 'BELIZE', 20),
('CD', 'CONGO, THE DEMOCRATIC REPUBLIC OF', 21),
('CF', 'CENTRAL AFRICAN REPUBLIC', 22),
('CG', 'CONGO', 23),
('CI', 'COTE D IVOIRE', 24),
('CK', 'COOK ISLANDS', 25),
('CL', 'CHILE', 26),
('CM', 'CAMEROON', 27),
('CO', 'COLOMBIA', 28),
('CR', 'COSTA RICA', 29),
('CV', 'CAPE VERDE', 30),
('DJ', 'DJIBOUTI', 31),
('DM', 'DOMINICA', 32),
('DO', 'DOMINICAN REPUBLIC', 33),
('EC', 'ECUADOR', 34),
('EG', 'EGYPT', 35),
('ER', 'ERITREA', 36),
('ET', 'ETHIOPIA', 37),
('FJ', 'FIJI', 38),
('FK', 'FALKLAND ISLANDS', 39),
('GA', 'GABON', 40),
('GD', 'GRENADA', 41),
('GH', 'GHANA', 42),
('GI', 'GIBRALTAR', 43),
('GM', 'GAMBIA', 44),
('GN', 'GUINEA REPUBLIC', 45),
('GQ', 'GUINEA-EQUATORIAL', 46),
('GT', 'GUATEMALA', 47),
('GW', 'GUINEA-BISSAU', 48),
('GY', 'GUYANA (BRITISH)', 49),
('HK', 'HONG KONG', 50),
('HN', 'HONDURAS', 51),
('HT', 'HAITI', 52),
('IE', 'IRELAND, REPUBLIC OF', 53),
('IQ', 'IRAQ', 54),
('IR', 'IRAN (ISLAMIC REPUBLIC OF)', 55),
('JM', 'JAMAICA', 56),
('JO', 'JORDAN', 57),
('KE', 'KENYA', 58),
('KH', 'CAMBODIA', 59),
('KI', 'KIRIBATI', 60),
('KM', 'COMOROS', 61),
('KN', 'ST. KITTS', 62),
('KP', 'KOREA, THE D.P.R OF (NORTH K.)', 63),
('KW', 'KUWAIT', 64),
('KY', 'CAYMAN ISLANDS', 65),
('LA', 'LAO PEOPLES DEMOCRATIC REPUBLIC', 66),
('LB', 'LEBANON', 67),
('LC', 'ST. LUCIA', 68),
('LK', 'SRI LANKA', 69),
('LR', 'LIBERIA', 70),
('LS', 'LESOTHO', 71),
('LY', 'LIBYA', 72),
('ML', 'MALI', 73),
('MM', 'MYANMAR', 74),
('MO', 'MACAU', 75),
('MR', 'MAURITANIA', 76),
('MS', 'MONTSERRAT', 77),
('MT', 'MALTA', 78),
('MU', 'MAURITIUS', 79),
('MW', 'MALAWI', 80),
('MZ', 'MOZAMBIQUE', 81),
('NA', 'NAMIBIA', 82),
('NE', 'NIGER', 83),
('NG', 'NIGERIA', 84),
('NI', 'NICARAGUA', 85),
('NP', 'NEPAL', 86),
('NR', 'NAURU, REPUBLIC OF', 87),
('NU', 'NIUE', 88),
('OM', 'OMAN', 89),
('PA', 'PANAMA', 90),
('PE', 'PERU', 91),
('PF', 'TAHITI', 92),
('PY', 'PARAGUAY', 93),
('QA', 'QATAR', 94),
('RW', 'RWANDA', 95),
('SA', 'SAUDI ARABIA', 96),
('SB', 'SOLOMON ISLANDS', 97),
('SC', 'SEYCHELLES', 98),
('SD', 'SUDAN', 99),
('SL', 'SIERRA LEONE', 100),
('SN', 'SENEGAL', 101),
('SO', 'SOMALIA', 102),
('SR', 'SURINAME', 103),
('SS', 'SOUTH SUDAN', 104),
('ST', 'SAO TOME AND PRINCIPE', 105),
('SV', 'EL SALVADOR', 106),
('SY', 'SYRIA', 107),
('TC', 'TURKS AND CAICOS ISLANDS', 108),
('TD', 'CHAD', 109),
('TG', 'TOGO', 110),
('TL', 'EAST TIMOR', 111),
('TO', 'TONGA', 112),
('TT', 'TRINIDAD AND TOBAGO', 113),
('TV', 'TUVALU', 114),
('TZ', 'TANZANIA', 115),
('UG', 'UGANDA', 116),
('UY', 'URUGUAY', 117),
('VC', 'ST. VINCENT', 118),
('VE', 'VENEZUELA', 119),
('VG', 'VIRGIN ISLANDS (BRITISH)', 120),
('VN', 'VIETNAM', 121),
('VU', 'VANUATU', 122),
('WS', 'SAMOA', 123),
('XA', 'UAE BILLING COUNTRY CODE', 124),
('XB', 'BONAIRE', 125),
('XC', 'CURACAO', 126),
('XE', 'ST. EUSTATIUS', 127),
('XL', 'DUMMY BILLING CODE', 128),
('XM', 'ST. MAARTEN', 129),
('XN', 'NEVIS', 130),
('XS', 'SOMALILAND, REP OF (NORTH SOMALIA)', 131),
('YE', 'YEMEN, REPUBLIC OF', 132),
('ZM', 'ZAMBIA', 133),
('ZW', 'ZIMBABWE', 134);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dhl_no_postalcode`
--
ALTER TABLE `dhl_no_postalcode`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `dhl_no_postalcode`
--
ALTER TABLE `dhl_no_postalcode`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=135;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
