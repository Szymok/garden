---

title: Ogólne wskazówki dotyczące projektowania promptów  
created: 2025-07-16  
status: Final  
category: Prompt Engineering  
difficulty: podstawowy  
language: pl  
tags:

- prompting
- inżynieria promptów
- ai  
aliases:
- ogólne zasady promptowania
- prompt design best practices
- projektowanie promptów

---

# 🎯 Definicja

**Projektowanie promptów** to iteracyjny proces tworzenia jasnych, precyzyjnych instrukcji dla modeli AI, którego celem jest uzyskiwanie powtarzalnych, wysokiej jakości odpowiedzi. Dobre prompty wykorzystują prostotę, jasność polecenia i właściwe dawkowanie kontekstu, umożliwiając skuteczną komunikację z [[Base LLM|LLM]].

# 🔑 Kluczowe zasady

- **Zaczynaj od prostych promptów** – iteruj, testuj różne warianty i stopniowo dokładnie dopracowuj szczegóły.
- **Używaj konkretnych poleceń** – operuj czasownikami typu: “Napisz”, “Przetłumacz”, “Podsumuj”, “Wymień”, “Zamień na JSON”.
- **Dziel duże zadania na mniejsze** – łatwiej uzyskasz kontrolę i przewidywalność, unikając nadmiernej komplikacji.
- **Instrukcja na początku** – zaczynaj prompt od wyraźnej instrukcji, najlepiej oddzielonej od kontekstu separatorami (`###`, `---`).
- **Kontekst i przykłady** – im bardziej szczegółowy i istotny kontekst oraz pożądany format, tym lepsze wyniki, szczególnie przy niestandardowych zadaniach.
- **Bądź precyzyjny, nie za szczegółowy** – precyzja ≠ długość. Ulepszaj prompt w stronę opisu najbardziej istotnych wymagań, unikając zbędnych dygresji.
- **Unikaj negacji i zakazów** – zamiast mówić, czego model ma nie robić, lepiej jasno określ, co powinien wykonać.
- **Testuj różne sformułowania, formaty i przykłady** – to, co działa dla jednego zadania, może wymagać innego podejścia w innym przypadku.

# 📚 Szczegółowe wyjaśnienia i przykłady

## 1. Iteracyjność i prostota

> Najlepsze prompty powstają w wyniku testowania wariantów i obserwowania zachowań modelu. Zacznij od wersji jak najprostszej, iteracyjnie dodając polecenia, kontekst lub przykłady.

```text
### Instrukcja
Przetłumacz poniższy tekst na hiszpański:
Tekst: "Witaj!"
```

## 2. Precyzyjna i jasna instrukcja

> Im bardziej szczegółowe i opisowe polecenie, tym wyższa jakość oraz spójność odpowiedzi, zwłaszcza gdy oczekujesz konkretnego formatu lub stylu.

```text
Wyodrębnij nazwy miejsc z poniższego tekstu.
Oczekiwany format:
Place: <lista_nazw_po_przecinku>
Tekst: "Henrique Veiga-Fernandes pracuje w Champalimaud Centre for the Unknown w Lizbonie."
```

### Wynik:

```
Place: Champalimaud Centre for the Unknown, Lizbona
```

## 3. Unikanie nieprecyzyjnych poleceń

> Jasność komunikacji jest kluczowa – zbyt ogólne lub niekonkretne prompty zwiększają ryzyko niezadowalających, nieprzewidywalnych odpowiedzi.

- 👎 **Nieoptymalnie:**  
    "Wyjaśnij inżynierię promptów. Utrzymaj wyjaśnienie krótkie, tylko kilka zdań, nie bądź zbyt opisowy."
- 👍 **Lepiej:**  
    "W 2-3 zdaniach wyjaśnij koncepcję inżynierii promptów uczniowi liceum."

## 4. Formułowanie wytycznych „co robić”, nie „czego NIE robić”

> Sformułowania negatywne łatwo prowadzą model do niepożądanych zachowań. Lepiej wyraźnie określić, jakie działania mają zostać wykonane.

- 👎  
    "DO NOT ASK FOR PERSONAL INFORMATION."
- 👍  
    "Agent powinien zarekomendować filmy wyłącznie na podstawie globalnych trendów. Nie zadawaj pytań o zainteresowania ani dane osobowe. Jeśli nie znajdziesz filmu, odpowiedz: 'Przepraszam, dziś nie mam propozycji.'"

## 5. Testowanie formatów promptów

> Dla modeli (zwłaszcza [[Base LLM|LLM]]) warto rozważyć:

- separator instrukcji i kontekstu (`###`, `---`)
- przykłady wejścia-wyjścia ([[few-shot prompting]])
- jasne wymagania co do długości/wyniku ("wymień 3 rzeczy", "zwróć JSON", "podaj jako listę")

# 💡 Przykład rozbudowanego promptu

```
### Instrukcja ###
Podsumuj poniższy tekst w jednym zdaniu używając stylu popularnonaukowego.

Tekst:
"W XX wieku pojawiły się pierwsze komputery elektroniczne, które zrewolucjonizowały komunikację i przetwarzanie informacji..."

Output format: Jedno zdanie, styl popularnonaukowy.
```

# 📌 Źródła

- promptingguide.ai/best-practices
- OpenAI Cookbook: Prompt engineering best practices
- DeepLearning.AI – [[ChatGPT Prompt Engineering]] for Developers

## 👽 Brudnopis

- Prompt = komunikat, którego skuteczność testujesz i optymalizujesz
- Lepsze wyniki uzyskasz przez iteracje i stopniowe zawężanie – nie przez pojedynczą próbę
- Macierz: [jasna instrukcja] + [odpowiedni format] + [kontekst] + [przykład]
- Najlepsza praktyka: „powiedz, co robić”, nie „czego nie robić”
- Sprawdzaj: długość promptu vs ograniczenia modelu (kontekst tokenów)

---