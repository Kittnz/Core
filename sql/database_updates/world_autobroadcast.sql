delete from mangos_string where entry between 50000 and 50006;
delete from autobroadcast where string_id between 50000 and 50006;

replace into mangos_string (entry, content_default) values

('50000', 'Delete your WDB folder regularly. This is your game cache, and deleting it can often fix minor game glitches. Always try this before submitting a ticket.'),

('50001', 'Anniversary Sale on Turtle WoW! All donation items are now half-price until October 17th!'),

('50002', 'Keep up to date with the news and join our Discord server!'),

('50003', 'We encourage everyone to change their password regularly. If you think you have ever used your Turtle WoW password in different private servers we urge you to change it as soon as possible.'),

('50004', 'All gold transactions are heavily monitored. Any form of RMT will result in severe actions taken against all parties involved. Please, don''t support individuals who are actively harming our server.');

replace into autobroadcast (string_Id) values ('50000'),('50001'),('50002'),('50003'),('50004');

