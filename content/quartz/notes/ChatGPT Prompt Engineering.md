---

title: ChatGPT Prompt Engineering  
created: 2025-07-16  
status:  
category: LLM  
difficulty: średni  
language: pl  
tags:

- prompt engineering
- ChatGPT
- LLM
- rozmowy
- API  
aliases:
- inżynieria promptów ChatGPT

---

# 🎯 Wprowadzenie do ChatGPT

**ChatGPT** to zaawansowany model językowy wytrenowany przez OpenAI do interakcji w formacie konwersacyjnym. Dzięki zastosowaniu Reinforcement Learning from Human Feedback (RLHF), model radzi sobie nie tylko z wykonywaniem instrukcji w podpowiedzi, ale i z utrzymaniem spójności oraz kontekstu dialogu. Otwiera to nowe możliwości:

- odpowiadanie na pytania,
- generowanie kodu,
- pisanie tekstów w określonym stylu,
- asystowanie w zadaniach kreatywnych i naukowych.

# 🔑 Kluczowe techniki inżynierii podpowiedzi (promptów)

- **Prompt z określoną rolą i stylem** – jawne zadeklarowanie, kim ma być chatbot i jakim stylem odpowiadać.
- **System prompt vs user prompt** – różnicowanie, czy instrukcja trafia do modelu w sekcji system ("You are an AI research assistant"), czy jako polecenie użytkownika.
- **Formatuj rozmowy wieloobrotowe** – w API każda wypowiedź powinna mieć rolę (`system`, `user`, `assistant`) oraz odpowiedni kontekst.
- **Instrukcje explicitne** – włączenie do promptu warunków, oczekiwanych formatów odpowiedzi ("Odpowiedz krótko", "Jeśli nie wiesz, napisz 'Niepewna odpowiedź'").
- **Chain-of-thought i role prompting** – zachęcanie modelu do myślenia krok po kroku lub przyjmowania ról (np. ekspert naukowy, programista).

# 📚 Przegląd praktycznych scenariuszy

## 1. Ustawienie tożsamości i intencji

```markdown
The following is a conversation with an AI research assistant. The assistant tone is technical and scientific.
Human: Hello, who are you?
AI: Greeting! I am an AI research assistant. How can I help you today?
```

Ten szablon pozwala modelowi przyjąć spójny styl konwersacyjny.

## 2. API ChatGPT i struktura wiadomości

W nowoczesnych implementacjach wszystkie wiadomości trafiają do modelu jako seria roli i treści, np.:

- `system`: Ustala tożsamość lub tryb pracy modelu.
- `user`: Zadaje pytania lub konkretne polecenia.
- `assistant`: Przechowuje odpowiedzi modelu w wieloobrotowej konwersacji.

Przykładowy kod w Pythonie:

```python
import openai
openai.ChatCompletion.create(
  model="gpt-3.5-turbo",
  messages=[
    {"role": "system", "content": "You are an AI research assistant. You use a tone that is technical and scientific."},
    {"role": "user", "content": "Hello, who are you?"},
    {"role": "assistant", "content": "Greeting! I am an AI research assistant. How can I help you today?"},
    {"role": "user", "content": "Can you tell me about the creation of black holes?"}
  ]
)
```

## 3. Rozmowy wieloobrotowe i zadania jednoobrotowe

- **Multi-turn:** Model analizuje całą historię rozmowy i generuje odpowiedzi kontekstowe.
- **Single-turn:** Przetwarza pojedyncze polecenie, zachowując się jak klasyczne API GPT-3.

Przykład single-turn:

```markdown
USER: Answer the question based on the context below. Keep the answer short and concise. Respond "Unsure about answer" if not sure about the answer.
Context: ...
Question: ...
Answer:
```

# ⚙️ Ograniczenia i wyzwania

- **Brak gwarancji nieomylności** – mimo RLHF model może generować halucynacje lub nieścisłości.
- **Wrażliwość na prompt** – wąska/nieprecyzyjna instrukcja prowadzi do słabszych wyników, natomiast zbyt złożone prompty mogą generować rozbieżne odpowiedzi.
- **Zmiany zachowań w zależności od wersji modelu** – niektóre strategie promptowania stają się mniej skuteczne po update wersji.
- **Brak pamięci długoterminowej** – pomimo utrzymywania kontekstu konwersacji, ChatGPT nie pamięta informacji z wcześniejszych interakcji poza bieżącą sesją.
- **Ograniczenia bezpieczeństwa i filtracji treści** – model może odmawiać realizacji niektórych poleceń ze względów etycznych lub regulaminowych.

# 📝 Praktyczne wskazówki

- Twórz prompty jasne i precyzyjne (“Wyjaśnij krok po kroku…”).
- Stosuj systemową deklarację roli – wpływa na styl i zakres odpowiedzi.
- Ogranicz liczbę pytań w jednym promptcie, aby rozbić zadanie na mniejsze części.
- W mid-turn tasks korzystaj z etykiet: `SYSTEM`, `USER`, `ASSISTANT` w API.
- Testuj prompty na wybranych wersjach modeli; niuanse zmieniają się po aktualizacjach.

# 📁 Przydatne materiały i dokumenty

Oto wyselekcjonowana lista przeglądów naukowych, przewodników i źródeł na temat architektury ChatGPT oraz prompt engineering:

- A Prompt Pattern Catalog to Enhance Prompt Engineering with ChatGPT
- Techniques to improve reliability – OpenAI Cookbook
- How to format inputs to ChatGPT models (OpenAI Cookbook)
- Awesome ChatGPT Prompts (przykłady zadań dla rozmaitych zastosowań)
- A Survey on ChatGPT: AI-Generated Contents, Challenges, and Solutions
- MM-REACT: Prompting ChatGPT for Multimodal Reasoning and Action
- Unlocking the Potential of ChatGPT: A Comprehensive Exploration of its Applications, Advantages, Limitations, and Future Directions in Natural Language Processing

# 👽 Brudnopis

- ChatGPT = model dialogowy, rola promptów jeszcze większa niż w GPT-3.
- Intencja i tożsamość w promptcie → pełna kontrola nad stylem.
- Najważniejsze praktyki: rolę deklarować w system prompt lub explicit user prompt.
- Trendy (2023-2025): prompt chaining, few-shot + CoT, multi-agent compositional prompts.
- Ograniczenia trzeba testować każdorazowo po zmianie wersji LLM.

**Przegląd źródeł i dalszych lektur znajdziesz wyżej — część tekstów stanowi najnowszy stan wiedzy o ChatGPT i prompt engineering.**