2.1
select nazwa, ulica, miejscowosc from klienci order by miejscowosc desc, nazwa asc;


2.1.3
select * from klienci where miejscowosc = 'Warszawa' or miejscowosc = 'Kraków' order by miejscowosc desc, nazwa asc;

select * from klienci where miejscowosc in ('Warszawa', 'Kraków') order by miejscowosc desc, nazwa asc;

2.1.5
select * from klienci where miejscowosc in ('Kraków') order by nazwa;

2.2.1
select nazwa, masa from czekoladki where masa > 20;

select nazwa, masa, koszt from czekoladki where masa > 20 and koszt > 0.25;

select nazwa, masa, koszt*100 as koszt from czekoladki where masa > 20 and koszt > 0.25;

2.2.4

select nazwa, czekolada, orzechy, nadzienie from czekoladki where czekolada ='mleczna' and nadzienie='maliny' or czekolada ='mleczna' and nadzienie='truskawki' or orzechy='laskowe' and czekolada!='gorzka';

select 2^20 as wynik;

select sqrt(3) as wynik;

select pi() as wynik;
select masa, nazwa from czekoladki where masa >= 14 and masa <= 24;

select idczekoladki, masa, nazwa, koszt from czekoladki where masa between 15 and 24 or koszt between 0.15 and 0.24;

2.5
1
select idczekoladki as idCzekoladki, nazwa, czekolada, orzechy, nadzienie from czekoladki where orzechy is not null;
2
select idczekoladki as idCzekoladki, nazwa, czekolada, orzechy, nadzienie from czekoladki where orzechy is null;
3
select idczekoladki as idCzekoladki, nazwa, czekolada, orzechy, nadzienie from czekoladki where orzechy is not null or nadzienie is not null;
4
select idczekoladki as idCzekoladki, nazwa, czekolada, orzechy, nadzienie from czekoladki 
where czekolada in ('mleczna','biała') and orzechy is null;
5
select idczekoladki as idCzekoladki, nazwa, czekolada, orzechy, nadzienie from czekoladki 
where czekolada not in ('mleczna','biała') and (orzechy is not null or nadzienie is not null);
9
select idczekoladki as idCzekoladki, nazwa, czekolada, orzechy, nadzienie from czekoladki 
where czekolada  in ('mleczna','biała') and nadzienie is null;

\o wynik.html
pierdoły ze skryptami
3.1
1
select idzamowienia, datarealizacji from zamowienia where datarealizacji >= '2013-11-12' and datarealizacji <= '2013-11-20';
2 
select idzamowienia, datarealizacji from zamowienia
where datarealizacji between '2013-12-01' and '2013-12-06' or datarealizacji between '2013-12-15' and '2013-12-20';
3
select idzamowienia, datarealizacji from zamowienia
where datarealizacji >= '2013-12-01' and datarealizacji <= '2013-12-31';
4
select idzamowienia, datarealizacji from zamowienia
where extract(year from datarealizacji) = 2013 and extract(month from datarealizacji) = 11;
5
select idzamowienia, datarealizacji from zamowienia
where extract(year from datarealizacji) = 2013 and extract(month from datarealizacji) in (11,12);

6  17, 18 lub 19 dnia miesiąca,
select idzamowienia, datarealizacji from zamowienia
where extract(day from datarealizacji) in (17,18,19);

7 - 46 lub 47 tygodniu roku
select idzamowienia, datarealizacji, extract(week from datarealizacji) as "nr tygodnia"  from zamowienia
where extract(week from datarealizacji) in (46,47);

3.2
1
select idczekoladki, nazwa, czekolada, orzechy, nadzienie from czekoladki
where nazwa like 'S%';
select idczekoladki, nazwa, czekolada, orzechy, nadzienie from czekoladki
where nazwa similar to 'S%';
2
select idczekoladki, nazwa, czekolada, orzechy, nadzienie from czekoladki
where nazwa like 'S%i';
3
select idczekoladki, nazwa, czekolada, orzechy, nadzienie from czekoladki
where nazwa like 'S%_m%';
4
select idczekoladki, nazwa, czekolada, orzechy, nadzienie from czekoladki
where nazwa similar to '(A|B|C)%';
5
select idczekoladki, nazwa, czekolada, orzechy, nadzienie from czekoladki
where nazwa similar to '%(O|o|)rzech%';
6
select idczekoladki, nazwa, czekolada, orzechy, nadzienie from czekoladki
where nazwa similar to 'S%m%';

insert into czekoladki(idczekoladki,nazwa,czekolada,orzechy,masa,opis,koszt)
values('h50','DMoja czeko','biala','laskowe',21,'testowy opis',0.50);

update czekoladki set nazwa = 'Kmoja czeko' 
where idczekoladki in ('h51');

8 nie rozpoczyna się żadną z liter: 'D'-'K', 'S' i 'T',
select idczekoladki, nazwa, czekolada, orzechy, nadzienie from czekoladki
where nazwa similar to '(D|E|F|G|H|I|J|K|S|T)%';

select idczekoladki, nazwa, czekolada, orzechy, nadzienie from czekoladki
where nazwa not between 'D' and 'K' and nazwa not similar to '(S|T|K)%';

select idczekoladki, nazwa, czekolada, orzechy, nadzienie from czekoladki
where nazwa > 'D';   - nazwa = Dmoja wchodzi!

10 składa się dokładnie z jednego słowa.

select idczekoladki, nazwa, czekolada, orzechy, nadzienie from czekoladki
where nazwa not similar to '% %';
3.3
1
select nazwa, miejscowosc from klienci
where miejscowosc similar to '% %';
2
select nazwa, miejscowosc, telefon from klienci
where length(telefon) = 13;
3.4
1 lub
select idczekoladki, nazwa, masa, koszt from czekoladki
where masa >= 15 and masa <= 24
union
select idczekoladki, nazwa, masa, koszt from czekoladki
where koszt >= 0.15 and koszt <= 0.24;

select idczekoladki, nazwa, masa, koszt from czekoladki
where masa >= 15 and masa <= 24 or koszt >= 0.15 and koszt <= 0.24;

2 ale nie
select idczekoladki, nazwa, masa, koszt from czekoladki
where masa >= 25 and masa <= 35
except
select idczekoladki, nazwa, masa, koszt from czekoladki
where koszt >= 0.25 and koszt <= 0.35;

select idczekoladki, nazwa, masa, koszt from czekoladki
where masa >= 25 and masa <= 35 and (koszt < 0.25 or koszt > 0.35);

3
select idczekoladki, nazwa, masa, koszt from czekoladki
where masa >= 15 and masa <= 24
intersect
select idczekoladki, nazwa, masa, koszt from czekoladki
where koszt >= 0.15 and koszt <= 0.24
union
select idczekoladki, nazwa, masa, koszt from czekoladki
where masa >= 25 and masa <= 35
intersect
select idczekoladki, nazwa, masa, koszt from czekoladki
where koszt >= 0.25 and koszt <= 0.35;

5
select idczekoladki, nazwa, masa, koszt from czekoladki
where masa >= 25 and masa <= 35
except
select idczekoladki, nazwa, masa, koszt from czekoladki
where koszt >= 0.15 and koszt <= 0.24
except
select idczekoladki, nazwa, masa, koszt from czekoladki
where koszt >= 0.29 and koszt <= 0.35;

3.5
1 identyfikatory klientów, którzy nigdy nie złożyli żadnego zamówienia
select idklienta from klienci 
except
select idklienta from zamowienia;

2 identyfikatory pudełek, które nigdy nie zostały zamówione
select idpudelka from pudelka 
except
select idpudelka from artykuly where idzamowienia is not null;

3 nazwy klientów, czekoladek i pudełek, które zawierają rz (lub Rz),
select nazwa from klienci where nazwa similar to '%(Rz|rz)%'
union
select nazwa from czekoladki where nazwa similar to '%(Rz|rz)%'
union
select nazwa from pudelka where nazwa similar to '%(Rz|rz)%';

4 identyfikatory czekoladek, które nie występują w żadnym pudełku.
select idczekoladki from czekoladki
except
select idczekoladki from zawartosc where idpudelka is not null;
 
3.6.1

select idmeczu, gospodarze[1] + gospodarze[2] + gospodarze[3] + coalesce(gospodarze[4], 0) + coalesce(gospodarze[5], 0) 
as "suma punktów zdobytych przez gospodarzy",
goscie[1] + goscie[2] + goscie[3] + coalesce(goscie[4], 0) + coalesce(goscie[5], 0)
as "suma punktów zdobytych przez gosci"
from siatkowka.statystyki;

3.6.2
select idmeczu, gospodarze[1] + gospodarze[2] + gospodarze[3] + coalesce(gospodarze[4], 0) + coalesce(gospodarze[5], 0) 
as "suma punktów zdobytych przez gospodarzy",
goscie[1] + goscie[2] + goscie[3] + coalesce(goscie[4], 0) + coalesce(goscie[5], 0)
as "suma punktów zdobytych przez gosci", gospodarze[5], goscie[5]
from siatkowka.statystyki
where gospodarze[5] is not null and goscie[5] is not null and gospodarze[5] >15 or goscie[5] >15;

||   KONKATENACJA

3.6.3  identyfikator i wynik meczu w formacie x:y, np. 3:1 (wynik jest pojedynczą kolumną – napisem),
select idmeczu, gospodarze[1] + gospodarze[2] + gospodarze[3] + coalesce(gospodarze[4], 0) + coalesce(gospodarze[5], 0)
|| ':' || goscie[1] + goscie[2] + goscie[3] + coalesce(goscie[4], 0) + coalesce(goscie[5], 0) as wynik
from siatkowka.statystyki; 

3.6.5
select idmeczu,gospodarze[1], gospodarze[1] + gospodarze[2] + gospodarze[3] + coalesce(gospodarze[4], 0) + coalesce(gospodarze[5], 0)
from siatkowka.statystyki
where sqrt(gospodarze[1]) < log(2,gospodarze[1] + gospodarze[2] + gospodarze[3] + coalesce(gospodarze[4], 0) + coalesce(gospodarze[5], 0));

4.1
SELECT k.nazwa, z.idzamowienia, FROM klienci k, zamowienia z   ILOCZYN KART k X z

4.2
4.2.1
SELECT k.nazwa, k.ulica, z.idzamowienia FROM klienci k JOIN zamowienia z
ON z.idklienta=k.idklienta where k.nazwa similar to '%Antoni';

SELECT k.nazwa, k.ulica, z.idzamowienia FROM klienci k JOIN zamowienia z
USING(idklienta) where k.nazwa similar to '%Antoni';

4.2.2
SELECT k.nazwa, k.ulica, z.idzamowienia FROM klienci k JOIN zamowienia z
ON z.idklienta=k.idklienta and k.ulica similar to '%/%';

4.2.3
SELECT k.nazwa, k.ulica, z.idzamowienia, z.datarealizacji FROM klienci k JOIN zamowienia z
ON z.idklienta=k.idklienta and extract(year from z.datarealizacji) = 2013 and extract(month from z.datarealizacji) = 11;

4.3.1

SELECT k.nazwa, k.ulica, z.idzamowienia, z.datarealizacji FROM klienci k JOIN zamowienia z
ON z.idklienta=k.idklienta and extract(year from z.datarealizacji) >= 2012;

SELECT k.nazwa, k.ulica, z.idzamowienia, z.datarealizacji FROM klienci k NATURAL JOIN zamowienia z
where extract(year from z.datarealizacji) >= 2012;
4.3.2
SELECT k.nazwa, k.ulica, z.idzamowienia, a.idpudelka, b.nazwa FROM klienci k JOIN zamowienia z 
using(idklienta) JOIN artykuly a using(idzamowienia) JOIN pudelka b using(idpudelka)
where b.nazwa similar to 'Kremowa fantazja' or b.nazwa similar to 'Kolekcja jesienna';

4.3.3
SELECT k.nazwa, k.ulica, z.idzamowienia, z.datarealizacji FROM klienci k NATURAL JOIN zamowienia z;

4.3.4  
złączenie zewnętrzne
SELECT k.nazwa, k.ulica FROM klienci k LEFT JOIN zamowienia z USING(idklienta)
where idzamowienia is null;

SELECT k.nazwa, k.ulica FROM klienci k 
EXCEPT SELECT k.nazwa, k.ulica FROM klienci k NATURAL JOIN zamowienia;

SELECT k.nazwa, k.ulica FROM klienci k 
EXCEPT SELECT k.nazwa, k.ulica FROM klienci k JOIN zamowienia z using(idklienta);

SELECT k.nazwa, k.ulica FROM klienci k 
EXCEPT SELECT k.nazwa, k.ulica FROM klienci k JOIN zamowienia z ON k.idklienta = z.idklienta;

4.3.5 złożyli zamówienia z datą realizacji w listopadzie 2013,
SELECT k.nazwa, k.ulica, z.idzamowienia, z.datarealizacji FROM klienci k NATURAL JOIN zamowienia z
where extract(year from z.datarealizacji) = 2013 and extract(month from z.datarealizacji) = 11;

4.3.6 zamówili co najmniej 2 sztuki pudełek Kremowa fantazja lub Kolekcja jesienna w ramach jednego zamówienia

SELECT k.nazwa, k.ulica, z.idzamowienia, z.datarealizacji, a.sztuk, p.nazwa FROM klienci k JOIN zamowienia z USING(idklienta) 
JOIN artykuly a USING(idzamowienia) JOIN pudelka p USING(idpudelka)
where a.sztuk >= 2 and p.nazwa in ('Kremowa fantazja','Kolekcja jesienna');

4.3.7 zamówili pudełka, które zawierają czekoladki z migdałami.
SELECT k.nazwa, k.ulica, z.idzamowienia, z.datarealizacji, a.sztuk, p.nazwa, c.orzechy FROM klienci k JOIN zamowienia z USING(idklienta) 
JOIN artykuly a USING(idzamowienia) JOIN pudelka p USING(idpudelka) JOIN zawartosc zaw USING(idpudelka) JOIN
czekoladki c USING(idczekoladki)
where c.orzechy = 'migdały';

4.4.1
SELECT p.nazwa, p.opis, c.nazwa FROM pudelka p JOIN zawartosc z using(idpudelka) JOIN czekoladki c using(idczekoladki);
4.4.2
SELECT p.nazwa, p.opis, c.nazwa FROM pudelka p JOIN zawartosc z using(idpudelka) JOIN czekoladki c using(idczekoladki)
where p.idpudelka similar to 'heav';

4.5.1

SELECT p.nazwa, p.opis, c.nazwa as "nazwa cz3koladki" , p.cena FROM pudelka p JOIN zawartosc z using(idpudelka) JOIN czekoladki c using(idczekoladki)
where c.idczekoladki similar to 'd09';

4.5.2

SELECT DISTINCT p.nazwa, p.opis, p.cena FROM pudelka p JOIN zawartosc z using(idpudelka) JOIN czekoladki c using(idczekoladki)
where c.nazwa similar to 'S%';

4.5.3

SELECT p.nazwa, p.opis, c.nazwa as "nazwa cz3koladki" , p.cena FROM pudelka p 
JOIN zawartosc z using(idpudelka) JOIN czekoladki c using(idczekoladki)
where count(c.idczekoladki) = 4;

4.5.4 zawierają czekoladki z nadzieniem truskawkowym,
SELECT p.nazwa, p.opis, c.nazwa as "nazwa cz3koladki" ,c.nadzienie, p.cena FROM pudelka p 
JOIN zawartosc z using(idpudelka) JOIN czekoladki c using(idczekoladki)
where c.nadzienie = 'truskawki';

4.5.5 nie zawierają czekoladek w gorzkiej czekoladzie,
SELECT p.nazwa, p.opis, c.nazwa as "nazwa cz3koladki" ,c.nadzienie,c.czekolada, p.cena FROM pudelka p 
JOIN zawartosc z using(idpudelka) JOIN czekoladki c using(idczekoladki)
EXCEPT 
SELECT p.nazwa, p.opis, c.nazwa as "nazwa cz3koladki" ,c.nadzienie,c.czekolada, p.cena FROM pudelka p 
JOIN zawartosc z using(idpudelka) JOIN czekoladki c using(idczekoladki)
where c.czekolada = 'gorzka';

SELECT p.nazwa, p.opis, c.nazwa as "nazwa cz3koladki" ,c.nadzienie,c.czekolada, p.cena FROM pudelka p 
JOIN zawartosc z using(idpudelka) JOIN czekoladki c using(idczekoladki)
where c.czekolada != 'gorzka';

4.5.6 zawierają co najmniej 3 sztuki czekoladki Gorzka truskawkowa
SELECT p.nazwa,c.nadzienie,c.czekolada,c.nazwa, p.cena, z.sztuk FROM pudelka p 
JOIN zawartosc z using(idpudelka) JOIN czekoladki c using(idczekoladki)
where c.nazwa = 'Gorzka truskawkowa' and z.sztuk >= 3;

4.6.1 Wyświetl wartości kluczy głównych oraz nazwy czekoladek, których koszt 
jest większy od kosztu czekoladki o wartości klucza głównego równej d08.
with p as (select koszt from czekoladki where idczekoladki = 'd08')
select idczekoladki, nazwa, koszt from czekoladki natural join p;


5.1.1

SELECT count(*) FROM czekoladki;

5.1.2
SELECT count(*) FROM czekoladki WHERE nadzienie IS NOT NULL;
SELECT count(nadzienie) FROM czekoladki;

5.1.3 pudełka, w którym jest najwięcej czekoladek (uwaga: konieczne jest użycie LIMIT),

SELECT z.sztuk, p.nazwa, p.opis FROM pudelka p JOIN zawartosc z using(idpudelka)
ORDER BY z.sztuk DESC LIMIT 1;

SELECT z.sztuk, p.nazwa, p.opis FROM pudelka p JOIN zawartosc z using(idpudelka)
WHERE z.sztuk = (SELECT MAX(z.sztuk) FROM zawartosc z);


5.2.1 masy poszczególnych pudełek,
SELECT SUM(c.masa*z.sztuk) as waga, p.nazwa FROM pudelka p JOIN zawartosc z using(idpudelka) JOIN czekoladki c using(idczekoladki)
GROUP BY p.nazwa;

5.2.2 pudełka o największej masie,
to zle
SELECT SUM(c.masa*z.sztuk) as waga, p.nazwa FROM pudelka p JOIN zawartosc z using(idpudelka) JOIN czekoladki c using(idczekoladki)
GROUP BY p.nazwa
HAVING SUM(c.masa*z.sztuk) > SUM(c.masa*z.sztuk)
ORDER BY SUM(c.masa*z.sztuk) desc;

SELECT SUM(c.masa*z.sztuk) as waga, p.nazwa FROM pudelka p JOIN zawartosc z using(idpudelka) JOIN czekoladki c using(idczekoladki)
GROUP BY p.nazwa
ORDER BY SUM(c.masa*z.sztuk) desc LIMIT 1;

5.3.1
SELECT datarealizacji, count(*) FROM zamowienia
GROUP BY datarealizacji
ORDER BY datarealizacji;

5.3.2
SELECT count(*) FROM zamowienia;

5.4.1 czekoladki, która występuje w największej liczbie pudełek 

SELECT c.nazwa as czekoladka, count(c.nazwa) FROM pudelka p
JOIN zawartosc z USING(idpudelka)
JOIN czekoladki c USING(idczekoladki)
GROUP BY c.nazwa
ORDER BY count(c.nazwa) DESC;

6.1.1

insert into czekoladki(idczekoladki,nazwa,czekolada,orzechy,nadzienie,opis,koszt,masa)
values('W98','Biały kieł','biała','laskowe','marcepan','Rozpływające się w rękach i kieszeniach',0.45,20);

insert into klienci(idklienta,nazwa,ulica,miejscowosc,kod,telefon)
values('90','Matusiak Edward','Kropiwnickiego 6/3','Leningrad','31-471','031 423 45 38');

insert into klienci(idklienta,nazwa,ulica,miejscowosc,kod,telefon)
values('91','Matusiak Alina','Kropiwnickiego 6/3','Leningrad','31-471','031 423 45 38');

insert into klienci(idklienta,nazwa,ulica,miejscowosc,kod,telefon)
values('92','Kimono Franek','Karateków 8','Mistrz','30-029','501 498 324');

select * from klienci where idklienta between 90 and 93;

insert into klienci(idklienta,nazwa,ulica,miejscowosc,kod,telefon)
values('93','Matusiak Iza',
       (SELECT ulica from klienci where nazwa = 'Matusiak Edward'),
       (SELECT miejscowosc from klienci where nazwa = 'Matusiak Edward'),
       (SELECT kod from klienci where nazwa = 'Matusiak Edward'),
       (SELECT telefon from klienci where nazwa = 'Matusiak Edward')
      );
 6.2.1
insert into czekoladki(idczekoladki,nazwa,czekolada,orzechy,nadzienie,opis,koszt,masa)
values('x91','Nieznana Nieznajoma',NULL,NULL,NULL,'Niewidzialna czekoladka wspomagajaca odchudzanie',0.26,0);

insert into czekoladki(idczekoladki,nazwa,czekolada,orzechy,nadzienie,opis,koszt,masa)
values('M98','Mleczny Raj','Mleczna',NULL,NULL,'Aksamitna mleczna czekolada w ksztalcie butelki z mlekiem',0.26,36);

select * from czekoladki where idczekoladki = 'x91' or idczekoladki = 'M98';

6.3.1
delete from czekoladki where idczekoladki = 'x91' or idczekoladki = 'M98';

na odwrot
insert into czekoladki values('x91','Nieznana Nieznajoma',NULL,NULL,NULL,'Niewidzialna czekoladka wspomagajaca odchudzanie',0.26,0);

insert into czekoladki values('M98','Mleczny Raj','Mleczna',NULL,NULL,'Aksamitna mleczna czekolada w ksztalcie butelki z mlekiem',0.26,36);

6.4.1

update klienci set nazwa = 'Nowak Iza' 
where nazwa = 'Matusiak Iza';

6.4.2
update czekoladki set koszt = koszt*0.9 
where idczekoladki in ('x91','M98','W98');

6.4.3
update czekoladki set koszt = 
(SELECT koszt from czekoladki where idczekoladki = 'W98')
where nazwa = 'Nieznana Nieznajoma';

select * from czekoladki where idczekoladki in ('x91','W98','M98');


6.5
DELETE FROM klienci WHERE nazwa similar to 'Matusiak%';

6.6
















 
       
       
       
       





































