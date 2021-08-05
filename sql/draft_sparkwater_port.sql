-- Grim Batol Plaque
replace into gameobject_template values (1772030, 0, 9, 218, 'Grim Batol Memorial', 0, 0, 1.5, 1000246, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');
replace into page_text values (1772030, 'Grim Batol Memorial\n\n\n\n A shrine dedicated to those that fought, and gave their lives in the defence of innocents against our greatest of challenges. May this shrine forever honor those that died within our once great halls in defiance against our invaders.\n\nYou shall never be forgotten.', 0);

replace into creature_template values 
-- Sparkwater Port NPCs:
(91200, 0, 7179, 0, 0, 0, 'Wrix Ozzlenut', 'Shredder Mechanic', 60004, 36, 36, 1468, 1468, 0, 0, 1427, 1682, 3, 1, 1.14286, 0, 20, 5, 0, 0, 1, 51, 66, 0, 140, 1, 2000, 2000, 1, 512, 0, 0, 0, 0, 0, 0, 52.272, 71.874, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 10, ''),
(91201, 0, 7164, 0, 0, 0, 'Grazzle Steamscrew', 'Woodcutting Foreman', 60003, 5, 5, 319, 319, 0, 0, 852, 1682, 16389, 1, 1.14286, 0, 20, 5, 0, 0, 1, 24, 31, 0, 90, 1, 2000, 2000, 1, 512, 0, 0, 0, 0, 0, 0, 31.856, 43.802, 100, 7, 4096, 0, 0, 0, 0, 0, 0, 0, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 1, 0, 0, 3, 0, 0, 0, 0, 0, 2, ''),
(91202, 0, 15765, 0, 0, 0, 'Tammix Razzfire', 'Apprentice Alchemist', 60001, 23, 23, 617, 617, 0, 0, 957, 1682, 19, 1, 1.14286, 0, 20, 5, 0, 0, 1, 28, 37, 0, 100, 1, 2000, 2000, 1, 4608, 0, 0, 2, 0, 0, 0, 36.0272, 49.5374, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'EventAI', 0, 3, 0, 0, 3, 11046, 0, 0, 0, 0, 524298, ''),
(91203, 0, 3877, 0, 0, 0, 'Rugnar', '', 9162, 35, 35, 1342, 1342, 0, 0, 1373, 125, 2, 1, 1.14286, 0, 20, 5, 0, 0, 1, 51, 65, 0, 138, 1, 2000, 2000, 1, 4608, 0, 0, 0, 0, 0, 0, 51.128, 70.301, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'EventAI', 0, 3, 0, 0, 3, 3342, 0, 0, 0, 0, 524298, ''),
(91204, 6, 1379, 0, 0, 0, 'Karnag the Drunk', 'Drunkard', 60002, 35, 35, 5568, 5568, 0, 0, 3327, 125, 3, 1, 1.14286, 0, 20, 5, 0, 0, 1, 51, 75, 0, 258, 1, 2000, 2000, 1, 514, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 0, 0, 3, 15724, 0, 0, 0, 0, 2, ''),
(91205, 0, 7131, 0, 0, 0, 'Zeet Waxwrench', 'Antique Goods', 60000, 25, 25, 712, 712, 0, 0, 1009, 1682, 16389, 1, 1.14286, 0, 20, 5, 0, 0, 1, 31, 40, 0, 106, 1, 2000, 2000, 1, 0, 0, 0, 0, 0, 0, 0, 38.72, 53.24, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 10, ''),
(91206, 0, 7074, 0, 0, 0, 'Fisherman Shix', 'Fishing Trainer', 9158, 35, 35, 1342, 1342, 0, 0, 1373, 125, 23, 1, 1.14286, 0, 20, 5, 0, 0, 1, 51, 65, 0, 138, 1, 2000, 2000, 1, 4608, 0, 0, 2, 0, 0, 0, 51.128, 70.301, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'EventAI', 0, 3, 0, 0, 3, 3332, 0, 0, 0, 0, 524298, ''),
(91207, 0, 10004, 0, 0, 0, 'Maleka', 'Weapon and Armor Vendor', 9191, 30, 30, 1002, 1002, 0, 0, 1200, 125, 16388, 1, 1.14286, 0, 20, 5, 0, 0, 1, 49, 68, 0, 122, 1, 2000, 2000, 1, 4608, 0, 0, 0, 0, 0, 0, 45.144, 62.073, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'EventAI', 0, 3, 0, 0, 3, 3409, 0, 0, 0, 0, 524298, ''),
(91208, 0, 7166, 0, 0, 0, 'Oilworker Razlik', '', 0, 5, 5, 319, 319, 0, 0, 852, 1682, 3, 1, 1.14286, 0, 20, 5, 0, 0, 1, 24, 31, 0, 90, 1, 2000, 2000, 1, 512, 0, 0, 0, 0, 0, 0, 31.856, 43.802, 100, 7, 4096, 0, 0, 0, 0, 0, 0, 0, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 1, 0, 0, 3, 0, 0, 0, 0, 0, 2, ''),
(91209, 0, 7130, 0, 0, 0, 'Bazz Eagerblast', '', 0, 5, 5, 319, 319, 0, 0, 852, 1682, 2, 1, 1.14286, 0, 20, 5, 0, 0, 1, 24, 31, 0, 90, 1, 2000, 2000, 1, 512, 0, 0, 0, 0, 0, 0, 31.856, 43.802, 100, 7, 4096, 0, 0, 0, 0, 0, 0, 0, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 1, 0, 0, 3, 0, 0, 0, 0, 0, 2, ''),
(91210, 0, 13050, 0, 0, 0, 'Meek Fusemix', '', 0, 5, 5, 219, 319, 0, 0, 852, 1682, 2, 1, 1.14286, 0, 20, 5, 0, 0, 1, 24, 31, 0, 90, 1, 2000, 2000, 1, 512, 0, 0, 0, 0, 0, 0, 31.856, 43.802, 100, 7, 4096, 0, 0, 0, 0, 0, 0, 0, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 1, 0, 0, 3, 0, 0, 0, 0, 0, 2, ''),
(91211, 0, 15300, 0, 0, 0, 'Sazzy Gearlight', '', 0, 5, 5, 219, 319, 0, 0, 852, 1682, 2, 1, 1.14286, 0, 20, 5, 0, 0, 1, 24, 31, 0, 90, 1, 2000, 2000, 1, 512, 0, 0, 0, 0, 0, 0, 31.856, 43.802, 100, 7, 4096, 0, 0, 0, 0, 0, 0, 0, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 1, 0, 0, 3, 0, 0, 0, 0, 0, 2, ''),
(91212, 0, 10742, 0, 0, 0, 'Rixxle Copperdrive', '', 0, 5, 5, 219, 319, 0, 0, 852, 1682, 2, 1, 1.14286, 0, 20, 5, 0, 0, 1, 24, 31, 0, 90, 1, 2000, 2000, 1, 512, 0, 0, 0, 0, 0, 0, 31.856, 43.802, 100, 7, 4096, 0, 0, 0, 0, 0, 0, 0, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 1, 0, 0, 3, 0, 0, 0, 0, 0, 2, ''),
(91213, 0, 16023, 0, 0, 0, 'Oil Manager Tizzleflux', '', 0, 5, 5, 219, 319, 0, 0, 852, 1682, 2, 1, 1.14286, 0, 20, 5, 0, 0, 1, 24, 31, 0, 90, 1, 2000, 2000, 1, 512, 0, 0, 0, 0, 0, 0, 31.856, 43.802, 100, 7, 4096, 0, 0, 0, 0, 0, 0, 0, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 1, 0, 0, 3, 0, 0, 0, 0, 0, 2, ''),
(91214, 0, 7168, 0, 0, 0, 'Technician Spuzzle', '', 0, 5, 5, 119, 319, 0, 0, 852, 1682, 2, 1, 1.14286, 0, 20, 5, 0, 0, 1, 24, 31, 0, 90, 1, 2000, 2000, 1, 512, 0, 0, 0, 0, 0, 0, 31.856, 43.802, 100, 7, 4096, 0, 0, 0, 0, 0, 0, 0, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 1, 0, 0, 3, 0, 0, 0, 0, 0, 2, ''),
(91215, 0, 7179, 0, 0, 0, 'Nazzle Moreflak', 'Engineering Supplies', 0, 36, 36, 1468, 1468, 0, 0, 1427, 1682, 16388, 1, 1.14286, 0, 20, 5, 0, 0, 1, 51, 66, 0, 140, 1, 2000, 2000, 1, 512, 0, 0, 0, 0, 0, 0, 52.272, 71.874, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 10, ''),
(91216, 0, 18057, 0, 0, 0, 'Wuzgut', 'Lumber Distributor', 0, 12, 12, 1468, 1468, 0, 0, 1427, 1682, 16388, 1, 1.14286, 0, 20, 5, 0, 0, 1, 51, 66, 0, 140, 1, 2000, 2000, 1, 512, 0, 0, 0, 0, 0, 0, 52.272, 71.874, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 10, ''),
(91217, 0, 7200, 0, 0, 0, 'Lumberworker Pluckwrench', 'Lumber Worker', 0, 16, 16, 1468, 1468, 0, 0, 1427, 1682, 2, 1, 1.14286, 0, 20, 5, 0, 0, 1, 51, 66, 0, 140, 1, 2000, 2000, 1, 512, 0, 0, 0, 0, 0, 0, 52.272, 71.874, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 10, ''),
(91218, 0, 7198, 0, 0, 0, 'Lumberworker Kazz', 'Lumber Worker', 0, 12, 12, 1468, 1468, 0, 0, 1427, 1682, 2, 1, 1.14286, 0, 20, 5, 0, 0, 1, 51, 66, 0, 140, 1, 2000, 2000, 1, 512, 0, 0, 0, 0, 0, 0, 52.272, 71.874, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 10, ''),
(91219, 0, 7338, 0, 0, 0, 'Lumberworker Ruzbolt', 'Lumber Worker', 0, 12, 14, 468, 568, 0, 0, 1427, 1682, 2, 1, 1.14286, 0, 20, 5, 0, 0, 1, 51, 66, 0, 140, 1, 2000, 2000, 1, 512, 0, 0, 0, 0, 0, 0, 52.272, 71.874, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 10, ''),
(91220, 0, 7188, 0, 0, 0, 'Lozzle', 'Refreshments Extraordinaire!', 60007, 12, 14, 468, 568, 0, 0, 1427, 1682, 16388, 1, 1.14286, 0, 20, 5, 0, 0, 1, 51, 66, 0, 140, 1, 2000, 2000, 1, 512, 0, 0, 0, 0, 0, 0, 52.272, 71.874, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 10, ''),
(91221, 0, 7157, 0, 0, 0, 'Faz', 'Moonshiner', 60009, 10, 12, 468, 568, 0, 0, 1427, 1682, 16388, 1, 1.14286, 0, 20, 5, 0, 0, 1, 51, 66, 0, 140, 1, 2000, 2000, 1, 512, 0, 0, 0, 0, 0, 0, 52.272, 71.874, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 10, ''),
(91222, 0, 7237, 0, 0, 0, 'Oilworker Gullydagger', '', 0, 16, 16, 1468, 1468, 0, 0, 1427, 1682, 2, 1, 1.14286, 0, 20, 5, 0, 0, 1, 51, 66, 0, 140, 1, 2000, 2000, 1, 512, 0, 0, 0, 0, 0, 0, 52.272, 71.874, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 10, ''),
(91223, 0, 7227, 0, 0, 0, 'Oilworker Brassrust', '', 0, 12, 12, 1468, 1468, 0, 0, 1427, 1682, 2, 1, 1.14286, 0, 20, 5, 0, 0, 1, 51, 66, 0, 140, 1, 2000, 2000, 1, 512, 0, 0, 0, 0, 0, 0, 52.272, 71.874, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 10, ''),
(91224, 0, 7197, 0, 0, 0, 'Craneoperator Bizzrocket', '', 0, 12, 14, 468, 568, 0, 0, 1427, 1682, 2, 1, 1.14286, 0, 20, 5, 0, 0, 1, 51, 66, 0, 140, 1, 2000, 2000, 1, 512, 0, 0, 0, 0, 0, 0, 52.272, 71.874, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 0, 0, 3, 4429, 0, 0, 0, 0, 10, ''),
(91225, 0, 7197, 0, 0, 0, 'Chief Shang', 'Chief Architect of Sparkwater', 60008, 16, 18, 468, 568, 0, 0, 1427, 1682, 1, 1, 1.14286, 0, 20, 5, 0, 0, 1, 51, 66, 0, 140, 1, 2000, 2000, 1, 512, 0, 0, 0, 0, 0, 0, 52.272, 71.874, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 10, ''),
(91226, 0, 15549, 0, 0, 0, 'Varna Wireburn', '', 0, 16, 18, 468, 568, 0, 0, 1427, 1682, 2, 1, 1.14286, 0, 20, 5, 0, 0, 1, 51, 66, 0, 140, 1, 2000, 2000, 1, 512, 0, 0, 0, 0, 0, 0, 52.272, 71.874, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 10, ''),
(91227, 0, 1390, 0, 0, 0, 'Hargosh', 'Backalley Butcher', 60010, 13, 14, 468, 568, 0, 0, 1427, 125, 7, 1, 1.14286, 0, 20, 5, 0, 0, 1, 51, 66, 0, 140, 1, 2000, 2000, 1, 512, 0, 0, 0, 0, 0, 0, 52.272, 71.874, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 0, 0, 3, 3368, 0, 0, 0, 0, 10, ''),
(91228, 0, 9553, 0, 0, 0, 'Haylee Bucketblast', '', 0, 13, 14, 468, 568, 0, 0, 1427, 1682, 2, 1, 1.14286, 0, 20, 5, 0, 0, 1, 51, 66, 0, 140, 1, 2000, 2000, 1, 512, 0, 0, 0, 0, 0, 0, 52.272, 71.874, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 10, ''),
(91229, 0, 7202, 0, 0, 0, 'Dockworker Shazklench', '', 60011, 13, 14, 468, 568, 0, 0, 1427, 1682, 3, 1, 1.14286, 0, 20, 5, 0, 0, 1, 51, 66, 0, 140, 1, 2000, 2000, 1, 512, 0, 0, 0, 0, 0, 0, 52.272, 71.874, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 0, 0, 3, 4429, 0, 0, 0, 0, 10, ''),
(91230, 0, 7112, 0, 0, 0, 'Cannoneer Gaxbruise', '', 60012, 13, 14, 468, 568, 0, 0, 1427, 1682, 3, 1, 1.14286, 0, 20, 5, 0, 0, 1, 51, 66, 0, 140, 1, 2000, 2000, 1, 512, 0, 0, 0, 0, 0, 0, 52.272, 71.874, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 0, 0, 3, 3454, 0, 0, 0, 0, 10, ''),
(91231, 0, 7192, 0, 0, 0, 'Cannoneer Dazzcrank', '', 60013, 13, 14, 468, 568, 0, 0, 1427, 1682, 3, 1, 1.14286, 0, 20, 5, 0, 0, 1, 51, 66, 0, 140, 1, 2000, 2000, 1, 512, 0, 0, 0, 0, 0, 0, 52.272, 71.874, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 0, 0, 3, 3454, 0, 0, 0, 0, 10, ''),
(91232, 0, 7340, 0, 0, 0, 'Krez the Wise', 'Scroll and Book Vendor', 60014, 13, 14, 468, 568, 0, 0, 1427, 1682, 16388, 1, 1.14286, 0, 20, 5, 0, 0, 1, 51, 66, 0, 140, 1, 2000, 2000, 1, 512, 0, 0, 0, 0, 0, 0, 52.272, 71.874, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 10, ''),
(91233, 0, 7110, 0, 0, 0, 'Technician Haztick', '', 0, 13, 14, 468, 568, 0, 0, 1427, 1682, 4, 1, 1.14286, 0, 20, 5, 0, 0, 1, 51, 66, 0, 140, 1, 2000, 2000, 1, 512, 0, 0, 0, 0, 0, 0, 52.272, 71.874, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 0, 0, 3, 3368, 0, 0, 0, 0, 10, ''),
(91234, 0, 7109, 0, 0, 0, 'Technician Grimzlow', 'Head Technician of Sparkwater', 0, 13, 14, 468, 568, 0, 0, 1427, 1682, 4, 1, 1.14286, 0, 20, 5, 0, 0, 1, 51, 66, 0, 140, 1, 2000, 2000, 1, 512, 0, 0, 0, 0, 0, 0, 52.272, 71.874, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 0, 0, 3, 3368, 0, 0, 0, 0, 10, ''),
(91235, 0, 7192, 0, 0, 0, 'Technician Balwaz', '', 0, 13, 14, 468, 568, 0, 0, 1427, 1682, 4, 1, 1.14286, 0, 20, 5, 0, 0, 1, 51, 66, 0, 140, 1, 2000, 2000, 1, 512, 0, 0, 0, 0, 0, 0, 52.272, 71.874, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 10, ''),
(91236, 8, 10747, 11375, 7102, 0, 'Sparkwater Bruiser', '', 0, 55, 55, 7842, 7842, 0, 0, 20, 1682, 0, 1, 1.42857, 0, 20, 5, 0, 0, 1, 154, 222, 0, 248, 1, 2000, 2000, 1, 36864, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 35021, 0, 0, 0, 'EventAI', 0, 3, 0, 0, 3, 16096, 0, 0, 0, 0, 524288, ''),
(91237, 0, 15201, 0, 0, 0, 'Tradesman Laz', '', 0, 13, 14, 468, 568, 0, 0, 1427, 1682, 2, 1, 1.14286, 0, 20, 5, 0, 0, 1, 51, 66, 0, 140, 1, 2000, 2000, 1, 512, 0, 0, 0, 0, 0, 0, 52.272, 71.874, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 10, ''),
(91238, 0, 15765, 0, 0, 0, 'Lena Zapscrew', 'Innkeeper', 60015, 16, 16, 398, 698, 0, 0, 2753, 1682, 135, 1, 1.14286, 0, 20, 5, 0, 0, 1, 74, 96, 0, 208, 1, 1000, 2000, 1, 512, 0, 0, 0, 0, 0, 0, 62.744, 86.273, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 10, ''),
(91239, 0, 7197, 0, 0, 0, 'Hangman Glix', 'Port Executioner', 60016, 7, 8, 468, 568, 0, 0, 1427, 1682, 3, 1, 1.14286, 0, 20, 5, 0, 0, 1, 51, 66, 0, 140, 1, 2000, 2000, 1, 512, 0, 0, 0, 0, 0, 0, 52.272, 71.874, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 10, ''),
(91240, 0, 18057, 0, 0, 0, 'Thorg the Big', 'Bouncer', 60017, 10, 12, 1468, 1568, 0, 0, 1427, 1682, 3, 1, 1.14286, 0, 20, 5, 0, 0, 1, 51, 66, 0, 140, 1, 2000, 2000, 1, 512, 0, 0, 0, 0, 0, 0, 52.272, 71.874, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 10, ''),
(91241, 0, 4083, 0, 0, 0, 'Tikku', '', 0, 10, 12, 468, 568, 0, 0, 1427, 530, 2, 1, 1.14286, 0, 20, 5, 0, 0, 1, 51, 66, 0, 140, 1, 2000, 2000, 1, 512, 0, 0, 0, 0, 0, 0, 52.272, 71.874, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 10, ''),
(91242, 0, 7179, 0, 0, 0, 'Wazzrocket', '', 0, 10, 12, 368, 568, 0, 0, 1427, 1682, 2, 1, 1.14286, 0, 20, 5, 0, 0, 1, 51, 66, 0, 140, 1, 2000, 2000, 1, 512, 0, 0, 0, 0, 0, 0, 52.272, 71.874, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 10, ''),
(91243, 0, 3199, 0, 0, 0, 'Gowlfang', '', 60018, 6, 7, 246, 568, 0, 0, 1427, 1682, 3, 1, 1.14286, 0, 20, 5, 0, 0, 1, 51, 66, 0, 140, 1, 2000, 2000, 1, 512, 0, 0, 0, 0, 0, 0, 52.272, 71.874, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 10, ''),
(91244, 0, 4565, 0, 0, 0, 'Targosh', '', 0, 3, 5, 146, 368, 0, 0, 1427, 125, 2, 1, 1.14286, 0, 20, 5, 0, 0, 1, 51, 66, 0, 140, 1, 2000, 2000, 1, 512, 0, 0, 0, 0, 0, 0, 52.272, 71.874, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 10, ''),
(91245, 0, 4377, 0, 0, 0, 'Narena', '', 0, 5, 6, 246, 368, 0, 0, 1427, 125, 2, 1, 1.14286, 0, 20, 5, 0, 0, 1, 51, 66, 0, 140, 1, 2000, 2000, 1, 512, 0, 0, 0, 0, 0, 0, 52.272, 71.874, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 10, ''),
(91246, 0, 3739, 0, 0, 0, 'Valkar', 'Fletcher', 0, 13, 13, 273, 273, 0, 0, 20, 125, 16388, 1, 1.14286, 0, 20, 5, 0, 0, 1, 13, 17, 0, 68, 1, 2000, 2000, 1, 4608, 0, 0, 0, 0, 0, 0, 21.5072, 29.5724, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'EventAI', 0, 3, 0, 0, 3, 3165, 0, 0, 0, 0, 524298, ''),
(91247, 0, 15094, 0, 0, 0, 'Karey Gozzleratch', 'Tailoring Supplies', 9177, 8, 9, 100, 400, 0, 0, 1200, 1682, 6, 1, 1.14286, 0, 20, 5, 0, 0, 1, 42, 53, 0, 122, 1, 2000, 2000, 1, 4608, 0, 0, 0, 0, 0, 0, 45.144, 62.073, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'EventAI', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 524298, ''),
(91248, 0, 7340, 0, 0, 0, 'Wixx', 'General Goods', 0, 10, 10, 300, 300, 0, 0, 20, 1682, 6, 1, 1.14286, 0, 20, 5, 0, 0, 1, 15, 19, 0, 70, 1, 2000, 2000, 1, 4608, 0, 0, 0, 0, 0, 0, 23.0384, 31.6778, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'EventAI', 0, 3, 0, 0, 3, 3164, 0, 0, 0, 0, 524298, ''),
(91249, 0, 7185, 0, 0, 0, 'Hizzle', 'Correction\'s Officer', 60019, 13, 14, 468, 568, 0, 0, 1427, 1682, 3, 1, 1.14286, 0, 20, 5, 0, 0, 1, 51, 66, 0, 140, 1, 2000, 2000, 1, 512, 0, 0, 0, 0, 0, 0, 52.272, 71.874, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 10, ''),
(91250, 0, 7172, 0, 0, 0, 'Dockmaster Nixx Oldfuse', '', 0, 13, 14, 468, 568, 0, 0, 1427, 1682, 2, 1, 1.14286, 0, 20, 5, 0, 0, 1, 51, 66, 0, 140, 1, 2000, 2000, 1, 512, 0, 0, 0, 0, 0, 0, 52.272, 71.874, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 10, ''),
(91251, 0, 4547, 0, 0, 0, 'Grunt Karg', NULL, 0, 20, 20, 484, 484, 0, 0, 852, 125, 2, 1, 1.14286, 0, 20, 5, 0, 0, 1, 24, 31, 0, 90, 1, 2000, 2000, 1, 4608, 0, 0, 0, 0, 0, 0, 31.856, 43.802, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 1, 1, 0, 3, 5911, 0, 0, 0, 0, 524298, ''),
(91252, 0, 7051, 0, 0, 0, 'Oilworker Skazjaw', '', 0, 13, 14, 468, 568, 0, 0, 1427, 1682, 2, 1, 1.14286, 0, 20, 5, 0, 0, 1, 51, 66, 0, 140, 1, 2000, 2000, 1, 512, 0, 0, 0, 0, 0, 0, 52.272, 71.874, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 10, ''),
(91253, 0, 11461, 0, 0, 0, 'Lix Tinwrench', 'Known Vagrant', 60020, 7, 8, 268, 568, 0, 0, 1427, 1682, 3, 1, 1.14286, 0, 20, 5, 0, 0, 1, 51, 66, 0, 140, 1, 2000, 2000, 1, 512, 0, 0, 0, 0, 0, 0, 52.272, 71.874, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 10, ''),
(91254, 0, 8569, 0, 0, 0, 'Gazztoggle Krewpipe', 'Sparkwater Associate', 0, 35, 38, 1268, 1568, 0, 0, 1427, 1682, 4, 1, 1.14286, 0, 20, 5, 0, 0, 1, 51, 66, 0, 140, 1, 2000, 2000, 1, 512, 0, 0, 0, 0, 0, 0, 52.272, 71.874, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 10, ''),
(91255, 0, 7095, 0, 0, 0, 'Frix Tallycog', '', 0, 7, 8, 268, 568, 0, 0, 1427, 1682, 1, 1, 1.14286, 0, 20, 5, 0, 0, 1, 51, 66, 0, 140, 1, 2000, 2000, 1, 512, 36, 0, 0, 0, 0, 0, 52.272, 71.874, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 10, ''),
(91256, 0, 7342, 0, 0, 0, 'Razzle Longpipe', 'Razzles Radical Rarities!', 60021, 7, 8, 268, 568, 0, 0, 1427, 1682, 3, 1, 1.14286, 0, 20, 5, 0, 0, 1, 51, 66, 0, 140, 1, 2000, 2000, 1, 512, 0, 0, 0, 0, 0, 0, 52.272, 71.874, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 10, ''),

(91257, 0, 7338, 0, 0, 0, 'Bizzle Cracksaw', '', 0, 5, 10, 168, 668, 0, 0, 1427, 1682, 2, 1, 1.14286, 0, 20, 5, 0, 0, 1, 51, 66, 0, 140, 1, 2000, 2000, 1, 512, 0, 0, 0, 0, 0, 0, 52.272, 71.874, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 10, ''),
(91258, 0, 10746, 0, 0, 0, 'Wendy Copperhack', '', 0, 5, 10, 168, 668, 0, 0, 1427, 1682, 2, 1, 1.14286, 0, 20, 5, 0, 0, 1, 51, 66, 0, 140, 1, 2000, 2000, 1, 512, 0, 0, 0, 0, 0, 0, 52.272, 71.874, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 10, ''),
(91259, 0, 8847, 0, 0, 0, 'Pazzle Brightwrench', 'Captain of The Brightwater', 0, 10, 13, 568, 668, 0, 0, 1427, 1682, 2, 1, 1.14286, 0, 20, 5, 0, 0, 1, 51, 66, 0, 140, 1, 2000, 2000, 1, 512, 0, 0, 0, 0, 0, 0, 52.272, 71.874, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 10, ''),
(91260, 0, 7341, 0, 0, 0, 'Shak \'The Hack\'', '', 0, 10, 10, 568, 868, 0, 0, 1427, 1682, 2, 1, 1.14286, 0, 20, 5, 0, 0, 1, 51, 66, 0, 140, 1, 2000, 2000, 1, 512, 0, 0, 0, 0, 0, 0, 52.272, 71.874, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 10, ''),
(91261, 0, 7198, 0, 0, 0, 'Hiz Boltmuck', '', 0, 5, 10, 168, 668, 0, 0, 1427, 1682, 2, 1, 1.14286, 0, 20, 5, 0, 0, 1, 51, 66, 0, 140, 1, 2000, 2000, 1, 512, 0, 0, 0, 0, 0, 0, 52.272, 71.874, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 10, ''),
(91262, 0, 7188, 0, 0, 0, 'Wastemanager Taxx', '', 0, 5, 10, 168, 668, 0, 0, 1427, 1682, 2, 1, 1.14286, 0, 20, 5, 0, 0, 1, 51, 66, 0, 140, 1, 2000, 2000, 1, 512, 0, 0, 0, 0, 0, 0, 52.272, 71.874, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 10, ''),
(91263, 0, 9132, 0, 0, 0, 'Minx Oggbolt', '', 0, 5, 10, 168, 668, 0, 0, 1427, 1682, 2, 1, 1.14286, 0, 20, 5, 0, 0, 1, 51, 66, 0, 140, 1, 2000, 2000, 1, 512, 0, 0, 0, 0, 0, 0, 52.272, 71.874, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 10, ''),
(91264, 0, 7157, 0, 0, 0, 'Woodworker Grack', '', 0, 5, 10, 168, 668, 0, 0, 1427, 1682, 2, 1, 1.14286, 0, 20, 5, 0, 0, 1, 51, 66, 0, 140, 1, 2000, 2000, 1, 512, 0, 0, 0, 0, 0, 0, 52.272, 71.874, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 10, ''),
(91265, 0, 7180, 0, 0, 0, 'Woodworker Rustlug', '', 0, 5, 10, 168, 668, 0, 0, 1427, 1682, 2, 1, 1.14286, 0, 20, 5, 0, 0, 1, 51, 66, 0, 140, 1, 2000, 2000, 1, 512, 0, 0, 0, 0, 0, 0, 52.272, 71.874, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 10, ''),
(91266, 0, 13349, 0, 0, 0, 'Nazgro Wacktoggle', 'Woodcutting Foreman', 0, 10, 13, 368, 668, 0, 0, 1427, 1682, 2, 1, 1.14286, 0, 20, 5, 0, 0, 1, 51, 66, 0, 140, 1, 2000, 2000, 1, 512, 0, 0, 0, 0, 0, 0, 52.272, 71.874, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 10, ''),
(91267, 0, 7171, 0, 0, 0, 'Shredder Operator Boltratchet', 'Woodcutting Foreman', 0, 11, 12, 268, 668, 0, 0, 1427, 1682, 2, 1, 1.14286, 0, 20, 5, 0, 0, 1, 51, 66, 0, 140, 1, 2000, 2000, 1, 512, 0, 0, 0, 0, 0, 0, 52.272, 71.874, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 10, ''),
(91268, 0, 7230, 0, 0, 0, 'Technician Fraxdust', '', 0, 5, 12, 268, 668, 0, 0, 1427, 1682, 2, 1, 1.14286, 0, 20, 5, 0, 0, 1, 51, 66, 0, 140, 1, 2000, 2000, 1, 512, 0, 0, 0, 0, 0, 0, 52.272, 71.874, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 10, ''),
(91269, 0, 7171, 0, 0, 0, 'Miner Gralwax', '', 0, 5, 12, 268, 668, 0, 0, 1427, 1682, 2, 1, 1.14286, 0, 20, 5, 0, 0, 1, 51, 66, 0, 140, 1, 2000, 2000, 1, 512, 0, 0, 0, 0, 0, 0, 52.272, 71.874, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 10, ''),
(91270, 0, 7202, 0, 0, 0, 'Miner Kazzlebucket', '', 0, 5, 12, 268, 668, 0, 0, 1427, 1682, 2, 1, 1.14286, 0, 20, 5, 0, 0, 1, 51, 66, 0, 140, 1, 2000, 2000, 1, 512, 0, 0, 0, 0, 0, 0, 52.272, 71.874, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 10, ''),
(91271, 0, 7201, 0, 0, 0, 'Miner Igglesocket', '', 0, 5, 12, 268, 668, 0, 0, 1427, 1682, 2, 1, 1.14286, 0, 20, 5, 0, 0, 1, 51, 66, 0, 140, 1, 2000, 2000, 1, 512, 0, 0, 0, 0, 0, 0, 52.272, 71.874, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 10, ''),
(91272, 0, 7051, 0, 0, 0, 'Miner Axel', '', 0, 8, 12, 268, 668, 0, 0, 1427, 1682, 2, 1, 1.14286, 0, 20, 5, 0, 0, 1, 51, 66, 0, 140, 1, 2000, 2000, 1, 512, 0, 0, 0, 0, 0, 0, 52.272, 71.874, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 10, ''),
(91273, 0, 7201, 0, 0, 0, 'Miner Werrywrench', '', 0, 8, 12, 268, 668, 0, 0, 1427, 1682, 2, 1, 1.14286, 0, 20, 5, 0, 0, 1, 51, 66, 0, 140, 1, 2000, 2000, 1, 512, 0, 0, 0, 0, 0, 0, 52.272, 71.874, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 10, ''),
(91274, 0, 8477, 0, 0, 0, 'Big Fraggle', 'The Mining Boss', 0, 8, 12, 268, 668, 0, 0, 1427, 1682, 2, 1, 1.14286, 0, 20, 5, 0, 0, 1, 51, 66, 0, 140, 1, 2000, 2000, 1, 512, 0, 0, 0, 0, 0, 0, 52.272, 71.874, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 10, ''),
(91275, 0, 7181, 0, 0, 0, 'Grimm Onearm', '', 0, 8, 12, 268, 668, 0, 0, 1427, 1682, 2, 1, 1.14286, 0, 20, 5, 0, 0, 1, 51, 66, 0, 140, 1, 2000, 2000, 1, 512, 0, 0, 0, 0, 0, 0, 52.272, 71.874, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 10, ''),
(91276, 0, 7188, 0, 0, 0, 'Mememgem', '', 0, 8, 12, 268, 668, 0, 0, 1427, 1682, 2, 1, 1.14286, 0, 20, 5, 0, 0, 1, 51, 66, 0, 140, 1, 2000, 2000, 1, 512, 0, 0, 0, 0, 0, 0, 52.272, 71.874, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 10, ''),
(91277, 0, 3748, 0, 0, 0, 'Miner Glaktor', '', 0, 8, 12, 268, 668, 0, 0, 1427, 1682, 2, 1, 1.14286, 0, 20, 5, 0, 0, 1, 51, 66, 0, 140, 1, 2000, 2000, 1, 512, 0, 0, 0, 0, 0, 0, 52.272, 71.874, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 10, ''),
(91278, 0, 7058, 0, 0, 0, 'Jock Tossbucket ', 'Banker', 0, 45, 45, 5544, 5544, 0, 0, 2725, 69, 256, 1, 1.14286, 0, 20, 5, 0, 0, 1, 72, 93, 0, 204, 1, 2000, 2000, 1, 0, 0, 0, 0, 0, 0, 0, 61.776, 84.942, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 1, 0, 0, 3, 3496, 0, 0, 0, 0, 10, ''),
(91279, 0, 7125, 0, 0, 0, 'Woodworker Shlax', '', 0, 8, 12, 268, 668, 0, 0, 1427, 1682, 2, 1, 1.14286, 0, 20, 5, 0, 0, 1, 51, 66, 0, 140, 1, 2000, 2000, 1, 512, 0, 0, 0, 0, 0, 0, 52.272, 71.874, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 10, ''),
(91280, 0, 7053, 0, 0, 0, 'Brizclang Spuckettool', 'Brightwater Crew', 0, 10, 14, 468, 568, 0, 0, 1427, 1682, 3, 1, 1.14286, 0, 20, 5, 0, 0, 1, 51, 66, 0, 140, 1, 2000, 2000, 1, 512, 0, 0, 0, 0, 0, 0, 52.272, 71.874, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 0, 0, 3, 3454, 0, 0, 0, 0, 10, ''),
(91281, 0, 15300, 0, 0, 0, 'Spanessa Fogwater', 'Brightwater Crew', 0, 10, 14, 468, 568, 0, 0, 1427, 1682, 3, 1, 1.14286, 0, 20, 5, 0, 0, 1, 51, 66, 0, 140, 1, 2000, 2000, 1, 512, 0, 0, 0, 0, 0, 0, 52.272, 71.874, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 0, 0, 3, 3454, 0, 0, 0, 0, 10, ''),
(91282, 0, 7106, 0, 0, 0, 'Shalgrig Pipeshack', 'Brightwater Crew', 0, 10, 14, 468, 568, 0, 0, 1427, 1682, 3, 1, 1.14286, 0, 20, 5, 0, 0, 1, 51, 66, 0, 140, 1, 2000, 2000, 1, 512, 0, 0, 0, 0, 0, 0, 52.272, 71.874, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 0, 0, 3, 3454, 0, 0, 0, 0, 10, ''),
(91283, 0, 6761, 0, 0, 0, 'Lieutenant Azsalus', NULL, 0, 54, 54, 5847, 6030, 5340, 5461, 1742, 103, 0, 0.888888, 1.14286, 0, 20, 5, 0, 1, 1, 460, 593, 0, 262, 1, 2000, 2000, 8, 64, 0, 0, 0, 0, 0, 0, 65.7432, 90.3969, 100, 2, 0, 7437, 0, 7437, 0, 0, 0, 85, 0, 170, 15784, 15043, 0, 0, 0, 0, 357, 472, '', 1, 1, 0, 0, 3, 7437, 0, 0, 0, 0, 0, 'generic_spell_ai');

update creature_template set faction = 1682 where entry between 91200 and 91290; -- Durotar Labor Union
update creature_template set faction = 125 where entry in (91203, 91204, 91206, 91207, 91227, 91244, 91245, 91246, 91251, 91277); -- Orgrimmar

-- Gossip + Quest
update creature_template set npc_flags = 3 where entry in (91266, 91267, 91274, 91251, 91277, 91280, 91281, );
-- Quest
update creature_template set npc_flags = 2 where entry in (91268, 91269, 91275, 91276, 91234, 91254, 91203, 91282, 5546); 
-- Gossip + Quest + Vendor
-- update creature_template set npc_flags = 16389 where entry = 91201;
-- Gossip + Quest + Trainer
-- update creature_template set npc_flags = 19 where entry = 91202; 
-- Vendor + Quest + Trainer
-- update creature_template set npc_flags = 23 where entry = 91206; 
-- Gossip + Vendor
 update creature_template set npc_flags = 7 where entry in (91220); 
 update creature_template set scale = 1.2 where entry = 91283;

update creature_template set equipment_id = 1094 where entry in (91269, 91270, 91271, 91272, 91273, 91277); -- Minig Pick
update creature_template set equipment_id = 921 where entry in (91264, 91265, 91266, 91279); -- Lumberjack Axe
update creature_template set equipment_id = 1097 where entry in (91257, 91258, 91260, 91261, 91262, 91263); -- Wrench

update creature_template set dynamic_flags = 36, npc_flags = 3 where entry = 91255; 
replace into creature_template_addon (entry, bytes1) values (91255, 7);
replace into creature_template_addon (entry, patch, mount, bytes1, b2_0_sheath, b2_1_flags, emote, moveflags, auras) values (91200, 0, 0, 0, 0, 0, 69, 0, null);
replace into creature_template_addon (entry, patch, mount, bytes1, b2_0_sheath, b2_1_flags, emote, moveflags, auras) values (91268, 0, 0, 0, 0, 0, 69, 0, null);

replace into creature_template_addon (entry, patch, mount, bytes1, b2_0_sheath, b2_1_flags, emote, moveflags, auras) values (91268, 0, 0, 0, 0, 0, 233, 0, null);
replace into creature_template_addon (entry, patch, mount, bytes1, b2_0_sheath, b2_1_flags, emote, moveflags, auras) values (91269, 0, 0, 0, 0, 0, 233, 0, null);
replace into creature_template_addon (entry, patch, mount, bytes1, b2_0_sheath, b2_1_flags, emote, moveflags, auras) values (91270, 0, 0, 0, 0, 0, 233, 0, null);
replace into creature_template_addon (entry, patch, mount, bytes1, b2_0_sheath, b2_1_flags, emote, moveflags, auras) values (91271, 0, 0, 0, 0, 0, 233, 0, null);

replace into creature_template_addon (entry, patch, mount, bytes1, b2_0_sheath, b2_1_flags, emote, moveflags, auras) values (91277, 0, 0, 0, 0, 0, 233, 0, null);
replace into creature_template_addon (entry, patch, mount, bytes1, b2_0_sheath, b2_1_flags, emote, moveflags, auras) values (91279, 0, 0, 0, 0, 0, 233, 0, null);

replace into creature_template_addon (entry, patch, mount, bytes1, b2_0_sheath, b2_1_flags, emote, moveflags, auras) values (91265, 0, 0, 0, 0, 0, 234, 0, null);

replace into creature_template_addon (entry, patch, mount, bytes1, b2_0_sheath, b2_1_flags, emote, moveflags, auras) values (91209, 0, 0, 1, 0, 0, 0, 0, null);
replace into creature_template_addon (entry, patch, mount, bytes1, b2_0_sheath, b2_1_flags, emote, moveflags, auras) values (91210, 0, 0, 1, 0, 0, 0, 0, null);
replace into creature_template_addon (entry, patch, mount, bytes1, b2_0_sheath, b2_1_flags, emote, moveflags, auras) values (91212, 0, 0, 3, 0, 0, 0, 0, null);
replace into creature_template_addon (entry, patch, mount, bytes1, b2_0_sheath, b2_1_flags, emote, moveflags, auras) values (91206, 0, 0, 0, 1, 16, 379, 0, null);

-- Alchemy 
replace into  npc_trainer  values (91202, 2275, 10, 0, 0, 5, 0, 5875);
replace into  npc_trainer  values (91202, 2339, 100, 171, 25, 0, 0, 5875);
replace into  npc_trainer  values (91202, 2340, 135, 171, 40, 0, 0, 5875);
replace into  npc_trainer  values (91202, 2341, 250, 171, 55, 0, 0, 5875);
replace into  npc_trainer  values (91202, 3179, 450, 171, 90, 0, 0, 5875);
replace into  npc_trainer  values (91202, 3181, 1350, 171, 120, 0, 0, 5875);
replace into  npc_trainer  values (91202, 3184, 50, 171, 15, 0, 0, 5875);
replace into  npc_trainer  values (91202, 3185, 1350, 171, 125, 0, 0, 5875);
replace into  npc_trainer  values (91202, 3186, 1800, 171, 130, 0, 0, 5875);
replace into  npc_trainer  values (91202, 3458, 3600, 171, 110, 0, 0, 5875);
replace into  npc_trainer  values (91202, 7180, 405, 171, 90, 0, 0, 5875);
replace into  npc_trainer  values (91202, 7838, 225, 171, 80, 0, 0, 5875);
replace into  npc_trainer  values (91202, 7839, 900, 171, 130, 0, 0, 5875);
replace into  npc_trainer  values (91202, 7842, 900, 171, 100, 0, 0, 5875);
replace into  npc_trainer  values (91202, 7846, 2700, 171, 140, 0, 0, 5875);
replace into  npc_trainer  values (91202, 11536, 225, 171, 50, 0, 0, 5875);
-- Fishing
replace into npc_trainer values (91206, 7733, 100, 0, 0, 5, 0, 5875);
replace into npc_trainer values (91206, 7734, 500, 356, 50, 0, 0, 5875);

-- Greeting texts:
set @gossip_menu_id = 60000; set @magic_number = 91205; 
replace into gossip_menu (entry, text_id, condition_id) VALUES (@gossip_menu_id, @magic_number, '0'); replace into broadcast_text (entry, Male_Text) values (@magic_number, 'If you\'re lookin\' for odds and ends from across the south sea\'s then you\'re in luck!\n\nThere\'s no other place you can get this stuff then right here at Zeet\'s!\n\nOh, and NO REFUNDS!'); replace into npc_text (ID, BroadcastTextID0) values (@magic_number, @magic_number); update creature_template set gossip_menu_id = @gossip_menu_id where entry = @magic_number;

set @gossip_menu_id = 60001; set @magic_number = 91202; 
replace into gossip_menu (entry, text_id, condition_id) VALUES (@gossip_menu_id, @magic_number, '0'); replace into broadcast_text (entry, Male_Text) values (@magic_number, 'Hey there, if you\'re looking to produce your own potions to save a few coin, you\'ve come just to the right place!'); replace into npc_text (ID, BroadcastTextID0) values (@magic_number, @magic_number); update creature_template set gossip_menu_id = @gossip_menu_id where entry = @magic_number;

set @gossip_menu_id = 60002; set @magic_number = 91204; 
replace into gossip_menu (entry, text_id, condition_id) VALUES (@gossip_menu_id, @magic_number, '0'); replace into broadcast_text (entry, Male_Text) values (@magic_number, 'Unless you have a drink for me, you\'d best shove up whelp!'); replace into npc_text (ID, BroadcastTextID0) values (@magic_number, @magic_number); update creature_template set gossip_menu_id = @gossip_menu_id where entry = @magic_number;

set @gossip_menu_id = 60003; set @magic_number = 91201; 
replace into gossip_menu (entry, text_id, condition_id) VALUES (@gossip_menu_id, @magic_number, '0'); replace into broadcast_text (entry, Male_Text) values (@magic_number, 'Cutting wood isn\'t easy work, especially with all these lazy louts!\n\nIt\'s what good foremans like me are here for, up productivity!'); replace into npc_text (ID, BroadcastTextID0) values (@magic_number, @magic_number); update creature_template set gossip_menu_id = @gossip_menu_id where entry = @magic_number;

set @gossip_menu_id = 60004; set @magic_number = 91200; 
replace into gossip_menu (entry, text_id, condition_id) VALUES (@gossip_menu_id, @magic_number, '0'); replace into broadcast_text (entry, Male_Text) values (@magic_number, 'It\'s all about goblin precision, you think an orc could work such delicate parts?\n\nWhat\'cha need bub?'); replace into npc_text (ID, BroadcastTextID0) values (@magic_number, @magic_number); update creature_template set gossip_menu_id = @gossip_menu_id where entry = @magic_number;

set @gossip_menu_id = 60007; set @magic_number = 91220; 
replace into gossip_menu (entry, text_id, condition_id) VALUES (@gossip_menu_id, @magic_number, '0'); replace into broadcast_text (entry, Male_Text) values (@magic_number, 'Lozzle the Nozzle here! You\'re looking awfully thirsty, the sweat rolling off your face, the hot sun beating down on someone would do -just- that!\n\nWhy don\'t you grab some of my water, it\'s ice cold, and quenches the thirst, priced JUST right!\n\nNot like you\'ll find any other in town.'); replace into npc_text (ID, BroadcastTextID0) values (@magic_number, @magic_number); update creature_template set gossip_menu_id = @gossip_menu_id where entry = @magic_number;

set @gossip_menu_id = 60008; set @magic_number = 91225; 
replace into gossip_menu (entry, text_id, condition_id) VALUES (@gossip_menu_id, @magic_number, '0'); replace into broadcast_text (entry, Male_Text) values (@magic_number, 'Welcome to Sparkwater!\n\nI designed and built this place from the ground up, from the very first stone and rock into what it is now.\n\nSo, if you got any building projects, let me know, it may cost a pretty penny, but it\'s worth the gold, I\'ll tell you -THAT- much!'); replace into npc_text (ID, BroadcastTextID0) values (@magic_number, @magic_number); update creature_template set gossip_menu_id = @gossip_menu_id where entry = @magic_number;

set @gossip_menu_id = 60009; set @magic_number = 91221; 
replace into gossip_menu (entry, text_id, condition_id) VALUES (@gossip_menu_id, @magic_number, '0'); replace into broadcast_text (entry, Male_Text) values (@magic_number, 'You lookin\' for your fix bub? I got the good stuff, cheap, and home made!\m\mIt will get you drunk faster then any of that silly Dalaran wine, that\'s for sure, shows you what a goblin with his mind to a task can do.'); replace into npc_text (ID, BroadcastTextID0) values (@magic_number, @magic_number); update creature_template set gossip_menu_id = @gossip_menu_id where entry = @magic_number;

set @gossip_menu_id = 60010; set @magic_number = 91227; 
replace into gossip_menu (entry, text_id, condition_id) VALUES (@gossip_menu_id, @magic_number, '0'); replace into broadcast_text (entry, Male_Text) values (@magic_number, 'Throm ka friend, the goblins surely have a taste for fine meat, and it would seem they eat quite the filling of it.'); replace into npc_text (ID, BroadcastTextID0) values (@magic_number, @magic_number); update creature_template set gossip_menu_id = @gossip_menu_id where entry = @magic_number;

set @gossip_menu_id = 60011; set @magic_number = 91229; 
replace into gossip_menu (entry, text_id, condition_id) VALUES (@gossip_menu_id, @magic_number, '0'); replace into broadcast_text (entry, Male_Text) values (@magic_number, 'I been hearin\' the platform got overrun by the sea crawlers they better not come bother me any!'); replace into npc_text (ID, BroadcastTextID0) values (@magic_number, @magic_number); update creature_template set gossip_menu_id = @gossip_menu_id where entry = @magic_number;

set @gossip_menu_id = 60012; set @magic_number = 91230; 
replace into gossip_menu (entry, text_id, condition_id) VALUES (@gossip_menu_id, @magic_number, '0'); replace into broadcast_text (entry, Male_Text) values (@magic_number, 'My job here is to make sure the port is safe, any unknown ships come into range I fire this bad-girl at them, iron ball packed tight to the brim with gun powder will sink any vessel that is stupid enough to mess with us.'); replace into npc_text (ID, BroadcastTextID0) values (@magic_number, @magic_number); update creature_template set gossip_menu_id = @gossip_menu_id where entry = @magic_number;

set @gossip_menu_id = 60013; set @magic_number = 91231; 
replace into gossip_menu (entry, text_id, condition_id) VALUES (@gossip_menu_id, @magic_number, '0'); replace into broadcast_text (entry, Male_Text) values (@magic_number, 'Missfire Shmissfire, we\'re ordered to pack this baby full of powder when we see something!\n\nWe\'ll probably hit the eastern kingdoms!'); replace into npc_text (ID, BroadcastTextID0) values (@magic_number, @magic_number); update creature_template set gossip_menu_id = @gossip_menu_id where entry = @magic_number;

set @gossip_menu_id = 60014; set @magic_number = 91232; 
replace into gossip_menu (entry, text_id, condition_id) VALUES (@gossip_menu_id, @magic_number, '0'); replace into broadcast_text (entry, Male_Text) values (@magic_number, 'Heh, you lookin\' to get smarter huh? Well, reading some of these scrolls or books certainly could expand your knowledge, a few of them for a little while for sure!'); replace into npc_text (ID, BroadcastTextID0) values (@magic_number, @magic_number); update creature_template set gossip_menu_id = @gossip_menu_id where entry = @magic_number;

set @gossip_menu_id = 60015; set @magic_number = 91238; 
replace into gossip_menu (entry, text_id, condition_id) VALUES (@gossip_menu_id, @magic_number, '0'); replace into broadcast_text (entry, Male_Text) values (@magic_number, 'Hey! Welcome to the Sparkwater Tavern!\n\nMake yourself at home and find a table! If you need any drinks come talk to me.'); replace into npc_text (ID, BroadcastTextID0) values (@magic_number, @magic_number); update creature_template set gossip_menu_id = @gossip_menu_id where entry = @magic_number;

set @gossip_menu_id = 60016; set @magic_number = 91239; 
replace into gossip_menu (entry, text_id, condition_id) VALUES (@gossip_menu_id, @magic_number, '0'); replace into broadcast_text (entry, Male_Text) values (@magic_number, 'Whatcha want bub? No ones supposed to be executed today.'); replace into npc_text (ID, BroadcastTextID0) values (@magic_number, @magic_number); update creature_template set gossip_menu_id = @gossip_menu_id where entry = @magic_number;

set @gossip_menu_id = 60017; set @magic_number = 91240; 
replace into gossip_menu (entry, text_id, condition_id) VALUES (@gossip_menu_id, @magic_number, '0'); replace into broadcast_text (entry, Male_Text) values (@magic_number, 'Me no want smash, keep peace or Thorg be forced to smash.'); replace into npc_text (ID, BroadcastTextID0) values (@magic_number, @magic_number); update creature_template set gossip_menu_id = @gossip_menu_id where entry = @magic_number;

set @gossip_menu_id = 60018; set @magic_number = 91243; 
replace into gossip_menu (entry, text_id, condition_id) VALUES (@gossip_menu_id, @magic_number, '0'); replace into broadcast_text (entry, Male_Text) values (@magic_number, 'Yes yes? What does $r want with Gowlfang?\n\nYou think-think just cause I look dif-different you can stare?! Gowlfang comes from strong tribe of gnoll! No bad-talk!'); replace into npc_text (ID, BroadcastTextID0) values (@magic_number, @magic_number); update creature_template set gossip_menu_id = @gossip_menu_id where entry = @magic_number;

set @gossip_menu_id = 60019; set @magic_number = 91249; 
replace into gossip_menu (entry, text_id, condition_id) VALUES (@gossip_menu_id, @magic_number, '0'); replace into broadcast_text (entry, Male_Text) values (@magic_number, 'No Loitering! If you don\'t got business here then scram, unless you want to end up in the hole!'); replace into npc_text (ID, BroadcastTextID0) values (@magic_number, @magic_number); update creature_template set gossip_menu_id = @gossip_menu_id where entry = @magic_number;

set @gossip_menu_id = 60020; set @magic_number = 91253; 
replace into gossip_menu (entry, text_id, condition_id) VALUES (@gossip_menu_id, @magic_number, '0'); replace into broadcast_text (entry, Male_Text) values (@magic_number, 'Getting fired for being lazy from that stupid lumber cutting job has been the best thing ever!\n\nNo one has found me yet and I got all the time I could ever ask for, screw them!'); replace into npc_text (ID, BroadcastTextID0) values (@magic_number, @magic_number); update creature_template set gossip_menu_id = @gossip_menu_id where entry = @magic_number;

set @gossip_menu_id = 60021; set @magic_number = 91256; 
replace into gossip_menu (entry, text_id, condition_id) VALUES (@gossip_menu_id, @magic_number, '0'); replace into broadcast_text (entry, Male_Text) values (@magic_number, 'Welcome to Razzle\'s! Don\'t pay any attention to that goof Zeet in the alley, his goods are nothing more then cheap table scratch!\n\nWhat I got here are genuine rare items from across Azeroth! They\'re limited, first come, first serve and should serve any adventurer in this world well!\n\nSo, step up, get some of Razzle\'s Radical Rarities before they are gone and swiped up by another more eager, and... Heh, more Savvy then yourself!'); replace into npc_text (ID, BroadcastTextID0) values (@magic_number, @magic_number); update creature_template set gossip_menu_id = @gossip_menu_id where entry = @magic_number;

set @gossip_menu_id = 60022; set @magic_number = 91266; 
replace into gossip_menu (entry, text_id, condition_id) VALUES (@gossip_menu_id, @magic_number, '0'); replace into broadcast_text (entry, Male_Text) values (@magic_number, 'We\'re making good progress here with the woodcutting efforts in Durotar!\n\nThere may not be a big excess of tree\'s around here, but these ones are massive, and large, offer quite a lot of lumber!'); replace into npc_text (ID, BroadcastTextID0) values (@magic_number, @magic_number); update creature_template set gossip_menu_id = @gossip_menu_id where entry = @magic_number;

set @gossip_menu_id = 60023; set @magic_number = 91267; 
replace into gossip_menu (entry, text_id, condition_id) VALUES (@gossip_menu_id, @magic_number, '0'); replace into broadcast_text (entry, Male_Text) values (@magic_number, 'The damned heat is making all of the shredders break down way faster then I am used too!\n\nEven with all of my experience in using these things I haven\'t had this many problems!\n\nIt\'s that damned sun, tell Wrix to hurry up already with those repairs! Last thing I want to do is waste all this experience and be reduced to chopping with my arms, it\'s so inefficient!'); replace into npc_text (ID, BroadcastTextID0) values (@magic_number, @magic_number); update creature_template set gossip_menu_id = @gossip_menu_id where entry = @magic_number;

set @gossip_menu_id = 60024; set @magic_number = 91274; 
replace into gossip_menu (entry, text_id, condition_id) VALUES (@gossip_menu_id, @magic_number, '0'); replace into broadcast_text (entry, Male_Text) values (@magic_number, 'Always more work to be done and its up to me to make sure it gets done! We got shipments due and people to get all this stone and ore too!\n\nWithout me around, half of what you see here wouldn\'t even exist! Hey, you lookin\' for a job?'); replace into npc_text (ID, BroadcastTextID0) values (@magic_number, @magic_number); update creature_template set gossip_menu_id = @gossip_menu_id where entry = @magic_number;

set @gossip_menu_id = 60025; set @magic_number = 91251; 
replace into gossip_menu (entry, text_id, condition_id) VALUES (@gossip_menu_id, @magic_number, '0'); replace into broadcast_text (entry, Male_Text) values (@magic_number, 'We shall see soon if these Goblin\'s can embody their station as honorable members of the Horde...'); replace into npc_text (ID, BroadcastTextID0) values (@magic_number, @magic_number); update creature_template set gossip_menu_id = @gossip_menu_id where entry = @magic_number;

set @gossip_menu_id = 60026; set @magic_number = 91216; 
replace into gossip_menu (entry, text_id, condition_id) VALUES (@gossip_menu_id, @magic_number, '0'); replace into broadcast_text (entry, Male_Text) values (@magic_number, 'Wuzgut make sure no one steal lumber, you buy?'); replace into npc_text (ID, BroadcastTextID0) values (@magic_number, @magic_number); update creature_template set gossip_menu_id = @gossip_menu_id where entry = @magic_number;

set @gossip_menu_id = 60027; set @magic_number = 91255; 
replace into gossip_menu (entry, text_id, condition_id) VALUES (@gossip_menu_id, @magic_number, '0'); replace into broadcast_text (entry, Male_Text) values (@magic_number, 'The goblin\'s body is covered in various cuts, scrapes bruises and puncture wounds.'); replace into npc_text (ID, BroadcastTextID0) values (@magic_number, @magic_number); update creature_template set gossip_menu_id = @gossip_menu_id where entry = @magic_number;

set @gossip_menu_id = 60028; set @magic_number = 91277; 
replace into gossip_menu (entry, text_id, condition_id) VALUES (@gossip_menu_id, @magic_number, '0'); replace into broadcast_text (entry, Male_Text) values (@magic_number, 'Can\'t believe they hired me to just swing a pick axe! Easy work!'); replace into npc_text (ID, BroadcastTextID0) values (@magic_number, @magic_number); update creature_template set gossip_menu_id = @gossip_menu_id where entry = @magic_number;

set @gossip_menu_id = 60029; set @magic_number = 91280; 
replace into gossip_menu (entry, text_id, condition_id) VALUES (@gossip_menu_id, @magic_number, '0'); replace into broadcast_text (entry, Male_Text) values (@magic_number, 'You ever been shipwrecked before? I\'ll tell you, it isn\'t great.'); replace into npc_text (ID, BroadcastTextID0) values (@magic_number, @magic_number); update creature_template set gossip_menu_id = @gossip_menu_id where entry = @magic_number;

set @gossip_menu_id = 60030; set @magic_number = 91281; 
replace into gossip_menu (entry, text_id, condition_id) VALUES (@gossip_menu_id, @magic_number, '0'); replace into broadcast_text (entry, Male_Text) values (@magic_number, 'Waiting for the Captain to send word back, he\'s taking his time.'); replace into npc_text (ID, BroadcastTextID0) values (@magic_number, @magic_number); update creature_template set gossip_menu_id = @gossip_menu_id where entry = @magic_number;


-- Vendors
delete from npc_vendor where entry = 91248;
delete from npc_vendor where entry = 91238;
replace into npc_vendor values (91207, 2488, 0, 0, 0, 0);
replace into npc_vendor values (91207, 2489, 0, 0, 0, 0);
replace into npc_vendor values (91207, 2490, 0, 0, 0, 0);
replace into npc_vendor values (91207, 2491, 0, 0, 0, 0);
replace into npc_vendor values (91207, 2492, 0, 0, 0, 0);
replace into npc_vendor values (91207, 2493, 0, 0, 0, 0);
replace into npc_vendor values (91207, 2494, 0, 0, 0, 0);
replace into npc_vendor values (91207, 2495, 0, 0, 0, 0);
replace into npc_vendor values (91207, 2506, 0, 0, 0, 0);
replace into npc_vendor values (91207, 2507, 0, 0, 0, 0);
replace into npc_vendor values (91207, 2512, 0, 0, 0, 0);
replace into npc_vendor values (91207, 2515, 0, 0, 0, 0);
replace into npc_vendor values (91207, 5439, 0, 0, 0, 0);
replace into npc_vendor values (91207, 11362, 0, 0, 0, 0);
replace into npc_vendor values (91207, 2129, 0, 0, 0, 0);
replace into npc_vendor values (91207, 2379, 0, 0, 0, 0);
replace into npc_vendor values (91207, 2380, 0, 0, 0, 0);
replace into npc_vendor values (91207, 2381, 0, 0, 0, 0);
replace into npc_vendor values (91207, 2383, 0, 0, 0, 0);
replace into npc_vendor values (91207, 2384, 0, 0, 0, 0);
replace into npc_vendor values (91207, 2385, 0, 0, 0, 0);
replace into npc_vendor values (91207, 17184, 0, 0, 0, 0);
replace into npc_vendor values (91215, 2880, 0, 0, 0, 0);
replace into npc_vendor values (91215, 2901, 0, 0, 0, 0);
replace into npc_vendor values (91215, 3466, 0, 0, 0, 0);
replace into npc_vendor values (91215, 4357, 4, 10800, 0, 0);
replace into npc_vendor values (91215, 4361, 2, 10800, 0, 0);
replace into npc_vendor values (91215, 4363, 2, 10800, 0, 0);
replace into npc_vendor values (91215, 4364, 4, 10800, 0, 0);
replace into npc_vendor values (91215, 4371, 2, 10800, 0, 0);
replace into npc_vendor values (91215, 4382, 1, 10800, 0, 0);
replace into npc_vendor values (91215, 4389, 0, 0, 0, 0);
replace into npc_vendor values (91215, 4399, 0, 0, 0, 0);
replace into npc_vendor values (91215, 4400, 0, 0, 0, 0);
replace into npc_vendor values (91215, 4404, 3, 10800, 0, 0);
replace into npc_vendor values (91215, 5956, 0, 0, 0, 0);
replace into npc_vendor values (91215, 10647, 0, 0, 0, 0);
replace into npc_vendor values (91215, 10648, 0, 0, 0, 0);
replace into npc_vendor (entry, item) values (91205, 2773);
replace into npc_vendor (entry, item) values (91205, 81278);
replace into npc_vendor (entry, item) values (91216, 4470);
replace into npc_vendor (entry, item) values (91221, 81296);
replace into npc_vendor (entry, item) values (91221, 80167);
replace into npc_vendor (entry, item) values (91220, 80167);

replace into npc_vendor (entry, item) values (91220, 81297);
replace into npc_vendor (entry, item) values (91220, 81298);
replace into npc_vendor (entry, item) values (91220, 81299);
replace into npc_vendor (entry, item) values (91220, 81300);
replace into npc_vendor (entry, item) values (91220, 81301);
replace into npc_vendor (entry, item) values (91220, 81302);
replace into npc_vendor (entry, item) values (91220, 81303);
replace into npc_vendor (entry, item) values (91220, 81304);

replace into npc_vendor values (91227, 117, 0, 0, 0, 0);
replace into npc_vendor values (91227, 2287, 0, 0, 0, 0);
replace into npc_vendor values (91227, 3770, 0, 0, 0, 0);
replace into npc_vendor values (91227, 3771, 0, 0, 0, 0);
replace into npc_vendor values (91227, 4599, 0, 0, 0, 0);
replace into npc_vendor values (91227, 8952, 0, 0, 0, 0);
replace into npc_vendor values (91232, 2290, 1, 7200, 0, 0);
replace into npc_vendor values (91232, 955, 1, 7200, 0, 0);
replace into npc_vendor values (91232, 3013, 1, 7200, 0, 0);
replace into npc_vendor values (91232, 1181, 1, 7200, 0, 0);
replace into npc_vendor values (91232, 954, 1, 7200, 0, 0);
replace into npc_vendor values (91238, 787, 0, 0, 0, 0);
replace into npc_vendor values (91238, 4592, 0, 0, 0, 0);
replace into npc_vendor values (91238, 4593, 0, 0, 0, 0);
replace into npc_vendor values (91238, 4594, 0, 0, 0, 0);
replace into npc_vendor values (91238, 8957, 0, 0, 0, 0);
replace into npc_vendor values (91238, 21552, 0, 0, 0, 0);
replace into npc_vendor values (91246, 2506, 0, 0, 0, 0);
replace into npc_vendor values (91246, 2507, 0, 0, 0, 0);
replace into npc_vendor values (91246, 2512, 0, 0, 0, 0);
replace into npc_vendor values (91246, 2515, 0, 0, 0, 0);
replace into npc_vendor values (91246, 5439, 0, 0, 0, 0);
replace into npc_vendor values (91246, 11362, 0, 0, 0, 0);
REPLACE INTO npc_vendor VALUES (91247, 2320, 0, 0, 0, 0);
REPLACE INTO npc_vendor VALUES (91247, 2321, 0, 0, 0, 0);
REPLACE INTO npc_vendor VALUES (91247, 2324, 0, 0, 0, 0);
REPLACE INTO npc_vendor VALUES (91247, 2325, 0, 0, 0, 0);
REPLACE INTO npc_vendor VALUES (91247, 2604, 0, 0, 0, 0);
REPLACE INTO npc_vendor VALUES (91247, 2605, 0, 0, 0, 0);
REPLACE INTO npc_vendor VALUES (91247, 4291, 0, 0, 0, 0);
REPLACE INTO npc_vendor VALUES (91247, 4340, 0, 0, 0, 0);
REPLACE INTO npc_vendor VALUES (91247, 4341, 0, 0, 0, 0);
REPLACE INTO npc_vendor VALUES (91247, 4342, 0, 0, 0, 0);
REPLACE INTO npc_vendor VALUES (91247, 6260, 0, 0, 0, 0);
REPLACE INTO npc_vendor VALUES (91247, 6261, 0, 0, 0, 0);
REPLACE INTO npc_vendor VALUES (91247, 6272, 1, 7200, 3, 0);
REPLACE INTO npc_vendor VALUES (91247, 6275, 1, 3600, 3, 0);
REPLACE INTO npc_vendor VALUES (91247, 8343, 0, 0, 0, 0);
REPLACE INTO npc_vendor VALUES (91247, 10290, 0, 0, 0, 0);
REPLACE INTO npc_vendor VALUES (91247, 10311, 1, 3600, 3, 0);
REPLACE INTO npc_vendor VALUES (91247, 14341, 0, 0, 0, 0);
REPLACE INTO npc_vendor VALUES (91248, 159, 0, 0, 0, 0);
REPLACE INTO npc_vendor VALUES (91248, 2512, 0, 0, 0, 0);
REPLACE INTO npc_vendor VALUES (91248, 2516, 0, 0, 0, 0);
REPLACE INTO npc_vendor VALUES (91248, 2947, 0, 0, 0, 0);
REPLACE INTO npc_vendor VALUES (91248, 3111, 0, 0, 0, 0);
REPLACE INTO npc_vendor VALUES (91248, 4471, 0, 0, 0, 0);
REPLACE INTO npc_vendor VALUES (91248, 4496, 0, 0, 0, 0);
REPLACE INTO npc_vendor VALUES (91248, 4498, 0, 0, 0, 0);
REPLACE INTO npc_vendor VALUES (91248, 5042, 0, 0, 0, 0);
REPLACE INTO npc_vendor VALUES (91248, 6183, 0, 0, 0, 0);
-- Sparkwater rares:
delete from npc_vendor where entry = 91256;
REPLACE INTO npc_vendor VALUES (91256, 81305, 1, 3600, 0, 0);
REPLACE INTO npc_vendor VALUES (91256, 81306, 1, 3600, 0, 0);
REPLACE INTO npc_vendor VALUES (91256, 81307, 1, 3600, 0, 0);
REPLACE INTO npc_vendor VALUES (91256, 81308, 1, 3600, 0, 0);
REPLACE INTO npc_vendor VALUES (91256, 81309, 1, 3600, 0, 0);
REPLACE INTO npc_vendor VALUES (91256, 81310, 1, 3600, 0, 0);
REPLACE INTO npc_vendor VALUES (91256, 81311, 1, 3600, 0, 0);
REPLACE INTO npc_vendor VALUES (91256, 81333, 1, 604800, 0, 0);

-- New quest's related items:
replace into item_template values 
(81291, 0, 12, 0, 'Razlik\'s Tools', 'Small, crude, and smeared with oil, most definitely of goblin make.', 2053, 1, 0, 1, 0, 0, 0, -1, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 4, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, null),
(81292, 0, 12, 0, 'Energized Scale', '', 20893, 1, 0, 1, 0, 0, 0, -1, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 4, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, null),
(81293, 0, 12, 0, 'Sealed Trade Goods', '', 7914, 1, 0, 1, 0, 0, 0, -1, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 4, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, null);

replace into item_template values
 ('81294', '0', '4', '2', 'Technician\'s Field Gloves', '', '28339', '1', '0', '1', '448', '112', '10', '-1', '-1', '15',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '34', '0', '0', '0',
 '0', '0', '0', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0',
 '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0',
 '-1', '1', '0', '0', '0', '0', '0', '8', '1', '0', '0', '20', '0', '0', '0', '0', '0', '0', '0', '0',
 '0', '1', NULL);
 
 replace into item_template values
 ('81295', '0', '4', '3', 'Energy Resistant Belt', '', '12202', '1', '0', '1', '436', '108', '6', '-1', '-1', '15',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '63', '0', '0', '1',
 '0', '0', '0', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0',
 '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0',
 '-1', '1', '0', '0', '0', '0', '0', '5', '1', '0', '0', '20', '0', '0', '0', '0', '0', '0', '0', '0',
 '0', '1', NULL);
 
 replace into item_template values
 ('81296', '0', '0', '0', 'Sparkwater Special', 'The smell is incredibly strong, and foul.', '18079', '1', '0', '1', '150', '37', '0', '-1', '-1', '10',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0',
 '0', '0', '0', '11009', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0',
 '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0',
 '-1', '0', '0', '0', '0', '0', '0', '3', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0',
 '0', '1', NULL);
 
 replace into item_template values
 ('81297', '0', '15', '0', 'Gnomeregan Gear', 'An intricate gear of gnomish make with visible wear, and marks of damage.', '1221', '1', '0', '1', '10000', '50', '0', '-1', '-1', '0',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0',
 '0', '0', '0', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0',
 '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0',
 '-1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0',
 '0', '1', NULL);
 
 replace into item_template values
 ('81298', '0', '15', '0', '\"Genuine\" Dragons Claw', 'It looks like it came from a raptor, but its large enough to swipe a gnome!', '4787', '1', '0', '1', '100000', '5000', '0', '-1', '-1', '0',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0',
 '0', '0', '0', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0',
 '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0',
 '-1', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0',
 '0', '1', NULL);
 
 replace into item_template values
 ('81299', '0', '15', '0', '\"Kilroggs\" Eye', 'It is simply an eye, who knows where this had come from', '7986', '1', '0', '1', '50000', '100', '0', '-1', '-1', '0',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0',
 '0', '0', '0', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0',
 '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0',
 '-1', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0',
 '0', '1', NULL);
 
 replace into item_template values
 ('81300', '0', '15', '0', 'Ancient Troll Tablet', 'The Troll language carved upon a worn stone face.', '23149', '1', '0', '1', '2000', '100', '0', '-1', '-1', '0',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0',
 '0', '0', '0', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0',
 '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0',
 '-1', '0', '1', '14', '2', '0', '0', '4', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0',
 '0', '1', NULL);
 
 replace into item_template values
 ('81301', '0', '15', '0', 'Tel\'Abim Sand', 'Sand, course and fairly full of small rocks.', '2480', '0', '0', '1', '4500', '100', '0', '-1', '-1', '0',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0',
 '0', '0', '0', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0',
 '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0',
 '-1', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0',
 '0', '1', NULL);
 
 replace into item_template values
 ('81302', '0', '15', '0', 'Third War Footmans Insignia', 'An old symbol stained with dried blood. It is chipped and worn.', '40127', '0', '0', '1', '2500', '100', '0', '-1', '-1', '0',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0',
 '0', '0', '0', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0',
 '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0',
 '-1', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0',
 '0', '1', NULL);
 
 replace into item_template values
 ('81303', '0', '15', '0', '\'Shard of Elune\'', 'A small piece of glowing rock, that can supposedly grant the bearer with extreme luck, power and energy!', '20612', '0', '0', '1', '5000000', '100', '0', '-1', '-1', '0',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0',
 '0', '0', '0', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0',
 '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0',
 '-1', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0',
 '0', '1', NULL);
 
 replace into item_template values
 ('81304', '0', '4', '1', '\'Queen Azshara\'s Crown\'', 'A simple silver crown with a green jewel inlaid, it is mildly aged, and has a few chips upon the surface.', '27606', '1', '0', '1', '10000000', '2000', '1', '-1', '-1', '0',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '51', '0', '0', '0',
 '0', '0', '0', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0',
 '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0',
 '-1', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0',
 '0', '1', NULL);
 
 replace into item_template values
 ('81305', '0', '2', '5', 'Rusty Coghammer', 'Could use some oil.', '31265', '3', '0', '1', '248452', '62113', '17', '-1', '-1', '35',
 '30', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '3', '-10', '0', '0',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '2900', '0',
 '0', '70', '105', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '70', '0', '0', '-5',
 '0', '0', '0', '14126', '2', '0', '0.9', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0',
 '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0',
 '-1', '1', '0', '0', '0', '0', '0', '1', '1', '0', '0', '100', '0', '0', '0', '0', '43', '0', '0', '0',
 '0', '1', NULL);
 
 replace into item_template values
 ('81306', '0', '4', '2', 'Petrolspill Boots', 'Covered in petrol for extra slickness and tendency to catch on fire.', '11373', '3', '0', '1', '184312', '46078', '8', '-1', '-1', '35',
 '30', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '3', '10', '7', '6',
 '6', '-5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '77', '0', '-15', '0',
 '0', '0', '0', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0',
 '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0',
 '-1', '1', '0', '0', '0', '0', '0', '3', '1', '0', '0', '50', '0', '0', '0', '0', '43', '0', '0', '0',
 '0', '1', NULL);
 
 replace into item_template values
 ('81307', '0', '2', '14', 'Cursed Tome', 'A dusty book, scrawled in a cryptic language. You can feel your mind pulse the longer you gaze.', '23171', '2', '0', '1', '0', '0', '22', '-1', '-1', '0',
 '21', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '5', '-10', '6', '-10',
 '7', '-10', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0',
 '0', '0', '0', '7710', '1', '0', '0', '-1', '0', '-1', '21589', '1', '0', '0', '-1', '0', '-1', '0', '0',
 '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0',
 '-1', '1', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0',
 '0', '1', NULL);
 
 update item_template set sheath = 0 where entry = 81307 ;
 
 replace into item_template values
 ('81308', '0', '4', '1', 'Thunder Lizard\'s Hide', 'Filled with static electricity!', '23070', '2', '0', '1', '98212', '24553', '16', '-1', '-1', '28',
 '21', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '5', '3', '7', '2',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '21', '0', '0', '0',
 '0', '0', '0', '16615', '1', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0',
 '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0',
 '-1', '1', '0', '0', '0', '0', '0', '7', '1', '0', '0', '0', '0', '0', '0', '0', '4', '0', '0', '0',
 '0', '1', NULL);
 
 replace into item_template values
 ('81309', '0', '4', '0', 'Tinkerer\'s Mechanical Fire Flinger', 'Complex and powerful goblin machinery that can launch a fireball!', '31657', '3', '0', '1', '0', '0', '11', '-1', '-1', '0',
 '31', '202', '150', '0', '0', '0', '0', '0', '0', '1', '0', '6', '-10', '0', '0',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '5', '0',
 '0', '0', '0', '9053', '0', '0', '0', '120000', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0',
 '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0',
 '-1', '1', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0',
 '0', '1', NULL);
 
 replace into item_template values
 ('81310', '0', '4', '3', 'Backwater Bruiser\'s Cuirass', 'Its seen better days, most of which involved keeping order.', '28070', '3', '0', '1', '300000', '40000', '5', '-1', '-1', '35',
 '30', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '3', '5', '4', '5',
 '7', '8', '6', '-25', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '235', '0', '0', '0',
 '0', '0', '0', '21596', '1', '0', '0', '-1', '0', '-1', '7517', '1', '0', '0', '-1', '0', '-1', '0', '0',
 '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0',
 '-1', '1', '0', '0', '0', '0', '0', '5', '1', '0', '0', '120', '0', '0', '0', '0', '43', '0', '0', '0',
 '0', '1', NULL);
 
 replace into item_template values
 ('81311', '0', '4', '6', 'Technician\'s Servoshield', 'Spark resistant and built to last!', '20986', '2', '0', '1', '180000', '10000', '14', '-1', '-1', '0',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '5', '5', '3', '3',
 '7', '3', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '11', '598', '0', '0', '10',
 '0', '0', '0', '7514', '1', '0', '0', '-1', '0', '-1', '20888', '1', '0', '0', '-1', '0', '-1', '0', '0',
 '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0',
 '-1', '1', '0', '0', '0', '0', '0', '0', '1', '0', '0', '100', '0', '0', '0', '0', '0', '0', '0', '0',
 '0', '1', NULL);
 
 update item_template set sheath = 4 where entry = 81311;

replace into item_template values 
(81312, 0, 12, 0, 'Goblin Surveying Gear', '', 7841, 1, 0, 1, 0, 0, 0, -1, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 4, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, null),
(81313, 0, 12, 0, 'Intense Ethereal Essence', '', 34578, 1, 0, 1, 0, 0, 0, -1, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 4, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, null),
(81314, 0, 12, 0, 'Skystormer Antler', '', 1416, 1, 0, 1, 0, 0, 0, -1, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 4, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, null),
(81315, 0, 12, 0, 'Prototype Shredder X0-1 Schematic', '', 15274, 1, 0, 1, 0, 0, 0, -1, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 4, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, null);

update item_template set stackable = 8 where entry = 81313;
update item_template set stackable = 3 where entry = 81314;

replace into item_template values
 ('81316', '0', '2', '1', 'Foe Chopper', '', '19252', '2', '0', '1', '10824', '2706', '17', '-1', '-1', '23',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '4', '3', '7', '6',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '3200', '0',
 '0', '39', '59', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0',
 '0', '0', '0', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0',
 '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0',
 '-1', '1', '0', '0', '0', '0', '0', '1', '1', '0', '0', '70', '0', '0', '0', '0', '23', '0', '0', '0',
 '0', '1', NULL);
 
 replace into item_template values
 ('81317', '0', '4', '0', 'Shining Electro-lantern', '', '7557', '2', '0', '1', '4732', '1183', '23', '-1', '-1', '23',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0',
 '0', '0', '0', '7687', '1', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0',
 '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0',
 '-1', '1', '0', '0', '0', '0', '0', '2', '1', '0', '0', '0', '0', '0', '0', '0', '23', '0', '0', '0',
 '0', '1', NULL);
 
 replace into item_template values 
(81318, 0, 12, 0, 'Megaflux Capacitor', '', 23475, 1, 0, 1, 0, 0, 0, -1, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 4, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, null);

replace into item_template values
 ('81319', '0', '4', '6', 'Razorblade Buckler', '', '20985', '3', '0', '1', '25328', '6332', '14', '-1', '-1', '36',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '3', '2', '7', '6',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '17', '776', '0', '0', '0',
 '0', '0', '0', '20887', '1', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0',
 '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0',
 '-1', '1', '0', '0', '0', '0', '0', '2', '4', '0', '0', '100', '0', '0', '0', '0', '44', '0', '0', '0',
 '0', '1', NULL);
 
 replace into item_template values
 ('81320', '0', '2', '19', 'Crackling Zapper', 'For really big bugs.', '13084', '3', '0', '1', '26952', '6738', '15', '-1', '-1', '36',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1700', '100',
 '0', '42', '74', '3', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0',
 '0', '0', '0', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0',
 '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0',
 '-1', '1', '0', '0', '0', '0', '0', '1', '0', '0', '0', '65', '0', '0', '0', '0', '44', '0', '0', '0',
 '0', '1', NULL);
 
 replace into item_template values
 ('81321', '0', '4', '0', 'Frix\'s Necklace', 'Has bad-luck written all over it.', '18172', '2', '0', '1', '21000', '5622', '2', '-1', '-1', '49',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '3', '12', '6', '6',
 '5', '-5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0',
 '0', '0', '0', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0',
 '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0',
 '-1', '1', '0', '0', '0', '0', '0', '4', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0',
 '0', '1', NULL);
 
replace into item_template values (81322, 0, 12, 0, 'Sack of Coins', '', 1183, 1, 0, 1, 0, 0, 0, -1, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 4, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, null);

replace into item_template values (81323, 0, 12, 0, 'Intense Ethereal Essence', '', 20794, 1, 0, 1, 0, 0, 0, -1, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 4, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, null);

replace into item_template values (81324, 0, 12, 0, 'Eldarath Ley-Shard', '', 3273, 1, 0, 1, 0, 0, 0, -1, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 4, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, null);

replace into item_template values
 ('81325', '0', '2', '0', 'Skystormer Axe', '', '5640', '2', '0', '1', '125020', '31255', '21', '-1', '-1', '53',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '4', '6', '3', '3',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1600', '0',
 '0', '45', '70', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0',
 '0', '0', '0', '9359', '1', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0',
 '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0',
 '-1', '1', '0', '0', '0', '0', '0', '1', '3', '0', '0', '75', '0', '0', '0', '0', '0', '0', '0', '0',
 '0', '1', NULL);
 
replace into item_template values (81326, 0, 12, 0, 'Gazztoggle\'s Report', '', 3020, 1, 0, 1, 0, 0, 0, -1, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 4, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, null);

update item_template set page_text = 80300 where entry = 81326;
replace into page_text values (80300, 'This is Gazztoggle\'s Report from Azshara!\n\nI have suffered many set backs in my work, my assistant Frix that I was assigned has blundered almost every task I have given him, and almost lost the Surveying Gear we were given.\n\nFrix died to the local Satyrs and the Surveying Gear was recovered from their hands, I will need a new assistant as soon as possible, and one that\'s worth my time!', 80301);
replace into page_text values (80301, 'Tests conducted with Ley-shards turned out completely worthless, the shards themselves around the Ruins of Eldarath are unstable and fizzle upon use.\n\nTests conducted with Essences from Ethereal\'s also proved to be lackluster.\n\nWhile they held energy, this energy was faint, and I mean, in the Gnome manner. \n\n Out of all the projects I took the only one that had any success was Skystormer Antler\'s from the local Thunderhead\'s, their energy was through the roof, and is definitely worth attempting for Sparkwater, I will send some test samples soon!\n\nReport from, Gazztoggle.', 0);

replace into item_template values (81327, 0, 12, 0, 'Staff of Azsalus', '', 1092, 1, 0, 1, 0, 0, 0, -1, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 4, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, null);

replace into item_template values
 ('81328', '0', '4', '1', 'Energyseekers Cover', '', '34715', '3', '0', '1', '45175', '11294', '1', '-1', '-1', '55',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '5', '19', '6', '11',
 '3', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '62', '0', '0', '0',
 '0', '0', '0', '9395', '1', '0', '0', '-1', '0', '-1', '21619', '1', '0', '0', '-1', '0', '-1', '0', '0',
 '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0',
 '-1', '1', '0', '0', '0', '0', '0', '7', '1', '0', '0', '50', '0', '0', '0', '0', '0', '0', '0', '0',
 '0', '1', NULL);
 
 replace into item_template values
 ('81329', '0', '4', '4', 'Spark-Charged Cuirass', '', '27932', '3', '0', '1', '67288', '16822', '5', '-1', '-1', '55',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '4', '30', '7', '8',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '542', '0', '0', '0',
 '0', '0', '0', '9140', '1', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0',
 '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0',
 '-1', '1', '0', '0', '0', '0', '0', '0', '1', '0', '0', '135', '0', '0', '0', '0', '0', '0', '0', '0',
 '0', '1', NULL);
 
 replace into item_template values
 ('81330', '0', '4', '3', 'Quick-Surge Gloves', '', '27041', '3', '0', '1', '51332', '12833', '10', '-1', '-1', '55',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '3', '14', '7', '6',
 '5', '4', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '206', '0', '0', '0',
 '0', '0', '0', '9331', '1', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0',
 '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0',
 '-1', '1', '0', '0', '0', '0', '0', '1', '1', '0', '0', '40', '0', '0', '0', '0', '0', '0', '0', '0',
 '0', '1', NULL);
 
replace into item_template values (81331, 0, 12, 0, 'Rugnar\'s Letter', '', 3022, 1, 0, 1, 0, 0, 0, -1, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 4, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, null);

update item_template set page_text = 80305 where entry = 81331;
replace into page_text values (80305, 'Greetings brother,\n\nI hope this letter finds you well, I am doing good in my work with the goblins of Sparkwater, I know you said my ventures were foolish but the money is great!', 80306);
replace into page_text values (80306, 'The weather of Durotar is as hot as ever and the sun beats with great strength.\n\nI am happy to hear of your success\', and wish you good fortunes.\n\nI hope to hear from you soon, let us keep in contact.\n\nRugnar.', 0);

replace into item_template values (81332, 0, 12, 0, 'Zuul\'s Note', '', 13497, 1, 0, 1, 0, 0, 0, -1, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 4, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, null);

update item_template set page_text = 80308 where entry = 81332;
replace into page_text values (80308, 'Rugnar, your words were nice to read within the overgrowth of weeds that is the Swamp of Sorrows.\n\nI have been given leave and should be departing to Orgrimmar soon, it\'s been too long since we have last seen one another, and I am looking forward to it greatly, and have many things to tell you.\n\nYour Brother Zuul', 0);

replace into item_template values
 ('81333', '0', '4', '0', 'Goblin Essence of Knivery', 'Pure essence of the true features of a goblin condensed down', '35842', '4', '0', '1', '5000000', '10000', '12', '-1', '-1', '0',
 '55', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '5', '6', '-24',
 '0', '-24', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '24', '0', '0', '0',
 '0', '0', '24', '13669', '1', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0',
 '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0',
 '-1', '1', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0',
 '0', '1', NULL);

update item_template set stackable = 5 where entry = 81293;
update item_template set stackable = 5 where entry = 81324;
update item_template set stackable = 8 where entry = 81323;

replace into creature_loot_template (entry, item, chanceorquestchance, groupid, mincountorref) values (3130, 81292, -20, 6, 1);
replace into creature_loot_template (entry, item, chanceorquestchance, groupid, mincountorref) values (3131, 81292, -20, 6, 1);
replace into creature_loot_template (entry, item, chanceorquestchance, groupid, mincountorref) values (6116, 81323, -50, 6, 1);
replace into creature_loot_template (entry, item, chanceorquestchance, groupid, mincountorref) values (6117, 81323, -50, 6, 1);
replace into creature_loot_template (entry, item, chanceorquestchance, groupid, mincountorref) values (6378, 81314, -50, 6, 1);

replace into gameobject_template values (1000250, 0, 3, 2891, 'Razlik\'s Tools', 0, 4, 0.7, 43, 1000250, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');
replace into gameobject_loot_template (entry, item, chanceorquestchance, groupid, mincountorref) values (1000250, 81291, -100, 1, 1);

replace into gameobject_template values (1000251, 0, 3, 2971, 'Eldarath Ley-Shard', 0, 4, 0.5, 43, 1000251, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');
replace into gameobject_loot_template (entry, item, chanceorquestchance, groupid, mincountorref) values (1000251, 81324, -100, 1, 1);

-- Quests:

replace into quest_template (prevquestid, entry, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, reqcreatureorgoid1, reqcreatureorgocount1, reqcreatureorgoid2, reqcreatureorgocount2, reqcreatureorgoid3, reqcreatureorgocount3, reqcreatureorgoid4, reqcreatureorgocount4, srcitemid, srcitemcount, reworreqmoney, rewmoneymaxlevel, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4) values (0,55000,14,9,7,0,0,'Razlik\'s Tools','Hey! You, yeah you!\n\nI got a problem that I need fixing and I\'ll tell ya, it\'s not sitting around waiting to work again that\'s for sure!\n\nWe\'re living paradise right now, but, you know how goblins work, eventually we\'ll be back on that oil platform, one way or another.\n\nThing is, I got a set of tools up there, from way back in the Venture Co. days, I\'m used to em see, and the last thing I want is some sea sucker knocking em off into the water to be lost forever.\n\nGo up there, find my tools, and get a few silver, whaddya say kid?','Find Razlik\'s lost tools on the Oil Platform east of the Port.','You got em yet? Or you just waitin\' around?','About time, I was gettin\' scared, thought I might\'a lost them!\n\nThey are a bit more dirty then I remember though, for muckin\' up my tools yer gonna get a silver less, no hard feelings!',81291,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,150,0,1001,150,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);

update quest_template set rewxp = 400 where entry = 55000;

replace into creature_questrelation (id, quest) values (91208, 55000);
replace into creature_involvedrelation (id, quest) values (91208, 55000);

replace into quest_template (prevquestid, entry, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, reqcreatureorgoid1, reqcreatureorgocount1, reqcreatureorgoid2, reqcreatureorgocount2, reqcreatureorgoid3, reqcreatureorgocount3, reqcreatureorgoid4, reqcreatureorgocount4, srcitemid, srcitemcount, reworreqmoney, rewmoneymaxlevel, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4) values (0,55001,14,9,7,0,0,'The Oil Stops Flowing','Damned, blasted, stupid, good for -NOTHING- Isn\'t this just great, it\'s one thing after another with that oil platform, and I\'m a week behind schedule!\n\nIf you don\'t call havin\' two workers get sucked into the ocean and your oil platform over run by lobsters then I don\'t know where you\'re from pal!\n\nThe oil needs to keep flowing, and if the boss finds out that this has gone on, he\'ll have my head!\n\nMaybe I could blame this on someone, but first things first, get on over there and clear some of those blasted creatures so we can kick that baby into overdrive and start catching up on all the lost work!','Kill 5 Makrura Oilclaw\'s and 5 Makrura Thresher\'s at the oil platform east of the Port.','You get rid of them yet? Time\'s tickin\' here and I need that platform up and running!','Finally, I was devising a plan but all I could come up with was flame thrower, and bomb. Big no-no\'s if ya know anything about oil safety!\n\nIt might not be -all- of em, but a few less of the seafood is good enough for me!',0,0,0,0,0,0,0,0,91194,5,91193,5,0,0,0,0,0,0,200,0,1001,200,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);

update quest_template set rewxp = 400 where entry = 55001;

replace into creature_questrelation (id, quest) values (91213, 55001);
replace into creature_involvedrelation (id, quest) values (91213, 55001);

replace into quest_template (prevquestid, entry, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, reqcreatureorgoid1, reqcreatureorgocount1, reqcreatureorgoid2, reqcreatureorgocount2, reqcreatureorgoid3, reqcreatureorgocount3, reqcreatureorgoid4, reqcreatureorgocount4, srcitemid, srcitemcount, reworreqmoney, rewmoneymaxlevel, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4) values (0,55002,14,6,5,0,0,'Supplies to Port!','Supplies, supplies, supplies, its all they ever want those goblins!\n\nI send them four saw blades and the next thing I know they need six! I send them tin, and then they need Iron.\n\nYou would swear they went through more materials then the Horde Warmachine!\n\nI\'ve got this shipment to run down, but I\'ve got so much other work, if you could be of assistance it would be much appreciated, $r.\n\nThe Goblins have set up a new town up to the north east along the coast, you can\'t miss it, if anything, follow the smell of the smoke.','Deliver the Sealed Trade Goods to the nearby Port Town of Sparkwater to the north-east of Razor Hill.','What, was there anything that I could help with?','Yes? Can I help you? I\'m very busy ye see! Oh- supplies from Razor Hill?\n\nIt\'s about time, we\'re going through material here faster then a kodo with a hole shot through em...\n\nOnly four saw blades?! Oh well, it\'ll do, now scram!',81293,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,81293,1,100,0,1001,100,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);

update quest_template set rewxp = 150 where entry = 55002;

replace into creature_questrelation (id, quest) values (3168, 55002);
replace into creature_involvedrelation (id, quest) values (91237, 55002);

replace into quest_template (prevquestid, entry, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, reqcreatureorgoid1, reqcreatureorgocount1, reqcreatureorgoid2, reqcreatureorgocount2, reqcreatureorgoid3, reqcreatureorgocount3, reqcreatureorgoid4, reqcreatureorgocount4, srcitemid, srcitemcount, reworreqmoney, rewmoneymaxlevel, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4) values (0,55003,14,10,7,0,0,'A New Power Source','As a Technician, its our job to keep everythin\' runnin\' ya see? Well, we\'ve run into a small problem, and by a small problem, I mean a big problem!\n\nThe Oil from the platform isn\'t coming in and we\'re barely making due with what we got! That and we\'re gonna run outta barrels of the juice soon.\n\nBut, I got an idea anyway. There\'s a place not far from here to the west called Thunder Ridge, and it\'s got that name for a reason.\n\nThe beasts there pack one -HELL- of a punch! Get me six of their energized scales so I can tinker with it as a power source. Now, they\'re not gonna be givin\' you their scales, so use some force!','Gather six Energized scales from Lightning Hides and Thunder Lizards at Thunder Ridge to the west.','Find those lizards yet? I said they were at Thunder Ridge!','<The goblin quickly tinkers with his acquired scales>\n\nThe energy in these babies are off the chart! My hunches were correct, maybe this will work!\n\nOh, my chances of gettin\' promoted to Head Technician just went up about fifteen percent for sure!',81292,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,300,0,1001,200,0,0,0,0,0,0,0,0,0,81294,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0);

update quest_template set rewxp = 375 where entry = 55003;

replace into creature_questrelation (id, quest) values (91214, 55003);
replace into creature_involvedrelation (id, quest) values (91214, 55003);

replace into creature_loot_template (entry, item, chanceorquestchance, groupid, mincountorref) values
(3131, 81292, -100, 6, 1), -- Lightning Hide
(3130, 81292, -100, 6, 1); -- Thunder Lizard

replace into quest_template (prevquestid, entry, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, reqcreatureorgoid1, reqcreatureorgocount1, reqcreatureorgoid2, reqcreatureorgocount2, reqcreatureorgoid3, reqcreatureorgocount3, reqcreatureorgoid4, reqcreatureorgocount4, srcitemid, srcitemcount, reworreqmoney, rewmoneymaxlevel, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4) values (0,55004,14,7,5,0,0,'Adding a Little Sting','Hail, it is in times of peace that the body is set to engage within past-times of enjoyment, one such enjoyment for these goblins is that of eating, and eat do they ever, $r.\n\nAs much as they eat I am still competing with the others around me, and I\'m hoping to set myself apart .\n\nI have been wanting to experiment with new recipes from around the Barrens, and while I may never get tired of roasted boar meat there is more I can do to make my food even more alluring.\n\nAll around Sparkwater Port there are Scorpids and Boars, gather Chunks of Boar Meat and Scorpid Stingers from around the area, I will reward you for the effort.','Collect 5 Chunk of Boar Meat and 5 Scorpid Stinger.','Have you gathered everything I need yet?','<Hargosh takes his time preparing the food, and begins to cook with an utmost determination, the aroma and smell starts as something horrific, but begins to turn pleasant as the fire cooks, soon enough, the orc takes a bite from his creation .>\n\nMmn... Yes... Hah! This will do just the trick, the kick is strong in this, just like an orcish axe! You\'ve done me a service, here.',5466,5,769,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,175,0,1001,150,76,150,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);

update quest_template set rewxp = 375 where entry = 55004;

replace into creature_questrelation (id, quest) values (91227, 55004);
replace into creature_involvedrelation (id, quest) values (91227, 55004);

replace into quest_template (prevquestid, entry, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, reqcreatureorgoid1, reqcreatureorgocount1, reqcreatureorgoid2, reqcreatureorgocount2, reqcreatureorgoid3, reqcreatureorgocount3, reqcreatureorgoid4, reqcreatureorgocount4, srcitemid, srcitemcount, reworreqmoney, rewxp, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4) values (0,55005,1581,18,16,0,0,'Prototype Thievery','Sneed and I used to be close friends and colleagues back in Kezan, he was a great assistant. But it seems he wasn\'t satisfied with the silver I paid him, and he snatched MY prototype shredder schematic and ran off one night!\n\nNow that we\'re finally settling up here I had time to call in a few favors on where he ended up, he apparently got contracted by some "Edwin" guy and that\'s where the trail ran cold.\n\nTime is money, and his time ran out, find him and get back my plans, make him pay for doublecrossing me.','Bring the Prototype Shredder X0-1 Schematic to Wrix Ozzlenut.','Any luck finding him?','Nice job, he actually built the shredder you say?\n\nGuess he was always smarter than he looked, I almost gave up on you and was about to put up a bounty, you can have the bounty reward instead.',81315,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1350,1001,250,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,81316,1,81317,1,0,0,0,0);

update quest_template set type = 81 where entry = 55005;
replace into creature_loot_template (entry, item, chanceorquestchance, groupid, mincountorref) values (639, 81315, -100, 6, 1);

replace into creature_questrelation (id, quest) values (91200, 55005);
replace into creature_involvedrelation (id, quest) values (91200, 55005);

replace into quest_template (prevquestid, entry, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, reqcreatureorgoid1, reqcreatureorgocount1, reqcreatureorgoid2, reqcreatureorgocount2, reqcreatureorgoid3, reqcreatureorgocount3, reqcreatureorgoid4, reqcreatureorgocount4, srcitemid, srcitemcount, reworreqmoney, rewxp, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4) values (55003,55006,721,34,29,0,0,'Backup Capacitor','That was almost a disaster, we ran out of oil and almost used all of the power from the thunder lizard scales. What do you mean just work without power?\n\nPal, most things here don\'t have a failsafe when the tap runs dry, some things don\'t even have an off button!\n\nThis town is a ticking timebomb, it\'ll blow up sky high if the oil platform is destroyed or overrun again, and I plan to have a backup plan.\n\nYou see, I\'ve heard some whispers that the gnomes invented some sort of capacitor that can power entire rigs for hours without end in an emergency, though I also heard Gnomeregan blew up and got radiated, and the capacitor went missing after that, that explains why nobody got their grubby hands on it yet.\n\nVenture there and see if you have any luck finding it, maybe bring your friends too, who knows what lurks down there.','Bring the Megaflux Capacitor to Technician Grimzlow.','Time is ticking, and there\'s no telling when disaster might strike.','Some green gnome was using it to power a giant robot? What a waste!\n\n<Grimzlow takes the capacitor and inserts it to the machine behind him.>\n\nThere, this should work good enough, if it doesn\'t explode that is. Thanks for the hussle by the way, feel free take one of these prototypes as reward, and don\'t stick your fingers into any turning pieces if you want to keep them.',81318,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2700,1001,250,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,81319,1,81320,1,0,0,0,0);

update quest_template set type = 81 where entry = 55006;
update item_template set flags = 2048 where entry = 81318;
replace into creature_loot_template (entry, item, chanceorquestchance, groupid, mincountorref) values (7800, 81318, -100, 6, 1);

replace into creature_questrelation (id, quest) values (91234, 55006);
replace into creature_involvedrelation (id, quest) values (91234, 55006);

replace into quest_template (prevquestid, entry, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, reqcreatureorgoid1, reqcreatureorgocount1, reqcreatureorgoid2, reqcreatureorgocount2, reqcreatureorgoid3, reqcreatureorgocount3, reqcreatureorgoid4, reqcreatureorgocount4, srcitemid, srcitemcount, reworreqmoney, rewxp, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4) values (0,55007,14,47,45,0,0,'Searching For New Methods','The Technicians of Sparkwater are always looking for more methods to optimize and make use of energy sources across Azeroth, we have quite a few people out on the field doing just that!\n\nI got a guy that\'s located in Azshara that I\'d like you to check on, he last was located within Valormok.\n\nJust make sure he\'s doing what I paid him to do, last thing a goblin likes is wasted gold and wasted potential!','Find Gazztoggle Krewpipe in the camp of Valormok Azshara.','Have you found him yet?','Look at all this barren nothingness in Azshara!\n\nWhat do you mean theres stuff all around us? I meant as in nobody is doing any work here, all this wasted potential, such a shame that I\'m here doing this then setting up factories all over, heh.',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,750,1001,200,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);

replace into creature_questrelation (id, quest) values (91234, 55007);
replace into creature_involvedrelation (id, quest) values (91254, 55007);

replace into quest_template (prevquestid, entry, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, reqcreatureorgoid1, reqcreatureorgocount1, reqcreatureorgoid2, reqcreatureorgocount2, reqcreatureorgoid3, reqcreatureorgocount3, reqcreatureorgoid4, reqcreatureorgocount4, srcitemid, srcitemcount, reworreqmoney, rewxp, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4) values (55007,55008,16,47,45,0,0,'Frix\'s Folly','Oh, that\'s why you\'re here, yeah...\n\nI\'ve been knee deep in research and tinkering to try and find new methods of power and energy for Sparkwater.\n\nI\'ve ran into a few hickups, mostly with Frix. He\'s been gone for a few days now and I haven\'t heard anything from him. Worst of all I sent the guy with the only working Surveying Gear that we had!\n\nLast thing I knew was that he went southwest to the nearby elvish ruins to go take some surveys and readings around the Satyr\'s in the area. He\'s probably gotten himself killed, or worse, captured!\n\nIf you find his corpse, or remains, just try and find the Surveying Gear I sent with him!','Find Frix to the southwest by the elvish ruins.','You find that lout yet?','This dead goblin seems to fit the description of a goblin being dead in elvish ruins. He is covered in marks of struggle, bruises, and puncture wounds.\n\nYou begin your search for the Surveying Gear amongst the scattered bones and blood.',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,750,1001,100,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);

replace into creature_questrelation (id, quest) values (91254, 55008);
replace into creature_involvedrelation (id, quest) values (91255, 55008);


replace into quest_template (prevquestid, entry, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, reqcreatureorgoid1, reqcreatureorgocount1, reqcreatureorgoid2, reqcreatureorgocount2, reqcreatureorgoid3, reqcreatureorgocount3, reqcreatureorgoid4, reqcreatureorgocount4, srcitemid, srcitemcount, reworreqmoney, rewxp, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4) values (55008,55009,16,47,45,0,0,'Empty Handed','Upon searching the corpse of Frix Tallycog and the surrounding area there is no sign of the Surveying Gear that you were meant to retrieve, you should report your findings to Gazztoggle Krewpipe!','Return to Gazztoggle Krewpipe in Valormok with the bad news.','Hmm?','Ahh, just as I suspected, dead... Wait, he lost it?!\n\nDamn you Frix, you blasted, good for nothing, worthless...',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,750,1001,150,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);

replace into creature_questrelation (id, quest) values (91255, 55009);
replace into creature_involvedrelation (id, quest) values (91254, 55009);

replace into quest_template (prevquestid, entry, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, reqcreatureorgoid1, reqcreatureorgocount1, reqcreatureorgoid2, reqcreatureorgocount2, reqcreatureorgoid3, reqcreatureorgocount3, reqcreatureorgoid4, reqcreatureorgocount4, srcitemid, srcitemcount, reworreqmoney, rewxp, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4) values (55009,55010,16,47,45,0,0,'Grabbing the Gear','...Gah! We can\'t waste our time cursing the dumb lout... we have to get this fixed before the big ups in Sparkwater find out what I\'ve gone and done putting the important equipment in his hands.\n\nI\'m willing to bet the Survey Equipment is still around where he died, the Satyrs probably pried it from his hands and are still trying to figure out what the complex goblin machinery is, and I doubt they ever will.\n\nGo back there and dispatch them until you find my Goblin Surveying Gear!','Travel to Haldarr Encampment and retrieve Goblin Surveying Gear.','Have you found the Surveying Gear yet?','Did you find it? Oh...\n\nDamn I was getting ready to pack it up and start heading into exile, you really saved my hide here kid, and -big- time, here I had this from Frix before he headed out, was a necklace he wore, aparently the metal messed with the survey gear, its probably coated in bad luck, last thing I want is to keep it.',81312,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4250,1001,250,0,0,0,0,0,0,0,0,0,81321,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0);

replace into creature_loot_template (entry, item, chanceorquestchance, groupid, mincountorref) values (6125, 81312, -32, 6, 1);

replace into creature_questrelation (id, quest) values (91254, 55010);
replace into creature_involvedrelation (id, quest) values (91254, 55010);

update creature_template set npc_flags = 3, display_id1 = 7164 where entry = 80121; -- Nert (Horde)

replace into quest_template (prevquestid, entry, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, reqcreatureorgoid1, reqcreatureorgocount1, reqcreatureorgoid2, reqcreatureorgocount2, reqcreatureorgoid3, reqcreatureorgocount3, reqcreatureorgoid4, reqcreatureorgocount4, srcitemid, srcitemcount, reworreqmoney, rewxp, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4) values (0,55011,14,13,10,0,0,'Employing the Cabal','Not good pal, not good at all! And here I thought we’d be safe and sound under the Horde’s banner.\n\nThere’s rumors coming from the Undermine that Razdunk found out our location and might come knocking out our doors! Times are desperate enough for me to seek him...\n\nThere’s a crazy old goblin hiding somewhere in the Barrens, knowing him and his folk they definitely have a barrier over the blasted thing or I don’t know whatever mages do to protect a place they own.\n\nThere’s a slim chance you might find him in the north, when you follow the road to Ashenvale.\n\nGive him this piece of paper and this sack of coins, I hate having to pay someone before they do something for me but this is a special case! I really hope you can find him, we definitely could use his help.','Find Grimm Onearm in the Barrens.','Hey, hey, move along bub, nothing to see here!','Toss me in a dirty sack and cover me in oil, and here I thought everyone forgot about ol’ Grimm, Blastentom is running with the Horde now huh?',81322,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,81322,1,0,750,1001,100,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);

replace into creature_questrelation (id, quest) values (80121, 55011);
replace into creature_involvedrelation (id, quest) values (91275, 55011);

replace into quest_template (prevquestid, entry, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, reqcreatureorgoid1, reqcreatureorgocount1, reqcreatureorgoid2, reqcreatureorgocount2, reqcreatureorgoid3, reqcreatureorgocount3, reqcreatureorgoid4, reqcreatureorgocount4, srcitemid, srcitemcount, reworreqmoney, rewxp, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4) values (55011,55012,17,13,10,0,0,'Short Five Minute Adventure','As you can see my stupid shredder broke and I miss the parts to fix it! I also lost my wal...nmeans of communication with my people back home!\n\nSo I gotta ask you to do a quick errand for me, yea?\n\nShould be easy enough, this new place Nert said him and the others settled in should have everything you need.\n\nOh come on, don’t stare at me like that, YOU need my help more than I need yours, so travelling back there shouldn’t be too much to ask.\n\nDon’t worry I got enough time to wait. Just get me some oil flasks, copper tubes and arcane dust, I will work the rest of the magic.','Gather the required items from Sparkwater Port.','Look at you go!','Ah there, there, you got all the stuff I needed and you came back quick enough not to be a disappointment.',814,5,4361,5,17019,10,0,0,0,0,0,0,0,0,0,0,0,0,0,850,1001,250,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);

replace into creature_questrelation (id, quest) values (91275, 55012);
replace into creature_involvedrelation (id, quest) values (91275, 55012);

replace into quest_template (prevquestid, entry, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, reqcreatureorgoid1, reqcreatureorgocount1, reqcreatureorgoid2, reqcreatureorgocount2, reqcreatureorgoid3, reqcreatureorgocount3, reqcreatureorgoid4, reqcreatureorgocount4, srcitemid, srcitemcount, reworreqmoney, rewxp, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4) values (55012,55013,17,13,10,0,0,'Shaking a Cold Arm','With my Shredder fixed I can get back home and grab one of my dearest assistants to come aid the cause back in Sparkwater, let Blastentom know I am coming, he better get me a place to sleep ready and some good looking goblin babes. \n\nIt’s gonna be fun to work on some new projects, yeah, especially if it’s all against that ugly toad Razdunk, bleh.\n\nOh and do remind him, while I will be helping him, I don’t owe anything to those Horde bastards!',' Report back to Nert Blastentom in Sparkwater Port.','So, how did it go?','Not only did you find him but he’s willing to come help? Great, I should start searching through my pockets.\n\nHe’s a gold sink! But totally worth it, the stuff that maniac creates.',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,550,1001,250,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);

replace into creature_questrelation (id, quest) values (91275, 55012);
replace into creature_involvedrelation (id, quest) values (80121, 55012);

delete from quest_template where entry in (55014, 55015, 55016);

replace into quest_template (prevquestid, entry, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, reqcreatureorgoid1, reqcreatureorgocount1, reqcreatureorgoid2, reqcreatureorgocount2, reqcreatureorgoid3, reqcreatureorgocount3, reqcreatureorgoid4, reqcreatureorgocount4, srcitemid, srcitemcount, reworreqmoney, rewxp, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4) values (55010,55014,16,49,45,0,0,'The Ethereal Project','Me and Frix had spent quite a bit of our time researching power sources out here in Azshara, there is some stuff that seemed to pose quite lucrative ventures.\n\nTo the Southwest is more ruins, haunted and seemingly guarded by the passed ghosts of Highborne.\n\nI believe these spirits could very well be used as a source of power. You see, their essence is extremely potent, the only problem is, well, being able to get it from them.\n\nHead there and gather me the ghosts essences, and don\'t worry about being moral, they\'ll pass on to whatever fate awaits them!\n\n<Gazztoggle smirks to himself.>','Head Southwest and gather 8 Intense Ethereal Essence from Highborne Apparition\'s and Highborne Lichling\'s.','Get to gathering that ghost dust pal!','Finally got it huh? Here, lets try and see if we can get some energy off this thing.\n\n<Gazztoggle turns to quickly begin performing his task, soon producing many small objects and devices, he takes quite a healthy amount of the powder and places it within one machine, only to try and get another to work, after a few minutes of he seems to barely have any luck using the Essence.>\n\nDamn! Looks like this isn\'t actually viable, I\'d best come up with something else.',81323,8,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,850,3850,1001,250,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);

replace into creature_questrelation (id, quest) values (91254, 55014);
replace into creature_involvedrelation (id, quest) values (91254, 55014);

replace into quest_template (prevquestid, entry, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, reqcreatureorgoid1, reqcreatureorgocount1, reqcreatureorgoid2, reqcreatureorgocount2, reqcreatureorgoid3, reqcreatureorgocount3, reqcreatureorgoid4, reqcreatureorgocount4, srcitemid, srcitemcount, reworreqmoney, rewxp, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4) values (55010,55015,16,49,45,0,0,'The Eldarath Project','There\'s always new projects popping up, and subsequently turning up worthless!\n\nIt seems this region is cursed, or I am anyway with my horrid luck.\n\nFrix is haunting me from the grave, but still, there are a few projects that we had I\'d like to close up to rule them out.\n\nTo the east lays the ancient Highborne city of Eldarath, now, you won\'t find any friendly elves, instead twisted versions of them...\n\nNaga occupy almost the entirety of the ruins, it\'s mostly why me and Frix never bothered with pushing this project forward.\n\nNow with you around though, we can finally test it out! Go to the Ruins of Eldarath to the east, once there look for small shards of energy known as Eldarath Ley-shards.','Venture to the Ruins of Eldarath and find 5 Eldarath Ley-Shards.','What, are the naga being too much trouble?','Glad you came back in one piece, now, did you get those shards?!\n\n<The goblin greedily takes the ley-shards and begins to tinker with them, it is not long before the unstable shards crackle, and fizzle, beginning to to turn to dust.>\n\nDamned! These crystals are worthless, junk even, too unstable and not even in the good way...\n\nI\'m really going to have to use my noggin here.',81324,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,500,3850,1001,250,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);

replace into creature_questrelation (id, quest) values (91254, 55015);
replace into creature_involvedrelation (id, quest) values (91254, 55015);

replace into quest_template (prevquestid, entry, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, reqcreatureorgoid1, reqcreatureorgocount1, reqcreatureorgoid2, reqcreatureorgocount2, reqcreatureorgoid3, reqcreatureorgocount3, reqcreatureorgoid4, reqcreatureorgocount4, srcitemid, srcitemcount, reworreqmoney, rewxp, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4) values (55015,55016,16,51,46,0,0,'The Skystormer Project','Azshara seems hopeless, but for all that\'s failed and everything I\'ve tried out here I still have a few more things left to try.\n\nWithin the region there is a species of hippogryph known as the Thunderhead, they can be found all over the area but I\'m looking for the ones with the real power to get the best results!\n\nFar to the north-east near the very edges of the Azshara plateau are Thunderhead Skystormer\'s, now they\'re really the kingpins of the Thunderhead\'s, grab me 3 Skystormer Antler\'s, that\'s where they gotta hold their power.\n\nBring em to me so we can test if they hold any ability for energy.','Slay Thunderhead Skystormer\'s for Skystormer Antlers far to the North-east of Azshara.','What? Getting bored of searching for them?','Ahh, took you long enough! Have trouble finding the blasted things? Oh well, gimme!\n\n<Gazztoggle takes the Antler\'s from you, quickly moving to test their power.>\n\nYes! Finally something, who would have guessed this would be worth our time...\n\nThanks again, $N , for all you\'ve done.',81314,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,250,5150,1001,350,0,0,0,0,0,0,0,0,0,81325,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0);

replace into creature_questrelation (id, quest) values (91254, 55016);
replace into creature_involvedrelation (id, quest) values (91254, 55016);

replace into quest_template (prevquestid, entry, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, reqcreatureorgoid1, reqcreatureorgocount1, reqcreatureorgoid2, reqcreatureorgocount2, reqcreatureorgoid3, reqcreatureorgocount3, reqcreatureorgoid4, reqcreatureorgocount4, srcitemid, srcitemcount, reworreqmoney, rewxp, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4) values (55016,55017,16,48,46,0,0,'Report to Sparkwater!','Ahh... It feels good finally having something to report, no doubt Grimzlow is pretty angry given how long it took me to get back to him!\n\nThe big ups in Sparkwater are going to need a report, run it up to them while I continue my work here!\n\nYou\'re going to buy me some time to keep my work up, and keep getting paid!\n\nMaybe I\'ll even get a new assistant that isn\'t as bad as Frix, bless his soul.','Take Gazztoggle\'s Report to Grimzlow.','He\'s in Sparkwater!','Oh, didn\'t I send you to Azshara?\n\nDon\'t tell me you\'ve been in the tavern this entire time!\n\nThis is from Gazztoggle, I figured he had run with Sparkwater\'s money, I was getting ready to call up my people to go and give him a -real- visit.\n\nHe seems to have found some promising results at least.',81326,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,81326,1,100,1250,1001,200,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);

replace into creature_questrelation (id, quest) values (91254, 55017);
replace into creature_involvedrelation (id, quest) values (91234, 55017);

replace into quest_template (prevquestid, entry, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, reqcreatureorgoid1, reqcreatureorgocount1, reqcreatureorgoid2, reqcreatureorgocount2, reqcreatureorgoid3, reqcreatureorgocount3, reqcreatureorgoid4, reqcreatureorgocount4, srcitemid, srcitemcount, reworreqmoney, rewxp, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4) values (55017,55018,16,54,46,0,0,'The Big Energy Project','I have one final project that I am calling The Big Energy Project, it has to do with the gathering of Blue Dragonflight that have cropped up a while ago around the Lake Mennar to the south east.\n\nIts not often that dragon\'s get involved with much, but from what I\'ve learned, these blue dragons love their magic!\n\nIf I can get my hand on some dragonkin\'s staff, just think of the possibilities!\n\nThe orc\'s in valormok have been talking a little about their presence and a new Lieutenant posted there, its a good thing my long ears were able to hear the little details!\m\mGo find this Lieutenant, and take his staff, he has to have one! Now, gather up a group of friends, or fellow adventurer\'s, this is gonna be a big operation, not just something you can do alone.','Take Gazztoggle\'s Report to Grimzlow.','What? We\'re on the brink of greatness here, you gotta get that staff.','Wait... You actually pulled it off?\n\nI can\'t believe you managed to interfere with the Dragonkin in such a way! Haha!\n\nWith this staff I could power Sparkwater for weeks, maybe even set up my own shop here...\n\nOh, take this!',81327,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1000,7250,1001,450,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,81328,1,81329,1,81330,1,0,0);

update quest_template set type = 1 where entry = 55018;

replace into creature_questrelation (id, quest) values (91254, 55018);
replace into creature_involvedrelation (id, quest) values (91234, 55018);

replace into quest_template (prevquestid, entry, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, reqcreatureorgoid1, reqcreatureorgocount1, reqcreatureorgoid2, reqcreatureorgocount2, reqcreatureorgoid3, reqcreatureorgocount3, reqcreatureorgoid4, reqcreatureorgocount4, srcitemid, srcitemcount, reworreqmoney, rewxp, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4) values (0,55019,14,39,35,0,0,'Missing Blood','My brother has recently been dispatched out to the far reaches of our strength and posted within the encampment of Stonard.\n\nIt\'s not me to question the Warchief\'s desires but I still do worry for his safety out there even if he is strong and good of health.\n\n t has been months since we have last seen one another with all of the deployments, from one to the next, and now the Swamp of Sorrows of all places?\n\nThe only thing that has me at peace is that he had been promoted to a position of some power within the garrison there.\n\nIt\'s good knowing that maybe he is not on the very frontlines and is instead commanding his men.\n\nIt\'s an odd thing to watch a younger brother become more important then you but, well, duty calls and we must all do our part.\n\n If you could please find Zuul within Stonard in the Swamp of Sorrows and deliver him this letter it would be an ease off my mind.','Deliver Rugnar\'s Letter to Zuul in Stonard.','Why hello there, stranger, what brings you to Stonard?','You\'re looking for Zuul? Well that would be me, what\'s this?',81331,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,81331,1,50,720,76,150,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);

replace into creature_questrelation (id, quest) values (91203, 55019);
replace into creature_involvedrelation (id, quest) values (5546, 55019);

replace into quest_template (prevquestid, entry, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, reqcreatureorgoid1, reqcreatureorgocount1, reqcreatureorgoid2, reqcreatureorgocount2, reqcreatureorgoid3, reqcreatureorgocount3, reqcreatureorgoid4, reqcreatureorgocount4, srcitemid, srcitemcount, reworreqmoney, rewxp, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4) values (55019,55020,75,39,35,0,0,'Misgotten Honor','Well, this is a little embarrasing, it seems my embellishments might have gotten to the wrong hands and led before me.\n\nI\'ve always wanted to be more of a success in my brother\'s eyes, and whilst he has made a good living as a trader I\'ve served Orgrimmar for years only to remain a Grunt.\n\n<Zuul sighs.>\n\nI suppose I should come clean, it is honor that dictates I be honest, especially with that of my own kin.\n\nLying to try and make appearances is what Alliance diplomat\'s would do, not the sons of Durotar.\n\nAs much as I desire to go and apologize in person I cannot, too many tasks to do in such a short time.\n\nSpeak to my commander and let him know I desire leave to Durotar for a short time.','Speak to Dispatch Commander Ruag in the Stonard Keep.','He is located within the large building in the encampment.','What is it you require from Commander Ruag? It had better be important.',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,275,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);

replace into creature_questrelation (id, quest) values (5546, 55020);
replace into creature_involvedrelation (id, quest) values (7623, 55020);

replace into quest_template (prevquestid, entry, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, reqcreatureorgoid1, reqcreatureorgocount1, reqcreatureorgoid2, reqcreatureorgocount2, reqcreatureorgoid3, reqcreatureorgocount3, reqcreatureorgoid4, reqcreatureorgocount4, srcitemid, srcitemcount, reworreqmoney, rewxp, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4) values (55020,55021,75,39,35,0,0,'Beyond the Walls','So, Zuul sent you? He want\'s to leave Stonard, that\'s it?\n\nHeh, well I\'ll make you a deal $r. Zuul has been an obedient grunt, one that listens well and does well when called upon, it\'s the only reason I\'m offering this, you do a task for me, I\'ll give him leave for a few days.\n\nThe local wildlife have been a continual thorn within our side, there is no other presence then the large beasts that dwell within the shadows beyond the light of our torches.\n\nI\'ve had orcs go missing and not turn up within the late of night, and there is no doubt within my mind it is the beasts outside our walls.\n\nClear out the trees of what you find, the Jaguar , the spider, and the crocolisk, make sure to thin their numbers.','Kill 6 Young Sawtooth Crocolisks, 8 Sorrow Spinners, and 8 Swamp Jaguars then return to Dispatch Commander Ruag.','The Swamp has earned it\'s name, has it not?','It seems you\'ve done well, I\'ll be pleased to not have orcs go missing.',0,0,0,0,0,0,0,0,1084,6,858,8,767,8,0,0,0,0,0,2850,76,150,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);

replace into creature_questrelation (id, quest) values (7623, 55021);
replace into creature_involvedrelation (id, quest) values (7623, 55021);

replace into quest_template (prevquestid, entry, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, reqcreatureorgoid1, reqcreatureorgocount1, reqcreatureorgoid2, reqcreatureorgocount2, reqcreatureorgoid3, reqcreatureorgocount3, reqcreatureorgoid4, reqcreatureorgocount4, srcitemid, srcitemcount, reworreqmoney, rewxp, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4) values (55021,55022,75,39,35,0,0,'Taking Leave','Ahh... Fine, I\'ll put in the work to have Zuul dispatched, I cannot hold the title of Commander without honoring my word.\n\nTell Zuul that he will have 3 days leave to Orgrimmar, on the fourth day I will make arrangements for him to return to Stonard.\n\nAdvise him to make good use of these 3 days.','Speak with Grunt Zuul.','Have you heard word from my brother?',' Really? I didn\'t actually expect the chance to go.\n\nThis mean\'s a lot to me, its the chance to correct wrongs and make rights.\n\nI realize that there should be no competition between brothers and getting this note only serves to remind me that we should be proud of who we are.',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,250,76,250,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);

replace into creature_questrelation (id, quest) values (7623, 55022);
replace into creature_involvedrelation (id, quest) values (5546, 55022);

replace into quest_template (prevquestid, entry, zoneorsort, questlevel, minlevel, questflags, specialflags, title, details, objectives, requestitemstext, offerrewardtext, reqitemid1, reqitemcount1, reqitemid2, reqitemcount2, reqitemid3, reqitemcount3, reqitemid4, reqitemcount4, reqcreatureorgoid1, reqcreatureorgocount1, reqcreatureorgoid2, reqcreatureorgocount2, reqcreatureorgoid3, reqcreatureorgocount3, reqcreatureorgoid4, reqcreatureorgocount4, srcitemid, srcitemcount, reworreqmoney, rewxp, rewrepfaction1, rewrepvalue1,  rewrepfaction2, rewrepvalue2, rewrepfaction3, rewrepvalue3, rewrepfaction4, rewrepvalue4, rewspell, rewspellcast, completeemote, rewitemid1, rewitemcount1, rewitemid2, rewitemcount2, rewitemid3, rewitemcount3, rewitemid4, rewitemcount4, rewchoiceitemid1, rewchoiceitemcount1, rewchoiceitemid2, rewchoiceitemcount2, rewchoiceitemid3, rewchoiceitemcount3, rewchoiceitemid4, rewchoiceitemcount4) values (55022,55023,75,39,35,0,0,'Relief and Reprise','There is one last thing I require from you friend, if you could but be of help a moment longer.\n\nI still may be here for a while longer waiting for my leave, if you could take this letter from me and deliver it to my brother letting him know I will be arriving soon, it would mean quite a lot to me.\n\nThanks again friend, Blood and Honor.','Travel to Sparkwater port and deliver Zuul\'s Note to Rugnar.','He should be located in Sparkwater.','Oh, a letter?\n\n<Rugnar begins to read intently.>\n\nWell, this is unexpected news, I must offer my thanks for everything you\'ve done, last thing I expected was a letter back so quickly, take this, for all of the troubles.',81332,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,81332,1,250,1150,76,150,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);

replace into creature_questrelation (id, quest) values (5546, 55023);
replace into creature_involvedrelation (id, quest) values (91203, 55023);