---
title: Factuality (Faktyczność w LLM)
created: 2026-02-04
status: evergreen
category: LLM Evaluation
difficulty: intermediate
language: pl
tags:
  - hallucinations
  - grounding
  - rag
  - evaluation
aliases:
  - Faktyczność
  - Unikanie Halucynacji
---
# 🎯 Definicja
**Factuality** (Faktyczność) to [[Miara|miara]] tego, jak bardzo odpowiedzi modelu językowego ([[Base LLM|LLM]]) są zgodne z prawdą i rzeczywistością. Niski poziom factuality oznacza występowanie **halucynacji** – sytuacji, w której model generuje brzmiące przekonująco, ale całkowicie zmyślone informacje.

# 🔑 Kluczowe punkty
- **Problem:** LLM-y to "generatory prawdopodobieństwa tekstu", a nie bazy wiedzy. Nie "wiedzą", po prostu "kojarzą".
- **Grounding (Uziemienie):** Technika zmuszania modelu do opierania się na dostarczonym tekście (np. poprzez [[RAG]]), a nie na własnej pamięci.
- **Weryfikacja:** Factuality jest trudne do zmierzenia automatycznie (wymaga "złotego standardu" lub weryfikacji przez człowieka/inny model).

# 📚 Szczegółowe wyjaśnienie
Metody poprawy Factuality:
1.  **[[RAG|RAG]] (Retrieval Augmented Generation):** Dostarczasz modelowi encyklopedię w prompcie i mówisz "Odpowiedz TYLKO na podstawie tego tekstu".
2.  **Prompt Engineering:** Dodanie instrukcji "Jeśli nie wiesz, napisz: Nie wiem".
3.  **Self-Correction:** Poproszenie modelu: "Przeczytaj swoją odpowiedź i sprawdź, czy nie zmyśliłeś faktów".

# 💡 Przykład zastosowania
Pytanie: "Kto wygrał wybory w Polsce w 2029 roku?"
Model bez Factuality (Halucynacja): "Według przewidywań, wybory wygrał Jan Kowalski..." (Zmyśla).
Model z Factuality (Grounding): "Moja wiedza kończy się na roku 2024, nie posiadam informacji o roku 2029."

## 📌 Źródła
- "Survey on Hallucination in Large Language Models" (Arxiv).

## 👽 Brudnopis
- Walka o Factuality to obecnie główny nurt badań nad wdrażaniem AI w biznesie (nikt nie chce chatbota, który kłamie klientom).
- Metryki: FactScore, RAGAS (Faithfulness).