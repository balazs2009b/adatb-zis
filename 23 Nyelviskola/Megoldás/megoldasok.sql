-- ============================================================
-- Nyelviskola - megoldasok
-- Keszitette: <IDE IRD A NEVED>        Datum: <IDE IRD A DATUMOT>
-- Adatbazis: nyelviskola.db
-- Letrehozas: sqlite3 nyelviskola.db < tablak.sql
--             sqlite3 nyelviskola.db < adatok.sql
-- ============================================================

-- 3. feladat: ezt a feladatot nem kell megoldani.

-- 4. feladat:
-- A SORSZAM alapjan javitunk, nem a nev alapjan! A feladat kifejezetten
-- figyelmeztet, hogy lehetnek azonos nevu jelentkezok.
UPDATE jelentkezesek SET mobil = '30784613' WHERE sorsz = 9;

-- 5. feladat:
INSERT INTO nyelvek (id, nyelv) VALUES (8, 'holland');

-- 6. feladat:
SELECT min(2018-szulev) AS legfiatalabb, max(2018-szulev) AS legidosebb
FROM jelentkezesek;

-- 7. feladat:
SELECT vizsgak.idopont
FROM vizsgak
JOIN jelentkezesek ON vizsgak.sorsz = jelentkezesek.vizsga
GROUP BY vizsgak.sorsz, vizsgak.idopont
HAVING count(*) = 25
ORDER BY vizsgak.idopont DESC;

-- 8. feladat:
SELECT nyelvek.nyelv, vizsgak.szint, count(*) AS vizsgazo
FROM jelentkezesek
JOIN vizsgak ON jelentkezesek.vizsga = vizsgak.sorsz
JOIN nyelvek ON vizsgak.nyelvid = nyelvek.id
GROUP BY nyelvek.nyelv, vizsgak.szint
ORDER BY vizsgazo DESC;
