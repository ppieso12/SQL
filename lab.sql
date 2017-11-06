2.1
select nazwa, ulica, miejscowosc from klienci order by miejscowosc desc, nazwa asc;


2.1.3
select * from klienci where miejscowosc = 'Warszawa' or miejscowosc = 'Kraków' order by miejscowosc desc, nazwa asc;

select * from klienci where miejscowosc in ('Warszawa', 'Kraków') order by miejscowosc desc, nazwa asc;


2.2.1
select nazwa, masa from czekoladki where masa > 20;

select nazwa, masa, koszt from czekoladki where masa > 20 and koszt > 25;

select nazwa, masa, koszt*100 as koszt from czekoladki where masa > 20 and koszt > 0.25;

2.2.4

select nazwa, czekolada, orzechy, nadzienie from czekoladki where czekolada ='mleczna' and nadzienie='maliny' or czekolada ='mleczna' and nadzienie='truskawki' or orzechy='laskowe' and czekolada!='gorzka';

select 2^20 as wynik;
select masa, nazwa from czekoladki where masa >= 14 and masa <= 24;

2.5
1
select idczekoladki as idCzekoladki, nazwa, czekolada, orzechy, nadzienie from czekoladki where orzechy is not null;
2
select idczekoladki as idCzekoladki, nazwa, czekolada, orzechy, nadzienie from czekoladki where orzechy is null;
3
select idczekoladki as idCzekoladki, nazwa, czekolada, orzechy, nadzienie from czekoladki where orzechy is not null or nadzienie is not null;
5
select idczekoladki as idCzekoladki, nazwa, czekolada, orzechy, nadzienie from czekoladki where orzechy is not null or nadzienie is not null;

\o wynik.html
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
3.2
1
select idczekoladki, nazwa, czekolada, orzechy, nadzienie from czekoladki
where nazwa like 'S%';
2
select idczekoladki, nazwa, czekolada, orzechy, nadzienie from czekoladki
where nazwa like 'S%i';
3
select idczekoladki, nazwa, czekolada, orzechy, nadzienie from czekoladki
where nazwa like 'S%_ma%';
4
select idczekoladki, nazwa, czekolada, orzechy, nadzienie from czekoladki
where nazwa similar to '(A|B|C)%';
5
select idczekoladki, nazwa, czekolada, orzechy, nadzienie from czekoladki
where nazwa similar to '%(O|o|)rzech%';
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
where koszt >= 0.15 and masa <= 0.24;
2 ale nie
select idczekoladki, nazwa, masa, koszt from czekoladki
where masa >= 25 and masa <= 35
except
select idczekoladki, nazwa, masa, koszt from czekoladki
where koszt >= 0.25 and koszt <= 0.35;
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

3.5
1

4.1
SELECT k.nazwa, z.idzamowienia, FROM klienci k, zamowienia z  
WHERE z.idklienta = k.idklienta;

4.2
4.2.1
SELECT k.nazwa, k.ulica, z.idzamowienia FROM klienci k JOIN zamowienia z
ON z.idklienta=k.idklienta and k.nazwa similar to '%Antoni';

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
SELECT k.nazwa, k.ulica FROM klienci k 
EXCEPT SELECT k.nazwa, k.ulica FROM klienci k NATURAL JOIN zamowienia;

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

SELECT p.nazwa, p.opis, c.nazwa as "nazwa cz3koladki" , p.cena FROM pudelka p JOIN zawartosc z using(idpudelka) JOIN czekoladki c using(idczekoladki)
where count(c.idczekoladki) = 4;

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








































