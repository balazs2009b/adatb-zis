CREATE TABLE futok (
  fid INTEGER NOT NULL,
  fnev TEXT NOT NULL,
  szulev INTEGER NOT NULL,
  szulho INTEGER NOT NULL,
  csapat INTEGER NOT NULL,
  ffi INTEGER NOT NULL,
  PRIMARY KEY (fid)
);

CREATE TABLE eredmenyek (
  futo INTEGER,
  kor INTEGER NOT NULL,
  ido INTEGER NOT NULL,
  PRIMARY KEY (futo, kor),
  FOREIGN KEY (futo) REFERENCES futok(fid)
);

