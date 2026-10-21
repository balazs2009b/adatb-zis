-- B. Hatvanas évek
-- Az 1960 és 1970 között (a határokkal együtt) Nobel-díjat nyert írók
-- neve és a díj éve, évszám szerint növekvő sorrendben.
SELECT szemely, ev
FROM iro
WHERE ev BETWEEN 1960 AND 1970
ORDER BY ev;
