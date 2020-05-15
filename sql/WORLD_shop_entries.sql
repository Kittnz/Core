replace into broadcast_text (id, maletext) values
('90000', 'Welcome to our shop! We offer exotic garments, large bags, mysterious engineering devices and much more to improve your experience on our server.');

drop table if exists shop_categories;
create table shop_categories (
  id int(11) unsigned not null auto_increment,
  name text,
  primary key (id)
) engine=innodb default charset=utf8;

drop table if exists shop_items;
create table shop_items (
  id int(11) unsigned not null auto_increment,
  category tinyint(3) unsigned not null default '0',
  item int(11) unsigned not null default '0',
  description text,
  price int(11) unsigned default '0',
  primary key (id)
) engine=innodb auto_increment=10 default charset=utf8;

replace into shop_categories values
(1,  'Gameplay'),
(2,  'Companions'),
(3,  'Mounts I'),
(4,  'Mounts II'),
(5,  'Mounts III'),
(6,  'Tabards'),
(7,  'Skins'),
(8,  'Illusions'),
(9,  'Glyphs');

replace into shop_items values
-- Gameplay --------------------------------------------------------------------------------------------
(100, 1, 50000, 'Character Name Change', 160),
(101, 1, 50002, 'Character Race Change', 200),
(102, 1, 50001, 'Character Look Change', 160),
(103, 1, 51434, 'Character Faction Change', 250),
(104, 1, 50003, 'Loremaster\'s Backpack: 28 Slot Bag', 120),
(105, 1, 50004, 'Portable Black Hole: 36 Slot Bag', 180),
(106, 1, 51310, 'Portable Wormhole Generator', 0),
(107, 1, 50011, 'Portable Gnomish Mailbox', 160),
(108, 1, 51715, 'Portable Goblin Brainwashing Device', 200),
(109, 1, 50009, 'Mechanical Auctioneer (Companion)', 160),
(110, 1, 50005, 'Field Repair Bot (Companion)', 160),
(111, 1, 50007, 'Forworn Mule (Bank Companion)', 200),
(112, 1, 51421, 'Caravan Kodo (Bank Companion)', 200),
(113, 1, 51306, 'Fashion Coinss x10 (Transmogrification)', 160),
-- Pets ------------------------------------------------------------------------------------------------
(201, 2, 13584, 'Diablo Stone', 60),
(202, 2, 13583, 'Panda Collar', 60),
(203, 2, 20371, 'Blue Murloc Egg', 60),
(204, 2, 23713, 'Hippogryph Hatchling', 60),
(205, 2, 19055, 'Green Dragon Orb', 60),
(206, 2, 21168, 'Baby Shark', 60),
(207, 2, 50013, 'Bone Golem', 60),
(208, 2, 50019, 'Moonkin Egg', 60),
(210, 2, 50083, 'Ancient Arcane Dust', 60),
(211, 2, 50084, 'Kirin Tor Familiar', 60),
(212, 2, 22781, 'Polar Bear Collar', 60),
(213, 2, 50085, 'Frostwolf Ghostpup', 60),
(214, 2, 51007, 'Teldrassil Sproutling', 60),
-- Mounts #1 --------------------------------------------------------------------------------------
(300, 3, 23720, 'Level 1 Riding Turtle', 0),
(301, 3, 50071, 'Level 1  Ivory Tallstrider', 100),
(302, 3, 50072, 'Level 1  Brown Tallstrider', 100),
(303, 3, 50073, 'Level 1  Gray Tallstrider', 100),
(304, 3, 50076, 'Level 1  Turquoise Tallstrider', 100),
(305, 3, 50074, 'Level 1  Swift Lovebird', 165),
(306, 3, 12325, 'Level 40 Primal Leopard', 160),
(307, 3, 12326, 'Level 40 Tawny Sabercat', 160),
(308, 3, 8630,  'Level 40 Bengal Tiger', 160),
(309, 3, 8583,  'Level 40 Skeletal Horse', 160),
(310, 3, 14062, 'Level 40 Kodo Mount', 160),
(311, 3, 13323, 'Level 40 Purple Mechanostrider', 160),
(312, 3, 13324, 'Level 40 Red and Blue Mechanostrider', 160),
(313, 3, 13325, 'Level 40 Fluorescent Mechanostrider', 160),
-- Mounts #2 ------------------------------------------------------------------------------------------
(400, 4, 5875, 'Level 40 Blue Ram', 160),
(401, 4, 5874, 'Level 40 Black Ram', 160),
(402, 4, 1041, 'Level 40 Black Wolf', 160),
(403, 4, 8590, 'Level 40 Obsidian Raptor', 160),
(404, 4, 13329, 'Level 60 Frost Ram', 260),
(405, 4, 13327, 'Level 60 Icy Blue Mechanostrider A', 260),
(406, 4, 13326, 'Level 60 White Mechanostrider B', 260),
(407, 4, 12354, 'Level 60 Palomino', 260),
(408, 4, 12353, 'Level 60 White Stallion', 260),
(409, 4, 12302, 'Level 60 Ancient Frostsaber', 260),
(410, 4, 12303, 'Level 60 Black Nightsaber', 260),
(411, 4, 12351, 'Level 60 Arctic Wolf', 260),
(412, 4, 12330, 'Level 60 Red Wolf', 260),
(413, 4, 15292, 'Level 60 Green Kodo', 260),
(414, 4, 15293, 'Level 60 Teal Kodo', 260),
-- Mounts #3 ------------------------------------------------------------------------------------------
(500, 5, 13317, 'Level 60 Ivory Raptor', 260),
(501, 5, 8586,  'Level 60 Mottled Red Raptor', 260),
(502, 5, 18768, 'Level 60 Swift Dawnsaber', 260),
(503, 5, 23193, 'Level 60 Skeletal Steed', 260),
(504, 5, 50399, 'Level 60 Quel\'dorei Steed', 360),
(505, 5, 50400, 'Level 60 Swift Zhevra', 360),
(506, 5, 50401, 'Level 60 Ivory War Raptor', 360),
(507, 5, 50402, 'Level 60 Violet War Raptor', 360),
(508, 5, 50403, 'Level 60 Red War Raptor', 360),
(509, 5, 50404, 'Level 60 Obsidian War Raptor', 360),
(510, 5, 50407, 'Level 60 Nightmare Dreamrunner', 360),
-- Tabards ---------------------------------------------------------------------------------------------
(600, 6, 23709, 'Tabard of Frost', 160),
(601, 6, 23705, 'Tabard of Flame', 160),
(602, 6, 23710, 'Darkmoon Faire Tabard', 160),
(603, 6, 22999, 'Tabard of the Argent Dawn', 100),
(604, 6, 50044, 'Goldweave Tabard', 160),
(605, 6, 50086, 'Stromgarde Tabard', 160),
(606, 6, 50087, 'Tabard of Kul\'Tiras', 160),
(607, 6, 50088, 'Theramore Tabard', 160),
(608, 6, 50089, 'Dalaran Tabard', 160),
(609, 6, 50090, 'White Tabard of Stormwind', 160),
(610, 6, 50091, 'Scholomance Tabard', 160),
(611, 6, 50038, 'High Inquisitor\'s Tabard', 160),
(612, 6, 50092, 'Tabard of the Crimson Legion', 160),
(613, 6, 50093, 'Tabard of Hearthglen', 160),
-- Skins ---------------------------------------------------------------------------------------
(700, 7, 50105, 'Human: Sally Whitemane (Female)', 160),
(701, 7, 50106, 'Human, Gnome: Cult of the Damned', 160),
(702, 7, 50204, 'Dwarf: Wildhammer', 160),
(703, 7, 50205, 'Dwarf: Dark Iron', 160),
(704, 7, 50206, 'Dwarf: Earthen (Male)', 160),
(705, 7, 50207, 'Orc: Blackrock Clan', 160),
(706, 7, 50208, 'Orc: Chaos (Male Only)', 160),
(707, 7, 50209, 'Orc: Mag\'Har (Male)', 160),
(708, 7, 50210, 'Troll: Forest', 160),
(709, 7, 50211, 'Troll: Sandfury (Including Zombies)', 160),
(710, 7, 51010, 'Troll: Dark', 160),
(711, 7, 51011, 'Troll: Ice', 160),
(712, 7, 50212, 'Gnome: Leper (Male)', 160),
-- Illusions -----------------------------------------------------------------------------------------
(800, 8, 51200, 'Illusion: Goblin', 100),
(801, 8, 50017, 'Illusion: High Elf', 100),
(802, 8, 51201, 'Illusion: Worgen', 100),
(803, 8, 51205, 'Illusion: Ghost', 100),
(804, 8, 51206, 'Illusion: Banshee', 100),
(805, 8, 51208, 'Illusion: Succubus', 100),
(806, 8, 51065, 'Illusion: Shadow', 100),
(807, 8, 51253, 'Illusion: Furbolg', 100),
(808, 8, 51066, 'Illusion: Flamewalker', 100),
-- Glyphs -----------------------------------------------------------------------------------------
(900, 9, 50010, 'General: Glyph of Hardcore', 0),
(901, 9, 50008, 'General: Glyph of Twinking', 0),
(902, 9, 50521, 'General: Glyph of Exhaustion', 0),
(903, 9, 51055, 'Druid: Glyph of the Tree', 100),
(904, 9, 51056, 'Druid: Glyph of the Stag', 100),
(905, 9, 51057, 'Druid: Glyph of the Frostsaber', 100),
(906, 9, 51266, 'Druid: Glyph of the Ice Bear', 100),
(907, 9, 51431, 'Druid: Glyph of the Frostkin', 100),
(908, 9, 51432, 'Druid: Glyph of Stars', 100);

