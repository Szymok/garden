---
title: Warstwy Przetwarzania MDM
created: 2026-02-04
status: sapling
category: Tech
difficulty: advanced
language: pl
tags:
  - ataccama
  - mdm
  - etl
  - data-quality
  - layers
aliases:
  - MDM Processing Layers
  - Cleansing Matching Merging
---
# 🎯 Definicja
Sekwencja etapów przetwarzania danych w systemie MDM, przekształcająca surowe dane wejściowe w spójny "Złoty Rekord".

# 🔑 Kluczowe punkty
- **Cleansing (Czyszczenie):** Standaryzacja formatów (daty, telefony, adresy), parsowanie, walidacja słownikowa.
- **Matching (Dopasowywanie):** Identyfikacja duplikatów wewnątrz źródła i pomiędzy źródłami (rozmyte dopasowywanie - Fuzzy Logic).
- **Mastering/Merging (Scalanie):** Tworzenie jednego rekordu z grupy duplikatów (wybór najlepszych wartości atrybutów).
- **Source Mapping:** Mapowanie systemów źródłowych na Warstwę Instancji.

# 📚 Szczegółowe wyjaśnienie
Proces MDM w Ataccama ONE jest zorganizowany w potok (pipeline):
1. **Source Systems:** Pobranie danych.
2. **Instance Model & Mapping:** Zapisanie w modelu kanonicznym.
3. **Cleansing Layer:** "Sprzątanie" danych. Ataccama generuje domyślne plany czyszczenia, które można dostosować.
4. **Matching Layer:** Najtrudniejszy etap. Decyzja, czy "Jan Kowalski" i "J. Kowalski" to ta sama osoba. Zbyt luźne reguły = fałszywe połączenia (False Positives). Zbyt restrykcyjne = nie wykrycie duplikatów.
5. **Master Layer:** Przechowywanie wyników. Możliwość definicji wielu "Golden Records" (np. Złoty Klient Marketingowy vs Złoty Klient Prawny).

# 💡 Przykład zastosowania
Reguła w **Matching Layer**:
- Jeśli `Nazwisko` jest identyczne (fonetycznie)
- ORAZ `PESEL` jest identyczny (lub jeden jest pusty)
- ORAZ `Adres E-mail` jest identyczny
-> Uznaj za kandydata do pary (Match Candidate).

## 📌 Źródła


## 👽 Brudnopis
Match Merge Validity Check Remove invalid characters & Replace records with correct ones taken from an existing list of alternatives Decide whether to link (group) the current record with another Merge multiple records into a Single one Check master values

Ataccama Database Layers & Processes
![[Pasted image 20250905134538.png]]

![[Pasted image 20250905134616.png]]

![[lchan71zrtyc-03_AtaccamaMDMDataLayers-5.png]]


Instance Model
The first step of any MDM project is the creation of the Instance Model (1M). The model defines how the data is structured, how the entities are related, and where the data comes from. The IDE provides an easy-to-use GUI for this which does most of the configuration automatically.

Source Systems
This part deals with defining source systems and their entities and relationships These can be different from the instance entities and relationships, so it is necessary to map each source system to the instance layer. Another important part is the generation Of load plans which are used to load data from the source systems to the MDM Database.

Cleansing Layer
Cleansing is a common part of any project. The incoming data usually needs to be cleansed before it can be processed further (matched, merged etc.). Default cleansing plans are created automatically for every entity. They serve as a decent basis for adding custom data transformations required by your project.

Matching Layer
Matching is essential for any MDM ject Creating and maintaining ffective matching rules can be tricky, s it needs to be precise enough to liminate incorrect matches, but also •mple enough to not slow down the rmance of the whole MDM lution.

Master Model
Once all data is correctly cleansed, matched etc., the master layer comes into play. The master layer serves as a destination for the master records - the „best" records picked from all the candidate records based on customizable criteria. It is possible to define multiple masters.

Merge Layer
The last part of the MDM project is to define how the data will be merged into a single master record which best represents the given entity (person, address, product etc.). This includes configuring the target systems and how the data will be delivered to these target systems from MDC

MDM Web App
This optional part allows access to both master and instance records via a user-friendly web application. This comes with multiple benefits as it allows end users to easily edit or create records, display data through custom filters, define various access levels via permissions, and more.