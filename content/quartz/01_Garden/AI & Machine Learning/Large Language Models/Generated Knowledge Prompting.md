---
title: Generated Knowledge Prompting (Generowanie Wiedzy)
created: 2026-02-04
status: evergreen
category: Prompt Engineering
difficulty: intermediate
language: pl
tags:
  - knowledge-generation
  - reasoning
  - grounding
  - context
aliases:
  - Generated Knowledge
  - GKP
  - Promptowanie z wiedzą
---
# 🎯 Definicja
**Generated Knowledge Prompting** to technika, w której prosimy model [[Base LLM|LLM]], aby najpierw **wygenerował wiedzę** na dany temat (stworzył mini-notatkę lub listę faktów), a dopiero potem odpowiedział na właściwe pytanie, korzystając z tej wygenerowanej wiedzy. To sposób na "przypomnienie" modelowi faktów przed rozwiązaniem zadania.

# 🔑 Kluczowe punkty
- **Zasada:** Najpierw pomyśl (wygeneruj [[Fakty|fakty]]), potem odpowiedz.
- **Cel:** Zwiększenie trafności odpowiedzi w zadaniach wymagających wiedzy ogólnej (CommonsenseQA) i rozumowania.
- **Różnica:** W [[RAG|RAG]] wiedzę dostarczamy z zewnątrz. W GKP wiedzę generuje sam model (z własnych wag).

# 📚 Szczegółowe wyjaśnienie
Dlaczego to działa? Modele LLM mają ogromną wiedzę zaszytą w wagach, ale czasem nie potrafią jej "wydobyć" bezpośrednio w odpowiedzi na krótkie pytanie. Wymuszenie etapu generowania wiedzy działa jak "rozgrzewka" lub ustawienie odpowiedniego kontekstu (priming).
Proces:
1. Pytanie: "Czy golfista chce mieć dużo punktów?"
2. Krok 1 (Generowanie wiedzy): "Wygeneruj [[Fakty|fakty]] o zasadach golfa." -> Model pisze: "W golfie wygrywa osoba z najmniejszą liczbą uderzeń."
3. Krok 2 (Odpowiedź): "Korzystając z powyższej wiedzy, odpowiedz na pytnie." -> "Nie, golfista chce mało punktów."

# 💡 Przykład zastosowania
Pytanie: "Jaki kolor ma uśmiech?"
Bez GKP model może zgłupieć lub odpowiedzieć poetycko.
Z GKP ([[Fakty|Fakty]] o uśmiechu): "Uśmiech odsłania zęby. Zęby są zazwyczaj białe."
Odpowiedź: "Biały."

## 📌 Źródła
- "Generated Knowledge Prompting for Commonsense Reasoning" (Liu et al., 2022).

## 👽 Brudnopis
- Technika ta jest prekursorem [[Chain-of-Thought Prompting]].
- Przydatna, gdy nie mamy dostępu do zewnętrznej bazy wiedzy ([[RAG|RAG]]), a chcemy poprawić jakość wnioskowania.