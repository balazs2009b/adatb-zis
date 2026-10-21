-- 6. feladat: milyen eloadasok voltak a "Mit tud az emberi agy?" cimu
-- eloadas evenek ugyanazon honapjaban. Az eloadas cime, eloadoja es
-- az eloado tudomanyterulete jelenjen meg.
-- Az ido eeee-hh-nn alakban van tarolva, ezert az elso 7 karakter
-- adja az evet es a honapot.
SELECT eloadas.cim, tudos.nev, tudos.terulet
FROM eloadas
JOIN kapcsolo ON eloadas.id = kapcsolo.eloadasid
JOIN tudos ON kapcsolo.tudosid = tudos.id
WHERE substr(eloadas.ido, 1, 7) = (
    SELECT substr(ido, 1, 7) FROM eloadas WHERE cim = 'Mit tud az emberi agy?'
);
