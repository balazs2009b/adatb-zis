CREATE TABLE szobak (
  szazon INTEGER,
  sznev TEXT,
  agy INTEGER,
  potagy INTEGER,
  PRIMARY KEY (szazon),
  
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
  FOREIGN KEY (vendeg) REFERENCES vendegek(vsorsz);
  FOREIGN KEY (szoba) REFERENCES szobak(szazon);
);

