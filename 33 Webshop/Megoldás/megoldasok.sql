-- ============================================================
-- Webshop (sportklub szurkoloi bolt) - megoldasok
-- Keszitette: <IDE IRD A NEVED>        Datum: <IDE IRD A DATUMOT>
-- Adatbazis: webshop.db
-- ============================================================

-- 1-2. feladat: adatbazis letrehozasa, tablak es adatok betoltese.

-- 3. feladat: az idegenkulcsok a tablak.sql-ben mar be vannak allitva
-- (szamlafej.vevoid -> vevok.id, szamlatetel.szamlafejid -> szamlafej.id,
--  szamlatetel.termekid -> termekek.id). Az SQLite-ban idegenkulcsot
-- utolag nem lehet hozzaadni, csak uj tabla letrehozasaval.
-- Ervenyesiteshez: PRAGMA foreign_keys = ON;

-- 4. feladat:
SELECT megnevezes, ar
FROM termekek
ORDER BY ar;

-- 5. feladat:
UPDATE termekek SET ar = ar * 0.95 WHERE ar > 5000;

-- 6. feladat:
SELECT sum(szamlatetel.mennyiseg * szamlatetel.bruttoegysegar) AS bevetel
FROM szamlatetel
JOIN szamlafej ON szamlatetel.szamlafejid = szamlafej.id
WHERE szamlafej.teljesites BETWEEN '2018-01-01' AND '2018-01-15';

-- 7. feladat:
SELECT nev, telepules
FROM vevok
WHERE id NOT IN (SELECT vevoid FROM szamlafej)
ORDER BY nev;

-- 8. feladat:
SELECT termekek.megnevezes, sum(szamlatetel.mennyiseg * szamlatetel.bruttoegysegar) AS bevetel
FROM szamlatetel
JOIN termekek ON szamlatetel.termekid = termekek.id
GROUP BY termekek.id, termekek.megnevezes
ORDER BY bevetel DESC
LIMIT 3;
