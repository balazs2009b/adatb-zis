# Minden megoldás egy helyen

**Mind a 36 lecke kész.** Leckénként egy almappa. Minden almappa önálló:
a `.db` adatbázis és a parancsfájlok egymás mellett vannak, ezért bárhová
másolható, és ugyanúgy működik.

## Használat a VS Code-ban

1. Nyisd meg ezt a mappát a VS Code-ban (`File > Open Folder`).
2. Telepítsd az **SQLite3 Editor** (yy0931) kiegészítőt, ha még nincs.
3. Nyisd meg a lecke `.sqlite3-query` fájlját, és nyomd meg a **Run** gombot.

A fájlok elején lévő `-- database: <fájlnév>` sor mondja meg a kiegészítőnek,
melyik adatbázissal dolgozzon. Ez **relatív útvonal**, ezért a query fájlnak
és az adatbázisnak ugyanabban a mappában kell maradnia, és a query fájlnak
**mentve kell lennie**.

**Mind a 36 parancsfájl akárhányszor újrafuttatható.** Ellenőrizve: háromszor
egymás után lefuttatva mindegyik hibátlan, és a végállapot minden futtatás
után ugyanaz.

## Mi van egy lecke mappájában

    <lecke>/
      <adatbazis>.db            <- a kész, feltöltött adatbázis
      megoldas.sqlite3-query    <- ezt nyitod meg és futtatod (Run)
      *.sql                     <- a leadandó megoldásfájlok
      Eredeti feladat/          <- a tananyag eredeti fájljai

Az **Eredeti feladat** mappában a tanári anyag van, érintetlenül: a feladat
leírása (`.doc`, `.docx`, `.pdf`, `.ppt`) és az adatbázist létrehozó eredeti
forrásszkriptek. Bemutatáskor innen tudod felolvasni, mit kért a feladat, és
mellette megmutatni a megoldást. **Futtatni nem kell** semmit belőle — a `.db`
már fel van töltve.

Ami szándékosan **nincs** benne: a `*-prompt.txt` fájlok. Azok a saját
AI-promptjaid, nem a tananyag része, és leadott anyagban nincs helyük.

A **weblapos feladat** nem itt van, hanem a repó gyökerében:
`Weblap - Fenntarthatóság/fenntarthatosag.html`. Egyetlen önálló fájl, a CSS
és mind a három kép bele van építve, dupla kattintásra megnyílik bármelyik
böngészőben, internet nélkül is.

## A leckék

| Mappa | Adatbázis | Leadandó fájl(ok) |
|---|---|---|
| 01 Bevezetés | koltok.db | – |
| 02 Új adatbázis | koltok.db | export.sql |
| 03 Táblák kezelése | koltok.db | – |
| 04 Rendezés | koltok.db | – |
| 05 Szűrés | filmek.db | filmek.sql |
| 06 Összegzés | filmek.db | megoldas.sql |
| 07 Milliárdosok | milliardos.db | megoldas.sql, milliardos.sql |
| 08 Színészek | szineszek.db | – |
| 09 Repterek | repterek.db | – |
| 10 Országok | orszagok.db | – |
| 12 Több tábla | iskola.db | feladat.sql |
| 13 Idegen kulcs | iskola.db | – |
| 14 Maraton | maratonvalto.db | megoldasok.sql |
| 15 Nagy könyv | nagykonyv.db | megoldasok.sql |
| 16 Nobel | nobel.db | hatvanas, franciák, megosztva, kontinens, pablo, Dánia (.sql) |
| 17 Miniszterelnökök | miniszter.db | megoldasok.sql |
| 18 Vonatok | kovasut.db | megoldasok.sql |
| 19 Napsütés | napsutes.db | megoldasok.sql |
| 20 Öregfák | oregfak.db | megoldasok.sql |
| 21 Skills | skills.db | megoldasok.sql |
| 22 Fogadó | fogado.db | megoldasok.sql |
| 23 Nyelviskola | nyelviskola.db | megoldasok.sql |
| 24 Őstermelő | ostermelo.db | megoldasok.sql |
| 25 Mindentudás | mindentudas.db | 2cimek ... 6vegyes (.sql) |
| 26 Nyílt nap | nyiltnap.db | 2barnamalom ... 9szabad (.sql) |
| 27 Tervezés | konyvtar.db | konyvtar.sql |
| 28 Teke | teke.db | megoldasok.sql |
| 29 Beiskolázás | beiskolazas.db | megoldasok.sql |
| 30 Utazás | utazas.db | megoldasok.sql |
| 31 Troli | troli.db | megoldasok.sql |
| 32 Királyok | kiralyok.db | 2nevek ... 9hazak (.sql) |
| 33 Webshop | webshop.db | megoldasok.sql |
| 34 Forma-1 | forma1.db | megoldasok.sql |
| 35 Zöldségesek | zoldsegesek.db | kimitvett, legtobbalma, masol, vasaroltak, nemvasaroltak, torles (.sql) |
| 36 Tervezés 2 | szerelok.db | szerelok.sql |
| 37 Tervezés 3 | koncertek.db | koncertek.sql |

A 11. lecke nem létezik, a tananyag 10-ről 12-re ugrik.

## Mielőtt leadod

13 leadandó fájl fejlécében kitöltendő a neved és a dátum:

    -- Készítette: <IDE ÍRD A NEVED>        Dátum: <IDE ÍRD A DÁTUMOT>

Mindegyik a lecke `megoldasok.sql` fájlja:

- 14 Maraton
- 15 Nagy könyv
- 18 Vonatok
- 19 Napsütés
- 21 Skills
- 22 Fogadó
- 23 Nyelviskola
- 24 Őstermelő
- 28 Teke
- 29 Beiskolázás
- 31 Troli
- 33 Webshop
- 34 Forma-1

## Öt forrásfájl eredetileg NEM volt futtatható

Ezekhez javított másolat készült a Megoldás mappában, a hiba leírásával:

| Lecke | A hiba |
|---|---|
| 22 Fogadó | `tablak.sql`: felesleges vessző a PRIMARY KEY után, és két FOREIGN KEY sor pontosvesszőre végződik vessző helyett |
| 26 Nyílt nap | `nyiltnap.sql`: a FOREIGN KEY sor záró zárójel helyett pontosvesszőre végződik, utána felesleges `)` |
| 30 Utazás | `utazas.sql`: pontosvessző a PRIMARY KEY után, `COLLATE utf8mb4_hungarian_ci` és `AUTO_INCREMENT` (MySQL) |
| 32 Királyok | `kiralyokforras.sql`: csonka `COLLATE` megadás két oszlopnál |
| 12 Több tábla | a feladat XAMPP/MySQL/PHPMyAdmin-t ír elő, de a forrás SQLite |

## Adathibák, amikbe bele lehet futni

- **35 Zöldségesek:** a `mennyiseg` mezőben a tizedes elválasztó **vessző**, és
  a mező szöveg. Számoláskor az SQLite a vesszőnél levágja a számot,
  **hibaüzenet nélkül**: `'4,5' * 1 = 4`. Minden megoldásban
  `replace(mennyiseg, ',', '.')` szerepel.
- **18 Vonatok:** a `jaratSzam` 4 karakterre van szóközzel kitöltve, az
  541-es járat `'541 '`. A `WHERE jaratSzam='541'` nulla sort érint.
- **31 Troli, 17. feladat:** a feladat szövege „3 különböző járatot" ír, de a
  minta a hálózat sorait számolja. A minta szerinti változat a megoldás, a
  szöveg szerinti megjegyzésben mellette.
- **26 Nyílt nap:** a dátum `2028.11-08` alakú, pont és kötőjel keverve.
- **19 Napsütés, 33 Webshop:** az `AUTO_INCREMENT` miatt az `id` mező minden
  sorban NULL.
- **15 Nagy könyv:** J. K. Rowling kétszer szerepel, eltérő születési évvel.
- **30 Utazás:** a CL azonosítójú hotel neve `'TEXTm Life'` (valószínűleg
  'Charm Life' volt). Nem javítottam, feladat nem hivatkozik rá.
