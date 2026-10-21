CREATE TABLE nyelvek (
  id INTEGER,
  nyelv TEXT NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE vizsgak (
  sorsz INTEGER,
  idopont TEXT NOT NULL,
  nyelvid INTEGER NOT NULL,
  szint TEXT NOT NULL,
  PRIMARY KEY (sorsz),
  FOREIGN KEY (nyelvid) REFERENCES nyelvek(id)
);

CREATE TABLE jelentkezesek (
  sorsz INTEGER,
  nev TEXT NOT NULL,
  mobil TEXT NOT NULL,
  szulev int NOT NULL,
  vizsga int NOT NULL,
  PRIMARY KEY (sorsz),
  FOREIGN KEY (vizsga) REFERENCES vizsgak(sorsz)
);
