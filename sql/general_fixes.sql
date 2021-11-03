update creature_template set scale = 1 where entry = 60466;
update creature_template set rank = 1 where entry = 60475;
delete from quest_template where entry = 40154;
update quest_template set details = 'To those reading this message, a local prisoner named Baxxil has recently escaped from the hole after something of a tunneling incident, and escaped off the coast.\n\nHe has been reported, and sighted at Ratchet to the south west in the Barrens. Justice must be dealt, bring this prisoner back dead or alive, and return to Hizzle!' where entry = 55048;
update quest_template set details = 'My brother has recently been dispatched out to the far reaches of our strength and posted within the encampment of Stonard.\n\nIt\'s not for me to question the Warchief\'s desires but I still do worry for my brother\'s safety out there, even if he is strong and good of health.\n\nIt has been months since we have last seen one another with all of the deployments, from one to the next, and now the Swamp of Sorrows of all places?\n\nThe only thing that has me at peace is that he had been promoted to a position of some power within the garrison there.\n\nIt\'s good knowing that maybe he is not on the very frontlines and is instead commanding his men.\n\nIt\'s an odd thing to watch a younger brother become more important then you but, well, duty calls and we must all do our part.\n\n Please find Zuul within Stonard in the Swamp of Sorrows and deliver him this letter.' where entry = 55019;
update creature_template set faction = 120 where entry in (91282, 91281, 91280);
-- When Keeper Ranathos is attacked, I need all Deranged Ancients to also aggro and help Keeper Ranathos.
replace into creature_linking_template values (92117, 802, 92109, 1, 0);
-- Fix Baxxil:
update creature_template set faction = 189, npc_flags = 0 where entry = 91297;