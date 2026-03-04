---
title: Automatic Reasoning and Tool-use (ART)
created: 2026-02-04
status: evergreen
category: AI/LLM
difficulty: advanced
language: pl
tags:
  - reasoning
  - tool-use
  - agents
  - chain-of-thought
aliases:
  - ART Framework
  - Rozumowanie z narzędziami
---
# 🎯 Definicja
**ART (Automatic Reasoning and Tool-use)** to metoda pozwalająca zamrożonym (nieuczącym się) modelom LLM na automatyczne rozwiązywanie złożonych zadań poprzez łączenie rozumowania (Chain-of-Thought) z użyciem zewnętrznych narzędzi (kalkulator, wyszukiwarka), bez konieczności ręcznego tworzenia przykładów (few-shot) dla każdego zadania.

# 🔑 Kluczowe punkty
- **Biblioteka Zadań:** ART korzysta z bazy gotowych demonstracji (jak używać narzędzi).
- **Dynamiczny dobór:** Gdy przychodzi nowe zadanie, ART szuka podobnych zadań w bibliotece i wstawia je do promptu jako instrukcję.
- **Pauza i Wznowienie:** Model generuje myśl ("Muszę obliczyć 234 * 12"), zatrzymuje się, skrypt uruchamia kalkulator, wkleja wynik i wznawia generowanie ("Wynik to 2808").

# 📚 Szczegółowe wyjaśnienie
To krok w stronę autonomicznych agentów.
W klasycznym CoT (Chain-of-Thought) model może halucynować w obliczeniach. W ART model "wie", że jest słaby w liczeniu, więc zamiast zgadywać, generuje specjalny token `[CALCULATOR]`.
ART automatyzuje etap "prompt engineeringu" pod narzędzia. System sam dobiera, jak pokazać modelowi obsługę narzędzi na podstawie podobieństwa zadań.

# 💡 Przykład zastosowania
Pytanie: "Jaka jest populacja stolicy kraju, w którym urodził się Einstein, podniesiona do kwadratu?"
1. ART (Wyszukiwanie): Gdzie urodził się Einstein? -> Ulm, Niemcy. (Model sam o to pyta).
2. ART (Retrieval/Search): Stolica Niemiec? -> Berlin.
3. ART (Search): Populacja Berlina? -> 3.6 miliona.
4. ART (Calculator): 3,600,000^2.
5. Odpowiedź końcowa.

## 📌 Źródła
- Paranjape et al., "ART: Automatic Reasoning and Tool-use with Frozen Language Models", arXiv:2303.09014.

## 👽 Brudnopis
- Alternatywa dla ReAct (Reason + Act).
- Pokazuje siłę "In-context learning".
- Kluczowe: Task Library (biblioteka demonstracji).