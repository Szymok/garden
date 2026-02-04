---
title: EtLT (Hybrydowa Integracja Danych)
created: 2026-02-04
status: evergreen
category: Data Engineering
difficulty: intermediate
language: pl
tags:
  - etlt
  - elt
  - etl
  - cleaning
aliases:
  - Extract tweak Load Transform
  - Pre-processing
---
# 🎯 Definicja
**EtLT** (Extract, tweak, Load, Transform) to wariant podejścia [[ETL kontra ELT|ELT]], w którym dodajemy mały krok "t" (tweak/cleanup) przed załadowaniem danych. Chodzi o to, by usunąć dane wrażliwe (PII) lub naprawić krytyczne błędy formatu *zanim* dane trafią do chmury/hurtowni.

# 🔑 Kluczowe punkty
- **Po co?** Bezpieczeństwo (maskowanie PESEL/Kart) i zgodność techniczna (np. JSON jest zepsuty i wywali Load).
- **Gdzie?** Tweak dzieje się "w locie" (in-memory) na serwerze ekstrakcji (np. Airbyte worker).
- **Co dalej?** Po załadowaniu następuje właściwa, ciężka transformacja "T" (SQL/dbt).

# 📚 Szczegółowe wyjaśnienie
Czyste ELT ("Wgraj wszystko jak leci") bywa ryzykowne.
Jeśli wgrasz bazę klientów z niezaszyfrowanymi hasłami do BigQuery, masz incydent bezpieczeństwa.
Dlatego robimy **EtLT**:
1.  **Extract:** Pobierz dane.
2.  **tweak:** Zahaszuj hasła, usuń nulle z kluczy głównych.
3.  **Load:** Wgraj do BigQuery.
4.  **Transform:** Policz KPI.

# 💡 Przykład zastosowania
Import logów z aplikacji.
Logi zawierają tokeny sesji użytkowników (ryzyko!).
Skrypt Pythona pobiera logi (E), usuwa pole `session_token` (t), i wgrywa do S3 (L). Następnie Spark przetwarza to na raporty (T).

## 📌 Źródła
- Airbyte Documentation (Normalization concepts).

## 👽 Brudnopis
- "t" powinno być lekkie. Jeśli "t" zaczyna robić joiny i agregacje, wracasz do starego [[ETL]].
- Często nazywane "Light Transformation" lub "Sanitization".