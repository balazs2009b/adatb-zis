CREATE TABLE gyumolcslevek (
  id INTEGER,
  gynev TEXT NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE partnerek (
  id INTEGER,
  kontakt TEXT NOT NULL,
  telepules TEXT NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE kiszallitasok (
  sorsz INTEGER,
  gyumleid INTEGER NOT NULL,
  partnerid INTEGER NOT NULL,
  datum TEXT NOT NULL,
  karton INTEGER NOT NULL,
  PRIMARY KEY (sorsz),
  FOREIGN KEY (gyumleid) REFERENCES gyumolcslevek(id),
  FOREIGN KEY (partnerid) REFERENCES partnerek(id)
);
