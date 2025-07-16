---

title: Base LLM  
created: 2025-04-01  
status:  
category: sztuczna inteligencja / modele językowe  
difficulty: średni  
language: pl  
tags:

- Sztuczna-Inteligencja
- llm
- modele językowe
- NLP  
aliases:
- large language models
- LLM

---

# 🎯 Definicja

**Large Language Models (LLM)** to duże modele językowe wykorzystujące głębokie sieci neuronowe – zazwyczaj oparte na architekturze transformera – które uczą się przewidywania kolejnych słów w tekście. Trening oparty jest na bardzo prostym założeniu:

> „Biorąc pod uwagę ten tekst, co powinno być dalej?”

LLM-y są trenowane na wielkoskalowych zbiorach danych tekstowych i uczą się rozumienia oraz generowania spójnego języka naturalnego.

# 🔑 Kluczowe punkty

- 🧠 Zbudowane na architekturze transformer (np. GPT).
- 🔁 Przewidują kolejne słowo/token na podstawie wcześniejszego kontekstu.
- 📚 Trening obejmuje miliardy tokenów z korpusów tekstów pisanych.
- 💬 Mogą być dostrojone do interakcji konwersacyjnych i różnych zadań (prompt-based learning, instruction tuning).
- 🔍 Wykazują efekt emergencji – nieoczekiwane zdolności pojawiające się w dużej skali.

# 📚 Zastosowania

- 🧑‍💼 **Asystent AI** – przyjmowanie ról: ekspert, prawnik, doradca, nauczyciel.
- ✍️ **Tworzenie i przekształcanie tekstów** – tłumaczenia, parafrazy, streszczenia, korekty.
- 🧾 **Parsowanie danych** – ekstrakcja informacji z chaotycznych źródeł (np. PDF, maile, umowy).
- ❓ **Odpowiadanie na pytania** na podstawie dostarczonych danych kontekstowych.
- 💻 **Zadania programistyczne** – tworzenie, refaktoryzacja, debugowanie kodu.
- 🔌 **Integracja z API i funkcjami** – wykorzystując techniki Function Calling.
- 📊 **Wnioskowanie semantyczne** – klasyfikacja, kategoryzacja, analiza tonacji.
- 🤖 **Integracja z aplikacjami** – personalizacja asystentów w CRM, helpdesk, BI, itd.

# 🧠 Emergentne zachowania

LLM-y wykazują funkcjonalności, których nie mają mniejsze modele, np.:

- tłumaczenie pomimo braku dedykowanego treningu do tego celu,
- rozumienie skomplikowanych instrukcji,
- rozwiązywanie testów IQ lub zadań arytmetycznych.

Zachowania te są wynikiem ilości danych i skali modelu – często zaskakując nawet twórców modeli: [GPT-4 Technical Report](https://cdn.openai.com/papers/gpt-4.pdf).

# 🚧 Ograniczenia

### 1. Występowanie halucynacji

Modele mogą generować błędne informacje, choć brzmią one przekonująco. → Zobacz: Halucynacje

### 2. Przenoszenie biasów treningowych

LLM-y mogą wzmacniać stereotypy i powielać uprzedzenia zawarte w danych treningowych.

### 3. Ograniczenie kontekstu (Token Window)

Transformery mają maksymalną długość sekwencji (np. 8k, 32k tokenów), co wpływa na:

- 💰 **Koszt zapytań i generacji**,
- 🐢 **Wydajność operacyjną**,
- 📉 **Spadek trafności – „Lost in the Middle”** ([źródło](https://arxiv.org/pdf/2307.03172.pdf)).

### 4. Brak źródła prawdy

Bazują wyłącznie na wzorcach z tekstu – nie mają zagwarantowanego dostępu do faktów (chyba że połączone z systemem RAG).

# 💬 Niedeterministyczność

LLM generuje odpowiedzi probabilistycznie. Każde zapytanie może dać inną, choć logiczną odpowiedź. Można wpływać na to przez parametry jak `temperature` lub `top_p`.

# 💡 Przykład zastosowania

```python
prompt = """
You are a helpful assistant that extracts invoice numbers from messy text.
Text: "Dziękujemy za współpracę! Faktura: FV-2023-0091."
Answer:
"""

# Oczekiwany output: "FV-2023-0091"
```

# 📌 Źródła

- [GPT-4 Technical Report](https://cdn.openai.com/papers/gpt-4.pdf)
- [Emergent Abilities of LLMs (Wei et al.)](https://arxiv.org/abs/2206.07682)
- [Lost in the Middle (Liu et al.)](https://arxiv.org/pdf/2307.03172.pdf)
- [Function Calling (OpenAI)](https://openai.com/blog/function-calling-and-other-api-updates)
- "Attention Is All You Need", Vaswani et al., [https://arxiv.org/abs/1706.03762](https://arxiv.org/abs/1706.03762)

# 👽 Brudnopis

- Architektura transformer = podstawa: self-attention, dekodery, maskowanie przyszłych tokenów.
- Token window = dostępne miejsce w modelu → wpływa na OKNO percepcji.
- LLM ≠ Chatbot (ale może być jego silnikiem) → foundation model, konfigurowalny przez prompt.
- Brak gwarancji prawdziwości → argument za integracją z bazami wiedzy, RAG czy search API.
- Dalszy rozwój LLM = techniki fine-tuning, self-refinement, chain-of-thought, agent + tools.