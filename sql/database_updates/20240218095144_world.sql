-- Set Patchwork Golem's Cleave to cast on the target instead of the caster
UPDATE `creature_spells` SET `castTarget_2` = 1 WHERE `entry` = 160170

-- Delete Holy Strike Libram sellers
DELETE FROM creature WHERE id IN (51270, 51271);
