---
title: Data Engineering Guides (Przewodniki)
created: 2026-02-04
status: evergreen
category: Data Engineering / Resources
difficulty: basic
language: pl
tags:
  - guide
  - learning
  - resources
  - best-practices
  - roadmap
aliases:
  - Przewodniki po Inżynierii Danych
  - Data Engineering Roadmap
---
# 🎯 Definicja
Zbiór najlepszych źródeł i map drogowych (Roadmaps) dla osób chcących zostać Inżynierami Danych. Dziedzina jest szeroka ([[SQL|SQL]], Python, Chmura, Big Data), więc nawigacja jest kluczowa.

# 🔑 Kluczowe Obszary Nauki
1.  **Fundamenty:** [[SQL|SQL]] (zaawansowany), Python ([[Pandas|Pandas]]/Scripting), Linux (Bash).
2.  **Modelowanie:** Dimensional Modeling (Kimball), Data Vault.
3.  **Przetwarzanie:** Spark, [[dbt|dbt]], Flink.
4.  **Infrastruktura:** [[Docker|Docker]], [[Kubernetes|Kubernetes]], [[Terraform|Terraform]].
5.  **Chmura:** AWS/Azure/GCP (jedna do wyboru na start).

# 📚 Polecane Źródła
- **Data Engineering Roadmap (GitHub):** Wizualna mapa co po kolei.
- **"Fundamentals of Data Engineering" (Reis & Housley):** Najważniejsza książka w branży.
- **Seattle Data Guy:** Blog i kanał YouTube o realiach pracy.
- **[[Airbyte|Airbyte]] / Fishtown Analytics ([[dbt|dbt]]) Blogs:** Świetne artykuły o nowoczesnym stosie (MDS).

# 💡 Jak zacząć?
Nie ucz się wszystkiego naraz.
Zbuduj **jeden projekt End-to-End**:
1.  Pobierz dane z API (Python).
2.  Zapisz do bazy (Postgres).
3.  Przetwórz ([[dbt|dbt]]).
4.  Zwizualizuj (Streamlit/Metabase).
To da Ci więcej niż 10 kursów teoretycznych.

## 📌 Źródła
- [aws-samples/data-engineering-roadmap](https://github.com/datastacktv/data-engineer-roadmap).

## 👽 Brudnopis
- Najczęstszy błąd: Nauka narzędzi (Spark, Kafka) bez zrozumienia podstaw (Systemy plików, Sieci, [[SQL|SQL]]). Narzędzia się zmieniają, [[SQL|SQL]] jest wieczny.
