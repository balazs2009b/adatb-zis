-- G. Torles
-- Az elozo feladat megoldasat alakitjuk at: a SELECT helyett DELETE.
DELETE FROM vevok2
WHERE vevoazon NOT IN (SELECT vevo FROM vasarlasok);
