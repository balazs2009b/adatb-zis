CREATE TABLE egyesuletek (
  id INTEGER,
  nev TEXT NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE versenyzok (
  rajtszam INTEGER,
  nev TEXT NOT NULL,
  egyid INTEGER NOT NULL,
  korcsop TEXT NOT NULL,
  PRIMARY KEY (rajtszam),
  FOREIGN KEY (egyid) REFERENCES egyesuletek(id)
);

CREATE TABLE eredmenyek (
  sorsz INTEGER,
  versenyzo INTEGER NOT NULL,
  teli INTEGER NOT NULL,
  tarolas INTEGER NOT NULL,
  ures INTEGER NOT NULL,
  PRIMARY KEY (sorsz),
  FOREIGN KEY (versenyzo) REFERENCES versenyzok(rajtszam)
);

