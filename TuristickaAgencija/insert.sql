use Turisticke_agencije;

insert into Turisticka_agencija values
(23, 'Euroturs', 'Obilicev venac 19'),
(71, 'Jungle Travel', 'Resavska 5'),
(5, 'Bambo', 'Ljermontova 3'),
(144, 'More', 'Topolska 1'),
(8, 'Worldturs', 'Krunska 34'),
(11, 'From To', 'Kraljice Natalije 56')
;

insert into Putovanje values
(1, 'Vikend u Parizu', 'Pariz',60,200),
(31, 'Thailand', 'Tajland',30,1000),
(57, 'Apsolventsko putovanje', 'Italija',100,350),
(14, 'Letovanje u Grckoj', 'Grcka',100,230),
(81, 'Apsolventska ekskurzija', 'Francuska',75,320),
(45, 'From Serbia To Paris', 'Francuska',10,300)
;

insert into Organizuje values
(23, 31),
(71, 31),
(5, 45),
(144, 57),
(8, 81),
(11, 45)
;

insert into Plan_putovanja values
('13. mart u 9:00', 'Caprise','Francuska i okolina','ukljucene',1),
('7. jun u 19:00', 'Fontany','Gradici na Tajlandu','nisu ukljucene',31),
('13. mart u 00:00', 'Green','Italija','ukljucene',57),
('6. maj u 10:00', 'Simple hotel','Mesta u Grckoj','nisu ukljucene',14),
('11. januar u 9:00', 'Nice place','Francuska,Austrija','nisu ukljucene',81),
('31. decembar u 6:00', 'Woow','Francuska','ukljucene',45)
;

insert into Transport values
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8)
;

insert into Autobus values
('Prevoznici brzi', '11-23QB',60,1),
('Buss', '13-23QB',100,7),
('FUS', 'AQ-rr11',60,8)
;

insert into Kola values 
('1608994656034', '33-23QB',null,2),
('2345234566777', 'AQ111',null,3)
;

insert into Avion values
('Happy air', 12,290,4),
('Air fast', 23,200,5),
('blu', 15,60,6)
;

insert into Aranzman values
(11, 'karticom',200),
(45, 'kesom', 100),
(34, 'na rate', 350),
(22, 'na rate', 230),
(81, 'kesom', 320),
(5, 'kesom', 300)
;



insert into Putnik values
(111, 'Milica', 'Spasic','06412345678',null,1),
(23, 'Dejana ', 'Mitic','0642345321',null,2),
(32, 'Simonida', 'Jelic','0941234532',null,3),
(56, 'Jovan', 'Lukic','0111231231',null,1),
(31, 'Ivan', 'Djuric','01745632','ivan@gmail.com',1),
(67, 'Nina', 'Filipov','01123422',null,3),
(34, 'Milan', 'Spasov','056564234',null,3),
(12, 'Milena', 'Spasov','056564234',null,2),
(123, 'Radmila', 'Spasov','056564234',null,2),
(13, 'Snezana', 'Stanov','06412345778',null,2),
(89, 'Zoran', 'Zokic','06412366668',null,2),
(79, 'Jovan', 'Radic','0641234444',null,1)
;

insert into Rezervise values
(111 ,1),
(23,57),
(32,14),
(56, 81),
(31, 45),
(67, 1),
(34, 31),
(12, 31),
(123,31),
(13, 45),
(89, 81),
(79, 14)
;


insert into Uplacuje values 
(111, 11),
(23, 45),
(32, 34),
(56, 22),
(31, 81),
(67, 11),
(34, 45),
(12, 45),
(123, 45),
(13, 81),
(89,11),
(79,81)
;

insert into Odlazi values
(111, 11,1),
(23, 45,57),
(32, 34,14),
(56, 22,81),
(31, 81,45),
(67, 11,1),
(34, 45,31),
(12, 45,31),
(123, 45,31),
(13, 81,45),
(89,11,81),
(79,81,14)
;