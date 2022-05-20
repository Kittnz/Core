-- EMERALD SANCTUM NPCS, SENT TO ME BY SHANG
-- Sanctum Dreamer, display ID 621, scale 1.7, level 62 elite (2155 armor, 51448 HP, 11920 mana) , faction 44, dragonkin
-- Sanctum Dragonkin, display ID 7863, scale 1.3, level 63 elite (4452 ARMOR, 131499 HP , faction 44, dragonkin
-- Sanctum Wyrm, display 7553, scale 1.2, level 63 elite (4900 armor, 394733 HP) , faction 44, dragonkin
-- Sanctum Wyrmkin, display ID 181, scale 1.3, level 63 elite (3315 armor, 108412 HP, 25091 mana) , faction 44, dragonkin
-- Sanctum Scalebane, display ID 7903, scale 1.6, level 63 elite, (4890 armor, 248622 HP, 100 shadow resistance, 50 nature resistance) , faction 44, dragonkin
-- Erennius, display 9584, scale 2, level 64 elite (4912 armor, 1122414 HP, 42889 MANA, 100 shadow resistance, 50 nature resistance) , faction 44, dragonkin
-- Solnius <The Awakener>, display ID 16047 , level 64 elite BOSS (SKULL) (4712 ARMOR, 2391088 HP, 88199 MANA, 100 shadow resistance, 50 nature resistance) , faction 44, dragonkin

REPLACE INTO creature_template VALUES
(60742, 621, 0, 0, 0, 'Sanctum Dreamer', '', 0, 62, 62, 51448, 51448, 11920, 11920, 2155, 44, 0, 1, 1.14286, 1.7, 20, 5, 0, 1, 1, 1058, 1403, 0, 284, 1, 2000, 2000, 1, 0, 0, 0, 0, 0, 0, 0, 203.77, 289.86, 100, 2, 0, 60742, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2142, 2803, 'EventAI', 0, 0, 0, 0, 3, 0, 0, 0, 0, 0, 0, 0, ''),
(60743, 181, 0, 0, 0, 'Sanctum Dragonkin', '', 0, 63, 63, 131499, 131499, 0, 0, 4452, 44, 0, 1, 1.14286, 1.3, 20, 5, 0, 1, 1, 1687, 2235, 0, 284, 1, 2000, 2000, 1, 0, 0, 0, 0, 0, 0, 0, 203.77, 289.86, 100, 2, 0, 60743, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2142, 2803, 'EventAI', 0, 0, 0, 0, 3, 0, 0, 0, 0, 0, 0, 0, ''),
(60744, 7553, 0, 0, 0, 'Sanctum Wyrm', '', 0, 63, 63, 394733, 394733, 0, 0, 4900, 44, 0, 1, 1.14286, 1.2, 20, 5, 0, 1, 1, 1726, 2290, 0, 284, 1, 2000, 2000, 1, 0, 0, 0, 0, 0, 0, 0, 203.77, 289.86, 100, 2, 0, 60744, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2142, 2803, 'EventAI', 0, 0, 0, 0, 3, 0, 0, 0, 0, 0, 0, 0, ''),
(60745, 7863, 0, 0, 0, 'Sanctum Wyrmkin', '', 0, 63, 63, 108412, 108412, 25091, 25091, 3315, 44, 0, 1, 1.14286, 1.3, 20, 5, 0, 1, 1, 1687, 2235, 0, 284, 1, 2000, 2000, 1, 0, 0, 0, 0, 0, 0, 0, 203.77, 289.86, 100, 2, 0, 60745, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2142, 2803, 'EventAI', 0, 0, 0, 0, 3, 0, 0, 0, 0, 0, 0, 0, ''),
(60746, 7903, 0, 0, 0, 'Sanctum Scalebane', '', 0, 63, 63, 248622, 248622, 0, 0, 4890, 44, 0, 1, 1.14286, 1.6, 20, 5, 0, 1, 1, 1726, 2290, 0, 284, 1, 2000, 2000, 1, 0, 0, 0, 0, 0, 0, 0, 203.77, 289.86, 100, 2, 0, 60746, 0, 0, 0, 0, 50, 0, 100, 0, 0, 0, 0, 0, 0, 0, 2142, 2803, 'EventAI', 0, 0, 0, 0, 3, 0, 0, 0, 0, 0, 0, 0, ''),
(60747, 9584, 0, 0, 0, 'Erennius', '', 0, 64, 64, 1122414, 1122414, 42889, 42889, 4912, 44, 0, 1, 1.14286, 2, 20, 5, 0, 1, 1, 1867, 2475, 0, 290, 1, 2000, 2000, 1, 0, 0, 0, 0, 0, 0, 0, 720, 990, 100, 2, 0, 60747, 0, 0, 0, 0, 50, 0, 100, 0, 0, 0, 0, 0, 0, 0, 381176, 465881, 'EventAI', 0, 3, 0, 0, 3, 0, 0, 2793635679, 0, 0, 32769, 0, ''),
(60748, 16047, 0, 0, 0, 'Solnius', 'The Awakener', 0, 64, 64, 2391088, 2391088, 88199, 88199, 4712, 44, 0, 1, 1.14286, 0, 20, 5, 0, 3, 1, 1999, 2650, 0, 290, 1, 2800, 2000, 1, 0, 0, 0, 0, 0, 0, 0, 752, 1034, 100, 2, 0, 60748, 0, 0, 0, 0, 50, 0, 100, 0, 0, 0, 0, 0, 0, 0, 1302365, 1403983, 'EventAI', 0, 3, 0, 0, 3, 0, 0, 2793635679, 0, 0, 32769, 0, '');