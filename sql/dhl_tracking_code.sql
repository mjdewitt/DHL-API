
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;



-- --------------------------------------------------------

--
-- Table structure for table `dhl_tracking_code`
--

CREATE TABLE IF NOT EXISTS `dhl_tracking_code` (
  `track_cde` char(2) NOT NULL,
  `track_desc` char(40) NOT NULL,
  `has_detail` char(1) DEFAULT NULL,
  `id` int(11) unsigned NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=latin1 PACK_KEYS=1;

--
-- Dumping data for table `dhl_tracking_code`
--

INSERT INTO `dhl_tracking_code` (`track_cde`, `track_desc`, `has_detail`, `id`) VALUES
('AD', 'Agreed delivery', '', 2),
('AF', 'Arrived facility', '1', 3),
('AR', 'Arrival in delivery facility', '1', 4),
('BA', 'Bad address', '', 5),
('BL', 'Bond location', '', 6),
('BN', 'Customer broker notified', '', 7),
('BR', 'Broker release', '', 8),
('CA', 'Closed on arrival', '', 9),
('CC', 'Awaiting cnee collection', '', 10),
('CD', 'Controllable clearance delay', '', 11),
('CI', 'Facility check-in', '', 12),
('CM', 'Customer moved', '', 13),
('CR', 'Clearance release', '1', 14),
('CS', 'Closed shipment', '', 15),
('CU', 'Confirm uplift', '', 16),
('DD', 'Delivered damaged', '', 17),
('DF', 'Depart facility', '1', 18),
('DI', 'Duty invoice', '', 19),
('DM', 'Damaged', '', 20),
('DP', 'Denied parties', '', 21),
('DS', 'Destroyed / disposal', '', 22),
('ES', 'Entry submitted', '', 23),
('FD', 'Forward destination (DD''s expected)', '', 24),
('HI', 'Lodged into hic', '', 25),
('HN', 'Handover', '', 26),
('HO', 'Lodged out of held inventory control', '', 27),
('HP', 'Held for payment', '', 28),
('IA', 'Image available', '', 29),
('IC', 'In clearance processing', '', 30),
('IR', 'Incorrect route', '', 31),
('LV', 'Load vehicle', '', 32),
('MC', 'Miscode', '', 33),
('MD', 'Missed delivery cycle', '', 34),
('MS', 'Mis-sort', '', 35),
('NA', 'Not arrived', '', 36),
('ND', 'Not delivered', '', 37),
('NH', 'Not home', '', 38),
('OH', 'On hold', '', 39),
('OK', 'Delivery', '', 40),
('PD', 'Partial delivery', '', 41),
('PL', 'Processed at location', '1', 42),
('PU', 'Shipment pick up', '', 43),
('PY', 'Payment', '', 44),
('RD', 'Refused delivery', '', 45),
('RR', 'Response received', '', 46),
('RT', 'Returned to consignor', '', 47),
('RW', 'Weigh & dimension', '', 48),
('SA', 'Shipment acceptance', '', 49),
('SC', 'Service changed', '', 50),
('SI', 'Shipment inspection', '', 51),
('SM', 'Scheduled movement', '', 52),
('SS', 'Shipment stopped', '', 53),
('ST', 'Shipment intercept', '', 54),
('TD', 'Transport delay', '', 55),
('TI', 'Trace initiated', '', 56),
('TP', 'Forwarded to 3rd party - no DD''s', '', 57),
('TR', 'Record of transfer', '1', 58),
('TT', 'Trace terminated', '', 59),
('UD', 'Uncontrollable clearance delay', '', 60),
('UV', 'Unload vehicle', '', 61),
('WC', 'With delivering courier', '', 62),
('DU', 'Shipment information received', '', 63);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dhl_tracking_code`
--
ALTER TABLE `dhl_tracking_code`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `dhl_tracking_code`
--
ALTER TABLE `dhl_tracking_code`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=64;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
