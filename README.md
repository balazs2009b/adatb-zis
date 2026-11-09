# Adatbázis tananyag – megoldások

Mind a **36 lecke** megoldása kész, működő SQLite adatbázisokkal. A 11. lecke
nem létezik, a tananyag 10-ről 12-re ugrik.

## Bemutatáshoz: ezt nyisd meg

**`MINDEN MEGOLDÁS/`** – ebben az egy mappában benne van minden, leckénként
egy almappával. Nyisd meg a VS Code-ban (`File > Open Folder`), telepítsd az
**SQLite3 Editor** (yy0931) kiegészítőt, nyisd meg a lecke
`megoldas.sqlite3-query` fájlját, és nyomd meg a **Run** gombot.

Egy lecke almappája:

    <lecke>/
      <adatbazis>.db            a kész, feltöltött adatbázis
      megoldas.sqlite3-query    ezt futtatod (Run)
      *.sql                     a leadandó megoldásfájlok
      Eredeti feladat/          a tananyag eredeti fájljai (feladatleírás + forrásszkriptek)

Részletek, leckénkénti táblázat, a tananyagban talált hibák listája:
**`MINDEN MEGOLDÁS/OLVASS EL.md`**.

## Mi hol van

| Hely | Mi van ott |
|---|---|
| `MINDEN MEGOLDÁS/` | minden egy helyen, bemutatásra és leadásra – 36 almappa |
| `01 Bevezetés/` … `37 Tervezés 3/` | leckénként: eredeti tananyag + `Megoldás/` almappa |
| `Weblap - Fenntarthatóság/fenntarthatosag.html` | a weblapos feladat, egyetlen önálló fájl (CSS és képek beépítve) |
| `MEGOLDÁSOK.md` | részletes, leckénkénti leírás |

## Amit ellenőriztem

- Mind a 36 `.db` megnyílik, `PRAGMA integrity_check` = ok, egyik sem üres.
- Mind a 36 `.sqlite3-query` a saját mappájában lévő adatbázisra mutat.
- Mind a 36 parancsfájl **akárhányszor újrafuttatható**: háromszor egymás után
  lefuttatva hibátlan, és a végállapot minden futtatás után ugyanaz.
- Ahol a feladatlaphoz tartozott mintatáblázat (15, 18, 19, 21, 26, 31, 33),
  ott a megoldás kimenete soronként egyezik a mintával.

## Mielőtt leadod

13 lecke `megoldasok.sql` fájljának a fejlécében ki kell töltened a nevet és a
dátumot. A lista a `MINDEN MEGOLDÁS/OLVASS EL.md` „Mielőtt leadod" részében.
