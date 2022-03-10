USE narciarze

---1---
SELECT * from kraje
SELECT * from skocznie
select * from trenerzy
select * from uczestnictwa_w_zawodach
select * from zawodnicy
select * from zawody

--2--
select kraje.kraj from kraje 
join zawodnicy on zawodnicy.id_kraju=kraje.id_kraju
where zawodnicy.id_kraju!=kraje.id_kraju ???????????????????????????

---3---
select kraje.kraj, count(zawodnicy.id_kraju) from kraje left join zawodnicy on kraje.id_kraju=zawodnicy.id_kraju
group by kraje.kraj

--4--
select zawodnicy.nazwisko, count(uczestnictwa_w_zawodach.id_skoczka) from zawodnicy
left join uczestnictwa_w_zawodach on uczestnictwa_w_zawodach.id_skoczka=zawodnicy.id_skoczka
group by nazwisko, uczestnictwa_w_zawodach.id_skoczka
having count(uczestnictwa_w_zawodach.id_skoczka)=0 ???????????????

--5--

select zawodnicy.nazwisko, count(uczestnictwa_w_zawodach.id_skoczka) from zawodnicy 
left join uczestnictwa_w_zawodach on uczestnictwa_w_zawodach.id_skoczka=zawodnicy.id_skoczka
group by zawodnicy.nazwisko

--6--
select zawodnicy.id_skoczka, skocznie.nazwa from zawodnicy
join uczestnictwa_w_zawodach on uczestnictwa_w_zawodach.id_skoczka=zawodnicy.id_skoczka
join zawody on zawody.id_zawodow=uczestnictwa_w_zawodach.id_zawodow
join skocznie on skocznie.id_skoczni=zawody.id_skoczni
group by zawodnicy.id_skoczka, skocznie.nazwa

--7--
select zawodnicy.nazwisko, datediff(year, zawodnicy.data_ur, getdate()) as wiek from zawodnicy
order by wiek desc

--8--
select zawodnicy.nazwisko, min(datediff(year, zawodnicy.data_ur, zawody.DATA)) as wiek from zawodnicy
join uczestnictwa_w_zawodach on uczestnictwa_w_zawodach.id_skoczka=zawodnicy.id_skoczka
join zawody on zawody.id_zawodow=uczestnictwa_w_zawodach.id_zawodow
group by zawodnicy.nazwisko

--9--
select nazwa, sedz-k from skocznie

--10--
select skocznie.nazwa from skocznie 
left join zawody on zawody.id_skoczni=skocznie.id_skoczni
group by nazwa, k 
having k=(select max(k) from skocznie) 

--11--
select distinct kraje.kraj from kraje 
join skocznie on skocznie.id_kraju=kraje.id_kraju
right join zawody on zawody.id_skoczni=skocznie.id_skoczni

--12--
select zawodnicy.nazwisko, count(uczestnictwa_w_zawodach.id_skoczka) from zawodnicy
join uczestnictwa_w_zawodach on uczestnictwa_w_zawodach.id_skoczka=zawodnicy.id_skoczka
join zawody on zawody.id_zawodow=uczestnictwa_w_zawodach.id_zawodow
join skocznie on skocznie.id_skoczni=zawody.id_skoczni
group by nazwisko,skocznie.id_kraju, zawodnicy.id_kraju
having zawodnicy.id_kraju=skocznie.id_kraju


