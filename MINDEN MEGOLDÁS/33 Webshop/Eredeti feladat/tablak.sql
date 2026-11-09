create table termekek (
	id INTEGER AUTO_INCREMENT PRIMARY key,
    megnevezes TEXT not null UNIQUE,
    ar INTEGER
);

create table vevok (
	id INTEGER AUTO_INCREMENT PRIMARY key,
	nev TEXT not null,
	iranyitoszam TEXT,
	telepules TEXT,
	utcahazszam TEXT
);

create table szamlafej (
	id INTEGER AUTO_INCREMENT PRIMARY key,
	szamlaszam TEXT not null unique,
	kelt TEXT not null,
	teljesites TEXT not null,
	vevoid INTEGER not null,
	FOREIGN KEY (vevoid) REFERENCES vevok(id)
);

create table szamlatetel (
	id INTEGER AUTO_INCREMENT PRIMARY key,
	szamlafejid INTEGER not null,
	termekid INTEGER not null,
	mennyiseg INTEGER not null,
	mennyisegiegyseg TEXT not null,
	bruttoegysegar INTEGER not null,
	afaszazalek INTEGER not null,
	FOREIGN KEY (szamlafejid) REFERENCES szamlafej(id),
	FOREIGN KEY (termekid) REFERENCES termekek(id)
);