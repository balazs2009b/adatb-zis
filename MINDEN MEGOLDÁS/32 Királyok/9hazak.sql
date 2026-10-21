-- 9. feladat: melyik kiralyi haz hany uralkodot adott, szemelyek szama
-- szerint csokkenoen. A tobbszor uralkodokat csak egyszer kell szamolni
-- -> count(DISTINCT uralkodo.azon). (Itt az uralkodo tablabol szamolunk,
-- ezert minden szemely amugy is csak egyszer szerepel.)
SELECT uralkodohaz.nev, count(DISTINCT uralkodo.azon) AS db
FROM uralkodohaz
JOIN uralkodo ON uralkodohaz.azon = uralkodo.uhaz_az
GROUP BY uralkodohaz.azon, uralkodohaz.nev
ORDER BY db DESC;
