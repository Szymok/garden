---

title: Zero-Shot Prompting  
created: 2025-07-16  
status: Final  
category: Prompt Engineering  
difficulty: podstawowy  
language: pl  
tags:

- prompt
- AI
- Sztuczna-Inteligencja
- prompt-techniques
- llm  
aliases:
- tworzenie promptów

---

# 🎯 Definicja

**Zero-shot prompting** to technika konstruowania promptów dla dużych modeli językowych ([[Base LLM|LLM]]), w której **nie podajemy modelowi żadnych przykładów ani demonstracji zadania**. Wystarcza sama, jasna instrukcja – model otrzymuje polecenie i wykonuje zadanie, polegając wyłącznie na swojej ogólnej, wyuczonej wiedzy i umiejętności generalizacji.

# 🔑 Kluczowe punkty

- Model [[Base LLM|LLM]] **nie otrzymuje przykładów ani demonstracji konkretnego zadania** – wystarcza sama instrukcja słowna.
- Wydajność zero-shot zależy od klarowności promptu i szerokości wiedzy modelu po pretrenowaniu.
- Zero-shot nie wymaga żadnego dodatkowego fine-tuningu ani uczenia na danych specyficznych dla zadania.
- Modele [[Base LLM|LLM]] wykonują zadania od „zera” dzięki wiedzy z ogromnych, zróżnicowanych zbiorów tekstów użytych podczas treningu.
- Jeśli zero-shot prompting nie wystarcza, poleca się przejść do [[few-shot prompting]], czyli dodać do promptu konkretne przykłady wykonania zadania.

# 📚 Szczegółowe wyjaśnienie

## Jak działa zero-shot prompting?

Model [[Base LLM|LLM]], taki jak GPT-3 lub [[GPT-4]], otrzymuje wyłącznie instrukcję z opisem zadania, np. „Przetłumacz poniższe zdanie na hiszpański”, „Podsumuj podany tekst”, „Zaklasyfikuj sentyment: neutralny, pozytywny lub negatywny”.

Model na podstawie treningowej wiedzy rozpoznaje, **czego oczekuje użytkownik** i wykonuje zadanie bez konieczności uczenia się na konkretnych przykładach tego typu zapytań.

**Przykład:**

```
Prompt: Classify the text into neutral, negative or positive.
Text: I think the vacation is okay.
Sentiment:
```

**Output:**

```
Neutral
```

W powyższym przypadku model nie dostał żadnego przykładu klasyfikacji sentymentu – zrozumiał zadanie i samodzielnie poprawnie je wykonał.

Inne przykłady:

- **Prompt:** "Translate the following English sentence to French: 'How are you?'" **Output:** "Comment ça va ?"
- **Prompt:** "Summarize the following story in one sentence."
- **Prompt:** "What is the capital of Japan?" **Output:** "Tokyo"

## Zalety Zero-Shot Prompting

- Umożliwia szybkie testowanie modeli na wielu różnych zadaniach bez dodatkowego uczenia.
- Otwiera nowe możliwości automatyzacji dla użytkowników nietechnicznych.
- Skraca czas przygotowania promptów na potrzeby eksploracji lub prototypowania.
- Model jest elastyczny – można go wykorzystać do zadań, których nie przewidziano podczas budowy datasetów szkoleniowych.

## Wady i ograniczenia

- Jakość wyniku często zależy od zwięzłości i precyzji promptu.
- W zadaniach skomplikowanych, nieintuicyjnych lub wymagających specjalnego formatu odpowiedzi zero-shot często daje gorsze rezultaty niż **[[few-shot prompting]]**.
- Modele mogą popełniać błędy interpretacyjne („[[halucynacje]]”), jeśli polecenie nie jest jednoznaczne.

## Zero-shot vs. Few-shot vs. One-shot

|Aspekt|Zero-shot|One-shot|Few-shot|
|---|---|---|---|
|Przykłady w promptcie|Brak|Jeden|Kilka|
|Wymagania danych|Najmniejsze|Niewielkie|Umiarkowane|
|Adaptacja do zadania|Opiera się na wiedzy|Lekko ukierunkowana|Wyraźnie ukierunkowana|
|Typowe zastosowanie|Proste, jasne zadania|Gdy chcemy doprecyzować|Skala, nieregularne dane|

## Wpływ tuningowania instrukcji

Recent research confirms that **instruction tuning** (pretrenowanie [[Base LLM|LLM]] na dużych zbiorach poleceń) oraz RLHF (uczenie ze wzmocnieniem z ludzkimi informacjami zwrotnymi) znacząco poprawiają efektywność zero-shot prompting. Przykładem takich modeli jest ChatGPT.

# 💡 Przykład zastosowania

W systemie automatyzacji obsługi klienta prompt zero-shot:  
„Anlizuj poniższy e-mail klienta i określ, czy jest to prośba serwisowa, reklamacja czy zapytanie o produkt.”  
Model na podstawie treści maila klasyfikuje jego typ – bez wcześniejszych przykładów takich podziałów.

## 📌 Źródła

- [https://www.datacamp.com/tutorial/zero-shot-prompting](https://www.datacamp.com/tutorial/zero-shot-prompting)
- [https://www.promptingguide.ai/techniques/zeroshot](https://www.promptingguide.ai/techniques/zeroshot)
- [https://shelf.io/blog/zero-shot-and-few-shot-prompting/](https://shelf.io/blog/zero-shot-and-few-shot-prompting/)
- [https://www.geeksforgeeks.org/nlp/zero-shot-prompting/](https://www.geeksforgeeks.org/nlp/zero-shot-prompting/)
- [https://blog.stackademic.com/zero-shot-one-shot-and-few-shot-prompting-in-ai-e5b84f13b8b8](https://blog.stackademic.com/zero-shot-one-shot-and-few-shot-prompting-in-ai-e5b84f13b8b8)
- [https://www.godofprompt.ai/blog/what-is-zero-shot-prompting](https://www.godofprompt.ai/blog/what-is-zero-shot-prompting)
- [https://www.digital-adoption.com/zero-shot-prompting/](https://www.digital-adoption.com/zero-shot-prompting/)

## 👽 Brudnopis

- Zero-shot = „wykonaj zadanie”, bez przykładów
- Test efektywności: prosta klasyfikacja, generacje, Q&A
- Gdy nie działa – przejdź do few-shot (prompt + przykłady)
- RLHF & [[Instruction Tuned LLM|instruction-tuned models]] wyraźnie podnoszą skuteczność zero-shot
- Praktyczne: szybka eksploracja możliwości modelu, zadania nieprzewidziane podczas treningu
- W praktyce: ChatGPT, Claude, Gemini, Llama-2, Mistral

---