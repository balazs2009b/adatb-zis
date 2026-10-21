-- 5. feladat: hany kiraly volt 1601-tol 1700-ig
-- Az uralkodas csak reszben is eshet az idoszakba: akkor erinti,
-- ha a kezdet nem kesobbi 1700-nal ES a vege nem korabbi 1601-nel.
SELECT count(*)
FROM hivatal
WHERE mettol <= 1700 AND meddig >= 1601;
