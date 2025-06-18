---
title: Generowanie danych
tags: 
aliases:
---
Modele LLM mają duże możliwości generowania spójnego tekstu. Korzystanie z efektywnych strategii promptów może ukierunkować model na tworzenie lepszych, spójnych i bardziej rzeczowych odpowiedzi. LLM mogą być również szczególnie przydatne do generowania danych, które są naprawdę przydatne do przeprowadzania wszelkiego rodzaju eksperymentów i ocen. Na przykład, możemy użyć go do wygenerowania szybkich próbek dla klasyfikatora sentymentu w następujący sposób:

_Prompt:_

```
Produce 10 exemplars for sentiment analysis. Examples are categorized as either positive or negative. Produce 2 negative examples and 8 positive examples. Use this format for the examples:
Q: <sentence>
A: <sentiment>
```

_Output:_

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

Jest to bardzo przydatne. W rzeczywistości używamy tego przykładu do innego testu w innej sekcji przewodników.