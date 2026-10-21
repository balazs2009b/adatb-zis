-- ============================================================
-- 37. Tervezés 3 - fesztivál koncertjei
--
-- Kiindulás: egyetlen táblázat, ismétlődő adatokkal
--   Zenekar_neve | Műfaj | Színpad_neve | Színpad_helyszíne |
--   Koncert_időpontja
--
-- Mi ismétlődik az 5 sorban?
--   - Azahriah 2x szerepel, mindkétszer "Pop" műfajjal
--   - a "Nagyszínpad" és az "Északi főbejárat" 2x
--   - az "Erdőszél Színpad" és a "Keleti tópart" 2x
--   - a "Pop" műfaj 3x
--
-- Figyeld meg: a színpad NEVE és a HELYSZÍNE mindig együtt jár.
-- A Nagyszínpad mindig az Északi főbejáratnál van. Ez azt jelenti,
-- hogy a helyszín a SZÍNPADHOZ tartozik, nem a koncerthez.
--
-- Megoldás: négy tábla.
-- ============================================================

DROP TABLE IF EXISTS koncert;
DROP TABLE IF EXISTS zenekar;
DROP TABLE IF EXISTS szinpad;
DROP TABLE IF EXISTS mufaj;

CREATE TABLE mufaj (
  id INTEGER PRIMARY KEY,
  nev TEXT NOT NULL
);

-- Egy zenekarnak egy műfaja van (az adatok szerint Azahriah
-- mindkét fellépésénél Pop).
CREATE TABLE zenekar (
  id INTEGER PRIMARY KEY,
  nev TEXT NOT NULL,
  mufaj_id INTEGER NOT NULL,
  FOREIGN KEY (mufaj_id) REFERENCES mufaj(id)
);

-- A helyszín a színpadhoz tartozik, ezért itt van, nem a koncertnél.
CREATE TABLE szinpad (
  id INTEGER PRIMARY KEY,
  nev TEXT NOT NULL,
  helyszin TEXT NOT NULL
);

-- A koncert az esemény: ki, hol, mikor.
CREATE TABLE koncert (
  id INTEGER PRIMARY KEY,
  zenekar_id INTEGER NOT NULL,
  szinpad_id INTEGER NOT NULL,
  idopont TEXT NOT NULL,
  FOREIGN KEY (zenekar_id) REFERENCES zenekar(id),
  FOREIGN KEY (szinpad_id) REFERENCES szinpad(id)
);

-- --- A táblázat adatai -------------------------------------
INSERT INTO mufaj (id, nev) VALUES
(1, 'Pop'),
(2, 'Indie'),
(3, 'Elektro');

INSERT INTO zenekar (id, nev, mufaj_id) VALUES
(1, 'Azahriah',      1),
(2, 'Halott Pénz',   1),
(3, 'Carson Coma',   2),
(4, 'Analog Balaton', 3);

INSERT INTO szinpad (id, nev, helyszin) VALUES
(1, 'Nagyszínpad',      'Északi főbejárat'),
(2, 'Erdőszél Színpad', 'Keleti tópart'),
(3, 'Aréna',            'Nyugati parkoló');

INSERT INTO koncert (id, zenekar_id, szinpad_id, idopont) VALUES
(1, 1, 1, '2026.07.10 20:00'),
(2, 2, 1, '2026.07.11 21:00'),
(3, 3, 2, '2026.07.10 18:00'),
(4, 1, 3, '2026.07.12 22:00'),
(5, 4, 2, '2026.07.11 19:00');
