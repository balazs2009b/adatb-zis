-- G. Dánia
-- Mely országok írói kaptak több Nobel-díjat Dániánál?
-- Az ország neve és a díjak száma, a díjak száma szerint csökkenően.
SELECT fold.orszag, count(*) AS db
FROM iro
JOIN fold ON iro.szulhely = fold.azon
GROUP BY fold.orszag
HAVING count(*) > (
    SELECT count(*)
    FROM iro i2
    JOIN fold f2 ON i2.szulhely = f2.azon
    WHERE f2.orszag = 'Dánia'
)
ORDER BY db DESC;
