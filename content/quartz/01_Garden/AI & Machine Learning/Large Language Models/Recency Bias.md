---
title: Recency Bias (Efekt Świeżości w modelach LLM)
created: 2026-07-10
status: 🌱 draft
category: Large Language Models
difficulty: średni
language: pl
tags:
  - prompt-engineering
  - llm
  - recency-bias
  - cognitive-bias
aliases:
  - Recency Bias
---
# 🎯 Definicja
**Recency Bias** (efekt świeżości / błąd świeżości) w kontekście modeli językowych (LLM) to zjawisko, w którym model przywiązuje znacznie większą wagę do informacji umieszczonych na samym końcu promptu wejściowego, ignorując lub marginalizując instrukcje podane na początku (szczególnie w przypadku długich kontekstów).

# 🔑 Kluczowe punkty
*   **Dryf uwagi (Attention Drift):** Wraz ze wzrostem długości promptu, mechanizm uwagi (Attention Mechanism) w architekturze Transformer ma tendencję do silniejszej aktywacji na ostatnich tokenach.
*   **Zagubienie w środku (Lost in the Middle):** Badania pokazują, że LLM najlepiej radzą sobie z informacjami na początku i na końcu promptu, natomiast informacje ze środka są najczęściej pomijane.
*   **Optymalizacja promptów:** Znajomość tego błędu pozwala na lepsze rozmieszczenie instrukcji w celu wymuszenia poprawnego zachowania modelu.

# 📚 Szczegółowe wyjaśnienie
Recency Bias wynika bezpośrednio z natury predykcji autoregresywnej modeli Transformer. Model generuje tekst token po tokenie, a ostatnie tokeny wejściowe (znajdujące się najbliżej pozycji generowania nowej odpowiedzi) mają silniejszy wpływ na stany ukryte dekodera.

Jeśli prompt ma strukturę:
1.  *Zasada: "Zawsze odpowiadaj po hiszpańsku."* (Początek)
2.  *[Długi dokument o systemach Data Governance - 1500 słów]* (Środek)
3.  *Pytanie: "Jakie są główne moduły Ataccama ONE?"* (Koniec)

Model z dużym prawdopodobieństwem odpowie po polsku lub po angielsku (ignorując instrukcję językową), ponieważ instrukcja o języku została "przykryta" przez masę tekstu ze środka, a samo pytanie na końcu zdominowało uwagę modelu.

# 💡 Przykład zastosowania
Aby przeciwdziałać Recency Bias w inżynierii promptów:
*   **Powtarzanie instrukcji:** Kluczowe instrukcje (np. dotyczące formatu lub ograniczeń) warto powtórzyć na samym końcu promptu, tuż przed miejscem na odpowiedź modelu.
*   **Struktura DELTA/SPICE:** Umieszczanie szablonu wyjściowego (Template) oraz ostatecznych ograniczeń (Constraints) na samym końcu zapytania, aby model miał je "na świeżo" w pamięci roboczej.

```markdown
[Początek promptu]
Przeanalizuj poniższy log systemowy...
[Środek promptu - 500 linii logów]
...
[Koniec promptu - Powtórzenie reguły]
Pamiętaj: Odpowiedź musi zawierać wyłącznie kod błędu i nic więcej. Nie pisz żadnych wyjaśnień.
```

## 📌 Źródła
*   [[Elementy promptów|Elementy i budowa precyzyjnych promptów]]
*   [[Zasady promptowania|Zasady projektowania promptów]]
