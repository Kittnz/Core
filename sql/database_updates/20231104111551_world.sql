-- Itswicky 3-11-23
-- Add test spells from local and change spellitemenchantment references in spells
-- #57185 & #57157
REPLACE INTO `spell_template` VALUES (57185, 0, 0, 0, 0, 0, 65536, 0, 8192, 0, 0, 0, 0, 16, 0, 0, 0, 0, 6, 0, 0, 15, 0, 0, 0, 101, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 30, 8, 53, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3054, 0, 0, 0, 0, 0, 0, 0, 0, 3182, 0, 1, 0, 0, 'Sigil of Resilience', 16712190, '', 16712190, 'Permanently reduces your chance to be critically hit by melee and ranged attacks by $45530s1% to a shoulder slot item.', 16712190, '', 16712190, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 1, 0, 0, 0, 0, 0, 0);
REPLACE INTO `spell_template` VALUES (57157, 0, 0, 0, 0, 0, 65536, 0, 8192, 0, 0, 0, 0, 16, 0, 0, 0, 0, 6, 0, 0, 15, 0, 0, 0, 101, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 30, 8, 53, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3038, 0, 0, 0, 0, 0, 0, 0, 0, 3182, 0, 1, 0, 0, 'Sigil of Penetration', 16712190, '', 16712190, 'Permanently adds $48033s1 armor penetration to a shoulder slot item.', 16712190, '', 16712190, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 1, 0, 0, 0, 0, 0, 0);
REPLACE INTO `spell_template` VALUES (42003, 5, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 101, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 6, 6, 0, 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 99, 49, 0, 0, 1, -1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 137, 134, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 152, 0, 0, 'Spirit Tap', 2031646, 'Rank 1', 2031646, '', 2031644, 'Spirit increased by $s1% and allows $s2% of mana regeneration while casting.', 2031646, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 1, 1, 0, 0, 0, 0, 0);
REPLACE INTO `spell_template` VALUES (42002, 5, 0, 0, 1, 0, 65536, 0, 524288, 0, 0, 134217728, 0, 0, 0, 0, 0, 0, 1, 0, 0, 8, 0, 0, 327680, 100, 1, 0, 60, 60, 6, 0, 195, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 6, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 42, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8388736, 0, 0, 0, 0, 0, 42003, 0, 0, 0, 0, 0, 4820, 0, 1591, 0, 0, 'Touch of Weakness', 16712190, 'Rank 6', 16712190, 'The next melee attack on the caster will cause $19254s1 Shadow damage and reduce the damage caused by the attacker by $19254s2 for $19254d.', 16712190, 'The next damaging melee attack against you will damage and weaken the target.', 16712190, 0, 133, 1500, 0, 0, 6, 2214592512, 0, 1, 1, -1, 1, 1, 1, 0, 0, 0, 0);
REPLACE INTO `spell_template` VALUES (42001, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 65536, 100, 1, 0, 0, 0, 29, 0, 0, 0, 0, 0, 1, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 6, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, -6, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 108, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8192, 0, 0, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 152, 0, 0, 'Soothing Shadows', 16712190, '', 16712190, 'Reduces the mana cost of your Mind Blast by $s1% for $d.', 16712190, 'Reduces the mana cost of your next Mind Blast by $s1%.', 16712190, 0, 0, 0, 0, 0, 6, 0, 0, 0, 0, -1, 1, 0, 0, 0, 0, 0, 0);
REPLACE INTO `spell_template` VALUES (42000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 327680, 100, 0, 0, 0, 1, 21, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 6, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 42, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8388736, 0, 0, 0, 0, 0, 42001, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'SP T1 3 Set', 16712190, '', 16712190, 'Dealing damage with Mind Flay reduces the mana cost of your next Mind Blast by $42001s1% for $42001d, stacking up to $42001u times.', 16712190, '', 16712190, 0, 0, 0, 0, 0, 6, 0, 0, 0, 0, -1, 1, 1, 1, 0, 0, 0, 0);



