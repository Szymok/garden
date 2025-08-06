---

title: Automatic Reasoning and Tool-use (ART)  
created: 2025-07-16  
status:  
category: LLM  
difficulty: zaawansowany  
language: pl  
tags:

- AI
- prompt-techniques
- llm
- ChainOfThoughtPrompting
- LLM
- DemonstrationCreation
- FrozenLLM
- IntermediateReasoning  
aliases:
- ART

---

# 🎯 Definicja

**Automatic Reasoning and Tool-use (ART)** to zaawansowana architektura rozumowania z wykorzystaniem zamrożonych dużych modeli językowych (frozen [[Base LLM|LLM]]), która automatycznie przeplata kroki rozumowania typu Chain-of-Thought ([[Chain-of-Thought Prompting|CoT]]) z wywołaniami zewnętrznych narzędzi. Kluczowym celem ART jest efektywne dekomponowanie nowych zadań i automatyzacja przechodzenia pomiędzy generacją językową a realizacją konkretnych operacji za pomocą narzędzi – bez potrzeby ręcznego skryptowania każdego etapu czy demonstracji.

# 🔑 Kluczowe punkty

- **Automatyzacja demonstracji:** ART samodzielnie wybiera odpowiednie przykłady wieloetapowego rozumowania i użycia narzędzi z biblioteki demonstracji.
- **Dynamiczne przeplatanie generacji i narzędzi:** Generacja przez [[Base LLM|LLM]] jest wstrzymywana w momencie, gdy do dalszego rozumowania potrzebne są dane z narzędzia (np. wyszukiwarka, kalkulator). Po otrzymaniu wyników, proces kontynuowany jest z uwzględnieniem nowych informacji.
- **Zero-shot generalizacja:** Dzięki uczeniu na różnych zadaniach, ART uogólnia sposoby dekompozycji problemów i potrafi adaptować ścieżki rozumowania do zupełnie nowych przypadków, nawet bez dodatkowych przykładów.
- **Rozszerzalność:** Ludzie mogą łatwo wzbogacać system o nowe narzędzia lub poprawiać konkretne kroki rozumowania poprzez aktualizację bibliotek – bez potrzeby re-treningu modelu.
- **Przewaga wydajności:** ART przewyższa techniki [[Few-Shot Prompting]] oraz automatyczne [[Chain-of-Thought Prompting|CoT]] w wyzwaniach typu BigBench czy MMLU, a jego skuteczność rośnie jeszcze bardziej przy włączeniu informacji zwrotnej od człowieka.

# 📚 Szczegółowe wyjaśnienie

## Jak działa ART?

1. **Wybór demonstracji:** System dobiera przykłady rozwiązywania zadań wieloetapowych (reasoning + tool-use) ze swojej biblioteki.
2. **Automatyczne rozbijanie problemu:** Na bazie demonstracji zero-shot, model rozkłada nowe (niewidziane wcześniej) zadanie na sekwencję kroków – czy to logicznych, czy narzędziowych.
3. **Iteracyjne rozumowanie:** Model generuje kolejne kroki, pauzując generację, gdy potrzebuje wyniku działania narzędzia (np. zewnętrznego API, wyszukiwarki czy kalkulatora).
4. **Integracja danych:** Wynik zwrócony przez narzędzie jest natychmiast włączany w kontynuowaną sekwencję rozumowania i generacji.
5. **Rozszerzanie ekosystemu:** Administratorzy mogą dopinać nowe narzędzia lub poprawiać "task library" – system adaptuje się do zmian bez konieczności modyfikowania samych [[Base LLM|LLM]].

## Przykładowy przepływ działania

1. **Prompt:** "Oblicz ile razy liczba 17 pojawia się w liście liczb losowych, a następnie podaj sumę wszystkich liczb większych od 50."
2. **ART:** Detekcja, że potrzebne są kroki:
    - generacja liczby losowych (tool: generator liczb),
    - policzenie wystąpień 17 (tool: licznik),
    - sumowanie liczb >50 (tool: agregator).
3. **Pauzowanie generacji:** Dla każdego kroku, ART wstrzymuje tekst, przekazuje dane do narzędzia, pobiera wynik, a następnie kontynuuje generację z nowymi danymi.
4. **Finalna odpowiedź:** Odpowiedź końcowa integruje rozumowanie i wyniki narzędzi.

## Wydajność na benchmarkach

ART z powodzeniem przewyższa tradycyjne [[Prompt techniques|techniki promptowania]]:

|Metoda|Wynik BigBench|Wynik MMLU|
|---|:-:|:-:|
|[[Few-Shot Prompting]]|niski|niski|
|Auto-[[Chain-of-Thought Prompting\|CoT]]|średni|średni|
|ART|najwyższy|najwyższy|

Efekt dodatkowo wzmacnia się, gdy system wspierany jest przez informację zwrotną od człowieka (np. korekty kroków pośrednich lub mechanizmy self-correction).

# 💡 Przykład zastosowania

**Asystent w systemie [[RAG]] dla data science**  
Użytkownik pyta: „Przeanalizuj dane o sprzedaży, wyznacz medianę dla każdego regionu i wskaż region ze wzrostem powyżej 10% r/r.”

ART samodzielnie:

- rozbija problem na etapy (przetwarzanie danych, analiza statystyczna, porównanie wyjścia, interpretacja biznesowa),
- na każdym kroku korzysta naprzemiennie z narzędzi (np. SQL, Python, API [[Business Intelligence|BI]]) i własnego rozumowania językowego,
- integruje pośrednie wyniki i daje precyzyjną odpowiedź, nawet jeśli zadania nie były wcześniej widziane w demonstracjach.

# 📌 Źródła

- Paranjape et al. "ART: Automatic Reasoning and Tool-use with Frozen Language Models" (2023) – arXiv: [https://arxiv.org/abs/2305.14898](https://arxiv.org/abs/2305.14898)
- [https://promptingguide.ai/techniques/art](https://promptingguide.ai/techniques/art)
- [https://ai.googleblog.com/2023/05/art-enhancing-llms-with-automatic.html](https://ai.googleblog.com/2023/05/art-enhancing-llms-with-automatic.html)
- [https://www.promptingguide.ai/techniques/chain-of-thought](https://www.promptingguide.ai/techniques/chain-of-thought)

# 👽 Brudnopis

- ART = auto-decomposition problemów + automatyczne "wstawki" narzędziowe w reasoning.
- Model uczy się gdzie i kiedy korzystać z narzędzi (po demonstracjach, zero-shot).
- Silny w unseen task – ogólność ważniejsza niż ręcznie robione skrypty.
- Rozszerzalność: naprawianie kroków, dokładanie nowych narzędzi bez retrainu [[Base LLM|LLM]].
- Najlepszy na kompozycyjnych i złożonych zadaniach (np. [[Inżynieria Danych|Data Engineering]], [[Business Intelligence|BI]], nauki ścisłe).