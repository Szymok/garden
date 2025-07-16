---

title: Skalowanie modeli językowych dostosowanych do instrukcji  
created: 2025-07-16  
status: Final  
category: LLM  
difficulty: zaawansowany  
language: pl  
tags:

- instruction tuning
- LLM
- finetuning
- chain-of-thought
- Flan-T5
- Flan-PaLM  
aliases:
- scaling instruction tuned LLM
- Flan-PaLM
- zero-shot CoT

---

# 🎯 Definicja

Skalowanie modeli językowych dostosowanych do instrukcji (ang. instruction-tuned LLMs) to proces trenowania modeli językowych na dużych korpusach zadań sformułowanych jako instrukcje, z dodatkiem lub bez łańcucha myśli (Chain-of-Thought, CoT). Celem jest poprawa ogólnej użyteczności modeli, możliwości rozumowania, uogólniania i wielojęzyczności w zadaniach, których model wcześniej nie widział — szczególnie w trybach zero-shot i few-shot.

# 🔑 Kluczowe punkty

- **Skalowanie liczby zadań i rozmiaru modelu** prowadzi do sukcesywnych przyrostów wydajności w różnych benchmarkach (MMLU, GSM8K, TyDiQA, BIG-Bench).
- **Dostrajanie z użyciem Chain-of-Thought (CoT)** poprawia zdolności rozumowania — szczególnie w zadaniach krok po kroku oraz matematycznych.
- **Technika self-consistency** wraz z CoT osiąga wyniki state-of-the-art — przez generowanie wielu rozwiązań i wybieranie spójnego.
- **Modele takie jak Flan-PaLM i Flan-T5** wykazują wyraźną poprawę także w pytaniach otwartych i wielojęzycznych.
- **Zero-shot CoT aktywowane frazą „pomyślmy krok po kroku”** działa tylko po wcześniejszym fine-tuningu na takim stylu rozumowania.

# 📚 Szczegółowe wyjaśnienie

## Mechanizm działania

### Dostrajanie instrukcji

Modele są trenowane na dużym zbiorze zróżnicowanych zadań (1,800+) przekształconych w instrukcje – zawierających przykłady, pytania, konteksty oraz oczekiwane odpowiedzi. W przypadku CoT, odpowiedzi zawierają logiczne kroki rozumowania prowadzące do rozwiązania. Modele mogą wtedy uczyć się zarówno interpretacji poleceń, jak i strategii rozwiązywania.

### Typowe warianty konfiguracji

- **Zero-shot**: brak przykładów, tylko instrukcja
- **Few-shot**: kilka przykładów rozwiązanych zadań
- **CoT**: każda odpowiedź to sekwencja myśli prowadząca do rezultatu
- **Z self-consistency**: generacja wielu ścieżek rozumowania i wybór dominującej odpowiedzi

## Wyniki i efekty skalowania

- Skalowanie liczby zadań i rozmiaru modelu przynosi korzyści, choć wzrost zmniejsza się po pewnym progu.
- Wspólne trenowanie na danych CoT i klasycznych (non-CoT) daje lepsze wyniki niż osobne trenowanie tylko na jednym typie.
- Modele po takim dostrojeniu przewyższają bazowe checkpointy (np. T5 → Flan-T5, PaLM → Flan-PaLM).

## Efekty w zadaniach

- **Rozumowanie matematyczne**: Flan-PaLM z CoT + self-consistency osiąga SoTA na benchmarku GSM8K.
- **Wielojęzyczność**: 14,9% poprawy w TyDiQA; wzrost wyników w słabo reprezentowanych językach.
- **Open-ended QA**: lepsza kontrola długości, spójności i stosowania instrukcji.
- **Zero-shot CoT**: Flan-PaLM potrafi lepiej użyć "pomyślmy krok po kroku" niż oryginalny PaLM.

# 💡 Przykład zastosowania

Narzędzie analityczne oparte na LLM zostało wdrożone w firmie doradczej. Dzięki Flan-PaLM, wytrenowanemu na szerokim zestawie zadań instrukcyjnych i CoT, asystent AI może:

- Analizować dane finansowe, zadając pytania typu "Przeanalizuj trend EBITDA dla tej firmy w podziale rocznym"
- Tworzyć scenariusze "krok po kroku" z poprawną logiką, również w językach obcych
- Działać nawet bez dostarczonych przykładów (zero-shot), co znacznie skraca czas wdrożenia

Model odpowiada zwięźle, krokowo i uwzględnia złożoność zapytań — co wcześniej nie było możliwe bez rozbudowanego few-shot promptowania.

## 📌 Źródła

[https://arxiv.org/abs/2210.11416](https://arxiv.org/abs/2210.11416) – Flan-PaLM: Scaling Instruction-Finetuned Language Models  
[https://ai.googleblog.com/2022/11/flan-palm-scaling-instruction-finetuned.html](https://ai.googleblog.com/2022/11/flan-palm-scaling-instruction-finetuned.html)  
[https://platform.openai.com/docs/guides/gpt-best-practices](https://platform.openai.com/docs/guides/gpt-best-practices) (ograniczenia zero-shot CoT)

## 👽 Brudnopis

- Modele trenowane na 1800 instrukcjach → wszechstronniejszy → mniej hallucinacji
- CoT + SC = nowy standard dla reasoning-heavy tasks
- Podpowiedź „Pomyślmy krok po kroku” działa tylko po wcześniejszym CoT finetuningu
- Flan-PaLM/T5 → poprawa w QA, wnioskowaniu wieloetapowym, wielojęzycznym, odpowiadaniu na pytania otwarte
- Widoczna poprawa w MMLU, GSM8K, BIG-Bench
- Mniejszy model z instrukcjami przewyższa większy bez nich
- Rekomendacja: kombinacja danych + technik generacyjnych + kontrola odpowiedzi via SC ụzọ