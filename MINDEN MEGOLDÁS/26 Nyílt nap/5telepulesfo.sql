-- 5. feladat: melyik telepulesrol hany diak erkezik,
-- a diakok szama szerint csokkeno sorrendben
SELECT telepules, count(*) AS diakok
FROM diakok
GROUP BY telepules
ORDER BY diakok DESC;
