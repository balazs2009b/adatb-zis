-- ============================================================
-- Teke - megoldasok
-- Keszitette: <IDE IRD A NEVED>        Datum: <IDE IRD A DATUMOT>
-- Adatbazis: teke.db
-- ============================================================

-- 3. feladat:
SELECT nev FROM versenyzok WHERE korcsop = 'A' ORDER BY nev;

-- 4. feladat:
SELECT DISTINCT versenyzo FROM eredmenyek WHERE ures > 0;

-- 5. feladat:
SELECT versenyzok.nev, avg(eredmenyek.tarolas) AS atlagpont
FROM versenyzok
JOIN eredmenyek ON versenyzok.rajtszam = eredmenyek.versenyzo
GROUP BY versenyzok.rajtszam, versenyzok.nev
ORDER BY atlagpont DESC;

-- 6. feladat:
SELECT egyesuletek.nev
FROM egyesuletek
JOIN versenyzok ON egyesuletek.id = versenyzok.egyid
GROUP BY egyesuletek.id, egyesuletek.nev
ORDER BY count(*) DESC
LIMIT 1;

-- 7. feladat:
SELECT versenyzok.nev AS nev,
       sum(eredmenyek.teli) + sum(eredmenyek.tarolas) AS eredmeny,
       sum(eredmenyek.tarolas) AS tarolas,
       sum(eredmenyek.ures) AS ures
FROM versenyzok
JOIN eredmenyek ON versenyzok.rajtszam = eredmenyek.versenyzo
WHERE versenyzok.korcsop = 'B'
GROUP BY versenyzok.rajtszam, versenyzok.nev
ORDER BY eredmeny DESC, tarolas DESC, ures;
