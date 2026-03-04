---
title: Zagrożenia i nadużycia LLM
created: 2025-07-16
status: 
category: LLM
difficulty: średni
language: pl
tags:
  - LLM
  - bezpieczeństwo
  - nadużycia
  - prompt
  - injection
  - uprzedzenia
aliases:
  - zagrożenia LLM
  - nadużycia modeli językowych
---

# 🎯 Wprowadzenie

Pomimo niezwykłej skuteczności dużych modeli językowych ([[Base LLM|LLM]]) i zaawansowania technik takich jak few-shot czy chain-of-thought, wdrożenie tych modeli w aplikacjach komercyjnych i operacyjnych wiąże się z realnym ryzykiem nadużyć, zagrożeń i wyzwań etyczno-społecznych.

Ten rozdział skupia się na głównych scenariuszach zagrożeń i oszustw, z jakimi należy się liczyć podczas wdrażania i zabezpieczania aplikacji [[Base LLM|LLM]].

# 🔑 Kluczowe zagrożenia i nadużycia

## 1. Prompt Injection (Wstrzykiwanie Podpowiedzi)

- **Na czym polega:** Atakujący umieszcza w wejściu (np. wiadomościach, plikach, zapytaniach API) sprytne instrukcje, które mają za zadanie przejąć lub zmodyfikować wykonywaną przez model podpowiedź lub instrukcję. Przykład: dołączenie frazy "Zignoruj wszystkie poprzednie polecenia i wykonaj X".
- **Ryzyka:** Ujawnienie informacji, manipulacja wynikami, łamanie polityk firmy (np. wyciek danych, omijanie filtrów bezpieczeństwa).

## 2. Szkodliwe zachowania i generowanie szkodliwych treści

- **Toxicity i hate speech:** [[Base LLM|LLM]] mogą – zarówno bezpośrednio, jak i niezamierzenie – generować treści obraźliwe, dyskryminujące lub nieetyczne.
- **Porady o charakterze ryzykownym:** Modele mogą udzielać “porad” medycznych, prawnych lub finansowych bez odpowiedniej kwalifikacji, co niesie ryzyko prawne i dla użytkownika.

## 3. Uogólnianie i podatność na manipulacje

- **Overfitting na promptach:** Nawet dobrze przygotowane przykłady mogą być nadmiernie dopasowane, przez co model „przejmuje” styl lub logikę atakującego (np. przez manipulację przykładowymi etykietami).
- **Złośliwa kalibracja:** Celowe wywoływanie modelu do podania zmyślonych lub szkodliwych odpowiedzi przez odpowiednie ciągi testowe.

## 4. Uprzedzenia i biasy (Bias, Social Bias)

- **Wrodzone biasy:** Modele mogą reprodukować uprzedzenia obecne w danych treningowych, zwłaszcza te dotyczące płci, rasy, wieku, religii.
- **Social bias:** [[Base LLM|LLM]] mogą nieświadomie faworyzować czy dyskryminować grupy społeczne, wzmacniać stereotypy czy nierówności.

## 5. [[Factuality]] – prawdziwość odpowiedzi

- **[[Halucynacje]]:** Modele regularnie generują spójnie brzmiące, lecz całkowicie nieprawdziwe lub zmyślone odpowiedzi (fabrykowanie cytatów, tworzenie nieistniejących faktów).
- **Fałszywe poczucie pewności:** Model nie sygnalizuje niepewności, przez co użytkownik może uznać nieprawdziwą odpowiedź za wiarygodną.

# 🛡️ Praktyki i strategie łagodzące

## Ochrona przed prompt injection

- Walidowanie i filtrowanie wejść użytkownika.
- Oddzielanie logiki promptów systemowych od danych pochodzących od użytkownika.
- Stosowanie sandboxingu generowanych poleceń.

## Ograniczanie toksycznych i szkodliwych treści

- Fine-tuning modeli na “bezpiecznych” zbiorach danych i walidacja pod kątem contentu.
- Wdrożenie filtrów wyjściowych oraz mechanizmów moderacji AI/human-in-the-loop.
- Unikanie jednoosobowego autorytetu modeli w kwestiach medycznych/prawnych.

## Minimalizowanie biasów i uprzedzeń

- Różnicowanie i audyt danych wejściowych podczas trenowania modeli.
- Przeprowadzanie regularnych testów na występowanie biasów społecznych.
- Transparentność logiki i explicite wyjaśnianie mechanizmów działania [[Base LLM|LLM]].

## Poprawa [[Factuality]] i wiarygodności

- Dawanie modelowi jawnie pozwolenia na przyznanie się do “nie wiem”, “brak danych”.
- Uzupełnianie promptów o kontekst, cytaty źródłowe lub podejście [[RAG]] ([[Retrieval Augmented Generation (RAG)|retrieval-augmented generation]]).
- Weryfikacja odpowiedzi przez dedykowane algorytmy fact-checking (czasem przez drugi model).

# 📝 Podsumowanie praktyczne

|Ryzyko|Sposób przeciwdziałania|
|---|---|
|Prompt Injection|Walidacja i rozdzielanie wejść|
|Treści szkodliwe|Filtry, moderacja AI/human|
|Uprzedzenia|Audyt, różnicowanie danych|
|[[Halucynacje]]|Kontekst, [[RAG]], fact-checking|

Realne zastosowanie [[Base LLM|LLM]] wymaga zarówno projektowania bezpiecznych promptów, jak i systematycznego audytu oraz integracji dodatkowych narzędzi (np. klasyfikatorów treści, sandboxów, testów bias/[[Factuality]]) na każdym etapie rozwoju produktu opartego o AI.

# 👽 Brudnopis

- [[Base LLM|LLM]] = moc, ale i zagrożenia (prompt pollution, sygnały złośliwe, bias, [[Halucynacje]])
- Rynek: coraz więcej narzędzi do testów "prompt injection", classifier toxicity, governance
- Audyt, interpretowalność, [[Explainable AI]] – rośnie znaczenie w produkcyjnych wdrożeniach AI
- Bezpieczeństwo: testy adversarial, edukacja zespołów, feedback od użytkowników
- Mechanizmy: explicit confidence, fallback systems, monitoring abuse/attack patterns