# Megoldások – SQLite tananyag

Minden lecke mappájában van egy `Megoldás` almappa. Az eredeti anyagok
(`Források`, `.doc`, `.docx`, prompt fájlok) érintetlenek maradtak.

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
