---

title: Ustawienia LLM  
created: 2025-03-31  
status:  
category: sztuczna inteligencja / prompt engineering  
difficulty: podstawowy  
language: pl  
tags:

- prompt
- AI
- Sztuczna-Inteligencja
- prompt-techniques
- llm  
aliases:
- large language models
- parametry LLM
- konfiguracja modeli językowych

---

# 🎯 Definicja

**Ustawienia [[Base LLM|LLM]] ([[Base LLM|Large Language Models]])** to zestaw parametrów kontrolujących sposób generowania odpowiedzi przez modele językowe. Parametry te pozwalają dostosowywać styl, kreatywność, dokładność oraz deterministyczność tworzonych treści. Mogą być konfigurowane ręcznie przez użytkownika lub automatycznie przez API danej platformy.

# 🔑 Kluczowe punkty

- 🔥 **Temperatura (temperature)** – wpływa na poziom kreatywności modelu (losowości).
- 🎯 **Top-p ([[Top P|nucleus sampling]])** – kontroluje zakres rozkładu prawdopodobieństwa słów rozważanych do wylosowania.
- 🧠 Zmiana tych parametrów może radykalnie zmienić styl i jakość odpowiedzi.
- 🧪 Dla zadań precyzyjnych (QA, DQ, przetwarzanie nazw technicznych): używamy **niższych wartości**.
- 🎨 Dla zadań twórczych (generowanie historii, wierszy, marketingu): wartości **wyższe**.

# 📚 Szczegółowe wyjaśnienie

## Temperatura (temperature)

Określa poziom „chaosu” w wyborze następnego tokenu. Zakres typowo: **0.0 do 1.0** (czasem 2.0).

- **0.0** → deterministyczny — zawsze wybierany najlepszy token (najsensowniejszy, spójny).
- **0.7** → balans — losowość z balanse’em logiki i kreatywności.
- **1.0+** → bardzo kreatywny, ale mniej spójny.

> 🧪 Temperatura ≈ „Jak luźno trzymać się przewidywalnej odpowiedzi?”

## Top-p ([[Top P|nucleus sampling]])

Zamiast brać Top-K tokenów — bierze tylko te, których skumulowane prawdopodobieństwo przekracza określony próg **p**.

- **top_p = 0.1** → zawęża wybór do najbardziej sensitivnych słów.
- **top_p = 1.0** → losuje z całego rozkładu (brak ograniczeń) – często bardziej kreatywne odpowiedzi.

> 📌 Top-p = sterowanie długością ogona rozkładu — ile „możliwości” bierzesz pod uwagę.

## Porównanie: Temperature vs Top-p

|Parametr|Charakterystyka|Efekt na odpowiedź|
|---|---|---|
|`temperature`|Manipuluje losowością w całym rozkładzie|Wpływa bardziej globalnie|
|`top_p`|Ogranicza wybór do wielu tokenów o wysokim prawdopodobieństwie|Wpływa dynamicznie – bardziej lokalnie|

## Zalecenia:

- ✅ Dla **faktu**, **QA**, **debugowania kodu**:
    - `temperature ≈ 0.2 – 0.3`
    - `top_p ≈ 0.8`
- 🎨 Dla **twórczości / storytelling**:
    - `temperature ≈ 0.8 – 1.0`
    - `top_p ≈ 0.9 – 1.0`
- 🧪 Zmieniaj **jeden parametr na raz**, by łatwiej zrozumieć wpływ zmian.

# 💡 Przykład zastosowania

```python
# Zapytanie do API z określonymi parametrami
openai.ChatCompletion.create(
  model="gpt-4",
  messages=[
    {"role": "user", "content": "Wymyśl slogan reklamowy dla ekologicznej kawiarni"}
  ],
  temperature=0.9,  # Zachowujemy wysoką kreatywność
  top_p=1.0
)

# Dla zadań precyzyjnych, np. przetwarzanie rozkazów:
openai.ChatCompletion.create(
  model="gpt-4",
  messages=[
    {"role": "user", "content": "Wyodrębnij numer PESEL z tekstu: 'Klient PESEL: 92062112345'"}
  ],
  temperature=0.2,
  top_p=0.7
)
```

# 📌 Źródła

- [https://platform.openai.com/docs/guides/gpt](https://platform.openai.com/docs/guides/gpt)
- [https://huggingface.co/blog/how-to-generate](https://huggingface.co/blog/how-to-generate)
- [https://towardsdatascience.com/decoding-methods-in-nlp-8c061ad38f7c](https://towardsdatascience.com/decoding-methods-in-nlp-8c061ad38f7c)
- [https://arxiv.org/pdf/1904.09751.pdf](https://arxiv.org/pdf/1904.09751.pdf)

# 👽 Brudnopis

- Rekomendacja: temperature + top_p = odpowiednik balansu między deterministycznym a twórczym zachowaniem
- Modele nowej generacji (Claude, PaLM, Gemini) często także obsługują `temperature`, `top_p`, `top_k`
- Dodatkowe parametry: frequency_penalty, presence_penalty, max_tokens — warto zebrać jako osobną notatkę
- Tip: 0.0 != „logika bez błędów” — niska temperatura może powtarzać faktograficzne błędy pewnie.