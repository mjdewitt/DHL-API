
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;


-- --------------------------------------------------------

--
-- Table structure for table `cswdelivery_dhl_activity`
--

CREATE TABLE IF NOT EXISTS `cswdelivery_dhl_activity` (
  `id` int(11) NOT NULL,
  `subs_num` int(11) DEFAULT NULL,
  `invoice` int(11) DEFAULT NULL,
  `tracking` char(30) NOT NULL,
  `confirmation` int(11) DEFAULT NULL,
  `description` varchar(256) DEFAULT NULL,
  `activity_date` datetime DEFAULT NULL,
  `estimated_delivery_date` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;


--
-- Indexes for dumped tables
--

--
-- Indexes for table `cswdelivery_dhl_activity`
--
ALTER TABLE `cswdelivery_dhl_activity`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subs_num` (`subs_num`),
  ADD KEY `invoice` (`invoice`),
  ADD KEY `confirmation` (`confirmation`),
  ADD KEY `invoice_2` (`invoice`),
  ADD KEY `delivery_date` (`activity_date`),
  ADD KEY `tracking` (`tracking`),
  ADD KEY `tracking_2` (`tracking`),
  ADD KEY `tracking_3` (`tracking`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cswdelivery_dhl_activity`
--
ALTER TABLE `cswdelivery_dhl_activity`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=36;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
