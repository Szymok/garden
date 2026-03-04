---
title: Transformation Plans (Ataccama)
created: 2026-02-04
status: evergreen
category: Ataccama ONE / DQ
difficulty: intermediate
language: en
tags:
  - transformation
  - plans
  - export
  - dq
  - profiles
aliases:
  - Post-processing plans
  - Plany transformacji
---
# 🎯 Definicja
**Transformation Plans** w Ataccama ONE to skrypty przetwarzania danych (.plan), które definiują przepływ danych: Odczyt -> Przetwarzanie -> Zapis.
Szczególnym przypadkiem są **Post-processing plans**, używane do eksportu wyników Data Quality.

# 🔑 Kluczowe punkty
- **Silnik:** Wykonuje je DPE (Data Processing Engine).
- **Graficzne:** Budujesz je z klocków (Reader, Component, Writer).
- **Eksport DQ:** Aby pobrać "Błędne rekordy" z Monitoringu w formacie Excel/CSV, musisz podpiąć Plan Transformacji (Post-processing planning).

# 📚 Szczegółowe wyjaśnienie
Plan składa się z kroków (Steps).
Typowy plan eksportu DQ:
1.  **DQ Result Reader:** Czyta wynik reguły z bazy Ataccamy.
2.  **Filter (opcjonalnie):** Np. "Pokaż tylko błędy krytyczne".
3.  **Text File Writer:** Zapisuje do pliku CSV.

# 💡 Przykład zastosowania
Użytkownik biznesowy widzi w raporcie DQ, że ma 50% błędów w adresach.
Chce listę tych błędnych adresów, żeby je poprawić w CRM.
Klika "Export". W tle uruchamia się Transformation Plan, który generuje plik CSV z identyfikatorami tych klientów.

## 📌 Źródła
- Ataccama ONE Documentation - Transformation Plans.

## 👽 Brudnopis
- To jest "low-code ETL" wbudowany w platformę. Można w nim robić bardzo skomplikowane rzeczy (łączyć z API, bazami danych), ale najczęściej służy do prostych raportów.
