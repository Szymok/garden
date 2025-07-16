---

title: Stop Sequence  
created: 2024-12-10  
status: Final  
category: AI  
difficulty: podstawowy  
language: pl  
tags:

- concept
- ai
- natural language processing
- text generation  
aliases:
- kontrola wygenerowanego tekstu
- zakończenie generowania tekstu
- sekwencja zatrzymania

---

# 🎯 Definicja

**Stop Sequence** to specjalny ciąg znaków, który służy do **przerwania generowania tekstu** przez model językowy (np. GPT) w dokładnie określonym momencie. Jego zadaniem jest zatrzymać model w ustalonym punkcie wynikowym – zazwyczaj po wykonaniu konkretnego zadania.

# 🔑 Kluczowe punkty

- Pozwala na **kontrolowanie długości i granic odpowiedzi** generowanej przez model.
- Ogranicza generację do tylko istotnej treści — bez zbędnej kontynuacji.
- Stosowany w **interfejsach API do generowania tekstu**: OpenAI, Cohere, Anthropic, itp.
- Może występować w formie ciągu znaków: `"\n"`, `"###"`, `"--END--"` lub innego wybranego tokenu.
- Umożliwia tworzenie **interaktywnych narzędzi**, które precyzyjnie kończą odpowiedź modelu (np. chatboty, agenci AI, systemy wbudowane).

# 📚 Szczegółowe wyjaśnienie

W trakcie generowania tekstu modele językowe **przewidują kolejne tokeny**, bazując na wcześniejszych słowach i kontekście. Domyślnie model może generować tekst aż do:

- osiągnięcia limitu tokenów,
- napotkania instrukcji zatrzymującej, np. `stop sequence`.

Stop sequence działa jako **warunek zakończenia generacji** — jeśli tekst zawiera zadany ciąg, model przerywa dalsze generowanie.

Można zdefiniować _jedną lub kilka sekwencji zatrzymujących_, a generowanie zakończy się przy pierwszej napotkanej.

## Typowe zastosowania:

- Interfejsy konwersacyjne (chatbot): `"User:"`, `"Agent:"`, `"###"`
- Podział na fragmenty: `"---"`, `"\n"`
- Model jako komponent w aplikacji sterowanej promptami: `"END"`

# 💡 Przykład zastosowania (Python / OpenAI)

```python
import openai

response = openai.Completion.create(
    engine="text-davinci-003",
    prompt="Zakończ to zdanie: 'Inteligentne systemy uczą się na podstawie danych dzięki temu, że'",
    max_tokens=50,
    stop=["."],  # Zatrzymaj generację po pierwszej kropce
)

print(response.choices[0].text.strip())
```

Wynik:

```
są w stanie wykrywać wzorce i przewidywać wyniki.
```

Model przestał generować po napotkaniu pierwszej kropki (`"."`).

# 🚀 Zaawansowany przykład

W interakcji wielu podpowiedzi np. agenta AI, można użyć `"User:"` jako `stop`:

```python
response = openai.ChatCompletion.create(
    model="gpt-4",
    messages=[
        {"role": "system", "content": "Jesteś pomocnym asystentem."},
        {"role": "user", "content": "Wyjaśnij czym jest overfitting w ML."}
    ],
    stop=["User:"]
)
```

Model zakończy odpowiedź przed kolejną repliką „User:”, umożliwiając płynne kontynuowanie rozmowy.

# ✅ Korzyści

|Funkcja|Korzyść|
|---|---|
|Graniczna kontrola A → B|Odpowiedzi generowane dokładnie do znaku|
|Redukcja "hallucynacji"|Mniej nieistotnego lub niechcianego tekstu|
|Obsługa interakcji|Umożliwia przerywanie/dzielenie rozmów|
|Wydajność i koszt|Krótszy wynik = mniej tokenów do przetwarzania|

# 📌 Źródła

- [OpenAI API Docs – stop parameter](https://platform.openai.com/docs/api-reference/completions/create#completions-create-stop)
- _Natural Language Processing with Python_ – S. Bird, E. Klein, E. Loper
- Hugging Face Forum – Kompatybilność stop sequence z różnymi modelami
- [https://cohere.com/docs/generate](https://cohere.com/docs/generate)

## 👽 Brudnopis

- Pozornie prosty mechanizm – krytyczny dla integracji LLM w aplikacjach
- W prompt chaining — konieczny do określenia granic dla wyjścia częściowego
- Działa na poziomie tokenów – „stop” = zawiera całą sekwencję tokenów w generacji
- Stop sequence ≠ limit — nie wpływa na max_tokens, tylko przerywa wcześniej

---