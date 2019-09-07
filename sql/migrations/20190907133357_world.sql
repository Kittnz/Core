DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20190907133357');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20190907133357');
-- Add your query below.

INSERT INTO `creature_template` (`entry`, `patch`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `name`, `gossip_menu_id`, `level_min`, `level_max`, `health_min`, `health_max`, `mana_min`, `mana_max`, `armor`, `faction`, `npc_flags`, `speed_walk`, `speed_run`, `scale`, `detection_range`, `call_for_help_range`, `leash_range`, `rank`, `xp_multiplier`, `dmg_min`, `dmg_max`, `dmg_school`, `attack_power`, `dmg_multiplier`, `base_attack_time`, `ranged_attack_time`, `unit_class`, `unit_flags`, `dynamic_flags`, `beast_family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `ranged_dmg_min`, `ranged_dmg_max`, `ranged_attack_power`, `type`, `type_flags`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `spell_id1`, `spell_id2`, `spell_id3`, `spell_id4`, `spell_list_id`, `pet_spell_list_id`, `gold_min`, `gold_max`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `regeneration`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `flags_extra`, `script_name`) VALUES ('17999', '0', '10318', '0', '0', '0', 'Test Racer', '0', '32', '32', '1764', '1764', '0', '0', '1676', '35', '0', '1', '1.14286', '0', '20', '5', '0', '0', '1', '44', '57', '0', '128', '1', '2000', '2000', '1', '768', '0', '0', '0', '0', '0', '0', '47.5904', '65.4368', '100', '9', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '1', '0', '0', '3', '0', '0', '0', '8405008', '0', '2', '');

UPDATE `creature_template` SET `script_name` = 'npc_race_car' WHERE (`entry` = '17999') and (`patch` = '0');

INSERT INTO `game_event` (`entry`, `start_time`, `end_time`, `occurence`, `length`, `holiday`, `description`, `hardcoded`, `disabled`, `patch_min`, `patch_max`) VALUES ('161', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '999999999', '0', 'Miracle Mirage Race', '1', '0', '0', '10');


CREATE TABLE `miraclerace_checkpoint` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `raceID` INT UNSIGNED NOT NULL,
  `PositionX` FLOAT NOT NULL,
  `PositionY` FLOAT NOT NULL,
  `PositionZ` FLOAT NOT NULL,
  `CameraPosX` FLOAT NOT NULL,
  `CameraPosY` FLOAT NOT NULL,
  `CameraPosZ` FLOAT NOT NULL,
  `CameraPosOrientation` FLOAT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC));

REPLACE INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`, `script_name`) VALUES (1000039, 0, 5, 5932, 'Purple Crystal', 0, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
