-- C. Franciák
-- Franciaország Nobel-díjas írói.
SELECT iro.szemely
FROM iro
JOIN fold ON iro.szulhely = fold.azon
WHERE fold.orszag = 'Franciaország';
