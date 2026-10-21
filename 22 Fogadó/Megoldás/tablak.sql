-- ============================================================
-- JAVÍTOTT tábla-létrehozó parancsfájl
--
-- Az eredeti 22 Fogadó/Források/tablak.sql NEM FUTTATHATÓ, három
-- szintaktikai hiba van benne (ellenőrizve: "near ")": syntax error"):
--
--   1. szobak: a PRIMARY KEY (szazon) után VESSZŐ áll, de nem jön
--      utána újabb oszlop -> a záró ) előtt lóg egy vessző.
--   2. foglalasok: a két FOREIGN KEY sor végén PONTOSVESSZŐ van
--      vessző helyett. A pontosvessző lezárná a CREATE TABLE-t.
--   3. ugyanitt a második FOREIGN KEY után is pontosvessző.
--
-- Ez a javított változat. A táblák szerkezete változatlan.
-- ============================================================

CREATE TABLE szobak (
  szazon INTEGER,
  sznev TEXT,
  agy INTEGER,
  potagy INTEGER,
  PRIMARY KEY (szazon)
);

CREATE TABLE vendegek (
  vsorsz INTEGER,
  vnev TEXT,
  irsz INTEGER,
  PRIMARY KEY (vsorsz)
);

CREATE TABLE foglalasok (
  fsorsz INTEGER,
  vendeg INTEGER,
  szoba INTEGER,
  erk TEXT,
  tav TEXT,
  fo INTEGER,
  PRIMARY KEY (fsorsz),
  FOREIGN KEY (vendeg) REFERENCES vendegek(vsorsz),
  FOREIGN KEY (szoba) REFERENCES szobak(szazon)
);
