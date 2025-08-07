---

title: GPT-4 
created: 2025-07-16 
status: Final 
category: LLM 
difficulty: zaawansowany 
language: pl 
tags:
- gpt-4
- ai
- prompting
- multimodal
- LLM
- openai 
aliases:
- chatgpt-4
- gpt4

---

# 🎯 Definicja

**GPT-4** to duży, zaawansowany model językowy stworzony przez OpenAI, charakteryzujący się multimodalnością (może przyjmować zarówno tekst, jak i obrazy jako wejście) oraz wysoką skutecznością w zadaniach wymagających znajomości języka naturalnego, rozumowania i analizy. Uzyskuje wyniki na poziomie lub powyżej ludzkim w wielu branżowych i akademickich benchmarkach.

# 🔑 Kluczowe punkty

- **Wielomodalność:** GPT-4 przyjmuje jako wejście tekst oraz obrazy i generuje wyjście tekstowe.
- **Wysoka skuteczność:** Model osiąga top 10% zdających w symulowanym egzaminie adwokackim; jest bardzo silny w testach MMLU, HellaSwag i innych benchmarkach.
- **Poprawiona rzeczowość:** Udoskonalenia obejmują lepszą sterowalność, spójność odpowiedzi i zmniejszoną halucynacyjność w porównaniu do GPT-3.5.
- **Obsługa system promptów:** „System” prompt definiuje styl i sposób zachowania modelu w czasie całej interakcji.
- **Zaawansowane [[Prompt techniques|techniki promptowania]]:** GPT-4 świetnie radzi sobie z instrukcjami few-shot, chain-of-thought, samokonsystencji oraz technikami steering.

# 📚 Szczegółowe wyjaśnienie

## Wprowadzenie i wydajność

GPT-4 to ewolucja architektury Transformer. Model jest szkolony na dużych zbiorach danych tekstowych, a nowością względem GPT-3.5 jest możliwość przetwarzania multimodalnych wejść (obecnie publicznie dostępny jest tylko tryb tekstowy).

W benchmarkach akademickich GPT-4 zajmuje czołowe pozycje m.in. w egzaminie adwokackim, MMLU i HellaSwag. Osiąga poziom ekspercki na wielu testach zawodowych oraz znaczny progres w pracy z językami innymi niż angielski.

Przykład:

- Wynik ~90 percentyla na symulowanym egzaminie adwokackim
- Świetna skuteczność w zadaniach reasoningowych, Q&A, kodowania

## Vision Capabilities

Chociaż tylko tekstowy interfejs API jest publicznie dostępny, model ma zaimplementowane funkcje analizy obrazu, np. odczyt wykresów lub interpretacja zdjęć w połączeniu z instrukcją tekstową.  
Przykład promptu sterującego reasoning krok po kroku:  
"Podaj uzasadnienie krok po kroku przed udzieleniem odpowiedzi."  
Model przechodzi wtedy w tryb ‘Chain-of-Thought’, uzasadniając decyzje i ułatwiając interpretację wyniku przez użytkownika.

## Steering i personalizacja

Możesz definiować styl odpowiedzi i zachowanie modelu przez systemowy prompt, np.

```
SYSTEM: Jesteś asystentem AI i zawsze zwracasz wyniki w formacie JSON.
```

To polecenie będzie nadpisywać dalsze prośby użytkownika w zakresie formatu. Przykładowo, jeśli użytkownik poprosi o odpowiedź w XML, model pozostanie przy JSON, co umożliwia zachowanie spójności formatu.

## Ograniczenia

- GPT-4 nadal może popełniać błędy i halucynować odpowiedzi.
- Często nie posiada wiedzy o aktualnych wydarzeniach po wrześniu 2021 r.
- Model może nie radzić sobie z mniej popularnymi językami lub specjalistycznymi dziedzinami.
- Ograniczona dostępność multimodalności (API tekstowe publicznie udostępnione, wejścia obrazowe dopiero planowane).
- Pełna skuteczność zależy od jakości i precyzji prompów (w tym chain-of-thought czy [[self-consistency]]).

## Techniki inżynierii podpowiedzi

- **[[Few-shot prompting]]:** Umożliwia dostarczenie kilku przykładowych wejść/wyjść bez pełnego fine-tuningu.
- **[[Chain-of-Thought Prompting]]:** Zachęca do wyjaśniania rozumowania krok po kroku dla zadań złożonych.
- **[[Self-Consistency]]:** Pozyskuje wiele reasoningów i wybiera najczęstszy rezultat, zwiększając jakość predykcji.
- **System prompt steering:** Precyzyjnie ustala styl, ton, język i format odpowiedzi.
- **Augmented context:** Łączenie z bazami wektorowymi lub narzędziami [[RAG]] ([[Retrieval Augmented Generation (RAG)|Retrieval-Augmented Generation]]) dla poprawy jakości i faktograficzności odpowiedzi.

# 💡 Przykład zastosowania

W systemie obsługi klienta dla e-commerce GPT-4, ustawiony system prompt sprawia, że odpowiedzi są zawsze zgodne z polityką firmy i formatowane do wybranego stylu (np. lista zaleceń w JSON).  
Dla automatyzacji analiz biznesowych promptuje się model:  
"Przeanalizuj przesłane dane, przedstaw krok po kroku uzasadnienie i wyciągnij końcowe wnioski w formie tabeli Markdown."  
Pozwala to osiągnąć powtarzalność i przewidywalność wyników w codziennych procesach decyzyjnych.

## 📌 Źródła

- OpenAI - [GPT-4 Technical Report](https://cdn.openai.com/papers/gpt-4.pdf)
- OpenAI Blog — Introducing GPT-4
- [[Prompt Engineering Guide]] — [https://www.promptingguide.ai/models/gpt-4](https://www.promptingguide.ai/models/gpt-4)

## 👽 Brudnopis

- GPT-4: multimodalny, bardzo wysoka skuteczność reasoningowa, odporność na zamianę stylu promptu
- System prompts = spójność i sterowalność, zwłaszcza dla enterprise
- [[Self-Consistency]], Chain-of-Thought oraz Augmented Context – najlepsze wyniki dla najtrudniejszych tasków
- Hallucynacje i błędy nadal obecne — potrzeba walidacji
- Wydajność top-10% — testy prawnicze i MMLU
- Benchmarki: TruthfulQA, HellaSwag, MMLU — przewaga nad GPT-3.5
- Ograniczenia: data cutoff, knowledge update tylko przez API/tools, brak real-time web
- Przykład: „Wygeneruj 10 przykładowych tweetów w formacie CSV na temat AI”