---
title: Data Sources (Ataccama)
created: 2026-02-04
status: evergreen
category: Ataccama ONE / Catalog
difficulty: basic
language: en
tags:
  - access
  - connectivity
  - jdbc
  - s3
  - snowflake
aliases:
  - Źródła Danych
  - Konfiguracja Połączeń
---
# 🎯 Definicja
**Data Sources** w [[Ataccama|Ataccama]] ONE to "wtyczki" do Twoich systemów.
Zanim zaczniesz cokolwiek robić (profilować, katalogować), musisz zdefiniować Źródło.
Może to być baza danych (Oracle, Postgres), chmura (S3, Azure Blob), API (Salesforce) lub plik.

# 🔑 Kluczowe punkty
- **Abstrakcja:** Użytkownik widzi "Hurtownia Danych". System pod spodem widzi `jdbc:snowflake://...`.
- **Wielokrotne użycie:** Raz zdefiniowane źródło jest używane przez Katalog, DQ, MDM i Raporty.
- **Bezpieczeństwo:** Hasła są szyfrowane lub pobierane z Vaulta. Użytkownik końcowy ich nie widzi.

# 📚 Szczegółowe wyjaśnienie
Baza vs Połączenie vs Źródło:
- **Connection (Połączenie):** Techniczny string (URL, User, Pass).
- **Source (Źródło):** Logiczny obiekt w katalogu (Nazwa, Opis, Właściciel) + przypisane jedno lub więcej Połączeń (np. DEV, TEST, PROD).

# 💡 Przykład zastosowania
Definiujesz źródło "Główny CRM".
Dodajesz 2 połączenia:
1. `CRM_PROD` (Tylko do odczytu dla raportów).
2. `CRM_TEST` (Do testowania nowych reguł).
Analityk wybiera "Główny CRM" i klika "Profiluj". System pyta: "Na którym środowisku?".

## 📌 Źródła
- [[Ataccama|Ataccama]] ONE Connectivity Guide.

## 👽 Brudnopis
- Jednym z najczęstszych błędów jest wpisywanie haseł na sztywno. Zawsze używaj Aliases / Secret Management, żeby hasło do produkcji nie wyciekło.
