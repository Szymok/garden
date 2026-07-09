---
title: Architektura Lambda
created: 2026-02-04
status: evergreen
category: Architecture
difficulty: advanced
language: pl
tags:
  - lambda-architecture
  - big-data
  - streaming
  - batch
aliases:
  - Lambda Architecture
  - Batch vs Speed Layer
---
# 🎯 Definicja
**Architektura Lambda** to wzorzec projektowania systemów Big Data, który łączy przetwarzanie strumieniowe (Speed Layer) z przetwarzaniem wsadowym (Batch Layer), aby zapewnić system odporny na błędy, skalowalny i oferujący wgląd w dane w czasie rzeczywistym.

# 🔑 Kluczowe punkty
- **Trzy warstwy:** Batch (dokładność), Speed (szybkość), Serving (udostępnianie).
- **Cel:** Rozwiązanie problemu opóźnień Hadoopa ("wyniki jutro") przy zachowaniu poprawności ("wyniki przybliżone teraz").
- **Korekta błędów:** Batch Layer cyklicznie przelicza wszystko od nowa, naprawiając ewentualne błędy, które wystąpiły w szybkiej warstwie strumieniowej.

# 📚 Szczegółowe wyjaśnienie
Koncepcja stworzona przez Nathana Marza (twórcę Apache Storm).
W czasach przed Spark Structured Streaming i nowoczesnym Flinkiem, streamy były "niepewne" (mogły gubić dane). Batch był "pewny", ale wolny.
Lambda mówi: "Róbmy oba".
1. Dane lecą równolegle do Kafki (Speed) i na HDFS (Batch).
2. Speed Layer pokazuje wykres "na żywo" (może być lekko niedokładny).
3. W nocy Batch Layer mieli wszystko jeszcze raz i nadpisuje wykres "poprawnymi" danymi.

Obecnie architektura ta jest wypierana przez **Architekturę Kappa** (wszystko jest streamem), ponieważ nowoczesne silniki streamowe są wystarczająco dokładne i szybkie.

# 💡 Przykład zastosowania
Licznik odsłon artykułu na dużym portalu.
- Speed Layer (Redis): Inkrementuje licznik w pamięci (+1, +1). Pokazuje "1054 odsłony" natychmiast.
- Batch Layer (Hadoop): Co godzinę czyta logi serwera, filtruje boty, usuwa duplikaty i wylicza "oficjalną" liczbę odsłon (np. "1032").
- Serving Layer: Aplikacja pobiera najnowszy wynik z Batch i dodaje do niego przyrost z Speed.

## 📌 Źródła
- Nathan Marz, "Big Data".

## 👽 Brudnopis
- Kappa Architecture: Uproszczenie lambdy (tylko Speed Layer).
- Złożoność: Utrzymywanie dwóch kodów (jeden dla Storma, jeden dla [[MapReduce|MapReduce]]) to koszmar. Ujednolicone API (Beam, Spark, Flink) to naprawiają.