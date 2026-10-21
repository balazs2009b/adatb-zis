-- ============================================================
-- Ostermelo (gyumolcsle-kiszallitasok) - megoldasok
-- Keszitette: <IDE IRD A NEVED>        Datum: <IDE IRD A DATUMOT>
-- Adatbazis: ostermelo.db
-- Letrehozas: sqlite3 ostermelo.db < tablak.sql
--             sqlite3 ostermelo.db < adatok.sql
-- ============================================================

-- 3. feladat:
SELECT DISTINCT telepules
FROM partnerek
ORDER BY telepules;

-- 4. feladat:
SELECT count(*) AS alkalmak
FROM kiszallitasok
JOIN partnerek ON kiszallitasok.partnerid = partnerek.id
WHERE partnerek.telepules = 'Vác';

-- 5. feladat:
SELECT max(karton) AS legtobb
FROM kiszallitasok
WHERE datum BETWEEN '2016-05-01' AND '2016-05-31';

-- 6. feladat:
SELECT telepules
FROM partnerek
GROUP BY telepules
HAVING count(*) > 1;

-- 7. feladat:
SELECT gyumolcslevek.gynev AS ital, sum(kiszallitasok.karton)*6 AS doboz
FROM kiszallitasok
JOIN gyumolcslevek ON kiszallitasok.gyumleid = gyumolcslevek.id
GROUP BY gyumolcslevek.gynev
ORDER BY doboz DESC
LIMIT 3;
