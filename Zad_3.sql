USE narciarze
---------1-------------
SELECT * FROM kraje;
SELECT * FROM skocznie;
SELECT * FROM trenerzy ;
SELECT * FROM uczestnictwa_w_zawodach;
SELECT * FROM zawodnicy ;
SELECT * FROM zawody;
---------2--------------
SELECT kraj FROM kraje WHERE id_kraju NOT IN (SELECT id_kraju FROM zawodnicy);

-----------3------------
SELECT kraj, count(id_skoczka) as count FROM kraje, zawodnicy where kraje.id_kraju=zawodnicy.id_kraju GROUP BY kraj

-------------4------------

SELECT * FROM zawodnicy WHERE id_skoczka NOT IN (SELECT id_skoczka FROM uczestnictwa_w_zawodach);

-----------5--------------

SELECT z.nazwisko, count(u.id_skoczka) as count FROM zawodnicy z JOIN uczestnictwa_w_zawodach u ON z.id_skoczka=u.id_skoczka group by z.nazwisko

-------------6---------------

select distinct z.nazwisko,s.nazwa from zawodnicy z 
join uczestnictwa_w_zawodach u on z.id_skoczka=u.id_skoczka 
join zawody on u.id_zawodow=zawody.id_zawodow 
join skocznie s on zawody.id_skoczni=s.id_skoczni

--------------7-----------------

select zawodnicy.nazwisko, datediff(year, zawodnicy.data_ur, getdate()) as wiek from zawodnicy
order by wiek desc

-------------8-----------------

select zawodnicy.nazwisko, min(datediff(year, zawodnicy.data_ur, zawody.DATA)) as wiek from zawodnicy
join uczestnictwa_w_zawodach on uczestnictwa_w_zawodach.id_skoczka=zawodnicy.id_skoczka
join zawody on zawody.id_zawodow=uczestnictwa_w_zawodach.id_zawodow
group by zawodnicy.nazwisko

---------------9----------------

SELECT  nazwa, sedz-k as odl FROM skocznie 

------------------10------------

select skocznie.nazwa from skocznie 
left join zawody on zawody.id_skoczni=skocznie.id_skoczni
group by nazwa, k 
having k=(select max(k) from skocznie) 

----------------11--------------

select kraj from kraje where id_kraju in (select id_kraju from skocznie where id_skoczni in(select id_skoczni from zawody))

---------------12---------------

select nazwisko, count(zawody.id_zawodow) as count from zawodnicy z join uczestnictwa_w_zawodach u on z.id_skoczka=u.id_skoczka join zawody on zawody.id_zawodow=u.id_zawodow join skocznie s on s.id_skoczni=zawody.id_skoczni 
where z.id_kraju=s.id_kraju group by nazwisko order by nazwisko 

----------------13--------------

INSERT INTO trenerzy VALUES (7,'Corby','Fisher',1975-07-20);

-----------------14-------------

ALTER TABLE zawodnicy
ADD trener INT 

---------------15---------------

UPDATE zawodnicy SET trener=(SELECT id_trenera FROM trenerzy WHERE trenerzy.id_kraju=zawodnicy.id_kraju)

--------------------16----------

ALTER TABLE zawodnicy ADD CONSTRAINT FK_trener FOREIGN KEY (trener) REFERENCES Trenerzy(id_trenera)

-----------------17-------------

UPDATE trenerzy SET data_ur_t=(select MAX(DATEADD(year,-5,data_ur)) from zawodnicy WHERE zawodnicy.trener=trenerzy.id_trenera) where data_ur_t IS NULL;
