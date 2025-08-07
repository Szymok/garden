---

title: "Eta Mirostat"  
created: 2025-07-16  
status: Final  
category: Generowanie Tekstu (LLM)  
difficulty: średniozaawansowany  
language: pl  
tags:

- ai
- sztuczna inteligencja
- ocena jakości
- generowanie tekstu
- sampling  
aliases:
- mirostat eta
- parametr eta
- jakość generacji

---

# 🎯 Definicja

**Eta (η)** to jeden z kluczowych parametrów w algorytmie **[[Mirostat]]**, służącym do dynamicznej kontroli generowania tekstu przez modele językowe. Eta określa siłę korekty pomiędzy oczekiwanym poziomem „zaskoczenia” (surprisal) a poziomem rzeczywistym, co przekłada się na **jakość i spójność generowanej odpowiedzi**. Im wyższa wartość eta, tym szybciej i silniej [[Mirostat]] reaguje na odchylenie od pożądanej entropii.

# 🔑 Kluczowe punkty

- **Eta (η)** pełni funkcję podobną do współczynnika uczenia się (**learning rate**) – kontroluje tempo zmian wartości decyzyjnej (`μ`) w czasie generacji.
- Reguluje, jak szybko [[Mirostat]] adaptuje się do różnic pomiędzy żądaną i rzeczywistą entropią (`target_entropy` vs. `observed_entropy`).
- Wyższe wartości `η` → szybsza i bardziej dynamiczna reakcja → większe ryzyko niestabilności.
- Niższe wartości `η` → stabilniejsze generowanie, ale wolniejsze dostosowywanie się.
- Eta działa w połączeniu z parametrem **Tau (τ)** – oba kontrolują różne aspekty adaptacji.

# 📚 Szczegółowe wyjaśnienie

## Jak działa [[Mirostat]]?

[[Mirostat]] to algorytm operujący na tokenach w trakcie dekodowania (generacji) w [[Base LLM|LLM]], którego celem jest utrzymanie danego poziomu statystycznego „zaskoczenia” (`target_surprisal` lub entropii). Działa inkrementalnie — analizuje każdy krok generacji i dostosowuje wagi tak, aby wynikowa entropia nie była ani zbyt niska (powtarzalność), ani zbyt wysoka (chaos).

### Uproszczony algorytm ([[Mirostat]] v1):

```text
error ← observed_surprisal - target_surprisal  
μ ← μ - η * error
```

Wartość `μ` wpływa na rozkład tokenów (np. przez temperaturę lub sampling), a `η` decyduje o sile tej korekty.

## Interpretacja parametru Eta

|Wartość η|Opis działania|Efekt generacji|
|---|---|---|
|1.0+|Agresywne dostosowanie – duże wahania μ|Możliwa niestabilność, silne fluktuacje|
|0.5|Standardowe tempo adaptacji|Równowaga między jakością a sprawnością|
|0.1–0.3|Wolna reakcja modelu – delikatne zmiany|Bardziej przewidywalne i uporządkowane outputy|

### Relacja z innymi parametrami

- `μ` — docelowa entropia (np. około 5.0 dla naturalnego języka)
- `τ` — określa szybkość adaptacji `μ` względem różnicy błędu (`τ` × error)
- `η` — ustala, jak mocno aktualna różnica wpływa na przyszłe predykcje

## Zastosowania

- Tworzenie treści wymagających **kontrolowanej kreatywności i spójności** (np. scenariusze, dialogi).
- Redukcja powtarzalności lub chaotycznych wyników bez zmiany modelu ani konkretnego promptu.
- Projektowanie adaptacyjnych [[Base LLM|LLM]], które dynamicznie dostosowują reakcję bez standardowych samplingów (`top-k`, `top-p`).

# 💡 Przykład użycia

Kiedy [[Base LLM|LLM]] generuje kreatywną narrację RPG, zbyt wysoka eta powoduje niespójne skakanie między stylistykami wypowiedzi. Obniżając `eta` z 1.0 do 0.2, osiągamy bardziej jednolity ton narracji, przy zachowaniu lekkiej nieprzewidywalności. Tylko `tau` nie wystarczył – model reagował za słabo bez wpływu `eta` na μ.

## 📌 Źródła

- [https://arxiv.org/abs/2007.14966](https://arxiv.org/abs/2007.14966) – Mirostat Sampling
- [https://github.com/vkrastev/mirostat](https://github.com/vkrastev/mirostat)
- [https://huggingface.co/blog/how-to-sample](https://huggingface.co/blog/how-to-sample)

## 👽 Brudnopis

- Eta = „jak mocno” reagujemy na błąd entropii
- Tak jak `learning rate` – złe ustawienie → rozchwianie lub stagnacja
- μ stale się aktualizuje, a eta steruje siłą tej zmiany
- Używane głównie w [[Mirostat]] v1 (v2 działa lekko inaczej)
- Idealne dla twórców modelu lub heavy-tunerów
- W standardowym UI (OpenAI, Claude) nieeksponowane, ale obecne w bibliotekach low-level (Transformers, llama.cpp)

---