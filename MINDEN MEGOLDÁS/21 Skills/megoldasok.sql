-- ============================================================
-- EuroSkills 2018 Budapest - megoldások
-- Készítette: <IDE ÍRD A NEVED>        Dátum: <IDE ÍRD A DÁTUMOT>
-- Adatbázis: skills.db
-- Létrehozás: sqlite3 skills.db < tablak.sql
--             sqlite3 skills.db < adatok.sql
-- ============================================================

-- 3. feladat:
SELECT count(*) AS ermek
FROM versenyzo
WHERE pont >= 700;

-- 4. feladat:
SELECT DISTINCT orszag.orszagNev
FROM orszag
JOIN versenyzo ON orszag.id = versenyzo.orszagId
ORDER BY orszag.orszagNev;

-- 5. feladat:
SELECT szakma.szakmaNev, count(*) AS versenyzok
FROM szakma
JOIN versenyzo ON szakma.id = versenyzo.szakmaId
GROUP BY szakma.szakmaNev
ORDER BY versenyzok DESC;

-- 6. feladat:
SELECT versenyzo.nev, orszag.orszagNev, szakma.szakmaNev, versenyzo.pont
FROM versenyzo
JOIN orszag ON versenyzo.orszagId = orszag.id
JOIN szakma ON versenyzo.szakmaId = szakma.id
ORDER BY versenyzo.pont DESC, versenyzo.nev
LIMIT 25;
