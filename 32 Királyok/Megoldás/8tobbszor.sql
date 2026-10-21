-- 8. feladat: akik tobbszor foglaltak el a hivatalt - nevuk es
-- uralkodasuk osszes ideje
SELECT uralkodo.nev, sum(hivatal.meddig - hivatal.mettol + 1) AS ossz
FROM uralkodo
JOIN hivatal ON uralkodo.azon = hivatal.uralkodo_az
GROUP BY uralkodo.azon, uralkodo.nev
HAVING count(*) > 1;
