-- E. Kontinensek
-- A díjazottak száma kontinensenként, csökkenő sorrendben.
SELECT fold.kontinens, count(*)
FROM iro
JOIN fold ON iro.szulhely = fold.azon
GROUP BY fold.kontinens
ORDER BY count(*) DESC;
