---

title: Generowanie danych  
created: 2025-07-16  
status: Final  
category: Prompt Engineering / Sztuczna inteligencja  
difficulty: podstawowy  
language: pl  
tags:

- generowanie danych
- LLM
- sztuczna inteligencja
- prompt engineering
- dane syntetyczne  
aliases:
- data generation
- generowanie próbek
- generatory danych AI

---

# 🎯 Definicja

**Generowanie danych przy użyciu [[Base LLM|LLM]] ([[Base LLM|Large Language Models]])** to praktyka wykorzystania modeli językowych (np. [[GPT-4]], Claude, Mistral) do tworzenia **syntetycznych przykładów danych**, takich jak teksty, etykiety, pytania, klasyfikacje czy całe zbiory treningowe, w celu wykorzystania ich w zadaniach uczenia maszynowego, testowania modeli, budowania prototypów lub analiz jakościowych.

Dzięki elastyczności w rozumieniu kontekstu i poleceń, modele te są szczególnie skuteczne w szybkim tworzeniu zróżnicowanych i logicznie spójnych próbek.

# 🔑 Kluczowe cechy

- Generowanie danych może zastąpić lub uzupełnić rzeczywiste rekordy — szczególnie tam, gdzie dane są kosztowne, wrażliwe lub trudno dostępne.
- Modele [[Base LLM|LLM]] mogą działać jako **syntetyczni anotatorzy**, tworząc dane oznaczone (labeled) dla klasyfikatorów, ekstraktorów, tłumaczy itp.
- Możesz decydować o:
    - **złożoności przykładów**
    - **rozmieszczeniu klas (balans pozytywne/negatywne)**
    - **formacie danych i szablonach outputu**
    - **języku i tonie wypowiedzi**
- Generatory promptowe to potężne narzędzia do prototypowania, testowania i walidacji modeli NLP oraz ich pipeline'ów.

# 🏗️ Przykład: Generowanie przykładów do klasyfikatora sentymentu

### Prompt:

```
Produce 10 exemplars for sentiment analysis.  
Examples are categorized as either positive or negative.  
Produce 2 negative examples and 8 positive examples.  
Use this format for the examples:  
Q: <sentence>  
A: <sentiment>
```

### Output:

```
Q: I just got the best news ever!  
A: Positive  
Q: We just got a raise at work!  
A: Positive  
Q: I'm so proud of what I accomplished today.  
A: Positive  
Q: I'm having the best day ever!  
A: Positive  
Q: I'm really looking forward to the weekend.  
A: Positive  
Q: I just got the best present ever!  
A: Positive  
Q: I'm so happy right now.  
A: Positive  
Q: I'm so blessed to have such an amazing family.  
A: Positive  
Q: The weather outside is so gloomy.  
A: Negative  
Q: I just got some terrible news.  
A: Negative  
```

# 🧠 Zastosowania

- Tworzenie danych syntetycznych do treningu modeli [[Uczenie Maszynowe|ML]]/NLP
- Uzupełnianie niedoreprezentowanych klas (np. balancing klas)
- Testowanie klasyfikatorów, modeli ekstrakcji, systemów rekomendacyjnych
- Symulowanie użytkowników, zapytań, błędnych danych
- Walidacja promptów w aplikacjach opartych na [[Base LLM|LLM]] (np. [[RAG]])

# 💡 Inne przykłady [[Prompting Applications|zastosowania promptów]]

## 1. Generowanie pytań do quizów

```
Write 5 multiple-choice questions about the French Revolution.  
Each should have 4 options with 1 correct answer.
```

## 2. Tworzenie danych do klasyfikacji intencji w chatbotach

```
Generate 10 user messages.  
Classify them into one of the intents: ["greeting", "order_status", "cancel_order", "complaint", "goodbye"]
Format:  
Text: "<message>"  
Intent: <intent>
```

## 3. Frazy do testów detekcji cyberbullyingu

```
Generate 8 phrases that represent toxic or bullying behavior in online chats.  
Label each as "toxic" or "non-toxic".
```

# ✅ Wskazówki przy projektowaniu promptów dla generacji danych

|Działanie|Efekt|
|---|---|
|Ustalony format (`Q:` / `A:`)|Ułatwia parsowanie i automatyczny odczyt|
|Liczba przykładów|Zróżnicowanie, kontrola klasy balansu|
|Prompt w języku naturalnym|GPT „rozumie” intencje i rolę danych|
|Styl językowy|Możliwość kontroli rejestru i tonu|
|Kontekst domenowy|Można instruować model by generował np. "biznesowe e-maile"|

# 📌 Źródła

- [https://openai.com/blog/gpt-4-api-general-availability](https://openai.com/blog/gpt-4-api-general-availability)
- [https://huggingface.co/blog/data-efficient-fine-tuning](https://huggingface.co/blog/data-efficient-fine-tuning)
- [https://github.com/f/awesome-chatgpt-prompts](https://github.com/f/awesome-chatgpt-prompts)
- [https://datacamp.com/tutorial/zero-shot-few-shot-and-prompt-generators](https://datacamp.com/tutorial/zero-shot-few-shot-and-prompt-generators)

## 👽 Brudnopis

- Prompty = narzędzia do budowy własnej bazy etykiet & danych
- Możesz iterować prompty → 200+ przykładów w batchu
- [[Base LLM|LLM]] jak "asystent anotacyjny"
- 🧪 Red teaming promptów: generuj dane wyzwalające błędy systemu
- 🌀 Z promptów do datasetu → CSV / JSON do fine-tuningu czy ewaluacji

---