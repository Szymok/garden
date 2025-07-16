---
title: ReAct Prompting
created: 2025-07-16
status: Final
category: LLM
difficulty: zaawansowany
language: pl
tags:
  - prompting
  - LLM
  - reasoning
  - LangChain
  - agents
aliases:
  - ReAct
---

# 🎯 Definicja

**ReAct Prompting** to podejście do podpowiadania w dużych modelach językowych (LLM), które łączy generowanie werbalnych śladów rozumowania ("Thoughts") z podejmowaniem działań ("Actions"), bazujących na interakcji z narzędziami zewnętrznymi. Zaproponowane przez Yao i in. (2022), ReAct umożliwia modelom językowym jednoczesne planowanie kroków logicznych oraz wykonywanie działań, takich jak wyszukiwanie informacji, w sposób iteracyjny i adaptacyjny.

# 🔑 Kluczowe punkty

- 🧠 **Połączenie rozumowania i działania**: LLM generują na przemian kroki rozumowania (np. analiza pytania) oraz działania (np. zapytania do wyszukiwarki).
- 🔄 **Interakcja z narzędziami zewnętrznymi**: Działania mogą angażować zewnętrzne źródła wiedzy, zwiększając dokładność i adekwatność odpowiedzi.
- 🔍 **Lepiej radzi sobie w zadaniach wymagających wiedzy**: Przewyższa konwencjonalne podejścia (jak CoT i Act) w zadaniach takich jak HotpotQA, Fever, WebShop i ALFWorld.
- ❗ **Lepsza interpretowalność**: Sekwencja myśli i działań poprawia transparentność działania modelu i ułatwia diagnozowanie błędów.
- 🔧 **Wsparcie w środowiskach takich jak LangChain**: Framework ReAct znajduje praktyczne zastosowanie w budowaniach agentów LLM.

# 📚 Szczegółowe wyjaśnienie

## ReAct: Mechanizm działania

ReAct zaprojektowano, aby imitował naturalny proces rozwiązywania problemów: myślenie → działanie → obserwacja. Model językowy jest podpowiadany w taki sposób, aby:

1. **Wygenerować myśl (Thought)**: Rozważa, co powinno zostać zrobione dalej.
2. **Wykonać działanie (Action)**: Przykład - wyszukanie hasła w Google.
3. **Zanotować obserwację (Observation)**: Na podstawie wyników przemyśleć następny krok.

Ten cykl powtarza się, aż model osiągnie końcową odpowiedź (`Finish[Answer]`).

## Przykład sekwencji ReAct

```

Question: What is the elevation range for the area that the eastern sector of the Colorado orogeny extends into? Thought 1: I need to search Colorado orogeny... Action 1: Search[Colorado orogeny] Observation 1: The Colorado orogeny was an episode... ... Thought 5: High Plains rise in elevation from around 1,800 to 7,000 ft. Action 5: Finish[1,800 to 7,000 ft]

```

## ReAct vs. CoT vs. Act

| Metoda | Zalety | Wady |
|-------|--------|------|
| Chain of Thought (CoT) | Dobrze modeluje proces myślenia | Halucynacje, brak sprawdzania faktów |
| Act | Bezpośrednie działania | Brak logicznej ścieżki rozumowania |
| 📌 ReAct | Łączy zalety obu metod | Zależność od jakości informacji z zewnątrz |

## Wydajność w zadaniach

- **HotPotQA & Fever**: ReAct przewyższa klasyczne podejścia w zadaniach odpowiedzi na pytania i weryfikacji faktów.
- **WebShop & ALFWorld**: W środowiskach wymagających wielokrotnego działania i decyzji (np. zakupy online, symulacje tekstowe) ReAct wykazuje przewagę nad Act przez lepsze planowanie.

# 💡 Przykład zastosowania

### Agent z ReAct w LangChain

Za pomocą LangChain można zbudować agenta, który:

- wykorzystuje LLM (np. Davinci, ChatGPT),
- integruje się z Google Search API,
- wykonuje obliczenia przez wbudowane narzędzia,
- iteracyjnie kombinuje rozumowanie i akcje w stylu ReAct.

```

llm = OpenAI(model_name="text-davinci-003", temperature=0) tools = load_tools(["google-serper", "llm-math"], llm=llm) agent = initialize_agent(tools, llm, agent="zero-shot-react-description", verbose=True) agent.run("Who is Olivia Wilde's boyfriend? What is his current age raised to the 0.23 power?")

```

Efekt: agent wyszukuje informacje, przetwarza dane i dostarcza wynik końcowy z przebiegiem rozumowania i działań.

# 📌 Źródła

[1] ReAct Paper – https://arxiv.org/abs/2210.03629  
[2] LangChain Documentation – https://docs.langchain.com  
[3] Blog entry with detailed discussion – https://sebastianraschka.com/blog/2023/react-prompting.html

# 👽 Brudnopis

- ReAct = Reasoning + Acting
- Autorzy: Yao et al.
- Przewyższa CoT w zadaniach decyzyjnych
- ReAct w LangChain wykorzystuje agenta typu `zero-shot-react-description`
- Cykliczne myślenie → działanie → obserwacja aż po osiągnięcie celu
- W środowiskach takich jak WebShop model musi np. porównać produkty → wymaga rozumowania i wyszukiwania danych zewnętrznych
- Może służyć jako podstawa do budowania autonomicznych agentów sterowanych promptami
