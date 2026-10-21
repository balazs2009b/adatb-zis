-- F. Pablo Neruda
-- Azok a díjazottak, akik Pablo Nerudával azonos kontinensen születtek.
-- A költő neve is szerepelhet az eredményben.
SELECT iro.szemely
FROM iro
JOIN fold ON iro.szulhely = fold.azon
WHERE fold.kontinens = (
    SELECT f2.kontinens
    FROM iro i2
    JOIN fold f2 ON i2.szulhely = f2.azon
    WHERE i2.szemely = 'Pablo Neruda'
);
