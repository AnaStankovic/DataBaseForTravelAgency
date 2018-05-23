DROP DATABASE IF EXISTS Turisticke_agencije;
CREATE DATABASE Turisticke_agencije;
USE Turisticke_agencije;



DROP TABLE IF EXISTS Turisticka_agencija ;

CREATE TABLE IF NOT EXISTS Turisticka_agencija (
  broj_licence INT NOT NULL PRIMARY KEY,
  naziv VARCHAR(100) NOT NULL,
  adresa VARCHAR(100) NOT NULL
)ENGINE = InnoDB;



DROP TABLE IF EXISTS Putovanje ;

CREATE TABLE IF NOT EXISTS Putovanje (
  id_Putovanje INT NOT NULL PRIMARY KEY,
  nazivPutovanja VARCHAR(45) NOT NULL,
  lokacija VARCHAR(45) NOT NULL,
  broj_slobodnih_mesta INT NOT NULL,
  cena INT NOT NULL
 
  

)ENGINE = InnoDB;


DROP TABLE IF EXISTS Organizuje ;

CREATE TABLE IF NOT EXISTS Organizuje (
 
  licenca INT NOT NULL,
   putovanje INT NOT NULL ,
  INDEX k_putovanje (putovanje) ,
  INDEX k_licence (licenca) ,
    FOREIGN KEY (putovanje)
    REFERENCES Putovanje (id_Putovanje)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
      FOREIGN KEY (licenca)
    REFERENCES Turisticka_agencija (broj_licence)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)ENGINE = InnoDB;

DROP TABLE IF EXISTS Plan_putovanja ;

CREATE TABLE IF NOT EXISTS Plan_putovanja (
  vreme_polaska VARCHAR(200),
  naziv_hotela VARCHAR(45) ,
  mesto_obilaska VARCHAR(200) ,
  ukljucene_ulaznice VARCHAR(45) ,
  putovanje INT,
  INDEX k_putovanje (putovanje) ,
    FOREIGN KEY (putovanje)
    REFERENCES Putovanje (id_Putovanje)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)ENGINE = InnoDB;



DROP TABLE IF EXISTS Transport ;

CREATE TABLE IF NOT EXISTS Transport (
  id_Transport INT NOT NULL PRIMARY KEY
)ENGINE = InnoDB;

DROP TABLE IF EXISTS Autobus ;

CREATE TABLE IF NOT EXISTS Autobus (
  naziv_prevoznika VARCHAR(45) NOT NULL,
  regBroj VARCHAR(50) NOT NULL,
  kapacitet_autobusa INT NOT NULL,
  transport INT NOT NULL,
  INDEX k_transport (transport) ,
    FOREIGN KEY (transport)
    REFERENCES Transport (id_Transport)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
   
)ENGINE = InnoDB;

DROP TABLE IF EXISTS Kola ;

CREATE TABLE IF NOT EXISTS Kola (
  jmbg_vlasnika VARCHAR(45) NOT NULL,
  broj_registracije VARCHAR(50) NOT NULL,
  vrsta_kola VARCHAR(45),
  transport INT NOT NULL,
  INDEX k_transport (transport) ,
    FOREIGN KEY (transport)
    REFERENCES Transport (id_Transport)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
   
)ENGINE = InnoDB;


DROP TABLE IF EXISTS Avion ;

CREATE TABLE IF NOT EXISTS Avion (
  ime_aviokompanije VARCHAR(50) NOT NULL,
  broj_leta INT NOT NULL,
  kapacitet_aviona INT NOT NULL,
  transport INT NOT NULL,
  INDEX k_transport (transport) ,
    FOREIGN KEY (transport)
    REFERENCES Transport (id_Transport)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
   
)ENGINE = InnoDB;


DROP TABLE IF EXISTS Putnik ;

CREATE TABLE IF NOT EXISTS Putnik (
  id_Putnik INT NOT NULL PRIMARY KEY,
  ime VARCHAR(45) NOT NULL,
  prezime VARCHAR(45) NOT NULL,
  telefon VARCHAR(45) NOT NULL,
  email VARCHAR(45),
  transport INT NOT NULL,
  INDEX k_transport (transport) ,
    FOREIGN KEY (transport)
    REFERENCES Transport (id_Transport)
)ENGINE = InnoDB;


DROP TABLE IF EXISTS Rezervise ;

CREATE TABLE IF NOT EXISTS Rezervise (
  putnik INT NOT NULL ,
  putovanje INT NOT NULL,
  INDEX k_putovanje (putovanje) ,
  INDEX k_putnik (putnik) ,
    FOREIGN KEY (putovanje)
    REFERENCES Putovanje (id_Putovanje)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
      FOREIGN KEY (putnik)
    REFERENCES Putnik (id_Putnik)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)ENGINE = InnoDB;



DROP TABLE IF EXISTS Aranzman ;

CREATE TABLE IF NOT EXISTS Aranzman (
  id_Aranzman INT NOT NULL PRIMARY KEY,
  nacinPlacanja VARCHAR(45) NOT NULL,
  iznos INT NOT NULL
)ENGINE = InnoDB;


DROP TABLE IF EXISTS Uplacuje ;

CREATE TABLE IF NOT EXISTS Uplacuje (
  putnik INT NOT NULL ,
  aranzman INT NOT NULL,
  INDEX k_putnik (putnik) ,
  INDEX k_aranzman (aranzman) ,
    FOREIGN KEY (putnik)
    REFERENCES Putnik (id_Putnik)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
      FOREIGN KEY (aranzman)
    REFERENCES Aranzman (id_Aranzman)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)ENGINE = InnoDB;

DROP TABLE IF EXISTS Odlazi ;

CREATE TABLE IF NOT EXISTS Odlazi (
  putnik INT NOT NULL ,
  aranzman INT NOT NULL,
  putovanje INT NOT NULL,
  INDEX k_putnik (putnik) ,
  INDEX k_aranzman (aranzman) ,
  INDEX k_putovanje (putovanje),
    FOREIGN KEY (putnik)
    REFERENCES Putnik (id_Putnik)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
      FOREIGN KEY (aranzman)
    REFERENCES Aranzman (id_Aranzman)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    FOREIGN KEY (putovanje)
    REFERENCES Putovanje (id_Putovanje)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)ENGINE = InnoDB;
