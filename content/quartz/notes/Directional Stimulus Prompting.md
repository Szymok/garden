---

title: Directional Stimulus Prompting  
created: 2025-07-16  
status:  
category: LLM  
difficulty: zaawansowany  
language: pl  
tags:

- prompting
- LLM
- RLHF
- podsumowania
- optymalizacja promptu  
aliases:
- DSP

---

# 🎯 Definicja

**Directional Stimulus Prompting (DSP)** to zaawansowana technika podpowiadania zaproponowana przez Li et al., która polega na optymalizacji specjalnej "podpowiedzi-sterownika" (directional stimulus) służącej do subtelnego naprowadzania dużych modeli językowych ([[Base LLM|LLM]]) do generowania odpowiedzi o określonych właściwościach – np. lepszych podsumowań. Charakterystyczny jest tu użytek mniejszego, trenowalnego modelu (policy LM), który generuje bodziec kierujący generacją przez zamrożony, dużej skali model bazowy.

# 🔑 Kluczowe punkty

- **DSP stosuje uczenie przez wzmacnianie (RL)**, aby zoptymalizować mały model językowy, który buduje podpowiedzi kierujące większym [[Base LLM|LLM]].
- **Model bazowy ([[Base LLM|LLM]]) pozostaje zamrożony**, traktowany jako "czarna skrzynka" — nie wymaga re-treningu ani fine-tuningu.
- **Mały policy LM generuje skuteczną podpowiedź** (stimulus), która prowadzi model bazowy do tworzenia odpowiedzi spełniających zadane kryteria (np. lepszą spójność, sprawczość, styl).
- **Skalowalne i ekonomiczne podejście**, alternatywne wobec RLHF (Reinforcement Learning with Human Feedback).
- **Udowodniona poprawa jakości generacji podsumowań** względem standardowego promptowania: wyższe wyniki w ocenie ludzkiej i automatycznej.

# 📚 Szczegółowe wyjaśnienie

## Struktura i działanie DSP

W Directional Stimulus Prompting system składa się z:

1. **Policy LM (sterownik)** – mały model językowy uczony przez RL do generowania bodźca kierującego.
2. **Stimulus Prompt** – specjalnie wygenerowany fragment tekstu (komentarz, kontekst), który poprzedza właściwe zadanie i "nakierowuje" bazowy model.
3. **Fixed [[Base LLM|LLM]] (np. GPT-3.5)** – duży, zamrożony model, który realizuje końcową generację odpowiedzi w oparciu o bodziec.

Proces uczenia policy LM polega na iteracyjnym testowaniu, jakie bodźce prowadzą zamrożony [[Base LLM|LLM]] do generowania oczekiwanych wyników (np. poprawne podsumowanie raportu, zgodne z intencją użytkownika).

## Przykład

Zadanie: Stwórz podsumowanie o wysokiej spójności dla artykułu o zmianach klimatu.  
Zamiast standardowego promptu typu:

```
"Podsumuj poniższy tekst:"
```

DSP stosuje rozszerzony prompt z wygenerowanym bodźcem:

```
"Jako doświadczony analityk Światowego Forum Ekonomicznego, napisz krótkie i precyzyjne podsumowanie poniższego raportu. Skoncentruj się na przyczynach klimatu i działaniach politycznych. Oto tekst: ..."
```

Ten kontekst "kieruje" model do bardziej trafnego stylu i rozłożenia uwagi – bez potrzeby modyfikacji samego [[Base LLM|LLM]].

## Czym DSP różni się od klasycznego prompting i RLHF?

|Metoda|[[Ustawienia LLM\|Parametry LLM]]|Użycie RL|Personalizacja|Koszt uczenia|
|---|---|---|---|---|
|Prompt engineering|❌ zamrożony|❌|🔸 częściowa|niski|
|RLHF|✅ trenowany|✅|✅ pełna|bardzo wysoki|
|**DSP**|❌ zamrożony|✅|✅ przez stimulus|średni|

DSP wprowadza kompromis: jakość i personalizacja lepsza niż statyczne promptowanie, ale znacznie niższy koszt niż RLHF.

# 💡 Przykład zastosowania

**Zastosowanie w podsumowaniach finansowych:**  
W firmach konsultingowych DSP umożliwia generowanie raportów i podsumowań o wymuszonej strukturze — np. rozpoczęcie od metryk ROI, następnie [[KPI]], na końcu insights. Dzięki specjalnemu "stimulus prompt" tworzonemu przez policy LM, model bazowy GPT-3.5 traktowany jako czarna skrzynka generuje teksty o zgodnej strukturze, redukując potrzebę korekty końcowej.

# 📌 Źródła

- [Directional Stimulus Prompting – ACL 2023](https://arxiv.org/abs/2305.14620)
- [PromptingGuide.ai — DSP Technique](https://promptingguide.ai/techniques/directionalstimulus)
- [Survey: Prompt learning for LLMs (2023)](https://arxiv.org/abs/2302.07459)

# 👽 Brudnopis

- DSP rozwiązuje problem niskiego wpływu klasycznego promptu na “black-box” [[Base LLM|LLM]].
- RL optymalizuje małego policy [[Base LLM|LLM]] piszącego prompty – mniej kosztowne niż fine-tuning dużych modeli.
- Szczególnie dobre do podsumowań, stylu pisania, abstrakcji.
- Mały model "wie jak pytać", duży model "jak generować".
- Minimalne wymagania: brak re-treningu, tylko dostęp do [[Base LLM|LLM]] jako API.
- Przypomina kierowania przez kontekst + RL fine-tuniem promptów.