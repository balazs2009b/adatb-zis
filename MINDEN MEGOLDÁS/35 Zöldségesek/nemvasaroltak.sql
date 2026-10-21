-- F. Nem vasaroltak
-- Az elozo parancsot felhasznalva: akik NEM vasaroltak.
SELECT nev
FROM vevok2
WHERE vevoazon NOT IN (SELECT vevo FROM vasarlasok);
