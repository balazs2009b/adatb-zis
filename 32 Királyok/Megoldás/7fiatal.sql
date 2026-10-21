-- 7. feladat: akik 15 evesnel fiatalabban kezdtek uralkodni,
-- es ekkor hany evesek voltak, eletkor szerint novekvoen
SELECT uralkodo.nev, hivatal.mettol - uralkodo.szul AS kor
FROM uralkodo
JOIN hivatal ON uralkodo.azon = hivatal.uralkodo_az
WHERE hivatal.mettol - uralkodo.szul < 15
ORDER BY kor;
