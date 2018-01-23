
drop table kwiaciarnia.klienci ;
drop table kwiaciarnia.zamowienia;
drop table kwiaciarnia.odbiorcy;
drop table kwiaciarnia.kompozycje;
drop table kwiaciarnia.zapotrzebowanie;
drop table kwiaciarnia.historia;

begin;

create table kwiaciarnia.klienci (
  idklienta varchar(10) primary key,
  haslo     varchar(10) check(length(haslo) > 3) not null,
  nazwa     varchar(40) not null,
  miasto    varchar(40) not null,
  kod       char(6) not null,
  adres     varchar(40) not null,
  email     varchar(40),
  telefon   varchar(40) not null,
  fax       varchar(16) not null,
  nip       char(13),
  regon     char(9)
);

create table kwiaciarnia.kompozycje (
  idkompozycji   char(5) primary key,
  nazwa          varchar(40) not null,
  opis           varchar(100),
  cena           numeric(7,2) check(cena >= 40.00),
  minimum        integer,
  stan           integer
);

create table kwiaciarnia.odbiorcy (
  idodbiorcy   serial primary key,
  nazwa        varchar(40) not null,
  miasto       varchar(40) not null,
  kod          char(6) not null,
  adres        varchar(40) not null
);

create table kwiaciarnia.zamowienia (
  idzamowienia  integer not null,
  idklienta     varchar(10) not null references kwiaciarnia.klienci,
  idodbiorcy    integer not null references kwiaciarnia.odbiorcy,
  idkompozycji  char(5) not null references kwiaciarnia.kompozycje,
  termin        date not null,
  cena          numeric(7,2),
  zaplacone     boolean,
  uwagi         varchar(200),
  primary key   (idzamowienia)
);

create table kwiaciarnia.zapotrzebowanie (
  idkompozycji   char(5) not null references kwiaciarnia.kompozycje,
  data           date,
  primary key (idkompozycji)
);

create table kwiaciarnia.historia (
  idzamowienia   integer primary key,
  idklienta      varchar(10) not null,
  idkompozycji   char(5) not null,
  cena           numeric(7,2),
  termin         date
);

commit;
