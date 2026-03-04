---
title: Federacja Danych (Data Federation / Virtualization)
created: 2026-02-04
status: evergreen
category: Data Architecture
difficulty: intermediate
language: pl
tags:
  - virtualization
  - trino
  - presto
  - denodo
  - logical-warehouse
aliases:
  - Data Virtualization
  - Logiczna Hurtownia Danych
---
# 🎯 Definicja
**Federacja Danych** (często zwana Wirtualizacją Danych) to architektura, w której dane pozostają w swoich systemach źródłowych (nie są kopiowane do jednej hurtowni), a specjalny **Silnik Federacyjny** (np. Trino, Denodo) pozwala odpytywać je wszystkie naraz za pomocą jednego zapytania SQL, tak jakby były w jednej bazie.

# 🔑 Kluczowe punkty
- **Brak kopiowania (Zero-Copy):** Oszczędność miejsca i czasu na ETL.
- **Real-time:** Dane są zawsze aktualne (bo czytamy ze źródła).
- **Single Point of Access:** Użytkownik widzi "jedną wielką bazę", a pod spodem może być 50 różnych systemów (Oracle, S3, API, Kafka).

# 📚 Szczegółowe wyjaśnienie
Jak to działa?
Użytkownik pisze: `SELECT * FROM oracle.zakupy JOIN mongo.logi ON ...`
Silnik (np. Trino):
1.  Wysyła zapytanie SQL do Oracle (Pushdown).
2.  Pobiera JSONy z Mongo.
3.  Łączy te dane w swojej pamięci RAM.
4.  Zwraca wynik użytkownikowi.

# 💡 Przykład zastosowania
Dział Compliance musi sprawdzić, czy dane klienta w systemie CRM (Salesforce) zgadzają się z danymi w starym systemie bilingowym (Mainframe) i logami na S3.
Zamiast budować pipeline ETL, który potrwa miesiąc, analityk podpina te trzy źródła do Trino i w 15 minut pisze zapytanie SQL łączące te trzy światy.

## 📌 Źródła
- "Data Virtualization for Business Intelligence Systems" - Rick van der Lans.
- Trino Documentation.

## 👽 Brudnopis
- Zaleta: Szybkość dostępu do nowych źródeł (Time-to-Value).
- Wade: Obciążenie systemów źródłowych (zapytania analityczne lecą na produkcję) i możliwa niska wydajność przy dużych wolumenach (brak pre-agregacji).
- Często element koncepcji [[Data Mesh]].