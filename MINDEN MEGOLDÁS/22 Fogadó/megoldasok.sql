-- ============================================================
-- Fogadó - megoldások
-- Készítette: <IDE ÍRD A NEVED>        Dátum: <IDE ÍRD A DÁTUMOT>
-- Adatbázis: fogado.db
-- Létrehozás: sqlite3 fogado.db < tablak.sql     (a JAVÍTOTT változat!)
--             sqlite3 fogado.db < adatok.sql
-- ============================================================

-- 3. feladat:
CREATE INDEX vnev_index ON vendegek(vnev);

-- 4. feladat: ezt a feladatot nem kell megoldani.

-- 5. feladat:
INSERT INTO foglalasok (fsorsz, vendeg, szoba, erk, tav, fo)
VALUES (281, 100, 2, '2016-06-28', '2016-06-30', 5);

-- 6. feladat:
UPDATE szobak SET agy = 3 WHERE sznev = 'Vidor';

-- 7. feladat:
SELECT count(*) AS vendegszam
FROM vendegek
WHERE irsz BETWEEN 3400 AND 3999;

-- 8. feladat:
SELECT szobak.sznev,
       sum(foglalasok.fo) AS vendegek,
       CAST(sum(foglalasok.fo * (julianday(foglalasok.tav) - julianday(foglalasok.erk))) AS INTEGER) AS vendegejszakak
FROM szobak
JOIN foglalasok ON szobak.szazon = foglalasok.szoba
GROUP BY szobak.szazon, szobak.sznev
ORDER BY vendegejszakak, vendegek;

-- 9. feladat:
SELECT vendegek.vnev, count(*) AS alkalmak
FROM vendegek
JOIN foglalasok ON vendegek.vsorsz = foglalasok.vendeg
GROUP BY vendegek.vsorsz, vendegek.vnev
HAVING count(*) > 1
ORDER BY vendegek.vnev;
