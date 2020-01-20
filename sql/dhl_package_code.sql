
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;


-- --------------------------------------------------------

--
-- Table structure for table `dhl_package_code`
--

CREATE TABLE IF NOT EXISTS `dhl_package_code` (
  `package_cde` char(2) NOT NULL,
  `package_desc` varchar(30) NOT NULL,
  `id` int(11) unsigned NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1 PACK_KEYS=1;

--
-- Dumping data for table `dhl_package_code`
--

INSERT INTO `dhl_package_code` (`package_cde`, `package_desc`, `id`) VALUES
('BD', 'Jumbo Document', 1),
('BP', 'Jumbo Parcel', 2),
('CP', 'Customer-provided', 3),
('DC', 'Document', 4),
('DF', 'DHL Flyer', 5),
('DM', 'Domestic', 6),
('ED', 'Express Document', 7),
('EE', 'DHL Express Envelope', 8),
('FR', 'Freight', 9),
('JB', 'Jumbo box', 10),
('JD', 'Jumbo Junior Document', 11),
('JJ', 'Junior jumbo Box', 12),
('JP', 'Jumbo Junior Parcel', 13),
('OD', 'Other DHL Packaging', 14),
('PA', 'Parcel', 15),
('YP', 'Your packaging', 16);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dhl_package_code`
--
ALTER TABLE `dhl_package_code`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `dhl_package_code`
--
ALTER TABLE `dhl_package_code`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=17;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
