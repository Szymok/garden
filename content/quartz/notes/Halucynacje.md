---

title: Halucynacje  
created: 2025-07-16  
status: Final  
category: LLM / Sztuczna Inteligencja  
difficulty: podstawowy  
language: pl  
tags:

- AI
- LLM
- halucynacje
- generacja tekstu
- spójność informacji  
aliases:
- AI hallucination
- konfabulacje
- halucynacje LLM

---

# 🎯 Definicja

**Halucynacje** w kontekście sztucznej inteligencji (AI), a w szczególności dużych modeli językowych ([[Base LLM|LLM]]), to zjawisko, w którym model generuje **pozornie poprawne, ale nieprawdziwe lub niesprawdzone informacje**. Jest to istotny problem w zastosowaniach, gdzie oczekuje się wysokiej precyzji i faktograficznej poprawności.

# 🔑 Kluczowe punkty

- Halucynacje występują, gdy model **"zgaduje" poprawną formę odpowiedzi**, ale nie odnosi się do prawdziwego źródła wiedzy.
- Mogą przyjmować subtelną formę — np. tworzenie nieistniejących cytatów, fikcyjnych źródeł, błędnych nazw funkcji.
- Występują zarówno w prostej generacji tekstu, jak i w kodzie, odpowiedziach Q&A, podsumowaniach, tłumaczeniach.
- Dotkliwe zwłaszcza tam, gdzie potrzebna jest niezawodność (medycyna, prawo, edukacja, finanse).
- Halucynacje są **konfidentne** — model nie zdradza, że może się mylić.

# 📚 Szczegółowe wyjaśnienie

## Rodzaje halucynacji

|Typ|Opis|
|---|---|
|**Faktograficzne**|Wymyślanie danych, nazw, faktów (np. „Polska graniczy z Francją”)|
|**Cytatowe**|Fikcyjne przypisy, linki oraz nazwiska autorów|
|**Kodowe**|Generowanie funkcji, klas lub składni, które nie istnieją|
|**Logiczne**|Błędy rozumowania krok po kroku (np. naruszenie logiki w chain-of-thought)|
|**Zmyślone podsumowania**|Dodawanie wniosków niewynikających z tekstu źródłowego|

### Przykład:

**Prompt:**  
„Podaj cytat autorstwa Sokratesa o danych.”

**Output:**  
„Jak powiedział Sokrates: ‘Dane są odbiciem naszej duszy cyfrowej.’”

> Cytat jest zmyślony — Sokrates nigdy nie wypowiedział się na temat danych.

## Przyczyny halucynacji

- **Modele predykcyjne** — [[Base LLM|LLM]] są przewidywaczami tokenów, nie bazami wiedzy.
- **Brak odniesienia do źródeł** — model nie ma dostępu do weryfikowalnych danych w czasie generacji.
- **Zbyt ogólny prompt** — brak kontekstu lub konkretnych ograniczeń.
- **Niski próg kontrolny** — ustawienia samplingów (temperature, top-p) sprzyjają kreatywności, kosztem faktów.
- **Brak anchoringu do źródeł** – np. [[RAG]] lub zewnętrzne bazy wiedzy.

## Sposoby przeciwdziałania

- Wykorzystanie **[[Retrieval Augmented Generation (RAG)|Retrieval-Augmented Generation]] ([[RAG]])** – model korzysta z aktualnej bazy dokumentów.
- Dodanie do promptu: "_If the answer is unknown, respond with ‘I don't know’_".
- Ograniczenie kreatywności modelu – `temperature=0`, `top_p` ograniczony.
- Filtrowanie wyników – systemowe reguły, walidacja post factum.
- Fine-tuning na rzeczywistych danych + feedback użytkownika (RLHF).
- Generacja z cytowaniem źródeł (np. Bing Chat, Claude Opus z kontekstem).

# 💡 Przykład zastosowania

System automatyzujący generowanie raportów finansowych na podstawie danych transakcyjnych często “dopisuje” wygenerowane interpretacje bez pokrycia w danych wejściowych. Po wdrożeniu [[RAG]] oraz ograniczeniu temperatury model zaczął generować spójniejsze i bardziej przyziemne odpowiedzi, a dodatkowo zaznacza fragmenty tekstu oryginalnego, na których oparł swoje wnioski.

## 📌 Źródła

- Research: "On the Dangers of Stochastic Parrots" (Bender et al., 2021)
- OpenAI Cookbook: [Prompt engineering to mitigate hallucinations](https://github.com/openai/openai-cookbook)
- Anthropic: [Reducing Hallucinations in Transformers using Chain-of-Thought](https://arxiv.org/abs/2201.11903)
- [https://huggingface.co/blog/llm-evaluation](https://huggingface.co/blog/llm-evaluation)

## 👽 Brudnopis

- Halucynacja = brak przywiązania do prawdy przy wysokim „zaufaniu” modelu
- Model zgaduje tokeny, nie [[fakty]]
- Czemu [[Base LLM|LLM]] „zmyśla”? Bo celem jest przewidzieć ciąg znaków, nie „być prawdziwym”
- Szczególnie „toksyczne” w [[Base LLM|LLM]]-code (np. Python – nieistniejące biblioteki)
- Powiązane: hallucinatory confidence, confabulation bias
- „Źródło?” → challenge dla [[Base LLM|LLM]], które nie bazują na anchorowanych danych

---