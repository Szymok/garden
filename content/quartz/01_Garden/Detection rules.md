---
title: Detection Rules (Reguły Wykrywania - Zbiór)
created: 2026-02-04
status: evergreen
category: Data Governance
difficulty: intermediate
language: pl
tags:
  - detection
  - catalog
  - automation
  - tagging
aliases:
  - Reguły Detekcyjne
  - Automatyczne Tagowanie
---
# 🎯 Definicja
**Detection Rules** (l. mnoga) to ogólny mechanizm w platformach Data Governance (takich jak Ataccama ONE czy Collibra), który pozwala na masowe skanowanie metadanych i próbek danych w poszukiwaniu wzorców biznesowych. Jest to silnik napędzający proces **Data Discovery**.

# 🔑 Kluczowe punkty
- **Skala:** Pozwala zarządzać tysiącami kolumn bez ręcznego przeglądania.
- **Hierarchia:** Można mieć reguły ogólne (np. "Wykryj Email") i specyficzne (np. "Wykryj Email Służbowy Firmy X").
- **AI/ML:** Nowoczesne systemy używają AI do sugerowania reguł ("Widzę, że te kolumny są podobne do tych, które oznaczyłeś jako Faktura").

# 📚 Szczegółowe wyjaśnienie
Gdy uruchamiasz "Full Profiling & Discovery":
1.  System pobiera próbkę danych z każdej kolumny.
2.  Uruchamia zestaw aktywnych **Detection Rules**.
3.  Dla każdego dopasowania oblicza "Confidence Score" (Pewność).
4.  Jeśli pewność > 80% (Threshold), termin przypisywany jest automatycznie.
5.  Jeśli 50-80%, termin trafia do "Suggestions" dla Data Stewarda.

# 💡 Przykład zastosowania
Migracja do chmury.
Musisz wiedzieć, które tabele zawierają dane osobowe.
Ustawiasz globalne reguły wykrywania dla: Imię, Nazwisko, Adres, Telefon.
Puszczasz skan na całej bazie on-premise.
Raport pokazuje: "W tych 150 tabelach mamy dane osobowe".

## 📌 Źródła
- "Data Governance: The Definitive Guide" - O'Reilly.
- Ataccama ONE Documentation.

## 👽 Brudnopis
- Różnica vs [[Detection Rule]]: Tutaj mówimy o całym systemie/mechanizmie, tam o pojedynczej definicji logicznej.
- Warto robić przegląd reguł raz na kwartał (czy nie dają fałszywych pozytywów?).