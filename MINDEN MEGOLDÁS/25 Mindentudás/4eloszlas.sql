-- 4. feladat: tudomanyteruletenkent az eloado tudosok szama,
-- a tudosok szama szerint csokkeno sorrendben
SELECT terulet, count(*) AS tudosok
FROM tudos
GROUP BY terulet
ORDER BY tudosok DESC;
