-- 7. feladat: az "Angol Anna" tanarno 2028.11.10-i orajara
-- regisztralt diakok neve, e-mail-cime es telefonszama
-- FIGYELEM: a datum az adatbazisban 2028.11-10 alakban van tarolva
-- (pont es kotojel keverve), ezert pontosan igy kell hivatkozni ra.
SELECT diakok.nev, diakok.email, diakok.telefon
FROM diakok
JOIN kapcsolo ON diakok.id = kapcsolo.diakid
JOIN orak ON kapcsolo.oraid = orak.id
WHERE orak.tanar = 'Angol Anna' AND orak.datum = '2028.11-10';
