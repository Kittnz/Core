DELETE FROM faction WHERE id IN (999, 1000, 1002, 1003, 1010, 1014, 1015, 1016, 1017);
DELETE FROM faction_template WHERE faction_id IN (999, 1000, 1002, 1003, 1010, 1014, 1015, 1016, 1017);

UPDATE `faction` SET `reputation_flags1` = 16 WHERE `id` = 1007;
UPDATE `faction` SET `reputation_flags1` = 16 WHERE `id` = 1008;

UPDATE `faction` SET `reputation_flags1` = 4, `reputation_flags2` = 4 WHERE `id` = 1012;

DELETE FROM `faction_template` WHERE `id` IN (1701, 1702, 1703, 1704, 1705, 1706, 1707, 1708, 1709);

UPDATE `faction` SET `reputation_list_id` = -1, `base_rep_race_mask1` = 0, `base_rep_race_mask2` = 0, `base_rep_value1` = 0, `base_rep_value2` = 0 WHERE `id` = 189;
UPDATE `faction` SET `reputation_list_id` = -1, `base_rep_race_mask1` = 0, `base_rep_race_mask2` = 0, `base_rep_value1` = 0, `base_rep_value2` = 0 WHERE `id` = 66;


UPDATE `spell_template` SET `description` = 'The caster is surrounded by $n globes of water. When a spell, melee or ranged attack hits the caster, 130 mana is restored to the caster. This expends one water globe. Only one globe will activate every few seconds. Lasts $d. Only one elemental shield can be active on the Shaman at any one time.' WHERE `entry` = 45527;