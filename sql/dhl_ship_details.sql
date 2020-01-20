

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;



-- --------------------------------------------------------

--
-- Table structure for table `csw_dhl_ship_details`
--

CREATE TABLE IF NOT EXISTS `csw_dhl_ship_details` (
  `invoice` int(11) NOT NULL,
  `carton_id` int(11) NOT NULL,
  `carton_cde` char(10) NOT NULL,
  `carton_desc` varchar(15) NOT NULL,
  `weight_lbs` float NOT NULL,
  `licenseplate` varchar(20) NOT NULL,
  `licenseplate_pdf` text NOT NULL,
  `id` int(11) unsigned NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=274 DEFAULT CHARSET=latin1 PACK_KEYS=1;


--
-- Indexes for dumped tables
--

--
-- Indexes for table `csw_dhl_ship_details`
--
ALTER TABLE `csw_dhl_ship_details`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `csw_dhl_ship_details`
--
ALTER TABLE `csw_dhl_ship_details`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=274;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
