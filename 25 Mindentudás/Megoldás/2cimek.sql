-- 2. feladat: a 2006-ban elhangzott eloadasok cime es datuma, abc rendben
SELECT cim, ido
FROM eloadas
WHERE ido LIKE '2006%'
ORDER BY cim;
