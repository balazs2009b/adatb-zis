-- Az egyes osztályfőnökökhöz tartozó tanulók átlagának átlaga.
-- Csak azoknál, akikhez tartozik tanuló (ezért JOIN, nem LEFT JOIN).
SELECT osztalyok.of, avg(diakok.atlag)
FROM osztalyok
JOIN diakok ON osztalyok.osztaly=diakok.osztaly
GROUP BY osztalyok.of;
