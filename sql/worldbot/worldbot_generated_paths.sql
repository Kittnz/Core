CREATE TABLE IF NOT EXISTS `worldbot_generated_paths` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `start_node_id` int(11) NOT NULL,
  `end_node_id` int(11) NOT NULL,
  `point_index` int(11) NOT NULL,
  `x` float NOT NULL,
  `y` float NOT NULL,
  `z` float NOT NULL,
  `map_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `start_end_index` (`start_node_id`,`end_node_id`,`point_index`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
