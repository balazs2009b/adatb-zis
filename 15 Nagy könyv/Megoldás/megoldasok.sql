-- ============================================================
-- A Nagy Könyv (2005-ös felmérés) - megoldások
-- Készítette: <IDE ÍRD A NEVED>        Dátum: <IDE ÍRD A DÁTUMOT>
--
-- Adatbázis: nagykonyv.db
-- Létrehozás:  sqlite3 nagykonyv.db < tablak.sql
--              sqlite3 nagykonyv.db < adatok.sql
-- ============================================================

-- 1. feladat:
-- Hozzon létre nagykonyv néven adatbázist!
-- Az SQLite adatbázis egyetlen fájl, ezért a nagykonyv.db fájl
-- létrejötte maga az adatbázis létrehozása. Külön SQL parancs nincs rá.

-- 2. feladat:
-- A tablak.sql, majd az adatok.sql futtatása a nagykonyv adatbázisban.
-- Eredmény: szerzo 103 sor, konyv 153 sor.

-- 3. feladat:
SELECT DISTINCT nemzetiseg
FROM szerzo
WHERE nemzetiseg<>'magyar';

-- 4. feladat:
SELECT nev, 2005-szulEv AS kor
FROM szerzo
WHERE halEv IS NULL;

-- 5. feladat:
SELECT szerzo.nev AS nev, min(konyv.helyezes) AS legjobb
FROM szerzo
JOIN konyv ON szerzo.id=konyv.szerzoId
WHERE szerzo.nemzetiseg='magyar'
GROUP BY szerzo.nev
ORDER BY legjobb;

-- 6. feladat:
SELECT szerzo.nev AS nev, count(*) AS konyvek
FROM szerzo
JOIN konyv ON szerzo.id=konyv.szerzoId
GROUP BY szerzo.nev
HAVING count(*)>1
ORDER BY konyvek DESC, nev;
