-- 9. feladat: a szabad helyek attekintese
-- Oszlopok a minta szerinti sorrendben: datum, orasorszam, targy,
-- tanar, szabad. A szabad hellyel nem rendelkezo orak nem jelennek
-- meg -> HAVING. Rendezes a szabad helyek szama szerint csokkenoen.
SELECT orak.datum, orak.orasorszam, orak.targy, orak.tanar,
       orak.ferohely - count(kapcsolo.id) AS szabad
FROM orak
JOIN kapcsolo ON orak.id = kapcsolo.oraid
GROUP BY orak.id, orak.datum, orak.orasorszam, orak.targy, orak.tanar, orak.ferohely
HAVING szabad > 0
ORDER BY szabad DESC;
