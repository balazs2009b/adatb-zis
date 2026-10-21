-- 3. feladat: az Arpad-haz tagjainak neve, uralkodasuk kezdo es befejezo
-- eve, az uralkodasuk sorrendjeben. Aki tobbszor uralkodott, tobbszor
-- is megjelenik -> nincs DISTINCT es nincs csoportositas.
SELECT uralkodo.nev, hivatal.mettol, hivatal.meddig
FROM uralkodo
JOIN hivatal ON uralkodo.azon = hivatal.uralkodo_az
JOIN uralkodohaz ON uralkodo.uhaz_az = uralkodohaz.azon
WHERE uralkodohaz.nev = 'Árpád-ház'
ORDER BY hivatal.mettol;
