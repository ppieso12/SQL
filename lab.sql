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

















































