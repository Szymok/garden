---
title: "Top P"
created: 2025-07-16
status: Final
category: LLM
difficulty: średniozaawansowany
language: pl
tags: 
  - ai
  - sztuczna inteligencja
  - generowanie tekstu
  - LLM
  - sampling
aliases:
  - nucleus sampling
  - dystrybucja prawdopodobieństw
---

# 🎯 Definicja

**Top P**, znany również jako **nucleus sampling**, to technika generowania tekstu wykorzystywana w dużych modelach językowych (LLM), polegająca na ograniczaniu zbioru możliwych tokenów do takiego, który zawiera tylko te tokeny, których łączne prawdopodobieństwo przewyższa zadany próg *p* (np. 0.9). Spośród tego podzbioru token wybierany jest losowo — zamiast zawsze wybierać najbardziej prawdopodobny token.

# 🔑 Kluczowe punkty

- Top P to probabilistyczna metoda generowania tekstu o większej różnorodności niż deterministiczne podejścia.
- Działa dynamicznie — liczba rozważanych tokenów zmienia się w zależności od ich skumulowanej sumy prawdopodobieństw.
- Parametr *p* kontroluje zakres „nukleusa” — im niższy, tym mniej tokenów w grze.
- Alternatywą dla Top P jest **Top K**, gdzie liczba tokenów jest stała.
- Często używany w połączeniu z temperaturą (*temperature*) dla lepszej kontroli.

# 📚 Szczegółowe wyjaśnienie

## 🔢 Jak działa Top P

Podczas generowania kolejnego tokena model przypisuje wszystkim możliwym tokenom prawdopodobieństwo. Te tokeny są sortowane malejąco względem prawdopodobieństwa, a następnie tworzony jest podzbiór, w którym suma prawdopodobieństw przekracza np. 90% (*p = 0.9*). Losowy token z tego podzbioru jest następnie wybierany do wstawienia w wygenerowany tekst.

### Ilustracja działania

Jeśli model przypisuje tokenom następujące prawdopodobieństwa:

| Token | Prawdopodobieństwo |
|-------|--------------------|
| A     | 0.40               |
| B     | 0.25               |
| C     | 0.15               |
| D     | 0.05               |
| E     | 0.04               |
| F     | 0.03               |
| …     | ...                |

Dla *Top P = 0.9*, do puli wybieranych tokenów trafią tokeny A, B, C oraz D (łącznie 0.85), a prawdopodobnie także E (przekraczając 0.9). Spośród nich nastąpi losowy wybór kolejnego tokena.

## ⚙️ Różnica między Top P a Top K

| Cecha              | Top P                    | Top K                    |
|--------------------|--------------------------|--------------------------|
| Zakres tokenów     | Zmienny                  | Stały                    |
| Kryterium odcięcia | Suma prawdopodobieństw ≥ p | K największych prawdopodobieństw |
| Elastyczność       | Większa                  | Mniejsza (stałe K)       |

Top P jest bardziej dynamiczny i dostosowuje się do kontekstu modelu — jeśli jedna opcja dominuje, puli losowania będzie mniej tokenów; jeśli rozkład jest równy, pula się rozszerza. Daje to bardziej naturalne, kontekstowe odpowiedzi, bez „zabetonowanego wyboru”.

## 🧮 Wpływ temperatury

Technikę Top P można łączyć z modyfikacją tzw. temperatury (*temperature*), która wpływa na „ostrość” rozkładów prawdopodobieństwa przed wykonaniem sampling'u. Im wyższa temperatura (np. 1.2), tym bardziej płaski rozkład (większa losowość), a wartości poniżej 1 (np. 0.7) wzmacniają wybór tokenów o wyższym prawdopodobieństwie.

# 💡 Przykład zastosowania

Podczas generowania tekstu na potrzeby aplikacji chatbotowej w e-commerce (np. obsługa klienta), **Top P sampling z wartością 0.9** pozwala uzyskać odpowiedzi zróżnicowane i ludzkie w tonie — w odróżnieniu od deterministycznych i często powtarzalnych odpowiedzi, które daje *greedy decoding*. Łącząc to z umiarkowaną temperaturą (ok. 0.8), można osiągnąć balans między kreatywnością a spójnością wypowiedzi, co zwiększa jakość UX.

## 📌 Źródła

[1] Hugging Face — Top-K sampling and Top-P (nucleus) sampling: https://huggingface.co/blog/how-to-generate  
[2] OpenAI Cookbook – Sampling Techniques: https://github.com/openai/openai-cookbook/blob/main/examples/How_to_sample_from_GPT.md  
[3] Google Research Blog – Better Language Models and Their Implications: https://huggingface.co/blog/how-to-generate#top-k-top-p-sampling

## 👽 Brudnopis

- Top P = nucleus sampling
- Wybierana zmienna liczba tokenów, których suma prawdopodobieństw ≥ p (np. 0.9)
- Działa lepiej niż greedy lub tylko Top K przy bardziej kreatywnych/otwartych zadaniach
- Stosować w generowaniu dialogów, tekstów fiction, content marketing
- W połączeniu z temperature → lepsze dopasowanie
- Dobrze się skaluje do złożonych promptów, większa naturalność językowa niż deterministic
- Elastyczne — pozwala modelowi „być kreatywnym”, ale w ramach probabilistycznych granic
