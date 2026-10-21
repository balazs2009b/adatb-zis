-- ============================================================
-- 27. Tervezés - iskolai könyvtári nyilvántartás
--
-- Kiindulás: egyetlen tábla, ismétlődő adatokkal
--   Diák Neve | Cím | Könyv címe | Szerző | Dátum | Vissza
--
-- Mi a baj vele?
--   - Kovács János neve és lakcíme KÉTSZER szerepel. Ha elköltözik,
--     két helyen kell javítani, és ha csak az egyiket javítod,
--     ellentmondásos lesz az adatbázis.
--   - A szerző neve is ismétlődne, ha egy szerzőtől több könyv van.
--   - Ha egy diák semmit nem kölcsönzött, egyáltalán nem fér bele
--     a táblába.
--
-- Megoldás: négy tábla. Minden adat EGY helyen szerepel, a
-- kapcsolatokat azonosítók (idegen kulcsok) tartják.
--
-- Feltételezés a feladat szerint: minden könyvből csak EGY példány
-- van, ezért a könyv maga a példány, nem kell külön példány tábla.
-- ============================================================

DROP TABLE IF EXISTS kolcsonzes;
DROP TABLE IF EXISTS konyv;
DROP TABLE IF EXISTS szerzo;
DROP TABLE IF EXISTS diak;

-- A diák adatai: a név és a lakcím a DIÁKHOZ tartozik, nem a
-- kölcsönzéshez, ezért kerül külön táblába.
CREATE TABLE diak (
  id INTEGER PRIMARY KEY,
  nev TEXT NOT NULL,
  cim TEXT
);

-- A szerző külön tábla, mert egy szerzőnek több könyve is lehet.
CREATE TABLE szerzo (
  id INTEGER PRIMARY KEY,
  nev TEXT NOT NULL
);

-- Egy könyvnek egy szerzője van ebben a nyilvántartásban.
CREATE TABLE konyv (
  id INTEGER PRIMARY KEY,
  cim TEXT NOT NULL,
  szerzo_id INTEGER NOT NULL,
  FOREIGN KEY (szerzo_id) REFERENCES szerzo(id)
);

-- A kölcsönzés köti össze a diákot és a könyvet. Csak az tartozik
-- ide, ami tényleg a kölcsönzés eseményéhez kötődik: a dátum és
-- hogy visszahozták-e.
CREATE TABLE kolcsonzes (
  id INTEGER PRIMARY KEY,
  diak_id INTEGER NOT NULL,
  konyv_id INTEGER NOT NULL,
  datum TEXT NOT NULL,
  vissza TEXT NOT NULL,
  FOREIGN KEY (diak_id) REFERENCES diak(id),
  FOREIGN KEY (konyv_id) REFERENCES konyv(id)
);

-- --- A feladatban szereplő adatok betöltése ----------------
INSERT INTO diak (id, nev, cim) VALUES
(1, 'Kovács János', 'Budapest, Fő u. 1.');

INSERT INTO szerzo (id, nev) VALUES
(1, 'Gárdonyi Géza'),
(2, 'Molnár Ferenc');

INSERT INTO konyv (id, cim, szerzo_id) VALUES
(1, 'Egri csillagok', 1),
(2, 'Pál utcai fiúk', 2);

INSERT INTO kolcsonzes (id, diak_id, konyv_id, datum, vissza) VALUES
(1, 1, 1, '03-14', 'igen'),
(2, 1, 2, '03-24', 'nem');
