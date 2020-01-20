
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;



-- --------------------------------------------------------

--
-- Table structure for table `dhl_quantity_unit`
--

CREATE TABLE IF NOT EXISTS `dhl_quantity_unit` (
  `unit_cde` char(3) NOT NULL,
  `unit_desc` varchar(40) NOT NULL,
  `id` int(11) unsigned NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1 PACK_KEYS=1;

--
-- Dumping data for table `dhl_quantity_unit`
--

INSERT INTO `dhl_quantity_unit` (`unit_cde`, `unit_desc`, `id`) VALUES
('UOM', 'Description', 1),
('BOX', 'Boxes', 2),
('2GM', 'Centigram', 3),
('2M', 'Centimeters', 4),
('2M3', 'Cubic Centimeters', 5),
('3M3', 'Cubic Feet', 6),
('M3', 'Cubic Meters', 7),
('DPR', 'Dozen Pairs', 8),
('DOZ', 'Dozen', 9),
('2NO', 'Each', 10),
('PCS', 'Pieces', 11),
('GM', 'Grams', 12),
('GRS', 'Gross', 13),
('KG', 'Kilograms', 14),
('L', 'Liters', 15),
('M', 'Meters', 16),
('3GM', 'Milligrams', 17),
('3L', 'Milliliters', 18),
('X', 'No Unit Required', 19),
('NO', 'Number', 20),
('2KG', 'Ounces', 21),
('PRS', 'Pairs', 22),
('2L', 'Gallons', 23),
('3KG', 'Pounds', 24),
('CM2', 'Square Centimeters', 25),
('2M2', 'Square Feet', 26),
('3M2', 'Square Inches', 27),
('M2', 'Square Meters', 28),
('4M2', 'Square Yards', 29),
('3M', 'Yards', 30);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dhl_quantity_unit`
--
ALTER TABLE `dhl_quantity_unit`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `dhl_quantity_unit`
--
ALTER TABLE `dhl_quantity_unit`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=31;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
