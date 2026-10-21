-- ============================================================
-- Beiskolazas - megoldasok
-- Keszitette: <IDE IRD A NEVED>        Datum: <IDE IRD A DATUMOT>
-- Adatbazis: beiskolazas.db
-- ============================================================

-- 4. feladat:
-- Az OKTATASI AZONOSITO alapjan javitunk, nem a nev alapjan!
-- A feladat kifejezetten figyelmeztet az azonos nevekre.
UPDATE diakok SET kpmagy = 43 WHERE oktazon = '0143302';

-- 5. feladat:
SELECT nev
FROM diakok
WHERE kpmagy = 50 AND kpmat = 50 AND hozott >= 40
ORDER BY nev;

-- 6. feladat:
SELECT tagozatok.agazat,
       count(*) AS jelentkezoszam,
       max(diakok.hozott) - min(diakok.hozott) AS terjedelem
FROM jelentkezesek
JOIN tagozatok ON jelentkezesek.tag = tagozatok.akod
JOIN diakok ON jelentkezesek.diak = diakok.oktazon
WHERE jelentkezesek.hely = 1 AND tagozatok.nyek = 1
GROUP BY tagozatok.agazat
ORDER BY jelentkezoszam DESC;

-- 7. feladat:
SELECT diakok.nev, tagozatok.agazat, tagozatok.nyek, jelentkezesek.hely,
       diakok.hozott + diakok.kpmagy + diakok.kpmat AS osszpont
FROM jelentkezesek
JOIN tagozatok ON jelentkezesek.tag = tagozatok.akod
JOIN diakok ON jelentkezesek.diak = diakok.oktazon
ORDER BY tagozatok.agazat, osszpont DESC, jelentkezesek.hely;
