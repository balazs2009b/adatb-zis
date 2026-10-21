-- 2. feladat: a ragadvannyevvel rendelkezo kiralyok neve es ragadvanyneve,
-- szuletesi evuk sorrendjeben
SELECT nev, ragnev
FROM uralkodo
WHERE ragnev IS NOT NULL
ORDER BY szul;
