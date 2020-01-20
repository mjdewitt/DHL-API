
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;



-- --------------------------------------------------------

--
-- Table structure for table `dhl_products`
--

CREATE TABLE IF NOT EXISTS `dhl_products` (
  `prd_cde` char(1) NOT NULL,
  `prd_desc` varchar(30) NOT NULL,
  `content_cde` char(3) DEFAULT NULL,
  `format` char(12) NOT NULL,
  `doc_required` char(1) NOT NULL,
  `doc_desc` varchar(15) NOT NULL,
  `def_deliv_time` varchar(5) DEFAULT NULL,
  `id` int(11) unsigned NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1 PACK_KEYS=1;

--
-- Dumping data for table `dhl_products`
--

INSERT INTO `dhl_products` (`prd_cde`, `prd_desc`, `content_cde`, `format`, `doc_required`, `doc_desc`, `def_deliv_time`, `id`) VALUES
('0', 'LOGISTICS SERVICES', 'LOG', '', 'N', 'Not Applicable', '', 2),
('1', 'DOMESTIC EXPRESS 12:00', 'DOT', '', 'Y', 'Doc', ' 12:0', 3),
('2', 'B2C', 'BTC', '', 'Y', 'Doc', ' 23:5', 4),
('3', 'B2C', 'B2C', '', 'N', 'Non Doc', ' 23:5', 5),
('4', 'JETLINE', 'NFO', '', 'N', 'Non Doc', ' 23:5', 6),
('5', 'SPRINTLINE', 'SPL', '', 'Y', 'Doc', ' 23:5', 7),
('7', 'EXPRESS EASY', 'XED', '', 'Y', 'Doc', ' 23:5', 8),
('8', 'EXPRESS EASY', 'XEP', '', 'N', 'Non Doc', ' 23:5', 9),
('9', 'EUROPACK', 'EPA', '', 'Y', 'Doc', ' 23:5', 10),
('A', 'AUTO REVERSALS', '', '', 'N', 'Not Applicable', '', 11),
('B', 'BREAKBULK EXPRESS', 'BBX', '', 'Y', 'Doc', ' 23:5', 12),
('C', 'MEDICAL EXPRESS', 'CMX', '', 'Y', 'Doc', ' 23:5', 13),
('D', 'EXPRESS WORLDWIDE', 'DOX', '', 'Y', 'Doc', ' 23:5', 14),
('E', 'EXPRESS 9:00', 'TDE', '', 'N', 'Non Doc', '  09:', 15),
('F', 'FREIGHT WORLDWIDE', 'FRT', '', 'N', 'Non Doc', ' 23:5', 16),
('G', 'DOMESTIC ECONOMY SELECT', 'DES', '', 'Y', 'Doc', ' 23:5', 17),
('H', 'ECONOMY SELECT', 'ESI', '', 'N', 'Non Doc', ' 23:5', 18),
('I', 'DOMESTIC EXPRESS 9:00', 'DOK', '', 'Y', 'Doc', '  9:0', 19),
('J', 'JUMBO BOX', 'JBX', '', 'N', 'Non Doc', ' 23:5', 20),
('K', 'EXPRESS 9:00', 'TDK', '', 'Y', 'Doc', '  9:0', 21),
('L', 'EXPRESS 10:30', 'TDL', '', 'Y', 'Doc', ' 10:3', 22),
('M', 'EXPRESS 10:30', 'TDM', '', 'N', 'Non Doc', ' 10:3', 23),
('N', 'DOMESTIC EXPRESS', 'DOM', '', 'Y', 'Doc', ' 23:5', 24),
('O', 'DOMESTIC EXPRESS 10:30', 'DOL', '', 'Y', 'Doc', ' 10:3', 25),
('P', 'EXPRESS WORLDWIDE', 'WPX', '', 'N', 'Non Doc', ' 23:5', 26),
('Q', 'MEDICAL EXPRESS', 'WMX', '', 'N', 'Non Doc', ' 23:5', 27),
('R', 'GLOBALMAIL BUSINESS', 'GMB', '', 'Y', 'Doc', ' 23:5', 28),
('S', 'SAME DAY', 'SDX', '', 'Y', 'Doc', ' 23:5', 29),
('T', 'EXPRESS 12:00', 'TDT', '', 'Y', 'Doc', ' 12:0', 30),
('U', 'EXPRESS WORLDWIDE', 'ECX', '', 'Y', 'Doc', ' 23:5', 31),
('V', 'EUROPACK', 'EPP', '', 'N', 'Non Doc', ' 23:5', 32),
('W', 'ECONOMY SELECT', 'ESU', '', 'Y', 'Doc', ' 23:5', 33),
('X', 'EXPRESS ENVELOPE', 'XPD', '', 'Y', 'Doc', ' 23:5', 34),
('Y', 'EXPRESS 12:00', 'TDY', '', 'N', 'Non Doc', ' 12:0', 35),
('Z', 'Destination Charges', '', '', 'N', 'Not Applicable', '', 36);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dhl_products`
--
ALTER TABLE `dhl_products`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `dhl_products`
--
ALTER TABLE `dhl_products`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=37;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
