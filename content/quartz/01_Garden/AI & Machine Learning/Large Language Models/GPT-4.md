---
title: GPT-4 (Generative Pre-trained Transformer 4)
created: 2026-02-04
status: evergreen
category: LLM / Models
difficulty: basic
language: pl
tags:
  - openai
  - gpt-4
  - llm
  - sota
aliases:
  - Chat GPT 4
  - Model GPT-4
---
# 🎯 Definicja
**GPT-4** to multimodalny model językowy dużej skali (Large Multimodal Model) stworzony przez OpenAI. Jest następcą GPT-3.5. Potrafi analizować zarówno tekst, jak i obrazy (Vision), oraz wykazuje znacznie lepsze zdolności rozumowania (Reasoning) i kodowania w porównaniu do poprzedników.

# 🔑 Kluczowe punkty
- **Reasoning:** Potrafi rozwiązywać zagadki logiczne i zdawać egzaminy (np. adwokacki Bar Exam) na poziomie 90. percentyla.
- **Większe okno kontekstowe:** Pamięta znacznie więcej tekstu z rozmowy (do 128k tokenów w wersji Turbo).
- **Multimodalność:** "Widzi" zdjęcia i potrafi je opisywać.

# 📚 Szczegółowe wyjaśnienie
GPT-4 jest modelem "MoE" (Mixture of Experts) - choć OpenAI tego oficjalnie nie potwierdza, branża spekuluje, że składa się z wielu mniejszych modeli specjalistycznych, a router decyduje, którego użyć do danego pytania. Dzięki temu jest potężny, ale wciąż efektywny w inferencji.
Jest podstawą wersji ChatGPT Plus oraz Microsoft Copilot.

# 💡 Przykład zastosowania
Użytkownik wrzuca zdjęcie zawartości lodówki.
GPT-4 rozpoznaje składniki (jajka, mleko, szpinak) i generuje przepis na omlet ze szpinakiem, uwzględniając te składniki. GPT-3 (tekstowy) nie byłby w stanie tego zrobić bez ręcznego opisania zdjęcia przez człowieka.

## 📌 Źródła
- OpenAI GPT-4 Technical Report.

## 👽 Brudnopis
- Obecnie (2024/2025) standardem staje się GPT-4o ("Omni") - szybszy i natywnie multimodalny (audio/wideo/tekst w jednym modelu).
- Koszt API GPT-4 jest znacznie wyższy niż modeli mniejszych (GPT-4o-mini / GPT-3.5), więc używa się go do zadań wymagających "inteligencji", a nie prostego przetwarzania tekstu.