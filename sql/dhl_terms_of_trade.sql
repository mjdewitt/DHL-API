
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;


-- --------------------------------------------------------

--
-- Table structure for table `dhl_terms_of_trade`
--

CREATE TABLE IF NOT EXISTS `dhl_terms_of_trade` (
  `trade_cde` char(3) NOT NULL,
  `trade_desc` varchar(15) NOT NULL,
  `definition` text NOT NULL,
  `id` int(11) unsigned NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1 PACK_KEYS=1;

--
-- Dumping data for table `dhl_terms_of_trade`
--

INSERT INTO `dhl_terms_of_trade` (`trade_cde`, `trade_desc`, `definition`, `id`) VALUES
('EXW', 'Ex Works', 'The seller''s only obligation is to make the goods available at its premises or at another named place (works, factory, warehouse, etc.). The buyer bears all costs and risks involved in taking the goods from the seller''s premises to the desired destination. This term represents the minimum obligation for the seller.', 2),
('FCA', 'Free Carrier', 'The seller''s obligation is to hand over the goods, cleared for export, into the charge of the carrier named by the buyer at the named place or point. The parties are advised to specify as clearly as possible the point within the named place of delivery, as the risk passes to the buyer at that point.', 3),
('CPT', 'Carriage Paid T', 'The seller pays the freight for the delivery of goods to the carrier or to another person nominated by the seller at the named destination. Once delivered, the risk of loss or damage to the goods is transferred from the seller to the buyer. This term requires the seller to clear the goods for export.', 4),
('CFR', 'CFR Cost and Fr', 'Cost and Freight means that the seller delivers the goods on board the vessel or procures the goods already so delivered. The risk of loss of or damage to the goods passes when the goods are on board the vessel. the seller must contract for and pay the costs and freight necessary to bring the goods to the named port of destination.', 5),
('CIP', 'Carriage and In', 'The seller has the same obligations as under CPT but has the responsibility of obtaining insurance against the buyer''s risk of loss or damage to goods during carriage. Insurance only needs to be obtained at minimum coverage and the seller is required to clear the goods for export.', 6),
('CIF', 'CIF Cost, Insur', 'Cost, Insurance and Freight means that the seller delivers the goods on board the vessel or procures the goods already so delivered. The risk of loss of or damage to the goods passes when the goods are on board the vessel. The seller must contract for and pay the costs and freight necessary to bring the goods to the named port of destination.\n\n?The seller also contracts for insurance cover against the buyer?s risk of loss of or damage to the goods during the carriage. The buyer should note that under CIF the seller is required to obtain insurance only on minimum cover. Should the buyer wish to have more insurance protection, it will need either to agree as much expressly with the seller or to make its own extra insurance arrangements.?', 7),
('DAT', 'Delivered At Te', 'The seller delivers when the goods, once unloaded from the arriving means of transport, are placed at the disposal of the buyer at a named terminal at the named port or place of destination. Terminal includes quay, warehouse, container yard or road, rail or air terminal. The seller is responsible for the export clearance procedures and the importer is responsible for clearing the goods for import, arranging import customs formalities, and paying import duty.', 8),
('DAP', 'Delivered At Pl', 'The seller delivers when the goods are placed at the disposal of the buyer on the arriving means of transport ready for unloading at the named place of destination. The seller is required to clear the goods for export and the importer is responsible for effecting customs clearance, and paying any customs duties.', 9),
('DDP', 'Delivered Duty ', 'The seller is responsible for delivering the goods to the named place in the country of importation, including all costs and risks in bringing the goods to import destination. This includes all export and import duties, taxes and customs formalities.', 10),
('FAS', 'FAS Free Alongs', 'Free Alongside Ship means that the seller delivers when the goods are placed alongside the vessel (e.g., on a quay or a barge) nominated by the buyer at the named port of shipment. The risk of loss of or damage to the goods passes when the goods are alongside the ship, and the buyer bears all costs from that moment onwards.', 11),
('FOB', 'FOB Free On Boa', 'Free On Board means that the seller delivers the goods on board the vessel nominated by the buyer at the named port of shipment or procures the goods already so delivered. The risk of loss of or damage to the goods passes when the goods are on board the vessel, and the buyer bears all costs from that moment onwards.', 12);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dhl_terms_of_trade`
--
ALTER TABLE `dhl_terms_of_trade`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `dhl_terms_of_trade`
--
ALTER TABLE `dhl_terms_of_trade`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
