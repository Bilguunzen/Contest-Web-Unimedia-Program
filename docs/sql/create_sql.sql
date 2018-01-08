-- temtseenii medeelliig hadgalna
CREATE TABLE `dtb_competition` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(20) DEFAULT NULL,
  `image_path` varchar(50) DEFAULT NULL,
  `finish_time` datetime DEFAULT NULL,
  `total_member` int(11) DEFAULT NULL,
  `description` varchar(20) DEFAULT NULL,
  `rate_info` varchar(150) DEFAULT NULL,
  `use_data` varchar(150) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;
