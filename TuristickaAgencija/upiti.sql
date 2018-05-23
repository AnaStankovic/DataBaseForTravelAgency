use Turisticke_agencije;
/*-- Prvi upit rezervise putovanje putnika sa nekim id_putnik za putovanje sa id_putovanja
--Unosimo putnika i putovanje u tabeli Rezervise
--Pre unosa se proverava prvi triger da li ima slobodnih mesta za Putovanje
--posle unosa se aktivira drugi triger i broj slobodnih mesta smanji za jedan*/
insert into Rezervise values
(89,45);


/*
Izdvojimo za sve putnike putovanja na koja odlaze
*/
select ime,  nazivPutovanja from Putnik p, Odlazi o,Putovanje pa
where p.id_Putnik = o.putnik and pa.id_Putovanje = o.putovanje;



/*Unosimo za Putnika sa rednim brojem 111 mail*/
update Putnik set email='mica@gmail.com' where id_Putnik = 111;



/*izdvajamo sve putnike koji su platili aranzman kesom*/

select p.ime, p.prezime from Putnik p, Uplacuje u, Aranzman a
where p.id_Putnik = u.putnik and a.id_Aranzman = u.aranzman 
and a.nacinPlacanja = 'kesom';
