---
title: Temperatura w AI
created: 2025-04-03
status: draft
category: AI
difficulty: średni
language: pl
tags:
  - temperatura
  - modele językowe
  - generowanie tekstu
aliases:
  - temperature w modelach AI
---

# 🎯 Definicja

Temperatura w kontekście sztucznej inteligencji to parametr używany w modelach generatywnych, takich jak GPT, do kontrolowania poziomu losowości w generowanych odpowiedziach. Wpływa na sposób, w jaki model wybiera kolejne słowa na podstawie rozkładu prawdopodobieństwa.

# 🔑 Kluczowe punkty

- **Zakres wartości**:
  - **Niska temperatura (np. 0.1)**: Model generuje bardziej przewidywalne i spójne odpowiedzi, wybierając najbardziej prawdopodobne słowa.
  - **Wysoka temperatura (np. 1.0 lub więcej)**: Model staje się bardziej kreatywny i losowy, co może prowadzić do mniej przewidywalnych, ale bardziej zróżnicowanych odpowiedzi.
- **Zastosowanie**:
  - Niska temperatura jest używana w zadaniach wymagających precyzji i spójności (np. odpowiedzi na pytania techniczne).
  - Wysoka temperatura sprawdza się w kreatywnych zadaniach, takich jak pisanie opowiadań czy generowanie pomysłów.
- **Wpływ na [[notes/Modele|modele]] językowe**:
  - Temperatura modyfikuje rozkład softmax, który decyduje o wyborze kolejnego tokenu w generowanym tekście.

# 📚 Szczegółowe wyjaśnienie

Temperatura działa jako mnożnik w funkcji softmax, która przekształca surowe wyniki modelu (logity) w prawdopodobieństwa. Przy niskich wartościach temperatury różnice między prawdopodobieństwami są zaostrzane, co powoduje wybór najbardziej prawdopodobnych tokenów. Z kolei wyższe wartości temperatury "wygładzają" rozkład prawdopodobieństwa, co zwiększa szanse na wybór mniej pewnych tokenów.

Matematycznie, temperatura \( T \) wpływa na logity \( z \) poprzez modyfikację równania softmax:

\[
P(x_i) = \frac{\exp(z_i / T)}{\sum_{j} \exp(z_j / T)}
\]

Gdzie:
- \( T < 1 \): Zwiększa deterministyczność.
- \( T > 1 \): Zwiększa losowość.

# 💡 Przykład zastosowania
```python
from transformers import GPT2LMHeadModel, GPT2Tokenizer
# Inicjalizacja modelu i tokenizatora

model_name = "gpt2"  
model = GPT2LMHeadModel.from_pretrained(model_name)  
tokenizer = GPT2Tokenizer.from_pretrained(model_name)

# Tekst wejściowy

input_text = "Sztuczna inteligencja to"

# [[notes/Tokenizacja|Tokenizacja i generowanie tekstu z różnymi temperaturami

input_ids = tokenizer.encode(input_text, return_tensors="pt")

# Niska temperatura (bardziej przewidywalne)

low_temp_output = model.generate(input_ids, max_length=50, temperature=0.2)

# Wysoka temperatura (bardziej kreatywne)

high_temp_output = model.generate(input_ids, max_length=50, temperature=1.0)

print("Niska temperatura:")  
print(tokenizer.decode(low_temp_output, skip_special_tokens=True))

print("\nWysoka temperatura:")  
print(tokenizer.decode(high_temp_output, skip_special_tokens=True))
```

## 📌 Źródła

1. Dokumentacja modeli GPT (np. OpenAI lub Hugging Face).
2. Artykuły o regulacji losowości w generatywnych modelach językowych.
3. Blogi techniczne o zastosowaniu temperatury w [[Uczenie Maszynowe|AI]].

## 👽 Brudnopis

- Można dodać więcej przykładów praktycznych dla różnych wartości temperatury.
- Rozwinąć sekcję matematyczną o szczegółowe przykłady obliczeń.
