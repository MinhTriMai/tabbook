-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 05, 2018 at 08:44 AM
-- Server version: 10.1.25-MariaDB
-- PHP Version: 7.1.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tt_koparion`
--

-- --------------------------------------------------------

--
-- Table structure for table `oc_address`
--

DROP TABLE IF EXISTS `oc_address`;
CREATE TABLE `oc_address` (
  `address_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `company` varchar(40) NOT NULL,
  `address_1` varchar(128) NOT NULL,
  `address_2` varchar(128) NOT NULL,
  `city` varchar(128) NOT NULL,
  `postcode` varchar(10) NOT NULL,
  `country_id` int(11) NOT NULL DEFAULT '0',
  `zone_id` int(11) NOT NULL DEFAULT '0',
  `custom_field` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_address`
--

INSERT INTO `oc_address` (`address_id`, `customer_id`, `firstname`, `lastname`, `company`, `address_1`, `address_2`, `city`, `postcode`, `country_id`, `zone_id`, `custom_field`) VALUES
(1, 1, 'Plaza', 'Themes', '', 'NewYork', '', 'NewYork', '100000', 222, 3513, '');

-- --------------------------------------------------------

--
-- Table structure for table `oc_api`
--

DROP TABLE IF EXISTS `oc_api`;
CREATE TABLE `oc_api` (
  `api_id` int(11) NOT NULL,
  `username` varchar(64) NOT NULL,
  `key` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_api`
--

INSERT INTO `oc_api` (`api_id`, `username`, `key`, `status`, `date_added`, `date_modified`) VALUES
(1, 'Default', '2MO4q9MfHswsfZffaru1kmLDK82v6rVq4fdU96ddiscC2VHTYgEXpLOavW0xvMzwDGKa10m8oVOciPpYTHxIFUamSZ74qQhrIST3caO2cKL9LEbw3aYvTxsNcPmof8sql4Qs0VqW104OHlsLZ9dWiNt7X9vXJGQKHYcDnxtczpnWiEz57hsCnY3Cjp31P2KNJoatneCEo2EHl9GutCbSRP7J11FWiDiYWOhi9zrsooA1D4H3ZqpS2R1khAFUnchl', 1, '2017-08-09 08:06:18', '2017-08-09 08:06:18'),
(2, 'Default', 'Ig3NNTuFvEHQedSNII0ug79RFSFZLTm9catDwGJ60cYN0Xib2jOdqBkU2Qtb9jpoll6bvgnleZptiM9GCSJXwKpbgdFiEECNxAZZJw8YBlfeZ4FHg13WV4bkQ0wdKz9wgflUBecgEwBFSicx3ErfRAphdEBceyg6x8QlppAoNqbUD4dQTatePgotTW9Orxg2prCqoiIrpBBaRPuxqs4L2CboV49vFdqhoBKbDpIvC0a30NuW9PRxEdjSNmIS7qfN', 1, '2017-08-29 01:53:28', '2017-08-29 01:53:28'),
(3, 'Default', 'zBZwCMZvF47Ee5GvSfYzdw9oqYphVJs3WAaZya8ozazRelqb9TysJ5LHjrxkaFjumYM2FR9Zy5XzBgMuNZdvYwaQ6di4NfJTYezsHXpdYy0ZJjYybKb07AxUbFANIl1vCmxmItVNg6eK1z8PULD74rmzS9vWR1ci2Z1S7HBbRXpT77uCD2GkL4LzL6BKYVYhM4Nqs97deVigfPT0Gj3weEvFlZJp9LUrw2tx4KVgdHZ2Pq818KTa1XtCfukL5bjK', 1, '2017-09-22 07:11:13', '2017-09-22 07:11:13'),
(4, 'Default', 'yC0pdPU1B4ALd2tjfmK5GXtlTEz6R1xoAw0adthNeA93GrSAoplnaSx87FQjifQ7BBSv7rmH6bdDeUM4x98EVxBmxYgna9J56pfulKXcd4Uv0ROFZc8AgAB7uTSBID5Dol0LlcDaUY7XQ4Eqzn6YhvT0rycQx4LDUTKZXpvOuIXjUQD6K4ISyQb7cOfBJcxYx8UPw7Wpi5NCD3leIUFwiRjmWxjZ38TwSblp510loMQ8WeO4h3k1oNERYVAzj5Kq', 1, '2017-10-09 01:45:40', '2017-10-09 01:45:40'),
(5, 'Default', 'nup3M7hOeoniKTxsr2pDPXfzLFxwntRyicNmPXttS6vasFu68BJUd2spcmFeUQoK0bC6BAo7K72uA5xX6ttNO1fshNKq6ULhOEHMeLdPa0NLimcUNxLMrm63NhkoAN4dRG6pJOqVCjsAgdBVZqWVmXcAqcrSbwDweH9wk9IFhAlpFQb79xnKut7TNXdaeZZ0D6UDM9X8d85eENNhTjcMNt2wyASDEvCjNeuEt0hhtxHy9fGr84weHRMjXIRZwjiP', 1, '2017-10-25 07:52:32', '2017-10-25 07:52:32'),
(6, 'Default', 'myQmpw8nlj52s3UtsjtImZpYBjjR9on3tpPZ25jf3bWUS6M0SiZYYVkRDRwyRIfJkjME3XuXChFhK5NfEju3MUPWFRJIOf4ewi4vizwhX2J4LG0nL40lSFkH8VAJHPkstndES6J8zZ4URyXBvBvSYHoZJW6TNlmrPRGQtc6pzllvG7SQQXGoubking4IPoSHc9BSw34xvZc2EjxiAIhGiua4hQKEOH0rLvG2eOS9Pia8rPm1tBBSGJU5G6qWrnl7', 1, '2017-11-13 01:46:59', '2017-11-13 01:46:59'),
(7, 'Default', 'i19wGyfLO3VVPCC5QbHgOPbGwKLJBra1OFYD6QgAIgPMUiS4SG7YgOe6ndisLiUdsOVsqjMJj7l9Dx83iUBJs6UeJVNqEQyzdPu8XkOOm2vTkvswWelZTSsomiEnKBVsIQ6TdBPiWnezT1sZaASDoiOUlnszXWDYxfEDDtRUg6TiLJgJlD1gNdXCBu04gWwG1mlxm5bKkCsOnIWWKJxCyZ4oLanXaV9jhadQr8znaUXIwfgOpx87vjGl7ZCasEda', 1, '2017-12-04 07:55:01', '2017-12-04 07:55:01');

-- --------------------------------------------------------

--
-- Table structure for table `oc_api_ip`
--

DROP TABLE IF EXISTS `oc_api_ip`;
CREATE TABLE `oc_api_ip` (
  `api_ip_id` int(11) NOT NULL,
  `api_id` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_api_ip`
--

INSERT INTO `oc_api_ip` (`api_ip_id`, `api_id`, `ip`) VALUES
(1, 2, '127.0.0.1');

-- --------------------------------------------------------

--
-- Table structure for table `oc_api_session`
--

DROP TABLE IF EXISTS `oc_api_session`;
CREATE TABLE `oc_api_session` (
  `api_session_id` int(11) NOT NULL,
  `api_id` int(11) NOT NULL,
  `session_id` varchar(32) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_api_session`
--

INSERT INTO `oc_api_session` (`api_session_id`, `api_id`, `session_id`, `ip`, `date_added`, `date_modified`) VALUES
(4, 5, '38db99aaf2945ad1bf2c83d7db', '127.0.0.1', '2017-11-01 14:27:51', '2017-11-01 14:27:51'),
(5, 5, 'e38fb2c0e44f9359607cbaaf03', '127.0.0.1', '2017-11-01 14:27:57', '2017-11-01 14:27:57');

-- --------------------------------------------------------

--
-- Table structure for table `oc_article`
--

DROP TABLE IF EXISTS `oc_article`;
CREATE TABLE `oc_article` (
  `article_id` int(11) NOT NULL,
  `sort_order` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `author` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_article`
--

INSERT INTO `oc_article` (`article_id`, `sort_order`, `status`, `date_added`, `date_modified`, `image`, `author`) VALUES
(5, 1, 1, '2017-10-30 08:58:18', '2017-12-12 13:51:28', 'catalog/blog/blog1_3.jpg', 'Plaza Themes'),
(6, 1, 1, '2017-10-30 08:59:16', '2017-12-12 13:51:53', 'catalog/blog/blog2_4.jpg', 'Plaza Themes'),
(7, 1, 1, '2017-10-30 09:00:11', '2017-12-12 13:52:11', 'catalog/blog/blog3_3.jpg', 'Plaza Themes'),
(8, 1, 1, '2017-10-30 09:01:02', '2017-12-12 13:52:28', 'catalog/blog/blog2_4.jpg', 'Plaza Themes');

-- --------------------------------------------------------

--
-- Table structure for table `oc_article_description`
--

DROP TABLE IF EXISTS `oc_article_description`;
CREATE TABLE `oc_article_description` (
  `article_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `intro_text` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_article_description`
--

INSERT INTO `oc_article_description` (`article_id`, `language_id`, `name`, `description`, `intro_text`, `meta_title`, `meta_description`, `meta_keyword`) VALUES
(5, 1, 'Summer House Guests - Featuring K250 Oasis Brewer', '&lt;p&gt;Virtual reality and 3-D technology are already well-established in the entertainment industry. Now, the fashion industry is not-so-slowly adopting the same cutting-edge tech in its eternal quest for something new and different. Designer Iris van Herpen has long been experimenting with 3-D printing and Tommy Hilfiger introduced virtual reality headsets to his stores to let shoppers experience the runway show. Even Sephora has a new version of its app that allows you to “try on” makeup virtually.&lt;/p&gt;', '&lt;p&gt;We’re so excited! Our friend Kate from Domestikated Life  is back and sharing gorgeous photos...&lt;/p&gt;', 'post1', '', ''),
(5, 9, 'Summer House Guests - Featuring K250 Oasis Brewer', '&lt;p&gt;Virtual reality and 3-D technology are already well-established in the entertainment industry. Now, the fashion industry is not-so-slowly adopting the same cutting-edge tech in its eternal quest for something new and different. Designer Iris van Herpen has long been experimenting with 3-D printing and Tommy Hilfiger introduced virtual reality headsets to his stores to let shoppers experience the runway show. Even Sephora has a new version of its app that allows you to “try on” makeup virtually.&lt;/p&gt;', '&lt;p&gt;We’re so excited! Our friend Kate from Domestikated Life  is back and sharing gorgeous photos...&lt;/p&gt;', 'post1', '', ''),
(6, 1, 'Summer House Guests - Featuring K250 Oasis Brewer', '&lt;p&gt;Maria Denardo is the Fashion Director at theFashionSpot. Prior to joining tFS, she worked as the Site Director at Lifestyle Mirror and the Senior Fashion Editor at Fashion Week Daily. Her &quot;unhealthy attachment&quot; to hats led her to the halls of FIT, where she\'s currently completing her millinery certification. She proves that turbans never, ever go out of style.&lt;/p&gt;', '&lt;p&gt;We’re so excited! Our friend Kate from Domestikated Life  is back and sharing gorgeous photos...&lt;/p&gt;', 'post2', '', ''),
(6, 9, 'Summer House Guests - Featuring K250 Oasis Brewer', '&lt;p&gt;Maria Denardo is the Fashion Director at theFashionSpot. Prior to joining tFS, she worked as the Site Director at Lifestyle Mirror and the Senior Fashion Editor at Fashion Week Daily. Her &quot;unhealthy attachment&quot; to hats led her to the halls of FIT, where she\'s currently completing her millinery certification. She proves that turbans never, ever go out of style.&lt;/p&gt;', '&lt;p&gt;We’re so excited! Our friend Kate from Domestikated Life  is back and sharing gorgeous photos...&lt;/p&gt;', 'post2', '', ''),
(7, 1, 'Summer House Guests - Featuring K250 Oasis Brewer', '&lt;p&gt;Maria Denardo is the Fashion Director at theFashionSpot. Prior to joining tFS, she worked as the Site Director at Lifestyle Mirror and the Senior Fashion Editor at Fashion Week Daily. Her &quot;unhealthy attachment&quot; to hats led her to the halls of FIT, where she\'s currently completing her millinery certification. She proves that turbans never, ever go out of style.&lt;/p&gt;', '&lt;p&gt;We’re so excited! Our friend Kate from Domestikated Life  is back and sharing gorgeous photos...&lt;/p&gt;', 'post3', '', ''),
(7, 9, 'Summer House Guests - Featuring K250 Oasis Brewer', '&lt;p&gt;Maria Denardo is the Fashion Director at theFashionSpot. Prior to joining tFS, she worked as the Site Director at Lifestyle Mirror and the Senior Fashion Editor at Fashion Week Daily. Her &quot;unhealthy attachment&quot; to hats led her to the halls of FIT, where she\'s currently completing her millinery certification. She proves that turbans never, ever go out of style.&lt;/p&gt;', '&lt;p&gt;We’re so excited! Our friend Kate from Domestikated Life  is back and sharing gorgeous photos...&lt;/p&gt;', 'post3', '', ''),
(8, 1, 'Summer House Guests - Featuring K250 Oasis Brewer', '&lt;p&gt;Virtual reality and 3-D technology are already well-established in the entertainment industry. Now, the fashion industry is not-so-slowly adopting the same cutting-edge tech in its eternal quest for something new and different. Designer Iris van Herpen has long been experimenting with 3-D printing and Tommy Hilfiger introduced virtual reality headsets to his stores to let shoppers experience the runway show. Even Sephora has a new version of its app that allows you to “try on” makeup virtually.&lt;/p&gt;', '&lt;p&gt;We’re so excited! Our friend Kate from Domestikated Life  is back and sharing gorgeous photos...&lt;/p&gt;', 'post4', '', ''),
(8, 9, 'Summer House Guests - Featuring K250 Oasis Brewer', '&lt;p&gt;Virtual reality and 3-D technology are already well-established in the entertainment industry. Now, the fashion industry is not-so-slowly adopting the same cutting-edge tech in its eternal quest for something new and different. Designer Iris van Herpen has long been experimenting with 3-D printing and Tommy Hilfiger introduced virtual reality headsets to his stores to let shoppers experience the runway show. Even Sephora has a new version of its app that allows you to “try on” makeup virtually.&lt;/p&gt;', '&lt;p&gt;We’re so excited! Our friend Kate from Domestikated Life  is back and sharing gorgeous photos...&lt;/p&gt;', 'post4', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `oc_article_list`
--

DROP TABLE IF EXISTS `oc_article_list`;
CREATE TABLE `oc_article_list` (
  `article_list_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_article_list`
--

INSERT INTO `oc_article_list` (`article_list_id`, `name`, `status`) VALUES
(1, 'Articles List', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_article_to_list`
--

DROP TABLE IF EXISTS `oc_article_to_list`;
CREATE TABLE `oc_article_to_list` (
  `article_list_id` int(11) NOT NULL,
  `article_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_article_to_list`
--

INSERT INTO `oc_article_to_list` (`article_list_id`, `article_id`) VALUES
(1, 5),
(1, 6),
(1, 7),
(1, 8);

-- --------------------------------------------------------

--
-- Table structure for table `oc_article_to_store`
--

DROP TABLE IF EXISTS `oc_article_to_store`;
CREATE TABLE `oc_article_to_store` (
  `article_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_article_to_store`
--

INSERT INTO `oc_article_to_store` (`article_id`, `store_id`) VALUES
(1, 0),
(1, 1),
(1, 2),
(1, 3),
(2, 0),
(2, 1),
(2, 2),
(2, 3),
(3, 0),
(3, 1),
(3, 2),
(3, 3),
(4, 0),
(4, 1),
(4, 2),
(4, 3),
(5, 0),
(5, 1),
(5, 2),
(5, 3),
(5, 6),
(5, 7),
(6, 0),
(6, 1),
(6, 2),
(6, 3),
(6, 6),
(6, 7),
(7, 0),
(7, 1),
(7, 2),
(7, 3),
(7, 6),
(7, 7),
(8, 0),
(8, 1),
(8, 2),
(8, 3),
(8, 6),
(8, 7);

-- --------------------------------------------------------

--
-- Table structure for table `oc_attribute`
--

DROP TABLE IF EXISTS `oc_attribute`;
CREATE TABLE `oc_attribute` (
  `attribute_id` int(11) NOT NULL,
  `attribute_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_attribute`
--

INSERT INTO `oc_attribute` (`attribute_id`, `attribute_group_id`, `sort_order`) VALUES
(1, 6, 1),
(2, 6, 5),
(3, 6, 3),
(4, 3, 1),
(5, 3, 2),
(6, 3, 3),
(7, 3, 4),
(8, 3, 5),
(9, 3, 6),
(10, 3, 7),
(11, 3, 8);

-- --------------------------------------------------------

--
-- Table structure for table `oc_attribute_description`
--

DROP TABLE IF EXISTS `oc_attribute_description`;
CREATE TABLE `oc_attribute_description` (
  `attribute_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_attribute_description`
--

INSERT INTO `oc_attribute_description` (`attribute_id`, `language_id`, `name`) VALUES
(1, 1, 'Description'),
(2, 1, 'No. of Cores'),
(4, 1, 'test 1'),
(5, 1, 'test 2'),
(6, 1, 'test 3'),
(7, 1, 'test 4'),
(8, 1, 'test 5'),
(9, 1, 'test 6'),
(10, 1, 'test 7'),
(11, 1, 'test 8'),
(3, 1, 'Clockspeed'),
(1, 9, 'Description'),
(2, 9, 'No. of Cores'),
(4, 9, 'test 1'),
(5, 9, 'test 2'),
(6, 9, 'test 3'),
(7, 9, 'test 4'),
(8, 9, 'test 5'),
(9, 9, 'test 6'),
(10, 9, 'test 7'),
(11, 9, 'test 8'),
(3, 9, 'Clockspeed');

-- --------------------------------------------------------

--
-- Table structure for table `oc_attribute_group`
--

DROP TABLE IF EXISTS `oc_attribute_group`;
CREATE TABLE `oc_attribute_group` (
  `attribute_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_attribute_group`
--

INSERT INTO `oc_attribute_group` (`attribute_group_id`, `sort_order`) VALUES
(3, 2),
(4, 1),
(5, 3),
(6, 4);

-- --------------------------------------------------------

--
-- Table structure for table `oc_attribute_group_description`
--

DROP TABLE IF EXISTS `oc_attribute_group_description`;
CREATE TABLE `oc_attribute_group_description` (
  `attribute_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_attribute_group_description`
--

INSERT INTO `oc_attribute_group_description` (`attribute_group_id`, `language_id`, `name`) VALUES
(3, 1, 'Memory'),
(4, 1, 'Technical'),
(5, 1, 'Motherboard'),
(6, 1, 'Processor'),
(3, 9, 'Memory'),
(4, 9, 'Technical'),
(5, 9, 'Motherboard'),
(6, 9, 'Processor');

-- --------------------------------------------------------

--
-- Table structure for table `oc_banner`
--

DROP TABLE IF EXISTS `oc_banner`;
CREATE TABLE `oc_banner` (
  `banner_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_banner`
--

INSERT INTO `oc_banner` (`banner_id`, `name`, `status`) VALUES
(6, 'HP Products', 1),
(7, 'Home Page Slideshow', 1),
(8, 'BrandSlider', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_banner_image`
--

DROP TABLE IF EXISTS `oc_banner_image`;
CREATE TABLE `oc_banner_image` (
  `banner_image_id` int(11) NOT NULL,
  `banner_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  `link` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_banner_image`
--

INSERT INTO `oc_banner_image` (`banner_image_id`, `banner_id`, `language_id`, `title`, `link`, `image`, `sort_order`) VALUES
(79, 7, 1, 'iPhone 6', 'index.php?route=product/product&amp;path=57&amp;product_id=49', 'catalog/demo/banners/iPhone6.jpg', 0),
(87, 6, 1, 'HP Banner', 'index.php?route=product/manufacturer/info&amp;manufacturer_id=7', 'catalog/demo/compaq_presario.jpg', 0),
(80, 7, 1, 'MacBookAir', '', 'catalog/demo/banners/MacBookAir.jpg', 0),
(214, 8, 1, 'br4', '#', 'catalog/brand logo/br8.png', 0),
(213, 8, 1, 'br3', '#', 'catalog/brand logo/br7.png', 0),
(212, 8, 1, 'br2', '#', 'catalog/brand logo/br6.png', 0),
(211, 8, 1, 'br1', '#', 'catalog/brand logo/br5.png', 0),
(210, 8, 1, 'br5', '#', 'catalog/brand logo/br4.png', 0),
(194, 7, 8, 'MacBookAir', '', 'catalog/demo/banners/MacBookAir.jpg', 0),
(209, 8, 1, 'br6', '#', 'catalog/brand logo/br3.png', 0),
(192, 7, 8, 'iPhone 6', 'index.php?route=product/product&amp;path=57&amp;product_id=49', 'catalog/demo/banners/iPhone6.jpg', 0),
(193, 6, 8, 'HP Banner', 'index.php?route=product/manufacturer/info&amp;manufacturer_id=7', 'catalog/demo/compaq_presario.jpg', 0),
(215, 7, 9, 'iPhone 6', 'index.php?route=product/product&amp;path=57&amp;product_id=49', 'catalog/demo/banners/iPhone6.jpg', 0),
(216, 6, 9, 'HP Banner', 'index.php?route=product/manufacturer/info&amp;manufacturer_id=7', 'catalog/demo/compaq_presario.jpg', 0),
(217, 7, 9, 'MacBookAir', '', 'catalog/demo/banners/MacBookAir.jpg', 0),
(218, 8, 9, 'br4', '#', 'catalog/brand logo/br8.png', 0),
(219, 8, 9, 'br3', '#', 'catalog/brand logo/br7.png', 0),
(220, 8, 9, 'br2', '#', 'catalog/brand logo/br6.png', 0),
(221, 8, 9, 'br1', '#', 'catalog/brand logo/br5.png', 0),
(222, 8, 9, 'br5', '#', 'catalog/brand logo/br4.png', 0),
(223, 8, 9, 'br6', '#', 'catalog/brand logo/br3.png', 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_cart`
--

DROP TABLE IF EXISTS `oc_cart`;
CREATE TABLE `oc_cart` (
  `cart_id` int(11) UNSIGNED NOT NULL,
  `api_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `session_id` varchar(32) NOT NULL,
  `product_id` int(11) NOT NULL,
  `recurring_id` int(11) NOT NULL,
  `option` text NOT NULL,
  `quantity` int(5) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_category`
--

DROP TABLE IF EXISTS `oc_category`;
CREATE TABLE `oc_category` (
  `category_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `top` tinyint(1) NOT NULL,
  `column` int(3) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  `thumbnail_image` varchar(255) DEFAULT NULL,
  `homethumb_image` varchar(255) DEFAULT NULL,
  `featured` tinyint(1) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_category`
--

INSERT INTO `oc_category` (`category_id`, `image`, `parent_id`, `top`, `column`, `sort_order`, `status`, `date_added`, `date_modified`, `thumbnail_image`, `homethumb_image`, `featured`) VALUES
(315, 'catalog/category image/categories-image.jpg', 0, 0, 1, 0, 1, '2017-12-11 17:05:38', '2017-12-19 16:04:45', NULL, NULL, 0),
(191, 'catalog/category image/categories-image.jpg', 0, 0, 1, 0, 1, '2017-05-12 18:15:20', '2017-12-19 16:04:34', '', '', 0),
(192, '', 191, 0, 1, 0, 1, '2017-05-12 18:16:13', '2017-12-11 17:01:06', '', '', 0),
(193, '', 192, 0, 1, 0, 1, '2017-05-12 18:16:46', '2017-12-11 17:01:51', '', '', 0),
(194, '', 192, 0, 1, 0, 1, '2017-05-12 18:17:19', '2017-12-11 17:01:29', '', '', 0),
(195, '', 192, 0, 1, 0, 1, '2017-05-12 18:18:03', '2017-12-11 17:01:41', '', '', 0),
(196, '', 192, 0, 1, 0, 1, '2017-05-12 18:18:25', '2017-12-11 17:01:18', '', '', 0),
(197, '', 191, 0, 1, 0, 1, '2017-05-12 18:18:51', '2017-12-11 17:00:19', '', '', 0),
(198, '', 197, 0, 1, 0, 1, '2017-05-12 18:20:25', '2017-12-11 17:00:28', '', '', 0),
(199, '', 197, 0, 1, 0, 1, '2017-05-12 18:20:48', '2017-12-11 17:00:37', '', '', 0),
(200, '', 197, 0, 1, 0, 1, '2017-05-12 18:21:08', '2017-12-11 17:00:46', '', '', 0),
(201, '', 197, 0, 1, 0, 1, '2017-05-12 18:21:29', '2017-12-11 17:00:56', '', '', 0),
(202, '', 191, 0, 1, 0, 1, '2017-05-12 18:22:48', '2017-12-11 16:59:29', '', '', 0),
(203, '', 202, 0, 1, 0, 1, '2017-05-12 18:23:11', '2017-12-11 16:59:39', '', '', 0),
(204, '', 202, 0, 1, 0, 1, '2017-05-12 18:23:30', '2017-12-11 16:59:50', '', '', 0),
(205, '', 202, 0, 1, 0, 1, '2017-05-12 18:23:45', '2017-12-11 17:00:00', '', '', 0),
(206, '', 202, 0, 1, 0, 1, '2017-05-12 18:24:06', '2017-12-11 17:00:09', '', '', 0),
(207, 'catalog/category image/categories-image.jpg', 0, 0, 1, 0, 1, '2017-05-12 18:25:14', '2017-12-19 16:04:23', '', '', 0),
(208, '', 207, 0, 1, 0, 1, '2017-05-12 18:25:39', '2017-12-11 16:54:46', '', '', 0),
(209, '', 208, 0, 1, 0, 1, '2017-05-12 18:26:01', '2017-12-11 16:55:17', '', '', 0),
(210, '', 208, 0, 1, 0, 1, '2017-05-12 18:26:17', '2017-12-11 16:55:27', '', '', 0),
(211, '', 208, 0, 1, 0, 1, '2017-05-12 18:26:35', '2017-12-12 10:57:18', '', '', 0),
(212, '', 208, 0, 1, 0, 1, '2017-05-12 18:26:54', '2017-12-11 16:55:42', '', '', 0),
(213, '', 207, 0, 1, 0, 1, '2017-05-12 18:27:18', '2017-12-11 16:56:00', '', '', 0),
(214, '', 213, 0, 1, 0, 1, '2017-05-12 18:27:47', '2017-12-11 16:56:11', '', '', 0),
(215, '', 213, 0, 1, 0, 1, '2017-05-12 18:28:06', '2017-12-11 16:56:20', '', '', 0),
(216, '', 213, 0, 1, 0, 1, '2017-05-12 18:28:27', '2017-12-11 16:56:29', '', '', 0),
(217, '', 213, 0, 1, 0, 1, '2017-05-12 18:28:48', '2017-12-11 16:56:45', '', '', 0),
(218, '', 207, 0, 1, 0, 1, '2017-05-12 18:29:18', '2017-12-11 16:56:55', '', '', 0),
(219, '', 218, 0, 1, 0, 1, '2017-05-12 18:29:45', '2017-12-11 16:57:05', '', '', 0),
(220, '', 218, 0, 1, 0, 1, '2017-05-12 18:30:05', '2017-12-11 16:57:16', '', '', 0),
(221, '', 218, 0, 1, 0, 1, '2017-05-12 18:30:19', '2017-12-11 16:57:27', '', '', 0),
(222, '', 218, 0, 1, 0, 1, '2017-05-12 18:30:38', '2017-12-11 16:57:58', '', '', 0),
(223, '', 207, 0, 1, 0, 1, '2017-05-12 18:30:58', '2017-12-11 16:58:08', '', '', 0),
(224, '', 223, 0, 1, 0, 1, '2017-05-12 18:31:35', '2017-12-11 16:58:22', '', '', 0),
(225, '', 223, 0, 1, 0, 1, '2017-05-12 18:32:08', '2017-12-11 16:58:34', '', '', 0),
(226, '', 223, 0, 1, 0, 1, '2017-05-12 18:32:25', '2017-12-11 16:58:44', '', '', 0),
(227, '', 223, 0, 1, 0, 1, '2017-05-12 18:32:39', '2017-12-11 16:59:06', '', '', 0),
(228, 'catalog/category image/categories-image.jpg', 0, 0, 1, 0, 1, '2017-05-13 08:42:07', '2017-12-19 16:03:55', '', '', 0),
(229, '', 228, 0, 1, 0, 1, '2017-05-13 08:42:37', '2017-12-11 16:27:24', '', '', 0),
(230, '', 229, 0, 1, 0, 1, '2017-05-13 08:43:08', '2017-12-11 16:27:36', '', '', 0),
(231, '', 229, 0, 1, 0, 1, '2017-05-13 08:43:30', '2017-12-11 16:27:46', '', '', 0),
(232, '', 229, 0, 1, 0, 1, '2017-05-13 08:44:29', '2017-12-11 16:27:57', '', '', 0),
(233, '', 229, 0, 1, 0, 1, '2017-05-13 08:44:46', '2017-12-11 16:28:09', '', '', 0),
(234, '', 228, 0, 1, 0, 1, '2017-05-13 08:45:10', '2017-12-11 16:26:34', '', '', 0),
(235, '', 234, 0, 1, 0, 1, '2017-05-13 08:49:14', '2017-12-11 16:26:44', '', '', 0),
(236, '', 234, 0, 1, 0, 1, '2017-05-13 08:52:57', '2017-12-11 16:26:55', '', '', 0),
(237, '', 234, 0, 1, 0, 1, '2017-05-13 08:53:26', '2017-12-11 16:27:05', '', '', 0),
(238, '', 234, 0, 1, 0, 1, '2017-05-13 08:53:43', '2017-12-11 16:27:14', '', '', 0),
(239, 'catalog/category image/categories-image.jpg', 0, 0, 1, 0, 1, '2017-05-13 08:54:49', '2017-12-19 16:04:08', '', '', 0),
(240, '', 239, 0, 1, 0, 1, '2017-05-13 08:55:39', '2017-12-11 16:53:40', '', '', 0),
(241, '', 240, 0, 1, 0, 1, '2017-05-13 08:56:08', '2017-12-11 16:53:51', '', '', 0),
(242, '', 240, 0, 1, 0, 1, '2017-05-13 08:56:26', '2017-12-11 16:54:04', '', '', 0),
(243, '', 240, 0, 1, 0, 1, '2017-05-13 08:56:45', '2017-12-11 16:54:16', '', '', 0),
(244, '', 240, 0, 1, 0, 1, '2017-05-13 08:57:01', '2017-12-11 16:54:27', '', '', 0),
(245, '', 239, 0, 1, 0, 1, '2017-05-13 08:57:36', '2017-12-11 16:52:40', '', '', 0),
(246, '', 245, 0, 1, 0, 1, '2017-05-13 09:01:03', '2017-12-11 16:52:52', '', '', 0),
(247, '', 245, 0, 1, 0, 1, '2017-05-13 09:01:52', '2017-12-11 16:53:03', '', '', 0),
(248, '', 245, 0, 1, 0, 1, '2017-05-13 09:02:13', '2017-12-11 16:53:18', '', '', 0),
(249, '', 245, 0, 1, 0, 1, '2017-05-13 09:02:30', '2017-12-11 16:53:30', '', '', 0),
(316, '', 0, 0, 1, 0, 1, '2017-12-21 15:34:39', '2017-12-21 15:34:39', NULL, NULL, 0),
(317, '', 0, 0, 1, 0, 1, '2017-12-21 15:35:15', '2017-12-21 15:35:15', NULL, NULL, 0),
(318, '', 0, 0, 1, 0, 1, '2017-12-21 15:36:08', '2017-12-21 15:36:08', NULL, NULL, 0),
(319, '', 0, 0, 1, 0, 1, '2017-12-21 15:37:16', '2017-12-21 15:37:16', NULL, NULL, 0),
(320, '', 0, 0, 1, 0, 1, '2017-12-21 15:38:08', '2017-12-21 15:38:08', NULL, NULL, 0),
(321, '', 0, 0, 1, 0, 1, '2017-12-21 15:39:08', '2017-12-21 15:39:08', NULL, NULL, 0),
(322, '', 0, 0, 1, 0, 1, '2017-12-21 15:40:07', '2017-12-21 15:40:07', NULL, NULL, 0),
(323, '', 0, 0, 1, 0, 1, '2017-12-21 15:44:57', '2017-12-21 15:44:57', NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_category_description`
--

DROP TABLE IF EXISTS `oc_category_description`;
CREATE TABLE `oc_category_description` (
  `category_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_category_description`
--

INSERT INTO `oc_category_description` (`category_id`, `language_id`, `name`, `description`, `meta_title`, `meta_description`, `meta_keyword`) VALUES
(228, 1, 'Audiobooks', '', 'Audiobooks', '', ''),
(202, 9, 'Bags', '', 'Bags', '', ''),
(203, 9, 'Crochet', '', 'Crochet', '', ''),
(204, 9, 'Sleeveles', '', 'Sleeveles', '', ''),
(205, 9, 'Stripes', '', 'Stripes', '', ''),
(206, 9, 'Sweaters', '', 'Sweaters', '', ''),
(208, 9, 'Blazers', '', 'Blazers', '', ''),
(209, 9, 'Hoodies ', '', 'Hoodies ', '', ''),
(210, 9, 'Jackets &amp; Coats', '', 'Jackets &amp; Coats', '', ''),
(211, 9, 'Sweaters', '', 'Sweaters', '', ''),
(212, 9, 'Tops &amp; Tees', '', 'Tops &amp; Tees', '', ''),
(213, 9, 'Boots', '', 'Boots', '', ''),
(214, 9, 'Hoodies', '', 'Hoodies', '', ''),
(215, 9, 'Sweaters', '', 'Sweaters', '', ''),
(216, 9, 'Vests', '', 'Vests', '', ''),
(217, 9, 'Wedges', '', 'Wedges', '', ''),
(218, 9, 'pants', '', 'pants', '', ''),
(219, 9, 'Graphic T-Shirts ', '', 'Graphic T-Shirts ', '', ''),
(220, 9, 'Hoodies', '', 'Hoodies', '', ''),
(221, 9, 'Polo Short Sleeve ', '', 'Polo Short Sleeve ', '', ''),
(222, 9, 'Sleeveles', '', 'Sleeveles', '', ''),
(223, 9, 'Tops &amp; Tees', '', 'Tops &amp; Tees', '', ''),
(224, 9, 'Long Sleeve ', '', 'Long Sleeve ', '', ''),
(225, 9, 'Polo Short Sleeve', '', 'Polo Short Sleeve', '', ''),
(226, 9, 'Short Sleeve', '', 'Short Sleeve', '', ''),
(227, 9, 'Sleeveles', '', 'Sleeveles', '', ''),
(229, 9, 'Bottoms', '', 'Bottoms', '', ''),
(230, 9, 'Crochet', '', 'Crochet', '', ''),
(231, 9, 'Dresses', '', 'Dresses', '', ''),
(232, 9, 'Jeans', '', 'Jeans', '', ''),
(233, 9, 'Trousers', '', 'Trousers', '', ''),
(234, 9, 'Bags', '', 'Bags', '', ''),
(235, 9, 'Florals', '', 'Florals', '', ''),
(236, 9, 'Shirts', '', 'Shirts', '', ''),
(237, 9, 'Shorts', '', 'Shorts', '', ''),
(238, 9, 'Stripes', '', 'Stripes', '', ''),
(239, 9, 'Books', '', 'Books', '', ''),
(240, 9, 'Rings', '', 'Rings', '', ''),
(241, 9, 'Casual', '', 'Casual', '', ''),
(242, 9, 'Chinos', '', 'Chinos', '', ''),
(243, 9, 'Joggers', '', 'Joggers', '', ''),
(244, 9, 'Tailored', '', 'Tailored', '', ''),
(245, 9, 'Boots', '', 'Boots', '', ''),
(246, 9, 'Hoodies', '', 'Hoodies', '', ''),
(247, 9, 'Sweaters', '', 'Sweaters', '', ''),
(248, 9, 'Vests', '', 'Vests', '', ''),
(249, 9, 'Wedges', '', 'Wedges', '', ''),
(316, 9, 'Biographies', '', 'Biographies', '', ''),
(317, 9, 'Calendars', '', 'Calendars', '', ''),
(318, 9, 'Comics', '', 'Comics', '', ''),
(191, 9, 'chilren’s books', '', 'chilren’s books', '', ''),
(315, 9, 'usedbooks', '', 'usedbooks', '', ''),
(319, 9, 'Cookbooks', '', 'Cookbooks', '', ''),
(320, 9, 'Education', '', 'Education', '', ''),
(321, 9, 'Engineering', '', 'Engineering', '', ''),
(322, 9, 'Health, Fitness', '', 'Health, Fitness', '', ''),
(323, 9, 'Literature', '', 'Literature', '', ''),
(207, 9, 'bussiness &amp; money', '', 'bussiness &amp; money', '', ''),
(192, 1, 'Jackets', '', 'Jackets', '', ''),
(193, 1, 'Polo Short Sleeve', '', 'Polo Short Sleeve', '', ''),
(194, 1, 'Graphic T-Shirts', '', 'Graphic T-Shirts', '', ''),
(195, 1, 'Jackets &amp; Coats', '', 'Jackets &amp; Coats', '', ''),
(196, 1, 'Fashion Jackets', '', 'Fashion Jackets', '', ''),
(197, 1, 'Bottoms', '', 'Bottoms', '', ''),
(198, 1, 'Flat sandals', '', 'Flat sandals', '', ''),
(199, 1, 'Heeled sandals', '', 'Heeled sandals', '', ''),
(200, 1, 'Polo Short Sleeve', '', 'Polo Short Sleeve', '', ''),
(201, 1, 'Short Sleeve', '', 'Short Sleeve', '', ''),
(202, 1, 'Bags', '', 'Bags', '', ''),
(203, 1, 'Crochet', '', 'Crochet', '', ''),
(204, 1, 'Sleeveles', '', 'Sleeveles', '', ''),
(205, 1, 'Stripes', '', 'Stripes', '', ''),
(206, 1, 'Sweaters', '', 'Sweaters', '', ''),
(208, 1, 'Blazers', '', 'Blazers', '', ''),
(209, 1, 'Hoodies ', '', 'Hoodies ', '', ''),
(210, 1, 'Jackets &amp; Coats', '', 'Jackets &amp; Coats', '', ''),
(211, 1, 'Sweaters', '', 'Sweaters', '', ''),
(212, 1, 'Tops &amp; Tees', '', 'Tops &amp; Tees', '', ''),
(213, 1, 'Boots', '', 'Boots', '', ''),
(214, 1, 'Hoodies', '', 'Hoodies', '', ''),
(215, 1, 'Sweaters', '', 'Sweaters', '', ''),
(216, 1, 'Vests', '', 'Vests', '', ''),
(217, 1, 'Wedges', '', 'Wedges', '', ''),
(218, 1, 'pants', '', 'pants', '', ''),
(219, 1, 'Graphic T-Shirts ', '', 'Graphic T-Shirts ', '', ''),
(220, 1, 'Hoodies', '', 'Hoodies', '', ''),
(221, 1, 'Polo Short Sleeve ', '', 'Polo Short Sleeve ', '', ''),
(222, 1, 'Sleeveles', '', 'Sleeveles', '', ''),
(223, 1, 'Tops &amp; Tees', '', 'Tops &amp; Tees', '', ''),
(224, 1, 'Long Sleeve ', '', 'Long Sleeve ', '', ''),
(225, 1, 'Polo Short Sleeve', '', 'Polo Short Sleeve', '', ''),
(226, 1, 'Short Sleeve', '', 'Short Sleeve', '', ''),
(227, 1, 'Sleeveles', '', 'Sleeveles', '', ''),
(229, 1, 'Bottoms', '', 'Bottoms', '', ''),
(230, 1, 'Crochet', '', 'Crochet', '', ''),
(231, 1, 'Dresses', '', 'Dresses', '', ''),
(232, 1, 'Jeans', '', 'Jeans', '', ''),
(233, 1, 'Trousers', '', 'Trousers', '', ''),
(234, 1, 'Bags', '', 'Bags', '', ''),
(235, 1, 'Florals', '', 'Florals', '', ''),
(236, 1, 'Shirts', '', 'Shirts', '', ''),
(237, 1, 'Shorts', '', 'Shorts', '', ''),
(238, 1, 'Stripes', '', 'Stripes', '', ''),
(239, 1, 'Books', '', 'Books', '', ''),
(240, 1, 'Rings', '', 'Rings', '', ''),
(241, 1, 'Casual', '', 'Casual', '', ''),
(242, 1, 'Chinos', '', 'Chinos', '', ''),
(243, 1, 'Joggers', '', 'Joggers', '', ''),
(244, 1, 'Tailored', '', 'Tailored', '', ''),
(245, 1, 'Boots', '', 'Boots', '', ''),
(246, 1, 'Hoodies', '', 'Hoodies', '', ''),
(247, 1, 'Sweaters', '', 'Sweaters', '', ''),
(248, 1, 'Vests', '', 'Vests', '', ''),
(249, 1, 'Wedges', '', 'Wedges', '', ''),
(316, 1, 'Biographies', '', 'Biographies', '', ''),
(317, 1, 'Calendars', '', 'Calendars', '', ''),
(318, 1, 'Comics', '', 'Comics', '', ''),
(191, 1, 'chilren’s books', '', 'chilren’s books', '', ''),
(315, 1, 'usedbooks', '', 'usedbooks', '', ''),
(319, 1, 'Cookbooks', '', 'Cookbooks', '', ''),
(320, 1, 'Education', '', 'Education', '', ''),
(321, 1, 'Engineering', '', 'Engineering', '', ''),
(322, 1, 'Health, Fitness', '', 'Health, Fitness', '', ''),
(323, 1, 'Literature', '', 'Literature', '', ''),
(228, 9, 'Audiobooks', '', 'Audiobooks', '', ''),
(207, 1, 'bussiness &amp; money', '', 'bussiness &amp; money', '', ''),
(192, 9, 'Jackets', '', 'Jackets', '', ''),
(193, 9, 'Polo Short Sleeve', '', 'Polo Short Sleeve', '', ''),
(194, 9, 'Graphic T-Shirts', '', 'Graphic T-Shirts', '', ''),
(195, 9, 'Jackets &amp; Coats', '', 'Jackets &amp; Coats', '', ''),
(196, 9, 'Fashion Jackets', '', 'Fashion Jackets', '', ''),
(197, 9, 'Bottoms', '', 'Bottoms', '', ''),
(198, 9, 'Flat sandals', '', 'Flat sandals', '', ''),
(199, 9, 'Heeled sandals', '', 'Heeled sandals', '', ''),
(200, 9, 'Polo Short Sleeve', '', 'Polo Short Sleeve', '', ''),
(201, 9, 'Short Sleeve', '', 'Short Sleeve', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `oc_category_filter`
--

DROP TABLE IF EXISTS `oc_category_filter`;
CREATE TABLE `oc_category_filter` (
  `category_id` int(11) NOT NULL,
  `filter_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_category_filter`
--

INSERT INTO `oc_category_filter` (`category_id`, `filter_id`) VALUES
(191, 1),
(191, 3),
(191, 4),
(191, 8),
(191, 14),
(191, 15),
(191, 16),
(191, 17),
(191, 18),
(191, 19),
(191, 22),
(191, 23),
(192, 1),
(192, 3),
(192, 4),
(192, 8),
(192, 14),
(192, 15),
(192, 16),
(192, 17),
(192, 18),
(192, 19),
(192, 22),
(192, 23),
(193, 1),
(193, 3),
(193, 4),
(193, 8),
(193, 14),
(193, 15),
(193, 16),
(193, 17),
(193, 18),
(193, 19),
(193, 22),
(193, 23),
(194, 1),
(194, 3),
(194, 4),
(194, 8),
(194, 14),
(194, 15),
(194, 16),
(194, 17),
(194, 18),
(194, 19),
(194, 22),
(194, 23),
(195, 1),
(195, 3),
(195, 4),
(195, 8),
(195, 14),
(195, 15),
(195, 16),
(195, 17),
(195, 18),
(195, 19),
(195, 22),
(195, 23),
(196, 1),
(196, 3),
(196, 4),
(196, 8),
(196, 14),
(196, 15),
(196, 16),
(196, 17),
(196, 18),
(196, 19),
(196, 22),
(196, 23),
(197, 1),
(197, 3),
(197, 4),
(197, 8),
(197, 14),
(197, 15),
(197, 16),
(197, 17),
(197, 18),
(197, 19),
(197, 22),
(197, 23),
(198, 1),
(198, 3),
(198, 4),
(198, 8),
(198, 14),
(198, 15),
(198, 16),
(198, 17),
(198, 18),
(198, 19),
(198, 22),
(198, 23),
(199, 1),
(199, 3),
(199, 4),
(199, 8),
(199, 14),
(199, 15),
(199, 16),
(199, 17),
(199, 18),
(199, 19),
(199, 22),
(199, 23),
(200, 1),
(200, 3),
(200, 4),
(200, 8),
(200, 14),
(200, 15),
(200, 16),
(200, 17),
(200, 18),
(200, 19),
(200, 22),
(200, 23),
(201, 1),
(201, 3),
(201, 4),
(201, 8),
(201, 14),
(201, 15),
(201, 16),
(201, 17),
(201, 18),
(201, 19),
(201, 22),
(201, 23),
(202, 1),
(202, 3),
(202, 4),
(202, 8),
(202, 14),
(202, 15),
(202, 16),
(202, 17),
(202, 18),
(202, 19),
(202, 22),
(202, 23),
(203, 1),
(203, 3),
(203, 4),
(203, 8),
(203, 14),
(203, 15),
(203, 16),
(203, 17),
(203, 18),
(203, 19),
(203, 22),
(203, 23),
(204, 1),
(204, 3),
(204, 4),
(204, 8),
(204, 14),
(204, 15),
(204, 16),
(204, 17),
(204, 18),
(204, 19),
(204, 22),
(204, 23),
(205, 1),
(205, 3),
(205, 4),
(205, 8),
(205, 14),
(205, 15),
(205, 16),
(205, 17),
(205, 18),
(205, 19),
(205, 22),
(205, 23),
(206, 1),
(206, 3),
(206, 4),
(206, 8),
(206, 14),
(206, 15),
(206, 16),
(206, 17),
(206, 18),
(206, 19),
(206, 22),
(206, 23),
(207, 1),
(207, 3),
(207, 4),
(207, 8),
(207, 14),
(207, 15),
(207, 16),
(207, 17),
(207, 18),
(207, 19),
(207, 22),
(207, 23),
(208, 1),
(208, 3),
(208, 4),
(208, 8),
(208, 14),
(208, 15),
(208, 16),
(208, 17),
(208, 18),
(208, 19),
(208, 22),
(208, 23),
(209, 1),
(209, 3),
(209, 4),
(209, 8),
(209, 14),
(209, 15),
(209, 16),
(209, 17),
(209, 18),
(209, 19),
(209, 22),
(209, 23),
(210, 1),
(210, 3),
(210, 4),
(210, 8),
(210, 14),
(210, 15),
(210, 16),
(210, 17),
(210, 18),
(210, 19),
(210, 22),
(210, 23),
(211, 1),
(211, 3),
(211, 4),
(211, 8),
(211, 14),
(211, 15),
(211, 16),
(211, 17),
(211, 18),
(211, 19),
(211, 22),
(211, 23),
(212, 1),
(212, 3),
(212, 4),
(212, 8),
(212, 14),
(212, 15),
(212, 16),
(212, 17),
(212, 18),
(212, 19),
(212, 22),
(212, 23),
(213, 1),
(213, 3),
(213, 4),
(213, 8),
(213, 14),
(213, 15),
(213, 16),
(213, 17),
(213, 18),
(213, 19),
(213, 22),
(213, 23),
(214, 1),
(214, 3),
(214, 4),
(214, 8),
(214, 14),
(214, 15),
(214, 16),
(214, 17),
(214, 18),
(214, 19),
(214, 22),
(214, 23),
(215, 1),
(215, 3),
(215, 4),
(215, 8),
(215, 14),
(215, 15),
(215, 16),
(215, 17),
(215, 18),
(215, 19),
(215, 22),
(215, 23),
(216, 1),
(216, 3),
(216, 4),
(216, 8),
(216, 14),
(216, 15),
(216, 16),
(216, 17),
(216, 18),
(216, 19),
(216, 22),
(216, 23),
(217, 1),
(217, 3),
(217, 4),
(217, 8),
(217, 14),
(217, 15),
(217, 16),
(217, 17),
(217, 18),
(217, 19),
(217, 22),
(217, 23),
(218, 1),
(218, 3),
(218, 4),
(218, 8),
(218, 14),
(218, 15),
(218, 16),
(218, 17),
(218, 18),
(218, 19),
(218, 22),
(218, 23),
(219, 1),
(219, 3),
(219, 4),
(219, 8),
(219, 14),
(219, 15),
(219, 16),
(219, 17),
(219, 18),
(219, 19),
(219, 22),
(219, 23),
(220, 1),
(220, 3),
(220, 4),
(220, 8),
(220, 14),
(220, 15),
(220, 16),
(220, 17),
(220, 18),
(220, 19),
(220, 22),
(220, 23),
(222, 1),
(222, 3),
(222, 4),
(222, 8),
(222, 14),
(222, 15),
(222, 16),
(222, 17),
(222, 18),
(222, 22),
(222, 23),
(223, 1),
(223, 3),
(223, 4),
(223, 8),
(223, 14),
(223, 15),
(223, 16),
(223, 17),
(223, 18),
(223, 19),
(223, 22),
(223, 23),
(224, 1),
(224, 3),
(224, 4),
(224, 8),
(224, 14),
(224, 15),
(224, 16),
(224, 17),
(224, 18),
(224, 19),
(224, 22),
(224, 23),
(225, 1),
(225, 3),
(225, 14),
(225, 15),
(225, 16),
(225, 17),
(226, 1),
(226, 3),
(226, 8),
(226, 14),
(226, 15),
(226, 16),
(226, 17),
(227, 1),
(227, 3),
(227, 4),
(227, 8),
(227, 14),
(227, 15),
(227, 16),
(227, 17),
(228, 1),
(228, 2),
(228, 5),
(228, 6),
(228, 14),
(228, 15),
(228, 16),
(228, 17),
(228, 18),
(228, 22),
(228, 23),
(229, 1),
(229, 3),
(229, 4),
(229, 8),
(229, 14),
(229, 15),
(229, 16),
(229, 17),
(229, 18),
(229, 19),
(229, 22),
(229, 23),
(230, 1),
(230, 3),
(230, 4),
(230, 8),
(230, 14),
(230, 15),
(230, 16),
(230, 17),
(230, 18),
(230, 19),
(230, 22),
(230, 23),
(231, 1),
(231, 3),
(231, 4),
(231, 8),
(231, 14),
(231, 15),
(231, 16),
(231, 17),
(231, 18),
(231, 19),
(231, 22),
(231, 23),
(232, 1),
(232, 3),
(232, 4),
(232, 8),
(232, 14),
(232, 15),
(232, 16),
(232, 17),
(232, 18),
(232, 19),
(232, 22),
(232, 23),
(233, 1),
(233, 2),
(233, 4),
(233, 5),
(233, 6),
(233, 14),
(233, 15),
(233, 16),
(233, 17),
(233, 18),
(233, 19),
(233, 22),
(233, 23),
(234, 1),
(234, 2),
(234, 5),
(234, 6),
(234, 14),
(234, 15),
(234, 16),
(234, 17),
(234, 18),
(234, 19),
(234, 20),
(234, 22),
(234, 23),
(235, 1),
(235, 3),
(235, 4),
(235, 8),
(235, 14),
(235, 15),
(235, 16),
(235, 17),
(235, 18),
(235, 19),
(235, 22),
(235, 23),
(236, 1),
(236, 3),
(236, 4),
(236, 8),
(236, 14),
(236, 15),
(236, 16),
(236, 17),
(236, 18),
(236, 19),
(236, 22),
(236, 23),
(237, 1),
(237, 3),
(237, 4),
(237, 8),
(237, 14),
(237, 15),
(237, 16),
(237, 17),
(237, 18),
(237, 19),
(237, 22),
(237, 23),
(238, 1),
(238, 3),
(238, 4),
(238, 8),
(238, 14),
(238, 15),
(238, 16),
(238, 17),
(238, 18),
(238, 19),
(238, 22),
(238, 23),
(239, 1),
(239, 2),
(239, 5),
(239, 6),
(239, 14),
(239, 15),
(239, 16),
(239, 17),
(239, 18),
(239, 19),
(239, 20),
(239, 22),
(239, 23),
(240, 1),
(240, 2),
(240, 5),
(240, 6),
(240, 14),
(240, 15),
(240, 16),
(240, 17),
(240, 18),
(240, 22),
(240, 23),
(241, 1),
(241, 2),
(241, 5),
(241, 6),
(241, 14),
(241, 15),
(241, 16),
(241, 17),
(241, 18),
(241, 19),
(241, 22),
(241, 23),
(242, 1),
(242, 2),
(242, 5),
(242, 6),
(242, 14),
(242, 15),
(242, 16),
(242, 17),
(242, 18),
(242, 19),
(242, 20),
(242, 22),
(242, 23),
(243, 1),
(243, 2),
(243, 5),
(243, 6),
(243, 14),
(243, 15),
(243, 16),
(243, 17),
(243, 18),
(243, 19),
(243, 20),
(243, 22),
(243, 23),
(244, 1),
(244, 2),
(244, 5),
(244, 6),
(244, 14),
(244, 15),
(244, 16),
(244, 17),
(244, 18),
(244, 19),
(244, 22),
(244, 23),
(245, 1),
(245, 2),
(245, 5),
(245, 6),
(245, 14),
(245, 15),
(245, 16),
(245, 17),
(245, 18),
(245, 19),
(245, 20),
(245, 22),
(245, 23),
(246, 1),
(246, 2),
(246, 5),
(246, 6),
(246, 14),
(246, 15),
(246, 16),
(246, 17),
(246, 18),
(246, 19),
(246, 20),
(246, 22),
(246, 23),
(247, 1),
(247, 2),
(247, 5),
(247, 6),
(247, 14),
(247, 15),
(247, 16),
(247, 17),
(247, 18),
(247, 19),
(247, 22),
(247, 23),
(248, 1),
(248, 2),
(248, 5),
(248, 6),
(248, 14),
(248, 15),
(248, 16),
(248, 17),
(248, 18),
(248, 20),
(248, 22),
(248, 23),
(249, 1),
(249, 2),
(249, 5),
(249, 6),
(249, 14),
(249, 15),
(249, 16),
(249, 17),
(249, 18),
(249, 20),
(249, 22),
(249, 23),
(315, 1),
(315, 3),
(315, 4),
(315, 8),
(315, 14),
(315, 15),
(315, 16),
(315, 17),
(316, 1),
(316, 3),
(316, 4),
(316, 8),
(316, 14),
(316, 15),
(316, 16),
(316, 17),
(317, 1),
(317, 3),
(317, 4),
(317, 8),
(317, 14),
(317, 15),
(317, 16),
(317, 17),
(318, 1),
(318, 3),
(318, 4),
(318, 8),
(318, 14),
(318, 15),
(318, 16),
(318, 17),
(318, 19),
(318, 20),
(318, 21),
(318, 22),
(318, 23),
(319, 1),
(319, 3),
(319, 4),
(319, 8),
(319, 14),
(319, 15),
(319, 16),
(319, 17),
(319, 19),
(319, 20),
(319, 21),
(319, 22),
(319, 23),
(320, 3),
(320, 4),
(320, 8),
(320, 14),
(320, 15),
(320, 16),
(320, 17),
(320, 19),
(320, 21),
(320, 22),
(320, 23),
(321, 1),
(321, 3),
(321, 4),
(321, 8),
(321, 14),
(321, 15),
(321, 16),
(321, 17),
(321, 19),
(321, 20),
(321, 21),
(321, 22),
(321, 23),
(322, 1),
(322, 3),
(322, 4),
(322, 8),
(322, 14),
(322, 15),
(322, 16),
(322, 17),
(322, 19),
(322, 20),
(322, 21),
(322, 22),
(322, 23),
(323, 1),
(323, 3),
(323, 4),
(323, 8),
(323, 14),
(323, 15),
(323, 16),
(323, 17),
(323, 19),
(323, 20),
(323, 21),
(323, 22),
(323, 23);

-- --------------------------------------------------------

--
-- Table structure for table `oc_category_path`
--

DROP TABLE IF EXISTS `oc_category_path`;
CREATE TABLE `oc_category_path` (
  `category_id` int(11) NOT NULL,
  `path_id` int(11) NOT NULL,
  `level` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_category_path`
--

INSERT INTO `oc_category_path` (`category_id`, `path_id`, `level`) VALUES
(191, 191, 0),
(192, 192, 1),
(192, 191, 0),
(193, 193, 2),
(193, 191, 0),
(193, 192, 1),
(194, 194, 2),
(194, 191, 0),
(194, 192, 1),
(195, 195, 2),
(195, 191, 0),
(195, 192, 1),
(196, 196, 2),
(196, 191, 0),
(196, 192, 1),
(197, 197, 1),
(197, 191, 0),
(198, 198, 2),
(198, 191, 0),
(198, 197, 1),
(199, 199, 2),
(199, 191, 0),
(199, 197, 1),
(200, 200, 2),
(200, 191, 0),
(200, 197, 1),
(201, 201, 2),
(201, 191, 0),
(201, 197, 1),
(202, 202, 1),
(202, 191, 0),
(203, 203, 2),
(203, 191, 0),
(203, 202, 1),
(204, 204, 2),
(204, 191, 0),
(204, 202, 1),
(205, 205, 2),
(205, 191, 0),
(205, 202, 1),
(206, 206, 2),
(206, 191, 0),
(206, 202, 1),
(207, 207, 0),
(208, 208, 1),
(208, 207, 0),
(209, 209, 2),
(209, 207, 0),
(209, 208, 1),
(210, 210, 2),
(210, 207, 0),
(210, 208, 1),
(211, 211, 2),
(211, 207, 0),
(211, 208, 1),
(212, 212, 2),
(212, 207, 0),
(212, 208, 1),
(213, 213, 1),
(213, 207, 0),
(214, 214, 2),
(214, 207, 0),
(214, 213, 1),
(215, 215, 2),
(215, 207, 0),
(215, 213, 1),
(216, 216, 2),
(216, 207, 0),
(216, 213, 1),
(217, 217, 2),
(217, 207, 0),
(217, 213, 1),
(218, 218, 1),
(218, 207, 0),
(219, 219, 2),
(219, 207, 0),
(219, 218, 1),
(220, 220, 2),
(220, 207, 0),
(220, 218, 1),
(221, 207, 0),
(221, 221, 2),
(221, 218, 1),
(222, 222, 2),
(222, 207, 0),
(222, 218, 1),
(223, 223, 1),
(223, 207, 0),
(224, 224, 2),
(224, 207, 0),
(224, 223, 1),
(225, 225, 2),
(225, 207, 0),
(225, 223, 1),
(226, 226, 2),
(226, 207, 0),
(226, 223, 1),
(227, 227, 2),
(227, 207, 0),
(227, 223, 1),
(228, 228, 0),
(229, 229, 1),
(229, 228, 0),
(230, 230, 2),
(230, 228, 0),
(230, 229, 1),
(231, 231, 2),
(231, 228, 0),
(231, 229, 1),
(232, 232, 2),
(232, 228, 0),
(232, 229, 1),
(233, 228, 0),
(233, 233, 2),
(233, 229, 1),
(234, 234, 1),
(234, 228, 0),
(235, 234, 1),
(235, 235, 2),
(235, 228, 0),
(236, 236, 2),
(236, 228, 0),
(236, 234, 1),
(237, 237, 2),
(237, 228, 0),
(237, 234, 1),
(238, 238, 2),
(238, 228, 0),
(238, 234, 1),
(246, 245, 1),
(239, 239, 0),
(246, 239, 0),
(240, 240, 1),
(240, 239, 0),
(246, 246, 2),
(241, 241, 2),
(241, 240, 1),
(244, 239, 0),
(242, 242, 2),
(242, 240, 1),
(242, 239, 0),
(243, 243, 2),
(243, 240, 1),
(243, 239, 0),
(244, 244, 2),
(244, 240, 1),
(241, 239, 0),
(245, 245, 1),
(245, 239, 0),
(247, 247, 2),
(247, 239, 0),
(247, 245, 1),
(248, 248, 2),
(248, 239, 0),
(248, 245, 1),
(249, 249, 2),
(249, 239, 0),
(249, 245, 1),
(316, 316, 0),
(323, 323, 0),
(322, 322, 0),
(321, 321, 0),
(320, 320, 0),
(319, 319, 0),
(318, 318, 0),
(317, 317, 0),
(315, 315, 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_category_to_layout`
--

DROP TABLE IF EXISTS `oc_category_to_layout`;
CREATE TABLE `oc_category_to_layout` (
  `category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_category_to_layout`
--

INSERT INTO `oc_category_to_layout` (`category_id`, `store_id`, `layout_id`) VALUES
(316, 0, 0),
(230, 7, 0),
(236, 7, 0),
(232, 7, 0),
(232, 6, 0),
(231, 7, 0),
(231, 6, 0),
(238, 7, 0),
(238, 6, 0),
(237, 7, 0),
(237, 6, 0),
(201, 7, 0),
(321, 1, 0),
(323, 7, 0),
(323, 1, 0),
(322, 3, 0),
(321, 7, 0),
(317, 7, 0),
(320, 3, 0),
(319, 7, 0),
(319, 1, 0),
(318, 3, 0),
(196, 7, 0),
(317, 1, 0),
(315, 7, 0),
(315, 1, 0),
(195, 7, 0),
(215, 6, 0),
(191, 7, 0),
(199, 7, 0),
(197, 7, 0),
(205, 7, 0),
(203, 7, 0),
(218, 7, 0),
(226, 7, 0),
(224, 7, 0),
(222, 7, 0),
(220, 7, 0),
(191, 0, 0),
(192, 3, 0),
(193, 3, 0),
(194, 3, 0),
(195, 3, 0),
(196, 3, 0),
(197, 3, 0),
(198, 3, 0),
(199, 3, 0),
(200, 3, 0),
(201, 3, 0),
(202, 3, 0),
(203, 3, 0),
(204, 3, 0),
(205, 3, 0),
(206, 3, 0),
(207, 2, 0),
(208, 3, 0),
(209, 3, 0),
(210, 3, 0),
(211, 3, 0),
(212, 3, 0),
(213, 3, 0),
(214, 3, 0),
(215, 3, 0),
(216, 3, 0),
(217, 3, 0),
(218, 3, 0),
(219, 3, 0),
(220, 3, 0),
(221, 3, 0),
(222, 3, 0),
(223, 3, 0),
(224, 3, 0),
(225, 3, 0),
(226, 3, 0),
(227, 3, 0),
(228, 0, 0),
(229, 3, 0),
(230, 3, 0),
(231, 3, 0),
(232, 3, 0),
(233, 3, 0),
(234, 3, 0),
(235, 3, 0),
(236, 3, 0),
(237, 3, 0),
(238, 3, 0),
(239, 0, 0),
(240, 3, 0),
(241, 3, 0),
(242, 3, 0),
(243, 3, 0),
(244, 3, 0),
(245, 3, 0),
(246, 3, 0),
(247, 3, 0),
(248, 3, 0),
(249, 3, 0),
(234, 1, 0),
(243, 6, 0),
(316, 7, 0),
(191, 2, 0),
(234, 2, 0),
(234, 0, 0),
(191, 1, 0),
(191, 3, 0),
(233, 6, 0),
(240, 7, 0),
(248, 6, 0),
(233, 7, 0),
(242, 7, 0),
(242, 6, 0),
(241, 7, 0),
(241, 6, 0),
(240, 6, 0),
(249, 7, 0),
(249, 6, 0),
(248, 7, 0),
(247, 7, 0),
(247, 6, 0),
(239, 7, 0),
(239, 6, 0),
(246, 7, 0),
(246, 6, 0),
(245, 7, 0),
(245, 6, 0),
(207, 1, 0),
(207, 0, 0),
(316, 1, 0),
(244, 7, 0),
(244, 6, 0),
(243, 7, 0),
(230, 6, 0),
(229, 7, 0),
(229, 6, 0),
(236, 6, 0),
(235, 7, 0),
(235, 6, 0),
(234, 7, 0),
(234, 6, 0),
(228, 7, 0),
(228, 6, 0),
(316, 6, 0),
(316, 3, 0),
(316, 2, 0),
(239, 1, 0),
(239, 2, 0),
(239, 3, 0),
(228, 1, 0),
(228, 2, 0),
(228, 3, 0),
(207, 3, 0),
(207, 6, 0),
(207, 7, 0),
(235, 2, 0),
(235, 1, 0),
(235, 0, 0),
(236, 2, 0),
(236, 1, 0),
(236, 0, 0),
(237, 2, 0),
(237, 1, 0),
(237, 0, 0),
(238, 2, 0),
(238, 1, 0),
(238, 0, 0),
(229, 2, 0),
(229, 1, 0),
(229, 0, 0),
(230, 2, 0),
(230, 1, 0),
(230, 0, 0),
(231, 2, 0),
(231, 1, 0),
(231, 0, 0),
(232, 2, 0),
(232, 1, 0),
(232, 0, 0),
(233, 2, 0),
(233, 1, 0),
(233, 0, 0),
(245, 2, 0),
(245, 1, 0),
(245, 0, 0),
(246, 2, 0),
(246, 1, 0),
(246, 0, 0),
(247, 2, 0),
(247, 1, 0),
(247, 0, 0),
(248, 2, 0),
(248, 1, 0),
(248, 0, 0),
(249, 2, 0),
(249, 1, 0),
(249, 0, 0),
(240, 2, 0),
(240, 1, 0),
(240, 0, 0),
(241, 2, 0),
(241, 1, 0),
(241, 0, 0),
(242, 2, 0),
(242, 1, 0),
(242, 0, 0),
(243, 2, 0),
(243, 1, 0),
(243, 0, 0),
(244, 2, 0),
(244, 1, 0),
(244, 0, 0),
(208, 2, 0),
(208, 1, 0),
(208, 0, 0),
(209, 2, 0),
(209, 1, 0),
(209, 0, 0),
(210, 2, 0),
(210, 1, 0),
(210, 0, 0),
(211, 2, 0),
(211, 1, 0),
(211, 0, 0),
(212, 2, 0),
(212, 1, 0),
(212, 0, 0),
(213, 2, 0),
(213, 1, 0),
(213, 0, 0),
(214, 2, 0),
(214, 1, 0),
(214, 0, 0),
(215, 2, 0),
(215, 1, 0),
(215, 0, 0),
(216, 2, 0),
(216, 1, 0),
(216, 0, 0),
(217, 2, 0),
(217, 1, 0),
(217, 0, 0),
(218, 2, 0),
(218, 1, 0),
(218, 0, 0),
(219, 2, 0),
(219, 1, 0),
(219, 0, 0),
(220, 2, 0),
(220, 1, 0),
(220, 0, 0),
(221, 2, 0),
(221, 1, 0),
(221, 0, 0),
(222, 2, 0),
(222, 1, 0),
(222, 0, 0),
(223, 2, 0),
(223, 1, 0),
(223, 0, 0),
(224, 2, 0),
(224, 1, 0),
(224, 0, 0),
(225, 2, 0),
(225, 1, 0),
(225, 0, 0),
(226, 2, 0),
(226, 1, 0),
(226, 0, 0),
(227, 2, 0),
(227, 1, 0),
(227, 0, 0),
(202, 2, 0),
(202, 1, 0),
(202, 0, 0),
(203, 2, 0),
(203, 1, 0),
(203, 0, 0),
(204, 2, 0),
(204, 1, 0),
(204, 0, 0),
(205, 2, 0),
(205, 1, 0),
(205, 0, 0),
(206, 2, 0),
(206, 1, 0),
(206, 0, 0),
(197, 2, 0),
(197, 1, 0),
(197, 0, 0),
(198, 2, 0),
(198, 1, 0),
(198, 0, 0),
(199, 2, 0),
(199, 1, 0),
(199, 0, 0),
(200, 2, 0),
(200, 1, 0),
(200, 0, 0),
(201, 2, 0),
(201, 1, 0),
(201, 0, 0),
(192, 2, 0),
(192, 1, 0),
(192, 0, 0),
(196, 2, 0),
(196, 1, 0),
(196, 0, 0),
(194, 2, 0),
(194, 1, 0),
(194, 0, 0),
(195, 2, 0),
(195, 1, 0),
(195, 0, 0),
(193, 2, 0),
(193, 1, 0),
(193, 0, 0),
(215, 7, 0),
(216, 6, 0),
(216, 7, 0),
(213, 6, 0),
(213, 7, 0),
(214, 6, 0),
(214, 7, 0),
(210, 6, 0),
(210, 7, 0),
(212, 6, 0),
(212, 7, 0),
(208, 6, 0),
(208, 7, 0),
(209, 6, 0),
(209, 7, 0),
(191, 6, 0),
(227, 7, 0),
(227, 6, 0),
(203, 6, 0),
(202, 7, 0),
(202, 6, 0),
(205, 6, 0),
(204, 7, 0),
(204, 6, 0),
(197, 6, 0),
(206, 7, 0),
(206, 6, 0),
(199, 6, 0),
(198, 7, 0),
(198, 6, 0),
(218, 6, 0),
(217, 7, 0),
(217, 6, 0),
(226, 6, 0),
(225, 7, 0),
(225, 6, 0),
(224, 6, 0),
(223, 7, 0),
(223, 6, 0),
(222, 6, 0),
(221, 7, 0),
(221, 6, 0),
(220, 6, 0),
(219, 7, 0),
(219, 6, 0),
(201, 6, 0),
(200, 7, 0),
(200, 6, 0),
(321, 0, 0),
(320, 7, 0),
(320, 6, 0),
(323, 6, 0),
(323, 3, 0),
(323, 2, 0),
(323, 0, 0),
(322, 7, 0),
(322, 6, 0),
(322, 2, 0),
(322, 1, 0),
(322, 0, 0),
(321, 6, 0),
(321, 3, 0),
(321, 2, 0),
(317, 6, 0),
(317, 3, 0),
(317, 2, 0),
(320, 2, 0),
(320, 1, 0),
(320, 0, 0),
(319, 0, 0),
(318, 7, 0),
(318, 6, 0),
(319, 6, 0),
(319, 3, 0),
(319, 2, 0),
(318, 2, 0),
(318, 1, 0),
(318, 0, 0),
(196, 6, 0),
(192, 7, 0),
(192, 6, 0),
(315, 6, 0),
(315, 3, 0),
(315, 2, 0),
(317, 0, 0),
(211, 7, 0),
(211, 6, 0),
(195, 6, 0),
(194, 7, 0),
(194, 6, 0),
(315, 0, 0),
(193, 7, 0),
(193, 6, 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_category_to_store`
--

DROP TABLE IF EXISTS `oc_category_to_store`;
CREATE TABLE `oc_category_to_store` (
  `category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_category_to_store`
--

INSERT INTO `oc_category_to_store` (`category_id`, `store_id`) VALUES
(191, 0),
(191, 1),
(191, 2),
(191, 3),
(191, 6),
(191, 7),
(192, 0),
(192, 1),
(192, 2),
(192, 3),
(192, 6),
(192, 7),
(193, 0),
(193, 1),
(193, 2),
(193, 3),
(193, 6),
(193, 7),
(194, 0),
(194, 1),
(194, 2),
(194, 3),
(194, 6),
(194, 7),
(195, 0),
(195, 1),
(195, 2),
(195, 3),
(195, 6),
(195, 7),
(196, 0),
(196, 1),
(196, 2),
(196, 3),
(196, 6),
(196, 7),
(197, 0),
(197, 1),
(197, 2),
(197, 3),
(197, 6),
(197, 7),
(198, 0),
(198, 1),
(198, 2),
(198, 3),
(198, 6),
(198, 7),
(199, 0),
(199, 1),
(199, 2),
(199, 3),
(199, 6),
(199, 7),
(200, 0),
(200, 1),
(200, 2),
(200, 3),
(200, 6),
(200, 7),
(201, 0),
(201, 1),
(201, 2),
(201, 3),
(201, 6),
(201, 7),
(202, 0),
(202, 1),
(202, 2),
(202, 3),
(202, 6),
(202, 7),
(203, 0),
(203, 1),
(203, 2),
(203, 3),
(203, 6),
(203, 7),
(204, 0),
(204, 1),
(204, 2),
(204, 3),
(204, 6),
(204, 7),
(205, 0),
(205, 1),
(205, 2),
(205, 3),
(205, 6),
(205, 7),
(206, 0),
(206, 1),
(206, 2),
(206, 3),
(206, 6),
(206, 7),
(207, 0),
(207, 1),
(207, 2),
(207, 3),
(207, 6),
(207, 7),
(208, 0),
(208, 1),
(208, 2),
(208, 3),
(208, 6),
(208, 7),
(209, 0),
(209, 1),
(209, 2),
(209, 3),
(209, 6),
(209, 7),
(210, 0),
(210, 1),
(210, 2),
(210, 3),
(210, 6),
(210, 7),
(211, 0),
(211, 1),
(211, 2),
(211, 3),
(211, 6),
(211, 7),
(212, 0),
(212, 1),
(212, 2),
(212, 3),
(212, 6),
(212, 7),
(213, 0),
(213, 1),
(213, 2),
(213, 3),
(213, 6),
(213, 7),
(214, 0),
(214, 1),
(214, 2),
(214, 3),
(214, 6),
(214, 7),
(215, 0),
(215, 1),
(215, 2),
(215, 3),
(215, 6),
(215, 7),
(216, 0),
(216, 1),
(216, 2),
(216, 3),
(216, 6),
(216, 7),
(217, 0),
(217, 1),
(217, 2),
(217, 3),
(217, 6),
(217, 7),
(218, 0),
(218, 1),
(218, 2),
(218, 3),
(218, 6),
(218, 7),
(219, 0),
(219, 1),
(219, 2),
(219, 3),
(219, 6),
(219, 7),
(220, 0),
(220, 1),
(220, 2),
(220, 3),
(220, 6),
(220, 7),
(221, 0),
(221, 1),
(221, 2),
(221, 3),
(221, 6),
(221, 7),
(222, 0),
(222, 1),
(222, 2),
(222, 3),
(222, 6),
(222, 7),
(223, 0),
(223, 1),
(223, 2),
(223, 3),
(223, 6),
(223, 7),
(224, 0),
(224, 1),
(224, 2),
(224, 3),
(224, 6),
(224, 7),
(225, 0),
(225, 1),
(225, 2),
(225, 3),
(225, 6),
(225, 7),
(226, 0),
(226, 1),
(226, 2),
(226, 3),
(226, 6),
(226, 7),
(227, 0),
(227, 1),
(227, 2),
(227, 3),
(227, 6),
(227, 7),
(228, 0),
(228, 1),
(228, 2),
(228, 3),
(228, 6),
(228, 7),
(229, 0),
(229, 1),
(229, 2),
(229, 3),
(229, 6),
(229, 7),
(230, 0),
(230, 1),
(230, 2),
(230, 3),
(230, 6),
(230, 7),
(231, 0),
(231, 1),
(231, 2),
(231, 3),
(231, 6),
(231, 7),
(232, 0),
(232, 1),
(232, 2),
(232, 3),
(232, 6),
(232, 7),
(233, 0),
(233, 1),
(233, 2),
(233, 3),
(233, 6),
(233, 7),
(234, 0),
(234, 1),
(234, 2),
(234, 3),
(234, 6),
(234, 7),
(235, 0),
(235, 1),
(235, 2),
(235, 3),
(235, 6),
(235, 7),
(236, 0),
(236, 1),
(236, 2),
(236, 3),
(236, 6),
(236, 7),
(237, 0),
(237, 1),
(237, 2),
(237, 3),
(237, 6),
(237, 7),
(238, 0),
(238, 1),
(238, 2),
(238, 3),
(238, 6),
(238, 7),
(239, 0),
(239, 1),
(239, 2),
(239, 3),
(239, 6),
(239, 7),
(240, 0),
(240, 1),
(240, 2),
(240, 3),
(240, 6),
(240, 7),
(241, 0),
(241, 1),
(241, 2),
(241, 3),
(241, 6),
(241, 7),
(242, 0),
(242, 1),
(242, 2),
(242, 3),
(242, 6),
(242, 7),
(243, 0),
(243, 1),
(243, 2),
(243, 3),
(243, 6),
(243, 7),
(244, 0),
(244, 1),
(244, 2),
(244, 3),
(244, 6),
(244, 7),
(245, 0),
(245, 1),
(245, 2),
(245, 3),
(245, 6),
(245, 7),
(246, 0),
(246, 1),
(246, 2),
(246, 3),
(246, 6),
(246, 7),
(247, 0),
(247, 1),
(247, 2),
(247, 3),
(247, 6),
(247, 7),
(248, 0),
(248, 1),
(248, 2),
(248, 3),
(248, 6),
(248, 7),
(249, 0),
(249, 1),
(249, 2),
(249, 3),
(249, 6),
(249, 7),
(315, 0),
(315, 1),
(315, 2),
(315, 3),
(315, 6),
(315, 7),
(316, 0),
(316, 1),
(316, 2),
(316, 3),
(316, 6),
(316, 7),
(317, 0),
(317, 1),
(317, 2),
(317, 3),
(317, 6),
(317, 7),
(318, 0),
(318, 1),
(318, 2),
(318, 3),
(318, 6),
(318, 7),
(319, 0),
(319, 1),
(319, 2),
(319, 3),
(319, 6),
(319, 7),
(320, 0),
(320, 1),
(320, 2),
(320, 3),
(320, 6),
(320, 7),
(321, 0),
(321, 1),
(321, 2),
(321, 3),
(321, 6),
(321, 7),
(322, 0),
(322, 1),
(322, 2),
(322, 3),
(322, 6),
(322, 7),
(323, 0),
(323, 1),
(323, 2),
(323, 3),
(323, 6),
(323, 7);

-- --------------------------------------------------------

--
-- Table structure for table `oc_cmsblock`
--

DROP TABLE IF EXISTS `oc_cmsblock`;
CREATE TABLE `oc_cmsblock` (
  `cmsblock_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `sort_order` tinyint(1) DEFAULT NULL,
  `identify` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `type` tinyint(1) DEFAULT NULL,
  `banner_store` varchar(255) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_cmsblock`
--

INSERT INTO `oc_cmsblock` (`cmsblock_id`, `status`, `sort_order`, `identify`, `link`, `type`, `banner_store`) VALUES
(83, 1, 0, 'social', '', 1, '1,2,3,6,7,0'),
(109, 1, 0, 'header_link', '', 1, '1,2,3,6,7,0'),
(106, 1, 0, 'static_middle_koparion1', '', 1, '6,0'),
(107, 1, 0, 'static_sidebar', '', 1, '1,2,3,6,7,0'),
(108, 1, 0, '', 'index.php?route=product/special', 0, '1,2,3,6,7,0'),
(105, 1, 0, 'static_top_koparion1', '', 1, '1,2,3,6,7,0'),
(81, 1, 0, 'footer_static', '', 1, '1,2,3,6,7,0'),
(80, 1, 0, 'corporate', '', 1, '1,2,3,6,7,0'),
(79, 1, 0, '', 'index.php?route=information/contact', 0, '1,2,3,6,7,0'),
(78, 1, 0, '', 'index.php?route=blog/blog', 0, '1,2,3,6,7,0'),
(110, 1, 0, 'static_author_best', '', 1, '0'),
(111, 1, 0, 'links_footer', '', 1, '1,2,3,6,7,0'),
(112, 1, 0, '', '', 1, '1,2,3,6,7,0'),
(113, 1, 0, 'static_slider_koparion2', '', 1, '1,0'),
(114, 1, 0, 'static_top_koparion3', '', 1, '2,6,0'),
(115, 1, 0, 'static_slider_koparion4', '', 1, '3,0'),
(116, 1, 0, 'corporate4', '', 1, '3,0'),
(117, 1, 0, 'static_top_koparion4', '', 1, '3,0'),
(118, 1, 0, 'static_top_koparion6', '', 1, '7,0'),
(119, 1, 0, 'static_middle_koparion6', '', 1, '7,0');

-- --------------------------------------------------------

--
-- Table structure for table `oc_cmsblock_description`
--

DROP TABLE IF EXISTS `oc_cmsblock_description`;
CREATE TABLE `oc_cmsblock_description` (
  `cmsblock_des_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `cmsblock_id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  `sub_title` varchar(64) DEFAULT NULL,
  `description` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_cmsblock_description`
--

INSERT INTO `oc_cmsblock_description` (`cmsblock_des_id`, `language_id`, `cmsblock_id`, `title`, `sub_title`, `description`) VALUES
(394, 1, 105, 'Static Top Koparion1       ', NULL, '										  										  										  										  										  										  										  &lt;div class=&quot;banner-static static-top-skybook1&quot;&gt;\r\n&lt;div class=&quot;image&quot;&gt;&lt;a href=&quot;index.php?route=product/category&amp;amp;path=239&quot;&gt;&lt;img src=&quot;image/catalog/cmsblock/img-top-skybook1.jpg&quot; alt=&quot;image&quot;&gt;&lt;span class=&quot;text&quot;&gt; &lt;span class=&quot;text1&quot;&gt;G. Meyer Books &amp;amp; Spiritual Traveler Press&lt;/span&gt; &lt;span class=&quot;text2&quot;&gt;Sale up to 30% off&lt;/span&gt; &lt;/span&gt;&lt;/a&gt;&lt;/div&gt;\r\n&lt;/div&gt;\r\n 									 									 									 									 									 									 									'),
(354, 1, 83, 'Social  ', NULL, '&lt;div class=&quot;follow&quot;&gt;\r\n&lt;label&gt;Stay Connected&lt;/label&gt;\r\n&lt;ul class=&quot;link-follow&quot;&gt;\r\n&lt;li class=&quot;first&quot;&gt;&lt;a class=&quot;twitter fa fa-twitter&quot; title=&quot;Twitter&quot; href=&quot;https://twitter.com/plazathemes&quot;&gt;&lt;span&gt;twitter&lt;/span&gt;&lt;/a&gt;&lt;/li&gt;\r\n&lt;li&gt;&lt;a class=&quot;google fa fa-google-plus&quot; title=&quot;Google&quot; href=&quot;#&quot;&gt;&lt;span&gt;google &lt;/span&gt;&lt;/a&gt;&lt;/li&gt;\r\n&lt;li&gt;&lt;a class=&quot;facebook fa fa-facebook&quot; title=&quot;Facebook&quot; href=&quot;https://www.facebook.com/plazathemes1&quot;&gt;&lt;span&gt;facebook&lt;/span&gt;&lt;/a&gt;&lt;/li&gt;\r\n&lt;li&gt;&lt;a class=&quot;youtube fa fa-youtube&quot; title=&quot;Youtube&quot; href=&quot;https://www.youtube.com/user/plazathemes&quot;&gt;&lt;span&gt;youtube &lt;/span&gt;&lt;/a&gt;&lt;/li&gt;\r\n&lt;li&gt;&lt;a class=&quot;flickr fa fa-flickr&quot; title=&quot;Flickr&quot; href=&quot;https://www.youtube.com/user/plazathemes&quot;&gt;&lt;span&gt;Flickr &lt;/span&gt;&lt;/a&gt;&lt;/li&gt;\r\n&lt;li&gt;&lt;a class=&quot;vimeo fa fa-vimeo-square&quot; title=&quot;Vimeo&quot; href=&quot;#&quot;&gt;&lt;span&gt;Vimeo&lt;/span&gt;&lt;/a&gt;&lt;/li&gt;\r\n&lt;li&gt;&lt;a class=&quot;instagram fa fa-instagram&quot; title=&quot;Instagram&quot; href=&quot;#&quot;&gt;&lt;span&gt;Instagram&lt;/span&gt;&lt;/a&gt;&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;/div&gt;																																				 									 									'),
(379, 9, 111, 'Links Footer ', NULL, '										  &lt;ul class=&quot;links-footer&quot;&gt;\r\n&lt;li&gt;&lt;a href=&quot;index.php?route=common/home&quot;&gt;home&lt;/a&gt;&lt;/li&gt;\r\n&lt;li&gt;&lt;a href=&quot;index.php?route=information/information&amp;amp;information_id=4&quot;&gt;About&lt;/a&gt;&lt;/li&gt;\r\n&lt;li&gt;&lt;a href=&quot;http://www.plazathemes.com/&quot;&gt;Shop&lt;/a&gt;&lt;/li&gt;\r\n&lt;li&gt;&lt;a href=&quot;index.php?route=information/contact&quot;&gt;Contact&lt;/a&gt;&lt;/li&gt;\r\n&lt;li&gt;&lt;a href=&quot;index.php?route=affiliate/login&quot;&gt;Affiliate&lt;/a&gt;&lt;/li&gt;\r\n&lt;li&gt;&lt;a href=&quot;index.php?route=information/sitemap&quot;&gt;Site Map&lt;/a&gt;&lt;/li&gt;\r\n&lt;/ul&gt; 									'),
(393, 9, 115, 'Static Slider Koparion4 ', NULL, '										  &lt;div class=&quot;banner-static static-slider-skybook4&quot;&gt;\r\n						&lt;div class=&quot;image&quot;&gt;&lt;a href=&quot;index.php?route=product/category&amp;amp;path=239&quot;&gt;&lt;img src=&quot;image/catalog/cmsblock/static-slider-skybook4.jpg&quot; alt=&quot;image&quot;&gt;&lt;/a&gt;&lt;/div&gt;\r\n						&lt;/div&gt; 									'),
(335, 1, 80, 'Corporate      ', NULL, '										  										  										  										  										  										  &lt;div class=&quot;ma-corporate-about&quot;&gt;\r\n&lt;div class=&quot;row&quot;&gt;\r\n&lt;div class=&quot;col col-md-3 col-sm-6 col-sms-6 col-smb-12&quot;&gt;\r\n&lt;div class=&quot;block-wrapper wrapper1&quot;&gt;\r\n&lt;div class=&quot;text-des&quot;&gt;\r\n&lt;p&gt;Free shipping item&lt;/p&gt;\r\n&lt;span&gt;For all orders over $500&lt;/span&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;div class=&quot;col col-md-3 col-sm-6 col-sms-6 col-smb-12&quot;&gt;\r\n&lt;div class=&quot;block-wrapper wrapper2&quot;&gt;\r\n&lt;div class=&quot;text-des&quot;&gt;\r\n&lt;p&gt;Money back guarantee&lt;/p&gt;\r\n&lt;span&gt;100% money back guarante&lt;/span&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;div class=&quot;col col-md-3 col-sm-6 col-sms-6 col-smb-12&quot;&gt;\r\n&lt;div class=&quot;block-wrapper wrapper3&quot;&gt;\r\n&lt;div class=&quot;text-des&quot;&gt;\r\n&lt;p&gt;Cash on delivery&lt;/p&gt;\r\n&lt;span&gt;Lorem ipsum dolor amet consectetur&lt;/span&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;div class=&quot;col col-md-3 col-sm-6 col-sms-6 col-smb-12&quot;&gt;\r\n&lt;div class=&quot;block-wrapper wrapper4&quot;&gt;\r\n&lt;div class=&quot;text-des&quot;&gt;\r\n&lt;p&gt;Help &amp;amp; Support&lt;/p&gt;\r\n&lt;span&gt;Call us : + 0123.4567.89&lt;/span&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;\r\n																											 									 									 									 									 									 									&lt;/div&gt;&lt;/div&gt;'),
(383, 9, 118, 'Static Top Koparion6  ', NULL, '										  										  &lt;div class=&quot;banner-static static-top-skybook6&quot;&gt;\r\n						\r\n						&lt;div class=&quot;container-inner&quot;&gt;\r\n						&lt;div class=&quot;row&quot;&gt;\r\n						&lt;div class=&quot;col col-md-3 col-sm-3 col-xs-12&quot;&gt;\r\n						&lt;div class=&quot;image&quot;&gt;&lt;a href=&quot;index.php?route=product/category&amp;amp;path=239&quot;&gt;&lt;img src=&quot;image/catalog/cmsblock/img1-top-skybook6.jpg&quot; alt=&quot;image&quot;&gt;&lt;/a&gt;&lt;/div&gt;\r\n						&lt;/div&gt;\r\n						&lt;div class=&quot;col col-md-5 col-sm-5 col-xs-12&quot;&gt;\r\n						&lt;div class=&quot;image&quot;&gt;&lt;a href=&quot;index.php?route=product/category&amp;amp;path=228&quot;&gt;&lt;img src=&quot;image/catalog/cmsblock/img2-top-skybook3.jpg&quot; alt=&quot;image&quot;&gt;&lt;/a&gt;&lt;/div&gt;\r\n						&lt;/div&gt;\r\n						&lt;div class=&quot;col col-md-4 col-sm-4 col-xs-12&quot;&gt;\r\n						&lt;div class=&quot;image&quot;&gt;&lt;a href=&quot;index.php?route=product/category&amp;amp;path=191&quot;&gt;&lt;img src=&quot;image/catalog/cmsblock/img3-top-skybook3.jpg&quot; alt=&quot;image&quot;&gt;&lt;/a&gt;&lt;/div&gt;\r\n						&lt;/div&gt;\r\n						&lt;/div&gt;\r\n						&lt;/div&gt;\r\n						&lt;/div&gt;\r\n					 									 									'),
(339, 1, 78, 'Blog   ', NULL, '										  										  										  										  									 									 									 									'),
(380, 1, 106, 'Static Middle Koparion1   ', NULL, '										  										  										  &lt;div class=&quot;banner-static static-middle-skybook1&quot;&gt;\r\n&lt;div class=&quot;row&quot;&gt;\r\n&lt;div class=&quot;col col-sm-6 col-xs-12&quot;&gt;\r\n&lt;div class=&quot;image&quot;&gt;&lt;a href=&quot;index.php?route=product/category&amp;amp;path=228&quot;&gt;&lt;img src=&quot;image/catalog/cmsblock/img1-middle-skybook1.jpg&quot; alt=&quot;image&quot;&gt;&lt;/a&gt;&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;div class=&quot;col col-sm-6 col-xs-12&quot;&gt;\r\n&lt;div class=&quot;image&quot;&gt;&lt;a href=&quot;index.php?route=product/category&amp;amp;path=191&quot;&gt;&lt;img src=&quot;image/catalog/cmsblock/img2-middle-skybook1.jpg&quot; alt=&quot;image&quot;&gt; &lt;/a&gt;&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;\r\n 									 									 									'),
(391, 9, 114, 'Static Top Koparion3   ', NULL, '										  										  										  &lt;div class=&quot;banner-static static-top-skybook3&quot;&gt;\r\n					\r\n						&lt;div class=&quot;container-inner&quot;&gt;\r\n						&lt;div class=&quot;col col-top-1&quot;&gt;\r\n						&lt;div class=&quot;image&quot;&gt;&lt;a href=&quot;index.php?route=product/category&amp;amp;path=239&quot;&gt;&lt;img src=&quot;image/catalog/cmsblock/img1-top-skybook3.jpg&quot; alt=&quot;image&quot;&gt;&lt;/a&gt;&lt;/div&gt;\r\n						&lt;/div&gt;\r\n						&lt;div class=&quot;col col-top-2&quot;&gt;\r\n						&lt;div class=&quot;image image1&quot;&gt;&lt;a href=&quot;index.php?route=product/category&amp;amp;path=228&quot;&gt;&lt;img src=&quot;image/catalog/cmsblock/img2-top-skybook3.jpg&quot; alt=&quot;image&quot;&gt;&lt;/a&gt;&lt;/div&gt;\r\n						&lt;div class=&quot;image image2&quot;&gt;&lt;a href=&quot;index.php?route=product/category&amp;amp;path=191&quot;&gt;&lt;img src=&quot;image/catalog/cmsblock/img3-top-skybook3.jpg&quot; alt=&quot;image&quot;&gt;&lt;/a&gt;&lt;/div&gt;\r\n						&lt;div class=&quot;image image3&quot;&gt;&lt;a href=&quot;index.php?route=product/category&amp;amp;path=207&quot;&gt;&lt;img src=&quot;image/catalog/cmsblock/img4-top-skybook3.jpg&quot; alt=&quot;image&quot;&gt;&lt;/a&gt;&lt;/div&gt;\r\n						&lt;div class=&quot;image image4&quot;&gt;&lt;a href=&quot;index.php?route=product/category&amp;amp;path=315&quot;&gt;&lt;img src=&quot;image/catalog/cmsblock/img5-top-skybook3.jpg&quot; alt=&quot;image&quot;&gt;&lt;/a&gt;&lt;/div&gt;\r\n						&lt;/div&gt;\r\n						&lt;/div&gt;\r\n&lt;div class=&quot;clearfix&quot;&gt;&lt;/div&gt;  \r\n						&lt;/div&gt;\r\n					 									 									 									'),
(341, 1, 108, 'Sale off', NULL, '										  									'),
(343, 1, 109, 'Header Link', NULL, '										  &lt;a href=&quot;index.php?route=account/order&quot; title=&quot;Track Your Order&quot;&gt;Track Your Order&lt;/a&gt;  									'),
(344, 1, 110, 'Static Author Best', NULL, '&lt;div class=&quot;banner-static static-author-best&quot;&gt;\r\n						&lt;div class=&quot;col-des&quot;&gt;\r\n						&lt;h2 class=&quot;title&quot;&gt;Author best selling&lt;/h2&gt;\r\n						&lt;p class=&quot;name&quot;&gt;J. k.&lt;span&gt;Rowling&lt;/span&gt;&lt;/p&gt;\r\n						&lt;p class=&quot;categories&quot;&gt;categories: &lt;a href=&quot;index.php?route=product/category&amp;amp;path=239&quot;&gt;Books&lt;/a&gt;, &lt;a href=&quot;index.php?route=product/category&amp;amp;path=228&quot;&gt;Audiobooks&lt;/a&gt;&lt;/p&gt;\r\n						&lt;p class=&quot;des&quot;&gt;Vestibulum porttitor iaculis gravida. Praesent vestibulum varius placerat. Cras tempor congue neque, id aliquam orci finibus sit amet. Fusce at facilisis arcu. Donec aliquet nulla id turpis semper, a bibendum metus vulputate. Suspendisse potenti.&lt;/p&gt;\r\n						&lt;ul class=&quot;social-author&quot;&gt;\r\n						&lt;li&gt;&lt;a class=&quot;fa fa-facebook&quot; href=&quot;#&quot;&gt;facebook&lt;/a&gt;&lt;/li&gt;\r\n						&lt;li&gt;&lt;a class=&quot;fa fa-twitter&quot; href=&quot;#&quot;&gt;twitter&lt;/a&gt;&lt;/li&gt;\r\n						&lt;/ul&gt;\r\n						&lt;/div&gt;\r\n						&lt;div class=&quot;col-image&quot;&gt;\r\n						&lt;div class=&quot;image&quot;&gt;&lt;a href=&quot;index.php?route=product/category&amp;amp;path=239&quot;&gt;&lt;img src=&quot;image/catalog/cmsblock/img-author-best.jpg&quot; alt=&quot;image&quot;&gt;&lt;/a&gt;&lt;/div&gt;\r\n						&lt;/div&gt;\r\n						&lt;/div&gt;'),
(368, 1, 116, 'Corporate 4   ', NULL, '&lt;div class=&quot;ma-corporate-about&quot;&gt;\r\n&lt;div class=&quot;row&quot;&gt;\r\n						\r\n						&lt;div class=&quot;col col-lg-12 col-md-4 col-sm-4 col-xs-12&quot;&gt;\r\n						&lt;div class=&quot;block-wrapper wrapper1&quot;&gt;\r\n						&lt;div class=&quot;text-des&quot;&gt;\r\n						&lt;p&gt;Free shipping item&lt;/p&gt;\r\n						&lt;span&gt;For all orders over $500&lt;/span&gt;&lt;/div&gt;\r\n						&lt;/div&gt;\r\n						&lt;/div&gt;\r\n						&lt;div class=&quot;col col-lg-12 col-md-4 col-sm-4 col-xs-12&quot;&gt;\r\n						&lt;div class=&quot;block-wrapper wrapper2&quot;&gt;\r\n						&lt;div class=&quot;text-des&quot;&gt;\r\n						&lt;p&gt;Money back guarante&lt;/p&gt;\r\n						&lt;span&gt;100% money back guarante&lt;/span&gt;&lt;/div&gt;\r\n						&lt;/div&gt;\r\n						&lt;/div&gt;\r\n						&lt;div class=&quot;col col-lg-12 col-md-4 col-sm-4 col-xs-12&quot;&gt;\r\n						&lt;div class=&quot;block-wrapper wrapper3&quot;&gt;\r\n						&lt;div class=&quot;text-des&quot;&gt;\r\n						&lt;p&gt;Cash on delivery&lt;/p&gt;\r\n						&lt;span&gt;Lorem ipsum dolor amet&lt;/span&gt;&lt;/div&gt;\r\n						&lt;/div&gt;\r\n						&lt;/div&gt;\r\n						&lt;/div&gt;\r\n						&lt;/div&gt;\r\n						 									'),
(387, 9, 117, 'Static Top Koparion4   ', NULL, '										  										  										  &lt;div class=&quot;banner-static static-top-skybook4&quot;&gt;\r\n						&lt;div class=&quot;col col1&quot;&gt;\r\n						&lt;div class=&quot;image&quot;&gt;&lt;a href=&quot;index.php?route=product/category&amp;amp;path=239&quot;&gt;&lt;img src=&quot;image/catalog/cmsblock/img2-top-skybook3.jpg&quot; alt=&quot;image&quot;&gt;&lt;/a&gt;&lt;/div&gt;\r\n						&lt;/div&gt;\r\n						&lt;div class=&quot;col col2&quot;&gt;\r\n						&lt;div class=&quot;image&quot;&gt;&lt;a href=&quot;index.php?route=product/category&amp;amp;path=228&quot;&gt;&lt;img src=&quot;image/catalog/cmsblock/img3-top-skybook3.jpg&quot; alt=&quot;image&quot;&gt;&lt;/a&gt;&lt;/div&gt;\r\n						&lt;/div&gt;\r\n&lt;div class=&quot;clearfix&quot;&gt;&lt;/div&gt;\r\n						&lt;/div&gt; 									 									 									'),
(348, 1, 81, 'Footer Static                   ', NULL, '										  										  										  										  &lt;div class=&quot;footer-title&quot;&gt;&lt;h5&gt;STORE INFORMATION&lt;/h5&gt;&lt;/div&gt;\r\n\r\n&lt;div class=&quot;footer-content&quot;&gt;\r\n&lt;div class=&quot;footer-contact&quot;&gt;\r\n&lt;p class=&quot;adress&quot;&gt;&lt;span&gt;My Company &lt;/span&gt;42 avenue des Champs Elysées 75000 Paris France&lt;/p&gt;\r\n&lt;p&gt;&lt;span&gt;Call us now:&lt;/span&gt; (+1)866-540-3229&lt;/p&gt;\r\n&lt;p&gt;&lt;span&gt;Email:&lt;/span&gt; support@plazathemes.com&lt;/p&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;\r\n																																	 									 									 									 									 									 									 									 									'),
(351, 1, 112, 'Payment', NULL, '&lt;div class=&quot;payment&quot;&gt;\r\n&lt;img src=&quot;image/catalog/cmsblock/payment.png&quot; alt=&quot;payment&quot;&gt;\r\n&lt;/div&gt;'),
(353, 1, 107, 'Static Sidebar  ', NULL, '										  										  &lt;div class=&quot;banner-static static-sidebar&quot;&gt;\r\n&lt;div class=&quot;image&quot;&gt;&lt;a href=&quot;#&quot;&gt;&lt;img src=&quot;image/catalog/cmsblock/img-sidebar.jpg&quot; alt=&quot;image&quot;&gt;&lt;/a&gt;&lt;/div&gt;\r\n&lt;/div&gt; 									 									'),
(389, 9, 113, 'Static Slider Koparion2  ', NULL, '										  										  &lt;div class=&quot;banner-static static-slider-group&quot;&gt;\r\n&lt;div class=&quot;image&quot;&gt;&lt;a href=&quot;index.php?route=product/category&amp;amp;path=239&quot;&gt;&lt;img src=&quot;image/catalog/cmsblock/img-static-slider.jpg&quot; alt=&quot;image&quot;&gt;&lt;/a&gt;&lt;/div&gt;\r\n&lt;/div&gt; 									 									'),
(340, 1, 79, 'Contact Us ', NULL, '										  										  									 									'),
(385, 9, 119, 'Static Middle Koparion6   ', NULL, '										  &lt;div class=&quot;banner-static static-middle-skybook6&quot;&gt;\r\n						\r\n						&lt;div class=&quot;row&quot;&gt;\r\n						\r\n						&lt;div class=&quot;col col-sm-6 col-xs-12&quot;&gt;\r\n						&lt;div class=&quot;image&quot;&gt;&lt;a href=&quot;index.php?route=product/category&amp;amp;path=228&quot;&gt;&lt;img src=&quot;image/catalog/cmsblock/img1-middle-skybook6.jpg&quot; alt=&quot;image&quot;&gt;&lt;/a&gt;&lt;/div&gt;\r\n						&lt;/div&gt;\r\n						&lt;div class=&quot;col col-sm-6 col-xs-12&quot;&gt;\r\n						&lt;div class=&quot;image&quot;&gt;&lt;a href=&quot;index.php?route=product/category&amp;amp;path=191&quot;&gt;&lt;img src=&quot;image/catalog/cmsblock/img2-middle-skybook6.jpg&quot; alt=&quot;image&quot;&gt; &lt;/a&gt;&lt;/div&gt;\r\n						&lt;/div&gt;\r\n						&lt;/div&gt;\r\n						&lt;/div&gt;\r\n						\r\n					 									'),
(354, 9, 83, 'Social  ', NULL, '&lt;div class=&quot;follow&quot;&gt;\r\n&lt;label&gt;Stay Connected&lt;/label&gt;\r\n&lt;ul class=&quot;link-follow&quot;&gt;\r\n&lt;li class=&quot;first&quot;&gt;&lt;a class=&quot;twitter fa fa-twitter&quot; title=&quot;Twitter&quot; href=&quot;https://twitter.com/plazathemes&quot;&gt;&lt;span&gt;twitter&lt;/span&gt;&lt;/a&gt;&lt;/li&gt;\r\n&lt;li&gt;&lt;a class=&quot;google fa fa-google-plus&quot; title=&quot;Google&quot; href=&quot;#&quot;&gt;&lt;span&gt;google &lt;/span&gt;&lt;/a&gt;&lt;/li&gt;\r\n&lt;li&gt;&lt;a class=&quot;facebook fa fa-facebook&quot; title=&quot;Facebook&quot; href=&quot;https://www.facebook.com/plazathemes1&quot;&gt;&lt;span&gt;facebook&lt;/span&gt;&lt;/a&gt;&lt;/li&gt;\r\n&lt;li&gt;&lt;a class=&quot;youtube fa fa-youtube&quot; title=&quot;Youtube&quot; href=&quot;https://www.youtube.com/user/plazathemes&quot;&gt;&lt;span&gt;youtube &lt;/span&gt;&lt;/a&gt;&lt;/li&gt;\r\n&lt;li&gt;&lt;a class=&quot;flickr fa fa-flickr&quot; title=&quot;Flickr&quot; href=&quot;https://www.youtube.com/user/plazathemes&quot;&gt;&lt;span&gt;Flickr &lt;/span&gt;&lt;/a&gt;&lt;/li&gt;\r\n&lt;li&gt;&lt;a class=&quot;vimeo fa fa-vimeo-square&quot; title=&quot;Vimeo&quot; href=&quot;#&quot;&gt;&lt;span&gt;Vimeo&lt;/span&gt;&lt;/a&gt;&lt;/li&gt;\r\n&lt;li&gt;&lt;a class=&quot;instagram fa fa-instagram&quot; title=&quot;Instagram&quot; href=&quot;#&quot;&gt;&lt;span&gt;Instagram&lt;/span&gt;&lt;/a&gt;&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;/div&gt;																																				 									 									'),
(378, 1, 111, 'Links Footer ', NULL, '										  &lt;ul class=&quot;links-footer&quot;&gt;\r\n&lt;li&gt;&lt;a href=&quot;index.php?route=common/home&quot;&gt;home&lt;/a&gt;&lt;/li&gt;\r\n&lt;li&gt;&lt;a href=&quot;index.php?route=information/information&amp;amp;information_id=4&quot;&gt;About&lt;/a&gt;&lt;/li&gt;\r\n&lt;li&gt;&lt;a href=&quot;http://www.plazathemes.com/&quot;&gt;Shop&lt;/a&gt;&lt;/li&gt;\r\n&lt;li&gt;&lt;a href=&quot;index.php?route=information/contact&quot;&gt;Contact&lt;/a&gt;&lt;/li&gt;\r\n&lt;li&gt;&lt;a href=&quot;index.php?route=affiliate/login&quot;&gt;Affiliate&lt;/a&gt;&lt;/li&gt;\r\n&lt;li&gt;&lt;a href=&quot;index.php?route=information/sitemap&quot;&gt;Site Map&lt;/a&gt;&lt;/li&gt;\r\n&lt;/ul&gt; 									'),
(335, 9, 80, 'Corporate      ', NULL, '										  										  										  										  										  										  &lt;div class=&quot;ma-corporate-about&quot;&gt;\r\n&lt;div class=&quot;row&quot;&gt;\r\n&lt;div class=&quot;col col-md-3 col-sm-6 col-sms-6 col-smb-12&quot;&gt;\r\n&lt;div class=&quot;block-wrapper wrapper1&quot;&gt;\r\n&lt;div class=&quot;text-des&quot;&gt;\r\n&lt;p&gt;Free shipping item&lt;/p&gt;\r\n&lt;span&gt;For all orders over $500&lt;/span&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;div class=&quot;col col-md-3 col-sm-6 col-sms-6 col-smb-12&quot;&gt;\r\n&lt;div class=&quot;block-wrapper wrapper2&quot;&gt;\r\n&lt;div class=&quot;text-des&quot;&gt;\r\n&lt;p&gt;Money back guarantee&lt;/p&gt;\r\n&lt;span&gt;100% money back guarante&lt;/span&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;div class=&quot;col col-md-3 col-sm-6 col-sms-6 col-smb-12&quot;&gt;\r\n&lt;div class=&quot;block-wrapper wrapper3&quot;&gt;\r\n&lt;div class=&quot;text-des&quot;&gt;\r\n&lt;p&gt;Cash on delivery&lt;/p&gt;\r\n&lt;span&gt;Lorem ipsum dolor amet consectetur&lt;/span&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;div class=&quot;col col-md-3 col-sm-6 col-sms-6 col-smb-12&quot;&gt;\r\n&lt;div class=&quot;block-wrapper wrapper4&quot;&gt;\r\n&lt;div class=&quot;text-des&quot;&gt;\r\n&lt;p&gt;Help &amp;amp; Support&lt;/p&gt;\r\n&lt;span&gt;Call us : + 0123.4567.89&lt;/span&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;\r\n																											 									 									 									 									 									 									&lt;/div&gt;&lt;/div&gt;'),
(339, 9, 78, 'Blog   ', NULL, '										  										  										  										  									 									 									 									'),
(381, 9, 106, 'Static Middle Koparion1   ', NULL, '										  										  										  &lt;div class=&quot;banner-static static-middle-skybook1&quot;&gt;\r\n&lt;div class=&quot;row&quot;&gt;\r\n&lt;div class=&quot;col col-sm-6 col-xs-12&quot;&gt;\r\n&lt;div class=&quot;image&quot;&gt;&lt;a href=&quot;index.php?route=product/category&amp;amp;path=228&quot;&gt;&lt;img src=&quot;image/catalog/cmsblock/img1-middle-skybook1.jpg&quot; alt=&quot;image&quot;&gt;&lt;/a&gt;&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;div class=&quot;col col-sm-6 col-xs-12&quot;&gt;\r\n&lt;div class=&quot;image&quot;&gt;&lt;a href=&quot;index.php?route=product/category&amp;amp;path=191&quot;&gt;&lt;img src=&quot;image/catalog/cmsblock/img2-middle-skybook1.jpg&quot; alt=&quot;image&quot;&gt; &lt;/a&gt;&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;\r\n 									 									 									'),
(341, 9, 108, 'Sale off', NULL, '										  									'),
(343, 9, 109, 'Header Link', NULL, '										  &lt;a href=&quot;index.php?route=account/order&quot; title=&quot;Track Your Order&quot;&gt;Track Your Order&lt;/a&gt;  									'),
(344, 9, 110, 'Static Author Best', NULL, '&lt;div class=&quot;banner-static static-author-best&quot;&gt;\r\n						&lt;div class=&quot;col-des&quot;&gt;\r\n						&lt;h2 class=&quot;title&quot;&gt;Author best selling&lt;/h2&gt;\r\n						&lt;p class=&quot;name&quot;&gt;J. k.&lt;span&gt;Rowling&lt;/span&gt;&lt;/p&gt;\r\n						&lt;p class=&quot;categories&quot;&gt;categories: &lt;a href=&quot;index.php?route=product/category&amp;amp;path=239&quot;&gt;Books&lt;/a&gt;, &lt;a href=&quot;index.php?route=product/category&amp;amp;path=228&quot;&gt;Audiobooks&lt;/a&gt;&lt;/p&gt;\r\n						&lt;p class=&quot;des&quot;&gt;Vestibulum porttitor iaculis gravida. Praesent vestibulum varius placerat. Cras tempor congue neque, id aliquam orci finibus sit amet. Fusce at facilisis arcu. Donec aliquet nulla id turpis semper, a bibendum metus vulputate. Suspendisse potenti.&lt;/p&gt;\r\n						&lt;ul class=&quot;social-author&quot;&gt;\r\n						&lt;li&gt;&lt;a class=&quot;fa fa-facebook&quot; href=&quot;#&quot;&gt;facebook&lt;/a&gt;&lt;/li&gt;\r\n						&lt;li&gt;&lt;a class=&quot;fa fa-twitter&quot; href=&quot;#&quot;&gt;twitter&lt;/a&gt;&lt;/li&gt;\r\n						&lt;/ul&gt;\r\n						&lt;/div&gt;\r\n						&lt;div class=&quot;col-image&quot;&gt;\r\n						&lt;div class=&quot;image&quot;&gt;&lt;a href=&quot;index.php?route=product/category&amp;amp;path=239&quot;&gt;&lt;img src=&quot;image/catalog/cmsblock/img-author-best.jpg&quot; alt=&quot;image&quot;&gt;&lt;/a&gt;&lt;/div&gt;\r\n						&lt;/div&gt;\r\n						&lt;/div&gt;'),
(368, 9, 116, 'Corporate 4   ', NULL, '&lt;div class=&quot;ma-corporate-about&quot;&gt;\r\n&lt;div class=&quot;row&quot;&gt;\r\n						\r\n						&lt;div class=&quot;col col-lg-12 col-md-4 col-sm-4 col-xs-12&quot;&gt;\r\n						&lt;div class=&quot;block-wrapper wrapper1&quot;&gt;\r\n						&lt;div class=&quot;text-des&quot;&gt;\r\n						&lt;p&gt;Free shipping item&lt;/p&gt;\r\n						&lt;span&gt;For all orders over $500&lt;/span&gt;&lt;/div&gt;\r\n						&lt;/div&gt;\r\n						&lt;/div&gt;\r\n						&lt;div class=&quot;col col-lg-12 col-md-4 col-sm-4 col-xs-12&quot;&gt;\r\n						&lt;div class=&quot;block-wrapper wrapper2&quot;&gt;\r\n						&lt;div class=&quot;text-des&quot;&gt;\r\n						&lt;p&gt;Money back guarante&lt;/p&gt;\r\n						&lt;span&gt;100% money back guarante&lt;/span&gt;&lt;/div&gt;\r\n						&lt;/div&gt;\r\n						&lt;/div&gt;\r\n						&lt;div class=&quot;col col-lg-12 col-md-4 col-sm-4 col-xs-12&quot;&gt;\r\n						&lt;div class=&quot;block-wrapper wrapper3&quot;&gt;\r\n						&lt;div class=&quot;text-des&quot;&gt;\r\n						&lt;p&gt;Cash on delivery&lt;/p&gt;\r\n						&lt;span&gt;Lorem ipsum dolor amet&lt;/span&gt;&lt;/div&gt;\r\n						&lt;/div&gt;\r\n						&lt;/div&gt;\r\n						&lt;/div&gt;\r\n						&lt;/div&gt;\r\n						 									'),
(386, 1, 117, 'Static Top Koparion4   ', NULL, '										  										  										  &lt;div class=&quot;banner-static static-top-skybook4&quot;&gt;\r\n						&lt;div class=&quot;col col1&quot;&gt;\r\n						&lt;div class=&quot;image&quot;&gt;&lt;a href=&quot;index.php?route=product/category&amp;amp;path=239&quot;&gt;&lt;img src=&quot;image/catalog/cmsblock/img2-top-skybook3.jpg&quot; alt=&quot;image&quot;&gt;&lt;/a&gt;&lt;/div&gt;\r\n						&lt;/div&gt;\r\n						&lt;div class=&quot;col col2&quot;&gt;\r\n						&lt;div class=&quot;image&quot;&gt;&lt;a href=&quot;index.php?route=product/category&amp;amp;path=228&quot;&gt;&lt;img src=&quot;image/catalog/cmsblock/img3-top-skybook3.jpg&quot; alt=&quot;image&quot;&gt;&lt;/a&gt;&lt;/div&gt;\r\n						&lt;/div&gt;\r\n&lt;div class=&quot;clearfix&quot;&gt;&lt;/div&gt;\r\n						&lt;/div&gt; 									 									 									'),
(395, 9, 105, 'Static Top Koparion1       ', NULL, '										  										  										  										  										  										  										  &lt;div class=&quot;banner-static static-top-skybook1&quot;&gt;\r\n&lt;div class=&quot;image&quot;&gt;&lt;a href=&quot;index.php?route=product/category&amp;amp;path=239&quot;&gt;&lt;img src=&quot;image/catalog/cmsblock/img-top-skybook1.jpg&quot; alt=&quot;image&quot;&gt;&lt;span class=&quot;text&quot;&gt; &lt;span class=&quot;text1&quot;&gt;G. Meyer Books &amp;amp; Spiritual Traveler Press&lt;/span&gt; &lt;span class=&quot;text2&quot;&gt;Sale up to 30% off&lt;/span&gt; &lt;/span&gt;&lt;/a&gt;&lt;/div&gt;\r\n&lt;/div&gt;\r\n 									 									 									 									 									 									 									'),
(348, 9, 81, 'Footer Static                   ', NULL, '										  										  										  										  &lt;div class=&quot;footer-title&quot;&gt;&lt;h5&gt;STORE INFORMATION&lt;/h5&gt;&lt;/div&gt;\r\n\r\n&lt;div class=&quot;footer-content&quot;&gt;\r\n&lt;div class=&quot;footer-contact&quot;&gt;\r\n&lt;p class=&quot;adress&quot;&gt;&lt;span&gt;My Company &lt;/span&gt;42 avenue des Champs Elysées 75000 Paris France&lt;/p&gt;\r\n&lt;p&gt;&lt;span&gt;Call us now:&lt;/span&gt; (+1)866-540-3229&lt;/p&gt;\r\n&lt;p&gt;&lt;span&gt;Email:&lt;/span&gt; support@plazathemes.com&lt;/p&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;\r\n																																	 									 									 									 									 									 									 									 									'),
(351, 9, 112, 'Payment', NULL, '&lt;div class=&quot;payment&quot;&gt;\r\n&lt;img src=&quot;image/catalog/cmsblock/payment.png&quot; alt=&quot;payment&quot;&gt;\r\n&lt;/div&gt;'),
(353, 9, 107, 'Static Sidebar  ', NULL, '										  										  &lt;div class=&quot;banner-static static-sidebar&quot;&gt;\r\n&lt;div class=&quot;image&quot;&gt;&lt;a href=&quot;#&quot;&gt;&lt;img src=&quot;image/catalog/cmsblock/img-sidebar.jpg&quot; alt=&quot;image&quot;&gt;&lt;/a&gt;&lt;/div&gt;\r\n&lt;/div&gt; 									 									'),
(388, 1, 113, 'Static Slider Koparion2  ', NULL, '										  										  &lt;div class=&quot;banner-static static-slider-group&quot;&gt;\r\n&lt;div class=&quot;image&quot;&gt;&lt;a href=&quot;index.php?route=product/category&amp;amp;path=239&quot;&gt;&lt;img src=&quot;image/catalog/cmsblock/img-static-slider.jpg&quot; alt=&quot;image&quot;&gt;&lt;/a&gt;&lt;/div&gt;\r\n&lt;/div&gt; 									 									'),
(390, 1, 114, 'Static Top Koparion3   ', NULL, '										  										  										  &lt;div class=&quot;banner-static static-top-skybook3&quot;&gt;\r\n					\r\n						&lt;div class=&quot;container-inner&quot;&gt;\r\n						&lt;div class=&quot;col col-top-1&quot;&gt;\r\n						&lt;div class=&quot;image&quot;&gt;&lt;a href=&quot;index.php?route=product/category&amp;amp;path=239&quot;&gt;&lt;img src=&quot;image/catalog/cmsblock/img1-top-skybook3.jpg&quot; alt=&quot;image&quot;&gt;&lt;/a&gt;&lt;/div&gt;\r\n						&lt;/div&gt;\r\n						&lt;div class=&quot;col col-top-2&quot;&gt;\r\n						&lt;div class=&quot;image image1&quot;&gt;&lt;a href=&quot;index.php?route=product/category&amp;amp;path=228&quot;&gt;&lt;img src=&quot;image/catalog/cmsblock/img2-top-skybook3.jpg&quot; alt=&quot;image&quot;&gt;&lt;/a&gt;&lt;/div&gt;\r\n						&lt;div class=&quot;image image2&quot;&gt;&lt;a href=&quot;index.php?route=product/category&amp;amp;path=191&quot;&gt;&lt;img src=&quot;image/catalog/cmsblock/img3-top-skybook3.jpg&quot; alt=&quot;image&quot;&gt;&lt;/a&gt;&lt;/div&gt;\r\n						&lt;div class=&quot;image image3&quot;&gt;&lt;a href=&quot;index.php?route=product/category&amp;amp;path=207&quot;&gt;&lt;img src=&quot;image/catalog/cmsblock/img4-top-skybook3.jpg&quot; alt=&quot;image&quot;&gt;&lt;/a&gt;&lt;/div&gt;\r\n						&lt;div class=&quot;image image4&quot;&gt;&lt;a href=&quot;index.php?route=product/category&amp;amp;path=315&quot;&gt;&lt;img src=&quot;image/catalog/cmsblock/img5-top-skybook3.jpg&quot; alt=&quot;image&quot;&gt;&lt;/a&gt;&lt;/div&gt;\r\n						&lt;/div&gt;\r\n						&lt;/div&gt;\r\n&lt;div class=&quot;clearfix&quot;&gt;&lt;/div&gt;  \r\n						&lt;/div&gt;\r\n					 									 									 									'),
(392, 1, 115, 'Static Slider Koparion4 ', NULL, '										  &lt;div class=&quot;banner-static static-slider-skybook4&quot;&gt;\r\n						&lt;div class=&quot;image&quot;&gt;&lt;a href=&quot;index.php?route=product/category&amp;amp;path=239&quot;&gt;&lt;img src=&quot;image/catalog/cmsblock/static-slider-skybook4.jpg&quot; alt=&quot;image&quot;&gt;&lt;/a&gt;&lt;/div&gt;\r\n						&lt;/div&gt; 									'),
(340, 9, 79, 'Contact Us ', NULL, '										  										  									 									'),
(382, 1, 118, 'Static Top Koparion6  ', NULL, '										  										  &lt;div class=&quot;banner-static static-top-skybook6&quot;&gt;\r\n						\r\n						&lt;div class=&quot;container-inner&quot;&gt;\r\n						&lt;div class=&quot;row&quot;&gt;\r\n						&lt;div class=&quot;col col-md-3 col-sm-3 col-xs-12&quot;&gt;\r\n						&lt;div class=&quot;image&quot;&gt;&lt;a href=&quot;index.php?route=product/category&amp;amp;path=239&quot;&gt;&lt;img src=&quot;image/catalog/cmsblock/img1-top-skybook6.jpg&quot; alt=&quot;image&quot;&gt;&lt;/a&gt;&lt;/div&gt;\r\n						&lt;/div&gt;\r\n						&lt;div class=&quot;col col-md-5 col-sm-5 col-xs-12&quot;&gt;\r\n						&lt;div class=&quot;image&quot;&gt;&lt;a href=&quot;index.php?route=product/category&amp;amp;path=228&quot;&gt;&lt;img src=&quot;image/catalog/cmsblock/img2-top-skybook3.jpg&quot; alt=&quot;image&quot;&gt;&lt;/a&gt;&lt;/div&gt;\r\n						&lt;/div&gt;\r\n						&lt;div class=&quot;col col-md-4 col-sm-4 col-xs-12&quot;&gt;\r\n						&lt;div class=&quot;image&quot;&gt;&lt;a href=&quot;index.php?route=product/category&amp;amp;path=191&quot;&gt;&lt;img src=&quot;image/catalog/cmsblock/img3-top-skybook3.jpg&quot; alt=&quot;image&quot;&gt;&lt;/a&gt;&lt;/div&gt;\r\n						&lt;/div&gt;\r\n						&lt;/div&gt;\r\n						&lt;/div&gt;\r\n						&lt;/div&gt;\r\n					 									 									'),
(384, 1, 119, 'Static Middle Koparion6   ', NULL, '										  &lt;div class=&quot;banner-static static-middle-skybook6&quot;&gt;\r\n						\r\n						&lt;div class=&quot;row&quot;&gt;\r\n						\r\n						&lt;div class=&quot;col col-sm-6 col-xs-12&quot;&gt;\r\n						&lt;div class=&quot;image&quot;&gt;&lt;a href=&quot;index.php?route=product/category&amp;amp;path=228&quot;&gt;&lt;img src=&quot;image/catalog/cmsblock/img1-middle-skybook6.jpg&quot; alt=&quot;image&quot;&gt;&lt;/a&gt;&lt;/div&gt;\r\n						&lt;/div&gt;\r\n						&lt;div class=&quot;col col-sm-6 col-xs-12&quot;&gt;\r\n						&lt;div class=&quot;image&quot;&gt;&lt;a href=&quot;index.php?route=product/category&amp;amp;path=191&quot;&gt;&lt;img src=&quot;image/catalog/cmsblock/img2-middle-skybook6.jpg&quot; alt=&quot;image&quot;&gt; &lt;/a&gt;&lt;/div&gt;\r\n						&lt;/div&gt;\r\n						&lt;/div&gt;\r\n						&lt;/div&gt;\r\n						\r\n					 									');

-- --------------------------------------------------------

--
-- Table structure for table `oc_cmsblock_to_store`
--

DROP TABLE IF EXISTS `oc_cmsblock_to_store`;
CREATE TABLE `oc_cmsblock_to_store` (
  `cmsblock_id` int(11) DEFAULT NULL,
  `store_id` tinyint(4) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `oc_country`
--

DROP TABLE IF EXISTS `oc_country`;
CREATE TABLE `oc_country` (
  `country_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `iso_code_2` varchar(2) NOT NULL,
  `iso_code_3` varchar(3) NOT NULL,
  `address_format` text NOT NULL,
  `postcode_required` tinyint(1) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_country`
--

INSERT INTO `oc_country` (`country_id`, `name`, `iso_code_2`, `iso_code_3`, `address_format`, `postcode_required`, `status`) VALUES
(1, 'Afghanistan', 'AF', 'AFG', '', 0, 1),
(2, 'Albania', 'AL', 'ALB', '', 0, 1),
(3, 'Algeria', 'DZ', 'DZA', '', 0, 1),
(4, 'American Samoa', 'AS', 'ASM', '', 0, 1),
(5, 'Andorra', 'AD', 'AND', '', 0, 1),
(6, 'Angola', 'AO', 'AGO', '', 0, 1),
(7, 'Anguilla', 'AI', 'AIA', '', 0, 1),
(8, 'Antarctica', 'AQ', 'ATA', '', 0, 1),
(9, 'Antigua and Barbuda', 'AG', 'ATG', '', 0, 1),
(10, 'Argentina', 'AR', 'ARG', '', 0, 1),
(11, 'Armenia', 'AM', 'ARM', '', 0, 1),
(12, 'Aruba', 'AW', 'ABW', '', 0, 1),
(13, 'Australia', 'AU', 'AUS', '', 0, 1),
(14, 'Austria', 'AT', 'AUT', '', 0, 1),
(15, 'Azerbaijan', 'AZ', 'AZE', '', 0, 1),
(16, 'Bahamas', 'BS', 'BHS', '', 0, 1),
(17, 'Bahrain', 'BH', 'BHR', '', 0, 1),
(18, 'Bangladesh', 'BD', 'BGD', '', 0, 1),
(19, 'Barbados', 'BB', 'BRB', '', 0, 1),
(20, 'Belarus', 'BY', 'BLR', '', 0, 1),
(21, 'Belgium', 'BE', 'BEL', '{firstname} {lastname}\r\n{company}\r\n{address_1}\r\n{address_2}\r\n{postcode} {city}\r\n{country}', 0, 1),
(22, 'Belize', 'BZ', 'BLZ', '', 0, 1),
(23, 'Benin', 'BJ', 'BEN', '', 0, 1),
(24, 'Bermuda', 'BM', 'BMU', '', 0, 1),
(25, 'Bhutan', 'BT', 'BTN', '', 0, 1),
(26, 'Bolivia', 'BO', 'BOL', '', 0, 1),
(27, 'Bosnia and Herzegovina', 'BA', 'BIH', '', 0, 1),
(28, 'Botswana', 'BW', 'BWA', '', 0, 1),
(29, 'Bouvet Island', 'BV', 'BVT', '', 0, 1),
(30, 'Brazil', 'BR', 'BRA', '', 0, 1),
(31, 'British Indian Ocean Territory', 'IO', 'IOT', '', 0, 1),
(32, 'Brunei Darussalam', 'BN', 'BRN', '', 0, 1),
(33, 'Bulgaria', 'BG', 'BGR', '', 0, 1),
(34, 'Burkina Faso', 'BF', 'BFA', '', 0, 1),
(35, 'Burundi', 'BI', 'BDI', '', 0, 1),
(36, 'Cambodia', 'KH', 'KHM', '', 0, 1),
(37, 'Cameroon', 'CM', 'CMR', '', 0, 1),
(38, 'Canada', 'CA', 'CAN', '', 0, 1),
(39, 'Cape Verde', 'CV', 'CPV', '', 0, 1),
(40, 'Cayman Islands', 'KY', 'CYM', '', 0, 1),
(41, 'Central African Republic', 'CF', 'CAF', '', 0, 1),
(42, 'Chad', 'TD', 'TCD', '', 0, 1),
(43, 'Chile', 'CL', 'CHL', '', 0, 1),
(44, 'China', 'CN', 'CHN', '', 0, 1),
(45, 'Christmas Island', 'CX', 'CXR', '', 0, 1),
(46, 'Cocos (Keeling) Islands', 'CC', 'CCK', '', 0, 1),
(47, 'Colombia', 'CO', 'COL', '', 0, 1),
(48, 'Comoros', 'KM', 'COM', '', 0, 1),
(49, 'Congo', 'CG', 'COG', '', 0, 1),
(50, 'Cook Islands', 'CK', 'COK', '', 0, 1),
(51, 'Costa Rica', 'CR', 'CRI', '', 0, 1),
(52, 'Cote D\'Ivoire', 'CI', 'CIV', '', 0, 1),
(53, 'Croatia', 'HR', 'HRV', '', 0, 1),
(54, 'Cuba', 'CU', 'CUB', '', 0, 1),
(55, 'Cyprus', 'CY', 'CYP', '', 0, 1),
(56, 'Czech Republic', 'CZ', 'CZE', '', 0, 1),
(57, 'Denmark', 'DK', 'DNK', '', 0, 1),
(58, 'Djibouti', 'DJ', 'DJI', '', 0, 1),
(59, 'Dominica', 'DM', 'DMA', '', 0, 1),
(60, 'Dominican Republic', 'DO', 'DOM', '', 0, 1),
(61, 'East Timor', 'TL', 'TLS', '', 0, 1),
(62, 'Ecuador', 'EC', 'ECU', '', 0, 1),
(63, 'Egypt', 'EG', 'EGY', '', 0, 1),
(64, 'El Salvador', 'SV', 'SLV', '', 0, 1),
(65, 'Equatorial Guinea', 'GQ', 'GNQ', '', 0, 1),
(66, 'Eritrea', 'ER', 'ERI', '', 0, 1),
(67, 'Estonia', 'EE', 'EST', '', 0, 1),
(68, 'Ethiopia', 'ET', 'ETH', '', 0, 1),
(69, 'Falkland Islands (Malvinas)', 'FK', 'FLK', '', 0, 1),
(70, 'Faroe Islands', 'FO', 'FRO', '', 0, 1),
(71, 'Fiji', 'FJ', 'FJI', '', 0, 1),
(72, 'Finland', 'FI', 'FIN', '', 0, 1),
(74, 'France, Metropolitan', 'FR', 'FRA', '{firstname} {lastname}\r\n{company}\r\n{address_1}\r\n{address_2}\r\n{postcode} {city}\r\n{country}', 1, 1),
(75, 'French Guiana', 'GF', 'GUF', '', 0, 1),
(76, 'French Polynesia', 'PF', 'PYF', '', 0, 1),
(77, 'French Southern Territories', 'TF', 'ATF', '', 0, 1),
(78, 'Gabon', 'GA', 'GAB', '', 0, 1),
(79, 'Gambia', 'GM', 'GMB', '', 0, 1),
(80, 'Georgia', 'GE', 'GEO', '', 0, 1),
(81, 'Germany', 'DE', 'DEU', '{company}\r\n{firstname} {lastname}\r\n{address_1}\r\n{address_2}\r\n{postcode} {city}\r\n{country}', 1, 1),
(82, 'Ghana', 'GH', 'GHA', '', 0, 1),
(83, 'Gibraltar', 'GI', 'GIB', '', 0, 1),
(84, 'Greece', 'GR', 'GRC', '', 0, 1),
(85, 'Greenland', 'GL', 'GRL', '', 0, 1),
(86, 'Grenada', 'GD', 'GRD', '', 0, 1),
(87, 'Guadeloupe', 'GP', 'GLP', '', 0, 1),
(88, 'Guam', 'GU', 'GUM', '', 0, 1),
(89, 'Guatemala', 'GT', 'GTM', '', 0, 1),
(90, 'Guinea', 'GN', 'GIN', '', 0, 1),
(91, 'Guinea-Bissau', 'GW', 'GNB', '', 0, 1),
(92, 'Guyana', 'GY', 'GUY', '', 0, 1),
(93, 'Haiti', 'HT', 'HTI', '', 0, 1),
(94, 'Heard and Mc Donald Islands', 'HM', 'HMD', '', 0, 1),
(95, 'Honduras', 'HN', 'HND', '', 0, 1),
(96, 'Hong Kong', 'HK', 'HKG', '', 0, 1),
(97, 'Hungary', 'HU', 'HUN', '', 0, 1),
(98, 'Iceland', 'IS', 'ISL', '', 0, 1),
(99, 'India', 'IN', 'IND', '', 0, 1),
(100, 'Indonesia', 'ID', 'IDN', '', 0, 1),
(101, 'Iran (Islamic Republic of)', 'IR', 'IRN', '', 0, 1),
(102, 'Iraq', 'IQ', 'IRQ', '', 0, 1),
(103, 'Ireland', 'IE', 'IRL', '', 0, 1),
(104, 'Israel', 'IL', 'ISR', '', 0, 1),
(105, 'Italy', 'IT', 'ITA', '', 0, 1),
(106, 'Jamaica', 'JM', 'JAM', '', 0, 1),
(107, 'Japan', 'JP', 'JPN', '', 0, 1),
(108, 'Jordan', 'JO', 'JOR', '', 0, 1),
(109, 'Kazakhstan', 'KZ', 'KAZ', '', 0, 1),
(110, 'Kenya', 'KE', 'KEN', '', 0, 1),
(111, 'Kiribati', 'KI', 'KIR', '', 0, 1),
(112, 'North Korea', 'KP', 'PRK', '', 0, 1),
(113, 'South Korea', 'KR', 'KOR', '', 0, 1),
(114, 'Kuwait', 'KW', 'KWT', '', 0, 1),
(115, 'Kyrgyzstan', 'KG', 'KGZ', '', 0, 1),
(116, 'Lao People\'s Democratic Republic', 'LA', 'LAO', '', 0, 1),
(117, 'Latvia', 'LV', 'LVA', '', 0, 1),
(118, 'Lebanon', 'LB', 'LBN', '', 0, 1),
(119, 'Lesotho', 'LS', 'LSO', '', 0, 1),
(120, 'Liberia', 'LR', 'LBR', '', 0, 1),
(121, 'Libyan Arab Jamahiriya', 'LY', 'LBY', '', 0, 1),
(122, 'Liechtenstein', 'LI', 'LIE', '', 0, 1),
(123, 'Lithuania', 'LT', 'LTU', '', 0, 1),
(124, 'Luxembourg', 'LU', 'LUX', '', 0, 1),
(125, 'Macau', 'MO', 'MAC', '', 0, 1),
(126, 'FYROM', 'MK', 'MKD', '', 0, 1),
(127, 'Madagascar', 'MG', 'MDG', '', 0, 1),
(128, 'Malawi', 'MW', 'MWI', '', 0, 1),
(129, 'Malaysia', 'MY', 'MYS', '', 0, 1),
(130, 'Maldives', 'MV', 'MDV', '', 0, 1),
(131, 'Mali', 'ML', 'MLI', '', 0, 1),
(132, 'Malta', 'MT', 'MLT', '', 0, 1),
(133, 'Marshall Islands', 'MH', 'MHL', '', 0, 1),
(134, 'Martinique', 'MQ', 'MTQ', '', 0, 1),
(135, 'Mauritania', 'MR', 'MRT', '', 0, 1),
(136, 'Mauritius', 'MU', 'MUS', '', 0, 1),
(137, 'Mayotte', 'YT', 'MYT', '', 0, 1),
(138, 'Mexico', 'MX', 'MEX', '', 0, 1),
(139, 'Micronesia, Federated States of', 'FM', 'FSM', '', 0, 1),
(140, 'Moldova, Republic of', 'MD', 'MDA', '', 0, 1),
(141, 'Monaco', 'MC', 'MCO', '', 0, 1),
(142, 'Mongolia', 'MN', 'MNG', '', 0, 1),
(143, 'Montserrat', 'MS', 'MSR', '', 0, 1),
(144, 'Morocco', 'MA', 'MAR', '', 0, 1),
(145, 'Mozambique', 'MZ', 'MOZ', '', 0, 1),
(146, 'Myanmar', 'MM', 'MMR', '', 0, 1),
(147, 'Namibia', 'NA', 'NAM', '', 0, 1),
(148, 'Nauru', 'NR', 'NRU', '', 0, 1),
(149, 'Nepal', 'NP', 'NPL', '', 0, 1),
(150, 'Netherlands', 'NL', 'NLD', '', 0, 1),
(151, 'Netherlands Antilles', 'AN', 'ANT', '', 0, 1),
(152, 'New Caledonia', 'NC', 'NCL', '', 0, 1),
(153, 'New Zealand', 'NZ', 'NZL', '', 0, 1),
(154, 'Nicaragua', 'NI', 'NIC', '', 0, 1),
(155, 'Niger', 'NE', 'NER', '', 0, 1),
(156, 'Nigeria', 'NG', 'NGA', '', 0, 1),
(157, 'Niue', 'NU', 'NIU', '', 0, 1),
(158, 'Norfolk Island', 'NF', 'NFK', '', 0, 1),
(159, 'Northern Mariana Islands', 'MP', 'MNP', '', 0, 1),
(160, 'Norway', 'NO', 'NOR', '', 0, 1),
(161, 'Oman', 'OM', 'OMN', '', 0, 1),
(162, 'Pakistan', 'PK', 'PAK', '', 0, 1),
(163, 'Palau', 'PW', 'PLW', '', 0, 1),
(164, 'Panama', 'PA', 'PAN', '', 0, 1),
(165, 'Papua New Guinea', 'PG', 'PNG', '', 0, 1),
(166, 'Paraguay', 'PY', 'PRY', '', 0, 1),
(167, 'Peru', 'PE', 'PER', '', 0, 1),
(168, 'Philippines', 'PH', 'PHL', '', 0, 1),
(169, 'Pitcairn', 'PN', 'PCN', '', 0, 1),
(170, 'Poland', 'PL', 'POL', '', 0, 1),
(171, 'Portugal', 'PT', 'PRT', '', 0, 1),
(172, 'Puerto Rico', 'PR', 'PRI', '', 0, 1),
(173, 'Qatar', 'QA', 'QAT', '', 0, 1),
(174, 'Reunion', 'RE', 'REU', '', 0, 1),
(175, 'Romania', 'RO', 'ROM', '', 0, 1),
(176, 'Russian Federation', 'RU', 'RUS', '', 0, 1),
(177, 'Rwanda', 'RW', 'RWA', '', 0, 1),
(178, 'Saint Kitts and Nevis', 'KN', 'KNA', '', 0, 1),
(179, 'Saint Lucia', 'LC', 'LCA', '', 0, 1),
(180, 'Saint Vincent and the Grenadines', 'VC', 'VCT', '', 0, 1),
(181, 'Samoa', 'WS', 'WSM', '', 0, 1),
(182, 'San Marino', 'SM', 'SMR', '', 0, 1),
(183, 'Sao Tome and Principe', 'ST', 'STP', '', 0, 1),
(184, 'Saudi Arabia', 'SA', 'SAU', '', 0, 1),
(185, 'Senegal', 'SN', 'SEN', '', 0, 1),
(186, 'Seychelles', 'SC', 'SYC', '', 0, 1),
(187, 'Sierra Leone', 'SL', 'SLE', '', 0, 1),
(188, 'Singapore', 'SG', 'SGP', '', 0, 1),
(189, 'Slovak Republic', 'SK', 'SVK', '{firstname} {lastname}\r\n{company}\r\n{address_1}\r\n{address_2}\r\n{city} {postcode}\r\n{zone}\r\n{country}', 0, 1),
(190, 'Slovenia', 'SI', 'SVN', '', 0, 1),
(191, 'Solomon Islands', 'SB', 'SLB', '', 0, 1),
(192, 'Somalia', 'SO', 'SOM', '', 0, 1),
(193, 'South Africa', 'ZA', 'ZAF', '', 0, 1),
(194, 'South Georgia &amp; South Sandwich Islands', 'GS', 'SGS', '', 0, 1),
(195, 'Spain', 'ES', 'ESP', '', 0, 1),
(196, 'Sri Lanka', 'LK', 'LKA', '', 0, 1),
(197, 'St. Helena', 'SH', 'SHN', '', 0, 1),
(198, 'St. Pierre and Miquelon', 'PM', 'SPM', '', 0, 1),
(199, 'Sudan', 'SD', 'SDN', '', 0, 1),
(200, 'Suriname', 'SR', 'SUR', '', 0, 1),
(201, 'Svalbard and Jan Mayen Islands', 'SJ', 'SJM', '', 0, 1),
(202, 'Swaziland', 'SZ', 'SWZ', '', 0, 1),
(203, 'Sweden', 'SE', 'SWE', '{company}\r\n{firstname} {lastname}\r\n{address_1}\r\n{address_2}\r\n{postcode} {city}\r\n{country}', 1, 1),
(204, 'Switzerland', 'CH', 'CHE', '', 0, 1),
(205, 'Syrian Arab Republic', 'SY', 'SYR', '', 0, 1),
(206, 'Taiwan', 'TW', 'TWN', '', 0, 1),
(207, 'Tajikistan', 'TJ', 'TJK', '', 0, 1),
(208, 'Tanzania, United Republic of', 'TZ', 'TZA', '', 0, 1),
(209, 'Thailand', 'TH', 'THA', '', 0, 1),
(210, 'Togo', 'TG', 'TGO', '', 0, 1),
(211, 'Tokelau', 'TK', 'TKL', '', 0, 1),
(212, 'Tonga', 'TO', 'TON', '', 0, 1),
(213, 'Trinidad and Tobago', 'TT', 'TTO', '', 0, 1),
(214, 'Tunisia', 'TN', 'TUN', '', 0, 1),
(215, 'Turkey', 'TR', 'TUR', '', 0, 1),
(216, 'Turkmenistan', 'TM', 'TKM', '', 0, 1),
(217, 'Turks and Caicos Islands', 'TC', 'TCA', '', 0, 1),
(218, 'Tuvalu', 'TV', 'TUV', '', 0, 1),
(219, 'Uganda', 'UG', 'UGA', '', 0, 1),
(220, 'Ukraine', 'UA', 'UKR', '', 0, 1),
(221, 'United Arab Emirates', 'AE', 'ARE', '', 0, 1),
(222, 'United Kingdom', 'GB', 'GBR', '', 1, 1),
(223, 'United States', 'US', 'USA', '{firstname} {lastname}\r\n{company}\r\n{address_1}\r\n{address_2}\r\n{city}, {zone} {postcode}\r\n{country}', 0, 1),
(224, 'United States Minor Outlying Islands', 'UM', 'UMI', '', 0, 1),
(225, 'Uruguay', 'UY', 'URY', '', 0, 1),
(226, 'Uzbekistan', 'UZ', 'UZB', '', 0, 1),
(227, 'Vanuatu', 'VU', 'VUT', '', 0, 1),
(228, 'Vatican City State (Holy See)', 'VA', 'VAT', '', 0, 1),
(229, 'Venezuela', 'VE', 'VEN', '', 0, 1),
(230, 'Viet Nam', 'VN', 'VNM', '', 0, 1),
(231, 'Virgin Islands (British)', 'VG', 'VGB', '', 0, 1),
(232, 'Virgin Islands (U.S.)', 'VI', 'VIR', '', 0, 1),
(233, 'Wallis and Futuna Islands', 'WF', 'WLF', '', 0, 1),
(234, 'Western Sahara', 'EH', 'ESH', '', 0, 1),
(235, 'Yemen', 'YE', 'YEM', '', 0, 1),
(237, 'Democratic Republic of Congo', 'CD', 'COD', '', 0, 1),
(238, 'Zambia', 'ZM', 'ZMB', '', 0, 1),
(239, 'Zimbabwe', 'ZW', 'ZWE', '', 0, 1),
(242, 'Montenegro', 'ME', 'MNE', '', 0, 1),
(243, 'Serbia', 'RS', 'SRB', '', 0, 1),
(244, 'Aaland Islands', 'AX', 'ALA', '', 0, 1),
(245, 'Bonaire, Sint Eustatius and Saba', 'BQ', 'BES', '', 0, 1),
(246, 'Curacao', 'CW', 'CUW', '', 0, 1),
(247, 'Palestinian Territory, Occupied', 'PS', 'PSE', '', 0, 1),
(248, 'South Sudan', 'SS', 'SSD', '', 0, 1),
(249, 'St. Barthelemy', 'BL', 'BLM', '', 0, 1),
(250, 'St. Martin (French part)', 'MF', 'MAF', '', 0, 1),
(251, 'Canary Islands', 'IC', 'ICA', '', 0, 1),
(252, 'Ascension Island (British)', 'AC', 'ASC', '', 0, 1),
(253, 'Kosovo, Republic of', 'XK', 'UNK', '', 0, 1),
(254, 'Isle of Man', 'IM', 'IMN', '', 0, 1),
(255, 'Tristan da Cunha', 'TA', 'SHN', '', 0, 1),
(256, 'Guernsey', 'GG', 'GGY', '', 0, 1),
(257, 'Jersey', 'JE', 'JEY', '', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_coupon`
--

DROP TABLE IF EXISTS `oc_coupon`;
CREATE TABLE `oc_coupon` (
  `coupon_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `code` varchar(20) NOT NULL,
  `type` char(1) NOT NULL,
  `discount` decimal(15,4) NOT NULL,
  `logged` tinyint(1) NOT NULL,
  `shipping` tinyint(1) NOT NULL,
  `total` decimal(15,4) NOT NULL,
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00',
  `uses_total` int(11) NOT NULL,
  `uses_customer` varchar(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_coupon`
--

INSERT INTO `oc_coupon` (`coupon_id`, `name`, `code`, `type`, `discount`, `logged`, `shipping`, `total`, `date_start`, `date_end`, `uses_total`, `uses_customer`, `status`, `date_added`) VALUES
(4, '-10% Discount', '2222', 'P', '10.0000', 0, 0, '0.0000', '2014-01-01', '2020-01-01', 10, '10', 0, '2009-01-27 13:55:03'),
(5, 'Free Shipping', '3333', 'P', '0.0000', 0, 1, '100.0000', '2014-01-01', '2014-02-01', 10, '10', 0, '2009-03-14 21:13:53'),
(6, '-10.00 Discount', '1111', 'F', '10.0000', 0, 0, '10.0000', '2014-01-01', '2020-01-01', 100000, '10000', 0, '2009-03-14 21:15:18');

-- --------------------------------------------------------

--
-- Table structure for table `oc_coupon_category`
--

DROP TABLE IF EXISTS `oc_coupon_category`;
CREATE TABLE `oc_coupon_category` (
  `coupon_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_coupon_history`
--

DROP TABLE IF EXISTS `oc_coupon_history`;
CREATE TABLE `oc_coupon_history` (
  `coupon_history_id` int(11) NOT NULL,
  `coupon_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_coupon_product`
--

DROP TABLE IF EXISTS `oc_coupon_product`;
CREATE TABLE `oc_coupon_product` (
  `coupon_product_id` int(11) NOT NULL,
  `coupon_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_currency`
--

DROP TABLE IF EXISTS `oc_currency`;
CREATE TABLE `oc_currency` (
  `currency_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `code` varchar(3) NOT NULL,
  `symbol_left` varchar(12) NOT NULL,
  `symbol_right` varchar(12) NOT NULL,
  `decimal_place` char(1) NOT NULL,
  `value` double(15,8) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_currency`
--

INSERT INTO `oc_currency` (`currency_id`, `title`, `code`, `symbol_left`, `symbol_right`, `decimal_place`, `value`, `status`, `date_modified`) VALUES
(1, 'Pound Sterling', 'GBP', '£', '', '2', 0.75295535, 1, '2017-11-01 06:40:59'),
(2, 'US Dollar', 'USD', '$', '', '2', 1.00000000, 1, '2018-02-05 06:04:07'),
(3, 'Euro', 'EUR', '€', '', '2', 0.85888517, 1, '2017-11-01 06:40:59');

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer`
--

DROP TABLE IF EXISTS `oc_customer`;
CREATE TABLE `oc_customer` (
  `customer_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `language_id` int(11) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `cart` text,
  `wishlist` text,
  `newsletter` tinyint(1) NOT NULL DEFAULT '0',
  `address_id` int(11) NOT NULL DEFAULT '0',
  `custom_field` text NOT NULL,
  `ip` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `safe` tinyint(1) NOT NULL,
  `token` text NOT NULL,
  `code` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_customer`
--

INSERT INTO `oc_customer` (`customer_id`, `customer_group_id`, `store_id`, `language_id`, `firstname`, `lastname`, `email`, `telephone`, `fax`, `password`, `salt`, `cart`, `wishlist`, `newsletter`, `address_id`, `custom_field`, `ip`, `status`, `safe`, `token`, `code`, `date_added`) VALUES
(1, 1, 0, 1, 'Plaza', 'Themes', 'demo@plazathemes.com', '12345678', '', '540053b64d9155ca1a78a750659d32cf38792b1f', 'tq5lkvPI4', NULL, NULL, 0, 1, '', '127.0.0.1', 1, 0, '', '', '2017-09-04 20:29:56');

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_activity`
--

DROP TABLE IF EXISTS `oc_customer_activity`;
CREATE TABLE `oc_customer_activity` (
  `customer_activity_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `key` varchar(64) NOT NULL,
  `data` text NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_affiliate`
--

DROP TABLE IF EXISTS `oc_customer_affiliate`;
CREATE TABLE `oc_customer_affiliate` (
  `customer_id` int(11) NOT NULL,
  `company` varchar(40) NOT NULL,
  `website` varchar(255) NOT NULL,
  `tracking` varchar(64) NOT NULL,
  `commission` decimal(4,2) NOT NULL DEFAULT '0.00',
  `tax` varchar(64) NOT NULL,
  `payment` varchar(6) NOT NULL,
  `cheque` varchar(100) NOT NULL,
  `paypal` varchar(64) NOT NULL,
  `bank_name` varchar(64) NOT NULL,
  `bank_branch_number` varchar(64) NOT NULL,
  `bank_swift_code` varchar(64) NOT NULL,
  `bank_account_name` varchar(64) NOT NULL,
  `bank_account_number` varchar(64) NOT NULL,
  `custom_field` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_approval`
--

DROP TABLE IF EXISTS `oc_customer_approval`;
CREATE TABLE `oc_customer_approval` (
  `customer_approval_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `type` varchar(9) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_group`
--

DROP TABLE IF EXISTS `oc_customer_group`;
CREATE TABLE `oc_customer_group` (
  `customer_group_id` int(11) NOT NULL,
  `approval` int(1) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_customer_group`
--

INSERT INTO `oc_customer_group` (`customer_group_id`, `approval`, `sort_order`) VALUES
(1, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_group_description`
--

DROP TABLE IF EXISTS `oc_customer_group_description`;
CREATE TABLE `oc_customer_group_description` (
  `customer_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `description` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_customer_group_description`
--

INSERT INTO `oc_customer_group_description` (`customer_group_id`, `language_id`, `name`, `description`) VALUES
(1, 1, 'Default', 'test'),
(1, 9, 'Default', 'test');

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_history`
--

DROP TABLE IF EXISTS `oc_customer_history`;
CREATE TABLE `oc_customer_history` (
  `customer_history_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_ip`
--

DROP TABLE IF EXISTS `oc_customer_ip`;
CREATE TABLE `oc_customer_ip` (
  `customer_ip_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_customer_ip`
--

INSERT INTO `oc_customer_ip` (`customer_ip_id`, `customer_id`, `ip`, `date_added`) VALUES
(1, 1, '127.0.0.1', '2017-09-04 20:30:11');

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_login`
--

DROP TABLE IF EXISTS `oc_customer_login`;
CREATE TABLE `oc_customer_login` (
  `customer_login_id` int(11) NOT NULL,
  `email` varchar(96) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `total` int(4) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_customer_login`
--

INSERT INTO `oc_customer_login` (`customer_login_id`, `email`, `ip`, `total`, `date_added`, `date_modified`) VALUES
(1, '', '127.0.0.1', 1, '2018-01-10 04:04:57', '2018-01-10 04:04:57');

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_online`
--

DROP TABLE IF EXISTS `oc_customer_online`;
CREATE TABLE `oc_customer_online` (
  `ip` varchar(40) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `url` text NOT NULL,
  `referer` text NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_reward`
--

DROP TABLE IF EXISTS `oc_customer_reward`;
CREATE TABLE `oc_customer_reward` (
  `customer_reward_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `order_id` int(11) NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `points` int(8) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_customer_reward`
--

INSERT INTO `oc_customer_reward` (`customer_reward_id`, `customer_id`, `order_id`, `description`, `points`, `date_added`) VALUES
(1, 1, 1, 'Order ID: #1', 2600, '2017-09-16 09:52:34');

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_search`
--

DROP TABLE IF EXISTS `oc_customer_search`;
CREATE TABLE `oc_customer_search` (
  `customer_search_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `keyword` varchar(255) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `sub_category` tinyint(1) NOT NULL,
  `description` tinyint(1) NOT NULL,
  `products` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_transaction`
--

DROP TABLE IF EXISTS `oc_customer_transaction`;
CREATE TABLE `oc_customer_transaction` (
  `customer_transaction_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_wishlist`
--

DROP TABLE IF EXISTS `oc_customer_wishlist`;
CREATE TABLE `oc_customer_wishlist` (
  `customer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_customer_wishlist`
--

INSERT INTO `oc_customer_wishlist` (`customer_id`, `product_id`, `date_added`) VALUES
(1, 112, '2017-10-04 14:31:45'),
(1, 113, '2017-10-04 14:31:32'),
(1, 46, '2017-10-04 14:31:49');

-- --------------------------------------------------------

--
-- Table structure for table `oc_custom_field`
--

DROP TABLE IF EXISTS `oc_custom_field`;
CREATE TABLE `oc_custom_field` (
  `custom_field_id` int(11) NOT NULL,
  `type` varchar(32) NOT NULL,
  `value` text NOT NULL,
  `validation` varchar(255) NOT NULL,
  `location` varchar(10) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_custom_field_customer_group`
--

DROP TABLE IF EXISTS `oc_custom_field_customer_group`;
CREATE TABLE `oc_custom_field_customer_group` (
  `custom_field_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `required` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_custom_field_description`
--

DROP TABLE IF EXISTS `oc_custom_field_description`;
CREATE TABLE `oc_custom_field_description` (
  `custom_field_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_custom_field_value`
--

DROP TABLE IF EXISTS `oc_custom_field_value`;
CREATE TABLE `oc_custom_field_value` (
  `custom_field_value_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_custom_field_value_description`
--

DROP TABLE IF EXISTS `oc_custom_field_value_description`;
CREATE TABLE `oc_custom_field_value_description` (
  `custom_field_value_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_download`
--

DROP TABLE IF EXISTS `oc_download`;
CREATE TABLE `oc_download` (
  `download_id` int(11) NOT NULL,
  `filename` varchar(160) NOT NULL,
  `mask` varchar(128) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_download_description`
--

DROP TABLE IF EXISTS `oc_download_description`;
CREATE TABLE `oc_download_description` (
  `download_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_event`
--

DROP TABLE IF EXISTS `oc_event`;
CREATE TABLE `oc_event` (
  `event_id` int(11) NOT NULL,
  `code` varchar(64) NOT NULL,
  `trigger` text NOT NULL,
  `action` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_event`
--

INSERT INTO `oc_event` (`event_id`, `code`, `trigger`, `action`, `status`, `sort_order`) VALUES
(1, 'activity_customer_add', 'catalog/model/account/customer/addCustomer/after', 'event/activity/addCustomer', 1, 0),
(2, 'activity_customer_edit', 'catalog/model/account/customer/editCustomer/after', 'event/activity/editCustomer', 1, 0),
(3, 'activity_customer_password', 'catalog/model/account/customer/editPassword/after', 'event/activity/editPassword', 1, 0),
(4, 'activity_customer_forgotten', 'catalog/model/account/customer/editCode/after', 'event/activity/forgotten', 1, 0),
(5, 'activity_transaction', 'catalog/model/account/customer/addTransaction/after', 'event/activity/addTransaction', 1, 0),
(6, 'activity_customer_login', 'catalog/model/account/customer/deleteLoginAttempts/after', 'event/activity/login', 1, 0),
(7, 'activity_address_add', 'catalog/model/account/address/addAddress/after', 'event/activity/addAddress', 1, 0),
(8, 'activity_address_edit', 'catalog/model/account/address/editAddress/after', 'event/activity/editAddress', 1, 0),
(9, 'activity_address_delete', 'catalog/model/account/address/deleteAddress/after', 'event/activity/deleteAddress', 1, 0),
(10, 'activity_affiliate_add', 'catalog/model/account/customer/addAffiliate/after', 'event/activity/addAffiliate', 1, 0),
(11, 'activity_affiliate_edit', 'catalog/model/account/customer/editAffiliate/after', 'event/activity/editAffiliate', 1, 0),
(12, 'activity_order_add', 'catalog/model/checkout/order/addOrderHistory/before', 'event/activity/addOrderHistory', 1, 0),
(13, 'activity_return_add', 'catalog/model/account/return/addReturn/after', 'event/activity/addReturn', 1, 0),
(14, 'mail_transaction', 'catalog/model/account/customer/addTransaction/after', 'mail/transaction', 1, 0),
(15, 'mail_forgotten', 'catalog/model/account/customer/editCode/after', 'mail/forgotten', 1, 0),
(16, 'mail_customer_add', 'catalog/model/account/customer/addCustomer/after', 'mail/register', 1, 0),
(17, 'mail_customer_alert', 'catalog/model/account/customer/addCustomer/after', 'mail/register/alert', 1, 0),
(18, 'mail_affiliate_add', 'catalog/model/account/customer/addAffiliate/after', 'mail/affiliate', 1, 0),
(19, 'mail_affiliate_alert', 'catalog/model/account/customer/addAffiliate/after', 'mail/affiliate/alert', 1, 0),
(20, 'mail_voucher', 'catalog/model/checkout/order/addOrderHistory/after', 'extension/total/voucher/send', 1, 0),
(21, 'mail_order_add', 'catalog/model/checkout/order/addOrderHistory/before', 'mail/order', 1, 0),
(22, 'mail_order_alert', 'catalog/model/checkout/order/addOrderHistory/before', 'mail/order/alert', 1, 0),
(23, 'statistics_review_add', 'catalog/model/catalog/review/addReview/after', 'event/statistics/addReview', 1, 0),
(24, 'statistics_return_add', 'catalog/model/account/return/addReturn/after', 'event/statistics/addReturn', 1, 0),
(25, 'statistics_order_history', 'catalog/model/checkout/order/addOrderHistory/after', 'event/statistics/addOrderHistory', 1, 0),
(26, 'admin_mail_affiliate_approve', 'admin/model/customer/customer_approval/approveAffiliate/after', 'mail/affiliate/approve', 1, 0),
(27, 'admin_mail_affiliate_deny', 'admin/model/customer/customer_approval/denyAffiliate/after', 'mail/affiliate/deny', 1, 0),
(28, 'admin_mail_customer_approve', 'admin/model/customer/customer_approval/approveCustomer/after', 'mail/customer/approve', 1, 0),
(29, 'admin_mail_customer_deny', 'admin/model/customer/customer_approval/denyCustomer/after', 'mail/customer/deny', 1, 0),
(30, 'admin_mail_reward', 'admin/model/customer/customer/addReward/after', 'mail/reward', 1, 0),
(31, 'admin_mail_transaction', 'admin/model/customer/customer/addTransaction/after', 'mail/transaction', 1, 0),
(32, 'admin_mail_return', 'admin/model/sale/return/addReturn/after', 'mail/return', 1, 0),
(33, 'admin_mail_forgotten', 'admin/model/user/user/editCode/after', 'mail/forgotten', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_extension`
--

DROP TABLE IF EXISTS `oc_extension`;
CREATE TABLE `oc_extension` (
  `extension_id` int(11) NOT NULL,
  `type` varchar(32) NOT NULL,
  `code` varchar(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_extension`
--

INSERT INTO `oc_extension` (`extension_id`, `type`, `code`) VALUES
(1, 'payment', 'cod'),
(2, 'total', 'shipping'),
(3, 'total', 'sub_total'),
(4, 'total', 'tax'),
(5, 'total', 'total'),
(8, 'total', 'credit'),
(9, 'shipping', 'flat'),
(10, 'total', 'handling'),
(11, 'total', 'low_order_fee'),
(12, 'total', 'coupon'),
(55, 'module', 'banner'),
(15, 'total', 'reward'),
(16, 'total', 'voucher'),
(17, 'payment', 'free_checkout'),
(20, 'theme', 'default'),
(21, 'dashboard', 'activity'),
(22, 'dashboard', 'sale'),
(23, 'dashboard', 'recent'),
(24, 'dashboard', 'order'),
(25, 'dashboard', 'online'),
(26, 'dashboard', 'map'),
(27, 'dashboard', 'customer'),
(28, 'dashboard', 'chart'),
(29, 'report', 'sale_coupon'),
(31, 'report', 'customer_search'),
(32, 'report', 'customer_transaction'),
(33, 'report', 'product_purchased'),
(34, 'report', 'product_viewed'),
(35, 'report', 'sale_return'),
(36, 'report', 'sale_order'),
(37, 'report', 'sale_shipping'),
(38, 'report', 'sale_tax'),
(39, 'report', 'customer_activity'),
(40, 'report', 'customer_order'),
(41, 'report', 'customer_reward'),
(42, 'module', 'oc_page_builder'),
(43, 'module', 'ocajaxlogin'),
(45, 'module', 'occmsblock'),
(46, 'module', 'oclayerednavigation'),
(47, 'module', 'newslettersubscribe'),
(48, 'module', 'ocslideshow'),
(50, 'module', 'octhemeoption'),
(51, 'module', 'ocproduct'),
(52, 'module', 'octabproducts'),
(53, 'module', 'ochozmegamenu'),
(67, 'module', 'octwitter'),
(58, 'module', 'ocfeaturedcategory'),
(60, 'module', 'octestimonial'),
(64, 'module', 'category'),
(62, 'module', 'ocblog'),
(65, 'module', 'ocvermegamenu');

-- --------------------------------------------------------

--
-- Table structure for table `oc_extension_install`
--

DROP TABLE IF EXISTS `oc_extension_install`;
CREATE TABLE `oc_extension_install` (
  `extension_install_id` int(11) NOT NULL,
  `extension_download_id` int(11) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_extension_install`
--

INSERT INTO `oc_extension_install` (`extension_install_id`, `extension_download_id`, `filename`, `date_added`) VALUES
(1, 0, 'octhemeoption.ocmod.zip', '2017-08-09 09:37:18'),
(2, 0, 'customizetemplate.ocmod.zip', '2017-08-10 09:08:15'),
(3, 0, 'customizetemplate.ocmod.zip', '2017-08-10 17:17:46'),
(4, 0, 'customizetemplate.ocmod.zip', '2017-08-10 17:19:27'),
(5, 0, 'oclayerednavigation.ocmod.zip', '2017-08-11 15:37:04'),
(6, 0, 'occustomizetemplate.ocmod.zip', '2017-08-11 16:07:58'),
(7, 0, 'oclayerednavigation.ocmod.zip', '2017-08-11 16:08:14'),
(8, 0, 'oclayerednavigation.ocmod.zip', '2017-08-14 15:15:18'),
(9, 0, 'oclayerednavigation.ocmod.zip', '2017-08-14 15:17:42'),
(10, 0, 'oclayerednavigation.ocmod.zip', '2017-08-14 15:21:10'),
(11, 0, 'oclayerednavigation.ocmod.zip', '2017-08-14 15:34:32'),
(12, 0, 'oclayerednavigation.ocmod.zip', '2017-08-14 16:04:49'),
(13, 0, 'oclayerednavigation.ocmod.zip', '2017-08-14 16:06:23'),
(14, 0, 'occustomizetemplate.ocmod.zip', '2017-08-14 16:46:14'),
(15, 0, 'oclayerednavigation.ocmod.zip', '2017-08-15 14:53:09'),
(16, 0, 'occustomizetemplate.ocmod.zip', '2017-08-16 14:30:50'),
(17, 0, 'occustomizetemplate.ocmod.zip', '2017-08-29 16:36:30'),
(18, 0, 'occustomizetemplate.ocmod.zip', '2017-09-08 09:30:20'),
(19, 0, 'occustomizetemplate.ocmod.zip', '2017-09-08 09:52:35'),
(20, 0, 'occustomizetemplate.ocmod.zip', '2017-09-21 16:53:03'),
(21, 0, 'occustomizetemplate.ocmod.zip', '2017-10-04 11:02:26'),
(22, 0, 'occustomizetemplate.ocmod.zip', '2017-10-10 09:40:27'),
(23, 0, 'ocsearchcategory.ocmod.zip', '2017-10-18 14:05:11'),
(24, 0, 'occustomizetemplate.ocmod.zip', '2017-10-23 16:44:58'),
(25, 0, 'occustomizetemplate.ocmod.zip', '2017-11-21 15:10:01'),
(27, 0, 'occustomizetemplate.ocmod.zip', '2018-01-10 11:31:06'),
(28, 0, 'occustomizetemplate.ocmod.zip', '2018-01-10 13:25:36');

-- --------------------------------------------------------

--
-- Table structure for table `oc_extension_path`
--

DROP TABLE IF EXISTS `oc_extension_path`;
CREATE TABLE `oc_extension_path` (
  `extension_path_id` int(11) NOT NULL,
  `extension_install_id` int(11) NOT NULL,
  `path` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_filter`
--

DROP TABLE IF EXISTS `oc_filter`;
CREATE TABLE `oc_filter` (
  `filter_id` int(11) NOT NULL,
  `filter_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_filter`
--

INSERT INTO `oc_filter` (`filter_id`, `filter_group_id`, `sort_order`) VALUES
(1, 1, 0),
(2, 1, 0),
(3, 1, 0),
(4, 1, 0),
(5, 1, 0),
(6, 1, 0),
(7, 1, 0),
(8, 1, 0),
(9, 2, 0),
(10, 2, 0),
(11, 2, 0),
(12, 2, 0),
(13, 2, 0),
(14, 2, 0),
(15, 2, 0),
(16, 2, 0),
(17, 2, 0),
(23, 3, 0),
(22, 3, 0),
(21, 3, 0),
(20, 3, 0),
(19, 3, 0),
(18, 3, 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_filter_description`
--

DROP TABLE IF EXISTS `oc_filter_description`;
CREATE TABLE `oc_filter_description` (
  `filter_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `filter_group_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_filter_description`
--

INSERT INTO `oc_filter_description` (`filter_id`, `language_id`, `filter_group_id`, `name`) VALUES
(1, 1, 1, 'White'),
(2, 1, 1, 'Green'),
(3, 1, 1, 'Blue'),
(4, 1, 1, 'Black'),
(5, 1, 1, 'Red'),
(6, 1, 1, 'Pink'),
(7, 1, 1, 'Yellow'),
(8, 1, 1, 'Brown'),
(9, 1, 2, 'Versace'),
(10, 1, 2, 'Tommy Hilfiger'),
(11, 1, 2, 'Diesel'),
(12, 1, 2, 'Calvin Klein'),
(13, 1, 2, 'Chanel'),
(14, 1, 2, 'Christian Dior'),
(15, 1, 2, 'ferragamo'),
(16, 1, 2, 'hermes'),
(17, 1, 2, 'louis vuitton'),
(19, 1, 3, 'Categories2'),
(18, 1, 3, 'Categories1'),
(20, 1, 3, 'Categories3'),
(21, 1, 3, 'Categories4'),
(22, 1, 3, 'Categories5'),
(23, 1, 3, 'Categories6'),
(1, 9, 1, 'White'),
(2, 9, 1, 'Green'),
(3, 9, 1, 'Blue'),
(4, 9, 1, 'Black'),
(5, 9, 1, 'Red'),
(6, 9, 1, 'Pink'),
(7, 9, 1, 'Yellow'),
(8, 9, 1, 'Brown'),
(9, 9, 2, 'Versace'),
(10, 9, 2, 'Tommy Hilfiger'),
(11, 9, 2, 'Diesel'),
(12, 9, 2, 'Calvin Klein'),
(13, 9, 2, 'Chanel'),
(14, 9, 2, 'Christian Dior'),
(15, 9, 2, 'ferragamo'),
(16, 9, 2, 'hermes'),
(17, 9, 2, 'louis vuitton'),
(19, 9, 3, 'Categories2'),
(18, 9, 3, 'Categories1'),
(20, 9, 3, 'Categories3'),
(21, 9, 3, 'Categories4'),
(22, 9, 3, 'Categories5'),
(23, 9, 3, 'Categories6');

-- --------------------------------------------------------

--
-- Table structure for table `oc_filter_group`
--

DROP TABLE IF EXISTS `oc_filter_group`;
CREATE TABLE `oc_filter_group` (
  `filter_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_filter_group`
--

INSERT INTO `oc_filter_group` (`filter_group_id`, `sort_order`) VALUES
(1, 0),
(2, 0),
(3, 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_filter_group_description`
--

DROP TABLE IF EXISTS `oc_filter_group_description`;
CREATE TABLE `oc_filter_group_description` (
  `filter_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_filter_group_description`
--

INSERT INTO `oc_filter_group_description` (`filter_group_id`, `language_id`, `name`) VALUES
(1, 1, 'Color'),
(2, 1, 'Manufacturer'),
(3, 1, 'Categories'),
(1, 9, 'Color'),
(2, 9, 'Manufacturer'),
(3, 9, 'Categories');

-- --------------------------------------------------------

--
-- Table structure for table `oc_geo_zone`
--

DROP TABLE IF EXISTS `oc_geo_zone`;
CREATE TABLE `oc_geo_zone` (
  `geo_zone_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_geo_zone`
--

INSERT INTO `oc_geo_zone` (`geo_zone_id`, `name`, `description`, `date_added`, `date_modified`) VALUES
(3, 'UK VAT Zone', 'UK VAT', '2009-01-06 23:26:25', '2010-02-26 22:33:24'),
(4, 'UK Shipping', 'UK Shipping Zones', '2009-06-23 01:14:53', '2010-12-15 15:18:13');

-- --------------------------------------------------------

--
-- Table structure for table `oc_information`
--

DROP TABLE IF EXISTS `oc_information`;
CREATE TABLE `oc_information` (
  `information_id` int(11) NOT NULL,
  `bottom` int(1) NOT NULL DEFAULT '0',
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_information`
--

INSERT INTO `oc_information` (`information_id`, `bottom`, `sort_order`, `status`) VALUES
(3, 1, 3, 1),
(4, 1, 1, 1),
(5, 1, 4, 1),
(6, 1, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_information_description`
--

DROP TABLE IF EXISTS `oc_information_description`;
CREATE TABLE `oc_information_description` (
  `information_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  `description` mediumtext NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_information_description`
--

INSERT INTO `oc_information_description` (`information_id`, `language_id`, `title`, `description`, `meta_title`, `meta_description`, `meta_keyword`) VALUES
(6, 9, 'Delivery Information', '&lt;p&gt;\r\n	Delivery Information&lt;/p&gt;\r\n', 'Delivery Information', '', ''),
(4, 9, 'About Us', '&lt;p&gt;\r\n	About Us&lt;/p&gt;\r\n', 'About Us', '', ''),
(5, 9, 'Terms &amp; Conditions', '&lt;p&gt;\r\n	Terms &amp;amp; Conditions&lt;/p&gt;\r\n', 'Terms &amp; Conditions', '', ''),
(3, 9, 'Privacy Policy', '&lt;p&gt;\r\n	Privacy Policy&lt;/p&gt;\r\n', 'Privacy Policy', '', ''),
(4, 1, 'About Us', '&lt;p&gt;\r\n	About Us&lt;/p&gt;\r\n', 'About Us', '', ''),
(5, 1, 'Terms &amp; Conditions', '&lt;p&gt;\r\n	Terms &amp;amp; Conditions&lt;/p&gt;\r\n', 'Terms &amp; Conditions', '', ''),
(3, 1, 'Privacy Policy', '&lt;p&gt;\r\n	Privacy Policy&lt;/p&gt;\r\n', 'Privacy Policy', '', ''),
(6, 1, 'Delivery Information', '&lt;p&gt;\r\n	Delivery Information&lt;/p&gt;\r\n', 'Delivery Information', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `oc_information_to_layout`
--

DROP TABLE IF EXISTS `oc_information_to_layout`;
CREATE TABLE `oc_information_to_layout` (
  `information_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_information_to_layout`
--

INSERT INTO `oc_information_to_layout` (`information_id`, `store_id`, `layout_id`) VALUES
(4, 7, 0),
(4, 6, 0),
(4, 3, 0),
(4, 2, 0),
(4, 1, 0),
(4, 0, 0),
(6, 7, 0),
(6, 6, 0),
(6, 3, 0),
(6, 2, 0),
(6, 1, 0),
(6, 0, 0),
(3, 7, 0),
(3, 6, 0),
(3, 3, 0),
(3, 2, 0),
(3, 1, 0),
(3, 0, 0),
(5, 7, 0),
(5, 6, 0),
(5, 3, 0),
(5, 2, 0),
(5, 1, 0),
(5, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_information_to_store`
--

DROP TABLE IF EXISTS `oc_information_to_store`;
CREATE TABLE `oc_information_to_store` (
  `information_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_information_to_store`
--

INSERT INTO `oc_information_to_store` (`information_id`, `store_id`) VALUES
(3, 0),
(3, 1),
(3, 2),
(3, 3),
(3, 6),
(3, 7),
(4, 0),
(4, 1),
(4, 2),
(4, 3),
(4, 6),
(4, 7),
(5, 0),
(5, 1),
(5, 2),
(5, 3),
(5, 6),
(5, 7),
(6, 0),
(6, 1),
(6, 2),
(6, 3),
(6, 6),
(6, 7);

-- --------------------------------------------------------

--
-- Table structure for table `oc_language`
--

DROP TABLE IF EXISTS `oc_language`;
CREATE TABLE `oc_language` (
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `code` varchar(5) NOT NULL,
  `locale` varchar(255) NOT NULL,
  `image` varchar(64) NOT NULL,
  `directory` varchar(32) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_language`
--

INSERT INTO `oc_language` (`language_id`, `name`, `code`, `locale`, `image`, `directory`, `sort_order`, `status`) VALUES
(1, 'English', 'en-gb', 'en-US,en_US.UTF-8,en_US,en-gb,english', 'gb.png', 'english', 1, 1),
(9, 'Germany', 'de-de', 'de', '', '', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_layout`
--

DROP TABLE IF EXISTS `oc_layout`;
CREATE TABLE `oc_layout` (
  `layout_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_layout`
--

INSERT INTO `oc_layout` (`layout_id`, `name`) VALUES
(1, 'Layout Koparion 01: Home'),
(2, 'Layout Koparion 01: Product'),
(3, 'Layout Koparion 01: Category'),
(4, 'Layout Koparion 01: Default'),
(5, 'Layout Koparion 02: Category'),
(6, 'Layout Koparion 02: Product'),
(7, 'Layout Koparion 03: Default'),
(8, 'Layout Koparion 04: Category'),
(9, 'Layout Koparion 02: Home'),
(10, 'Layout Koparion 03: Category'),
(11, 'Layout Koparion 03: Product'),
(12, 'Layout Koparion 03: Home'),
(13, 'Layout Koparion 02: Default'),
(14, 'Layout Koparion 04: Default'),
(17, 'Layout Koparion 04: Home'),
(20, 'Layout Koparion 04: Product'),
(25, 'Layout Koparion 05: Category'),
(26, 'Layout Koparion 05: Default'),
(27, 'Layout Koparion 05: Home'),
(28, 'Layout Koparion 05: Product'),
(29, 'Layout Koparion 06: Category'),
(30, 'Layout Koparion 06: Default'),
(31, 'Layout Koparion 06: Home'),
(32, 'Layout Koparion 06: Product');

-- --------------------------------------------------------

--
-- Table structure for table `oc_layout_module`
--

DROP TABLE IF EXISTS `oc_layout_module`;
CREATE TABLE `oc_layout_module` (
  `layout_module_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  `code` varchar(64) NOT NULL,
  `position` varchar(14) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_layout_module`
--

INSERT INTO `oc_layout_module` (`layout_module_id`, `layout_id`, `code`, `position`, `sort_order`) VALUES
(1832, 10, 'occmsblock.191', 'block6', 0),
(1829, 10, 'occmsblock.183', 'block3', 0),
(1830, 10, 'occmsblock.190', 'block4', 0),
(1934, 5, 'occmsblock.191', 'block6', 0),
(1933, 5, 'occmsblock.138', 'block5', 0),
(1932, 5, 'occmsblock.190', 'block4', 0),
(1798, 1, 'occmsblock.191', 'block6', 0),
(1797, 1, 'occmsblock.138', 'block5', 0),
(1792, 4, 'occmsblock.191', 'block6', 0),
(1931, 5, 'occmsblock.183', 'block3', 0),
(1803, 2, 'occmsblock.191', 'block6', 0),
(1802, 2, 'occmsblock.138', 'block5', 0),
(1801, 2, 'occmsblock.190', 'block4', 0),
(1939, 13, 'occmsblock.191', 'block6', 0),
(1938, 13, 'occmsblock.138', 'block5', 0),
(1945, 9, 'occmsblock.191', 'block6', 0),
(1855, 11, 'occmsblock.190', 'block4', 0),
(1944, 9, 'occmsblock.138', 'block5', 0),
(1943, 9, 'occmsblock.190', 'block4', 0),
(1929, 5, 'occmsblock.192', 'column_left', 1),
(1831, 10, 'occmsblock.138', 'block5', 0),
(1870, 14, 'occmsblock.191', 'block6', 0),
(1791, 4, 'occmsblock.138', 'block5', 0),
(1790, 4, 'occmsblock.190', 'block4', 0),
(1942, 9, 'occmsblock.183', 'block3', 0),
(1950, 6, 'occmsblock.191', 'block6', 0),
(1949, 6, 'occmsblock.138', 'block5', 0),
(1800, 2, 'occmsblock.183', 'block3', 0),
(1789, 4, 'occmsblock.183', 'block3', 0),
(1787, 3, 'occmsblock.191', 'block6', 0),
(1786, 3, 'occmsblock.138', 'block5', 0),
(1785, 3, 'occmsblock.190', 'block4', 0),
(1946, 6, 'ochozmegamenu.43', 'block1', 0),
(1842, 7, 'occmsblock.190', 'block4', 0),
(1828, 10, 'ocvermegamenu.194', 'block2', 0),
(1948, 6, 'occmsblock.190', 'block4', 0),
(1865, 8, 'occmsblock.191', 'block6', 0),
(1869, 14, 'occmsblock.138', 'block5', 0),
(1880, 20, 'occmsblock.138', 'block5', 0),
(1876, 17, 'occmsblock.191', 'block6', 0),
(1947, 6, 'occmsblock.183', 'block3', 0),
(1788, 4, 'ochozmegamenu.43', 'block1', 0),
(1796, 1, 'occmsblock.190', 'block4', 0),
(1795, 1, 'occmsblock.183', 'block3', 0),
(1799, 2, 'ochozmegamenu.43', 'block1', 0),
(1930, 5, 'ochozmegamenu.43', 'block1', 0),
(1928, 5, 'oclayerednavigation', 'column_left', 0),
(1856, 11, 'occmsblock.138', 'block5', 0),
(1848, 12, 'occmsblock.183', 'block3', 0),
(1937, 13, 'occmsblock.190', 'block4', 0),
(1936, 13, 'occmsblock.183', 'block3', 0),
(1935, 13, 'ochozmegamenu.43', 'block1', 0),
(1867, 14, 'occmsblock.183', 'block3', 0),
(1864, 8, 'occmsblock.138', 'block5', 0),
(1784, 3, 'occmsblock.183', 'block3', 0),
(1794, 1, 'oc_page_builder.32', 'content_top', 0),
(1793, 1, 'ochozmegamenu.43', 'block1', 0),
(1783, 3, 'ochozmegamenu.43', 'block1', 0),
(1782, 3, 'occmsblock.192', 'column_left', 1),
(1843, 7, 'occmsblock.138', 'block5', 0),
(1849, 12, 'occmsblock.190', 'block4', 0),
(1863, 8, 'occmsblock.190', 'block4', 0),
(1940, 9, 'ochozmegamenu.43', 'block1', 0),
(1868, 14, 'occmsblock.190', 'block4', 0),
(1875, 17, 'occmsblock.138', 'block5', 0),
(1874, 17, 'occmsblock.190', 'block4', 0),
(1941, 9, 'oc_page_builder.48', 'content_top', 0),
(1781, 3, 'oclayerednavigation', 'column_left', 0),
(1879, 20, 'occmsblock.190', 'block4', 0),
(1827, 10, 'ochozmegamenu.197', 'block1', 0),
(1826, 10, 'occmsblock.192', 'column_left', 1),
(1841, 7, 'occmsblock.183', 'block3', 0),
(1840, 7, 'ocvermegamenu.194', 'block2', 0),
(1839, 7, 'ochozmegamenu.197', 'block1', 0),
(1850, 12, 'occmsblock.138', 'block5', 0),
(1847, 12, 'ocvermegamenu.194', 'block2', 0),
(1846, 12, 'oc_page_builder.53', 'content_top', 0),
(1845, 12, 'ochozmegamenu.197', 'block1', 0),
(1854, 11, 'occmsblock.183', 'block3', 0),
(1853, 11, 'ocvermegamenu.194', 'block2', 0),
(1852, 11, 'ochozmegamenu.197', 'block1', 0),
(1873, 17, 'occmsblock.183', 'block3', 0),
(1872, 17, 'oc_page_builder.58', 'content_top', 0),
(1871, 17, 'ochozmegamenu.208', 'block1', 0),
(1862, 8, 'occmsblock.183', 'block3', 0),
(1861, 8, 'ochozmegamenu.208', 'block1', 0),
(1860, 8, 'occmsblock.192', 'column_left', 2),
(1866, 14, 'ochozmegamenu.208', 'block1', 0),
(1878, 20, 'occmsblock.183', 'block3', 0),
(1877, 20, 'ochozmegamenu.208', 'block1', 0),
(1859, 8, 'oclayerednavigation', 'column_left', 1),
(1858, 8, 'ocvermegamenu.194', 'column_left', 0),
(1887, 25, 'occmsblock.138', 'block5', 0),
(1886, 25, 'occmsblock.190', 'block4', 0),
(1885, 25, 'occmsblock.183', 'block3', 0),
(1884, 25, 'ochozmegamenu.43', 'block1', 0),
(1883, 25, 'occmsblock.192', 'column_left', 1),
(1893, 26, 'occmsblock.191', 'block6', 0),
(1892, 26, 'occmsblock.138', 'block5', 0),
(1891, 26, 'occmsblock.190', 'block4', 0),
(1890, 26, 'occmsblock.183', 'block3', 0),
(1889, 26, 'ochozmegamenu.43', 'block1', 0),
(1882, 25, 'oclayerednavigation', 'column_left', 0),
(1898, 27, 'occmsblock.138', 'block5', 0),
(1897, 27, 'occmsblock.190', 'block4', 0),
(1896, 27, 'occmsblock.183', 'block3', 0),
(1895, 27, 'oc_page_builder.210', 'content_top', 0),
(1894, 27, 'ochozmegamenu.43', 'block1', 0),
(1904, 28, 'occmsblock.191', 'block6', 0),
(1903, 28, 'occmsblock.138', 'block5', 0),
(1902, 28, 'occmsblock.190', 'block4', 0),
(1901, 28, 'occmsblock.183', 'block3', 0),
(1900, 28, 'ochozmegamenu.43', 'block1', 0),
(1909, 29, 'occmsblock.190', 'block4', 0),
(1908, 29, 'occmsblock.183', 'block3', 0),
(1907, 29, 'ochozmegamenu.43', 'block1', 0),
(1906, 29, 'occmsblock.192', 'column_left', 1),
(1905, 29, 'oclayerednavigation', 'column_left', 0),
(1916, 30, 'occmsblock.191', 'block6', 0),
(1915, 30, 'occmsblock.138', 'block5', 0),
(1914, 30, 'occmsblock.190', 'block4', 0),
(1913, 30, 'occmsblock.183', 'block3', 0),
(1912, 30, 'ochozmegamenu.43', 'block1', 0),
(1921, 31, 'occmsblock.138', 'block5', 0),
(1920, 31, 'occmsblock.190', 'block4', 0),
(1919, 31, 'occmsblock.183', 'block3', 0),
(1918, 31, 'oc_page_builder.212', 'content_top', 0),
(1917, 31, 'ochozmegamenu.43', 'block1', 0),
(1927, 32, 'occmsblock.191', 'block6', 0),
(1926, 32, 'occmsblock.138', 'block5', 0),
(1925, 32, 'occmsblock.190', 'block4', 0),
(1924, 32, 'occmsblock.183', 'block3', 0),
(1923, 32, 'ochozmegamenu.43', 'block1', 0),
(1825, 10, 'oclayerednavigation', 'column_left', 0),
(1844, 7, 'occmsblock.191', 'block6', 0),
(1851, 12, 'occmsblock.191', 'block6', 0),
(1857, 11, 'occmsblock.191', 'block6', 0),
(1881, 20, 'occmsblock.191', 'block6', 0),
(1888, 25, 'occmsblock.191', 'block6', 0),
(1899, 27, 'occmsblock.191', 'block6', 0),
(1910, 29, 'occmsblock.138', 'block5', 0),
(1911, 29, 'occmsblock.191', 'block6', 0),
(1922, 31, 'occmsblock.191', 'block6', 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_layout_route`
--

DROP TABLE IF EXISTS `oc_layout_route`;
CREATE TABLE `oc_layout_route` (
  `layout_route_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `route` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_layout_route`
--

INSERT INTO `oc_layout_route` (`layout_route_id`, `layout_id`, `store_id`, `route`) VALUES
(417, 20, 3, 'product/product'),
(415, 14, 3, ''),
(416, 17, 3, 'common/home'),
(429, 6, 1, 'product/product%'),
(409, 10, 2, 'product/category'),
(402, 3, 0, 'product/category'),
(405, 2, 0, 'product/product'),
(413, 11, 2, 'product/product'),
(411, 7, 2, ''),
(414, 8, 3, 'product/category'),
(428, 9, 1, 'common/home'),
(425, 32, 7, 'product/product'),
(426, 5, 1, 'product/category'),
(412, 12, 2, 'common/home'),
(427, 13, 1, ''),
(420, 27, 6, 'common/home'),
(424, 31, 7, 'common/home'),
(423, 30, 7, ''),
(418, 25, 6, 'product/category'),
(404, 1, 0, 'common/home'),
(422, 29, 7, 'product/category'),
(403, 4, 0, ''),
(419, 26, 6, ''),
(421, 28, 6, 'product/product');

-- --------------------------------------------------------

--
-- Table structure for table `oc_length_class`
--

DROP TABLE IF EXISTS `oc_length_class`;
CREATE TABLE `oc_length_class` (
  `length_class_id` int(11) NOT NULL,
  `value` decimal(15,8) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_length_class`
--

INSERT INTO `oc_length_class` (`length_class_id`, `value`) VALUES
(1, '1.00000000'),
(2, '10.00000000'),
(3, '0.39370000');

-- --------------------------------------------------------

--
-- Table structure for table `oc_length_class_description`
--

DROP TABLE IF EXISTS `oc_length_class_description`;
CREATE TABLE `oc_length_class_description` (
  `length_class_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `unit` varchar(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_length_class_description`
--

INSERT INTO `oc_length_class_description` (`length_class_id`, `language_id`, `title`, `unit`) VALUES
(1, 1, 'Centimeter', 'cm'),
(2, 1, 'Millimeter', 'mm'),
(3, 1, 'Inch', 'in'),
(3, 9, 'Inch', 'in'),
(2, 9, 'Millimeter', 'mm'),
(1, 9, 'Centimeter', 'cm');

-- --------------------------------------------------------

--
-- Table structure for table `oc_location`
--

DROP TABLE IF EXISTS `oc_location`;
CREATE TABLE `oc_location` (
  `location_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `address` text NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `geocode` varchar(32) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `open` text NOT NULL,
  `comment` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_manufacturer`
--

DROP TABLE IF EXISTS `oc_manufacturer`;
CREATE TABLE `oc_manufacturer` (
  `manufacturer_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_manufacturer`
--

INSERT INTO `oc_manufacturer` (`manufacturer_id`, `name`, `image`, `sort_order`) VALUES
(5, 'HTC', 'catalog/demo/htc_logo.jpg', 0),
(6, 'Palm', 'catalog/demo/palm_logo.jpg', 0),
(7, 'Hewlett-Packard', 'catalog/demo/hp_logo.jpg', 0),
(8, 'Apple', 'catalog/demo/apple_logo.jpg', 0),
(9, 'Canon', 'catalog/demo/canon_logo.jpg', 0),
(10, 'Sony', 'catalog/demo/sony_logo.jpg', 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_manufacturer_to_store`
--

DROP TABLE IF EXISTS `oc_manufacturer_to_store`;
CREATE TABLE `oc_manufacturer_to_store` (
  `manufacturer_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_manufacturer_to_store`
--

INSERT INTO `oc_manufacturer_to_store` (`manufacturer_id`, `store_id`) VALUES
(5, 0),
(5, 1),
(5, 2),
(5, 3),
(5, 6),
(5, 7),
(6, 0),
(6, 1),
(6, 2),
(6, 3),
(6, 6),
(6, 7),
(7, 0),
(7, 1),
(7, 2),
(7, 3),
(7, 6),
(7, 7),
(8, 0),
(8, 1),
(8, 2),
(8, 3),
(8, 6),
(8, 7),
(9, 0),
(9, 1),
(9, 2),
(9, 3),
(9, 6),
(9, 7),
(10, 0),
(10, 1),
(10, 2),
(10, 3),
(10, 6),
(10, 7);

-- --------------------------------------------------------

--
-- Table structure for table `oc_marketing`
--

DROP TABLE IF EXISTS `oc_marketing`;
CREATE TABLE `oc_marketing` (
  `marketing_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `description` text NOT NULL,
  `code` varchar(64) NOT NULL,
  `clicks` int(5) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_modification`
--

DROP TABLE IF EXISTS `oc_modification`;
CREATE TABLE `oc_modification` (
  `modification_id` int(11) NOT NULL,
  `extension_install_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `code` varchar(64) NOT NULL,
  `author` varchar(64) NOT NULL,
  `version` varchar(32) NOT NULL,
  `link` varchar(255) NOT NULL,
  `xml` mediumtext NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_modification`
--

INSERT INTO `oc_modification` (`modification_id`, `extension_install_id`, `name`, `code`, `author`, `version`, `link`, `xml`, `status`, `date_added`) VALUES
(1, 1, 'OC Theme Option', 'oc_theme_option', 'Plaza Theme', '3.x', '', '<?xml version=\"1.0\" encoding=\"utf-8\"?>\r\n<modification>\r\n    <code>oc_theme_option</code>\r\n    <name>OC Theme Option</name>\r\n    <version>3.x</version>\r\n    <author>Plaza Theme</author>\r\n\r\n    <!-- Menu Left in Admin -->\r\n    <file path=\"admin/controller/common/column_left.php\">\r\n        <operation>\r\n            <search ><![CDATA[$sale = array();]]></search>\r\n            <add position=\"before\"><![CDATA[\r\n            // OC Menu Items\r\n            $this->load->language(\'ocadminmenu/ocadminmenu\');\r\n\r\n            $ocadmin_menu = array();\r\n\r\n            if($this->user->hasPermission(\'access\', \'extension/module/octhemeoption\')) {\r\n                $ocadmin_menu[] = array(\r\n                    \'name\'     => $this->language->get(\'text_theme_config\'),\r\n                    \'href\'     => $this->url->link(\'extension/module/octhemeoption\', \'user_token=\' . $this->session->data[\'user_token\'], true),\r\n                    \'children\' => array()\r\n                );\r\n            }\r\n\r\n            if($this->user->hasPermission(\'access\', \'catalog/occategorythumbnail\')) {\r\n                $ocadmin_menu[] = array(\r\n                    \'name\'     => $this->language->get(\'text_category_thumbnail\'),\r\n                    \'href\'     => $this->url->link(\'catalog/occategorythumbnail\', \'user_token=\' . $this->session->data[\'user_token\'], true),\r\n                    \'children\' => array()\r\n                );\r\n            }\r\n\r\n            // Blog\r\n            $blog = array();\r\n\r\n            if ($this->user->hasPermission(\'access\', \'blog/article\')) {\r\n                $blog[] = array(\r\n                    \'name\'     => $this->language->get(\'text_article\'),\r\n                    \'href\'     => $this->url->link(\'blog/article\', \'user_token=\' . $this->session->data[\'user_token\'], true),\r\n                    \'children\' => array()\r\n                );\r\n            }\r\n\r\n            if ($this->user->hasPermission(\'access\', \'blog/articlelist\')) {\r\n                $blog[] = array(\r\n                    \'name\'     => $this->language->get(\'text_article_list\'),\r\n                    \'href\'     => $this->url->link(\'blog/articlelist\', \'user_token=\' . $this->session->data[\'user_token\'], true),\r\n                    \'children\' => array()\r\n                );\r\n            }\r\n\r\n            if ($this->user->hasPermission(\'access\', \'blog/config\')) {\r\n                $blog[] = array(\r\n                    \'name\'     => $this->language->get(\'text_blog_config\'),\r\n                    \'href\'     => $this->url->link(\'blog/config\', \'user_token=\' . $this->session->data[\'user_token\'], true),\r\n                    \'children\' => array()\r\n                );\r\n            }\r\n\r\n            if($blog) {\r\n                $ocadmin_menu[] = array(\r\n                    \'name\'      => $this->language->get(\'text_blog\'),\r\n                    \'href\'      => \'\',\r\n                    \'children\'  => $blog\r\n                );\r\n            }\r\n\r\n            if($this->user->hasPermission(\'access\', \'extension/module/occmsblock\')) {\r\n                $ocadmin_menu[] = array(\r\n                    \'name\'     => $this->language->get(\'text_cms_block\'),\r\n                    \'href\'     => $this->url->link(\'extension/module/occmsblock/cmslist\', \'user_token=\' . $this->session->data[\'user_token\'], true),\r\n                    \'children\' => array()\r\n                );\r\n            }\r\n\r\n            if($this->user->hasPermission(\'access\', \'extension/module/ocslideshow\')) {\r\n                $ocadmin_menu[] = array(\r\n                    \'name\'     => $this->language->get(\'text_slideshow\'),\r\n                    \'href\'     => $this->url->link(\'extension/module/ocslideshow/form\', \'user_token=\' . $this->session->data[\'user_token\'], true),\r\n                    \'children\' => array()\r\n                );\r\n            }\r\n\r\n            if($this->user->hasPermission(\'access\', \'catalog/octestimonial\')) {\r\n                $ocadmin_menu[] = array(\r\n                    \'name\'     => $this->language->get(\'text_testimonial\'),\r\n                    \'href\'     => $this->url->link(\'catalog/octestimonial\', \'user_token=\' . $this->session->data[\'user_token\'], true),\r\n                    \'children\' => array()\r\n                );\r\n            }\r\n            \r\n            $data[\'menus\'][] = array(\r\n                \'id\'       => \'menu-panel\',\r\n                \'icon\'     => \'fa-empire\',\r\n                \'name\'     => $this->language->get(\'text_theme_menu\'),\r\n                \'href\'     => \'\',\r\n                \'children\' => $ocadmin_menu\r\n            );\r\n            ]]></add>\r\n        </operation>\r\n    </file>\r\n\r\n    <!-- PRODUCT ROTATOR IMAGE -->\r\n    <file path=\"admin/controller/catalog/product.php\">\r\n        <operation>\r\n            <search ><![CDATA[public function index() {]]></search>\r\n            <add position=\"after\"><![CDATA[\r\n        /* Product Rotator */\r\n        $this->load->model(\'catalog/ocproductrotator\');\r\n        \r\n        $this->model_catalog_ocproductrotator->installProductRotator();\r\n        /* End Product Rotator */\r\n            ]]></add>\r\n        </operation>\r\n        <operation>\r\n            <search ><![CDATA[$this->load->language(\'catalog/product\');]]></search>\r\n            <add position=\"before\"><![CDATA[\r\n                /* Product Rotator */\r\n                $this->load->language(\'extension/module/ocproductrotator\');\r\n            ]]></add>\r\n        </operation>\r\n        <operation>\r\n            <search ><![CDATA[\'sort_order\' => $product_image[\'sort_order\']]]></search>\r\n            <add position=\"before\"><![CDATA[\r\n                /* Product Rotator */\r\n                \'is_rotator\' => $product_image[\'is_rotator\'],\r\n            ]]></add>\r\n        </operation>\r\n    </file>\r\n\r\n    <file path=\"admin/model/catalog/product.php\">\r\n        <operation>\r\n            <search><![CDATA[$this->db->query(\"INSERT INTO \" . DB_PREFIX . \"product_image SET product_id = \'\" . (int)$product_id . \"\', image = \'\" . $this->db->escape($product_image[\'image\']) . \"\', sort_order = \'\" . (int)$product_image[\'sort_order\'] . \"\'\");]]></search>\r\n            <add position=\"replace\">\r\n                <![CDATA[\r\n                    /* Product Rotator */\r\n                    $this->db->query(\"INSERT INTO \" . DB_PREFIX . \"product_image SET product_id = \'\" . (int)$product_id . \"\', image = \'\" . $this->db->escape($product_image[\'image\']) . \"\', sort_order = \'\" . (int)$product_image[\'sort_order\'] . \"\', is_rotator = \'\" . (int)$product_image[\'is_rotator\'] . \"\'\");\r\n                ]]>\r\n            </add>\r\n        </operation>\r\n    </file>\r\n\r\n    <file path=\"admin/view/template/catalog/product_form.twig\">\r\n        <operation>\r\n            <search><![CDATA[<td class=\"text-right\">{{ entry_sort_order }}</td>]]></search>\r\n            <add position=\"after\">\r\n                <![CDATA[\r\n                    <!-- Product Rotator -->\r\n                    <td class=\"text-center\">{{ entry_is_rotator }}</td>\r\n                ]]>\r\n            </add>\r\n        </operation>\r\n        <operation>\r\n            <search><![CDATA[<td class=\"text-left\"><button type=\"button\" onclick=\"$(\'#image-row{{ image_row }}\').remove();\" data-toggle=\"tooltip\" title=\"{{ button_remove }}\" class=\"btn btn-danger\"><i class=\"fa fa-minus-circle\"></i></button></td>]]></search>\r\n            <add position=\"before\">\r\n                <![CDATA[\r\n                    <!-- Product Rotator -->\r\n                    <td class=\"text-center\">\r\n                      <select name=\"product_image[{{ image_row }}][is_rotator]\" class=\"form-control rotator-select\">\r\n                        {% if product_image.is_rotator and (product_image.is_rotator == 1) %}\r\n                        <option value=\"1\" selected=\"selected\">Yes</option>\r\n                        <option value=\"0\">No</option>\r\n                        {% else %}\r\n                        <option value=\"1\">Yes</option>\r\n                        <option value=\"0\" selected=\"selected\">No</option>\r\n                        {% endif %}\r\n                      </select>\r\n                    </td>\r\n                    <!-- End -->\r\n                ]]>\r\n            </add>\r\n        </operation>\r\n        <operation>\r\n            <search><![CDATA[function addImage() {]]></search>\r\n            <add position=\"before\">\r\n                <![CDATA[\r\n                    //Product Rotator\r\n                    $(\'#tab-image tfoot td:first\').attr(\'colspan\', 3);\r\n                    $(\'.rotator-select\').change(function() {\r\n                      var value = $(this).val();\r\n                      if(value == 1) {\r\n                        $(\'.rotator-select\').val(0);\r\n                        $(this).val(1);\r\n                      }\r\n                    });\r\n                    //End\r\n                ]]>\r\n            </add>\r\n        </operation>\r\n        <operation>\r\n            <search><![CDATA[$(\'#images tbody\').append(html);]]></search>\r\n            <add position=\"after\">\r\n                <![CDATA[\r\n                    //Product Rotator\r\n                    $(\'.rotator-select\').change(function() {\r\n                      var value = $(this).val();\r\n                      if(value == 1) {\r\n                        $(\'.rotator-select\').val(0);\r\n                        $(this).val(1);\r\n                      }\r\n                    });\r\n                    //End\r\n                ]]>\r\n            </add>\r\n        </operation>\r\n        <operation>\r\n            <search><![CDATA[html += \'  <td class=\"text-left\"><button type=\"button\" onclick=\"$(\\\'#image-row\' + image_row  + \'\\\').remove();\" data-toggle=\"tooltip\" title=\"{{ button_remove }}\" class=\"btn btn-danger\"><i class=\"fa fa-minus-circle\"></i></button></td>\';]]></search>\r\n            <add position=\"before\">\r\n                <![CDATA[\r\n                    //Product Rotator\r\n                    html += \' <td class=\"text-center\">\';\r\n                    html += \'   <select name=\"product_image[\' + image_row + \'][is_rotator]\" class=\"form-control rotator-select\">\';\r\n                    html += \'     <option value=\"1\">{{ text_yes }}</option>\';\r\n                    html += \'     <option value=\"0\" selected=\"selected\">{{ text_no }}</option>\';\r\n                    html += \'   </select>\';\r\n                    html += \' </td>\';\r\n                    //End\r\n                ]]>\r\n            </add>\r\n        </operation>\r\n    </file>\r\n    \r\n    <!-- THEME OPTION -->\r\n    <file path=\"catalog/controller/common/header.php\">\r\n        <operation>\r\n            <search><![CDATA[return $this->load->view(\'common/header\', $data);]]></search>\r\n            <add position=\"before\"><![CDATA[\r\n        $data[\'store_id\'] = $this->config->get(\'config_store_id\');\r\n        $data[\'theme_option_status\'] = $this->config->get(\'module_octhemeoption_status\');\r\n        $data[\'a_tag\'] = $this->config->get(\'module_octhemeoption_a_tag\');\r\n        $data[\'header_tag\'] = $this->config->get(\'module_octhemeoption_header_tag\');\r\n        $data[\'body_css\'] = $this->config->get(\'module_octhemeoption_body\');\r\n            ]]></add>\r\n        </operation>\r\n    </file>\r\n\r\n    <!-- Layouts Position -->\r\n    <file path=\"admin/controller/design/layout.php\">\r\n        <operation>\r\n            <search><![CDATA[$this->response->setOutput($this->load->view(\'design/layout_form\', $data));]]></search>\r\n            <add position=\"replace\"><![CDATA[\r\n                $this->response->setOutput($this->load->view(\'design/layout_plaza_form\', $data));\r\n            ]]></add>\r\n        </operation>\r\n    </file>\r\n</modification>\r\n', 1, '2017-08-09 09:37:22'),
(15, 15, 'OC Layered Navigation Ajax', 'layered_navigation', 'Plaza Theme', '3.x', 'http://www.plazathemes.com/', '<modification>\r\n    <name>OC Layered Navigation Ajax</name>\r\n	<version>3.x</version>\r\n	<link>http://www.plazathemes.com/</link>\r\n	<author>Plaza Theme</author>\r\n	<code>layered_navigation</code>\r\n\r\n	<file path=\"catalog/controller/product/category.php\">\r\n        <operation>\r\n            <search><![CDATA[$category_info = $this->model_catalog_category->getCategory($category_id);]]></search>\r\n            <add position=\"before\"><![CDATA[\r\n        /* Edit for Layered Navigation */\r\n        if (!empty($_SERVER[\'HTTPS\']) && $_SERVER[\'HTTPS\'] != \'off\') {\r\n            // SSL connection\r\n            $base_url = str_replace(\'http\', \'https\', $this->config->get(\'config_url\'));\r\n        } else {\r\n            $base_url = $this->config->get(\'config_url\');\r\n        }\r\n            ]]></add>\r\n        </operation>\r\n\r\n        <operation>\r\n            <search><![CDATA[\'href\' => $this->url->link(\'product/category\', \'path=\' . $this->request->get[\'path\'] . \'_\' . $result[\'category_id\'] . $url)]]></search>\r\n            <add position=\"replace\"><![CDATA[\'href\'  => $base_url . \'index.php?route=product/category&path=\' . $result[\'category_id\'] . $url]]></add>\r\n        </operation>\r\n\r\n        <operation>\r\n            <search><![CDATA[$this->url->link(\'product/category\', \'path=\' . $this->request->get[\'path\'] . \'&sort=p.sort_order&order=ASC\' . $url)]]></search>\r\n            <add position=\"replace\"><![CDATA[$base_url . \'index.php?route=product/category&path=\' . $category_id . \'&sort=p.sort_order&order=ASC\' . $url]]></add>\r\n        </operation>\r\n\r\n        <operation>\r\n            <search><![CDATA[$this->url->link(\'product/category\', \'path=\' . $this->request->get[\'path\'] . \'&sort=pd.name&order=ASC\' . $url)]]></search>\r\n            <add position=\"replace\"><![CDATA[$base_url . \'index.php?route=product/category&path=\' . $category_id . \'&sort=pd.name&order=ASC\' . $url]]></add>\r\n        </operation>\r\n\r\n        <operation>\r\n            <search><![CDATA[$this->url->link(\'product/category\', \'path=\' . $this->request->get[\'path\'] . \'&sort=pd.name&order=DESC\' . $url)]]></search>\r\n            <add position=\"replace\"><![CDATA[$base_url . \'index.php?route=product/category&path=\' . $category_id . \'&sort=pd.name&order=DESC\' . $url]]></add>\r\n        </operation>\r\n\r\n        <operation>\r\n            <search><![CDATA[$this->url->link(\'product/category\', \'path=\' . $this->request->get[\'path\'] . \'&sort=p.price&order=ASC\' . $url)]]></search>\r\n            <add position=\"replace\"><![CDATA[$base_url . \'index.php?route=product/category&path=\' . $category_id . \'&sort=p.price&order=ASC\' . $url]]></add>\r\n        </operation>\r\n\r\n        <operation>\r\n            <search><![CDATA[$this->url->link(\'product/category\', \'path=\' . $this->request->get[\'path\'] . \'&sort=p.price&order=DESC\' . $url)]]></search>\r\n            <add position=\"replace\"><![CDATA[$base_url . \'index.php?route=product/category&path=\' . $category_id . \'&sort=p.price&order=DESC\' . $url]]></add>\r\n        </operation>\r\n\r\n        <operation>\r\n            <search><![CDATA[$this->url->link(\'product/category\', \'path=\' . $this->request->get[\'path\'] . \'&sort=rating&order=DESC\' . $url)]]></search>\r\n            <add position=\"replace\"><![CDATA[$base_url . \'index.php?route=product/category&path=\' . $category_id . \'&sort=rating&order=DESC\' . $url]]></add>\r\n        </operation>\r\n\r\n        <operation>\r\n            <search><![CDATA[$this->url->link(\'product/category\', \'path=\' . $this->request->get[\'path\'] . \'&sort=rating&order=ASC\' . $url)]]></search>\r\n            <add position=\"replace\"><![CDATA[$base_url . \'index.php?route=product/category&path=\' . $category_id . \'&sort=rating&order=ASC\' . $url]]></add>\r\n        </operation>\r\n\r\n        <operation>\r\n            <search><![CDATA[$this->url->link(\'product/category\', \'path=\' . $this->request->get[\'path\'] . \'&sort=p.model&order=ASC\' . $url)]]></search>\r\n            <add position=\"replace\"><![CDATA[$base_url . \'index.php?route=product/category&path=\' . $category_id . \'&sort=p.model&order=ASC\' . $url]]></add>\r\n        </operation>\r\n\r\n        <operation>\r\n            <search><![CDATA[$this->url->link(\'product/category\', \'path=\' . $this->request->get[\'path\'] . \'&sort=p.model&order=DESC\' . $url)]]></search>\r\n            <add position=\"replace\"><![CDATA[$base_url . \'index.php?route=product/category&path=\' . $category_id . \'&sort=p.model&order=DESC\' . $url]]></add>\r\n        </operation>\r\n\r\n        <operation>\r\n            <search><![CDATA[$this->url->link(\'product/category\', \'path=\' . $this->request->get[\'path\'] . $url . \'&limit=\' . $value)]]></search>\r\n            <add position=\"replace\"><![CDATA[$base_url . \'index.php?route=product/category&path=\' . $category_id . $url . \'&limit=\' . $value]]></add>\r\n        </operation>\r\n\r\n        <operation>\r\n            <search><![CDATA[$pagination->url = $this->url->link(\'product/category\', \'path=\' . $this->request->get[\'path\'] . $url . \'&page={page}\');]]></search>\r\n            <add position=\"replace\"><![CDATA[$pagination->url = $base_url . \'index.php?route=extension/module/oclayerednavigation/category&path=\' . $category_id . $url . \'&page={page}\';]]></add>\r\n        </operation>\r\n\r\n        <operation>\r\n            <search><![CDATA[$data[\'limit\'] = $limit;]]></search>\r\n            <add position=\"replace\"><![CDATA[\r\n            /* Edit for Layered Navigation Ajax Module */\r\n            $module_status = $this->config->get(\'module_oclayerednavigation_status\');\r\n            if($module_status) {\r\n                // $this->document->addScript(\'catalog/view/javascript/jquery/jquery-ui.min.js\');\r\n                $this->document->addStyle(\'catalog/view/javascript/jquery/css/jquery-ui.min.css\');\r\n \r\n                if (file_exists(DIR_TEMPLATE . $this->config->get(\'theme_\' . $this->config->get(\'config_theme\') . \'_directory\') . \'/stylesheet/opentheme/oclayerednavigation/css/oclayerednavigation.css\')) {\r\n                    $this->document->addStyle(\'catalog/view/theme/\' . $this->config->get(\'theme_\' . $this->config->get(\'config_theme\') . \'_directory\') . \'/stylesheet/opentheme/oclayerednavigation/css/oclayerednavigation.css\');\r\n                } else {\r\n                    $this->document->addStyle(\'catalog/view/theme/default/stylesheet/opentheme/oclayerednavigation/css/oclayerednavigation.css\');\r\n                }\r\n \r\n                $this->document->addScript(\'catalog/view/javascript/opentheme/oclayerednavigation/oclayerednavigation.js\');\r\n            }\r\n\r\n\r\n            ]]></add>\r\n        </operation>\r\n\r\n        <operation>\r\n            <search><![CDATA[$this->response->setOutput($this->load->view(\'product/category\', $data));]]></search>\r\n            <add position=\"replace\"><![CDATA[\r\n            /* Edit for Layered Navigation Ajax Module */\r\n            if($module_status) {\r\n                $data[\'module_oclayerednavigation_loader_img\'] = $base_url . \'image/\' . $this->config->get(\'module_oclayerednavigation_loader_img\');\r\n \r\n                $this->response->setOutput($this->load->view(\'extension/module/oclayerednavigation/occategory\', $data));\r\n            } else {\r\n \r\n                $this->response->setOutput($this->load->view(\'product/category\', $data));\r\n            }\r\n            ]]></add>\r\n        </operation>\r\n	</file>\r\n\r\n    <file path=\"catalog/model/catalog/product.php\">\r\n        <operation>\r\n            <search><![CDATA[if (!empty($data[\'filter_manufacturer_id\'])) {]]></search>\r\n            <add position=\"before\">\r\n                <![CDATA[\r\n        /* Price range */\r\n        if  (!empty($data[\'filter_price\'])) {\r\n            $min_price = $data[\'filter_price\'][\'min_price\'];\r\n            $max_price = $data[\'filter_price\'][\'max_price\'];\r\n            $sql_sl_special = \"(SELECT price FROM \" . DB_PREFIX . \"product_special ps WHERE ps.product_id = p.product_id AND ps.customer_group_id = \'\" . (int)$this->config->get(\'config_customer_group_id\') . \"\' AND ((ps.date_start = \'0000-00-00\' OR ps.date_start < NOW()) AND (ps.date_end = \'0000-00-00\' OR ps.date_end > NOW())) ORDER BY ps.priority ASC, ps.price ASC LIMIT 1)\";\r\n            $sql_sl_discount = \"(SELECT price FROM \" . DB_PREFIX . \"product_discount pd2 WHERE pd2.product_id = p.product_id AND pd2.customer_group_id = \'\" . (int)$this->config->get(\'config_customer_group_id\') . \"\' AND pd2.quantity = \'1\' AND ((pd2.date_start = \'0000-00-00\' OR pd2.date_start < NOW()) AND (pd2.date_end = \'0000-00-00\' OR pd2.date_end > NOW())) ORDER BY pd2.priority ASC, pd2.price ASC LIMIT 1)\";\r\n            $sql .= \" AND (CASE WHEN \" . $sql_sl_special . \" IS NOT NULL THEN \" . $sql_sl_special . \" WHEN \" . $sql_sl_discount . \" IS NOT NULL THEN \". $sql_sl_discount . \" ELSE p.price END) >=\'\". $min_price .\"\'\" ;\r\n            $sql .= \" AND (CASE WHEN \" . $sql_sl_special . \" IS NOT NULL THEN \" . $sql_sl_special . \" WHEN \" . $sql_sl_discount . \" IS NOT NULL THEN \". $sql_sl_discount . \" ELSE p.price END) <=\'\". $max_price .\"\'\";\r\n        }\r\n        /* End */\r\n                ]]>\r\n            </add>\r\n        </operation>\r\n    </file>\r\n</modification>', 1, '2017-08-15 14:53:18'),
(23, 23, 'OC Search Category by Plaza Themes', 'search_category', 'Plaza Theme', '3.0', 'http://www.plazathemes.com/', '<modification>\r\n    <name>OC Search Category by Plaza Themes</name>\r\n	<version>3.0</version>\r\n	<link>http://www.plazathemes.com/</link>\r\n	<author>Plaza Theme</author>\r\n	<code>search_category</code>\r\n\r\n	<file path=\"catalog/controller/common/header.php\">\r\n		<operation>\r\n			<search ><![CDATA[$data[\'search\'] = $this->load->controller(\'common/search\');]]></search>\r\n			<add position=\"replace\"><![CDATA[\r\n				/* Edit for Search Category Module by OCMod */\r\n				$module_status = $this->config->get(\'module_ocsearchcategory_status\');\r\n				if($module_status) {\r\n					$data[\'search\'] = $this->load->controller(\'extension/module/ocsearchcategory\');\r\n				} else {\r\n					$data[\'search\'] = $this->load->controller(\'common/search\');\r\n				}\r\n				/* End Code */\r\n			]]></add>\r\n		</operation>\r\n	</file>	\r\n</modification>', 1, '2017-10-18 14:05:14');
INSERT INTO `oc_modification` (`modification_id`, `extension_install_id`, `name`, `code`, `author`, `version`, `link`, `xml`, `status`, `date_added`) VALUES
(28, 28, 'OC Customize Template', 'oc_customize_template', 'Plaza Theme', '3.x', '', '<?xml version=\"1.0\" encoding=\"utf-8\"?>\r\n<modification>\r\n    <code>oc_customize_template</code>\r\n    <name>OC Customize Template</name>\r\n    <version>3.x</version>\r\n    <author>Plaza Theme</author>\r\n	\r\n	<file path=\"admin/model/localisation/language.php\">\r\n		<operation>\r\n			<search><![CDATA[return $language_id;]]></search>\r\n			<add position=\"before\"><![CDATA[\r\n				$query = $this->db->query(\"SELECT * FROM \" . DB_PREFIX . \"cmsblock_description WHERE language_id = \'\" . (int)$this->config->get(\'config_language_id\') . \"\'\");\r\n\r\n				foreach ($query->rows as $cmsblock_description) {\r\n					$this->db->query(\"INSERT INTO \" . DB_PREFIX . \"cmsblock_description SET cmsblock_des_id = \'\" . (int)$cmsblock_description[\'cmsblock_des_id\'] . \"\', language_id = \'\" . (int)$language_id . \"\', cmsblock_id = \'\" . (int)$cmsblock_description[\'cmsblock_id\'] . \"\', title = \'\" . $this->db->escape($cmsblock_description[\'title\']) . \"\', description = \'\" . $this->db->escape($cmsblock_description[\'description\']) . \"\'\");\r\n				}\r\n				$this->cache->delete(\'cmsblock_description\');\r\n\r\n				$query = $this->db->query(\"SELECT * FROM \" . DB_PREFIX . \"article_description WHERE language_id = \'\" . (int)$this->config->get(\'config_language_id\') . \"\'\");\r\n\r\n				foreach ($query->rows as $article_description) {\r\n					$this->db->query(\"INSERT INTO \" . DB_PREFIX . \"article_description SET article_id = \'\" . (int)$article_description[\'article_id\'] . \"\', language_id = \'\" . (int)$language_id . \"\', name = \'\" . $this->db->escape($article_description[\'name\']) . \"\', description = \'\" . $this->db->escape($article_description[\'description\']) . \"\', intro_text = \'\" . $this->db->escape($article_description[\'intro_text\']) . \"\', meta_title = \'\" . $this->db->escape($article_description[\'meta_title\']) . \"\', meta_description = \'\" . $this->db->escape($article_description[\'meta_description\']) . \"\', meta_keyword = \'\" . $this->db->escape($article_description[\'meta_keyword\']) . \"\'\");\r\n				}\r\n				$this->cache->delete(\'article_description\');\r\n				\r\n				$query = $this->db->query(\"SELECT * FROM \" . DB_PREFIX . \"ocslideshow_image_description WHERE language_id = \'\" . (int)$this->config->get(\'config_language_id\') . \"\'\");\r\n\r\n				foreach ($query->rows as $ocslideshow_image_description) {\r\n					$this->db->query(\"INSERT INTO \" . DB_PREFIX . \"ocslideshow_image_description SET ocslideshow_image_id = \'\" . (int)$ocslideshow_image_description[\'ocslideshow_image_id\'] . \"\', language_id = \'\" . (int)$language_id . \"\', ocslideshow_id = \'\" . (int)$ocslideshow_image_description[\'ocslideshow_id\'] . \"\', description = \'\" . $this->db->escape($ocslideshow_image_description[\'description\']) . \"\', title = \'\" . $this->db->escape($ocslideshow_image_description[\'title\']) . \"\', sub_title = \'\" . $this->db->escape($ocslideshow_image_description[\'sub_title\']) . \"\'\");\r\n				}\r\n				$this->cache->delete(\'ocslideshow_image_description\');\r\n			]]></add>\r\n		</operation>\r\n	</file>\r\n	\r\n	<file path=\"catalog/controller/common/cart.php\">\r\n		<operation>\r\n			<search><![CDATA[$data[\'text_items\'] = sprintf($this->language->get(\'text_items\'), $this->cart->countProducts() + (isset($this->session->data[\'vouchers\']) ? count($this->session->data[\'vouchers\']) : 0), $this->currency->format($total, $this->session->data[\'currency\']));]]></search>\r\n			<add position=\"replace\"><![CDATA[\r\n				$data[\'text_items\'] = sprintf($this->language->get(\'text_items\'), $this->cart->countProducts() + (isset($this->session->data[\'vouchers\']) ? count($this->session->data[\'vouchers\']) : 0), null);\r\n			]]></add>\r\n		</operation>\r\n		<operation>\r\n			<search><![CDATA[$data[\'products\'][] = array(]]></search>\r\n			<add position=\"before\"><![CDATA[\r\n				$c_words = 30;\r\n				$product[\'name\'] = strlen($product[\'name\']) > $c_words ? substr($product[\'name\'],0,$c_words).\"...\" : $product[\'name\'];\r\n			]]></add>\r\n		</operation>\r\n	</file>	\r\n\r\n	<file path=\"catalog/controller/common/header.php\">\r\n		<operation>\r\n			<search><![CDATA[return $this->load->view(\'common/header\', $data);]]></search>\r\n			<add position=\"before\"><![CDATA[\r\n				$data[\'block1\'] = $this->load->controller(\'common/block1\');\r\n				$data[\'block2\'] = $this->load->controller(\'common/block2\');\r\n				$data[\'block3\'] = $this->load->controller(\'common/block3\');\r\n				$data[\'block9\'] = $this->load->controller(\'common/block9\');				\r\n				$data[\'block10\'] = $this->load->controller(\'common/block10\');\r\n				if($this->config->get(\'module_ocajaxlogin_status\')){\r\n					$data[\'use_ajax_login\'] = true;\r\n				}else{\r\n					$data[\'use_ajax_login\'] = false;\r\n				}\r\n				\r\n				// For page specific css\r\n				if (isset($this->request->get[\'route\'])) {\r\n					if (isset($this->request->get[\'product_id\'])) {\r\n						$class = \'-\' . $this->request->get[\'product_id\'];\r\n					} elseif (isset($this->request->get[\'path\'])) {\r\n						$class = \'-\' . $this->request->get[\'path\'];\r\n					} elseif (isset($this->request->get[\'manufacturer_id\'])) {\r\n						$class = \'-\' . $this->request->get[\'manufacturer_id\'];\r\n					} elseif (isset($this->request->get[\'information_id\'])) {\r\n						$class = \'-\' . $this->request->get[\'information_id\'];\r\n					} else {\r\n						$class = \'\';\r\n					}\r\n\r\n					$data[\'class\'] = str_replace(\'/\', \'-\', $this->request->get[\'route\']) . $class;\r\n				} else {\r\n					$data[\'class\'] = \'common-home\';\r\n				}\r\n			]]></add>\r\n		</operation>\r\n	</file>\r\n	\r\n	<file path=\"catalog/controller/common/footer.php\">\r\n		<operation>\r\n			<search><![CDATA[$data[\'newsletter\'] = $this->url->link(\'account/newsletter\', \'\', true);]]></search>\r\n			<add position=\"after\"><![CDATA[						\r\n				$data[\'block4\'] = $this->load->controller(\'common/block4\');			\r\n				$data[\'block5\'] = $this->load->controller(\'common/block5\');				\r\n				$data[\'block6\'] = $this->load->controller(\'common/block6\');				\r\n				$data[\'block7\'] = $this->load->controller(\'common/block7\');				\r\n				$data[\'block8\'] = $this->load->controller(\'common/block8\');				\r\n								\r\n				if ($this->request->server[\'HTTPS\']) {\r\n					$server = $this->config->get(\'config_ssl\');\r\n				} else {\r\n					$server = $this->config->get(\'config_url\');\r\n				}\r\n			]]></add>\r\n		</operation>\r\n	</file>\r\n	\r\n	<file path=\"catalog/controller/product/category.php\">\r\n		<operation>\r\n			<search><![CDATA[foreach ($results as $result) {]]></search>\r\n			<add position=\"before\"><![CDATA[\r\n				/* Get new product */\r\n				$this->load->model(\'catalog/product\');\r\n		\r\n				$data[\'new_products\'] = array();\r\n		\r\n				$filter_data = array(\r\n					\'sort\'  => \'p.date_added\',\r\n					\'order\' => \'DESC\',\r\n					\'start\' => 0,\r\n					\'limit\' => 10\r\n				);\r\n		\r\n				$new_results = $this->model_catalog_product->getProducts($filter_data);\r\n				/* End */\r\n			]]></add>\r\n		</operation>\r\n		<operation>\r\n			<search><![CDATA[$data[\'products\'][] = array(]]></search>\r\n			<add position=\"before\"><![CDATA[\r\n				$is_new = false;\r\n				if ($new_results) { \r\n					foreach($new_results as $new_r) {\r\n						if($result[\'product_id\'] == $new_r[\'product_id\']) {\r\n							$is_new = true;\r\n						}\r\n					}\r\n				}\r\n				if (($this->config->get(\'config_customer_price\') && $this->customer->isLogged()) || !$this->config->get(\'config_customer_price\')) {\r\n					$price_num = $this->tax->calculate($result[\'price\'], $result[\'tax_class_id\'], $this->config->get(\'config_tax\'));\r\n				} else {\r\n					$price_num = false;\r\n				}\r\n\r\n				if ((float)$result[\'special\']) {\r\n					$special_num = $this->tax->calculate($result[\'special\'], $result[\'tax_class_id\'], $this->config->get(\'config_tax\'));\r\n				} else {\r\n					$special_num = false;\r\n				}\r\n				/// Product Rotator /\r\n				$store_id = $this->config->get(\'config_store_id\');\r\n\r\n				$product_rotator_status = (int) $this->config->get(\'module_octhemeoption_rotator\')[$store_id];\r\n				if($product_rotator_status == 1) {\r\n				 $this->load->model(\'catalog/ocproductrotator\');\r\n				 $this->load->model(\'tool/image\');\r\n			 \r\n				 $product_id = $result[\'product_id\'];\r\n				 $product_rotator_image = $this->model_catalog_ocproductrotator->getProductRotatorImage($product_id);\r\n			 \r\n				 if($product_rotator_image) {\r\n				  $rotator_image = $this->model_tool_image->resize($product_rotator_image, $this->config->get(\'theme_\' . $this->config->get(\'config_theme\') . \'_image_product_width\'), $this->config->get(\'theme_\' . $this->config->get(\'config_theme\') . \'_image_product_height\')); \r\n				 } else {\r\n				  $rotator_image = false;\r\n				 } \r\n				} else {\r\n				 $rotator_image = false;    \r\n				}\r\n				/// End Product Rotator /\r\n								\r\n				$c_words = 50;\r\n				$result[\'name\'] = strlen($result[\'name\']) > $c_words ? substr($result[\'name\'],0,$c_words).\"...\" : $result[\'name\'];\r\n			]]></add>\r\n		</operation>\r\n		<operation>\r\n			<search><![CDATA[\'product_id\'  => $result[\'product_id\'],]]></search>\r\n			<add position=\"before\"><![CDATA[\r\n				\'is_new\'      => $is_new,\r\n				\'rotator_image\' => $rotator_image,\r\n				\'price_num\'       => $price_num,\r\n				\'special_num\'     => $special_num,\r\n				\'manufacturer\' => $result[\'manufacturer\'],\r\n				\'manufacturers\' => $this->url->link(\'product/manufacturer/info\', \'manufacturer_id=\' . $result[\'manufacturer_id\']),\r\n			]]></add>\r\n		</operation>\r\n	</file>\r\n	\r\n	<file path=\"catalog/controller/product/product.php\">\r\n		<operation>\r\n			<search><![CDATA[$results = $this->model_catalog_product->getProductRelated($this->request->get[\'product_id\']);]]></search>\r\n			<add position=\"before\"><![CDATA[\r\n				/* Get new product */\r\n				$this->load->model(\'catalog/product\');\r\n		\r\n				$data[\'new_products\'] = array();\r\n		\r\n				$filter_data = array(\r\n					\'sort\'  => \'p.date_added\',\r\n					\'order\' => \'DESC\',\r\n					\'start\' => 0,\r\n					\'limit\' => 10\r\n				);\r\n		\r\n				$new_results = $this->model_catalog_product->getProducts($filter_data);\r\n				/* End */\r\n			]]></add>\r\n		</operation>\r\n		<operation>\r\n			<search><![CDATA[$data[\'products\'][] = array(]]></search>\r\n			<add position=\"before\"><![CDATA[\r\n				$is_new = false;\r\n				if ($new_results) { \r\n					foreach($new_results as $new_r) {\r\n						if($result[\'product_id\'] == $new_r[\'product_id\']) {\r\n							$is_new = true;\r\n						}\r\n					}\r\n				}\r\n				if (($this->config->get(\'config_customer_price\') && $this->customer->isLogged()) || !$this->config->get(\'config_customer_price\')) {\r\n					$price_num = $this->tax->calculate($result[\'price\'], $result[\'tax_class_id\'], $this->config->get(\'config_tax\'));\r\n				} else {\r\n					$price_num = false;\r\n				}\r\n\r\n				if ((float)$result[\'special\']) {\r\n					$special_num = $this->tax->calculate($result[\'special\'], $result[\'tax_class_id\'], $this->config->get(\'config_tax\'));\r\n				} else {\r\n					$special_num = false;\r\n				}\r\n				/// Product Rotator /\r\n				$store_id = $this->config->get(\'config_store_id\');\r\n\r\n				$product_rotator_status = (int) $this->config->get(\'module_octhemeoption_rotator\')[$store_id];\r\n				if($product_rotator_status == 1) {\r\n				 $this->load->model(\'catalog/ocproductrotator\');\r\n				 $this->load->model(\'tool/image\');\r\n			 \r\n				 $product_id = $result[\'product_id\'];\r\n				 $product_rotator_image = $this->model_catalog_ocproductrotator->getProductRotatorImage($product_id);\r\n			 \r\n				 if($product_rotator_image) {\r\n				  $rotator_image = $this->model_tool_image->resize($product_rotator_image, $this->config->get(\'theme_\' . $this->config->get(\'config_theme\') . \'_image_product_width\'), $this->config->get(\'theme_\' . $this->config->get(\'config_theme\') . \'_image_product_height\')); \r\n				 } else {\r\n				  $rotator_image = false;\r\n				 }\r\n				} else {\r\n				 $rotator_image = false;    \r\n				}\r\n				/// End Product Rotator /	\r\n				\r\n				$data[\'use_quickview\'] = (int) $this->config->get(\'module_octhemeoption_quickview\')[$store_id];\r\n				\r\n				$c_words = 50;\r\n				$result[\'name\'] = strlen($result[\'name\']) > $c_words ? substr($result[\'name\'],0,$c_words).\"...\" : $result[\'name\'];\r\n			]]></add>\r\n		</operation>\r\n		<operation>\r\n			<search><![CDATA[\'rating\'      => $rating,]]></search>\r\n			<add position=\"after\"><![CDATA[\r\n				\'is_new\'      => $is_new,\r\n				\'rotator_image\' => $rotator_image,\r\n				\'price_num\'       => $price_num,\r\n				\'special_num\'     => $special_num,\r\n				\'manufacturer\' => $result[\'manufacturer\'],\r\n				\'manufacturers\' => $this->url->link(\'product/manufacturer/info\', \'manufacturer_id=\' . $result[\'manufacturer_id\']),\r\n			]]></add>\r\n		</operation>\r\n		<operation>\r\n			<search><![CDATA[$data[\'description\'] = html_entity_decode($product_info[\'description\'], ENT_QUOTES, \'UTF-8\');]]></search>\r\n			<add position=\"after\"><![CDATA[\r\n				$data[\'short_description\'] = utf8_substr(strip_tags(html_entity_decode($product_info[\'description\'], ENT_QUOTES, \'UTF-8\')), 0, $this->config->get($this->config->get(\'config_theme\') . \'_product_description_length\')) . \'..\';\r\n			]]></add>\r\n		</operation>\r\n	</file>\r\n	\r\n	<file path=\"catalog/controller/product/special.php\">		\r\n		<operation>\r\n			<search><![CDATA[$results = $this->model_catalog_product->getProductSpecials($filter_data);]]></search>\r\n			<add position=\"after\"><![CDATA[\r\n				/* Get new product */\r\n				$this->load->model(\'catalog/product\');\r\n		\r\n				$data[\'new_products\'] = array();\r\n		\r\n				$filter_data = array(\r\n					\'sort\'  => \'p.date_added\',\r\n					\'order\' => \'DESC\',\r\n					\'start\' => 0,\r\n					\'limit\' => 10\r\n				);\r\n		\r\n				$new_results = $this->model_catalog_product->getProducts($filter_data);\r\n				/* End */\r\n			]]></add>\r\n		</operation>\r\n		\r\n		<operation>\r\n			<search><![CDATA[$data[\'products\'][] = array(]]></search>\r\n			<add position=\"before\"><![CDATA[\r\n				$is_new = false;\r\n				if ($new_results) { \r\n					foreach($new_results as $new_r) {\r\n						if($result[\'product_id\'] == $new_r[\'product_id\']) {\r\n							$is_new = true;\r\n						}\r\n					}\r\n				}\r\n				if (($this->config->get(\'config_customer_price\') && $this->customer->isLogged()) || !$this->config->get(\'config_customer_price\')) {\r\n					$price_num = $this->tax->calculate($result[\'price\'], $result[\'tax_class_id\'], $this->config->get(\'config_tax\'));\r\n				} else {\r\n					$price_num = false;\r\n				}\r\n\r\n				if ((float)$result[\'special\']) {\r\n					$special_num = $this->tax->calculate($result[\'special\'], $result[\'tax_class_id\'], $this->config->get(\'config_tax\'));\r\n				} else {\r\n					$special_num = false;\r\n				}\r\n				/// Product Rotator /\r\n				$store_id = $this->config->get(\'config_store_id\');\r\n				$product_rotator_status = (int) $this->config->get(\'module_octhemeoption_rotator\')[$store_id];\r\n				\r\n				if($product_rotator_status == 1) {\r\n				 $this->load->model(\'catalog/ocproductrotator\');\r\n				 $this->load->model(\'tool/image\');\r\n			 \r\n				 $product_id = $result[\'product_id\'];\r\n				 $product_rotator_image = $this->model_catalog_ocproductrotator->getProductRotatorImage($product_id);\r\n			 \r\n					 if($product_rotator_image) {\r\n							$rotator_image = $this->model_tool_image->resize($product_rotator_image, $this->config->get(\'theme_\' . $this->config->get(\'config_theme\') . \'_image_product_width\'), $this->config->get(\'theme_\' . $this->config->get(\'config_theme\') . \'_image_product_height\')); \r\n					} else {\r\n						$rotator_image = false;\r\n					}\r\n				} else {\r\n				 $rotator_image = false;    \r\n				}\r\n				/// End Product Rotator /\r\n				\r\n				$c_words = 50;\r\n				$result[\'name\'] = strlen($result[\'name\']) > $c_words ? substr($result[\'name\'],0,$c_words).\"...\" : $result[\'name\'];\r\n			]]></add>\r\n		</operation>\r\n		\r\n		<operation>\r\n			<search><![CDATA[\'rating\'      => $result[\'rating\'],]]></search>\r\n			<add position=\"after\"><![CDATA[\r\n				\'is_new\'      => $is_new,\r\n				\'rotator_image\' => $rotator_image,\r\n				\'price_num\'       => $price_num,\r\n				\'special_num\'     => $special_num,\r\n				\'manufacturer\' => $result[\'manufacturer\'],\r\n				\'manufacturers\' => $this->url->link(\'product/manufacturer/info\', \'manufacturer_id=\' . $result[\'manufacturer_id\']),\r\n			]]></add>\r\n		</operation>\r\n	</file>\r\n\r\n	<file path=\"catalog/controller/product/search.php\">\r\n		<operation>\r\n			<search><![CDATA[$results = $this->model_catalog_product->getProducts($filter_data);]]></search>\r\n			<add position=\"after\"><![CDATA[\r\n				/* Get new product */\r\n				$this->load->model(\'catalog/product\');\r\n		\r\n				$data[\'new_products\'] = array();\r\n		\r\n				$filter_data = array(\r\n					\'sort\'  => \'p.date_added\',\r\n					\'order\' => \'DESC\',\r\n					\'start\' => 0,\r\n					\'limit\' => 10\r\n				);\r\n		\r\n				$new_results = $this->model_catalog_product->getProducts($filter_data);\r\n				/* End */\r\n			]]></add>\r\n		</operation>\r\n		\r\n		<operation>\r\n			<search><![CDATA[$data[\'products\'][] = array(]]></search>\r\n			<add position=\"before\"><![CDATA[\r\n				$is_new = false;\r\n				if ($new_results) { \r\n					foreach($new_results as $new_r) {\r\n						if($result[\'product_id\'] == $new_r[\'product_id\']) {\r\n							$is_new = true;\r\n						}\r\n					}\r\n				}\r\n				if (($this->config->get(\'config_customer_price\') && $this->customer->isLogged()) || !$this->config->get(\'config_customer_price\')) {\r\n					$price_num = $this->tax->calculate($result[\'price\'], $result[\'tax_class_id\'], $this->config->get(\'config_tax\'));\r\n				} else {\r\n					$price_num = false;\r\n				}\r\n\r\n				if ((float)$result[\'special\']) {\r\n					$special_num = $this->tax->calculate($result[\'special\'], $result[\'tax_class_id\'], $this->config->get(\'config_tax\'));\r\n				} else {\r\n					$special_num = false;\r\n				}\r\n				/// Product Rotator /\r\n				$store_id = $this->config->get(\'config_store_id\');\r\n				$product_rotator_status = (int) $this->config->get(\'module_octhemeoption_rotator\')[$store_id];\r\n				if($product_rotator_status == 1) {\r\n				 $this->load->model(\'catalog/ocproductrotator\');\r\n				 $this->load->model(\'tool/image\');\r\n			 \r\n				 $product_id = $result[\'product_id\'];\r\n				 $product_rotator_image = $this->model_catalog_ocproductrotator->getProductRotatorImage($product_id);\r\n			 \r\n				 if($product_rotator_image) {\r\n							$rotator_image = $this->model_tool_image->resize($product_rotator_image, $this->config->get(\'theme_\' . $this->config->get(\'config_theme\') . \'_image_product_width\'), $this->config->get(\'theme_\' . $this->config->get(\'config_theme\') . \'_image_product_height\')); \r\n					} else {\r\n						$rotator_image = false;\r\n					} \r\n				} else {\r\n				 $rotator_image = false;    \r\n				}\r\n				/// End Product Rotator /\r\n				\r\n				$c_words = 50;\r\n				$result[\'name\'] = strlen($result[\'name\']) > $c_words ? substr($result[\'name\'],0,$c_words).\"...\" : $result[\'name\'];\r\n			]]></add>\r\n		</operation>\r\n		\r\n		<operation>\r\n			<search><![CDATA[\'rating\'      => $result[\'rating\'],]]></search>\r\n			<add position=\"after\"><![CDATA[\r\n				\'is_new\'      => $is_new,\r\n				\'rotator_image\' => $rotator_image,\r\n				\'price_num\'       => $price_num,\r\n				\'special_num\'     => $special_num,\r\n				\'manufacturer\' => $result[\'manufacturer\'],\r\n				\'manufacturers\' => $this->url->link(\'product/manufacturer/info\', \'manufacturer_id=\' . $result[\'manufacturer_id\']),\r\n			]]></add>\r\n		</operation>\r\n	</file>\r\n\r\n	<file path=\"catalog/controller/product/manufacturer.php\">\r\n		<operation>\r\n			<search><![CDATA[$results = $this->model_catalog_product->getProducts($filter_data);]]></search>\r\n			<add position=\"after\"><![CDATA[\r\n				/* Get new product */\r\n				$this->load->model(\'catalog/product\');\r\n		\r\n				$data[\'new_products\'] = array();\r\n		\r\n				$filter_data = array(\r\n					\'sort\'  => \'p.date_added\',\r\n					\'order\' => \'DESC\',\r\n					\'start\' => 0,\r\n					\'limit\' => 10\r\n				);\r\n		\r\n				$new_results = $this->model_catalog_product->getProducts($filter_data);\r\n				/* End */\r\n			]]></add>\r\n		</operation>\r\n		\r\n		<operation>\r\n			<search><![CDATA[$data[\'products\'][] = array(]]></search>\r\n			<add position=\"before\"><![CDATA[\r\n				$is_new = false;\r\n				if ($new_results) { \r\n					foreach($new_results as $new_r) {\r\n						if($result[\'product_id\'] == $new_r[\'product_id\']) {\r\n							$is_new = true;\r\n						}\r\n					}\r\n				}\r\n				if (($this->config->get(\'config_customer_price\') && $this->customer->isLogged()) || !$this->config->get(\'config_customer_price\')) {\r\n					$price_num = $this->tax->calculate($result[\'price\'], $result[\'tax_class_id\'], $this->config->get(\'config_tax\'));\r\n				} else {\r\n					$price_num = false;\r\n				}\r\n\r\n				if ((float)$result[\'special\']) {\r\n					$special_num = $this->tax->calculate($result[\'special\'], $result[\'tax_class_id\'], $this->config->get(\'config_tax\'));\r\n				} else {\r\n					$special_num = false;\r\n				}\r\n				/// Product Rotator /\r\n				$store_id = $this->config->get(\'config_store_id\');\r\n				$product_rotator_status = (int) $this->config->get(\'module_octhemeoption_rotator\')[$store_id];\r\n				if($product_rotator_status == 1) {\r\n				 $this->load->model(\'catalog/ocproductrotator\');\r\n				 $this->load->model(\'tool/image\');\r\n			 \r\n				 $product_id = $result[\'product_id\'];\r\n				 $product_rotator_image = $this->model_catalog_ocproductrotator->getProductRotatorImage($product_id);\r\n			 \r\n				 if($product_rotator_image) {\r\n							$rotator_image = $this->model_tool_image->resize($product_rotator_image, $this->config->get(\'theme_\' . $this->config->get(\'config_theme\') . \'_image_product_width\'), $this->config->get(\'theme_\' . $this->config->get(\'config_theme\') . \'_image_product_height\')); \r\n					} else {\r\n						$rotator_image = false;\r\n					}\r\n				} else {\r\n				 $rotator_image = false;    \r\n				}\r\n				/// End Product Rotator /\r\n				\r\n				$c_words = 50;\r\n				$result[\'name\'] = strlen($result[\'name\']) > $c_words ? substr($result[\'name\'],0,$c_words).\"...\" : $result[\'name\'];\r\n			]]></add>\r\n		</operation>\r\n		\r\n		<operation>\r\n			<search><![CDATA[\'rating\'      => $result[\'rating\'],]]></search>\r\n			<add position=\"after\"><![CDATA[\r\n				\'is_new\'      => $is_new,\r\n				\'rotator_image\' => $rotator_image,\r\n				\'price_num\'       => $price_num,\r\n				\'special_num\'     => $special_num,\r\n				\'manufacturer\' => $result[\'manufacturer\'],\r\n				\'manufacturers\' => $this->url->link(\'product/manufacturer/info\', \'manufacturer_id=\' . $result[\'manufacturer_id\']),\r\n			]]></add>\r\n		</operation>\r\n	</file>\r\n	<file path=\"catalog/controller/account/{account,address,affiliate,download,edit,forgotten,login,logout,newsletter,order,password,recurring,register,reset,return,reward,success,tracking,transaction,voucher,wishlist}*.php\">\r\n		  <operation>\r\n		   <search><![CDATA[$this->document->setTitle($this->language->get(\'heading_title\'));]]></search>\r\n		   <add position=\"after\"><![CDATA[\r\n			$data[\'heading_title\'] = $this->language->get(\'heading_title\');\r\n		   ]]></add>\r\n		  </operation>\r\n		 </file>\r\n		 \r\n		 <file path=\"catalog/controller/affiliate/{login,register,success,}*.php\">\r\n		  <operation>\r\n		   <search><![CDATA[$this->document->setTitle($this->language->get(\'heading_title\'));]]></search>\r\n		   <add position=\"after\"><![CDATA[\r\n			$data[\'heading_title\'] = $this->language->get(\'heading_title\');\r\n		   ]]></add>\r\n		  </operation>\r\n		 </file>\r\n		 \r\n		 <file path=\"catalog/controller/checkout/{cart,checkout,failure,success}*.php\">\r\n		  <operation>\r\n		   <search><![CDATA[$this->document->setTitle($this->language->get(\'heading_title\'));]]></search>\r\n		   <add position=\"after\"><![CDATA[\r\n			$data[\'heading_title\'] = $this->language->get(\'heading_title\');\r\n		   ]]></add>\r\n		  </operation>\r\n		 </file>\r\n		 \r\n		 <file path=\"catalog/controller/product/{compare,manufacturer,search,special}*.php\">\r\n		  <operation>\r\n		   <search><![CDATA[$this->document->setTitle($this->language->get(\'heading_title\'));]]></search>\r\n		   <add position=\"after\"><![CDATA[\r\n			$data[\'heading_title\'] = $this->language->get(\'heading_title\');\r\n		   ]]></add>\r\n		  </operation>\r\n		 </file>\r\n		 \r\n		 <file path=\"catalog/controller/{common,error}/{maintenance,not_found}*.php\">\r\n		  <operation>\r\n		   <search><![CDATA[$this->document->setTitle($this->language->get(\'heading_title\'));]]></search>\r\n		   <add position=\"after\"><![CDATA[\r\n			$data[\'heading_title\'] = $this->language->get(\'heading_title\');\r\n		   ]]></add>\r\n		  </operation>\r\n		 </file>\r\n		 \r\n		 <file path=\"catalog/controller/extension/{credit_card,payment}/{sagepay_direct,sagepay_server,squareup,amazon_login_pay,klarna_checkout,wechat_pay}*.php\">\r\n		  <operation>\r\n		   <search><![CDATA[$this->document->setTitle($this->language->get(\'heading_title\'));]]></search>\r\n		   <add position=\"after\"><![CDATA[\r\n			$data[\'heading_title\'] = $this->language->get(\'heading_title\');\r\n		   ]]></add>\r\n		  </operation>\r\n	</file>\r\n	<file path=\"catalog/controller/information/{sitemap,contact}*.php\">\r\n	  <operation>\r\n	   <search><![CDATA[$this->document->setTitle($this->language->get(\'heading_title\'));]]></search>\r\n	   <add position=\"after\"><![CDATA[\r\n		$data[\'heading_title\'] = $this->language->get(\'heading_title\');\r\n	   ]]></add>\r\n	  </operation>\r\n	 </file>\r\n	 <file path=\"catalog/controller/account/{address,download,order,recurring,return,reward,transaction,wishlist}*.php\">\r\n		<operation>\r\n			<search><![CDATA[$this->document->setTitle($this->language->get(\'heading_title\'));]]></search>\r\n			<add position=\"after\"><![CDATA[\r\n				$data[\'text_empty\'] = $this->language->get(\'text_empty\');\r\n			]]></add>\r\n		</operation>\r\n	</file>\r\n	<file path=\"catalog/controller/checkout/cart.php\">\r\n		<operation>\r\n			<search><![CDATA[$this->document->setTitle($this->language->get(\'heading_title\'));]]></search>\r\n			<add position=\"after\"><![CDATA[\r\n				$data[\'text_empty\'] = $this->language->get(\'text_empty\');\r\n			]]></add>\r\n		</operation>\r\n	</file>\r\n	<file path=\"catalog/controller/common/cart.php\">\r\n		<operation>\r\n			<search><![CDATA[$this->document->setTitle($this->language->get(\'heading_title\'));]]></search>\r\n			<add position=\"after\"><![CDATA[\r\n				$data[\'text_empty\'] = $this->language->get(\'text_empty\');\r\n			]]></add>\r\n		</operation>\r\n	</file>\r\n	<file path=\"catalog/controller/extension/credit_card/{sagepay_direct,sagepay_server}*.php\">\r\n		<operation>\r\n			<search><![CDATA[$this->document->setTitle($this->language->get(\'heading_title\'));]]></search>\r\n			<add position=\"after\"><![CDATA[\r\n				$data[\'text_empty\'] = $this->language->get(\'text_empty\');\r\n			]]></add>\r\n		</operation>\r\n	</file>\r\n	\r\n	<file path=\"catalog/controller/product/{category,search}*.php\">\r\n		<operation>\r\n			<search><![CDATA[$data[\'breadcrumbs\'] = array();]]></search>\r\n			<add position=\"before\"><![CDATA[\r\n				$data[\'text_empty\'] = $this->language->get(\'text_empty\');\r\n			]]></add>\r\n		</operation>\r\n	</file>\r\n	\r\n	<file path=\"catalog/controller/product/{compare,manufacturer,special}*.php\">\r\n		<operation>\r\n			<search><![CDATA[$this->document->setTitle($this->language->get(\'heading_title\'));]]></search>\r\n			<add position=\"after\"><![CDATA[\r\n				$data[\'text_empty\'] = $this->language->get(\'text_empty\');\r\n			]]></add>\r\n		</operation>\r\n	</file>\r\n	<file path=\"catalog/controller/account/voucher.php\">\r\n		<operation>\r\n			<search><![CDATA[$this->load->language(\'account/voucher\');]]></search>\r\n			<add position=\"after\"><![CDATA[\r\n				$data[\'text_agree\'] = $this->language->get(\'text_agree\');\r\n			]]></add>\r\n		</operation>\r\n	</file>\r\n	<file path=\"admin/controller/design/layout.php\">\r\n		<operation>\r\n			<search><![CDATA[$this->load->language(\'design/layout\');]]></search>\r\n			<add position=\"after\"><![CDATA[\r\n				$data[\'heading_title\'] = $this->language->get(\'heading_title\');\r\n			]]></add>\r\n		</operation>\r\n		<operation>\r\n			<search><![CDATA[protected function getForm() {]]></search>\r\n			<add position=\"after\"><![CDATA[\r\n				$this->load->language(\'design/layout\');\r\n				$data[\'heading_title\'] = $this->language->get(\'heading_title\');\r\n			]]></add>\r\n		</operation>\r\n		\r\n	</file>\r\n</modification>', 1, '2018-01-10 13:25:40');

-- --------------------------------------------------------

--
-- Table structure for table `oc_module`
--

DROP TABLE IF EXISTS `oc_module`;
CREATE TABLE `oc_module` (
  `module_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `code` varchar(32) NOT NULL,
  `setting` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_module`
--

INSERT INTO `oc_module` (`module_id`, `name`, `code`, `setting`) VALUES
(32, 'Layout Homepage 01', 'oc_page_builder', '{\"name\":\"Layout Homepage 01\",\"status\":\"1\",\"widget\":[{\"class\":\"full-width\",\"main_cols\":[{\"format\":\"12\",\"sub_rows\":[{\"sub_cols\":[{\"info\":{\"module\":[{\"code\":\"newslettersubscribe.39\",\"name\":\"OC Newsletter &gt; Newsletter Popup\",\"url\":\"http:\\/\\/digitech1.com\\/admin\\/index.php?route=extension\\/module\\/newslettersubscribe&amp;user_token=hbJ51vlrkvkgYdFHGLssAcLb8A7hOzea&amp;module_id=39\"},{\"code\":\"ocajaxlogin\",\"name\":\"OC Ajax Login\",\"url\":\"http:\\/\\/bigone1.com\\/admin\\/index.php?route=extension\\/module\\/ocajaxlogin&amp;user_token=x29xJqOCFc6SKjghJYdTogCXXHmXdSTZ\"}]},\"format\":\"12\"}]}]}]},{\"class\":\"\",\"main_cols\":[{\"format\":\"12\",\"sub_rows\":[{\"sub_cols\":[{\"info\":{\"module\":[{\"code\":\"occmsblock.137\",\"name\":\"OC CMS Block &gt; Corporate\",\"url\":\"http:\\/\\/skybook1.com\\/admin\\/index.php?route=extension\\/module\\/occmsblock&amp;user_token=qpmh6u1wF7Y2dJO53M8zmltN6Q3JymL9&amp;module_id=137\"}]},\"format\":\"12\"}]}]}]},{\"class\":\"full-width\",\"main_cols\":[{\"format\":\"12\",\"sub_rows\":[{\"sub_cols\":[{\"info\":{\"module\":[{\"code\":\"ocslideshow.41\",\"name\":\"OC Slide show &gt; Home slideshow 1\",\"url\":\"http:\\/\\/ravado1.com\\/admin\\/index.php?route=extension\\/module\\/ocslideshow&amp;user_token=uMDTOqr509m15LSjCHvmq3602INUa99T&amp;module_id=41\"}]},\"format\":\"12\"}]}]}]},{\"class\":\"\",\"main_cols\":[{\"format\":\"12\",\"sub_rows\":[{\"sub_cols\":[{\"info\":{\"module\":[{\"code\":\"octabproducts.131\",\"name\":\"OC Tab Products &gt; Tabs Categories 1\",\"url\":\"http:\\/\\/skybook1.com\\/admin\\/index.php?route=extension\\/module\\/octabproducts&amp;user_token=qpmh6u1wF7Y2dJO53M8zmltN6Q3JymL9&amp;module_id=131\"},{\"code\":\"occmsblock.181\",\"name\":\"OC CMS Block &gt; Static Top Skybook1\",\"url\":\"http:\\/\\/skybook1.com\\/admin\\/index.php?route=extension\\/module\\/occmsblock&amp;user_token=qpmh6u1wF7Y2dJO53M8zmltN6Q3JymL9&amp;module_id=181\"}]},\"format\":\"12\"}]}]}]},{\"class\":\"bestseller-group\",\"main_cols\":[{\"format\":\"12\",\"sub_rows\":[{\"sub_cols\":[{\"info\":{\"module\":[{\"code\":\"occmsblock.184\",\"name\":\"OC CMS Block &gt; Static Author Best\",\"url\":\"http:\\/\\/skybook1.com\\/admin\\/index.php?route=extension\\/module\\/occmsblock&amp;user_token=bAH8oAjV8oB1IyTgKsyi6LOLQW0y1U7h&amp;module_id=184\"}]},\"format\":\"8\"},{\"info\":{\"module\":[{\"code\":\"ocproduct.185\",\"name\":\"OC Products &gt; Bestseller Products 1\",\"url\":\"http:\\/\\/skybook1.com\\/admin\\/index.php?route=extension\\/module\\/ocproduct&amp;user_token=bAH8oAjV8oB1IyTgKsyi6LOLQW0y1U7h&amp;module_id=185\"}]},\"format\":\"4\"}]}]}]},{\"class\":\"\",\"main_cols\":[{\"format\":\"12\",\"sub_rows\":[{\"sub_cols\":[{\"info\":{\"module\":[{\"code\":\"ocproduct.186\",\"name\":\"OC Products &gt; New products 1\",\"url\":\"http:\\/\\/skybook1.com\\/admin\\/index.php?route=extension\\/module\\/ocproduct&amp;user_token=bAH8oAjV8oB1IyTgKsyi6LOLQW0y1U7h&amp;module_id=186\"}]},\"format\":\"12\"}]}]}]},{\"class\":\"background-full\",\"main_cols\":[{\"format\":\"12\",\"sub_rows\":[{\"sub_cols\":[{\"info\":{\"module\":[{\"code\":\"occmsblock.182\",\"name\":\"OC CMS Block &gt; Static Middle Skybook1\",\"url\":\"http:\\/\\/skybook1.com\\/admin\\/index.php?route=extension\\/module\\/occmsblock&amp;user_token=bAH8oAjV8oB1IyTgKsyi6LOLQW0y1U7h&amp;module_id=182\"}]},\"format\":\"12\"}]}]}]},{\"class\":\"\",\"main_cols\":[{\"format\":\"12\",\"sub_rows\":[{\"sub_cols\":[{\"info\":{\"module\":[{\"code\":\"ocproduct.187\",\"name\":\"OC Products &gt; Mostview Products 1\",\"url\":\"http:\\/\\/skybook1.com\\/admin\\/index.php?route=extension\\/module\\/ocproduct&amp;user_token=bAH8oAjV8oB1IyTgKsyi6LOLQW0y1U7h&amp;module_id=187\"}]},\"format\":\"3\"},{\"info\":{\"module\":[{\"code\":\"ocproduct.188\",\"name\":\"OC Products &gt; Featured products 1\",\"url\":\"http:\\/\\/skybook1.com\\/admin\\/index.php?route=extension\\/module\\/ocproduct&amp;user_token=bAH8oAjV8oB1IyTgKsyi6LOLQW0y1U7h&amp;module_id=188\"}]},\"format\":\"3\"},{\"info\":{\"module\":[{\"code\":\"ocproduct.189\",\"name\":\"OC Products &gt; Special Products 1\",\"url\":\"http:\\/\\/skybook1.com\\/admin\\/index.php?route=extension\\/module\\/ocproduct&amp;user_token=bAH8oAjV8oB1IyTgKsyi6LOLQW0y1U7h&amp;module_id=189\"}]},\"format\":\"3\"},{\"info\":{\"module\":[{\"code\":\"newslettersubscribe.40\",\"name\":\"OC Newsletter &gt; Newsletter\",\"url\":\"http:\\/\\/skybook1.com\\/admin\\/index.php?route=extension\\/module\\/newslettersubscribe&amp;user_token=bAH8oAjV8oB1IyTgKsyi6LOLQW0y1U7h&amp;module_id=40\"}]},\"format\":\"3\"}]}]}]},{\"class\":\"testimor-full\",\"main_cols\":[{\"format\":\"12\",\"sub_rows\":[{\"sub_cols\":[{\"info\":{\"module\":[{\"code\":\"octestimonial.123\",\"name\":\"OC Testimonials &gt; Testimonials\",\"url\":\"http:\\/\\/skybook1.com\\/admin\\/index.php?route=extension\\/module\\/octestimonial&amp;user_token=bAH8oAjV8oB1IyTgKsyi6LOLQW0y1U7h&amp;module_id=123\"}]},\"format\":\"12\"}]}]}]},{\"class\":\"\",\"main_cols\":[{\"format\":\"12\",\"sub_rows\":[{\"sub_cols\":[{\"info\":{\"module\":[{\"code\":\"ocblog.130\",\"name\":\"OC Blog &gt; Blog\",\"url\":\"http:\\/\\/skybook1.com\\/admin\\/index.php?route=extension\\/module\\/ocblog&amp;user_token=bAH8oAjV8oB1IyTgKsyi6LOLQW0y1U7h&amp;module_id=130\"}]},\"format\":\"12\"}]}]}]},{\"class\":\"social-full\",\"main_cols\":[{\"format\":\"12\",\"sub_rows\":[{\"sub_cols\":[{\"info\":{\"module\":[{\"code\":\"octwitter\",\"name\":\"OC Twitter\",\"url\":\"http:\\/\\/skybook1.com\\/admin\\/index.php?route=extension\\/module\\/octwitter&amp;user_token=eEyzZQvqVBkRHRPN9uTq9UabhhD6V66x\"}]},\"format\":\"6\"},{\"info\":{\"module\":[{\"code\":\"occmsblock.140\",\"name\":\"OC CMS Block &gt; Social\",\"url\":\"http:\\/\\/skybook1.com\\/admin\\/index.php?route=extension\\/module\\/occmsblock&amp;user_token=bAH8oAjV8oB1IyTgKsyi6LOLQW0y1U7h&amp;module_id=140\"}]},\"format\":\"6\"}]}]}]}]}'),
(181, 'Static Top Koparion1', 'occmsblock', '{\"name\":\"Static Top Koparion1\",\"cmsblock_id\":\"105\",\"status\":\"1\"}'),
(182, 'Static Middle Koparion1', 'occmsblock', '{\"name\":\"Static Middle Koparion1\",\"cmsblock_id\":\"106\",\"status\":\"1\"}'),
(207, 'Blog 4', 'ocblog', '{\"name\":\"Blog 4\",\"status\":\"1\",\"list\":\"1\",\"width\":\"370\",\"height\":\"218\",\"auto\":\"0\",\"items\":\"1\",\"speed\":\"1000\",\"rows\":\"1\",\"navigation\":\"0\",\"pagination\":\"0\"}'),
(208, 'Horizontal Mega Menu 4', 'ochozmegamenu', '{\"name\":\"Horizontal Mega Menu 4\",\"status\":\"1\",\"hhome\":\"1\",\"sticky\":\"1\",\"hdepth\":\"4\",\"hlevel\":\"4\",\"hactive\":\"CMS3,CMS4,LINK79,LINK78,LINK108\",\"mobile\":\"0\"}'),
(209, 'Home slideshow 5', 'ocslideshow', '{\"name\":\"Home slideshow 5\",\"status\":\"1\",\"banner\":\"22\",\"width\":\"1920\",\"height\":\"599\"}'),
(210, 'Layout Homepage 05', 'oc_page_builder', '{\"name\":\"Layout Homepage 05\",\"status\":\"1\",\"widget\":[{\"class\":\"full-width\",\"main_cols\":[{\"format\":\"12\",\"sub_rows\":[{\"sub_cols\":[{\"info\":{\"module\":[{\"code\":\"ocajaxlogin\",\"name\":\"OC Ajax Login\",\"url\":\"http:\\/\\/skybook1.com\\/admin\\/index.php?route=extension\\/module\\/ocajaxlogin&amp;user_token=jUhPYTLGJKGN9QwRa7Wt8KbSmhqxyOwf\"},{\"code\":\"newslettersubscribe.39\",\"name\":\"OC Newsletter &gt; Newsletter Popup\",\"url\":\"http:\\/\\/skybook1.com\\/admin\\/index.php?route=extension\\/module\\/newslettersubscribe&amp;user_token=jUhPYTLGJKGN9QwRa7Wt8KbSmhqxyOwf&amp;module_id=39\"},{\"code\":\"ocslideshow.209\",\"name\":\"OC Slide show &gt; Home slideshow 5\",\"url\":\"http:\\/\\/skybook1.com\\/admin\\/index.php?route=extension\\/module\\/ocslideshow&amp;user_token=jUhPYTLGJKGN9QwRa7Wt8KbSmhqxyOwf&amp;module_id=209\"}]},\"format\":\"12\"}]}]}]},{\"class\":\"\",\"main_cols\":[{\"format\":\"12\",\"sub_rows\":[{\"sub_cols\":[{\"info\":{\"module\":[{\"code\":\"ocproduct.196\",\"name\":\"OC Products &gt; Price Countdown 2\",\"url\":\"http:\\/\\/skybook1.com\\/admin\\/index.php?route=extension\\/module\\/ocproduct&amp;user_token=DHNvIbiYzjYKf7ZjfVUqJksNShntIapm&amp;module_id=196\"},{\"code\":\"octabproducts.198\",\"name\":\"OC Tab Products &gt; Tabs Categories 2\",\"url\":\"http:\\/\\/skybook1.com\\/admin\\/index.php?route=extension\\/module\\/octabproducts&amp;user_token=jUhPYTLGJKGN9QwRa7Wt8KbSmhqxyOwf&amp;module_id=198\"},{\"code\":\"occmsblock.181\",\"name\":\"OC CMS Block &gt; Static Top Skybook1\",\"url\":\"http:\\/\\/skybook1.com\\/admin\\/index.php?route=extension\\/module\\/occmsblock&amp;user_token=jUhPYTLGJKGN9QwRa7Wt8KbSmhqxyOwf&amp;module_id=181\"},{\"code\":\"occmsblock.182\",\"name\":\"OC CMS Block &gt; Static Middle Skybook1\",\"url\":\"http:\\/\\/skybook1.com\\/admin\\/index.php?route=extension\\/module\\/occmsblock&amp;user_token=jUhPYTLGJKGN9QwRa7Wt8KbSmhqxyOwf&amp;module_id=182\"}]},\"format\":\"12\"}]}]}]},{\"class\":\"\",\"main_cols\":[{\"format\":\"12\",\"sub_rows\":[{\"sub_cols\":[{\"info\":{\"module\":[{\"code\":\"ocproduct.187\",\"name\":\"OC Products &gt; Mostview Products 1\",\"url\":\"http:\\/\\/skybook1.com\\/admin\\/index.php?route=extension\\/module\\/ocproduct&amp;user_token=jUhPYTLGJKGN9QwRa7Wt8KbSmhqxyOwf&amp;module_id=187\"}]},\"format\":\"3\"},{\"info\":{\"module\":[{\"code\":\"ocproduct.188\",\"name\":\"OC Products &gt; Featured products 1\",\"url\":\"http:\\/\\/skybook1.com\\/admin\\/index.php?route=extension\\/module\\/ocproduct&amp;user_token=jUhPYTLGJKGN9QwRa7Wt8KbSmhqxyOwf&amp;module_id=188\"}]},\"format\":\"3\"},{\"info\":{\"module\":[{\"code\":\"ocproduct.189\",\"name\":\"OC Products &gt; Special Products 1\",\"url\":\"http:\\/\\/skybook1.com\\/admin\\/index.php?route=extension\\/module\\/ocproduct&amp;user_token=jUhPYTLGJKGN9QwRa7Wt8KbSmhqxyOwf&amp;module_id=189\"}]},\"format\":\"3\"},{\"info\":{\"module\":[{\"code\":\"newslettersubscribe.40\",\"name\":\"OC Newsletter &gt; Newsletter\",\"url\":\"http:\\/\\/skybook1.com\\/admin\\/index.php?route=extension\\/module\\/newslettersubscribe&amp;user_token=jUhPYTLGJKGN9QwRa7Wt8KbSmhqxyOwf&amp;module_id=40\"}]},\"format\":\"3\"}]}]}]},{\"class\":\"testimor-full\",\"main_cols\":[{\"format\":\"12\",\"sub_rows\":[{\"sub_cols\":[{\"info\":{\"module\":[{\"code\":\"octestimonial.123\",\"name\":\"OC Testimonials &gt; Testimonials\",\"url\":\"http:\\/\\/skybook1.com\\/admin\\/index.php?route=extension\\/module\\/octestimonial&amp;user_token=jUhPYTLGJKGN9QwRa7Wt8KbSmhqxyOwf&amp;module_id=123\"}]},\"format\":\"12\"}]}]}]},{\"class\":\"\",\"main_cols\":[{\"format\":\"12\",\"sub_rows\":[{\"sub_cols\":[{\"info\":{\"module\":[{\"code\":\"ocblog.130\",\"name\":\"OC Blog &gt; Blog\",\"url\":\"http:\\/\\/skybook1.com\\/admin\\/index.php?route=extension\\/module\\/ocblog&amp;user_token=jUhPYTLGJKGN9QwRa7Wt8KbSmhqxyOwf&amp;module_id=130\"},{\"code\":\"occmsblock.137\",\"name\":\"OC CMS Block &gt; Corporate\",\"url\":\"http:\\/\\/skybook1.com\\/admin\\/index.php?route=extension\\/module\\/occmsblock&amp;user_token=jUhPYTLGJKGN9QwRa7Wt8KbSmhqxyOwf&amp;module_id=137\"}]},\"format\":\"12\"}]}]}]},{\"class\":\"social-full\",\"main_cols\":[{\"format\":\"12\",\"sub_rows\":[{\"sub_cols\":[{\"info\":{\"module\":[{\"code\":\"octwitter\",\"name\":\"OC Twitter\",\"url\":\"http:\\/\\/skybook1.com\\/admin\\/index.php?route=extension\\/module\\/octwitter&amp;user_token=jUhPYTLGJKGN9QwRa7Wt8KbSmhqxyOwf\"}]},\"format\":\"6\"},{\"info\":{\"module\":[{\"code\":\"occmsblock.140\",\"name\":\"OC CMS Block &gt; Social\",\"url\":\"http:\\/\\/skybook1.com\\/admin\\/index.php?route=extension\\/module\\/occmsblock&amp;user_token=jUhPYTLGJKGN9QwRa7Wt8KbSmhqxyOwf&amp;module_id=140\"}]},\"format\":\"6\"}]}]}]}]}'),
(137, 'Corporate', 'occmsblock', '{\"name\":\"Corporate\",\"cmsblock_id\":\"80\",\"status\":\"1\"}'),
(138, 'Footer Static', 'occmsblock', '{\"name\":\"Footer Static\",\"cmsblock_id\":\"81\",\"status\":\"1\"}'),
(140, 'Social', 'occmsblock', '{\"name\":\"Social\",\"cmsblock_id\":\"83\",\"status\":\"1\"}'),
(123, 'Testimonials', 'octestimonial', '{\"name\":\"Testimonials\",\"status\":\"1\",\"width\":\"130\",\"height\":\"130\",\"auto\":\"1\",\"items\":\"1\",\"limit\":\"10\",\"speed\":\"1000\",\"rows\":\"1\",\"navigation\":\"1\",\"pagination\":\"0\"}'),
(39, 'Newsletter Popup', 'newslettersubscribe', '{\"name\":\"Newsletter Popup\",\"popup\":\"1\",\"status\":\"1\",\"newslettersubscribe_unsubscribe\":\"1\",\"newslettersubscribe_mail_status\":\"1\",\"newslettersubscribe_thickbox\":\"1\",\"newslettersubscribe_registered\":\"1\",\"store_id\":\"0\",\"to\":\"sendall\",\"customer_group_id\":\"1\",\"customers\":\"\",\"affiliates\":\"\",\"products\":\"\",\"subject\":\"\",\"message\":\"\"}'),
(40, 'Newsletter', 'newslettersubscribe', '{\"name\":\"Newsletter\",\"popup\":\"0\",\"status\":\"1\",\"newslettersubscribe_unsubscribe\":\"1\",\"newslettersubscribe_mail_status\":\"1\",\"newslettersubscribe_thickbox\":\"1\",\"newslettersubscribe_registered\":\"1\",\"store_id\":\"0\",\"to\":\"sendall\",\"customer_group_id\":\"1\",\"customers\":\"\",\"affiliates\":\"\",\"products\":\"\",\"subject\":\"\",\"message\":\"\"}'),
(41, 'Home slideshow 1', 'ocslideshow', '{\"name\":\"Home slideshow 1\",\"status\":\"1\",\"banner\":\"18\",\"width\":\"1920\",\"height\":\"599\"}'),
(43, 'Horizontal Mega Menu', 'ochozmegamenu', '{\"name\":\"Horizontal Mega Menu\",\"status\":\"1\",\"hhome\":\"1\",\"sticky\":\"1\",\"hdepth\":\"4\",\"hlevel\":\"3\",\"hactive\":\"CAT239,CAT228,CAT191,CAT207,CAT315,LINK108\",\"mobile\":\"0\"}'),
(124, 'Featured Category 4', 'ocfeaturedcategory', '{\"name\":\"Featured Category 4\",\"status\":\"1\",\"slider\":\"1\",\"width\":\"151\",\"height\":\"134\",\"limit\":\"10\",\"item\":\"6\",\"speed\":\"1000\",\"autoplay\":\"0\",\"rows\":\"1\",\"shownextback\":\"1\",\"shownav\":\"0\",\"showdes\":\"0\",\"showsub\":\"0\",\"showsubnumber\":\"4\"}'),
(48, 'Layout Homepage 02', 'oc_page_builder', '{\"name\":\"Layout Homepage 02\",\"status\":\"1\",\"widget\":[{\"class\":\"full-width\",\"main_cols\":[{\"format\":\"12\",\"sub_rows\":[{\"sub_cols\":[{\"info\":{\"module\":[{\"code\":\"ocajaxlogin\",\"name\":\"OC Ajax Login\",\"url\":\"http:\\/\\/tt_mimosa.com\\/admin\\/index.php?route=extension\\/module\\/ocajaxlogin&amp;user_token=JTpdZxghacDqM3vT9ZusZ55msurHFXmp\"},{\"code\":\"newslettersubscribe.39\",\"name\":\"OC Newsletter &gt; Newsletter Popup\",\"url\":\"http:\\/\\/tt_mimosa.com\\/admin\\/index.php?route=extension\\/module\\/newslettersubscribe&amp;user_token=JTpdZxghacDqM3vT9ZusZ55msurHFXmp&amp;module_id=39\"}]},\"format\":\"12\"}]}]}]},{\"class\":\"slider-group\",\"main_cols\":[{\"format\":\"12\",\"sub_rows\":[{\"sub_cols\":[{\"info\":{\"module\":[{\"code\":\"ocslideshow.49\",\"name\":\"OC Slide show &gt; Home slideshow 2\",\"url\":\"http:\\/\\/skybook1.com\\/admin\\/index.php?route=extension\\/module\\/ocslideshow&amp;user_token=DHNvIbiYzjYKf7ZjfVUqJksNShntIapm&amp;module_id=49\"}]},\"format\":\"12\"}]}]}]},{\"class\":\"\",\"main_cols\":[{\"format\":\"12\",\"sub_rows\":[{\"sub_cols\":[{\"info\":{\"module\":[{\"code\":\"ocproduct.195\",\"name\":\"OC Products &gt; New products 2\",\"url\":\"http:\\/\\/skybook1.com\\/admin\\/index.php?route=extension\\/module\\/ocproduct&amp;user_token=rRnqW7RZpnA2Pfz4H8GNuNhtA7BfMDab&amp;module_id=195\"},{\"code\":\"occmsblock.181\",\"name\":\"OC CMS Block &gt; Static Top Skybook1\",\"url\":\"http:\\/\\/skybook1.com\\/admin\\/index.php?route=extension\\/module\\/occmsblock&amp;user_token=rRnqW7RZpnA2Pfz4H8GNuNhtA7BfMDab&amp;module_id=181\"},{\"code\":\"ocproduct.196\",\"name\":\"OC Products &gt; Price Countdown 2\",\"url\":\"http:\\/\\/skybook1.com\\/admin\\/index.php?route=extension\\/module\\/ocproduct&amp;user_token=rRnqW7RZpnA2Pfz4H8GNuNhtA7BfMDab&amp;module_id=196\"},{\"code\":\"octabproducts.131\",\"name\":\"OC Tab Products &gt; Tabs Categories 1\",\"url\":\"http:\\/\\/skybook1.com\\/admin\\/index.php?route=extension\\/module\\/octabproducts&amp;user_token=rRnqW7RZpnA2Pfz4H8GNuNhtA7BfMDab&amp;module_id=131\"}]},\"format\":\"12\"}]}]}]},{\"class\":\"module-group\",\"main_cols\":[{\"format\":\"12\",\"sub_rows\":[{\"sub_cols\":[{\"info\":{\"module\":[{\"code\":\"ocproduct.187\",\"name\":\"OC Products &gt; Mostview Products 1\",\"url\":\"http:\\/\\/skybook1.com\\/admin\\/index.php?route=extension\\/module\\/ocproduct&amp;user_token=rRnqW7RZpnA2Pfz4H8GNuNhtA7BfMDab&amp;module_id=187\"}]},\"format\":\"3\"},{\"info\":{\"module\":[{\"code\":\"ocproduct.188\",\"name\":\"OC Products &gt; Featured products 1\",\"url\":\"http:\\/\\/skybook1.com\\/admin\\/index.php?route=extension\\/module\\/ocproduct&amp;user_token=rRnqW7RZpnA2Pfz4H8GNuNhtA7BfMDab&amp;module_id=188\"}]},\"format\":\"3\"},{\"info\":{\"module\":[{\"code\":\"ocproduct.189\",\"name\":\"OC Products &gt; Special Products 1\",\"url\":\"http:\\/\\/skybook1.com\\/admin\\/index.php?route=extension\\/module\\/ocproduct&amp;user_token=rRnqW7RZpnA2Pfz4H8GNuNhtA7BfMDab&amp;module_id=189\"}]},\"format\":\"3\"},{\"info\":{\"module\":[{\"code\":\"newslettersubscribe.40\",\"name\":\"OC Newsletter &gt; Newsletter\",\"url\":\"http:\\/\\/skybook1.com\\/admin\\/index.php?route=extension\\/module\\/newslettersubscribe&amp;user_token=rRnqW7RZpnA2Pfz4H8GNuNhtA7BfMDab&amp;module_id=40\"}]},\"format\":\"3\"}]}]}]},{\"class\":\"\",\"main_cols\":[{\"format\":\"12\",\"sub_rows\":[{\"sub_cols\":[{\"info\":{\"module\":[{\"code\":\"ocblog.130\",\"name\":\"OC Blog &gt; Blog\",\"url\":\"http:\\/\\/skybook1.com\\/admin\\/index.php?route=extension\\/module\\/ocblog&amp;user_token=rRnqW7RZpnA2Pfz4H8GNuNhtA7BfMDab&amp;module_id=130\"},{\"code\":\"occmsblock.137\",\"name\":\"OC CMS Block &gt; Corporate\",\"url\":\"http:\\/\\/skybook1.com\\/admin\\/index.php?route=extension\\/module\\/occmsblock&amp;user_token=rRnqW7RZpnA2Pfz4H8GNuNhtA7BfMDab&amp;module_id=137\"}]},\"format\":\"12\"}]}]}]},{\"class\":\"social-full\",\"main_cols\":[{\"format\":\"12\",\"sub_rows\":[{\"sub_cols\":[{\"info\":{\"module\":[{\"code\":\"octwitter\",\"name\":\"OC Twitter\",\"url\":\"http:\\/\\/skybook1.com\\/admin\\/index.php?route=extension\\/module\\/octwitter&amp;user_token=eEyzZQvqVBkRHRPN9uTq9UabhhD6V66x\"}]},\"format\":\"6\"},{\"info\":{\"module\":[{\"code\":\"occmsblock.140\",\"name\":\"OC CMS Block &gt; Social\",\"url\":\"http:\\/\\/skybook1.com\\/admin\\/index.php?route=extension\\/module\\/occmsblock&amp;user_token=rRnqW7RZpnA2Pfz4H8GNuNhtA7BfMDab&amp;module_id=140\"}]},\"format\":\"6\"}]}]}]}]}'),
(189, 'Special Products 1', 'ocproduct', '{\"name\":\"Special Products 1\",\"status\":\"1\",\"option\":\"2\",\"product\":\"\",\"cate_name\":\"\",\"cate_id\":\"\",\"productfrom\":\"0\",\"productcate\":\"\",\"input_specific_product\":\"0\",\"autoproduct\":\"1\",\"title_lang\":{\"en-gb\":{\"title\":\"On sale\"},\"de-de\":{\"title\":\"On sale\"}},\"class\":\"list-module\",\"module_description\":{\"1\":{\"description\":\"\"},\"9\":{\"description\":\"\"}},\"type\":\"1\",\"slider\":\"1\",\"items\":\"1\",\"auto\":\"0\",\"time\":\"1000\",\"speed\":\"1000\",\"row\":\"3\",\"loop\":\"0\",\"margin\":\"0\",\"navigation\":\"0\",\"pagination\":\"0\",\"desktop\":\"1\",\"tablet\":\"1\",\"mobile\":\"2\",\"smobile\":\"2\",\"nrow\":\"1\",\"showcart\":\"0\",\"showwishlist\":\"0\",\"showcompare\":\"0\",\"showquickview\":\"0\",\"description\":\"0\",\"countdown\":\"0\",\"rotator\":\"0\",\"newlabel\":\"0\",\"salelabel\":\"0\",\"limit\":\"6\",\"width\":\"600\",\"height\":\"770\"}'),
(190, 'Links Footer', 'occmsblock', '{\"name\":\"Links Footer\",\"cmsblock_id\":\"111\",\"status\":\"1\"}'),
(49, 'Home slideshow 2', 'ocslideshow', '{\"name\":\"Home slideshow 2\",\"status\":\"1\",\"banner\":\"19\",\"width\":\"1170\",\"height\":\"520\"}'),
(53, 'Layout Homepage 03', 'oc_page_builder', '{\"name\":\"Layout Homepage 03\",\"status\":\"1\",\"widget\":[{\"class\":\"full-width\",\"main_cols\":[{\"format\":\"12\",\"sub_rows\":[{\"sub_cols\":[{\"info\":{\"module\":[{\"code\":\"newslettersubscribe.39\",\"name\":\"OC Newsletter &gt; Newsletter Popup\",\"url\":\"http:\\/\\/tt_mimosa.com\\/admin\\/index.php?route=extension\\/module\\/newslettersubscribe&amp;user_token=d01XJrsDs0kRU4rN0MQ3LdjJUxHkQcS4&amp;module_id=39\"},{\"code\":\"ocajaxlogin\",\"name\":\"OC Ajax Login\",\"url\":\"http:\\/\\/ravado1.com\\/admin\\/index.php?route=extension\\/module\\/ocajaxlogin&amp;user_token=WpLwnQiGjm50YgzZxQVbbdhp4zpzI14I\"},{\"code\":\"ocslideshow.55\",\"name\":\"OC Slide show &gt; Home slideshow 3\",\"url\":\"http:\\/\\/ravado1.com\\/admin\\/index.php?route=extension\\/module\\/ocslideshow&amp;user_token=WpLwnQiGjm50YgzZxQVbbdhp4zpzI14I&amp;module_id=55\"}]},\"format\":\"12\"}]}]}]},{\"class\":\"\",\"main_cols\":[{\"format\":\"12\",\"sub_rows\":[{\"sub_cols\":[{\"info\":{\"module\":[{\"code\":\"occmsblock.199\",\"name\":\"OC CMS Block &gt; Static Top Skybook3\",\"url\":\"http:\\/\\/skybook1.com\\/admin\\/index.php?route=extension\\/module\\/occmsblock&amp;user_token=gGbddFJLDIsOATwBCVUkJulDoSIRUepO&amp;module_id=199\"},{\"code\":\"octabproducts.198\",\"name\":\"OC Tab Products &gt; Tabs Categories 2\",\"url\":\"http:\\/\\/skybook1.com\\/admin\\/index.php?route=extension\\/module\\/octabproducts&amp;user_token=gGbddFJLDIsOATwBCVUkJulDoSIRUepO&amp;module_id=198\"},{\"code\":\"occmsblock.181\",\"name\":\"OC CMS Block &gt; Static Top Skybook1\",\"url\":\"http:\\/\\/skybook1.com\\/admin\\/index.php?route=extension\\/module\\/occmsblock&amp;user_token=gGbddFJLDIsOATwBCVUkJulDoSIRUepO&amp;module_id=181\"}]},\"format\":\"12\"}]}]}]},{\"class\":\"module-group\",\"main_cols\":[{\"format\":\"12\",\"sub_rows\":[{\"sub_cols\":[{\"info\":{\"module\":[{\"code\":\"ocproduct.187\",\"name\":\"OC Products &gt; Mostview Products 1\",\"url\":\"http:\\/\\/skybook1.com\\/admin\\/index.php?route=extension\\/module\\/ocproduct&amp;user_token=gGbddFJLDIsOATwBCVUkJulDoSIRUepO&amp;module_id=187\"}]},\"format\":\"3\"},{\"info\":{\"module\":[{\"code\":\"ocproduct.188\",\"name\":\"OC Products &gt; Featured products 1\",\"url\":\"http:\\/\\/skybook1.com\\/admin\\/index.php?route=extension\\/module\\/ocproduct&amp;user_token=gGbddFJLDIsOATwBCVUkJulDoSIRUepO&amp;module_id=188\"}]},\"format\":\"3\"},{\"info\":{\"module\":[{\"code\":\"ocproduct.189\",\"name\":\"OC Products &gt; Special Products 1\",\"url\":\"http:\\/\\/skybook1.com\\/admin\\/index.php?route=extension\\/module\\/ocproduct&amp;user_token=gGbddFJLDIsOATwBCVUkJulDoSIRUepO&amp;module_id=189\"}]},\"format\":\"3\"},{\"info\":{\"module\":[{\"code\":\"newslettersubscribe.40\",\"name\":\"OC Newsletter &gt; Newsletter\",\"url\":\"http:\\/\\/skybook1.com\\/admin\\/index.php?route=extension\\/module\\/newslettersubscribe&amp;user_token=gGbddFJLDIsOATwBCVUkJulDoSIRUepO&amp;module_id=40\"}]},\"format\":\"3\"}]}]}]},{\"class\":\"\",\"main_cols\":[{\"format\":\"12\",\"sub_rows\":[{\"sub_cols\":[{\"info\":{\"module\":[{\"code\":\"ocblog.130\",\"name\":\"OC Blog &gt; Blog\",\"url\":\"http:\\/\\/skybook1.com\\/admin\\/index.php?route=extension\\/module\\/ocblog&amp;user_token=gGbddFJLDIsOATwBCVUkJulDoSIRUepO&amp;module_id=130\"},{\"code\":\"occmsblock.137\",\"name\":\"OC CMS Block &gt; Corporate\",\"url\":\"http:\\/\\/skybook1.com\\/admin\\/index.php?route=extension\\/module\\/occmsblock&amp;user_token=gGbddFJLDIsOATwBCVUkJulDoSIRUepO&amp;module_id=137\"}]},\"format\":\"12\"}]}]}]},{\"class\":\"social-full\",\"main_cols\":[{\"format\":\"12\",\"sub_rows\":[{\"sub_cols\":[{\"info\":{\"module\":[{\"code\":\"octwitter\",\"name\":\"OC Twitter\",\"url\":\"http:\\/\\/skybook1.com\\/admin\\/index.php?route=extension\\/module\\/octwitter&amp;user_token=eEyzZQvqVBkRHRPN9uTq9UabhhD6V66x\"}]},\"format\":\"6\"},{\"info\":{\"module\":[{\"code\":\"occmsblock.140\",\"name\":\"OC CMS Block &gt; Social\",\"url\":\"http:\\/\\/skybook1.com\\/admin\\/index.php?route=extension\\/module\\/occmsblock&amp;user_token=gGbddFJLDIsOATwBCVUkJulDoSIRUepO&amp;module_id=140\"}]},\"format\":\"6\"}]}]}]}]}'),
(203, 'New products 4', 'ocproduct', '{\"name\":\"New products 4\",\"status\":\"1\",\"option\":\"2\",\"product\":\"\",\"cate_name\":\"\",\"cate_id\":\"\",\"productfrom\":\"0\",\"productcate\":\"\",\"input_specific_product\":\"0\",\"autoproduct\":\"0\",\"title_lang\":{\"en-gb\":{\"title\":\"New books\"},\"de-de\":{\"title\":\"New books\"}},\"class\":\"\",\"module_description\":{\"1\":{\"description\":\"\"},\"9\":{\"description\":\"\"}},\"type\":\"0\",\"slider\":\"1\",\"items\":\"4\",\"auto\":\"0\",\"time\":\"1000\",\"speed\":\"1000\",\"row\":\"2\",\"loop\":\"0\",\"margin\":\"0\",\"navigation\":\"0\",\"pagination\":\"0\",\"desktop\":\"4\",\"tablet\":\"3\",\"mobile\":\"3\",\"smobile\":\"2\",\"nrow\":\"1\",\"showcart\":\"1\",\"showwishlist\":\"1\",\"showcompare\":\"1\",\"showquickview\":\"1\",\"description\":\"0\",\"countdown\":\"0\",\"rotator\":\"1\",\"newlabel\":\"1\",\"salelabel\":\"1\",\"limit\":\"12\",\"width\":\"600\",\"height\":\"770\"}'),
(55, 'Home slideshow 3', 'ocslideshow', '{\"name\":\"Home slideshow 3\",\"status\":\"1\",\"banner\":\"20\",\"width\":\"1452\",\"height\":\"599\"}'),
(56, 'Home slideshow 4', 'ocslideshow', '{\"name\":\"Home slideshow 4\",\"status\":\"1\",\"banner\":\"21\",\"width\":\"870\",\"height\":\"490\"}'),
(58, 'Layout Homepage 04', 'oc_page_builder', '{\"name\":\"Layout Homepage 04\",\"status\":\"1\",\"widget\":[{\"class\":\"full-width\",\"main_cols\":[{\"format\":\"12\",\"sub_rows\":[{\"sub_cols\":[{\"info\":{\"module\":[{\"code\":\"newslettersubscribe.39\",\"name\":\"OC Newsletter &gt; Newsletter Popup\",\"url\":\"http:\\/\\/tt_mimosa.com\\/admin\\/index.php?route=extension\\/module\\/newslettersubscribe&amp;user_token=B8NA7TZvGegvK5ov6i4gI7nxLfxuUO0Z&amp;module_id=39\"},{\"code\":\"ocajaxlogin\",\"name\":\"OC Ajax Login\",\"url\":\"http:\\/\\/digitech1.com\\/admin\\/index.php?route=extension\\/module\\/ocajaxlogin&amp;user_token=k84D9mLqaXYTbuMERonztseKRNlLy4Xw\"}]},\"format\":\"12\"}]}]}]},{\"class\":\"slider-group\",\"main_cols\":[{\"format\":\"12\",\"sub_rows\":[{\"sub_cols\":[{\"info\":{\"module\":[{\"code\":\"ocslideshow.56\",\"name\":\"OC Slide show &gt; Home slideshow 4\",\"url\":\"http:\\/\\/skybook1.com\\/admin\\/index.php?route=extension\\/module\\/ocslideshow&amp;user_token=H1J2T1PoAVvVeFX2HRqENDUHAA1qJLkW&amp;module_id=56\"}]},\"format\":\"9\"},{\"info\":{\"module\":[{\"code\":\"occmsblock.200\",\"name\":\"OC CMS Block &gt; Static Slider Skybook4\",\"url\":\"http:\\/\\/skybook1.com\\/admin\\/index.php?route=extension\\/module\\/occmsblock&amp;user_token=H1J2T1PoAVvVeFX2HRqENDUHAA1qJLkW&amp;module_id=200\"},{\"code\":\"occmsblock.201\",\"name\":\"OC CMS Block &gt; Corporate 4\",\"url\":\"http:\\/\\/skybook1.com\\/admin\\/index.php?route=extension\\/module\\/occmsblock&amp;user_token=H1J2T1PoAVvVeFX2HRqENDUHAA1qJLkW&amp;module_id=201\"}]},\"format\":\"3\"}]}]}]},{\"class\":\"\",\"main_cols\":[{\"format\":\"12\",\"sub_rows\":[{\"sub_cols\":[{\"info\":{\"module\":[{\"code\":\"ocvermegamenu.194\",\"name\":\"OC Vertical Megamenu &gt; Vertical Megamenu 2\",\"url\":\"http:\\/\\/skybook1.com\\/admin\\/index.php?route=extension\\/module\\/ocvermegamenu&amp;user_token=H1J2T1PoAVvVeFX2HRqENDUHAA1qJLkW&amp;module_id=194\"},{\"code\":\"occmsblock.192\",\"name\":\"OC CMS Block &gt; Static SideBar\",\"url\":\"http:\\/\\/skybook1.com\\/admin\\/index.php?route=extension\\/module\\/occmsblock&amp;user_token=eEyzZQvqVBkRHRPN9uTq9UabhhD6V66x&amp;module_id=192\"},{\"code\":\"ocproduct.206\",\"name\":\"OC Products &gt; Bestseller Products 4\",\"url\":\"http:\\/\\/skybook1.com\\/admin\\/index.php?route=extension\\/module\\/ocproduct&amp;user_token=eEyzZQvqVBkRHRPN9uTq9UabhhD6V66x&amp;module_id=206\"},{\"code\":\"ocblog.207\",\"name\":\"OC Blog &gt; Blog 4\",\"url\":\"http:\\/\\/skybook1.com\\/admin\\/index.php?route=extension\\/module\\/ocblog&amp;user_token=eEyzZQvqVBkRHRPN9uTq9UabhhD6V66x&amp;module_id=207\"},{\"code\":\"newslettersubscribe.40\",\"name\":\"OC Newsletter &gt; Newsletter\",\"url\":\"http:\\/\\/skybook1.com\\/admin\\/index.php?route=extension\\/module\\/newslettersubscribe&amp;user_token=eEyzZQvqVBkRHRPN9uTq9UabhhD6V66x&amp;module_id=40\"}]},\"format\":\"3\"},{\"info\":{\"module\":[{\"code\":\"occmsblock.202\",\"name\":\"OC CMS Block &gt; Static Top Skybook4\",\"url\":\"http:\\/\\/skybook1.com\\/admin\\/index.php?route=extension\\/module\\/occmsblock&amp;user_token=H1J2T1PoAVvVeFX2HRqENDUHAA1qJLkW&amp;module_id=202\"},{\"code\":\"ocproduct.203\",\"name\":\"OC Products &gt; New products 4\",\"url\":\"http:\\/\\/skybook1.com\\/admin\\/index.php?route=extension\\/module\\/ocproduct&amp;user_token=eEyzZQvqVBkRHRPN9uTq9UabhhD6V66x&amp;module_id=203\"},{\"code\":\"ocproduct.204\",\"name\":\"OC Products &gt; Price Countdown 4\",\"url\":\"http:\\/\\/skybook1.com\\/admin\\/index.php?route=extension\\/module\\/ocproduct&amp;user_token=eEyzZQvqVBkRHRPN9uTq9UabhhD6V66x&amp;module_id=204\"},{\"code\":\"octabproducts.205\",\"name\":\"OC Tab Products &gt; Product Tabs Slider 4\",\"url\":\"http:\\/\\/skybook1.com\\/admin\\/index.php?route=extension\\/module\\/octabproducts&amp;user_token=eEyzZQvqVBkRHRPN9uTq9UabhhD6V66x&amp;module_id=205\"}]},\"format\":\"9\"}]}]}]},{\"class\":\"\",\"main_cols\":[{\"format\":\"12\",\"sub_rows\":[{\"sub_cols\":[{\"info\":{\"module\":[{\"code\":\"occmsblock.181\",\"name\":\"OC CMS Block &gt; Static Top Skybook1\",\"url\":\"http:\\/\\/skybook1.com\\/admin\\/index.php?route=extension\\/module\\/occmsblock&amp;user_token=eEyzZQvqVBkRHRPN9uTq9UabhhD6V66x&amp;module_id=181\"}]},\"format\":\"12\"}]}]}]},{\"class\":\"social-full\",\"main_cols\":[{\"format\":\"12\",\"sub_rows\":[{\"sub_cols\":[{\"info\":{\"module\":[{\"code\":\"octwitter\",\"name\":\"OC Twitter\",\"url\":\"http:\\/\\/skybook1.com\\/admin\\/index.php?route=extension\\/module\\/octwitter&amp;user_token=eEyzZQvqVBkRHRPN9uTq9UabhhD6V66x\"}]},\"format\":\"6\"},{\"info\":{\"module\":[{\"code\":\"occmsblock.140\",\"name\":\"OC CMS Block &gt; Social\",\"url\":\"http:\\/\\/skybook1.com\\/admin\\/index.php?route=extension\\/module\\/occmsblock&amp;user_token=eEyzZQvqVBkRHRPN9uTq9UabhhD6V66x&amp;module_id=140\"}]},\"format\":\"6\"}]}]}]}]}'),
(204, 'Price Countdown 4', 'ocproduct', '{\"name\":\"Price Countdown 4\",\"status\":\"1\",\"option\":\"2\",\"product\":\"\",\"cate_name\":\"\",\"cate_id\":\"\",\"productfrom\":\"0\",\"productcate\":\"\",\"input_specific_product\":\"0\",\"autoproduct\":\"4\",\"title_lang\":{\"en-gb\":{\"title\":\"HOT SALE\"},\"de-de\":{\"title\":\"HOT SALE\"}},\"class\":\"occountdown_module module-style3\",\"module_description\":{\"1\":{\"description\":\"\"},\"9\":{\"description\":\"\"}},\"type\":\"0\",\"slider\":\"1\",\"items\":\"3\",\"auto\":\"0\",\"time\":\"1000\",\"speed\":\"1000\",\"row\":\"1\",\"loop\":\"0\",\"margin\":\"0\",\"navigation\":\"0\",\"pagination\":\"0\",\"desktop\":\"3\",\"tablet\":\"3\",\"mobile\":\"2\",\"smobile\":\"2\",\"nrow\":\"1\",\"showcart\":\"1\",\"showwishlist\":\"1\",\"showcompare\":\"1\",\"showquickview\":\"1\",\"description\":\"0\",\"countdown\":\"1\",\"rotator\":\"1\",\"newlabel\":\"1\",\"salelabel\":\"1\",\"limit\":\"6\",\"width\":\"600\",\"height\":\"770\"}'),
(205, 'Product Tabs Slider 4', 'octabproducts', '{\"name\":\"Product Tabs Slider 4\",\"status\":\"1\",\"title_lang\":{\"en-gb\":{\"title\":\"Product Tabs\"},\"de-de\":{\"title\":\"Product Tabs\"}},\"subtitle_lang\":{\"en-gb\":{\"subtitle\":\"\"},\"de-de\":{\"subtitle\":\"\"}},\"class\":\"product-tabs-container-slider  module-style3\",\"module_description\":{\"1\":{\"description\":\"\"},\"9\":{\"description\":\"\"}},\"type\":\"1\",\"slider\":\"1\",\"items\":\"3\",\"row\":\"3\",\"loop\":\"0\",\"margin\":\"0\",\"auto\":\"0\",\"time\":\"100\",\"speed\":\"1000\",\"navigation\":\"0\",\"pagination\":\"0\",\"desktop\":\"3\",\"tablet\":\"2\",\"mobile\":\"2\",\"smobile\":\"2\",\"nrow\":\"1\",\"showcart\":\"0\",\"showwishlist\":\"0\",\"showcompare\":\"0\",\"showquickview\":\"0\",\"description\":\"0\",\"countdown\":\"0\",\"rotator\":\"0\",\"newlabel\":\"0\",\"salelabel\":\"0\",\"limit\":\"12\",\"width\":\"600\",\"height\":\"770\",\"octab\":[{\"tab_name\":{\"en-gb\":{\"title\":\"featured\"},\"de-de\":{\"title\":\"featured\"}},\"option\":\"0\",\"productall\":[\"87  \",\"88  \",\"89  \",\"90  \",\"91  \",\"100  \",\"101  \",\"102  \",\"92  \",\"95  \",\"86  \",\"103  \",\"97  \",\"93  \",\"98  \",\"99  \"],\"cate_name\":\"\",\"cate_id\":\"\",\"productfrom\":\"1\",\"productcate\":\"\",\"input_specific_product\":\"0\",\"autoproduct\":\"0\"},{\"tab_name\":{\"en-gb\":{\"title\":\"MOSTVIEWED\"},\"de-de\":{\"title\":\"MOSTVIEWED\"}},\"option\":\"2\",\"productall\":\"\",\"cate_name\":\"\",\"cate_id\":\"\",\"productfrom\":\"1\",\"productcate\":\"\",\"input_specific_product\":\"0\",\"autoproduct\":\"3\"},{\"tab_name\":{\"en-gb\":{\"title\":\"onsale\"},\"de-de\":{\"title\":\"onsale\"}},\"option\":\"2\",\"productall\":\"\",\"cate_name\":\"\",\"cate_id\":\"\",\"productfrom\":\"1\",\"productcate\":\"\",\"input_specific_product\":\"0\",\"autoproduct\":\"1\"}]}'),
(200, 'Static Slider Koparion4', 'occmsblock', '{\"name\":\"Static Slider Koparion4\",\"cmsblock_id\":\"115\",\"status\":\"1\"}'),
(201, 'Corporate 4', 'occmsblock', '{\"name\":\"Corporate 4\",\"cmsblock_id\":\"116\",\"status\":\"1\"}'),
(199, 'Static Top Koparion3', 'occmsblock', '{\"name\":\"Static Top Koparion3\",\"cmsblock_id\":\"114\",\"status\":\"1\"}'),
(191, 'Payment', 'occmsblock', '{\"name\":\"Payment\",\"cmsblock_id\":\"112\",\"status\":\"1\"}'),
(192, 'Static SideBar', 'occmsblock', '{\"name\":\"Static SideBar\",\"cmsblock_id\":\"107\",\"status\":\"1\"}'),
(193, 'Static Slider Koparion2', 'occmsblock', '{\"name\":\"Static Slider Koparion2\",\"cmsblock_id\":\"113\",\"status\":\"1\"}'),
(194, 'Vertical Megamenu', 'ocvermegamenu', '{\"name\":\"Vertical Megamenu\",\"status\":\"1\",\"h_show_homepage\":\"0\",\"hdepth\":\"2\",\"hlevel\":\"3\",\"hitem_limit\":\"10\",\"h_active_cate\":\"CAT239,CAT228,CAT191,CAT207,CAT315,CAT316,CAT318,CAT319,CAT320,CAT321,CAT322  \"}'),
(195, 'New products 2', 'ocproduct', '{\"name\":\"New products 2\",\"status\":\"1\",\"option\":\"2\",\"product\":\"\",\"cate_name\":\"\",\"cate_id\":\"\",\"productfrom\":\"0\",\"productcate\":\"\",\"input_specific_product\":\"0\",\"autoproduct\":\"0\",\"title_lang\":{\"en-gb\":{\"title\":\"New books\"},\"de-de\":{\"title\":\"New books\"}},\"class\":\"\",\"module_description\":{\"1\":{\"description\":\"\"},\"9\":{\"description\":\"\"}},\"type\":\"0\",\"slider\":\"1\",\"items\":\"5\",\"auto\":\"0\",\"time\":\"1000\",\"speed\":\"1000\",\"row\":\"1\",\"loop\":\"0\",\"margin\":\"0\",\"navigation\":\"1\",\"pagination\":\"0\",\"desktop\":\"5\",\"tablet\":\"4\",\"mobile\":\"3\",\"smobile\":\"2\",\"nrow\":\"1\",\"showcart\":\"1\",\"showwishlist\":\"1\",\"showcompare\":\"1\",\"showquickview\":\"1\",\"description\":\"0\",\"countdown\":\"0\",\"rotator\":\"1\",\"newlabel\":\"1\",\"salelabel\":\"1\",\"limit\":\"12\",\"width\":\"600\",\"height\":\"770\"}'),
(196, 'Price Countdown 2', 'ocproduct', '{\"name\":\"Price Countdown 2\",\"status\":\"1\",\"option\":\"2\",\"product\":\"\",\"cate_name\":\"\",\"cate_id\":\"\",\"productfrom\":\"0\",\"productcate\":\"\",\"input_specific_product\":\"0\",\"autoproduct\":\"4\",\"title_lang\":{\"en-gb\":{\"title\":\"Deals of the day\"},\"de-de\":{\"title\":\"Deals of the day\"}},\"class\":\"occountdown_module\",\"module_description\":{\"1\":{\"description\":\"\"},\"9\":{\"description\":\"\"}},\"type\":\"2\",\"slider\":\"1\",\"items\":\"1\",\"auto\":\"0\",\"time\":\"1000\",\"speed\":\"1000\",\"row\":\"1\",\"loop\":\"0\",\"margin\":\"0\",\"navigation\":\"0\",\"pagination\":\"1\",\"desktop\":\"1\",\"tablet\":\"1\",\"mobile\":\"1\",\"smobile\":\"1\",\"nrow\":\"1\",\"showcart\":\"0\",\"showwishlist\":\"0\",\"showcompare\":\"0\",\"showquickview\":\"1\",\"description\":\"1\",\"countdown\":\"1\",\"rotator\":\"0\",\"newlabel\":\"0\",\"salelabel\":\"0\",\"limit\":\"12\",\"width\":\"600\",\"height\":\"770\"}'),
(186, 'New products 1', 'ocproduct', '{\"name\":\"New products 1\",\"status\":\"1\",\"option\":\"2\",\"product\":\"\",\"cate_name\":\"\",\"cate_id\":\"\",\"productfrom\":\"0\",\"productcate\":\"\",\"input_specific_product\":\"0\",\"autoproduct\":\"0\",\"title_lang\":{\"en-gb\":{\"title\":\"New books\"},\"de-de\":{\"title\":\"New books\"}},\"class\":\"module-style3\",\"module_description\":{\"1\":{\"description\":\"\"},\"9\":{\"description\":\"\"}},\"type\":\"0\",\"slider\":\"1\",\"items\":\"5\",\"auto\":\"0\",\"time\":\"1000\",\"speed\":\"1000\",\"row\":\"2\",\"loop\":\"0\",\"margin\":\"0\",\"navigation\":\"1\",\"pagination\":\"0\",\"desktop\":\"5\",\"tablet\":\"4\",\"mobile\":\"3\",\"smobile\":\"2\",\"nrow\":\"1\",\"showcart\":\"1\",\"showwishlist\":\"1\",\"showcompare\":\"1\",\"showquickview\":\"1\",\"description\":\"0\",\"countdown\":\"0\",\"rotator\":\"1\",\"newlabel\":\"1\",\"salelabel\":\"1\",\"limit\":\"12\",\"width\":\"600\",\"height\":\"770\"}'),
(187, 'Mostview Products 1', 'ocproduct', '{\"name\":\"Mostview Products 1\",\"status\":\"1\",\"option\":\"2\",\"product\":\"\",\"cate_name\":\"\",\"cate_id\":\"\",\"productfrom\":\"0\",\"productcate\":\"\",\"input_specific_product\":\"0\",\"autoproduct\":\"3\",\"title_lang\":{\"en-gb\":{\"title\":\"Most viewed\"},\"de-de\":{\"title\":\"Most viewed\"}},\"class\":\"list-module\",\"module_description\":{\"1\":{\"description\":\"\"},\"9\":{\"description\":\"\"}},\"type\":\"1\",\"slider\":\"1\",\"items\":\"1\",\"auto\":\"0\",\"time\":\"1000\",\"speed\":\"1000\",\"row\":\"3\",\"loop\":\"0\",\"margin\":\"0\",\"navigation\":\"0\",\"pagination\":\"0\",\"desktop\":\"1\",\"tablet\":\"1\",\"mobile\":\"2\",\"smobile\":\"2\",\"nrow\":\"1\",\"showcart\":\"0\",\"showwishlist\":\"0\",\"showcompare\":\"0\",\"showquickview\":\"0\",\"description\":\"0\",\"countdown\":\"0\",\"rotator\":\"0\",\"newlabel\":\"0\",\"salelabel\":\"0\",\"limit\":\"6\",\"width\":\"600\",\"height\":\"770\"}'),
(188, 'Featured products 1', 'ocproduct', '{\"name\":\"Featured products 1\",\"status\":\"1\",\"option\":\"0\",\"product\":[\"89\",\"91\",\"90\",\"92\",\"100\",\"101\",\"102\"],\"cate_name\":\"\",\"cate_id\":\"\",\"productfrom\":\"0\",\"productcate\":\"\",\"input_specific_product\":\"0\",\"autoproduct\":\"0\",\"title_lang\":{\"en-gb\":{\"title\":\"Featured\"},\"de-de\":{\"title\":\"Featured\"}},\"class\":\"list-module\",\"module_description\":{\"1\":{\"description\":\"\"},\"9\":{\"description\":\"\"}},\"type\":\"1\",\"slider\":\"1\",\"items\":\"1\",\"auto\":\"0\",\"time\":\"1000\",\"speed\":\"1000\",\"row\":\"3\",\"loop\":\"0\",\"margin\":\"0\",\"navigation\":\"0\",\"pagination\":\"0\",\"desktop\":\"1\",\"tablet\":\"1\",\"mobile\":\"2\",\"smobile\":\"2\",\"nrow\":\"1\",\"showcart\":\"0\",\"showwishlist\":\"0\",\"showcompare\":\"0\",\"showquickview\":\"0\",\"description\":\"0\",\"countdown\":\"0\",\"rotator\":\"0\",\"newlabel\":\"0\",\"salelabel\":\"0\",\"limit\":\"6\",\"width\":\"600\",\"height\":\"770\"}'),
(59, 'Brand Slider', 'banner', '{\"name\":\"Brand Slider\",\"banner_id\":\"8\",\"width\":\"185\",\"height\":\"88\",\"status\":\"1\"}'),
(197, 'Horizontal Mega Menu 2', 'ochozmegamenu', '{\"name\":\"Horizontal Mega Menu 2\",\"status\":\"1\",\"hhome\":\"1\",\"sticky\":\"1\",\"hdepth\":\"4\",\"hlevel\":\"4\",\"hactive\":\"CMS3,CMS4,LINK78\",\"mobile\":\"0\"}'),
(130, 'Blog', 'ocblog', '{\"name\":\"Blog\",\"status\":\"1\",\"list\":\"1\",\"width\":\"370\",\"height\":\"218\",\"auto\":\"0\",\"items\":\"3\",\"speed\":\"1000\",\"rows\":\"1\",\"navigation\":\"1\",\"pagination\":\"0\"}'),
(206, 'Bestseller Products 4', 'ocproduct', '{\"name\":\"Bestseller Products 4\",\"status\":\"1\",\"option\":\"2\",\"product\":\"\",\"cate_name\":\"\",\"cate_id\":\"\",\"productfrom\":\"0\",\"productcate\":\"\",\"input_specific_product\":\"0\",\"autoproduct\":\"2\",\"title_lang\":{\"en-gb\":{\"title\":\"Best sellers\"},\"de-de\":{\"title\":\"Best sellers\"}},\"class\":\"list-module\",\"module_description\":{\"1\":{\"description\":\"\"},\"9\":{\"description\":\"\"}},\"type\":\"1\",\"slider\":\"1\",\"items\":\"1\",\"auto\":\"0\",\"time\":\"1000\",\"speed\":\"1000\",\"row\":\"3\",\"loop\":\"0\",\"margin\":\"0\",\"navigation\":\"0\",\"pagination\":\"0\",\"desktop\":\"1\",\"tablet\":\"1\",\"mobile\":\"2\",\"smobile\":\"2\",\"nrow\":\"1\",\"showcart\":\"0\",\"showwishlist\":\"0\",\"showcompare\":\"0\",\"showquickview\":\"0\",\"description\":\"0\",\"countdown\":\"0\",\"rotator\":\"0\",\"newlabel\":\"0\",\"salelabel\":\"0\",\"limit\":\"12\",\"width\":\"600\",\"height\":\"770\"}'),
(131, 'Tabs Categories 1', 'octabproducts', '{\"name\":\"Tabs Categories 1\",\"status\":\"1\",\"title_lang\":{\"en-gb\":{\"title\":\"our products\"},\"de-de\":{\"title\":\"our products\"}},\"subtitle_lang\":{\"en-gb\":{\"subtitle\":\"\"},\"de-de\":{\"subtitle\":\"\"}},\"class\":\"tabs-category-slider module-style1\",\"module_description\":{\"1\":{\"description\":\"&lt;p&gt;Browse the collection of our best selling and top interresting products. You\\u2019ll definitely find what you are looking for.&lt;\\/p&gt;\"},\"9\":{\"description\":\"&lt;p&gt;Browse the collection of our best selling and top interresting products. You\\u2019ll definitely find what you are looking for.&lt;\\/p&gt;\"}},\"type\":\"0\",\"slider\":\"1\",\"items\":\"5\",\"row\":\"1\",\"loop\":\"0\",\"margin\":\"0\",\"auto\":\"0\",\"time\":\"1000\",\"speed\":\"1000\",\"navigation\":\"1\",\"pagination\":\"0\",\"desktop\":\"5\",\"tablet\":\"4\",\"mobile\":\"3\",\"smobile\":\"2\",\"nrow\":\"1\",\"showcart\":\"1\",\"showwishlist\":\"1\",\"showcompare\":\"1\",\"showquickview\":\"1\",\"description\":\"0\",\"countdown\":\"0\",\"rotator\":\"1\",\"newlabel\":\"1\",\"salelabel\":\"1\",\"limit\":\"12\",\"width\":\"600\",\"height\":\"770\",\"octab\":[{\"tab_name\":{\"en-gb\":{\"title\":\"Audiobooks\"},\"de-de\":{\"title\":\"Audiobooks\"}},\"option\":\"1\",\"productall\":\"\",\"cate_name\":\"Book Categories\\u00a0\\u00a0&gt;\\u00a0\\u00a0Audiobooks\",\"cate_id\":\"228\",\"productfrom\":\"1\",\"productcate\":\"\",\"input_specific_product\":\"0\",\"autoproduct\":\"0\"},{\"tab_name\":{\"en-gb\":{\"title\":\"chilren\\u2019s books\"},\"de-de\":{\"title\":\"chilren\\u2019s books\"}},\"option\":\"1\",\"productall\":\"\",\"cate_name\":\"Book Categories\\u00a0\\u00a0&gt;\\u00a0\\u00a0chilren\\u2019s books\",\"cate_id\":\"191\",\"productfrom\":\"1\",\"productcate\":\"\",\"input_specific_product\":\"0\",\"autoproduct\":\"0\"},{\"tab_name\":{\"en-gb\":{\"title\":\"bussiness &amp; money\"},\"de-de\":{\"title\":\"bussiness &amp; money\"}},\"option\":\"1\",\"productall\":\"\",\"cate_name\":\"Book Categories\\u00a0\\u00a0&gt;\\u00a0\\u00a0bussiness &amp; money\",\"cate_id\":\"207\",\"productfrom\":\"1\",\"productcate\":\"\",\"input_specific_product\":\"0\",\"autoproduct\":\"0\"}]}'),
(183, 'Header Link', 'occmsblock', '{\"name\":\"Header Link\",\"cmsblock_id\":\"109\",\"status\":\"1\"}'),
(184, 'Static Author Best', 'occmsblock', '{\"name\":\"Static Author Best\",\"cmsblock_id\":\"110\",\"status\":\"1\"}'),
(185, 'Bestseller Products 1', 'ocproduct', '{\"name\":\"Bestseller Products 1\",\"status\":\"1\",\"option\":\"2\",\"product\":\"\",\"cate_name\":\"\",\"cate_id\":\"\",\"productfrom\":\"0\",\"productcate\":\"\",\"input_specific_product\":\"0\",\"autoproduct\":\"2\",\"title_lang\":{\"en-gb\":{\"title\":\"Best sellers\"},\"de-de\":{\"title\":\"Best sellers\"}},\"class\":\"module-style2\",\"module_description\":{\"1\":{\"description\":\"\"},\"9\":{\"description\":\"\"}},\"type\":\"0\",\"slider\":\"1\",\"items\":\"2\",\"auto\":\"0\",\"time\":\"1000\",\"speed\":\"1000\",\"row\":\"2\",\"loop\":\"0\",\"margin\":\"0\",\"navigation\":\"0\",\"pagination\":\"0\",\"desktop\":\"2\",\"tablet\":\"2\",\"mobile\":\"2\",\"smobile\":\"2\",\"nrow\":\"1\",\"showcart\":\"0\",\"showwishlist\":\"0\",\"showcompare\":\"0\",\"showquickview\":\"1\",\"description\":\"0\",\"countdown\":\"0\",\"rotator\":\"0\",\"newlabel\":\"0\",\"salelabel\":\"0\",\"limit\":\"8\",\"width\":\"600\",\"height\":\"770\"}'),
(202, 'Static Top Koparion4', 'occmsblock', '{\"name\":\"Static Top Koparion4\",\"cmsblock_id\":\"117\",\"status\":\"1\"}'),
(198, 'Tabs Categories 2', 'octabproducts', '{\"name\":\"Tabs Categories 2\",\"status\":\"1\",\"title_lang\":{\"en-gb\":{\"title\":\"our products\"},\"de-de\":{\"title\":\"our products\"}},\"subtitle_lang\":{\"en-gb\":{\"subtitle\":\"\"},\"de-de\":{\"subtitle\":\"\"}},\"class\":\"tabs-category-slider module-style1\",\"module_description\":{\"1\":{\"description\":\"&lt;p&gt;Browse the collection of our best selling and top interresting products. You\\u2019ll definitely find what you are looking for.&lt;\\/p&gt;\"},\"9\":{\"description\":\"&lt;p&gt;Browse the collection of our best selling and top interresting products. You\\u2019ll definitely find what you are looking for.&lt;\\/p&gt;\"}},\"type\":\"0\",\"slider\":\"1\",\"items\":\"5\",\"row\":\"2\",\"loop\":\"0\",\"margin\":\"0\",\"auto\":\"0\",\"time\":\"1000\",\"speed\":\"1000\",\"navigation\":\"1\",\"pagination\":\"0\",\"desktop\":\"5\",\"tablet\":\"4\",\"mobile\":\"3\",\"smobile\":\"2\",\"nrow\":\"1\",\"showcart\":\"1\",\"showwishlist\":\"1\",\"showcompare\":\"1\",\"showquickview\":\"1\",\"description\":\"0\",\"countdown\":\"0\",\"rotator\":\"1\",\"newlabel\":\"1\",\"salelabel\":\"1\",\"limit\":\"12\",\"width\":\"600\",\"height\":\"770\",\"octab\":[{\"tab_name\":{\"en-gb\":{\"title\":\"Audiobooks\"},\"de-de\":{\"title\":\"Audiobooks\"}},\"option\":\"1\",\"productall\":\"\",\"cate_name\":\"Audiobooks\",\"cate_id\":\"228\",\"productfrom\":\"1\",\"productcate\":\"\",\"input_specific_product\":\"0\",\"autoproduct\":\"0\"},{\"tab_name\":{\"en-gb\":{\"title\":\"chilren\\u2019s books\"},\"de-de\":{\"title\":\"chilren\\u2019s books\"}},\"option\":\"1\",\"productall\":\"\",\"cate_name\":\"chilren\\u2019s books\",\"cate_id\":\"191\",\"productfrom\":\"1\",\"productcate\":\"\",\"input_specific_product\":\"0\",\"autoproduct\":\"0\"},{\"tab_name\":{\"en-gb\":{\"title\":\"bussiness &amp; money\"},\"de-de\":{\"title\":\"bussiness &amp; money\"}},\"option\":\"1\",\"productall\":\"\",\"cate_name\":\"bussiness &amp; money\",\"cate_id\":\"207\",\"productfrom\":\"1\",\"productcate\":\"\",\"input_specific_product\":\"0\",\"autoproduct\":\"0\"}]}'),
(211, 'Static Top Koparion6', 'occmsblock', '{\"name\":\"Static Top Koparion6\",\"cmsblock_id\":\"118\",\"status\":\"1\"}');
INSERT INTO `oc_module` (`module_id`, `name`, `code`, `setting`) VALUES
(212, 'Layout Homepage 06', 'oc_page_builder', '{\"name\":\"Layout Homepage 06\",\"status\":\"1\",\"widget\":[{\"class\":\"full-width\",\"main_cols\":[{\"format\":\"12\",\"sub_rows\":[{\"sub_cols\":[{\"info\":{\"module\":[{\"code\":\"ocajaxlogin\",\"name\":\"OC Ajax Login\",\"url\":\"http:\\/\\/skybook1.com\\/admin\\/index.php?route=extension\\/module\\/ocajaxlogin&amp;user_token=9xxYKeKCwgCrcTJOZEBoV3merDXTqRlm\"},{\"code\":\"newslettersubscribe.39\",\"name\":\"OC Newsletter &gt; Newsletter Popup\",\"url\":\"http:\\/\\/skybook1.com\\/admin\\/index.php?route=extension\\/module\\/newslettersubscribe&amp;user_token=9xxYKeKCwgCrcTJOZEBoV3merDXTqRlm&amp;module_id=39\"},{\"code\":\"ocslideshow.213\",\"name\":\"OC Slide show &gt; Home slideshow 6\",\"url\":\"http:\\/\\/skybook1.com\\/admin\\/index.php?route=extension\\/module\\/ocslideshow&amp;user_token=9xxYKeKCwgCrcTJOZEBoV3merDXTqRlm&amp;module_id=213\"}]},\"format\":\"12\"}]}]}]},{\"class\":\"\",\"main_cols\":[{\"format\":\"12\",\"sub_rows\":[{\"sub_cols\":[{\"info\":{\"module\":[{\"code\":\"occmsblock.211\",\"name\":\"OC CMS Block &gt; Static Top Skybook6\",\"url\":\"http:\\/\\/skybook1.com\\/admin\\/index.php?route=extension\\/module\\/occmsblock&amp;user_token=9xxYKeKCwgCrcTJOZEBoV3merDXTqRlm&amp;module_id=211\"},{\"code\":\"octabproducts.198\",\"name\":\"OC Tab Products &gt; Tabs Categories 2\",\"url\":\"http:\\/\\/skybook1.com\\/admin\\/index.php?route=extension\\/module\\/octabproducts&amp;user_token=9xxYKeKCwgCrcTJOZEBoV3merDXTqRlm&amp;module_id=198\"}]},\"format\":\"12\"}]}]}]},{\"class\":\"background-full\",\"main_cols\":[{\"format\":\"12\",\"sub_rows\":[{\"sub_cols\":[{\"info\":{\"module\":[{\"code\":\"occmsblock.214\",\"name\":\"OC CMS Block &gt; Static Middle Skybook6\",\"url\":\"http:\\/\\/skybook1.com\\/admin\\/index.php?route=extension\\/module\\/occmsblock&amp;user_token=9xxYKeKCwgCrcTJOZEBoV3merDXTqRlm&amp;module_id=214\"}]},\"format\":\"12\"}]}]}]},{\"class\":\"\",\"main_cols\":[{\"format\":\"12\",\"sub_rows\":[{\"sub_cols\":[{\"info\":{\"module\":[{\"code\":\"ocproduct.196\",\"name\":\"OC Products &gt; Price Countdown 2\",\"url\":\"http:\\/\\/skybook1.com\\/admin\\/index.php?route=extension\\/module\\/ocproduct&amp;user_token=9xxYKeKCwgCrcTJOZEBoV3merDXTqRlm&amp;module_id=196\"}]},\"format\":\"12\"}]}]}]},{\"class\":\"testimor-full\",\"main_cols\":[{\"format\":\"12\",\"sub_rows\":[{\"sub_cols\":[{\"info\":{\"module\":[{\"code\":\"octestimonial.123\",\"name\":\"OC Testimonials &gt; Testimonials\",\"url\":\"http:\\/\\/skybook1.com\\/admin\\/index.php?route=extension\\/module\\/octestimonial&amp;user_token=9xxYKeKCwgCrcTJOZEBoV3merDXTqRlm&amp;module_id=123\"}]},\"format\":\"12\"}]}]}]},{\"class\":\"\",\"main_cols\":[{\"format\":\"12\",\"sub_rows\":[{\"sub_cols\":[{\"info\":{\"module\":[{\"code\":\"ocblog.130\",\"name\":\"OC Blog &gt; Blog\",\"url\":\"http:\\/\\/skybook1.com\\/admin\\/index.php?route=extension\\/module\\/ocblog&amp;user_token=9xxYKeKCwgCrcTJOZEBoV3merDXTqRlm&amp;module_id=130\"}]},\"format\":\"12\"}]}]}]},{\"class\":\"social-full\",\"main_cols\":[{\"format\":\"12\",\"sub_rows\":[{\"sub_cols\":[{\"info\":{\"module\":[{\"code\":\"octwitter\",\"name\":\"OC Twitter\",\"url\":\"http:\\/\\/skybook1.com\\/admin\\/index.php?route=extension\\/module\\/octwitter&amp;user_token=9xxYKeKCwgCrcTJOZEBoV3merDXTqRlm\"}]},\"format\":\"6\"},{\"info\":{\"module\":[{\"code\":\"occmsblock.140\",\"name\":\"OC CMS Block &gt; Social\",\"url\":\"http:\\/\\/skybook1.com\\/admin\\/index.php?route=extension\\/module\\/occmsblock&amp;user_token=9xxYKeKCwgCrcTJOZEBoV3merDXTqRlm&amp;module_id=140\"}]},\"format\":\"6\"}]}]}]},{\"class\":\"newsletter-full\",\"main_cols\":[{\"format\":\"12\",\"sub_rows\":[{\"sub_cols\":[{\"info\":{\"module\":[{\"code\":\"newslettersubscribe.40\",\"name\":\"OC Newsletter &gt; Newsletter\",\"url\":\"http:\\/\\/skybook1.com\\/admin\\/index.php?route=extension\\/module\\/newslettersubscribe&amp;user_token=9xxYKeKCwgCrcTJOZEBoV3merDXTqRlm&amp;module_id=40\"}]},\"format\":\"12\"}]}]}]}]}'),
(213, 'Home slideshow 6', 'ocslideshow', '{\"name\":\"Home slideshow 6\",\"status\":\"1\",\"banner\":\"23\",\"width\":\"1920\",\"height\":\"599\"}'),
(214, 'Static Middle Koparion6', 'occmsblock', '{\"name\":\"Static Middle Koparion6\",\"cmsblock_id\":\"119\",\"status\":\"1\"}');

-- --------------------------------------------------------

--
-- Table structure for table `oc_ocslideshow`
--

DROP TABLE IF EXISTS `oc_ocslideshow`;
CREATE TABLE `oc_ocslideshow` (
  `ocslideshow_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `auto` tinyint(1) DEFAULT NULL,
  `delay` int(11) DEFAULT NULL,
  `hover` tinyint(1) DEFAULT NULL,
  `nextback` tinyint(1) DEFAULT NULL,
  `contrl` tinyint(1) DEFAULT NULL,
  `effect` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_ocslideshow`
--

INSERT INTO `oc_ocslideshow` (`ocslideshow_id`, `name`, `status`, `auto`, `delay`, `hover`, `nextback`, `contrl`, `effect`) VALUES
(18, 'Home slideshow 1', 1, 1, 5000, 1, 1, 1, '  random  '),
(19, 'Home slideshow 2', 1, 1, 5000, 1, 1, 1, '  random  '),
(20, 'Home slideshow 3', 1, 1, 5000, 1, 0, 1, '  random  '),
(21, 'Home slideshow 4', 1, 1, 5000, 1, 1, 1, '  random  '),
(22, 'Home slideshow 5', 1, 1, 5000, 1, 1, 1, '  random  '),
(23, 'Home slideshow 6', 1, 1, 5000, 1, 1, 1, '  random  ');

-- --------------------------------------------------------

--
-- Table structure for table `oc_ocslideshow_image`
--

DROP TABLE IF EXISTS `oc_ocslideshow_image`;
CREATE TABLE `oc_ocslideshow_image` (
  `ocslideshow_image_id` int(11) NOT NULL,
  `ocslideshow_id` int(11) NOT NULL,
  `link` varchar(255) NOT NULL,
  `type` int(11) NOT NULL,
  `banner_store` varchar(110) DEFAULT '0',
  `image` varchar(255) NOT NULL,
  `small_image` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_ocslideshow_image`
--

INSERT INTO `oc_ocslideshow_image` (`ocslideshow_image_id`, `ocslideshow_id`, `link`, `type`, `banner_store`, `image`, `small_image`) VALUES
(407, 18, '#', 1, '0,0', 'catalog/slider/slider1-skybook1.jpg', 'no_image.png'),
(406, 18, '#', 2, '0,0', 'catalog/slider/slider2-skybook1.jpg', 'no_image.png'),
(405, 19, '#', 1, '1,0,1,0', 'catalog/slider/slider1-skybook2.jpg', 'no_image.png'),
(404, 19, '#', 2, '1,0,1,0', 'catalog/slider/slider2-skybook2.jpg', 'no_image.png'),
(393, 20, '#', 1, '2,0,2,0', 'catalog/slider/slider1-skybook3.jpg', 'no_image.png'),
(392, 20, '#', 2, '2,0,2,0', 'catalog/slider/slider2-skybook3.jpg', 'no_image.png'),
(395, 21, '#', 1, '3,0,3,0', 'catalog/slider/slider1-skybook4.jpg', 'no_image.png'),
(394, 21, '#', 2, '3,0,3,0', 'catalog/slider/slider2-skybook4.jpg', 'no_image.png'),
(403, 22, '#', 1, '6,0,6,0', 'catalog/slider/slider1-skybook5.jpg', 'no_image.png'),
(409, 23, '#', 1, '7,0,7,0', 'catalog/slider/slider1-skybook1.jpg', 'no_image.png'),
(402, 22, '#', 2, '6,0,6,0', 'catalog/slider/slider2-skybook5.jpg', 'no_image.png'),
(408, 23, '#', 2, '7,0,7,0', 'catalog/slider/slider2-skybook6.jpg', 'no_image.png');

-- --------------------------------------------------------

--
-- Table structure for table `oc_ocslideshow_image_description`
--

DROP TABLE IF EXISTS `oc_ocslideshow_image_description`;
CREATE TABLE `oc_ocslideshow_image_description` (
  `ocslideshow_image_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `ocslideshow_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `sub_title` varchar(255) DEFAULT NULL,
  `description` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_ocslideshow_image_description`
--

INSERT INTO `oc_ocslideshow_image_description` (`ocslideshow_image_id`, `language_id`, `ocslideshow_id`, `title`, `sub_title`, `description`) VALUES
(392, 1, 20, 'Do it', 'Yourself', '&lt;p&gt;\r\n&lt;span&gt;-20%&lt;/span&gt;\r\n&lt;span&gt;\r\n&lt;span&gt;£80.00&lt;/span&gt;\r\n&lt;span&gt;£66.00&lt;/span&gt;\r\n&lt;/span&gt;\r\n&lt;/p&gt;'),
(394, 1, 21, 'We can help get your', 'Books in Order', '&lt;p&gt;&lt;/p&gt;'),
(407, 9, 18, 'Huge Sale', 'Koparion', '&lt;p&gt;Now starting at £99.00&lt;/p&gt;'),
(407, 1, 18, 'Huge Sale', 'Koparion', '&lt;p&gt;Now starting at £99.00&lt;/p&gt;'),
(405, 9, 19, 'A Game', 'of Thrones', '&lt;p&gt;\r\n&lt;span&gt;-20%&lt;/span&gt;\r\n&lt;span&gt;\r\n&lt;span&gt;£80.00&lt;/span&gt;\r\n&lt;span&gt;£66.00&lt;/span&gt;\r\n&lt;/span&gt;\r\n&lt;/p&gt;'),
(403, 1, 22, 'Do it', 'Yourself', '&lt;p&gt;\r\n&lt;span&gt;-20%&lt;/span&gt;\r\n&lt;span&gt;\r\n&lt;span&gt;£80.00&lt;/span&gt;\r\n&lt;span&gt;£66.00&lt;/span&gt;\r\n&lt;/span&gt;\r\n&lt;/p&gt;'),
(393, 1, 20, 'Do it', 'Yourself', '&lt;p&gt;\r\n&lt;span&gt;-20%&lt;/span&gt;\r\n&lt;span&gt;\r\n&lt;span&gt;£80.00&lt;/span&gt;\r\n&lt;span&gt;£66.00&lt;/span&gt;\r\n&lt;/span&gt;\r\n&lt;/p&gt;'),
(395, 1, 21, 'Sale up to 30% off', 'Books in Store', '&lt;p&gt;&lt;/p&gt;'),
(409, 1, 23, 'Huge Sale', 'Koparion', '&lt;p&gt;Now starting at £99.00&lt;/p&gt;'),
(402, 9, 22, 'Do it', 'Yourself', '&lt;p&gt;\r\n&lt;span&gt;-20%&lt;/span&gt;\r\n&lt;span&gt;\r\n&lt;span&gt;£80.00&lt;/span&gt;\r\n&lt;span&gt;£66.00&lt;/span&gt;\r\n&lt;/span&gt;\r\n&lt;/p&gt;'),
(409, 9, 23, 'Huge Sale', 'Koparion', '&lt;p&gt;Now starting at £99.00&lt;/p&gt;'),
(392, 9, 20, 'Do it', 'Yourself', '&lt;p&gt;\r\n&lt;span&gt;-20%&lt;/span&gt;\r\n&lt;span&gt;\r\n&lt;span&gt;£80.00&lt;/span&gt;\r\n&lt;span&gt;£66.00&lt;/span&gt;\r\n&lt;/span&gt;\r\n&lt;/p&gt;'),
(394, 9, 21, 'We can help get your', 'Books in Order', '&lt;p&gt;&lt;/p&gt;'),
(406, 9, 18, 'We can help get your', 'Books in Order', '&lt;p&gt;&lt;/p&gt;'),
(406, 1, 18, 'We can help get your', 'Books in Order', '&lt;p&gt;&lt;/p&gt;'),
(405, 1, 19, 'A Game', 'of Thrones', '&lt;p&gt;\r\n&lt;span&gt;-20%&lt;/span&gt;\r\n&lt;span&gt;\r\n&lt;span&gt;£80.00&lt;/span&gt;\r\n&lt;span&gt;£66.00&lt;/span&gt;\r\n&lt;/span&gt;\r\n&lt;/p&gt;'),
(404, 1, 19, 'Sale up to 30% off', 'Books in Store', '&lt;p&gt;&lt;/p&gt;'),
(404, 9, 19, 'Sale up to 30% off', 'Books in Store', '&lt;p&gt;&lt;/p&gt;'),
(393, 9, 20, 'Do it', 'Yourself', '&lt;p&gt;\r\n&lt;span&gt;-20%&lt;/span&gt;\r\n&lt;span&gt;\r\n&lt;span&gt;£80.00&lt;/span&gt;\r\n&lt;span&gt;£66.00&lt;/span&gt;\r\n&lt;/span&gt;\r\n&lt;/p&gt;'),
(395, 9, 21, 'Sale up to 30% off', 'Books in Store', '&lt;p&gt;&lt;/p&gt;'),
(402, 1, 22, 'Do it', 'Yourself', '&lt;p&gt;\r\n&lt;span&gt;-20%&lt;/span&gt;\r\n&lt;span&gt;\r\n&lt;span&gt;£80.00&lt;/span&gt;\r\n&lt;span&gt;£66.00&lt;/span&gt;\r\n&lt;/span&gt;\r\n&lt;/p&gt;'),
(408, 9, 23, 'We can help get your', 'Books in Order', ''),
(408, 1, 23, 'We can help get your', 'Books in Order', ''),
(403, 9, 22, 'Do it', 'Yourself', '&lt;p&gt;\r\n&lt;span&gt;-20%&lt;/span&gt;\r\n&lt;span&gt;\r\n&lt;span&gt;£80.00&lt;/span&gt;\r\n&lt;span&gt;£66.00&lt;/span&gt;\r\n&lt;/span&gt;\r\n&lt;/p&gt;');

-- --------------------------------------------------------

--
-- Table structure for table `oc_option`
--

DROP TABLE IF EXISTS `oc_option`;
CREATE TABLE `oc_option` (
  `option_id` int(11) NOT NULL,
  `type` varchar(32) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_option`
--

INSERT INTO `oc_option` (`option_id`, `type`, `sort_order`) VALUES
(1, 'radio', 1),
(2, 'checkbox', 2),
(4, 'text', 3),
(5, 'select', 4),
(6, 'textarea', 5),
(7, 'file', 6),
(8, 'date', 7),
(9, 'time', 8),
(10, 'datetime', 9),
(11, 'select', 10),
(12, 'date', 11);

-- --------------------------------------------------------

--
-- Table structure for table `oc_option_description`
--

DROP TABLE IF EXISTS `oc_option_description`;
CREATE TABLE `oc_option_description` (
  `option_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_option_description`
--

INSERT INTO `oc_option_description` (`option_id`, `language_id`, `name`) VALUES
(1, 1, 'Radio'),
(2, 1, 'Checkbox'),
(4, 1, 'Text'),
(6, 1, 'Textarea'),
(8, 1, 'Date'),
(7, 1, 'File'),
(5, 1, 'Select'),
(9, 1, 'Time'),
(10, 1, 'Date &amp; Time'),
(12, 1, 'Delivery Date'),
(11, 1, 'Size'),
(11, 9, 'Size'),
(12, 9, 'Delivery Date'),
(10, 9, 'Date &amp; Time'),
(9, 9, 'Time'),
(5, 9, 'Select'),
(7, 9, 'File'),
(8, 9, 'Date'),
(6, 9, 'Textarea'),
(4, 9, 'Text'),
(2, 9, 'Checkbox'),
(1, 9, 'Radio');

-- --------------------------------------------------------

--
-- Table structure for table `oc_option_value`
--

DROP TABLE IF EXISTS `oc_option_value`;
CREATE TABLE `oc_option_value` (
  `option_value_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_option_value`
--

INSERT INTO `oc_option_value` (`option_value_id`, `option_id`, `image`, `sort_order`) VALUES
(43, 1, '', 3),
(32, 1, '', 1),
(45, 2, '', 4),
(44, 2, '', 3),
(42, 5, '', 4),
(41, 5, '', 3),
(39, 5, '', 1),
(40, 5, '', 2),
(31, 1, '', 2),
(23, 2, '', 1),
(24, 2, '', 2),
(46, 11, '', 1),
(47, 11, '', 2),
(48, 11, '', 3);

-- --------------------------------------------------------

--
-- Table structure for table `oc_option_value_description`
--

DROP TABLE IF EXISTS `oc_option_value_description`;
CREATE TABLE `oc_option_value_description` (
  `option_value_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_option_value_description`
--

INSERT INTO `oc_option_value_description` (`option_value_id`, `language_id`, `option_id`, `name`) VALUES
(43, 1, 1, 'Large'),
(32, 1, 1, 'Small'),
(45, 1, 2, 'Checkbox 4'),
(44, 1, 2, 'Checkbox 3'),
(31, 1, 1, 'Medium'),
(42, 1, 5, 'Yellow'),
(41, 1, 5, 'Green'),
(39, 1, 5, 'Red'),
(40, 1, 5, 'Blue'),
(23, 1, 2, 'Checkbox 1'),
(24, 1, 2, 'Checkbox 2'),
(48, 1, 11, 'Large'),
(47, 1, 11, 'Medium'),
(46, 1, 11, 'Small'),
(46, 9, 11, 'Small'),
(47, 9, 11, 'Medium'),
(48, 9, 11, 'Large'),
(24, 9, 2, 'Checkbox 2'),
(23, 9, 2, 'Checkbox 1'),
(40, 9, 5, 'Blue'),
(39, 9, 5, 'Red'),
(41, 9, 5, 'Green'),
(42, 9, 5, 'Yellow'),
(31, 9, 1, 'Medium'),
(44, 9, 2, 'Checkbox 3'),
(45, 9, 2, 'Checkbox 4'),
(32, 9, 1, 'Small'),
(43, 9, 1, 'Large');

-- --------------------------------------------------------

--
-- Table structure for table `oc_order`
--

DROP TABLE IF EXISTS `oc_order`;
CREATE TABLE `oc_order` (
  `order_id` int(11) NOT NULL,
  `invoice_no` int(11) NOT NULL DEFAULT '0',
  `invoice_prefix` varchar(26) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `store_name` varchar(64) NOT NULL,
  `store_url` varchar(255) NOT NULL,
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `customer_group_id` int(11) NOT NULL DEFAULT '0',
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `custom_field` text NOT NULL,
  `payment_firstname` varchar(32) NOT NULL,
  `payment_lastname` varchar(32) NOT NULL,
  `payment_company` varchar(60) NOT NULL,
  `payment_address_1` varchar(128) NOT NULL,
  `payment_address_2` varchar(128) NOT NULL,
  `payment_city` varchar(128) NOT NULL,
  `payment_postcode` varchar(10) NOT NULL,
  `payment_country` varchar(128) NOT NULL,
  `payment_country_id` int(11) NOT NULL,
  `payment_zone` varchar(128) NOT NULL,
  `payment_zone_id` int(11) NOT NULL,
  `payment_address_format` text NOT NULL,
  `payment_custom_field` text NOT NULL,
  `payment_method` varchar(128) NOT NULL,
  `payment_code` varchar(128) NOT NULL,
  `shipping_firstname` varchar(32) NOT NULL,
  `shipping_lastname` varchar(32) NOT NULL,
  `shipping_company` varchar(40) NOT NULL,
  `shipping_address_1` varchar(128) NOT NULL,
  `shipping_address_2` varchar(128) NOT NULL,
  `shipping_city` varchar(128) NOT NULL,
  `shipping_postcode` varchar(10) NOT NULL,
  `shipping_country` varchar(128) NOT NULL,
  `shipping_country_id` int(11) NOT NULL,
  `shipping_zone` varchar(128) NOT NULL,
  `shipping_zone_id` int(11) NOT NULL,
  `shipping_address_format` text NOT NULL,
  `shipping_custom_field` text NOT NULL,
  `shipping_method` varchar(128) NOT NULL,
  `shipping_code` varchar(128) NOT NULL,
  `comment` text NOT NULL,
  `total` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `order_status_id` int(11) NOT NULL DEFAULT '0',
  `affiliate_id` int(11) NOT NULL,
  `commission` decimal(15,4) NOT NULL,
  `marketing_id` int(11) NOT NULL,
  `tracking` varchar(64) NOT NULL,
  `language_id` int(11) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `currency_code` varchar(3) NOT NULL,
  `currency_value` decimal(15,8) NOT NULL DEFAULT '1.00000000',
  `ip` varchar(40) NOT NULL,
  `forwarded_ip` varchar(40) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `accept_language` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_order`
--

INSERT INTO `oc_order` (`order_id`, `invoice_no`, `invoice_prefix`, `store_id`, `store_name`, `store_url`, `customer_id`, `customer_group_id`, `firstname`, `lastname`, `email`, `telephone`, `fax`, `custom_field`, `payment_firstname`, `payment_lastname`, `payment_company`, `payment_address_1`, `payment_address_2`, `payment_city`, `payment_postcode`, `payment_country`, `payment_country_id`, `payment_zone`, `payment_zone_id`, `payment_address_format`, `payment_custom_field`, `payment_method`, `payment_code`, `shipping_firstname`, `shipping_lastname`, `shipping_company`, `shipping_address_1`, `shipping_address_2`, `shipping_city`, `shipping_postcode`, `shipping_country`, `shipping_country_id`, `shipping_zone`, `shipping_zone_id`, `shipping_address_format`, `shipping_custom_field`, `shipping_method`, `shipping_code`, `comment`, `total`, `order_status_id`, `affiliate_id`, `commission`, `marketing_id`, `tracking`, `language_id`, `currency_id`, `currency_code`, `currency_value`, `ip`, `forwarded_ip`, `user_agent`, `accept_language`, `date_added`, `date_modified`) VALUES
(1, 1, 'INV-2017-00', 0, 'Digitech 1', 'http://digitech1.com/', 1, 1, 'Plaza', 'Themes', 'demo@plazathemes.com', '12345678', '', '', 'Plaza', 'Themes', '', 'NewYork', '', 'NewYork', '100000', 'United Kingdom', 222, 'Aberdeen', 3513, '', '[]', 'Cash On Delivery', 'cod', 'Plaza', 'Themes', '', 'NewYork', '', 'NewYork', '100000', 'United Kingdom', 222, 'Aberdeen', 3513, '', '[]', 'Flat Shipping Rate', 'flat.flat', '', '7829.9880', 1, 0, '0.0000', 0, '', 1, 2, 'USD', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36', 'vi-VN,vi;q=0.8,fr-FR;q=0.6,fr;q=0.4,en-US;q=0.2,en;q=0.2', '2017-09-04 20:30:24', '2017-09-16 09:52:48'),
(2, 0, 'INV-2017-00', 1, 'Volga 2', 'http://volga2.com/', 1, 1, 'Plaza', 'Themes', 'demo@plazathemes.com', '12345678', '', '', 'Plaza', 'Themes', '', 'NewYork', '', 'NewYork', '100000', 'United Kingdom', 222, 'Aberdeen', 3513, '', '[]', 'Cash On Delivery', 'cod', 'Plaza', 'Themes', '', 'NewYork', '', 'NewYork', '100000', 'United Kingdom', 222, 'Aberdeen', 3513, '', '[]', 'Flat Shipping Rate', 'flat.flat', '', '2106.0000', 1, 0, '0.0000', 0, '', 1, 2, 'USD', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36', 'vi-VN,vi;q=0.8,fr-FR;q=0.6,fr;q=0.4,en-US;q=0.2,en;q=0.2', '2017-09-29 16:09:44', '2017-09-29 16:09:55'),
(3, 0, 'INV-2017-00', 3, 'Volga 4', 'http://volga4.com/', 1, 1, 'Plaza', 'Themes', 'demo@plazathemes.com', '12345678', '', '', 'Plaza', 'Themes', '', 'NewYork', '', 'NewYork', '100000', 'United Kingdom', 222, 'Aberdeen', 3513, '', '[]', 'Cash On Delivery', 'cod', 'Plaza', 'Themes', '', 'NewYork', '', 'NewYork', '100000', 'United Kingdom', 222, 'Aberdeen', 3513, '', '[]', 'Flat Shipping Rate', 'flat.flat', '', '6034.0000', 1, 0, '0.0000', 0, '', 1, 2, 'USD', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36', 'vi-VN,vi;q=0.8,fr-FR;q=0.6,fr;q=0.4,en-US;q=0.2,en;q=0.2', '2017-10-04 09:29:11', '2017-10-04 09:29:22'),
(4, 0, 'INV-2017-00', 3, 'Volga 4', 'http://volga4.com/', 1, 1, 'Plaza', 'Themes', 'demo@plazathemes.com', '12345678', '', '', 'Plaza', 'Themes', '', 'NewYork', '', 'NewYork', '100000', 'United Kingdom', 222, 'Aberdeen', 3513, '', '[]', 'Cash On Delivery', 'cod', 'Plaza', 'Themes', '', 'NewYork', '', 'NewYork', '100000', 'United Kingdom', 222, 'Aberdeen', 3513, '', '[]', 'Flat Shipping Rate', 'flat.flat', '', '4557.9880', 1, 0, '0.0000', 0, '', 1, 2, 'USD', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36', 'vi-VN,vi;q=0.8,fr-FR;q=0.6,fr;q=0.4,en-US;q=0.2,en;q=0.2', '2017-10-04 14:19:33', '2017-10-04 14:19:48'),
(5, 0, 'INV-2017-00', 3, 'Skybook 4', 'http://skybook4.com/', 1, 1, 'Plaza', 'Themes', 'demo@plazathemes.com', '12345678', '', '', 'Plaza', 'Themes', '', 'NewYork', '', 'NewYork', '100000', 'United Kingdom', 222, 'Aberdeen', 3513, '', '[]', 'Cash On Delivery', 'cod', 'Plaza', 'Themes', '', 'NewYork', '', 'NewYork', '100000', 'United Kingdom', 222, 'Aberdeen', 3513, '', '[]', 'Flat Shipping Rate', 'flat.flat', '', '2638.7880', 1, 0, '0.0000', 0, '', 1, 2, 'USD', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.84 Safari/537.36', 'vi-VN,vi;q=0.9,fr-FR;q=0.8,fr;q=0.7,en-US;q=0.6,en;q=0.5', '2017-12-27 16:21:27', '2017-12-27 16:21:34');

-- --------------------------------------------------------

--
-- Table structure for table `oc_order_history`
--

DROP TABLE IF EXISTS `oc_order_history`;
CREATE TABLE `oc_order_history` (
  `order_history_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `order_status_id` int(11) NOT NULL,
  `notify` tinyint(1) NOT NULL DEFAULT '0',
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_order_history`
--

INSERT INTO `oc_order_history` (`order_history_id`, `order_id`, `order_status_id`, `notify`, `comment`, `date_added`) VALUES
(1, 1, 1, 0, '', '2017-09-04 20:30:29'),
(2, 1, 1, 0, '', '2017-09-04 20:30:34'),
(3, 1, 1, 0, '', '2017-09-16 09:52:48'),
(4, 2, 1, 0, '', '2017-09-29 16:09:49'),
(5, 2, 1, 0, '', '2017-09-29 16:09:55'),
(6, 3, 1, 0, '', '2017-10-04 09:29:16'),
(7, 3, 1, 0, '', '2017-10-04 09:29:22'),
(8, 4, 1, 0, '', '2017-10-04 14:19:38'),
(9, 4, 1, 0, '', '2017-10-04 14:19:48'),
(10, 5, 1, 0, '', '2017-12-27 16:21:32'),
(11, 5, 1, 0, '', '2017-12-27 16:21:34');

-- --------------------------------------------------------

--
-- Table structure for table `oc_order_option`
--

DROP TABLE IF EXISTS `oc_order_option`;
CREATE TABLE `oc_order_option` (
  `order_option_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `order_product_id` int(11) NOT NULL,
  `product_option_id` int(11) NOT NULL,
  `product_option_value_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `type` varchar(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_order_product`
--

DROP TABLE IF EXISTS `oc_order_product`;
CREATE TABLE `oc_order_product` (
  `order_product_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `model` varchar(64) NOT NULL,
  `quantity` int(4) NOT NULL,
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `total` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `tax` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `reward` int(8) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_order_product`
--

INSERT INTO `oc_order_product` (`order_product_id`, `order_id`, `product_id`, `name`, `model`, `quantity`, `price`, `total`, `tax`, `reward`) VALUES
(1, 1, 63, 'Microsoft Surface Pro 3', 'Digital', 2, '1000.0000', '2000.0000', '202.0000', 1400),
(2, 1, 65, 'ASUS ZenPad 3S', 'Digital', 2, '80.0000', '160.0000', '18.0000', 0),
(3, 1, 61, 'Acer Aspire E 15', 'Digital', 2, '500.0000', '1000.0000', '102.0000', 1200),
(4, 1, 58, 'TP-Link AC3150 Wireless', 'Digital', 2, '80.0000', '160.0000', '18.0000', 0),
(5, 1, 60, 'Lenovo Ideacentre 300', 'Digital', 2, '95.0000', '190.0000', '21.0000', 0),
(6, 1, 57, 'ASUS UX360CA', 'Digital', 2, '80.0000', '160.0000', '18.0000', 0),
(7, 1, 55, 'Dell Inspiron 24', 'Digital', 2, '1000.0000', '2000.0000', '202.0000', 0),
(8, 1, 71, 'Fire  with Alexa', 'Digital', 2, '270.0000', '540.0000', '56.0000', 0),
(9, 1, 66, 'Fire Tablet with Alexa', 'Digital', 1, '279.9900', '279.9900', '57.9980', 0),
(10, 2, 100, 'Savvy Shoulder Totes', 'Tv&amp;Video', 1, '2000.0000', '2000.0000', '0.0000', 800),
(11, 2, 101, 'Sprite Yoga Companion Kits', 'Tv&amp;Video', 1, '80.0000', '80.0000', '18.0000', 0),
(12, 3, 113, 'Coil Master Ohm Tool', 'Phone&amp;Tablet', 1, '85.0000', '85.0000', '19.0000', 0),
(13, 3, 46, 'Crown Summit Backpack', 'Fashion', 1, '1000.0000', '1000.0000', '202.0000', 0),
(14, 3, 111, 'Driptip Kryptonite', 'Phone&amp;Tablet', 1, '80.0000', '80.0000', '18.0000', 0),
(15, 3, 99, 'Rival Field Messengers', 'Tv&amp;Video', 2, '1000.0000', '2000.0000', '202.0000', 1400),
(16, 3, 100, 'Savvy Shoulder Totes', 'Tv&amp;Video', 1, '2000.0000', '2000.0000', '0.0000', 800),
(17, 3, 103, 'Voyage Yoga Bags', 'Tv&amp;Video', 1, '180.0000', '180.0000', '38.0000', 0),
(18, 4, 72, 'Quiet Noise-Free', 'Home&amp;Kitchen', 1, '65.0000', '65.0000', '15.0000', 0),
(19, 4, 75, 'Signature Sleep', 'Home&amp;Kitchen', 1, '85.0000', '85.0000', '19.0000', 0),
(20, 4, 85, 'Table Bedroom Night ', 'Home&amp;Kitchen', 1, '80.0000', '80.0000', '18.0000', 0),
(21, 4, 76, 'Tea Memory Foam', 'Home&amp;Kitchen', 1, '80.0000', '80.0000', '18.0000', 0),
(22, 4, 73, 'Upholstered Square', 'Home&amp;Kitchen', 1, '2000.0000', '2000.0000', '0.0000', 800),
(23, 4, 74, 'Wooden Slats', 'Home&amp;Kitchen', 1, '80.0000', '80.0000', '18.0000', 0),
(24, 4, 112, 'Coil Master Kbag', 'Phone&amp;Tablet', 1, '80.0000', '80.0000', '18.0000', 0),
(25, 4, 113, 'Coil Master Ohm Tool', 'Phone&amp;Tablet', 1, '85.0000', '85.0000', '19.0000', 0),
(26, 4, 111, 'Driptip Kryptonite', 'Phone&amp;Tablet', 1, '80.0000', '80.0000', '18.0000', 0),
(27, 4, 67, 'LeapFrog Epic', 'Electronics', 1, '200.0000', '200.0000', '42.0000', 0),
(28, 4, 109, 'RAVENSMOON TANK 157', 'Phone&amp;Tablet', 1, '1000.0000', '1000.0000', '202.0000', 0),
(29, 4, 110, 'Reulaux RX2/3 By Wismec', 'Phone&amp;Tablet', 1, '70.0000', '70.0000', '16.0000', 0),
(30, 4, 116, 'Vapor Bag V2 by Advken', 'Phone&amp;Tablet', 1, '199.9900', '199.9900', '41.9980', 1000),
(31, 5, 89, 'Chaz Kangeroo Hoodies', 'Book', 1, '64.0000', '64.0000', '14.8000', 400),
(32, 5, 92, 'Driven Backpacks', 'Book', 1, '70.0000', '70.0000', '16.0000', 0),
(33, 5, 90, 'Compete Track Totes', 'Book', 1, '65.0000', '65.0000', '15.0000', 0),
(34, 5, 93, 'Endeavor Daytrip Backpacks', 'Book', 1, '80.0000', '80.0000', '18.0000', 0),
(35, 5, 97, 'Maxima Drawstring Shorts', 'Book', 1, '500.0000', '500.0000', '102.0000', 600),
(36, 5, 99, 'Rival Field Messengers', 'Book', 1, '1000.0000', '1000.0000', '202.0000', 700),
(37, 5, 103, 'Voyage Yoga Bags', 'Book', 1, '200.0000', '200.0000', '42.0000', 0),
(38, 5, 98, 'Radiant Tees', 'Book', 1, '199.9900', '199.9900', '41.9980', 1000);

-- --------------------------------------------------------

--
-- Table structure for table `oc_order_recurring`
--

DROP TABLE IF EXISTS `oc_order_recurring`;
CREATE TABLE `oc_order_recurring` (
  `order_recurring_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `reference` varchar(255) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_quantity` int(11) NOT NULL,
  `recurring_id` int(11) NOT NULL,
  `recurring_name` varchar(255) NOT NULL,
  `recurring_description` varchar(255) NOT NULL,
  `recurring_frequency` varchar(25) NOT NULL,
  `recurring_cycle` smallint(6) NOT NULL,
  `recurring_duration` smallint(6) NOT NULL,
  `recurring_price` decimal(10,4) NOT NULL,
  `trial` tinyint(1) NOT NULL,
  `trial_frequency` varchar(25) NOT NULL,
  `trial_cycle` smallint(6) NOT NULL,
  `trial_duration` smallint(6) NOT NULL,
  `trial_price` decimal(10,4) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_order_recurring_transaction`
--

DROP TABLE IF EXISTS `oc_order_recurring_transaction`;
CREATE TABLE `oc_order_recurring_transaction` (
  `order_recurring_transaction_id` int(11) NOT NULL,
  `order_recurring_id` int(11) NOT NULL,
  `reference` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `amount` decimal(10,4) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_order_shipment`
--

DROP TABLE IF EXISTS `oc_order_shipment`;
CREATE TABLE `oc_order_shipment` (
  `order_shipment_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL,
  `shipping_courier_id` varchar(255) NOT NULL DEFAULT '',
  `tracking_number` varchar(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_order_status`
--

DROP TABLE IF EXISTS `oc_order_status`;
CREATE TABLE `oc_order_status` (
  `order_status_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_order_status`
--

INSERT INTO `oc_order_status` (`order_status_id`, `language_id`, `name`) VALUES
(2, 1, 'Processing'),
(3, 1, 'Shipped'),
(7, 1, 'Canceled'),
(5, 1, 'Complete'),
(8, 1, 'Denied'),
(9, 1, 'Canceled Reversal'),
(10, 1, 'Failed'),
(11, 1, 'Refunded'),
(12, 1, 'Reversed'),
(13, 1, 'Chargeback'),
(1, 1, 'Pending'),
(16, 1, 'Voided'),
(15, 1, 'Processed'),
(14, 1, 'Expired'),
(2, 3, 'Processing'),
(3, 3, 'Shipped'),
(7, 3, 'Canceled'),
(5, 3, 'Complete'),
(8, 3, 'Denied'),
(9, 3, 'Canceled Reversal'),
(10, 3, 'Failed'),
(11, 3, 'Refunded'),
(12, 3, 'Reversed'),
(13, 3, 'Chargeback'),
(1, 3, 'Pending'),
(16, 3, 'Voided'),
(15, 3, 'Processed'),
(14, 3, 'Expired'),
(2, 4, 'Processing'),
(3, 4, 'Shipped'),
(7, 4, 'Canceled'),
(5, 4, 'Complete'),
(8, 4, 'Denied'),
(9, 4, 'Canceled Reversal'),
(10, 4, 'Failed'),
(11, 4, 'Refunded'),
(12, 4, 'Reversed'),
(13, 4, 'Chargeback'),
(1, 4, 'Pending'),
(16, 4, 'Voided'),
(15, 4, 'Processed'),
(14, 4, 'Expired'),
(2, 5, 'Processing'),
(3, 5, 'Shipped'),
(7, 5, 'Canceled'),
(5, 5, 'Complete'),
(8, 5, 'Denied'),
(9, 5, 'Canceled Reversal'),
(10, 5, 'Failed'),
(11, 5, 'Refunded'),
(12, 5, 'Reversed'),
(13, 5, 'Chargeback'),
(1, 5, 'Pending'),
(16, 5, 'Voided'),
(15, 5, 'Processed'),
(14, 5, 'Expired'),
(2, 6, 'Processing'),
(3, 6, 'Shipped'),
(7, 6, 'Canceled'),
(5, 6, 'Complete'),
(8, 6, 'Denied'),
(9, 6, 'Canceled Reversal'),
(10, 6, 'Failed'),
(11, 6, 'Refunded'),
(12, 6, 'Reversed'),
(13, 6, 'Chargeback'),
(1, 6, 'Pending'),
(16, 6, 'Voided'),
(15, 6, 'Processed'),
(14, 6, 'Expired'),
(2, 7, 'Processing'),
(3, 7, 'Shipped'),
(7, 7, 'Canceled'),
(5, 7, 'Complete'),
(8, 7, 'Denied'),
(9, 7, 'Canceled Reversal'),
(10, 7, 'Failed'),
(11, 7, 'Refunded'),
(12, 7, 'Reversed'),
(13, 7, 'Chargeback'),
(1, 7, 'Pending'),
(16, 7, 'Voided'),
(15, 7, 'Processed'),
(14, 7, 'Expired'),
(2, 8, 'Processing'),
(3, 8, 'Shipped'),
(7, 8, 'Canceled'),
(5, 8, 'Complete'),
(8, 8, 'Denied'),
(9, 8, 'Canceled Reversal'),
(10, 8, 'Failed'),
(11, 8, 'Refunded'),
(12, 8, 'Reversed'),
(13, 8, 'Chargeback'),
(1, 8, 'Pending'),
(16, 8, 'Voided'),
(15, 8, 'Processed'),
(14, 8, 'Expired'),
(2, 9, 'Processing'),
(3, 9, 'Shipped'),
(7, 9, 'Canceled'),
(5, 9, 'Complete'),
(8, 9, 'Denied'),
(9, 9, 'Canceled Reversal'),
(10, 9, 'Failed'),
(11, 9, 'Refunded'),
(12, 9, 'Reversed'),
(13, 9, 'Chargeback'),
(1, 9, 'Pending'),
(16, 9, 'Voided'),
(15, 9, 'Processed'),
(14, 9, 'Expired');

-- --------------------------------------------------------

--
-- Table structure for table `oc_order_total`
--

DROP TABLE IF EXISTS `oc_order_total`;
CREATE TABLE `oc_order_total` (
  `order_total_id` int(10) NOT NULL,
  `order_id` int(11) NOT NULL,
  `code` varchar(32) NOT NULL,
  `title` varchar(255) NOT NULL,
  `value` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_order_total`
--

INSERT INTO `oc_order_total` (`order_total_id`, `order_id`, `code`, `title`, `value`, `sort_order`) VALUES
(1, 1, 'sub_total', 'Sub-Total', '6489.9900', 1),
(2, 1, 'shipping', 'Flat Shipping Rate', '5.0000', 3),
(3, 1, 'tax', 'Eco Tax (-2.00)', '36.0000', 5),
(4, 1, 'tax', 'VAT (20%)', '1298.9980', 5),
(5, 1, 'total', 'Total', '7829.9880', 9),
(6, 2, 'sub_total', 'Sub-Total', '2080.0000', 1),
(7, 2, 'shipping', 'Flat Shipping Rate', '5.0000', 3),
(8, 2, 'tax', 'Eco Tax (-2.00)', '4.0000', 5),
(9, 2, 'tax', 'VAT (20%)', '17.0000', 5),
(10, 2, 'total', 'Total', '2106.0000', 9),
(11, 3, 'sub_total', 'Sub-Total', '5345.0000', 1),
(12, 3, 'shipping', 'Flat Shipping Rate', '5.0000', 3),
(13, 3, 'tax', 'Eco Tax (-2.00)', '14.0000', 5),
(14, 3, 'tax', 'VAT (20%)', '670.0000', 5),
(15, 3, 'total', 'Total', '6034.0000', 9),
(16, 4, 'sub_total', 'Sub-Total', '4104.9900', 1),
(17, 4, 'shipping', 'Flat Shipping Rate', '5.0000', 3),
(18, 4, 'tax', 'Eco Tax (-2.00)', '26.0000', 5),
(19, 4, 'tax', 'VAT (20%)', '421.9980', 5),
(20, 4, 'total', 'Total', '4557.9880', 9),
(21, 5, 'sub_total', 'Sub-Total', '2178.9900', 1),
(22, 5, 'shipping', 'Flat Shipping Rate', '5.0000', 3),
(23, 5, 'tax', 'Eco Tax (-2.00)', '18.0000', 5),
(24, 5, 'tax', 'VAT (20%)', '436.7980', 5),
(25, 5, 'total', 'Total', '2638.7880', 9);

-- --------------------------------------------------------

--
-- Table structure for table `oc_order_voucher`
--

DROP TABLE IF EXISTS `oc_order_voucher`;
CREATE TABLE `oc_order_voucher` (
  `order_voucher_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `voucher_id` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `code` varchar(10) NOT NULL,
  `from_name` varchar(64) NOT NULL,
  `from_email` varchar(96) NOT NULL,
  `to_name` varchar(64) NOT NULL,
  `to_email` varchar(96) NOT NULL,
  `voucher_theme_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `amount` decimal(15,4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_product`
--

DROP TABLE IF EXISTS `oc_product`;
CREATE TABLE `oc_product` (
  `product_id` int(11) NOT NULL,
  `model` varchar(64) NOT NULL,
  `sku` varchar(64) NOT NULL,
  `upc` varchar(12) NOT NULL,
  `ean` varchar(14) NOT NULL,
  `jan` varchar(13) NOT NULL,
  `isbn` varchar(17) NOT NULL,
  `mpn` varchar(64) NOT NULL,
  `location` varchar(128) NOT NULL,
  `quantity` int(4) NOT NULL DEFAULT '0',
  `stock_status_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `manufacturer_id` int(11) NOT NULL,
  `shipping` tinyint(1) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `points` int(8) NOT NULL DEFAULT '0',
  `tax_class_id` int(11) NOT NULL,
  `date_available` date NOT NULL DEFAULT '0000-00-00',
  `weight` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `weight_class_id` int(11) NOT NULL DEFAULT '0',
  `length` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `width` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `height` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `length_class_id` int(11) NOT NULL DEFAULT '0',
  `subtract` tinyint(1) NOT NULL DEFAULT '1',
  `minimum` int(11) NOT NULL DEFAULT '1',
  `sort_order` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `viewed` int(5) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_product`
--

INSERT INTO `oc_product` (`product_id`, `model`, `sku`, `upc`, `ean`, `jan`, `isbn`, `mpn`, `location`, `quantity`, `stock_status_id`, `image`, `manufacturer_id`, `shipping`, `price`, `points`, `tax_class_id`, `date_available`, `weight`, `weight_class_id`, `length`, `width`, `height`, `length_class_id`, `subtract`, `minimum`, `sort_order`, `status`, `viewed`, `date_added`, `date_modified`) VALUES
(86, 'Book', '', '', '', '', '', '', '', 9999, 7, 'catalog/product/Book/8.jpg', 8, 1, '100.0000', 400, 9, '2009-02-04', '12.50000000', 1, '1.00000000', '2.00000000', '3.00000000', 1, 1, 2, 0, 1, 6, '2017-05-12 17:56:13', '2017-12-21 14:51:11'),
(87, 'Book', '', '', '', '', '', '', '', 9998, 7, 'catalog/product/Book/1.jpg', 9, 1, '100.0000', 0, 9, '2009-02-03', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 0, 1, 22, '2017-05-12 17:56:13', '2017-12-12 21:40:02'),
(88, 'Book', '', '', '', '', '', '', '', 9999, 7, 'catalog/product/Book/10.jpg', 7, 1, '60.0000', 400, 9, '2009-02-03', '1.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 0, 1, 0, 1, 3, '2017-05-12 17:56:13', '2017-12-19 13:32:41'),
(89, 'Book', '', '', '', '', '', '', '', 9997, 7, 'catalog/product/Book/11.jpg', 5, 1, '65.0000', 200, 9, '2009-02-03', '146.40000000', 2, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 0, 1, 28, '2017-05-12 17:56:14', '2017-12-19 13:33:33'),
(90, 'Book', '', '', '', '', '', '', '', 9998, 7, 'catalog/product/Book/12.jpg', 8, 1, '70.0000', 0, 9, '2009-02-03', '5.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 0, 1, 2, '2017-05-12 17:56:14', '2017-12-21 14:05:44'),
(91, 'Book', '', '', '', '', '', '', '', 9998, 7, 'catalog/product/Book/13.jpg', 10, 1, '1000.0000', 0, 9, '2009-02-03', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 2, 1, 1, 0, 1, 4, '2017-05-12 17:56:14', '2017-12-21 14:07:13'),
(92, 'Book', '', '', '', '', '', '', '', 9997, 7, 'catalog/product/Book/14.jpg', 8, 1, '75.0000', 0, 9, '2009-02-03', '10.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 0, 1, 1, '2017-05-12 17:56:14', '2017-12-21 14:08:26'),
(93, 'Book', '', '', '', '', '', '', 'test 2', 9997, 7, 'catalog/product/Book/15.jpg', 8, 1, '80.0000', 0, 9, '2009-02-08', '1.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 2, 1, 1, 0, 1, 1, '2017-05-12 17:56:14', '2017-12-21 14:39:31'),
(94, 'Book', '', '', '', '', '', '', '', 9998, 7, 'catalog/product/Book/16.jpg', 8, 0, '80.0000', 100, 9, '2009-02-03', '5.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 2, 1, 1, 0, 1, 1, '2017-05-12 17:56:14', '2017-12-21 14:41:08'),
(95, 'Book', '', '', '', '', '', '', '', 9999, 7, 'catalog/product/Book/17.jpg', 8, 1, '85.0000', 0, 9, '2009-02-03', '5.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 2, 1, 1, 0, 1, 0, '2017-05-12 17:56:14', '2017-12-21 14:42:30'),
(96, 'Book', '', '', '', '', '', '', '', 9999, 7, 'catalog/product/Book/18.jpg', 8, 1, '95.0000', 0, 9, '2009-02-03', '5.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 0, 1, 0, '2017-05-12 17:56:14', '2017-12-21 14:43:29'),
(97, 'Book', '', '', '', '', '', '', '', 9998, 7, 'catalog/product/Book/2.jpg', 8, 0, '500.0000', 0, 9, '2009-02-03', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 2, 1, 1, 0, 1, 0, '2017-05-12 17:56:14', '2017-12-21 14:44:15'),
(98, 'Book', '', '', '', '', '', '', '', 9998, 7, 'catalog/product/Book/3.jpg', 7, 1, '199.9900', 0, 9, '2011-04-25', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 2, '2017-05-12 17:56:14', '2017-12-21 14:46:08'),
(99, 'Book', '', '', '', '', '', '', '', 9998, 7, 'catalog/product/Book/4.jpg', 8, 1, '1000.0000', 0, 9, '2009-02-03', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 2, 1, 1, 0, 1, 2, '2017-05-12 17:56:14', '2017-12-21 14:47:06'),
(100, 'Book', '', '', '', '', '', '', '', 9999, 7, 'catalog/product/Book/5.jpg', 8, 1, '2000.0000', 0, 0, '2009-02-03', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 2, 1, 1, 0, 1, 0, '2017-05-12 17:56:14', '2017-12-21 14:48:15'),
(101, 'Book', '', '', '', '', '', '', '', 9999, 7, 'catalog/product/Book/6.jpg', 0, 1, '80.0000', 0, 9, '2009-02-03', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 3, 1, 1, 0, 1, 5, '2017-05-12 17:56:14', '2017-12-21 14:49:18'),
(102, 'Book', '', '', '', '', '', '', '', 9999, 7, 'catalog/product/Book/7.jpg', 6, 1, '279.9900', 0, 9, '2009-02-03', '133.00000000', 2, '0.00000000', '0.00000000', '0.00000000', 3, 1, 1, 0, 1, 1, '2017-05-12 17:56:14', '2017-12-21 14:50:22'),
(103, 'Book', '', '', '', '', '', '', '', 9998, 7, 'catalog/product/Book/9.jpg', 8, 1, '200.0000', 0, 9, '2009-02-03', '5.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 2, 1, 1, 0, 1, 9, '2017-05-12 17:56:14', '2017-12-21 14:52:00');

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_attribute`
--

DROP TABLE IF EXISTS `oc_product_attribute`;
CREATE TABLE `oc_product_attribute` (
  `product_id` int(11) NOT NULL,
  `attribute_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `text` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_product_attribute`
--

INSERT INTO `oc_product_attribute` (`product_id`, `attribute_id`, `language_id`, `text`) VALUES
(88, 2, 1, '4'),
(88, 4, 1, '16GB'),
(97, 4, 9, '8gb'),
(97, 2, 9, '1'),
(86, 3, 1, '100mhz'),
(97, 4, 1, '8gb'),
(88, 2, 9, '4'),
(88, 4, 9, '16GB'),
(86, 3, 9, '100mhz'),
(97, 2, 1, '1');

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_description`
--

DROP TABLE IF EXISTS `oc_product_description`;
CREATE TABLE `oc_product_description` (
  `product_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `tag` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_product_description`
--

INSERT INTO `oc_product_description` (`product_id`, `language_id`, `name`, `description`, `tag`, `meta_title`, `meta_description`, `meta_keyword`) VALUES
(86, 9, 'Vargus All-Weather Tanks', '&lt;p&gt;\r\n	&lt;font face=&quot;helvetica,geneva,arial&quot; size=&quot;2&quot;&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;The 30-inch Apple Cinema HD Display delivers an amazing 2560 x 1600 pixel resolution. Designed specifically for the creative professional, this display provides more space for easier access to all the tools and palettes needed to edit, format and composite your work. Combine this display with a Mac Pro, MacBook Pro, or PowerMac G5 and there\'s no limit to what you can achieve. &lt;br&gt;\r\n	&lt;br&gt;\r\n	&lt;/font&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;The Cinema HD features an active-matrix liquid crystal display that produces flicker-free images that deliver twice the brightness, twice the sharpness and twice the contrast ratio of a typical CRT display. Unlike other flat panels, it\'s designed with a pure digital interface to deliver distortion-free images that never need adjusting. With over 4 million digital pixels, the display is uniquely suited for scientific and technical applications such as visualizing molecular structures or analyzing geological data. &lt;br&gt;\r\n	&lt;br&gt;\r\n	&lt;/font&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;Offering accurate, brilliant color performance, the Cinema HD delivers up to 16.7 million colors across a wide gamut allowing you to see subtle nuances between colors from soft pastels to rich jewel tones. A wide viewing angle ensures uniform color from edge to edge. Apple\'s ColorSync technology allows you to create custom profiles to maintain consistent color onscreen and in print. The result: You can confidently use this display in all your color-critical applications. &lt;br&gt;\r\n	&lt;br&gt;\r\n	&lt;/font&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;Housed in a new aluminum design, the display has a very thin bezel that enhances visual accuracy. Each display features two FireWire 400 ports and two USB 2.0 ports, making attachment of desktop peripherals, such as iSight, iPod, digital and still cameras, hard drives, printers and scanners, even more accessible and convenient. Taking advantage of the much thinner and lighter footprint of an LCD, the new displays support the VESA (Video Electronics Standards Association) mounting interface standard. Customers with the optional Cinema Display VESA Mount Adapter kit gain the flexibility to mount their display in locations most appropriate for their work environment. &lt;br&gt;\r\n	&lt;br&gt;\r\n	&lt;/font&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;The Cinema HD features a single cable design with elegant breakout for the USB 2.0, FireWire 400 and a pure digital connection using the industry standard Digital Video Interface (DVI) interface. The DVI connection allows for a direct pure-digital connection.&lt;br&gt;\r\n	&lt;/font&gt;&lt;/font&gt;&lt;/p&gt;\r\n&lt;h3&gt;\r\n	Features:&lt;/h3&gt;\r\n&lt;p&gt;\r\n	Unrivaled display performance&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		30-inch (viewable) active-matrix liquid crystal display provides breathtaking image quality and vivid, richly saturated color.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Support for 2560-by-1600 pixel resolution for display of high definition still and video imagery.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Wide-format design for simultaneous display of two full pages of text and graphics.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Industry standard DVI connector for direct attachment to Mac- and Windows-based desktops and notebooks&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Incredibly wide (170 degree) horizontal and vertical viewing angle for maximum visibility and color performance.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Lightning-fast pixel response for full-motion digital video playback.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Support for 16.7 million saturated colors, for use in all graphics-intensive applications.&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	Simple setup and operation&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Single cable with elegant breakout for connection to DVI, USB and FireWire ports&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Built-in two-port USB 2.0 hub for easy connection of desktop peripheral devices.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Two FireWire 400 ports to support iSight and other desktop peripherals&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	Sleek, elegant design&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Huge virtual workspace, very small footprint.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Narrow Bezel design to minimize visual impact of using dual displays&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Unique hinge design for effortless adjustment&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Support for VESA mounting solutions (Apple Cinema Display VESA Mount Adapter sold separately)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;h3&gt;\r\n	Technical specifications&lt;/h3&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Screen size (diagonal viewable image size)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Apple Cinema HD Display: 30 inches (29.7-inch viewable)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Screen type&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Thin film transistor (TFT) active-matrix liquid crystal display (AMLCD)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Resolutions&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		2560 x 1600 pixels (optimum resolution)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		2048 x 1280&lt;/li&gt;\r\n	&lt;li&gt;\r\n		1920 x 1200&lt;/li&gt;\r\n	&lt;li&gt;\r\n		1280 x 800&lt;/li&gt;\r\n	&lt;li&gt;\r\n		1024 x 640&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Display colors (maximum)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		16.7 million&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Viewing angle (typical)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		170° horizontal; 170° vertical&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Brightness (typical)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		30-inch Cinema HD Display: 400 cd/m2&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Contrast ratio (typical)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		700:1&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Response time (typical)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		16 ms&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Pixel pitch&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		30-inch Cinema HD Display: 0.250 mm&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Screen treatment&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Antiglare hardcoat&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;User controls (hardware and software)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Display Power,&lt;/li&gt;\r\n	&lt;li&gt;\r\n		System sleep, wake&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Brightness&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Monitor tilt&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Connectors and cables&lt;/b&gt;&lt;br&gt;\r\n	Cable&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		DVI (Digital Visual Interface)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		FireWire 400&lt;/li&gt;\r\n	&lt;li&gt;\r\n		USB 2.0&lt;/li&gt;\r\n	&lt;li&gt;\r\n		DC power (24 V)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	Connectors&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Two-port, self-powered USB 2.0 hub&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Two FireWire 400 ports&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Kensington security port&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;VESA mount adapter&lt;/b&gt;&lt;br&gt;\r\n	Requires optional Cinema Display VESA Mount Adapter (M9649G/A)&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Compatible with VESA FDMI (MIS-D, 100, C) compliant mounting solutions&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Electrical requirements&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Input voltage: 100-240 VAC 50-60Hz&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Maximum power when operating: 150W&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Energy saver mode: 3W or less&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Environmental requirements&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Operating temperature: 50° to 95° F (10° to 35° C)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Storage temperature: -40° to 116° F (-40° to 47° C)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Operating humidity: 20% to 80% noncondensing&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Maximum operating altitude: 10,000 feet&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Agency approvals&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		FCC Part 15 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		EN55022 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		EN55024&lt;/li&gt;\r\n	&lt;li&gt;\r\n		VCCI Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		AS/NZS 3548 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		CNS 13438 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		ICES-003 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		ISO 13406 part 2&lt;/li&gt;\r\n	&lt;li&gt;\r\n		MPR II&lt;/li&gt;\r\n	&lt;li&gt;\r\n		IEC 60950&lt;/li&gt;\r\n	&lt;li&gt;\r\n		UL 60950&lt;/li&gt;\r\n	&lt;li&gt;\r\n		CSA 60950&lt;/li&gt;\r\n	&lt;li&gt;\r\n		EN60950&lt;/li&gt;\r\n	&lt;li&gt;\r\n		ENERGY STAR&lt;/li&gt;\r\n	&lt;li&gt;\r\n		TCO \'03&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Size and weight&lt;/b&gt;&lt;br&gt;\r\n	30-inch Apple Cinema HD Display&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Height: 21.3 inches (54.3 cm)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Width: 27.2 inches (68.8 cm)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Depth: 8.46 inches (21.5 cm)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Weight: 27.5 pounds (12.5 kg)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;System Requirements&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Mac Pro, all graphic options&lt;/li&gt;\r\n	&lt;li&gt;\r\n		MacBook Pro&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Power Mac G5 (PCI-X) with ATI Radeon 9650 or better or NVIDIA GeForce 6800 GT DDL or better&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Power Mac G5 (PCI Express), all graphics options&lt;/li&gt;\r\n	&lt;li&gt;\r\n		PowerBook G4 with dual-link DVI support&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Windows PC and graphics card that supports DVI ports with dual-link digital bandwidth and VESA DDC standard for plug-and-play setup&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', '', 'Vargus All-Weather Tanks', '', ''),
(87, 9, 'Beginner\'s Yogas', '&lt;p&gt;\r\n	Canon\'s press material for the EOS 5D states that it \'defines (a) new D-SLR category\', while we\'re not typically too concerned with marketing talk this particular statement is clearly pretty accurate. The EOS 5D is unlike any previous digital SLR in that it combines a full-frame (35 mm sized) high resolution sensor (12.8 megapixels) with a relatively compact body (slightly larger than the EOS 20D, although in your hand it feels noticeably \'chunkier\'). The EOS 5D is aimed to slot in between the EOS 20D and the EOS-1D professional digital SLR\'s, an important difference when compared to the latter is that the EOS 5D doesn\'t have any environmental seals. While Canon don\'t specifically refer to the EOS 5D as a \'professional\' digital SLR it will have obvious appeal to professionals who want a high quality digital SLR in a body lighter than the EOS-1D. It will also no doubt appeal to current EOS 20D owners (although lets hope they\'ve not bought too many EF-S lenses...) äë&lt;/p&gt;\r\n', '', 'Beginner\'s Yoga1', '', ''),
(88, 9, 'Bess Yoga Shorts', '&lt;p&gt;\r\n	Stop your co-workers in their tracks with the stunning new 30-inch diagonal HP LP3065 Flat Panel Monitor. This flagship monitor features best-in-class performance and presentation features on a huge wide-aspect screen while letting you work as comfortably as possible - you might even forget you&amp;#39;re at the office&lt;/p&gt;\r\n', '', 'Bess Yoga Short1', '', ''),
(89, 9, 'Chaz Kangeroo Hoodies', '&lt;p&gt;\r\n	HTC Touch - in High Definition. Watch music videos and streaming content in awe-inspiring high definition clarity for a mobile experience you never thought possible. Seductively sleek, the HTC Touch HD provides the next generation of mobile functionality, all at a simple touch. Fully integrated with Windows Mobile Professional 6.1, ultrafast 3.5G, GPS, 5MP camera, plus lots more - all delivered on a breathtakingly crisp 3.8&amp;quot; WVGA touchscreen - you can take control of your mobile world with the HTC Touch HD.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Features&lt;/strong&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Processor Qualcomm&amp;reg; MSM 7201A&amp;trade; 528 MHz&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Windows Mobile&amp;reg; 6.1 Professional Operating System&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Memory: 512 MB ROM, 288 MB RAM&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Dimensions: 115 mm x 62.8 mm x 12 mm / 146.4 grams&lt;/li&gt;\r\n	&lt;li&gt;\r\n		3.8-inch TFT-LCD flat touch-sensitive screen with 480 x 800 WVGA resolution&lt;/li&gt;\r\n	&lt;li&gt;\r\n		HSDPA/WCDMA: Europe/Asia: 900/2100 MHz; Up to 2 Mbps up-link and 7.2 Mbps down-link speeds&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Quad-band GSM/GPRS/EDGE: Europe/Asia: 850/900/1800/1900 MHz (Band frequency, HSUPA availability, and data speed are operator dependent.)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Device Control via HTC TouchFLO&amp;trade; 3D &amp;amp; Touch-sensitive front panel buttons&lt;/li&gt;\r\n	&lt;li&gt;\r\n		GPS and A-GPS ready&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Bluetooth&amp;reg; 2.0 with Enhanced Data Rate and A2DP for wireless stereo headsets&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Wi-Fi&amp;reg;: IEEE 802.11 b/g&lt;/li&gt;\r\n	&lt;li&gt;\r\n		HTC ExtUSB&amp;trade; (11-pin mini-USB 2.0)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		5 megapixel color camera with auto focus&lt;/li&gt;\r\n	&lt;li&gt;\r\n		VGA CMOS color camera&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Built-in 3.5 mm audio jack, microphone, speaker, and FM radio&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Ring tone formats: AAC, AAC+, eAAC+, AMR-NB, AMR-WB, QCP, MP3, WMA, WAV&lt;/li&gt;\r\n	&lt;li&gt;\r\n		40 polyphonic and standard MIDI format 0 and 1 (SMF)/SP MIDI&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Rechargeable Lithium-ion or Lithium-ion polymer 1350 mAh battery&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Expansion Slot: microSD&amp;trade; memory card (SD 2.0 compatible)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		AC Adapter Voltage range/frequency: 100 ~ 240V AC, 50/60 Hz DC output: 5V and 1A&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Special Features: FM Radio, G-Sensor&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', '', 'Chaz Kangeroo Hoodies', '', ''),
(90, 9, 'Compete Track Totes', '&lt;div&gt;\r\n	Just when you thought iMac had everything, now there´s even more. More powerful Intel Core 2 Duo processors. And more memory standard. Combine this with Mac OS X Leopard and iLife ´08, and it´s more all-in-one than ever. iMac packs amazing performance into a stunningly slim space.&lt;/div&gt;\r\n', '', 'Compete Track Totes', '', ''),
(91, 9, 'Crown Summit Backpacks', '&lt;div&gt;\r\n	Unprecedented power. The next generation of processing technology has arrived. Built into the newest VAIO notebooks lies Intel&amp;#39;s latest, most powerful innovation yet: Intel&amp;reg; Centrino&amp;reg; 2 processor technology. Boasting incredible speed, expanded wireless connectivity, enhanced multimedia support and greater energy efficiency, all the high-performance essentials are seamlessly combined into a single chip.&lt;/div&gt;\r\n', '', 'Crown Summit Backpacks', '', ''),
(92, 9, 'Driven Backpacks', '&lt;p class=&quot;intro&quot;&gt;\r\n	iPhone is a revolutionary new mobile phone that allows you to make a call by simply tapping a name or number in your address book, a favorites list, or a call log. It also automatically syncs all your contacts from a PC, Mac, or Internet service. And it lets you select and listen to voicemail messages in whatever order you want just like email.&lt;/p&gt;\r\n', '', 'Driven Backpacks', '', ''),
(94, 9, 'Fusion Backpacks', '&lt;div&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Video in your pocket.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Its the small iPod with one very big idea: video. The worlds most popular music player now lets you enjoy movies, TV shows, and more on a two-inch display thats 65% brighter than before.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Cover Flow.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Browse through your music collection by flipping through album art. Select an album to turn it over and see the track list.&lt;strong&gt;&amp;nbsp;&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Enhanced interface.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Experience a whole new way to browse and view your music and video.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Sleek and colorful.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		With an anodized aluminum and polished stainless steel enclosure and a choice of five colors, iPod nano is dressed to impress.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;iTunes.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Available as a free download, iTunes makes it easy to browse and buy millions of songs, movies, TV shows, audiobooks, and games and download free podcasts all at the iTunes Store. And you can import your own music, manage your whole media library, and sync your iPod or iPhone with ease.&lt;/p&gt;\r\n&lt;/div&gt;\r\n', '', 'Fusion Backpacks', '', ''),
(96, 9, 'Karmen Yoga Pants', '&lt;p&gt;\r\n	&lt;strong&gt;Revolutionary multi-touch interface.&lt;/strong&gt;&lt;br /&gt;\r\n	iPod touch features the same multi-touch screen technology as iPhone. Pinch to zoom in on a photo. Scroll through your songs and videos with a flick. Flip through your library by album artwork with Cover Flow.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Gorgeous 3.5-inch widescreen display.&lt;/strong&gt;&lt;br /&gt;\r\n	Watch your movies, TV shows, and photos come alive with bright, vivid color on the 320-by-480-pixel display.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Music downloads straight from iTunes.&lt;/strong&gt;&lt;br /&gt;\r\n	Shop the iTunes Wi-Fi Music Store from anywhere with Wi-Fi.1 Browse or search to find the music youre looking for, preview it, and buy it with just a tap.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Surf the web with Wi-Fi.&lt;/strong&gt;&lt;br /&gt;\r\n	Browse the web using Safari and watch YouTube videos on the first iPod with Wi-Fi built in&lt;br /&gt;\r\n	&amp;nbsp;&lt;/p&gt;\r\n', '', 'Karmen Yoga Pants', '', ''),
(97, 9, 'Maxima Drawstring Shorts', '&lt;div&gt;\r\n	&lt;p&gt;\r\n		&lt;b&gt;Intel Core 2 Duo processor&lt;/b&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Powered by an Intel Core 2 Duo processor at speeds up to 2.16GHz, the new MacBook is the fastest ever.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;b&gt;1GB memory, larger hard drives&lt;/b&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		The new MacBook now comes with 1GB of memory standard and larger hard drives for the entire line perfect for running more of your favorite applications and storing growing media collections.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;b&gt;Sleek, 1.08-inch-thin design&lt;/b&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		MacBook makes it easy to hit the road thanks to its tough polycarbonate case, built-in wireless technologies, and innovative MagSafe Power Adapter that releases automatically if someone accidentally trips on the cord.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;b&gt;Built-in iSight camera&lt;/b&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Right out of the box, you can have a video chat with friends or family,2 record a video at your desk, or take fun pictures with Photo Booth&lt;/p&gt;\r\n&lt;/div&gt;\r\n', '', 'Maxima Drawstring Shorts', '', ''),
(99, 9, 'Rival Field Messengers', '&lt;div&gt;\r\n	MacBook Air is ultrathin, ultraportable, and ultra unlike anything else. But you don&amp;rsquo;t lose inches and pounds overnight. It&amp;rsquo;s the result of rethinking conventions. Of multiple wireless innovations. And of breakthrough design. With MacBook Air, mobile computing suddenly has a new standard.&lt;/div&gt;\r\n', '', 'Rival Field Messengers', '', ''),
(100, 9, 'Savvy Shoulder Totes', '&lt;div class=&quot;cpt_product_description &quot;&gt;\r\n	&lt;div&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Latest Intel mobile architecture&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Powered by the most advanced mobile processors from Intel, the new Core 2 Duo MacBook Pro is over 50% faster than the original Core Duo MacBook Pro and now supports up to 4GB of RAM.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Leading-edge graphics&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			The NVIDIA GeForce 8600M GT delivers exceptional graphics processing power. For the ultimate creative canvas, you can even configure the 17-inch model with a 1920-by-1200 resolution display.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Designed for life on the road&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Innovations such as a magnetic power connection and an illuminated keyboard with ambient light sensor put the MacBook Pro in a class by itself.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Connect. Create. Communicate.&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Quickly set up a video conference with the built-in iSight camera. Control presentations and media from up to 30 feet away with the included Apple Remote. Connect to high-bandwidth peripherals with FireWire 800 and DVI.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Next-generation wireless&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Featuring 802.11n wireless technology, the MacBook Pro delivers up to five times the performance and up to twice the range of previous-generation technologies.&lt;/p&gt;\r\n	&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;!-- cpt_container_end --&gt;', '', 'Savvy Shoulder Totes', '', ''),
(101, 9, 'Sprite Yoga Companion Kits', '&lt;div class=&quot;cpt_product_description &quot;&gt;\r\n	&lt;div&gt;\r\n		Engineered with pro-level features and performance, the 12.3-effective-megapixel D300 combines brand new technologies with advanced features inherited from Nikon&amp;#39;s newly announced D3 professional digital SLR camera to offer serious photographers remarkable performance combined with agility.&lt;br /&gt;\r\n		&lt;br /&gt;\r\n		Similar to the D3, the D300 features Nikon&amp;#39;s exclusive EXPEED Image Processing System that is central to driving the speed and processing power needed for many of the camera&amp;#39;s new features. The D300 features a new 51-point autofocus system with Nikon&amp;#39;s 3D Focus Tracking feature and two new LiveView shooting modes that allow users to frame a photograph using the camera&amp;#39;s high-resolution LCD monitor. The D300 shares a similar Scene Recognition System as is found in the D3; it promises to greatly enhance the accuracy of autofocus, autoexposure, and auto white balance by recognizing the subject or scene being photographed and applying this information to the calculations for the three functions.&lt;br /&gt;\r\n		&lt;br /&gt;\r\n		The D300 reacts with lightning speed, powering up in a mere 0.13 seconds and shooting with an imperceptible 45-millisecond shutter release lag time. The D300 is capable of shooting at a rapid six frames per second and can go as fast as eight frames per second when using the optional MB-D10 multi-power battery pack. In continuous bursts, the D300 can shoot up to 100 shots at full 12.3-megapixel resolution. (NORMAL-LARGE image setting, using a SanDisk Extreme IV 1GB CompactFlash card.)&lt;br /&gt;\r\n		&lt;br /&gt;\r\n		The D300 incorporates a range of innovative technologies and features that will significantly improve the accuracy, control, and performance photographers can get from their equipment. Its new Scene Recognition System advances the use of Nikon&amp;#39;s acclaimed 1,005-segment sensor to recognize colors and light patterns that help the camera determine the subject and the type of scene being photographed before a picture is taken. This information is used to improve the accuracy of autofocus, autoexposure, and auto white balance functions in the D300. For example, the camera can track moving subjects better and by identifying them, it can also automatically select focus points faster and with greater accuracy. It can also analyze highlights and more accurately determine exposure, as well as infer light sources to deliver more accurate white balance detection.&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;!-- cpt_container_end --&gt;', '', 'Sprite Yoga Companion Kits', '', ''),
(93, 9, 'Endeavor Daytrip Backpacks', '&lt;div class=&quot;cpt_product_description &quot;&gt;\r\n	&lt;div&gt;\r\n		&lt;p&gt;\r\n			&lt;strong&gt;More room to move.&lt;/strong&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			With 80GB or 160GB of storage and up to 40 hours of battery life, the new iPod classic lets you enjoy up to 40,000 songs or up to 200 hours of video or any combination wherever you go.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;strong&gt;Cover Flow.&lt;/strong&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Browse through your music collection by flipping through album art. Select an album to turn it over and see the track list.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;strong&gt;Enhanced interface.&lt;/strong&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Experience a whole new way to browse and view your music and video.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;strong&gt;Sleeker design.&lt;/strong&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Beautiful, durable, and sleeker than ever, iPod classic now features an anodized aluminum and polished stainless steel enclosure with rounded edges.&lt;/p&gt;\r\n	&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;!-- cpt_container_end --&gt;', '', 'Endeavor Daytrip Backpacks', '', ''),
(95, 9, 'Joust Duffle Bags', '&lt;div&gt;\r\n	&lt;strong&gt;Born to be worn.&lt;/strong&gt;\r\n	&lt;p&gt;\r\n		Clip on the worlds most wearable music player and take up to 240 songs with you anywhere. Choose from five colors including four new hues to make your musical fashion statement.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Random meets rhythm.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		With iTunes autofill, iPod shuffle can deliver a new musical experience every time you sync. For more randomness, you can shuffle songs during playback with the slide of a switch.&lt;/p&gt;\r\n	&lt;strong&gt;Everything is easy.&lt;/strong&gt;\r\n	&lt;p&gt;\r\n		Charge and sync with the included USB dock. Operate the iPod shuffle controls with one hand. Enjoy up to 12 hours straight of skip-free music playback.&lt;/p&gt;\r\n&lt;/div&gt;\r\n', '', 'Joust Duffle Bags', '', ''),
(98, 9, 'Radiant Tees', '&lt;p&gt;\r\n	Samsung Galaxy Tab 10.1, is the world&amp;rsquo;s thinnest tablet, measuring 8.6 mm thickness, running with Android 3.0 Honeycomb OS on a 1GHz dual-core Tegra 2 processor, similar to its younger brother Samsung Galaxy Tab 8.9.&lt;/p&gt;\r\n&lt;p&gt;\r\n	Samsung Galaxy Tab 10.1 gives pure Android 3.0 experience, adding its new TouchWiz UX or TouchWiz 4.0 &amp;ndash; includes a live panel, which lets you to customize with different content, such as your pictures, bookmarks, and social feeds, sporting a 10.1 inches WXGA capacitive touch screen with 1280 x 800 pixels of resolution, equipped with 3 megapixel rear camera with LED flash and a 2 megapixel front camera, HSPA+ connectivity up to 21Mbps, 720p HD video recording capability, 1080p HD playback, DLNA support, Bluetooth 2.1, USB 2.0, gyroscope, Wi-Fi 802.11 a/b/g/n, micro-SD slot, 3.5mm headphone jack, and SIM slot, including the Samsung Stick &amp;ndash; a Bluetooth microphone that can be carried in a pocket like a pen and sound dock with powered subwoofer.&lt;/p&gt;\r\n&lt;p&gt;\r\n	Samsung Galaxy Tab 10.1 will come in 16GB / 32GB / 64GB verities and pre-loaded with Social Hub, Reader&amp;rsquo;s Hub, Music Hub and Samsung Mini Apps Tray &amp;ndash; which gives you access to more commonly used apps to help ease multitasking and it is capable of Adobe Flash Player 10.2, powered by 6860mAh battery that gives you 10hours of video-playback time.&amp;nbsp;&amp;auml;&amp;ouml;&lt;/p&gt;\r\n', '', 'Radiant Tees', '', ''),
(102, 9, 'Strive Shoulder Packs', '&lt;p&gt;\r\n	Redefine your workday with the Palm Treo Pro smartphone. Perfectly balanced, you can respond to business and personal email, stay on top of appointments and contacts, and use Wi-Fi or GPS when you&amp;rsquo;re out and about. Then watch a video on YouTube, catch up with news and sports on the web, or listen to a few songs. Balance your work and play the way you like it, with the Palm Treo Pro.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Features&lt;/strong&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Windows Mobile&amp;reg; 6.1 Professional Edition&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Qualcomm&amp;reg; MSM7201 400MHz Processor&lt;/li&gt;\r\n	&lt;li&gt;\r\n		320x320 transflective colour TFT touchscreen&lt;/li&gt;\r\n	&lt;li&gt;\r\n		HSDPA/UMTS/EDGE/GPRS/GSM radio&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Tri-band UMTS &amp;mdash; 850MHz, 1900MHz, 2100MHz&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Quad-band GSM &amp;mdash; 850/900/1800/1900&lt;/li&gt;\r\n	&lt;li&gt;\r\n		802.11b/g with WPA, WPA2, and 801.1x authentication&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Built-in GPS&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Bluetooth Version: 2.0 + Enhanced Data Rate&lt;/li&gt;\r\n	&lt;li&gt;\r\n		256MB storage (100MB user available), 128MB RAM&lt;/li&gt;\r\n	&lt;li&gt;\r\n		2.0 megapixel camera, up to 8x digital zoom and video capture&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Removable, rechargeable 1500mAh lithium-ion battery&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Up to 5.0 hours talk time and up to 250 hours standby&lt;/li&gt;\r\n	&lt;li&gt;\r\n		MicroSDHC card expansion (up to 32GB supported)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		MicroUSB 2.0 for synchronization and charging&lt;/li&gt;\r\n	&lt;li&gt;\r\n		3.5mm stereo headset jack&lt;/li&gt;\r\n	&lt;li&gt;\r\n		60mm (W) x 114mm (L) x 13.5mm (D) / 133g&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', '', 'Strive Shoulder Packs', '', ''),
(103, 9, 'Voyage Yoga Bags', '&lt;div&gt;\r\n	Imagine the advantages of going big without slowing down. The big 19&amp;quot; 941BW monitor combines wide aspect ratio with fast pixel response time, for bigger images, more room to work and crisp motion. In addition, the exclusive MagicBright 2, MagicColor and MagicTune technologies help deliver the ideal image in every situation, while sleek, narrow bezels and adjustable stands deliver style just the way you want it. With the Samsung 941BW widescreen analog/digital LCD monitor, it&amp;#39;s not hard to imagine.&lt;/div&gt;\r\n', '', 'Voyage Yoga Bags', '', ''),
(86, 1, 'Vargus All-Weather Tanks', '&lt;p&gt;\r\n	&lt;font face=&quot;helvetica,geneva,arial&quot; size=&quot;2&quot;&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;The 30-inch Apple Cinema HD Display delivers an amazing 2560 x 1600 pixel resolution. Designed specifically for the creative professional, this display provides more space for easier access to all the tools and palettes needed to edit, format and composite your work. Combine this display with a Mac Pro, MacBook Pro, or PowerMac G5 and there\'s no limit to what you can achieve. &lt;br&gt;\r\n	&lt;br&gt;\r\n	&lt;/font&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;The Cinema HD features an active-matrix liquid crystal display that produces flicker-free images that deliver twice the brightness, twice the sharpness and twice the contrast ratio of a typical CRT display. Unlike other flat panels, it\'s designed with a pure digital interface to deliver distortion-free images that never need adjusting. With over 4 million digital pixels, the display is uniquely suited for scientific and technical applications such as visualizing molecular structures or analyzing geological data. &lt;br&gt;\r\n	&lt;br&gt;\r\n	&lt;/font&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;Offering accurate, brilliant color performance, the Cinema HD delivers up to 16.7 million colors across a wide gamut allowing you to see subtle nuances between colors from soft pastels to rich jewel tones. A wide viewing angle ensures uniform color from edge to edge. Apple\'s ColorSync technology allows you to create custom profiles to maintain consistent color onscreen and in print. The result: You can confidently use this display in all your color-critical applications. &lt;br&gt;\r\n	&lt;br&gt;\r\n	&lt;/font&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;Housed in a new aluminum design, the display has a very thin bezel that enhances visual accuracy. Each display features two FireWire 400 ports and two USB 2.0 ports, making attachment of desktop peripherals, such as iSight, iPod, digital and still cameras, hard drives, printers and scanners, even more accessible and convenient. Taking advantage of the much thinner and lighter footprint of an LCD, the new displays support the VESA (Video Electronics Standards Association) mounting interface standard. Customers with the optional Cinema Display VESA Mount Adapter kit gain the flexibility to mount their display in locations most appropriate for their work environment. &lt;br&gt;\r\n	&lt;br&gt;\r\n	&lt;/font&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;The Cinema HD features a single cable design with elegant breakout for the USB 2.0, FireWire 400 and a pure digital connection using the industry standard Digital Video Interface (DVI) interface. The DVI connection allows for a direct pure-digital connection.&lt;br&gt;\r\n	&lt;/font&gt;&lt;/font&gt;&lt;/p&gt;\r\n&lt;h3&gt;\r\n	Features:&lt;/h3&gt;\r\n&lt;p&gt;\r\n	Unrivaled display performance&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		30-inch (viewable) active-matrix liquid crystal display provides breathtaking image quality and vivid, richly saturated color.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Support for 2560-by-1600 pixel resolution for display of high definition still and video imagery.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Wide-format design for simultaneous display of two full pages of text and graphics.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Industry standard DVI connector for direct attachment to Mac- and Windows-based desktops and notebooks&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Incredibly wide (170 degree) horizontal and vertical viewing angle for maximum visibility and color performance.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Lightning-fast pixel response for full-motion digital video playback.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Support for 16.7 million saturated colors, for use in all graphics-intensive applications.&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	Simple setup and operation&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Single cable with elegant breakout for connection to DVI, USB and FireWire ports&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Built-in two-port USB 2.0 hub for easy connection of desktop peripheral devices.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Two FireWire 400 ports to support iSight and other desktop peripherals&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	Sleek, elegant design&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Huge virtual workspace, very small footprint.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Narrow Bezel design to minimize visual impact of using dual displays&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Unique hinge design for effortless adjustment&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Support for VESA mounting solutions (Apple Cinema Display VESA Mount Adapter sold separately)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;h3&gt;\r\n	Technical specifications&lt;/h3&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Screen size (diagonal viewable image size)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Apple Cinema HD Display: 30 inches (29.7-inch viewable)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Screen type&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Thin film transistor (TFT) active-matrix liquid crystal display (AMLCD)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Resolutions&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		2560 x 1600 pixels (optimum resolution)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		2048 x 1280&lt;/li&gt;\r\n	&lt;li&gt;\r\n		1920 x 1200&lt;/li&gt;\r\n	&lt;li&gt;\r\n		1280 x 800&lt;/li&gt;\r\n	&lt;li&gt;\r\n		1024 x 640&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Display colors (maximum)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		16.7 million&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Viewing angle (typical)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		170° horizontal; 170° vertical&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Brightness (typical)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		30-inch Cinema HD Display: 400 cd/m2&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Contrast ratio (typical)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		700:1&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Response time (typical)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		16 ms&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Pixel pitch&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		30-inch Cinema HD Display: 0.250 mm&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Screen treatment&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Antiglare hardcoat&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;User controls (hardware and software)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Display Power,&lt;/li&gt;\r\n	&lt;li&gt;\r\n		System sleep, wake&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Brightness&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Monitor tilt&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Connectors and cables&lt;/b&gt;&lt;br&gt;\r\n	Cable&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		DVI (Digital Visual Interface)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		FireWire 400&lt;/li&gt;\r\n	&lt;li&gt;\r\n		USB 2.0&lt;/li&gt;\r\n	&lt;li&gt;\r\n		DC power (24 V)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	Connectors&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Two-port, self-powered USB 2.0 hub&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Two FireWire 400 ports&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Kensington security port&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;VESA mount adapter&lt;/b&gt;&lt;br&gt;\r\n	Requires optional Cinema Display VESA Mount Adapter (M9649G/A)&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Compatible with VESA FDMI (MIS-D, 100, C) compliant mounting solutions&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Electrical requirements&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Input voltage: 100-240 VAC 50-60Hz&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Maximum power when operating: 150W&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Energy saver mode: 3W or less&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Environmental requirements&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Operating temperature: 50° to 95° F (10° to 35° C)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Storage temperature: -40° to 116° F (-40° to 47° C)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Operating humidity: 20% to 80% noncondensing&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Maximum operating altitude: 10,000 feet&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Agency approvals&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		FCC Part 15 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		EN55022 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		EN55024&lt;/li&gt;\r\n	&lt;li&gt;\r\n		VCCI Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		AS/NZS 3548 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		CNS 13438 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		ICES-003 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		ISO 13406 part 2&lt;/li&gt;\r\n	&lt;li&gt;\r\n		MPR II&lt;/li&gt;\r\n	&lt;li&gt;\r\n		IEC 60950&lt;/li&gt;\r\n	&lt;li&gt;\r\n		UL 60950&lt;/li&gt;\r\n	&lt;li&gt;\r\n		CSA 60950&lt;/li&gt;\r\n	&lt;li&gt;\r\n		EN60950&lt;/li&gt;\r\n	&lt;li&gt;\r\n		ENERGY STAR&lt;/li&gt;\r\n	&lt;li&gt;\r\n		TCO \'03&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Size and weight&lt;/b&gt;&lt;br&gt;\r\n	30-inch Apple Cinema HD Display&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Height: 21.3 inches (54.3 cm)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Width: 27.2 inches (68.8 cm)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Depth: 8.46 inches (21.5 cm)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Weight: 27.5 pounds (12.5 kg)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;System Requirements&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Mac Pro, all graphic options&lt;/li&gt;\r\n	&lt;li&gt;\r\n		MacBook Pro&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Power Mac G5 (PCI-X) with ATI Radeon 9650 or better or NVIDIA GeForce 6800 GT DDL or better&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Power Mac G5 (PCI Express), all graphics options&lt;/li&gt;\r\n	&lt;li&gt;\r\n		PowerBook G4 with dual-link DVI support&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Windows PC and graphics card that supports DVI ports with dual-link digital bandwidth and VESA DDC standard for plug-and-play setup&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', '', 'Vargus All-Weather Tanks', '', ''),
(87, 1, 'Beginner\'s Yogas', '&lt;p&gt;\r\n	Canon\'s press material for the EOS 5D states that it \'defines (a) new D-SLR category\', while we\'re not typically too concerned with marketing talk this particular statement is clearly pretty accurate. The EOS 5D is unlike any previous digital SLR in that it combines a full-frame (35 mm sized) high resolution sensor (12.8 megapixels) with a relatively compact body (slightly larger than the EOS 20D, although in your hand it feels noticeably \'chunkier\'). The EOS 5D is aimed to slot in between the EOS 20D and the EOS-1D professional digital SLR\'s, an important difference when compared to the latter is that the EOS 5D doesn\'t have any environmental seals. While Canon don\'t specifically refer to the EOS 5D as a \'professional\' digital SLR it will have obvious appeal to professionals who want a high quality digital SLR in a body lighter than the EOS-1D. It will also no doubt appeal to current EOS 20D owners (although lets hope they\'ve not bought too many EF-S lenses...) äë&lt;/p&gt;\r\n', '', 'Beginner\'s Yoga1', '', ''),
(88, 1, 'Bess Yoga Shorts', '&lt;p&gt;\r\n	Stop your co-workers in their tracks with the stunning new 30-inch diagonal HP LP3065 Flat Panel Monitor. This flagship monitor features best-in-class performance and presentation features on a huge wide-aspect screen while letting you work as comfortably as possible - you might even forget you&amp;#39;re at the office&lt;/p&gt;\r\n', '', 'Bess Yoga Short1', '', ''),
(89, 1, 'Chaz Kangeroo Hoodies', '&lt;p&gt;\r\n	HTC Touch - in High Definition. Watch music videos and streaming content in awe-inspiring high definition clarity for a mobile experience you never thought possible. Seductively sleek, the HTC Touch HD provides the next generation of mobile functionality, all at a simple touch. Fully integrated with Windows Mobile Professional 6.1, ultrafast 3.5G, GPS, 5MP camera, plus lots more - all delivered on a breathtakingly crisp 3.8&amp;quot; WVGA touchscreen - you can take control of your mobile world with the HTC Touch HD.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Features&lt;/strong&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Processor Qualcomm&amp;reg; MSM 7201A&amp;trade; 528 MHz&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Windows Mobile&amp;reg; 6.1 Professional Operating System&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Memory: 512 MB ROM, 288 MB RAM&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Dimensions: 115 mm x 62.8 mm x 12 mm / 146.4 grams&lt;/li&gt;\r\n	&lt;li&gt;\r\n		3.8-inch TFT-LCD flat touch-sensitive screen with 480 x 800 WVGA resolution&lt;/li&gt;\r\n	&lt;li&gt;\r\n		HSDPA/WCDMA: Europe/Asia: 900/2100 MHz; Up to 2 Mbps up-link and 7.2 Mbps down-link speeds&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Quad-band GSM/GPRS/EDGE: Europe/Asia: 850/900/1800/1900 MHz (Band frequency, HSUPA availability, and data speed are operator dependent.)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Device Control via HTC TouchFLO&amp;trade; 3D &amp;amp; Touch-sensitive front panel buttons&lt;/li&gt;\r\n	&lt;li&gt;\r\n		GPS and A-GPS ready&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Bluetooth&amp;reg; 2.0 with Enhanced Data Rate and A2DP for wireless stereo headsets&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Wi-Fi&amp;reg;: IEEE 802.11 b/g&lt;/li&gt;\r\n	&lt;li&gt;\r\n		HTC ExtUSB&amp;trade; (11-pin mini-USB 2.0)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		5 megapixel color camera with auto focus&lt;/li&gt;\r\n	&lt;li&gt;\r\n		VGA CMOS color camera&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Built-in 3.5 mm audio jack, microphone, speaker, and FM radio&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Ring tone formats: AAC, AAC+, eAAC+, AMR-NB, AMR-WB, QCP, MP3, WMA, WAV&lt;/li&gt;\r\n	&lt;li&gt;\r\n		40 polyphonic and standard MIDI format 0 and 1 (SMF)/SP MIDI&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Rechargeable Lithium-ion or Lithium-ion polymer 1350 mAh battery&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Expansion Slot: microSD&amp;trade; memory card (SD 2.0 compatible)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		AC Adapter Voltage range/frequency: 100 ~ 240V AC, 50/60 Hz DC output: 5V and 1A&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Special Features: FM Radio, G-Sensor&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', '', 'Chaz Kangeroo Hoodies', '', ''),
(90, 1, 'Compete Track Totes', '&lt;div&gt;\r\n	Just when you thought iMac had everything, now there´s even more. More powerful Intel Core 2 Duo processors. And more memory standard. Combine this with Mac OS X Leopard and iLife ´08, and it´s more all-in-one than ever. iMac packs amazing performance into a stunningly slim space.&lt;/div&gt;\r\n', '', 'Compete Track Totes', '', ''),
(91, 1, 'Crown Summit Backpacks', '&lt;div&gt;\r\n	Unprecedented power. The next generation of processing technology has arrived. Built into the newest VAIO notebooks lies Intel&amp;#39;s latest, most powerful innovation yet: Intel&amp;reg; Centrino&amp;reg; 2 processor technology. Boasting incredible speed, expanded wireless connectivity, enhanced multimedia support and greater energy efficiency, all the high-performance essentials are seamlessly combined into a single chip.&lt;/div&gt;\r\n', '', 'Crown Summit Backpacks', '', ''),
(92, 1, 'Driven Backpacks', '&lt;p class=&quot;intro&quot;&gt;\r\n	iPhone is a revolutionary new mobile phone that allows you to make a call by simply tapping a name or number in your address book, a favorites list, or a call log. It also automatically syncs all your contacts from a PC, Mac, or Internet service. And it lets you select and listen to voicemail messages in whatever order you want just like email.&lt;/p&gt;\r\n', '', 'Driven Backpacks', '', ''),
(94, 1, 'Fusion Backpacks', '&lt;div&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Video in your pocket.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Its the small iPod with one very big idea: video. The worlds most popular music player now lets you enjoy movies, TV shows, and more on a two-inch display thats 65% brighter than before.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Cover Flow.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Browse through your music collection by flipping through album art. Select an album to turn it over and see the track list.&lt;strong&gt;&amp;nbsp;&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Enhanced interface.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Experience a whole new way to browse and view your music and video.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Sleek and colorful.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		With an anodized aluminum and polished stainless steel enclosure and a choice of five colors, iPod nano is dressed to impress.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;iTunes.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Available as a free download, iTunes makes it easy to browse and buy millions of songs, movies, TV shows, audiobooks, and games and download free podcasts all at the iTunes Store. And you can import your own music, manage your whole media library, and sync your iPod or iPhone with ease.&lt;/p&gt;\r\n&lt;/div&gt;\r\n', '', 'Fusion Backpacks', '', ''),
(96, 1, 'Karmen Yoga Pants', '&lt;p&gt;\r\n	&lt;strong&gt;Revolutionary multi-touch interface.&lt;/strong&gt;&lt;br /&gt;\r\n	iPod touch features the same multi-touch screen technology as iPhone. Pinch to zoom in on a photo. Scroll through your songs and videos with a flick. Flip through your library by album artwork with Cover Flow.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Gorgeous 3.5-inch widescreen display.&lt;/strong&gt;&lt;br /&gt;\r\n	Watch your movies, TV shows, and photos come alive with bright, vivid color on the 320-by-480-pixel display.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Music downloads straight from iTunes.&lt;/strong&gt;&lt;br /&gt;\r\n	Shop the iTunes Wi-Fi Music Store from anywhere with Wi-Fi.1 Browse or search to find the music youre looking for, preview it, and buy it with just a tap.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Surf the web with Wi-Fi.&lt;/strong&gt;&lt;br /&gt;\r\n	Browse the web using Safari and watch YouTube videos on the first iPod with Wi-Fi built in&lt;br /&gt;\r\n	&amp;nbsp;&lt;/p&gt;\r\n', '', 'Karmen Yoga Pants', '', '');
INSERT INTO `oc_product_description` (`product_id`, `language_id`, `name`, `description`, `tag`, `meta_title`, `meta_description`, `meta_keyword`) VALUES
(97, 1, 'Maxima Drawstring Shorts', '&lt;div&gt;\r\n	&lt;p&gt;\r\n		&lt;b&gt;Intel Core 2 Duo processor&lt;/b&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Powered by an Intel Core 2 Duo processor at speeds up to 2.16GHz, the new MacBook is the fastest ever.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;b&gt;1GB memory, larger hard drives&lt;/b&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		The new MacBook now comes with 1GB of memory standard and larger hard drives for the entire line perfect for running more of your favorite applications and storing growing media collections.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;b&gt;Sleek, 1.08-inch-thin design&lt;/b&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		MacBook makes it easy to hit the road thanks to its tough polycarbonate case, built-in wireless technologies, and innovative MagSafe Power Adapter that releases automatically if someone accidentally trips on the cord.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;b&gt;Built-in iSight camera&lt;/b&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Right out of the box, you can have a video chat with friends or family,2 record a video at your desk, or take fun pictures with Photo Booth&lt;/p&gt;\r\n&lt;/div&gt;\r\n', '', 'Maxima Drawstring Shorts', '', ''),
(99, 1, 'Rival Field Messengers', '&lt;div&gt;\r\n	MacBook Air is ultrathin, ultraportable, and ultra unlike anything else. But you don&amp;rsquo;t lose inches and pounds overnight. It&amp;rsquo;s the result of rethinking conventions. Of multiple wireless innovations. And of breakthrough design. With MacBook Air, mobile computing suddenly has a new standard.&lt;/div&gt;\r\n', '', 'Rival Field Messengers', '', ''),
(100, 1, 'Savvy Shoulder Totes', '&lt;div class=&quot;cpt_product_description &quot;&gt;\r\n	&lt;div&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Latest Intel mobile architecture&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Powered by the most advanced mobile processors from Intel, the new Core 2 Duo MacBook Pro is over 50% faster than the original Core Duo MacBook Pro and now supports up to 4GB of RAM.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Leading-edge graphics&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			The NVIDIA GeForce 8600M GT delivers exceptional graphics processing power. For the ultimate creative canvas, you can even configure the 17-inch model with a 1920-by-1200 resolution display.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Designed for life on the road&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Innovations such as a magnetic power connection and an illuminated keyboard with ambient light sensor put the MacBook Pro in a class by itself.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Connect. Create. Communicate.&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Quickly set up a video conference with the built-in iSight camera. Control presentations and media from up to 30 feet away with the included Apple Remote. Connect to high-bandwidth peripherals with FireWire 800 and DVI.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Next-generation wireless&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Featuring 802.11n wireless technology, the MacBook Pro delivers up to five times the performance and up to twice the range of previous-generation technologies.&lt;/p&gt;\r\n	&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;!-- cpt_container_end --&gt;', '', 'Savvy Shoulder Totes', '', ''),
(101, 1, 'Sprite Yoga Companion Kits', '&lt;div class=&quot;cpt_product_description &quot;&gt;\r\n	&lt;div&gt;\r\n		Engineered with pro-level features and performance, the 12.3-effective-megapixel D300 combines brand new technologies with advanced features inherited from Nikon&amp;#39;s newly announced D3 professional digital SLR camera to offer serious photographers remarkable performance combined with agility.&lt;br /&gt;\r\n		&lt;br /&gt;\r\n		Similar to the D3, the D300 features Nikon&amp;#39;s exclusive EXPEED Image Processing System that is central to driving the speed and processing power needed for many of the camera&amp;#39;s new features. The D300 features a new 51-point autofocus system with Nikon&amp;#39;s 3D Focus Tracking feature and two new LiveView shooting modes that allow users to frame a photograph using the camera&amp;#39;s high-resolution LCD monitor. The D300 shares a similar Scene Recognition System as is found in the D3; it promises to greatly enhance the accuracy of autofocus, autoexposure, and auto white balance by recognizing the subject or scene being photographed and applying this information to the calculations for the three functions.&lt;br /&gt;\r\n		&lt;br /&gt;\r\n		The D300 reacts with lightning speed, powering up in a mere 0.13 seconds and shooting with an imperceptible 45-millisecond shutter release lag time. The D300 is capable of shooting at a rapid six frames per second and can go as fast as eight frames per second when using the optional MB-D10 multi-power battery pack. In continuous bursts, the D300 can shoot up to 100 shots at full 12.3-megapixel resolution. (NORMAL-LARGE image setting, using a SanDisk Extreme IV 1GB CompactFlash card.)&lt;br /&gt;\r\n		&lt;br /&gt;\r\n		The D300 incorporates a range of innovative technologies and features that will significantly improve the accuracy, control, and performance photographers can get from their equipment. Its new Scene Recognition System advances the use of Nikon&amp;#39;s acclaimed 1,005-segment sensor to recognize colors and light patterns that help the camera determine the subject and the type of scene being photographed before a picture is taken. This information is used to improve the accuracy of autofocus, autoexposure, and auto white balance functions in the D300. For example, the camera can track moving subjects better and by identifying them, it can also automatically select focus points faster and with greater accuracy. It can also analyze highlights and more accurately determine exposure, as well as infer light sources to deliver more accurate white balance detection.&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;!-- cpt_container_end --&gt;', '', 'Sprite Yoga Companion Kits', '', ''),
(93, 1, 'Endeavor Daytrip Backpacks', '&lt;div class=&quot;cpt_product_description &quot;&gt;\r\n	&lt;div&gt;\r\n		&lt;p&gt;\r\n			&lt;strong&gt;More room to move.&lt;/strong&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			With 80GB or 160GB of storage and up to 40 hours of battery life, the new iPod classic lets you enjoy up to 40,000 songs or up to 200 hours of video or any combination wherever you go.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;strong&gt;Cover Flow.&lt;/strong&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Browse through your music collection by flipping through album art. Select an album to turn it over and see the track list.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;strong&gt;Enhanced interface.&lt;/strong&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Experience a whole new way to browse and view your music and video.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;strong&gt;Sleeker design.&lt;/strong&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Beautiful, durable, and sleeker than ever, iPod classic now features an anodized aluminum and polished stainless steel enclosure with rounded edges.&lt;/p&gt;\r\n	&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;!-- cpt_container_end --&gt;', '', 'Endeavor Daytrip Backpacks', '', ''),
(95, 1, 'Joust Duffle Bags', '&lt;div&gt;\r\n	&lt;strong&gt;Born to be worn.&lt;/strong&gt;\r\n	&lt;p&gt;\r\n		Clip on the worlds most wearable music player and take up to 240 songs with you anywhere. Choose from five colors including four new hues to make your musical fashion statement.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Random meets rhythm.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		With iTunes autofill, iPod shuffle can deliver a new musical experience every time you sync. For more randomness, you can shuffle songs during playback with the slide of a switch.&lt;/p&gt;\r\n	&lt;strong&gt;Everything is easy.&lt;/strong&gt;\r\n	&lt;p&gt;\r\n		Charge and sync with the included USB dock. Operate the iPod shuffle controls with one hand. Enjoy up to 12 hours straight of skip-free music playback.&lt;/p&gt;\r\n&lt;/div&gt;\r\n', '', 'Joust Duffle Bags', '', ''),
(98, 1, 'Radiant Tees', '&lt;p&gt;\r\n	Samsung Galaxy Tab 10.1, is the world&amp;rsquo;s thinnest tablet, measuring 8.6 mm thickness, running with Android 3.0 Honeycomb OS on a 1GHz dual-core Tegra 2 processor, similar to its younger brother Samsung Galaxy Tab 8.9.&lt;/p&gt;\r\n&lt;p&gt;\r\n	Samsung Galaxy Tab 10.1 gives pure Android 3.0 experience, adding its new TouchWiz UX or TouchWiz 4.0 &amp;ndash; includes a live panel, which lets you to customize with different content, such as your pictures, bookmarks, and social feeds, sporting a 10.1 inches WXGA capacitive touch screen with 1280 x 800 pixels of resolution, equipped with 3 megapixel rear camera with LED flash and a 2 megapixel front camera, HSPA+ connectivity up to 21Mbps, 720p HD video recording capability, 1080p HD playback, DLNA support, Bluetooth 2.1, USB 2.0, gyroscope, Wi-Fi 802.11 a/b/g/n, micro-SD slot, 3.5mm headphone jack, and SIM slot, including the Samsung Stick &amp;ndash; a Bluetooth microphone that can be carried in a pocket like a pen and sound dock with powered subwoofer.&lt;/p&gt;\r\n&lt;p&gt;\r\n	Samsung Galaxy Tab 10.1 will come in 16GB / 32GB / 64GB verities and pre-loaded with Social Hub, Reader&amp;rsquo;s Hub, Music Hub and Samsung Mini Apps Tray &amp;ndash; which gives you access to more commonly used apps to help ease multitasking and it is capable of Adobe Flash Player 10.2, powered by 6860mAh battery that gives you 10hours of video-playback time.&amp;nbsp;&amp;auml;&amp;ouml;&lt;/p&gt;\r\n', '', 'Radiant Tees', '', ''),
(102, 1, 'Strive Shoulder Packs', '&lt;p&gt;\r\n	Redefine your workday with the Palm Treo Pro smartphone. Perfectly balanced, you can respond to business and personal email, stay on top of appointments and contacts, and use Wi-Fi or GPS when you&amp;rsquo;re out and about. Then watch a video on YouTube, catch up with news and sports on the web, or listen to a few songs. Balance your work and play the way you like it, with the Palm Treo Pro.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Features&lt;/strong&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Windows Mobile&amp;reg; 6.1 Professional Edition&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Qualcomm&amp;reg; MSM7201 400MHz Processor&lt;/li&gt;\r\n	&lt;li&gt;\r\n		320x320 transflective colour TFT touchscreen&lt;/li&gt;\r\n	&lt;li&gt;\r\n		HSDPA/UMTS/EDGE/GPRS/GSM radio&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Tri-band UMTS &amp;mdash; 850MHz, 1900MHz, 2100MHz&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Quad-band GSM &amp;mdash; 850/900/1800/1900&lt;/li&gt;\r\n	&lt;li&gt;\r\n		802.11b/g with WPA, WPA2, and 801.1x authentication&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Built-in GPS&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Bluetooth Version: 2.0 + Enhanced Data Rate&lt;/li&gt;\r\n	&lt;li&gt;\r\n		256MB storage (100MB user available), 128MB RAM&lt;/li&gt;\r\n	&lt;li&gt;\r\n		2.0 megapixel camera, up to 8x digital zoom and video capture&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Removable, rechargeable 1500mAh lithium-ion battery&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Up to 5.0 hours talk time and up to 250 hours standby&lt;/li&gt;\r\n	&lt;li&gt;\r\n		MicroSDHC card expansion (up to 32GB supported)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		MicroUSB 2.0 for synchronization and charging&lt;/li&gt;\r\n	&lt;li&gt;\r\n		3.5mm stereo headset jack&lt;/li&gt;\r\n	&lt;li&gt;\r\n		60mm (W) x 114mm (L) x 13.5mm (D) / 133g&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', '', 'Strive Shoulder Packs', '', ''),
(103, 1, 'Voyage Yoga Bags', '&lt;div&gt;\r\n	Imagine the advantages of going big without slowing down. The big 19&amp;quot; 941BW monitor combines wide aspect ratio with fast pixel response time, for bigger images, more room to work and crisp motion. In addition, the exclusive MagicBright 2, MagicColor and MagicTune technologies help deliver the ideal image in every situation, while sleek, narrow bezels and adjustable stands deliver style just the way you want it. With the Samsung 941BW widescreen analog/digital LCD monitor, it&amp;#39;s not hard to imagine.&lt;/div&gt;\r\n', '', 'Voyage Yoga Bags', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_discount`
--

DROP TABLE IF EXISTS `oc_product_discount`;
CREATE TABLE `oc_product_discount` (
  `product_discount_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `quantity` int(4) NOT NULL DEFAULT '0',
  `priority` int(5) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_product_discount`
--

INSERT INTO `oc_product_discount` (`product_discount_id`, `product_id`, `customer_group_id`, `quantity`, `priority`, `price`, `date_start`, `date_end`) VALUES
(524, 86, 1, 30, 1, '66.0000', '0000-00-00', '0000-00-00'),
(523, 86, 1, 20, 1, '77.0000', '0000-00-00', '0000-00-00'),
(522, 86, 1, 10, 1, '88.0000', '0000-00-00', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_filter`
--

DROP TABLE IF EXISTS `oc_product_filter`;
CREATE TABLE `oc_product_filter` (
  `product_id` int(11) NOT NULL,
  `filter_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_product_filter`
--

INSERT INTO `oc_product_filter` (`product_id`, `filter_id`) VALUES
(86, 1),
(86, 15),
(86, 19),
(87, 5),
(87, 7),
(87, 11),
(87, 16),
(87, 17),
(87, 18),
(88, 3),
(88, 4),
(88, 8),
(88, 11),
(88, 14),
(88, 15),
(88, 16),
(88, 20),
(88, 21),
(88, 23),
(89, 2),
(89, 3),
(89, 4),
(89, 6),
(89, 14),
(89, 15),
(89, 16),
(89, 17),
(89, 18),
(89, 21),
(89, 22),
(90, 2),
(90, 5),
(90, 6),
(90, 7),
(90, 11),
(90, 12),
(90, 15),
(90, 16),
(90, 17),
(90, 19),
(90, 20),
(90, 21),
(91, 1),
(91, 3),
(91, 7),
(91, 8),
(91, 15),
(91, 16),
(92, 1),
(92, 3),
(92, 4),
(92, 5),
(92, 7),
(92, 12),
(92, 13),
(92, 14),
(92, 15),
(92, 16),
(92, 17),
(92, 18),
(92, 19),
(92, 20),
(92, 22),
(92, 23),
(93, 1),
(93, 4),
(93, 11),
(93, 12),
(93, 13),
(93, 14),
(93, 15),
(93, 16),
(93, 17),
(93, 19),
(93, 21),
(94, 1),
(94, 2),
(94, 3),
(94, 4),
(94, 8),
(94, 12),
(94, 14),
(94, 15),
(94, 16),
(94, 17),
(94, 19),
(95, 1),
(95, 3),
(95, 4),
(95, 7),
(95, 8),
(95, 14),
(95, 16),
(95, 17),
(95, 18),
(95, 19),
(95, 22),
(95, 23),
(96, 2),
(96, 7),
(96, 11),
(96, 15),
(96, 17),
(96, 19),
(96, 20),
(97, 1),
(97, 2),
(97, 6),
(97, 16),
(97, 17),
(97, 19),
(97, 20),
(97, 21),
(98, 1),
(98, 6),
(98, 7),
(98, 15),
(98, 16),
(99, 1),
(99, 14),
(99, 16),
(99, 17),
(100, 1),
(100, 6),
(100, 7),
(100, 14),
(100, 15),
(100, 17),
(100, 18),
(100, 22),
(100, 23),
(101, 6),
(101, 7),
(101, 10),
(101, 14),
(101, 15),
(101, 17),
(101, 18),
(101, 19),
(101, 21),
(101, 22),
(101, 23),
(102, 1),
(102, 2),
(102, 3),
(102, 7),
(102, 11),
(102, 15),
(102, 17),
(102, 19),
(102, 21),
(103, 4),
(103, 8),
(103, 11),
(103, 14),
(103, 18),
(103, 20),
(103, 22);

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_image`
--

DROP TABLE IF EXISTS `oc_product_image`;
CREATE TABLE `oc_product_image` (
  `product_image_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `is_rotator` tinyint(1) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_product_image`
--

INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`, `is_rotator`) VALUES
(820, 87, 'catalog/product/Book/12.jpg', 0, 0),
(819, 87, 'catalog/product/Book/14.jpg', 0, 0),
(818, 87, 'catalog/product/Book/13.jpg', 0, 0),
(817, 87, 'catalog/product/Book/11.jpg', 0, 0),
(816, 87, 'catalog/product/Book/10.jpg', 0, 0),
(823, 88, 'catalog/product/Book/15.jpg', 0, 0),
(822, 88, 'catalog/product/Book/14.jpg', 0, 0),
(821, 88, 'catalog/product/Book/13.jpg', 0, 0),
(830, 89, 'catalog/product/Book/20.jpg', 0, 0),
(829, 89, 'catalog/product/Book/16.jpg', 0, 0),
(828, 89, 'catalog/product/Book/19.jpg', 0, 0),
(827, 89, 'catalog/product/Book/18.jpg', 0, 0),
(826, 89, 'catalog/product/Book/17.jpg', 0, 0),
(833, 90, 'catalog/product/Book/15.jpg', 0, 0),
(832, 90, 'catalog/product/Book/14.jpg', 0, 0),
(831, 90, 'catalog/product/Book/13.jpg', 0, 0),
(839, 91, 'catalog/product/Book/2.jpg', 0, 0),
(838, 91, 'catalog/product/Book/19.jpg', 0, 0),
(837, 91, 'catalog/product/Book/18.jpg', 0, 0),
(836, 91, 'catalog/product/Book/17.jpg', 0, 0),
(844, 92, 'catalog/product/Book/2.jpg', 0, 0),
(843, 92, 'catalog/product/Book/19.jpg', 0, 0),
(842, 92, 'catalog/product/Book/18.jpg', 0, 0),
(841, 92, 'catalog/product/Book/17.jpg', 0, 0),
(848, 93, 'catalog/product/Book/11.jpg', 0, 0),
(847, 93, 'catalog/product/Book/10.jpg', 0, 0),
(846, 93, 'catalog/product/Book/1.jpg', 0, 0),
(855, 94, 'catalog/product/Book/21.jpg', 0, 0),
(854, 94, 'catalog/product/Book/2.jpg', 0, 0),
(853, 94, 'catalog/product/Book/19.jpg', 0, 0),
(852, 94, 'catalog/product/Book/14.jpg', 0, 0),
(851, 94, 'catalog/product/Book/17.jpg', 0, 0),
(860, 95, 'catalog/product/Book/22.jpg', 0, 0),
(859, 95, 'catalog/product/Book/2.jpg', 0, 0),
(858, 95, 'catalog/product/Book/19.jpg', 0, 0),
(857, 95, 'catalog/product/Book/18.jpg', 0, 0),
(856, 95, 'catalog/product/Book/20.jpg', 0, 0),
(865, 96, 'catalog/product/Book/13.jpg', 0, 0),
(864, 96, 'catalog/product/Book/12.jpg', 0, 0),
(863, 96, 'catalog/product/Book/11.jpg', 0, 0),
(862, 96, 'catalog/product/Book/10.jpg', 0, 0),
(861, 96, 'catalog/product/Book/1.jpg', 0, 0),
(870, 97, 'catalog/product/Book/13.jpg', 0, 0),
(869, 97, 'catalog/product/Book/12.jpg', 0, 0),
(868, 97, 'catalog/product/Book/11.jpg', 0, 0),
(867, 97, 'catalog/product/Book/10.jpg', 0, 0),
(866, 97, 'catalog/product/Book/1.jpg', 0, 0),
(875, 98, 'catalog/product/Book/13.jpg', 0, 0),
(874, 98, 'catalog/product/Book/12.jpg', 0, 0),
(873, 98, 'catalog/product/Book/11.jpg', 0, 0),
(872, 98, 'catalog/product/Book/10.jpg', 0, 0),
(871, 98, 'catalog/product/Book/1.jpg', 0, 0),
(880, 99, 'catalog/product/Book/14.jpg', 0, 0),
(879, 99, 'catalog/product/Book/12.jpg', 0, 0),
(878, 99, 'catalog/product/Book/11.jpg', 0, 0),
(877, 99, 'catalog/product/Book/10.jpg', 0, 0),
(876, 99, 'catalog/product/Book/13.jpg', 0, 0),
(885, 100, 'catalog/product/Book/3.jpg', 0, 0),
(884, 100, 'catalog/product/Book/2.jpg', 0, 0),
(883, 100, 'catalog/product/Book/15.jpg', 0, 0),
(882, 100, 'catalog/product/Book/14.jpg', 0, 0),
(881, 100, 'catalog/product/Book/13.jpg', 0, 0),
(890, 101, 'catalog/product/Book/13.jpg', 0, 0),
(889, 101, 'catalog/product/Book/12.jpg', 0, 0),
(888, 101, 'catalog/product/Book/11.jpg', 0, 0),
(887, 101, 'catalog/product/Book/10.jpg', 0, 0),
(886, 101, 'catalog/product/Book/1.jpg', 0, 0),
(894, 102, 'catalog/product/Book/18.jpg', 0, 0),
(893, 102, 'catalog/product/Book/17.jpg', 0, 0),
(892, 102, 'catalog/product/Book/16.jpg', 0, 0),
(891, 102, 'catalog/product/Book/15.jpg', 0, 0),
(900, 86, 'catalog/product/Book/18.jpg', 0, 0),
(899, 86, 'catalog/product/Book/12.jpg', 0, 0),
(898, 86, 'catalog/product/Book/11.jpg', 0, 0),
(897, 86, 'catalog/product/Book/10.jpg', 0, 0),
(896, 86, 'catalog/product/Book/1.jpg', 0, 0),
(903, 103, 'catalog/product/Book/12.jpg', 0, 0),
(902, 103, 'catalog/product/Book/11.jpg', 0, 0),
(901, 103, 'catalog/product/Book/10.jpg', 0, 0),
(824, 88, 'catalog/product/Book/16.jpg', 0, 0),
(825, 88, 'catalog/product/Book/18.jpg', 0, 0),
(834, 90, 'catalog/product/Book/16.jpg', 0, 0),
(835, 90, 'catalog/product/Book/17.jpg', 0, 0),
(840, 91, 'catalog/product/Book/20.jpg', 0, 0),
(845, 92, 'catalog/product/Book/20.jpg', 0, 0),
(849, 93, 'catalog/product/Book/16.jpg', 0, 0),
(850, 93, 'catalog/product/Book/3.jpg', 0, 0),
(905, 103, 'catalog/product/Book/2.jpg', 0, 0),
(904, 103, 'catalog/product/Book/14.jpg', 0, 0),
(895, 102, 'catalog/product/Book/3.jpg', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_option`
--

DROP TABLE IF EXISTS `oc_product_option`;
CREATE TABLE `oc_product_option` (
  `product_option_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `value` text NOT NULL,
  `required` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_product_option`
--

INSERT INTO `oc_product_option` (`product_option_id`, `product_id`, `option_id`, `value`, `required`) VALUES
(258, 87, 5, '', 1),
(259, 88, 12, '2011-04-22', 1),
(251, 86, 6, '', 1),
(252, 86, 2, '', 1),
(253, 86, 10, '2011-02-20 22:25', 1),
(254, 86, 9, '22:25', 1),
(255, 86, 4, 'test', 1),
(249, 86, 1, '', 1),
(250, 86, 5, '', 1),
(256, 86, 8, '2011-02-20', 1),
(257, 86, 7, '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_option_value`
--

DROP TABLE IF EXISTS `oc_product_option_value`;
CREATE TABLE `oc_product_option_value` (
  `product_option_value_id` int(11) NOT NULL,
  `product_option_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `option_value_id` int(11) NOT NULL,
  `quantity` int(3) NOT NULL,
  `subtract` tinyint(1) NOT NULL,
  `price` decimal(15,4) NOT NULL,
  `price_prefix` varchar(1) NOT NULL,
  `points` int(8) NOT NULL,
  `points_prefix` varchar(1) NOT NULL,
  `weight` decimal(15,8) NOT NULL,
  `weight_prefix` varchar(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_product_option_value`
--

INSERT INTO `oc_product_option_value` (`product_option_value_id`, `product_option_id`, `product_id`, `option_id`, `option_value_id`, `quantity`, `subtract`, `price`, `price_prefix`, `points`, `points_prefix`, `weight`, `weight_prefix`) VALUES
(45, 249, 86, 1, 43, 300, 1, '30.0000', '+', 3, '+', '30.00000000', '+'),
(55, 258, 87, 5, 40, 4, 1, '0.0000', '+', 0, '+', '0.00000000', '+'),
(54, 258, 87, 5, 39, 2, 1, '0.0000', '+', 0, '+', '0.00000000', '+'),
(44, 249, 86, 1, 31, 146, 1, '20.0000', '+', 2, '-', '20.00000000', '+'),
(43, 249, 86, 1, 32, 96, 1, '10.0000', '+', 1, '+', '10.00000000', '+'),
(46, 250, 86, 5, 39, 92, 1, '4.0000', '+', 0, '+', '4.00000000', '+'),
(47, 250, 86, 5, 40, 300, 0, '3.0000', '+', 0, '+', '3.00000000', '+'),
(48, 250, 86, 5, 41, 100, 0, '1.0000', '+', 0, '+', '1.00000000', '+'),
(49, 250, 86, 5, 42, 200, 1, '2.0000', '+', 0, '+', '2.00000000', '+'),
(50, 252, 86, 2, 23, 48, 1, '10.0000', '+', 0, '+', '10.00000000', '+'),
(51, 252, 86, 2, 24, 194, 1, '20.0000', '+', 0, '+', '20.00000000', '+'),
(52, 252, 86, 2, 44, 2696, 1, '30.0000', '+', 0, '+', '30.00000000', '+'),
(53, 252, 86, 2, 45, 3998, 1, '40.0000', '+', 0, '+', '40.00000000', '+');

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_recurring`
--

DROP TABLE IF EXISTS `oc_product_recurring`;
CREATE TABLE `oc_product_recurring` (
  `product_id` int(11) NOT NULL,
  `recurring_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_related`
--

DROP TABLE IF EXISTS `oc_product_related`;
CREATE TABLE `oc_product_related` (
  `product_id` int(11) NOT NULL,
  `related_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_product_related`
--

INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES
(86, 90),
(86, 91),
(86, 92),
(86, 93),
(86, 94),
(86, 95),
(86, 96),
(86, 97),
(86, 98),
(86, 99),
(87, 88),
(87, 89),
(87, 90),
(87, 91),
(87, 93),
(87, 94),
(87, 95),
(87, 96),
(87, 97),
(87, 98),
(87, 103),
(88, 87),
(88, 89),
(88, 90),
(88, 91),
(88, 93),
(88, 95),
(88, 97),
(88, 98),
(88, 103),
(89, 87),
(89, 88),
(89, 91),
(89, 93),
(89, 97),
(89, 98),
(89, 100),
(89, 101),
(89, 102),
(89, 103),
(90, 86),
(90, 87),
(90, 88),
(90, 91),
(90, 93),
(90, 97),
(90, 98),
(90, 100),
(90, 101),
(90, 102),
(90, 103),
(91, 86),
(91, 87),
(91, 88),
(91, 89),
(91, 90),
(91, 92),
(91, 98),
(91, 99),
(92, 86),
(92, 91),
(92, 94),
(92, 95),
(92, 96),
(92, 98),
(92, 99),
(92, 101),
(92, 103),
(93, 86),
(93, 87),
(93, 88),
(93, 89),
(93, 90),
(93, 100),
(93, 101),
(93, 102),
(94, 86),
(94, 87),
(94, 92),
(94, 96),
(94, 98),
(94, 99),
(94, 100),
(94, 101),
(94, 102),
(95, 86),
(95, 87),
(95, 88),
(95, 92),
(95, 99),
(95, 100),
(95, 102),
(96, 86),
(96, 87),
(96, 92),
(96, 94),
(96, 100),
(96, 101),
(96, 102),
(97, 86),
(97, 87),
(97, 88),
(97, 89),
(97, 90),
(97, 98),
(97, 100),
(97, 102),
(98, 86),
(98, 87),
(98, 88),
(98, 89),
(98, 90),
(98, 91),
(98, 92),
(98, 94),
(98, 97),
(98, 99),
(98, 101),
(98, 103),
(99, 86),
(99, 91),
(99, 92),
(99, 94),
(99, 95),
(99, 98),
(99, 103),
(100, 89),
(100, 90),
(100, 93),
(100, 94),
(100, 95),
(100, 96),
(100, 97),
(101, 89),
(101, 90),
(101, 92),
(101, 93),
(101, 94),
(101, 96),
(101, 98),
(102, 89),
(102, 90),
(102, 93),
(102, 94),
(102, 95),
(102, 96),
(102, 97),
(103, 87),
(103, 88),
(103, 89),
(103, 90),
(103, 92),
(103, 98),
(103, 99);

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_reward`
--

DROP TABLE IF EXISTS `oc_product_reward`;
CREATE TABLE `oc_product_reward` (
  `product_reward_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL DEFAULT '0',
  `customer_group_id` int(11) NOT NULL DEFAULT '0',
  `points` int(8) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_product_reward`
--

INSERT INTO `oc_product_reward` (`product_reward_id`, `product_id`, `customer_group_id`, `points`) VALUES
(757, 86, 1, 100),
(750, 87, 1, 200),
(751, 88, 1, 300),
(752, 89, 1, 400),
(753, 97, 1, 600),
(754, 98, 1, 1000),
(755, 99, 1, 700),
(756, 100, 1, 800);

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_special`
--

DROP TABLE IF EXISTS `oc_product_special`;
CREATE TABLE `oc_product_special` (
  `product_special_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `priority` int(5) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_product_special`
--

INSERT INTO `oc_product_special` (`product_special_id`, `product_id`, `customer_group_id`, `priority`, `price`, `date_start`, `date_end`) VALUES
(614, 101, 1, 0, '70.0000', '2017-12-12', '2021-12-12'),
(615, 86, 1, 1, '90.0000', '2017-05-08', '2020-05-08'),
(609, 87, 1, 1, '80.0000', '2017-05-08', '2020-05-08'),
(610, 88, 1, 0, '55.0000', '2017-05-08', '2024-05-08'),
(611, 89, 1, 0, '64.0000', '2017-05-08', '2024-05-08'),
(612, 90, 1, 0, '65.0000', '2017-05-08', '2024-05-08'),
(613, 92, 1, 0, '70.0000', '2017-05-08', '2024-05-08');

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_to_category`
--

DROP TABLE IF EXISTS `oc_product_to_category`;
CREATE TABLE `oc_product_to_category` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_product_to_category`
--

INSERT INTO `oc_product_to_category` (`product_id`, `category_id`) VALUES
(86, 191),
(86, 207),
(86, 228),
(86, 239),
(87, 191),
(87, 207),
(87, 212),
(87, 223),
(87, 228),
(87, 239),
(87, 245),
(87, 246),
(88, 193),
(88, 200),
(88, 201),
(88, 204),
(88, 205),
(88, 218),
(88, 221),
(88, 228),
(88, 239),
(89, 191),
(89, 193),
(89, 200),
(89, 201),
(89, 207),
(89, 228),
(89, 237),
(89, 239),
(89, 240),
(89, 245),
(89, 246),
(90, 191),
(90, 228),
(90, 239),
(91, 198),
(91, 207),
(91, 228),
(91, 231),
(91, 236),
(91, 237),
(91, 238),
(91, 241),
(91, 242),
(91, 243),
(91, 244),
(91, 245),
(91, 246),
(91, 247),
(91, 248),
(91, 249),
(92, 191),
(92, 195),
(92, 200),
(92, 201),
(92, 204),
(92, 228),
(92, 229),
(92, 234),
(92, 239),
(92, 245),
(92, 248),
(92, 249),
(93, 191),
(93, 195),
(93, 196),
(93, 208),
(93, 228),
(93, 229),
(93, 230),
(93, 232),
(93, 234),
(93, 236),
(93, 237),
(93, 239),
(93, 240),
(93, 241),
(93, 242),
(93, 243),
(93, 244),
(93, 245),
(93, 246),
(93, 247),
(93, 249),
(94, 191),
(94, 207),
(94, 228),
(94, 231),
(94, 232),
(94, 239),
(94, 240),
(94, 241),
(94, 242),
(95, 228),
(95, 239),
(95, 245),
(95, 246),
(96, 207),
(96, 239),
(97, 191),
(97, 207),
(97, 228),
(97, 239),
(98, 207),
(98, 228),
(98, 239),
(98, 245),
(98, 246),
(99, 191),
(99, 228),
(99, 239),
(100, 191),
(100, 239),
(101, 239),
(101, 245),
(101, 246),
(102, 239),
(102, 244),
(102, 246),
(102, 249),
(103, 228);

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_to_download`
--

DROP TABLE IF EXISTS `oc_product_to_download`;
CREATE TABLE `oc_product_to_download` (
  `product_id` int(11) NOT NULL,
  `download_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_to_layout`
--

DROP TABLE IF EXISTS `oc_product_to_layout`;
CREATE TABLE `oc_product_to_layout` (
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_product_to_layout`
--

INSERT INTO `oc_product_to_layout` (`product_id`, `store_id`, `layout_id`) VALUES
(103, 0, 0),
(101, 6, 0),
(99, 1, 0),
(95, 1, 0),
(94, 0, 0),
(92, 0, 0),
(90, 7, 0),
(97, 1, 0),
(87, 6, 0),
(86, 2, 0),
(87, 3, 0),
(88, 3, 0),
(89, 2, 0),
(90, 3, 0),
(91, 2, 0),
(92, 2, 0),
(93, 2, 0),
(94, 2, 0),
(95, 2, 0),
(96, 2, 0),
(97, 2, 0),
(98, 2, 0),
(99, 2, 0),
(100, 2, 0),
(101, 3, 0),
(102, 2, 0),
(103, 2, 0),
(87, 2, 0),
(87, 1, 0),
(87, 0, 0),
(88, 2, 0),
(88, 1, 0),
(88, 0, 0),
(89, 3, 0),
(89, 6, 0),
(89, 7, 0),
(90, 2, 0),
(90, 1, 0),
(90, 0, 0),
(91, 3, 0),
(91, 6, 0),
(91, 7, 0),
(92, 3, 0),
(92, 6, 0),
(92, 7, 0),
(93, 3, 0),
(93, 6, 0),
(93, 7, 0),
(94, 3, 0),
(94, 6, 0),
(94, 7, 0),
(95, 3, 0),
(95, 6, 0),
(95, 7, 0),
(96, 3, 0),
(96, 6, 0),
(96, 7, 0),
(97, 3, 0),
(97, 6, 0),
(97, 7, 0),
(98, 3, 0),
(98, 6, 0),
(98, 7, 0),
(99, 3, 0),
(99, 6, 0),
(99, 7, 0),
(100, 3, 0),
(100, 6, 0),
(100, 7, 0),
(101, 2, 0),
(101, 1, 0),
(101, 0, 0),
(102, 3, 0),
(102, 6, 0),
(102, 7, 0),
(86, 3, 0),
(86, 6, 0),
(86, 7, 0),
(103, 3, 0),
(103, 6, 0),
(103, 7, 0),
(103, 1, 0),
(86, 0, 0),
(86, 1, 0),
(101, 7, 0),
(102, 1, 0),
(102, 0, 0),
(99, 0, 0),
(100, 1, 0),
(100, 0, 0),
(97, 0, 0),
(98, 1, 0),
(98, 0, 0),
(95, 0, 0),
(96, 1, 0),
(96, 0, 0),
(94, 1, 0),
(93, 0, 0),
(93, 1, 0),
(92, 1, 0),
(91, 0, 0),
(91, 1, 0),
(90, 6, 0),
(89, 0, 0),
(89, 1, 0),
(87, 7, 0),
(88, 6, 0),
(88, 7, 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_to_store`
--

DROP TABLE IF EXISTS `oc_product_to_store`;
CREATE TABLE `oc_product_to_store` (
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_product_to_store`
--

INSERT INTO `oc_product_to_store` (`product_id`, `store_id`) VALUES
(86, 0),
(86, 1),
(86, 2),
(86, 3),
(86, 6),
(86, 7),
(87, 0),
(87, 1),
(87, 2),
(87, 3),
(87, 6),
(87, 7),
(88, 0),
(88, 1),
(88, 2),
(88, 3),
(88, 6),
(88, 7),
(89, 0),
(89, 1),
(89, 2),
(89, 3),
(89, 6),
(89, 7),
(90, 0),
(90, 1),
(90, 2),
(90, 3),
(90, 6),
(90, 7),
(91, 0),
(91, 1),
(91, 2),
(91, 3),
(91, 6),
(91, 7),
(92, 0),
(92, 1),
(92, 2),
(92, 3),
(92, 6),
(92, 7),
(93, 0),
(93, 1),
(93, 2),
(93, 3),
(93, 6),
(93, 7),
(94, 0),
(94, 1),
(94, 2),
(94, 3),
(94, 6),
(94, 7),
(95, 0),
(95, 1),
(95, 2),
(95, 3),
(95, 6),
(95, 7),
(96, 0),
(96, 1),
(96, 2),
(96, 3),
(96, 6),
(96, 7),
(97, 0),
(97, 1),
(97, 2),
(97, 3),
(97, 6),
(97, 7),
(98, 0),
(98, 1),
(98, 2),
(98, 3),
(98, 6),
(98, 7),
(99, 0),
(99, 1),
(99, 2),
(99, 3),
(99, 6),
(99, 7),
(100, 0),
(100, 1),
(100, 2),
(100, 3),
(100, 6),
(100, 7),
(101, 0),
(101, 1),
(101, 2),
(101, 3),
(101, 6),
(101, 7),
(102, 0),
(102, 1),
(102, 2),
(102, 3),
(102, 6),
(102, 7),
(103, 0),
(103, 1),
(103, 2),
(103, 3),
(103, 6),
(103, 7);

-- --------------------------------------------------------

--
-- Table structure for table `oc_recurring`
--

DROP TABLE IF EXISTS `oc_recurring`;
CREATE TABLE `oc_recurring` (
  `recurring_id` int(11) NOT NULL,
  `price` decimal(10,4) NOT NULL,
  `frequency` enum('day','week','semi_month','month','year') NOT NULL,
  `duration` int(10) UNSIGNED NOT NULL,
  `cycle` int(10) UNSIGNED NOT NULL,
  `trial_status` tinyint(4) NOT NULL,
  `trial_price` decimal(10,4) NOT NULL,
  `trial_frequency` enum('day','week','semi_month','month','year') NOT NULL,
  `trial_duration` int(10) UNSIGNED NOT NULL,
  `trial_cycle` int(10) UNSIGNED NOT NULL,
  `status` tinyint(4) NOT NULL,
  `sort_order` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_recurring_description`
--

DROP TABLE IF EXISTS `oc_recurring_description`;
CREATE TABLE `oc_recurring_description` (
  `recurring_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_return`
--

DROP TABLE IF EXISTS `oc_return`;
CREATE TABLE `oc_return` (
  `return_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `product` varchar(255) NOT NULL,
  `model` varchar(64) NOT NULL,
  `quantity` int(4) NOT NULL,
  `opened` tinyint(1) NOT NULL,
  `return_reason_id` int(11) NOT NULL,
  `return_action_id` int(11) NOT NULL,
  `return_status_id` int(11) NOT NULL,
  `comment` text,
  `date_ordered` date NOT NULL DEFAULT '0000-00-00',
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_return_action`
--

DROP TABLE IF EXISTS `oc_return_action`;
CREATE TABLE `oc_return_action` (
  `return_action_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_return_action`
--

INSERT INTO `oc_return_action` (`return_action_id`, `language_id`, `name`) VALUES
(1, 1, 'Refunded'),
(2, 1, 'Credit Issued'),
(3, 1, 'Replacement Sent'),
(1, 3, 'Refunded'),
(2, 3, 'Credit Issued'),
(3, 3, 'Replacement Sent'),
(1, 4, 'Refunded'),
(2, 4, 'Credit Issued'),
(3, 4, 'Replacement Sent'),
(1, 5, 'Refunded'),
(2, 5, 'Credit Issued'),
(3, 5, 'Replacement Sent'),
(1, 6, 'Refunded'),
(2, 6, 'Credit Issued'),
(3, 6, 'Replacement Sent'),
(1, 7, 'Refunded'),
(2, 7, 'Credit Issued'),
(3, 7, 'Replacement Sent'),
(1, 8, 'Refunded'),
(2, 8, 'Credit Issued'),
(3, 8, 'Replacement Sent'),
(1, 9, 'Refunded'),
(2, 9, 'Credit Issued'),
(3, 9, 'Replacement Sent');

-- --------------------------------------------------------

--
-- Table structure for table `oc_return_history`
--

DROP TABLE IF EXISTS `oc_return_history`;
CREATE TABLE `oc_return_history` (
  `return_history_id` int(11) NOT NULL,
  `return_id` int(11) NOT NULL,
  `return_status_id` int(11) NOT NULL,
  `notify` tinyint(1) NOT NULL,
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_return_reason`
--

DROP TABLE IF EXISTS `oc_return_reason`;
CREATE TABLE `oc_return_reason` (
  `return_reason_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(128) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_return_reason`
--

INSERT INTO `oc_return_reason` (`return_reason_id`, `language_id`, `name`) VALUES
(1, 1, 'Dead On Arrival'),
(2, 1, 'Received Wrong Item'),
(3, 1, 'Order Error'),
(4, 1, 'Faulty, please supply details'),
(5, 1, 'Other, please supply details'),
(1, 3, 'Dead On Arrival'),
(2, 3, 'Received Wrong Item'),
(3, 3, 'Order Error'),
(4, 3, 'Faulty, please supply details'),
(5, 3, 'Other, please supply details'),
(1, 4, 'Dead On Arrival'),
(2, 4, 'Received Wrong Item'),
(3, 4, 'Order Error'),
(4, 4, 'Faulty, please supply details'),
(5, 4, 'Other, please supply details'),
(1, 5, 'Dead On Arrival'),
(2, 5, 'Received Wrong Item'),
(3, 5, 'Order Error'),
(4, 5, 'Faulty, please supply details'),
(5, 5, 'Other, please supply details'),
(1, 6, 'Dead On Arrival'),
(2, 6, 'Received Wrong Item'),
(3, 6, 'Order Error'),
(4, 6, 'Faulty, please supply details'),
(5, 6, 'Other, please supply details'),
(1, 7, 'Dead On Arrival'),
(2, 7, 'Received Wrong Item'),
(3, 7, 'Order Error'),
(4, 7, 'Faulty, please supply details'),
(5, 7, 'Other, please supply details'),
(1, 8, 'Dead On Arrival'),
(2, 8, 'Received Wrong Item'),
(3, 8, 'Order Error'),
(4, 8, 'Faulty, please supply details'),
(5, 8, 'Other, please supply details'),
(1, 9, 'Dead On Arrival'),
(2, 9, 'Received Wrong Item'),
(3, 9, 'Order Error'),
(4, 9, 'Faulty, please supply details'),
(5, 9, 'Other, please supply details');

-- --------------------------------------------------------

--
-- Table structure for table `oc_return_status`
--

DROP TABLE IF EXISTS `oc_return_status`;
CREATE TABLE `oc_return_status` (
  `return_status_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_return_status`
--

INSERT INTO `oc_return_status` (`return_status_id`, `language_id`, `name`) VALUES
(1, 1, 'Pending'),
(3, 1, 'Complete'),
(2, 1, 'Awaiting Products'),
(1, 3, 'Pending'),
(3, 3, 'Complete'),
(2, 3, 'Awaiting Products'),
(1, 4, 'Pending'),
(3, 4, 'Complete'),
(2, 4, 'Awaiting Products'),
(1, 5, 'Pending'),
(3, 5, 'Complete'),
(2, 5, 'Awaiting Products'),
(1, 6, 'Pending'),
(3, 6, 'Complete'),
(2, 6, 'Awaiting Products'),
(1, 7, 'Pending'),
(3, 7, 'Complete'),
(2, 7, 'Awaiting Products'),
(1, 8, 'Pending'),
(3, 8, 'Complete'),
(2, 8, 'Awaiting Products'),
(1, 9, 'Pending'),
(3, 9, 'Complete'),
(2, 9, 'Awaiting Products');

-- --------------------------------------------------------

--
-- Table structure for table `oc_review`
--

DROP TABLE IF EXISTS `oc_review`;
CREATE TABLE `oc_review` (
  `review_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `author` varchar(64) NOT NULL,
  `text` text NOT NULL,
  `rating` int(1) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_review`
--

INSERT INTO `oc_review` (`review_id`, `product_id`, `customer_id`, `author`, `text`, `rating`, `status`, `date_added`, `date_modified`) VALUES
(55, 87, 0, 'Plaza Themes', 'It’s both good and bad. If Nikon had achieved a high-quality wide lens camera with a 1 inch sensor, that would have been a very competitive product. So in that sense, it’s good for us. But actually, from the perspective of driving the 1 inch sensor market, we want to stimulate this market and that means multiple manufacturers.', 3, 1, '2017-05-13 10:37:01', '0000-00-00 00:00:00'),
(56, 88, 0, 'Plaza Themes', 'It’s both good and bad. If Nikon had achieved a high-quality wide lens camera with a 1 inch sensor, that would have been a very competitive product. So in that sense, it’s good for us. But actually, from the perspective of driving the 1 inch sensor market, we want to stimulate this market and that means multiple manufacturers.', 2, 1, '2017-05-13 10:37:32', '0000-00-00 00:00:00'),
(57, 89, 0, 'Plaza Themes', 'It’s both good and bad. If Nikon had achieved a high-quality wide lens camera with a 1 inch sensor, that would have been a very competitive product. So in that sense, it’s good for us. But actually, from the perspective of driving the 1 inch sensor market, we want to stimulate this market and that means multiple manufacturers.', 4, 1, '2017-05-13 10:38:30', '0000-00-00 00:00:00'),
(58, 90, 0, 'Plaza Themes', 'It’s both good and bad. If Nikon had achieved a high-quality wide lens camera with a 1 inch sensor, that would have been a very competitive product. So in that sense, it’s good for us. But actually, from the perspective of driving the 1 inch sensor market, we want to stimulate this market and that means multiple manufacturers.', 5, 1, '2017-05-13 10:38:53', '0000-00-00 00:00:00'),
(59, 91, 0, 'Plaza Themes', 'It’s both good and bad. If Nikon had achieved a high-quality wide lens camera with a 1 inch sensor, that would have been a very competitive product. So in that sense, it’s good for us. But actually, from the perspective of driving the 1 inch sensor market, we want to stimulate this market and that means multiple manufacturers.', 1, 1, '2017-05-13 10:39:22', '0000-00-00 00:00:00'),
(60, 92, 0, 'Plaza Themes', 'It’s both good and bad. If Nikon had achieved a high-quality wide lens camera with a 1 inch sensor, that would have been a very competitive product. So in that sense, it’s good for us. But actually, from the perspective of driving the 1 inch sensor market, we want to stimulate this market and that means multiple manufacturers.', 2, 1, '2017-05-13 10:39:42', '0000-00-00 00:00:00'),
(61, 93, 0, 'Plaza Themes', 'It’s both good and bad. If Nikon had achieved a high-quality wide lens camera with a 1 inch sensor, that would have been a very competitive product. So in that sense, it’s good for us. But actually, from the perspective of driving the 1 inch sensor market, we want to stimulate this market and that means multiple manufacturers.', 3, 1, '2017-05-13 10:40:01', '0000-00-00 00:00:00'),
(62, 94, 0, 'Plaza Themes', 'It’s both good and bad. If Nikon had achieved a high-quality wide lens camera with a 1 inch sensor, that would have been a very competitive product. So in that sense, it’s good for us. But actually, from the perspective of driving the 1 inch sensor market, we want to stimulate this market and that means multiple manufacturers.', 4, 1, '2017-05-13 10:40:20', '0000-00-00 00:00:00'),
(63, 95, 0, 'Plaza Themes', 'It’s both good and bad. If Nikon had achieved a high-quality wide lens camera with a 1 inch sensor, that would have been a very competitive product. So in that sense, it’s good for us. But actually, from the perspective of driving the 1 inch sensor market, we want to stimulate this market and that means multiple manufacturers.', 3, 1, '2017-05-13 10:40:40', '0000-00-00 00:00:00'),
(64, 96, 0, 'Plaza Themes', 'It’s both good and bad. If Nikon had achieved a high-quality wide lens camera with a 1 inch sensor, that would have been a very competitive product. So in that sense, it’s good for us. But actually, from the perspective of driving the 1 inch sensor market, we want to stimulate this market and that means multiple manufacturers.', 5, 1, '2017-05-13 10:41:01', '0000-00-00 00:00:00'),
(65, 97, 0, 'Plaza Themes', 'It’s both good and bad. If Nikon had achieved a high-quality wide lens camera with a 1 inch sensor, that would have been a very competitive product. So in that sense, it’s good for us. But actually, from the perspective of driving the 1 inch sensor market, we want to stimulate this market and that means multiple manufacturers.', 3, 1, '2017-05-13 10:41:19', '0000-00-00 00:00:00'),
(66, 98, 0, 'Plaza Themes', 'It’s both good and bad. If Nikon had achieved a high-quality wide lens camera with a 1 inch sensor, that would have been a very competitive product. So in that sense, it’s good for us. But actually, from the perspective of driving the 1 inch sensor market, we want to stimulate this market and that means multiple manufacturers.', 3, 1, '2017-05-13 10:41:39', '0000-00-00 00:00:00'),
(67, 99, 0, 'Plaza Themes', 'It’s both good and bad. If Nikon had achieved a high-quality wide lens camera with a 1 inch sensor, that would have been a very competitive product. So in that sense, it’s good for us. But actually, from the perspective of driving the 1 inch sensor market, we want to stimulate this market and that means multiple manufacturers.', 3, 1, '2017-05-13 10:41:57', '0000-00-00 00:00:00'),
(68, 100, 0, 'Plaza Themes', 'It’s both good and bad. If Nikon had achieved a high-quality wide lens camera with a 1 inch sensor, that would have been a very competitive product. So in that sense, it’s good for us. But actually, from the perspective of driving the 1 inch sensor market, we want to stimulate this market and that means multiple manufacturers.', 4, 1, '2017-05-13 10:42:15', '0000-00-00 00:00:00'),
(69, 101, 0, 'Plaza Themes', 'It’s both good and bad. If Nikon had achieved a high-quality wide lens camera with a 1 inch sensor, that would have been a very competitive product. So in that sense, it’s good for us. But actually, from the perspective of driving the 1 inch sensor market, we want to stimulate this market and that means multiple manufacturers.', 2, 1, '2017-05-13 10:42:33', '0000-00-00 00:00:00'),
(70, 102, 0, 'Plaza Themes', 'It’s both good and bad. If Nikon had achieved a high-quality wide lens camera with a 1 inch sensor, that would have been a very competitive product. So in that sense, it’s good for us. But actually, from the perspective of driving the 1 inch sensor market, we want to stimulate this market and that means multiple manufacturers.', 5, 1, '2017-05-13 10:42:50', '0000-00-00 00:00:00'),
(71, 86, 0, 'Plaza Themes', 'It’s both good and bad. If Nikon had achieved a high-quality wide lens camera with a 1 inch sensor, that would have been a very competitive product. So in that sense, it’s good for us. But actually, from the perspective of driving the 1 inch sensor market, we want to stimulate this market and that means multiple manufacturers.', 3, 1, '2017-05-13 10:43:08', '0000-00-00 00:00:00'),
(72, 103, 0, 'Plaza Themes', 'It’s both good and bad. If Nikon had achieved a high-quality wide lens camera with a 1 inch sensor, that would have been a very competitive product. So in that sense, it’s good for us. But actually, from the perspective of driving the 1 inch sensor market, we want to stimulate this market and that means multiple manufacturers.', 3, 1, '2017-05-13 10:43:25', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `oc_seo_url`
--

DROP TABLE IF EXISTS `oc_seo_url`;
CREATE TABLE `oc_seo_url` (
  `seo_url_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `query` varchar(255) NOT NULL,
  `keyword` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_seo_url`
--

INSERT INTO `oc_seo_url` (`seo_url_id`, `store_id`, `language_id`, `query`, `keyword`) VALUES
(1140, 0, 1, 'manufacturer_id=8', 'apple'),
(1136, 0, 1, 'information_id=4', 'about_us'),
(861, 0, 1, 'product_id=35', 'product-8'),
(1141, 0, 1, 'manufacturer_id=9', 'canon'),
(1143, 0, 1, 'manufacturer_id=5', 'htc'),
(1142, 0, 1, 'manufacturer_id=7', 'hewlett-packard'),
(1144, 0, 1, 'manufacturer_id=6', 'palm'),
(1145, 0, 1, 'manufacturer_id=10', 'sony'),
(1137, 0, 1, 'information_id=6', 'delivery'),
(1138, 0, 1, 'information_id=3', 'privacy'),
(1139, 0, 1, 'information_id=5', 'terms'),
(1131, 0, 1, 'information/contact', 'contact'),
(1132, 0, 1, 'affiliate/login', 'affiliate-login'),
(1134, 0, 1, 'information/contact', 'information-contact');

-- --------------------------------------------------------

--
-- Table structure for table `oc_session`
--

DROP TABLE IF EXISTS `oc_session`;
CREATE TABLE `oc_session` (
  `session_id` varchar(32) NOT NULL,
  `data` text NOT NULL,
  `expire` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_session`
--

INSERT INTO `oc_session` (`session_id`, `data`, `expire`) VALUES
('0015d851f7e7a0901f75b8e9f1', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"user_id\":\"1\",\"user_token\":\"ZnLI4Wfc7RuFULRHO59iemKu6FA1hX3l\"}', '2017-09-26 04:38:21'),
('001de1bb8fc3b48e88aed63358', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-12-26 07:23:22'),
('00a3bf54a9779205da5fc28246', 'false', '2017-11-23 01:48:44'),
('00b4cb07151890021d498bbcfd', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-08-23 09:12:00'),
('01da3d52ea56d78906f3070254', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2018-01-06 06:35:09'),
('01f64c9de005081c95f40bcaa0', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"user_id\":\"1\",\"user_token\":\"q15KVEa6TPZIDR5uUTaAse5Oe3nS926b\"}', '2017-09-18 05:47:46'),
('0263e15efa3aff555f1c63a7a1', '{\"user_id\":\"1\",\"user_token\":\"8DvwfZ3FYzM5opfCVpauf3jXPtdC7kaF\",\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-10-02 09:55:26'),
('0354bc78a4ee749787a274d4ba', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"user_id\":\"1\",\"user_token\":\"nrUk9Vdg9kZnAzli7Fzsw5LJhajUpSkf\"}', '2017-08-30 04:39:23'),
('037d772c3dfb23e2ab5c5e0143', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-09-06 02:02:26'),
('03da604100759555a621fe3802', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"user_id\":\"1\",\"user_token\":\"d01XJrsDs0kRU4rN0MQ3LdjJUxHkQcS4\"}', '2017-08-26 04:37:41'),
('046a4ce0af1c2ea626b79747c6', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-09-20 07:29:54'),
('046bea2af45a6025ce7fc1435d', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"user_id\":\"1\",\"user_token\":\"t91HJmgj3WvIdY3pnwVnKqWLXTf1m3Sz\"}', '2017-11-02 04:03:31'),
('04ddeea457af09eccebb9ac63f', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"user_id\":\"1\",\"user_token\":\"V5uIxyhYdj3EzBp40Yfrx5hu6v3rM3fV\"}', '2017-12-05 07:12:37'),
('0567180940a07a25ff123fc56d', 'false', '2017-10-14 01:55:04'),
('05a5286871319126e3f9fe9393', '{\"user_id\":\"1\",\"user_token\":\"tgxN0XjGRMIFPCtL04D6kYxeYKsQrVwl\"}', '2017-10-20 03:52:37'),
('0614aedf0b4329f4c9539497e2', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-09-15 08:19:35'),
('06e42f665581110284695b659a', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-11-16 01:54:26'),
('0715a4a011a55cadf4ec696fe4', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-09-30 05:15:30'),
('07707366bdca7e1db4498abfdc', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"user_id\":\"1\",\"user_token\":\"KRACvTrRsSLE6Z2uwE8Vo3VbtKrM8TfL\"}', '2017-11-01 04:20:54'),
('07acc7e5cc5e54f1e315e4dd83', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-10-25 07:07:36'),
('07efca26f76e8febafdf56854e', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-11-28 10:40:48'),
('080655b7639689cc968f084dba', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-11-07 07:13:43'),
('0885e654f8d4b643460585fbf4', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-09-14 03:53:13'),
('089952f567e686ec028cf5bccf', '{\"language\":\"de-de\",\"currency\":\"USD\",\"user_id\":\"1\",\"user_token\":\"TDGNCVMko0RmGftGn8rxal9GuoDity8P\"}', '2017-10-24 08:09:51'),
('08c54df423cf145bec2a55fced', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-08-25 10:49:24'),
('0a48adcaae1bb5cfbfc3e7ba70', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"user_id\":\"1\",\"user_token\":\"azd6PDd8AQF8v6Ea8xZJldeSAeHmby9d\"}', '2017-10-31 04:10:36'),
('0bbd9b62da95e22c65a37ad315', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"user_id\":\"1\",\"user_token\":\"JVILzj5yCJN1QL9ZRrZuLWhR1Jkdu35x\"}', '2017-11-23 04:55:29'),
('0bcb547a01297ab358d9a72c3c', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2018-02-05 04:52:25'),
('0be3a8ae023b5a588e154490a4', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-10-20 04:45:21'),
('0bee481d83e6bde776b1cec852', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-11-27 03:27:13'),
('0de0587629346c586da5b56674', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"user_id\":\"1\",\"user_token\":\"d3ibD1SxqDwWqxiDOVHHJ5A0F5CUPkZI\"}', '2017-12-19 10:19:49'),
('0de961928c08ed76fa5d5bff60', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-11-29 10:08:57'),
('0df5eb6983ee47f5ecf3710215', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-12-21 10:07:37'),
('0f31509f50a7f4e960b99deaef', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2018-01-16 02:09:18'),
('0f5463572f1dbdbb3ac56d4893', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"user_id\":\"1\",\"user_token\":\"XT0f42t7h5szhnwJro6U7CRpgigPcVL6\"}', '2017-10-12 04:48:41'),
('0f83655047f11b7e68dce1c17e', '{\"user_id\":\"1\",\"user_token\":\"i6W2HYEhIMWzcm7Otf3Xuy5u4hj9w32t\",\"language\":\"en-gb\",\"currency\":\"USD\",\"compare\":[\"47\"]}', '2017-08-19 05:06:34'),
('109ad9d35802fa81055da0fd2c', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-11-13 02:23:06'),
('10d041f572732be103c753cdfa', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"user_id\":\"1\",\"user_token\":\"8ZcyiVjeXsnwxIJ7161T6CzLygAXJvct\"}', '2017-10-12 10:40:45'),
('10feabd9539425acf5ade9b7ec', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-11-22 01:53:44'),
('11162bd80d6d4d03aff92a8e8e', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"user_id\":\"1\",\"user_token\":\"MTyh5T23RBWNq2haYZygTun7XM8qz1Cs\"}', '2017-11-24 04:44:27'),
('112c9bdc0570a320f140126024', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-11-06 10:38:19'),
('11438b195edbf733e6a7de63fe', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-09-14 03:36:00'),
('12383810a0972d7e3d85c3e3d6', 'false', '2017-12-27 04:00:29'),
('126bff18a9cee575a36f167b7b', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-08-25 04:44:28'),
('1316b75177af80647f798b2fba', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-12-04 04:31:12'),
('13284bdf52a8dd5c8ed97e1015', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-12-01 04:52:58'),
('1380f21641e331e6dc856f9da2', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"user_id\":\"1\",\"user_token\":\"lBO18ROi2MmirrXr5RVxjCgEcrfqXYL8\"}', '2017-10-09 09:19:35'),
('13ac6d7528f8d79a7d37e15d97', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-11-13 02:23:43'),
('13acbf04f48f676bca17f26928', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"user_id\":\"1\",\"user_token\":\"wKMXwrWzj21EEOO3SGTuEmlk3RRsPPAf\"}', '2017-09-19 04:41:31'),
('13ddbf6b5254ffdf04b576f5bf', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2018-01-06 06:39:23'),
('14601e0fe53d224e169ea75d27', '{\"user_id\":\"1\",\"user_token\":\"KIfd8vMRJX1D2bf9fjLqu3Rhn6Q95GvB\"}', '2017-12-28 07:03:33'),
('14ea681a5fc1059d20bd01ea16', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"user_id\":\"1\",\"user_token\":\"tdjpDenw4tZidFASDnvsfdsAzWmcjsz6\"}', '2017-12-12 15:04:38'),
('15394c82db16c0b57ef6efcb37', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-11-10 07:58:02'),
('16598179cf4f146abd93dce3b8', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-08-26 02:04:08'),
('1730c67a664b4b461a06f2c72e', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-12-29 04:25:13'),
('179c51233c379190a2d01f1cfc', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"user_id\":\"1\",\"user_token\":\"veyevoZ3tX6PXvw51YN3WWVQl9Wua72J\",\"account\":\"register\",\"customer_id\":\"1\",\"payment_address\":{\"address_id\":\"1\",\"firstname\":\"Plaza\",\"lastname\":\"Themes\",\"company\":\"\",\"address_1\":\"NewYork\",\"address_2\":\"\",\"postcode\":\"100000\",\"city\":\"NewYork\",\"zone_id\":\"3513\",\"zone\":\"Aberdeen\",\"zone_code\":\"ABN\",\"country_id\":\"222\",\"country\":\"United Kingdom\",\"iso_code_2\":\"GB\",\"iso_code_3\":\"GBR\",\"address_format\":\"\",\"custom_field\":null},\"shipping_address\":{\"address_id\":\"1\",\"firstname\":\"Plaza\",\"lastname\":\"Themes\",\"company\":\"\",\"address_1\":\"NewYork\",\"address_2\":\"\",\"postcode\":\"100000\",\"city\":\"NewYork\",\"zone_id\":\"3513\",\"zone\":\"Aberdeen\",\"zone_code\":\"ABN\",\"country_id\":\"222\",\"country\":\"United Kingdom\",\"iso_code_2\":\"GB\",\"iso_code_3\":\"GBR\",\"address_format\":\"\",\"custom_field\":null}}', '2017-09-04 15:12:53'),
('17a25ccf9b21c6154678e74ec5', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-10-03 10:18:35'),
('17d65f90922d1a78155b1969df', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-10-23 09:38:11'),
('181a4563f5dc8dd54dd33cb554', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"user_id\":\"1\",\"user_token\":\"ApUu8sSjYZGCmcLA1OwtjTpVPgrzxOBP\"}', '2017-10-18 10:08:40'),
('181cb0301db988d40aa0928256', 'false', '2017-11-25 01:46:33'),
('1851b81d1174e5a60f455584a9', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"user_id\":\"1\",\"user_token\":\"5FwUQRsOmTBB9z1YNQymPBNdRHXH4xzX\",\"wishlist\":[\"51\",\"56\",\"64\"]}', '2017-09-09 10:12:38'),
('1868dc4bc5319d7e31bdcfee74', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"user_id\":\"1\",\"user_token\":\"qpmh6u1wF7Y2dJO53M8zmltN6Q3JymL9\"}', '2017-12-12 04:52:35'),
('1903ec957a856dfa80720e9c64', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-08-26 05:00:28'),
('194c41ee8e2f063e4fd25da540', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"user_id\":\"1\",\"user_token\":\"geKva80hLoOep6X1HnO7laSoqCNhUEQy\"}', '2017-11-10 07:15:21'),
('19553a5dbc1337d0adeb959871', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-10-02 10:29:14'),
('19ec4d4c8ab1e1878e615def17', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"user_id\":\"1\",\"user_token\":\"BwhCfluOzuuAWHjxOU1uUVVrl7PjX37I\",\"vouchers\":[]}', '2017-11-20 04:30:05'),
('1a15f5738cc7931742148b5b35', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2018-02-05 06:53:45'),
('1ab9a8e68c7a2a565492b42df3', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-09-14 09:19:39'),
('1b92227812fcc5950261ffb67d', '{\"user_id\":\"1\",\"user_token\":\"JTpdZxghacDqM3vT9ZusZ55msurHFXmp\",\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-08-25 04:55:01'),
('1c3a786b9892d64a114c149061', '{\"user_id\":\"1\",\"user_token\":\"9xxYKeKCwgCrcTJOZEBoV3merDXTqRlm\",\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-12-29 04:04:53'),
('1cfa4d9896bf7ceb27a3fb4042', 'false', '2017-11-20 01:48:09'),
('1e2600eca9bbe392191ddc859b', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"user_id\":\"1\",\"user_token\":\"lrYEps9WCq6NIoC6cJVLT4uTwnI22Sq3\"}', '2017-12-27 04:36:11'),
('1fabc928a0318a71f5470c9dbd', 'false', '2017-11-10 06:56:57'),
('1fdfc4b3931008cf4b4da7cb95', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-11-24 06:59:18'),
('2013982fc27f1b4459b647a3d0', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"user_id\":\"1\",\"user_token\":\"kKvt6gMYxGZ8FH6MATqwI9BImAdVY5j4\"}', '2017-11-25 02:51:20'),
('20297c7c6101a444abb5994850', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-10-06 07:06:17'),
('2033852c7330f1d49ec1e4bf5b', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-09-22 02:14:12'),
('211c40447d5385083142474288', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2018-02-05 06:57:27'),
('217fac527fc1b25bed167673d0', '{\"language\":\"de-de\",\"currency\":\"USD\"}', '2017-10-24 04:33:39'),
('218289d2c3b5f28f1bcef579ee', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-11-10 03:33:24'),
('219ab25afd56417a9bb7622717', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2018-02-05 02:41:14'),
('21e1448e3d2324d3ba06cf4d70', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-10-05 04:33:24'),
('2270fa1c12040a820b32f155cf', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"user_id\":\"1\",\"user_token\":\"iN4NH0PvbE3LMRyD39Y7RZZp0Yg3fRtQ\"}', '2017-11-13 04:11:24'),
('22859f8aa9f74f366677e502b4', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"user_id\":\"1\",\"user_token\":\"7H28vK9qZ4UghxZE89bcMy0kTnSqUEuX\"}', '2017-09-11 10:14:25'),
('23907f102384a2d9aa79121de8', '{\"user_id\":\"1\",\"user_token\":\"XVMw3x7rha39XpzshoWMcs1WjdLBRdRL\",\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-09-22 09:37:36'),
('2474f1e95f0700c3cfac7eee66', '{\"user_id\":\"1\",\"user_token\":\"yXEikMSd7y75RKhEC4pH03m6SaVL8v6F\",\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-12-11 10:36:49'),
('247cca773134825042cb38da07', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-12-22 15:21:39'),
('24e5d1923c2b6054979ced0d4c', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"user_id\":\"1\",\"user_token\":\"AshgRVpJL0edS9q120SqUsVyxfRClHcS\"}', '2017-11-07 04:30:02'),
('256594db22450166f7f3ce5930', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"user_id\":\"1\",\"user_token\":\"wNd5NzoIkDfliAKZy04HbqNBtqCuPpoW\"}', '2017-11-03 10:21:09'),
('26166e6b13877a1e08ee777019', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"user_id\":\"1\",\"user_token\":\"daZJyuoDOm2MAG0lwBm9nWVbTJ1mJKUG\"}', '2017-11-17 04:24:42'),
('26b41ce6baa7c30142a920fb03', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"user_id\":\"1\",\"user_token\":\"fGkjP5Q7HXlGKRUKKbLZP2Ld7PXdSN0R\"}', '2017-10-14 03:09:46'),
('2801f33acebbdb2f20ce76df19', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-11-27 09:51:25'),
('2818e0d665f08fbda8517b1eb0', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-08-21 02:46:38'),
('29b71ab5ef0cfce52fad44ffd9', '{\"user_id\":\"1\",\"user_token\":\"yN3r8OU8uvenXTEnVbfkAroHRWxqq7JN\",\"language\":\"en-gb\",\"currency\":\"USD\",\"install\":\"FR0gl4qNJk\"}', '2017-08-14 10:43:48'),
('29fbfd809d2cbf818840c9e644', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-11-09 02:04:00'),
('2a5292b9cc1e8f9912266044c4', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-11-04 03:09:43'),
('2b28fd5c7a6c03034733e7c74f', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-09-15 08:20:22'),
('2b98ec7d33ccdd8423ab8243df', 'false', '2017-11-27 01:52:18'),
('2cb18af1e6576346242df1b6c0', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"user_id\":\"1\",\"user_token\":\"v71uSlbNEX31oJcty1Ys3llCdIlyUa3V\"}', '2017-12-22 10:32:54'),
('2ceb1cd719fcc506676399a0cb', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-12-02 04:10:24'),
('2cf4b84d9dd8a488f287600293', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-10-03 02:55:14'),
('2dd6080c47d0433c14fe158f33', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-10-04 09:05:02'),
('2e001577696f5180fbfcb5f208', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-11-07 04:33:45'),
('2e65d79e5d1e200c28360835e4', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2018-01-10 08:39:29'),
('2e6f87be313020e9d092c48877', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2018-01-06 06:54:39'),
('2e75b11f4dc1a1b8127f90b92b', 'false', '2017-11-07 01:46:38'),
('2ec4fd100b5d579e00fd657a4b', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"user_id\":\"1\",\"user_token\":\"4mR1hfgF4hz9pryffiw23pLRL6Ww5Wy3\",\"install\":\"xV3aoVdXMD\"}', '2017-08-29 10:05:28'),
('2f71e249ce95f0b7b7ce8085e7', '{\"user_id\":\"1\",\"user_token\":\"8LkQzZYEndB3955YCx7IF0UgAen5UMXr\",\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\",\"shipping_address\":{\"address_id\":\"1\",\"firstname\":\"Plaza\",\"lastname\":\"Themes\",\"company\":\"\",\"address_1\":\"NewYork\",\"address_2\":\"\",\"postcode\":\"100000\",\"city\":\"NewYork\",\"zone_id\":\"3513\",\"zone\":\"Aberdeen\",\"zone_code\":\"ABN\",\"country_id\":\"222\",\"country\":\"United Kingdom\",\"iso_code_2\":\"GB\",\"iso_code_3\":\"GBR\",\"address_format\":\"\",\"custom_field\":null},\"payment_address\":{\"address_id\":\"1\",\"firstname\":\"Plaza\",\"lastname\":\"Themes\",\"company\":\"\",\"address_1\":\"NewYork\",\"address_2\":\"\",\"postcode\":\"100000\",\"city\":\"NewYork\",\"zone_id\":\"3513\",\"zone\":\"Aberdeen\",\"zone_code\":\"ABN\",\"country_id\":\"222\",\"country\":\"United Kingdom\",\"iso_code_2\":\"GB\",\"iso_code_3\":\"GBR\",\"address_format\":\"\",\"custom_field\":null},\"shipping_methods\":{\"flat\":{\"title\":\"Flat Rate\",\"quote\":{\"flat\":{\"code\":\"flat.flat\",\"title\":\"Flat Shipping Rate\",\"cost\":\"5.00\",\"tax_class_id\":\"9\",\"text\":\"$8.00\"}},\"sort_order\":\"1\",\"error\":false}}}', '2017-10-04 03:05:46'),
('2f7775eec04836b4417c3f8201', 'false', '2017-11-14 06:50:33'),
('30164372c31e3aa666254237a0', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-09-06 10:34:40'),
('304c746f8444a406d101a3d1ef', 'false', '2017-09-25 02:05:40'),
('31034a7ea5222748c9370fa171', '{\"language\":\"de-de\",\"currency\":\"USD\",\"user_id\":\"1\",\"user_token\":\"HOjb2BKkWOBadbMX2b4LwmNdRXI5gSKQ\"}', '2018-01-07 14:14:35'),
('31854fa6ebc22567fce29917c3', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2018-01-06 06:37:06'),
('3188e8160e94c66cf79f4778ee', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-12-22 10:28:34'),
('323509712a9f2eafe355d4586d', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"user_id\":\"1\",\"user_token\":\"UoxWBV2eJXUq83IrtpCjdfS5CG7Q8DrF\"}', '2017-08-30 10:33:15'),
('32393f4292b51037cdd73686ee', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-08-28 10:35:14'),
('32a50f0dd36e69c2e79de96097', '{\"user_id\":\"1\",\"user_token\":\"gGbddFJLDIsOATwBCVUkJulDoSIRUepO\",\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-12-25 10:15:42'),
('32be9ad50a8e8c14be147f8da7', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"user_id\":\"1\",\"user_token\":\"H1J2T1PoAVvVeFX2HRqENDUHAA1qJLkW\"}', '2017-12-26 03:45:41'),
('33173abb40fc96f7cf66f18a42', '{\"user_id\":\"1\",\"user_token\":\"XKmHG2jGd3oa6znI8iGEYIgKhJcwQrU9\",\"language\":\"en-gb\",\"currency\":\"USD\",\"install\":\"F6SoOs08dW\"}', '2017-09-21 10:31:01'),
('331c08f014498038989029b713', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"user_id\":\"1\",\"user_token\":\"6Ikg3p7FBz82Q5MZHbkMikhPojYax93b\"}', '2017-09-28 02:10:13'),
('335221859d0fcb418ce3ce9f30', 'false', '2017-09-09 07:28:07'),
('35109239798762c8fc86c832a9', '{\"user_id\":\"1\",\"user_token\":\"Kdj7UDWpi6z4nr4cN1No1KbVgJr52Czg\"}', '2017-09-27 02:11:10'),
('3546aaf2627022813b51bb4d47', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-08-16 08:37:22'),
('35b6719ac4f8a7157adbb1a623', 'false', '2017-12-22 07:04:41'),
('35f29f4ed6c27ed8a3a74da2dc', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"user_id\":\"1\",\"user_token\":\"ShINhnFs5No31QH0l2Sx6H0zm83pfmU9\"}', '2017-10-17 09:14:00'),
('364021efebd13083e9e1914f64', '{\"user_id\":\"1\",\"user_token\":\"3qzSWUubDKbAbNQqi202eVRBZj9TYHPO\",\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-11-28 10:05:18'),
('36aaaaa854a9a8e30b6c70a8fe', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-10-20 04:20:52'),
('374f7d4cc117432f0edc48a098', '{\"user_id\":\"1\",\"user_token\":\"nG06AtdFxSIg1PHZ0nP11xKR6dXArIP7\",\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-08-18 10:19:51'),
('38aa384bac77c43293f64c039e', '{\"user_id\":\"1\",\"user_token\":\"moDXkDGM5K6IkqT8BeOJFmxVf4yM3DUJ\",\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-12-23 03:25:16'),
('38db99aaf2945ad1bf2c83d7db', '{\"api_id\":\"5\"}', '2017-11-01 07:51:51'),
('399701d08f02fc0804bd59949e', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-09-20 10:11:50'),
('39b57c72eb4258eb80fb88deed', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-11-07 07:26:02'),
('3a41151266b4ccaf3d13e8fd99', 'false', '2017-09-04 12:34:40'),
('3a4387f7751f5f78f98d1bdb88', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"user_id\":\"1\",\"user_token\":\"EQfoaDeXZkSKBag5Dc3fLn7EGda6ICAp\"}', '2017-09-01 04:56:43'),
('3aba02221a87550815b8b9c3ae', '{\"user_id\":\"1\",\"user_token\":\"8PH92QnpCmuf9YXFZcFlxy4KLc7CQ34X\"}', '2017-08-29 01:34:26'),
('3b090a13ed4a9739429739d893', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-10-04 04:45:39'),
('3baddcaf46e64598d2515f7e09', '{\"user_id\":\"1\",\"user_token\":\"1aUA8VxO8627PxlFbwBdaIVlSyyWjU4i\",\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-09-28 02:43:14'),
('3bf81937845db77cf5b64feb7c', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-12-19 14:53:04'),
('3bfa932c95db649896713a2d0d', '{\"user_id\":\"1\",\"user_token\":\"7DvpaL3CYnRk5VkakpIawCoQQRSSe6PX\",\"language\":\"en-gb\",\"currency\":\"USD\",\"compare\":[]}', '2017-10-09 04:09:09'),
('3c239a440294ba05751a8cac9e', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-12-24 05:34:31'),
('3c36a9006a471b05526cf39c75', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-11-21 01:39:08'),
('3d33a13009cbfb93e11bf7857e', '{\"user_id\":\"1\",\"user_token\":\"9P8o15D7TFkFRKo5yoGxvj8yz65JB7OT\"}', '2017-10-20 09:21:17'),
('3e064efb07361755b1aa7902fc', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-12-23 16:17:39'),
('3e5734b64829c9172dc6f9b506', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"wishlist\":[],\"customer_id\":\"1\"}', '2017-09-14 09:49:18'),
('3f5459900d991f9253af275676', '{\"user_id\":\"1\",\"user_token\":\"Y4nWb2vslNrsNI7wLiiaKo84nGk0btjX\",\"language\":\"en-gb\",\"currency\":\"USD\",\"compare\":[\"30\"]}', '2017-08-15 04:47:25'),
('3fdafb95ad975b4ada94fb5ef1', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"user_id\":\"1\",\"user_token\":\"i0Og8CgWP96GsUsmp6ne0fa2Qcl25vkJ\",\"compare\":[\"112\"],\"wishlist\":[\"112\"]}', '2017-09-27 10:53:18'),
('405d144dde302e2b5f9a47f417', 'false', '2017-09-26 02:05:58'),
('413d8dbc7c58a5d97c7efa3fc1', '{\"user_id\":\"1\",\"user_token\":\"natoGoji2eYBdUWMOqBSmiPZP0ttdY7c\",\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-09-25 04:53:22'),
('419338fe515b5498c556435e3e', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"user_id\":\"1\",\"user_token\":\"JpBFdQQWg3gsH53IrxTJL3fx9Daf3CQG\"}', '2017-09-01 10:52:52'),
('41aa2ae0bccda2207d599009c2', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"user_id\":\"1\",\"user_token\":\"P9d60X2j3sVeXI2jKYjGuCydaqOzM8hb\"}', '2017-09-28 10:34:00'),
('41da129001fb3d39640eeca3d0', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"user_id\":\"1\",\"user_token\":\"AsBjb3NS1pcIj3Hyp5HoZw1suXIIaO8x\"}', '2017-10-31 09:59:32'),
('42a9fc8e3d556c245655145c01', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"compare\":[\"56\",\"51\"],\"wishlist\":[\"56\",\"51\"]}', '2017-09-18 10:52:40'),
('42c52a66359fdca350ae50848b', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-09-15 07:38:15'),
('42ef235d49727b7a8131457923', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-10-16 08:43:28'),
('4499d69054feaea649915c6d70', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"user_id\":\"1\",\"user_token\":\"GYKiNfBN13Kdrxype91aZFnwOAHl6JZH\",\"install\":\"cMofDYVXml\"}', '2017-10-10 04:10:36'),
('44cb11f421877221b3cb13b96c', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-10-18 10:07:46'),
('44ec92ed1e34a4fde71824bf73', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-10-03 02:53:03'),
('4557e05e2156d0583bfbaed2e4', '{\"user_id\":\"1\",\"user_token\":\"x143vFY0EhsVITuELRL1hgWKqfUgWgk7\"}', '2018-01-15 07:22:05'),
('4623dac90ae52f3488b31a279b', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"user_id\":\"1\",\"user_token\":\"WYIWRpimdkTvYawiritdiqgAGiptsZFJ\"}', '2017-09-26 10:31:06'),
('466eadc726d293a8697f20818c', '{\"user_id\":\"1\",\"user_token\":\"96VqPbhEOObWUdzIlA0WMshr7dXp0sOS\",\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-08-18 06:55:48'),
('4740983f085df5b8951be6090c', '{\"user_id\":\"1\",\"user_token\":\"NkgSiGXcl80O6dpUISSLUL110QdSiV72\"}', '2017-10-05 04:33:32'),
('480889454491d09d0794f9aad5', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-10-20 04:30:11'),
('480a3d7de611c36f4717a6e1ed', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-12-13 07:10:36'),
('480aff053694b54af97d4c098f', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2018-02-05 03:40:09'),
('485c0d5578f93b2e81851eb3af', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2018-01-30 04:49:37'),
('498d1489012ff90d83e3d59420', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-09-13 04:42:47'),
('4bfc696518190e8f420ac8cf70', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"user_id\":\"1\",\"user_token\":\"x29xJqOCFc6SKjghJYdTogCXXHmXdSTZ\"}', '2017-10-30 04:06:23'),
('4c5d4ccc2fd99b77dc6a44d470', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-10-25 03:58:39'),
('4ca9375ab22c8e48fef3b12237', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-12-21 07:27:59'),
('4cf63686acc45b7d2ec7d03b02', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-09-20 07:29:52'),
('4d11ebd52a2e4934bc7109ea8d', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"user_id\":\"1\",\"user_token\":\"FMl5eZXjssqBwqK9ZhYFqhqC65mxNZ00\"}', '2017-09-29 10:34:55'),
('4d52f5de44fb0439f58cc37240', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-09-20 07:29:47'),
('4d98c8305fc5a4fae981f2c3de', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-09-22 02:51:10'),
('4f20fb3800eca1ded130a6cad6', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"user_id\":\"1\",\"user_token\":\"CMBOvfT6TP8Tl2aNp8PPfZmfkIW8kS6a\"}', '2017-09-29 04:52:47'),
('4fb6ce74efe302824323a21c78', 'false', '2017-10-02 02:02:55'),
('4fcba710abb7e10ab5d6a5b837', '{\"user_id\":\"1\",\"user_token\":\"njhuySU8eWk0uYG9T8bHgRY8YXWuKrIw\",\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-12-24 09:24:58'),
('4fdad303ed7d88f0954201813d', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"user_id\":\"1\",\"user_token\":\"9rjb0M0c7GAUoBvgwDQGiBqQxumXQD39\"}', '2017-09-25 10:38:36'),
('50921e679b24b47453e2e50054', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-09-15 02:56:58'),
('50956c2590fcede79fa0069ec8', '{\"language\":\"en-gb\",\"currency\":\"EUR\",\"user_id\":\"1\",\"user_token\":\"pV5WsoAx9b4nS2pf5IH5tYgum8ZxSYyM\",\"install\":\"XoDZ4F00IS\"}', '2017-08-09 10:45:49'),
('51ab66dc00338bff4c6d43ecdf', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-11-28 02:53:50'),
('51b6e6cc483915f5e06e311e5c', '{\"language\":\"de-de\",\"currency\":\"USD\"}', '2018-02-05 06:27:36'),
('524779f0b11dd42c76add6189d', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-08-28 04:50:39'),
('5314cc1a0d9b901a7c77b47d2e', '{\"user_id\":\"1\",\"user_token\":\"JQPqhkyC6GWWiTurSmK1JX9pqcT2ekRF\",\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-11-21 04:40:08'),
('5331aae1e2ac2c396c19cb4d23', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-12-28 04:25:10'),
('534332b34ac047482f86784064', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"user_id\":\"1\",\"user_token\":\"HAh00PuCHCulAUxO7HOnkUMBvwwyIMi2\"}', '2017-11-20 10:20:53'),
('53f61fbbf2d8b2f8f02589153f', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-10-21 03:33:04'),
('5436c82a7b7ee99d1c6ff4e0e2', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2018-01-30 04:37:08'),
('5465f960d28a0d5832c2a9eb52', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-12-04 08:13:13'),
('5569293be9bfc3fa88c97a1bb3', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"user_id\":\"1\",\"user_token\":\"5qnl5zQlvE7VNbvTtarLUDvFlUtM01Aj\"}', '2017-11-02 10:20:23'),
('5574e2410034d852c17d128c69', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"user_id\":\"1\",\"user_token\":\"uMDTOqr509m15LSjCHvmq3602INUa99T\"}', '2017-11-14 04:38:32'),
('55ba0856cd29b0be46dc4f40d0', '{\"user_id\":\"1\",\"user_token\":\"0Sme4pbSm0Yp07aw5FtkDl8MTDYq6j5S\",\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-09-28 04:05:35'),
('55d1cf45d1632164424b1548b2', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-10-18 09:01:39'),
('560f6d32b7bc893d0f11e2d044', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-09-19 02:52:19'),
('56676c10bdf5ad8e7c504b5f37', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-09-15 08:18:49'),
('569b3c79577d404ff7a370e8d1', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"user_id\":\"1\",\"user_token\":\"WaAIEt1aiWXuADjtVeOEeGKXpTu4GQws\"}', '2017-11-08 08:29:41'),
('5865d190c18d6e61584aedec3a', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"user_id\":\"1\",\"user_token\":\"ZxSjBZJZf4eovcQkuWpEKnMFk3hXG1KM\"}', '2017-11-07 10:09:40'),
('58fbb8d10551facf21788b0d70', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-11-10 03:54:36'),
('595e6a3d7f31b0505b9c7a2473', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"user_id\":\"1\",\"user_token\":\"HCA8COgWOBCoyvR7A6zQmGYui05UD75i\",\"customer_id\":\"1\",\"shipping_address\":{\"address_id\":\"1\",\"firstname\":\"Plaza\",\"lastname\":\"Themes\",\"company\":\"\",\"address_1\":\"NewYork\",\"address_2\":\"\",\"postcode\":\"100000\",\"city\":\"NewYork\",\"zone_id\":\"3513\",\"zone\":\"Aberdeen\",\"zone_code\":\"ABN\",\"country_id\":\"222\",\"country\":\"United Kingdom\",\"iso_code_2\":\"GB\",\"iso_code_3\":\"GBR\",\"address_format\":\"\",\"custom_field\":null}}', '2017-09-10 15:19:46'),
('59e30a137220a961c5211dd7cc', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-12-01 04:52:51'),
('5a7b7ad6c16c9bf31aec39b814', '{\"user_id\":\"1\",\"user_token\":\"GI8D8SSGHB546DYnProanF47S7yAYwxK\"}', '2017-10-19 04:04:19'),
('5ad3ace2fb2af9f89bb4d149b8', '{\"user_id\":\"1\",\"user_token\":\"3XIf7pnhMXdEA4pFiYNKPzCoWVSXIcJo\",\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-09-12 15:03:53'),
('5b28b717138d939659d3e84cf0', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\",\"payment_address\":{\"address_id\":\"1\",\"firstname\":\"Plaza\",\"lastname\":\"Themes\",\"company\":\"\",\"address_1\":\"NewYork\",\"address_2\":\"\",\"postcode\":\"100000\",\"city\":\"NewYork\",\"zone_id\":\"3513\",\"zone\":\"Aberdeen\",\"zone_code\":\"ABN\",\"country_id\":\"222\",\"country\":\"United Kingdom\",\"iso_code_2\":\"GB\",\"iso_code_3\":\"GBR\",\"address_format\":\"\",\"custom_field\":null},\"shipping_address\":{\"address_id\":\"1\",\"firstname\":\"Plaza\",\"lastname\":\"Themes\",\"company\":\"\",\"address_1\":\"NewYork\",\"address_2\":\"\",\"postcode\":\"100000\",\"city\":\"NewYork\",\"zone_id\":\"3513\",\"zone\":\"Aberdeen\",\"zone_code\":\"ABN\",\"country_id\":\"222\",\"country\":\"United Kingdom\",\"iso_code_2\":\"GB\",\"iso_code_3\":\"GBR\",\"address_format\":\"\",\"custom_field\":null}}', '2017-10-04 03:06:48'),
('5c7adb21e65ea6dee6112d93b9', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"user_id\":\"1\",\"user_token\":\"ZLaHLAVOgA7MIQkrPg5EGMsRDqTrKO3P\"}', '2017-09-21 03:25:55'),
('5c903c38cb8bed8df65c6929d7', '{\"user_id\":\"1\",\"user_token\":\"RTQ11fq4M16vB64X4UgZMkWaLkwHdKbe\",\"language\":\"en-gb\",\"currency\":\"USD\",\"success\":\"Success: You have modified CMS Block!\"}', '2017-12-29 10:50:49'),
('5cb541fa956fbdbe163db53473', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-11-09 04:35:50'),
('5d66b31dc90b5c78ccff9e2051', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"user_id\":\"1\",\"user_token\":\"3TRTEj5Sg0181SSZ8giODCK7LQezJYCB\"}', '2017-10-04 09:33:42'),
('5d6edc3fbb07f973b7f4d1e8f0', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2018-01-10 03:26:01'),
('5db31bdb59c68913e5dd37816b', '{\"user_id\":\"1\",\"user_token\":\"PtfJWAzKxr8cQhLUO9sT4TjPcVjMnAnw\"}', '2017-10-25 15:44:26'),
('5dbef9c7b339c9d9ba33b42cff', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"user_id\":\"1\",\"user_token\":\"lxyPyaKqOCxEE5KW7wXdVE5MvxvA5XJV\"}', '2017-12-13 09:48:55'),
('5dbfa241bc70b9dd864c650f8d', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"user_id\":\"1\",\"user_token\":\"AOgOcZPFCL3AXGobiW9R2QE3MeHJMAfG\",\"install\":\"wGvRIbfvFG\"}', '2017-11-23 10:37:32'),
('5e288fec6b69a7b8d42f4cd692', 'false', '2017-09-28 02:00:31'),
('5fc4d37ed50feeb74f482af0ee', '{\"user_id\":\"1\",\"user_token\":\"bQTecf6grliEfaxiPsArUADGQS01Pw0e\"}', '2017-09-22 03:14:47'),
('5ff7819dfb7f82bc9f0e5e89ad', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-10-24 08:10:44'),
('5ff7c65a1aed477ee38e4e43cc', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2018-02-05 06:42:29'),
('5ff99da8664e9b2197519a1e19', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-09-13 08:49:05'),
('60ac2e3ebebfc006f64f16b6f3', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"user_id\":\"1\",\"user_token\":\"cFcOwXzWVbIN6SjamXg6sBjvlW0fc96h\"}', '2017-11-22 02:35:59'),
('612ec0b87499b4a62ad0ab3c91', '{\"user_id\":\"1\",\"user_token\":\"IUqRTHY8oVvONcuDwXUJdJscXMm2HKKc\",\"language\":\"de-de\",\"currency\":\"USD\"}', '2018-01-30 07:35:35'),
('619b862e5be46aed83c08a65f9', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-09-01 04:57:12'),
('61c2593ddbebc5616f22806c3e', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-10-21 01:56:36'),
('61f169dd99d650c0e2ac6fb760', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-11-07 09:50:06'),
('62133ff9db2a201f06cec34535', 'false', '2017-11-11 01:52:28'),
('6291c0c49858a0f47707bfa7fb', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-10-05 07:02:39'),
('629e286ee9776d20ae813ae6d9', '{\"user_id\":\"1\",\"user_token\":\"38qQH1w0Eo5ZPBkRqRjyfqVWagt8Hzxj\"}', '2017-12-27 09:42:25'),
('62c3d184599fe6d50e8075fe49', '{\"user_id\":\"1\",\"user_token\":\"vLWMjsnU8XbxV9JyR6Aoi2alGOlEtBAO\",\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-09-27 03:08:24'),
('62e6f41fb54f6271e42019fbdc', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-12-28 09:20:45'),
('636f22d362d72cfaf023e9000a', 'false', '2017-11-28 01:49:58'),
('63abb3fd95fd00553c5d5e5575', 'false', '2017-09-08 01:41:39'),
('6520008f28a0407292aa2fc1c9', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-12-26 07:23:35'),
('6584f65e2f5d85fbe12fad55ab', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-10-19 10:21:56'),
('65daf8bc9c9df79037fe801505', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"user_id\":\"1\",\"user_token\":\"eE5Lses3JZ3AYylpJPLQKGGiPEOj8bca\"}', '2017-11-16 04:19:10'),
('663b3ecbd1042ded3f93634b98', '{\"user_id\":\"1\",\"user_token\":\"k5qHypPGP90GBdtIvSWiCmPax1zN5o8O\"}', '2017-12-04 08:13:15'),
('6715455b26d5d471b30bde5bd5', 'false', '2017-11-15 07:10:40'),
('6772f23775f8b4c0d1cde76980', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-10-06 07:33:11'),
('67e8a734e677865ea6be1fa003', '{\"user_id\":\"1\",\"user_token\":\"8bLHjYJcUKASk9pTqPYnDtIdaAOl7Pbs\",\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-12-02 04:10:18'),
('689ab0df0e8966828f5942d9b9', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-09-19 02:46:06'),
('694140877d01291f8d8155dd8d', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-12-27 04:37:55'),
('6a7ea67522dca6eb5461e1104e', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-10-03 03:03:26'),
('6bb6a30e128943e6df45225358', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-10-24 07:10:00'),
('6c50c7c67670866f8703c608c3', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-11-25 02:38:28'),
('6d22b8eb9707f126ef64abbd1e', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-08-22 02:26:06'),
('6d2835e3a8a7716b477e63680f', 'false', '2017-12-18 07:26:07'),
('6d295d068a77c0182b8d29b06c', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-10-05 03:38:53'),
('6dd14ed5d41dd508975b70d6fd', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-12-02 03:01:49'),
('6e2f10268dc7cb9f6bc71cefa9', '{\"user_id\":\"1\",\"user_token\":\"eEyzZQvqVBkRHRPN9uTq9UabhhD6V66x\",\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-12-26 10:24:14'),
('6e62f0ac8363e5a3cb4adf23fd', 'false', '2017-08-31 06:56:22'),
('6e7da6e518d2830f783de0538e', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-10-03 04:19:17'),
('6ed0915ff76784d275d1f7b847', 'false', '2017-09-07 07:18:05'),
('6f2e359060b607f935801d4997', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-08-11 10:02:54'),
('6f5987c8e92206469c734dd361', '{\"user_id\":\"1\",\"user_token\":\"ozWGkIWiwYx2NQXD2173aN4vKH9hgYel\",\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-09-14 10:02:11'),
('6ff06e57d88c70290436ac073e', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-09-15 08:17:22'),
('7098ca95b429c1457fdccc8d94', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-09-20 07:29:53'),
('710aa5e581d2236cecc6bbf52e', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"user_id\":\"1\",\"user_token\":\"5ADqwPBp89r2IaxPC36QQD266kMgPsmm\"}', '2017-09-25 10:19:01'),
('711e18a66035faa3335f3c52c6', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-11-06 10:39:39'),
('7148d5170bc294703ed3b478e8', '{\"user_id\":\"1\",\"user_token\":\"RlzVRPrQzMbzeIapsijK9YrWP2Q84BwK\",\"language\":\"en-gb\",\"currency\":\"USD\",\"install\":\"pjgEJmMJcj\"}', '2017-08-11 10:48:41'),
('72ac356733d058660334bd6a69', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-09-14 04:33:39'),
('739a0e2b0a1d5c0a7002662915', '{\"user_id\":\"1\",\"user_token\":\"cKU0xg4rcgcW3zJuF6jIyp13pqwgzpGp\"}', '2017-11-30 09:59:09'),
('73aa45ccc174e9df0f9adcf9b8', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"user_id\":\"1\",\"user_token\":\"OLbrgfNGgrvaZxGvg8TggYXEP0zme513\"}', '2017-09-15 09:02:27'),
('7468a247c701edb3e5191b0e9c', 'false', '2017-10-16 07:02:49'),
('74dce3f0172cc1d6eadf6ee1e7', 'false', '2017-09-29 01:58:05'),
('74ee4f97b06e76162d00ab2c10', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2018-02-05 04:52:39'),
('751bbadd4a0645ed32d2eecd70', 'false', '2017-12-12 06:57:31'),
('7760942970d1b7c3e0905125f7', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-11-20 06:57:01'),
('777809cd386ef9e9278ddfe253', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"user_id\":\"1\",\"user_token\":\"PbiDIdzFmpMBNhbq84M9VJ8CwVuzps6q\"}', '2017-12-01 09:21:39'),
('7789bc8bd56aa1c63436237cef', '{\"user_id\":\"1\",\"user_token\":\"wlN052N4aK7qPOxN0YcFggE2fMuwty8i\",\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-12-04 04:31:39'),
('78646454c21e35c0f89e4b8236', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-11-27 04:33:25'),
('79153eb8d3a4b3c41105cd3d62', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\",\"payment_address\":{\"address_id\":\"1\",\"firstname\":\"Plaza\",\"lastname\":\"Themes\",\"company\":\"\",\"address_1\":\"NewYork\",\"address_2\":\"\",\"postcode\":\"100000\",\"city\":\"NewYork\",\"zone_id\":\"3513\",\"zone\":\"Aberdeen\",\"zone_code\":\"ABN\",\"country_id\":\"222\",\"country\":\"United Kingdom\",\"iso_code_2\":\"GB\",\"iso_code_3\":\"GBR\",\"address_format\":\"\",\"custom_field\":null},\"shipping_address\":{\"address_id\":\"1\",\"firstname\":\"Plaza\",\"lastname\":\"Themes\",\"company\":\"\",\"address_1\":\"NewYork\",\"address_2\":\"\",\"postcode\":\"100000\",\"city\":\"NewYork\",\"zone_id\":\"3513\",\"zone\":\"Aberdeen\",\"zone_code\":\"ABN\",\"country_id\":\"222\",\"country\":\"United Kingdom\",\"iso_code_2\":\"GB\",\"iso_code_3\":\"GBR\",\"address_format\":\"\",\"custom_field\":null}}', '2017-12-27 10:46:48'),
('793b843c9854168a36e955b2d2', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-10-10 07:56:05'),
('79506c6a06a1990d577a43999a', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"user_id\":\"1\",\"user_token\":\"5HWcXiLe8Nkp1pp4JncrMqy3j9lLzpNy\"}', '2017-09-13 04:57:33'),
('796003d140e4f1cec2e9bc62b4', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-12-29 10:13:12'),
('7a4ec22ee097ad2847acaaba2e', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"user_id\":\"1\",\"user_token\":\"Rk4pF9DtsZaAqAaG25atZrbxmaC6WuJU\"}', '2017-11-03 04:17:14'),
('7a5611694fc7c990fb683f3cc0', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-10-05 03:05:18'),
('7a57c1467b4076bec68d86c3fd', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-11-25 02:22:55'),
('7a97d49d01ff26f79635f50316', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-10-03 09:30:13'),
('7ae59c87e43972fec8d28c3868', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"user_id\":\"1\",\"user_token\":\"soH4oqj9bcqTEVoDOSMbXYYoNzwZYh9O\"}', '2017-11-15 04:32:07'),
('7baf4813ad1ad33bc9d6a67bd0', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-11-07 07:19:47'),
('7bbc64aa0c06c9eb2333b7fd3c', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"user_id\":\"1\",\"user_token\":\"4bi6tETZ6RraQwvlhHzIapAekoiNtwG0\"}', '2017-12-15 10:49:04'),
('7c1696642897d1c9c0fb211bd2', '{\"language\":\"de-de\",\"currency\":\"USD\",\"user_id\":\"1\",\"user_token\":\"DHNvIbiYzjYKf7ZjfVUqJksNShntIapm\"}', '2018-02-05 04:09:49'),
('7c36f2ae68dc39b8f0c04ed831', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-12-25 10:30:18'),
('7c7457a9e5a252c7438a8e04bb', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-09-19 09:47:20'),
('7ccec61910626484e7c13832ac', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-09-15 08:49:54'),
('7e67f68b3c1304621d16bc618a', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-10-03 09:30:32'),
('7e858fb40bf9d1ef6e6262ee7c', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-11-27 03:27:13'),
('7f06790415935cdf9ed4ad2076', '{\"user_id\":\"1\",\"user_token\":\"WWtjaYZw1i9RRcldl43yln75CGEVmMDU\",\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-11-06 04:00:20'),
('7f5ab5862d79fa6b8f500f4b9f', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"user_id\":\"1\",\"user_token\":\"7w6Scx9lO75qZ2nd5WyRiRJD9WzlCpmW\",\"install\":\"Q3Zwo6bJMe\"}', '2017-11-21 08:34:24'),
('7f5c819c671336f1a3860f9007', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"user_id\":\"1\",\"user_token\":\"fUDJB90ZGZ7uGt9h5AdvXVU3p5PtPUlm\"}', '2017-11-08 03:24:56'),
('81059e93b34c472506200bfb3d', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"wishlist\":[\"61\"]}', '2017-09-20 10:19:51'),
('8116b265898c5a927e71721d01', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"user_id\":\"1\",\"user_token\":\"1vejOlCtmG2s0ZVGWB7GHngW1BejO9RV\"}', '2017-11-14 06:56:35'),
('82270f0e0a0ba42f6296e86fd4', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-11-09 02:04:04'),
('82d679db5194207de7a3061261', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"user_id\":\"1\",\"user_token\":\"Ff5UGTRX5Pz9oXWIFfDCR1Wisz0RdZiw\"}', '2017-09-06 04:11:40'),
('830dcfc7f81ed0c4a62f8b65ad', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-12-24 09:18:54'),
('83189ed6ccc2383432f87eac50', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-09-12 10:22:59'),
('835399962b5692c43e94e69920', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-12-01 09:42:58'),
('83a4645c9ae34164607102f81f', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-10-19 04:15:46'),
('83e4db294873d1926965a8132f', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"user_id\":\"1\",\"user_token\":\"hbJ51vlrkvkgYdFHGLssAcLb8A7hOzea\"}', '2017-09-11 04:32:51'),
('840dae97343af29116351aa437', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"user_id\":\"1\",\"user_token\":\"ng0k3N4wgqtyRxeSC5T1niRVxBVcN29R\",\"install\":\"FuTTnpNU7B\"}', '2017-09-08 04:51:25'),
('84283342dc44c133108b84babd', '{\"user_id\":\"1\",\"user_token\":\"bTfyyNCt2u79pihxoMjwIGo0wbL4BMT9\"}', '2017-09-20 04:32:10'),
('843c744aa3b39fc2309474a736', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-09-21 07:01:23'),
('84b04fbee5137042c6f87a8056', '{\"user_id\":\"1\",\"user_token\":\"ZSCmz4clmjet3CCdeSC80tDGFDUc5prz\",\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-10-03 10:18:18'),
('86235d98c0e0e049fb98f5cfad', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-12-29 10:24:45'),
('87e0b1e2019b4c606909dabce6', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-09-18 02:38:27'),
('882f45174ef1e5a43f686813c0', '{\"user_id\":\"1\",\"user_token\":\"xjzj8TR3SKbOt3pNuqlvHAsD5NoF2OQn\"}', '2017-10-19 10:21:44'),
('893ccc04abc6118480d92dbc52', '{\"user_id\":\"1\",\"user_token\":\"LYFVujttS5sUlFvo32pz8OMtI4Mw5hi4\",\"language\":\"de-de\",\"currency\":\"USD\",\"install\":\"wJg5lBNjpY\"}', '2017-10-23 10:28:49'),
('895cf8aa4b648c49e0a78beb81', '{\"user_id\":\"1\",\"user_token\":\"3zo8fANjFYiAxVLlJLqU26BvYVk95hvc\",\"language\":\"en-gb\",\"currency\":\"EUR\",\"install\":\"WNuOG45vNq\"}', '2017-08-10 04:15:49'),
('8a0fed9d52ebea1701a9d322bf', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2018-02-05 06:43:08'),
('8a7deaac596115ae6fa039ca5b', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2018-01-11 04:52:48'),
('8aff16503d6ba683e2f7e462eb', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-09-22 02:13:23'),
('8b03aa359cd0098505217d1c1c', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"user_id\":\"1\",\"user_token\":\"IiNJPxW6nqPZy24iUTwgj5EBUGMrRsjF\"}', '2017-10-26 09:17:01'),
('8cb848ea26708ba42fbd7310fe', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2018-01-11 04:52:50'),
('8cd7fed178ef15a513eba81de8', 'false', '2017-10-13 01:55:49'),
('8d2a253b914be3d364b80d2b56', 'false', '2018-01-16 01:51:34'),
('8e29de7acf24c5cbe3e67d80f6', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2018-02-05 03:42:33'),
('8e52debfe460d2815c87af44b5', 'false', '2017-11-15 02:01:12'),
('8eb2b1e3a43a17e75e0989ca8a', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-11-09 02:59:00'),
('8ef9a093bb9ac880cc0b511a10', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-09-13 08:00:59'),
('8f11c4522c9392889859413d83', '{\"user_id\":\"1\",\"user_token\":\"ysANXEe4eCn0GmTz67Xi4K19n79Hynx4\",\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-08-12 02:08:39'),
('8f3cd61e72b8c95b5473bce454', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"user_id\":\"1\",\"user_token\":\"yFWboALjZEKbuwy71b2Uc30ukwIEfj28\"}', '2017-08-29 07:50:44'),
('8f8668b683809298699099a5bd', '{\"api_id\":\"2\",\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-09-16 03:16:48'),
('9029137c461842ea5a0cf73030', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-09-12 15:24:46'),
('90703422f1ef9be49f33667ed8', '{\"user_id\":\"1\",\"user_token\":\"6WVgeNLsNm0fywRnOoiq3HGgYIXvYch9\"}', '2017-09-13 14:43:47'),
('913de9b01685b064539bdc6bdf', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-09-19 08:07:26'),
('91963c6fb2fe68358b1f387ec2', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"user_id\":\"1\",\"user_token\":\"VTSlFOsaiatIuRaLm4NpIvcRQZvEREen\",\"compare\":[\"56\"],\"wishlist\":[\"56\",\"53\"]}', '2017-09-08 10:08:12'),
('91b468c7834970a0be4d182df6', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-11-25 02:07:17'),
('91c02b3132e70bdf21d80d47da', 'false', '2017-11-02 01:59:05'),
('91d75faa10eef583ec92c8b472', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"user_id\":\"1\",\"user_token\":\"YUcq3WGoONH0oSvEyBoyWmLG5cgo4Iuf\"}', '2017-09-05 04:12:28'),
('92a2afd3d36ba6609c5fb1c776', '{\"language\":\"ge-de\",\"currency\":\"USD\",\"user_id\":\"1\",\"user_token\":\"TegvUNAVLa35AfE2JzWdyTVHz8s73VHc\"}', '2017-09-19 09:54:22'),
('931f8baa6993e6269a55867fe1', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-12-04 04:47:47'),
('932389317c05052770429d28fe', '{\"user_id\":\"1\",\"user_token\":\"6BDH343B1PVktmFBHBnPMCAXHwUXdysz\"}', '2017-09-13 10:16:47'),
('93554e51e336b01c05172987df', '{\"language\":\"de-de\",\"currency\":\"USD\",\"user_id\":\"1\",\"user_token\":\"x0LBVfkNDxnHoNvdeAGYOvg3LJgPXPwD\"}', '2018-01-06 07:16:52'),
('93d02de845882274a252b3d480', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-09-16 04:58:42'),
('93dd0b53313112999a95c6033c', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"user_id\":\"1\",\"user_token\":\"XNZmJNtYe6e488xflGrAjEtlwLeSomNe\"}', '2017-08-10 04:53:13'),
('94188babae6dcd722624a29af6', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-09-20 07:29:42'),
('945d8fc6934dbc155a484df625', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-10-23 04:50:47'),
('94e90f34fadf24dc9b00d3660c', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2018-01-06 07:16:28'),
('94eaf2fa9d88ebae92b7d6f211', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-09-19 07:30:47'),
('955d4d47cc4bfe88fbd3eb9096', '{\"user_id\":\"1\",\"user_token\":\"PgQ7bOh7Yt26lGw0YkKFPHGFmoHFiP2y\",\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-08-25 10:48:13'),
('95619b5a7a851d9a9e72c85fcb', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"user_id\":\"1\",\"user_token\":\"xkmgq7A0G9wsxPnS2baQtPOOzcWaKe4U\",\"vouchers\":[]}', '2017-11-18 05:00:07'),
('95afc769c475b581efefbb488c', '{\"user_id\":\"1\",\"user_token\":\"B8NA7TZvGegvK5ov6i4gI7nxLfxuUO0Z\",\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-08-28 10:23:11'),
('95f8c57ba77719be02f7278dbd', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-09-18 03:43:22'),
('964fcf7a76c25a61d395d74933', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-09-20 09:43:03'),
('97134887699c47127c244c6e9f', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-12-23 02:05:39'),
('973d36319c8f7fbb5643ec71e9', 'false', '2017-12-12 14:55:56'),
('97f554987e228dd0ce5fdf8a66', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-11-29 10:17:07'),
('9839e684fcb4a8b6ee5603f4a5', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"user_id\":\"1\",\"user_token\":\"qiCLxsoaYmoz6ErtcWi0tnyd74y9z6wh\"}', '2017-12-23 16:14:55'),
('98be032373b09ecf4d455de290', 'false', '2017-08-29 07:55:49'),
('99fe38411d0ada9cc5cf47ac2c', '{\"user_id\":\"1\",\"user_token\":\"nN4BH4ugeaMfoS7Jd28JuqBwkx0WrXHM\",\"language\":\"en-gb\",\"currency\":\"USD\"}', '2018-01-30 04:50:45'),
('9a5e3407cc68cd33b761882d55', 'false', '2017-09-15 01:35:41'),
('9a7d20565ee3e88e24b164693a', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-10-03 04:37:49'),
('9ad1d8ee81180d4b6b1fa22849', '{\"user_id\":\"1\",\"user_token\":\"M7nCT9tk7nbB54JyzQXTE81VkWc3gLv3\",\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-12-01 04:54:11'),
('9b7c5d2345a3a39777afa4a8f9', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-11-07 02:43:14'),
('9d7d47bb4214ee5e88afbc907c', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"user_id\":\"1\",\"user_token\":\"k84D9mLqaXYTbuMERonztseKRNlLy4Xw\"}', '2017-09-13 08:35:08'),
('9d918d6a4fc36ca8f4f410b868', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-09-15 03:23:36'),
('9e00509db567170c3d58ee254c', '{\"user_id\":\"1\",\"user_token\":\"1bAAqig2hQ9ns552EcrIcdsFwKMfWGN6\",\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-08-18 03:10:15'),
('9e0939d3f52fe4609f7c8b7b8a', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-12-01 09:30:46'),
('9e924e132431b1b9872e39f2bc', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-11-30 06:53:25'),
('9ee385ad63f0047dbbe7d7335d', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"user_id\":\"1\",\"user_token\":\"ktjN6hQEK1FbHqb9bVDKeZlWLkhT50q9\"}', '2017-08-31 04:28:48'),
('9ef9cb6fa4ff89b006fd792327', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-11-07 09:48:13'),
('9f5c0ec2e2dc4e9a125193e4e5', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-12-27 07:12:10'),
('a02856eff5c74d824402fd9b68', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"user_id\":\"1\",\"user_token\":\"FTT6BMvCchJqkwFkqChrVeOmYQoM6m9q\"}', '2017-12-18 10:38:29'),
('a0a7142631c63dae6c16b1be0c', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-10-06 02:06:55'),
('a11ee3654d783f21fdb1e6379f', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-12-02 02:42:54'),
('a16c9c489feda89c5bbd458ee0', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-10-05 03:26:37'),
('a1ce9ea4df50b1ec3558a92dc0', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-09-20 10:11:33'),
('a2437072fd9570684e5e008951', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-11-09 07:01:54');
INSERT INTO `oc_session` (`session_id`, `data`, `expire`) VALUES
('a2490ed2040707e0a562844497', '{\"user_id\":\"1\",\"user_token\":\"xM6haga44Zpex4oici4DgKBG3Sw2oL73\",\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-08-12 05:22:04'),
('a2ba9bebe486bc28da6a1d0132', '{\"user_id\":\"1\",\"user_token\":\"CUnArQMZeKvh7MUrxddxzodGXPTMgTAo\",\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-08-12 02:13:51'),
('a3174cd5eeadcd6ea0fcc238a8', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2018-01-30 07:41:49'),
('a34ba02eedd15a685772a04ff6', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"user_id\":\"1\",\"user_token\":\"rrFPqeMuviSTx3AC0EDI44V4G7xmUo6I\"}', '2017-11-11 04:29:53'),
('a364d9ad43b5ee523781eada01', 'false', '2017-11-01 01:52:30'),
('a3a95e8dc2f97515be2875d434', '{\"user_id\":\"1\",\"user_token\":\"sdKEGN5NBD9lo9hhshix1SxoCOCRQwzX\",\"language\":\"en-gb\",\"currency\":\"USD\",\"compare\":[\"30\",\"31\"],\"install\":\"Gn3f4i6OW0\"}', '2017-08-15 10:44:29'),
('a4137cd0f152eb8f4cd2ba3289', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\"}', '2017-09-14 10:00:13'),
('a43dac1d63d434e2d1e5c52472', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"user_id\":\"1\",\"user_token\":\"ojRNcvG2x1nCgYxuxOml6nSstpHdFsmU\"}', '2017-11-01 10:08:10'),
('a44a49952f708efb6c1d2de5a3', '{\"user_id\":\"1\",\"user_token\":\"WpLwnQiGjm50YgzZxQVbbdhp4zpzI14I\",\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-11-29 10:11:13'),
('a4e2e93380b993e41d061cb96b', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"user_id\":\"1\",\"user_token\":\"3On5wItVjjS1JiJdIyL9UWgASFqedQzl\"}', '2017-10-03 04:40:42'),
('a5a4dfa7100216ae5d12d859c2', '{\"user_id\":\"1\",\"user_token\":\"ppHfuo91Dx76jEOUKy5I4s4G1gDhlKmO\"}', '2017-12-22 15:23:08'),
('a65e9ce560d7188d7d9ab404b3', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"user_id\":\"1\",\"user_token\":\"sXzjG1MNXMUdZhGAXMlF3zhntcGdR27g\"}', '2017-09-09 03:58:44'),
('a69badd26764ea330d12da9054', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"user_id\":\"1\",\"user_token\":\"HS80poX9f6PIzlzr5HKHui0oFMU2dwSq\"}', '2017-09-23 03:18:53'),
('a6d4292910cc61818264d07b5e', '{\"language\":\"de-de\",\"currency\":\"USD\"}', '2017-10-23 09:44:22'),
('a742e7c9ba74787719217050d9', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"user_id\":\"1\",\"user_token\":\"RqK8PrqN9eevnCFvIvU9xTCoixRjqTxT\"}', '2017-09-25 03:52:48'),
('a7c93d676b044a84ee1ec32f12', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-12-26 10:46:55'),
('a8926d01e6b0b4f3a19c8122f6', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-12-02 02:56:39'),
('a8bbf373da347a87554ef42b6d', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-10-18 09:01:36'),
('a8cf60e9ca0f30c237132e7da5', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-11-17 07:26:01'),
('a94d66de3a6285842935dcfeff', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-10-21 04:10:11'),
('a9d1f4f7b7a621f90499623b70', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"user_id\":\"1\",\"user_token\":\"bAH8oAjV8oB1IyTgKsyi6LOLQW0y1U7h\"}', '2017-12-12 10:09:25'),
('aa7d4a530418dcd098e9b0571c', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-10-09 01:48:12'),
('abd05427867e8f5d4543ca9564', '{\"user_id\":\"1\",\"user_token\":\"qFA5cGyxCIgs2NZTB18sUGl9JFdISXk4\"}', '2017-09-22 03:48:56'),
('ac1c012aacc1c7921a8c2004f4', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2018-01-10 03:25:42'),
('ac3b54be6c4b7eb5beefc3486b', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-08-28 04:46:54'),
('ac91a480f1cfbd0e25b8337bb6', '{\"user_id\":\"1\",\"user_token\":\"Y9aa7Nk9wmC5qKj3MSiV1ki4LrvvbrAh\",\"install\":\"6pl5v8WI04\",\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-10-18 08:08:05'),
('ad742f0f2dd9945c80391bf5da', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-11-16 06:58:03'),
('addb6d456acd460e08857a2ae8', '{\"user_id\":\"1\",\"user_token\":\"U2hJG8YwZCMJEGwzZDIamxUQFBhuQMqN\",\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-09-12 04:30:07'),
('ae4b21a2264cdd1688bcd8250d', 'false', '2017-11-01 07:04:51'),
('ae63c4019169d58d5502346ffe', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-10-19 08:28:01'),
('aeaab82fe6e7b65246a05309c7', '{\"user_id\":\"1\",\"user_token\":\"v9ByCm8dILyFO44k9VYuh6NM1ufG6l2X\",\"language\":\"en-gb\",\"currency\":\"USD\",\"install\":\"sp93w8x2Kj\"}', '2017-08-10 10:46:57'),
('af3363616ca53d4592668ab6fa', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-12-24 14:54:23'),
('af3c90db724f25a0b6d9fc6733', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-10-17 10:01:46'),
('af6bd538924e1c6660b4c24df2', '{\"user_id\":\"1\",\"user_token\":\"B4f4KGLWLo7yKY5XqAnksoW8dRWQWp9v\",\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-08-28 04:49:50'),
('b062424781550b5ff1464dfc5c', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-09-21 10:31:31'),
('b0ea8e069676ae7ccf0584ebbc', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-11-13 06:58:47'),
('b150e9a173ad57ad711f4d0e4d', 'false', '2017-11-17 07:25:58'),
('b1a3794897ec905181fcccbe5d', '{\"user_id\":\"1\",\"user_token\":\"K26RcNHIv8FAP49bj7occvl0X3PdIkLF\",\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-10-21 03:52:44'),
('b21b9745a3f3c8672721545291', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-11-24 04:36:18'),
('b27d95aa117f81f176f4990b00', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"user_id\":\"1\",\"user_token\":\"ZdM0Xdv07t2IUTrBNwIQWJr7W9BfbvMs\"}', '2017-09-30 05:11:34'),
('b33a8e919fa01dcf0625fae561', '{\"user_id\":\"1\",\"user_token\":\"9EsHUbUVBcRysOqof2WSsb4iBN8okAfD\",\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-10-25 10:47:10'),
('b363d13f6c53ad05df93ec2425', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-12-29 10:14:09'),
('b386e77b5f81a3a624ddc1882a', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-08-11 10:12:11'),
('b3c3e1af515309ad5bdafa595e', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-10-20 10:09:20'),
('b519661c76b62de6f2b9280c6a', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"user_id\":\"1\",\"user_token\":\"S3A7aIPiFzVvWF5lNPDllSNu5ixz4ckB\",\"wishlist\":[\"51\",\"53\"],\"compare\":[\"51\",\"50\"]}', '2017-09-20 10:30:03'),
('b561b670a422908c9f495da31b', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2018-01-10 03:26:35'),
('b5890decfaf5f5ae5bb1d27ef4', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2018-01-18 07:00:09'),
('b58bb2900b48379e2110bb19a6', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-09-25 08:57:25'),
('b5bbbc35edf877cd0b327e01af', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-10-18 03:36:26'),
('b5ed8b1efc4843c1ecce265959', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"user_id\":\"1\",\"user_token\":\"7i4QcXsq0vxRafpRSbhio8J8aIsXpYbV\",\"compare\":[\"51\"]}', '2017-10-13 10:43:47'),
('b625722fb5d6c53e6b277c790e', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-11-07 07:16:04'),
('b7402c59e06a38aeffb28be2be', '{\"user_id\":\"1\",\"user_token\":\"sj7Ky5nNZp1zM5gUA1C35rJxt1VW2ryE\",\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-08-25 08:58:58'),
('b7ac6b82cdcde5782f748685e6', 'false', '2017-09-27 07:07:13'),
('b7c62c9fb5326ae7becfafaaa2', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-11-06 04:34:34'),
('b89f11b2247b931f0b4ae7cc76', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-12-27 08:07:26'),
('b8b51d8fee2467eb64ec7d9610', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-10-18 03:36:10'),
('b8e9c9151fb4ac811cd73e0471', '{\"user_id\":\"1\",\"user_token\":\"YN5bAQp3lFT5EvodxHqknemUKIknNKjm\",\"language\":\"de-de\",\"currency\":\"USD\",\"customer_id\":\"1\",\"shipping_address\":{\"address_id\":\"1\",\"firstname\":\"Plaza\",\"lastname\":\"Themes\",\"company\":\"\",\"address_1\":\"NewYork\",\"address_2\":\"\",\"postcode\":\"100000\",\"city\":\"NewYork\",\"zone_id\":\"3513\",\"zone\":\"Aberdeen\",\"zone_code\":\"ABN\",\"country_id\":\"222\",\"country\":\"United Kingdom\",\"iso_code_2\":\"GB\",\"iso_code_3\":\"GBR\",\"address_format\":\"\",\"custom_field\":null},\"install\":\"0uT3xKoMx2\"}', '2018-01-10 04:56:06'),
('b8f09fb37177f39f5413734739', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"user_id\":\"1\",\"user_token\":\"VctR5MTtJiVd8FxTxOjOAftGW7qyQNpE\"}', '2017-09-28 09:30:53'),
('b9462c1746164ead6fd0cccb05', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-10-31 01:58:27'),
('ba1fde7dcde62047049d4ae8fb', 'false', '2017-09-19 01:49:29'),
('baec9426b022d5c6ac5ac4f668', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"user_id\":\"1\",\"user_token\":\"jv885CtqKLlpydUnSdQtMMu3hDYqKQyR\"}', '2017-12-04 09:12:48'),
('bb3ac948a9ac6298b25833400e', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"user_id\":\"1\",\"user_token\":\"VJghu1Qu4khjY5Ewbarmk0aS5iaVUIjk\"}', '2017-10-16 09:24:10'),
('bb80babec50c3fa34d48e85769', '{\"user_id\":\"1\",\"user_token\":\"JgE5hItoPDZD4fvO2utrJHluW0dPhpuu\",\"language\":\"en-gb\",\"currency\":\"USD\",\"wishlist\":[\"42\",\"30\"],\"compare\":[\"42\",\"30\"],\"install\":\"Zly8PEmwsv\"}', '2017-08-16 09:56:10'),
('bba330835fe59dc1a4d3d8a036', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"user_id\":\"1\",\"user_token\":\"WmRAfen9dF7v0timRbRCkz1whvbfOOK5\"}', '2017-10-02 03:49:59'),
('bbc698786bb746384d701c8235', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-11-15 07:15:41'),
('bc2ab5a4e4b11bc1508e906454', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"user_id\":\"1\",\"user_token\":\"mQASXZQTzh60mSgXWWfzEKFXyg974CTg\"}', '2017-08-29 03:42:28'),
('bc2ad61eedf09856a081b661fc', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-12-24 09:24:13'),
('bc2d7d768079a99b214da47f3a', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"user_id\":\"1\",\"user_token\":\"yG0rEx3Gs673aYXlOnntrxEjAGuUb14Q\"}', '2017-12-24 09:14:09'),
('bcc54d9f93ff0e40a988c7cff0', 'false', '2017-12-19 06:54:45'),
('bd2b27b9ac4d6c518701ef6fff', '{\"user_id\":\"1\",\"user_token\":\"kMFH2mkLXJ7A3w9uP8SdsxeyAdqNr0yz\",\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-10-05 08:03:49'),
('bd333d2a3f35768104e4c7d4db', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-09-21 10:31:16'),
('be8460dbab376a8f7051ff4e95', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"user_id\":\"1\",\"user_token\":\"cBdSdhqEzcQmpTJvCY2zKrJlKJIrW2Sr\",\"compare\":[\"57\"]}', '2017-09-19 08:25:47'),
('beb8e3d7872e94486ee16815a4', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-12-27 08:08:15'),
('bf948fcf4ae703014d590314ab', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-09-13 03:57:42'),
('c0460adca77bffb3ede94c17e2', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"user_id\":\"1\",\"user_token\":\"oMuGgtDhjH9A4PLcIN6fMINzKhZ0cgUP\"}', '2017-10-30 10:26:46'),
('c057a75e0d170727e7542ce078', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-11-10 03:54:09'),
('c09bea7ab895bf40460535b40a', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-09-22 02:50:54'),
('c10d7b8ca0e5648bc65fd112f6', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"user_id\":\"1\",\"user_token\":\"Y6EDpxEPAJRZ3gAZnCKtIaGdUpS4nw6b\",\"wishlist\":[\"68\",\"70\"]}', '2017-08-31 10:33:38'),
('c20b759a62b3a192dd7870ae6b', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-12-23 03:27:41'),
('c242790be9987956370e711c32', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-08-29 02:42:42'),
('c2af572d99919969562ae96d3c', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-10-18 07:58:30'),
('c2d5a863159898fdbd4e680dfe', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"user_id\":\"1\",\"user_token\":\"qFVHL0UcXBQyxXpOCklp1xFlS2HuNqbX\"}', '2017-12-11 09:52:19'),
('c2fef45296158e0ac850c695bc', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-12-24 09:16:06'),
('c5155bf80cd19cfbaa41b72fdb', 'false', '2017-10-12 03:03:00'),
('c5689a856e11323dfcafcac159', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"customer_id\":\"1\",\"payment_address\":{\"address_id\":\"1\",\"firstname\":\"Plaza\",\"lastname\":\"Themes\",\"company\":\"\",\"address_1\":\"NewYork\",\"address_2\":\"\",\"postcode\":\"100000\",\"city\":\"NewYork\",\"zone_id\":\"3513\",\"zone\":\"Aberdeen\",\"zone_code\":\"ABN\",\"country_id\":\"222\",\"country\":\"United Kingdom\",\"iso_code_2\":\"GB\",\"iso_code_3\":\"GBR\",\"address_format\":\"\",\"custom_field\":null},\"shipping_address\":{\"address_id\":\"1\",\"firstname\":\"Plaza\",\"lastname\":\"Themes\",\"company\":\"\",\"address_1\":\"NewYork\",\"address_2\":\"\",\"postcode\":\"100000\",\"city\":\"NewYork\",\"zone_id\":\"3513\",\"zone\":\"Aberdeen\",\"zone_code\":\"ABN\",\"country_id\":\"222\",\"country\":\"United Kingdom\",\"iso_code_2\":\"GB\",\"iso_code_3\":\"GBR\",\"address_format\":\"\",\"custom_field\":null}}', '2017-09-29 11:18:00'),
('c59a8eeeb3f4542fec714d7613', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2018-01-10 03:40:28'),
('c5b9022f26616f6a2c59047e8b', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-10-04 08:17:16'),
('c674e6198b74344820c076cf90', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-09-09 08:53:24'),
('c7226f28cdced2dbff45631d15', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"user_id\":\"1\",\"user_token\":\"ZpUp7aA6M2spsUq4CqV5IrxOHdre6FSW\"}', '2017-09-13 15:34:38'),
('c72f59294e3ce49be0e94b088a', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-10-09 01:47:45'),
('c759df142e0ee960f3cc85937f', '{\"user_id\":\"1\",\"user_token\":\"wrbo3cWttB3KEsd2fZwxW4LsGjXF0UMG\",\"install\":\"Q809Kj2A8d\"}', '2018-01-10 07:54:28'),
('c804c1bc508805e107d0c4125a', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2018-01-10 03:25:26'),
('c830570d4711eb5e115eea5abd', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"user_id\":\"1\",\"user_token\":\"rc9grqtenL76RM5GnW6LoOWm8Dw879Sp\"}', '2017-10-16 04:44:53'),
('c8dc2f39db93c92acd5483399e', '{\"user_id\":\"1\",\"user_token\":\"VKxa6CfytFk1UnQHrNBbQ1ybWmmgbi4w\",\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-10-03 02:22:49'),
('c8e15d589d132cb5f00ca468bf', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-11-30 04:49:35'),
('c94850e6104057e76300abd63a', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-09-12 02:25:10'),
('c9e050d357d1b83147cbc6a21a', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-09-06 01:41:51'),
('c9f589892685e85aaf9dc41100', 'false', '2017-09-01 07:02:05'),
('ca25f11ce828939c6827c097f2', 'false', '2017-09-01 01:55:29'),
('cab4c4c94539a38d54a81b93a8', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-11-06 04:42:45'),
('caefcd64911917057a957a995e', 'false', '2017-11-24 02:07:41'),
('cb51d3abf6b52c1e6e40eff43f', 'false', '2018-01-11 01:49:52'),
('cb6ab6b2c5ffd09d641d9b4101', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-11-27 03:52:22'),
('cc2d348c68791f9f0c0a14352f', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-08-10 04:18:32'),
('ccc7432acd6971367e972f1948', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-12-29 10:11:37'),
('cd3af2b7b9478c70152047cd41', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-09-20 07:29:47'),
('cd8ec0dc7cca0c4dc09dfec699', 'false', '2017-09-13 02:12:34'),
('cdc1b137d354fa977fcede7b99', 'false', '2017-09-15 06:59:44'),
('cdde16e95114a4d27050699f03', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"user_id\":\"1\",\"user_token\":\"6Fj1K1gALHAR2Hj1Jz6XDbVpCEVYHqYU\"}', '2017-09-12 09:42:59'),
('ce47e6aa2a35856452d86f4dc8', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-09-25 03:59:50'),
('cea4ce37e634fa7bd47cb37302', 'false', '2017-09-06 01:41:38'),
('cf909dca2e0e321e7d19b57ccc', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-12-25 09:39:55'),
('cfd33d0f6013115e7d12bb7b14', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-09-15 02:58:53'),
('d0006318d4443c5454d1069a41', '{\"language\":\"de-de\",\"currency\":\"USD\"}', '2017-10-23 09:49:44'),
('d019cbec1944eb1b522611277f', '{\"user_id\":\"1\",\"user_token\":\"0uD4ZbeyfpTicZcN0S9gkqMlf844k4FU\"}', '2017-10-23 02:59:44'),
('d02a98ee027a4090fd3ccd583c', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-10-20 10:04:33'),
('d066c30a57313d9b5cf7cac536', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-11-24 10:17:55'),
('d10d2da8c7a16ce05717f1822a', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"user_id\":\"1\",\"user_token\":\"lr85b7ANULVZThE6ZmZIJx0olXkGDePO\"}', '2017-09-16 05:09:24'),
('d269fa2d47b6ef4fd0dfbb6f3e', '{\"user_id\":\"1\",\"user_token\":\"ueboQ8AweS4Co53YhEsC0f6ZK4hfREW0\",\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-08-17 04:34:20'),
('d3ce40fa6e64a117e6ab43c85b', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-11-09 07:00:50'),
('d4165d6be70fed8bbff63f1bdd', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"user_id\":\"1\",\"user_token\":\"q9uvYt44UOticlJ1FkXSZMLHvauocWF3\"}', '2017-10-28 04:42:16'),
('d4479e57f0f7a7a347ae708a2f', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-11-08 08:29:58'),
('d451f53b2a20699faf1cb76139', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-09-19 04:42:32'),
('d45a31dd2f048ed0ac384fc044', '{\"user_id\":\"1\",\"user_token\":\"n0kpVSBJzSx0V1V57GTf12sUli9q1zk0\",\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-10-05 04:03:10'),
('d4893f2babaddf17c6b0b250fd', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-08-25 04:08:42'),
('d51fbda1a55c647c9db29428f9', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2018-01-15 02:05:28'),
('d5882d0c152f79c9bb6dd54f76', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2018-01-06 06:31:47'),
('d598021bca7e673831c66e1d96', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-10-09 01:48:48'),
('d5a4becab8f38c38afb8e59430', 'false', '2017-09-10 11:56:28'),
('d5ea939a3e4e0a52a2b5e5ee75', '{\"user_id\":\"1\",\"user_token\":\"Vrw9r5n6iiqk9nnDX2khRSBOcuwWVOCY\",\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-08-17 09:19:45'),
('d5fc31188f5f4099830c96bb06', '{\"user_id\":\"1\",\"user_token\":\"OUJV4YEoAgIJWMpMOnFoTA8F9ghkaugJ\"}', '2017-10-24 09:02:37'),
('d699af7498f561a9fe49dd9de2', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"user_id\":\"1\",\"user_token\":\"gaq4H9dWAlHvEGh4V05iCV0SoeSaz6fD\"}', '2017-11-06 10:45:59'),
('d8f63233caec4623f23e90bc6e', 'false', '2017-09-19 07:23:16'),
('d9708bd775c723f65a15848994', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"user_id\":\"1\",\"user_token\":\"E1pNcP9IIluD9aCjK469I60boRAulxkX\",\"install\":\"hJb6zGP8VI\"}', '2017-10-04 04:39:17'),
('d97bff7fa7f80e44614f9005e0', '{\"language\":\"ge-de\",\"currency\":\"USD\"}', '2017-09-19 09:53:59'),
('d9e10c1d84ef564053d2995826', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-10-02 03:50:10'),
('db3d014440dbd04ddbb31b3176', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-11-03 03:55:02'),
('dbca5b215ec4dabb30b9e62199', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2018-01-19 03:36:41'),
('dcd4fbab31ac75c34fed663eb9', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-10-23 10:00:42'),
('dd4766a86855be92133b4d3788', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-08-25 08:29:01'),
('dd8b2e1af695d9ffd4ff14d0ca', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-09-20 07:29:41'),
('dd9f346b1d08ec6702401b5196', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-11-13 02:23:38'),
('de5065dad4f5eb193e957a5f20', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2018-01-22 06:45:00'),
('dee4dbc00b7de56fc5a202e6e8', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-09-12 04:30:17'),
('e0167081796c1c13dbcbe71e82', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-10-23 04:17:46'),
('e032c0fcbcda45621c15b79dcb', '{\"language\":\"de-de\",\"currency\":\"USD\",\"user_id\":\"1\",\"user_token\":\"NsDaMPc6h7r2NrNUVQLHbWVHc73bvT4z\"}', '2017-10-24 04:44:31'),
('e07228283c46790f39bf0d6a48', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"user_id\":\"1\",\"user_token\":\"qYznTiQGuSvyWy8bO0NSFa0uDD2qxnO1\"}', '2017-09-05 10:22:48'),
('e0b46633af9e7d5eff9fb83703', 'false', '2017-09-12 07:04:57'),
('e136edaca9843f4e4fe82d51c9', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-09-16 03:23:42'),
('e19038f349cfafd60d26fd547b', '{\"user_id\":\"1\",\"user_token\":\"iNNAeYfunaOZ02mDk3AZJ2mexjOSy7N7\"}', '2017-10-25 07:07:23'),
('e2a9772064f89dcbcb0e9cc7c4', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"user_id\":\"1\",\"user_token\":\"S0PKeQsLVeKNFib9GJKQRWdnzveyZ480\"}', '2017-09-07 04:41:06'),
('e2f6377fa054ea90583311ae0b', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-09-15 08:07:24'),
('e319236aff37721f318c6ba2a5', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-11-03 10:35:49'),
('e31bf1fa38f6e8b2782bc4887f', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-12-04 07:04:24'),
('e38fb2c0e44f9359607cbaaf03', '{\"api_id\":\"5\"}', '2017-11-01 07:51:57'),
('e3b7a397759dd36e9d97223fe2', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-09-13 10:23:09'),
('e3db6b5aad5879414bbfe1abf1', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2018-01-30 04:49:28'),
('e4b5054a2e628b677e86bcf1bc', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-12-29 10:12:00'),
('e59e0f4e01eed34e0bf06adc65', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"user_id\":\"1\",\"user_token\":\"ZEmbxCvpxPV1qFELgjFcyJhbUXdDyNKT\"}', '2017-10-10 10:19:15'),
('e5e611f6324d564538e74499fc', '{\"user_id\":\"1\",\"user_token\":\"f1E3YMaVhUGoizFziQMfP9sns3vyaVah\",\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-09-06 10:04:39'),
('e635e31c216fa1c3b57beb5145', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"user_id\":\"1\",\"user_token\":\"8ZEWv5Lj1Y8Yft45m7s9gpLM5uyTs8xN\"}', '2017-10-27 02:17:17'),
('e7017c2e1c7154c6a065eb64a4', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"user_id\":\"1\",\"user_token\":\"ehlUll7KH3xJONoHVPECSkPpCX1om4Ga\"}', '2017-09-15 04:25:23'),
('e8432b895f6a8b026fc2b88f3f', '{\"user_id\":\"1\",\"user_token\":\"LcflDhz9zgUIgDGXtHg0JH1gwRfxTFoQ\"}', '2017-08-16 13:45:06'),
('e92900c9b5fea0dfaaf18c243c', '{\"language\":\"de-de\",\"currency\":\"USD\"}', '2017-10-25 04:03:42'),
('e9d3b7b3f573ff786d8cdcd9d6', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-08-28 04:47:58'),
('eb32078f1b9caa6c4b7a88c752', '{\"user_id\":\"1\",\"user_token\":\"MYZhergdwS6t1UlJe5ar7Y3YQiemJw5b\",\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-11-30 04:46:00'),
('eb685f0a1ee9b759f951a4d44c', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-12-24 14:56:42'),
('eb6fa7c1742a24b4af93c7435a', '{\"user_id\":\"1\",\"user_token\":\"jUhPYTLGJKGN9QwRa7Wt8KbSmhqxyOwf\",\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-12-28 04:25:03'),
('eb7890c9211bb5e47f05d1063b', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-09-11 10:18:49'),
('ec168f13cb9295394921fd485b', '{\"user_id\":\"1\",\"user_token\":\"0ugDaqQ49aod42T1N8v3fwUs63FGz1iG\",\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-10-04 08:02:42'),
('eca941ba8259354d4807bee0e3', '{\"user_id\":\"1\",\"user_token\":\"jq9vyXjNt1BMWjNy2dNXsiF79gxUJ73Z\",\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-09-18 10:30:06'),
('ecace0643fbd72a55677f5c27a', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2018-01-10 07:28:40'),
('ed343e18d2426f2671226c9853', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-09-19 09:18:17'),
('ed47ab09797501c2fa73b6ebf0', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"user_id\":\"1\",\"user_token\":\"8guhVSvrV62GkuZ6rnVFQICLzr4fO078\"}', '2017-09-07 09:59:42'),
('ed76cc950675e6e3607368e448', '{\"api_id\":\"4\"}', '2017-10-20 08:05:33'),
('eddb3f572414b4ead439a9432f', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-12-28 10:20:55'),
('ee2f6d29146b4d7f391f3d72ba', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2018-02-05 06:46:23'),
('eec436f893074a45cc6dd66d82', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-08-29 01:34:30'),
('eece4ce071e17db73ca7832d18', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-10-18 09:01:36'),
('ef19f1942e70690c191e9a70f3', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"user_id\":\"1\",\"user_token\":\"soZXubk4sch8BmKs7E6K8FkTMSQTjlOI\"}', '2017-10-26 04:33:43'),
('ef5d3817850068167a0aced16a', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"user_id\":\"1\",\"user_token\":\"rRnqW7RZpnA2Pfz4H8GNuNhtA7BfMDab\"}', '2017-12-21 10:07:24'),
('ef937b401f16f77c51f03f2517', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-11-07 10:15:32'),
('efbcd44bc988327579c06903c6', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"user_id\":\"1\",\"user_token\":\"Bxp2BkTXBMEBpTnTHhY5b1I6UUBOKdAo\"}', '2017-11-29 04:35:19'),
('efbd8f70096a48c920c33af2e3', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"user_id\":\"1\",\"user_token\":\"muuk5xqVyflhAYbZaCTTK0kKbZn5wJJN\"}', '2017-09-21 08:17:51'),
('f01caf5d00928535a349222244', 'false', '2017-09-11 07:36:08'),
('f0681d93d2196f553c027238de', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-09-20 07:29:44'),
('f1702ca165349f25c42b2b88b8', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"user_id\":\"1\",\"user_token\":\"nuf5AaF5KL8DRQgojfFsUWSUbRaWOyeA\"}', '2017-11-27 04:31:49'),
('f1eb9cb88ca91828044c5f39bd', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2018-01-06 06:37:19'),
('f20e82c4645259fba5410f15e9', '{\"user_id\":\"1\",\"user_token\":\"fJu4IxPlyc4JkuhDiq5HPyrY5UBA1lLl\",\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-11-04 03:53:13'),
('f267bd6427f9f69022438ac537', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-10-24 04:54:02'),
('f26e8c441a62e1d5bb44f01712', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-09-27 02:11:10'),
('f2ec66b688e85ba975038cb4d9', 'false', '2017-09-23 02:33:36'),
('f316ff8e74723d1fd4788e8980', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-08-26 05:06:40'),
('f3184bc7440b98cbfadbb8f450', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"user_id\":\"1\",\"user_token\":\"vEDOia3Lyn6BxAnrJLkEugVkQfsfxa7l\"}', '2017-10-13 03:49:46'),
('f41fce32e3497000268d3b9bb0', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-08-12 02:12:23'),
('f5aad8dcc89774f5e379902529', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2018-01-11 07:34:41'),
('f6348e725a5dbf928f24f76d3d', 'false', '2017-10-10 01:48:59'),
('f67e7e8f1ca720182e0c254b23', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-11-08 02:56:37'),
('f7b23a883cf060a477b68df0fd', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-12-29 04:37:20'),
('f7c89c507ee04e9ba6d8a93ec9', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-10-09 01:48:37'),
('f86480ef123542490ee25834eb', '{\"language\":\"de-de\",\"currency\":\"USD\"}', '2017-10-25 04:00:08'),
('f886516004cc6b3f950a49edf6', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-10-11 10:43:16'),
('f9143275449cdd2b8bc187e930', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-10-18 09:01:33'),
('f990b6b6d060cc4db797c6f1a3', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-11-29 04:49:54'),
('f99897e98391717dd1def81537', '{\"user_id\":\"1\",\"user_token\":\"eAH8TSShEX8IWaMIaW6aic038uEpWnu0\",\"language\":\"en-gb\",\"currency\":\"USD\"}', '2018-02-05 06:54:04'),
('f9c57c478a8faad19c30533fd3', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-10-13 07:59:27'),
('fa757640b461c68a545bcb75af', '{\"api_id\":\"5\"}', '2017-10-26 04:33:43'),
('fa971d37b9b2963e33d92439e2', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-09-18 04:08:01'),
('fa9bd128b2100b1a2807602e56', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"user_id\":\"1\",\"user_token\":\"S5j9POGCDnavM1ognPbwiAUcatH9rSBS\"}', '2017-11-28 02:57:29'),
('faf5e66dde7e6a9f0179197d14', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-11-27 03:27:16'),
('fb0e83dd7700de44a8a49d1a16', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-11-06 10:38:31'),
('fb271584fcaee6f139083acf04', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-09-15 08:48:04'),
('fbff3d3a5a04b5d3c2513db10c', '{\"language\":\"de-de\",\"currency\":\"USD\"}', '2017-10-24 01:49:43'),
('fc1230fef48f34e531afe6eae6', 'false', '2017-08-31 01:57:50'),
('fc128e958445c184ec0d4c7df7', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-12-28 09:20:22'),
('fc14dd8334f5a21b669c3c14c0', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-10-18 10:18:30'),
('fc66927ef6c39bbaa215e7614e', '{\"language\":\"de-de\",\"currency\":\"USD\",\"user_id\":\"1\",\"user_token\":\"HPwXRKTqtFRsfPqg7eC550F269p8iBE7\"}', '2017-10-25 04:52:13'),
('fcaeab07f8ae7fd7b0b952791f', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-12-12 03:58:13'),
('fcf492970dba18aa4c3f710f43', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-10-02 02:54:13'),
('fcffb007bf3eb609e7be0609af', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-08-24 08:17:29'),
('fd0d03ff5e6d2360274b318bac', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"user_id\":\"1\",\"user_token\":\"5IfaJnr8Rfk8v8bSvSV9UqDIg1gxQ8dB\"}', '2017-11-27 09:01:45'),
('fd8ce7b164937d7c533a76eed0', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2018-01-11 04:52:51'),
('fe3a8c45a2702585f4b8f06b64', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-11-30 09:59:55'),
('fe7b0dc10c9551ff0eb94c0f59', '{\"user_id\":\"1\",\"user_token\":\"S9NRGy3Uw8kuHx8Tx4HFYKzU4dxhsyOw\",\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-09-14 04:33:32'),
('febd46f5cdf378ffcb34ecce35', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"user_id\":\"1\",\"user_token\":\"XsN5gyijgJuOKJX77NuPLQwCTtDczBZT\"}', '2017-12-11 16:01:46'),
('ff8ae0466974e8409f617ed38c', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-12-01 08:21:52'),
('ff8e95f57db05f892da763e30b', 'false', '2017-09-29 07:02:08'),
('ffc199a0ab2ceec1931f067008', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2017-09-13 15:36:37');

-- --------------------------------------------------------

--
-- Table structure for table `oc_setting`
--

DROP TABLE IF EXISTS `oc_setting`;
CREATE TABLE `oc_setting` (
  `setting_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `code` varchar(128) NOT NULL,
  `key` varchar(128) NOT NULL,
  `value` text NOT NULL,
  `serialized` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_setting`
--

INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES
(4, 0, 'voucher', 'total_voucher_sort_order', '8', 0),
(5, 0, 'voucher', 'total_voucher_status', '1', 0),
(2369, 0, 'developer', 'developer_sass', '0', 0),
(7376, 0, 'config', 'config_file_mime_allowed', 'text/plain\r\nimage/png\r\nimage/jpeg\r\nimage/gif\r\nimage/bmp\r\nimage/tiff\r\nimage/svg+xml\r\napplication/zip\r\n&quot;application/zip&quot;\r\napplication/x-zip\r\n&quot;application/x-zip&quot;\r\napplication/x-zip-compressed\r\n&quot;application/x-zip-compressed&quot;\r\napplication/rar\r\n&quot;application/rar&quot;\r\napplication/x-rar\r\n&quot;application/x-rar&quot;\r\napplication/x-rar-compressed\r\n&quot;application/x-rar-compressed&quot;\r\napplication/octet-stream\r\n&quot;application/octet-stream&quot;\r\naudio/mpeg\r\nvideo/quicktime\r\napplication/pdf', 0),
(7375, 0, 'config', 'config_file_ext_allowed', 'zip\r\ntxt\r\npng\r\njpe\r\njpeg\r\njpg\r\ngif\r\nbmp\r\nico\r\ntiff\r\ntif\r\nsvg\r\nsvgz\r\nzip\r\nrar\r\nmsi\r\ncab\r\nmp3\r\nqt\r\nmov\r\npdf\r\npsd\r\nai\r\neps\r\nps\r\ndoc', 0),
(7374, 0, 'config', 'config_file_max_size', '300000', 0),
(7372, 0, 'config', 'config_shared', '0', 0),
(7373, 0, 'config', 'config_encryption', '1eBsWQOwJreL32vPP7R82pA8q5M6uGbtZTm2hzwbA9Xr7veLgCgh0VgdqcFomjtAH6V4LlxHFeBunPURBXzUCh58aqDMYZmOCGfEUHckH77KNrL3CQWXOXrLMR19yg2Ehz3EhJL4qhacpGIWbe8KUJTKpEQhflq0gbTOMau2KdHtFyk3IZ1RW9Ya2JSg6G8VUR1uCMJdxHd7W0QRzG4RXev8zWqXvcbSe9kXezu3PUQbRNCq3X4xNHoxDRFV5iuE9UAWA6Cq5kBGMNrmyli3asjfR8DAtdxfDJXUxYCIi6IGEMKlRZf60cxJ0gI4NzO7pyPUsGom4GvYnao74BGhA26dCTA64yYx7MdOgsxgKs1pIlbSGYP1Eml8k26zm8E76WEQ3zL0HUUmM32MfHvBCre6q0Yh2biOdTprFq6K7ZhCeliOnoIUIzzxvsEgAKpnfJVmEjqioARQH7MD6P0KPngy2B2BaLZl4kxT1BspJbF0MY1JPyxhxiySGMGuDWLdRIcjDZvJf9fXMr72T33D5DDxc1Qo1YFeeiXWCi5BHbHQBzJwvjGdgPbfPYrRl9fddTijSH3yrn9hDc1fgY6kwmwfEtbXx0Yg2Db61nOcItQzlY8VF6r34ZZzEiWJzDL55xvyR1St1HwVXKpb13BazlkWnrWhM6cFeNkZ1bFkQHLisOMQ19a8fUu3No94xd3uBWhicE7G66ETXtBfbfYGKZb1XGByk3h9veTlQwW7YAyyrtRFwCYDXkCaJB0xAhUbqA9CoZt2VUAydNhLdUefFW2coV92MIHt0DBsxAmLFXR9cpvtkUO5QdmY9KXxsfPhA7xGdFIYi86tOFox1Fs0xaNRAG6AsdvAj8BLMq28tTZX6NKJFHcggdLzN0MGvFpmmBWW5F6zQxgAzFBWnPeZ5bYuzQ1NXVxwSy0HCB1gZVqbs7ksTnukNUUNxv4CLBTAsZTBJx78UdBdU4fpvBaXheUwyUDPjKoiDF1M6GdqA6tcmKRQOSxYHQLnZL2UZrUu', 0),
(7371, 0, 'config', 'config_password', '1', 0),
(7370, 0, 'config', 'config_secure', '0', 0),
(7369, 0, 'config', 'config_compression', '4', 0),
(95, 0, 'payment_free_checkout', 'payment_free_checkout_status', '1', 0),
(96, 0, 'payment_free_checkout', 'free_checkout_order_status_id', '1', 0),
(97, 0, 'payment_free_checkout', 'payment_free_checkout_sort_order', '1', 0),
(98, 0, 'payment_cod', 'payment_cod_sort_order', '5', 0),
(99, 0, 'payment_cod', 'payment_cod_total', '0.01', 0),
(100, 0, 'payment_cod', 'payment_cod_order_status_id', '1', 0),
(101, 0, 'payment_cod', 'payment_cod_geo_zone_id', '0', 0),
(102, 0, 'payment_cod', 'payment_cod_status', '1', 0),
(103, 0, 'shipping_flat', 'shipping_flat_sort_order', '1', 0),
(104, 0, 'shipping_flat', 'shipping_flat_status', '1', 0),
(105, 0, 'shipping_flat', 'shipping_flat_geo_zone_id', '0', 0),
(106, 0, 'shipping_flat', 'shipping_flat_tax_class_id', '9', 0),
(107, 0, 'shipping_flat', 'shipping_flat_cost', '5.00', 0),
(108, 0, 'total_shipping', 'total_shipping_sort_order', '3', 0),
(109, 0, 'total_sub_total', 'sub_total_sort_order', '1', 0),
(110, 0, 'total_sub_total', 'total_sub_total_status', '1', 0),
(111, 0, 'total_tax', 'total_tax_status', '1', 0),
(112, 0, 'total_total', 'total_total_sort_order', '9', 0),
(113, 0, 'total_total', 'total_total_status', '1', 0),
(114, 0, 'total_tax', 'total_tax_sort_order', '5', 0),
(115, 0, 'total_credit', 'total_credit_sort_order', '7', 0),
(116, 0, 'total_credit', 'total_credit_status', '1', 0),
(117, 0, 'total_reward', 'total_reward_sort_order', '2', 0),
(118, 0, 'total_reward', 'total_reward_status', '1', 0),
(119, 0, 'total_shipping', 'total_shipping_status', '1', 0),
(120, 0, 'total_shipping', 'total_shipping_estimator', '1', 0),
(121, 0, 'total_coupon', 'total_coupon_sort_order', '4', 0),
(122, 0, 'total_coupon', 'total_coupon_status', '1', 0),
(7643, 3, 'theme_default', 'theme_default_image_location_height', '50', 0),
(7623, 3, 'theme_default', 'theme_default_product_description_length', '300', 0),
(1050, 0, 'module_oclayerednavigation', 'module_oclayerednavigation_loader_img', 'catalog/AjaxLoader.gif', 0),
(7595, 0, 'theme_default', 'theme_default_image_location_height', '50', 0),
(7664, 7, 'theme_default', 'theme_default_image_cart_width', '80', 0),
(7594, 0, 'theme_default', 'theme_default_image_location_width', '268', 0),
(149, 0, 'dashboard_activity', 'dashboard_activity_status', '1', 0),
(150, 0, 'dashboard_activity', 'dashboard_activity_sort_order', '7', 0),
(151, 0, 'dashboard_sale', 'dashboard_sale_status', '1', 0),
(152, 0, 'dashboard_sale', 'dashboard_sale_width', '3', 0),
(153, 0, 'dashboard_chart', 'dashboard_chart_status', '1', 0),
(154, 0, 'dashboard_chart', 'dashboard_chart_width', '6', 0),
(155, 0, 'dashboard_customer', 'dashboard_customer_status', '1', 0),
(156, 0, 'dashboard_customer', 'dashboard_customer_width', '3', 0),
(157, 0, 'dashboard_map', 'dashboard_map_status', '1', 0),
(158, 0, 'dashboard_map', 'dashboard_map_width', '6', 0),
(159, 0, 'dashboard_online', 'dashboard_online_status', '1', 0),
(160, 0, 'dashboard_online', 'dashboard_online_width', '3', 0),
(161, 0, 'dashboard_order', 'dashboard_order_sort_order', '1', 0),
(162, 0, 'dashboard_order', 'dashboard_order_status', '1', 0),
(163, 0, 'dashboard_order', 'dashboard_order_width', '3', 0),
(164, 0, 'dashboard_sale', 'dashboard_sale_sort_order', '2', 0),
(165, 0, 'dashboard_customer', 'dashboard_customer_sort_order', '3', 0),
(166, 0, 'dashboard_online', 'dashboard_online_sort_order', '4', 0),
(167, 0, 'dashboard_map', 'dashboard_map_sort_order', '5', 0),
(168, 0, 'dashboard_chart', 'dashboard_chart_sort_order', '6', 0),
(169, 0, 'dashboard_recent', 'dashboard_recent_status', '1', 0),
(170, 0, 'dashboard_recent', 'dashboard_recent_sort_order', '8', 0),
(171, 0, 'dashboard_activity', 'dashboard_activity_width', '4', 0),
(172, 0, 'dashboard_recent', 'dashboard_recent_width', '8', 0),
(173, 0, 'report_customer_activity', 'report_customer_activity_status', '1', 0),
(174, 0, 'report_customer_activity', 'report_customer_activity_sort_order', '1', 0),
(175, 0, 'report_customer_order', 'report_customer_order_status', '1', 0),
(176, 0, 'report_customer_order', 'report_customer_order_sort_order', '2', 0),
(177, 0, 'report_customer_reward', 'report_customer_reward_status', '1', 0),
(178, 0, 'report_customer_reward', 'report_customer_reward_sort_order', '3', 0),
(179, 0, 'report_customer_search', 'report_customer_search_sort_order', '3', 0),
(180, 0, 'report_customer_search', 'report_customer_search_status', '1', 0),
(181, 0, 'report_customer_transaction', 'report_customer_transaction_status', '1', 0),
(182, 0, 'report_customer_transaction', 'report_customer_transaction_status_sort_order', '4', 0),
(183, 0, 'report_sale_tax', 'report_sale_tax_status', '1', 0),
(184, 0, 'report_sale_tax', 'report_sale_tax_sort_order', '5', 0),
(185, 0, 'report_sale_shipping', 'report_sale_shipping_status', '1', 0),
(186, 0, 'report_sale_shipping', 'report_sale_shipping_sort_order', '6', 0),
(187, 0, 'report_sale_return', 'report_sale_return_status', '1', 0),
(188, 0, 'report_sale_return', 'report_sale_return_sort_order', '7', 0),
(189, 0, 'report_sale_order', 'report_sale_order_status', '1', 0),
(190, 0, 'report_sale_order', 'report_sale_order_sort_order', '8', 0),
(191, 0, 'report_sale_coupon', 'report_sale_coupon_status', '1', 0),
(192, 0, 'report_sale_coupon', 'report_sale_coupon_sort_order', '9', 0),
(193, 0, 'report_product_viewed', 'report_product_viewed_status', '1', 0),
(194, 0, 'report_product_viewed', 'report_product_viewed_sort_order', '10', 0),
(195, 0, 'report_product_purchased', 'report_product_purchased_status', '1', 0),
(196, 0, 'report_product_purchased', 'report_product_purchased_sort_order', '11', 0),
(197, 0, 'report_marketing', 'report_marketing_status', '1', 0),
(198, 0, 'report_marketing', 'report_marketing_sort_order', '12', 0),
(2368, 0, 'developer', 'developer_theme', '0', 0),
(7339, 0, 'config', 'config_processing_status', '[\"5\",\"1\",\"2\",\"12\",\"3\"]', 1),
(7145, 1, 'config', 'config_stock_display', '0', 0),
(7144, 1, 'config', 'config_order_status_id', '7', 0),
(7141, 1, 'config', 'config_cart_weight', '0', 0),
(7592, 0, 'theme_default', 'theme_default_image_cart_width', '80', 0),
(7414, 2, 'config', 'config_icon', 'catalog/cart.png', 0),
(7413, 2, 'config', 'config_logo', 'catalog/logo/logo-home3.png', 0),
(7449, 3, 'config', 'config_logo', 'catalog/logo/logo-home4.png', 0),
(7448, 3, 'config', 'config_stock_checkout', '0', 0),
(7447, 3, 'config', 'config_stock_display', '0', 0),
(7446, 3, 'config', 'config_order_status_id', '7', 0),
(7340, 0, 'config', 'config_complete_status', '[\"5\",\"3\"]', 1),
(7544, 1, 'theme_default', 'theme_default_image_cart_width', '80', 0),
(7619, 2, 'theme_default', 'theme_default_image_location_height', '50', 0),
(7543, 1, 'theme_default', 'theme_default_image_wishlist_height', '103', 0),
(7542, 1, 'theme_default', 'theme_default_image_wishlist_width', '80', 0),
(7541, 1, 'theme_default', 'theme_default_image_compare_height', '103', 0),
(7540, 1, 'theme_default', 'theme_default_image_compare_width', '80', 0),
(7539, 1, 'theme_default', 'theme_default_image_related_height', '770', 0),
(7538, 1, 'theme_default', 'theme_default_image_related_width', '600', 0),
(7618, 2, 'theme_default', 'theme_default_image_location_width', '268', 0),
(7617, 2, 'theme_default', 'theme_default_image_cart_height', '103', 0),
(7616, 2, 'theme_default', 'theme_default_image_cart_width', '80', 0),
(7615, 2, 'theme_default', 'theme_default_image_wishlist_height', '103', 0),
(7614, 2, 'theme_default', 'theme_default_image_wishlist_width', '80', 0),
(7613, 2, 'theme_default', 'theme_default_image_compare_height', '103', 0),
(7612, 2, 'theme_default', 'theme_default_image_compare_width', '80', 0),
(7611, 2, 'theme_default', 'theme_default_image_related_height', '770', 0),
(7642, 3, 'theme_default', 'theme_default_image_location_width', '268', 0),
(7641, 3, 'theme_default', 'theme_default_image_cart_height', '103', 0),
(7640, 3, 'theme_default', 'theme_default_image_cart_width', '80', 0),
(7639, 3, 'theme_default', 'theme_default_image_wishlist_height', '103', 0),
(7638, 3, 'theme_default', 'theme_default_image_wishlist_width', '80', 0),
(7637, 3, 'theme_default', 'theme_default_image_compare_height', '103', 0),
(7636, 3, 'theme_default', 'theme_default_image_compare_width', '80', 0),
(849, 4, 'theme_default', 'theme_default_image_wishlist_height', '107', 0),
(848, 4, 'theme_default', 'theme_default_image_wishlist_width', '80', 0),
(847, 4, 'theme_default', 'theme_default_image_compare_height', '107', 0),
(846, 4, 'theme_default', 'theme_default_image_compare_width', '80', 0),
(845, 4, 'theme_default', 'theme_default_image_related_height', '933', 0),
(844, 4, 'theme_default', 'theme_default_image_related_width', '700', 0),
(843, 4, 'theme_default', 'theme_default_image_additional_height', '933', 0),
(842, 4, 'theme_default', 'theme_default_image_additional_width', '700', 0),
(841, 4, 'theme_default', 'theme_default_image_product_height', '933', 0),
(840, 4, 'theme_default', 'theme_default_image_product_width', '700', 0),
(839, 4, 'theme_default', 'theme_default_image_popup_height', '1333', 0),
(838, 4, 'theme_default', 'theme_default_image_popup_width', '1000', 0),
(837, 4, 'theme_default', 'theme_default_image_thumb_height', '933', 0),
(836, 4, 'theme_default', 'theme_default_image_thumb_width', '700', 0),
(835, 4, 'theme_default', 'theme_default_image_category_height', '80', 0),
(834, 4, 'theme_default', 'theme_default_image_category_width', '80', 0),
(874, 5, 'theme_default', 'theme_default_image_cart_width', '80', 0),
(873, 5, 'theme_default', 'theme_default_image_wishlist_height', '107', 0),
(872, 5, 'theme_default', 'theme_default_image_wishlist_width', '80', 0),
(871, 5, 'theme_default', 'theme_default_image_compare_height', '107', 0),
(870, 5, 'theme_default', 'theme_default_image_compare_width', '80', 0),
(869, 5, 'theme_default', 'theme_default_image_related_height', '933', 0),
(868, 5, 'theme_default', 'theme_default_image_related_width', '700', 0),
(867, 5, 'theme_default', 'theme_default_image_additional_height', '933', 0),
(866, 5, 'theme_default', 'theme_default_image_additional_width', '700', 0),
(865, 5, 'theme_default', 'theme_default_image_product_height', '933', 0),
(864, 5, 'theme_default', 'theme_default_image_product_width', '700', 0),
(863, 5, 'theme_default', 'theme_default_image_popup_height', '1333', 0),
(862, 5, 'theme_default', 'theme_default_image_popup_width', '1000', 0),
(861, 5, 'theme_default', 'theme_default_image_thumb_height', '933', 0),
(860, 5, 'theme_default', 'theme_default_image_thumb_width', '700', 0),
(859, 5, 'theme_default', 'theme_default_image_category_height', '80', 0),
(858, 5, 'theme_default', 'theme_default_image_category_width', '80', 0),
(857, 5, 'theme_default', 'theme_default_product_description_length', '300', 0),
(856, 5, 'theme_default', 'theme_default_product_limit', '15', 0),
(855, 5, 'theme_default', 'theme_default_status', '1', 0),
(854, 5, 'theme_default', 'theme_default_directory', 'tt_mimosa6', 0),
(850, 4, 'theme_default', 'theme_default_image_cart_width', '80', 0),
(833, 4, 'theme_default', 'theme_default_product_description_length', '300', 0),
(832, 4, 'theme_default', 'theme_default_product_limit', '15', 0),
(831, 4, 'theme_default', 'theme_default_status', '1', 0),
(830, 4, 'theme_default', 'theme_default_directory', 'tt_mimosa5', 0),
(7635, 3, 'theme_default', 'theme_default_image_related_height', '770', 0),
(7610, 2, 'theme_default', 'theme_default_image_related_width', '600', 0),
(7609, 2, 'theme_default', 'theme_default_image_additional_height', '770', 0),
(7593, 0, 'theme_default', 'theme_default_image_cart_height', '103', 0),
(7591, 0, 'theme_default', 'theme_default_image_wishlist_height', '103', 0),
(7632, 3, 'theme_default', 'theme_default_image_additional_width', '600', 0),
(7633, 3, 'theme_default', 'theme_default_image_additional_height', '770', 0),
(851, 4, 'theme_default', 'theme_default_image_cart_height', '107', 0),
(852, 4, 'theme_default', 'theme_default_image_location_width', '268', 0),
(853, 4, 'theme_default', 'theme_default_image_location_height', '50', 0),
(875, 5, 'theme_default', 'theme_default_image_cart_height', '107', 0),
(876, 5, 'theme_default', 'theme_default_image_location_width', '268', 0),
(877, 5, 'theme_default', 'theme_default_image_location_height', '50', 0),
(931, 0, 'module_ocajaxlogin', 'module_ocajaxlogin_redirect_status', '0', 0),
(930, 0, 'module_ocajaxlogin', 'module_ocajaxlogin_status', '1', 0),
(1049, 0, 'module_oclayerednavigation', 'module_oclayerednavigation_status', '1', 0),
(7606, 2, 'theme_default', 'theme_default_image_product_width', '600', 0),
(6607, 0, 'module_octhemeoption', 'module_octhemeoption_quickview', '{\"0\":\"1\",\"1\":\"1\",\"2\":\"1\",\"3\":\"1\",\"6\":\"1\",\"7\":\"1\"}', 1),
(6606, 0, 'module_octhemeoption', 'module_octhemeoption_rotator', '{\"0\":\"1\",\"1\":\"1\",\"2\":\"1\",\"3\":\"1\",\"6\":\"1\",\"7\":\"1\"}', 1),
(6605, 0, 'module_octhemeoption', 'module_octhemeoption_catalog', '{\"0\":\"1\",\"1\":\"1\",\"2\":\"1\",\"3\":\"1\",\"6\":\"1\",\"7\":\"1\"}', 1),
(6604, 0, 'module_octhemeoption', 'module_octhemeoption_loader_img', 'catalog/AjaxLoader.gif', 0),
(6601, 0, 'module_octhemeoption', 'module_octhemeoption_body', '{\"0\":{\"color\":\"707070\",\"font_family\":\"Poppins\",\"font_size\":\"12px\",\"font_weight\":\"400\",\"line_height\":\"20px\"},\"1\":{\"color\":\"FFFFFF\",\"font_family\":\"\",\"font_size\":\"\",\"font_weight\":\"\",\"line_height\":\"\"},\"2\":{\"color\":\"FFFFFF\",\"font_family\":\"\",\"font_size\":\"\",\"font_weight\":\"\",\"line_height\":\"\"},\"3\":{\"color\":\"FFFFFF\",\"font_family\":\"\",\"font_size\":\"\",\"font_weight\":\"\",\"line_height\":\"\"},\"6\":{\"color\":\"FFFFFF\",\"font_family\":\"\",\"font_size\":\"\",\"font_weight\":\"\",\"line_height\":\"\"},\"7\":{\"color\":\"FFFFFF\",\"font_family\":\"\",\"font_size\":\"\",\"font_weight\":\"\",\"line_height\":\"\"}}', 1),
(6602, 0, 'module_octhemeoption', 'module_octhemeoption_a_tag', '{\"0\":{\"color\":\"292929\",\"hover_color\":\"EE3333\"},\"1\":{\"color\":\"FFFFFF\",\"hover_color\":\"FFFFFF\"},\"2\":{\"color\":\"FFFFFF\",\"hover_color\":\"FFFFFF\"},\"3\":{\"color\":\"FFFFFF\",\"hover_color\":\"FFFFFF\"},\"6\":{\"color\":\"FFFFFF\",\"hover_color\":\"FFFFFF\"},\"7\":{\"color\":\"FFFFFF\",\"hover_color\":\"FFFFFF\"}}', 1),
(932, 0, 'module_ocajaxlogin', 'module_ocajaxlogin_loader_img', 'catalog/AjaxLoader.gif', 0),
(7143, 1, 'config', 'config_checkout_id', '0', 0),
(7590, 0, 'theme_default', 'theme_default_image_wishlist_width', '80', 0),
(7410, 2, 'config', 'config_order_status_id', '7', 0),
(7142, 1, 'config', 'config_checkout_guest', '0', 0),
(7343, 0, 'config', 'config_stock_display', '0', 0),
(7412, 2, 'config', 'config_stock_checkout', '0', 0),
(7445, 3, 'config', 'config_checkout_id', '0', 0),
(7341, 0, 'config', 'config_fraud_status_id', '7', 0),
(7342, 0, 'config', 'config_api_id', '7', 0),
(7589, 0, 'theme_default', 'theme_default_image_compare_height', '103', 0),
(7344, 0, 'config', 'config_stock_warning', '0', 0),
(7345, 0, 'config', 'config_stock_checkout', '0', 0),
(7140, 1, 'config', 'config_account_id', '0', 0),
(7139, 1, 'config', 'config_customer_price', '0', 0),
(7346, 0, 'config', 'config_affiliate_group_id', '1', 0),
(7347, 0, 'config', 'config_affiliate_approval', '0', 0),
(7328, 0, 'config', 'config_customer_search', '0', 0),
(7329, 0, 'config', 'config_customer_group_id', '1', 0),
(7330, 0, 'config', 'config_customer_group_display', '[\"1\"]', 1),
(7331, 0, 'config', 'config_customer_price', '0', 0),
(7138, 1, 'config', 'config_customer_group_id', '1', 0),
(7327, 0, 'config', 'config_customer_activity', '0', 0),
(7302, 0, 'config', 'config_geocode', '', 0),
(7303, 0, 'config', 'config_email', 'demo@plazathemes.com', 0),
(7304, 0, 'config', 'config_telephone', '123456789', 0),
(7305, 0, 'config', 'config_fax', '', 0),
(7306, 0, 'config', 'config_image', '', 0),
(7307, 0, 'config', 'config_open', '', 0),
(7308, 0, 'config', 'config_comment', '', 0),
(7411, 2, 'config', 'config_stock_display', '0', 0),
(7441, 3, 'config', 'config_customer_price', '0', 0),
(7442, 3, 'config', 'config_account_id', '0', 0),
(7588, 0, 'theme_default', 'theme_default_image_compare_width', '80', 0),
(7587, 0, 'theme_default', 'theme_default_image_related_height', '770', 0),
(7608, 2, 'theme_default', 'theme_default_image_additional_width', '600', 0),
(7315, 0, 'config', 'config_length_class_id', '1', 0),
(7537, 1, 'theme_default', 'theme_default_image_additional_height', '770', 0),
(7536, 1, 'theme_default', 'theme_default_image_additional_width', '600', 0),
(7137, 1, 'config', 'config_tax_customer', '', 0),
(7607, 2, 'theme_default', 'theme_default_image_product_height', '770', 0),
(7605, 2, 'theme_default', 'theme_default_image_popup_height', '770', 0),
(7409, 2, 'config', 'config_checkout_id', '0', 0),
(7406, 2, 'config', 'config_account_id', '0', 0),
(7444, 3, 'config', 'config_checkout_guest', '0', 0),
(7634, 3, 'theme_default', 'theme_default_image_related_width', '600', 0),
(7309, 0, 'config', 'config_country_id', '222', 0),
(7310, 0, 'config', 'config_zone_id', '3563', 0),
(7311, 0, 'config', 'config_language', 'en-gb', 0),
(7312, 0, 'config', 'config_admin_language', 'en-gb', 0),
(7313, 0, 'config', 'config_currency', 'USD', 0),
(7314, 0, 'config', 'config_currency_auto', '1', 0),
(7135, 1, 'config', 'config_tax', '0', 0),
(7136, 1, 'config', 'config_tax_default', '', 0),
(7408, 2, 'config', 'config_checkout_guest', '0', 0),
(7407, 2, 'config', 'config_cart_weight', '0', 0),
(7134, 1, 'config', 'config_currency', 'USD', 0),
(7443, 3, 'config', 'config_cart_weight', '0', 0),
(7437, 3, 'config', 'config_tax', '0', 0),
(7316, 0, 'config', 'config_weight_class_id', '1', 0),
(7584, 0, 'theme_default', 'theme_default_image_additional_width', '600', 0),
(7534, 1, 'theme_default', 'theme_default_image_product_width', '600', 0),
(7535, 1, 'theme_default', 'theme_default_image_product_height', '770', 0),
(7133, 1, 'config', 'config_language', 'en-gb', 0),
(7583, 0, 'theme_default', 'theme_default_image_product_height', '770', 0),
(5266, 0, 'module_category', 'module_category_status', '1', 0),
(7585, 0, 'theme_default', 'theme_default_image_additional_height', '770', 0),
(7586, 0, 'theme_default', 'theme_default_image_related_width', '600', 0),
(7631, 3, 'theme_default', 'theme_default_image_product_height', '770', 0),
(7440, 3, 'config', 'config_customer_group_id', '1', 0),
(7439, 3, 'config', 'config_tax_customer', '', 0),
(7630, 3, 'theme_default', 'theme_default_image_product_width', '600', 0),
(7604, 2, 'theme_default', 'theme_default_image_popup_width', '600', 0),
(7603, 2, 'theme_default', 'theme_default_image_thumb_height', '770', 0),
(7317, 0, 'config', 'config_product_count', '1', 0),
(7318, 0, 'config', 'config_limit_admin', '20', 0),
(7319, 0, 'config', 'config_review_status', '1', 0),
(7320, 0, 'config', 'config_review_guest', '1', 0),
(7321, 0, 'config', 'config_voucher_min', '1', 0),
(7322, 0, 'config', 'config_voucher_max', '1000', 0),
(7323, 0, 'config', 'config_tax', '1', 0),
(7324, 0, 'config', 'config_tax_default', 'shipping', 0),
(7325, 0, 'config', 'config_tax_customer', 'shipping', 0),
(7326, 0, 'config', 'config_customer_online', '0', 0),
(7301, 0, 'config', 'config_address', 'Address 1', 0),
(7132, 1, 'config', 'config_zone_id', '3563', 0),
(7131, 1, 'config', 'config_country_id', '222', 0),
(7130, 1, 'config', 'config_comment', '', 0),
(7300, 0, 'config', 'config_owner', 'Plazathemes', 0),
(7405, 2, 'config', 'config_customer_price', '0', 0),
(7401, 2, 'config', 'config_tax', '0', 0),
(7402, 2, 'config', 'config_tax_default', '', 0),
(7403, 2, 'config', 'config_tax_customer', '', 0),
(7438, 3, 'config', 'config_tax_default', '', 0),
(7436, 3, 'config', 'config_currency', 'USD', 0),
(7435, 3, 'config', 'config_language', 'en-gb', 0),
(7299, 0, 'config', 'config_name', 'Koparion 1', 0),
(6108, 0, 'module_ocblog', 'module_ocblog_article_width', '370', 0),
(6107, 0, 'module_ocblog', 'module_ocblog_blog_height', '218', 0),
(6106, 0, 'module_ocblog', 'module_ocblog_blog_width', '370', 0),
(7582, 0, 'theme_default', 'theme_default_image_product_width', '600', 0),
(7581, 0, 'theme_default', 'theme_default_image_popup_height', '770', 0),
(7298, 0, 'config', 'config_layout_id', '4', 0),
(6105, 0, 'module_ocblog', 'module_ocblog_meta_keyword', 'Blog Keyword', 0),
(6104, 0, 'module_ocblog', 'module_ocblog_meta_description', 'Blog Description', 0),
(6103, 0, 'module_ocblog', 'module_ocblog_meta_title', 'Blog', 0),
(7580, 0, 'theme_default', 'theme_default_image_popup_width', '600', 0),
(7348, 0, 'config', 'config_affiliate_auto', '0', 0),
(7129, 1, 'config', 'config_open', '', 0),
(7128, 1, 'config', 'config_image', '', 0),
(7533, 1, 'theme_default', 'theme_default_image_popup_height', '770', 0),
(7532, 1, 'theme_default', 'theme_default_image_popup_width', '600', 0),
(7602, 2, 'theme_default', 'theme_default_image_thumb_width', '600', 0),
(7601, 2, 'theme_default', 'theme_default_image_category_height', '345', 0),
(7600, 2, 'theme_default', 'theme_default_image_category_width', '870', 0),
(7404, 2, 'config', 'config_customer_group_id', '1', 0),
(7400, 2, 'config', 'config_currency', 'USD', 0),
(7599, 2, 'theme_default', 'theme_default_product_description_length', '300', 0),
(7629, 3, 'theme_default', 'theme_default_image_popup_height', '770', 0),
(7627, 3, 'theme_default', 'theme_default_image_thumb_height', '770', 0),
(7628, 3, 'theme_default', 'theme_default_image_popup_width', '600', 0),
(7434, 3, 'config', 'config_zone_id', '3563', 0),
(7349, 0, 'config', 'config_affiliate_commission', '5', 0),
(7350, 0, 'config', 'config_affiliate_id', '4', 0),
(7351, 0, 'config', 'config_return_id', '0', 0),
(7352, 0, 'config', 'config_return_status_id', '2', 0),
(7353, 0, 'config', 'config_captcha', '', 0),
(7354, 0, 'config', 'config_captcha_page', '[\"review\",\"return\",\"contact\"]', 1),
(7355, 0, 'config', 'config_logo', 'catalog/logo/logo.png', 0),
(7356, 0, 'config', 'config_icon', 'catalog/cart.png', 0),
(7357, 0, 'config', 'config_mail_engine', 'mail', 0),
(7358, 0, 'config', 'config_mail_parameter', '', 0),
(7359, 0, 'config', 'config_mail_smtp_hostname', '', 0),
(7127, 1, 'config', 'config_fax', '', 0),
(7126, 1, 'config', 'config_telephone', '123456789', 0),
(7125, 1, 'config', 'config_email', 'demo@plazathemes.com', 0),
(7123, 1, 'config', 'config_address', 'Address 1', 0),
(7124, 1, 'config', 'config_geocode', '', 0),
(7399, 2, 'config', 'config_language', 'en-gb', 0),
(7398, 2, 'config', 'config_zone_id', '3563', 0),
(7397, 2, 'config', 'config_country_id', '222', 0),
(7396, 2, 'config', 'config_comment', '', 0),
(7433, 3, 'config', 'config_country_id', '222', 0),
(7432, 3, 'config', 'config_comment', '', 0),
(7431, 3, 'config', 'config_open', '', 0),
(7430, 3, 'config', 'config_image', '', 0),
(7429, 3, 'config', 'config_fax', '', 0),
(7428, 3, 'config', 'config_telephone', '123456789', 0),
(7360, 0, 'config', 'config_mail_smtp_username', '', 0),
(7361, 0, 'config', 'config_mail_smtp_password', '', 0),
(7362, 0, 'config', 'config_mail_smtp_port', '25', 0),
(7578, 0, 'theme_default', 'theme_default_image_thumb_width', '600', 0),
(7579, 0, 'theme_default', 'theme_default_image_thumb_height', '770', 0),
(7531, 1, 'theme_default', 'theme_default_image_thumb_height', '770', 0),
(7529, 1, 'theme_default', 'theme_default_image_category_height', '345', 0),
(7121, 1, 'config', 'config_name', 'Koparion 2', 0),
(7598, 2, 'theme_default', 'theme_default_product_limit', '12', 0),
(7597, 2, 'theme_default', 'theme_default_status', '1', 0),
(7395, 2, 'config', 'config_open', '', 0),
(7394, 2, 'config', 'config_image', '', 0),
(7392, 2, 'config', 'config_telephone', '123456789', 0),
(7390, 2, 'config', 'config_geocode', '', 0),
(7391, 2, 'config', 'config_email', 'demo@plazathemes.com', 0),
(6102, 0, 'module_ocblog', 'module_ocblog_article_limit', '10', 0),
(7626, 3, 'theme_default', 'theme_default_image_thumb_width', '600', 0),
(7624, 3, 'theme_default', 'theme_default_image_category_width', '870', 0),
(7625, 3, 'theme_default', 'theme_default_image_category_height', '345', 0),
(7427, 3, 'config', 'config_email', 'demo@plazathemes.com', 0),
(7426, 3, 'config', 'config_geocode', '', 0),
(7363, 0, 'config', 'config_mail_smtp_timeout', '5', 0),
(7364, 0, 'config', 'config_mail_alert', '[\"order\"]', 1),
(7365, 0, 'config', 'config_mail_alert_email', '', 0),
(7366, 0, 'config', 'config_maintenance', '0', 0),
(7367, 0, 'config', 'config_seo_url', '0', 0),
(7368, 0, 'config', 'config_robots', 'abot\r\ndbot\r\nebot\r\nhbot\r\nkbot\r\nlbot\r\nmbot\r\nnbot\r\nobot\r\npbot\r\nrbot\r\nsbot\r\ntbot\r\nvbot\r\nybot\r\nzbot\r\nbot.\r\nbot/\r\n_bot\r\n.bot\r\n/bot\r\n-bot\r\n:bot\r\n(bot\r\ncrawl\r\nslurp\r\nspider\r\nseek\r\naccoona\r\nacoon\r\nadressendeutschland\r\nah-ha.com\r\nahoy\r\naltavista\r\nananzi\r\nanthill\r\nappie\r\narachnophilia\r\narale\r\naraneo\r\naranha\r\narchitext\r\naretha\r\narks\r\nasterias\r\natlocal\r\natn\r\natomz\r\naugurfind\r\nbackrub\r\nbannana_bot\r\nbaypup\r\nbdfetch\r\nbig brother\r\nbiglotron\r\nbjaaland\r\nblackwidow\r\nblaiz\r\nblog\r\nblo.\r\nbloodhound\r\nboitho\r\nbooch\r\nbradley\r\nbutterfly\r\ncalif\r\ncassandra\r\nccubee\r\ncfetch\r\ncharlotte\r\nchurl\r\ncienciaficcion\r\ncmc\r\ncollective\r\ncomagent\r\ncombine\r\ncomputingsite\r\ncsci\r\ncurl\r\ncusco\r\ndaumoa\r\ndeepindex\r\ndelorie\r\ndepspid\r\ndeweb\r\ndie blinde kuh\r\ndigger\r\nditto\r\ndmoz\r\ndocomo\r\ndownload express\r\ndtaagent\r\ndwcp\r\nebiness\r\nebingbong\r\ne-collector\r\nejupiter\r\nemacs-w3 search engine\r\nesther\r\nevliya celebi\r\nezresult\r\nfalcon\r\nfelix ide\r\nferret\r\nfetchrover\r\nfido\r\nfindlinks\r\nfireball\r\nfish search\r\nfouineur\r\nfunnelweb\r\ngazz\r\ngcreep\r\ngenieknows\r\ngetterroboplus\r\ngeturl\r\nglx\r\ngoforit\r\ngolem\r\ngrabber\r\ngrapnel\r\ngralon\r\ngriffon\r\ngromit\r\ngrub\r\ngulliver\r\nhamahakki\r\nharvest\r\nhavindex\r\nhelix\r\nheritrix\r\nhku www octopus\r\nhomerweb\r\nhtdig\r\nhtml index\r\nhtml_analyzer\r\nhtmlgobble\r\nhubater\r\nhyper-decontextualizer\r\nia_archiver\r\nibm_planetwide\r\nichiro\r\niconsurf\r\niltrovatore\r\nimage.kapsi.net\r\nimagelock\r\nincywincy\r\nindexer\r\ninfobee\r\ninformant\r\ningrid\r\ninktomisearch.com\r\ninspector web\r\nintelliagent\r\ninternet shinchakubin\r\nip3000\r\niron33\r\nisraeli-search\r\nivia\r\njack\r\njakarta\r\njavabee\r\njetbot\r\njumpstation\r\nkatipo\r\nkdd-explorer\r\nkilroy\r\nknowledge\r\nkototoi\r\nkretrieve\r\nlabelgrabber\r\nlachesis\r\nlarbin\r\nlegs\r\nlibwww\r\nlinkalarm\r\nlink validator\r\nlinkscan\r\nlockon\r\nlwp\r\nlycos\r\nmagpie\r\nmantraagent\r\nmapoftheinternet\r\nmarvin/\r\nmattie\r\nmediafox\r\nmediapartners\r\nmercator\r\nmerzscope\r\nmicrosoft url control\r\nminirank\r\nmiva\r\nmj12\r\nmnogosearch\r\nmoget\r\nmonster\r\nmoose\r\nmotor\r\nmultitext\r\nmuncher\r\nmuscatferret\r\nmwd.search\r\nmyweb\r\nnajdi\r\nnameprotect\r\nnationaldirectory\r\nnazilla\r\nncsa beta\r\nnec-meshexplorer\r\nnederland.zoek\r\nnetcarta webmap engine\r\nnetmechanic\r\nnetresearchserver\r\nnetscoop\r\nnewscan-online\r\nnhse\r\nnokia6682/\r\nnomad\r\nnoyona\r\nnutch\r\nnzexplorer\r\nobjectssearch\r\noccam\r\nomni\r\nopen text\r\nopenfind\r\nopenintelligencedata\r\norb search\r\nosis-project\r\npack rat\r\npageboy\r\npagebull\r\npage_verifier\r\npanscient\r\nparasite\r\npartnersite\r\npatric\r\npear.\r\npegasus\r\nperegrinator\r\npgp key agent\r\nphantom\r\nphpdig\r\npicosearch\r\npiltdownman\r\npimptrain\r\npinpoint\r\npioneer\r\npiranha\r\nplumtreewebaccessor\r\npogodak\r\npoirot\r\npompos\r\npoppelsdorf\r\npoppi\r\npopular iconoclast\r\npsycheclone\r\npublisher\r\npython\r\nrambler\r\nraven search\r\nroach\r\nroad runner\r\nroadhouse\r\nrobbie\r\nrobofox\r\nrobozilla\r\nrules\r\nsalty\r\nsbider\r\nscooter\r\nscoutjet\r\nscrubby\r\nsearch.\r\nsearchprocess\r\nsemanticdiscovery\r\nsenrigan\r\nsg-scout\r\nshai\'hulud\r\nshark\r\nshopwiki\r\nsidewinder\r\nsift\r\nsilk\r\nsimmany\r\nsite searcher\r\nsite valet\r\nsitetech-rover\r\nskymob.com\r\nsleek\r\nsmartwit\r\nsna-\r\nsnappy\r\nsnooper\r\nsohu\r\nspeedfind\r\nsphere\r\nsphider\r\nspinner\r\nspyder\r\nsteeler/\r\nsuke\r\nsuntek\r\nsupersnooper\r\nsurfnomore\r\nsven\r\nsygol\r\nszukacz\r\ntach black widow\r\ntarantula\r\ntempleton\r\n/teoma\r\nt-h-u-n-d-e-r-s-t-o-n-e\r\ntheophrastus\r\ntitan\r\ntitin\r\ntkwww\r\ntoutatis\r\nt-rex\r\ntutorgig\r\ntwiceler\r\ntwisted\r\nucsd\r\nudmsearch\r\nurl check\r\nupdated\r\nvagabondo\r\nvalkyrie\r\nverticrawl\r\nvictoria\r\nvision-search\r\nvolcano\r\nvoyager/\r\nvoyager-hc\r\nw3c_validator\r\nw3m2\r\nw3mir\r\nwalker\r\nwallpaper\r\nwanderer\r\nwauuu\r\nwavefire\r\nweb core\r\nweb hopper\r\nweb wombat\r\nwebbandit\r\nwebcatcher\r\nwebcopy\r\nwebfoot\r\nweblayers\r\nweblinker\r\nweblog monitor\r\nwebmirror\r\nwebmonkey\r\nwebquest\r\nwebreaper\r\nwebsitepulse\r\nwebsnarf\r\nwebstolperer\r\nwebvac\r\nwebwalk\r\nwebwatch\r\nwebwombat\r\nwebzinger\r\nwhizbang\r\nwhowhere\r\nwild ferret\r\nworldlight\r\nwwwc\r\nwwwster\r\nxenu\r\nxget\r\nxift\r\nxirq\r\nyandex\r\nyanga\r\nyeti\r\nyodao\r\nzao\r\nzippp\r\nzyborg', 0),
(7122, 1, 'config', 'config_owner', 'Plazathemes', 0),
(7120, 1, 'config', 'config_layout_id', '13', 0),
(7119, 1, 'config', 'config_theme', 'default', 0),
(7118, 1, 'config', 'config_meta_keyword', 'Koparion, Responsive, Opencart Theme, Fashion Theme', 0),
(7117, 1, 'config', 'config_meta_description', 'Koparion, Responsive, Opencart Theme, Fashion Theme', 0),
(7393, 2, 'config', 'config_fax', '', 0),
(7389, 2, 'config', 'config_address', 'Address 1', 0),
(7388, 2, 'config', 'config_owner', 'Plazathemes', 0),
(7386, 2, 'config', 'config_layout_id', '7', 0),
(7387, 2, 'config', 'config_name', 'Koparion 3', 0),
(7385, 2, 'config', 'config_theme', 'default', 0),
(7425, 3, 'config', 'config_address', 'Address 1', 0),
(7424, 3, 'config', 'config_owner', 'Plazathemes', 0),
(7422, 3, 'config', 'config_layout_id', '14', 0),
(7423, 3, 'config', 'config_name', 'Koparion 4', 0),
(7421, 3, 'config', 'config_theme', 'default', 0),
(7419, 3, 'config', 'config_meta_description', 'Koparion, Responsive, Opencart Theme, Fashion Theme', 0),
(7420, 3, 'config', 'config_meta_keyword', 'Koparion, Responsive, Opencart Theme, Fashion Theme', 0),
(7333, 0, 'config', 'config_account_id', '3', 0),
(7334, 0, 'config', 'config_invoice_prefix', 'INV-2017-00', 0),
(7335, 0, 'config', 'config_cart_weight', '1', 0),
(7336, 0, 'config', 'config_checkout_guest', '1', 0),
(7337, 0, 'config', 'config_checkout_id', '5', 0),
(7338, 0, 'config', 'config_order_status_id', '1', 0),
(7297, 0, 'config', 'config_theme', 'default', 0),
(7487, 6, 'config', 'config_secure', '0', 0),
(7486, 6, 'config', 'config_icon', 'catalog/cart.png', 0),
(7484, 6, 'config', 'config_stock_checkout', '0', 0),
(7485, 6, 'config', 'config_logo', 'catalog/logo/logo-home5.png', 0),
(7483, 6, 'config', 'config_stock_display', '0', 0),
(7482, 6, 'config', 'config_order_status_id', '7', 0),
(7481, 6, 'config', 'config_checkout_id', '0', 0),
(7480, 6, 'config', 'config_checkout_guest', '0', 0),
(7475, 6, 'config', 'config_tax_customer', '', 0),
(7476, 6, 'config', 'config_customer_group_id', '1', 0),
(7477, 6, 'config', 'config_customer_price', '0', 0),
(7478, 6, 'config', 'config_account_id', '0', 0),
(7479, 6, 'config', 'config_cart_weight', '0', 0),
(7473, 6, 'config', 'config_tax', '0', 0),
(7474, 6, 'config', 'config_tax_default', '', 0),
(7472, 6, 'config', 'config_currency', 'USD', 0),
(7471, 6, 'config', 'config_language', 'en-gb', 0),
(7469, 6, 'config', 'config_country_id', '222', 0),
(7470, 6, 'config', 'config_zone_id', '3563', 0),
(7468, 6, 'config', 'config_comment', '', 0),
(7467, 6, 'config', 'config_open', '', 0),
(7465, 6, 'config', 'config_fax', '', 0),
(7466, 6, 'config', 'config_image', '', 0),
(7464, 6, 'config', 'config_telephone', '123456789', 0),
(7545, 1, 'theme_default', 'theme_default_image_cart_height', '103', 0),
(7146, 1, 'config', 'config_stock_checkout', '0', 0),
(7523, 7, 'config', 'config_secure', '0', 0),
(7522, 7, 'config', 'config_icon', 'catalog/cart.png', 0),
(7520, 7, 'config', 'config_stock_checkout', '0', 0),
(7521, 7, 'config', 'config_logo', 'catalog/logo/logo-home5.png', 0),
(7519, 7, 'config', 'config_stock_display', '0', 0),
(7518, 7, 'config', 'config_order_status_id', '7', 0),
(7517, 7, 'config', 'config_checkout_id', '0', 0),
(7516, 7, 'config', 'config_checkout_guest', '0', 0),
(7515, 7, 'config', 'config_cart_weight', '0', 0),
(7514, 7, 'config', 'config_account_id', '0', 0),
(7513, 7, 'config', 'config_customer_price', '0', 0),
(7512, 7, 'config', 'config_customer_group_id', '1', 0),
(7510, 7, 'config', 'config_tax_default', '', 0),
(7511, 7, 'config', 'config_tax_customer', '', 0),
(7509, 7, 'config', 'config_tax', '0', 0),
(7508, 7, 'config', 'config_currency', 'USD', 0),
(7507, 7, 'config', 'config_language', 'en-gb', 0),
(7506, 7, 'config', 'config_zone_id', '3563', 0),
(7505, 7, 'config', 'config_country_id', '222', 0),
(7504, 7, 'config', 'config_comment', '', 0),
(7503, 7, 'config', 'config_open', '', 0),
(7502, 7, 'config', 'config_image', '', 0),
(7501, 7, 'config', 'config_fax', '', 0),
(7500, 7, 'config', 'config_telephone', '123456789', 0),
(7576, 0, 'theme_default', 'theme_default_image_category_width', '870', 0),
(7577, 0, 'theme_default', 'theme_default_image_category_height', '345', 0),
(7575, 0, 'theme_default', 'theme_default_product_description_length', '300', 0),
(7296, 0, 'config', 'config_meta_keyword', 'Koparion, Responsive, Opencart Theme, Fashion Theme', 0),
(7295, 0, 'config', 'config_meta_description', 'Koparion, Responsive, Opencart Theme, Fashion Theme', 0),
(6109, 0, 'module_ocblog', 'module_ocblog_article_height', '218', 0),
(7574, 0, 'theme_default', 'theme_default_product_limit', '12', 0),
(7573, 0, 'theme_default', 'theme_default_status', '1', 0),
(7530, 1, 'theme_default', 'theme_default_image_thumb_width', '600', 0),
(7527, 1, 'theme_default', 'theme_default_product_description_length', '180', 0),
(7528, 1, 'theme_default', 'theme_default_image_category_width', '870', 0),
(7526, 1, 'theme_default', 'theme_default_product_limit', '12', 0),
(7525, 1, 'theme_default', 'theme_default_status', '1', 0),
(7524, 1, 'theme_default', 'theme_default_directory', 'tt_koparion2', 0),
(7114, 1, 'config', 'config_url', 'http://skybook2.com/', 0),
(7596, 2, 'theme_default', 'theme_default_directory', 'tt_koparion3', 0),
(7572, 0, 'theme_default', 'theme_default_directory', 'tt_koparion1', 0),
(7622, 3, 'theme_default', 'theme_default_product_limit', '12', 0),
(7621, 3, 'theme_default', 'theme_default_status', '1', 0),
(7620, 3, 'theme_default', 'theme_default_directory', 'tt_koparion4', 0),
(7383, 2, 'config', 'config_meta_description', 'Koparion, Responsive, Opencart Theme, Fashion Theme', 0),
(7384, 2, 'config', 'config_meta_keyword', 'Koparion, Responsive, Opencart Theme, Fashion Theme', 0),
(6498, 0, 'module_octwitter', 'module_octwitter_access_token', '167448460-MuUwtTxWoehX4MKL8KrEbP6pkLnsQf0p3NKuiUGz', 0),
(6497, 0, 'module_octwitter', 'module_octwitter_consumer_secret', '9Wk7UwrlfkeR8BaKU1Nz7gS6Y3wQ2oMAuRTSPdwSpo', 0),
(6495, 0, 'module_octwitter', 'module_octwitter_show_time', '1', 0),
(6496, 0, 'module_octwitter', 'module_octwitter_consumer_key', 'qulMEXc9RpNgvdHniZsKCQ', 0),
(6494, 0, 'module_octwitter', 'module_octwitter_limit', '1', 0),
(6492, 0, 'module_octwitter', 'module_octwitter_status', '1', 0),
(6493, 0, 'module_octwitter', 'module_octwitter_id', 'plazathemes', 0),
(6499, 0, 'module_octwitter', 'module_octwitter_access_token_secret', 'DKVQipT6cdOpnRELDxlsC3Mf5Rf20TA2IdUU6dzaqg', 0),
(7567, 6, 'theme_default', 'theme_default_image_wishlist_height', '103', 0),
(7566, 6, 'theme_default', 'theme_default_image_wishlist_width', '80', 0),
(7565, 6, 'theme_default', 'theme_default_image_compare_height', '103', 0),
(7564, 6, 'theme_default', 'theme_default_image_compare_width', '80', 0),
(7563, 6, 'theme_default', 'theme_default_image_related_height', '770', 0),
(7562, 6, 'theme_default', 'theme_default_image_related_width', '600', 0),
(7561, 6, 'theme_default', 'theme_default_image_additional_height', '770', 0),
(7560, 6, 'theme_default', 'theme_default_image_additional_width', '600', 0),
(7559, 6, 'theme_default', 'theme_default_image_product_height', '770', 0),
(7558, 6, 'theme_default', 'theme_default_image_product_width', '600', 0),
(7557, 6, 'theme_default', 'theme_default_image_popup_height', '770', 0),
(7556, 6, 'theme_default', 'theme_default_image_popup_width', '600', 0),
(7555, 6, 'theme_default', 'theme_default_image_thumb_height', '770', 0),
(7554, 6, 'theme_default', 'theme_default_image_thumb_width', '600', 0),
(7553, 6, 'theme_default', 'theme_default_image_category_height', '345', 0),
(7552, 6, 'theme_default', 'theme_default_image_category_width', '870', 0),
(7551, 6, 'theme_default', 'theme_default_product_description_length', '180', 0),
(7550, 6, 'theme_default', 'theme_default_product_limit', '12', 0),
(7549, 6, 'theme_default', 'theme_default_status', '1', 0),
(7548, 6, 'theme_default', 'theme_default_directory', 'tt_koparion5', 0),
(6603, 0, 'module_octhemeoption', 'module_octhemeoption_header_tag', '{\"0\":{\"color\":\"292929\",\"font_family\":\"Poppins\",\"font_weight\":\"400\",\"h1\":{\"font_size\":\"33px\"},\"h2\":{\"font_size\":\"27px\"},\"h3\":{\"font_size\":\"21px\"},\"h4\":{\"font_size\":\"15px\"},\"h5\":{\"font_size\":\"12px\"},\"h6\":{\"font_size\":\"10.2px\"}},\"1\":{\"color\":\"FFFFFF\",\"font_family\":\"\",\"font_weight\":\"\",\"h1\":{\"font_size\":\"\"},\"h2\":{\"font_size\":\"\"},\"h3\":{\"font_size\":\"\"},\"h4\":{\"font_size\":\"\"},\"h5\":{\"font_size\":\"\"},\"h6\":{\"font_size\":\"\"}},\"2\":{\"color\":\"FFFFFF\",\"font_family\":\"\",\"font_weight\":\"\",\"h1\":{\"font_size\":\"\"},\"h2\":{\"font_size\":\"\"},\"h3\":{\"font_size\":\"\"},\"h4\":{\"font_size\":\"\"},\"h5\":{\"font_size\":\"\"},\"h6\":{\"font_size\":\"\"}},\"3\":{\"color\":\"FFFFFF\",\"font_family\":\"\",\"font_weight\":\"\",\"h1\":{\"font_size\":\"\"},\"h2\":{\"font_size\":\"\"},\"h3\":{\"font_size\":\"\"},\"h4\":{\"font_size\":\"\"},\"h5\":{\"font_size\":\"\"},\"h6\":{\"font_size\":\"\"}},\"6\":{\"color\":\"FFFFFF\",\"font_family\":\"\",\"font_weight\":\"\",\"h1\":{\"font_size\":\"\"},\"h2\":{\"font_size\":\"\"},\"h3\":{\"font_size\":\"\"},\"h4\":{\"font_size\":\"\"},\"h5\":{\"font_size\":\"\"},\"h6\":{\"font_size\":\"\"}},\"7\":{\"color\":\"FFFFFF\",\"font_family\":\"\",\"font_weight\":\"\",\"h1\":{\"font_size\":\"\"},\"h2\":{\"font_size\":\"\"},\"h3\":{\"font_size\":\"\"},\"h4\":{\"font_size\":\"\"},\"h5\":{\"font_size\":\"\"},\"h6\":{\"font_size\":\"\"}}}', 1),
(6600, 0, 'module_octhemeoption', 'module_octhemeoption_status', '{\"0\":\"0\",\"1\":\"0\",\"2\":\"0\",\"3\":\"0\",\"6\":\"0\",\"7\":\"0\"}', 1),
(7463, 6, 'config', 'config_email', 'demo@plazathemes.com', 0),
(7462, 6, 'config', 'config_geocode', '', 0),
(7461, 6, 'config', 'config_address', 'Address 1', 0),
(7460, 6, 'config', 'config_owner', 'Plazathemes', 0),
(7459, 6, 'config', 'config_name', 'Koparion 5', 0),
(7457, 6, 'config', 'config_theme', 'default', 0),
(7458, 6, 'config', 'config_layout_id', '26', 0),
(7456, 6, 'config', 'config_meta_keyword', 'Koparion, Responsive, Opencart Theme, Fashion Theme', 0),
(7455, 6, 'config', 'config_meta_description', 'Koparion, Responsive, Opencart Theme, Fashion Theme', 0),
(7663, 7, 'theme_default', 'theme_default_image_wishlist_height', '103', 0),
(7662, 7, 'theme_default', 'theme_default_image_wishlist_width', '80', 0),
(7661, 7, 'theme_default', 'theme_default_image_compare_height', '103', 0),
(7660, 7, 'theme_default', 'theme_default_image_compare_width', '80', 0),
(7659, 7, 'theme_default', 'theme_default_image_related_height', '770', 0),
(7658, 7, 'theme_default', 'theme_default_image_related_width', '600', 0),
(7657, 7, 'theme_default', 'theme_default_image_additional_height', '770', 0),
(7656, 7, 'theme_default', 'theme_default_image_additional_width', '600', 0),
(7655, 7, 'theme_default', 'theme_default_image_product_height', '770', 0),
(7654, 7, 'theme_default', 'theme_default_image_product_width', '600', 0),
(7653, 7, 'theme_default', 'theme_default_image_popup_height', '770', 0),
(7652, 7, 'theme_default', 'theme_default_image_popup_width', '600', 0),
(7651, 7, 'theme_default', 'theme_default_image_thumb_height', '770', 0),
(7650, 7, 'theme_default', 'theme_default_image_thumb_width', '600', 0),
(7649, 7, 'theme_default', 'theme_default_image_category_height', '345', 0),
(7648, 7, 'theme_default', 'theme_default_image_category_width', '870', 0),
(7647, 7, 'theme_default', 'theme_default_product_description_length', '180', 0),
(7646, 7, 'theme_default', 'theme_default_product_limit', '12', 0),
(7645, 7, 'theme_default', 'theme_default_status', '1', 0),
(7644, 7, 'theme_default', 'theme_default_directory', 'tt_koparion6', 0),
(7499, 7, 'config', 'config_email', 'demo@plazathemes.com', 0),
(7498, 7, 'config', 'config_geocode', '', 0),
(7497, 7, 'config', 'config_address', 'Address 1', 0),
(7496, 7, 'config', 'config_owner', 'Plazathemes', 0),
(7495, 7, 'config', 'config_name', 'Koparion 6', 0),
(7493, 7, 'config', 'config_theme', 'default', 0),
(7494, 7, 'config', 'config_layout_id', '30', 0),
(7492, 7, 'config', 'config_meta_keyword', 'Koparion, Responsive, Opencart Theme, Fashion Theme', 0),
(7491, 7, 'config', 'config_meta_description', 'Koparion, Responsive, Opencart Theme, Fashion Theme', 0),
(7489, 7, 'config', 'config_ssl', '', 0),
(7490, 7, 'config', 'config_meta_title', 'Koparion 6 - Responsive Opencart Theme', 0),
(7332, 0, 'config', 'config_login_attempts', '5', 0),
(7294, 0, 'config', 'config_meta_title', 'Koparion 1 - Responsive Opencart Theme', 0),
(7116, 1, 'config', 'config_meta_title', 'Koparion 2 - Responsive Opencart Theme', 0),
(7115, 1, 'config', 'config_ssl', '', 0),
(7418, 3, 'config', 'config_meta_title', 'Koparion 4 - Responsive Opencart Theme', 0),
(7453, 6, 'config', 'config_ssl', '', 0),
(7454, 6, 'config', 'config_meta_title', 'Koparion 5 - Responsive Opencart Theme', 0),
(7147, 1, 'config', 'config_logo', 'catalog/logo/logo.png', 0),
(7148, 1, 'config', 'config_icon', 'catalog/cart.png', 0),
(7149, 1, 'config', 'config_secure', '0', 0),
(7382, 2, 'config', 'config_meta_title', 'Koparion  3 - Responsive Opencart Theme', 0),
(7381, 2, 'config', 'config_ssl', '', 0),
(7380, 2, 'config', 'config_url', 'http://skybook3.com/', 0),
(7417, 3, 'config', 'config_ssl', '', 0),
(7416, 3, 'config', 'config_url', 'http://skybook4.com/', 0),
(7452, 6, 'config', 'config_url', 'http://skybook5.com/', 0),
(7488, 7, 'config', 'config_url', 'http://skybook6.com/', 0),
(7377, 0, 'config', 'config_error_display', '1', 0),
(7378, 0, 'config', 'config_error_log', '1', 0),
(7379, 0, 'config', 'config_error_filename', 'error.log', 0),
(7415, 2, 'config', 'config_secure', '0', 0),
(7450, 3, 'config', 'config_icon', 'catalog/cart.png', 0),
(7451, 3, 'config', 'config_secure', '0', 0),
(7546, 1, 'theme_default', 'theme_default_image_location_width', '268', 0),
(7547, 1, 'theme_default', 'theme_default_image_location_height', '50', 0),
(7568, 6, 'theme_default', 'theme_default_image_cart_width', '80', 0),
(7569, 6, 'theme_default', 'theme_default_image_cart_height', '103', 0),
(7570, 6, 'theme_default', 'theme_default_image_location_width', '268', 0),
(7571, 6, 'theme_default', 'theme_default_image_location_height', '50', 0),
(7665, 7, 'theme_default', 'theme_default_image_cart_height', '103', 0),
(7666, 7, 'theme_default', 'theme_default_image_location_width', '268', 0),
(7667, 7, 'theme_default', 'theme_default_image_location_height', '50', 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_shipping_courier`
--

DROP TABLE IF EXISTS `oc_shipping_courier`;
CREATE TABLE `oc_shipping_courier` (
  `shipping_courier_id` int(11) NOT NULL,
  `shipping_courier_code` varchar(255) NOT NULL DEFAULT '',
  `shipping_courier_name` varchar(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_shipping_courier`
--

INSERT INTO `oc_shipping_courier` (`shipping_courier_id`, `shipping_courier_code`, `shipping_courier_name`) VALUES
(1, 'dhl', 'DHL'),
(2, 'fedex', 'Fedex'),
(3, 'ups', 'UPS'),
(4, 'royal-mail', 'Royal Mail'),
(5, 'usps', 'United States Postal Service'),
(6, 'auspost', 'Australia Post'),
(7, 'citylink', 'Citylink');

-- --------------------------------------------------------

--
-- Table structure for table `oc_statistics`
--

DROP TABLE IF EXISTS `oc_statistics`;
CREATE TABLE `oc_statistics` (
  `statistics_id` int(11) NOT NULL,
  `code` varchar(64) NOT NULL,
  `value` decimal(15,4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_statistics`
--

INSERT INTO `oc_statistics` (`statistics_id`, `code`, `value`) VALUES
(1, 'order_sale', '54163.5160'),
(2, 'order_processing', '0.0000'),
(3, 'order_complete', '0.0000'),
(4, 'order_other', '0.0000'),
(5, 'returns', '0.0000'),
(6, 'product', '0.0000'),
(7, 'review', '1.0000');

-- --------------------------------------------------------

--
-- Table structure for table `oc_stock_status`
--

DROP TABLE IF EXISTS `oc_stock_status`;
CREATE TABLE `oc_stock_status` (
  `stock_status_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_stock_status`
--

INSERT INTO `oc_stock_status` (`stock_status_id`, `language_id`, `name`) VALUES
(7, 1, 'In Stock'),
(8, 1, 'Pre-Order'),
(5, 1, 'Out Of Stock'),
(6, 1, '2-3 Days'),
(7, 3, 'In Stock'),
(8, 3, 'Pre-Order'),
(5, 3, 'Out Of Stock'),
(6, 3, '2-3 Days'),
(7, 4, 'In Stock'),
(8, 4, 'Pre-Order'),
(5, 4, 'Out Of Stock'),
(6, 4, '2-3 Days'),
(7, 5, 'In Stock'),
(8, 5, 'Pre-Order'),
(5, 5, 'Out Of Stock'),
(6, 5, '2-3 Days'),
(7, 6, 'In Stock'),
(8, 6, 'Pre-Order'),
(5, 6, 'Out Of Stock'),
(6, 6, '2-3 Days'),
(7, 7, 'In Stock'),
(8, 7, 'Pre-Order'),
(5, 7, 'Out Of Stock'),
(6, 7, '2-3 Days'),
(7, 8, 'In Stock'),
(8, 8, 'Pre-Order'),
(5, 8, 'Out Of Stock'),
(6, 8, '2-3 Days'),
(7, 9, 'In Stock'),
(8, 9, 'Pre-Order'),
(5, 9, 'Out Of Stock'),
(6, 9, '2-3 Days');

-- --------------------------------------------------------

--
-- Table structure for table `oc_store`
--

DROP TABLE IF EXISTS `oc_store`;
CREATE TABLE `oc_store` (
  `store_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `url` varchar(255) NOT NULL,
  `ssl` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_store`
--

INSERT INTO `oc_store` (`store_id`, `name`, `url`, `ssl`) VALUES
(1, 'Koparion 2', 'http://skybook2.com/', ''),
(2, 'Koparion 3', 'http://skybook3.com/', ''),
(3, 'Koparion 4', 'http://skybook4.com/', ''),
(6, 'Koparion 5', 'http://skybook5.com/', ''),
(7, 'Koparion 6', 'http://skybook6.com/', '');

-- --------------------------------------------------------

--
-- Table structure for table `oc_subscribe`
--

DROP TABLE IF EXISTS `oc_subscribe`;
CREATE TABLE `oc_subscribe` (
  `id` int(10) UNSIGNED NOT NULL,
  `email_id` varchar(225) NOT NULL,
  `name` varchar(225) NOT NULL,
  `date` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `oc_subscribe`
--

INSERT INTO `oc_subscribe` (`id`, `email_id`, `name`, `date`) VALUES
(1, 'demo@demo2.com', 'demo@demo2.com', '2017-08-10'),
(2, 'admin@gmail.com', '', '2017-11-25');

-- --------------------------------------------------------

--
-- Table structure for table `oc_tax_class`
--

DROP TABLE IF EXISTS `oc_tax_class`;
CREATE TABLE `oc_tax_class` (
  `tax_class_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_tax_class`
--

INSERT INTO `oc_tax_class` (`tax_class_id`, `title`, `description`, `date_added`, `date_modified`) VALUES
(9, 'Taxable Goods', 'Taxed goods', '2009-01-06 23:21:53', '2011-09-23 14:07:50'),
(10, 'Downloadable Products', 'Downloadable', '2011-09-21 22:19:39', '2011-09-22 10:27:36');

-- --------------------------------------------------------

--
-- Table structure for table `oc_tax_rate`
--

DROP TABLE IF EXISTS `oc_tax_rate`;
CREATE TABLE `oc_tax_rate` (
  `tax_rate_id` int(11) NOT NULL,
  `geo_zone_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(32) NOT NULL,
  `rate` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `type` char(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_tax_rate`
--

INSERT INTO `oc_tax_rate` (`tax_rate_id`, `geo_zone_id`, `name`, `rate`, `type`, `date_added`, `date_modified`) VALUES
(86, 3, 'VAT (20%)', '20.0000', 'P', '2011-03-09 21:17:10', '2011-09-22 22:24:29'),
(87, 3, 'Eco Tax (-2.00)', '2.0000', 'F', '2011-09-21 21:49:23', '2011-09-23 00:40:19');

-- --------------------------------------------------------

--
-- Table structure for table `oc_tax_rate_to_customer_group`
--

DROP TABLE IF EXISTS `oc_tax_rate_to_customer_group`;
CREATE TABLE `oc_tax_rate_to_customer_group` (
  `tax_rate_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_tax_rate_to_customer_group`
--

INSERT INTO `oc_tax_rate_to_customer_group` (`tax_rate_id`, `customer_group_id`) VALUES
(86, 1),
(87, 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_tax_rule`
--

DROP TABLE IF EXISTS `oc_tax_rule`;
CREATE TABLE `oc_tax_rule` (
  `tax_rule_id` int(11) NOT NULL,
  `tax_class_id` int(11) NOT NULL,
  `tax_rate_id` int(11) NOT NULL,
  `based` varchar(10) NOT NULL,
  `priority` int(5) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_tax_rule`
--

INSERT INTO `oc_tax_rule` (`tax_rule_id`, `tax_class_id`, `tax_rate_id`, `based`, `priority`) VALUES
(121, 10, 86, 'payment', 1),
(120, 10, 87, 'store', 0),
(128, 9, 86, 'shipping', 1),
(127, 9, 87, 'shipping', 2);

-- --------------------------------------------------------

--
-- Table structure for table `oc_testimonial`
--

DROP TABLE IF EXISTS `oc_testimonial`;
CREATE TABLE `oc_testimonial` (
  `testimonial_id` int(11) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '0',
  `sort_order` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_testimonial`
--

INSERT INTO `oc_testimonial` (`testimonial_id`, `status`, `sort_order`) VALUES
(1, 1, 1),
(4, 1, 4),
(5, 1, 5);

-- --------------------------------------------------------

--
-- Table structure for table `oc_testimonial_description`
--

DROP TABLE IF EXISTS `oc_testimonial_description`;
CREATE TABLE `oc_testimonial_description` (
  `testimonial_id` int(10) UNSIGNED NOT NULL,
  `language_id` int(10) UNSIGNED NOT NULL,
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `customer_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_testimonial_description`
--

INSERT INTO `oc_testimonial_description` (`testimonial_id`, `language_id`, `image`, `customer_name`, `content`) VALUES
(1, 0, 'catalog/testimonial/testtimor.png', 'Rebecka Filson', ' This is Photoshops version  of Lorem Ipsum. Proin gravida nibh vel velit.Lorem ipsum dolor sit amet, consectetur adipiscing elit. In molestie augue magna. Pellentesque felis lorem, pulvinar sed eros non, sagittis consequat urna. Proin id dui tempor, imperdiet nisi et, hendrerit quam. Quisque tempus lorem nisl, non adipiscing arcu tristique ac. Sed eget mollis tellus, a varius diam. In a consectetur tellus, quis molestie ligula. Vivamus sit amet sem faucibus, dignissim augue ac, interdum metus. '),
(4, 0, 'catalog/testimonial/testtimor.png', 'Dewey Tetzlaff', '  This is Photoshops version  of Lorem Ipsum. Proin gravida nibh vel velit.Lorem ipsum dolor sit amet, consectetur adipiscing elit. In molestie augue magna. Pellentesque felis lorem, pulvinar sed eros non, sagittis consequat urna. Proin id dui tempor, imperdiet nisi et, hendrerit quam. Quisque tempus lorem nisl, non adipiscing arcu tristique ac. Sed eget mollis tellus, a varius diam. In a consectetur tellus, quis molestie ligula. Vivamus sit amet sem faucibus, dignissim augue ac, interdum metus. '),
(5, 0, 'catalog/testimonial/testtimor.png', 'Alva Ono', '  Vivamus a lobortis ipsum, vel condimentum magna. Etiam id turpis tortor. Nunc scelerisque, nisi a blandit varius, nunc purus venenatis ligula, sed venenatis orci augue nec sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin mattis, enim blandit molestie molestie, nisl quam bibendum nisi, sed luctus felis justo ut nisl. In hac habitasse platea dictumst. Duis quis aliquam lectus, ac dapibus turpis. Nulla convallis vel felis eget porttitor. Morbi nisl metus, bibendum vitae luctus accumsan, consequat id quam. ');

-- --------------------------------------------------------

--
-- Table structure for table `oc_theme`
--

DROP TABLE IF EXISTS `oc_theme`;
CREATE TABLE `oc_theme` (
  `theme_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `theme` varchar(64) NOT NULL,
  `route` varchar(64) NOT NULL,
  `code` mediumtext NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_translation`
--

DROP TABLE IF EXISTS `oc_translation`;
CREATE TABLE `oc_translation` (
  `translation_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `route` varchar(64) NOT NULL,
  `key` varchar(64) NOT NULL,
  `value` text NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_upload`
--

DROP TABLE IF EXISTS `oc_upload`;
CREATE TABLE `oc_upload` (
  `upload_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_user`
--

DROP TABLE IF EXISTS `oc_user`;
CREATE TABLE `oc_user` (
  `user_id` int(11) NOT NULL,
  `user_group_id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `image` varchar(255) NOT NULL,
  `code` varchar(40) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_user`
--

INSERT INTO `oc_user` (`user_id`, `user_group_id`, `username`, `password`, `salt`, `firstname`, `lastname`, `email`, `image`, `code`, `ip`, `status`, `date_added`) VALUES
(1, 1, 'admin', '883b8c6722f4a5f6f4dce3b947489198267bc487', 'YaromylMJ', 'John', 'Doe', 'demo@plazathemes.com', '', '', '127.0.0.1', 1, '2017-12-04 07:55:01');

-- --------------------------------------------------------

--
-- Table structure for table `oc_user_group`
--

DROP TABLE IF EXISTS `oc_user_group`;
CREATE TABLE `oc_user_group` (
  `user_group_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `permission` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_user_group`
--

INSERT INTO `oc_user_group` (`user_group_id`, `name`, `permission`) VALUES
(1, 'Administrator', '{\"access\":[\"catalog\\/attribute\",\"catalog\\/attribute_group\",\"catalog\\/category\",\"catalog\\/download\",\"catalog\\/filter\",\"catalog\\/information\",\"catalog\\/manufacturer\",\"catalog\\/occategorythumbnail\",\"catalog\\/octestimonial\",\"catalog\\/option\",\"catalog\\/product\",\"catalog\\/recurring\",\"catalog\\/review\",\"common\\/column_left\",\"common\\/developer\",\"common\\/filemanager\",\"common\\/profile\",\"common\\/security\",\"customer\\/custom_field\",\"customer\\/customer\",\"customer\\/customer_approval\",\"customer\\/customer_group\",\"design\\/banner\",\"design\\/layout\",\"design\\/seo_url\",\"design\\/theme\",\"design\\/translation\",\"event\\/language\",\"event\\/statistics\",\"event\\/theme\",\"extension\\/analytics\\/google\",\"extension\\/captcha\\/basic\",\"extension\\/captcha\\/google\",\"extension\\/dashboard\\/activity\",\"extension\\/dashboard\\/chart\",\"extension\\/dashboard\\/customer\",\"extension\\/dashboard\\/map\",\"extension\\/dashboard\\/online\",\"extension\\/dashboard\\/order\",\"extension\\/dashboard\\/recent\",\"extension\\/dashboard\\/sale\",\"extension\\/extension\\/analytics\",\"extension\\/extension\\/captcha\",\"extension\\/extension\\/dashboard\",\"extension\\/extension\\/feed\",\"extension\\/extension\\/fraud\",\"extension\\/extension\\/menu\",\"extension\\/extension\\/module\",\"extension\\/extension\\/payment\",\"extension\\/extension\\/report\",\"extension\\/extension\\/shipping\",\"extension\\/extension\\/theme\",\"extension\\/extension\\/total\",\"extension\\/feed\\/google_base\",\"extension\\/feed\\/google_sitemap\",\"extension\\/feed\\/openbaypro\",\"extension\\/fraud\\/fraudlabspro\",\"extension\\/fraud\\/ip\",\"extension\\/fraud\\/maxmind\",\"extension\\/module\\/account\",\"extension\\/module\\/amazon_login\",\"extension\\/module\\/amazon_pay\",\"extension\\/module\\/banner\",\"extension\\/module\\/bestseller\",\"extension\\/module\\/carousel\",\"extension\\/module\\/category\",\"extension\\/module\\/divido_calculator\",\"extension\\/module\\/ebay_listing\",\"extension\\/module\\/featured\",\"extension\\/module\\/filter\",\"extension\\/module\\/google_hangouts\",\"extension\\/module\\/html\",\"extension\\/module\\/information\",\"extension\\/module\\/klarna_checkout_module\",\"extension\\/module\\/latest\",\"extension\\/module\\/laybuy_layout\",\"extension\\/module\\/newslettersubscribe\",\"extension\\/module\\/oc_page_builder\",\"extension\\/module\\/ocajaxlogin\",\"extension\\/module\\/ocblog\",\"extension\\/module\\/occmsblock\",\"extension\\/module\\/ocfeaturedcategory\",\"extension\\/module\\/ocfeaturedcategorytab\",\"extension\\/module\\/ochozmegamenu\",\"extension\\/module\\/oclayerednavigation\",\"extension\\/module\\/ocproduct\",\"extension\\/module\\/ocsearchcategory\",\"extension\\/module\\/ocslideshow\",\"extension\\/module\\/octabproducts\",\"extension\\/module\\/octestimonial\",\"extension\\/module\\/octhemeoption\",\"extension\\/module\\/ocvermegamenu\",\"extension\\/module\\/pilibaba_button\",\"extension\\/module\\/pp_braintree_button\",\"extension\\/module\\/pp_button\",\"extension\\/module\\/pp_login\",\"extension\\/module\\/sagepay_direct_cards\",\"extension\\/module\\/sagepay_server_cards\",\"extension\\/module\\/slideshow\",\"extension\\/module\\/special\",\"extension\\/module\\/store\",\"extension\\/openbay\\/amazon\",\"extension\\/openbay\\/amazon_listing\",\"extension\\/openbay\\/amazon_product\",\"extension\\/openbay\\/amazonus\",\"extension\\/openbay\\/amazonus_listing\",\"extension\\/openbay\\/amazonus_product\",\"extension\\/openbay\\/ebay\",\"extension\\/openbay\\/ebay_profile\",\"extension\\/openbay\\/ebay_template\",\"extension\\/openbay\\/etsy\",\"extension\\/openbay\\/etsy_product\",\"extension\\/openbay\\/etsy_shipping\",\"extension\\/openbay\\/etsy_shop\",\"extension\\/openbay\\/fba\",\"extension\\/payment\\/alipay\",\"extension\\/payment\\/alipay_cross\",\"extension\\/payment\\/amazon_login_pay\",\"extension\\/payment\\/authorizenet_aim\",\"extension\\/payment\\/authorizenet_sim\",\"extension\\/payment\\/bank_transfer\",\"extension\\/payment\\/bluepay_hosted\",\"extension\\/payment\\/bluepay_redirect\",\"extension\\/payment\\/cardconnect\",\"extension\\/payment\\/cardinity\",\"extension\\/payment\\/cheque\",\"extension\\/payment\\/cod\",\"extension\\/payment\\/divido\",\"extension\\/payment\\/eway\",\"extension\\/payment\\/firstdata\",\"extension\\/payment\\/firstdata_remote\",\"extension\\/payment\\/free_checkout\",\"extension\\/payment\\/g2apay\",\"extension\\/payment\\/globalpay\",\"extension\\/payment\\/globalpay_remote\",\"extension\\/payment\\/klarna_account\",\"extension\\/payment\\/klarna_checkout\",\"extension\\/payment\\/klarna_invoice\",\"extension\\/payment\\/laybuy\",\"extension\\/payment\\/liqpay\",\"extension\\/payment\\/nochex\",\"extension\\/payment\\/paymate\",\"extension\\/payment\\/paypoint\",\"extension\\/payment\\/payza\",\"extension\\/payment\\/perpetual_payments\",\"extension\\/payment\\/pilibaba\",\"extension\\/payment\\/pp_braintree\",\"extension\\/payment\\/pp_express\",\"extension\\/payment\\/pp_payflow\",\"extension\\/payment\\/pp_payflow_iframe\",\"extension\\/payment\\/pp_pro\",\"extension\\/payment\\/pp_pro_iframe\",\"extension\\/payment\\/pp_standard\",\"extension\\/payment\\/realex\",\"extension\\/payment\\/realex_remote\",\"extension\\/payment\\/sagepay_direct\",\"extension\\/payment\\/sagepay_server\",\"extension\\/payment\\/sagepay_us\",\"extension\\/payment\\/securetrading_pp\",\"extension\\/payment\\/securetrading_ws\",\"extension\\/payment\\/skrill\",\"extension\\/payment\\/squareup\",\"extension\\/payment\\/twocheckout\",\"extension\\/payment\\/web_payment_software\",\"extension\\/payment\\/wechat_pay\",\"extension\\/payment\\/worldpay\",\"extension\\/report\\/customer_activity\",\"extension\\/report\\/customer_order\",\"extension\\/report\\/customer_reward\",\"extension\\/report\\/customer_search\",\"extension\\/report\\/customer_transaction\",\"extension\\/report\\/marketing\",\"extension\\/report\\/product_purchased\",\"extension\\/report\\/product_viewed\",\"extension\\/report\\/sale_coupon\",\"extension\\/report\\/sale_order\",\"extension\\/report\\/sale_return\",\"extension\\/report\\/sale_shipping\",\"extension\\/report\\/sale_tax\",\"extension\\/shipping\\/auspost\",\"extension\\/shipping\\/citylink\",\"extension\\/shipping\\/ec_ship\",\"extension\\/shipping\\/fedex\",\"extension\\/shipping\\/flat\",\"extension\\/shipping\\/free\",\"extension\\/shipping\\/item\",\"extension\\/shipping\\/parcelforce_48\",\"extension\\/shipping\\/pickup\",\"extension\\/shipping\\/royal_mail\",\"extension\\/shipping\\/ups\",\"extension\\/shipping\\/usps\",\"extension\\/shipping\\/weight\",\"extension\\/theme\\/default\",\"extension\\/total\\/coupon\",\"extension\\/total\\/credit\",\"extension\\/total\\/handling\",\"extension\\/total\\/klarna_fee\",\"extension\\/total\\/low_order_fee\",\"extension\\/total\\/reward\",\"extension\\/total\\/shipping\",\"extension\\/total\\/sub_total\",\"extension\\/total\\/tax\",\"extension\\/total\\/total\",\"extension\\/total\\/voucher\",\"localisation\\/country\",\"localisation\\/currency\",\"localisation\\/geo_zone\",\"localisation\\/language\",\"localisation\\/length_class\",\"localisation\\/location\",\"localisation\\/order_status\",\"localisation\\/return_action\",\"localisation\\/return_reason\",\"localisation\\/return_status\",\"localisation\\/stock_status\",\"localisation\\/tax_class\",\"localisation\\/tax_rate\",\"localisation\\/weight_class\",\"localisation\\/zone\",\"mail\\/affiliate\",\"mail\\/customer\",\"mail\\/forgotten\",\"mail\\/return\",\"mail\\/reward\",\"mail\\/transaction\",\"marketing\\/contact\",\"marketing\\/coupon\",\"marketing\\/marketing\",\"marketplace\\/api\",\"marketplace\\/event\",\"marketplace\\/extension\",\"marketplace\\/install\",\"marketplace\\/installer\",\"marketplace\\/marketplace\",\"marketplace\\/modification\",\"marketplace\\/openbay\",\"report\\/online\",\"report\\/report\",\"report\\/statistics\",\"sale\\/order\",\"sale\\/recurring\",\"sale\\/return\",\"sale\\/voucher\",\"sale\\/voucher_theme\",\"setting\\/setting\",\"setting\\/store\",\"startup\\/error\",\"startup\\/event\",\"startup\\/login\",\"startup\\/permission\",\"startup\\/router\",\"startup\\/sass\",\"startup\\/startup\",\"tool\\/backup\",\"tool\\/log\",\"tool\\/upload\",\"user\\/api\",\"user\\/user\",\"user\\/user_permission\",\"extension\\/module\\/ocblog\",\"blog\\/article\",\"blog\\/articlelist\",\"blog\\/config\",\"extension\\/module\\/ocinstagram\",\"extension\\/module\\/category\",\"extension\\/module\\/ocvermegamenu\",\"extension\\/module\\/octwitter\",\"extension\\/module\\/octwitter\"],\"modify\":[\"blog\\/article\",\"blog\\/articlelist\",\"blog\\/config\",\"catalog\\/attribute\",\"catalog\\/attribute_group\",\"catalog\\/category\",\"catalog\\/download\",\"catalog\\/filter\",\"catalog\\/information\",\"catalog\\/manufacturer\",\"catalog\\/occategorythumbnail\",\"catalog\\/octestimonial\",\"catalog\\/option\",\"catalog\\/product\",\"catalog\\/recurring\",\"catalog\\/review\",\"common\\/column_left\",\"common\\/developer\",\"common\\/filemanager\",\"common\\/profile\",\"common\\/security\",\"customer\\/custom_field\",\"customer\\/customer\",\"customer\\/customer_approval\",\"customer\\/customer_group\",\"design\\/banner\",\"design\\/layout\",\"design\\/seo_url\",\"design\\/theme\",\"design\\/translation\",\"event\\/language\",\"event\\/statistics\",\"event\\/theme\",\"extension\\/analytics\\/google\",\"extension\\/captcha\\/basic\",\"extension\\/captcha\\/google\",\"extension\\/dashboard\\/activity\",\"extension\\/dashboard\\/chart\",\"extension\\/dashboard\\/customer\",\"extension\\/dashboard\\/map\",\"extension\\/dashboard\\/online\",\"extension\\/dashboard\\/order\",\"extension\\/dashboard\\/recent\",\"extension\\/dashboard\\/sale\",\"extension\\/extension\\/analytics\",\"extension\\/extension\\/captcha\",\"extension\\/extension\\/dashboard\",\"extension\\/extension\\/feed\",\"extension\\/extension\\/fraud\",\"extension\\/extension\\/menu\",\"extension\\/extension\\/module\",\"extension\\/extension\\/payment\",\"extension\\/extension\\/report\",\"extension\\/extension\\/shipping\",\"extension\\/extension\\/theme\",\"extension\\/extension\\/total\",\"extension\\/feed\\/google_base\",\"extension\\/feed\\/google_sitemap\",\"extension\\/feed\\/openbaypro\",\"extension\\/fraud\\/fraudlabspro\",\"extension\\/fraud\\/ip\",\"extension\\/fraud\\/maxmind\",\"extension\\/module\\/account\",\"extension\\/module\\/amazon_login\",\"extension\\/module\\/amazon_pay\",\"extension\\/module\\/banner\",\"extension\\/module\\/bestseller\",\"extension\\/module\\/carousel\",\"extension\\/module\\/category\",\"extension\\/module\\/divido_calculator\",\"extension\\/module\\/ebay_listing\",\"extension\\/module\\/featured\",\"extension\\/module\\/filter\",\"extension\\/module\\/google_hangouts\",\"extension\\/module\\/html\",\"extension\\/module\\/information\",\"extension\\/module\\/klarna_checkout_module\",\"extension\\/module\\/latest\",\"extension\\/module\\/laybuy_layout\",\"extension\\/module\\/newslettersubscribe\",\"extension\\/module\\/oc_page_builder\",\"extension\\/module\\/ocajaxlogin\",\"extension\\/module\\/ocblog\",\"extension\\/module\\/occmsblock\",\"extension\\/module\\/ocfeaturedcategory\",\"extension\\/module\\/ocfeaturedcategorytab\",\"extension\\/module\\/ochozmegamenu\",\"extension\\/module\\/oclayerednavigation\",\"extension\\/module\\/ocproduct\",\"extension\\/module\\/ocsearchcategory\",\"extension\\/module\\/ocslideshow\",\"extension\\/module\\/octabproducts\",\"extension\\/module\\/octestimonial\",\"extension\\/module\\/octhemeoption\",\"extension\\/module\\/ocvermegamenu\",\"extension\\/module\\/pilibaba_button\",\"extension\\/module\\/pp_braintree_button\",\"extension\\/module\\/pp_button\",\"extension\\/module\\/pp_login\",\"extension\\/module\\/sagepay_direct_cards\",\"extension\\/module\\/sagepay_server_cards\",\"extension\\/module\\/slideshow\",\"extension\\/module\\/special\",\"extension\\/module\\/store\",\"extension\\/openbay\\/amazon\",\"extension\\/openbay\\/amazon_listing\",\"extension\\/openbay\\/amazon_product\",\"extension\\/openbay\\/amazonus\",\"extension\\/openbay\\/amazonus_listing\",\"extension\\/openbay\\/amazonus_product\",\"extension\\/openbay\\/ebay\",\"extension\\/openbay\\/ebay_profile\",\"extension\\/openbay\\/ebay_template\",\"extension\\/openbay\\/etsy\",\"extension\\/openbay\\/etsy_product\",\"extension\\/openbay\\/etsy_shipping\",\"extension\\/openbay\\/etsy_shop\",\"extension\\/openbay\\/fba\",\"extension\\/payment\\/alipay\",\"extension\\/payment\\/alipay_cross\",\"extension\\/payment\\/amazon_login_pay\",\"extension\\/payment\\/authorizenet_aim\",\"extension\\/payment\\/authorizenet_sim\",\"extension\\/payment\\/bank_transfer\",\"extension\\/payment\\/bluepay_hosted\",\"extension\\/payment\\/bluepay_redirect\",\"extension\\/payment\\/cardconnect\",\"extension\\/payment\\/cardinity\",\"extension\\/payment\\/cheque\",\"extension\\/payment\\/cod\",\"extension\\/payment\\/divido\",\"extension\\/payment\\/eway\",\"extension\\/payment\\/firstdata\",\"extension\\/payment\\/firstdata_remote\",\"extension\\/payment\\/free_checkout\",\"extension\\/payment\\/g2apay\",\"extension\\/payment\\/globalpay\",\"extension\\/payment\\/globalpay_remote\",\"extension\\/payment\\/klarna_account\",\"extension\\/payment\\/klarna_checkout\",\"extension\\/payment\\/klarna_invoice\",\"extension\\/payment\\/laybuy\",\"extension\\/payment\\/liqpay\",\"extension\\/payment\\/nochex\",\"extension\\/payment\\/paymate\",\"extension\\/payment\\/paypoint\",\"extension\\/payment\\/payza\",\"extension\\/payment\\/perpetual_payments\",\"extension\\/payment\\/pilibaba\",\"extension\\/payment\\/pp_braintree\",\"extension\\/payment\\/pp_express\",\"extension\\/payment\\/pp_payflow\",\"extension\\/payment\\/pp_payflow_iframe\",\"extension\\/payment\\/pp_pro\",\"extension\\/payment\\/pp_pro_iframe\",\"extension\\/payment\\/pp_standard\",\"extension\\/payment\\/realex\",\"extension\\/payment\\/realex_remote\",\"extension\\/payment\\/sagepay_direct\",\"extension\\/payment\\/sagepay_server\",\"extension\\/payment\\/sagepay_us\",\"extension\\/payment\\/securetrading_pp\",\"extension\\/payment\\/securetrading_ws\",\"extension\\/payment\\/skrill\",\"extension\\/payment\\/squareup\",\"extension\\/payment\\/twocheckout\",\"extension\\/payment\\/web_payment_software\",\"extension\\/payment\\/wechat_pay\",\"extension\\/payment\\/worldpay\",\"extension\\/report\\/customer_activity\",\"extension\\/report\\/customer_order\",\"extension\\/report\\/customer_reward\",\"extension\\/report\\/customer_search\",\"extension\\/report\\/customer_transaction\",\"extension\\/report\\/marketing\",\"extension\\/report\\/product_purchased\",\"extension\\/report\\/product_viewed\",\"extension\\/report\\/sale_coupon\",\"extension\\/report\\/sale_order\",\"extension\\/report\\/sale_return\",\"extension\\/report\\/sale_shipping\",\"extension\\/report\\/sale_tax\",\"extension\\/shipping\\/auspost\",\"extension\\/shipping\\/citylink\",\"extension\\/shipping\\/ec_ship\",\"extension\\/shipping\\/fedex\",\"extension\\/shipping\\/flat\",\"extension\\/shipping\\/free\",\"extension\\/shipping\\/item\",\"extension\\/shipping\\/parcelforce_48\",\"extension\\/shipping\\/pickup\",\"extension\\/shipping\\/royal_mail\",\"extension\\/shipping\\/ups\",\"extension\\/shipping\\/usps\",\"extension\\/shipping\\/weight\",\"extension\\/theme\\/default\",\"extension\\/total\\/coupon\",\"extension\\/total\\/credit\",\"extension\\/total\\/handling\",\"extension\\/total\\/klarna_fee\",\"extension\\/total\\/low_order_fee\",\"extension\\/total\\/reward\",\"extension\\/total\\/shipping\",\"extension\\/total\\/sub_total\",\"extension\\/total\\/tax\",\"extension\\/total\\/total\",\"extension\\/total\\/voucher\",\"localisation\\/country\",\"localisation\\/currency\",\"localisation\\/geo_zone\",\"localisation\\/language\",\"localisation\\/length_class\",\"localisation\\/location\",\"localisation\\/order_status\",\"localisation\\/return_action\",\"localisation\\/return_reason\",\"localisation\\/return_status\",\"localisation\\/stock_status\",\"localisation\\/tax_class\",\"localisation\\/tax_rate\",\"localisation\\/weight_class\",\"localisation\\/zone\",\"mail\\/affiliate\",\"mail\\/customer\",\"mail\\/forgotten\",\"mail\\/return\",\"mail\\/reward\",\"mail\\/transaction\",\"marketing\\/contact\",\"marketing\\/coupon\",\"marketing\\/marketing\",\"marketplace\\/api\",\"marketplace\\/event\",\"marketplace\\/extension\",\"marketplace\\/install\",\"marketplace\\/installer\",\"marketplace\\/marketplace\",\"marketplace\\/modification\",\"marketplace\\/openbay\",\"report\\/online\",\"report\\/report\",\"report\\/statistics\",\"sale\\/order\",\"sale\\/recurring\",\"sale\\/return\",\"sale\\/voucher\",\"sale\\/voucher_theme\",\"setting\\/setting\",\"setting\\/store\",\"startup\\/error\",\"startup\\/event\",\"startup\\/login\",\"startup\\/permission\",\"startup\\/router\",\"startup\\/sass\",\"startup\\/startup\",\"tool\\/backup\",\"tool\\/log\",\"tool\\/upload\",\"user\\/api\",\"user\\/user\",\"user\\/user_permission\",\"extension\\/module\\/ocblog\",\"blog\\/article\",\"blog\\/articlelist\",\"blog\\/config\",\"extension\\/module\\/ocinstagram\",\"extension\\/module\\/category\",\"extension\\/module\\/ocvermegamenu\",\"extension\\/module\\/octwitter\",\"extension\\/module\\/octwitter\"]}'),
(10, 'Demonstration', '');

-- --------------------------------------------------------

--
-- Table structure for table `oc_voucher`
--

DROP TABLE IF EXISTS `oc_voucher`;
CREATE TABLE `oc_voucher` (
  `voucher_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `code` varchar(10) NOT NULL,
  `from_name` varchar(64) NOT NULL,
  `from_email` varchar(96) NOT NULL,
  `to_name` varchar(64) NOT NULL,
  `to_email` varchar(96) NOT NULL,
  `voucher_theme_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_voucher_history`
--

DROP TABLE IF EXISTS `oc_voucher_history`;
CREATE TABLE `oc_voucher_history` (
  `voucher_history_id` int(11) NOT NULL,
  `voucher_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_voucher_theme`
--

DROP TABLE IF EXISTS `oc_voucher_theme`;
CREATE TABLE `oc_voucher_theme` (
  `voucher_theme_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_voucher_theme`
--

INSERT INTO `oc_voucher_theme` (`voucher_theme_id`, `image`) VALUES
(8, 'catalog/demo/canon_eos_5d_2.jpg'),
(7, 'catalog/demo/gift-voucher-birthday.jpg'),
(6, 'catalog/demo/apple_logo.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `oc_voucher_theme_description`
--

DROP TABLE IF EXISTS `oc_voucher_theme_description`;
CREATE TABLE `oc_voucher_theme_description` (
  `voucher_theme_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_voucher_theme_description`
--

INSERT INTO `oc_voucher_theme_description` (`voucher_theme_id`, `language_id`, `name`) VALUES
(6, 1, 'Christmas'),
(7, 1, 'Birthday'),
(8, 1, 'General'),
(8, 9, 'General'),
(7, 9, 'Birthday'),
(6, 9, 'Christmas');

-- --------------------------------------------------------

--
-- Table structure for table `oc_weight_class`
--

DROP TABLE IF EXISTS `oc_weight_class`;
CREATE TABLE `oc_weight_class` (
  `weight_class_id` int(11) NOT NULL,
  `value` decimal(15,8) NOT NULL DEFAULT '0.00000000'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_weight_class`
--

INSERT INTO `oc_weight_class` (`weight_class_id`, `value`) VALUES
(1, '1.00000000'),
(2, '1000.00000000'),
(5, '2.20460000'),
(6, '35.27400000');

-- --------------------------------------------------------

--
-- Table structure for table `oc_weight_class_description`
--

DROP TABLE IF EXISTS `oc_weight_class_description`;
CREATE TABLE `oc_weight_class_description` (
  `weight_class_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `unit` varchar(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_weight_class_description`
--

INSERT INTO `oc_weight_class_description` (`weight_class_id`, `language_id`, `title`, `unit`) VALUES
(1, 1, 'Kilogram', 'kg'),
(2, 1, 'Gram', 'g'),
(5, 1, 'Pound ', 'lb'),
(6, 1, 'Ounce', 'oz'),
(6, 9, 'Ounce', 'oz'),
(5, 9, 'Pound ', 'lb'),
(2, 9, 'Gram', 'g'),
(1, 9, 'Kilogram', 'kg');

-- --------------------------------------------------------

--
-- Table structure for table `oc_zone`
--

DROP TABLE IF EXISTS `oc_zone`;
CREATE TABLE `oc_zone` (
  `zone_id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `code` varchar(32) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_zone`
--

INSERT INTO `oc_zone` (`zone_id`, `country_id`, `name`, `code`, `status`) VALUES
(1, 1, 'Badakhshan', 'BDS', 1),
(2, 1, 'Badghis', 'BDG', 1),
(3, 1, 'Baghlan', 'BGL', 1),
(4, 1, 'Balkh', 'BAL', 1),
(5, 1, 'Bamian', 'BAM', 1),
(6, 1, 'Farah', 'FRA', 1),
(7, 1, 'Faryab', 'FYB', 1),
(8, 1, 'Ghazni', 'GHA', 1),
(9, 1, 'Ghowr', 'GHO', 1),
(10, 1, 'Helmand', 'HEL', 1),
(11, 1, 'Herat', 'HER', 1),
(12, 1, 'Jowzjan', 'JOW', 1),
(13, 1, 'Kabul', 'KAB', 1),
(14, 1, 'Kandahar', 'KAN', 1),
(15, 1, 'Kapisa', 'KAP', 1),
(16, 1, 'Khost', 'KHO', 1),
(17, 1, 'Konar', 'KNR', 1),
(18, 1, 'Kondoz', 'KDZ', 1),
(19, 1, 'Laghman', 'LAG', 1),
(20, 1, 'Lowgar', 'LOW', 1),
(21, 1, 'Nangrahar', 'NAN', 1),
(22, 1, 'Nimruz', 'NIM', 1),
(23, 1, 'Nurestan', 'NUR', 1),
(24, 1, 'Oruzgan', 'ORU', 1),
(25, 1, 'Paktia', 'PIA', 1),
(26, 1, 'Paktika', 'PKA', 1),
(27, 1, 'Parwan', 'PAR', 1),
(28, 1, 'Samangan', 'SAM', 1),
(29, 1, 'Sar-e Pol', 'SAR', 1),
(30, 1, 'Takhar', 'TAK', 1),
(31, 1, 'Wardak', 'WAR', 1),
(32, 1, 'Zabol', 'ZAB', 1),
(33, 2, 'Berat', 'BR', 1),
(34, 2, 'Bulqize', 'BU', 1),
(35, 2, 'Delvine', 'DL', 1),
(36, 2, 'Devoll', 'DV', 1),
(37, 2, 'Diber', 'DI', 1),
(38, 2, 'Durres', 'DR', 1),
(39, 2, 'Elbasan', 'EL', 1),
(40, 2, 'Kolonje', 'ER', 1),
(41, 2, 'Fier', 'FR', 1),
(42, 2, 'Gjirokaster', 'GJ', 1),
(43, 2, 'Gramsh', 'GR', 1),
(44, 2, 'Has', 'HA', 1),
(45, 2, 'Kavaje', 'KA', 1),
(46, 2, 'Kurbin', 'KB', 1),
(47, 2, 'Kucove', 'KC', 1),
(48, 2, 'Korce', 'KO', 1),
(49, 2, 'Kruje', 'KR', 1),
(50, 2, 'Kukes', 'KU', 1),
(51, 2, 'Librazhd', 'LB', 1),
(52, 2, 'Lezhe', 'LE', 1),
(53, 2, 'Lushnje', 'LU', 1),
(54, 2, 'Malesi e Madhe', 'MM', 1),
(55, 2, 'Mallakaster', 'MK', 1),
(56, 2, 'Mat', 'MT', 1),
(57, 2, 'Mirdite', 'MR', 1),
(58, 2, 'Peqin', 'PQ', 1),
(59, 2, 'Permet', 'PR', 1),
(60, 2, 'Pogradec', 'PG', 1),
(61, 2, 'Puke', 'PU', 1),
(62, 2, 'Shkoder', 'SH', 1),
(63, 2, 'Skrapar', 'SK', 1),
(64, 2, 'Sarande', 'SR', 1),
(65, 2, 'Tepelene', 'TE', 1),
(66, 2, 'Tropoje', 'TP', 1),
(67, 2, 'Tirane', 'TR', 1),
(68, 2, 'Vlore', 'VL', 1),
(69, 3, 'Adrar', 'ADR', 1),
(70, 3, 'Ain Defla', 'ADE', 1),
(71, 3, 'Ain Temouchent', 'ATE', 1),
(72, 3, 'Alger', 'ALG', 1),
(73, 3, 'Annaba', 'ANN', 1),
(74, 3, 'Batna', 'BAT', 1),
(75, 3, 'Bechar', 'BEC', 1),
(76, 3, 'Bejaia', 'BEJ', 1),
(77, 3, 'Biskra', 'BIS', 1),
(78, 3, 'Blida', 'BLI', 1),
(79, 3, 'Bordj Bou Arreridj', 'BBA', 1),
(80, 3, 'Bouira', 'BOA', 1),
(81, 3, 'Boumerdes', 'BMD', 1),
(82, 3, 'Chlef', 'CHL', 1),
(83, 3, 'Constantine', 'CON', 1),
(84, 3, 'Djelfa', 'DJE', 1),
(85, 3, 'El Bayadh', 'EBA', 1),
(86, 3, 'El Oued', 'EOU', 1),
(87, 3, 'El Tarf', 'ETA', 1),
(88, 3, 'Ghardaia', 'GHA', 1),
(89, 3, 'Guelma', 'GUE', 1),
(90, 3, 'Illizi', 'ILL', 1),
(91, 3, 'Jijel', 'JIJ', 1),
(92, 3, 'Khenchela', 'KHE', 1),
(93, 3, 'Laghouat', 'LAG', 1),
(94, 3, 'Muaskar', 'MUA', 1),
(95, 3, 'Medea', 'MED', 1),
(96, 3, 'Mila', 'MIL', 1),
(97, 3, 'Mostaganem', 'MOS', 1),
(98, 3, 'M\'Sila', 'MSI', 1),
(99, 3, 'Naama', 'NAA', 1),
(100, 3, 'Oran', 'ORA', 1),
(101, 3, 'Ouargla', 'OUA', 1),
(102, 3, 'Oum el-Bouaghi', 'OEB', 1),
(103, 3, 'Relizane', 'REL', 1),
(104, 3, 'Saida', 'SAI', 1),
(105, 3, 'Setif', 'SET', 1),
(106, 3, 'Sidi Bel Abbes', 'SBA', 1),
(107, 3, 'Skikda', 'SKI', 1),
(108, 3, 'Souk Ahras', 'SAH', 1),
(109, 3, 'Tamanghasset', 'TAM', 1),
(110, 3, 'Tebessa', 'TEB', 1),
(111, 3, 'Tiaret', 'TIA', 1),
(112, 3, 'Tindouf', 'TIN', 1),
(113, 3, 'Tipaza', 'TIP', 1),
(114, 3, 'Tissemsilt', 'TIS', 1),
(115, 3, 'Tizi Ouzou', 'TOU', 1),
(116, 3, 'Tlemcen', 'TLE', 1),
(117, 4, 'Eastern', 'E', 1),
(118, 4, 'Manu\'a', 'M', 1),
(119, 4, 'Rose Island', 'R', 1),
(120, 4, 'Swains Island', 'S', 1),
(121, 4, 'Western', 'W', 1),
(122, 5, 'Andorra la Vella', 'ALV', 1),
(123, 5, 'Canillo', 'CAN', 1),
(124, 5, 'Encamp', 'ENC', 1),
(125, 5, 'Escaldes-Engordany', 'ESE', 1),
(126, 5, 'La Massana', 'LMA', 1),
(127, 5, 'Ordino', 'ORD', 1),
(128, 5, 'Sant Julia de Loria', 'SJL', 1),
(129, 6, 'Bengo', 'BGO', 1),
(130, 6, 'Benguela', 'BGU', 1),
(131, 6, 'Bie', 'BIE', 1),
(132, 6, 'Cabinda', 'CAB', 1),
(133, 6, 'Cuando-Cubango', 'CCU', 1),
(134, 6, 'Cuanza Norte', 'CNO', 1),
(135, 6, 'Cuanza Sul', 'CUS', 1),
(136, 6, 'Cunene', 'CNN', 1),
(137, 6, 'Huambo', 'HUA', 1),
(138, 6, 'Huila', 'HUI', 1),
(139, 6, 'Luanda', 'LUA', 1),
(140, 6, 'Lunda Norte', 'LNO', 1),
(141, 6, 'Lunda Sul', 'LSU', 1),
(142, 6, 'Malange', 'MAL', 1),
(143, 6, 'Moxico', 'MOX', 1),
(144, 6, 'Namibe', 'NAM', 1),
(145, 6, 'Uige', 'UIG', 1),
(146, 6, 'Zaire', 'ZAI', 1),
(147, 9, 'Saint George', 'ASG', 1),
(148, 9, 'Saint John', 'ASJ', 1),
(149, 9, 'Saint Mary', 'ASM', 1),
(150, 9, 'Saint Paul', 'ASL', 1),
(151, 9, 'Saint Peter', 'ASR', 1),
(152, 9, 'Saint Philip', 'ASH', 1),
(153, 9, 'Barbuda', 'BAR', 1),
(154, 9, 'Redonda', 'RED', 1),
(155, 10, 'Antartida e Islas del Atlantico', 'AN', 1),
(156, 10, 'Buenos Aires', 'BA', 1),
(157, 10, 'Catamarca', 'CA', 1),
(158, 10, 'Chaco', 'CH', 1),
(159, 10, 'Chubut', 'CU', 1),
(160, 10, 'Cordoba', 'CO', 1),
(161, 10, 'Corrientes', 'CR', 1),
(162, 10, 'Distrito Federal', 'DF', 1),
(163, 10, 'Entre Rios', 'ER', 1),
(164, 10, 'Formosa', 'FO', 1),
(165, 10, 'Jujuy', 'JU', 1),
(166, 10, 'La Pampa', 'LP', 1),
(167, 10, 'La Rioja', 'LR', 1),
(168, 10, 'Mendoza', 'ME', 1),
(169, 10, 'Misiones', 'MI', 1),
(170, 10, 'Neuquen', 'NE', 1),
(171, 10, 'Rio Negro', 'RN', 1),
(172, 10, 'Salta', 'SA', 1),
(173, 10, 'San Juan', 'SJ', 1),
(174, 10, 'San Luis', 'SL', 1),
(175, 10, 'Santa Cruz', 'SC', 1),
(176, 10, 'Santa Fe', 'SF', 1),
(177, 10, 'Santiago del Estero', 'SD', 1),
(178, 10, 'Tierra del Fuego', 'TF', 1),
(179, 10, 'Tucuman', 'TU', 1),
(180, 11, 'Aragatsotn', 'AGT', 1),
(181, 11, 'Ararat', 'ARR', 1),
(182, 11, 'Armavir', 'ARM', 1),
(183, 11, 'Geghark\'unik\'', 'GEG', 1),
(184, 11, 'Kotayk\'', 'KOT', 1),
(185, 11, 'Lorri', 'LOR', 1),
(186, 11, 'Shirak', 'SHI', 1),
(187, 11, 'Syunik\'', 'SYU', 1),
(188, 11, 'Tavush', 'TAV', 1),
(189, 11, 'Vayots\' Dzor', 'VAY', 1),
(190, 11, 'Yerevan', 'YER', 1),
(191, 13, 'Australian Capital Territory', 'ACT', 1),
(192, 13, 'New South Wales', 'NSW', 1),
(193, 13, 'Northern Territory', 'NT', 1),
(194, 13, 'Queensland', 'QLD', 1),
(195, 13, 'South Australia', 'SA', 1),
(196, 13, 'Tasmania', 'TAS', 1),
(197, 13, 'Victoria', 'VIC', 1),
(198, 13, 'Western Australia', 'WA', 1),
(199, 14, 'Burgenland', 'BUR', 1),
(200, 14, 'Kärnten', 'KAR', 1),
(201, 14, 'Niederösterreich', 'NOS', 1),
(202, 14, 'Oberösterreich', 'OOS', 1),
(203, 14, 'Salzburg', 'SAL', 1),
(204, 14, 'Steiermark', 'STE', 1),
(205, 14, 'Tirol', 'TIR', 1),
(206, 14, 'Vorarlberg', 'VOR', 1),
(207, 14, 'Wien', 'WIE', 1),
(208, 15, 'Ali Bayramli', 'AB', 1),
(209, 15, 'Abseron', 'ABS', 1),
(210, 15, 'AgcabAdi', 'AGC', 1),
(211, 15, 'Agdam', 'AGM', 1),
(212, 15, 'Agdas', 'AGS', 1),
(213, 15, 'Agstafa', 'AGA', 1),
(214, 15, 'Agsu', 'AGU', 1),
(215, 15, 'Astara', 'AST', 1),
(216, 15, 'Baki', 'BA', 1),
(217, 15, 'BabAk', 'BAB', 1),
(218, 15, 'BalakAn', 'BAL', 1),
(219, 15, 'BArdA', 'BAR', 1),
(220, 15, 'Beylaqan', 'BEY', 1),
(221, 15, 'Bilasuvar', 'BIL', 1),
(222, 15, 'Cabrayil', 'CAB', 1),
(223, 15, 'Calilabab', 'CAL', 1),
(224, 15, 'Culfa', 'CUL', 1),
(225, 15, 'Daskasan', 'DAS', 1),
(226, 15, 'Davaci', 'DAV', 1),
(227, 15, 'Fuzuli', 'FUZ', 1),
(228, 15, 'Ganca', 'GA', 1),
(229, 15, 'Gadabay', 'GAD', 1),
(230, 15, 'Goranboy', 'GOR', 1),
(231, 15, 'Goycay', 'GOY', 1),
(232, 15, 'Haciqabul', 'HAC', 1),
(233, 15, 'Imisli', 'IMI', 1),
(234, 15, 'Ismayilli', 'ISM', 1),
(235, 15, 'Kalbacar', 'KAL', 1),
(236, 15, 'Kurdamir', 'KUR', 1),
(237, 15, 'Lankaran', 'LA', 1),
(238, 15, 'Lacin', 'LAC', 1),
(239, 15, 'Lankaran', 'LAN', 1),
(240, 15, 'Lerik', 'LER', 1),
(241, 15, 'Masalli', 'MAS', 1),
(242, 15, 'Mingacevir', 'MI', 1),
(243, 15, 'Naftalan', 'NA', 1),
(244, 15, 'Neftcala', 'NEF', 1),
(245, 15, 'Oguz', 'OGU', 1),
(246, 15, 'Ordubad', 'ORD', 1),
(247, 15, 'Qabala', 'QAB', 1),
(248, 15, 'Qax', 'QAX', 1),
(249, 15, 'Qazax', 'QAZ', 1),
(250, 15, 'Qobustan', 'QOB', 1),
(251, 15, 'Quba', 'QBA', 1),
(252, 15, 'Qubadli', 'QBI', 1),
(253, 15, 'Qusar', 'QUS', 1),
(254, 15, 'Saki', 'SA', 1),
(255, 15, 'Saatli', 'SAT', 1),
(256, 15, 'Sabirabad', 'SAB', 1),
(257, 15, 'Sadarak', 'SAD', 1),
(258, 15, 'Sahbuz', 'SAH', 1),
(259, 15, 'Saki', 'SAK', 1),
(260, 15, 'Salyan', 'SAL', 1),
(261, 15, 'Sumqayit', 'SM', 1),
(262, 15, 'Samaxi', 'SMI', 1),
(263, 15, 'Samkir', 'SKR', 1),
(264, 15, 'Samux', 'SMX', 1),
(265, 15, 'Sarur', 'SAR', 1),
(266, 15, 'Siyazan', 'SIY', 1),
(267, 15, 'Susa', 'SS', 1),
(268, 15, 'Susa', 'SUS', 1),
(269, 15, 'Tartar', 'TAR', 1),
(270, 15, 'Tovuz', 'TOV', 1),
(271, 15, 'Ucar', 'UCA', 1),
(272, 15, 'Xankandi', 'XA', 1),
(273, 15, 'Xacmaz', 'XAC', 1),
(274, 15, 'Xanlar', 'XAN', 1),
(275, 15, 'Xizi', 'XIZ', 1),
(276, 15, 'Xocali', 'XCI', 1),
(277, 15, 'Xocavand', 'XVD', 1),
(278, 15, 'Yardimli', 'YAR', 1),
(279, 15, 'Yevlax', 'YEV', 1),
(280, 15, 'Zangilan', 'ZAN', 1),
(281, 15, 'Zaqatala', 'ZAQ', 1),
(282, 15, 'Zardab', 'ZAR', 1),
(283, 15, 'Naxcivan', 'NX', 1),
(284, 16, 'Acklins', 'ACK', 1),
(285, 16, 'Berry Islands', 'BER', 1),
(286, 16, 'Bimini', 'BIM', 1),
(287, 16, 'Black Point', 'BLK', 1),
(288, 16, 'Cat Island', 'CAT', 1),
(289, 16, 'Central Abaco', 'CAB', 1),
(290, 16, 'Central Andros', 'CAN', 1),
(291, 16, 'Central Eleuthera', 'CEL', 1),
(292, 16, 'City of Freeport', 'FRE', 1),
(293, 16, 'Crooked Island', 'CRO', 1),
(294, 16, 'East Grand Bahama', 'EGB', 1),
(295, 16, 'Exuma', 'EXU', 1),
(296, 16, 'Grand Cay', 'GRD', 1),
(297, 16, 'Harbour Island', 'HAR', 1),
(298, 16, 'Hope Town', 'HOP', 1),
(299, 16, 'Inagua', 'INA', 1),
(300, 16, 'Long Island', 'LNG', 1),
(301, 16, 'Mangrove Cay', 'MAN', 1),
(302, 16, 'Mayaguana', 'MAY', 1),
(303, 16, 'Moore\'s Island', 'MOO', 1),
(304, 16, 'North Abaco', 'NAB', 1),
(305, 16, 'North Andros', 'NAN', 1),
(306, 16, 'North Eleuthera', 'NEL', 1),
(307, 16, 'Ragged Island', 'RAG', 1),
(308, 16, 'Rum Cay', 'RUM', 1),
(309, 16, 'San Salvador', 'SAL', 1),
(310, 16, 'South Abaco', 'SAB', 1),
(311, 16, 'South Andros', 'SAN', 1),
(312, 16, 'South Eleuthera', 'SEL', 1),
(313, 16, 'Spanish Wells', 'SWE', 1),
(314, 16, 'West Grand Bahama', 'WGB', 1),
(315, 17, 'Capital', 'CAP', 1),
(316, 17, 'Central', 'CEN', 1),
(317, 17, 'Muharraq', 'MUH', 1),
(318, 17, 'Northern', 'NOR', 1),
(319, 17, 'Southern', 'SOU', 1),
(320, 18, 'Barisal', 'BAR', 1),
(321, 18, 'Chittagong', 'CHI', 1),
(322, 18, 'Dhaka', 'DHA', 1),
(323, 18, 'Khulna', 'KHU', 1),
(324, 18, 'Rajshahi', 'RAJ', 1),
(325, 18, 'Sylhet', 'SYL', 1),
(326, 19, 'Christ Church', 'CC', 1),
(327, 19, 'Saint Andrew', 'AND', 1),
(328, 19, 'Saint George', 'GEO', 1),
(329, 19, 'Saint James', 'JAM', 1),
(330, 19, 'Saint John', 'JOH', 1),
(331, 19, 'Saint Joseph', 'JOS', 1),
(332, 19, 'Saint Lucy', 'LUC', 1),
(333, 19, 'Saint Michael', 'MIC', 1),
(334, 19, 'Saint Peter', 'PET', 1),
(335, 19, 'Saint Philip', 'PHI', 1),
(336, 19, 'Saint Thomas', 'THO', 1),
(337, 20, 'Brestskaya (Brest)', 'BR', 1),
(338, 20, 'Homyel\'skaya (Homyel\')', 'HO', 1),
(339, 20, 'Horad Minsk', 'HM', 1),
(340, 20, 'Hrodzyenskaya (Hrodna)', 'HR', 1),
(341, 20, 'Mahilyowskaya (Mahilyow)', 'MA', 1),
(342, 20, 'Minskaya', 'MI', 1),
(343, 20, 'Vitsyebskaya (Vitsyebsk)', 'VI', 1),
(344, 21, 'Antwerpen', 'VAN', 1),
(345, 21, 'Brabant Wallon', 'WBR', 1),
(346, 21, 'Hainaut', 'WHT', 1),
(347, 21, 'Liège', 'WLG', 1),
(348, 21, 'Limburg', 'VLI', 1),
(349, 21, 'Luxembourg', 'WLX', 1),
(350, 21, 'Namur', 'WNA', 1),
(351, 21, 'Oost-Vlaanderen', 'VOV', 1),
(352, 21, 'Vlaams Brabant', 'VBR', 1),
(353, 21, 'West-Vlaanderen', 'VWV', 1),
(354, 22, 'Belize', 'BZ', 1),
(355, 22, 'Cayo', 'CY', 1),
(356, 22, 'Corozal', 'CR', 1),
(357, 22, 'Orange Walk', 'OW', 1),
(358, 22, 'Stann Creek', 'SC', 1),
(359, 22, 'Toledo', 'TO', 1),
(360, 23, 'Alibori', 'AL', 1),
(361, 23, 'Atakora', 'AK', 1),
(362, 23, 'Atlantique', 'AQ', 1),
(363, 23, 'Borgou', 'BO', 1),
(364, 23, 'Collines', 'CO', 1),
(365, 23, 'Donga', 'DO', 1),
(366, 23, 'Kouffo', 'KO', 1),
(367, 23, 'Littoral', 'LI', 1),
(368, 23, 'Mono', 'MO', 1),
(369, 23, 'Oueme', 'OU', 1),
(370, 23, 'Plateau', 'PL', 1),
(371, 23, 'Zou', 'ZO', 1),
(372, 24, 'Devonshire', 'DS', 1),
(373, 24, 'Hamilton City', 'HC', 1),
(374, 24, 'Hamilton', 'HA', 1),
(375, 24, 'Paget', 'PG', 1),
(376, 24, 'Pembroke', 'PB', 1),
(377, 24, 'Saint George City', 'GC', 1),
(378, 24, 'Saint George\'s', 'SG', 1),
(379, 24, 'Sandys', 'SA', 1),
(380, 24, 'Smith\'s', 'SM', 1),
(381, 24, 'Southampton', 'SH', 1),
(382, 24, 'Warwick', 'WA', 1),
(383, 25, 'Bumthang', 'BUM', 1),
(384, 25, 'Chukha', 'CHU', 1),
(385, 25, 'Dagana', 'DAG', 1),
(386, 25, 'Gasa', 'GAS', 1),
(387, 25, 'Haa', 'HAA', 1),
(388, 25, 'Lhuntse', 'LHU', 1),
(389, 25, 'Mongar', 'MON', 1),
(390, 25, 'Paro', 'PAR', 1),
(391, 25, 'Pemagatshel', 'PEM', 1),
(392, 25, 'Punakha', 'PUN', 1),
(393, 25, 'Samdrup Jongkhar', 'SJO', 1),
(394, 25, 'Samtse', 'SAT', 1),
(395, 25, 'Sarpang', 'SAR', 1),
(396, 25, 'Thimphu', 'THI', 1),
(397, 25, 'Trashigang', 'TRG', 1),
(398, 25, 'Trashiyangste', 'TRY', 1),
(399, 25, 'Trongsa', 'TRO', 1),
(400, 25, 'Tsirang', 'TSI', 1),
(401, 25, 'Wangdue Phodrang', 'WPH', 1),
(402, 25, 'Zhemgang', 'ZHE', 1),
(403, 26, 'Beni', 'BEN', 1),
(404, 26, 'Chuquisaca', 'CHU', 1),
(405, 26, 'Cochabamba', 'COC', 1),
(406, 26, 'La Paz', 'LPZ', 1),
(407, 26, 'Oruro', 'ORU', 1),
(408, 26, 'Pando', 'PAN', 1),
(409, 26, 'Potosi', 'POT', 1),
(410, 26, 'Santa Cruz', 'SCZ', 1),
(411, 26, 'Tarija', 'TAR', 1),
(412, 27, 'Brcko district', 'BRO', 1),
(413, 27, 'Unsko-Sanski Kanton', 'FUS', 1),
(414, 27, 'Posavski Kanton', 'FPO', 1),
(415, 27, 'Tuzlanski Kanton', 'FTU', 1),
(416, 27, 'Zenicko-Dobojski Kanton', 'FZE', 1),
(417, 27, 'Bosanskopodrinjski Kanton', 'FBP', 1),
(418, 27, 'Srednjebosanski Kanton', 'FSB', 1),
(419, 27, 'Hercegovacko-neretvanski Kanton', 'FHN', 1),
(420, 27, 'Zapadnohercegovacka Zupanija', 'FZH', 1),
(421, 27, 'Kanton Sarajevo', 'FSA', 1),
(422, 27, 'Zapadnobosanska', 'FZA', 1),
(423, 27, 'Banja Luka', 'SBL', 1),
(424, 27, 'Doboj', 'SDO', 1),
(425, 27, 'Bijeljina', 'SBI', 1),
(426, 27, 'Vlasenica', 'SVL', 1),
(427, 27, 'Sarajevo-Romanija or Sokolac', 'SSR', 1),
(428, 27, 'Foca', 'SFO', 1),
(429, 27, 'Trebinje', 'STR', 1),
(430, 28, 'Central', 'CE', 1),
(431, 28, 'Ghanzi', 'GH', 1),
(432, 28, 'Kgalagadi', 'KD', 1),
(433, 28, 'Kgatleng', 'KT', 1),
(434, 28, 'Kweneng', 'KW', 1),
(435, 28, 'Ngamiland', 'NG', 1),
(436, 28, 'North East', 'NE', 1),
(437, 28, 'North West', 'NW', 1),
(438, 28, 'South East', 'SE', 1),
(439, 28, 'Southern', 'SO', 1),
(440, 30, 'Acre', 'AC', 1),
(441, 30, 'Alagoas', 'AL', 1),
(442, 30, 'Amapá', 'AP', 1),
(443, 30, 'Amazonas', 'AM', 1),
(444, 30, 'Bahia', 'BA', 1),
(445, 30, 'Ceará', 'CE', 1),
(446, 30, 'Distrito Federal', 'DF', 1),
(447, 30, 'Espírito Santo', 'ES', 1),
(448, 30, 'Goiás', 'GO', 1),
(449, 30, 'Maranhão', 'MA', 1),
(450, 30, 'Mato Grosso', 'MT', 1),
(451, 30, 'Mato Grosso do Sul', 'MS', 1),
(452, 30, 'Minas Gerais', 'MG', 1),
(453, 30, 'Pará', 'PA', 1),
(454, 30, 'Paraíba', 'PB', 1),
(455, 30, 'Paraná', 'PR', 1),
(456, 30, 'Pernambuco', 'PE', 1),
(457, 30, 'Piauí', 'PI', 1),
(458, 30, 'Rio de Janeiro', 'RJ', 1),
(459, 30, 'Rio Grande do Norte', 'RN', 1),
(460, 30, 'Rio Grande do Sul', 'RS', 1),
(461, 30, 'Rondônia', 'RO', 1),
(462, 30, 'Roraima', 'RR', 1),
(463, 30, 'Santa Catarina', 'SC', 1),
(464, 30, 'São Paulo', 'SP', 1),
(465, 30, 'Sergipe', 'SE', 1),
(466, 30, 'Tocantins', 'TO', 1),
(467, 31, 'Peros Banhos', 'PB', 1),
(468, 31, 'Salomon Islands', 'SI', 1),
(469, 31, 'Nelsons Island', 'NI', 1),
(470, 31, 'Three Brothers', 'TB', 1),
(471, 31, 'Eagle Islands', 'EA', 1),
(472, 31, 'Danger Island', 'DI', 1),
(473, 31, 'Egmont Islands', 'EG', 1),
(474, 31, 'Diego Garcia', 'DG', 1),
(475, 32, 'Belait', 'BEL', 1),
(476, 32, 'Brunei and Muara', 'BRM', 1),
(477, 32, 'Temburong', 'TEM', 1),
(478, 32, 'Tutong', 'TUT', 1),
(479, 33, 'Blagoevgrad', '', 1),
(480, 33, 'Burgas', '', 1),
(481, 33, 'Dobrich', '', 1),
(482, 33, 'Gabrovo', '', 1),
(483, 33, 'Haskovo', '', 1),
(484, 33, 'Kardjali', '', 1),
(485, 33, 'Kyustendil', '', 1),
(486, 33, 'Lovech', '', 1),
(487, 33, 'Montana', '', 1),
(488, 33, 'Pazardjik', '', 1),
(489, 33, 'Pernik', '', 1),
(490, 33, 'Pleven', '', 1),
(491, 33, 'Plovdiv', '', 1),
(492, 33, 'Razgrad', '', 1),
(493, 33, 'Shumen', '', 1),
(494, 33, 'Silistra', '', 1),
(495, 33, 'Sliven', '', 1),
(496, 33, 'Smolyan', '', 1),
(497, 33, 'Sofia', '', 1),
(498, 33, 'Sofia - town', '', 1),
(499, 33, 'Stara Zagora', '', 1),
(500, 33, 'Targovishte', '', 1),
(501, 33, 'Varna', '', 1),
(502, 33, 'Veliko Tarnovo', '', 1),
(503, 33, 'Vidin', '', 1),
(504, 33, 'Vratza', '', 1),
(505, 33, 'Yambol', '', 1),
(506, 34, 'Bale', 'BAL', 1),
(507, 34, 'Bam', 'BAM', 1),
(508, 34, 'Banwa', 'BAN', 1),
(509, 34, 'Bazega', 'BAZ', 1),
(510, 34, 'Bougouriba', 'BOR', 1),
(511, 34, 'Boulgou', 'BLG', 1),
(512, 34, 'Boulkiemde', 'BOK', 1),
(513, 34, 'Comoe', 'COM', 1),
(514, 34, 'Ganzourgou', 'GAN', 1),
(515, 34, 'Gnagna', 'GNA', 1),
(516, 34, 'Gourma', 'GOU', 1),
(517, 34, 'Houet', 'HOU', 1),
(518, 34, 'Ioba', 'IOA', 1),
(519, 34, 'Kadiogo', 'KAD', 1),
(520, 34, 'Kenedougou', 'KEN', 1),
(521, 34, 'Komondjari', 'KOD', 1),
(522, 34, 'Kompienga', 'KOP', 1),
(523, 34, 'Kossi', 'KOS', 1),
(524, 34, 'Koulpelogo', 'KOL', 1),
(525, 34, 'Kouritenga', 'KOT', 1),
(526, 34, 'Kourweogo', 'KOW', 1),
(527, 34, 'Leraba', 'LER', 1),
(528, 34, 'Loroum', 'LOR', 1),
(529, 34, 'Mouhoun', 'MOU', 1),
(530, 34, 'Nahouri', 'NAH', 1),
(531, 34, 'Namentenga', 'NAM', 1),
(532, 34, 'Nayala', 'NAY', 1),
(533, 34, 'Noumbiel', 'NOU', 1),
(534, 34, 'Oubritenga', 'OUB', 1),
(535, 34, 'Oudalan', 'OUD', 1),
(536, 34, 'Passore', 'PAS', 1),
(537, 34, 'Poni', 'PON', 1),
(538, 34, 'Sanguie', 'SAG', 1),
(539, 34, 'Sanmatenga', 'SAM', 1),
(540, 34, 'Seno', 'SEN', 1),
(541, 34, 'Sissili', 'SIS', 1),
(542, 34, 'Soum', 'SOM', 1),
(543, 34, 'Sourou', 'SOR', 1),
(544, 34, 'Tapoa', 'TAP', 1),
(545, 34, 'Tuy', 'TUY', 1),
(546, 34, 'Yagha', 'YAG', 1),
(547, 34, 'Yatenga', 'YAT', 1),
(548, 34, 'Ziro', 'ZIR', 1),
(549, 34, 'Zondoma', 'ZOD', 1),
(550, 34, 'Zoundweogo', 'ZOW', 1),
(551, 35, 'Bubanza', 'BB', 1),
(552, 35, 'Bujumbura', 'BJ', 1),
(553, 35, 'Bururi', 'BR', 1),
(554, 35, 'Cankuzo', 'CA', 1),
(555, 35, 'Cibitoke', 'CI', 1),
(556, 35, 'Gitega', 'GI', 1),
(557, 35, 'Karuzi', 'KR', 1),
(558, 35, 'Kayanza', 'KY', 1),
(559, 35, 'Kirundo', 'KI', 1),
(560, 35, 'Makamba', 'MA', 1),
(561, 35, 'Muramvya', 'MU', 1),
(562, 35, 'Muyinga', 'MY', 1),
(563, 35, 'Mwaro', 'MW', 1),
(564, 35, 'Ngozi', 'NG', 1),
(565, 35, 'Rutana', 'RT', 1),
(566, 35, 'Ruyigi', 'RY', 1),
(567, 36, 'Phnom Penh', 'PP', 1),
(568, 36, 'Preah Seihanu (Kompong Som or Sihanoukville)', 'PS', 1),
(569, 36, 'Pailin', 'PA', 1),
(570, 36, 'Keb', 'KB', 1),
(571, 36, 'Banteay Meanchey', 'BM', 1),
(572, 36, 'Battambang', 'BA', 1),
(573, 36, 'Kampong Cham', 'KM', 1),
(574, 36, 'Kampong Chhnang', 'KN', 1),
(575, 36, 'Kampong Speu', 'KU', 1),
(576, 36, 'Kampong Som', 'KO', 1),
(577, 36, 'Kampong Thom', 'KT', 1),
(578, 36, 'Kampot', 'KP', 1),
(579, 36, 'Kandal', 'KL', 1),
(580, 36, 'Kaoh Kong', 'KK', 1),
(581, 36, 'Kratie', 'KR', 1),
(582, 36, 'Mondul Kiri', 'MK', 1),
(583, 36, 'Oddar Meancheay', 'OM', 1),
(584, 36, 'Pursat', 'PU', 1),
(585, 36, 'Preah Vihear', 'PR', 1),
(586, 36, 'Prey Veng', 'PG', 1),
(587, 36, 'Ratanak Kiri', 'RK', 1),
(588, 36, 'Siemreap', 'SI', 1),
(589, 36, 'Stung Treng', 'ST', 1),
(590, 36, 'Svay Rieng', 'SR', 1),
(591, 36, 'Takeo', 'TK', 1),
(592, 37, 'Adamawa (Adamaoua)', 'ADA', 1),
(593, 37, 'Centre', 'CEN', 1),
(594, 37, 'East (Est)', 'EST', 1),
(595, 37, 'Extreme North (Extreme-Nord)', 'EXN', 1),
(596, 37, 'Littoral', 'LIT', 1),
(597, 37, 'North (Nord)', 'NOR', 1),
(598, 37, 'Northwest (Nord-Ouest)', 'NOT', 1),
(599, 37, 'West (Ouest)', 'OUE', 1),
(600, 37, 'South (Sud)', 'SUD', 1),
(601, 37, 'Southwest (Sud-Ouest).', 'SOU', 1),
(602, 38, 'Alberta', 'AB', 1),
(603, 38, 'British Columbia', 'BC', 1),
(604, 38, 'Manitoba', 'MB', 1),
(605, 38, 'New Brunswick', 'NB', 1),
(606, 38, 'Newfoundland and Labrador', 'NL', 1),
(607, 38, 'Northwest Territories', 'NT', 1),
(608, 38, 'Nova Scotia', 'NS', 1),
(609, 38, 'Nunavut', 'NU', 1),
(610, 38, 'Ontario', 'ON', 1),
(611, 38, 'Prince Edward Island', 'PE', 1),
(612, 38, 'Qu&eacute;bec', 'QC', 1),
(613, 38, 'Saskatchewan', 'SK', 1),
(614, 38, 'Yukon Territory', 'YT', 1),
(615, 39, 'Boa Vista', 'BV', 1),
(616, 39, 'Brava', 'BR', 1),
(617, 39, 'Calheta de Sao Miguel', 'CS', 1),
(618, 39, 'Maio', 'MA', 1),
(619, 39, 'Mosteiros', 'MO', 1),
(620, 39, 'Paul', 'PA', 1),
(621, 39, 'Porto Novo', 'PN', 1),
(622, 39, 'Praia', 'PR', 1),
(623, 39, 'Ribeira Grande', 'RG', 1),
(624, 39, 'Sal', 'SL', 1),
(625, 39, 'Santa Catarina', 'CA', 1),
(626, 39, 'Santa Cruz', 'CR', 1),
(627, 39, 'Sao Domingos', 'SD', 1),
(628, 39, 'Sao Filipe', 'SF', 1),
(629, 39, 'Sao Nicolau', 'SN', 1),
(630, 39, 'Sao Vicente', 'SV', 1),
(631, 39, 'Tarrafal', 'TA', 1),
(632, 40, 'Creek', 'CR', 1),
(633, 40, 'Eastern', 'EA', 1),
(634, 40, 'Midland', 'ML', 1),
(635, 40, 'South Town', 'ST', 1),
(636, 40, 'Spot Bay', 'SP', 1),
(637, 40, 'Stake Bay', 'SK', 1),
(638, 40, 'West End', 'WD', 1),
(639, 40, 'Western', 'WN', 1),
(640, 41, 'Bamingui-Bangoran', 'BBA', 1),
(641, 41, 'Basse-Kotto', 'BKO', 1),
(642, 41, 'Haute-Kotto', 'HKO', 1),
(643, 41, 'Haut-Mbomou', 'HMB', 1),
(644, 41, 'Kemo', 'KEM', 1),
(645, 41, 'Lobaye', 'LOB', 1),
(646, 41, 'Mambere-KadeÔ', 'MKD', 1),
(647, 41, 'Mbomou', 'MBO', 1),
(648, 41, 'Nana-Mambere', 'NMM', 1),
(649, 41, 'Ombella-M\'Poko', 'OMP', 1),
(650, 41, 'Ouaka', 'OUK', 1),
(651, 41, 'Ouham', 'OUH', 1),
(652, 41, 'Ouham-Pende', 'OPE', 1),
(653, 41, 'Vakaga', 'VAK', 1),
(654, 41, 'Nana-Grebizi', 'NGR', 1),
(655, 41, 'Sangha-Mbaere', 'SMB', 1),
(656, 41, 'Bangui', 'BAN', 1),
(657, 42, 'Batha', 'BA', 1),
(658, 42, 'Biltine', 'BI', 1),
(659, 42, 'Borkou-Ennedi-Tibesti', 'BE', 1),
(660, 42, 'Chari-Baguirmi', 'CB', 1),
(661, 42, 'Guera', 'GU', 1),
(662, 42, 'Kanem', 'KA', 1),
(663, 42, 'Lac', 'LA', 1),
(664, 42, 'Logone Occidental', 'LC', 1),
(665, 42, 'Logone Oriental', 'LR', 1),
(666, 42, 'Mayo-Kebbi', 'MK', 1),
(667, 42, 'Moyen-Chari', 'MC', 1),
(668, 42, 'Ouaddai', 'OU', 1),
(669, 42, 'Salamat', 'SA', 1),
(670, 42, 'Tandjile', 'TA', 1),
(671, 43, 'Aisen del General Carlos Ibanez', 'AI', 1),
(672, 43, 'Antofagasta', 'AN', 1),
(673, 43, 'Araucania', 'AR', 1),
(674, 43, 'Atacama', 'AT', 1),
(675, 43, 'Bio-Bio', 'BI', 1),
(676, 43, 'Coquimbo', 'CO', 1),
(677, 43, 'Libertador General Bernardo O\'Higgins', 'LI', 1),
(678, 43, 'Los Lagos', 'LL', 1),
(679, 43, 'Magallanes y de la Antartica Chilena', 'MA', 1),
(680, 43, 'Maule', 'ML', 1),
(681, 43, 'Region Metropolitana', 'RM', 1),
(682, 43, 'Tarapaca', 'TA', 1),
(683, 43, 'Valparaiso', 'VS', 1),
(684, 44, 'Anhui', 'AN', 1),
(685, 44, 'Beijing', 'BE', 1),
(686, 44, 'Chongqing', 'CH', 1),
(687, 44, 'Fujian', 'FU', 1),
(688, 44, 'Gansu', 'GA', 1),
(689, 44, 'Guangdong', 'GU', 1),
(690, 44, 'Guangxi', 'GX', 1),
(691, 44, 'Guizhou', 'GZ', 1),
(692, 44, 'Hainan', 'HA', 1),
(693, 44, 'Hebei', 'HB', 1),
(694, 44, 'Heilongjiang', 'HL', 1),
(695, 44, 'Henan', 'HE', 1),
(696, 44, 'Hong Kong', 'HK', 1),
(697, 44, 'Hubei', 'HU', 1),
(698, 44, 'Hunan', 'HN', 1),
(699, 44, 'Inner Mongolia', 'IM', 1),
(700, 44, 'Jiangsu', 'JI', 1),
(701, 44, 'Jiangxi', 'JX', 1),
(702, 44, 'Jilin', 'JL', 1),
(703, 44, 'Liaoning', 'LI', 1),
(704, 44, 'Macau', 'MA', 1),
(705, 44, 'Ningxia', 'NI', 1),
(706, 44, 'Shaanxi', 'SH', 1),
(707, 44, 'Shandong', 'SA', 1),
(708, 44, 'Shanghai', 'SG', 1),
(709, 44, 'Shanxi', 'SX', 1),
(710, 44, 'Sichuan', 'SI', 1),
(711, 44, 'Tianjin', 'TI', 1),
(712, 44, 'Xinjiang', 'XI', 1),
(713, 44, 'Yunnan', 'YU', 1),
(714, 44, 'Zhejiang', 'ZH', 1),
(715, 46, 'Direction Island', 'D', 1),
(716, 46, 'Home Island', 'H', 1),
(717, 46, 'Horsburgh Island', 'O', 1),
(718, 46, 'South Island', 'S', 1),
(719, 46, 'West Island', 'W', 1),
(720, 47, 'Amazonas', 'AMZ', 1),
(721, 47, 'Antioquia', 'ANT', 1),
(722, 47, 'Arauca', 'ARA', 1),
(723, 47, 'Atlantico', 'ATL', 1),
(724, 47, 'Bogota D.C.', 'BDC', 1),
(725, 47, 'Bolivar', 'BOL', 1),
(726, 47, 'Boyaca', 'BOY', 1),
(727, 47, 'Caldas', 'CAL', 1),
(728, 47, 'Caqueta', 'CAQ', 1),
(729, 47, 'Casanare', 'CAS', 1),
(730, 47, 'Cauca', 'CAU', 1),
(731, 47, 'Cesar', 'CES', 1),
(732, 47, 'Choco', 'CHO', 1),
(733, 47, 'Cordoba', 'COR', 1),
(734, 47, 'Cundinamarca', 'CAM', 1),
(735, 47, 'Guainia', 'GNA', 1),
(736, 47, 'Guajira', 'GJR', 1),
(737, 47, 'Guaviare', 'GVR', 1),
(738, 47, 'Huila', 'HUI', 1),
(739, 47, 'Magdalena', 'MAG', 1),
(740, 47, 'Meta', 'MET', 1),
(741, 47, 'Narino', 'NAR', 1),
(742, 47, 'Norte de Santander', 'NDS', 1),
(743, 47, 'Putumayo', 'PUT', 1),
(744, 47, 'Quindio', 'QUI', 1),
(745, 47, 'Risaralda', 'RIS', 1),
(746, 47, 'San Andres y Providencia', 'SAP', 1),
(747, 47, 'Santander', 'SAN', 1),
(748, 47, 'Sucre', 'SUC', 1),
(749, 47, 'Tolima', 'TOL', 1),
(750, 47, 'Valle del Cauca', 'VDC', 1),
(751, 47, 'Vaupes', 'VAU', 1),
(752, 47, 'Vichada', 'VIC', 1),
(753, 48, 'Grande Comore', 'G', 1),
(754, 48, 'Anjouan', 'A', 1),
(755, 48, 'Moheli', 'M', 1),
(756, 49, 'Bouenza', 'BO', 1),
(757, 49, 'Brazzaville', 'BR', 1),
(758, 49, 'Cuvette', 'CU', 1),
(759, 49, 'Cuvette-Ouest', 'CO', 1),
(760, 49, 'Kouilou', 'KO', 1),
(761, 49, 'Lekoumou', 'LE', 1),
(762, 49, 'Likouala', 'LI', 1),
(763, 49, 'Niari', 'NI', 1),
(764, 49, 'Plateaux', 'PL', 1),
(765, 49, 'Pool', 'PO', 1),
(766, 49, 'Sangha', 'SA', 1),
(767, 50, 'Pukapuka', 'PU', 1),
(768, 50, 'Rakahanga', 'RK', 1),
(769, 50, 'Manihiki', 'MK', 1),
(770, 50, 'Penrhyn', 'PE', 1),
(771, 50, 'Nassau Island', 'NI', 1),
(772, 50, 'Surwarrow', 'SU', 1),
(773, 50, 'Palmerston', 'PA', 1),
(774, 50, 'Aitutaki', 'AI', 1),
(775, 50, 'Manuae', 'MA', 1),
(776, 50, 'Takutea', 'TA', 1),
(777, 50, 'Mitiaro', 'MT', 1),
(778, 50, 'Atiu', 'AT', 1),
(779, 50, 'Mauke', 'MU', 1),
(780, 50, 'Rarotonga', 'RR', 1),
(781, 50, 'Mangaia', 'MG', 1),
(782, 51, 'Alajuela', 'AL', 1),
(783, 51, 'Cartago', 'CA', 1),
(784, 51, 'Guanacaste', 'GU', 1),
(785, 51, 'Heredia', 'HE', 1),
(786, 51, 'Limon', 'LI', 1),
(787, 51, 'Puntarenas', 'PU', 1),
(788, 51, 'San Jose', 'SJ', 1),
(789, 52, 'Abengourou', 'ABE', 1),
(790, 52, 'Abidjan', 'ABI', 1),
(791, 52, 'Aboisso', 'ABO', 1),
(792, 52, 'Adiake', 'ADI', 1),
(793, 52, 'Adzope', 'ADZ', 1),
(794, 52, 'Agboville', 'AGB', 1),
(795, 52, 'Agnibilekrou', 'AGN', 1),
(796, 52, 'Alepe', 'ALE', 1),
(797, 52, 'Bocanda', 'BOC', 1),
(798, 52, 'Bangolo', 'BAN', 1),
(799, 52, 'Beoumi', 'BEO', 1),
(800, 52, 'Biankouma', 'BIA', 1),
(801, 52, 'Bondoukou', 'BDK', 1),
(802, 52, 'Bongouanou', 'BGN', 1),
(803, 52, 'Bouafle', 'BFL', 1),
(804, 52, 'Bouake', 'BKE', 1),
(805, 52, 'Bouna', 'BNA', 1),
(806, 52, 'Boundiali', 'BDL', 1),
(807, 52, 'Dabakala', 'DKL', 1),
(808, 52, 'Dabou', 'DBU', 1),
(809, 52, 'Daloa', 'DAL', 1),
(810, 52, 'Danane', 'DAN', 1),
(811, 52, 'Daoukro', 'DAO', 1),
(812, 52, 'Dimbokro', 'DIM', 1),
(813, 52, 'Divo', 'DIV', 1),
(814, 52, 'Duekoue', 'DUE', 1),
(815, 52, 'Ferkessedougou', 'FER', 1),
(816, 52, 'Gagnoa', 'GAG', 1),
(817, 52, 'Grand-Bassam', 'GBA', 1),
(818, 52, 'Grand-Lahou', 'GLA', 1),
(819, 52, 'Guiglo', 'GUI', 1),
(820, 52, 'Issia', 'ISS', 1),
(821, 52, 'Jacqueville', 'JAC', 1),
(822, 52, 'Katiola', 'KAT', 1),
(823, 52, 'Korhogo', 'KOR', 1),
(824, 52, 'Lakota', 'LAK', 1),
(825, 52, 'Man', 'MAN', 1),
(826, 52, 'Mankono', 'MKN', 1),
(827, 52, 'Mbahiakro', 'MBA', 1),
(828, 52, 'Odienne', 'ODI', 1),
(829, 52, 'Oume', 'OUM', 1),
(830, 52, 'Sakassou', 'SAK', 1),
(831, 52, 'San-Pedro', 'SPE', 1),
(832, 52, 'Sassandra', 'SAS', 1),
(833, 52, 'Seguela', 'SEG', 1),
(834, 52, 'Sinfra', 'SIN', 1),
(835, 52, 'Soubre', 'SOU', 1),
(836, 52, 'Tabou', 'TAB', 1),
(837, 52, 'Tanda', 'TAN', 1),
(838, 52, 'Tiebissou', 'TIE', 1),
(839, 52, 'Tingrela', 'TIN', 1),
(840, 52, 'Tiassale', 'TIA', 1),
(841, 52, 'Touba', 'TBA', 1),
(842, 52, 'Toulepleu', 'TLP', 1),
(843, 52, 'Toumodi', 'TMD', 1),
(844, 52, 'Vavoua', 'VAV', 1),
(845, 52, 'Yamoussoukro', 'YAM', 1),
(846, 52, 'Zuenoula', 'ZUE', 1),
(847, 53, 'Bjelovarsko-bilogorska', 'BB', 1),
(848, 53, 'Grad Zagreb', 'GZ', 1),
(849, 53, 'Dubrovačko-neretvanska', 'DN', 1),
(850, 53, 'Istarska', 'IS', 1),
(851, 53, 'Karlovačka', 'KA', 1),
(852, 53, 'Koprivničko-križevačka', 'KK', 1),
(853, 53, 'Krapinsko-zagorska', 'KZ', 1),
(854, 53, 'Ličko-senjska', 'LS', 1),
(855, 53, 'Međimurska', 'ME', 1),
(856, 53, 'Osječko-baranjska', 'OB', 1),
(857, 53, 'Požeško-slavonska', 'PS', 1),
(858, 53, 'Primorsko-goranska', 'PG', 1),
(859, 53, 'Šibensko-kninska', 'SK', 1),
(860, 53, 'Sisačko-moslavačka', 'SM', 1),
(861, 53, 'Brodsko-posavska', 'BP', 1),
(862, 53, 'Splitsko-dalmatinska', 'SD', 1),
(863, 53, 'Varaždinska', 'VA', 1),
(864, 53, 'Virovitičko-podravska', 'VP', 1),
(865, 53, 'Vukovarsko-srijemska', 'VS', 1),
(866, 53, 'Zadarska', 'ZA', 1),
(867, 53, 'Zagrebačka', 'ZG', 1),
(868, 54, 'Camaguey', 'CA', 1),
(869, 54, 'Ciego de Avila', 'CD', 1),
(870, 54, 'Cienfuegos', 'CI', 1),
(871, 54, 'Ciudad de La Habana', 'CH', 1),
(872, 54, 'Granma', 'GR', 1),
(873, 54, 'Guantanamo', 'GU', 1),
(874, 54, 'Holguin', 'HO', 1),
(875, 54, 'Isla de la Juventud', 'IJ', 1),
(876, 54, 'La Habana', 'LH', 1),
(877, 54, 'Las Tunas', 'LT', 1),
(878, 54, 'Matanzas', 'MA', 1),
(879, 54, 'Pinar del Rio', 'PR', 1),
(880, 54, 'Sancti Spiritus', 'SS', 1),
(881, 54, 'Santiago de Cuba', 'SC', 1),
(882, 54, 'Villa Clara', 'VC', 1),
(883, 55, 'Famagusta', 'F', 1),
(884, 55, 'Kyrenia', 'K', 1),
(885, 55, 'Larnaca', 'A', 1),
(886, 55, 'Limassol', 'I', 1),
(887, 55, 'Nicosia', 'N', 1),
(888, 55, 'Paphos', 'P', 1),
(889, 56, 'Ústecký', 'U', 1),
(890, 56, 'Jihočeský', 'C', 1),
(891, 56, 'Jihomoravský', 'B', 1),
(892, 56, 'Karlovarský', 'K', 1),
(893, 56, 'Královehradecký', 'H', 1),
(894, 56, 'Liberecký', 'L', 1),
(895, 56, 'Moravskoslezský', 'T', 1),
(896, 56, 'Olomoucký', 'M', 1),
(897, 56, 'Pardubický', 'E', 1),
(898, 56, 'Plzeňský', 'P', 1),
(899, 56, 'Praha', 'A', 1),
(900, 56, 'Středočeský', 'S', 1),
(901, 56, 'Vysočina', 'J', 1),
(902, 56, 'Zlínský', 'Z', 1),
(903, 57, 'Arhus', 'AR', 1),
(904, 57, 'Bornholm', 'BH', 1),
(905, 57, 'Copenhagen', 'CO', 1),
(906, 57, 'Faroe Islands', 'FO', 1),
(907, 57, 'Frederiksborg', 'FR', 1),
(908, 57, 'Fyn', 'FY', 1),
(909, 57, 'Kobenhavn', 'KO', 1),
(910, 57, 'Nordjylland', 'NO', 1),
(911, 57, 'Ribe', 'RI', 1),
(912, 57, 'Ringkobing', 'RK', 1),
(913, 57, 'Roskilde', 'RO', 1),
(914, 57, 'Sonderjylland', 'SO', 1),
(915, 57, 'Storstrom', 'ST', 1),
(916, 57, 'Vejle', 'VK', 1),
(917, 57, 'Vestj&aelig;lland', 'VJ', 1),
(918, 57, 'Viborg', 'VB', 1),
(919, 58, '\'Ali Sabih', 'S', 1),
(920, 58, 'Dikhil', 'K', 1),
(921, 58, 'Djibouti', 'J', 1),
(922, 58, 'Obock', 'O', 1),
(923, 58, 'Tadjoura', 'T', 1),
(924, 59, 'Saint Andrew Parish', 'AND', 1),
(925, 59, 'Saint David Parish', 'DAV', 1),
(926, 59, 'Saint George Parish', 'GEO', 1),
(927, 59, 'Saint John Parish', 'JOH', 1),
(928, 59, 'Saint Joseph Parish', 'JOS', 1),
(929, 59, 'Saint Luke Parish', 'LUK', 1),
(930, 59, 'Saint Mark Parish', 'MAR', 1),
(931, 59, 'Saint Patrick Parish', 'PAT', 1),
(932, 59, 'Saint Paul Parish', 'PAU', 1),
(933, 59, 'Saint Peter Parish', 'PET', 1),
(934, 60, 'Distrito Nacional', 'DN', 1),
(935, 60, 'Azua', 'AZ', 1),
(936, 60, 'Baoruco', 'BC', 1),
(937, 60, 'Barahona', 'BH', 1),
(938, 60, 'Dajabon', 'DJ', 1),
(939, 60, 'Duarte', 'DU', 1),
(940, 60, 'Elias Pina', 'EL', 1),
(941, 60, 'El Seybo', 'SY', 1),
(942, 60, 'Espaillat', 'ET', 1),
(943, 60, 'Hato Mayor', 'HM', 1),
(944, 60, 'Independencia', 'IN', 1),
(945, 60, 'La Altagracia', 'AL', 1),
(946, 60, 'La Romana', 'RO', 1),
(947, 60, 'La Vega', 'VE', 1),
(948, 60, 'Maria Trinidad Sanchez', 'MT', 1),
(949, 60, 'Monsenor Nouel', 'MN', 1),
(950, 60, 'Monte Cristi', 'MC', 1),
(951, 60, 'Monte Plata', 'MP', 1),
(952, 60, 'Pedernales', 'PD', 1),
(953, 60, 'Peravia (Bani)', 'PR', 1),
(954, 60, 'Puerto Plata', 'PP', 1),
(955, 60, 'Salcedo', 'SL', 1),
(956, 60, 'Samana', 'SM', 1),
(957, 60, 'Sanchez Ramirez', 'SH', 1),
(958, 60, 'San Cristobal', 'SC', 1),
(959, 60, 'San Jose de Ocoa', 'JO', 1),
(960, 60, 'San Juan', 'SJ', 1),
(961, 60, 'San Pedro de Macoris', 'PM', 1),
(962, 60, 'Santiago', 'SA', 1),
(963, 60, 'Santiago Rodriguez', 'ST', 1),
(964, 60, 'Santo Domingo', 'SD', 1),
(965, 60, 'Valverde', 'VA', 1),
(966, 61, 'Aileu', 'AL', 1),
(967, 61, 'Ainaro', 'AN', 1),
(968, 61, 'Baucau', 'BA', 1),
(969, 61, 'Bobonaro', 'BO', 1),
(970, 61, 'Cova Lima', 'CO', 1),
(971, 61, 'Dili', 'DI', 1),
(972, 61, 'Ermera', 'ER', 1),
(973, 61, 'Lautem', 'LA', 1),
(974, 61, 'Liquica', 'LI', 1),
(975, 61, 'Manatuto', 'MT', 1),
(976, 61, 'Manufahi', 'MF', 1),
(977, 61, 'Oecussi', 'OE', 1),
(978, 61, 'Viqueque', 'VI', 1),
(979, 62, 'Azuay', 'AZU', 1),
(980, 62, 'Bolivar', 'BOL', 1),
(981, 62, 'Ca&ntilde;ar', 'CAN', 1),
(982, 62, 'Carchi', 'CAR', 1),
(983, 62, 'Chimborazo', 'CHI', 1),
(984, 62, 'Cotopaxi', 'COT', 1),
(985, 62, 'El Oro', 'EOR', 1),
(986, 62, 'Esmeraldas', 'ESM', 1),
(987, 62, 'Gal&aacute;pagos', 'GPS', 1),
(988, 62, 'Guayas', 'GUA', 1),
(989, 62, 'Imbabura', 'IMB', 1),
(990, 62, 'Loja', 'LOJ', 1),
(991, 62, 'Los Rios', 'LRO', 1),
(992, 62, 'Manab&iacute;', 'MAN', 1),
(993, 62, 'Morona Santiago', 'MSA', 1),
(994, 62, 'Napo', 'NAP', 1),
(995, 62, 'Orellana', 'ORE', 1),
(996, 62, 'Pastaza', 'PAS', 1),
(997, 62, 'Pichincha', 'PIC', 1),
(998, 62, 'Sucumb&iacute;os', 'SUC', 1),
(999, 62, 'Tungurahua', 'TUN', 1),
(1000, 62, 'Zamora Chinchipe', 'ZCH', 1),
(1001, 63, 'Ad Daqahliyah', 'DHY', 1),
(1002, 63, 'Al Bahr al Ahmar', 'BAM', 1),
(1003, 63, 'Al Buhayrah', 'BHY', 1),
(1004, 63, 'Al Fayyum', 'FYM', 1),
(1005, 63, 'Al Gharbiyah', 'GBY', 1),
(1006, 63, 'Al Iskandariyah', 'IDR', 1),
(1007, 63, 'Al Isma\'iliyah', 'IML', 1),
(1008, 63, 'Al Jizah', 'JZH', 1),
(1009, 63, 'Al Minufiyah', 'MFY', 1),
(1010, 63, 'Al Minya', 'MNY', 1),
(1011, 63, 'Al Qahirah', 'QHR', 1),
(1012, 63, 'Al Qalyubiyah', 'QLY', 1),
(1013, 63, 'Al Wadi al Jadid', 'WJD', 1),
(1014, 63, 'Ash Sharqiyah', 'SHQ', 1),
(1015, 63, 'As Suways', 'SWY', 1),
(1016, 63, 'Aswan', 'ASW', 1),
(1017, 63, 'Asyut', 'ASY', 1),
(1018, 63, 'Bani Suwayf', 'BSW', 1),
(1019, 63, 'Bur Sa\'id', 'BSD', 1),
(1020, 63, 'Dumyat', 'DMY', 1),
(1021, 63, 'Janub Sina\'', 'JNS', 1),
(1022, 63, 'Kafr ash Shaykh', 'KSH', 1),
(1023, 63, 'Matruh', 'MAT', 1),
(1024, 63, 'Qina', 'QIN', 1),
(1025, 63, 'Shamal Sina\'', 'SHS', 1),
(1026, 63, 'Suhaj', 'SUH', 1),
(1027, 64, 'Ahuachapan', 'AH', 1),
(1028, 64, 'Cabanas', 'CA', 1),
(1029, 64, 'Chalatenango', 'CH', 1),
(1030, 64, 'Cuscatlan', 'CU', 1),
(1031, 64, 'La Libertad', 'LB', 1),
(1032, 64, 'La Paz', 'PZ', 1),
(1033, 64, 'La Union', 'UN', 1),
(1034, 64, 'Morazan', 'MO', 1),
(1035, 64, 'San Miguel', 'SM', 1),
(1036, 64, 'San Salvador', 'SS', 1),
(1037, 64, 'San Vicente', 'SV', 1),
(1038, 64, 'Santa Ana', 'SA', 1),
(1039, 64, 'Sonsonate', 'SO', 1),
(1040, 64, 'Usulutan', 'US', 1),
(1041, 65, 'Provincia Annobon', 'AN', 1),
(1042, 65, 'Provincia Bioko Norte', 'BN', 1),
(1043, 65, 'Provincia Bioko Sur', 'BS', 1),
(1044, 65, 'Provincia Centro Sur', 'CS', 1),
(1045, 65, 'Provincia Kie-Ntem', 'KN', 1),
(1046, 65, 'Provincia Litoral', 'LI', 1),
(1047, 65, 'Provincia Wele-Nzas', 'WN', 1),
(1048, 66, 'Central (Maekel)', 'MA', 1),
(1049, 66, 'Anseba (Keren)', 'KE', 1),
(1050, 66, 'Southern Red Sea (Debub-Keih-Bahri)', 'DK', 1),
(1051, 66, 'Northern Red Sea (Semien-Keih-Bahri)', 'SK', 1),
(1052, 66, 'Southern (Debub)', 'DE', 1),
(1053, 66, 'Gash-Barka (Barentu)', 'BR', 1),
(1054, 67, 'Harjumaa (Tallinn)', 'HA', 1),
(1055, 67, 'Hiiumaa (Kardla)', 'HI', 1),
(1056, 67, 'Ida-Virumaa (Johvi)', 'IV', 1),
(1057, 67, 'Jarvamaa (Paide)', 'JA', 1),
(1058, 67, 'Jogevamaa (Jogeva)', 'JO', 1),
(1059, 67, 'Laane-Virumaa (Rakvere)', 'LV', 1),
(1060, 67, 'Laanemaa (Haapsalu)', 'LA', 1),
(1061, 67, 'Parnumaa (Parnu)', 'PA', 1),
(1062, 67, 'Polvamaa (Polva)', 'PO', 1),
(1063, 67, 'Raplamaa (Rapla)', 'RA', 1),
(1064, 67, 'Saaremaa (Kuessaare)', 'SA', 1),
(1065, 67, 'Tartumaa (Tartu)', 'TA', 1),
(1066, 67, 'Valgamaa (Valga)', 'VA', 1),
(1067, 67, 'Viljandimaa (Viljandi)', 'VI', 1),
(1068, 67, 'Vorumaa (Voru)', 'VO', 1),
(1069, 68, 'Afar', 'AF', 1),
(1070, 68, 'Amhara', 'AH', 1),
(1071, 68, 'Benishangul-Gumaz', 'BG', 1),
(1072, 68, 'Gambela', 'GB', 1),
(1073, 68, 'Hariai', 'HR', 1),
(1074, 68, 'Oromia', 'OR', 1),
(1075, 68, 'Somali', 'SM', 1),
(1076, 68, 'Southern Nations - Nationalities and Peoples Region', 'SN', 1),
(1077, 68, 'Tigray', 'TG', 1),
(1078, 68, 'Addis Ababa', 'AA', 1),
(1079, 68, 'Dire Dawa', 'DD', 1),
(1080, 71, 'Central Division', 'C', 1),
(1081, 71, 'Northern Division', 'N', 1),
(1082, 71, 'Eastern Division', 'E', 1),
(1083, 71, 'Western Division', 'W', 1),
(1084, 71, 'Rotuma', 'R', 1),
(1085, 72, 'Ahvenanmaan lääni', 'AL', 1),
(1086, 72, 'Etelä-Suomen lääni', 'ES', 1),
(1087, 72, 'Itä-Suomen lääni', 'IS', 1),
(1088, 72, 'Länsi-Suomen lääni', 'LS', 1),
(1089, 72, 'Lapin lääni', 'LA', 1),
(1090, 72, 'Oulun lääni', 'OU', 1),
(1114, 74, 'Ain', '01', 1),
(1115, 74, 'Aisne', '02', 1),
(1116, 74, 'Allier', '03', 1),
(1117, 74, 'Alpes de Haute Provence', '04', 1),
(1118, 74, 'Hautes-Alpes', '05', 1),
(1119, 74, 'Alpes Maritimes', '06', 1),
(1120, 74, 'Ard&egrave;che', '07', 1),
(1121, 74, 'Ardennes', '08', 1),
(1122, 74, 'Ari&egrave;ge', '09', 1),
(1123, 74, 'Aube', '10', 1),
(1124, 74, 'Aude', '11', 1),
(1125, 74, 'Aveyron', '12', 1),
(1126, 74, 'Bouches du Rh&ocirc;ne', '13', 1),
(1127, 74, 'Calvados', '14', 1),
(1128, 74, 'Cantal', '15', 1),
(1129, 74, 'Charente', '16', 1),
(1130, 74, 'Charente Maritime', '17', 1),
(1131, 74, 'Cher', '18', 1),
(1132, 74, 'Corr&egrave;ze', '19', 1),
(1133, 74, 'Corse du Sud', '2A', 1),
(1134, 74, 'Haute Corse', '2B', 1),
(1135, 74, 'C&ocirc;te d&#039;or', '21', 1),
(1136, 74, 'C&ocirc;tes d&#039;Armor', '22', 1),
(1137, 74, 'Creuse', '23', 1),
(1138, 74, 'Dordogne', '24', 1),
(1139, 74, 'Doubs', '25', 1),
(1140, 74, 'Dr&ocirc;me', '26', 1),
(1141, 74, 'Eure', '27', 1),
(1142, 74, 'Eure et Loir', '28', 1),
(1143, 74, 'Finist&egrave;re', '29', 1),
(1144, 74, 'Gard', '30', 1),
(1145, 74, 'Haute Garonne', '31', 1),
(1146, 74, 'Gers', '32', 1),
(1147, 74, 'Gironde', '33', 1),
(1148, 74, 'H&eacute;rault', '34', 1),
(1149, 74, 'Ille et Vilaine', '35', 1),
(1150, 74, 'Indre', '36', 1),
(1151, 74, 'Indre et Loire', '37', 1),
(1152, 74, 'Is&eacute;re', '38', 1),
(1153, 74, 'Jura', '39', 1),
(1154, 74, 'Landes', '40', 1),
(1155, 74, 'Loir et Cher', '41', 1),
(1156, 74, 'Loire', '42', 1),
(1157, 74, 'Haute Loire', '43', 1),
(1158, 74, 'Loire Atlantique', '44', 1),
(1159, 74, 'Loiret', '45', 1),
(1160, 74, 'Lot', '46', 1),
(1161, 74, 'Lot et Garonne', '47', 1),
(1162, 74, 'Loz&egrave;re', '48', 1),
(1163, 74, 'Maine et Loire', '49', 1),
(1164, 74, 'Manche', '50', 1),
(1165, 74, 'Marne', '51', 1),
(1166, 74, 'Haute Marne', '52', 1),
(1167, 74, 'Mayenne', '53', 1),
(1168, 74, 'Meurthe et Moselle', '54', 1),
(1169, 74, 'Meuse', '55', 1),
(1170, 74, 'Morbihan', '56', 1),
(1171, 74, 'Moselle', '57', 1),
(1172, 74, 'Ni&egrave;vre', '58', 1),
(1173, 74, 'Nord', '59', 1),
(1174, 74, 'Oise', '60', 1),
(1175, 74, 'Orne', '61', 1),
(1176, 74, 'Pas de Calais', '62', 1),
(1177, 74, 'Puy de D&ocirc;me', '63', 1),
(1178, 74, 'Pyr&eacute;n&eacute;es Atlantiques', '64', 1),
(1179, 74, 'Hautes Pyr&eacute;n&eacute;es', '65', 1),
(1180, 74, 'Pyr&eacute;n&eacute;es Orientales', '66', 1),
(1181, 74, 'Bas Rhin', '67', 1),
(1182, 74, 'Haut Rhin', '68', 1),
(1183, 74, 'Rh&ocirc;ne', '69', 1),
(1184, 74, 'Haute Sa&ocirc;ne', '70', 1),
(1185, 74, 'Sa&ocirc;ne et Loire', '71', 1),
(1186, 74, 'Sarthe', '72', 1),
(1187, 74, 'Savoie', '73', 1),
(1188, 74, 'Haute Savoie', '74', 1),
(1189, 74, 'Paris', '75', 1),
(1190, 74, 'Seine Maritime', '76', 1),
(1191, 74, 'Seine et Marne', '77', 1),
(1192, 74, 'Yvelines', '78', 1),
(1193, 74, 'Deux S&egrave;vres', '79', 1),
(1194, 74, 'Somme', '80', 1),
(1195, 74, 'Tarn', '81', 1),
(1196, 74, 'Tarn et Garonne', '82', 1),
(1197, 74, 'Var', '83', 1),
(1198, 74, 'Vaucluse', '84', 1),
(1199, 74, 'Vend&eacute;e', '85', 1),
(1200, 74, 'Vienne', '86', 1),
(1201, 74, 'Haute Vienne', '87', 1),
(1202, 74, 'Vosges', '88', 1),
(1203, 74, 'Yonne', '89', 1),
(1204, 74, 'Territoire de Belfort', '90', 1),
(1205, 74, 'Essonne', '91', 1),
(1206, 74, 'Hauts de Seine', '92', 1),
(1207, 74, 'Seine St-Denis', '93', 1),
(1208, 74, 'Val de Marne', '94', 1),
(1209, 74, 'Val d\'Oise', '95', 1),
(1210, 76, 'Archipel des Marquises', 'M', 1),
(1211, 76, 'Archipel des Tuamotu', 'T', 1),
(1212, 76, 'Archipel des Tubuai', 'I', 1),
(1213, 76, 'Iles du Vent', 'V', 1),
(1214, 76, 'Iles Sous-le-Vent', 'S', 1),
(1215, 77, 'Iles Crozet', 'C', 1),
(1216, 77, 'Iles Kerguelen', 'K', 1),
(1217, 77, 'Ile Amsterdam', 'A', 1),
(1218, 77, 'Ile Saint-Paul', 'P', 1),
(1219, 77, 'Adelie Land', 'D', 1),
(1220, 78, 'Estuaire', 'ES', 1),
(1221, 78, 'Haut-Ogooue', 'HO', 1),
(1222, 78, 'Moyen-Ogooue', 'MO', 1),
(1223, 78, 'Ngounie', 'NG', 1),
(1224, 78, 'Nyanga', 'NY', 1),
(1225, 78, 'Ogooue-Ivindo', 'OI', 1),
(1226, 78, 'Ogooue-Lolo', 'OL', 1),
(1227, 78, 'Ogooue-Maritime', 'OM', 1),
(1228, 78, 'Woleu-Ntem', 'WN', 1),
(1229, 79, 'Banjul', 'BJ', 1),
(1230, 79, 'Basse', 'BS', 1),
(1231, 79, 'Brikama', 'BR', 1),
(1232, 79, 'Janjangbure', 'JA', 1),
(1233, 79, 'Kanifeng', 'KA', 1),
(1234, 79, 'Kerewan', 'KE', 1),
(1235, 79, 'Kuntaur', 'KU', 1),
(1236, 79, 'Mansakonko', 'MA', 1),
(1237, 79, 'Lower River', 'LR', 1),
(1238, 79, 'Central River', 'CR', 1),
(1239, 79, 'North Bank', 'NB', 1),
(1240, 79, 'Upper River', 'UR', 1),
(1241, 79, 'Western', 'WE', 1),
(1242, 80, 'Abkhazia', 'AB', 1),
(1243, 80, 'Ajaria', 'AJ', 1),
(1244, 80, 'Tbilisi', 'TB', 1),
(1245, 80, 'Guria', 'GU', 1),
(1246, 80, 'Imereti', 'IM', 1),
(1247, 80, 'Kakheti', 'KA', 1),
(1248, 80, 'Kvemo Kartli', 'KK', 1),
(1249, 80, 'Mtskheta-Mtianeti', 'MM', 1),
(1250, 80, 'Racha Lechkhumi and Kvemo Svanet', 'RL', 1),
(1251, 80, 'Samegrelo-Zemo Svaneti', 'SZ', 1),
(1252, 80, 'Samtskhe-Javakheti', 'SJ', 1),
(1253, 80, 'Shida Kartli', 'SK', 1),
(1254, 81, 'Baden-Württemberg', 'BAW', 1),
(1255, 81, 'Bayern', 'BAY', 1),
(1256, 81, 'Berlin', 'BER', 1),
(1257, 81, 'Brandenburg', 'BRG', 1),
(1258, 81, 'Bremen', 'BRE', 1),
(1259, 81, 'Hamburg', 'HAM', 1),
(1260, 81, 'Hessen', 'HES', 1),
(1261, 81, 'Mecklenburg-Vorpommern', 'MEC', 1),
(1262, 81, 'Niedersachsen', 'NDS', 1),
(1263, 81, 'Nordrhein-Westfalen', 'NRW', 1),
(1264, 81, 'Rheinland-Pfalz', 'RHE', 1),
(1265, 81, 'Saarland', 'SAR', 1),
(1266, 81, 'Sachsen', 'SAS', 1),
(1267, 81, 'Sachsen-Anhalt', 'SAC', 1),
(1268, 81, 'Schleswig-Holstein', 'SCN', 1),
(1269, 81, 'Thüringen', 'THE', 1),
(1270, 82, 'Ashanti Region', 'AS', 1),
(1271, 82, 'Brong-Ahafo Region', 'BA', 1),
(1272, 82, 'Central Region', 'CE', 1),
(1273, 82, 'Eastern Region', 'EA', 1),
(1274, 82, 'Greater Accra Region', 'GA', 1),
(1275, 82, 'Northern Region', 'NO', 1),
(1276, 82, 'Upper East Region', 'UE', 1),
(1277, 82, 'Upper West Region', 'UW', 1),
(1278, 82, 'Volta Region', 'VO', 1),
(1279, 82, 'Western Region', 'WE', 1),
(1280, 84, 'Attica', 'AT', 1),
(1281, 84, 'Central Greece', 'CN', 1),
(1282, 84, 'Central Macedonia', 'CM', 1),
(1283, 84, 'Crete', 'CR', 1),
(1284, 84, 'East Macedonia and Thrace', 'EM', 1),
(1285, 84, 'Epirus', 'EP', 1),
(1286, 84, 'Ionian Islands', 'II', 1),
(1287, 84, 'North Aegean', 'NA', 1),
(1288, 84, 'Peloponnesos', 'PP', 1),
(1289, 84, 'South Aegean', 'SA', 1),
(1290, 84, 'Thessaly', 'TH', 1),
(1291, 84, 'West Greece', 'WG', 1),
(1292, 84, 'West Macedonia', 'WM', 1),
(1293, 85, 'Avannaa', 'A', 1),
(1294, 85, 'Tunu', 'T', 1),
(1295, 85, 'Kitaa', 'K', 1),
(1296, 86, 'Saint Andrew', 'A', 1),
(1297, 86, 'Saint David', 'D', 1),
(1298, 86, 'Saint George', 'G', 1),
(1299, 86, 'Saint John', 'J', 1),
(1300, 86, 'Saint Mark', 'M', 1),
(1301, 86, 'Saint Patrick', 'P', 1),
(1302, 86, 'Carriacou', 'C', 1),
(1303, 86, 'Petit Martinique', 'Q', 1),
(1304, 89, 'Alta Verapaz', 'AV', 1),
(1305, 89, 'Baja Verapaz', 'BV', 1),
(1306, 89, 'Chimaltenango', 'CM', 1),
(1307, 89, 'Chiquimula', 'CQ', 1),
(1308, 89, 'El Peten', 'PE', 1),
(1309, 89, 'El Progreso', 'PR', 1),
(1310, 89, 'El Quiche', 'QC', 1),
(1311, 89, 'Escuintla', 'ES', 1),
(1312, 89, 'Guatemala', 'GU', 1),
(1313, 89, 'Huehuetenango', 'HU', 1),
(1314, 89, 'Izabal', 'IZ', 1),
(1315, 89, 'Jalapa', 'JA', 1),
(1316, 89, 'Jutiapa', 'JU', 1),
(1317, 89, 'Quetzaltenango', 'QZ', 1),
(1318, 89, 'Retalhuleu', 'RE', 1),
(1319, 89, 'Sacatepequez', 'ST', 1),
(1320, 89, 'San Marcos', 'SM', 1),
(1321, 89, 'Santa Rosa', 'SR', 1),
(1322, 89, 'Solola', 'SO', 1),
(1323, 89, 'Suchitepequez', 'SU', 1),
(1324, 89, 'Totonicapan', 'TO', 1),
(1325, 89, 'Zacapa', 'ZA', 1),
(1326, 90, 'Conakry', 'CNK', 1),
(1327, 90, 'Beyla', 'BYL', 1),
(1328, 90, 'Boffa', 'BFA', 1),
(1329, 90, 'Boke', 'BOK', 1),
(1330, 90, 'Coyah', 'COY', 1),
(1331, 90, 'Dabola', 'DBL', 1),
(1332, 90, 'Dalaba', 'DLB', 1),
(1333, 90, 'Dinguiraye', 'DGR', 1),
(1334, 90, 'Dubreka', 'DBR', 1),
(1335, 90, 'Faranah', 'FRN', 1),
(1336, 90, 'Forecariah', 'FRC', 1),
(1337, 90, 'Fria', 'FRI', 1),
(1338, 90, 'Gaoual', 'GAO', 1),
(1339, 90, 'Gueckedou', 'GCD', 1),
(1340, 90, 'Kankan', 'KNK', 1),
(1341, 90, 'Kerouane', 'KRN', 1),
(1342, 90, 'Kindia', 'KND', 1),
(1343, 90, 'Kissidougou', 'KSD', 1),
(1344, 90, 'Koubia', 'KBA', 1),
(1345, 90, 'Koundara', 'KDA', 1),
(1346, 90, 'Kouroussa', 'KRA', 1),
(1347, 90, 'Labe', 'LAB', 1),
(1348, 90, 'Lelouma', 'LLM', 1),
(1349, 90, 'Lola', 'LOL', 1),
(1350, 90, 'Macenta', 'MCT', 1),
(1351, 90, 'Mali', 'MAL', 1),
(1352, 90, 'Mamou', 'MAM', 1),
(1353, 90, 'Mandiana', 'MAN', 1),
(1354, 90, 'Nzerekore', 'NZR', 1),
(1355, 90, 'Pita', 'PIT', 1),
(1356, 90, 'Siguiri', 'SIG', 1),
(1357, 90, 'Telimele', 'TLM', 1),
(1358, 90, 'Tougue', 'TOG', 1),
(1359, 90, 'Yomou', 'YOM', 1),
(1360, 91, 'Bafata Region', 'BF', 1),
(1361, 91, 'Biombo Region', 'BB', 1),
(1362, 91, 'Bissau Region', 'BS', 1),
(1363, 91, 'Bolama Region', 'BL', 1),
(1364, 91, 'Cacheu Region', 'CA', 1),
(1365, 91, 'Gabu Region', 'GA', 1),
(1366, 91, 'Oio Region', 'OI', 1),
(1367, 91, 'Quinara Region', 'QU', 1),
(1368, 91, 'Tombali Region', 'TO', 1),
(1369, 92, 'Barima-Waini', 'BW', 1),
(1370, 92, 'Cuyuni-Mazaruni', 'CM', 1),
(1371, 92, 'Demerara-Mahaica', 'DM', 1),
(1372, 92, 'East Berbice-Corentyne', 'EC', 1),
(1373, 92, 'Essequibo Islands-West Demerara', 'EW', 1),
(1374, 92, 'Mahaica-Berbice', 'MB', 1),
(1375, 92, 'Pomeroon-Supenaam', 'PM', 1),
(1376, 92, 'Potaro-Siparuni', 'PI', 1),
(1377, 92, 'Upper Demerara-Berbice', 'UD', 1),
(1378, 92, 'Upper Takutu-Upper Essequibo', 'UT', 1),
(1379, 93, 'Artibonite', 'AR', 1),
(1380, 93, 'Centre', 'CE', 1),
(1381, 93, 'Grand\'Anse', 'GA', 1),
(1382, 93, 'Nord', 'ND', 1),
(1383, 93, 'Nord-Est', 'NE', 1),
(1384, 93, 'Nord-Ouest', 'NO', 1),
(1385, 93, 'Ouest', 'OU', 1),
(1386, 93, 'Sud', 'SD', 1),
(1387, 93, 'Sud-Est', 'SE', 1),
(1388, 94, 'Flat Island', 'F', 1),
(1389, 94, 'McDonald Island', 'M', 1),
(1390, 94, 'Shag Island', 'S', 1),
(1391, 94, 'Heard Island', 'H', 1),
(1392, 95, 'Atlantida', 'AT', 1),
(1393, 95, 'Choluteca', 'CH', 1),
(1394, 95, 'Colon', 'CL', 1),
(1395, 95, 'Comayagua', 'CM', 1),
(1396, 95, 'Copan', 'CP', 1),
(1397, 95, 'Cortes', 'CR', 1),
(1398, 95, 'El Paraiso', 'PA', 1),
(1399, 95, 'Francisco Morazan', 'FM', 1),
(1400, 95, 'Gracias a Dios', 'GD', 1),
(1401, 95, 'Intibuca', 'IN', 1),
(1402, 95, 'Islas de la Bahia (Bay Islands)', 'IB', 1),
(1403, 95, 'La Paz', 'PZ', 1),
(1404, 95, 'Lempira', 'LE', 1),
(1405, 95, 'Ocotepeque', 'OC', 1),
(1406, 95, 'Olancho', 'OL', 1),
(1407, 95, 'Santa Barbara', 'SB', 1),
(1408, 95, 'Valle', 'VA', 1),
(1409, 95, 'Yoro', 'YO', 1),
(1410, 96, 'Central and Western Hong Kong Island', 'HCW', 1),
(1411, 96, 'Eastern Hong Kong Island', 'HEA', 1),
(1412, 96, 'Southern Hong Kong Island', 'HSO', 1),
(1413, 96, 'Wan Chai Hong Kong Island', 'HWC', 1),
(1414, 96, 'Kowloon City Kowloon', 'KKC', 1),
(1415, 96, 'Kwun Tong Kowloon', 'KKT', 1),
(1416, 96, 'Sham Shui Po Kowloon', 'KSS', 1),
(1417, 96, 'Wong Tai Sin Kowloon', 'KWT', 1),
(1418, 96, 'Yau Tsim Mong Kowloon', 'KYT', 1),
(1419, 96, 'Islands New Territories', 'NIS', 1),
(1420, 96, 'Kwai Tsing New Territories', 'NKT', 1),
(1421, 96, 'North New Territories', 'NNO', 1),
(1422, 96, 'Sai Kung New Territories', 'NSK', 1),
(1423, 96, 'Sha Tin New Territories', 'NST', 1),
(1424, 96, 'Tai Po New Territories', 'NTP', 1),
(1425, 96, 'Tsuen Wan New Territories', 'NTW', 1),
(1426, 96, 'Tuen Mun New Territories', 'NTM', 1),
(1427, 96, 'Yuen Long New Territories', 'NYL', 1),
(1467, 98, 'Austurland', 'AL', 1),
(1468, 98, 'Hofuoborgarsvaeoi', 'HF', 1),
(1469, 98, 'Norourland eystra', 'NE', 1),
(1470, 98, 'Norourland vestra', 'NV', 1),
(1471, 98, 'Suourland', 'SL', 1),
(1472, 98, 'Suournes', 'SN', 1),
(1473, 98, 'Vestfiroir', 'VF', 1),
(1474, 98, 'Vesturland', 'VL', 1),
(1475, 99, 'Andaman and Nicobar Islands', 'AN', 1),
(1476, 99, 'Andhra Pradesh', 'AP', 1),
(1477, 99, 'Arunachal Pradesh', 'AR', 1),
(1478, 99, 'Assam', 'AS', 1),
(1479, 99, 'Bihar', 'BI', 1),
(1480, 99, 'Chandigarh', 'CH', 1),
(1481, 99, 'Dadra and Nagar Haveli', 'DA', 1),
(1482, 99, 'Daman and Diu', 'DM', 1),
(1483, 99, 'Delhi', 'DE', 1),
(1484, 99, 'Goa', 'GO', 1),
(1485, 99, 'Gujarat', 'GU', 1),
(1486, 99, 'Haryana', 'HA', 1),
(1487, 99, 'Himachal Pradesh', 'HP', 1),
(1488, 99, 'Jammu and Kashmir', 'JA', 1),
(1489, 99, 'Karnataka', 'KA', 1),
(1490, 99, 'Kerala', 'KE', 1),
(1491, 99, 'Lakshadweep Islands', 'LI', 1),
(1492, 99, 'Madhya Pradesh', 'MP', 1),
(1493, 99, 'Maharashtra', 'MA', 1),
(1494, 99, 'Manipur', 'MN', 1),
(1495, 99, 'Meghalaya', 'ME', 1),
(1496, 99, 'Mizoram', 'MI', 1),
(1497, 99, 'Nagaland', 'NA', 1),
(1498, 99, 'Orissa', 'OR', 1),
(1499, 99, 'Puducherry', 'PO', 1),
(1500, 99, 'Punjab', 'PU', 1),
(1501, 99, 'Rajasthan', 'RA', 1),
(1502, 99, 'Sikkim', 'SI', 1),
(1503, 99, 'Tamil Nadu', 'TN', 1),
(1504, 99, 'Tripura', 'TR', 1),
(1505, 99, 'Uttar Pradesh', 'UP', 1),
(1506, 99, 'West Bengal', 'WB', 1),
(1507, 100, 'Aceh', 'AC', 1),
(1508, 100, 'Bali', 'BA', 1),
(1509, 100, 'Banten', 'BT', 1),
(1510, 100, 'Bengkulu', 'BE', 1),
(1511, 100, 'Kalimantan Utara', 'BD', 1),
(1512, 100, 'Gorontalo', 'GO', 1),
(1513, 100, 'Jakarta', 'JK', 1),
(1514, 100, 'Jambi', 'JA', 1),
(1515, 100, 'Jawa Barat', 'JB', 1),
(1516, 100, 'Jawa Tengah', 'JT', 1),
(1517, 100, 'Jawa Timur', 'JI', 1),
(1518, 100, 'Kalimantan Barat', 'KB', 1),
(1519, 100, 'Kalimantan Selatan', 'KS', 1),
(1520, 100, 'Kalimantan Tengah', 'KT', 1),
(1521, 100, 'Kalimantan Timur', 'KI', 1),
(1522, 100, 'Kepulauan Bangka Belitung', 'BB', 1),
(1523, 100, 'Lampung', 'LA', 1),
(1524, 100, 'Maluku', 'MA', 1),
(1525, 100, 'Maluku Utara', 'MU', 1),
(1526, 100, 'Nusa Tenggara Barat', 'NB', 1),
(1527, 100, 'Nusa Tenggara Timur', 'NT', 1),
(1528, 100, 'Papua', 'PA', 1),
(1529, 100, 'Riau', 'RI', 1),
(1530, 100, 'Sulawesi Selatan', 'SN', 1),
(1531, 100, 'Sulawesi Tengah', 'ST', 1),
(1532, 100, 'Sulawesi Tenggara', 'SG', 1),
(1533, 100, 'Sulawesi Utara', 'SA', 1),
(1534, 100, 'Sumatera Barat', 'SB', 1),
(1535, 100, 'Sumatera Selatan', 'SS', 1),
(1536, 100, 'Sumatera Utara', 'SU', 1),
(1537, 100, 'Yogyakarta', 'YO', 1),
(1538, 101, 'Tehran', 'TEH', 1),
(1539, 101, 'Qom', 'QOM', 1),
(1540, 101, 'Markazi', 'MKZ', 1),
(1541, 101, 'Qazvin', 'QAZ', 1),
(1542, 101, 'Gilan', 'GIL', 1),
(1543, 101, 'Ardabil', 'ARD', 1),
(1544, 101, 'Zanjan', 'ZAN', 1),
(1545, 101, 'East Azarbaijan', 'EAZ', 1),
(1546, 101, 'West Azarbaijan', 'WEZ', 1),
(1547, 101, 'Kurdistan', 'KRD', 1),
(1548, 101, 'Hamadan', 'HMD', 1),
(1549, 101, 'Kermanshah', 'KRM', 1),
(1550, 101, 'Ilam', 'ILM', 1),
(1551, 101, 'Lorestan', 'LRS', 1),
(1552, 101, 'Khuzestan', 'KZT', 1),
(1553, 101, 'Chahar Mahaal and Bakhtiari', 'CMB', 1),
(1554, 101, 'Kohkiluyeh and Buyer Ahmad', 'KBA', 1),
(1555, 101, 'Bushehr', 'BSH', 1),
(1556, 101, 'Fars', 'FAR', 1),
(1557, 101, 'Hormozgan', 'HRM', 1),
(1558, 101, 'Sistan and Baluchistan', 'SBL', 1),
(1559, 101, 'Kerman', 'KRB', 1),
(1560, 101, 'Yazd', 'YZD', 1),
(1561, 101, 'Esfahan', 'EFH', 1),
(1562, 101, 'Semnan', 'SMN', 1),
(1563, 101, 'Mazandaran', 'MZD', 1),
(1564, 101, 'Golestan', 'GLS', 1),
(1565, 101, 'North Khorasan', 'NKH', 1),
(1566, 101, 'Razavi Khorasan', 'RKH', 1),
(1567, 101, 'South Khorasan', 'SKH', 1),
(1568, 102, 'Baghdad', 'BD', 1),
(1569, 102, 'Salah ad Din', 'SD', 1),
(1570, 102, 'Diyala', 'DY', 1),
(1571, 102, 'Wasit', 'WS', 1),
(1572, 102, 'Maysan', 'MY', 1),
(1573, 102, 'Al Basrah', 'BA', 1),
(1574, 102, 'Dhi Qar', 'DQ', 1),
(1575, 102, 'Al Muthanna', 'MU', 1),
(1576, 102, 'Al Qadisyah', 'QA', 1),
(1577, 102, 'Babil', 'BB', 1),
(1578, 102, 'Al Karbala', 'KB', 1),
(1579, 102, 'An Najaf', 'NJ', 1),
(1580, 102, 'Al Anbar', 'AB', 1),
(1581, 102, 'Ninawa', 'NN', 1),
(1582, 102, 'Dahuk', 'DH', 1),
(1583, 102, 'Arbil', 'AL', 1),
(1584, 102, 'At Ta\'mim', 'TM', 1),
(1585, 102, 'As Sulaymaniyah', 'SL', 1),
(1586, 103, 'Carlow', 'CA', 1),
(1587, 103, 'Cavan', 'CV', 1),
(1588, 103, 'Clare', 'CL', 1),
(1589, 103, 'Cork', 'CO', 1),
(1590, 103, 'Donegal', 'DO', 1),
(1591, 103, 'Dublin', 'DU', 1),
(1592, 103, 'Galway', 'GA', 1),
(1593, 103, 'Kerry', 'KE', 1),
(1594, 103, 'Kildare', 'KI', 1),
(1595, 103, 'Kilkenny', 'KL', 1),
(1596, 103, 'Laois', 'LA', 1),
(1597, 103, 'Leitrim', 'LE', 1);
INSERT INTO `oc_zone` (`zone_id`, `country_id`, `name`, `code`, `status`) VALUES
(1598, 103, 'Limerick', 'LI', 1),
(1599, 103, 'Longford', 'LO', 1),
(1600, 103, 'Louth', 'LU', 1),
(1601, 103, 'Mayo', 'MA', 1),
(1602, 103, 'Meath', 'ME', 1),
(1603, 103, 'Monaghan', 'MO', 1),
(1604, 103, 'Offaly', 'OF', 1),
(1605, 103, 'Roscommon', 'RO', 1),
(1606, 103, 'Sligo', 'SL', 1),
(1607, 103, 'Tipperary', 'TI', 1),
(1608, 103, 'Waterford', 'WA', 1),
(1609, 103, 'Westmeath', 'WE', 1),
(1610, 103, 'Wexford', 'WX', 1),
(1611, 103, 'Wicklow', 'WI', 1),
(1612, 104, 'Be\'er Sheva', 'BS', 1),
(1613, 104, 'Bika\'at Hayarden', 'BH', 1),
(1614, 104, 'Eilat and Arava', 'EA', 1),
(1615, 104, 'Galil', 'GA', 1),
(1616, 104, 'Haifa', 'HA', 1),
(1617, 104, 'Jehuda Mountains', 'JM', 1),
(1618, 104, 'Jerusalem', 'JE', 1),
(1619, 104, 'Negev', 'NE', 1),
(1620, 104, 'Semaria', 'SE', 1),
(1621, 104, 'Sharon', 'SH', 1),
(1622, 104, 'Tel Aviv (Gosh Dan)', 'TA', 1),
(3860, 105, 'Caltanissetta', 'CL', 1),
(3842, 105, 'Agrigento', 'AG', 1),
(3843, 105, 'Alessandria', 'AL', 1),
(3844, 105, 'Ancona', 'AN', 1),
(3845, 105, 'Aosta', 'AO', 1),
(3846, 105, 'Arezzo', 'AR', 1),
(3847, 105, 'Ascoli Piceno', 'AP', 1),
(3848, 105, 'Asti', 'AT', 1),
(3849, 105, 'Avellino', 'AV', 1),
(3850, 105, 'Bari', 'BA', 1),
(3851, 105, 'Belluno', 'BL', 1),
(3852, 105, 'Benevento', 'BN', 1),
(3853, 105, 'Bergamo', 'BG', 1),
(3854, 105, 'Biella', 'BI', 1),
(3855, 105, 'Bologna', 'BO', 1),
(3856, 105, 'Bolzano', 'BZ', 1),
(3857, 105, 'Brescia', 'BS', 1),
(3858, 105, 'Brindisi', 'BR', 1),
(3859, 105, 'Cagliari', 'CA', 1),
(1643, 106, 'Clarendon Parish', 'CLA', 1),
(1644, 106, 'Hanover Parish', 'HAN', 1),
(1645, 106, 'Kingston Parish', 'KIN', 1),
(1646, 106, 'Manchester Parish', 'MAN', 1),
(1647, 106, 'Portland Parish', 'POR', 1),
(1648, 106, 'Saint Andrew Parish', 'AND', 1),
(1649, 106, 'Saint Ann Parish', 'ANN', 1),
(1650, 106, 'Saint Catherine Parish', 'CAT', 1),
(1651, 106, 'Saint Elizabeth Parish', 'ELI', 1),
(1652, 106, 'Saint James Parish', 'JAM', 1),
(1653, 106, 'Saint Mary Parish', 'MAR', 1),
(1654, 106, 'Saint Thomas Parish', 'THO', 1),
(1655, 106, 'Trelawny Parish', 'TRL', 1),
(1656, 106, 'Westmoreland Parish', 'WML', 1),
(1657, 107, 'Aichi', 'AI', 1),
(1658, 107, 'Akita', 'AK', 1),
(1659, 107, 'Aomori', 'AO', 1),
(1660, 107, 'Chiba', 'CH', 1),
(1661, 107, 'Ehime', 'EH', 1),
(1662, 107, 'Fukui', 'FK', 1),
(1663, 107, 'Fukuoka', 'FU', 1),
(1664, 107, 'Fukushima', 'FS', 1),
(1665, 107, 'Gifu', 'GI', 1),
(1666, 107, 'Gumma', 'GU', 1),
(1667, 107, 'Hiroshima', 'HI', 1),
(1668, 107, 'Hokkaido', 'HO', 1),
(1669, 107, 'Hyogo', 'HY', 1),
(1670, 107, 'Ibaraki', 'IB', 1),
(1671, 107, 'Ishikawa', 'IS', 1),
(1672, 107, 'Iwate', 'IW', 1),
(1673, 107, 'Kagawa', 'KA', 1),
(1674, 107, 'Kagoshima', 'KG', 1),
(1675, 107, 'Kanagawa', 'KN', 1),
(1676, 107, 'Kochi', 'KO', 1),
(1677, 107, 'Kumamoto', 'KU', 1),
(1678, 107, 'Kyoto', 'KY', 1),
(1679, 107, 'Mie', 'MI', 1),
(1680, 107, 'Miyagi', 'MY', 1),
(1681, 107, 'Miyazaki', 'MZ', 1),
(1682, 107, 'Nagano', 'NA', 1),
(1683, 107, 'Nagasaki', 'NG', 1),
(1684, 107, 'Nara', 'NR', 1),
(1685, 107, 'Niigata', 'NI', 1),
(1686, 107, 'Oita', 'OI', 1),
(1687, 107, 'Okayama', 'OK', 1),
(1688, 107, 'Okinawa', 'ON', 1),
(1689, 107, 'Osaka', 'OS', 1),
(1690, 107, 'Saga', 'SA', 1),
(1691, 107, 'Saitama', 'SI', 1),
(1692, 107, 'Shiga', 'SH', 1),
(1693, 107, 'Shimane', 'SM', 1),
(1694, 107, 'Shizuoka', 'SZ', 1),
(1695, 107, 'Tochigi', 'TO', 1),
(1696, 107, 'Tokushima', 'TS', 1),
(1697, 107, 'Tokyo', 'TK', 1),
(1698, 107, 'Tottori', 'TT', 1),
(1699, 107, 'Toyama', 'TY', 1),
(1700, 107, 'Wakayama', 'WA', 1),
(1701, 107, 'Yamagata', 'YA', 1),
(1702, 107, 'Yamaguchi', 'YM', 1),
(1703, 107, 'Yamanashi', 'YN', 1),
(1704, 108, '\'Amman', 'AM', 1),
(1705, 108, 'Ajlun', 'AJ', 1),
(1706, 108, 'Al \'Aqabah', 'AA', 1),
(1707, 108, 'Al Balqa\'', 'AB', 1),
(1708, 108, 'Al Karak', 'AK', 1),
(1709, 108, 'Al Mafraq', 'AL', 1),
(1710, 108, 'At Tafilah', 'AT', 1),
(1711, 108, 'Az Zarqa\'', 'AZ', 1),
(1712, 108, 'Irbid', 'IR', 1),
(1713, 108, 'Jarash', 'JA', 1),
(1714, 108, 'Ma\'an', 'MA', 1),
(1715, 108, 'Madaba', 'MD', 1),
(1716, 109, 'Almaty', 'AL', 1),
(1717, 109, 'Almaty City', 'AC', 1),
(1718, 109, 'Aqmola', 'AM', 1),
(1719, 109, 'Aqtobe', 'AQ', 1),
(1720, 109, 'Astana City', 'AS', 1),
(1721, 109, 'Atyrau', 'AT', 1),
(1722, 109, 'Batys Qazaqstan', 'BA', 1),
(1723, 109, 'Bayqongyr City', 'BY', 1),
(1724, 109, 'Mangghystau', 'MA', 1),
(1725, 109, 'Ongtustik Qazaqstan', 'ON', 1),
(1726, 109, 'Pavlodar', 'PA', 1),
(1727, 109, 'Qaraghandy', 'QA', 1),
(1728, 109, 'Qostanay', 'QO', 1),
(1729, 109, 'Qyzylorda', 'QY', 1),
(1730, 109, 'Shyghys Qazaqstan', 'SH', 1),
(1731, 109, 'Soltustik Qazaqstan', 'SO', 1),
(1732, 109, 'Zhambyl', 'ZH', 1),
(1733, 110, 'Central', 'CE', 1),
(1734, 110, 'Coast', 'CO', 1),
(1735, 110, 'Eastern', 'EA', 1),
(1736, 110, 'Nairobi Area', 'NA', 1),
(1737, 110, 'North Eastern', 'NE', 1),
(1738, 110, 'Nyanza', 'NY', 1),
(1739, 110, 'Rift Valley', 'RV', 1),
(1740, 110, 'Western', 'WE', 1),
(1741, 111, 'Abaiang', 'AG', 1),
(1742, 111, 'Abemama', 'AM', 1),
(1743, 111, 'Aranuka', 'AK', 1),
(1744, 111, 'Arorae', 'AO', 1),
(1745, 111, 'Banaba', 'BA', 1),
(1746, 111, 'Beru', 'BE', 1),
(1747, 111, 'Butaritari', 'bT', 1),
(1748, 111, 'Kanton', 'KA', 1),
(1749, 111, 'Kiritimati', 'KR', 1),
(1750, 111, 'Kuria', 'KU', 1),
(1751, 111, 'Maiana', 'MI', 1),
(1752, 111, 'Makin', 'MN', 1),
(1753, 111, 'Marakei', 'ME', 1),
(1754, 111, 'Nikunau', 'NI', 1),
(1755, 111, 'Nonouti', 'NO', 1),
(1756, 111, 'Onotoa', 'ON', 1),
(1757, 111, 'Tabiteuea', 'TT', 1),
(1758, 111, 'Tabuaeran', 'TR', 1),
(1759, 111, 'Tamana', 'TM', 1),
(1760, 111, 'Tarawa', 'TW', 1),
(1761, 111, 'Teraina', 'TE', 1),
(1762, 112, 'Chagang-do', 'CHA', 1),
(1763, 112, 'Hamgyong-bukto', 'HAB', 1),
(1764, 112, 'Hamgyong-namdo', 'HAN', 1),
(1765, 112, 'Hwanghae-bukto', 'HWB', 1),
(1766, 112, 'Hwanghae-namdo', 'HWN', 1),
(1767, 112, 'Kangwon-do', 'KAN', 1),
(1768, 112, 'P\'yongan-bukto', 'PYB', 1),
(1769, 112, 'P\'yongan-namdo', 'PYN', 1),
(1770, 112, 'Ryanggang-do (Yanggang-do)', 'YAN', 1),
(1771, 112, 'Rason Directly Governed City', 'NAJ', 1),
(1772, 112, 'P\'yongyang Special City', 'PYO', 1),
(1773, 113, 'Ch\'ungch\'ong-bukto', 'CO', 1),
(1774, 113, 'Ch\'ungch\'ong-namdo', 'CH', 1),
(1775, 113, 'Cheju-do', 'CD', 1),
(1776, 113, 'Cholla-bukto', 'CB', 1),
(1777, 113, 'Cholla-namdo', 'CN', 1),
(1778, 113, 'Inch\'on-gwangyoksi', 'IG', 1),
(1779, 113, 'Kangwon-do', 'KA', 1),
(1780, 113, 'Kwangju-gwangyoksi', 'KG', 1),
(1781, 113, 'Kyonggi-do', 'KD', 1),
(1782, 113, 'Kyongsang-bukto', 'KB', 1),
(1783, 113, 'Kyongsang-namdo', 'KN', 1),
(1784, 113, 'Pusan-gwangyoksi', 'PG', 1),
(1785, 113, 'Soul-t\'ukpyolsi', 'SO', 1),
(1786, 113, 'Taegu-gwangyoksi', 'TA', 1),
(1787, 113, 'Taejon-gwangyoksi', 'TG', 1),
(1788, 114, 'Al \'Asimah', 'AL', 1),
(1789, 114, 'Al Ahmadi', 'AA', 1),
(1790, 114, 'Al Farwaniyah', 'AF', 1),
(1791, 114, 'Al Jahra\'', 'AJ', 1),
(1792, 114, 'Hawalli', 'HA', 1),
(1793, 115, 'Bishkek', 'GB', 1),
(1794, 115, 'Batken', 'B', 1),
(1795, 115, 'Chu', 'C', 1),
(1796, 115, 'Jalal-Abad', 'J', 1),
(1797, 115, 'Naryn', 'N', 1),
(1798, 115, 'Osh', 'O', 1),
(1799, 115, 'Talas', 'T', 1),
(1800, 115, 'Ysyk-Kol', 'Y', 1),
(1801, 116, 'Vientiane', 'VT', 1),
(1802, 116, 'Attapu', 'AT', 1),
(1803, 116, 'Bokeo', 'BK', 1),
(1804, 116, 'Bolikhamxai', 'BL', 1),
(1805, 116, 'Champasak', 'CH', 1),
(1806, 116, 'Houaphan', 'HO', 1),
(1807, 116, 'Khammouan', 'KH', 1),
(1808, 116, 'Louang Namtha', 'LM', 1),
(1809, 116, 'Louangphabang', 'LP', 1),
(1810, 116, 'Oudomxai', 'OU', 1),
(1811, 116, 'Phongsali', 'PH', 1),
(1812, 116, 'Salavan', 'SL', 1),
(1813, 116, 'Savannakhet', 'SV', 1),
(1814, 116, 'Vientiane', 'VI', 1),
(1815, 116, 'Xaignabouli', 'XA', 1),
(1816, 116, 'Xekong', 'XE', 1),
(1817, 116, 'Xiangkhoang', 'XI', 1),
(1818, 116, 'Xaisomboun', 'XN', 1),
(1852, 119, 'Berea', 'BE', 1),
(1853, 119, 'Butha-Buthe', 'BB', 1),
(1854, 119, 'Leribe', 'LE', 1),
(1855, 119, 'Mafeteng', 'MF', 1),
(1856, 119, 'Maseru', 'MS', 1),
(1857, 119, 'Mohale\'s Hoek', 'MH', 1),
(1858, 119, 'Mokhotlong', 'MK', 1),
(1859, 119, 'Qacha\'s Nek', 'QN', 1),
(1860, 119, 'Quthing', 'QT', 1),
(1861, 119, 'Thaba-Tseka', 'TT', 1),
(1862, 120, 'Bomi', 'BI', 1),
(1863, 120, 'Bong', 'BG', 1),
(1864, 120, 'Grand Bassa', 'GB', 1),
(1865, 120, 'Grand Cape Mount', 'CM', 1),
(1866, 120, 'Grand Gedeh', 'GG', 1),
(1867, 120, 'Grand Kru', 'GK', 1),
(1868, 120, 'Lofa', 'LO', 1),
(1869, 120, 'Margibi', 'MG', 1),
(1870, 120, 'Maryland', 'ML', 1),
(1871, 120, 'Montserrado', 'MS', 1),
(1872, 120, 'Nimba', 'NB', 1),
(1873, 120, 'River Cess', 'RC', 1),
(1874, 120, 'Sinoe', 'SN', 1),
(1875, 121, 'Ajdabiya', 'AJ', 1),
(1876, 121, 'Al \'Aziziyah', 'AZ', 1),
(1877, 121, 'Al Fatih', 'FA', 1),
(1878, 121, 'Al Jabal al Akhdar', 'JA', 1),
(1879, 121, 'Al Jufrah', 'JU', 1),
(1880, 121, 'Al Khums', 'KH', 1),
(1881, 121, 'Al Kufrah', 'KU', 1),
(1882, 121, 'An Nuqat al Khams', 'NK', 1),
(1883, 121, 'Ash Shati\'', 'AS', 1),
(1884, 121, 'Awbari', 'AW', 1),
(1885, 121, 'Az Zawiyah', 'ZA', 1),
(1886, 121, 'Banghazi', 'BA', 1),
(1887, 121, 'Darnah', 'DA', 1),
(1888, 121, 'Ghadamis', 'GD', 1),
(1889, 121, 'Gharyan', 'GY', 1),
(1890, 121, 'Misratah', 'MI', 1),
(1891, 121, 'Murzuq', 'MZ', 1),
(1892, 121, 'Sabha', 'SB', 1),
(1893, 121, 'Sawfajjin', 'SW', 1),
(1894, 121, 'Surt', 'SU', 1),
(1895, 121, 'Tarabulus (Tripoli)', 'TL', 1),
(1896, 121, 'Tarhunah', 'TH', 1),
(1897, 121, 'Tubruq', 'TU', 1),
(1898, 121, 'Yafran', 'YA', 1),
(1899, 121, 'Zlitan', 'ZL', 1),
(1900, 122, 'Vaduz', 'V', 1),
(1901, 122, 'Schaan', 'A', 1),
(1902, 122, 'Balzers', 'B', 1),
(1903, 122, 'Triesen', 'N', 1),
(1904, 122, 'Eschen', 'E', 1),
(1905, 122, 'Mauren', 'M', 1),
(1906, 122, 'Triesenberg', 'T', 1),
(1907, 122, 'Ruggell', 'R', 1),
(1908, 122, 'Gamprin', 'G', 1),
(1909, 122, 'Schellenberg', 'L', 1),
(1910, 122, 'Planken', 'P', 1),
(1911, 123, 'Alytus', 'AL', 1),
(1912, 123, 'Kaunas', 'KA', 1),
(1913, 123, 'Klaipeda', 'KL', 1),
(1914, 123, 'Marijampole', 'MA', 1),
(1915, 123, 'Panevezys', 'PA', 1),
(1916, 123, 'Siauliai', 'SI', 1),
(1917, 123, 'Taurage', 'TA', 1),
(1918, 123, 'Telsiai', 'TE', 1),
(1919, 123, 'Utena', 'UT', 1),
(1920, 123, 'Vilnius', 'VI', 1),
(1921, 124, 'Diekirch', 'DD', 1),
(1922, 124, 'Clervaux', 'DC', 1),
(1923, 124, 'Redange', 'DR', 1),
(1924, 124, 'Vianden', 'DV', 1),
(1925, 124, 'Wiltz', 'DW', 1),
(1926, 124, 'Grevenmacher', 'GG', 1),
(1927, 124, 'Echternach', 'GE', 1),
(1928, 124, 'Remich', 'GR', 1),
(1929, 124, 'Luxembourg', 'LL', 1),
(1930, 124, 'Capellen', 'LC', 1),
(1931, 124, 'Esch-sur-Alzette', 'LE', 1),
(1932, 124, 'Mersch', 'LM', 1),
(1933, 125, 'Our Lady Fatima Parish', 'OLF', 1),
(1934, 125, 'St. Anthony Parish', 'ANT', 1),
(1935, 125, 'St. Lazarus Parish', 'LAZ', 1),
(1936, 125, 'Cathedral Parish', 'CAT', 1),
(1937, 125, 'St. Lawrence Parish', 'LAW', 1),
(1938, 127, 'Antananarivo', 'AN', 1),
(1939, 127, 'Antsiranana', 'AS', 1),
(1940, 127, 'Fianarantsoa', 'FN', 1),
(1941, 127, 'Mahajanga', 'MJ', 1),
(1942, 127, 'Toamasina', 'TM', 1),
(1943, 127, 'Toliara', 'TL', 1),
(1944, 128, 'Balaka', 'BLK', 1),
(1945, 128, 'Blantyre', 'BLT', 1),
(1946, 128, 'Chikwawa', 'CKW', 1),
(1947, 128, 'Chiradzulu', 'CRD', 1),
(1948, 128, 'Chitipa', 'CTP', 1),
(1949, 128, 'Dedza', 'DDZ', 1),
(1950, 128, 'Dowa', 'DWA', 1),
(1951, 128, 'Karonga', 'KRG', 1),
(1952, 128, 'Kasungu', 'KSG', 1),
(1953, 128, 'Likoma', 'LKM', 1),
(1954, 128, 'Lilongwe', 'LLG', 1),
(1955, 128, 'Machinga', 'MCG', 1),
(1956, 128, 'Mangochi', 'MGC', 1),
(1957, 128, 'Mchinji', 'MCH', 1),
(1958, 128, 'Mulanje', 'MLJ', 1),
(1959, 128, 'Mwanza', 'MWZ', 1),
(1960, 128, 'Mzimba', 'MZM', 1),
(1961, 128, 'Ntcheu', 'NTU', 1),
(1962, 128, 'Nkhata Bay', 'NKB', 1),
(1963, 128, 'Nkhotakota', 'NKH', 1),
(1964, 128, 'Nsanje', 'NSJ', 1),
(1965, 128, 'Ntchisi', 'NTI', 1),
(1966, 128, 'Phalombe', 'PHL', 1),
(1967, 128, 'Rumphi', 'RMP', 1),
(1968, 128, 'Salima', 'SLM', 1),
(1969, 128, 'Thyolo', 'THY', 1),
(1970, 128, 'Zomba', 'ZBA', 1),
(1971, 129, 'Johor', 'MY-01', 1),
(1972, 129, 'Kedah', 'MY-02', 1),
(1973, 129, 'Kelantan', 'MY-03', 1),
(1974, 129, 'Labuan', 'MY-15', 1),
(1975, 129, 'Melaka', 'MY-04', 1),
(1976, 129, 'Negeri Sembilan', 'MY-05', 1),
(1977, 129, 'Pahang', 'MY-06', 1),
(1978, 129, 'Perak', 'MY-08', 1),
(1979, 129, 'Perlis', 'MY-09', 1),
(1980, 129, 'Pulau Pinang', 'MY-07', 1),
(1981, 129, 'Sabah', 'MY-12', 1),
(1982, 129, 'Sarawak', 'MY-13', 1),
(1983, 129, 'Selangor', 'MY-10', 1),
(1984, 129, 'Terengganu', 'MY-11', 1),
(1985, 129, 'Kuala Lumpur', 'MY-14', 1),
(4035, 129, 'Putrajaya', 'MY-16', 1),
(1986, 130, 'Thiladhunmathi Uthuru', 'THU', 1),
(1987, 130, 'Thiladhunmathi Dhekunu', 'THD', 1),
(1988, 130, 'Miladhunmadulu Uthuru', 'MLU', 1),
(1989, 130, 'Miladhunmadulu Dhekunu', 'MLD', 1),
(1990, 130, 'Maalhosmadulu Uthuru', 'MAU', 1),
(1991, 130, 'Maalhosmadulu Dhekunu', 'MAD', 1),
(1992, 130, 'Faadhippolhu', 'FAA', 1),
(1993, 130, 'Male Atoll', 'MAA', 1),
(1994, 130, 'Ari Atoll Uthuru', 'AAU', 1),
(1995, 130, 'Ari Atoll Dheknu', 'AAD', 1),
(1996, 130, 'Felidhe Atoll', 'FEA', 1),
(1997, 130, 'Mulaku Atoll', 'MUA', 1),
(1998, 130, 'Nilandhe Atoll Uthuru', 'NAU', 1),
(1999, 130, 'Nilandhe Atoll Dhekunu', 'NAD', 1),
(2000, 130, 'Kolhumadulu', 'KLH', 1),
(2001, 130, 'Hadhdhunmathi', 'HDH', 1),
(2002, 130, 'Huvadhu Atoll Uthuru', 'HAU', 1),
(2003, 130, 'Huvadhu Atoll Dhekunu', 'HAD', 1),
(2004, 130, 'Fua Mulaku', 'FMU', 1),
(2005, 130, 'Addu', 'ADD', 1),
(2006, 131, 'Gao', 'GA', 1),
(2007, 131, 'Kayes', 'KY', 1),
(2008, 131, 'Kidal', 'KD', 1),
(2009, 131, 'Koulikoro', 'KL', 1),
(2010, 131, 'Mopti', 'MP', 1),
(2011, 131, 'Segou', 'SG', 1),
(2012, 131, 'Sikasso', 'SK', 1),
(2013, 131, 'Tombouctou', 'TB', 1),
(2014, 131, 'Bamako Capital District', 'CD', 1),
(2015, 132, 'Attard', 'ATT', 1),
(2016, 132, 'Balzan', 'BAL', 1),
(2017, 132, 'Birgu', 'BGU', 1),
(2018, 132, 'Birkirkara', 'BKK', 1),
(2019, 132, 'Birzebbuga', 'BRZ', 1),
(2020, 132, 'Bormla', 'BOR', 1),
(2021, 132, 'Dingli', 'DIN', 1),
(2022, 132, 'Fgura', 'FGU', 1),
(2023, 132, 'Floriana', 'FLO', 1),
(2024, 132, 'Gudja', 'GDJ', 1),
(2025, 132, 'Gzira', 'GZR', 1),
(2026, 132, 'Gargur', 'GRG', 1),
(2027, 132, 'Gaxaq', 'GXQ', 1),
(2028, 132, 'Hamrun', 'HMR', 1),
(2029, 132, 'Iklin', 'IKL', 1),
(2030, 132, 'Isla', 'ISL', 1),
(2031, 132, 'Kalkara', 'KLK', 1),
(2032, 132, 'Kirkop', 'KRK', 1),
(2033, 132, 'Lija', 'LIJ', 1),
(2034, 132, 'Luqa', 'LUQ', 1),
(2035, 132, 'Marsa', 'MRS', 1),
(2036, 132, 'Marsaskala', 'MKL', 1),
(2037, 132, 'Marsaxlokk', 'MXL', 1),
(2038, 132, 'Mdina', 'MDN', 1),
(2039, 132, 'Melliea', 'MEL', 1),
(2040, 132, 'Mgarr', 'MGR', 1),
(2041, 132, 'Mosta', 'MST', 1),
(2042, 132, 'Mqabba', 'MQA', 1),
(2043, 132, 'Msida', 'MSI', 1),
(2044, 132, 'Mtarfa', 'MTF', 1),
(2045, 132, 'Naxxar', 'NAX', 1),
(2046, 132, 'Paola', 'PAO', 1),
(2047, 132, 'Pembroke', 'PEM', 1),
(2048, 132, 'Pieta', 'PIE', 1),
(2049, 132, 'Qormi', 'QOR', 1),
(2050, 132, 'Qrendi', 'QRE', 1),
(2051, 132, 'Rabat', 'RAB', 1),
(2052, 132, 'Safi', 'SAF', 1),
(2053, 132, 'San Giljan', 'SGI', 1),
(2054, 132, 'Santa Lucija', 'SLU', 1),
(2055, 132, 'San Pawl il-Bahar', 'SPB', 1),
(2056, 132, 'San Gwann', 'SGW', 1),
(2057, 132, 'Santa Venera', 'SVE', 1),
(2058, 132, 'Siggiewi', 'SIG', 1),
(2059, 132, 'Sliema', 'SLM', 1),
(2060, 132, 'Swieqi', 'SWQ', 1),
(2061, 132, 'Ta Xbiex', 'TXB', 1),
(2062, 132, 'Tarxien', 'TRX', 1),
(2063, 132, 'Valletta', 'VLT', 1),
(2064, 132, 'Xgajra', 'XGJ', 1),
(2065, 132, 'Zabbar', 'ZBR', 1),
(2066, 132, 'Zebbug', 'ZBG', 1),
(2067, 132, 'Zejtun', 'ZJT', 1),
(2068, 132, 'Zurrieq', 'ZRQ', 1),
(2069, 132, 'Fontana', 'FNT', 1),
(2070, 132, 'Ghajnsielem', 'GHJ', 1),
(2071, 132, 'Gharb', 'GHR', 1),
(2072, 132, 'Ghasri', 'GHS', 1),
(2073, 132, 'Kercem', 'KRC', 1),
(2074, 132, 'Munxar', 'MUN', 1),
(2075, 132, 'Nadur', 'NAD', 1),
(2076, 132, 'Qala', 'QAL', 1),
(2077, 132, 'Victoria', 'VIC', 1),
(2078, 132, 'San Lawrenz', 'SLA', 1),
(2079, 132, 'Sannat', 'SNT', 1),
(2080, 132, 'Xagra', 'ZAG', 1),
(2081, 132, 'Xewkija', 'XEW', 1),
(2082, 132, 'Zebbug', 'ZEB', 1),
(2083, 133, 'Ailinginae', 'ALG', 1),
(2084, 133, 'Ailinglaplap', 'ALL', 1),
(2085, 133, 'Ailuk', 'ALK', 1),
(2086, 133, 'Arno', 'ARN', 1),
(2087, 133, 'Aur', 'AUR', 1),
(2088, 133, 'Bikar', 'BKR', 1),
(2089, 133, 'Bikini', 'BKN', 1),
(2090, 133, 'Bokak', 'BKK', 1),
(2091, 133, 'Ebon', 'EBN', 1),
(2092, 133, 'Enewetak', 'ENT', 1),
(2093, 133, 'Erikub', 'EKB', 1),
(2094, 133, 'Jabat', 'JBT', 1),
(2095, 133, 'Jaluit', 'JLT', 1),
(2096, 133, 'Jemo', 'JEM', 1),
(2097, 133, 'Kili', 'KIL', 1),
(2098, 133, 'Kwajalein', 'KWJ', 1),
(2099, 133, 'Lae', 'LAE', 1),
(2100, 133, 'Lib', 'LIB', 1),
(2101, 133, 'Likiep', 'LKP', 1),
(2102, 133, 'Majuro', 'MJR', 1),
(2103, 133, 'Maloelap', 'MLP', 1),
(2104, 133, 'Mejit', 'MJT', 1),
(2105, 133, 'Mili', 'MIL', 1),
(2106, 133, 'Namorik', 'NMK', 1),
(2107, 133, 'Namu', 'NAM', 1),
(2108, 133, 'Rongelap', 'RGL', 1),
(2109, 133, 'Rongrik', 'RGK', 1),
(2110, 133, 'Toke', 'TOK', 1),
(2111, 133, 'Ujae', 'UJA', 1),
(2112, 133, 'Ujelang', 'UJL', 1),
(2113, 133, 'Utirik', 'UTK', 1),
(2114, 133, 'Wotho', 'WTH', 1),
(2115, 133, 'Wotje', 'WTJ', 1),
(2116, 135, 'Adrar', 'AD', 1),
(2117, 135, 'Assaba', 'AS', 1),
(2118, 135, 'Brakna', 'BR', 1),
(2119, 135, 'Dakhlet Nouadhibou', 'DN', 1),
(2120, 135, 'Gorgol', 'GO', 1),
(2121, 135, 'Guidimaka', 'GM', 1),
(2122, 135, 'Hodh Ech Chargui', 'HC', 1),
(2123, 135, 'Hodh El Gharbi', 'HG', 1),
(2124, 135, 'Inchiri', 'IN', 1),
(2125, 135, 'Tagant', 'TA', 1),
(2126, 135, 'Tiris Zemmour', 'TZ', 1),
(2127, 135, 'Trarza', 'TR', 1),
(2128, 135, 'Nouakchott', 'NO', 1),
(2129, 136, 'Beau Bassin-Rose Hill', 'BR', 1),
(2130, 136, 'Curepipe', 'CU', 1),
(2131, 136, 'Port Louis', 'PU', 1),
(2132, 136, 'Quatre Bornes', 'QB', 1),
(2133, 136, 'Vacoas-Phoenix', 'VP', 1),
(2134, 136, 'Agalega Islands', 'AG', 1),
(2135, 136, 'Cargados Carajos Shoals (Saint Brandon Islands)', 'CC', 1),
(2136, 136, 'Rodrigues', 'RO', 1),
(2137, 136, 'Black River', 'BL', 1),
(2138, 136, 'Flacq', 'FL', 1),
(2139, 136, 'Grand Port', 'GP', 1),
(2140, 136, 'Moka', 'MO', 1),
(2141, 136, 'Pamplemousses', 'PA', 1),
(2142, 136, 'Plaines Wilhems', 'PW', 1),
(2143, 136, 'Port Louis', 'PL', 1),
(2144, 136, 'Riviere du Rempart', 'RR', 1),
(2145, 136, 'Savanne', 'SA', 1),
(2146, 138, 'Baja California Norte', 'BN', 1),
(2147, 138, 'Baja California Sur', 'BS', 1),
(2148, 138, 'Campeche', 'CA', 1),
(2149, 138, 'Chiapas', 'CI', 1),
(2150, 138, 'Chihuahua', 'CH', 1),
(2151, 138, 'Coahuila de Zaragoza', 'CZ', 1),
(2152, 138, 'Colima', 'CL', 1),
(2153, 138, 'Distrito Federal', 'DF', 1),
(2154, 138, 'Durango', 'DU', 1),
(2155, 138, 'Guanajuato', 'GA', 1),
(2156, 138, 'Guerrero', 'GE', 1),
(2157, 138, 'Hidalgo', 'HI', 1),
(2158, 138, 'Jalisco', 'JA', 1),
(2159, 138, 'Mexico', 'ME', 1),
(2160, 138, 'Michoacan de Ocampo', 'MI', 1),
(2161, 138, 'Morelos', 'MO', 1),
(2162, 138, 'Nayarit', 'NA', 1),
(2163, 138, 'Nuevo Leon', 'NL', 1),
(2164, 138, 'Oaxaca', 'OA', 1),
(2165, 138, 'Puebla', 'PU', 1),
(2166, 138, 'Queretaro de Arteaga', 'QA', 1),
(2167, 138, 'Quintana Roo', 'QR', 1),
(2168, 138, 'San Luis Potosi', 'SA', 1),
(2169, 138, 'Sinaloa', 'SI', 1),
(2170, 138, 'Sonora', 'SO', 1),
(2171, 138, 'Tabasco', 'TB', 1),
(2172, 138, 'Tamaulipas', 'TM', 1),
(2173, 138, 'Tlaxcala', 'TL', 1),
(2174, 138, 'Veracruz-Llave', 'VE', 1),
(2175, 138, 'Yucatan', 'YU', 1),
(2176, 138, 'Zacatecas', 'ZA', 1),
(2177, 139, 'Chuuk', 'C', 1),
(2178, 139, 'Kosrae', 'K', 1),
(2179, 139, 'Pohnpei', 'P', 1),
(2180, 139, 'Yap', 'Y', 1),
(2181, 140, 'Gagauzia', 'GA', 1),
(2182, 140, 'Chisinau', 'CU', 1),
(2183, 140, 'Balti', 'BA', 1),
(2184, 140, 'Cahul', 'CA', 1),
(2185, 140, 'Edinet', 'ED', 1),
(2186, 140, 'Lapusna', 'LA', 1),
(2187, 140, 'Orhei', 'OR', 1),
(2188, 140, 'Soroca', 'SO', 1),
(2189, 140, 'Tighina', 'TI', 1),
(2190, 140, 'Ungheni', 'UN', 1),
(2191, 140, 'St‚nga Nistrului', 'SN', 1),
(2192, 141, 'Fontvieille', 'FV', 1),
(2193, 141, 'La Condamine', 'LC', 1),
(2194, 141, 'Monaco-Ville', 'MV', 1),
(2195, 141, 'Monte-Carlo', 'MC', 1),
(2196, 142, 'Ulanbaatar', '1', 1),
(2197, 142, 'Orhon', '035', 1),
(2198, 142, 'Darhan uul', '037', 1),
(2199, 142, 'Hentiy', '039', 1),
(2200, 142, 'Hovsgol', '041', 1),
(2201, 142, 'Hovd', '043', 1),
(2202, 142, 'Uvs', '046', 1),
(2203, 142, 'Tov', '047', 1),
(2204, 142, 'Selenge', '049', 1),
(2205, 142, 'Suhbaatar', '051', 1),
(2206, 142, 'Omnogovi', '053', 1),
(2207, 142, 'Ovorhangay', '055', 1),
(2208, 142, 'Dzavhan', '057', 1),
(2209, 142, 'DundgovL', '059', 1),
(2210, 142, 'Dornod', '061', 1),
(2211, 142, 'Dornogov', '063', 1),
(2212, 142, 'Govi-Sumber', '064', 1),
(2213, 142, 'Govi-Altay', '065', 1),
(2214, 142, 'Bulgan', '067', 1),
(2215, 142, 'Bayanhongor', '069', 1),
(2216, 142, 'Bayan-Olgiy', '071', 1),
(2217, 142, 'Arhangay', '073', 1),
(2218, 143, 'Saint Anthony', 'A', 1),
(2219, 143, 'Saint Georges', 'G', 1),
(2220, 143, 'Saint Peter', 'P', 1),
(2221, 144, 'Agadir', 'AGD', 1),
(2222, 144, 'Al Hoceima', 'HOC', 1),
(2223, 144, 'Azilal', 'AZI', 1),
(2224, 144, 'Beni Mellal', 'BME', 1),
(2225, 144, 'Ben Slimane', 'BSL', 1),
(2226, 144, 'Boulemane', 'BLM', 1),
(2227, 144, 'Casablanca', 'CBL', 1),
(2228, 144, 'Chaouen', 'CHA', 1),
(2229, 144, 'El Jadida', 'EJA', 1),
(2230, 144, 'El Kelaa des Sraghna', 'EKS', 1),
(2231, 144, 'Er Rachidia', 'ERA', 1),
(2232, 144, 'Essaouira', 'ESS', 1),
(2233, 144, 'Fes', 'FES', 1),
(2234, 144, 'Figuig', 'FIG', 1),
(2235, 144, 'Guelmim', 'GLM', 1),
(2236, 144, 'Ifrane', 'IFR', 1),
(2237, 144, 'Kenitra', 'KEN', 1),
(2238, 144, 'Khemisset', 'KHM', 1),
(2239, 144, 'Khenifra', 'KHN', 1),
(2240, 144, 'Khouribga', 'KHO', 1),
(2241, 144, 'Laayoune', 'LYN', 1),
(2242, 144, 'Larache', 'LAR', 1),
(2243, 144, 'Marrakech', 'MRK', 1),
(2244, 144, 'Meknes', 'MKN', 1),
(2245, 144, 'Nador', 'NAD', 1),
(2246, 144, 'Ouarzazate', 'ORZ', 1),
(2247, 144, 'Oujda', 'OUJ', 1),
(2248, 144, 'Rabat-Sale', 'RSA', 1),
(2249, 144, 'Safi', 'SAF', 1),
(2250, 144, 'Settat', 'SET', 1),
(2251, 144, 'Sidi Kacem', 'SKA', 1),
(2252, 144, 'Tangier', 'TGR', 1),
(2253, 144, 'Tan-Tan', 'TAN', 1),
(2254, 144, 'Taounate', 'TAO', 1),
(2255, 144, 'Taroudannt', 'TRD', 1),
(2256, 144, 'Tata', 'TAT', 1),
(2257, 144, 'Taza', 'TAZ', 1),
(2258, 144, 'Tetouan', 'TET', 1),
(2259, 144, 'Tiznit', 'TIZ', 1),
(2260, 144, 'Ad Dakhla', 'ADK', 1),
(2261, 144, 'Boujdour', 'BJD', 1),
(2262, 144, 'Es Smara', 'ESM', 1),
(2263, 145, 'Cabo Delgado', 'CD', 1),
(2264, 145, 'Gaza', 'GZ', 1),
(2265, 145, 'Inhambane', 'IN', 1),
(2266, 145, 'Manica', 'MN', 1),
(2267, 145, 'Maputo (city)', 'MC', 1),
(2268, 145, 'Maputo', 'MP', 1),
(2269, 145, 'Nampula', 'NA', 1),
(2270, 145, 'Niassa', 'NI', 1),
(2271, 145, 'Sofala', 'SO', 1),
(2272, 145, 'Tete', 'TE', 1),
(2273, 145, 'Zambezia', 'ZA', 1),
(2274, 146, 'Ayeyarwady', 'AY', 1),
(2275, 146, 'Bago', 'BG', 1),
(2276, 146, 'Magway', 'MG', 1),
(2277, 146, 'Mandalay', 'MD', 1),
(2278, 146, 'Sagaing', 'SG', 1),
(2279, 146, 'Tanintharyi', 'TN', 1),
(2280, 146, 'Yangon', 'YG', 1),
(2281, 146, 'Chin State', 'CH', 1),
(2282, 146, 'Kachin State', 'KC', 1),
(2283, 146, 'Kayah State', 'KH', 1),
(2284, 146, 'Kayin State', 'KN', 1),
(2285, 146, 'Mon State', 'MN', 1),
(2286, 146, 'Rakhine State', 'RK', 1),
(2287, 146, 'Shan State', 'SH', 1),
(2288, 147, 'Caprivi', 'CA', 1),
(2289, 147, 'Erongo', 'ER', 1),
(2290, 147, 'Hardap', 'HA', 1),
(2291, 147, 'Karas', 'KR', 1),
(2292, 147, 'Kavango', 'KV', 1),
(2293, 147, 'Khomas', 'KH', 1),
(2294, 147, 'Kunene', 'KU', 1),
(2295, 147, 'Ohangwena', 'OW', 1),
(2296, 147, 'Omaheke', 'OK', 1),
(2297, 147, 'Omusati', 'OT', 1),
(2298, 147, 'Oshana', 'ON', 1),
(2299, 147, 'Oshikoto', 'OO', 1),
(2300, 147, 'Otjozondjupa', 'OJ', 1),
(2301, 148, 'Aiwo', 'AO', 1),
(2302, 148, 'Anabar', 'AA', 1),
(2303, 148, 'Anetan', 'AT', 1),
(2304, 148, 'Anibare', 'AI', 1),
(2305, 148, 'Baiti', 'BA', 1),
(2306, 148, 'Boe', 'BO', 1),
(2307, 148, 'Buada', 'BU', 1),
(2308, 148, 'Denigomodu', 'DE', 1),
(2309, 148, 'Ewa', 'EW', 1),
(2310, 148, 'Ijuw', 'IJ', 1),
(2311, 148, 'Meneng', 'ME', 1),
(2312, 148, 'Nibok', 'NI', 1),
(2313, 148, 'Uaboe', 'UA', 1),
(2314, 148, 'Yaren', 'YA', 1),
(2315, 149, 'Bagmati', 'BA', 1),
(2316, 149, 'Bheri', 'BH', 1),
(2317, 149, 'Dhawalagiri', 'DH', 1),
(2318, 149, 'Gandaki', 'GA', 1),
(2319, 149, 'Janakpur', 'JA', 1),
(2320, 149, 'Karnali', 'KA', 1),
(2321, 149, 'Kosi', 'KO', 1),
(2322, 149, 'Lumbini', 'LU', 1),
(2323, 149, 'Mahakali', 'MA', 1),
(2324, 149, 'Mechi', 'ME', 1),
(2325, 149, 'Narayani', 'NA', 1),
(2326, 149, 'Rapti', 'RA', 1),
(2327, 149, 'Sagarmatha', 'SA', 1),
(2328, 149, 'Seti', 'SE', 1),
(2329, 150, 'Drenthe', 'DR', 1),
(2330, 150, 'Flevoland', 'FL', 1),
(2331, 150, 'Friesland', 'FR', 1),
(2332, 150, 'Gelderland', 'GE', 1),
(2333, 150, 'Groningen', 'GR', 1),
(2334, 150, 'Limburg', 'LI', 1),
(2335, 150, 'Noord-Brabant', 'NB', 1),
(2336, 150, 'Noord-Holland', 'NH', 1),
(2337, 150, 'Overijssel', 'OV', 1),
(2338, 150, 'Utrecht', 'UT', 1),
(2339, 150, 'Zeeland', 'ZE', 1),
(2340, 150, 'Zuid-Holland', 'ZH', 1),
(2341, 152, 'Iles Loyaute', 'L', 1),
(2342, 152, 'Nord', 'N', 1),
(2343, 152, 'Sud', 'S', 1),
(2344, 153, 'Auckland', 'AUK', 1),
(2345, 153, 'Bay of Plenty', 'BOP', 1),
(2346, 153, 'Canterbury', 'CAN', 1),
(2347, 153, 'Coromandel', 'COR', 1),
(2348, 153, 'Gisborne', 'GIS', 1),
(2349, 153, 'Fiordland', 'FIO', 1),
(2350, 153, 'Hawke\'s Bay', 'HKB', 1),
(2351, 153, 'Marlborough', 'MBH', 1),
(2352, 153, 'Manawatu-Wanganui', 'MWT', 1),
(2353, 153, 'Mt Cook-Mackenzie', 'MCM', 1),
(2354, 153, 'Nelson', 'NSN', 1),
(2355, 153, 'Northland', 'NTL', 1),
(2356, 153, 'Otago', 'OTA', 1),
(2357, 153, 'Southland', 'STL', 1),
(2358, 153, 'Taranaki', 'TKI', 1),
(2359, 153, 'Wellington', 'WGN', 1),
(2360, 153, 'Waikato', 'WKO', 1),
(2361, 153, 'Wairarapa', 'WAI', 1),
(2362, 153, 'West Coast', 'WTC', 1),
(2363, 154, 'Atlantico Norte', 'AN', 1),
(2364, 154, 'Atlantico Sur', 'AS', 1),
(2365, 154, 'Boaco', 'BO', 1),
(2366, 154, 'Carazo', 'CA', 1),
(2367, 154, 'Chinandega', 'CI', 1),
(2368, 154, 'Chontales', 'CO', 1),
(2369, 154, 'Esteli', 'ES', 1),
(2370, 154, 'Granada', 'GR', 1),
(2371, 154, 'Jinotega', 'JI', 1),
(2372, 154, 'Leon', 'LE', 1),
(2373, 154, 'Madriz', 'MD', 1),
(2374, 154, 'Managua', 'MN', 1),
(2375, 154, 'Masaya', 'MS', 1),
(2376, 154, 'Matagalpa', 'MT', 1),
(2377, 154, 'Nuevo Segovia', 'NS', 1),
(2378, 154, 'Rio San Juan', 'RS', 1),
(2379, 154, 'Rivas', 'RI', 1),
(2380, 155, 'Agadez', 'AG', 1),
(2381, 155, 'Diffa', 'DF', 1),
(2382, 155, 'Dosso', 'DS', 1),
(2383, 155, 'Maradi', 'MA', 1),
(2384, 155, 'Niamey', 'NM', 1),
(2385, 155, 'Tahoua', 'TH', 1),
(2386, 155, 'Tillaberi', 'TL', 1),
(2387, 155, 'Zinder', 'ZD', 1),
(2388, 156, 'Abia', 'AB', 1),
(2389, 156, 'Abuja Federal Capital Territory', 'CT', 1),
(2390, 156, 'Adamawa', 'AD', 1),
(2391, 156, 'Akwa Ibom', 'AK', 1),
(2392, 156, 'Anambra', 'AN', 1),
(2393, 156, 'Bauchi', 'BC', 1),
(2394, 156, 'Bayelsa', 'BY', 1),
(2395, 156, 'Benue', 'BN', 1),
(2396, 156, 'Borno', 'BO', 1),
(2397, 156, 'Cross River', 'CR', 1),
(2398, 156, 'Delta', 'DE', 1),
(2399, 156, 'Ebonyi', 'EB', 1),
(2400, 156, 'Edo', 'ED', 1),
(2401, 156, 'Ekiti', 'EK', 1),
(2402, 156, 'Enugu', 'EN', 1),
(2403, 156, 'Gombe', 'GO', 1),
(2404, 156, 'Imo', 'IM', 1),
(2405, 156, 'Jigawa', 'JI', 1),
(2406, 156, 'Kaduna', 'KD', 1),
(2407, 156, 'Kano', 'KN', 1),
(2408, 156, 'Katsina', 'KT', 1),
(2409, 156, 'Kebbi', 'KE', 1),
(2410, 156, 'Kogi', 'KO', 1),
(2411, 156, 'Kwara', 'KW', 1),
(2412, 156, 'Lagos', 'LA', 1),
(2413, 156, 'Nassarawa', 'NA', 1),
(2414, 156, 'Niger', 'NI', 1),
(2415, 156, 'Ogun', 'OG', 1),
(2416, 156, 'Ondo', 'ONG', 1),
(2417, 156, 'Osun', 'OS', 1),
(2418, 156, 'Oyo', 'OY', 1),
(2419, 156, 'Plateau', 'PL', 1),
(2420, 156, 'Rivers', 'RI', 1),
(2421, 156, 'Sokoto', 'SO', 1),
(2422, 156, 'Taraba', 'TA', 1),
(2423, 156, 'Yobe', 'YO', 1),
(2424, 156, 'Zamfara', 'ZA', 1),
(2425, 159, 'Northern Islands', 'N', 1),
(2426, 159, 'Rota', 'R', 1),
(2427, 159, 'Saipan', 'S', 1),
(2428, 159, 'Tinian', 'T', 1),
(2429, 160, 'Akershus', 'AK', 1),
(2430, 160, 'Aust-Agder', 'AA', 1),
(2431, 160, 'Buskerud', 'BU', 1),
(2432, 160, 'Finnmark', 'FM', 1),
(2433, 160, 'Hedmark', 'HM', 1),
(2434, 160, 'Hordaland', 'HL', 1),
(2435, 160, 'More og Romdal', 'MR', 1),
(2436, 160, 'Nord-Trondelag', 'NT', 1),
(2437, 160, 'Nordland', 'NL', 1),
(2438, 160, 'Ostfold', 'OF', 1),
(2439, 160, 'Oppland', 'OP', 1),
(2440, 160, 'Oslo', 'OL', 1),
(2441, 160, 'Rogaland', 'RL', 1),
(2442, 160, 'Sor-Trondelag', 'ST', 1),
(2443, 160, 'Sogn og Fjordane', 'SJ', 1),
(2444, 160, 'Svalbard', 'SV', 1),
(2445, 160, 'Telemark', 'TM', 1),
(2446, 160, 'Troms', 'TR', 1),
(2447, 160, 'Vest-Agder', 'VA', 1),
(2448, 160, 'Vestfold', 'VF', 1),
(2449, 161, 'Ad Dakhiliyah', 'DA', 1),
(2450, 161, 'Al Batinah', 'BA', 1),
(2451, 161, 'Al Wusta', 'WU', 1),
(2452, 161, 'Ash Sharqiyah', 'SH', 1),
(2453, 161, 'Az Zahirah', 'ZA', 1),
(2454, 161, 'Masqat', 'MA', 1),
(2455, 161, 'Musandam', 'MU', 1),
(2456, 161, 'Zufar', 'ZU', 1),
(2457, 162, 'Balochistan', 'B', 1),
(2458, 162, 'Federally Administered Tribal Areas', 'T', 1),
(2459, 162, 'Islamabad Capital Territory', 'I', 1),
(2460, 162, 'North-West Frontier', 'N', 1),
(2461, 162, 'Punjab', 'P', 1),
(2462, 162, 'Sindh', 'S', 1),
(2463, 163, 'Aimeliik', 'AM', 1),
(2464, 163, 'Airai', 'AR', 1),
(2465, 163, 'Angaur', 'AN', 1),
(2466, 163, 'Hatohobei', 'HA', 1),
(2467, 163, 'Kayangel', 'KA', 1),
(2468, 163, 'Koror', 'KO', 1),
(2469, 163, 'Melekeok', 'ME', 1),
(2470, 163, 'Ngaraard', 'NA', 1),
(2471, 163, 'Ngarchelong', 'NG', 1),
(2472, 163, 'Ngardmau', 'ND', 1),
(2473, 163, 'Ngatpang', 'NT', 1),
(2474, 163, 'Ngchesar', 'NC', 1),
(2475, 163, 'Ngeremlengui', 'NR', 1),
(2476, 163, 'Ngiwal', 'NW', 1),
(2477, 163, 'Peleliu', 'PE', 1),
(2478, 163, 'Sonsorol', 'SO', 1),
(2479, 164, 'Bocas del Toro', 'BT', 1),
(2480, 164, 'Chiriqui', 'CH', 1),
(2481, 164, 'Cocle', 'CC', 1),
(2482, 164, 'Colon', 'CL', 1),
(2483, 164, 'Darien', 'DA', 1),
(2484, 164, 'Herrera', 'HE', 1),
(2485, 164, 'Los Santos', 'LS', 1),
(2486, 164, 'Panama', 'PA', 1),
(2487, 164, 'San Blas', 'SB', 1),
(2488, 164, 'Veraguas', 'VG', 1),
(2489, 165, 'Bougainville', 'BV', 1),
(2490, 165, 'Central', 'CE', 1),
(2491, 165, 'Chimbu', 'CH', 1),
(2492, 165, 'Eastern Highlands', 'EH', 1),
(2493, 165, 'East New Britain', 'EB', 1),
(2494, 165, 'East Sepik', 'ES', 1),
(2495, 165, 'Enga', 'EN', 1),
(2496, 165, 'Gulf', 'GU', 1),
(2497, 165, 'Madang', 'MD', 1),
(2498, 165, 'Manus', 'MN', 1),
(2499, 165, 'Milne Bay', 'MB', 1),
(2500, 165, 'Morobe', 'MR', 1),
(2501, 165, 'National Capital', 'NC', 1),
(2502, 165, 'New Ireland', 'NI', 1),
(2503, 165, 'Northern', 'NO', 1),
(2504, 165, 'Sandaun', 'SA', 1),
(2505, 165, 'Southern Highlands', 'SH', 1),
(2506, 165, 'Western', 'WE', 1),
(2507, 165, 'Western Highlands', 'WH', 1),
(2508, 165, 'West New Britain', 'WB', 1),
(2509, 166, 'Alto Paraguay', 'AG', 1),
(2510, 166, 'Alto Parana', 'AN', 1),
(2511, 166, 'Amambay', 'AM', 1),
(2512, 166, 'Asuncion', 'AS', 1),
(2513, 166, 'Boqueron', 'BO', 1),
(2514, 166, 'Caaguazu', 'CG', 1),
(2515, 166, 'Caazapa', 'CZ', 1),
(2516, 166, 'Canindeyu', 'CN', 1),
(2517, 166, 'Central', 'CE', 1),
(2518, 166, 'Concepcion', 'CC', 1),
(2519, 166, 'Cordillera', 'CD', 1),
(2520, 166, 'Guaira', 'GU', 1),
(2521, 166, 'Itapua', 'IT', 1),
(2522, 166, 'Misiones', 'MI', 1),
(2523, 166, 'Neembucu', 'NE', 1),
(2524, 166, 'Paraguari', 'PA', 1),
(2525, 166, 'Presidente Hayes', 'PH', 1),
(2526, 166, 'San Pedro', 'SP', 1),
(2527, 167, 'Amazonas', 'AM', 1),
(2528, 167, 'Ancash', 'AN', 1),
(2529, 167, 'Apurimac', 'AP', 1),
(2530, 167, 'Arequipa', 'AR', 1),
(2531, 167, 'Ayacucho', 'AY', 1),
(2532, 167, 'Cajamarca', 'CJ', 1),
(2533, 167, 'Callao', 'CL', 1),
(2534, 167, 'Cusco', 'CU', 1),
(2535, 167, 'Huancavelica', 'HV', 1),
(2536, 167, 'Huanuco', 'HO', 1),
(2537, 167, 'Ica', 'IC', 1),
(2538, 167, 'Junin', 'JU', 1),
(2539, 167, 'La Libertad', 'LD', 1),
(2540, 167, 'Lambayeque', 'LY', 1),
(2541, 167, 'Lima', 'LI', 1),
(2542, 167, 'Loreto', 'LO', 1),
(2543, 167, 'Madre de Dios', 'MD', 1),
(2544, 167, 'Moquegua', 'MO', 1),
(2545, 167, 'Pasco', 'PA', 1),
(2546, 167, 'Piura', 'PI', 1),
(2547, 167, 'Puno', 'PU', 1),
(2548, 167, 'San Martin', 'SM', 1),
(2549, 167, 'Tacna', 'TA', 1),
(2550, 167, 'Tumbes', 'TU', 1),
(2551, 167, 'Ucayali', 'UC', 1),
(2552, 168, 'Abra', 'ABR', 1),
(2553, 168, 'Agusan del Norte', 'ANO', 1),
(2554, 168, 'Agusan del Sur', 'ASU', 1),
(2555, 168, 'Aklan', 'AKL', 1),
(2556, 168, 'Albay', 'ALB', 1),
(2557, 168, 'Antique', 'ANT', 1),
(2558, 168, 'Apayao', 'APY', 1),
(2559, 168, 'Aurora', 'AUR', 1),
(2560, 168, 'Basilan', 'BAS', 1),
(2561, 168, 'Bataan', 'BTA', 1),
(2562, 168, 'Batanes', 'BTE', 1),
(2563, 168, 'Batangas', 'BTG', 1),
(2564, 168, 'Biliran', 'BLR', 1),
(2565, 168, 'Benguet', 'BEN', 1),
(2566, 168, 'Bohol', 'BOL', 1),
(2567, 168, 'Bukidnon', 'BUK', 1),
(2568, 168, 'Bulacan', 'BUL', 1),
(2569, 168, 'Cagayan', 'CAG', 1),
(2570, 168, 'Camarines Norte', 'CNO', 1),
(2571, 168, 'Camarines Sur', 'CSU', 1),
(2572, 168, 'Camiguin', 'CAM', 1),
(2573, 168, 'Capiz', 'CAP', 1),
(2574, 168, 'Catanduanes', 'CAT', 1),
(2575, 168, 'Cavite', 'CAV', 1),
(2576, 168, 'Cebu', 'CEB', 1),
(2577, 168, 'Compostela', 'CMP', 1),
(2578, 168, 'Davao del Norte', 'DNO', 1),
(2579, 168, 'Davao del Sur', 'DSU', 1),
(2580, 168, 'Davao Oriental', 'DOR', 1),
(2581, 168, 'Eastern Samar', 'ESA', 1),
(2582, 168, 'Guimaras', 'GUI', 1),
(2583, 168, 'Ifugao', 'IFU', 1),
(2584, 168, 'Ilocos Norte', 'INO', 1),
(2585, 168, 'Ilocos Sur', 'ISU', 1),
(2586, 168, 'Iloilo', 'ILO', 1),
(2587, 168, 'Isabela', 'ISA', 1),
(2588, 168, 'Kalinga', 'KAL', 1),
(2589, 168, 'Laguna', 'LAG', 1),
(2590, 168, 'Lanao del Norte', 'LNO', 1),
(2591, 168, 'Lanao del Sur', 'LSU', 1),
(2592, 168, 'La Union', 'UNI', 1),
(2593, 168, 'Leyte', 'LEY', 1),
(2594, 168, 'Maguindanao', 'MAG', 1),
(2595, 168, 'Marinduque', 'MRN', 1),
(2596, 168, 'Masbate', 'MSB', 1),
(2597, 168, 'Mindoro Occidental', 'MIC', 1),
(2598, 168, 'Mindoro Oriental', 'MIR', 1),
(2599, 168, 'Misamis Occidental', 'MSC', 1),
(2600, 168, 'Misamis Oriental', 'MOR', 1),
(2601, 168, 'Mountain', 'MOP', 1),
(2602, 168, 'Negros Occidental', 'NOC', 1),
(2603, 168, 'Negros Oriental', 'NOR', 1),
(2604, 168, 'North Cotabato', 'NCT', 1),
(2605, 168, 'Northern Samar', 'NSM', 1),
(2606, 168, 'Nueva Ecija', 'NEC', 1),
(2607, 168, 'Nueva Vizcaya', 'NVZ', 1),
(2608, 168, 'Palawan', 'PLW', 1),
(2609, 168, 'Pampanga', 'PMP', 1),
(2610, 168, 'Pangasinan', 'PNG', 1),
(2611, 168, 'Quezon', 'QZN', 1),
(2612, 168, 'Quirino', 'QRN', 1),
(2613, 168, 'Rizal', 'RIZ', 1),
(2614, 168, 'Romblon', 'ROM', 1),
(2615, 168, 'Samar', 'SMR', 1),
(2616, 168, 'Sarangani', 'SRG', 1),
(2617, 168, 'Siquijor', 'SQJ', 1),
(2618, 168, 'Sorsogon', 'SRS', 1),
(2619, 168, 'South Cotabato', 'SCO', 1),
(2620, 168, 'Southern Leyte', 'SLE', 1),
(2621, 168, 'Sultan Kudarat', 'SKU', 1),
(2622, 168, 'Sulu', 'SLU', 1),
(2623, 168, 'Surigao del Norte', 'SNO', 1),
(2624, 168, 'Surigao del Sur', 'SSU', 1),
(2625, 168, 'Tarlac', 'TAR', 1),
(2626, 168, 'Tawi-Tawi', 'TAW', 1),
(2627, 168, 'Zambales', 'ZBL', 1),
(2628, 168, 'Zamboanga del Norte', 'ZNO', 1),
(2629, 168, 'Zamboanga del Sur', 'ZSU', 1),
(2630, 168, 'Zamboanga Sibugay', 'ZSI', 1),
(2631, 170, 'Dolnoslaskie', 'DO', 1),
(2632, 170, 'Kujawsko-Pomorskie', 'KP', 1),
(2633, 170, 'Lodzkie', 'LO', 1),
(2634, 170, 'Lubelskie', 'LL', 1),
(2635, 170, 'Lubuskie', 'LU', 1),
(2636, 170, 'Malopolskie', 'ML', 1),
(2637, 170, 'Mazowieckie', 'MZ', 1),
(2638, 170, 'Opolskie', 'OP', 1),
(2639, 170, 'Podkarpackie', 'PP', 1),
(2640, 170, 'Podlaskie', 'PL', 1),
(2641, 170, 'Pomorskie', 'PM', 1),
(2642, 170, 'Slaskie', 'SL', 1),
(2643, 170, 'Swietokrzyskie', 'SW', 1),
(2644, 170, 'Warminsko-Mazurskie', 'WM', 1),
(2645, 170, 'Wielkopolskie', 'WP', 1),
(2646, 170, 'Zachodniopomorskie', 'ZA', 1),
(2647, 198, 'Saint Pierre', 'P', 1),
(2648, 198, 'Miquelon', 'M', 1),
(2649, 171, 'A&ccedil;ores', 'AC', 1),
(2650, 171, 'Aveiro', 'AV', 1),
(2651, 171, 'Beja', 'BE', 1),
(2652, 171, 'Braga', 'BR', 1),
(2653, 171, 'Bragan&ccedil;a', 'BA', 1),
(2654, 171, 'Castelo Branco', 'CB', 1),
(2655, 171, 'Coimbra', 'CO', 1),
(2656, 171, '&Eacute;vora', 'EV', 1),
(2657, 171, 'Faro', 'FA', 1),
(2658, 171, 'Guarda', 'GU', 1),
(2659, 171, 'Leiria', 'LE', 1),
(2660, 171, 'Lisboa', 'LI', 1),
(2661, 171, 'Madeira', 'ME', 1),
(2662, 171, 'Portalegre', 'PO', 1),
(2663, 171, 'Porto', 'PR', 1),
(2664, 171, 'Santar&eacute;m', 'SA', 1),
(2665, 171, 'Set&uacute;bal', 'SE', 1),
(2666, 171, 'Viana do Castelo', 'VC', 1),
(2667, 171, 'Vila Real', 'VR', 1),
(2668, 171, 'Viseu', 'VI', 1),
(2669, 173, 'Ad Dawhah', 'DW', 1),
(2670, 173, 'Al Ghuwayriyah', 'GW', 1),
(2671, 173, 'Al Jumayliyah', 'JM', 1),
(2672, 173, 'Al Khawr', 'KR', 1),
(2673, 173, 'Al Wakrah', 'WK', 1),
(2674, 173, 'Ar Rayyan', 'RN', 1),
(2675, 173, 'Jarayan al Batinah', 'JB', 1),
(2676, 173, 'Madinat ash Shamal', 'MS', 1),
(2677, 173, 'Umm Sa\'id', 'UD', 1),
(2678, 173, 'Umm Salal', 'UL', 1),
(2679, 175, 'Alba', 'AB', 1),
(2680, 175, 'Arad', 'AR', 1),
(2681, 175, 'Arges', 'AG', 1),
(2682, 175, 'Bacau', 'BC', 1),
(2683, 175, 'Bihor', 'BH', 1),
(2684, 175, 'Bistrita-Nasaud', 'BN', 1),
(2685, 175, 'Botosani', 'BT', 1),
(2686, 175, 'Brasov', 'BV', 1),
(2687, 175, 'Braila', 'BR', 1),
(2688, 175, 'Bucuresti', 'B', 1),
(2689, 175, 'Buzau', 'BZ', 1),
(2690, 175, 'Caras-Severin', 'CS', 1),
(2691, 175, 'Calarasi', 'CL', 1),
(2692, 175, 'Cluj', 'CJ', 1),
(2693, 175, 'Constanta', 'CT', 1),
(2694, 175, 'Covasna', 'CV', 1),
(2695, 175, 'Dimbovita', 'DB', 1),
(2696, 175, 'Dolj', 'DJ', 1),
(2697, 175, 'Galati', 'GL', 1),
(2698, 175, 'Giurgiu', 'GR', 1),
(2699, 175, 'Gorj', 'GJ', 1),
(2700, 175, 'Harghita', 'HR', 1),
(2701, 175, 'Hunedoara', 'HD', 1),
(2702, 175, 'Ialomita', 'IL', 1),
(2703, 175, 'Iasi', 'IS', 1),
(2704, 175, 'Ilfov', 'IF', 1),
(2705, 175, 'Maramures', 'MM', 1),
(2706, 175, 'Mehedinti', 'MH', 1),
(2707, 175, 'Mures', 'MS', 1),
(2708, 175, 'Neamt', 'NT', 1),
(2709, 175, 'Olt', 'OT', 1),
(2710, 175, 'Prahova', 'PH', 1),
(2711, 175, 'Satu-Mare', 'SM', 1),
(2712, 175, 'Salaj', 'SJ', 1),
(2713, 175, 'Sibiu', 'SB', 1),
(2714, 175, 'Suceava', 'SV', 1),
(2715, 175, 'Teleorman', 'TR', 1),
(2716, 175, 'Timis', 'TM', 1),
(2717, 175, 'Tulcea', 'TL', 1),
(2718, 175, 'Vaslui', 'VS', 1),
(2719, 175, 'Valcea', 'VL', 1),
(2720, 175, 'Vrancea', 'VN', 1),
(2721, 176, 'Abakan', 'AB', 1),
(2722, 176, 'Aginskoye', 'AG', 1),
(2723, 176, 'Anadyr', 'AN', 1),
(2724, 176, 'Arkahangelsk', 'AR', 1),
(2725, 176, 'Astrakhan', 'AS', 1),
(2726, 176, 'Barnaul', 'BA', 1),
(2727, 176, 'Belgorod', 'BE', 1),
(2728, 176, 'Birobidzhan', 'BI', 1),
(2729, 176, 'Blagoveshchensk', 'BL', 1),
(2730, 176, 'Bryansk', 'BR', 1),
(2731, 176, 'Cheboksary', 'CH', 1),
(2732, 176, 'Chelyabinsk', 'CL', 1),
(2733, 176, 'Cherkessk', 'CR', 1),
(2734, 176, 'Chita', 'CI', 1),
(2735, 176, 'Dudinka', 'DU', 1),
(2736, 176, 'Elista', 'EL', 1),
(2738, 176, 'Gorno-Altaysk', 'GA', 1),
(2739, 176, 'Groznyy', 'GR', 1),
(2740, 176, 'Irkutsk', 'IR', 1),
(2741, 176, 'Ivanovo', 'IV', 1),
(2742, 176, 'Izhevsk', 'IZ', 1),
(2743, 176, 'Kalinigrad', 'KA', 1),
(2744, 176, 'Kaluga', 'KL', 1),
(2745, 176, 'Kasnodar', 'KS', 1),
(2746, 176, 'Kazan', 'KZ', 1),
(2747, 176, 'Kemerovo', 'KE', 1),
(2748, 176, 'Khabarovsk', 'KH', 1),
(2749, 176, 'Khanty-Mansiysk', 'KM', 1),
(2750, 176, 'Kostroma', 'KO', 1),
(2751, 176, 'Krasnodar', 'KR', 1),
(2752, 176, 'Krasnoyarsk', 'KN', 1),
(2753, 176, 'Kudymkar', 'KU', 1),
(2754, 176, 'Kurgan', 'KG', 1),
(2755, 176, 'Kursk', 'KK', 1),
(2756, 176, 'Kyzyl', 'KY', 1),
(2757, 176, 'Lipetsk', 'LI', 1),
(2758, 176, 'Magadan', 'MA', 1),
(2759, 176, 'Makhachkala', 'MK', 1),
(2760, 176, 'Maykop', 'MY', 1),
(2761, 176, 'Moscow', 'MO', 1),
(2762, 176, 'Murmansk', 'MU', 1),
(2763, 176, 'Nalchik', 'NA', 1),
(2764, 176, 'Naryan Mar', 'NR', 1),
(2765, 176, 'Nazran', 'NZ', 1),
(2766, 176, 'Nizhniy Novgorod', 'NI', 1),
(2767, 176, 'Novgorod', 'NO', 1),
(2768, 176, 'Novosibirsk', 'NV', 1),
(2769, 176, 'Omsk', 'OM', 1),
(2770, 176, 'Orel', 'OR', 1),
(2771, 176, 'Orenburg', 'OE', 1),
(2772, 176, 'Palana', 'PA', 1),
(2773, 176, 'Penza', 'PE', 1),
(2774, 176, 'Perm', 'PR', 1),
(2775, 176, 'Petropavlovsk-Kamchatskiy', 'PK', 1),
(2776, 176, 'Petrozavodsk', 'PT', 1),
(2777, 176, 'Pskov', 'PS', 1),
(2778, 176, 'Rostov-na-Donu', 'RO', 1),
(2779, 176, 'Ryazan', 'RY', 1),
(2780, 176, 'Salekhard', 'SL', 1),
(2781, 176, 'Samara', 'SA', 1),
(2782, 176, 'Saransk', 'SR', 1),
(2783, 176, 'Saratov', 'SV', 1),
(2784, 176, 'Smolensk', 'SM', 1),
(2785, 176, 'St. Petersburg', 'SP', 1),
(2786, 176, 'Stavropol', 'ST', 1),
(2787, 176, 'Syktyvkar', 'SY', 1),
(2788, 176, 'Tambov', 'TA', 1),
(2789, 176, 'Tomsk', 'TO', 1),
(2790, 176, 'Tula', 'TU', 1),
(2791, 176, 'Tura', 'TR', 1),
(2792, 176, 'Tver', 'TV', 1),
(2793, 176, 'Tyumen', 'TY', 1),
(2794, 176, 'Ufa', 'UF', 1),
(2795, 176, 'Ul\'yanovsk', 'UL', 1),
(2796, 176, 'Ulan-Ude', 'UU', 1),
(2797, 176, 'Ust\'-Ordynskiy', 'US', 1),
(2798, 176, 'Vladikavkaz', 'VL', 1),
(2799, 176, 'Vladimir', 'VA', 1),
(2800, 176, 'Vladivostok', 'VV', 1),
(2801, 176, 'Volgograd', 'VG', 1),
(2802, 176, 'Vologda', 'VD', 1),
(2803, 176, 'Voronezh', 'VO', 1),
(2804, 176, 'Vyatka', 'VY', 1),
(2805, 176, 'Yakutsk', 'YA', 1),
(2806, 176, 'Yaroslavl', 'YR', 1),
(2807, 176, 'Yekaterinburg', 'YE', 1),
(2808, 176, 'Yoshkar-Ola', 'YO', 1),
(2809, 177, 'Butare', 'BU', 1),
(2810, 177, 'Byumba', 'BY', 1),
(2811, 177, 'Cyangugu', 'CY', 1),
(2812, 177, 'Gikongoro', 'GK', 1),
(2813, 177, 'Gisenyi', 'GS', 1),
(2814, 177, 'Gitarama', 'GT', 1),
(2815, 177, 'Kibungo', 'KG', 1),
(2816, 177, 'Kibuye', 'KY', 1),
(2817, 177, 'Kigali Rurale', 'KR', 1),
(2818, 177, 'Kigali-ville', 'KV', 1),
(2819, 177, 'Ruhengeri', 'RU', 1),
(2820, 177, 'Umutara', 'UM', 1),
(2821, 178, 'Christ Church Nichola Town', 'CCN', 1),
(2822, 178, 'Saint Anne Sandy Point', 'SAS', 1),
(2823, 178, 'Saint George Basseterre', 'SGB', 1),
(2824, 178, 'Saint George Gingerland', 'SGG', 1),
(2825, 178, 'Saint James Windward', 'SJW', 1),
(2826, 178, 'Saint John Capesterre', 'SJC', 1),
(2827, 178, 'Saint John Figtree', 'SJF', 1),
(2828, 178, 'Saint Mary Cayon', 'SMC', 1),
(2829, 178, 'Saint Paul Capesterre', 'CAP', 1),
(2830, 178, 'Saint Paul Charlestown', 'CHA', 1),
(2831, 178, 'Saint Peter Basseterre', 'SPB', 1),
(2832, 178, 'Saint Thomas Lowland', 'STL', 1),
(2833, 178, 'Saint Thomas Middle Island', 'STM', 1),
(2834, 178, 'Trinity Palmetto Point', 'TPP', 1),
(2835, 179, 'Anse-la-Raye', 'AR', 1),
(2836, 179, 'Castries', 'CA', 1),
(2837, 179, 'Choiseul', 'CH', 1),
(2838, 179, 'Dauphin', 'DA', 1),
(2839, 179, 'Dennery', 'DE', 1),
(2840, 179, 'Gros-Islet', 'GI', 1),
(2841, 179, 'Laborie', 'LA', 1),
(2842, 179, 'Micoud', 'MI', 1),
(2843, 179, 'Praslin', 'PR', 1),
(2844, 179, 'Soufriere', 'SO', 1),
(2845, 179, 'Vieux-Fort', 'VF', 1),
(2846, 180, 'Charlotte', 'C', 1),
(2847, 180, 'Grenadines', 'R', 1),
(2848, 180, 'Saint Andrew', 'A', 1),
(2849, 180, 'Saint David', 'D', 1),
(2850, 180, 'Saint George', 'G', 1),
(2851, 180, 'Saint Patrick', 'P', 1),
(2852, 181, 'A\'ana', 'AN', 1),
(2853, 181, 'Aiga-i-le-Tai', 'AI', 1),
(2854, 181, 'Atua', 'AT', 1),
(2855, 181, 'Fa\'asaleleaga', 'FA', 1),
(2856, 181, 'Gaga\'emauga', 'GE', 1),
(2857, 181, 'Gagaifomauga', 'GF', 1),
(2858, 181, 'Palauli', 'PA', 1),
(2859, 181, 'Satupa\'itea', 'SA', 1),
(2860, 181, 'Tuamasaga', 'TU', 1),
(2861, 181, 'Va\'a-o-Fonoti', 'VF', 1),
(2862, 181, 'Vaisigano', 'VS', 1),
(2863, 182, 'Acquaviva', 'AC', 1),
(2864, 182, 'Borgo Maggiore', 'BM', 1),
(2865, 182, 'Chiesanuova', 'CH', 1),
(2866, 182, 'Domagnano', 'DO', 1),
(2867, 182, 'Faetano', 'FA', 1),
(2868, 182, 'Fiorentino', 'FI', 1),
(2869, 182, 'Montegiardino', 'MO', 1),
(2870, 182, 'Citta di San Marino', 'SM', 1),
(2871, 182, 'Serravalle', 'SE', 1),
(2872, 183, 'Sao Tome', 'S', 1),
(2873, 183, 'Principe', 'P', 1),
(2874, 184, 'Al Bahah', 'BH', 1),
(2875, 184, 'Al Hudud ash Shamaliyah', 'HS', 1),
(2876, 184, 'Al Jawf', 'JF', 1),
(2877, 184, 'Al Madinah', 'MD', 1),
(2878, 184, 'Al Qasim', 'QS', 1),
(2879, 184, 'Ar Riyad', 'RD', 1),
(2880, 184, 'Ash Sharqiyah (Eastern)', 'AQ', 1),
(2881, 184, '\'Asir', 'AS', 1),
(2882, 184, 'Ha\'il', 'HL', 1),
(2883, 184, 'Jizan', 'JZ', 1),
(2884, 184, 'Makkah', 'ML', 1),
(2885, 184, 'Najran', 'NR', 1),
(2886, 184, 'Tabuk', 'TB', 1),
(2887, 185, 'Dakar', 'DA', 1),
(2888, 185, 'Diourbel', 'DI', 1),
(2889, 185, 'Fatick', 'FA', 1),
(2890, 185, 'Kaolack', 'KA', 1),
(2891, 185, 'Kolda', 'KO', 1),
(2892, 185, 'Louga', 'LO', 1),
(2893, 185, 'Matam', 'MA', 1),
(2894, 185, 'Saint-Louis', 'SL', 1),
(2895, 185, 'Tambacounda', 'TA', 1),
(2896, 185, 'Thies', 'TH', 1),
(2897, 185, 'Ziguinchor', 'ZI', 1),
(2898, 186, 'Anse aux Pins', 'AP', 1),
(2899, 186, 'Anse Boileau', 'AB', 1),
(2900, 186, 'Anse Etoile', 'AE', 1),
(2901, 186, 'Anse Louis', 'AL', 1),
(2902, 186, 'Anse Royale', 'AR', 1),
(2903, 186, 'Baie Lazare', 'BL', 1),
(2904, 186, 'Baie Sainte Anne', 'BS', 1),
(2905, 186, 'Beau Vallon', 'BV', 1),
(2906, 186, 'Bel Air', 'BA', 1),
(2907, 186, 'Bel Ombre', 'BO', 1),
(2908, 186, 'Cascade', 'CA', 1),
(2909, 186, 'Glacis', 'GL', 1),
(2910, 186, 'Grand\' Anse (on Mahe)', 'GM', 1),
(2911, 186, 'Grand\' Anse (on Praslin)', 'GP', 1),
(2912, 186, 'La Digue', 'DG', 1),
(2913, 186, 'La Riviere Anglaise', 'RA', 1),
(2914, 186, 'Mont Buxton', 'MB', 1),
(2915, 186, 'Mont Fleuri', 'MF', 1),
(2916, 186, 'Plaisance', 'PL', 1),
(2917, 186, 'Pointe La Rue', 'PR', 1),
(2918, 186, 'Port Glaud', 'PG', 1),
(2919, 186, 'Saint Louis', 'SL', 1),
(2920, 186, 'Takamaka', 'TA', 1),
(2921, 187, 'Eastern', 'E', 1),
(2922, 187, 'Northern', 'N', 1),
(2923, 187, 'Southern', 'S', 1),
(2924, 187, 'Western', 'W', 1),
(2925, 189, 'Banskobystrický', 'BA', 1),
(2926, 189, 'Bratislavský', 'BR', 1),
(2927, 189, 'Košický', 'KO', 1),
(2928, 189, 'Nitriansky', 'NI', 1),
(2929, 189, 'Prešovský', 'PR', 1),
(2930, 189, 'Trenčiansky', 'TC', 1),
(2931, 189, 'Trnavský', 'TV', 1),
(2932, 189, 'Žilinský', 'ZI', 1),
(2933, 191, 'Central', 'CE', 1),
(2934, 191, 'Choiseul', 'CH', 1),
(2935, 191, 'Guadalcanal', 'GC', 1),
(2936, 191, 'Honiara', 'HO', 1),
(2937, 191, 'Isabel', 'IS', 1),
(2938, 191, 'Makira', 'MK', 1),
(2939, 191, 'Malaita', 'ML', 1),
(2940, 191, 'Rennell and Bellona', 'RB', 1),
(2941, 191, 'Temotu', 'TM', 1),
(2942, 191, 'Western', 'WE', 1),
(2943, 192, 'Awdal', 'AW', 1),
(2944, 192, 'Bakool', 'BK', 1),
(2945, 192, 'Banaadir', 'BN', 1),
(2946, 192, 'Bari', 'BR', 1),
(2947, 192, 'Bay', 'BY', 1),
(2948, 192, 'Galguduud', 'GA', 1),
(2949, 192, 'Gedo', 'GE', 1),
(2950, 192, 'Hiiraan', 'HI', 1),
(2951, 192, 'Jubbada Dhexe', 'JD', 1),
(2952, 192, 'Jubbada Hoose', 'JH', 1),
(2953, 192, 'Mudug', 'MU', 1),
(2954, 192, 'Nugaal', 'NU', 1),
(2955, 192, 'Sanaag', 'SA', 1),
(2956, 192, 'Shabeellaha Dhexe', 'SD', 1),
(2957, 192, 'Shabeellaha Hoose', 'SH', 1),
(2958, 192, 'Sool', 'SL', 1),
(2959, 192, 'Togdheer', 'TO', 1),
(2960, 192, 'Woqooyi Galbeed', 'WG', 1),
(2961, 193, 'Eastern Cape', 'EC', 1),
(2962, 193, 'Free State', 'FS', 1),
(2963, 193, 'Gauteng', 'GT', 1),
(2964, 193, 'KwaZulu-Natal', 'KN', 1),
(2965, 193, 'Limpopo', 'LP', 1),
(2966, 193, 'Mpumalanga', 'MP', 1),
(2967, 193, 'North West', 'NW', 1),
(2968, 193, 'Northern Cape', 'NC', 1),
(2969, 193, 'Western Cape', 'WC', 1),
(2970, 195, 'La Coru&ntilde;a', 'CA', 1),
(2971, 195, '&Aacute;lava', 'AL', 1),
(2972, 195, 'Albacete', 'AB', 1),
(2973, 195, 'Alicante', 'AC', 1),
(2974, 195, 'Almeria', 'AM', 1),
(2975, 195, 'Asturias', 'AS', 1),
(2976, 195, '&Aacute;vila', 'AV', 1),
(2977, 195, 'Badajoz', 'BJ', 1),
(2978, 195, 'Baleares', 'IB', 1),
(2979, 195, 'Barcelona', 'BA', 1),
(2980, 195, 'Burgos', 'BU', 1),
(2981, 195, 'C&aacute;ceres', 'CC', 1),
(2982, 195, 'C&aacute;diz', 'CZ', 1),
(2983, 195, 'Cantabria', 'CT', 1),
(2984, 195, 'Castell&oacute;n', 'CL', 1),
(2985, 195, 'Ceuta', 'CE', 1),
(2986, 195, 'Ciudad Real', 'CR', 1),
(2987, 195, 'C&oacute;rdoba', 'CD', 1),
(2988, 195, 'Cuenca', 'CU', 1),
(2989, 195, 'Girona', 'GI', 1),
(2990, 195, 'Granada', 'GD', 1),
(2991, 195, 'Guadalajara', 'GJ', 1),
(2992, 195, 'Guip&uacute;zcoa', 'GP', 1),
(2993, 195, 'Huelva', 'HL', 1),
(2994, 195, 'Huesca', 'HS', 1),
(2995, 195, 'Ja&eacute;n', 'JN', 1),
(2996, 195, 'La Rioja', 'RJ', 1),
(2997, 195, 'Las Palmas', 'PM', 1),
(2998, 195, 'Leon', 'LE', 1),
(2999, 195, 'Lleida', 'LL', 1),
(3000, 195, 'Lugo', 'LG', 1),
(3001, 195, 'Madrid', 'MD', 1),
(3002, 195, 'Malaga', 'MA', 1),
(3003, 195, 'Melilla', 'ML', 1),
(3004, 195, 'Murcia', 'MU', 1),
(3005, 195, 'Navarra', 'NV', 1),
(3006, 195, 'Ourense', 'OU', 1),
(3007, 195, 'Palencia', 'PL', 1),
(3008, 195, 'Pontevedra', 'PO', 1),
(3009, 195, 'Salamanca', 'SL', 1),
(3010, 195, 'Santa Cruz de Tenerife', 'SC', 1),
(3011, 195, 'Segovia', 'SG', 1),
(3012, 195, 'Sevilla', 'SV', 1),
(3013, 195, 'Soria', 'SO', 1),
(3014, 195, 'Tarragona', 'TA', 1),
(3015, 195, 'Teruel', 'TE', 1),
(3016, 195, 'Toledo', 'TO', 1),
(3017, 195, 'Valencia', 'VC', 1),
(3018, 195, 'Valladolid', 'VD', 1),
(3019, 195, 'Vizcaya', 'VZ', 1),
(3020, 195, 'Zamora', 'ZM', 1),
(3021, 195, 'Zaragoza', 'ZR', 1),
(3022, 196, 'Central', 'CE', 1),
(3023, 196, 'Eastern', 'EA', 1),
(3024, 196, 'North Central', 'NC', 1),
(3025, 196, 'Northern', 'NO', 1),
(3026, 196, 'North Western', 'NW', 1),
(3027, 196, 'Sabaragamuwa', 'SA', 1),
(3028, 196, 'Southern', 'SO', 1),
(3029, 196, 'Uva', 'UV', 1),
(3030, 196, 'Western', 'WE', 1),
(3032, 197, 'Saint Helena', 'S', 1),
(3034, 199, 'A\'ali an Nil', 'ANL', 1),
(3035, 199, 'Al Bahr al Ahmar', 'BAM', 1),
(3036, 199, 'Al Buhayrat', 'BRT', 1),
(3037, 199, 'Al Jazirah', 'JZR', 1),
(3038, 199, 'Al Khartum', 'KRT', 1),
(3039, 199, 'Al Qadarif', 'QDR', 1),
(3040, 199, 'Al Wahdah', 'WDH', 1),
(3041, 199, 'An Nil al Abyad', 'ANB', 1),
(3042, 199, 'An Nil al Azraq', 'ANZ', 1),
(3043, 199, 'Ash Shamaliyah', 'ASH', 1),
(3044, 199, 'Bahr al Jabal', 'BJA', 1),
(3045, 199, 'Gharb al Istiwa\'iyah', 'GIS', 1),
(3046, 199, 'Gharb Bahr al Ghazal', 'GBG', 1),
(3047, 199, 'Gharb Darfur', 'GDA', 1),
(3048, 199, 'Gharb Kurdufan', 'GKU', 1),
(3049, 199, 'Janub Darfur', 'JDA', 1),
(3050, 199, 'Janub Kurdufan', 'JKU', 1),
(3051, 199, 'Junqali', 'JQL', 1),
(3052, 199, 'Kassala', 'KSL', 1),
(3053, 199, 'Nahr an Nil', 'NNL', 1),
(3054, 199, 'Shamal Bahr al Ghazal', 'SBG', 1),
(3055, 199, 'Shamal Darfur', 'SDA', 1),
(3056, 199, 'Shamal Kurdufan', 'SKU', 1),
(3057, 199, 'Sharq al Istiwa\'iyah', 'SIS', 1),
(3058, 199, 'Sinnar', 'SNR', 1),
(3059, 199, 'Warab', 'WRB', 1),
(3060, 200, 'Brokopondo', 'BR', 1),
(3061, 200, 'Commewijne', 'CM', 1),
(3062, 200, 'Coronie', 'CR', 1),
(3063, 200, 'Marowijne', 'MA', 1),
(3064, 200, 'Nickerie', 'NI', 1),
(3065, 200, 'Para', 'PA', 1),
(3066, 200, 'Paramaribo', 'PM', 1),
(3067, 200, 'Saramacca', 'SA', 1),
(3068, 200, 'Sipaliwini', 'SI', 1),
(3069, 200, 'Wanica', 'WA', 1),
(3070, 202, 'Hhohho', 'H', 1),
(3071, 202, 'Lubombo', 'L', 1),
(3072, 202, 'Manzini', 'M', 1),
(3073, 202, 'Shishelweni', 'S', 1),
(3074, 203, 'Blekinge', 'K', 1),
(3075, 203, 'Dalarna', 'W', 1),
(3076, 203, 'Gävleborg', 'X', 1),
(3077, 203, 'Gotland', 'I', 1),
(3078, 203, 'Halland', 'N', 1),
(3079, 203, 'Jämtland', 'Z', 1),
(3080, 203, 'Jönköping', 'F', 1),
(3081, 203, 'Kalmar', 'H', 1),
(3082, 203, 'Kronoberg', 'G', 1),
(3083, 203, 'Norrbotten', 'BD', 1),
(3084, 203, 'Örebro', 'T', 1),
(3085, 203, 'Östergötland', 'E', 1),
(3086, 203, 'Sk&aring;ne', 'M', 1),
(3087, 203, 'Södermanland', 'D', 1),
(3088, 203, 'Stockholm', 'AB', 1),
(3089, 203, 'Uppsala', 'C', 1),
(3090, 203, 'Värmland', 'S', 1),
(3091, 203, 'Västerbotten', 'AC', 1),
(3092, 203, 'Västernorrland', 'Y', 1),
(3093, 203, 'Västmanland', 'U', 1),
(3094, 203, 'Västra Götaland', 'O', 1),
(3095, 204, 'Aargau', 'AG', 1),
(3096, 204, 'Appenzell Ausserrhoden', 'AR', 1),
(3097, 204, 'Appenzell Innerrhoden', 'AI', 1),
(3098, 204, 'Basel-Stadt', 'BS', 1),
(3099, 204, 'Basel-Landschaft', 'BL', 1),
(3100, 204, 'Bern', 'BE', 1),
(3101, 204, 'Fribourg', 'FR', 1),
(3102, 204, 'Gen&egrave;ve', 'GE', 1),
(3103, 204, 'Glarus', 'GL', 1),
(3104, 204, 'Graubünden', 'GR', 1),
(3105, 204, 'Jura', 'JU', 1),
(3106, 204, 'Luzern', 'LU', 1),
(3107, 204, 'Neuch&acirc;tel', 'NE', 1),
(3108, 204, 'Nidwald', 'NW', 1),
(3109, 204, 'Obwald', 'OW', 1),
(3110, 204, 'St. Gallen', 'SG', 1),
(3111, 204, 'Schaffhausen', 'SH', 1),
(3112, 204, 'Schwyz', 'SZ', 1),
(3113, 204, 'Solothurn', 'SO', 1),
(3114, 204, 'Thurgau', 'TG', 1),
(3115, 204, 'Ticino', 'TI', 1),
(3116, 204, 'Uri', 'UR', 1),
(3117, 204, 'Valais', 'VS', 1),
(3118, 204, 'Vaud', 'VD', 1),
(3119, 204, 'Zug', 'ZG', 1),
(3120, 204, 'Zürich', 'ZH', 1),
(3121, 205, 'Al Hasakah', 'HA', 1),
(3122, 205, 'Al Ladhiqiyah', 'LA', 1),
(3123, 205, 'Al Qunaytirah', 'QU', 1),
(3124, 205, 'Ar Raqqah', 'RQ', 1),
(3125, 205, 'As Suwayda', 'SU', 1),
(3126, 205, 'Dara', 'DA', 1),
(3127, 205, 'Dayr az Zawr', 'DZ', 1),
(3128, 205, 'Dimashq', 'DI', 1),
(3129, 205, 'Halab', 'HL', 1),
(3130, 205, 'Hamah', 'HM', 1),
(3131, 205, 'Hims', 'HI', 1),
(3132, 205, 'Idlib', 'ID', 1),
(3133, 205, 'Rif Dimashq', 'RD', 1),
(3134, 205, 'Tartus', 'TA', 1),
(3135, 206, 'Chang-hua', 'CH', 1),
(3136, 206, 'Chia-i', 'CI', 1);
INSERT INTO `oc_zone` (`zone_id`, `country_id`, `name`, `code`, `status`) VALUES
(3137, 206, 'Hsin-chu', 'HS', 1),
(3138, 206, 'Hua-lien', 'HL', 1),
(3139, 206, 'I-lan', 'IL', 1),
(3140, 206, 'Kao-hsiung county', 'KH', 1),
(3141, 206, 'Kin-men', 'KM', 1),
(3142, 206, 'Lien-chiang', 'LC', 1),
(3143, 206, 'Miao-li', 'ML', 1),
(3144, 206, 'Nan-t\'ou', 'NT', 1),
(3145, 206, 'P\'eng-hu', 'PH', 1),
(3146, 206, 'P\'ing-tung', 'PT', 1),
(3147, 206, 'T\'ai-chung', 'TG', 1),
(3148, 206, 'T\'ai-nan', 'TA', 1),
(3149, 206, 'T\'ai-pei county', 'TP', 1),
(3150, 206, 'T\'ai-tung', 'TT', 1),
(3151, 206, 'T\'ao-yuan', 'TY', 1),
(3152, 206, 'Yun-lin', 'YL', 1),
(3153, 206, 'Chia-i city', 'CC', 1),
(3154, 206, 'Chi-lung', 'CL', 1),
(3155, 206, 'Hsin-chu', 'HC', 1),
(3156, 206, 'T\'ai-chung', 'TH', 1),
(3157, 206, 'T\'ai-nan', 'TN', 1),
(3158, 206, 'Kao-hsiung city', 'KC', 1),
(3159, 206, 'T\'ai-pei city', 'TC', 1),
(3160, 207, 'Gorno-Badakhstan', 'GB', 1),
(3161, 207, 'Khatlon', 'KT', 1),
(3162, 207, 'Sughd', 'SU', 1),
(3163, 208, 'Arusha', 'AR', 1),
(3164, 208, 'Dar es Salaam', 'DS', 1),
(3165, 208, 'Dodoma', 'DO', 1),
(3166, 208, 'Iringa', 'IR', 1),
(3167, 208, 'Kagera', 'KA', 1),
(3168, 208, 'Kigoma', 'KI', 1),
(3169, 208, 'Kilimanjaro', 'KJ', 1),
(3170, 208, 'Lindi', 'LN', 1),
(3171, 208, 'Manyara', 'MY', 1),
(3172, 208, 'Mara', 'MR', 1),
(3173, 208, 'Mbeya', 'MB', 1),
(3174, 208, 'Morogoro', 'MO', 1),
(3175, 208, 'Mtwara', 'MT', 1),
(3176, 208, 'Mwanza', 'MW', 1),
(3177, 208, 'Pemba North', 'PN', 1),
(3178, 208, 'Pemba South', 'PS', 1),
(3179, 208, 'Pwani', 'PW', 1),
(3180, 208, 'Rukwa', 'RK', 1),
(3181, 208, 'Ruvuma', 'RV', 1),
(3182, 208, 'Shinyanga', 'SH', 1),
(3183, 208, 'Singida', 'SI', 1),
(3184, 208, 'Tabora', 'TB', 1),
(3185, 208, 'Tanga', 'TN', 1),
(3186, 208, 'Zanzibar Central/South', 'ZC', 1),
(3187, 208, 'Zanzibar North', 'ZN', 1),
(3188, 208, 'Zanzibar Urban/West', 'ZU', 1),
(3189, 209, 'Amnat Charoen', 'Amnat Charoen', 1),
(3190, 209, 'Ang Thong', 'Ang Thong', 1),
(3191, 209, 'Ayutthaya', 'Ayutthaya', 1),
(3192, 209, 'Bangkok', 'Bangkok', 1),
(3193, 209, 'Buriram', 'Buriram', 1),
(3194, 209, 'Chachoengsao', 'Chachoengsao', 1),
(3195, 209, 'Chai Nat', 'Chai Nat', 1),
(3196, 209, 'Chaiyaphum', 'Chaiyaphum', 1),
(3197, 209, 'Chanthaburi', 'Chanthaburi', 1),
(3198, 209, 'Chiang Mai', 'Chiang Mai', 1),
(3199, 209, 'Chiang Rai', 'Chiang Rai', 1),
(3200, 209, 'Chon Buri', 'Chon Buri', 1),
(3201, 209, 'Chumphon', 'Chumphon', 1),
(3202, 209, 'Kalasin', 'Kalasin', 1),
(3203, 209, 'Kamphaeng Phet', 'Kamphaeng Phet', 1),
(3204, 209, 'Kanchanaburi', 'Kanchanaburi', 1),
(3205, 209, 'Khon Kaen', 'Khon Kaen', 1),
(3206, 209, 'Krabi', 'Krabi', 1),
(3207, 209, 'Lampang', 'Lampang', 1),
(3208, 209, 'Lamphun', 'Lamphun', 1),
(3209, 209, 'Loei', 'Loei', 1),
(3210, 209, 'Lop Buri', 'Lop Buri', 1),
(3211, 209, 'Mae Hong Son', 'Mae Hong Son', 1),
(3212, 209, 'Maha Sarakham', 'Maha Sarakham', 1),
(3213, 209, 'Mukdahan', 'Mukdahan', 1),
(3214, 209, 'Nakhon Nayok', 'Nakhon Nayok', 1),
(3215, 209, 'Nakhon Pathom', 'Nakhon Pathom', 1),
(3216, 209, 'Nakhon Phanom', 'Nakhon Phanom', 1),
(3217, 209, 'Nakhon Ratchasima', 'Nakhon Ratchasima', 1),
(3218, 209, 'Nakhon Sawan', 'Nakhon Sawan', 1),
(3219, 209, 'Nakhon Si Thammarat', 'Nakhon Si Thammarat', 1),
(3220, 209, 'Nan', 'Nan', 1),
(3221, 209, 'Narathiwat', 'Narathiwat', 1),
(3222, 209, 'Nong Bua Lamphu', 'Nong Bua Lamphu', 1),
(3223, 209, 'Nong Khai', 'Nong Khai', 1),
(3224, 209, 'Nonthaburi', 'Nonthaburi', 1),
(3225, 209, 'Pathum Thani', 'Pathum Thani', 1),
(3226, 209, 'Pattani', 'Pattani', 1),
(3227, 209, 'Phangnga', 'Phangnga', 1),
(3228, 209, 'Phatthalung', 'Phatthalung', 1),
(3229, 209, 'Phayao', 'Phayao', 1),
(3230, 209, 'Phetchabun', 'Phetchabun', 1),
(3231, 209, 'Phetchaburi', 'Phetchaburi', 1),
(3232, 209, 'Phichit', 'Phichit', 1),
(3233, 209, 'Phitsanulok', 'Phitsanulok', 1),
(3234, 209, 'Phrae', 'Phrae', 1),
(3235, 209, 'Phuket', 'Phuket', 1),
(3236, 209, 'Prachin Buri', 'Prachin Buri', 1),
(3237, 209, 'Prachuap Khiri Khan', 'Prachuap Khiri Khan', 1),
(3238, 209, 'Ranong', 'Ranong', 1),
(3239, 209, 'Ratchaburi', 'Ratchaburi', 1),
(3240, 209, 'Rayong', 'Rayong', 1),
(3241, 209, 'Roi Et', 'Roi Et', 1),
(3242, 209, 'Sa Kaeo', 'Sa Kaeo', 1),
(3243, 209, 'Sakon Nakhon', 'Sakon Nakhon', 1),
(3244, 209, 'Samut Prakan', 'Samut Prakan', 1),
(3245, 209, 'Samut Sakhon', 'Samut Sakhon', 1),
(3246, 209, 'Samut Songkhram', 'Samut Songkhram', 1),
(3247, 209, 'Sara Buri', 'Sara Buri', 1),
(3248, 209, 'Satun', 'Satun', 1),
(3249, 209, 'Sing Buri', 'Sing Buri', 1),
(3250, 209, 'Sisaket', 'Sisaket', 1),
(3251, 209, 'Songkhla', 'Songkhla', 1),
(3252, 209, 'Sukhothai', 'Sukhothai', 1),
(3253, 209, 'Suphan Buri', 'Suphan Buri', 1),
(3254, 209, 'Surat Thani', 'Surat Thani', 1),
(3255, 209, 'Surin', 'Surin', 1),
(3256, 209, 'Tak', 'Tak', 1),
(3257, 209, 'Trang', 'Trang', 1),
(3258, 209, 'Trat', 'Trat', 1),
(3259, 209, 'Ubon Ratchathani', 'Ubon Ratchathani', 1),
(3260, 209, 'Udon Thani', 'Udon Thani', 1),
(3261, 209, 'Uthai Thani', 'Uthai Thani', 1),
(3262, 209, 'Uttaradit', 'Uttaradit', 1),
(3263, 209, 'Yala', 'Yala', 1),
(3264, 209, 'Yasothon', 'Yasothon', 1),
(3265, 210, 'Kara', 'K', 1),
(3266, 210, 'Plateaux', 'P', 1),
(3267, 210, 'Savanes', 'S', 1),
(3268, 210, 'Centrale', 'C', 1),
(3269, 210, 'Maritime', 'M', 1),
(3270, 211, 'Atafu', 'A', 1),
(3271, 211, 'Fakaofo', 'F', 1),
(3272, 211, 'Nukunonu', 'N', 1),
(3273, 212, 'Ha\'apai', 'H', 1),
(3274, 212, 'Tongatapu', 'T', 1),
(3275, 212, 'Vava\'u', 'V', 1),
(3276, 213, 'Couva/Tabaquite/Talparo', 'CT', 1),
(3277, 213, 'Diego Martin', 'DM', 1),
(3278, 213, 'Mayaro/Rio Claro', 'MR', 1),
(3279, 213, 'Penal/Debe', 'PD', 1),
(3280, 213, 'Princes Town', 'PT', 1),
(3281, 213, 'Sangre Grande', 'SG', 1),
(3282, 213, 'San Juan/Laventille', 'SL', 1),
(3283, 213, 'Siparia', 'SI', 1),
(3284, 213, 'Tunapuna/Piarco', 'TP', 1),
(3285, 213, 'Port of Spain', 'PS', 1),
(3286, 213, 'San Fernando', 'SF', 1),
(3287, 213, 'Arima', 'AR', 1),
(3288, 213, 'Point Fortin', 'PF', 1),
(3289, 213, 'Chaguanas', 'CH', 1),
(3290, 213, 'Tobago', 'TO', 1),
(3291, 214, 'Ariana', 'AR', 1),
(3292, 214, 'Beja', 'BJ', 1),
(3293, 214, 'Ben Arous', 'BA', 1),
(3294, 214, 'Bizerte', 'BI', 1),
(3295, 214, 'Gabes', 'GB', 1),
(3296, 214, 'Gafsa', 'GF', 1),
(3297, 214, 'Jendouba', 'JE', 1),
(3298, 214, 'Kairouan', 'KR', 1),
(3299, 214, 'Kasserine', 'KS', 1),
(3300, 214, 'Kebili', 'KB', 1),
(3301, 214, 'Kef', 'KF', 1),
(3302, 214, 'Mahdia', 'MH', 1),
(3303, 214, 'Manouba', 'MN', 1),
(3304, 214, 'Medenine', 'ME', 1),
(3305, 214, 'Monastir', 'MO', 1),
(3306, 214, 'Nabeul', 'NA', 1),
(3307, 214, 'Sfax', 'SF', 1),
(3308, 214, 'Sidi', 'SD', 1),
(3309, 214, 'Siliana', 'SL', 1),
(3310, 214, 'Sousse', 'SO', 1),
(3311, 214, 'Tataouine', 'TA', 1),
(3312, 214, 'Tozeur', 'TO', 1),
(3313, 214, 'Tunis', 'TU', 1),
(3314, 214, 'Zaghouan', 'ZA', 1),
(3315, 215, 'Adana', 'ADA', 1),
(3316, 215, 'Adıyaman', 'ADI', 1),
(3317, 215, 'Afyonkarahisar', 'AFY', 1),
(3318, 215, 'Ağrı', 'AGR', 1),
(3319, 215, 'Aksaray', 'AKS', 1),
(3320, 215, 'Amasya', 'AMA', 1),
(3321, 215, 'Ankara', 'ANK', 1),
(3322, 215, 'Antalya', 'ANT', 1),
(3323, 215, 'Ardahan', 'ARD', 1),
(3324, 215, 'Artvin', 'ART', 1),
(3325, 215, 'Aydın', 'AYI', 1),
(3326, 215, 'Balıkesir', 'BAL', 1),
(3327, 215, 'Bartın', 'BAR', 1),
(3328, 215, 'Batman', 'BAT', 1),
(3329, 215, 'Bayburt', 'BAY', 1),
(3330, 215, 'Bilecik', 'BIL', 1),
(3331, 215, 'Bingöl', 'BIN', 1),
(3332, 215, 'Bitlis', 'BIT', 1),
(3333, 215, 'Bolu', 'BOL', 1),
(3334, 215, 'Burdur', 'BRD', 1),
(3335, 215, 'Bursa', 'BRS', 1),
(3336, 215, 'Çanakkale', 'CKL', 1),
(3337, 215, 'Çankırı', 'CKR', 1),
(3338, 215, 'Çorum', 'COR', 1),
(3339, 215, 'Denizli', 'DEN', 1),
(3340, 215, 'Diyarbakır', 'DIY', 1),
(3341, 215, 'Düzce', 'DUZ', 1),
(3342, 215, 'Edirne', 'EDI', 1),
(3343, 215, 'Elazığ', 'ELA', 1),
(3344, 215, 'Erzincan', 'EZC', 1),
(3345, 215, 'Erzurum', 'EZR', 1),
(3346, 215, 'Eskişehir', 'ESK', 1),
(3347, 215, 'Gaziantep', 'GAZ', 1),
(3348, 215, 'Giresun', 'GIR', 1),
(3349, 215, 'Gümüşhane', 'GMS', 1),
(3350, 215, 'Hakkari', 'HKR', 1),
(3351, 215, 'Hatay', 'HTY', 1),
(3352, 215, 'Iğdır', 'IGD', 1),
(3353, 215, 'Isparta', 'ISP', 1),
(3354, 215, 'İstanbul', 'IST', 1),
(3355, 215, 'İzmir', 'IZM', 1),
(3356, 215, 'Kahramanmaraş', 'KAH', 1),
(3357, 215, 'Karabük', 'KRB', 1),
(3358, 215, 'Karaman', 'KRM', 1),
(3359, 215, 'Kars', 'KRS', 1),
(3360, 215, 'Kastamonu', 'KAS', 1),
(3361, 215, 'Kayseri', 'KAY', 1),
(3362, 215, 'Kilis', 'KLS', 1),
(3363, 215, 'Kırıkkale', 'KRK', 1),
(3364, 215, 'Kırklareli', 'KLR', 1),
(3365, 215, 'Kırşehir', 'KRH', 1),
(3366, 215, 'Kocaeli', 'KOC', 1),
(3367, 215, 'Konya', 'KON', 1),
(3368, 215, 'Kütahya', 'KUT', 1),
(3369, 215, 'Malatya', 'MAL', 1),
(3370, 215, 'Manisa', 'MAN', 1),
(3371, 215, 'Mardin', 'MAR', 1),
(3372, 215, 'Mersin', 'MER', 1),
(3373, 215, 'Muğla', 'MUG', 1),
(3374, 215, 'Muş', 'MUS', 1),
(3375, 215, 'Nevşehir', 'NEV', 1),
(3376, 215, 'Niğde', 'NIG', 1),
(3377, 215, 'Ordu', 'ORD', 1),
(3378, 215, 'Osmaniye', 'OSM', 1),
(3379, 215, 'Rize', 'RIZ', 1),
(3380, 215, 'Sakarya', 'SAK', 1),
(3381, 215, 'Samsun', 'SAM', 1),
(3382, 215, 'Şanlıurfa', 'SAN', 1),
(3383, 215, 'Siirt', 'SII', 1),
(3384, 215, 'Sinop', 'SIN', 1),
(3385, 215, 'Şırnak', 'SIR', 1),
(3386, 215, 'Sivas', 'SIV', 1),
(3387, 215, 'Tekirdağ', 'TEL', 1),
(3388, 215, 'Tokat', 'TOK', 1),
(3389, 215, 'Trabzon', 'TRA', 1),
(3390, 215, 'Tunceli', 'TUN', 1),
(3391, 215, 'Uşak', 'USK', 1),
(3392, 215, 'Van', 'VAN', 1),
(3393, 215, 'Yalova', 'YAL', 1),
(3394, 215, 'Yozgat', 'YOZ', 1),
(3395, 215, 'Zonguldak', 'ZON', 1),
(3396, 216, 'Ahal Welayaty', 'A', 1),
(3397, 216, 'Balkan Welayaty', 'B', 1),
(3398, 216, 'Dashhowuz Welayaty', 'D', 1),
(3399, 216, 'Lebap Welayaty', 'L', 1),
(3400, 216, 'Mary Welayaty', 'M', 1),
(3401, 217, 'Ambergris Cays', 'AC', 1),
(3402, 217, 'Dellis Cay', 'DC', 1),
(3403, 217, 'French Cay', 'FC', 1),
(3404, 217, 'Little Water Cay', 'LW', 1),
(3405, 217, 'Parrot Cay', 'RC', 1),
(3406, 217, 'Pine Cay', 'PN', 1),
(3407, 217, 'Salt Cay', 'SL', 1),
(3408, 217, 'Grand Turk', 'GT', 1),
(3409, 217, 'South Caicos', 'SC', 1),
(3410, 217, 'East Caicos', 'EC', 1),
(3411, 217, 'Middle Caicos', 'MC', 1),
(3412, 217, 'North Caicos', 'NC', 1),
(3413, 217, 'Providenciales', 'PR', 1),
(3414, 217, 'West Caicos', 'WC', 1),
(3415, 218, 'Nanumanga', 'NMG', 1),
(3416, 218, 'Niulakita', 'NLK', 1),
(3417, 218, 'Niutao', 'NTO', 1),
(3418, 218, 'Funafuti', 'FUN', 1),
(3419, 218, 'Nanumea', 'NME', 1),
(3420, 218, 'Nui', 'NUI', 1),
(3421, 218, 'Nukufetau', 'NFT', 1),
(3422, 218, 'Nukulaelae', 'NLL', 1),
(3423, 218, 'Vaitupu', 'VAI', 1),
(3424, 219, 'Kalangala', 'KAL', 1),
(3425, 219, 'Kampala', 'KMP', 1),
(3426, 219, 'Kayunga', 'KAY', 1),
(3427, 219, 'Kiboga', 'KIB', 1),
(3428, 219, 'Luwero', 'LUW', 1),
(3429, 219, 'Masaka', 'MAS', 1),
(3430, 219, 'Mpigi', 'MPI', 1),
(3431, 219, 'Mubende', 'MUB', 1),
(3432, 219, 'Mukono', 'MUK', 1),
(3433, 219, 'Nakasongola', 'NKS', 1),
(3434, 219, 'Rakai', 'RAK', 1),
(3435, 219, 'Sembabule', 'SEM', 1),
(3436, 219, 'Wakiso', 'WAK', 1),
(3437, 219, 'Bugiri', 'BUG', 1),
(3438, 219, 'Busia', 'BUS', 1),
(3439, 219, 'Iganga', 'IGA', 1),
(3440, 219, 'Jinja', 'JIN', 1),
(3441, 219, 'Kaberamaido', 'KAB', 1),
(3442, 219, 'Kamuli', 'KML', 1),
(3443, 219, 'Kapchorwa', 'KPC', 1),
(3444, 219, 'Katakwi', 'KTK', 1),
(3445, 219, 'Kumi', 'KUM', 1),
(3446, 219, 'Mayuge', 'MAY', 1),
(3447, 219, 'Mbale', 'MBA', 1),
(3448, 219, 'Pallisa', 'PAL', 1),
(3449, 219, 'Sironko', 'SIR', 1),
(3450, 219, 'Soroti', 'SOR', 1),
(3451, 219, 'Tororo', 'TOR', 1),
(3452, 219, 'Adjumani', 'ADJ', 1),
(3453, 219, 'Apac', 'APC', 1),
(3454, 219, 'Arua', 'ARU', 1),
(3455, 219, 'Gulu', 'GUL', 1),
(3456, 219, 'Kitgum', 'KIT', 1),
(3457, 219, 'Kotido', 'KOT', 1),
(3458, 219, 'Lira', 'LIR', 1),
(3459, 219, 'Moroto', 'MRT', 1),
(3460, 219, 'Moyo', 'MOY', 1),
(3461, 219, 'Nakapiripirit', 'NAK', 1),
(3462, 219, 'Nebbi', 'NEB', 1),
(3463, 219, 'Pader', 'PAD', 1),
(3464, 219, 'Yumbe', 'YUM', 1),
(3465, 219, 'Bundibugyo', 'BUN', 1),
(3466, 219, 'Bushenyi', 'BSH', 1),
(3467, 219, 'Hoima', 'HOI', 1),
(3468, 219, 'Kabale', 'KBL', 1),
(3469, 219, 'Kabarole', 'KAR', 1),
(3470, 219, 'Kamwenge', 'KAM', 1),
(3471, 219, 'Kanungu', 'KAN', 1),
(3472, 219, 'Kasese', 'KAS', 1),
(3473, 219, 'Kibaale', 'KBA', 1),
(3474, 219, 'Kisoro', 'KIS', 1),
(3475, 219, 'Kyenjojo', 'KYE', 1),
(3476, 219, 'Masindi', 'MSN', 1),
(3477, 219, 'Mbarara', 'MBR', 1),
(3478, 219, 'Ntungamo', 'NTU', 1),
(3479, 219, 'Rukungiri', 'RUK', 1),
(3480, 220, 'Cherkas\'ka Oblast\'', '71', 1),
(3481, 220, 'Chernihivs\'ka Oblast\'', '74', 1),
(3482, 220, 'Chernivets\'ka Oblast\'', '77', 1),
(3483, 220, 'Crimea', '43', 1),
(3484, 220, 'Dnipropetrovs\'ka Oblast\'', '12', 1),
(3485, 220, 'Donets\'ka Oblast\'', '14', 1),
(3486, 220, 'Ivano-Frankivs\'ka Oblast\'', '26', 1),
(3487, 220, 'Khersons\'ka Oblast\'', '65', 1),
(3488, 220, 'Khmel\'nyts\'ka Oblast\'', '68', 1),
(3489, 220, 'Kirovohrads\'ka Oblast\'', '35', 1),
(3490, 220, 'Kyiv', '30', 1),
(3491, 220, 'Kyivs\'ka Oblast\'', '32', 1),
(3492, 220, 'Luhans\'ka Oblast\'', '09', 1),
(3493, 220, 'L\'vivs\'ka Oblast\'', '46', 1),
(3494, 220, 'Mykolayivs\'ka Oblast\'', '48', 1),
(3495, 220, 'Odes\'ka Oblast\'', '51', 1),
(3496, 220, 'Poltavs\'ka Oblast\'', '53', 1),
(3497, 220, 'Rivnens\'ka Oblast\'', '56', 1),
(3498, 220, 'Sevastopol\'', '40', 1),
(3499, 220, 'Sums\'ka Oblast\'', '59', 1),
(3500, 220, 'Ternopil\'s\'ka Oblast\'', '61', 1),
(3501, 220, 'Vinnyts\'ka Oblast\'', '05', 1),
(3502, 220, 'Volyns\'ka Oblast\'', '07', 1),
(3503, 220, 'Zakarpats\'ka Oblast\'', '21', 1),
(3504, 220, 'Zaporiz\'ka Oblast\'', '23', 1),
(3505, 220, 'Zhytomyrs\'ka oblast\'', '18', 1),
(3506, 221, 'Abu Dhabi', 'ADH', 1),
(3507, 221, '\'Ajman', 'AJ', 1),
(3508, 221, 'Al Fujayrah', 'FU', 1),
(3509, 221, 'Ash Shariqah', 'SH', 1),
(3510, 221, 'Dubai', 'DU', 1),
(3511, 221, 'R\'as al Khaymah', 'RK', 1),
(3512, 221, 'Umm al Qaywayn', 'UQ', 1),
(3513, 222, 'Aberdeen', 'ABN', 1),
(3514, 222, 'Aberdeenshire', 'ABNS', 1),
(3515, 222, 'Anglesey', 'ANG', 1),
(3516, 222, 'Angus', 'AGS', 1),
(3517, 222, 'Argyll and Bute', 'ARY', 1),
(3518, 222, 'Bedfordshire', 'BEDS', 1),
(3519, 222, 'Berkshire', 'BERKS', 1),
(3520, 222, 'Blaenau Gwent', 'BLA', 1),
(3521, 222, 'Bridgend', 'BRI', 1),
(3522, 222, 'Bristol', 'BSTL', 1),
(3523, 222, 'Buckinghamshire', 'BUCKS', 1),
(3524, 222, 'Caerphilly', 'CAE', 1),
(3525, 222, 'Cambridgeshire', 'CAMBS', 1),
(3526, 222, 'Cardiff', 'CDF', 1),
(3527, 222, 'Carmarthenshire', 'CARM', 1),
(3528, 222, 'Ceredigion', 'CDGN', 1),
(3529, 222, 'Cheshire', 'CHES', 1),
(3530, 222, 'Clackmannanshire', 'CLACK', 1),
(3531, 222, 'Conwy', 'CON', 1),
(3532, 222, 'Cornwall', 'CORN', 1),
(3533, 222, 'Denbighshire', 'DNBG', 1),
(3534, 222, 'Derbyshire', 'DERBY', 1),
(3535, 222, 'Devon', 'DVN', 1),
(3536, 222, 'Dorset', 'DOR', 1),
(3537, 222, 'Dumfries and Galloway', 'DGL', 1),
(3538, 222, 'Dundee', 'DUND', 1),
(3539, 222, 'Durham', 'DHM', 1),
(3540, 222, 'East Ayrshire', 'ARYE', 1),
(3541, 222, 'East Dunbartonshire', 'DUNBE', 1),
(3542, 222, 'East Lothian', 'LOTE', 1),
(3543, 222, 'East Renfrewshire', 'RENE', 1),
(3544, 222, 'East Riding of Yorkshire', 'ERYS', 1),
(3545, 222, 'East Sussex', 'SXE', 1),
(3546, 222, 'Edinburgh', 'EDIN', 1),
(3547, 222, 'Essex', 'ESX', 1),
(3548, 222, 'Falkirk', 'FALK', 1),
(3549, 222, 'Fife', 'FFE', 1),
(3550, 222, 'Flintshire', 'FLINT', 1),
(3551, 222, 'Glasgow', 'GLAS', 1),
(3552, 222, 'Gloucestershire', 'GLOS', 1),
(3553, 222, 'Greater London', 'LDN', 1),
(3554, 222, 'Greater Manchester', 'MCH', 1),
(3555, 222, 'Gwynedd', 'GDD', 1),
(3556, 222, 'Hampshire', 'HANTS', 1),
(3557, 222, 'Herefordshire', 'HWR', 1),
(3558, 222, 'Hertfordshire', 'HERTS', 1),
(3559, 222, 'Highlands', 'HLD', 1),
(3560, 222, 'Inverclyde', 'IVER', 1),
(3561, 222, 'Isle of Wight', 'IOW', 1),
(3562, 222, 'Kent', 'KNT', 1),
(3563, 222, 'Lancashire', 'LANCS', 1),
(3564, 222, 'Leicestershire', 'LEICS', 1),
(3565, 222, 'Lincolnshire', 'LINCS', 1),
(3566, 222, 'Merseyside', 'MSY', 1),
(3567, 222, 'Merthyr Tydfil', 'MERT', 1),
(3568, 222, 'Midlothian', 'MLOT', 1),
(3569, 222, 'Monmouthshire', 'MMOUTH', 1),
(3570, 222, 'Moray', 'MORAY', 1),
(3571, 222, 'Neath Port Talbot', 'NPRTAL', 1),
(3572, 222, 'Newport', 'NEWPT', 1),
(3573, 222, 'Norfolk', 'NOR', 1),
(3574, 222, 'North Ayrshire', 'ARYN', 1),
(3575, 222, 'North Lanarkshire', 'LANN', 1),
(3576, 222, 'North Yorkshire', 'YSN', 1),
(3577, 222, 'Northamptonshire', 'NHM', 1),
(3578, 222, 'Northumberland', 'NLD', 1),
(3579, 222, 'Nottinghamshire', 'NOT', 1),
(3580, 222, 'Orkney Islands', 'ORK', 1),
(3581, 222, 'Oxfordshire', 'OFE', 1),
(3582, 222, 'Pembrokeshire', 'PEM', 1),
(3583, 222, 'Perth and Kinross', 'PERTH', 1),
(3584, 222, 'Powys', 'PWS', 1),
(3585, 222, 'Renfrewshire', 'REN', 1),
(3586, 222, 'Rhondda Cynon Taff', 'RHON', 1),
(3587, 222, 'Rutland', 'RUT', 1),
(3588, 222, 'Scottish Borders', 'BOR', 1),
(3589, 222, 'Shetland Islands', 'SHET', 1),
(3590, 222, 'Shropshire', 'SPE', 1),
(3591, 222, 'Somerset', 'SOM', 1),
(3592, 222, 'South Ayrshire', 'ARYS', 1),
(3593, 222, 'South Lanarkshire', 'LANS', 1),
(3594, 222, 'South Yorkshire', 'YSS', 1),
(3595, 222, 'Staffordshire', 'SFD', 1),
(3596, 222, 'Stirling', 'STIR', 1),
(3597, 222, 'Suffolk', 'SFK', 1),
(3598, 222, 'Surrey', 'SRY', 1),
(3599, 222, 'Swansea', 'SWAN', 1),
(3600, 222, 'Torfaen', 'TORF', 1),
(3601, 222, 'Tyne and Wear', 'TWR', 1),
(3602, 222, 'Vale of Glamorgan', 'VGLAM', 1),
(3603, 222, 'Warwickshire', 'WARKS', 1),
(3604, 222, 'West Dunbartonshire', 'WDUN', 1),
(3605, 222, 'West Lothian', 'WLOT', 1),
(3606, 222, 'West Midlands', 'WMD', 1),
(3607, 222, 'West Sussex', 'SXW', 1),
(3608, 222, 'West Yorkshire', 'YSW', 1),
(3609, 222, 'Western Isles', 'WIL', 1),
(3610, 222, 'Wiltshire', 'WLT', 1),
(3611, 222, 'Worcestershire', 'WORCS', 1),
(3612, 222, 'Wrexham', 'WRX', 1),
(3613, 223, 'Alabama', 'AL', 1),
(3614, 223, 'Alaska', 'AK', 1),
(3615, 223, 'American Samoa', 'AS', 1),
(3616, 223, 'Arizona', 'AZ', 1),
(3617, 223, 'Arkansas', 'AR', 1),
(3618, 223, 'Armed Forces Africa', 'AF', 1),
(3619, 223, 'Armed Forces Americas', 'AA', 1),
(3620, 223, 'Armed Forces Canada', 'AC', 1),
(3621, 223, 'Armed Forces Europe', 'AE', 1),
(3622, 223, 'Armed Forces Middle East', 'AM', 1),
(3623, 223, 'Armed Forces Pacific', 'AP', 1),
(3624, 223, 'California', 'CA', 1),
(3625, 223, 'Colorado', 'CO', 1),
(3626, 223, 'Connecticut', 'CT', 1),
(3627, 223, 'Delaware', 'DE', 1),
(3628, 223, 'District of Columbia', 'DC', 1),
(3629, 223, 'Federated States Of Micronesia', 'FM', 1),
(3630, 223, 'Florida', 'FL', 1),
(3631, 223, 'Georgia', 'GA', 1),
(3632, 223, 'Guam', 'GU', 1),
(3633, 223, 'Hawaii', 'HI', 1),
(3634, 223, 'Idaho', 'ID', 1),
(3635, 223, 'Illinois', 'IL', 1),
(3636, 223, 'Indiana', 'IN', 1),
(3637, 223, 'Iowa', 'IA', 1),
(3638, 223, 'Kansas', 'KS', 1),
(3639, 223, 'Kentucky', 'KY', 1),
(3640, 223, 'Louisiana', 'LA', 1),
(3641, 223, 'Maine', 'ME', 1),
(3642, 223, 'Marshall Islands', 'MH', 1),
(3643, 223, 'Maryland', 'MD', 1),
(3644, 223, 'Massachusetts', 'MA', 1),
(3645, 223, 'Michigan', 'MI', 1),
(3646, 223, 'Minnesota', 'MN', 1),
(3647, 223, 'Mississippi', 'MS', 1),
(3648, 223, 'Missouri', 'MO', 1),
(3649, 223, 'Montana', 'MT', 1),
(3650, 223, 'Nebraska', 'NE', 1),
(3651, 223, 'Nevada', 'NV', 1),
(3652, 223, 'New Hampshire', 'NH', 1),
(3653, 223, 'New Jersey', 'NJ', 1),
(3654, 223, 'New Mexico', 'NM', 1),
(3655, 223, 'New York', 'NY', 1),
(3656, 223, 'North Carolina', 'NC', 1),
(3657, 223, 'North Dakota', 'ND', 1),
(3658, 223, 'Northern Mariana Islands', 'MP', 1),
(3659, 223, 'Ohio', 'OH', 1),
(3660, 223, 'Oklahoma', 'OK', 1),
(3661, 223, 'Oregon', 'OR', 1),
(3662, 223, 'Palau', 'PW', 1),
(3663, 223, 'Pennsylvania', 'PA', 1),
(3664, 223, 'Puerto Rico', 'PR', 1),
(3665, 223, 'Rhode Island', 'RI', 1),
(3666, 223, 'South Carolina', 'SC', 1),
(3667, 223, 'South Dakota', 'SD', 1),
(3668, 223, 'Tennessee', 'TN', 1),
(3669, 223, 'Texas', 'TX', 1),
(3670, 223, 'Utah', 'UT', 1),
(3671, 223, 'Vermont', 'VT', 1),
(3672, 223, 'Virgin Islands', 'VI', 1),
(3673, 223, 'Virginia', 'VA', 1),
(3674, 223, 'Washington', 'WA', 1),
(3675, 223, 'West Virginia', 'WV', 1),
(3676, 223, 'Wisconsin', 'WI', 1),
(3677, 223, 'Wyoming', 'WY', 1),
(3678, 224, 'Baker Island', 'BI', 1),
(3679, 224, 'Howland Island', 'HI', 1),
(3680, 224, 'Jarvis Island', 'JI', 1),
(3681, 224, 'Johnston Atoll', 'JA', 1),
(3682, 224, 'Kingman Reef', 'KR', 1),
(3683, 224, 'Midway Atoll', 'MA', 1),
(3684, 224, 'Navassa Island', 'NI', 1),
(3685, 224, 'Palmyra Atoll', 'PA', 1),
(3686, 224, 'Wake Island', 'WI', 1),
(3687, 225, 'Artigas', 'AR', 1),
(3688, 225, 'Canelones', 'CA', 1),
(3689, 225, 'Cerro Largo', 'CL', 1),
(3690, 225, 'Colonia', 'CO', 1),
(3691, 225, 'Durazno', 'DU', 1),
(3692, 225, 'Flores', 'FS', 1),
(3693, 225, 'Florida', 'FA', 1),
(3694, 225, 'Lavalleja', 'LA', 1),
(3695, 225, 'Maldonado', 'MA', 1),
(3696, 225, 'Montevideo', 'MO', 1),
(3697, 225, 'Paysandu', 'PA', 1),
(3698, 225, 'Rio Negro', 'RN', 1),
(3699, 225, 'Rivera', 'RV', 1),
(3700, 225, 'Rocha', 'RO', 1),
(3701, 225, 'Salto', 'SL', 1),
(3702, 225, 'San Jose', 'SJ', 1),
(3703, 225, 'Soriano', 'SO', 1),
(3704, 225, 'Tacuarembo', 'TA', 1),
(3705, 225, 'Treinta y Tres', 'TT', 1),
(3706, 226, 'Andijon', 'AN', 1),
(3707, 226, 'Buxoro', 'BU', 1),
(3708, 226, 'Farg\'ona', 'FA', 1),
(3709, 226, 'Jizzax', 'JI', 1),
(3710, 226, 'Namangan', 'NG', 1),
(3711, 226, 'Navoiy', 'NW', 1),
(3712, 226, 'Qashqadaryo', 'QA', 1),
(3713, 226, 'Qoraqalpog\'iston Republikasi', 'QR', 1),
(3714, 226, 'Samarqand', 'SA', 1),
(3715, 226, 'Sirdaryo', 'SI', 1),
(3716, 226, 'Surxondaryo', 'SU', 1),
(3717, 226, 'Toshkent City', 'TK', 1),
(3718, 226, 'Toshkent Region', 'TO', 1),
(3719, 226, 'Xorazm', 'XO', 1),
(3720, 227, 'Malampa', 'MA', 1),
(3721, 227, 'Penama', 'PE', 1),
(3722, 227, 'Sanma', 'SA', 1),
(3723, 227, 'Shefa', 'SH', 1),
(3724, 227, 'Tafea', 'TA', 1),
(3725, 227, 'Torba', 'TO', 1),
(3726, 229, 'Amazonas', 'AM', 1),
(3727, 229, 'Anzoategui', 'AN', 1),
(3728, 229, 'Apure', 'AP', 1),
(3729, 229, 'Aragua', 'AR', 1),
(3730, 229, 'Barinas', 'BA', 1),
(3731, 229, 'Bolivar', 'BO', 1),
(3732, 229, 'Carabobo', 'CA', 1),
(3733, 229, 'Cojedes', 'CO', 1),
(3734, 229, 'Delta Amacuro', 'DA', 1),
(3735, 229, 'Dependencias Federales', 'DF', 1),
(3736, 229, 'Distrito Federal', 'DI', 1),
(3737, 229, 'Falcon', 'FA', 1),
(3738, 229, 'Guarico', 'GU', 1),
(3739, 229, 'Lara', 'LA', 1),
(3740, 229, 'Merida', 'ME', 1),
(3741, 229, 'Miranda', 'MI', 1),
(3742, 229, 'Monagas', 'MO', 1),
(3743, 229, 'Nueva Esparta', 'NE', 1),
(3744, 229, 'Portuguesa', 'PO', 1),
(3745, 229, 'Sucre', 'SU', 1),
(3746, 229, 'Tachira', 'TA', 1),
(3747, 229, 'Trujillo', 'TR', 1),
(3748, 229, 'Vargas', 'VA', 1),
(3749, 229, 'Yaracuy', 'YA', 1),
(3750, 229, 'Zulia', 'ZU', 1),
(3751, 230, 'An Giang', 'AG', 1),
(3752, 230, 'Bac Giang', 'BG', 1),
(3753, 230, 'Bac Kan', 'BK', 1),
(3754, 230, 'Bac Lieu', 'BL', 1),
(3755, 230, 'Bac Ninh', 'BC', 1),
(3756, 230, 'Ba Ria-Vung Tau', 'BR', 1),
(3757, 230, 'Ben Tre', 'BN', 1),
(3758, 230, 'Binh Dinh', 'BH', 1),
(3759, 230, 'Binh Duong', 'BU', 1),
(3760, 230, 'Binh Phuoc', 'BP', 1),
(3761, 230, 'Binh Thuan', 'BT', 1),
(3762, 230, 'Ca Mau', 'CM', 1),
(3763, 230, 'Can Tho', 'CT', 1),
(3764, 230, 'Cao Bang', 'CB', 1),
(3765, 230, 'Dak Lak', 'DL', 1),
(3766, 230, 'Dak Nong', 'DG', 1),
(3767, 230, 'Da Nang', 'DN', 1),
(3768, 230, 'Dien Bien', 'DB', 1),
(3769, 230, 'Dong Nai', 'DI', 1),
(3770, 230, 'Dong Thap', 'DT', 1),
(3771, 230, 'Gia Lai', 'GL', 1),
(3772, 230, 'Ha Giang', 'HG', 1),
(3773, 230, 'Hai Duong', 'HD', 1),
(3774, 230, 'Hai Phong', 'HP', 1),
(3775, 230, 'Ha Nam', 'HM', 1),
(3776, 230, 'Ha Noi', 'HI', 1),
(3777, 230, 'Ha Tay', 'HT', 1),
(3778, 230, 'Ha Tinh', 'HH', 1),
(3779, 230, 'Hoa Binh', 'HB', 1),
(3780, 230, 'Ho Chi Minh City', 'HC', 1),
(3781, 230, 'Hau Giang', 'HU', 1),
(3782, 230, 'Hung Yen', 'HY', 1),
(3783, 232, 'Saint Croix', 'C', 1),
(3784, 232, 'Saint John', 'J', 1),
(3785, 232, 'Saint Thomas', 'T', 1),
(3786, 233, 'Alo', 'A', 1),
(3787, 233, 'Sigave', 'S', 1),
(3788, 233, 'Wallis', 'W', 1),
(3789, 235, 'Abyan', 'AB', 1),
(3790, 235, 'Adan', 'AD', 1),
(3791, 235, 'Amran', 'AM', 1),
(3792, 235, 'Al Bayda', 'BA', 1),
(3793, 235, 'Ad Dali', 'DA', 1),
(3794, 235, 'Dhamar', 'DH', 1),
(3795, 235, 'Hadramawt', 'HD', 1),
(3796, 235, 'Hajjah', 'HJ', 1),
(3797, 235, 'Al Hudaydah', 'HU', 1),
(3798, 235, 'Ibb', 'IB', 1),
(3799, 235, 'Al Jawf', 'JA', 1),
(3800, 235, 'Lahij', 'LA', 1),
(3801, 235, 'Ma\'rib', 'MA', 1),
(3802, 235, 'Al Mahrah', 'MR', 1),
(3803, 235, 'Al Mahwit', 'MW', 1),
(3804, 235, 'Sa\'dah', 'SD', 1),
(3805, 235, 'San\'a', 'SN', 1),
(3806, 235, 'Shabwah', 'SH', 1),
(3807, 235, 'Ta\'izz', 'TA', 1),
(3812, 237, 'Bas-Congo', 'BC', 1),
(3813, 237, 'Bandundu', 'BN', 1),
(3814, 237, 'Equateur', 'EQ', 1),
(3815, 237, 'Katanga', 'KA', 1),
(3816, 237, 'Kasai-Oriental', 'KE', 1),
(3817, 237, 'Kinshasa', 'KN', 1),
(3818, 237, 'Kasai-Occidental', 'KW', 1),
(3819, 237, 'Maniema', 'MA', 1),
(3820, 237, 'Nord-Kivu', 'NK', 1),
(3821, 237, 'Orientale', 'OR', 1),
(3822, 237, 'Sud-Kivu', 'SK', 1),
(3823, 238, 'Central', 'CE', 1),
(3824, 238, 'Copperbelt', 'CB', 1),
(3825, 238, 'Eastern', 'EA', 1),
(3826, 238, 'Luapula', 'LP', 1),
(3827, 238, 'Lusaka', 'LK', 1),
(3828, 238, 'Northern', 'NO', 1),
(3829, 238, 'North-Western', 'NW', 1),
(3830, 238, 'Southern', 'SO', 1),
(3831, 238, 'Western', 'WE', 1),
(3832, 239, 'Bulawayo', 'BU', 1),
(3833, 239, 'Harare', 'HA', 1),
(3834, 239, 'Manicaland', 'ML', 1),
(3835, 239, 'Mashonaland Central', 'MC', 1),
(3836, 239, 'Mashonaland East', 'ME', 1),
(3837, 239, 'Mashonaland West', 'MW', 1),
(3838, 239, 'Masvingo', 'MV', 1),
(3839, 239, 'Matabeleland North', 'MN', 1),
(3840, 239, 'Matabeleland South', 'MS', 1),
(3841, 239, 'Midlands', 'MD', 1),
(3861, 105, 'Campobasso', 'CB', 1),
(3863, 105, 'Caserta', 'CE', 1),
(3864, 105, 'Catania', 'CT', 1),
(3865, 105, 'Catanzaro', 'CZ', 1),
(3866, 105, 'Chieti', 'CH', 1),
(3867, 105, 'Como', 'CO', 1),
(3868, 105, 'Cosenza', 'CS', 1),
(3869, 105, 'Cremona', 'CR', 1),
(3870, 105, 'Crotone', 'KR', 1),
(3871, 105, 'Cuneo', 'CN', 1),
(3872, 105, 'Enna', 'EN', 1),
(3873, 105, 'Ferrara', 'FE', 1),
(3874, 105, 'Firenze', 'FI', 1),
(3875, 105, 'Foggia', 'FG', 1),
(3876, 105, 'Forli-Cesena', 'FC', 1),
(3877, 105, 'Frosinone', 'FR', 1),
(3878, 105, 'Genova', 'GE', 1),
(3879, 105, 'Gorizia', 'GO', 1),
(3880, 105, 'Grosseto', 'GR', 1),
(3881, 105, 'Imperia', 'IM', 1),
(3882, 105, 'Isernia', 'IS', 1),
(3883, 105, 'L&#39;Aquila', 'AQ', 1),
(3884, 105, 'La Spezia', 'SP', 1),
(3885, 105, 'Latina', 'LT', 1),
(3886, 105, 'Lecce', 'LE', 1),
(3887, 105, 'Lecco', 'LC', 1),
(3888, 105, 'Livorno', 'LI', 1),
(3889, 105, 'Lodi', 'LO', 1),
(3890, 105, 'Lucca', 'LU', 1),
(3891, 105, 'Macerata', 'MC', 1),
(3892, 105, 'Mantova', 'MN', 1),
(3893, 105, 'Massa-Carrara', 'MS', 1),
(3894, 105, 'Matera', 'MT', 1),
(3896, 105, 'Messina', 'ME', 1),
(3897, 105, 'Milano', 'MI', 1),
(3898, 105, 'Modena', 'MO', 1),
(3899, 105, 'Napoli', 'NA', 1),
(3900, 105, 'Novara', 'NO', 1),
(3901, 105, 'Nuoro', 'NU', 1),
(3904, 105, 'Oristano', 'OR', 1),
(3905, 105, 'Padova', 'PD', 1),
(3906, 105, 'Palermo', 'PA', 1),
(3907, 105, 'Parma', 'PR', 1),
(3908, 105, 'Pavia', 'PV', 1),
(3909, 105, 'Perugia', 'PG', 1),
(3910, 105, 'Pesaro e Urbino', 'PU', 1),
(3911, 105, 'Pescara', 'PE', 1),
(3912, 105, 'Piacenza', 'PC', 1),
(3913, 105, 'Pisa', 'PI', 1),
(3914, 105, 'Pistoia', 'PT', 1),
(3915, 105, 'Pordenone', 'PN', 1),
(3916, 105, 'Potenza', 'PZ', 1),
(3917, 105, 'Prato', 'PO', 1),
(3918, 105, 'Ragusa', 'RG', 1),
(3919, 105, 'Ravenna', 'RA', 1),
(3920, 105, 'Reggio Calabria', 'RC', 1),
(3921, 105, 'Reggio Emilia', 'RE', 1),
(3922, 105, 'Rieti', 'RI', 1),
(3923, 105, 'Rimini', 'RN', 1),
(3924, 105, 'Roma', 'RM', 1),
(3925, 105, 'Rovigo', 'RO', 1),
(3926, 105, 'Salerno', 'SA', 1),
(3927, 105, 'Sassari', 'SS', 1),
(3928, 105, 'Savona', 'SV', 1),
(3929, 105, 'Siena', 'SI', 1),
(3930, 105, 'Siracusa', 'SR', 1),
(3931, 105, 'Sondrio', 'SO', 1),
(3932, 105, 'Taranto', 'TA', 1),
(3933, 105, 'Teramo', 'TE', 1),
(3934, 105, 'Terni', 'TR', 1),
(3935, 105, 'Torino', 'TO', 1),
(3936, 105, 'Trapani', 'TP', 1),
(3937, 105, 'Trento', 'TN', 1),
(3938, 105, 'Treviso', 'TV', 1),
(3939, 105, 'Trieste', 'TS', 1),
(3940, 105, 'Udine', 'UD', 1),
(3941, 105, 'Varese', 'VA', 1),
(3942, 105, 'Venezia', 'VE', 1),
(3943, 105, 'Verbano-Cusio-Ossola', 'VB', 1),
(3944, 105, 'Vercelli', 'VC', 1),
(3945, 105, 'Verona', 'VR', 1),
(3946, 105, 'Vibo Valentia', 'VV', 1),
(3947, 105, 'Vicenza', 'VI', 1),
(3948, 105, 'Viterbo', 'VT', 1),
(3949, 222, 'County Antrim', 'ANT', 1),
(3950, 222, 'County Armagh', 'ARM', 1),
(3951, 222, 'County Down', 'DOW', 1),
(3952, 222, 'County Fermanagh', 'FER', 1),
(3953, 222, 'County Londonderry', 'LDY', 1),
(3954, 222, 'County Tyrone', 'TYR', 1),
(3955, 222, 'Cumbria', 'CMA', 1),
(3956, 190, 'Pomurska', '1', 1),
(3957, 190, 'Podravska', '2', 1),
(3958, 190, 'Koroška', '3', 1),
(3959, 190, 'Savinjska', '4', 1),
(3960, 190, 'Zasavska', '5', 1),
(3961, 190, 'Spodnjeposavska', '6', 1),
(3962, 190, 'Jugovzhodna Slovenija', '7', 1),
(3963, 190, 'Osrednjeslovenska', '8', 1),
(3964, 190, 'Gorenjska', '9', 1),
(3965, 190, 'Notranjsko-kraška', '10', 1),
(3966, 190, 'Goriška', '11', 1),
(3967, 190, 'Obalno-kraška', '12', 1),
(3968, 33, 'Ruse', '', 1),
(3969, 101, 'Alborz', 'ALB', 1),
(3970, 21, 'Brussels-Capital Region', 'BRU', 1),
(3971, 138, 'Aguascalientes', 'AG', 1),
(3973, 242, 'Andrijevica', '01', 1),
(3974, 242, 'Bar', '02', 1),
(3975, 242, 'Berane', '03', 1),
(3976, 242, 'Bijelo Polje', '04', 1),
(3977, 242, 'Budva', '05', 1),
(3978, 242, 'Cetinje', '06', 1),
(3979, 242, 'Danilovgrad', '07', 1),
(3980, 242, 'Herceg-Novi', '08', 1),
(3981, 242, 'Kolašin', '09', 1),
(3982, 242, 'Kotor', '10', 1),
(3983, 242, 'Mojkovac', '11', 1),
(3984, 242, 'Nikšić', '12', 1),
(3985, 242, 'Plav', '13', 1),
(3986, 242, 'Pljevlja', '14', 1),
(3987, 242, 'Plužine', '15', 1),
(3988, 242, 'Podgorica', '16', 1),
(3989, 242, 'Rožaje', '17', 1),
(3990, 242, 'Šavnik', '18', 1),
(3991, 242, 'Tivat', '19', 1),
(3992, 242, 'Ulcinj', '20', 1),
(3993, 242, 'Žabljak', '21', 1),
(3994, 243, 'Belgrade', '00', 1),
(3995, 243, 'North Bačka', '01', 1),
(3996, 243, 'Central Banat', '02', 1),
(3997, 243, 'North Banat', '03', 1),
(3998, 243, 'South Banat', '04', 1),
(3999, 243, 'West Bačka', '05', 1),
(4000, 243, 'South Bačka', '06', 1),
(4001, 243, 'Srem', '07', 1),
(4002, 243, 'Mačva', '08', 1),
(4003, 243, 'Kolubara', '09', 1),
(4004, 243, 'Podunavlje', '10', 1),
(4005, 243, 'Braničevo', '11', 1),
(4006, 243, 'Šumadija', '12', 1),
(4007, 243, 'Pomoravlje', '13', 1),
(4008, 243, 'Bor', '14', 1),
(4009, 243, 'Zaječar', '15', 1),
(4010, 243, 'Zlatibor', '16', 1),
(4011, 243, 'Moravica', '17', 1),
(4012, 243, 'Raška', '18', 1),
(4013, 243, 'Rasina', '19', 1),
(4014, 243, 'Nišava', '20', 1),
(4015, 243, 'Toplica', '21', 1),
(4016, 243, 'Pirot', '22', 1),
(4017, 243, 'Jablanica', '23', 1),
(4018, 243, 'Pčinja', '24', 1),
(4020, 245, 'Bonaire', 'BO', 1),
(4021, 245, 'Saba', 'SA', 1),
(4022, 245, 'Sint Eustatius', 'SE', 1),
(4023, 248, 'Central Equatoria', 'EC', 1),
(4024, 248, 'Eastern Equatoria', 'EE', 1),
(4025, 248, 'Jonglei', 'JG', 1),
(4026, 248, 'Lakes', 'LK', 1),
(4027, 248, 'Northern Bahr el-Ghazal', 'BN', 1),
(4028, 248, 'Unity', 'UY', 1),
(4029, 248, 'Upper Nile', 'NU', 1),
(4030, 248, 'Warrap', 'WR', 1),
(4031, 248, 'Western Bahr el-Ghazal', 'BW', 1),
(4032, 248, 'Western Equatoria', 'EW', 1),
(4036, 117, 'Ainaži, Salacgrīvas novads', '0661405', 1),
(4037, 117, 'Aizkraukle, Aizkraukles novads', '0320201', 1),
(4038, 117, 'Aizkraukles novads', '0320200', 1),
(4039, 117, 'Aizpute, Aizputes novads', '0640605', 1),
(4040, 117, 'Aizputes novads', '0640600', 1),
(4041, 117, 'Aknīste, Aknīstes novads', '0560805', 1),
(4042, 117, 'Aknīstes novads', '0560800', 1),
(4043, 117, 'Aloja, Alojas novads', '0661007', 1),
(4044, 117, 'Alojas novads', '0661000', 1),
(4045, 117, 'Alsungas novads', '0624200', 1),
(4046, 117, 'Alūksne, Alūksnes novads', '0360201', 1),
(4047, 117, 'Alūksnes novads', '0360200', 1),
(4048, 117, 'Amatas novads', '0424701', 1),
(4049, 117, 'Ape, Apes novads', '0360805', 1),
(4050, 117, 'Apes novads', '0360800', 1),
(4051, 117, 'Auce, Auces novads', '0460805', 1),
(4052, 117, 'Auces novads', '0460800', 1),
(4053, 117, 'Ādažu novads', '0804400', 1),
(4054, 117, 'Babītes novads', '0804900', 1),
(4055, 117, 'Baldone, Baldones novads', '0800605', 1),
(4056, 117, 'Baldones novads', '0800600', 1),
(4057, 117, 'Baloži, Ķekavas novads', '0800807', 1),
(4058, 117, 'Baltinavas novads', '0384400', 1),
(4059, 117, 'Balvi, Balvu novads', '0380201', 1),
(4060, 117, 'Balvu novads', '0380200', 1),
(4061, 117, 'Bauska, Bauskas novads', '0400201', 1),
(4062, 117, 'Bauskas novads', '0400200', 1),
(4063, 117, 'Beverīnas novads', '0964700', 1),
(4064, 117, 'Brocēni, Brocēnu novads', '0840605', 1),
(4065, 117, 'Brocēnu novads', '0840601', 1),
(4066, 117, 'Burtnieku novads', '0967101', 1),
(4067, 117, 'Carnikavas novads', '0805200', 1),
(4068, 117, 'Cesvaine, Cesvaines novads', '0700807', 1),
(4069, 117, 'Cesvaines novads', '0700800', 1),
(4070, 117, 'Cēsis, Cēsu novads', '0420201', 1),
(4071, 117, 'Cēsu novads', '0420200', 1),
(4072, 117, 'Ciblas novads', '0684901', 1),
(4073, 117, 'Dagda, Dagdas novads', '0601009', 1),
(4074, 117, 'Dagdas novads', '0601000', 1),
(4075, 117, 'Daugavpils', '0050000', 1),
(4076, 117, 'Daugavpils novads', '0440200', 1),
(4077, 117, 'Dobele, Dobeles novads', '0460201', 1),
(4078, 117, 'Dobeles novads', '0460200', 1),
(4079, 117, 'Dundagas novads', '0885100', 1),
(4080, 117, 'Durbe, Durbes novads', '0640807', 1),
(4081, 117, 'Durbes novads', '0640801', 1),
(4082, 117, 'Engures novads', '0905100', 1),
(4083, 117, 'Ērgļu novads', '0705500', 1),
(4084, 117, 'Garkalnes novads', '0806000', 1),
(4085, 117, 'Grobiņa, Grobiņas novads', '0641009', 1),
(4086, 117, 'Grobiņas novads', '0641000', 1),
(4087, 117, 'Gulbene, Gulbenes novads', '0500201', 1),
(4088, 117, 'Gulbenes novads', '0500200', 1),
(4089, 117, 'Iecavas novads', '0406400', 1),
(4090, 117, 'Ikšķile, Ikšķiles novads', '0740605', 1),
(4091, 117, 'Ikšķiles novads', '0740600', 1),
(4092, 117, 'Ilūkste, Ilūkstes novads', '0440807', 1),
(4093, 117, 'Ilūkstes novads', '0440801', 1),
(4094, 117, 'Inčukalna novads', '0801800', 1),
(4095, 117, 'Jaunjelgava, Jaunjelgavas novads', '0321007', 1),
(4096, 117, 'Jaunjelgavas novads', '0321000', 1),
(4097, 117, 'Jaunpiebalgas novads', '0425700', 1),
(4098, 117, 'Jaunpils novads', '0905700', 1),
(4099, 117, 'Jelgava', '0090000', 1),
(4100, 117, 'Jelgavas novads', '0540200', 1),
(4101, 117, 'Jēkabpils', '0110000', 1),
(4102, 117, 'Jēkabpils novads', '0560200', 1),
(4103, 117, 'Jūrmala', '0130000', 1),
(4104, 117, 'Kalnciems, Jelgavas novads', '0540211', 1),
(4105, 117, 'Kandava, Kandavas novads', '0901211', 1),
(4106, 117, 'Kandavas novads', '0901201', 1),
(4107, 117, 'Kārsava, Kārsavas novads', '0681009', 1),
(4108, 117, 'Kārsavas novads', '0681000', 1),
(4109, 117, 'Kocēnu novads ,bij. Valmieras)', '0960200', 1),
(4110, 117, 'Kokneses novads', '0326100', 1),
(4111, 117, 'Krāslava, Krāslavas novads', '0600201', 1),
(4112, 117, 'Krāslavas novads', '0600202', 1),
(4113, 117, 'Krimuldas novads', '0806900', 1),
(4114, 117, 'Krustpils novads', '0566900', 1),
(4115, 117, 'Kuldīga, Kuldīgas novads', '0620201', 1),
(4116, 117, 'Kuldīgas novads', '0620200', 1),
(4117, 117, 'Ķeguma novads', '0741001', 1),
(4118, 117, 'Ķegums, Ķeguma novads', '0741009', 1),
(4119, 117, 'Ķekavas novads', '0800800', 1),
(4120, 117, 'Lielvārde, Lielvārdes novads', '0741413', 1),
(4121, 117, 'Lielvārdes novads', '0741401', 1),
(4122, 117, 'Liepāja', '0170000', 1),
(4123, 117, 'Limbaži, Limbažu novads', '0660201', 1),
(4124, 117, 'Limbažu novads', '0660200', 1),
(4125, 117, 'Līgatne, Līgatnes novads', '0421211', 1),
(4126, 117, 'Līgatnes novads', '0421200', 1),
(4127, 117, 'Līvāni, Līvānu novads', '0761211', 1),
(4128, 117, 'Līvānu novads', '0761201', 1),
(4129, 117, 'Lubāna, Lubānas novads', '0701413', 1),
(4130, 117, 'Lubānas novads', '0701400', 1),
(4131, 117, 'Ludza, Ludzas novads', '0680201', 1),
(4132, 117, 'Ludzas novads', '0680200', 1),
(4133, 117, 'Madona, Madonas novads', '0700201', 1),
(4134, 117, 'Madonas novads', '0700200', 1),
(4135, 117, 'Mazsalaca, Mazsalacas novads', '0961011', 1),
(4136, 117, 'Mazsalacas novads', '0961000', 1),
(4137, 117, 'Mālpils novads', '0807400', 1),
(4138, 117, 'Mārupes novads', '0807600', 1),
(4139, 117, 'Mērsraga novads', '0887600', 1),
(4140, 117, 'Naukšēnu novads', '0967300', 1),
(4141, 117, 'Neretas novads', '0327100', 1),
(4142, 117, 'Nīcas novads', '0647900', 1),
(4143, 117, 'Ogre, Ogres novads', '0740201', 1),
(4144, 117, 'Ogres novads', '0740202', 1),
(4145, 117, 'Olaine, Olaines novads', '0801009', 1),
(4146, 117, 'Olaines novads', '0801000', 1),
(4147, 117, 'Ozolnieku novads', '0546701', 1),
(4148, 117, 'Pārgaujas novads', '0427500', 1),
(4149, 117, 'Pāvilosta, Pāvilostas novads', '0641413', 1),
(4150, 117, 'Pāvilostas novads', '0641401', 1),
(4151, 117, 'Piltene, Ventspils novads', '0980213', 1),
(4152, 117, 'Pļaviņas, Pļaviņu novads', '0321413', 1),
(4153, 117, 'Pļaviņu novads', '0321400', 1),
(4154, 117, 'Preiļi, Preiļu novads', '0760201', 1),
(4155, 117, 'Preiļu novads', '0760202', 1),
(4156, 117, 'Priekule, Priekules novads', '0641615', 1),
(4157, 117, 'Priekules novads', '0641600', 1),
(4158, 117, 'Priekuļu novads', '0427300', 1),
(4159, 117, 'Raunas novads', '0427700', 1),
(4160, 117, 'Rēzekne', '0210000', 1),
(4161, 117, 'Rēzeknes novads', '0780200', 1),
(4162, 117, 'Riebiņu novads', '0766300', 1),
(4163, 117, 'Rīga', '0010000', 1),
(4164, 117, 'Rojas novads', '0888300', 1),
(4165, 117, 'Ropažu novads', '0808400', 1),
(4166, 117, 'Rucavas novads', '0648500', 1),
(4167, 117, 'Rugāju novads', '0387500', 1),
(4168, 117, 'Rundāles novads', '0407700', 1),
(4169, 117, 'Rūjiena, Rūjienas novads', '0961615', 1),
(4170, 117, 'Rūjienas novads', '0961600', 1),
(4171, 117, 'Sabile, Talsu novads', '0880213', 1),
(4172, 117, 'Salacgrīva, Salacgrīvas novads', '0661415', 1),
(4173, 117, 'Salacgrīvas novads', '0661400', 1),
(4174, 117, 'Salas novads', '0568700', 1),
(4175, 117, 'Salaspils novads', '0801200', 1),
(4176, 117, 'Salaspils, Salaspils novads', '0801211', 1),
(4177, 117, 'Saldus novads', '0840200', 1),
(4178, 117, 'Saldus, Saldus novads', '0840201', 1),
(4179, 117, 'Saulkrasti, Saulkrastu novads', '0801413', 1),
(4180, 117, 'Saulkrastu novads', '0801400', 1),
(4181, 117, 'Seda, Strenču novads', '0941813', 1),
(4182, 117, 'Sējas novads', '0809200', 1),
(4183, 117, 'Sigulda, Siguldas novads', '0801615', 1),
(4184, 117, 'Siguldas novads', '0801601', 1),
(4185, 117, 'Skrīveru novads', '0328200', 1),
(4186, 117, 'Skrunda, Skrundas novads', '0621209', 1),
(4187, 117, 'Skrundas novads', '0621200', 1),
(4188, 117, 'Smiltene, Smiltenes novads', '0941615', 1),
(4189, 117, 'Smiltenes novads', '0941600', 1),
(4190, 117, 'Staicele, Alojas novads', '0661017', 1),
(4191, 117, 'Stende, Talsu novads', '0880215', 1),
(4192, 117, 'Stopiņu novads', '0809600', 1),
(4193, 117, 'Strenči, Strenču novads', '0941817', 1),
(4194, 117, 'Strenču novads', '0941800', 1),
(4195, 117, 'Subate, Ilūkstes novads', '0440815', 1),
(4196, 117, 'Talsi, Talsu novads', '0880201', 1),
(4197, 117, 'Talsu novads', '0880200', 1),
(4198, 117, 'Tērvetes novads', '0468900', 1),
(4199, 117, 'Tukuma novads', '0900200', 1),
(4200, 117, 'Tukums, Tukuma novads', '0900201', 1),
(4201, 117, 'Vaiņodes novads', '0649300', 1),
(4202, 117, 'Valdemārpils, Talsu novads', '0880217', 1),
(4203, 117, 'Valka, Valkas novads', '0940201', 1),
(4204, 117, 'Valkas novads', '0940200', 1),
(4205, 117, 'Valmiera', '0250000', 1),
(4206, 117, 'Vangaži, Inčukalna novads', '0801817', 1),
(4207, 117, 'Varakļāni, Varakļānu novads', '0701817', 1),
(4208, 117, 'Varakļānu novads', '0701800', 1),
(4209, 117, 'Vārkavas novads', '0769101', 1),
(4210, 117, 'Vecpiebalgas novads', '0429300', 1),
(4211, 117, 'Vecumnieku novads', '0409500', 1),
(4212, 117, 'Ventspils', '0270000', 1),
(4213, 117, 'Ventspils novads', '0980200', 1),
(4214, 117, 'Viesīte, Viesītes novads', '0561815', 1),
(4215, 117, 'Viesītes novads', '0561800', 1),
(4216, 117, 'Viļaka, Viļakas novads', '0381615', 1),
(4217, 117, 'Viļakas novads', '0381600', 1),
(4218, 117, 'Viļāni, Viļānu novads', '0781817', 1),
(4219, 117, 'Viļānu novads', '0781800', 1),
(4220, 117, 'Zilupe, Zilupes novads', '0681817', 1),
(4221, 117, 'Zilupes novads', '0681801', 1),
(4222, 43, 'Arica y Parinacota', 'AP', 1),
(4223, 43, 'Los Rios', 'LR', 1),
(4224, 220, 'Kharkivs\'ka Oblast\'', '63', 1),
(4225, 118, 'Beirut', 'LB-BR', 1),
(4226, 118, 'Bekaa', 'LB-BE', 1),
(4227, 118, 'Mount Lebanon', 'LB-ML', 1),
(4228, 118, 'Nabatieh', 'LB-NB', 1),
(4229, 118, 'North', 'LB-NR', 1),
(4230, 118, 'South', 'LB-ST', 1),
(4231, 99, 'Telangana', 'TS', 1),
(4232, 44, 'Qinghai', 'QH', 1),
(4233, 100, 'Papua Barat', 'PB', 1),
(4234, 100, 'Sulawesi Barat', 'SR', 1),
(4235, 100, 'Kepulauan Riau', 'KR', 1),
(4236, 105, 'Barletta-Andria-Trani', 'BT', 1),
(4237, 105, 'Fermo', 'FM', 1),
(4238, 105, 'Monza Brianza', 'MB', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_zone_to_geo_zone`
--

DROP TABLE IF EXISTS `oc_zone_to_geo_zone`;
CREATE TABLE `oc_zone_to_geo_zone` (
  `zone_to_geo_zone_id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  `zone_id` int(11) NOT NULL DEFAULT '0',
  `geo_zone_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_zone_to_geo_zone`
--

INSERT INTO `oc_zone_to_geo_zone` (`zone_to_geo_zone_id`, `country_id`, `zone_id`, `geo_zone_id`, `date_added`, `date_modified`) VALUES
(1, 222, 0, 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 222, 3513, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 222, 3514, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 222, 3515, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 222, 3516, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 222, 3517, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, 222, 3518, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, 222, 3519, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, 222, 3520, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(10, 222, 3521, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(11, 222, 3522, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(12, 222, 3523, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(13, 222, 3524, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(14, 222, 3525, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(15, 222, 3526, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(16, 222, 3527, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(17, 222, 3528, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(18, 222, 3529, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(19, 222, 3530, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(20, 222, 3531, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(21, 222, 3532, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(22, 222, 3533, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(23, 222, 3534, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(24, 222, 3535, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(25, 222, 3536, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(26, 222, 3537, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(27, 222, 3538, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(28, 222, 3539, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(29, 222, 3540, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(30, 222, 3541, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(31, 222, 3542, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(32, 222, 3543, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(33, 222, 3544, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(34, 222, 3545, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(35, 222, 3546, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(36, 222, 3547, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(37, 222, 3548, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(38, 222, 3549, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(39, 222, 3550, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(40, 222, 3551, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(41, 222, 3552, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(42, 222, 3553, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(43, 222, 3554, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(44, 222, 3555, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(45, 222, 3556, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(46, 222, 3557, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(47, 222, 3558, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(48, 222, 3559, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(49, 222, 3560, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(50, 222, 3561, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(51, 222, 3562, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(52, 222, 3563, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(53, 222, 3564, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(54, 222, 3565, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(55, 222, 3566, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(56, 222, 3567, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(57, 222, 3568, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(58, 222, 3569, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(59, 222, 3570, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(60, 222, 3571, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(61, 222, 3572, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(62, 222, 3573, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(63, 222, 3574, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(64, 222, 3575, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(65, 222, 3576, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(66, 222, 3577, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(67, 222, 3578, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(68, 222, 3579, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(69, 222, 3580, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(70, 222, 3581, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(71, 222, 3582, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(72, 222, 3583, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(73, 222, 3584, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(74, 222, 3585, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(75, 222, 3586, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(76, 222, 3587, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(77, 222, 3588, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(78, 222, 3589, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(79, 222, 3590, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(80, 222, 3591, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(81, 222, 3592, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(82, 222, 3593, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(83, 222, 3594, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(84, 222, 3595, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(85, 222, 3596, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(86, 222, 3597, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(87, 222, 3598, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(88, 222, 3599, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(89, 222, 3600, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(90, 222, 3601, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(91, 222, 3602, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(92, 222, 3603, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(93, 222, 3604, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(94, 222, 3605, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(95, 222, 3606, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(96, 222, 3607, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(97, 222, 3608, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(98, 222, 3609, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(99, 222, 3610, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(100, 222, 3611, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(101, 222, 3612, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(102, 222, 3949, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(103, 222, 3950, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(104, 222, 3951, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(105, 222, 3952, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(106, 222, 3953, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(107, 222, 3954, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(108, 222, 3955, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(109, 222, 3972, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `oc_address`
--
ALTER TABLE `oc_address`
  ADD PRIMARY KEY (`address_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `oc_api`
--
ALTER TABLE `oc_api`
  ADD PRIMARY KEY (`api_id`);

--
-- Indexes for table `oc_api_ip`
--
ALTER TABLE `oc_api_ip`
  ADD PRIMARY KEY (`api_ip_id`);

--
-- Indexes for table `oc_api_session`
--
ALTER TABLE `oc_api_session`
  ADD PRIMARY KEY (`api_session_id`);

--
-- Indexes for table `oc_article`
--
ALTER TABLE `oc_article`
  ADD PRIMARY KEY (`article_id`);

--
-- Indexes for table `oc_article_description`
--
ALTER TABLE `oc_article_description`
  ADD PRIMARY KEY (`article_id`,`language_id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `oc_article_list`
--
ALTER TABLE `oc_article_list`
  ADD PRIMARY KEY (`article_list_id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `oc_attribute`
--
ALTER TABLE `oc_attribute`
  ADD PRIMARY KEY (`attribute_id`);

--
-- Indexes for table `oc_attribute_description`
--
ALTER TABLE `oc_attribute_description`
  ADD PRIMARY KEY (`attribute_id`,`language_id`);

--
-- Indexes for table `oc_attribute_group`
--
ALTER TABLE `oc_attribute_group`
  ADD PRIMARY KEY (`attribute_group_id`);

--
-- Indexes for table `oc_attribute_group_description`
--
ALTER TABLE `oc_attribute_group_description`
  ADD PRIMARY KEY (`attribute_group_id`,`language_id`);

--
-- Indexes for table `oc_banner`
--
ALTER TABLE `oc_banner`
  ADD PRIMARY KEY (`banner_id`);

--
-- Indexes for table `oc_banner_image`
--
ALTER TABLE `oc_banner_image`
  ADD PRIMARY KEY (`banner_image_id`);

--
-- Indexes for table `oc_cart`
--
ALTER TABLE `oc_cart`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `cart_id` (`api_id`,`customer_id`,`session_id`,`product_id`,`recurring_id`);

--
-- Indexes for table `oc_category`
--
ALTER TABLE `oc_category`
  ADD PRIMARY KEY (`category_id`),
  ADD KEY `parent_id` (`parent_id`);

--
-- Indexes for table `oc_category_description`
--
ALTER TABLE `oc_category_description`
  ADD PRIMARY KEY (`category_id`,`language_id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `oc_category_filter`
--
ALTER TABLE `oc_category_filter`
  ADD PRIMARY KEY (`category_id`,`filter_id`);

--
-- Indexes for table `oc_category_path`
--
ALTER TABLE `oc_category_path`
  ADD PRIMARY KEY (`category_id`,`path_id`);

--
-- Indexes for table `oc_category_to_layout`
--
ALTER TABLE `oc_category_to_layout`
  ADD PRIMARY KEY (`category_id`,`store_id`);

--
-- Indexes for table `oc_category_to_store`
--
ALTER TABLE `oc_category_to_store`
  ADD PRIMARY KEY (`category_id`,`store_id`);

--
-- Indexes for table `oc_cmsblock`
--
ALTER TABLE `oc_cmsblock`
  ADD PRIMARY KEY (`cmsblock_id`);

--
-- Indexes for table `oc_cmsblock_description`
--
ALTER TABLE `oc_cmsblock_description`
  ADD PRIMARY KEY (`cmsblock_des_id`,`language_id`);

--
-- Indexes for table `oc_country`
--
ALTER TABLE `oc_country`
  ADD PRIMARY KEY (`country_id`);

--
-- Indexes for table `oc_coupon`
--
ALTER TABLE `oc_coupon`
  ADD PRIMARY KEY (`coupon_id`);

--
-- Indexes for table `oc_coupon_category`
--
ALTER TABLE `oc_coupon_category`
  ADD PRIMARY KEY (`coupon_id`,`category_id`);

--
-- Indexes for table `oc_coupon_history`
--
ALTER TABLE `oc_coupon_history`
  ADD PRIMARY KEY (`coupon_history_id`);

--
-- Indexes for table `oc_coupon_product`
--
ALTER TABLE `oc_coupon_product`
  ADD PRIMARY KEY (`coupon_product_id`);

--
-- Indexes for table `oc_currency`
--
ALTER TABLE `oc_currency`
  ADD PRIMARY KEY (`currency_id`);

--
-- Indexes for table `oc_customer`
--
ALTER TABLE `oc_customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `oc_customer_activity`
--
ALTER TABLE `oc_customer_activity`
  ADD PRIMARY KEY (`customer_activity_id`);

--
-- Indexes for table `oc_customer_affiliate`
--
ALTER TABLE `oc_customer_affiliate`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `oc_customer_approval`
--
ALTER TABLE `oc_customer_approval`
  ADD PRIMARY KEY (`customer_approval_id`);

--
-- Indexes for table `oc_customer_group`
--
ALTER TABLE `oc_customer_group`
  ADD PRIMARY KEY (`customer_group_id`);

--
-- Indexes for table `oc_customer_group_description`
--
ALTER TABLE `oc_customer_group_description`
  ADD PRIMARY KEY (`customer_group_id`,`language_id`);

--
-- Indexes for table `oc_customer_history`
--
ALTER TABLE `oc_customer_history`
  ADD PRIMARY KEY (`customer_history_id`);

--
-- Indexes for table `oc_customer_ip`
--
ALTER TABLE `oc_customer_ip`
  ADD PRIMARY KEY (`customer_ip_id`),
  ADD KEY `ip` (`ip`);

--
-- Indexes for table `oc_customer_login`
--
ALTER TABLE `oc_customer_login`
  ADD PRIMARY KEY (`customer_login_id`),
  ADD KEY `email` (`email`),
  ADD KEY `ip` (`ip`);

--
-- Indexes for table `oc_customer_online`
--
ALTER TABLE `oc_customer_online`
  ADD PRIMARY KEY (`ip`);

--
-- Indexes for table `oc_customer_reward`
--
ALTER TABLE `oc_customer_reward`
  ADD PRIMARY KEY (`customer_reward_id`);

--
-- Indexes for table `oc_customer_search`
--
ALTER TABLE `oc_customer_search`
  ADD PRIMARY KEY (`customer_search_id`);

--
-- Indexes for table `oc_customer_transaction`
--
ALTER TABLE `oc_customer_transaction`
  ADD PRIMARY KEY (`customer_transaction_id`);

--
-- Indexes for table `oc_customer_wishlist`
--
ALTER TABLE `oc_customer_wishlist`
  ADD PRIMARY KEY (`customer_id`,`product_id`);

--
-- Indexes for table `oc_custom_field`
--
ALTER TABLE `oc_custom_field`
  ADD PRIMARY KEY (`custom_field_id`);

--
-- Indexes for table `oc_custom_field_customer_group`
--
ALTER TABLE `oc_custom_field_customer_group`
  ADD PRIMARY KEY (`custom_field_id`,`customer_group_id`);

--
-- Indexes for table `oc_custom_field_description`
--
ALTER TABLE `oc_custom_field_description`
  ADD PRIMARY KEY (`custom_field_id`,`language_id`);

--
-- Indexes for table `oc_custom_field_value`
--
ALTER TABLE `oc_custom_field_value`
  ADD PRIMARY KEY (`custom_field_value_id`);

--
-- Indexes for table `oc_custom_field_value_description`
--
ALTER TABLE `oc_custom_field_value_description`
  ADD PRIMARY KEY (`custom_field_value_id`,`language_id`);

--
-- Indexes for table `oc_download`
--
ALTER TABLE `oc_download`
  ADD PRIMARY KEY (`download_id`);

--
-- Indexes for table `oc_download_description`
--
ALTER TABLE `oc_download_description`
  ADD PRIMARY KEY (`download_id`,`language_id`);

--
-- Indexes for table `oc_event`
--
ALTER TABLE `oc_event`
  ADD PRIMARY KEY (`event_id`);

--
-- Indexes for table `oc_extension`
--
ALTER TABLE `oc_extension`
  ADD PRIMARY KEY (`extension_id`);

--
-- Indexes for table `oc_extension_install`
--
ALTER TABLE `oc_extension_install`
  ADD PRIMARY KEY (`extension_install_id`);

--
-- Indexes for table `oc_extension_path`
--
ALTER TABLE `oc_extension_path`
  ADD PRIMARY KEY (`extension_path_id`);

--
-- Indexes for table `oc_filter`
--
ALTER TABLE `oc_filter`
  ADD PRIMARY KEY (`filter_id`);

--
-- Indexes for table `oc_filter_description`
--
ALTER TABLE `oc_filter_description`
  ADD PRIMARY KEY (`filter_id`,`language_id`);

--
-- Indexes for table `oc_filter_group`
--
ALTER TABLE `oc_filter_group`
  ADD PRIMARY KEY (`filter_group_id`);

--
-- Indexes for table `oc_filter_group_description`
--
ALTER TABLE `oc_filter_group_description`
  ADD PRIMARY KEY (`filter_group_id`,`language_id`);

--
-- Indexes for table `oc_geo_zone`
--
ALTER TABLE `oc_geo_zone`
  ADD PRIMARY KEY (`geo_zone_id`);

--
-- Indexes for table `oc_information`
--
ALTER TABLE `oc_information`
  ADD PRIMARY KEY (`information_id`);

--
-- Indexes for table `oc_information_description`
--
ALTER TABLE `oc_information_description`
  ADD PRIMARY KEY (`information_id`,`language_id`);

--
-- Indexes for table `oc_information_to_layout`
--
ALTER TABLE `oc_information_to_layout`
  ADD PRIMARY KEY (`information_id`,`store_id`);

--
-- Indexes for table `oc_information_to_store`
--
ALTER TABLE `oc_information_to_store`
  ADD PRIMARY KEY (`information_id`,`store_id`);

--
-- Indexes for table `oc_language`
--
ALTER TABLE `oc_language`
  ADD PRIMARY KEY (`language_id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `oc_layout`
--
ALTER TABLE `oc_layout`
  ADD PRIMARY KEY (`layout_id`);

--
-- Indexes for table `oc_layout_module`
--
ALTER TABLE `oc_layout_module`
  ADD PRIMARY KEY (`layout_module_id`);

--
-- Indexes for table `oc_layout_route`
--
ALTER TABLE `oc_layout_route`
  ADD PRIMARY KEY (`layout_route_id`);

--
-- Indexes for table `oc_length_class`
--
ALTER TABLE `oc_length_class`
  ADD PRIMARY KEY (`length_class_id`);

--
-- Indexes for table `oc_length_class_description`
--
ALTER TABLE `oc_length_class_description`
  ADD PRIMARY KEY (`length_class_id`,`language_id`);

--
-- Indexes for table `oc_location`
--
ALTER TABLE `oc_location`
  ADD PRIMARY KEY (`location_id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `oc_manufacturer`
--
ALTER TABLE `oc_manufacturer`
  ADD PRIMARY KEY (`manufacturer_id`);

--
-- Indexes for table `oc_manufacturer_to_store`
--
ALTER TABLE `oc_manufacturer_to_store`
  ADD PRIMARY KEY (`manufacturer_id`,`store_id`);

--
-- Indexes for table `oc_marketing`
--
ALTER TABLE `oc_marketing`
  ADD PRIMARY KEY (`marketing_id`);

--
-- Indexes for table `oc_modification`
--
ALTER TABLE `oc_modification`
  ADD PRIMARY KEY (`modification_id`);

--
-- Indexes for table `oc_module`
--
ALTER TABLE `oc_module`
  ADD PRIMARY KEY (`module_id`);

--
-- Indexes for table `oc_ocslideshow`
--
ALTER TABLE `oc_ocslideshow`
  ADD PRIMARY KEY (`ocslideshow_id`);

--
-- Indexes for table `oc_ocslideshow_image`
--
ALTER TABLE `oc_ocslideshow_image`
  ADD PRIMARY KEY (`ocslideshow_image_id`);

--
-- Indexes for table `oc_ocslideshow_image_description`
--
ALTER TABLE `oc_ocslideshow_image_description`
  ADD PRIMARY KEY (`ocslideshow_image_id`,`language_id`);

--
-- Indexes for table `oc_option`
--
ALTER TABLE `oc_option`
  ADD PRIMARY KEY (`option_id`);

--
-- Indexes for table `oc_option_description`
--
ALTER TABLE `oc_option_description`
  ADD PRIMARY KEY (`option_id`,`language_id`);

--
-- Indexes for table `oc_option_value`
--
ALTER TABLE `oc_option_value`
  ADD PRIMARY KEY (`option_value_id`);

--
-- Indexes for table `oc_option_value_description`
--
ALTER TABLE `oc_option_value_description`
  ADD PRIMARY KEY (`option_value_id`,`language_id`);

--
-- Indexes for table `oc_order`
--
ALTER TABLE `oc_order`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `oc_order_history`
--
ALTER TABLE `oc_order_history`
  ADD PRIMARY KEY (`order_history_id`);

--
-- Indexes for table `oc_order_option`
--
ALTER TABLE `oc_order_option`
  ADD PRIMARY KEY (`order_option_id`);

--
-- Indexes for table `oc_order_product`
--
ALTER TABLE `oc_order_product`
  ADD PRIMARY KEY (`order_product_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `oc_order_recurring`
--
ALTER TABLE `oc_order_recurring`
  ADD PRIMARY KEY (`order_recurring_id`);

--
-- Indexes for table `oc_order_recurring_transaction`
--
ALTER TABLE `oc_order_recurring_transaction`
  ADD PRIMARY KEY (`order_recurring_transaction_id`);

--
-- Indexes for table `oc_order_shipment`
--
ALTER TABLE `oc_order_shipment`
  ADD PRIMARY KEY (`order_shipment_id`);

--
-- Indexes for table `oc_order_status`
--
ALTER TABLE `oc_order_status`
  ADD PRIMARY KEY (`order_status_id`,`language_id`);

--
-- Indexes for table `oc_order_total`
--
ALTER TABLE `oc_order_total`
  ADD PRIMARY KEY (`order_total_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `oc_order_voucher`
--
ALTER TABLE `oc_order_voucher`
  ADD PRIMARY KEY (`order_voucher_id`);

--
-- Indexes for table `oc_product`
--
ALTER TABLE `oc_product`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `oc_product_attribute`
--
ALTER TABLE `oc_product_attribute`
  ADD PRIMARY KEY (`product_id`,`attribute_id`,`language_id`);

--
-- Indexes for table `oc_product_description`
--
ALTER TABLE `oc_product_description`
  ADD PRIMARY KEY (`product_id`,`language_id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `oc_product_discount`
--
ALTER TABLE `oc_product_discount`
  ADD PRIMARY KEY (`product_discount_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `oc_product_filter`
--
ALTER TABLE `oc_product_filter`
  ADD PRIMARY KEY (`product_id`,`filter_id`);

--
-- Indexes for table `oc_product_image`
--
ALTER TABLE `oc_product_image`
  ADD PRIMARY KEY (`product_image_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `oc_product_option`
--
ALTER TABLE `oc_product_option`
  ADD PRIMARY KEY (`product_option_id`);

--
-- Indexes for table `oc_product_option_value`
--
ALTER TABLE `oc_product_option_value`
  ADD PRIMARY KEY (`product_option_value_id`);

--
-- Indexes for table `oc_product_recurring`
--
ALTER TABLE `oc_product_recurring`
  ADD PRIMARY KEY (`product_id`,`recurring_id`,`customer_group_id`);

--
-- Indexes for table `oc_product_related`
--
ALTER TABLE `oc_product_related`
  ADD PRIMARY KEY (`product_id`,`related_id`);

--
-- Indexes for table `oc_product_reward`
--
ALTER TABLE `oc_product_reward`
  ADD PRIMARY KEY (`product_reward_id`);

--
-- Indexes for table `oc_product_special`
--
ALTER TABLE `oc_product_special`
  ADD PRIMARY KEY (`product_special_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `oc_product_to_category`
--
ALTER TABLE `oc_product_to_category`
  ADD PRIMARY KEY (`product_id`,`category_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `oc_product_to_download`
--
ALTER TABLE `oc_product_to_download`
  ADD PRIMARY KEY (`product_id`,`download_id`);

--
-- Indexes for table `oc_product_to_layout`
--
ALTER TABLE `oc_product_to_layout`
  ADD PRIMARY KEY (`product_id`,`store_id`);

--
-- Indexes for table `oc_product_to_store`
--
ALTER TABLE `oc_product_to_store`
  ADD PRIMARY KEY (`product_id`,`store_id`);

--
-- Indexes for table `oc_recurring`
--
ALTER TABLE `oc_recurring`
  ADD PRIMARY KEY (`recurring_id`);

--
-- Indexes for table `oc_recurring_description`
--
ALTER TABLE `oc_recurring_description`
  ADD PRIMARY KEY (`recurring_id`,`language_id`);

--
-- Indexes for table `oc_return`
--
ALTER TABLE `oc_return`
  ADD PRIMARY KEY (`return_id`);

--
-- Indexes for table `oc_return_action`
--
ALTER TABLE `oc_return_action`
  ADD PRIMARY KEY (`return_action_id`,`language_id`);

--
-- Indexes for table `oc_return_history`
--
ALTER TABLE `oc_return_history`
  ADD PRIMARY KEY (`return_history_id`);

--
-- Indexes for table `oc_return_reason`
--
ALTER TABLE `oc_return_reason`
  ADD PRIMARY KEY (`return_reason_id`,`language_id`);

--
-- Indexes for table `oc_return_status`
--
ALTER TABLE `oc_return_status`
  ADD PRIMARY KEY (`return_status_id`,`language_id`);

--
-- Indexes for table `oc_review`
--
ALTER TABLE `oc_review`
  ADD PRIMARY KEY (`review_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `oc_seo_url`
--
ALTER TABLE `oc_seo_url`
  ADD PRIMARY KEY (`seo_url_id`),
  ADD KEY `query` (`query`),
  ADD KEY `keyword` (`keyword`);

--
-- Indexes for table `oc_session`
--
ALTER TABLE `oc_session`
  ADD PRIMARY KEY (`session_id`);

--
-- Indexes for table `oc_setting`
--
ALTER TABLE `oc_setting`
  ADD PRIMARY KEY (`setting_id`);

--
-- Indexes for table `oc_shipping_courier`
--
ALTER TABLE `oc_shipping_courier`
  ADD PRIMARY KEY (`shipping_courier_id`);

--
-- Indexes for table `oc_statistics`
--
ALTER TABLE `oc_statistics`
  ADD PRIMARY KEY (`statistics_id`);

--
-- Indexes for table `oc_stock_status`
--
ALTER TABLE `oc_stock_status`
  ADD PRIMARY KEY (`stock_status_id`,`language_id`);

--
-- Indexes for table `oc_store`
--
ALTER TABLE `oc_store`
  ADD PRIMARY KEY (`store_id`);

--
-- Indexes for table `oc_subscribe`
--
ALTER TABLE `oc_subscribe`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Index_2` (`email_id`);

--
-- Indexes for table `oc_tax_class`
--
ALTER TABLE `oc_tax_class`
  ADD PRIMARY KEY (`tax_class_id`);

--
-- Indexes for table `oc_tax_rate`
--
ALTER TABLE `oc_tax_rate`
  ADD PRIMARY KEY (`tax_rate_id`);

--
-- Indexes for table `oc_tax_rate_to_customer_group`
--
ALTER TABLE `oc_tax_rate_to_customer_group`
  ADD PRIMARY KEY (`tax_rate_id`,`customer_group_id`);

--
-- Indexes for table `oc_tax_rule`
--
ALTER TABLE `oc_tax_rule`
  ADD PRIMARY KEY (`tax_rule_id`);

--
-- Indexes for table `oc_testimonial`
--
ALTER TABLE `oc_testimonial`
  ADD PRIMARY KEY (`testimonial_id`);

--
-- Indexes for table `oc_testimonial_description`
--
ALTER TABLE `oc_testimonial_description`
  ADD PRIMARY KEY (`testimonial_id`,`language_id`);

--
-- Indexes for table `oc_theme`
--
ALTER TABLE `oc_theme`
  ADD PRIMARY KEY (`theme_id`);

--
-- Indexes for table `oc_translation`
--
ALTER TABLE `oc_translation`
  ADD PRIMARY KEY (`translation_id`);

--
-- Indexes for table `oc_upload`
--
ALTER TABLE `oc_upload`
  ADD PRIMARY KEY (`upload_id`);

--
-- Indexes for table `oc_user`
--
ALTER TABLE `oc_user`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `oc_user_group`
--
ALTER TABLE `oc_user_group`
  ADD PRIMARY KEY (`user_group_id`);

--
-- Indexes for table `oc_voucher`
--
ALTER TABLE `oc_voucher`
  ADD PRIMARY KEY (`voucher_id`);

--
-- Indexes for table `oc_voucher_history`
--
ALTER TABLE `oc_voucher_history`
  ADD PRIMARY KEY (`voucher_history_id`);

--
-- Indexes for table `oc_voucher_theme`
--
ALTER TABLE `oc_voucher_theme`
  ADD PRIMARY KEY (`voucher_theme_id`);

--
-- Indexes for table `oc_voucher_theme_description`
--
ALTER TABLE `oc_voucher_theme_description`
  ADD PRIMARY KEY (`voucher_theme_id`,`language_id`);

--
-- Indexes for table `oc_weight_class`
--
ALTER TABLE `oc_weight_class`
  ADD PRIMARY KEY (`weight_class_id`);

--
-- Indexes for table `oc_weight_class_description`
--
ALTER TABLE `oc_weight_class_description`
  ADD PRIMARY KEY (`weight_class_id`,`language_id`);

--
-- Indexes for table `oc_zone`
--
ALTER TABLE `oc_zone`
  ADD PRIMARY KEY (`zone_id`);

--
-- Indexes for table `oc_zone_to_geo_zone`
--
ALTER TABLE `oc_zone_to_geo_zone`
  ADD PRIMARY KEY (`zone_to_geo_zone_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `oc_address`
--
ALTER TABLE `oc_address`
  MODIFY `address_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `oc_api`
--
ALTER TABLE `oc_api`
  MODIFY `api_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `oc_api_ip`
--
ALTER TABLE `oc_api_ip`
  MODIFY `api_ip_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `oc_api_session`
--
ALTER TABLE `oc_api_session`
  MODIFY `api_session_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `oc_article`
--
ALTER TABLE `oc_article`
  MODIFY `article_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `oc_article_list`
--
ALTER TABLE `oc_article_list`
  MODIFY `article_list_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `oc_attribute`
--
ALTER TABLE `oc_attribute`
  MODIFY `attribute_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `oc_attribute_group`
--
ALTER TABLE `oc_attribute_group`
  MODIFY `attribute_group_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `oc_banner`
--
ALTER TABLE `oc_banner`
  MODIFY `banner_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `oc_banner_image`
--
ALTER TABLE `oc_banner_image`
  MODIFY `banner_image_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=224;
--
-- AUTO_INCREMENT for table `oc_cart`
--
ALTER TABLE `oc_cart`
  MODIFY `cart_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_category`
--
ALTER TABLE `oc_category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=324;
--
-- AUTO_INCREMENT for table `oc_cmsblock`
--
ALTER TABLE `oc_cmsblock`
  MODIFY `cmsblock_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;
--
-- AUTO_INCREMENT for table `oc_cmsblock_description`
--
ALTER TABLE `oc_cmsblock_description`
  MODIFY `cmsblock_des_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=396;
--
-- AUTO_INCREMENT for table `oc_country`
--
ALTER TABLE `oc_country`
  MODIFY `country_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=258;
--
-- AUTO_INCREMENT for table `oc_coupon`
--
ALTER TABLE `oc_coupon`
  MODIFY `coupon_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `oc_coupon_history`
--
ALTER TABLE `oc_coupon_history`
  MODIFY `coupon_history_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_coupon_product`
--
ALTER TABLE `oc_coupon_product`
  MODIFY `coupon_product_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_currency`
--
ALTER TABLE `oc_currency`
  MODIFY `currency_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `oc_customer`
--
ALTER TABLE `oc_customer`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `oc_customer_activity`
--
ALTER TABLE `oc_customer_activity`
  MODIFY `customer_activity_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_customer_approval`
--
ALTER TABLE `oc_customer_approval`
  MODIFY `customer_approval_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_customer_group`
--
ALTER TABLE `oc_customer_group`
  MODIFY `customer_group_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `oc_customer_history`
--
ALTER TABLE `oc_customer_history`
  MODIFY `customer_history_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_customer_ip`
--
ALTER TABLE `oc_customer_ip`
  MODIFY `customer_ip_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `oc_customer_login`
--
ALTER TABLE `oc_customer_login`
  MODIFY `customer_login_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `oc_customer_reward`
--
ALTER TABLE `oc_customer_reward`
  MODIFY `customer_reward_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `oc_customer_search`
--
ALTER TABLE `oc_customer_search`
  MODIFY `customer_search_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_customer_transaction`
--
ALTER TABLE `oc_customer_transaction`
  MODIFY `customer_transaction_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_custom_field`
--
ALTER TABLE `oc_custom_field`
  MODIFY `custom_field_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_custom_field_value`
--
ALTER TABLE `oc_custom_field_value`
  MODIFY `custom_field_value_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_download`
--
ALTER TABLE `oc_download`
  MODIFY `download_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_event`
--
ALTER TABLE `oc_event`
  MODIFY `event_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
--
-- AUTO_INCREMENT for table `oc_extension`
--
ALTER TABLE `oc_extension`
  MODIFY `extension_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;
--
-- AUTO_INCREMENT for table `oc_extension_install`
--
ALTER TABLE `oc_extension_install`
  MODIFY `extension_install_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT for table `oc_extension_path`
--
ALTER TABLE `oc_extension_path`
  MODIFY `extension_path_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_filter`
--
ALTER TABLE `oc_filter`
  MODIFY `filter_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `oc_filter_group`
--
ALTER TABLE `oc_filter_group`
  MODIFY `filter_group_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `oc_geo_zone`
--
ALTER TABLE `oc_geo_zone`
  MODIFY `geo_zone_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `oc_information`
--
ALTER TABLE `oc_information`
  MODIFY `information_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `oc_language`
--
ALTER TABLE `oc_language`
  MODIFY `language_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `oc_layout`
--
ALTER TABLE `oc_layout`
  MODIFY `layout_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT for table `oc_layout_module`
--
ALTER TABLE `oc_layout_module`
  MODIFY `layout_module_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1951;
--
-- AUTO_INCREMENT for table `oc_layout_route`
--
ALTER TABLE `oc_layout_route`
  MODIFY `layout_route_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=430;
--
-- AUTO_INCREMENT for table `oc_length_class`
--
ALTER TABLE `oc_length_class`
  MODIFY `length_class_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `oc_location`
--
ALTER TABLE `oc_location`
  MODIFY `location_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_manufacturer`
--
ALTER TABLE `oc_manufacturer`
  MODIFY `manufacturer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `oc_marketing`
--
ALTER TABLE `oc_marketing`
  MODIFY `marketing_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_modification`
--
ALTER TABLE `oc_modification`
  MODIFY `modification_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT for table `oc_module`
--
ALTER TABLE `oc_module`
  MODIFY `module_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=215;
--
-- AUTO_INCREMENT for table `oc_ocslideshow`
--
ALTER TABLE `oc_ocslideshow`
  MODIFY `ocslideshow_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `oc_ocslideshow_image`
--
ALTER TABLE `oc_ocslideshow_image`
  MODIFY `ocslideshow_image_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=410;
--
-- AUTO_INCREMENT for table `oc_option`
--
ALTER TABLE `oc_option`
  MODIFY `option_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `oc_option_value`
--
ALTER TABLE `oc_option_value`
  MODIFY `option_value_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;
--
-- AUTO_INCREMENT for table `oc_order`
--
ALTER TABLE `oc_order`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `oc_order_history`
--
ALTER TABLE `oc_order_history`
  MODIFY `order_history_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `oc_order_option`
--
ALTER TABLE `oc_order_option`
  MODIFY `order_option_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_order_product`
--
ALTER TABLE `oc_order_product`
  MODIFY `order_product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;
--
-- AUTO_INCREMENT for table `oc_order_recurring`
--
ALTER TABLE `oc_order_recurring`
  MODIFY `order_recurring_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_order_recurring_transaction`
--
ALTER TABLE `oc_order_recurring_transaction`
  MODIFY `order_recurring_transaction_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_order_shipment`
--
ALTER TABLE `oc_order_shipment`
  MODIFY `order_shipment_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_order_status`
--
ALTER TABLE `oc_order_status`
  MODIFY `order_status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `oc_order_total`
--
ALTER TABLE `oc_order_total`
  MODIFY `order_total_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `oc_order_voucher`
--
ALTER TABLE `oc_order_voucher`
  MODIFY `order_voucher_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_product`
--
ALTER TABLE `oc_product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;
--
-- AUTO_INCREMENT for table `oc_product_discount`
--
ALTER TABLE `oc_product_discount`
  MODIFY `product_discount_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=525;
--
-- AUTO_INCREMENT for table `oc_product_image`
--
ALTER TABLE `oc_product_image`
  MODIFY `product_image_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=906;
--
-- AUTO_INCREMENT for table `oc_product_option`
--
ALTER TABLE `oc_product_option`
  MODIFY `product_option_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=260;
--
-- AUTO_INCREMENT for table `oc_product_option_value`
--
ALTER TABLE `oc_product_option_value`
  MODIFY `product_option_value_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;
--
-- AUTO_INCREMENT for table `oc_product_reward`
--
ALTER TABLE `oc_product_reward`
  MODIFY `product_reward_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=758;
--
-- AUTO_INCREMENT for table `oc_product_special`
--
ALTER TABLE `oc_product_special`
  MODIFY `product_special_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=616;
--
-- AUTO_INCREMENT for table `oc_recurring`
--
ALTER TABLE `oc_recurring`
  MODIFY `recurring_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_return`
--
ALTER TABLE `oc_return`
  MODIFY `return_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_return_action`
--
ALTER TABLE `oc_return_action`
  MODIFY `return_action_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `oc_return_history`
--
ALTER TABLE `oc_return_history`
  MODIFY `return_history_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_return_reason`
--
ALTER TABLE `oc_return_reason`
  MODIFY `return_reason_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `oc_return_status`
--
ALTER TABLE `oc_return_status`
  MODIFY `return_status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `oc_review`
--
ALTER TABLE `oc_review`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;
--
-- AUTO_INCREMENT for table `oc_seo_url`
--
ALTER TABLE `oc_seo_url`
  MODIFY `seo_url_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1146;
--
-- AUTO_INCREMENT for table `oc_setting`
--
ALTER TABLE `oc_setting`
  MODIFY `setting_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7668;
--
-- AUTO_INCREMENT for table `oc_statistics`
--
ALTER TABLE `oc_statistics`
  MODIFY `statistics_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `oc_stock_status`
--
ALTER TABLE `oc_stock_status`
  MODIFY `stock_status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `oc_store`
--
ALTER TABLE `oc_store`
  MODIFY `store_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `oc_subscribe`
--
ALTER TABLE `oc_subscribe`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `oc_tax_class`
--
ALTER TABLE `oc_tax_class`
  MODIFY `tax_class_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `oc_tax_rate`
--
ALTER TABLE `oc_tax_rate`
  MODIFY `tax_rate_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;
--
-- AUTO_INCREMENT for table `oc_tax_rule`
--
ALTER TABLE `oc_tax_rule`
  MODIFY `tax_rule_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=129;
--
-- AUTO_INCREMENT for table `oc_testimonial`
--
ALTER TABLE `oc_testimonial`
  MODIFY `testimonial_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `oc_theme`
--
ALTER TABLE `oc_theme`
  MODIFY `theme_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `oc_translation`
--
ALTER TABLE `oc_translation`
  MODIFY `translation_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_upload`
--
ALTER TABLE `oc_upload`
  MODIFY `upload_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_user`
--
ALTER TABLE `oc_user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `oc_user_group`
--
ALTER TABLE `oc_user_group`
  MODIFY `user_group_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `oc_voucher`
--
ALTER TABLE `oc_voucher`
  MODIFY `voucher_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_voucher_history`
--
ALTER TABLE `oc_voucher_history`
  MODIFY `voucher_history_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_voucher_theme`
--
ALTER TABLE `oc_voucher_theme`
  MODIFY `voucher_theme_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `oc_weight_class`
--
ALTER TABLE `oc_weight_class`
  MODIFY `weight_class_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `oc_zone`
--
ALTER TABLE `oc_zone`
  MODIFY `zone_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4239;
--
-- AUTO_INCREMENT for table `oc_zone_to_geo_zone`
--
ALTER TABLE `oc_zone_to_geo_zone`
  MODIFY `zone_to_geo_zone_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
