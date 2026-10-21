-- 3. feladat: mikor lehet "angol" nyelvorat latogatni
-- Datum, terem neve, ora sorszama; datum, azon belul orasorszam szerint
SELECT datum, terem, orasorszam
FROM orak
WHERE targy = 'angol'
ORDER BY datum, orasorszam;
