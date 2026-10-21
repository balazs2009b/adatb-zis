-- ============================================================
-- 36. Tervezés 2 - szerelők munkanyilvántartása
--
-- Kiindulás: egyetlen Excel tábla, ismétlődő adatokkal
--   Szerelő neve | Szakterület | Szerelő tel. | Ügyfél neve |
--   Ügyfél címe | Ügyfél tel. | Munka leírása | Dátum | Munkadíj
--
-- Mi ismétlődik a 4 sorban?
--   - Kovács János neve, szakterülete és telefonja 2x
--   - Szabó Béla adatai 2x
--   - Nagy Éva ügyfél adatai 2x, Kiss Pál adatai 2x
--   - a "Villanyszerelő" és "Vízszerelő" szöveg is 2-2x
--
-- Megoldás: négy tábla.
-- ============================================================

DROP TABLE IF EXISTS munka;
DROP TABLE IF EXISTS szerelo;
DROP TABLE IF EXISTS ugyfel;
DROP TABLE IF EXISTS szakterulet;

-- A szakterület külön tábla, hogy a szöveg egyszer szerepeljen,
-- és ne lehessen elgépelni ("Villanyszerelő" / "villanyszerelo").
CREATE TABLE szakterulet (
  id INTEGER PRIMARY KEY,
  nev TEXT NOT NULL
);

CREATE TABLE szerelo (
  id INTEGER PRIMARY KEY,
  nev TEXT NOT NULL,
  szakterulet_id INTEGER NOT NULL,
  telefon TEXT,
  FOREIGN KEY (szakterulet_id) REFERENCES szakterulet(id)
);

CREATE TABLE ugyfel (
  id INTEGER PRIMARY KEY,
  nev TEXT NOT NULL,
  cim TEXT,
  telefon TEXT
);

-- A munka az esemény: ki, kinél, mit, mikor, mennyiért.
-- Csak ezek tartoznak ide; a szerelő és az ügyfél adatai nem.
CREATE TABLE munka (
  id INTEGER PRIMARY KEY,
  szerelo_id INTEGER NOT NULL,
  ugyfel_id INTEGER NOT NULL,
  leiras TEXT NOT NULL,
  datum TEXT NOT NULL,
  munkadij INTEGER NOT NULL,
  FOREIGN KEY (szerelo_id) REFERENCES szerelo(id),
  FOREIGN KEY (ugyfel_id) REFERENCES ugyfel(id)
);

-- --- A táblázat adatai -------------------------------------
INSERT INTO szakterulet (id, nev) VALUES
(1, 'Villanyszerelő'),
(2, 'Vízszerelő');

INSERT INTO szerelo (id, nev, szakterulet_id, telefon) VALUES
(1, 'Kovács János', 1, '06-20-111'),
(2, 'Szabó Béla',   2, '06-30-333');

INSERT INTO ugyfel (id, nev, cim, telefon) VALUES
(1, 'Nagy Éva', '1111 Bp, Fő u. 1.',        '06-70-222'),
(2, 'Kiss Pál', '2222 Debrecen, Kis u. 5.', '06-70-444');

INSERT INTO munka (id, szerelo_id, ugyfel_id, leiras, datum, munkadij) VALUES
(1, 1, 1, 'Biztosítéktábla csere',    '2026.04.01', 25000),
(2, 2, 2, 'Csöpögő csap javítása',    '2026.04.01', 12000),
(3, 1, 2, 'Új konnektorok kiépítése', '2026.04.02', 35000),
(4, 2, 1, 'Mosogatógép bekötése',     '2026.04.03', 18000);
