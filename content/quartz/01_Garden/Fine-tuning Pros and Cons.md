---
title: Fine-tuning LLM - Plusy i Minusy
created: 2026-02-04
status: evergreen
category: LLM / Strategy
difficulty: intermediate
language: pl
tags:
  - fine-tuning
  - llm
  - strategy
  - rag
  - cost
aliases:
  - Kiedy robić Fine-tuning?
  - Fine-tuning vs RAG
---
# 🎯 Definicja
**Fine-tuning** to douczanie modelu. Bierzesz ogólny model (np. Llama 3) i pokazujesz mu tysiące przykładów "Pytanie -> Idealna Odpowiedź", żeby zmienić jego zachowanie, styl lub wiedzę.

# 🔑 Kluczowe punkty
- **Zmienia ZACHOWANIE (Formę):** Świetne do nauki stylu mówienia, formatu JSON, procedur medycznych.
- **Słabo uczy WIEDZY (Faktów):** Nie używaj fine-tuningu, żeby nauczyć model nowych newsów. Do tego służy [[RAG]].
- **Data Curation:** Jakość Twojego zbioru treningowego jest ważniejsza niż parametry treningu.

# 📚 Szczegółowe wyjaśnienie
## Plusy
- **Specjalizacja:** Model staje się ekspertem w wąskiej dziedzinie (np. pisanie pozwów sądowych).
- **Mniejszy Prompt:** Nie musisz pisać instrukcji na 10 stron w każdym prompcie, bo model ma to "we krwi".
- **Koszt (Inference):** Mniejszy model po fine-tuningu może pokonać giganta (GPT-4) w specyficznym zadaniu, będąc 10x tańszym w działaniu.

## Minusy
- **Koszt (Trening):** Musisz mieć GPU i zbiór danych.
- **Zapominanie (Catastrophic Forgetting):** Douczony model może zgłupieć w innych dziedzinach.
- **Sztywność:** Jak zmienią się przepisy, musisz trenować od nowa. W RAG po prostu podmieniasz plik PDF.

# 💡 Przykład zastosowania
Dział Obsługi Klienta Samsunga.
Chcesz, żeby bot odpowiadał w specyficznym, uprzejmym stylu marki Samsung i używał konkretnych zwrotów.
Robisz Fine-tuning na bazie 10,000 idealnych rozmów z historii.
Model uczy się **stylu**.
Ale wiedzę o tym, ile kosztuje Galaxy S24 dzisiaj, pobiera przez **RAG** z cennika.

## 📌 Źródła
- OpenAI Fine-tuning Guide.

## 👽 Brudnopis
- Złota zasada: Najpierw spróbuj Prompt Engineering. Potem RAG. Na końcu Fine-tuning.
