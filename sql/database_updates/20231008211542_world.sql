-- Remove broken engineering recipes from trainer.
DELETE FROM `npc_trainer` WHERE `spell` IN (19845, 19846, 23088, 49526, 49527, 49528);

-- Fix Dead Until Dark quest chain requirements
UPDATE quest_template SET PrevQuestId = 40879 WHERE entry = 40880;
UPDATE quest_template SET PrevQuestId = 40878 WHERE entry = 40879;

-- Fix missing quest relations on NPC Mystic Guay'Jin
REPLACE INTO creature_questrelation VALUES (8081, 80313);
REPLACE INTO creature_involvedrelation VALUES (80801, 80313);

-- Fix missing prereq from quest Anchor's End
UPDATE quest_template SET PrevQuestId = 40671 WHERE entry = 40672;
