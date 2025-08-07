---

title: Generatywna Sztuczna Inteligencja  
created: 2025-07-16  
status: Final  
category: Sztuczna inteligencja  
difficulty: podstawowy  
language: pl  
tags:

- generatywna sztuczna inteligencja
- genAI
- LLM
- uczenie maszynowe
- modele generatywne  
aliases:
- generative AI
- GenAI
- generatywne modele AI

---

# 🎯 Definicja

**Generatywna Sztuczna Inteligencja (Generative AI, GenAI)** to poddziedzina sztucznej inteligencji, której celem jest tworzenie nowych, oryginalnych treści. W przeciwieństwie do klasycznych modeli predykcyjnych, które klasyfikują lub przewidują wartości, modele generatywne samodzielnie **generują nowe dane**: tekst, obrazy, kod, dźwięk, muzykę, a nawet wideo.

Najczęściej osiąga się to poprzez trenowanie modeli na dużych zbiorach danych i wykorzystanie ich do **rekonstrukcji lub rozszerzania rozkładu danych wejściowych** – na zasadzie "przewidzenia, co pasuje dalej".

# 🔑 Kluczowe punkty

- GenAI przekształca dane wejściowe w dane wyjściowe o podobnym stylu lub cechach.
- Duże modele językowe ([[Base LLM|LLM]], np. GPT, Claude, Llama) to najpopularniejsze aplikacje GenAI.
- Modele uczą się semantyki i struktury danych, a następnie używają ich do tworzenia nowej zawartości.
- Wspierają szereg zastosowań: **tworzenie treści**, **automaty generujące kod**, **asystenci konwersacyjni**, **generatywne obrazy** (np. DALL·E, Midjourney)
- Wymagają dużych mocy obliczeniowych i zaawansowanej architektury (Transformers, Diffusion Models itd.)

# 📚 Szczegółowe wyjaśnienie

## Jak działa GenAI?

Generatywne modele przewidują **kolejny element** (np. słowo, piksel, dźwięk) w sekwencji, bazując na wcześniejszych danych.

Działają w oparciu o:

- **Transformery** – np. GPT, które uczą się kontekstu tokenów i generują następny token
- **Modele dyfuzyjne (diffusion models)** – używane w generowaniu grafiki i obrazów
- **GANs ([[GAN - podstawy|Generative Adversarial Networks]])** – dwie sieci konkurujące w generowaniu i ocenie danych

## [[Base LLM|LLM]] jako aplikacja GenAI

Duże Modele Językowe ([[Base LLM|LLM]]) takie jak GPT działają według zasady:

1. Wejście (prompt) jest tokenizowane
2. Model przewiduje kolejne prawdopodobne tokeny
3. Output składany jest z pojedynczych kroków predykcji
4. Proces kontynuuje się aż do uzyskania pełnej odpowiedzi

## Długość kontekstu

**Długość kontekstu** to ograniczenie dotyczące liczby tokenów (jednostek składających się na tekst), które model może "widzieć" i analizować naraz.

- Typowe limity:
    - GPT-3: 4k tokenów
    - GPT-3.5-turbo: 16k–32k tokenów
    - [[GPT-4]]-turbo: do 128k tokenów
    - Claude 2.1: do 200k tokenów

Im większy kontekst, tym bardziej model "pamięta", ale też zwiększają się koszty i czas przetwarzania.

## Znane przykłady GenAI

|Typ treści|Narzędzia / Modele|
|---|---|
|Tekst|GPT, Claude, Mistral, LLaMA|
|Obrazy|DALL·E, Midjourney, Stable Diffusion|
|Dźwięk, muzyka|Jukebox, Riffusion, MusicLM|
|Wideo|Sora (OpenAI), Runway|
|Kod|GitHub Copilot, CodeWhisperer, StarCoder|

# 💡 Przykład zastosowania

Zespół tworzy narzędzie do automatycznego generowania e-maili marketingowych. Korzystają z OpenAI [[GPT-4]] poprzez API. Podają dane o odbiorcy, cel kampanii i styl – model generuje tekst, który po zatwierdzeniu trafia bezpośrednio do systemu CRM. Użytkownik może edytować prompt i zlecać poprawki typu „bardziej formalnie”, „dodaj ofertę specjalną”, itp.

# 📌 Źródła

- [https://openai.com/research](https://openai.com/research)
- [https://www.microsoft.com/en-us/ai/generative-ai](https://www.microsoft.com/en-us/ai/generative-ai)
- [https://hbr.org/2023/05/what-is-generative-ai](https://hbr.org/2023/05/what-is-generative-ai)
- [https://deepmind.google/technologies/gemini](https://deepmind.google/technologies/gemini)
- [https://huggingface.co](https://huggingface.co)

## 👽 Brudnopis

- GenAI ≠ predykcja — to tworzenie nowych danych podobnych do już istniejących
- Nie "rozumie", ale imituje struktury języka/obrazu/dźwięku
- Hallucinations = niebezpieczeństwo w aplikacjach faktograficznych
- Prompting = interfejs użytkownika dla GenAI
- Inżynieria promptów określa zakres outputu
- Modele stają się multimodalne: tekst + obraz + kod + głos
- Tokeny ≠ słowa; dokument 3000 słów = ~4000–5000 tokenów

---