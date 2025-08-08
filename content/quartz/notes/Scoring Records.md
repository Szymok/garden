---
title: Scoring records
created: 2025-08-08
status:
  - completed
category: data-governance
difficulty: intermediate
language: pl
tags:
  - data-quality
  - dq-scoring
  - validation
  - ataccama-one
  - explanation-codes
  - monitoring
  - etl
aliases:
---

# 🎯 Definicja 
Scoring records to przypisywanie liczbowego wyniku (Score) do każdego rekordu, który narusza regułę jakości danych; im wyższy wynik, tym poważniejsza nieprawidłowość według konfiguracji reguły. Score nie jest samowyjaśniający i powinien być udokumentowany przez Explanation Codes, które opisują przyczynę i typ naruszenia. Aby zobaczyć łączny score dla rekordów w raportach, należy skonfigurować eksport wyników projektu monitorującego DQ.

# 🔑 Kluczowe punkty

- Score = numeryczna [[miara]] “ciężaru” nieważności rekordu względem reguły; wyższy score = poważniejszy problem.
- Wyjaśnienia wymagane: Explanation Codes mapują score na przyczyny/operacje czyszczące; przechowuj je wraz ze score.
- Gdzie ustawiać: w ONE Webapp w logice reguły lub w [[ONE Desktop]] przez Validation/Scoring Components.
- Widoczność per rekord: pełne wartości score per rekord uzyskasz po eksporcie wyników projektu (CSV/post-processing).
- Dobre praktyki: rozróżnij poziomy istotności (np. proste vs istotne modyfikacje vs null) i przypisz progi punktowe.
- Struktura kolumn: zapisuj exp_[atrybut] i sco_[atrybut]; Explanation może agregować wiele kodów.
- [[ONE Desktop]] może pobrać wyniki DQ/wyjaśnienia/alerty krokami do wyników projektów monitorujących.
- Eksport wyników można filtrować/konfigurować planem eksportu w Desktop, aby uzyskać tylko niepoprawne rekordy.

# 📚 Szczegółowe wyjaśnienie

- Rola Score:
    - Score jest agregatem/indykatorem do separacji dobrych i złych rekordów oraz do kodowania typów błędów z ich istotnością.
    - Model “im wyżej, tym gorzej” ułatwia priorytetyzację napraw i SLA DQ w pipeline’ach ETL/ELT.
- Definiowanie Score:
    - ONE Webapp: w konfiguracji logiki reguły przypisz wartości score adekwatne do wagi naruszenia (np. brak niekrytyczny vs brak krytyczny).
    - [[ONE Desktop]]: użyj kroków Simple Scoring/Scoring lub komponentów walidacyjnych w przepływach; to opcja dla power users.
    - Zaprojektuj poziomy: np. brak modyfikacji=0, drobne poprawki<10,000, istotne poprawki<10,000,000, wartość null>10,000,000.
- Explanation Codes:
    - Każdej regule/operacji czyszczącej przypisz kod wyjaśnienia i odpowiadającą wartość score, aby score był interpretowalny.
    - Przechowuj w kolumnach exp_[attr] (kody, może być wiele) oraz sco_[attr] (liczba), zgodnie z konwencjami nazewnictwa.
- Przeglądanie wyników:
    - Aby zobaczyć score per rekord w raportach, skonfiguruj eksport wyników projektu monitorującego w zakładce Export i pobierz CSV z wynikami/post-processingiem.
    - W Desktop dostępne są kroki do pobierania wyników projektów DQ (alerts, explanations, results) oraz możliwość filtrów/kolumn “shadow”.
    - Gdy potrzebna jest statystyka/summary (daty, nazwy reguł, przejścia/porażki), wykorzystaj konfigurację planu eksportu w [[ONE Desktop]] lub dedykowane kroki; w razie błędów planu eksportu należy zweryfikować parametry i zależności projektu.
- Wdrożenie w ETL/ELT:
    - W procesie walidacji wstaw krok Scoring ze zdefiniowanymi progami i Explanation Codes oraz zapisuj exp_/sco_ kolumny do strefy silver.
    - Ekspozycja do monitoringu: publikuj zasady w ONE Webapp i uruchamiaj Monitoring Projects; skonfiguruj Export do CSV, aby mieć ślad score per rekord dla audytu.
    - Analiza trendów: Desktopowe kroki “DQ Monitoring Project Results” pozwalają na pobór wyników/wyjaśnień w czasie do dalszej analizy.

## Tabela poziomów punktacji i wyników walidacji
    
    - No modification was done to the input value. → Scoring Level: 0 → Scoring Result: VALID
        
    - < 10,000: Small modification (trim, squeeze spaces, uppercase, remove unsupported chars, safe replacements, etc.). → Scoring Level: < 10,000 → Scoring Result: VALID/CORRECTED
        
    - Huge modification (not found in dictionary, does not meet official rules, major error, unsafe replacements, etc.). → Scoring Level: >> 10,000 → Scoring Result: UNSAFE/UNKNOWN — do weryfikacji progu
        
    - Input value or pre-cleansed value (after a small modification) is null. → Scoring Level: najwyższy próg → Scoring Result: NOT VALID — do weryfikacji progu

# 💡 Przykład zastosowania

- Scenariusz: Walidacja adresów e-mail w strumieniu rejestracji użytkowników (ETL do DWH).
- Kroki operacyjne:
    1. Webapp: reguła “EMAIL_FORMAT_VALIDATION” z progami:
        - Błędne separatory/spacje: score 200–300, Explanation: EMAIL_SPACES/EMAIL_SEPARATOR.
        - Niedozwolone znaki: score 1,000, Explanation: EMAIL_UNSUPPORTED_CHAR.
        - Null w e-mail: score 20,000,000, Explanation: EMAIL_NULL.
    2. Desktop: krok Scoring zapisuje exp_email i sco_email do tabeli walidacyjnej; agregujesz max(sco_email) jako “record_score”.
    3. Monitoring Project: uruchom regułę na źródle, w Export wybierz post-processing do CSV z kolumnami źródłowymi+score; opcjonalnie filtruj do rekordów invalid w planie eksportu.
    4. Analityka: użyj “DQ Monitoring Project Results” w Desktop, aby pobrać alerts/explanations/results i zasilić dashboard priorytetów napraw.

## 📌 Źródła

- [[Ataccama]] Community — Scoring Records, przypisywanie score w Webapp/[[ONE Desktop]] oraz eksport wyników projektu.
- [[Ataccama]] ONE Docs — [[Data Quality]] Scoring: poziomy, konwencje kolumn exp_/sco_, przykładowe Explanation Codes.
- [[Ataccama]] Community — [[ONE Desktop]]: [[Data Quality]] Results, kroki do pobierania wyników/wyjaśnień/alertów z projektów monitorujących.
- [[Ataccama]] Community — Export podsumowań wyników DQ Monitoring Project i uwagi dot. post-processing plan.

## 👽 Brudnopis

- Wejście użytkownika (oczyszczone): “scoring records, Scores are used as a numerical expression Of each record's invalidity severity level according to the rule configuration, Score is not self-explanatory by default and should be explained via Explanation Codes, The higher the score is - the more severe the problem is. The Score can be assigned through the web application in the rule's logic, or in the [[ONE Desktop]] via Validation Components. To be able to see the total score of each record, it is necessary to configure export project results.”
- Dodane “do weryfikacji”:
    - Czy stosować globalny próg dla NULL jako >10,000,000 w danym domenowym kontekście? — do weryfikacji.
    - Jakie pola i format kolumn wymagane w Twoim planie eksportu (pełny rekord vs minimalny zestaw)? — do weryfikacji.
    - Czy agregować score per rekord jako max po atrybutach, czy sumę ważoną wg krytyczności? — do weryfikacji.