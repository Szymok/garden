---
title: Apache Hudi
created: 2026-02-04
status: evergreen
category: Data Engineering
difficulty: advanced
language: pl
tags:
  - hudi
  - data-lakehouse
  - transactional-datalake
  - upserts
aliases:
  - Hadoop Upserts Deletes and Incrementals
  - Hudi Table Format
---
# 🎯 Definicja
**Apache Hudi** (Hadoop Upserts Deletes and Incrementals) to format tabeli dla [[Data Lake|Data Lake]], który umożliwia wykonywanie transakcji (ACID), aktualizacji (Upsert) i usuwania danych na plikach (co tradycyjnie w [[Data Lake|Data Lake]] było niemożliwe).

# 🔑 Kluczowe punkty
- **Upserty:** Hudi pozwala na szybką aktualizację rekordu w jeziorze danych (np. zmiana adresu klienta) bez przepisywania całego petabajta danych.
- **Incremental Processing:** Pozwala pobierać tylko te dane, które zmieniły się od ostatniego razu (jak CDC dla [[Data Lake|Data Lake]]).
- **Copy-On-Write (COW) vs Merge-On-Read (MOR):** Dwa tryby zapisu, balansujące między szybkością zapisu a szybkością odczytu.

# 📚 Szczegółowe wyjaśnienie
Stworzony przez Ubera, Hudi miał rozwiązać problem gigantycznych opóźnień w ich [[Data Lake|Data Lake]]'u.
W "czystym" Hadoopie, aby zmienić jeden rekord w pliku Parquet, musiałeś wczytać cały plik i zapisać go ponownie. Hudi inteligentnie zarządza małymi plikami i indeksami, aby robić to wydajnie.
Jest jednym z trzech wielkich formatów "Lakehouse" (obok [[Delta Lake|Delta Lake]] i Iceberg). Hudi wyróżnia się najlepszą obsługą scenariuszy **Streaming Ingestion** (bardzo szybki zapis).

# 💡 Przykład zastosowania
Aplikacja Uber: Kierowca ciągle przesyła nową lokalizację GPS. Te dane trafiają do Kafki, a potem Hudi zapisuje je w [[Data Lake|Data Lake]]. Dzięki Hudi, analityk widzi "aktualną" pozycję kierowcy z opóźnieniem rzędu minut, a nie dni, i może wykonywać zapytania "Time Travel" (gdzie był kierowca 10 minut temu?).

## 📌 Źródła
- [Apache Hudi](https://hudi.apache.org/)

## 👽 Brudnopis
- Silna integracja ze Sparkiem i Flinkiem.
- Zarządza "małymi plikami" (small files problem) poprzez automatyczne kompaktowanie.
- Skomplikowana konfiguracja w porównaniu do Iceberga, ale potężne możliwości tuningu.