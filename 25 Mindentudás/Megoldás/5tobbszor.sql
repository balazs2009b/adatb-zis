-- 5. feladat: azok a tudosok, akik tobbszor szerepeltek.
-- A csoportositas az AZONOSITORA megy, nem csak a nevre, mert
-- a feladat szerint azonos nevu tudosok is vannak az adatbazisban.
SELECT tudos.nev, count(*) AS alkalmak
FROM tudos
JOIN kapcsolo ON tudos.id = kapcsolo.tudosid
GROUP BY tudos.id, tudos.nev
HAVING count(*) > 1;
