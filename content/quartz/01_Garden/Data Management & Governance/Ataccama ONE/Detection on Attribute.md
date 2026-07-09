---
title: Detection on Attribute (Wykrywanie na Atrybucie)
created: 2026-02-04
status: evergreen
category: Data Governance
difficulty: intermediate
language: pl
tags:
  - attribute
  - column-level
  - logic
  - profiling
aliases:
  - Wykrywanie na poziomie kolumny
  - Attribute Detection
---
# 🎯 Definicja
**Detection on Attribute** to proces aplikowania [[Detection Rule]] do konkretnego, pojedynczego atrybutu (kolumny). W przeciwieństwie do masowego skanowania całego katalogu, tutaj konfigurujemy lub weryfikujemy logikę dla specyficznego pola, często ręcznie nadpisując automatyczne sugestie.

# 🔑 Kluczowe punkty
- **Precyzja:** Pozwala dostroić wykrywanie dla trudnych przypadków (np. kolumna, która nazywa się `kod`, a zawiera `kod_pocztowy`).
- **Nadzór:** Steward może włączyć/wyłączyć konkretne reguły dla danej kolumny, jeśli automat się myli.
- **Kontekst:** Często używa metadanych atrybutu (Typ Danych, Długość, Nullability).

# 📚 Szczegółowe wyjaśnienie
W interfejsie Data Catalogu, wchodząc w szczegóły kolumny (Attribute Details), widzisz sekcję "Detection".
Możesz tam:
1.  Zobaczyć, dlaczego system przypisał termin "Miasto" (np. "Bo nazwa kolumny to `city_name`").
2.  Zmienić próg (Threshold) dla tej jednej kolumny.
3.  Dodać wymuszoną regułę.

# 💡 Przykład zastosowania
Kolumna `status` w tabeli Zamówienia.
Automat wykrył, że to "Status Zamówienia".
Ale w tabeli Pracownicy też jest kolumna `status`. Automat też chce dać "Status Zamówienia".
Steward wchodzi w `Pracownicy.status` i wyłącza tę regułę, ręcznie przypisując termin "Status Zatrudnienia".

## 📌 Źródła
- [[Ataccama|Ataccama]] ONE Documentation.

## 👽 Brudnopis
- To poziom "mikro-zarządzania" procesem discovery.
- Przydaje się przy False Positives.