# Login database

DROP TABLE IF EXISTS `antispam_detected`;
DROP TABLE IF EXISTS `antispam_mute`;
DROP TABLE IF EXISTS `antispam_scores`;

ALTER TABLE `ip_banned` CHANGE `banreason` `banreason` VARCHAR(128) CHARSET utf8 COLLATE utf8_general_ci DEFAULT 'no reason' NOT NULL; 

DROP TABLE IF EXISTS `system_fingerprint_usage`;

CREATE TABLE `system_fingerprint_usage` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fingerprint` int(10) unsigned NOT NULL,
  `account` int(10) unsigned NOT NULL,
  `ip` varchar(16) NOT NULL,
  `realm` int(10) unsigned NOT NULL,
  `time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `architecture` varchar(16) DEFAULT NULL,
  `cputype` varchar(64) DEFAULT NULL,
  `activecpus` int(10) unsigned DEFAULT NULL,
  `totalcpus` int(10) unsigned DEFAULT NULL,
  `pagesize` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fingerprint` (`fingerprint`),
  KEY `account` (`account`),
  KEY `ip` (`ip`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `antispam_replacement`;

CREATE TABLE `antispam_replacement` (
  `from` varchar(32) NOT NULL DEFAULT '',
  `to` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`from`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

insert  into `antispam_replacement`(`from`,`to`) values ('\\\\/\\\\/','W'),('/\\/\\','M'),('0','O'),('...hic!',''),('()','O'),('\\/\\/','W'),('/\\\\','A'),('VV','W'),('@','O'),('/V\\','M'),('/\\\\/\\\\','M'),('㎜','MM'),('!<','K');

DROP TABLE IF EXISTS `antispam_unicode`;
DROP TABLE IF EXISTS `antispam_unicode_replacement`;

CREATE TABLE `antispam_unicode_replacement` (
  `from` mediumint(5) unsigned NOT NULL DEFAULT '0',
  `to` mediumint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`from`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

insert  into `antispam_unicode_replacement`(`from`,`to`) values (1063,52),(1054,79),(1057,67),(1052,77),(927,79),(1050,75),(913,65),(917,69),(1062,85),(9675,79),(1040,65),(1058,84),(1064,87),(1025,69),(1055,78),(1065,87),(922,75),(924,77),(1045,69),(968,87),(192,65),(210,79),(211,79),(242,79),(324,78),(328,78),(332,79),(466,79),(59336,78),(12562,84),(8745,78),(65325,77),(959,79),(945,65),(954,75),(12295,79),(65323,75),(65296,79),(65355,75),(65357,77),(65319,71),(925,78);

DROP TABLE IF EXISTS `antispam_blacklist`;

CREATE TABLE `antispam_blacklist` (
  `string` varchar(64) NOT NULL,
  PRIMARY KEY (`string`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `antispam_blacklist` */

insert  into `antispam_blacklist`(`string`) values 
(' <<<10G=1$--and'),
(' http://400elysium.tk/ '),
(' W W W .N O S T 100.C O M !50 %'),
(' www.aoaue.com'),
(' [www.y2IgoId.com>10g=2$/Power] '),
('\"COM\"'),
('\"T100\"'),
('\"T100\" plus \"COM\"<<'),
(',finally we got 500g\r\n,finally w'),
('.c¡£ 0m'),
('100COM'),
('10g='),
('1OOCOM'),
('2$/Power]'),
('300elysium.tk'),
('300ELYSIUMTK'),
('400elysium.tk/'),
('400ELYSIUMTK'),
('4GAMEPOWER'),
('4WOWCOM'),
('50G=10.00$'),
('7 days non-stop hard working,fin'),
('<<<100G=12$--and'),
('<<<10G=1$'),
('>>\"NOS\"'),
('?\\/!CT0RYW0WC0M'),
('aoaue'),
('aoauecom'),
('com>10g'),
('elysium-gifts.tk'),
('elysium-projecttk'),
('ELYSIUMABCWOW'),
('ELYSIUMAEWOW'),
('ELYSIUMAPKWOW'),
('ELYSIUMDFTWOW'),
('ELYSIUMFDCWOW'),
('ELYSIUMGIFTSTK'),
('ELYSIUMKSDWOW'),
('ELYSIUMKYWOW'),
('ELYSIUMLOLWOW'),
('ELYSIUMORWOW'),
('ELYSIUMPROJECTTK'),
('ELYSIUMRDWOW'),
('ELYSIUMRSWOW'),
('ELYSIUMSAYWOW'),
('ELYSIUMSHEWOW'),
('ELYSIUMSNKWOW'),
('ELYSIUMTXTWOW'),
('ELYSIUMUFNWOW'),
('ELYSIUMUSAWOW'),
('ELYSIUMWOWTK'),
('ELYSIUMXGHWOW'),
('ELYSIUMXXXWOW'),
('ELYSIUMZZZWOW'),
('EPICITEMSHONOR'),
('FASTLVLCOM'),
('finally we got 500g'),
('finallywegot500g'),
('Flask/Epic items/Honor'),
('g(2+2)wowcom'),
('G-4-VV-0-W--C--0--M'),
('G4W@W'),
('G4WOW'),
('G4WOWCOM'),
('GFOURWOWCOM'),
('GO1D4MMO'),
('GOALDMOCOM'),
('GoId/eppic items/Bags'),
('GOLADAMOCOM'),
('GOLADMOCOM'),
('GOLD4MMO'),
('GOLDAMOCOM'),
('GOLDCEO'),
('GOLDCOM'),
('GOLDDEALRU'),
('GOLDINSIDER'),
('GOLDPOWER'),
('GOLODMOCOM'),
('GOLODOMOCOM'),
('GOXLD4MOCOM'),
('GOXLD4XMMOCOM'),
('GOXLDX4MXMOCOM'),
('GOXLDXMOCOM'),
('Greetingsafter7days'),
('http://elysium-pro.tk'),
('http://elysium-project.tk'),
('HTTPSELySIUMProJECtTK'),
('HTTPSWWWELYSIUMGIFTSTK'),
('HTTPSWWWELYSIUMPROJECTTK'),
('HTTPSWWWY2IGOIDCOM>'),
('HTTPWWWY2IGOIDCOM>'),
('ILOVEUGOLD'),
('ITEM4GAME'),
('ITEM4WOW'),
('ITEM4WOW.COM'),
('ITEM4WOW.COM<---here'),
('ITEM4WOWCOM'),
('LAODAN8841'),
('leveling1-60=350$'),
('LOD.COM<<<'),
('LODCOM<<<---)('),
('LOVEWOWHAHA'),
('LOVEWOWHAHACOM'),
('love£¨wow£©haha'),
('LV60/ ---'),
('LVLGOCOM'),
('MMO4PAL'),
('MMOANKCOM'),
('MMOGOCOM'),
('MMOGSCOM'),
('MMOLORD'),
('MMOOKCOM'),
('MMOSECOM'),
('MMOTANKCOM'),
('MONEYCIRCLERU'),
('MONEYFORGAMES'),
('NAXXGAMES'),
('NAXXGAMESCOM'),
('NIGHTHAVEN20G'),
('NOST!OO'),
('NOST100'),
('NOST1OO'),
('OKOGAME'),
('OKOGAMES'),
('OKOGOMES'),
('owhaha.com'),
('OWHAHACOM'),
('power1-60'),
('POWERLV60'),
('PVPBANK'),
('PVPBCOMANK'),
('QQ1353341694'),
('QQ211772670'),
('QQ373353356'),
('RNRNOOK'),
('RNRNOSE'),
('SAGEBLADECOM'),
('SELLNGOLD'),
('SINBAGAME'),
('SINBAGOLD'),
('SINBAONLINE'),
('SKYPEBAUDIEA'),
('SKYPEBRAT7TH'),
('SKYPEELYSUIM'),
('SKYPEELYSUIMKFWOW'),
('SKYPEELYSUIMWOWOW'),
('SKYPEEMIL8LI'),
('SKYPEFELWOOD'),
('SKYPEJASZUINS'),
('SKYPEJAZZYTSWOW'),
('SKYPELAR2IDA'),
('SKYPEMOONCLOTH'),
('SKYPEPROJECTERWOW'),
('SKYPESPRAGUEI'),
('SKYPEVANILLA'),
('Stockof60characters'),
('SUSANGAME'),
('T100'),
('T100plusCOM'),
('two weeks of non-stop hard worki'),
('URL divide into three'),
('URLintothreepart'),
('V1CTORYWOW'),
('VICTORYW0W'),
('VICTORYWOW'),
('VICTORYWOW.COM'),
('VICTORYWOWCOM'),
('working,finally we got 500g'),
('WOWJEVERLY'),
('WOWMARY'),
('WTSITEM'),
('www.aoaue.com'),
('WWW.G(2+2)WOW.COM'),
('WWW.G-4-VV-0-W--C--0--M'),
('WWW.G4WOW.COM'),
('www.lovewowhah'),
('www.love£¨wow£©haha .com'),
('www.love£¨wow£©haha .com________'),
('www.love£¨wow£©haha .c¡£ 0m'),
('www.y2IgoId.com'),
('www.y2IgoId.com>'),
('www.y2IgoId.com>10g=2$/Power'),
('www.y2IgoId.com>10g=2$/Power LV6'),
('WWW.Y2LGOLD.COM'),
('www.y2lgold.com>'),
('WWW.Y2LGOLD.COM>Gold'),
('WWWELYSIUMGIFTSTK'),
('WWWELYSIUMPROJECTTK'),
('WWWELYSIUMWOWTK'),
('WWWG4WOWCOM'),
('WWWMMOTANK'),
('WWWNAXXGAMESCOM'),
('WWWNOST'),
('WWWNOST100COM'),
('wwwy2IgoIdcom'),
('WWWY2IGOIDCOM>'),
('WWWY2LGOLD.COM'),
('WWWY2LGOLDCOM'),
('WWWY@LGOLDCOM'),
('X2GOLD'),
('XIAOBAIMOSHOUJINGJI'),
('y(1+1)lgold'),
('y2IgoId'),
('y2IgoId.com'),
('y2IgoIdcom'),
('Y2LGOLD'),
('Y2LGOLD.COM'),
('Y2LGOLDCOM'),
('YOURGNET'),
('[GM]'),
('[www.y2IgoId.com>10g=2$/Power] L');