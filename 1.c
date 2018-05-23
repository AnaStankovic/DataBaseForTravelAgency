#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <mysql.h>
#include <stdarg.h>
#include <errno.h>


#define QUERY_SIZE 1024



static void error_fatal (char *format, ...)
{
  va_list arguments;		
  
  va_start (arguments, format);
  vfprintf (stderr, format, arguments);
  va_end (arguments);


  exit (EXIT_FAILURE);
}

int main(int argc, char **argv){
  
  MYSQL *konekcija;	
  MYSQL_RES *rezultat;	 
  MYSQL_ROW red;	
  MYSQL_FIELD *polje;	
  int i;		
  int broj;			

  char upit[QUERY_SIZE];	
 
  
  konekcija = mysql_init (NULL);
  if (mysql_real_connect
      (konekcija, "localhost", "root", "", "Turisticke_agencije", 0, NULL,
       0) == NULL)
      error_fatal ("Doslo je do greske u konekciji. %s\n", mysql_error (konekcija));


  /*-- Prvi upit rezervise putovanje putnika sa nekim id_putnik za putovanje sa id_putovanja
  Unosimo putnika i putovanje u tabeli Rezervise
  Pre unosa se proverava prvi triger da li ima slobodnih mesta za Putovanje
  posle unosa se aktivira drugi triger i broj slobodnih mesta smanji za jedan*/
  sprintf(upit,"insert into Rezervise values (89,45)");
   if (mysql_query (konekcija, upit) != 0)
    error_fatal ("Greska pri unosu rezervacije! %s\n", mysql_error (konekcija));
  broj = mysql_affected_rows(konekcija);
  printf ("Rezervisano je: %d putovanje\n", broj);
  
  /*
  Izdvojimo za sve putnike putovanja na koja odlaze
  */
  
  sprintf(upit,"select ime,  nazivPutovanja from Putnik p, Odlazi o,Putovanje pa where p.id_Putnik = o.putnik and pa.id_Putovanje = o.putovanje");
   if (mysql_query (konekcija, upit) != 0)
    error_fatal ("Greska pri izdvajanju putovanja za sve putnike! %s\n", mysql_error (konekcija));
  
  rezultat = mysql_use_result (konekcija);
  polje = mysql_fetch_field (rezultat);
  printf("%s\t%s\n", polje[0].name, polje[1].name);
   
   
  broj = mysql_num_fields (rezultat);
   while ((red = mysql_fetch_row (rezultat)) != 0){
      for (i = 0; i < broj; i++)
	printf ("%s\t", red[i]);
      printf ("\n");
    }
  mysql_free_result (rezultat);
     
     
  /*Unosimo za Putnika sa rednim brojem 111 mail*/
  sprintf(upit,"update Putnik set email='mica@gmail.com' where id_Putnik = 111");
  if (mysql_query (konekcija, upit) != 0)
  error_fatal ("Greska pri unosu maila za putnika! %s\n", mysql_error (konekcija));
  broj = mysql_affected_rows(konekcija);
  printf ("Unesen je %d mail\n", broj);
     
     
  /*izdvajamo sve putnike koji su platili aranzman kesom*/
   sprintf(upit,"select p.ime, p.prezime from Putnik p, Uplacuje u, Aranzman a where p.id_Putnik = u.putnik and a.id_Aranzman = u.aranzman  and a.nacinPlacanja = 'kesom'");
   if (mysql_query (konekcija, upit) != 0)
    error_fatal ("Greska pri izdvajanju putnika koji su platili aranzman kesom! %s\n", mysql_error (konekcija));
  
   rezultat = mysql_use_result (konekcija);
   polje = mysql_fetch_field (rezultat);
   printf("%s\t%s\n", polje[0].name, polje[1].name);
   
   
    broj = mysql_num_fields (rezultat);
     while ((red = mysql_fetch_row (rezultat)) != 0){
      for (i = 0; i < broj; i++)
	printf ("%s\t", red[i]);
      printf ("\n");
    }
    mysql_free_result (rezultat);
     
  
     
      mysql_close (konekcija);
      exit(EXIT_SUCCESS);
}
