-- 4. feladat: a 9. evfolyamon latogathato matematika es fizika orak
-- Minden 9. evfolyamos csoport neve 9-cel kezdodik -> LIKE '9%'
SELECT csoport, targy, datum
FROM orak
WHERE csoport LIKE '9%' AND targy IN ('matematika', 'fizika')
ORDER BY targy;
