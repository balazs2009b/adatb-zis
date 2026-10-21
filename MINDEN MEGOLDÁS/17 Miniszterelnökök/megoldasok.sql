-- ============================================================
-- Miniszterelnökök - megoldások
-- Adatbázis: miniszter.db
-- Létrehozás: sqlite3 miniszter.db < miniszter.sql
-- ============================================================

-- 2. feladat: név és születési év, születési év szerint növekvően
SELECT nev, szul
FROM szemely
ORDER BY szul;

-- 3. feladat: akiknél a megbízás befejező éve azonos a halálozás évével
SELECT DISTINCT szemely.nev, szemely.szul, szemely.hal
FROM szemely
JOIN elnokok ON szemely.szem = elnokok.szem
WHERE elnokok.meddig = szemely.hal;

-- 4. feladat: ki volt miniszterelnök 1905-ben
SELECT szemely.nev
FROM szemely
JOIN elnokok ON szemely.szem = elnokok.szem
WHERE 1905 BETWEEN elnokok.mettol AND elnokok.meddig;

-- 5. feladat: kik voltak egynél többször, és hányszor
SELECT szemely.nev, count(*)
FROM szemely
JOIN elnokok ON szemely.szem = elnokok.szem
GROUP BY szemely.szem, szemely.nev
HAVING count(*) > 1
ORDER BY count(*) DESC;

-- 6. feladat: a leghosszabb ideig egyfolytában hivatalban lévő
SELECT szemely.nev, elnokok.meddig - elnokok.mettol AS hossz
FROM szemely
JOIN elnokok ON szemely.szem = elnokok.szem
ORDER BY hossz DESC
LIMIT 1;

-- 7. feladat: Teleki Pállal azonos településen születettek (ő nélküle)
SELECT nev
FROM szemely
WHERE hely = (SELECT hely FROM szemely WHERE nev = 'Teleki Pál')
  AND nev <> 'Teleki Pál';

-- 8. feladat: akik 50. életévük előtt lettek miniszterelnökök, ABC rendben
SELECT szemely.nev, elnokok.mettol - szemely.szul AS kor
FROM szemely
JOIN elnokok ON szemely.szem = elnokok.szem
WHERE elnokok.mettol - szemely.szul < 50
ORDER BY szemely.nev;
