-- 6. feladat: ki uralkodott a leghosszabb ideig egyfolytaban, es hany evet
-- A feladat peldaja: I. Istvan 1000-1038 = 39 ev, tehat
-- a kepletben +1 kell: meddig - mettol + 1.
SELECT uralkodo.nev, hivatal.meddig - hivatal.mettol + 1 AS evek
FROM uralkodo
JOIN hivatal ON uralkodo.azon = hivatal.uralkodo_az
ORDER BY evek DESC
LIMIT 1;
