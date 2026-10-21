# Minden megoldás egy helyen

Ez a mappa a 14 kidolgozott lecke megoldását tartalmazza, leckénként egy
almappában. Minden almappa önálló: a `.db` adatbázis és a parancsfájl
egymás mellett van, ezért bárhová másolható, és ugyanúgy működik.

## Használat a VS Code-ban

1. Nyisd meg ezt a mappát a VS Code-ban (`File > Open Folder`).
2. Telepítsd az **SQLite3 Editor** (yy0931) kiegészítőt, ha még nincs.
3. Nyisd meg a kívánt lecke `.sqlite3-query` fájlját, és nyomd meg a **Run** gombot.

A fájlok elején lévő `-- database: <fájlnév>` sor mondja meg a kiegészítőnek,
melyik adatbázissal dolgozzon. Ez **relatív útvonal**, ezért a query fájlnak
és az adatbázisnak ugyanabban a mappában kell maradnia, és a query fájlnak
**mentve kell lennie** (egy `Untitled` fájlnál a meghajtó gyökeréből indulna).

Minden parancsfájl **akárhányszor újrafuttatható**: az elején eldobja és
újraépíti a tábláit, ezért nem ad "already exists" hibát, és nem szaporítja
az adatokat.

## Mi van benne

| Mappa | Adatbázis | Leadandó fájl | Tartalom |
|---|---|---|---|
| 01 Bevezetés | koltok.db (evek 10) | – | első lekérdezések |
| 02 Új adatbázis | koltok.db (evek 11) | export.sql | CREATE TABLE, INSERT, .dump |
| 03 Táblák kezelése | koltok.db (evek 10, masolat 10) | – | UPDATE, DELETE, ALTER, RENAME |
| 04 Rendezés | koltok.db | – | ORDER BY, CREATE INDEX |
| 05 Szűrés | filmek.db (top10 10) | filmek.sql | WHERE, LIKE, AND/OR, DISTINCT |
| 06 Összegzés | filmek.db | megoldas.sql | count/sum/avg/min/max, GROUP BY, HAVING |
| 07 Milliárdosok | milliardos.db (adatok 5) | megoldas.sql, milliardos.sql | teljes 9 pontos feladatsor |
| 08 Színészek | szineszek.db (145) | – | 5 lekérdezés + segédlekérdezés |
| 09 Repterek | repterek.db (palyak 63) | – | INSERT, GROUP BY/HAVING, NOT IN |
| 10 Országok | orszagok.db (adatok 88) | – | length, LIKE, count/sum |
| 12 Több tábla | iskola.db (osztalyok 4, diakok 6) | feladat.sql | JOIN, LEFT JOIN, önkapcsolás |
| 13 Idegen kulcs | iskola.db (+ diakok2, diakok3) | – | FOREIGN KEY, RESTRICT, CASCADE |
| 14 Maraton | maratonvalto.db (futok 292) | megoldasok.sql | érettségi feladatsor |
| 15 Nagy könyv | nagykonyv.db (szerzo 103, konyv 153) | megoldasok.sql | érettségi feladatsor |

A "Leadandó fájl" oszlopban az szerepel, amit a feladat szövege külön kér.
Ahol nincs ilyen, ott a `.sqlite3-query` fájl a munka.

## Kitöltendő

A 07 Milliárdosok és a 14 Maraton leadandó fájljainak fejlécében szerepel:

    -- Készítette: <IDE ÍRD A NEVED>        Dátum: <IDE ÍRD A DÁTUMOT>

Ezeket írd át, mielőtt leadod.

## Még nincs kész

A 16-37. fejezet (Nobel, Miniszterelnökök, Vonatok, Napsütés, Öregfák,
Skills, Fogadó, Nyelviskola, Őstermelő, Mindentudás, Nyílt nap, Tervezés,
Teke, Beiskolázás, Utazás, Troli, Királyok, Webshop, Forma-1, Zöldségesek,
Tervezés 2-3) megoldása még hátravan. Ez a mappa 14 leckét tartalmaz.
