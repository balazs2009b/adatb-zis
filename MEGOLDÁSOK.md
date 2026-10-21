# Megoldások – SQLite tananyag

Minden lecke mappájában van egy `Megoldás` almappa. Az eredeti anyagok
(`Források`, `.doc`, `.docx`, prompt fájlok) érintetlenek maradtak.

**Bemutatáshoz és leadáshoz a `MINDEN MEGOLDÁS/` mappát használd:** ott minden
egy helyen van, leckénként egy almappában, és minden almappában ott van az
`Eredeti feladat/` alkönyvtár is a tananyag eredeti feladatleírásával és
forrásszkriptjeivel. Lásd `MINDEN MEGOLDÁS/OLVASS EL.md`.

A weblapos feladat külön van: `Weblap - Fenntarthatóság/fenntarthatosag.html`.

## Használat VS Code-ban

1. Telepítsd a **SQLite3 Editor** (yy0931) kiegészítőt.
2. Nyisd meg a lecke `Megoldás` mappáját (vagy az egész repót).
3. Kattints a `.db` fájlra – a SQLite3 Editor táblázatos nézetben nyitja meg.
4. Nyomd meg a **Query Editor** gombot, és nyisd meg mellé a `.sqlite3-query`
   / `.sqlite-query` / `.sql` fájlt, hogy futtathasd a parancsokat.

A `.db` fájlok mind valódi, feltöltött SQLite adatbázisok, a leckék
végállapotával. Nem kell semmit importálni hozzájuk.

## Mi van az egyes mappákban

| Mappa | Adatbázis | Parancsfájl | Tartalom |
|---|---|---|---|
| 01 Bevezetés | `koltok.db` (evek, 10 sor) | `megoldas.sqlite3-query` | fogalmak (adatbázis / rekord / mező / SQL), `SELECT * FROM tanulok;` |
| 02 Új adatbázis | `koltok.db` (evek, 11 sor) | `parancsok.sqlite3-query`, `export.sql` | tábla létrehozása, 11 INSERT, dump, a `tanulok` tábla feladat megoldása |
| 03 Táblák kezelése | `koltok.db` (evek 10 + masolat 10) | `parancsok.sqlite3-query` | UPDATE, DELETE, tábla másolása, ALTER TABLE, parancs–leírás párosítás |
| 04 Rendezés | `koltok.db` (index + javított masolat) | `koltok.sqlite3-query` | ORDER BY, LIMIT, CREATE INDEX, BETWEEN, NULL, számított mezők |
| 05 Szűrés | `filmek.db` (top10, 10 sor) | `megoldas.sqlite3-query`, `filmek.sql` | LIKE, AND/OR, julianday, DISTINCT |
| 06 Összegzés | `filmek.db` | `megoldas.sql` (+ `.sqlite3-query`) | count/sum/avg/min/max, GROUP BY, HAVING |
| 07 Milliárdosok | `milliardos.db` (adatok, 5 sor) | `megoldas.sql` (+ `.sqlite3-query`), `milliardos.sql` | a teljes 9 pontos feladatsor |
| 08 Színészek | `szineszek.db` (145 sor) | `megoldas.sqlite3-query` | 5 lekérdezés + Grace Kelly segédlekérdezés |
| 09 Repterek | `repterek.db` (palyak, 63 sor) | `megoldas.sqlite3-query` | INSERT, GROUP BY/HAVING, terület-segédlekérdezés, NOT IN |
| 10 Országok | `orszagok.db` (adatok, 88 sor) | `megoldas.sqlite3-query` | length, LIKE, count/sum, két segédlekérdezés |

Az eredmények minden lekérdezésnél megjegyzésként a parancs alatt vannak.

## Hibák a tananyagban, amikbe belefutottam

- **03. lecke, D. rész:** `INSERT INTO evek2 ... SELECT ... FROM evek2;` –
  az eredeti táblából kell másolni, tehát `FROM evek`. A megoldásban javítva.
- **02. lecke, E. rész:** `sqlite3 k2.db .dump > export.sql` – a lecke
  adatbázisa `koltok.db`, ezt használtam.
- **05. lecke:** a `Források` mappában nincs `filmek.sql`, csak `filmek.csv`.
  A CSV-ből előállítottam a `filmek.sql`-t, ebből készül a `filmek.db`.
- **10. lecke, A. rész:** `sqlite3 orszagok.db < repterek.sql` – helyesen
  `orszagok.sql`.
- **10. lecke, 1. feladat:** a 2–3. helyen holtverseny van (Amerikai Egyesült
  Államok és Közép-Afrikai Köztársaság is 25 karakter), a `LIMIT 3` ezért
  önkényesen választ.
- **02. lecke:** a lecke végén `DROP TABLE evek` szerepel, de a 3. lecke
  ugyanezt a táblát használja tovább. A parancsot megjegyzésben hagytam,
  a tábla megmaradt.

## Futtatási csapdák

- **Az építő `.sql` fájlok csak EGYSZER futnak le.** A `repterek.sql`,
  `szineszek.sql`, `orszagok.sql`, `filmek.sql`, `milliardos.sql` létrehozzák
  és feltöltik a táblát. Ha egy már feltöltött adatbázison futtatod őket
  másodszor, ezt a hibát kapod:

  ```
  table `palyak` already exists
  ```

  Nem elírás a fájlban – az adatbázis már készen van. Ilyenkor **ne az építő
  fájlt futtasd**, hanem a `megoldas.sqlite3-query`-t. Ha tiszta újraépítés
  kell, előbb törölni kell a táblát:

  ```sql
  DROP TABLE palyak;
  ```

  és csak utána futtatható újra a `repterek.sql`.

- **A 02/03/07/09 mappák `megoldas`/`parancsok` fájljai is tartalmaznak
  adatmódosító parancsot** (`CREATE TABLE`, `INSERT`). A mellettük lévő
  adatbázis már a fájl végállapotát tartalmazza, ezért az egész fájl újbóli
  lefuttatása duplikált sorokat vagy „already exists" hibát ad. Erre
  figyelmeztető megjegyzés került a fájlok elejére.

- **A query fájlnak mentve kell lennie**, és ugyanabban a mappában, mint az
  adatbázis. Egy `Untitled` (nem mentett) fájlnál a `-- database: <db>`
  relatív útvonala a meghajtó gyökeréből indul, és
  `The file file:///<db> does not exist` hibát ad.

## 12-37. fejezetek (folyamatban)

A main `72a1944` commitja 26 új fejezetet tett fel (12 Több tábla ... 37 Tervezés 3).
Ezek sorban készülnek, fejezetenként pusholva.

| Mappa | Adatbázis | Parancsfájl | Mit tanít |
|---|---|---|---|
| 12 Több tábla | `iskola.db` (osztalyok 4, diakok 6) | `megoldas.sqlite3-query`, `feladat.sql` | JOIN, LEFT JOIN, önkapcsolás, GROUP BY két táblán |
| 13 Idegen kulcs | `iskola.db` (+ diakok2, diakok3) | `megoldas.sqlite3-query` | FOREIGN KEY, RESTRICT, ON UPDATE/DELETE CASCADE |
| 14 Maraton | `maratonvalto.db` (futok 292, eredmenyek 312) | `megoldasok.sql` (+ `.sqlite3-query`) | érettségi feladatsor: INSERT, számított mező, JOIN, LIMIT, GROUP BY |
| 15 Nagy könyv | `nagykonyv.db` (szerzo 103, konyv 153) | `megoldasok.sql` (+ `.sqlite3-query`) | érettségi feladatsor: DISTINCT, IS NULL, min(), HAVING |

### Hibák a 12-13. fejezetben

- **12. lecke, A. pont:** XAMPP-ot, MySQL szervert és PHPMyAdmin-t ír elő, de a
  mellékelt `iskola.sql` SQLite-szintaxisú (`TEXT` / `REAL` / `INTEGER PRIMARY KEY`),
  és a 13. lecke is kifejezetten az SQLite viselkedéséről beszél. SQLite-ban készült,
  ahogy az 1-10. fejezet.
- **13. lecke:** az SQLite-ban az idegen kulcs **alapértelmezésben ki van kapcsolva**.
  `PRAGMA foreign_keys = ON` nélkül a C. és D. pont hibaüzenetei nem jönnek: a hibás
  `INSERT` simán lefut. A lecke ezt nem említi, pedig nélküle az egész C-D. pont
  nem mutat semmit. (Ellenőrizve: `fk=OFF` -> lefut, `fk=ON` -> `FOREIGN KEY constraint failed`.)
- **13. lecke, D. pont:** a lecke szerint az `UPDATE osztalyok SET osztaly='1C'`
  „működik". **Nem működik**, amíg a C. pontban készített `diakok2` tábla létezik:
  annak idegen kulcsa RESTRICT, és az blokkolja a szülő módosítását - a `diakok3`
  CASCADE-je ezen nem segít. Előbb `DROP TABLE diakok2;` kell.
  (Ellenőrizve: diakok2 megvan -> hiba; eldobva -> lefut és kaszkádol.)

### Megjegyzések a 14-15. fejezethez

- **14. Maraton, 3. feladat:** Tóth Antalnak (1044) a feladat előtt *egyetlen*
  eredménye sem volt a táblában, nem csak a 4. köre hiányzott.
- **14. Maraton, 7. feladat:** a 104-es csapat csak a 3. feladatban beírt
  15 765 másodperc miatt lesz utolsó. Minden más köridő 1702 és ~4000 s közötti
  (átlag 2446 s); a 15 765 s = 4 óra 22 perc 7 km-re. A feladat adja így, ezért
  nem változtattam rajta, de kiugró érték.
- **15. Nagy könyv:** a `szerzo` táblában **J. K. Rowling kétszer szerepel**, két
  külön azonosítóval (`J. K. Rowling` 1965 és `Joanne Kathleen Rowling` 1956),
  eltérő születési évvel. Ugyanaz a személy - a feladatsor adathibája. A feladatok
  szövege kifejezetten engedi a név szerinti csoportosítást, ezért a megoldásokat
  nem befolyásolja.
- Mind a négy lekérdezés eredménye **pontosan egyezik a vizsgafeladat PDF-jében
  közölt mintával** (3.: angol/francia/amerikai; 4.: Böszörményi 41, Dan Brown 41,
  Rowling 40; 5.: Gárdonyi 1, Molnár 2, Szabó Magda 3; 6.: Szabó Magda 5, majd a
  négykönyvesek ábécé rendben).

## Minden parancsfájl újrafuttatható (Run gomb)

Eredetileg a 02/03/07/09/13/14. fejezet fájljai csak lépésenként futtatva működtek,
a fejlécükben figyelmeztetéssel. Ez a gyakorlatban nem elég: a Run gomb az **egész
fájlt egyben** futtatja, és akkor elhasalnak. Két fajta hiba volt:

- **Látható hiba:** `table ... already exists`, `UNIQUE constraint failed`,
  `no such table: diakok` - a futás megszakad.
- **Néma hiba (rosszabb):** a 09. fejezet `INSERT`-je hibaüzenet nélkül szúrt be
  egy újabb Tököl-sort minden futtatáskor (63 -> 64 -> 65 ...), csendben elrontva
  az adatokat.

Javítás: minden érintett fájl az elején eldobja és újraépíti a tábláit
(`DROP TABLE IF EXISTS`), illetve a beszúrás elé törlés került. A 13. fejezetben a
szándékosan hibázó parancsok (ezeket tanítja a lecke) megjegyzésbe kerültek a
pontos hibaüzenetükkel - azokat külön kell futtatni a sor melletti háromszöggel.

**Ellenőrizve:** mind a 14 parancsfájl háromszor egymás után lefuttatva hibátlan,
és a végállapot minden futtatás után ugyanaz:

| Mappa | Végállapot 3 futtatás után |
|---|---|
| 01 Bevezetés | evek 10 |
| 02 Új adatbázis | evek 11 |
| 03 Táblák kezelése | evek 10, masolat 10 |
| 04 Rendezés | evek 10, masolat 10 |
| 05 Szűrés | top10 10 |
| 06 Összegzés | top10 10 |
| 07 Milliárdosok | adatok 5 |
| 08 Színészek | szineszek 145 |
| 09 Repterek | palyak 63 |
| 10 Országok | adatok 88 |
| 12 Több tábla | osztalyok 4, diakok 6 |
| 13 Idegen kulcs | osztalyok 3, diakok 6, diakok3 4 |
| 14 Maraton | futok 292, eredmenyek 312 |
| 15 Nagy könyv | szerzo 103, konyv 153 |

A leadandó `megoldasok.sql` / `megoldas.sql` / `feladat.sql` fájlok NEM változtak:
azokban csak az marad, amit a feladat kér.
