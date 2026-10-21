CREATE TABLE szakma (
  id TEXT,
  szakmaNev TEXT NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE orszag (
  id TEXT,
  orszagNev TEXT NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE versenyzo (
  id INTEGER,
  nev TEXT NOT NULL,
  szakmaId TEXT NOT NULL,
  orszagId TEXT NOT NULL,
  pont INTEGER NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (szakmaId) REFERENCES szakma(id),
  FOREIGN KEY (orszagId) REFERENCES orszag(id)
);
