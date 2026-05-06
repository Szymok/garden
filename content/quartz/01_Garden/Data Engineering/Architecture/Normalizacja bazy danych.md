---

title: Normalizacja bazy danych  
created: 2025-07-15  
status: 🌱 draft
category: InÅ¼ynieria danych  
difficulty: podstawowy  
language: pl  
tags:

- inÅ¼ynieria danych
- normalizacja
- relacyjne bazy danych
- projektowanie danych
- modelowanie relacyjne  
aliases:
- normal forms
- normalizacja relacyjna

---

# ðŸŽ¯ Definicja

**Normalizacja bazy danych** to proces systematycznego organizowania danych w relacyjnych bazach danych w taki sposÃ³b, aby zredukowaÄ‡ redundancjÄ™ i zapewniÄ‡ integralnoÅ›Ä‡ danych. Opiera siÄ™ na zestawie reguÅ‚ (tzw. form normalnych) zdefiniowanych przez Edgara F. Codda, twÃ³rcÄ™ modelu relacyjnego. DziÄ™ki normalizacji struktura bazy danych staje siÄ™ klarowna, spÃ³jna i Å‚atwa w utrzymaniu.

# ðŸ”‘ Kluczowe punkty

- Normalizacja eliminuje duplikaty danych i zapewnia spÃ³jnoÅ›Ä‡ informacji.
- KaÅ¼dy etap normalizacji (1NF, 2NF, 3NF itp.) eliminuje okreÅ›lony typ nieoptymalnej zaleÅ¼noÅ›ci.
- Proces bazuje na kluczach gÅ‚Ã³wnych, zaleÅ¼noÅ›ciach funkcjonalnych i dekompozycji tabel.
- Nadmiarowa dekompozycja moÅ¼e prowadziÄ‡ do zÅ‚oÅ¼onych zapytaÅ„ â€“ dlatego czasami stosuje siÄ™ denormalizacjÄ™.
- Normalizacja jest fundamentem projektowania OLTP (Online Transaction Processing), a nie OLAP.

# ðŸ“š SzczegÃ³Å‚owe wyjaÅ›nienie

## Kluczowe formy normalne

### ðŸ”¹ Pierwsza Forma Normalna (1NF)

- Tabela nie zawiera powtarzajÄ…cych siÄ™ grup (Å¼adnych kolumn tablicowych).
- KaÅ¼de pole zawiera tylko jednÄ… wartoÅ›Ä‡ (atomowoÅ›Ä‡).
- KaÅ¼dy wiersz ma unikalny identyfikator (klucz gÅ‚Ã³wny).

**PrzykÅ‚ad naruszenia**:

|ID|Produkty|
|---|---|
|1|Mleko, Chleb, MasÅ‚o|

**Po 1NF**:

|ID|Produkt|
|---|---|
|1|Mleko|
|1|Chleb|
|1|MasÅ‚o|

### ðŸ”¹ Druga Forma Normalna (2NF)

- SpeÅ‚nia 1NF.
- Wszystkie atrybuty nieprymarne sÄ… w peÅ‚ni zaleÅ¼ne od caÅ‚ego klucza gÅ‚Ã³wnego (nie tylko czÄ™Å›ci, jeÅ›li klucz jest zÅ‚oÅ¼ony).
- Usuwa zaleÅ¼noÅ›ci czÄ™Å›ciowe.

**PrzykÅ‚ad naruszenia**: jeÅ›li mamy tabelÄ™ z kluczem zÅ‚oÅ¼onym (np. <NumerZamÃ³wienia, ProduktID>), a kolumna ProduktNazwa zaleÅ¼y tylko od ProduktID, to konieczna jest dekompozycja.

### ðŸ”¹ Trzecia Forma Normalna (3NF)

- SpeÅ‚nia 2NF.
- Å»aden atrybut nieprymarny nie zaleÅ¼y tranzytywnie od klucza gÅ‚Ã³wnego.
- Eliminuje zaleÅ¼noÅ›ci przechodnie.

**PrzykÅ‚ad naruszenia**:  
JeÅ›li kolumna `Miasto` zaleÅ¼y od kolumny `KodPocztowy`, ktÃ³ra z kolei zaleÅ¼y od `IDKlienta`, to mamy zaleÅ¼noÅ›Ä‡ przechodniÄ… i naleÅ¼y wyodrÄ™bniÄ‡ `KodPocztowy` do osobnej tabeli.

## Denormalizacja â€“ celowe naruszenie reguÅ‚

**Denormalizacja** to intencjonalne wprowadzenie nadmiarowoÅ›ci danych w celu poprawy wydajnoÅ›ci odczytu lub uproszczenia modelu. Jest standardem w projektach analitycznych (OLAP, hurtownie danych), gdzie kluczowe sÄ… szybkoÅ›Ä‡ zapytaÅ„ i prostota modelu, a nie peÅ‚na spÃ³jnoÅ›Ä‡ transakcyjna.

**Kiedy stosowaÄ‡:**

- W modelach faktÃ³w i wymiarÃ³w (np. schemat gwiazdy).
- W narzÄ™dziach BI i dashboardach (eliminacja wielu joinÃ³w).
- Gdy dane sÄ… rzadko aktualizowane, a czÄ™sto odczytywane (np. raporty).

# ðŸ’¡ PrzykÅ‚ad zastosowania

W systemie sprzedaÅ¼y detalicznej tabela zamÃ³wieÅ„ zawiera informacje o kliencie, adresie dostawy oraz zamÃ³wionych produktach. W ramach 3NF dane o kliencie, adresie i produktach sÄ… trzymane w osobnych tabelach i doÅ‚Ä…czane przy pomocy kluczy. W hurtowni danych te same dane sÄ… denormalizowane do jednej tabeli analitycznej, zawierajÄ…cej powielenie nazw produktÃ³w i danych klientÃ³w â€“ wszystko po to, by umoÅ¼liwiÄ‡ szybkie agregacje bez potrzeby joinÃ³w.

## ðŸ“Œ Å¹rÃ³dÅ‚a

- [Wikipedia: Database Normalization](https://en.wikipedia.org/wiki/Database_normalization)
- [Vertabelo: What is Database Normalization?](https://vertabelo.com/blog/database-normalization-what-it-is-and-why-you-should-care/)
- [Kimball Group â€“ Denormalization in Dimensional Modeling](https://www.kimballgroup.com/)

# ðŸ‘½ Brudnopis

- 1NF: atomowoÅ›Ä‡, bez kolumn list
- 2NF: peÅ‚na zaleÅ¼noÅ›Ä‡ od caÅ‚ego klucza
- 3NF: bez przechodnich zaleÅ¼noÅ›ci
- OLTP: normalizacja dobra do aktualizacji, spÃ³jnoÅ›ci
- OLAP: denormalizacja â†’ uproszczenie i wydajnoÅ›Ä‡ raportowania
- Denormalizacja jako Å›wiadome zÅ‚amanie reguÅ‚ â†’ korzyÅ›ci w hurtowniach i BI
- PrzykÅ‚ad: tabele faktÃ³w sprzedaÅ¼y z nazwami produktÃ³w = duplicate but faster joins