---

title: "Min P"  
created: 2025-07-16  
status: Final  
category: Generowanie tekstu (LLM)  
difficulty: średniozaawansowany  
language: pl  
tags:

- ai
- sztuczna inteligencja
- przetwarzanie języka naturalnego
- sampling
- generowanie tekstu  
aliases:
- minimalne prawdopodobieństwo
- min_p

---

# 🎯 Definicja

**Min P (Minimal Probability)** to parametr stosowany przy generowaniu tekstu przez modele językowe, który określa minimalny próg prawdopodobieństwa, jaki musi osiągnąć token, aby mógł zostać uwzględniony w dalszym próbkowaniu. Pomaga to ograniczyć przestrzeń tokenów do tych, które mają istotne prawdopodobieństwo wystąpienia, co może prowadzić do kontrolowanej redukcji "szumu" i bardziej spójnych wyników.

# 🔑 Kluczowe punkty

- **Min P** eliminuje z próbkowania tokeny o zbyt niskim prawdopodobieństwie – tzn. "odcina ogon" rozkładu tokenów.
- Parametr ten działa podobnie do `top-p`, ale na podstawie _wartości minimalnej_, a nie _kumulatywnej sumy prawdopodobieństw_.
- Zwiększenie wartości Min P prowadzi do mniejszej różnorodności wyników, ale wyższej spójności/sensowności.
- Obniżenie Min P oznacza większą swobodę w wyborze tokenów, co może zwiększyć kreatywność, ale także hałas i [[halucynacje]].
- Min P jest używany w nowszych technikach kontroli generacji, np. w `typical sampling`.

# 📚 Szczegółowe wyjaśnienie

## Jak działa Min P?

W momencie generacji kolejnego tokena przez model, rozkład prawdopodobieństwa `P(token)` jest analizowany. Tokeny, których prawdopodobieństwo jest **niższe niż wartość `min_p`**, są odrzucane z dalszego rozważania. Z pozostałych tokenów następuje losowanie z odpowiednią wagą.

Np. przy `min_p = 0.02`, tylko tokeny, które mają przynajmniej 2% prawdopodobieństwa, są traktowane jako kandydaci do generacji.

### Kontrast z innymi metodami:

- `top-k`: ograniczenie do k najbardziej prawdopodobnych tokenów bez względu na wartość `p`
- `top-p` (nucleus sampling): zachowuje top tokeny, dopóki suma prawdopodobieństw przekroczy ustalone `p` (np. 0.9)
- **`min_p`**: bez względu na sumę, zachowuje tylko tokeny powyżej określonego progu

## Zalety użycia Min P

|Zaleta|Opis|
|---|---|
|**Redukcja losowości**|Odcina ekstremalnie niskie, często halucynacyjne tokeny|
|**Lepsza kontrola semantyki**|Tokeny mają podwyższony próg istotności|
|**Wydajność samplingowa**|Ograniczona przestrzeń wyboru przyspiesza generację|
|**Kompresja decyzyjności**|Model koncentruje się na węższym, bardziej sensownym zbiorze|

## Przykładowe ustawienia

|Scenariusz|Min P|
|---|---|
|Generowanie kreatywne|0.01 – 0.03|
|Spójność techniczna|0.05 – 0.1|
|Tworzenie kodu|0.1 – 0.2|
|Wysoka precyzja (Q&A)|0.2+|

# 💡 Przykład zastosowania

Podczas generowania e-maila handlowego przy użyciu [[Base LLM|LLM]], użycie `min_p = 0.1` pozwala uzyskać bardziej rzeczowe, spójne zdania, unikając dziwnych lub przypadkowych wtrąceń, które mogłyby wynikać z domyślnego samplingowania tokenów, w którym tokeny o prawdopodobieństwie 0.01–0.02 nadal mogą zostać uwzględnione.

W przypadku generowania fikcyjnej historii dla dzieci, model z `min_p = 0.01` pozwala na większą swobodę twórczą i niecodzienne zwroty akcji.

## 📌 Źródła

- OpenAI Cookbook — Sampling Techniques
- Hugging Face Docs — [Logits & Sampling](https://huggingface.co/docs/transformers/main/en/generation_strategies)
- Tian et al., "Decoding Methods for Language Models"
- [https://github.com/llmware-ai/llmware/issues/152](https://github.com/llmware-ai/llmware/issues/152)

## 👽 Brudnopis

- Min P ≠ [[Top P]] – zero kumulacji, opiera się na lokalnym minimum
- Zwiększając min_p → mniej losowe, bardziej formalne outputy
- Wartość bardzo zależna od zastosowania – do kodu → wysokie, do bajek → niskie
- Gdy używasz Min P bez temperature = 1.0 → masz dobrą kontrolę nad stylem
- Rozszerzenie: hybrid sampling — np. Min P + Typical Sampling

---