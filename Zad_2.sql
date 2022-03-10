use biuro 

--1--
select nieruchomosci.nieruchomoscnr, count(wynajecia.nieruchomoscNr) from nieruchomosci
left join wynajecia on nieruchomosci.nieruchomoscnr=wynajecia.nieruchomoscNr
group by nieruchomosci.nieruchomoscnr

select nieruchomosci.nieruchomoscnr, count(wizyty.nieruchomoscnr) from nieruchomosci
left join wizyty on nieruchomosci.nieruchomoscnr=wizyty.nieruchomoscnr
group by nieruchomosci.nieruchomoscnr

--2--
select format((cast(n.czynsz as float)-w.czynsz)/w.czynsz,'P') from nieruchomosci n 
join wynajecia w on w.nieruchomoscNr=n.nieruchomoscnr
where w.od_kiedy = (select min(w1.od_kiedy) from wynajecia w1)

--3--

select nieruchomosci.nieruchomoscnr, sum(wynajecia.czynsz) from nieruchomosci
join wynajecia on nieruchomosci.nieruchomoscnr=wynajecia.nieruchomoscNr
group by nieruchomosci.nieruchomoscnr


--4--

select biura.biuroNr, sum(wynajecia.czynsz)*0.3 from biura
join rejestracje on rejestracje.biuronr=biura.biuroNr
join wynajecia on rejestracje.klientnr=wynajecia.klientnr
group by biura.biuroNr

select biura.biuroNr, count(wynajecia.czynsz) from biura
join rejestracje on rejestracje.biuronr=biura.biuroNr
join wynajecia on rejestracje.klientnr=wynajecia.klientnr
group by biura.biuroNr

--5--

--a

select biura.miasto, count(wynajecia.umowanr) from biura
join rejestracje on rejestracje.biuronr=biura.biuroNr
join wynajecia on rejestracje.klientnr=wynajecia.klientnr
group by biura.miasto
order by count(wynajecia.umowanr) desc

--b

select biura.miasto, datepart(month,wynajecia.do_kiedy-wynajecia.od_kiedy) as czas from biura
join rejestracje on rejestracje.biuronr=biura.biuroNr
join wynajecia on rejestracje.klientnr=wynajecia.klientnr
where datepart(month,wynajecia.do_kiedy-wynajecia.od_kiedy) = (select max(datepart(month,wynajecia.do_kiedy-wynajecia.od_kiedy)) from wynajecia)
group by biura.miasto, wynajecia.do_kiedy, wynajecia.od_kiedy
order by czas desc

--6--

select distinct wynajecia.klientnr, wizyty.nieruchomoscnr from wynajecia
inner join wizyty on wizyty.klientnr=wynajecia.klientnr
and wizyty.nieruchomoscnr=wynajecia.nieruchomoscNr

--7--

select DISTINCT wizyty.klientnr, count(wizyty.nieruchomoscnr) from wizyty
inner join wynajecia on wizyty.klientnr=wynajecia.klientnr
and wizyty.nieruchomoscnr=wynajecia.nieruchomoscNr
group by wizyty.klientnr

--8--

select distinct klienci.klientnr from klienci 
join wynajecia on klienci.klientnr=wynajecia.klientnr
where klienci.max_czynsz>wynajecia.czynsz

--9--

select distinct biura.biuroNr, nieruchomosci.biuroNr from biura
left join nieruchomosci on biura.biuroNr=nieruchomosci.biuroNr
where nieruchomosci.biuroNr is null

--10--
--a
select personel.plec, count(personel.personelNr) from personel
group by personel.plec

--b

select personel.biuroNr, personel.plec, count(personel.personelnr) from personel
group by personel.biuroNr, personel.plec

--c

select biura.miasto, personel.plec, count(personel.personelNr) from personel
right join biura on biura.biuroNr=personel.biuroNr
group by biura.miasto, personel.plec

--d 
select personel.stanowisko, personel.plec, count(personel.personelNr) from personel
group by personel.stanowisko, personel.plec

