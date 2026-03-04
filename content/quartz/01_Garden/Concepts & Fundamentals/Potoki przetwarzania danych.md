---
title: Potoki Przetwarzania Danych (Data Pipelines)
created: 2026-02-04
status: evergreen
category: Data Engineering
difficulty: basic
language: pl
tags:
  - pipelines
  - etl
  - orchestration
  - architecture
  - automation
aliases:
  - Data Pipelines
  - Rurociągi danych
  - Przepływy danych
---
# 🎯 Definicja
**Potok Danych (Pipeline)** to zautomatyzowana linia produkcyjna dla danych. To seria kroków, które pobierają dane z punktu A, przetwarzają je i dostarczają do punktu B w formie gotowej do użycia.

# 🔑 Kluczowe punkty
- **Automation:** Działa samo (bez klikania człowieka), zazwyczaj wg harmonogramu lub zdarzenia.
- **Reliability:** Ma mechanizmy ponawiania (Retry) i powiadamiania o błędach.
- **Stages:** Ingestion (Pobranie) -> Processing (Przetworzenie) -> Storage (Zapis) -> Consumption (Użycie).

# 📚 Szczegółowe wyjaśnienie
Potoki mogą być:
- **Batch:** Przetwarzają dużą paczkę danych raz na dobę (np. raporty dzienne). Tanie i proste.
- **Streaming:** Przetwarzają każdy rekord natychmiast po jego pojawieniu się (np. detekcja fraudów w transakcjach). Drogie i skomplikowane.
Narzędzia: Airflow, Dagster, Prefect, Informatica, Talend.

# 💡 Przykład zastosowania
Pipeline "Rekomendacje Netflixa":
1.  **Ingest:** Pobierz historię oglądania użytkownika (Kafka).
2.  **Process:** Przelicz macierz podobieństw w modelu Spark ML.
3.  **Store:** Zapisz rekomendowane filmy w bazie Cassandra.
4.  **Serve:** Wyświetl na ekranie telewizora "Polecane dla Ciebie".

## 📌 Źródła
- "Designing Data-Intensive Applications" (Martin Kleppmann).

## 👽 Brudnopis
- Dobry pipeline jest **idempotentny**. Jeśli uruchomisz go dwa razy na tych samych danych, wynik powinien być ten sam (nie duplikuje danych).