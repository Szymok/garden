---

title: Podstawy promptów  
created: 2025-03-31  
status:  
category: sztuczna inteligencja / prompt engineering  
difficulty: podstawowy  
language: pl  
tags:

- prompt
- basic
- LLM
- inżynieria promptów  
aliases:
- wiadomość
- podstawy promtowania

---

# 🎯 Definicja

**Prompt** to instrukcja lub zapytanie przekazywane modelowi językowemu ([[Base LLM|LLM]]), które określa, co model ma wygenerować. Może zawierać pytanie, polecenie, szablon tekstowy, dane kontekstowe lub przykłady. Jakość promptu w dużym stopniu decyduje o jakości odpowiedzi wygenerowanej przez model.

# 🔑 Kluczowe punkty

- ✍️ Prompt może być prosty (np. jedno zdanie) albo złożony (wielozdaniowa instrukcja z przykładami).
- 🎯 Zadaniem prompta jest nakierowanie modelu na konkretną czynność, np. tłumaczenie, streszczenie, klasyfikację.
- 🧠 Modele [[Base LLM|LLM]] potrafią samodzielnie uczyć się struktury zadania na podstawie promptu i kontekstu.
- 💡 Format promptu wpływa na jakość, trafność i długość wygenerowanej odpowiedzi.
- 📈 Stosuje się różne techniki: Zero-Shot, Few-Shot, Chain-of-Thought, aby poprawić skuteczność promptowania.

# 📚 Szczegółowe wyjaśnienie

## Co można zawrzeć w promptcie?

- **Instrukcję**: co ma zostać zrobione  
    np. „Przetłumacz ten tekst na niemiecki: ...”
    
- **Kontekst**: dodatkowe informacje  
    np. kilka zdań z dokumentu jako wprowadzenie
    
- **Dane wejściowe**: to, co model ma przetworzyć  
    np. `"This product is amazing!"`
    
- **Przykłady**: (dla [[Few-Shot Prompting]])  
    np. zadanie + oczekiwana odpowiedź
    

### 🔹 Przykład prostego promptu:

```
The sky is
```

→ Output:

```
blue. The sky is blue on a clear day...
```

### 🔸 Ulepszony prompt:

```
Complete the sentence: The sky is
```

→ Output:

```
so beautiful today.
```

Dodanie instrukcji powoduje, że model generuje spójną i zgodną odpowiedź.

## Formatowanie promptów

Najczęściej spotykane formaty:

#### 🟩 Instrukcja:

```
Translate the following sentence into French:
"I love learning."
```

#### 🟦 QA (question–answer):

```
Q: What is the capital of Spain?
A: Madrid
Q: What is the capital of France?
A:
```

Ten format wykorzystywany jest w [[Zero-Shot Prompting]], czyli bez przykładów — tylko pytanie i oczekiwana odpowiedź.

## [[Few-Shot Prompting]] – nauka przez przykład

Dodanie kilku przykładów w promptcie umożliwia modelowi uczenie się zadania kontekstowo (tzw. in-context learning):

```
This is awesome! // Positive  
This is bad! // Negative  
Wow that movie was rad! // Positive  
What a horrible show! //
```

→ Output:

```
Negative
```

### Dlaczego to działa?

[[Base LLM|LLM]] nie zna reguł klasyfikowania emocji, ale potrafi wyciągać wnioski ze wzorców widocznych w promptcie. To czyni [[Few-Shot Prompting]] potężną i uniwersalną techniką – bez potrzeby trenowania modelu!

## 🧠 O czym pamiętać podczas pracy z promptami?

- Prompt najlepiej konstruować jasno i konkretnie.
- Dobrą praktyką jest testowanie różnych wariantów.
- W przypadku zadań złożonych (np. rozumowanie) warto stosować [[Chain-of-Thought Prompting]].
- Spójny format znacznie zwiększa jakość wyników (np. używanie stałego schematu „Q: ... A: ...”).

# 💡 Przykład zastosowania w kodzie

```python
prompt = """
Translate into Spanish:
I am learning how to write prompts.
"""

response = openai.ChatCompletion.create(
    model="gpt-3.5-turbo",
    messages=[{"role": "user", "content": prompt}]
)

print(response['choices'][0]['message']['content'])
```

# 📌 Źródła

- [OpenAI Prompt Guide](https://platform.openai.com/docs)
- [Prompt Engineering Guide](https://www.promptingguide.ai)
- [Learn Prompting](https://learnprompting.org)
- [Prompt Engineering Patterns survey](https://arxiv.org/abs/2302.11382)

# 👽 Brudnopis

- Prompt = rozmowa z modelem → im lepiej zapytasz, tym dokładniej odpowie
- Zero vs Few Shot – balans między eksperckością modelu a twoją kontrolą
- Dalsze tematy: temperatura, top-p, formatowanie, Chain-of-Thought, [[RAG]]
- Prompt ≠ kod → to język zrozumiały dla człowieka
- Dobry prompt = precyzja + przykład + format + kontekst