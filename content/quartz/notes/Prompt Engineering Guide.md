---

title: Prompt Engineering Guide  
created: 2025-07-16  
status:  
category: LLM  
difficulty: średni  
language: pl  
tags:

- prompt
- AI
- prompt-techniques
- llm
- guide  
aliases:
- PEG
- przewodnik

---

# 🎯 Wprowadzenie do inżynierii promptów

**Inżynieria promptów** to dziedzina rozwijająca się na styku AI i programowania, skoncentrowana na projektowaniu, testowaniu oraz optymalizacji poleceń (promptów), które sterują działaniem dużych modeli językowych ([[Base LLM|LLM]], [[Base LLM|Large Language Models]]). Celem jest maksymalne wykorzystanie potencjału [[Base LLM|LLM]] w zadaniach automatyzacji, analizy, generowania treści, kodu czy rozumowania.

# 🔑 Kluczowe komponenty inżynierii promptów

- **[[Ogólne wskazówki dotyczące projektowania promptów|Projektowanie promptów]]**: Tworzenie jasnych, efektywnych i zoptymalizowanych zapytań dla [[Base LLM|LLM]] (m.in. zero-shot, few-shot, chain-of-thought).
- **Testowanie i iteracja**: Analiza wyników i szybka korekta promptów dla uzyskania spójnych i przewidywalnych rezultatów.
- **Kontekst oraz formatowanie**: Dobór odpowiedniego formatu wejść/wyjść, demonstracji i przykładów.
- **Łączenie z narzędziami**: Integracja promptów z zewnętrznymi systemami (np. API, bazy danych, narzędzia analityczne).
- **Bezpieczeństwo i kontrola**: Stosowanie strategii ograniczających [[halucynacje]], błędy i niepożądane odpowiedzi.

# 📚 Techniki i style promptowania

## 1. [[Zero-shot Prompting]]

- Model otrzymuje wyłącznie polecenie lub pytanie bez przykładowych odpowiedzi.
- Idealne do prostych zadań lub tam, gdzie liczy się ekonomia miejsca w promptcie.

**Przykład:**  
„Wymień trzy największe miasta w Polsce.”

## 2. [[Few-shot Prompting]]

- Model otrzymuje 1–5 przykładów demonstrujących pożądany styl lub format odpowiedzi.
- Pozwala kontekstualnie nauczyć model zadań nietypowych, nowych słów, klasyfikacji.

**Przykład:**

```
Input: "Rekin" — Output: "Zwierzę"
Input: "Jabłko" — Output: "Owoc"
Input: "Ogórek" — Output:
```

## 3. Chain-of-Thought ([[Chain-of-Thought Prompting|CoT]])

- Model proszony o „myślenie głośno”: rozbicie odpowiedzi na sekwencję kroków, co poprawia trafność w zadaniach złożonych.
- Skuteczny w arytmetyce, logicznym rozumowaniu, QA.

**Przykład:**  
„Czy liczba 345 jest podzielna przez 5? Uzasadnij krok po kroku.”

## 4. Tree-of-Thought ([[Tree of Thoughts (ToT)|ToT]])

- Pozwala rozważać wiele ścieżek rozumowania naraz; integruje elementy eksploracji wariantów.

## 5. [[Directional Stimulus Prompting]]

- Użycie wskazówek i „bodźców” w prompcie, aby wpłynąć na styl lub priorytety odpowiedzi.

**Przykład:**  
„Podaj wyłącznie krótką rekomendację finansową, bez technicznych szczegółów.”

# 🚩 Praktyczne zasady projektowania promptów

- **Bądź precyzyjny**: określ format, styl, długość i oczekiwane zachowanie modelu.
- **Weryfikuj na danych testowych**: różne prompty mogą dawać skrajnie odmienne wyniki.
- **Stosuj metody iteracyjne (A/B testy, prompt tuning)**: modyfikuj prompty i porównuj skuteczność.
- **Zagwarantuj wycofanie/weryfikację**: w zadaniach newralgicznych każ modelowi „przyznać się do niewiedzy”, jeśli nie zna odpowiedzi.

# 💻 Przykład technicznej integracji

```python
import openai

def prompt_engineering(prompt: str, examples: list):
    # Łączenie promptu z przykładami few-shot
    full_prompt = "\n".join(examples) + "\n" + prompt
    response = openai.Completion.create(
        engine="text-davinci-003",
        prompt=full_prompt,
        temperature=0.2,
        max_tokens=150
    )
    return response.choices[0].text.strip()
```

_Ten kod łączy klasyczne few-shot z promptem zero-shot i obniżoną temperaturą dla większej przewidywalności._

# 📝 Ćwiczenia dla praktyków

1. Przetestuj ten sam prompt dla [[Base LLM|LLM]] z różnymi temperaturami.
2. Stwórz własny mini-benchmark promptów dla zadania synonimizacji słów.
3. Zaimplementuj Chain-of-Thought dla typowych pytań z egzaminów maturalnych.
4. Zautomatyzuj testowanie promptów vs. różne modele (GPT, Claude, Gemini, Mistral).

# 🧭 Trendy i przyszłość inżynierii promptów

- **Prompt tuning & soft prompting** – prompty wektorowe, trenowane automatycznie.
- **Automated Prompt Engineer ([[Automatic Prompt Engineer|APE]])** – algorytmiczne generowanie i optymalizacja promptów.
- **[[RAG]] (Retrieval-Augmented Generation)** – wzmocnienie [[Base LLM|LLM]] przez wyszukiwanie zewnętrznych danych.
- **Prompt chaining i agenci [[Base LLM|LLM]]** – wieloetapowe, interaktywne przepływy zadań.
- **Bezpieczny prompting** – walidacja, ograniczanie halucynacji, self-checking.

# 📌 Polecane zasoby

- [https://platform.openai.com/docs/guides/prompt-engineering](https://platform.openai.com/docs/guides/prompt-engineering)
- [https://www.promptingguide.ai/](https://www.promptingguide.ai/)
- [https://github.com/dair-ai/Prompt-Engineering-Guide](https://github.com/dair-ai/Prompt-Engineering-Guide)
- [https://www.deeplearning.ai/short-courses/chatgpt-prompt-eng/](https://www.deeplearning.ai/short-courses/chatgpt-prompt-eng/)
- [https://learnprompting.org/](https://learnprompting.org/)
- [https://lilianweng.github.io/posts/2023-03-15-prompt-engineering/](https://lilianweng.github.io/posts/2023-03-15-prompt-engineering/)

# 👽 Brudnopis

- Prompt engineering = nowa rola na rynku pracy AI/[[Base LLM|LLM]].
- Wybór techniki: zero-shot dla prostych zadań, few-shot dla customowych, [[Chain-of-Thought Prompting|CoT]] dla rozumowania.
- Możliwa automatyzacja (prompt tuning, [[Automatic Prompt Engineer|APE]]).
- W [[Base LLM|LLM]] 2023/2024 coraz większa rola promptów hybrydowych i łączenia z taskami narzędziowymi.
- Częsta integracja promptów z narzędziami zewnętrznymi (API, kalkulatory, search engine).
- Nacisk na bezpieczeństwo i minimalizację halucynacji (explicit „nie wiem”).