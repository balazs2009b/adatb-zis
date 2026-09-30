-- database: filmek.db

-- ==========================================================
-- 6. Összegzések
-- ==========================================================

-- --- B. Összegzések ---------------------------------------
SELECT count(*) AS Darab FROM top10;
-- Eredmény: 10 film

SELECT sum(nezo) AS Nézőszám FROM top10;
-- Eredmény: 145 548 néző

SELECT avg(bevetel) AS Átlag FROM top10;
-- Eredmény: 146 217 883,8 Ft

SELECT max(bevetel) AS Legnagyobb,min(bevetel) AS Legkisebb FROM top10;
-- Eredmény: legnagyobb 368 634 982, legkisebb 16 988 425

-- "Ezt másképp is meg lehetett volna oldani, külön lépésben. Hogyan?"
-- Két külön paranccsal:
SELECT max(bevetel) AS Legnagyobb FROM top10;
SELECT min(bevetel) AS Legkisebb FROM top10;
-- Vagy rendezéssel + LIMIT-tel:
SELECT cim,bevetel FROM top10 ORDER BY bevetel DESC LIMIT 1;
SELECT cim,bevetel FROM top10 ORDER BY bevetel LIMIT 1;

SELECT sum(nezo) AS Néző FROM top10 WHERE mufaj='animációs';
-- Eredmény: 23 953 néző

-- --- C. Csoportosítás -------------------------------------
SELECT mufaj,sum(nezo) AS Néző FROM top10 GROUP BY mufaj;

SELECT mufaj,sum(nezo) AS Néző FROM top10 GROUP BY mufaj ORDER BY Néző DESC;

SELECT mufaj,sum(nezo) AS Néző
FROM top10
GROUP BY mufaj
HAVING Néző>20000
ORDER BY Néző DESC;
-- Eredmény: vígjáték 41 562, thriller 28 680, animációs 23 953


-- ==========================================================
-- D. Feladat - megoldás
-- ==========================================================

-- Mennyi bevételt hoztak összesen a 100 percnél hosszabb filmek?
SELECT sum(bevetel) AS Bevétel FROM top10 WHERE hossz>100;
-- Eredmény: 1 010 626 316 Ft
