-- ============================================================
-- Utazasi iroda - megoldasok
-- Adatbazis: utazas.db
-- Letrehozas: sqlite3 utazas.db < utazas.sql   (a JAVITOTT valtozat!)
-- ============================================================

-- 2. feladat:
SELECT * FROM szalloda ORDER BY besorolas DESC, nev;

-- 3. feladat:
SELECT szalloda.nev, tavasz.indulas, tavasz.ar
FROM tavasz
JOIN szalloda ON tavasz.szalloda_az = szalloda.az
JOIN helyseg ON szalloda.helyseg_az = helyseg.az
WHERE helyseg.orszag = 'Tunézia';

-- 4. feladat:
SELECT helyseg.orszag, szalloda.nev, szalloda.besorolas, tavasz.indulas, tavasz.ar
FROM tavasz
JOIN szalloda ON tavasz.szalloda_az = szalloda.az
JOIN helyseg ON szalloda.helyseg_az = helyseg.az
WHERE szalloda.tengerpart_tav = 0 AND tavasz.indulas LIKE '2025-03%';

-- 5. feladat:
SELECT DISTINCT helyseg.orszag, szalloda.az, tavasz.ar
FROM tavasz
JOIN szalloda ON tavasz.szalloda_az = szalloda.az
JOIN helyseg ON szalloda.helyseg_az = helyseg.az
WHERE szalloda.besorolas < 5 AND szalloda.felpanzio = 1 AND szalloda.repter_tav <= 20
ORDER BY tavasz.ar
LIMIT 5;

-- 6. feladat:
-- A feladat ADDDATE()-et javasol, az MySQL fuggveny. Az SQLite-ban
-- a date(datum, '+N day') alakot kell hasznalni.
-- Az ut hosszaba az indulas es a hazautazas napja is beleszamit,
-- ezert a befejezes = indulas + (idotartam - 1) nap.
SELECT tavasz.indulas AS kezdet,
       date(tavasz.indulas, '+' || (tavasz.idotartam - 1) || ' day') AS befejezes,
       tavasz.ar * 6 AS osszkoltseg
FROM tavasz
JOIN szalloda ON tavasz.szalloda_az = szalloda.az
WHERE szalloda.nev = 'Marhaba'
ORDER BY tavasz.indulas DESC;

-- 7. feladat:
SELECT szalloda.nev, count(*) AS utak
FROM tavasz
JOIN szalloda ON tavasz.szalloda_az = szalloda.az
GROUP BY szalloda.az, szalloda.nev;
