-- C. Alma
-- Melyik zoldseges adta el a legnagyobb mennyiseget almabol a nyar
-- folyaman, es mennyit.
-- A teljes adatbazis a 2009-es nyarat (junius-augusztus) tartalmazza.
SELECT zoldsegesek.nev,
       sum(replace(vasarlasok.mennyiseg, ',', '.')) AS mennyiseg
FROM vasarlasok
JOIN zoldsegesek ON vasarlasok.zoldseges = zoldsegesek.zoldsegesazon
JOIN zoldsegek ON vasarlasok.aru = zoldsegek.zoldsegazon
WHERE zoldsegek.nev = 'alma'
GROUP BY zoldsegesek.zoldsegesazon, zoldsegesek.nev
ORDER BY mennyiseg DESC
LIMIT 1;
