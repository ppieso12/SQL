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

2.6.5
select nazwa, koszt, masa from czekoladki 
where masa between 25 and 35 and koszt not between 0.15 and 0.24 and koszt not between 0.25 and 0.35;
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
where nazwa like 'S% m%';
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

4.2.3★ zostały złożone przez klienta z Krakowa do realizacji w listopadzie 2013 roku.
select idzamowienia, datarealizacji, nazwa, miejscowosc from zamowienia natural join klienci 
where extract(month from datarealizacji) = 11 and
extract(year from datarealizacji) = 2013 and
miejscowosc similar to 'Krak(ó|o)w';



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

4.3.3 złożyli przynajmniej jedno zamówienie,
SELECT distinct k.nazwa, k.ulica, miejscowosc FROM klienci k NATURAL JOIN zamowienia z;

4.3.4  --NA ZŁĄCZENIU ZEW LEWYM LUB FULL JOIN LUB EXCEPT
--złączenie zewnętrzne
SELECT k.nazwa, k.ulica FROM klienci k LEFT JOIN zamowienia z USING(idklienta)
where z is null;

SELECT k.nazwa, k.ulica FROM klienci k 
EXCEPT SELECT k.nazwa, k.ulica FROM klienci k NATURAL JOIN zamowienia;

SELECT k.nazwa, k.ulica FROM klienci k full join zamowienia z using(idklienta)
where z is null;

SELECT k.nazwa, k.ulica FROM klienci k 
EXCEPT SELECT k.nazwa, k.ulica FROM klienci k JOIN zamowienia z using(idklienta);

SELECT k.nazwa, k.ulica FROM klienci k 
EXCEPT SELECT k.nazwa, k.ulica FROM klienci k JOIN zamowienia z ON k.idklienta = z.idklienta;

4.3.5★ złożyli zamówienia z datą realizacji w listopadzie 2013,
SELECT k.nazwa, k.ulica, z.idzamowienia, z.datarealizacji FROM klienci k NATURAL JOIN zamowienia z
where extract(year from z.datarealizacji) = 2013 and extract(month from z.datarealizacji) = 11;

4.3.6★ zamówili co najmniej 2 sztuki pudełek Kremowa fantazja lub Kolekcja jesienna w ramach jednego zamówienia

SELECT k.nazwa, k.ulica, z.idzamowienia, z.datarealizacji, a.sztuk, p.nazwa FROM klienci k JOIN zamowienia z USING(idklienta) 
JOIN artykuly a USING(idzamowienia) JOIN pudelka p USING(idpudelka)
where a.sztuk >= 2 and p.nazwa in ('Kremowa fantazja','Kolekcja jesienna');

4.3.7★ klienci zamówili pudełka, które zawierają czekoladki z migdałami.
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

4.6.1  należy użyć samozłączeń (złączeń własnych).  !!!!!!
Wyświetl wartości kluczy głównych oraz nazwy czekoladek, których koszt 
jest większy od kosztu czekoladki o wartości klucza głównego równej d08.

select c1.idczekoladki as "ID1", c1.nazwa, c1.koszt as "Koszt1", c2.idczekoladki as "ID2", c2.koszt as "Koszt2"
from czekoladki c1, czekoladki c2
where c2.idczekoladki like 'd08' and c1.koszt > c2.koszt;


select idczekoladki, nazwa, koszt  from czekoladki 
where koszt > (select koszt from czekoladki where idczekoladki = 'd08');

4.6.2 Kto (nazwa klienta) złożył zamówienia na takie same czekoladki (pudełka) jak zamawiała Górka Alicja.

select distinct k2.nazwa
from klienci k1 natural join zamowienia z1 natural join artykuly a1,
klienci k2 natural join zamowienia z2 natural join artykuly a2
where k1.nazwa like 'Górka Alicja' and a1.idpudelka = a2.idpudelka
order by 1;


with alicja as (select p.idpudelka from pudelka p JOIN artykuly a using(idpudelka) JOIN zamowienia z using(idzamowienia)
           JOIN klienci k using(idklienta) where k.nazwa = 'Górka Alicja')
select k.nazwa, p.idpudelka from pudelka p JOIN artykuly a using(idpudelka) JOIN zamowienia z using(idzamowienia)
JOIN klienci k using(idklienta) JOIN alicja using(idpudelka);


4.6.3 Kto (nazwa klienta, adres) złożył zamówienia na takie same czekoladki (pudełka) jak zamawiali klienci z Katowic.

select distinct k1.miejscowosc, k2.nazwa,(k2.ulica || ' ' || k2.miejscowosc || ' ' || k2.kod) as "Adres"
from klienci k1 natural join zamowienia z1 natural join artykuly a1,
klienci k2 natural join zamowienia z2 natural join artykuly a2
where k1.miejscowosc like 'Katowice' and a1.idpudelka = a2.idpudelka




with klient as (select p.idpudelka from pudelka p JOIN artykuly a using(idpudelka) JOIN zamowienia z using(idzamowienia)
           JOIN klienci k using(idklienta) where k.miejscowosc = 'Katowice')
select k.nazwa, k.miejscowosc from pudelka p JOIN artykuly a using(idpudelka) JOIN zamowienia z using(idzamowienia)
JOIN klienci k using(idklienta) JOIN klient using(idpudelka) where k.miejscowosc != 'Katowice';
-------_######---------
5.1.1 łącznej liczby czekoladek w bazie danych,

SELECT count(*) FROM czekoladki;

5.1.2
SELECT count(*) FROM czekoladki WHERE nadzienie IS NOT NULL;
SELECT count(nadzienie) FROM czekoladki;

5.1.3 pudełka, w którym jest najwięcej czekoladek (uwaga: konieczne jest użycie LIMIT),

SELECT z.sztuk, p.nazwa, p.opis FROM pudelka p JOIN zawartosc z using(idpudelka)
ORDER BY z.sztuk DESC LIMIT 1;

SELECT z.sztuk, p.nazwa, p.opis FROM pudelka p JOIN zawartosc z using(idpudelka)
WHERE z.sztuk = (SELECT MAX(z.sztuk) FROM zawartosc z);

5.1.4 ★ łącznej liczby czekoladek w poszczególnych pudełkach,
select p.idpudelka, sum(z.sztuk) from pudelka p JOIN zawartosc z using(idpudelka)
GROUP BY p.idpudelka;

select idpudelka, sum(sztuk) from zawartosc
group by idpudelka;
--select p.nazwa, z.sztuk from pudelka p JOIN zawartosc z using(idpudelka);

★ łącznej liczby czekoladek bez orzechów w poszczególnych pudełkach,
---select p.idpudelka, count(c) from pudelka p JOIN zawartosc z using(idpudelka) JOIN czekoladki c using(idczekoladki)
---WHERE c.orzechy is null
---GROUP BY p.idpudelka;

to raczej dobrze
select z.idpudelka, sum(sztuk) from zawartosc z JOIN czekoladki c using(idczekoladki)
where c.orzechy is  null
group by z.idpudelka;



★ łącznej liczby czekoladek w mlecznej czekoladzie w poszczególnych pudełkach.
select p.nazwa, sum(z.sztuk) from pudelka p natural join zawartosc z join czekoladki c using(idczekoladki)
where c.czekolada = 'mleczna'
group by p.nazwa;

select p.nazwa, sum(sztuk) from pudelka p JOIN zawartosc z using(idpudelka) JOIN czekoladki c using(idczekoladki)
WHERE c.czekolada ='mleczna'
GROUP BY p.nazwa;


5.2.1 masy poszczególnych pudełek,
SELECT SUM(c.masa*z.sztuk) as waga, p.nazwa FROM pudelka p JOIN zawartosc z using(idpudelka) JOIN czekoladki c using(idczekoladki)
GROUP BY p.nazwa;

SELECT SUM(c.masa*z.sztuk) as waga, p.nazwa, p.cena, p.stan FROM pudelka p JOIN zawartosc z using(idpudelka) JOIN czekoladki c using(idczekoladki)
GROUP BY 2,3,4;

SELECT SUM(c.masa*z.sztuk) as waga, z.idpudelka from zawartosc z JOIN czekoladki c using(idczekoladki)
GROUP BY z.idpudelka;

5.2.2 pudełka o największej masie,

with maxim as (SELECT SUM(c.masa*z.sztuk) summ,p.nazwa, p.idpudelka FROM pudelka p 
                                JOIN zawartosc z using(idpudelka) JOIN czekoladki c using(idczekoladki) GROUP BY p.nazwa, p.idpudelka)
Select m.summ, m.nazwa, m.idpudelka from maxim m
where m.summ = (Select max(m.summ) from maxim m);


SELECT SUM(c.masa*z.sztuk) as waga, p.nazwa FROM pudelka p JOIN zawartosc z using(idpudelka) JOIN czekoladki c using(idczekoladki)
GROUP BY p.nazwa
ORDER BY SUM(c.masa*z.sztuk) desc LIMIT 1;


select pud.waga, pud.nazwa from
(select sum(c.masa*z.sztuk) waga, p.nazwa nazwa from pudelka p JOIN zawartosc z using(idpudelka) JOIN czekoladki c using(idczekoladki)
group by p.nazwa) pud
where pud.waga = (select max(sumy.waga) from (select sum(c.masa*z.sztuk) waga, p.nazwa nazwa from pudelka p JOIN zawartosc z using(idpudelka) JOIN czekoladki c using(idczekoladki)
group by p.nazwa) sumy);



5.2.3 średniej masy pudełka w ofercie cukierni,
with maxim as (SELECT SUM(c.masa*z.sztuk) summ FROM pudelka p 
                                natural join zawartosc z JOIN czekoladki c using(idczekoladki) GROUP BY p.idpudelka)
Select avg(summ) from maxim;



select avg(pudel.suma) from (SELECT sum(sztuk*masa) suma from zawartosc JOIN czekoladki using(idczekoladki) GROUP BY idpudelka)
pudel;


5.2.4★ średniej wagi pojedynczej czekoladki w poszczególnych pudełkach,
--poszczegolne masy czeko w pudelkach
SELECT c.nazwa,c.masa FROM pudelka p 
                                JOIN zawartosc z using(idpudelka) JOIN czekoladki c using(idczekoladki) 
                                where p.idpudelka = 'supr' GROUP BY c.nazwa, c.masa;
--dobrze                                
SELECT avg(c.masa) summ, p.idpudelka, p.nazwa FROM pudelka p 
                                JOIN zawartosc z using(idpudelka) JOIN czekoladki c using(idczekoladki) GROUP BY p.idpudelka;


5.3.1
SELECT datarealizacji, count(*) FROM zamowienia
GROUP BY datarealizacji
ORDER BY datarealizacji;

5.3.2 łącznej liczby wszystkich zamówień
SELECT count(*) FROM zamowienia;

5.3.3 ★ łącznej wartości wszystkich zamówień


select a.idzamowienia, sum(a.sztuk*p.cena) from artykuly a natural join pudelka p group by a.idzamowienia; 


SELECT a.idzamowienia, sum(a.sztuk*p.cena)
from artykuly a JOIN pudelka p USING(idpudelka)
GROUP BY a.idzamowienia 
ORDER BY a.idzamowienia;
                                   
5.3.4 ★ klientów, liczby złożonych przez nich zamówień i łącznej wartości złożonych przez nich zamówień.

select k.nazwa, count(z), sum(a.sztuk*p.cena) from klienci k join zamowienia z using(idklienta) join artykuly a using(idzamowienia)
join pudelka p using(idpudelka)
group by k.nazwa;


SELECT k.nazwa,count(z.idzamowienia), sum(a.sztuk*p.cena) from klienci k JOIN zamowienia z USING(idklienta) JOIN artykuly a 
USING(idzamowienia) JOIN pudelka p USING(idpudelka)
GROUP BY k.nazwa
ORDER BY k.nazwa;


5.4.1 czekoladki, która występuje w największej liczbie pudełek 
with policzone as (SELECT c.nazwa as czekoladka, count(p) as liczba_p FROM pudelka p natural join zawartosc z JOIN czekoladki c USING(idczekoladki)
GROUP BY c.nazwa ORDER BY 2 DESC)

SELECT pol.czekoladka, pol.liczba_p FROM policzone pol
where pol.liczba_p = (select max(pol.liczba_p) from policzone pol);

5.4.2 pudełka, które zawiera najwięcej czekoladek bez orzechów
with bezorzechow as (select p.nazwa, sum(z.sztuk) as ilosc from pudelka p natural join zawartosc z join czekoladki c using(idczekoladki)
                    where c.orzechy is null group by 1 order by 2 desc)
select b.nazwa, b.ilosc as "bez orzechow" from bezorzechow b
where b.ilosc = (select max(b.ilosc) from bezorzechow b);
 

5.4.3czekoladki, która występuje w najmniejszej liczbie pudełek,
with najmniej as (select nazwa, sum(sztuk) as liczba from czekoladki natural join zawartosc group by 1 order by 2 asc)
select n.nazwa, n.liczba from najmniej n
where n.liczba = (select min(n.liczba) from najmniej n);


5.4.4
★ pudełka, które jest najczęściej zamawiane przez klientów.  --!!!!aggregate functions are not allowed in WHERE
with najczesciej as (select p.nazwa, sum(a.sztuk) as suma from pudelka p natural join artykuly a group by 1 order by 2)
select naj.nazwa, naj.suma from najczesciej naj
where naj.suma = (select max(naj.suma) from najczesciej naj);



SELECT p.nazwa, count(p.idpudelka) from pudelka p JOIN artykuly a USING(idpudelka)
GROUP BY p.nazwa
ORDER BY 2 desc;

5.5.1
select extract(quarter from datarealizacji) as kwartal, count(idzamowienia)
from zamowienia
group by 1
order by 1;

5.5.2 liczby zamówień na poszczególne miesiące,
select extract(month from datarealizacji) as miesiac, extract(year from datarealizacji) as rok, count(idzamowienia)
from zamowienia
group by 1,2   --TRZEBA PO 2 KOLUMNACH GRUPOWAC
order by 1;

5.5.3 liczby zamówień na poszczególne tyg,
select extract(week from datarealizacji) as tydzein,extract(month from datarealizacji) as mies, extract(year from datarealizacji) as rok,
count(idzamowienia)
from zamowienia
group by 1,2,3
order by 1;


5.5.4 liczby zamówień do realizacji w poszczególnych miejscowościach. WAZNE
select miejscowosc, count(z) from klienci natural join zamowienia z
group by miejscowosc;  




5.6.1 łącznej masy wszystkich pudełek czekoladek znajdujących się w cukierni
select sum(boxes.wagi) from (select sum(sztuk*masa)*p.stan as wagi from zawartosc join czekoladki using(idczekoladki) 
                             join pudelka p using(idpudelka) group by p.idpudelka) boxes;
                             
5.6.2  łącznej wartości wszystkich pudełek czekoladek znajdujących się w cukierni.                           
select sum(cena*stan) from pudelka;



5.7.1 zysk ze sprzedaży jednej sztuki poszczególnych pudełek (różnica między ceną pudełka i kosztem jego wytworzenia),
SELECT p.nazwa, p.cena - sum(z.sztuk*c.koszt) FROM pudelka p JOIN zawartosc z USING(idpudelka) JOIN czekoladki c USING(idczekoladki)
GROUP BY p.nazwa, p.cena;

5.7.2zysk ze sprzedaży zamówionych pudełek,
select a.idzamowienia, sum(wartosci.cena - wartosci.koszt) from 
(select p.idpudelka as idpudelka, p.cena, sum(z.sztuk*c.koszt) as koszt from pudelka p natural join zawartosc z join czekoladki c using(idczekoladki) 
group by p.idpudelka)
wartosci join artykuly a using(idpudelka) group by a.idzamowienia;


with zy as(SELECT p.cena - sum(z.sztuk*c.koszt) as zysk, p.idpudelka
                                    FROM pudelka p JOIN zawartosc z USING(idpudelka) JOIN czekoladki c USING(idczekoladki)
GROUP BY  p.idpudelka, p.cena) 
SELECT a.idzamowienia, sum(a.sztuk*zysk)
FROM artykuly a JOIN zy USING(idpudelka)
GROUP BY a.idzamowienia
ORDER BY a.idzamowienia asc;

5.7.3
★ zysk ze sprzedaży wszystkich pudełek czekoladek w cukierni. 
select sum(suma.cale) from (
select (p.cena - sum(z.sztuk*c.koszt))*p.stan as cale from pudelka p natural join zawartosc z join czekoladki c using(idczekoladki)
group by idpudelka) suma;





-- nie zrobione
with zy as(SELECT p.cena - sum(z.sztuk*c.koszt) as zysk, p.idpudelka
                                    FROM pudelka p JOIN zawartosc z USING(idpudelka) JOIN czekoladki c USING(idczekoladki)
GROUP BY  p.idpudelka, p.cena) 
SELECT sum((SELECT sum(a.sztuk*zysk) as zzzz
FROM artykuly a JOIN zy USING(idpudelka)
GROUP BY a.idzamowienia
ORDER BY a.idzamowienia asc));

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
6.4.4
update klienci set miejscowosc = 'Piotrograd' where miejscowosc = 'Leningrad';

6.4.5 ★ Podniesienie kosztu czekoladek, których dwa ostatnie znaki identyfikatora (idczekoladki) są większe od 90, o 15 groszy.
SUBSTR!!!!
update czekoladki set koszt = koszt + 0.15 where substr(idczekoladki,2,2)::integer > 90;
6.5
DELETE FROM klienci WHERE nazwa similar to 'Matusiak%';

6.6





KOLOSOWE
select extract(quarter from (select date '2001-09-28' - interval '1 hour'));

trim([leading | trailing | both] [characters] from string)   -- usiniecei wskazanego znaku

Operator overlaps pozwala sprawdzic, czy dwa okresy nachodza na siebie:  --CASEselect ( case when (('2005-5-11'::date, '2005-5-18'::date) overlaps ('2005-5-13'::date, '2005-5-14'::date) = true) then 1 else 0 end);

select ('2005-5-11'::timestamp, '2005-5-18'::timestamp) overlaps ('2006-5-13'::timestamp, '2006-5-14'::timestamp);

select extract( hour from now());


filtrowanie wartości funkcji agregujących, używa się do tego HAVING zamiast WHERE:
 
1B
with dni as (select czas_ostrzezenia, count(*) as ilosc from ostrzezenia where extract(year from czas_ostrzezenia) = 2016
             group by czas_ostrzezenia)
select d.czas_ostrzezenia, d.ilosc from dni d where d.ilosc = (select max(d.ilosc) from dni d);
    
       
---all warnings       
select czas_ostrzezenia, count(*) as ilosc from ostrzezenia 
             group by czas_ostrzezenia;

1A
select r.nazwa from rzeki r natural join punkty_pomiarowe p join gminy g using(id_gminy) join 
powiaty p using(id_powiatu) join wojewodztwa w using(id_wojewodztwa) join ostrzezenia o using(id_ostrzezenia)
where w.nazwa = 'Małopolskie' and extract(year from o.czas_ostrzezenia) = 2016 and  extract(month from o.czas_ostrzezenia) = 4;
except
select r.nazwa from rzeki r natural join punkty_pomiarowe p join ostrzezenia o using(id_ostrzezenia)
where o.przekroczony_stan_alarm is not null;


select r.nazwa 
from wojewodztwa w 
     join powiaty p on (w.identyfikator = p.id_wojewodztwa) 
     join gminy g on (p.identyfikator = g.id_powiatu) 
     join punkty_pomiarowe pp on (pp.id_gminy = g.identyfikator)
     join rzeki r on (pp.id_rzeki = r.id_rzeki)
     join ostrzezenia o on (o.id_punktu = pp.id_punktu)
--where extract(year from o.czas_ostrzezenia) = 2016 and  extract(month from o.czas_ostrzezenia) = 4
except
select r.nazwa from rzeki r natural join punkty_pomiarowe p natural join ostrzezenia o 
where o.przekroczony_stan_alarm is not null;


select r.nazwa, w.nazwa, count(o.przekroczony_stan_alarm)
from wojewodztwa w 
     join powiaty p on (w.identyfikator = p.id_wojewodztwa) 
     join gminy g on (p.identyfikator = g.id_powiatu) 
     join punkty_pomiarowe pp on (pp.id_gminy = g.identyfikator)
     join rzeki r on (pp.id_rzeki = r.id_rzeki)
     join ostrzezenia o on (o.id_punktu = pp.id_punktu)
     group by 1,2;

select r.nazwa, w.nazwa, o.zmiana_poziomu
from wojewodztwa w 
     join powiaty p on (w.identyfikator = p.id_wojewodztwa) 
     join gminy g on (p.identyfikator = g.id_powiatu) 
     join punkty_pomiarowe pp on (pp.id_gminy = g.identyfikator)
     join rzeki r on (pp.id_rzeki = r.id_rzeki)
     join ostrzezenia o on (o.id_punktu = pp.id_punktu)
     where o.przekroczony_stan_alarm is not null;



10.2.1

select idzamowienia, datarealizacji from zamowienia
where idklienta in (select idklienta from klienci where nazwa ~'Antoni');

10.2.2 klienci z meiszkan

select idzamowienia, datarealizacji from zamowienia
where idklienta in (select idklienta from klienci where ulica ~'/');

10.2.3 zostały złożone przez klienta z Krakowa do realizacji w listopadzie 2013 roku

select idzamowienia, datarealizacji from zamowienia
where idklienta in (select idklienta from klienci where miejscowosc ~'Kraków') and
 extract(month from datarealizacji) = 11 and extract(year from datarealizacji) = 2013;
 
 
 Napisz zapytanie wyświetlające informacje na temat pudełek z czekoladkami (nazwa, opis, cena),
 używając odpowiedniego operatora, np. in/not in/exists/any/all, które:
 10.4.7 nie zawierają czekoladek w gorzkiej czekoladzie,
 
 select distinct p.nazwa from pudelka p natural join zawartosc z 
 where idczekoladki not in
 (select idczekoladki from czekoladki where czekolada ~'gorzka');
 
 10.4.8 nie zawierają czekoladek z orzechami
 
 
 
 
 
 
 
 
 
 
 
 
 
 





































