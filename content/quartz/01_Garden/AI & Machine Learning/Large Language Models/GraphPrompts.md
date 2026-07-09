---
title: GraphPrompts (Promptowanie Grafowe)
created: 2026-02-04
status: evergreen
category: AI / Graph Learning
difficulty: advanced
language: pl
tags:
  - gnn
  - graph-neural-networks
  - prompting
  - structure
aliases:
  - Graph Prompting
  - Prompty Grafowe
---
# 🎯 Definicja
**GraphPrompts** to technika adaptacji metod promptingowych (znanych z NLP) do dziedziny **Grafowych Sieci Neuronowych (GNN)**. Zamiast dostrajać (fine-tune) cały model grafowy do nowego zadania, modyfikujemy wejście (graf i zapytanie) tak, aby "przypominało" zadanie, na którym model był trenowany (Pre-training).

# 🔑 Kluczowe punkty
- **Problem:** Modele GNN kiepsko przenoszą się między zadaniami (np. model od cząsteczek chemicznych nie radzi sobie z siecią społeczną).
- **Rozwiązanie:** Ujednolicenie formatu zadań poprzez prompty (podobnie jak GPT radzi sobie z tłumaczeniem i liczeniem, bo oba są tekstem).
- **Zastosowanie:** Klasyfikacja węzłów, przewidywanie krawędzi (Link Prediction) w warunkach małej ilości danych (Few-shot).

# 📚 Szczegółowe wyjaśnienie
Tradycyjne GNN (Pre-train, Fine-tune): Uczymy model na wielkim grafie, potem zmieniamy "głowę" (ostatnią warstwę) i douczamy na małym.
GraphPrompt: Nie zmieniamy modelu. Zmieniamy sposób pytania.
Dla węzła X tworzymy "kontekstowy podgraf" (subgraph) i pytamy model o jego podobieństwo do wzorców klas, których się nauczył.

# 💡 Przykład zastosowania
Mamy model wytrenowany na Wikipedii (graf linków). Chcemy go użyć do klasyfikacji artykułów naukowych (graf cytowań).
Zamiast trenować od nowa, "przepisujemy" strukturę cytowań na format, który model Wikipedii rozumie jako "linki tematyczne".

## 📌 Źródła
- "GraphPrompt: Unified Graph Pre-training and Prompting" (Liu et al., WWW 2023).

## 👽 Brudnopis
- To bardzo nowa i akademicka dziedzina (2023+).
- Próba przeniesienia sukcesu "Prompt Engineering" z tekstu na [[Dane Strukturalne|dane strukturalne]].