# atmap
ruby -v 2.0
rails -v 4.2.3
mysql 5.6.22

mysql build 

CREATE DATABASE `atmap` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci
CREATE TABLE `maps` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `body` varchar(255) DEFAULT NULL,
  `clean` int(1) DEFAULT NULL,
  `famous` int(1) DEFAULT NULL,
  `infoseek` int(1) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `mapname` varchar(255) DEFAULT NULL,
  `lat` decimal(10,6) DEFAULT NULL,
  `lgn` decimal(10,6) DEFAULT NULL,
  `kind` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 


