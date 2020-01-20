
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;


-- --------------------------------------------------------

--
-- Table structure for table `dhl_doorto`
--

CREATE TABLE IF NOT EXISTS `dhl_doorto` (
  `doorto_cde` char(2) NOT NULL,
  `doorto_desc` char(40) NOT NULL,
  `id` int(11) unsigned NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 PACK_KEYS=1;

--
-- Dumping data for table `dhl_doorto`
--

INSERT INTO `dhl_doorto` (`doorto_cde`, `doorto_desc`, `id`) VALUES
('DD', 'Door to Door', 1),
('DA', 'Door to Airport', 2),
('AA', 'Airport to Airport', 3),
('DC', 'Door to Door non-compliant', 4);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dhl_doorto`
--
ALTER TABLE `dhl_doorto`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `dhl_doorto`
--
ALTER TABLE `dhl_doorto`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
