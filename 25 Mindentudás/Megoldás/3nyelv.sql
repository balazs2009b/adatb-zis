-- 3. feladat: azok az eloadasok, amelyek cime a "nyelv" szoreszletet
-- tartalmazza. Az eloado tudos neve es az eloadas cime jelenjen meg.
SELECT tudos.nev, eloadas.cim
FROM eloadas
JOIN kapcsolo ON eloadas.id = kapcsolo.eloadasid
JOIN tudos ON kapcsolo.tudosid = tudos.id
WHERE eloadas.cim LIKE '%nyelv%';
