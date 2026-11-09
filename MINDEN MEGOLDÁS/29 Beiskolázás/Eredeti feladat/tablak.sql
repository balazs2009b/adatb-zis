CREATE TABLE diakok (
  oktazon TEXT,
  nev TEXT NOT NULL,
  hozott INTEGER NOT NULL,
  kpmagy INTEGER NOT NULL,
  kpmat INTEGER NOT NULL,
  PRIMARY KEY (oktazon)
);

CREATE TABLE tagozatok (
  akod INTEGER,
  agazat TEXT NOT NULL,
  nyek INTEGER NOT NULL,
  PRIMARY KEY (akod)
);

CREATE TABLE jelentkezesek (
  diak TEXT,
  tag INTEGER,
  hely INTEGER NOT NULL,
  PRIMARY KEY (diak, tag),
  FOREIGN KEY (diak) REFERENCES diakok(oktazon),
  FOREIGN KEY (tag) REFERENCES tagozatok(akod)
);
