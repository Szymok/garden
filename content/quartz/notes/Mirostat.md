---

title: "Mirostat"  
created: 2025-07-16  
status: Final  
category: Generowanie tekstu (LLM)  
difficulty: średniozaawansowany  
language: pl  
tags:

- ai
- sztuczna inteligencja
- generowanie tekstu
- sterowanie entropią
- sampling  
aliases:
- techniki regulacji
- regulacja entropii
- mirostat sampling

---

# 🎯 Definicja

**Mirostat** to technika dynamicznej regulacji dekodowania, zaprojektowana w celu **utrzymania stałego poziomu „zaskoczenia” (ang. surprisal)** podczas generowania tekstu przez duże modele językowe (LLM). W przeciwieństwie do klasycznych metod takich jak temperature, top-k czy top-p sampling, Mirostat _aktywnie dostosowuje rozkład wyboru tokenów w czasie rzeczywistym_, zmniejszając ryzyko halucynacji lub zbyt przewidywalnych odpowiedzi.

# 🔑 Kluczowe punkty

- Mirostat nie korzysta ze **stałej temperatury** — dynamicznie ją dostosowuje, by utrzymać stały poziom entropii.
- Pozwala uzyskać stabilną kreatywność w dłuższych generacjach.
- Występuje w wersjach: **Mirostat v1** i **Mirostat v2** – różnią się podejściem do aktualizacji parametru sterującego (`μ`).
- Użytkownik ustala pożądany poziom entropii (tzw. **target surprise level**, np. `τ = 5.0`).
- Typowo stosowany tam, gdzie ważna jest **równowaga między spójnością a różnorodnością tekstu**.

# 📚 Szczegółowe wyjaśnienie

## Parametry Mirostat

|Parametr|Znaczenie|
|---|---|
|`τ` (target entropy)|Docelowy poziom "zaskoczenia". Większa wartość = bardziej kreatywne teksty|
|`η` (eta)|Tempo uczenia — jak szybko algorytm dostosowuje się do błędu predykcji|
|`μ`|Wewnętrzny parametr, sterujący próbkowaniem rozkładu tokenów (uaktualniany iteracyjnie)|

## Algorytm — Mirostat v1 (uproszczona wersja)

1. Oblicz zaskoczenie (surprisal) tokenu:
    
    ```
    S = -log2(P(token))
    ```
    
2. Oblicz różnicę między celem a bieżącym S:
    
    ```
    error = S - τ
    ```
    
3. Zaktualizuj parametr decyzyjny μ:
    
    ```
    μ ← μ - η * error
    ```
    
4. Wybierz następny token w rozkładzie ograniczonym przez μ.

## Mirostat vs inne techniki

|Technika|Opis|Problem|
|---|---|---|
|Temperature|Skaluje prawdopodobieństwa losowania|Statyczna, nie adaptuje się|
|Top-k|Ogranicza wybór tokenów do `k` najbardziej prawdopodobnych|Może odrzucić sensowne, rzadkie tokeny|
|Nucleus (top-p)|Uwzględnia top tokeny, których łączna suma P ≥ p|Nie kontroluje spójności w czasie|
|**Mirostat**|Dynamicznie balansuje wybór na podstawie entropii|Trudniejszy do implementacji|

## Wsparcie w praktyce

Mirostat jest dostępny w niektórych implementacjach lokalnych LLM i bibliotekach inferencyjnych, np.:

- **llama.cpp** – wsparcie dla `--mirostat`, `--tau`, `--eta`
- **koboldcpp**, **olm**, **exllamav2** – zaawansowane tryby sterowania dekodowaniem
- Zwykle aktywowany jako alternatywa dla `--temperature` i `--top-k`.

# 💡 Przykład zastosowania

Model lokalny (np. LLaMA 2) generuje dialogi RPG. Gdy `temperature` = 1.0 powoduje chaotyczne i niespójne wypowiedzi, a `top-p` = 0.8 — zbyt przewidywalne dialogi, zastosowanie Mirostat (`τ = 5.5`, `η = 0.3`) stabilizuje styl narracji. Model zachowuje różnorodność bez popadania w losowość.

# 📌 Źródła

- [https://arxiv.org/abs/2007.14966](https://arxiv.org/abs/2007.14966) — _A Simple and Effective Method to Control the Creativity of Text Generation_
- [https://github.com/ggerganov/llama.cpp](https://github.com/ggerganov/llama.cpp) — implementacja mirostat
- [https://huggingface.co/blog/how-to-sample](https://huggingface.co/blog/how-to-sample)
- [https://llama-cpp-python.readthedocs.io/en/latest/sampling](https://llama-cpp-python.readthedocs.io/en/latest/sampling)

## 👽 Brudnopis

- mirostat = dynamiczne heater/cooler dla entropii: jak "klimatyzacja kreatywności"
- kontroluje entropy outputu na poziomie token-picku
- jakość > kontrol > stabilność — lepszy niż gołe temperature
- dobre dla “długich promptów”, chains, role-play, fine-control
- mniej "zatkanych" halucynacji niż przy top-p z wysokim T
- wymaga: target_surprisal + stopnień korekty (eta)

---