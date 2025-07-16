---
title: Prompt techniques  
created: 2025-07-16  
status:  
category: LLM  
difficulty: podstawowy  
language: pl  
tags:

- prompting
- LLM
- NLP
- zero-shot
- chain-of-thought  
aliases:
- techniki promptowania
---
# 🎯 Definicja

**Prompt techniques** to zestaw strategii tworzenia efektywnych promptów (poleceń) dla dużych modeli językowych (LLM), które umożliwiają uzyskiwanie bardziej trafnych, logicznych i użytecznych odpowiedzi w zależności od typu zadania (klasyfikacja, generacja tekstu, QA itd.).

# 🔑 Kluczowe punkty

- 👁‍🗨 Efektywny prompt = lepsze rozumienie celu przez model.
- 🧠 Istnieją różne strategie: zero-shot, few-shot, chain-of-thought, tree-of-thought itd.
- 🧩 Wybór techniki zależy od trudności zadania i potrzeby interpretowalności.
- ⚙️ Prompt engineering minimalizuje konieczność fine-tuningu.

# 📚 Szczegółowe wyjaśnienie

## Zero-shot prompting

Najprostsza forma – model otrzymuje wyłącznie instrukcję, bez przykładów. Sprawdza się dobrze w zadaniach, dla których językowy kontekst jest wystarczający.

**Przykład:**  
„Przetłumacz na niemiecki: ‘Jak się masz?’”

## Few-shot prompting

Modelowi przekazuje się kilka przykładów oczekiwanych wejść/wyjść, co stanowi kontekst do wnioskowania.

**Przykład:**

- Input: „Ang. = 'dog', Fr. = 'chien'  
    Ang. = 'cat', Fr. = 'chat'  
    Ang. = 'house', Fr. = …”

## Chain-of-thought (CoT)

Model prowadzi krok po kroku ścieżkę rozumowania zamiast od razu zwracać odpowiedź.

**Użyteczne w:**

- zadaniach logicznych,
- zadaniach wymagających wieloetapowego myślenia (np. zadania matematyczne, QA).

**Przykład:**  
„Ile jabłek zostanie, jeśli masz 10 jabłek i zjesz 4? Pomyśl krok po kroku.”

## Tree-of-thought (ToT)

Zaawansowana forma CoT – zamiast jednej liniowej ścieżki, model rozgałęzia możliwe scenariusze, analizując każdą opcję.

**Zastosowanie:**

- generowanie kodu,
- planowanie strategiczne,
- podejmowanie decyzji z wieloma zmiennymi.

## Directional prompting

Specjalna forma podpowiedzi zawierająca ukryte sterowanie np. przez narzucone style ("pokaż tylko wynik", "zachowuj się jak ekspert").

**Przykład:**  
„Jako analityk danych, przeanalizuj i wypisz tylko rekomendację.”

# 💡 Przykład zastosowania

Model LLM wykorzystywany w aplikacji do onboardingu pracowników, w której użytkownik pyta:  
„Jak mogę zarejestrować urlop?”

Zamiast jedynie dać odpowiedź, stosujemy chain-of-thought:

„Aby zarejestrować urlop, najpierw należy zalogować się do systemu HR. Następnie...”

To podejście zwiększa zrozumienie procesu przez użytkownika oraz podnosi wiarygodność systemu.

# 📌 Źródła

Prompt Engineering Guide: [https://github.com/dair-ai/Prompt-Engineering-Guide](https://github.com/dair-ai/Prompt-Engineering-Guide)  
Efficient Prompt Engineering Techniques – AssemblyAI: [https://www.assemblyai.com/blog](https://www.assemblyai.com/blog)  
"Prompt Engineering for LLMs" – Microsoft Learn: [https://learn.microsoft.com/en-us/training/modules/prompt-engineering/](https://learn.microsoft.com/en-us/training/modules/prompt-engineering/)

# 👽 Brudnopis

- Prompt != tylko pytanie – to instrukcja sterująca działaniem modelu.
- Typ promptu wpływa mocno na jakość i kontrolę nad wynikami.
- CoT i ToT zwiększają interpretowalność działań LLM.
- Możliwość łączenia technik np. few-shot + CoT.
- Prompt engineering ≠ fine-tuning, ale daje podobny efekt w niektórych scenariuszach.
- Na obrazkach pokazano porównanie technik i przebieg działania CoT.