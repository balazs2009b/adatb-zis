CREATE TABLE csapatok (
  csazon INTEGER,
  csnev TEXT,
  PRIMARY KEY (csazon)
);


CREATE TABLE pilotak (
  pazon INTEGER,
  pnev TEXT,
  szev INTEGER,
  csapat INTEGER,
  PRIMARY KEY (pazon),
  FOREIGN KEY (csapat) REFERENCES csapatok(csazon)
);

CREATE TABLE versenyek (
  vkod TEXT,
  datum TEXT,
  vnev TEXT,
  hely TEXT,
  kor INTEGER,
  hossz INTEGER,
  PRIMARY KEY (vkod)
);

CREATE TABLE eredmenyek (
  pilota INTEGER,
  nagydij TEXT,
  startpoz INTEGER,
  celpoz INTEGER,
  PRIMARY KEY (pilota, nagydij),
  FOREIGN KEY (pilota) REFERENCES pilotak(pazon),
  FOREIGN KEY (nagydij) REFERENCES versenyek(vkod)
);

