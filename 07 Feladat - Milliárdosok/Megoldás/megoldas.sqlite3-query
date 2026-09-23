-- database: milliardos.db
--
-- FIGYELEM: a mellette lévő adatbázis már TARTALMAZZA ennek a fájlnak
-- a végállapotát. Ha az egész fájlt újra lefuttatod, a tábla-létrehozó
-- és adatbevivő parancsok hibát adnak ("already exists" / "no such table").
-- Lépésenként futtasd a parancsokat, vagy kezdj egy üres adatbázissal!
--

-- ==========================================================
-- 7. Feladat - Milliárdosok (2013-as adatok)
-- ==========================================================

-- --- 2. feladat: az adatok tábla létrehozása --------------
CREATE TABLE adatok (
  helyezes INTEGER PRIMARY KEY,   -- hányadik a listán
  nev TEXT,                       -- név
  vagyon REAL,                    -- becsült vagyon milliárd dollárban
  ev INTEGER,                     -- születési év
  ceg TEXT,                       -- cége neve
  orszag TEXT                     -- ország
);

-- --- 3. feladat: adatok feltöltése ------------------------
INSERT INTO adatok VALUES(1,'Carlos Slim Helu',73,1940,'telecom','Mexikó');
INSERT INTO adatok VALUES(2,'Bill Gates',67,1956,'Microsoft','USA');
INSERT INTO adatok VALUES(3,'Amancio Ortega',57,1936,'Zara','Spanyolország');
INSERT INTO adatok VALUES(4,'Warren Buffett',53.5,1931,'Berkshire Hathaway','USA');
INSERT INTO adatok VALUES(5,'Larry Ellison',43,1945,'Oracle','USA');

SELECT * FROM adatok;

-- --- 4. feladat: exportálás -------------------------------
-- Terminálban:
--     sqlite3 milliardos.db .dump > milliardos.sql
-- Az eredmény a milliardos.sql fájl ebben a mappában.

-- --- 5. feladat -------------------------------------------
-- Kik voltak 2013-ban 70 és 79 év közöttiek? Név és kor, névsorban.
SELECT nev AS Név, 2013-ev AS Kor
FROM adatok
WHERE 2013-ev BETWEEN 70 AND 79
ORDER BY nev;
-- Eredmény: Amancio Ortega 77, Carlos Slim Helu 73

-- --- 6. feladat -------------------------------------------
-- Az USA-beli milliárdosok helyezése, neve és vagyona forintban
-- (1 dollár = 280 Ft; a vagyon milliárd dollárban van, így az
--  eredmény milliárd forintban értendő).
SELECT helyezes AS Helyezés, nev AS Név, vagyon*280 AS Vagyon
FROM adatok
WHERE orszag='USA';
-- Eredmény: 2 Bill Gates 18760, 4 Warren Buffett 14980, 5 Larry Ellison 12040

-- --- 7. feladat -------------------------------------------
-- Az 1950 előtt születettek vagyonának átlaga (dollárban).
SELECT avg(vagyon) AS Átlag
FROM adatok
WHERE ev<1950;
-- Eredmény: 56,625 milliárd dollár

-- --- 8. feladat -------------------------------------------
-- Országonként a milliárdosok száma, darabszám szerint csökkenően.
SELECT orszag, count(*) AS Darab
FROM adatok
GROUP BY orszag
ORDER BY Darab DESC;
-- Eredmény: USA 3, Mexikó 1, Spanyolország 1
