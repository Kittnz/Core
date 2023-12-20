drop table if exists shop_categories;
create table shop_categories (
  id int(11) unsigned not null auto_increment,
  name text,
  name_loc4 text,
  icon text,
  primary key (id)
) engine=innodb default charset=utf8;

drop table if exists shop_items;
create table shop_items (
  id int(11) unsigned not null auto_increment,
  category tinyint(3) unsigned not null default '0',
  item int(11) unsigned not null default '0',
  description text,
  description_loc4 text,
  price int(11) unsigned default '0',
  primary key (id)
) engine=innodb auto_increment=10 default charset=utf8;


replace into shop_categories (`id`, `name`, `name_loc4`, `icon`) values 
(1,  'Miscellaneous', '杂项', 'default'),
(2,  'Skins', '外观', 'ticket'),
(3,  'Gameplay', '玩法玩具', 'toys'),
(4,  'Glyphs', '雕文', 'service'),
(5,  'Mounts', '坐骑', 'mount'),
(6,  'Companions', '小宠物', 'pet'),
(7,  'Fashion', '战袍', 'tabard'),
(8,  'Illusions', '幻象', 'scroll');

replace into shop_items (`id`, `category`, `item`, `description`, `description_loc4`, `price`) values 
(1,   1, 50000, 'Token: Character Name Change', '代币：角色名称变更', 160),
(2,   1, 80499, 'Token: Guild Name Change', '代币：公会名称变更', 300),
(3,   1, 80699, 'Token: Appearance Change', '代币：外观变更', 160),
(17,  2, 51920, 'Touch of Darkness [Undead, male]', '猩红 [人类，仅限女性]', 160),
(18,  2, 51921, 'Blood Widow [Undead, female]', '猩红 [人类，仅限女性]', 160),
(20,  2, 50105, 'Scarlet [Human, female only]', '猩红 [人类，仅限女性]', 160),
(21,  2, 50106, 'Necromancer I [Human]', '死灵法师 I [人类]', 160),
(22,  2, 61106, 'Necromancer II [Night Elf, male only]', '死灵法师 II [人类，仅限男性]', 160),
(23,  2, 50292, 'Arcane [Human]', '奥术【人类】', 160),
(24,  2, 50290, 'Azotha [Human, female only]', '阿索拉 [人类，仅限女性]', 160),
(25,  2, 50291, 'Fel [Human, male only]', '邪能 [人类，仅限男性]', 160),
(26,  2, 83090, 'Dalaran Magi [Human]', '达拉然法师 [人类]', 160),
(27,  2, 83091, 'Frost Affinity [Human, male only]', '冰霜亲和【人类，仅限男性】', 160),
(28,  2, 81210, 'Death Knight [Human, male only]', '死亡骑士[人类，仅限男性]', 160),
(29,  2, 50204, 'Wildhammer I [Dwarf]', '蛮锤 I [矮人]', 160),
(30,  2, 50250, 'Wildhammer II [Dwarf]', '蛮锤 II [矮人]', 160),
(31,  2, 50251, 'Wildhammer III [Dwarf]', '蛮锤 III [矮人]', 160),
(32,  2, 50252, 'Wildhammer IV [Dwarf]', '蛮锤 IV [矮人]', 160),
(33,  2, 50205, 'Dark Iron [Dwarf]', '黑铁[矮人]', 160),
(34,  2, 50206, 'Earthern [Dwarf, male only]', '土灵[矮人，仅限男性]', 160),
(35,  2, 81229, 'Death Knight [Dwarf, male only]', '死亡骑士[矮人，仅限男性]', 160),
(36,  2, 61105, 'Demon Hunter [Night Elf]', '恶魔猎手【暗夜精灵】', 160),
(37,  2, 61104, 'Demon [Night Elf, male only]', '恶魔【暗夜精灵，仅限男性】', 160),
(38,  2, 83092, 'Naturalist I [Night Elf]', '自然学家 I [暗夜精灵，仅限男性]', 160),
(39,  2, 83099, 'Naturalist II [Night Elf]', '自然学家 II [暗夜精灵]', 160),
(40,  2, 83100, 'Naturalist III [Night Elf, male only]', '自然学家III [暗夜精灵，仅限男性]', 160),
(41,  2, 50212, 'Leper [Gnome]', '麻风 [侏儒]', 160),
(42,  2, 81230, 'Necromancer III [Gnome]', '死灵法师 III [侏儒]', 160),
(43,  2, 81206, 'Dark Ranger [High Elf]', '黑暗游侠[高等精灵]', 160),
(44,  2, 81209, 'Blood Elf [High Elf]', '血精灵【高等精灵】', 160),
(45,  2, 50207, 'Blackrock I [Orc]', '黑石 I [兽人]', 160),
(46,  2, 50208, 'Chaos [Orc]', '混沌[兽人]', 160),
(47,  2, 50209, 'Mag\'Har [Orc, male only]', '玛格哈[兽人，仅限男性]', 160),
(48,  2, 50220, 'Blackrock II [Orc]', '黑石 II [兽人]', 160),
(49,  2, 50221, 'Blackrock III [Orc]', '黑石 III [兽人]', 160),
(50,  2, 50223, 'Dreadskull II [Orc, male only]', '恐怖骷髅 II [兽人，仅限男性]', 160),
(51,  2, 50224, 'Dreadskull III [Orc, male only]', '恐怖骷髅 III [兽人，仅限男性]', 160),
(52,  2, 81255, 'Dreadskull [Orc, male only]', '恐怖骷髅 [兽人，仅限男性]', 160),
(56,  2, 51010, 'Dark [Troll]', '黑暗[巨魔]', 160),
(57,  2, 51011, 'Ice [Troll]', '冰霜[巨魔]', 160),
(58,  2, 81208, 'Zombie [Troll]', '僵尸[巨魔]', 160),
(59,  2, 81228, 'Tauren Spirit Walker [Tauren]', '牛头人灵魂行者[牛头人]', 160),
(61,  3, 50003, 'Backpack: 28 slots', '背包：28格', 200),
(62,  3, 50004, 'Backpack: 36 slots', '背包：36格', 300),
(63,  3, 50011, 'Summon: Mailbox', '召唤：邮箱', 200),
(64,  3, 51715, 'Summon: Brainwashing Device', '召唤：洗脑装置', 200),
(65,  3, 50602, 'Summon: Auctioneer', '召唤：拍卖师', 200),
(66,  3, 50009, 'Summon: Mechanical Auctioneer', '召唤：机械拍卖师', 200),
(67,  3, 50005, 'Summon: Repair Bot', '召唤：修理机器人75B', 200),
(68,  3, 50007, 'Summon: Bank (Mule)', '召唤：银行（骡子）', 200),
(69,  3, 51421, 'Summon: Bank (Kodo)', '召唤：银行（科多兽）', 200),
(86,  4, 51057, 'Druid: Glyph of the Frostsaber', '德鲁伊：霜刃豹雕文', 100),
(87,  4, 51266, 'Druid: Glyph of the Ice Bear', '德鲁伊：冰熊雕文', 100),
(88,  4, 51431, 'Druid: Glyph of the Frostkin', '德鲁伊：寒霜枭雕文', 100),
(89,  4, 51830, 'Druid: Glyph of the Orca', '德鲁伊：虎鲸雕文', 100),
(90,  4, 51432, 'Druid: Glyph of the Moon', '德鲁伊：星辰雕文', 100),
(94,  4, 51056, 'Druid: Glyph of the Stag', '德鲁伊：雄鹿雕文', 100),
(101, 5, 50071, 'Ivory Tallstrider', '象牙陆行鸟', 100),
(102, 5, 50072, 'Brown Tallstrider', '棕色陆行鸟', 100),
(103, 5, 50073, 'Gray Tallstrider', '灰色陆行鸟', 100),
(104, 5, 50076, 'Turquoise Tallstrider', '绿松石陆行鸟', 100),
(105, 5, 50074, 'Pink Tallstrider', '粉红高陆行鸟', 100),
(106, 5, 81100, 'Swift Raven Lord', '迅捷乌鸦领主', 500),
(107, 5, 81120, 'Frayfeather Hippogryph', '乱羽角鹰兽', 500),
(108, 5, 81121, 'Cenarion Hippogryph', '塞纳里奥角鹰兽', 500),
(109, 5, 81242, 'Viridian Hippogryph', '翠绿角鹰兽', 300),
(110, 5, 80431, 'Swift Magic Rooster', '迅捷魔法公鸡', 300),
(121, 5, 12325, 'Spotted Leopard', '斑点刃豹', 200),
(122, 5, 12326, 'Tawny Leopard', '褐色刃豹', 200),
(123, 5, 12327, 'Golden Leopard', '黄金刃豹', 200),
(124, 5, 8630, 'Stranglethorn Tiger', '荆棘谷老虎', 200),
(125, 5, 81227, 'Striped Dawnsaber', '虎纹黎明刃豹', 200),
(126, 5, 12302, 'Ancient Frostsaber', '远古霜刃剑', 200),
(127, 5, 8635, 'Ancient Nightsaber', '远古夜刃豹', 200),
(128, 5, 81232, 'Azure Frostsaber', '蔚蓝霜刃剑', 160),
(129, 5, 18768, 'Armored Dawnsaber', '装甲黎明刃豹', 260),
(130, 5, 80430, 'Armored Spectral Tiger', '装甲幽灵虎', 2000),
(131, 5, 12303, 'Black Zulian Panther', '黑色祖利安刃豹', 200),
(132, 5, 81231, 'Tamed Rak\'Shiri', '驯服的拉克希里', 200),
(141, 5, 50399, 'Ancient Quel\'dorei Steed', '上古奎尔多雷战马', 200),
(142, 5, 80449, 'Armored Alliance Steed', '装甲联盟战马', 300),
(143, 5, 81236, 'Armored Gray Steed', '装甲灰骏马', 200),
(144, 5, 23193, 'Armored Black Deathcharger', '装甲黑色死亡战马', 300),
(145, 5, 81235, 'Armored Vermilion Deathcharger', '装甲绯红死亡战马', 300),
(146, 5, 50407, 'Nightmare Dreamrunner', '噩梦行者', 200),
(147, 5, 50400, 'Riding Zhevra', '骑乘斑纹斑马', 200),
(148, 5, 81234, 'Brewfest Ram', '美酒节公羊', 200),
(149, 5, 80443, 'Armored Brewfest Ram', '装甲美酒节公羊', 360),
(150, 5, 13328, 'Ancient Black Ram', '远古黑色公羊', 200),
(151, 5, 50406, 'Shadowhorn Stag', '暗角雄鹿', 200),
(162, 5, 80455, 'Armored Brewfest Kodo', '装甲美酒节科多兽', 400),
(163, 5, 1041,  'Ancient Black Wolf', '远古黑色巨狼', 200),
(164, 5, 5663,  'Ancient Red Wolf', '远古红色巨狼', 200),
(165, 5, 80447, 'Armored Horde Wolf', '装甲部落战狼', 300),
(181, 5, 50401, 'Armored Ivory Raptor', '装甲象牙迅猛龙', 360),
(182, 5, 50402, 'Armored Violet Raptor', '装甲紫罗兰迅猛龙', 360),
(183, 5, 50403, 'Armored Red Raptor', '装甲红色迅猛龙', 360),
(184, 5, 50404, 'Armored Obsidian Raptor', '装甲黑曜石迅猛龙', 360),
(185, 5, 81154, 'Armored Black Bear', '装甲黑色战熊', 400),
(186, 5, 81153, 'Armored Purple Bear', '装甲紫色战熊', 400),
(187, 5, 81155, 'Armored Red Bear', '装甲红色战熊', 400),
(188, 5, 81158, 'Armored Frostmane Bear', '装甲霜鬃战熊', 400),
(189, 5, 81091, 'Big Blizzard Bear', '暴雪大战熊', 500),
(190, 5, 81102, 'Darkmoon Dancing Bear', '暗月跳舞熊', 300),
(225, 5, 83150, 'Big Turtle WoW Bear', '巨龟战熊', 360),
(226, 5, 83151, 'Black Spectral Tiger', '黑色幽灵虎', 2000),
(227, 5, 83152, 'Green Spectral Tiger', '绿色幽灵虎', 2000),
(228, 5, 83154, 'Armored Ice Raptor', '装甲冰霜迅猛龙', 360),
(229, 5, 83155, 'Scarlet Charger', '猩红战马', 360),
(230, 5, 83158, 'Brown Zhevra', '棕色斑马', 360),
(231, 5, 50536, 'Twilight', '恐怖图腾科多兽', 1000),
(241, 6, 13584, 'Diablo Stone', '破坏神之石', 80),
(242, 6, 13583, 'Panda Cub', '熊猫项圈', 80),
(243, 6, 20371, 'Murky', '奔波尔霸', 80),
(246, 6, 50013, 'Bone Golem', '骸骨魔像', 80),
(247, 6, 50019, 'Moonkin Hatchling', '枭兽宝宝', 80),
(248, 6, 50083, 'Azure Whelpling', '蓝龙雏龙', 80),
(249, 6, 50084, 'Kirin Tor Familiar', '肯瑞托魔仆', 80),
(250, 6, 22781, 'Poley', '波利', 80),
(251, 6, 50085, 'Frostwolf Ghostpup', '霜狼幽灵幼崽', 80),
(252, 6, 51007, 'Teldrassil Sproutling', '泰达希尔树苗', 80),
(253, 6, 81150, 'Phoenix Hatchling', '凤凰雏鸟', 150),
(254, 6, 81151, 'Spirit Darter', '幽灵飞蜥', 80),
(255, 6, 81207, 'Whimsyshire Cloud', '奇思妙想云', 150),
(256, 6, 81258, 'Spectral Cub', '幽灵虎幼崽', 200),
(257, 6, 69004, 'Pengu', '小潘', 200),
(258, 6, 69006, 'Glitterwing', '闪翼', 200),
(259, 6, 83300, 'Lil\' K.T', '小克', 300),
(260, 6, 83301, 'Core Hound Pet', '熔火恶犬小宠物', 300),
(261, 6, 83302, 'Lil\' Ragnaros', '小拉格纳罗斯', 300),
(291, 8, 51201, 'Illusion: Worgen', '幻象：狼人', 120),
(292, 8, 51205, 'Illusion: Ghost', '幻象：幽灵', 120),
(293, 8, 51206, 'Illusion: Banshee', '幻象：女妖', 120),
(294, 8, 51208, 'Illusion: Succubus', '幻象：魅魔', 120),
(295, 8, 51065, 'Illusion: Shadow', '幻象：暗影', 120),
(296, 8, 80648, 'Illusion: Gnoll', '幻象：豺狼人', 120),
(297, 8, 51253, 'Illusion: Furbolg', '幻象：熊怪', 120),
(298, 8, 81145, 'Illusion: Pandaren', '幻象：熊猫人', 120),
(299, 8, 80694, 'Illusion: Scourge', '幻象：天灾军团', 120),
(300, 8, 51215, 'Illusion: Satyr', '幻象：萨特', 120),
(301, 8, 53008, 'Illusion: Ogre', '幻象：食人魔', 120),
(400, 7, 51306, 'Large Pouch of Fashion Coins', '大袋时尚硬币', 200),
(401, 7, 81088, 'Tabard of Summer Skies', '夏日天空战袍', 180),
(402, 7, 81087, 'Tabard of Summer Flames', '夏日烈焰战袍', 180),
(403, 7, 23709, 'Tabard of Frost', '冰霜战袍', 200),
(404, 7, 23705, 'Tabard of Flame', '烈焰战袍', 200),
(405, 7, 81083, 'Tabard of the Void', '虚空战袍', 200),
(406, 7, 81085, 'Tabard of Nature', '自然战袍', 200),
(407, 7, 81084, 'Tabard of the Arcane', '奥术战袍', 200),
(408, 7, 81082, 'Tabard of Brilliance', '光辉战袍', 200),
(409, 7, 81081, 'Tabard of Fury', '愤怒战袍', 200),
(410, 7, 23710, 'Darkmoon Faire Tabard', '暗月马戏团战袍', 200),
(411, 7, 80314, 'Undead Scourge Tabard', '天灾军团战袍', 200),
(412, 7, 50086, 'Stromgarde Tabard', '激流堡战袍', 160),
(413, 7, 50092, 'Crimson Legion Tabard', '猩红军团战袍', 160),
-- (414, 7, 81205, 'Tabard of Discovery', '探险家战袍', 160),
(415, 7, 50376, 'Hillsbrad Tabard', '希尔斯布莱德战袍', 160),
(416, 7, 50091, 'Black Mageweave Tabard', '黑色魔纹战袍', 160),
(417, 7, 50038, 'Red Mageweave Tabard', '红色魔纹战袍', 160),
(418, 7, 50044, 'Gold Mageweave Tabard', '金色魔纹战袍', 160),
(419, 7, 50044, 'Gold Mageweave Tabard', '金色魔纹战袍', 160),
(420, 7, 80310, 'Sin\'dorei Tabard', '', 180),
(421, 7, 81203, 'Violet Eye Tabard', '', 180),
(422, 7, 81204, 'Illidari Tabard', '', 180),
(423, 7, 69117, 'Jaina Proudmoore Robe', '', 180),
(424, 7, 69118, 'Gilnean Archmage Robe', '', 180),
(425, 7, 69119, 'Stormwind Archmage Robe', '', 180),
(426, 7, 69120, 'Tirisfal Archmage Robe', '', 180),
(427, 7, 69121, 'Scarlet Archmage Robe', '', 180),
(428, 7, 69122, 'Kul Tiras Archmage Robe', '', 180),
(429, 7, 69123, 'Dalaran Archmage Robe', '', 180),
(430, 7, 69124, 'Lordaeron Archmage Robe', '', 180),
(431, 7, 69125, 'Theramore Archmage Robe', '', 180),
(433, 7, 69127, 'Robes of the Lotus Pond', '', 180),
(434, 7, 69128, 'Robes of Spring', '', 200),
(435, 7, 69129, 'Year of the Dragon Robes', '', 200),
(436, 7, 69130, 'Traditional New Year Robes', '', 200),
(437, 7, 69131, 'Peach Garden Robes', '', 200),
(438, 7, 69132, 'Blooming Wisteria Robes', '', 200),
(439, 7, 69146, 'Midnight Star Gown', '', 200),
(440, 7, 69147, 'Evening Star Gown', '', 200),
(441, 7, 69148, 'Twilight star Gown', '', 200),
(442, 7, 69149, 'Dusk Star Gown', '', 200),
(443, 7, 69150, 'Dawn Star Gown', '', 200),
(444, 7, 69151, 'Morning Star Gown', '', 160),
(445, 7, 69152, 'Silver Star Sandals', '', 160),
(446, 7, 69100, 'Illidari Tattoos', '', 200),
(447, 7, 69101, 'Blood Illidari Tattoos', '', 200),
(448, 7, 69102, 'Void Illidari Tattoos', '', 200),
(449, 7, 69103, 'Nether Illidari Tattoos', '', 200),
(450, 7, 69104, 'Spectral Illidari Tattoos', '', 100),
(450, 7, 83478, 'Romantic Red Corset Dress', '', 250),
(451, 7, 83479, 'Romantic Pink Corset Dress', '', 250),
(452, 7, 41091, 'Jingle Belle Frock', '', 200),
(453, 7, 41092, 'Apparel of the Bells', '', 200),
(454, 7, 41097, 'Candy Cane Boots [Limited Edition]', '', 300);