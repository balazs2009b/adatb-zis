-- D. Megosztva
-- Azok az évek, amikor többen kapták a díjat, és az adott évi díjazottak
-- száma. Minden év csak egyszer, más mező nem jelenhet meg.
SELECT ev, count(*)
FROM iro
GROUP BY ev
HAVING count(*) > 1;
