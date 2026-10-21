-- ============================================================
-- Forma-1, 2015-os evad - megoldasok
-- Keszitette: <IDE IRD A NEVED>        Datum: <IDE IRD A DATUMOT>
-- Adatbazis: forma1.db
-- ============================================================

-- 3. feladat:
CREATE INDEX pnev_index ON pilotak(pnev);

-- 4. feladat: nem kell megoldani.

-- 5. feladat:
DELETE FROM versenyek WHERE vnev = 'Német Nagydíj';

-- 6. feladat:
UPDATE versenyek SET hely = 'Sao Paulo' WHERE vnev = 'Brazil Nagydíj';

-- 7. feladat:
SELECT pilotak.pnev, count(*) AS gyozelmek
FROM pilotak
JOIN eredmenyek ON pilotak.pazon = eredmenyek.pilota
WHERE eredmenyek.celpoz = 1
GROUP BY pilotak.pazon, pilotak.pnev
ORDER BY gyozelmek DESC
LIMIT 1;

-- 8. feladat:
SELECT vnev, kor * hossz / 1000.0 AS tav
FROM versenyek
ORDER BY tav DESC;

-- 9. feladat:
SELECT pilotak.pnev, pilotak.szev, csapatok.csnev, min(eredmenyek.celpoz) AS legjobb
FROM pilotak
JOIN csapatok ON pilotak.csapat = csapatok.csazon
LEFT JOIN eredmenyek ON pilotak.pazon = eredmenyek.pilota
GROUP BY pilotak.pazon, pilotak.pnev, pilotak.szev, csapatok.csnev
ORDER BY pilotak.szev DESC
LIMIT 3;
