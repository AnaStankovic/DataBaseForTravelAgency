DIR = turisticka_agencija
PROGRAM = turisticka_agencija.out
SRC = 1.c
FLAGS = -g -Wall `mysql_config --cflags --libs`

.PHONY: all create trigger insert clean program

all: create trigger insert $(PROGRAM) 

$(PROGRAM): $(SRC)
	gcc $(SRC) -o $(PROGRAM) $(FLAGS)

create:
	mysql -u root -p < 'TuristickaAgencija/create.sql'
	
insert: trigger
	mysql -u root -p -D Turisticke_agencije < 'TuristickaAgencija/trigger.sql'
	
trigger:
	mysql -u root -p -D Turisticke_agencije < 'TuristickaAgencija/insert.sql'
	
clean:
	-rm -f *.mwb.bak