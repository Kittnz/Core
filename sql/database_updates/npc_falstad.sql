set @gossip_menu_id = 16680; set @magic_number = 5635;
replace into gossip_menu (entry, text_id, condition_id) VALUES (@gossip_menu_id, @gossip_menu_id, '0'); 
replace into npc_text (ID, BroadcastTextID0) values (@gossip_menu_id, @gossip_menu_id);
replace into broadcast_text (entry, Male_Text) values (@gossip_menu_id, 'I am Falstad, Thane of the Wildhammer Clan. Can you smell it upon the air, the foul stench of troll lingers like a taint upon The Hinterlands.\n\nThe trolls have been encroaching ever closer to Aerie Peak, and it is our job to stifle them at every chance that we can.\n\nSo, what are you doing here, what is it the Wildhammer can do for you?');
update creature_template set gossip_menu_id = @gossip_menu_id where entry = @magic_number; 
