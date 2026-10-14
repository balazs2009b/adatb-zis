CREATE TABLE szerzo (
  id INTEGER,
  nev TEXT NOT NULL,
  szulEv INTEGER NOT NULL,
  halEv INTEGER,
  nemzetiseg TEXT NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE konyv (
  id INTEGER,
  cim TEXT NOT NULL,
  szerzoId INTEGER NOT NULL,
  helyezes INTEGER NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (szerzoId) REFERENCES szerzo(id)
);
