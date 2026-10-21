-- E. Vasaroltak
-- Azoknak a vevoknek az azonositoi a vevok2 tablabol, akik a nyar
-- folyaman vasaroltak. Minden vasarlo csak egyszer -> DISTINCT.
SELECT DISTINCT vevoazon
FROM vevok2
WHERE vevoazon IN (SELECT vevo FROM vasarlasok);
