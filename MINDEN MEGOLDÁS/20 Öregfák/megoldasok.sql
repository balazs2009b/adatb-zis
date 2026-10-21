-- ============================================================
-- Öregfák - megoldások
-- Adatbázis: oregfak.db
-- Létrehozás: sqlite3 oregfak.db < oregfak.sql
-- ============================================================

-- 3. feladat: 900 cm-nél nagyobb körméretű fák fajneve és körmérete
-- méterben, két tizedesjegyre kerekítve, ábécérendben
SELECT faj, round(kormeret/100.0, 2) AS kormeret_m
FROM fa
WHERE kormeret > 900
ORDER BY faj;

-- 4. feladat: a legnagyobb kerületű fa fajneve, körmérete, mérési éve
SELECT faj, kormeret, meres
FROM fa
ORDER BY kormeret DESC
LIMIT 1;

-- 5. feladat: településenként a fák száma, darabszám szerint csökkenően,
-- azonos darabszám esetén településnév szerint ábécérendben
SELECT telepules, count(*) AS db
FROM fa
GROUP BY telepules
ORDER BY db DESC, telepules;

-- 6. feladat: megyénként hány fáról van adat
SELECT megye.nev, count(*) AS db
FROM fa
JOIN megye ON fa.megyeid = megye.id
GROUP BY megye.nev;

-- 7. feladat: a tiszafás településeken található többi fajnév,
-- a tiszafa nélkül, minden fajnév csak egyszer
SELECT DISTINCT faj
FROM fa
WHERE telepules IN (SELECT telepules FROM fa WHERE faj = 'tiszafa')
  AND faj <> 'tiszafa';
