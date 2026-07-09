---
title: Directed Acyclic Graph (DAG)
created: 2026-02-04
status: evergreen
category: Data Engineering / Concepts
difficulty: basic
language: pl
tags:
  - dag
  - airflow
  - orchestration
  - graph
  - dbt
aliases:
  - Skierowany Graf Acykliczny
  - Graf Zależności
---
# 🎯 Definicja
**DAG ([[Skierowany Graf Acykliczny|Skierowany Graf Acykliczny]])** to mapa drogowa dla Twoich danych.
Składa się z zadań (Kropki) i strzałek (Zależności).
Zasada 1: Strzałki mają kierunek ("Zrób A, potem B").
Zasada 2: Nie ma pętli (Nie da się zrobić A -> B -> A).

# 🔑 Kluczowe punkty
- **Orkiestracja:** Wszystkie nowoczesne narzędzia ([[Apache Airflow]], [[dbt]], [[Dagster]]) używają DAG-ów do planowania zadań.
- **Równoległość:** Jeśli zadanie B i C zależą od A, ale nie od siebie nawzajem, system może je uruchomić jednocześnie.
- **Lineage:** DAG pokazuje historię powstania danych (Tabela X powstała z Tabeli Y).

# 📚 Szczegółowe wyjaśnienie
Wyobraź sobie przepis na ciasto:
1. Kup mąkę.
2. Kup jajka.
3. Wymieszaj.
4. Upiecz.
Możesz kupić mąkę (1) i jajka (2) równolegle (np. Ty i kolega).
Ale nie możesz mieszać (3), zanim nie masz obu składników.
I nie możesz piec (4), zanim nie wymieszasz.
To jest DAG.

# 💡 Przykład zastosowania
Airflow ETL:
- Task `Extract_Sales`: Pobiera dane o sprzedaży (Trwa 10 min).
- Task `Extract_Weather`: Pobiera dane o pogodzie (Trwa 2 min).
- Task `Transform_Join`: Łączy sprzedaż z pogodą (Czeka na oba powyższe).
- Task `Load_DW`: Ładuje wynik do hurtowni.

## 📌 Źródła
- [[Apache Airflow|Apache Airflow]] Concepts - DAGs.

## 👽 Brudnopis
- Najczęstszy błąd początkujących: Próba zrobienia cyklu (Tabela A aktualizuje Tabelę B, która aktualizuje Tabelę A). To zawsze kończy się błędem lub nieskończoną pętlą. DAG wymusza porządek.
