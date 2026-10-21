-- ============================================================
-- Troli - megoldasok
-- Keszitette: <IDE IRD A NEVED>        Datum: <IDE IRD A DATUMOT>
-- Adatbazis: troli.db
-- ============================================================

-- 12. feladat:
INSERT INTO megallok (id, nev) VALUES (198, 'Kőbányai garázs');

-- 13. feladat:
UPDATE jaratok SET elsoAjtos = 0 WHERE id = 20;

-- 14. feladat:
SELECT jaratSzam FROM jaratok WHERE elsoAjtos = 1;

-- 15. feladat:
SELECT nev FROM megallok WHERE nev LIKE '%sétány' ORDER BY nev;

-- 16. feladat:
SELECT halozat.sorszam AS sorszam, megallok.nev AS megallo
FROM halozat
JOIN jaratok ON halozat.jarat = jaratok.id
JOIN megallok ON halozat.megallo = megallok.id
WHERE jaratok.jaratSzam = 'CITY' AND halozat.irany = 'A'
ORDER BY halozat.sorszam;

-- 17. feladat:
-- A minta szerinti valtozat (lasd a .sqlite3-query fajlban a
-- reszletes magyarazatot: a minta a halozat sorait szamolja).
SELECT megallok.nev AS megallo, count(*) AS jaratokSzama
FROM megallok
JOIN halozat ON megallok.id = halozat.megallo
GROUP BY megallok.id, megallok.nev
HAVING count(*) >= 3;
