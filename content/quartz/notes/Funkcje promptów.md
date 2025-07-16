---

title: Funkcje promptów  
created: 2025-07-16  
status: Final  
category: Prompt Engineering  
difficulty: średniozaawansowany  
language: pl  
tags:

- prompting
- funkcje promptów
- application design
- ai
- meta prompting  
aliases:
- prompt as function
- funkcjonalne prompty
- funkcje w GPT

---

# 🎯 Definicja

**Funkcje promptów** (prompt functions) to wzorzec stosowania zorganizowanych, nazwanych promptów do wykonywania konkretnych zadań w modelach językowych. Traktując prompt jako funkcję (z nazwą, argumentami i instrukcją – „regułą przetwarzania”), możemy tworzyć samodokumentujące się, wielokrotnego użytku komponenty konwersacyjne, które można łączyć w przepływy (workflow) lub wywoływać z użyciem spójnej składni.

To podejście przypomina definiowanie funkcji w języku programowania i może być stosowane nawet bez kodowania – wystarczy ścisła konwencja projektowania w naturalnym języku.

# 🔑 Kluczowe elementy

- **function_name** — identyfikator funkcji promptu
- **input** — wejściowy tekst, dane, parametry
- **rule** — instrukcja mówiąca GPT, co ma zrobić z danymi wejściowymi
- **output** — wynik wygenerowany przez GPT zgodnie z powyższymi

Schemat przypomina:

```
function_name(input) → output
```

lub

```text
function_name: [nazwa]
input: ["wartość"]
rule: [instrukcja wykonania działania]
```

# 📚 Szczegółowe wyjaśnienie

## Wprowadzenie – meta prompt

Na początku definiujemy „wstępny prompt-wyjaśnienie”, który informuje model o tym, w jakim formacie będziemy do niego mówić. Prompt można nazwać **meta prompt** – to on ustala strukturę dalszych funkcji promptów.

### Meta prompt:

```text
Hello, ChatGPT! I hope you are doing well. I will be using a template to describe the function, input, and rule. Please find the details below:
function_name: [Function Name]
input: [Input]
rule: [Instructions on how to process the input]
...
```

Po potwierdzeniu przez model `ok`, możemy pisać i wywoływać kolejne prompty w formie funkcji.

## Przykłady funkcji promptów

### 1. Tłumaczenie słów – `trans_word`

```text
function_name: [trans_word]
input: ["こんにちは。"]
rule: [I want you to act as an English translator, spelling corrector and improver. Translate any input to English.]
```

### 2. Rozszerzanie tekstu – `expand_word`

```text
function_name: [expand_word]
input: ["I’m happy today."]
rule: [Make the sentence more elaborate and literary. Keep the original meaning.]
```

### 3. Poprawianie języka angielskiego – `fix_english`

```text
function_name: [fix_english]
input: ["He go to school every day."]
rule: [Correct grammar, improve vocabulary, and rewrite naturally.]
```

Wywołanie:

```text
fix_english("He go to school every day.")
```

### 4. Łączenie funkcji

Można zagnieżdżać funkcje, np.:

```text
fix_english(expand_word(trans_word("Je suis très content.")))
```

## Funkcje z wieloma parametrami

Funkcje promptów mogą też przyjmować wiele argumentów, np. generator hasła `pg`:

```text
function_name: [pg]
input: ["length", "capitalized", "lowercase", "numbers", "special"]
rule: [Generate a secure password based on the given parameters. Only output the password string.]
```

Wywołanie:

```text
pg(10, 1, 5, 2, 2)
```

## Dobry styl — jasno, bez nadmiaru

Aby uniknąć gadatliwych odpowiedzi LLM, można dodać:

```text
DO NOT SAY ANYTHING ELSE UNLESS YOU DON'T UNDERSTAND THE FUNCTION
```

# 💡 Przykład procesu

Załóżmy, że budujesz miniaplikację do nauki języka. Tworzysz te funkcje:

- `trans_word()` tłumaczy
- `expand_word()` rozwija styl
- `fix_english()` poprawia język

Zapisujesz je jako definicje w notatniku lub PromptApp. Następnie szkolisz swój własny „agent ChatGPT” poprzez inicjalizację z meta-prompt i używasz funkcji tekstowych tak, jakbyś pisał kod.

To podejście jest świetne do:

- automatyzacji procesów tekstowych
- prototypowania systemów asystujących
- budowy interfejsów niskokodowych lub no-code
- tworzenia bibliotek promptów dla zespołów AI

# 📌 Narzędzia & inspiracje

- ChatGPT-Next-Web – wsparcie wielu promptów/startowych komend
- PromptAppGPT – tworzenie niskokodowych aplikacji promptowych
- LangChain / marvin / AutoGPT – integracja promptów z logiką programistyczną
- Notatniki, vaulty, markdown – idealne do tworzenia bibliotek prompt functions
- Prompt chaining – konstrukcja bardziej rozbudowanych aplikacji (prompt pipeline)

# 🧠 Podsumowanie

Funkcje promptów to sposób uzyskiwania spójnego, powtarzalnego i łatwego do utrzymania interfejsu z modelami językowymi. Model „promptowania jako funkcji” pozwala traktować naturalny język tak, jakby był językiem programowania — przy jednoczesnym zachowaniu jego elastyczności.

To doskonałe rozwiązanie do codziennej automatyzacji, eksperymentów lub nawet budowy własnego osobistego agenta LLM.

## 👽 Brudnopis

- prompt = funkcja: `nazwa(input, reguła)`
- meta prompt = sposób nauczenia GPT interfejsu dialogowego
- działa w stylu REPL/CLI – krótko, strukturalnie
- może być zapisane jako baza z funkcjami (~prompt library)
- People Writing Functions in Prompt Language (nowy archetyp?)

---