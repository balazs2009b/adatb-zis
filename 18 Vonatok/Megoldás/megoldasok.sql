-- ============================================================
-- Kőbánya vasútállomások - megoldások
-- Készítette: <IDE ÍRD A NEVED>        Dátum: <IDE ÍRD A DÁTUMOT>
-- Adatbázis: kovasut.db
-- Létrehozás: sqlite3 kovasut.db < kovasut_import.sql
-- ============================================================

-- 1. feladat:
-- Hozzon létre kobanyavasut néven adatbázist!
-- Az SQLite adatbázis egyetlen fájl, ezért a kovasut.db fájl
-- létrejötte maga az adatbázis létrehozása.

-- 2. feladat:
-- A kovasut_import.sql futtatása. Eredmény: allomasok 15, vonatok 357 sor.

-- 3. feladat:
INSERT INTO allomasok (id, allomasNev) VALUES (16, 'Dabas');

-- 4. feladat:
-- FIGYELEM: a jaratSzam mező varchar(4), és a rövidebb járatszámok
-- SZÓKÖZZEL vannak kitöltve 4 karakterre. A járat nem '541', hanem
-- '541 '. A jaratSzam='541' feltétel NULLA sort érintene!
UPDATE vonatok SET jaratTipus = 'sz' WHERE trim(jaratSzam) = '541';

-- 5. feladat:
SELECT count(*) AS "járatok száma"
FROM vonatok
WHERE allomas = 'Felső' AND jaratTipus = 'zó';

-- 6. feladat:
SELECT min(vonatok.indulas) AS elso, max(vonatok.indulas) AS utolso
FROM vonatok
JOIN allomasok ON vonatok.vegAll = allomasok.id
WHERE allomasok.allomasNev = 'Monor' AND vonatok.allomas = 'Alsó';

-- 7. feladat:
SELECT vonatok.indulas, vonatok.allomas, vonatok.erkezIdo
FROM vonatok
JOIN allomasok ON vonatok.vegAll = allomasok.id
WHERE allomasok.allomasNev = 'Szolnok'
ORDER BY vonatok.indulas
LIMIT 5;
