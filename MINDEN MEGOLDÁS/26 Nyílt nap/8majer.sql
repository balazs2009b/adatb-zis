-- 8. feladat: a "Majer Melinda" nevu diakkal azonos telepulesrol
-- regisztralt diakok neve, Majer Melinda nelkul
SELECT nev
FROM diakok
WHERE telepules = (SELECT telepules FROM diakok WHERE nev = 'Majer Melinda')
  AND nev <> 'Majer Melinda';
