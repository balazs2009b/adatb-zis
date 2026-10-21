-- 4. feladat: akik mar a koronazasuk eve elott elfoglaltak a hivatalukat
SELECT DISTINCT uralkodo.nev
FROM uralkodo
JOIN hivatal ON uralkodo.azon = hivatal.uralkodo_az
WHERE hivatal.koronazas IS NOT NULL AND hivatal.mettol < hivatal.koronazas;
