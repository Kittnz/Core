-- Made Zanzas non-unique:

UPDATE `item_template` SET `max_count` = 0 WHERE `entry` IN (20079, 20080, 20081, 8424, 8423, 8411, 8412, 8410);

update item_template set spellid_1 = 8815 where entry = 17015; -- Dark Iron Reaver
update item_template set spellid_1 = 15874, spellid_2 = 7578, spellid_2 = 7527 where entry = 14551; -- Edgemaster\'s Handguards
update item_template set name = "Tome of Teleportation: Theramore" where entry = 92001; -- Theramore Tome
update item_template set name = "Tome of Teleportation: Stonard" where entry = 92002; -- Stonard Tome

-- fix dumb desc
update spell_template SET description = 'Increases the melee attack power bonus of your Seal of the Crusader by $s1 and the Holy damage increase of your Crusader Strike by $s2 per stack.' WHERE entry = 28852; -- Improved Seal of the Crusader
update spell_template SET EffectBasePoints1 = 1, EffectBasePoints2 = 2, effectApplyAuraName2 = 71, Effect2 = 6, EffectDieSides2 = 1, effectBaseDice2 = 1, Description = 'Increases your pet\'s melee and spell critical strike chance by 2%.' WHERE entry = 27042; -- Increased Pet Crit +2%
update spell_template SET description = 'When struck in combat has a 2% chance of increasing all party member\'s attack and casting speed by $18946s1% for $18946d.' WHERE entry = 20847; -- The Lion Horn of Stormwind (Equip Spell)

-- Fix Gilneas Dungeon respawn timers!

UPDATE `creature` SET `spawntimesecsmin` = 36000, `spawntimesecsmax` = 36000 WHERE `map` = 815;

-- Previous timers:

-- UPDATE `creature` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 300 WHERE `guid` = 2576090;
-- UPDATE `creature` SET `spawntimesecsmin` = 120, `spawntimesecsmax` = 120 WHERE `guid` = 2577117;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2576085;
-- UPDATE `creature` SET `spawntimesecsmin` = 36000, `spawntimesecsmax` = 36000 WHERE `guid` = 2576088;
-- UPDATE `creature` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 300 WHERE `guid` = 2576089;
-- UPDATE `creature` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 300 WHERE `guid` = 2576087;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2576094;
-- UPDATE `creature` SET `spawntimesecsmin` = 172800, `spawntimesecsmax` = 172800 WHERE `guid` = 2574990;
-- UPDATE `creature` SET `spawntimesecsmin` = 172800, `spawntimesecsmax` = 172800 WHERE `guid` = 2574991;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2576083;
-- UPDATE `creature` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 300 WHERE `guid` = 2576093;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2576084;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2576091;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2576092;
-- UPDATE `creature` SET `spawntimesecsmin` = 172800, `spawntimesecsmax` = 172800 WHERE `guid` = 2575853;
-- UPDATE `creature` SET `spawntimesecsmin` = 172800, `spawntimesecsmax` = 172800 WHERE `guid` = 2575852;
-- UPDATE `creature` SET `spawntimesecsmin` = 172800, `spawntimesecsmax` = 172800 WHERE `guid` = 2575854;
-- UPDATE `creature` SET `spawntimesecsmin` = 172800, `spawntimesecsmax` = 172800 WHERE `guid` = 2575855;
-- UPDATE `creature` SET `spawntimesecsmin` = 172800, `spawntimesecsmax` = 172800 WHERE `guid` = 2575856;
-- UPDATE `creature` SET `spawntimesecsmin` = 172800, `spawntimesecsmax` = 172800 WHERE `guid` = 2575858;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2575859;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2575860;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2575861;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2575862;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2575863;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2575864;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2575867;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2575866;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2575868;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2575870;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2575871;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2575872;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2575873;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2575874;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2575875;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2575876;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2575877;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2575878;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2575890;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2575880;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2575881;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2575882;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2575883;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2575887;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2575889;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2575888;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2575891;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2575892;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2575893;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2575894;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2575904;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2575905;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2575906;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2575907;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2575908;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2575909;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2575910;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2575911;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2575914;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2575913;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2575926;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2575917;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2575918;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2575919;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2575920;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2575921;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2575922;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2575923;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2575924;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2575925;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2575927;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2575928;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2575942;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2575933;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2575934;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2575935;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2575936;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2575937;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2575938;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2575941;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2575940;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2575947;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2575948;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2575949;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2575950;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2575951;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2575952;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2575953;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2575954;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2575955;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2575956;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2575958;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2575959;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2575960;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2575961;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2575962;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2575963;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2575964;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2575971;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2575966;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2575968;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2575972;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2575970;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2575982;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2575983;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2575975;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2575981;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2575984;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2575985;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2575986;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2575987;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2576012;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2576003;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2576015;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2576013;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2575997;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2576014;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2575999;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2576006;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2576005;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2576007;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2576008;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2576009;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2576010;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2576011;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2576017;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2576018;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2576019;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2576020;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2576021;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2576022;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2576023;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2576024;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2576025;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2576026;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2576027;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2576028;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2576029;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2576030;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2576031;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2576032;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2576033;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2576034;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2576035;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2576036;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2576037;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2576038;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2576039;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2576040;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2576041;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2576042;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2576043;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2576049;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2576052;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2576053;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2576054;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2576055;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2576056;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2576057;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2576058;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2576059;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2576060;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2576061;
-- UPDATE `creature` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 300 WHERE `guid` = 2576062;
-- UPDATE `creature` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 300 WHERE `guid` = 2576063;
-- UPDATE `creature` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 300 WHERE `guid` = 2576064;
-- UPDATE `creature` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 300 WHERE `guid` = 2576065;
-- UPDATE `creature` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 300 WHERE `guid` = 2576068;
-- UPDATE `creature` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 300 WHERE `guid` = 2576067;
-- UPDATE `creature` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 300 WHERE `guid` = 2576069;
-- UPDATE `creature` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 300 WHERE `guid` = 2576070;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2576071;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2576072;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2576073;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2576074;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2576075;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2576077;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2576100;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2576101;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2576103;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2576104;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2576105;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2576106;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2576107;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2576109;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2576110;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2576111;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2576116;
-- UPDATE `creature` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 300 WHERE `guid` = 2576113;
-- UPDATE `creature` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 300 WHERE `guid` = 2576114;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2576115;
-- UPDATE `creature` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 300 WHERE `guid` = 2576117;
-- UPDATE `creature` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 300 WHERE `guid` = 2576118;
-- UPDATE `creature` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 300 WHERE `guid` = 2576119;
-- UPDATE `creature` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 300 WHERE `guid` = 2576120;
-- UPDATE `creature` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 300 WHERE `guid` = 2576121;
-- UPDATE `creature` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 300 WHERE `guid` = 2576122;
-- UPDATE `creature` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 300 WHERE `guid` = 2576123;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2576125;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2576126;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2576127;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2576128;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2576129;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2576130;
-- UPDATE `creature` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 300 WHERE `guid` = 2576131;
-- UPDATE `creature` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 300 WHERE `guid` = 2576132;
-- UPDATE `creature` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 300 WHERE `guid` = 2576133;
-- UPDATE `creature` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 300 WHERE `guid` = 2576134;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2576135;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2576136;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2576139;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2576140;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2576141;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2576142;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2576143;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2576145;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2576147;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2576148;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2576149;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2576150;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2576151;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2576152;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2576153;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2576154;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2576155;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2576156;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2576157;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2576161;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2576162;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2576163;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2576166;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2576170;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2576173;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2576169;
-- UPDATE `creature` SET `spawntimesecsmin` = 14400, `spawntimesecsmax` = 14400 WHERE `guid` = 2576172;
-- UPDATE `creature` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 300 WHERE `guid` = 2576175;
-- UPDATE `creature` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 300 WHERE `guid` = 2576176;
-- UPDATE `creature` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 300 WHERE `guid` = 2576177;
-- UPDATE `creature` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 300 WHERE `guid` = 2576178;
-- UPDATE `creature` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 300 WHERE `guid` = 2576179;
-- UPDATE `creature` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 300 WHERE `guid` = 2576180;
-- UPDATE `creature` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 300 WHERE `guid` = 2576181;
-- UPDATE `creature` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 300 WHERE `guid` = 2576182;
-- UPDATE `creature` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 300 WHERE `guid` = 2576184;
-- UPDATE `creature` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 300 WHERE `guid` = 2576185;
-- UPDATE `creature` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 300 WHERE `guid` = 2576186;
-- UPDATE `creature` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 300 WHERE `guid` = 2576187;
-- UPDATE `creature` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 300 WHERE `guid` = 2576188;
-- UPDATE `creature` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 300 WHERE `guid` = 2576189;
-- UPDATE `creature` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 300 WHERE `guid` = 2576190;
-- UPDATE `creature` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 300 WHERE `guid` = 2576191;
-- UPDATE `creature` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 300 WHERE `guid` = 2576192;
-- UPDATE `creature` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 300 WHERE `guid` = 2576193;
-- UPDATE `creature` SET `spawntimesecsmin` = 120, `spawntimesecsmax` = 120 WHERE `guid` = 2577118;
-- UPDATE `creature` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 300 WHERE `guid` = 2577600;
-- UPDATE `creature` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 300 WHERE `guid` = 2577601;
-- UPDATE `creature` SET `spawntimesecsmin` = 120, `spawntimesecsmax` = 120 WHERE `guid` = 2577602;
-- UPDATE `creature` SET `spawntimesecsmin` = 120, `spawntimesecsmax` = 120 WHERE `guid` = 2577603;
-- UPDATE `creature` SET `spawntimesecsmin` = 120, `spawntimesecsmax` = 120 WHERE `guid` = 2577604;
-- UPDATE `creature` SET `spawntimesecsmin` = 120, `spawntimesecsmax` = 120 WHERE `guid` = 2577605;
-- UPDATE `creature` SET `spawntimesecsmin` = 120, `spawntimesecsmax` = 120 WHERE `guid` = 2577606;
-- UPDATE `creature` SET `spawntimesecsmin` = 120, `spawntimesecsmax` = 120 WHERE `guid` = 2577607;
-- UPDATE `creature` SET `spawntimesecsmin` = 120, `spawntimesecsmax` = 120 WHERE `guid` = 2577608;
-- UPDATE `creature` SET `spawntimesecsmin` = 120, `spawntimesecsmax` = 120 WHERE `guid` = 2577609;
-- UPDATE `creature` SET `spawntimesecsmin` = 120, `spawntimesecsmax` = 120 WHERE `guid` = 2577610;
-- UPDATE `creature` SET `spawntimesecsmin` = 120, `spawntimesecsmax` = 120 WHERE `guid` = 2577611;
-- UPDATE `creature` SET `spawntimesecsmin` = 120, `spawntimesecsmax` = 120 WHERE `guid` = 2577612;
-- UPDATE `creature` SET `spawntimesecsmin` = 120, `spawntimesecsmax` = 120 WHERE `guid` = 2577613;
-- UPDATE `creature` SET `spawntimesecsmin` = 120, `spawntimesecsmax` = 120 WHERE `guid` = 2577614;
-- UPDATE `creature` SET `spawntimesecsmin` = 120, `spawntimesecsmax` = 120 WHERE `guid` = 2577615;
-- UPDATE `creature` SET `spawntimesecsmin` = 120, `spawntimesecsmax` = 120 WHERE `guid` = 2577616;
-- UPDATE `creature` SET `spawntimesecsmin` = 120, `spawntimesecsmax` = 120 WHERE `guid` = 2577617;
-- UPDATE `creature` SET `spawntimesecsmin` = 120, `spawntimesecsmax` = 120 WHERE `guid` = 2577618;
-- UPDATE `creature` SET `spawntimesecsmin` = 120, `spawntimesecsmax` = 120 WHERE `guid` = 2577619;
-- UPDATE `creature` SET `spawntimesecsmin` = 120, `spawntimesecsmax` = 120 WHERE `guid` = 2577620;
-- UPDATE `creature` SET `spawntimesecsmin` = 120, `spawntimesecsmax` = 120 WHERE `guid` = 2577621;
-- UPDATE `creature` SET `spawntimesecsmin` = 120, `spawntimesecsmax` = 120 WHERE `guid` = 2577622;
-- UPDATE `creature` SET `spawntimesecsmin` = 120, `spawntimesecsmax` = 120 WHERE `guid` = 2577623;
-- UPDATE `creature` SET `spawntimesecsmin` = 120, `spawntimesecsmax` = 120 WHERE `guid` = 2577624;
-- UPDATE `creature` SET `spawntimesecsmin` = 120, `spawntimesecsmax` = 120 WHERE `guid` = 2577625;
-- UPDATE `creature` SET `spawntimesecsmin` = 120, `spawntimesecsmax` = 120 WHERE `guid` = 2577626;
-- UPDATE `creature` SET `spawntimesecsmin` = 120, `spawntimesecsmax` = 120 WHERE `guid` = 2577627;
-- UPDATE `creature` SET `spawntimesecsmin` = 120, `spawntimesecsmax` = 120 WHERE `guid` = 2577628;
-- UPDATE `creature` SET `spawntimesecsmin` = 120, `spawntimesecsmax` = 120 WHERE `guid` = 2577629;
-- UPDATE `creature` SET `spawntimesecsmin` = 120, `spawntimesecsmax` = 120 WHERE `guid` = 2577630;
-- UPDATE `creature` SET `spawntimesecsmin` = 120, `spawntimesecsmax` = 120 WHERE `guid` = 2577631;
-- UPDATE `creature` SET `spawntimesecsmin` = 120, `spawntimesecsmax` = 120 WHERE `guid` = 2577632;
-- UPDATE `creature` SET `spawntimesecsmin` = 120, `spawntimesecsmax` = 120 WHERE `guid` = 2577633;
-- UPDATE `creature` SET `spawntimesecsmin` = 120, `spawntimesecsmax` = 120 WHERE `guid` = 2577634;
-- UPDATE `creature` SET `spawntimesecsmin` = 120, `spawntimesecsmax` = 120 WHERE `guid` = 2577635;
-- UPDATE `creature` SET `spawntimesecsmin` = 120, `spawntimesecsmax` = 120 WHERE `guid` = 2577636;
-- UPDATE `creature` SET `spawntimesecsmin` = 120, `spawntimesecsmax` = 120 WHERE `guid` = 2577637;
-- UPDATE `creature` SET `spawntimesecsmin` = 120, `spawntimesecsmax` = 120 WHERE `guid` = 2577638;
-- UPDATE `creature` SET `spawntimesecsmin` = 120, `spawntimesecsmax` = 120 WHERE `guid` = 2577639;
-- UPDATE `creature` SET `spawntimesecsmin` = 120, `spawntimesecsmax` = 120 WHERE `guid` = 2577640;
-- UPDATE `creature` SET `spawntimesecsmin` = 120, `spawntimesecsmax` = 120 WHERE `guid` = 2577641;
-- UPDATE `creature` SET `spawntimesecsmin` = 120, `spawntimesecsmax` = 120 WHERE `guid` = 2578266;
-- UPDATE `creature` SET `spawntimesecsmin` = 120, `spawntimesecsmax` = 120 WHERE `guid` = 2578267;
-- UPDATE `creature` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 300 WHERE `guid` = 2578268;
-- UPDATE `creature` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 300 WHERE `guid` = 2578805;
-- UPDATE `creature` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 300 WHERE `guid` = 2578806;
-- UPDATE `creature` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 300 WHERE `guid` = 2578807;
-- UPDATE `creature` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 300 WHERE `guid` = 2578808;
-- UPDATE `creature` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 300 WHERE `guid` = 2578809;
-- UPDATE `creature` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 300 WHERE `guid` = 2578810;
-- UPDATE `creature` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 300 WHERE `guid` = 2578811;
-- UPDATE `creature` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 300 WHERE `guid` = 2578812;
-- UPDATE `creature` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 300 WHERE `guid` = 2578813;
-- UPDATE `creature` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 300 WHERE `guid` = 2578814;
-- UPDATE `creature` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 300 WHERE `guid` = 2578815;
-- UPDATE `creature` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 300 WHERE `guid` = 2578816;
-- UPDATE `creature` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 300 WHERE `guid` = 2578817;
-- UPDATE `creature` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 300 WHERE `guid` = 2578818;
-- UPDATE `creature` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 300 WHERE `guid` = 2578819;
-- UPDATE `creature` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 300 WHERE `guid` = 2578820;
-- UPDATE `creature` SET `spawntimesecsmin` = 120, `spawntimesecsmax` = 120 WHERE `guid` = 2578821;
-- UPDATE `creature` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 300 WHERE `guid` = 2578822;
-- UPDATE `creature` SET `spawntimesecsmin` = 120, `spawntimesecsmax` = 120 WHERE `guid` = 2578823;
-- UPDATE `creature` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 300 WHERE `guid` = 2578824;
-- UPDATE `creature` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 300 WHERE `guid` = 2578825;
-- UPDATE `creature` SET `spawntimesecsmin` = 120, `spawntimesecsmax` = 120 WHERE `guid` = 2578826;
-- UPDATE `creature` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 300 WHERE `guid` = 2578827;
-- UPDATE `creature` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 300 WHERE `guid` = 2578828;
-- UPDATE `creature` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 300 WHERE `guid` = 2578829;
-- UPDATE `creature` SET `spawntimesecsmin` = 120, `spawntimesecsmax` = 120 WHERE `guid` = 2578830;
-- UPDATE `creature` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 300 WHERE `guid` = 2578831;
-- UPDATE `creature` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 300 WHERE `guid` = 2578832;
-- UPDATE `creature` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 300 WHERE `guid` = 2578833;
-- UPDATE `creature` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 300 WHERE `guid` = 2578834;
-- UPDATE `creature` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 300 WHERE `guid` = 2578835;
-- UPDATE `creature` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 300 WHERE `guid` = 2578841;
-- UPDATE `creature` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 300 WHERE `guid` = 2578843;
-- UPDATE `creature` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 300 WHERE `guid` = 2578853;
-- UPDATE `creature` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 300 WHERE `guid` = 2578845;
-- UPDATE `creature` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 300 WHERE `guid` = 2578846;
-- UPDATE `creature` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 300 WHERE `guid` = 2578847;
-- UPDATE `creature` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 300 WHERE `guid` = 2578849;
-- UPDATE `creature` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 300 WHERE `guid` = 2578850;
-- UPDATE `creature` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 300 WHERE `guid` = 2578851;
-- UPDATE `creature` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 300 WHERE `guid` = 2578852;

-- Fixed Genn loot chances:

UPDATE `creature_loot_template` SET `groupid` = 7 WHERE `entry` = 61418 AND `item` = 61352 AND `groupid` = 0;
UPDATE `creature_loot_template` SET `groupid` = 6 WHERE `entry` = 61418 AND `item` = 61496 AND `groupid` = 0;

-- Fixed rank of Glanthas the Ancient.

UPDATE `creature_template` SET `rank` = 1 WHERE `entry` = 61528;

-- The Binding of Xanthar can now act as group loot:

update item_template set flags = 2048 where entry = 61731;

-- Replaced Venomlash Chimera spell list.

UPDATE `creature_spells` SET `spellId_1` = 17183 WHERE `entry` = 180212;

-- New mage portals learning spells should be only self-cast.

UPDATE `spell_template` SET `targets` = 0 WHERE `entry` IN (49360, 49365, 49357, 49363);

-- Fixed Flourish cooldown.

UPDATE `spell_template` SET `recoveryTime` = 40000 WHERE `entry` = 45604;

-- Delete deprecated quests:

DELETE FROM quest_template WHERE entry IN (40750, 40831, 40836);
DELETE FROM creature_questrelation WHERE quest IN (40750, 40831, 40836);
DELETE FROM creature_involvedrelation WHERE quest IN (40750, 40831, 40836);