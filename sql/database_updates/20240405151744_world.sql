-- Add item 69109 69110 69111 69112 69113 69114 69115 69116 to vendor stock of npcs 13476 2805.
replace INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `itemflags`, `condition_id`) VALUES
 (2805, 0, 69109, 0, 0, 0, 0),
 (2805, 0, 69110, 0, 0, 0, 0),
 (2805, 0, 69111, 0, 0, 0, 0),
 (2805, 0, 69112, 0, 0, 0, 0),
 (2805, 0, 69113, 0, 0, 0, 0),
 (2805, 0, 69114, 0, 0, 0, 0),
 (2805, 0, 69115, 0, 0, 0, 0),
 (2805, 0, 69116, 0, 0, 0, 0),
(13476, 0, 69109, 0, 0, 0, 0),
(13476, 0, 69110, 0, 0, 0, 0),
(13476, 0, 69111, 0, 0, 0, 0),
(13476, 0, 69112, 0, 0, 0, 0),
(13476, 0, 69113, 0, 0, 0, 0),
(13476, 0, 69114, 0, 0, 0, 0),
(13476, 0, 69115, 0, 0, 0, 0),
(13476, 0, 69116, 0, 0, 0, 0);
-- 69109 69110 69111 69112 should cost 15 gold to buy.
update item_template set buy_price = 150000, sell_price = 30000 where entry in (69109,69110,69111,69112);
-- 69113 69114 69115 69116 should cost 5 gold to buy.
update item_template set buy_price = 50000, sell_price = 10000 where entry in (69113,69114,69115,69116);