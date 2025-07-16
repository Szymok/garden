---

title: "Top K"  
created: 2025-03-31  
status:  
category: sztuczna inteligencja / NLP  
difficulty: podstawowy  
language: pl  
tags:

- ai
- sztuczna inteligencja
- przetwarzanie języka naturalnego
- decode strategies
- sampling  
aliases:
- wybór najlepszych opcji
- top-k sampling
- dekodowanie top-k

---

# 🎯 Definicja

**Top-K** to technika próbkowania używana w trakcie generowania odpowiedzi przez modele językowe (np. GPT, BERT), która ogranicza wybór słów do tylko K najbardziej prawdopodobnych opcji, zgodnie z rozkładem prawdopodobieństwa wyjściowego modelu. Pozwala to poprawić spójność i jakość odpowiedzi, eliminując mało prawdopodobne (często przypadkowe lub nonsensowne) kontynuacje tekstu.

# 🔑 Kluczowe punkty

- 🔢 Parametr **K** określa liczbę najlepszych słów branych pod uwagę przy generowaniu kolejnego tokena.
- 🎯 Zwiększa trafność logiczną i spójność odpowiedzi przez ograniczenie przestrzeni wyboru.
- 🎲 Jest jedną z metod tzw. **probabilistycznego dekodowania**, obok np. top-p (nucleus sampling) czy klasycznego greedy search.
- 📉 Gdy K jest małe – odpowiedzi są bardzo przewidywalne; przy dużym K – zbliżamy się do pełnego samplingowania (bardziej kreatywne).
- 🤖 Używana powszechnie w systemach NLP: czatbotach, tłumaczeniach maszynowych, generowaniu tekstu.

# 📚 Szczegółowe wyjaśnienie

W klasycznym generowaniu tekstu model predykcyjny (np. LLM) oblicza **rozkład prawdopodobieństwa** dla wszystkich słów w słowniku jako kolejne możliwe tokeny.

Top-K Sampling działa tak:

1. Model generuje rozkład prawdopodobieństwa dla wszystkich tokenów.
2. Wybieranych jest tylko K **najbardziej prawdopodobnych tokenów**.
3. Następnie model **losuje jeden** token z tego ograniczonego zestawu (zachowując proporcje prawdopodobieństw wewnątrz Top-K).
4. Proces powtarza się słowo po słowie do końca tekstu albo osiągnięcia limitu.

## Porównanie metod dekodowania

|Metoda|Opis|Zalety|Wady|
|---|---|---|---|
|Greedy Search|Wybiera zawsze najbardziej prawdopodobny token|Deterministyczny, szybki|Mało kreatywny, zacinanie|
|Beam Search|Przeszukuje wiele ścieżek równocześnie|Lepsza struktura|Duże koszty obliczeniowe|
|Top-K Sampling|Losuje spośród K najlepszych|Kontrolowana kreatywność|Wybór K wpływa na zachowanie|
|Top-P (nucleus)|Losuje spośród tokenów aż do progu p|Dynamiczne – mniej sztywne|Trudniejsze do regulacji|

# 💡 Przykład zastosowania

Model LLM generuje następne słowo po frazie:

> "Chmura obliczeniowa pozwala na..."

Model przypisuje prawdopodobieństwo 0.32 dla „skalowanie”, 0.27 dla „przechowywanie”, 0.12 dla „automatyzację”, oraz 0.01 dla „makaron”.

Dla:

- **K = 2** → do wyboru tylko „skalowanie”, „przechowywanie”
- **K = 3** → także „automatyzację”
- **K = 50** → także „makaron” (ale inne mniej sensowne tokeny też się pojawiają → ryzyko halucynacji)

W praktyce – frontend AI (np. ChatGPT) ustawia K w zakresie od 40 do 200 w zależności od modelu i parametru temperature.

```python
# Pseudokod użycia Top-K w API modelu językowego
generate_text(prompt="Once upon a time,", top_k=50, temperature=0.8)
```

# 📌 Źródła

- [https://huggingface.co/blog/how-to-generate](https://huggingface.co/blog/how-to-generate)
- [https://openai.com/research](https://openai.com/research)
- [https://arxiv.org/abs/1904.09751](https://arxiv.org/abs/1904.09751)
- [https://towardsdatascience.com/how-to-sample-from-language-models-682bceb97277](https://towardsdatascience.com/how-to-sample-from-language-models-682bceb97277)

# 👽 Brudnopis

- Top-K = ograniczenie search space → większa kontrola nad generowaniem
- Dobór K wpływa na balans: powtarzalność vs. kreatywność
- Często łączone z `temperature` dla lepszego wpływu na "chaos" generowania
- Systemy wykorzystują też kombinacje: np. Top-K + Top-P
- OpenAI API stosuje sampling domyślnie z top_p + temperature, ale top_k też możliwy w innych silnikach