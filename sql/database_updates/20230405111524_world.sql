-- NPC Bloodclaw Worgen (Entry 61251), Bloodclaw Alpha (61252), and Bloodclaw Rager (61253) all look like wisps and need their display ID corrected to 61191
update creature_template set display_id1 = 18174 where entry in (61251,61252,61253);
-- NPC Brother Elias (61387) change display ID to 18677
update creature_template set display_id1 = 18677 where entry = 61387;
