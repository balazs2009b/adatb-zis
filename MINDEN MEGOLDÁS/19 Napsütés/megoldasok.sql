-- ============================================================
-- Napsütés (brit régiók napsütéses percei) - megoldások
-- Készítette: <IDE ÍRD A NEVED>        Dátum: <IDE ÍRD A DÁTUMOT>
-- Adatbázis: napsutes.db
-- Létrehozás: sqlite3 napsutes.db < adatbazis.sql
-- ============================================================

-- 3. feladat:
UPDATE regiok SET regioNev = 'Észak-Írország' WHERE regioNev = 'Észak Írország';

-- 4. feladat:
SELECT count(*) AS rekordszam, round(avg(perc),2) AS atlag
FROM meresek;

-- 5. feladat:
SELECT meresek.ev, round(sum(meresek.perc)/60.0, 1) AS orak
FROM meresek
JOIN regiok ON meresek.regioId = regiok.id
WHERE regiok.regioNev = 'Anglia' AND meresek.ev BETWEEN 1990 AND 2000
GROUP BY meresek.ev
ORDER BY meresek.ev DESC;

-- 6. feladat:
SELECT meresek.ev, regiok.regioNev, meresek.perc
FROM meresek
JOIN regiok ON meresek.regioId = regiok.id
WHERE meresek.ho = 2 AND meresek.perc > 6000
ORDER BY meresek.perc DESC;
