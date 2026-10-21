-- B. Junius
-- Melyik napon, melyik vevo, mit es milyen mennyisegben vasarolt,
-- es az egyes tetelekert mennyit fizetett.
-- Rendezes: elsodlegesen a vasarlas napja, masodlagosan a vevo neve.
--
-- FONTOS: a vasarlasok.mennyiseg mezoben a tizedes elvalaszto VESSZO
-- (pl. '4,5'), es a mezo szoveg tipusu. Szorzaskor az SQLite a
-- vesszonel levagja a szamot ('4,5' -> 4), HIBAUZENET NELKUL.
-- Ezert kell a replace(mennyiseg, ',', '.').
SELECT vasarlasok.datum,
       vevok.nev AS vevo,
       zoldsegek.nev AS aru,
       vasarlasok.mennyiseg,
       replace(vasarlasok.mennyiseg, ',', '.') * zoldsegek.egysegar AS ar
FROM vasarlasok
JOIN vevok ON vasarlasok.vevo = vevok.vevoazon
JOIN zoldsegek ON vasarlasok.aru = zoldsegek.zoldsegazon
WHERE vasarlasok.datum LIKE '2009-06%'
ORDER BY vasarlasok.datum, vevok.nev;
