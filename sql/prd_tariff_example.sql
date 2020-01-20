
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;



-- --------------------------------------------------------

--
-- Table structure for table `prd_tariff`
--

CREATE TABLE IF NOT EXISTS `prd_tariff` (
  `prd_cde` varchar(8) DEFAULT NULL,
  `prd_desc` varchar(55) NOT NULL,
  `tariff_cde` varchar(20) NOT NULL,
  `tariff_desc` varchar(40) NOT NULL,
  `origin` char(2) NOT NULL,
  `schedule_b` char(15) DEFAULT NULL,
  `mult` int(11) NOT NULL,
  `weight_g` decimal(10,2) NOT NULL,
  `h_in` float NOT NULL,
  `w_in` float NOT NULL,
  `d_in` float NOT NULL,
  `h_cm` float NOT NULL,
  `w_cm` float NOT NULL,
  `d_cm` float NOT NULL,
  `id` int(11) unsigned NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=latin1 PACK_KEYS=1;

--
-- Dumping data for table `prd_tariff`
--

INSERT INTO `prd_tariff` (`prd_cde`, `prd_desc`, `tariff_cde`, `tariff_desc`, `origin`, `schedule_b`, `mult`, `weight_g`, `h_in`, `w_in`, `d_in`, `h_cm`, `w_cm`, `d_cm`, `id`) VALUES
('ABAN    ', 'Banner                                            ', '3926.40.00     ', 'Vinyl Banner                  ', 'US', '3926.40.0000', 1, 362.24, 24, 72, 0, 60, 180, 0, 1),
('ABC     ', 'Ball Cap                                          ', '6504.00.30   ', 'Cotton Hat                    ', 'US', '6504.00.0000', 1, 85.05, 0, 0, 0, 0, 0, 0, 2),
('ACOA    ', 'Certificates of Appreciation                      ', '4911.99.80     ', 'Paper Certificate             ', 'US', '4911.99.0000', 15, 13.61, 8.5, 11, 0, 21.25, 27.5, 0, 3),
('AFIC    ', 'Coasters                                          ', '4911.99.00   ', 'Paper Drink Coaster           ', 'US', '4911.99.0000', 10, 7.37, 4, 4, 0, 10, 10, 0, 4),
('AFPUZZ  ', 'Fidget Puzzle                                     ', '9503.00.00     ', 'Wood Shape Puzzle             ', 'CN', '9503.00.0000', 5, 105.46, 0, 0, 0, 0, 0, 0, 5),
('AGBAG   ', 'Gift Bags                                         ', '4819.40.00     ', 'Paper Gift Bags               ', 'US', '4819.40.0040', 10, 36.57, 8.5, 10, 0, 21.25, 25, 0, 6),
('ALB     ', 'Latex Balloons                                    ', '9503.00.00', 'Latex Balloon                 ', 'US', '9503.00.0000', 15, 4.54, 0, 0, 0, 0, 0, 0, 7),
('ALC     ', 'To-Go Container                                   ', '3923.90.00     ', 'Plastic (pp) Food Container        ', 'CN', '3923.90.0000', 1, 166.32, 0, 0, 0, 0, 0, 0, 8),
('ALP     ', 'Logo Pins                                         ', '7117.19.00   ', 'Base Metal And Plastic Apparel Pin ', 'US', '7117.19.0000', 10, 3.12, 0, 0, 0, 0, 0, 0, 9),
('ALT     ', 'Lunch Bag                                         ', '4202.92.0807   ', 'Polyester Bag                 ', 'CN', '4202.92.0500', 1, 170.10, 9, 6.5, 6, 22.5, 16.25, 15, 10),
('AM      ', 'Coffee-House Mug                                  ', '6911.10.45     ', 'Ceramic Cup                   ', 'CN', '6911.10.5500', 1, 337.36, 0, 0, 0, 0, 0, 0, 11),
('AMB     ', 'Foil Balloons                                     ', '9503.00.00     ', 'Mylar Balloon                 ', 'US', '9503.00.0000', 5, 19.96, 0, 0, 0, 0, 0, 0, 12),
('AMEMO   ', 'Note Pads                                         ', '4820.10.20     ', 'Paper Note Pad                ', 'US', '4820.10.0000', 10, 94.12, 8.125, 3.25, 0, 20.313, 8.125, 0, 13),
('AMMI    ', 'Monitor Mirrors                                   ', '7009.92.10     ', 'Glass and Plastic (PS) Mirror', 'CN', '7009.92.0000', 5, 62.37, 0, 0, 0, 0, 0, 0, 14),
('ANMM    ', 'The Napkin, the Melon & the Monkey Gift Set       ', '4901.99.0075   ', 'Book Set                      ', 'US', '4901.99.0075', 1, 204.12, 0, 0, 0, 0, 0, 0, 15),
('AOIAB   ', 'Office in a Box                                   ', '8305.90.30     ', 'Paperclips, Staples, Stapler  ', 'CN', '8305.90.0000', 1, 90.72, 22, 34, 0, 55, 85, 0, 16),
('AP      ', 'Poster                                            ', '4911.99.80     ', 'Paper Poster                  ', 'US', '4911.99.0000', 1, 54.43, 0, 0, 0, 0, 0, 0, 17),
('APCUBE  ', 'ServiceBot Puzzle                                 ', '9503.00.00     ', 'Wood Robot Puzzle             ', 'CN', '9503.00.0000', 1, 136.08, 0, 0, 0, 0, 0, 0, 18),
('APEN    ', 'Pennant Strings                                   ', '3926.40.00     ', 'Vinyl Pennant                 ', 'US', '3926.40.0000', 1, 337.36, 12, 201, 0, 30, 502.5, 0, 19),
('APG     ', 'Photo Snow Globe                                  ', '3924.90.20     ', 'Plastic (ABS) Globe Toy             ', 'CN', '3924.90.2000', 1, 352.79, 0, 0, 0, 0, 0, 0, 20),
('APPS    ', 'Pen & Pencil Set                                  ', '9608.10.00     ', 'Plastic (PP) Pen Set         ', 'CN', '9608.10.0000', 5, 48.38, 0, 0, 0, 0, 0, 0, 21),
('APRC    ', 'Presentation Cards                                ', '4911.99.00     ', 'Paper Card                    ', 'US', '4911.99.0000', 10, 5.39, 4.5, 6.5, 0, 11.25, 16.25, 0, 22),
('ARCUP   ', 'Flip-Straw Bottle                                 ', '3924.10.00     ', 'Plastic (PETE1) Cup With Straw          ', 'CN', '3924.10.0002', 1, 99.79, 0, 0, 0, 0, 0, 0, 23),
('ASA     ', 'Service Award                                     ', '3926.40.00     ', 'Plastic (ABA)  Award                 ', 'US', '3926.40.0000', 1, 374.21, 0, 0, 0, 0, 0, 0, 24),
('ASB1    ', 'Bead-Filled Stress Balls                          ', '9503.00.00     ', 'Plastic Ball Toy              ', 'CN', '9503.00.0000', 5, 145.15, 0, 0, 0, 0, 0, 0, 25),
('ASNP    ', 'Sticky Note Packs                                 ', '4820.10.20     ', 'Paper Pad                     ', 'US', '4820.10.0000', 10, 73.71, 3, 2, 0, 7.5, 5, 0, 26),
('ASOC    ', 'Scratch Off Cards                                 ', '9503.00.00    ', 'Paper Card Game               ', 'US', '9503.00.0000', 25, 1.72, 3.5, 2.25, 0, 8.75, 5.625, 0, 27),
('ASP     ', 'Sign Pack                                         ', '4911.99.00    ', 'Paper Signs                   ', 'US', '4911.99.0000', 15, 17.20, 8, 12.5, 0, 20, 31.25, 0, 28),
('AT0002  ', 'Time-Out Timer                                    ', '9503.00.00     ', 'Plastic (ABS) Toy Timer             ', 'CN', '9503.00.0000', 1, 122.47, 0, 0, 0, 0, 0, 0, 29),
('ATBD    ', 'Wristbands                                        ', '3926.20.50     ', 'Silicone Apparel              ', 'US', '3926.20.5000', 10, 8.50, 0, 0, 0, 0, 0, 0, 30),
('ATIOP1  ', 'Two-in-One Pens                                   ', '9608.10.00     ', 'Plastic (ABS+AS) Pen               ', 'CN', '9608.10.0000', 10, 11.06, 0, 0, 0, 0, 0, 0, 31),
('ATL     ', 'T-Shirt L                                         ', '6205.20.20     ', 'Cotton Shirt Size Large       ', 'US', '6205.20.3000', 1, 215.20, 0, 0, 0, 0, 0, 0, 32),
('ATM     ', 'T-Shirt M                                         ', '6205.20.20      ', 'Cotton Shirt Size Medium      ', 'US', '6205.20.3000', 1, 214.20, 0, 0, 0, 0, 0, 0, 33),
('ATMUG   ', 'Auto Mug                                          ', '3924.10.00     ', 'Plastic (PP)/Steel Cup       ', 'CN', '3924.10.0002', 1, 181.44, 0, 0, 0, 0, 0, 0, 34),
('ATOB    ', 'Tote Bag                                          ', '4202.92.10    ', 'Polyester Bag                 ', 'CN', '4202.92.7000', 1, 272.16, 20, 13.5, 5.5, 50, 33.75, 13.75, 35),
('ATXL    ', 'T-Shirt XL                                        ', '6205.20.20      ', 'Cotton Shirt Size XL', 'US', '6205.20.3000', 1, 216.20, 0, 0, 0, 0, 0, 0, 36),
('ATXXL   ', 'T-Shirt XXL                                       ', '6205.20.20     ', 'Cotton Shirt Size XXL   ', 'US', '6205.20.3000', 1, 218.20, 0, 0, 0, 0, 0, 0, 37),
('ATXXXL  ', 'T-Shirt XXXL                                      ', '6205.20.20     ', 'Cotton Shirt Size XXXL     ', 'US', '6205.20.3000', 1, 220.20, 0, 0, 0, 0, 0, 0, 38),
('ATYC    ', 'Thank-You Cards                                   ', '4911.99.80     ', 'Paper Greeting Card           ', 'US', '4911.99.0000', 25, 15.65, 5, 7, 0, 12.5, 17.5, 0, 39),
('AVP1    ', 'Velvet Pouches                                    ', '4202.92.10     ', 'Polyester Pen Cover           ', 'CN', '4202.92.7000', 10, 3.40, 0, 0, 0, 0, 0, 0, 40),
('AYOGAW  ', 'Yoga at Your Desk                                 ', '4901.99.0075   ', 'Paper Booklet                 ', 'US', '4901.99.0075', 10, 34.02, 0, 0, 0, 0, 0, 0, 41),
('ARSR ', 'Rabbit Stress Reliever ', '9503.00.00', 'Plastic Squeeze Toy              ', 'CN', '9503.00.00', 5, 26.00, 4, 2, 2, 10.1, 5.1, 5.1, 42),
('AM8B ', 'Magic Ball ', '9503.00.00', 'Plastic Toy              ', 'CN', '9503.00.00', 1, 121.00, 3.25, 3.25, 3.25, 8.3, 8.3, 8.3, 43),
('AMWP ', 'Magic Wand Pen ', '9608.10.00     ', 'Plastic (PP) Pen ', 'US', '9608.10.00', 10, 11.00, 0, 0, 0, 0, 0, 0, 44),
('AMC1 ', 'Magic Cube ', '9503.00.00     ', 'Plastic Puzzle Toy             ', 'CN', '9503.00.00', 1, 105.00, 2.75, 2.75, 2.75, 6.985, 6.985, 6.985, 45),
('APP3 ', 'Spirit Pennants ', '3926.40.00', 'Wood and Felt Fabric Pennant', 'US', '3926.40.00', 10, 8.50, 8, 18, 0.2, 20.32, 45.72, 0.381, 46),
('ACP ', 'Coloring Poster  ', '4911.99.00 ', 'Paper Sign and Pencils', 'US', '4911.99.0000', 1, 220.00, 11, 34, 0.02, 27.94, 86.36, 0.0508, 47),
('ACSTG01W', 'Big Book of Customer Service Training Games ', '4901.99.0075', 'Book', 'US', '4901.99.0075', 1, 386.00, 0, 0, 0, 0, 0, 0, 48),
('ATMG01W', 'Big Book of Team Motivating Games ', '4901.99.0075', 'Book', 'US', '4901.99.0075', 1, 340.00, 0, 0, 0, 0, 0, 0, 49),
('AVTBG01W', 'Big Book of Virtual Team Building Games ', '4901.99.0075', 'Book', 'US', '4901.99.0075', 1, 431.00, 0, 0, 0, 0, 0, 0, 50);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `prd_tariff`
--
ALTER TABLE `prd_tariff`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `prd_tariff`
--
ALTER TABLE `prd_tariff`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=51;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
