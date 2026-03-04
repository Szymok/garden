---
title: Biases (Uprzedzenia w AI)
created: 2026-02-04
status: evergreen
category: AI/Ethics
difficulty: intermediate
language: pl
tags:
  - bias
  - ethics
  - llm
  - fairness
aliases:
  - Bias
  - Stronniczość AI
  - Hallucinations of bias
---
# 🎯 Definicja
**Bias (Uprzedzenie)** w AI to systematyczny błąd modelu, który powoduje faworyzowanie jednej grupy, opcji lub wyniku nad innymi, w sposób niesprawiedliwy lub niezgodny z rzeczywistością. Wynika zazwyczaj z danych treningowych (które są odbiciem ludzkich uprzedzeń z Internetu).

# 🔑 Kluczowe punkty
- **Data Bias:** Jeśli 90% programistów w danych treningowych to mężczyźni, model może zakładać, że "programista" = "mężczyzna".
- **Confirmation Bias:** Model ma tendencję do zgadzania się z użytkownikiem (sycophancy), nawet jeśli użytkownik pisze nieprawdę.
- **Mitygowanie:** RLHF (Reinforcement Learning from Human Feedback) jest głównym narzędziem do "oduczania" modelu szkodliwych stereotypów.

# 📚 Szczegółowe wyjaśnienie
Modele językowe są "lustrem Internetu". Jeśli w Internecie słowo "pielęgniarka" częściej występuje przy zaimku "ona", model statystycznie powiąże te pojęcia.
Typy biasów:
1. **Gender/Racial Bias:** Stereotypy zawodowe i społeczne.
2. **Political Bias:** Przechył w stronę poglądów dominujących w danych (np. zachodnio-liberalnych).
3. **Recency Bias:** Faworyzowanie nowszych informacji lub tych na końcu promptu.

Walka z biasem jest trudna, bo "neutralność" jest subiektywna. Usunięcie wszystkich biasów często prowadzi do modelu, który odmawia odpowiedzi na proste pytania (nadmierna cenzura).

# 💡 Przykład zastosowania
Rekrutacja z AI.
Firma używa AI do skanowania CV.
AI odrzuca CV kobiet aplikujących na stanowiska techniczne, bo "nauczyło się" na historycznych danych firmy (z ostatnich 10 lat), że zatrudniani byli głównie mężczyźni.
To przykład niebezpiecznego, samonapędzającego się biasu (Feedback Loop).

## 📌 Źródła
- [Stochastic Parrots (Bender et al.)](https://dl.acm.org/doi/10.1145/3442188.3445922)

## 👽 Brudnopis
- Red Teaming - zatrudnianie ludzi do celowego wywoływania rasistowskich/szkodliwych odpowiedzi, żeby je zablokować.
- Bias in Prompting: Sposób zadania pytania sugeruje odpowiedź ("Czy zgadzasz się, że X jest złe?" vs "Co sądzisz o X?").
