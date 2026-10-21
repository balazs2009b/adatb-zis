-- ============================================================
-- Maratonváltó - megoldások
-- Készítette: <IDE ÍRD A NEVED>        Dátum: <IDE ÍRD A DÁTUMOT>
--
-- Adatbázis: maratonvalto.db
-- Létrehozás:  sqlite3 maratonvalto.db < tablak.sql
--              sqlite3 maratonvalto.db < adatok.sql
-- ============================================================

-- 1. feladat:
-- Hozzon létre maratonvalto néven adatbázist!
-- Az SQLite adatbázis egyetlen fájl, ezért a maratonvalto.db fájl
-- létrejötte maga az adatbázis létrehozása. Külön SQL parancs nincs rá.

-- 2. feladat:
-- A tablak.sql, majd az adatok.sql futtatása a maratonvalto adatbázisban.
-- A sorrend kötött: előbb a táblák, utána az adatok.
-- Eredmény: futok 292 sor, eredmenyek 311 sor, 52 csapat.

-- 3. feladat:
INSERT INTO eredmenyek (futo, kor, ido) VALUES (1044, 4, 15765);

-- 4. feladat:
SELECT fnev, szulev
FROM futok
WHERE ffi=0
ORDER BY fnev;

-- 5. feladat:
SELECT fnev, 2016-szulev AS kor
FROM futok
WHERE 2016-szulev>=42
ORDER BY kor DESC, szulho;

-- 6. feladat:
SELECT futok.fnev, eredmenyek.ido
FROM futok
JOIN eredmenyek ON futok.fid=eredmenyek.futo
WHERE futok.ffi=1
ORDER BY eredmenyek.ido
LIMIT 10;

-- 7. feladat:
SELECT futok.csapat AS csapat, sum(eredmenyek.ido) AS csapatido
FROM futok
JOIN eredmenyek ON futok.fid=eredmenyek.futo
GROUP BY futok.csapat
ORDER BY csapatido;
