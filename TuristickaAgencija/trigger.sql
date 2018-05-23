use Turisticke_agencije;
DELIMITER $$
DROP TRIGGER IF EXISTS prvi $$ 
CREATE TRIGGER prvi BEFORE INSERT ON Rezervise
FOR EACH ROW
BEGIN

	IF((select broj_slobodnih_mesta from Putovanje p where new.putovanje = p.id_Putovanje)<=0)
	THEN
		SIGNAL SQLSTATE '45000' SET message_text = 'Greska: Ne moze vise da se rezervise jer nema slobodnih mesta';
	END IF;
END $$

DROP TRIGGER IF EXISTS drugi $$ 
CREATE TRIGGER drugi AFTER INSERT ON Rezervise
FOR EACH ROW
BEGIN
update Putovanje
	set broj_slobodnih_mesta  = broj_slobodnih_mesta - 1 where new.putovanje = id_Putovanje;
END $$