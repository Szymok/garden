---
title: Invalid Records — próbki niepoprawnych rekordów w raportach DQ (Ataccama ONE)
created: 2025-08-08
status: in-review 
category: data-quality
difficulty: intermediate 
language: pl 
tags:
- data-quality
- monitoring-projects
- invalid-samples
- dq-reports
- ataccama-one
- troubleshooting 
aliases:
- invalid-records
- invalid-samples
- show-invalid-samples
---
# 🎯 Definicja 
Próbki niepoprawnych rekordów (Invalid Records Samples) to podzbiór rekordów, które nie przeszły reguł DQ w Monitoring Project. Po zakończeniu ewaluacji można je podejrzeć z poziomu Result Overview lub karty Report, aby szybciej zrozumieć naturę problemów i zaplanować działania naprawcze.

# 🔑 Kluczowe punkty
- Dostęp: Show invalid samples dostępne po zakończeniu runu, z Result Overview oraz z zakładki Report.
- Cel: szybka diagnoza — próbka rekordów, które naruszyły reguły DQ, wraz z kontekstem.
- Konfiguracja: liczebność próbki lub całkowite wyłączenie można ustawić w Configuration & Results → menu (⋯) przy Data Quality → Configuration of Invalid Results Samples.
- Użyteczność: pomaga zrozumieć typowe wzorce błędów przed głębszą analizą i eksportem wyników.
- Synergia: łącz z Explanation Codes i Scoring, aby ocenić wagę i przyczyny naruszeń.
- Prywatność/koszty: próbki ograniczają wolumen danych do przeglądu UI; pełne dane uzyskasz przez export project results.

# 📚 Szczegółowe wyjaśnienie
- Przegląd próbek
    - Po Run Monitoring, jeśli wykryto problemy, kliknij Show invalid samples:
        - Result Overview: szybki dostęp do próbek per projekt.
        - Report: podgląd próbek w kontekście raportowanych metryk/trendów.
    - Próbka prezentuje reprezentatywne rekordy, które nie przeszły co najmniej jednej reguły DQ.
- Konfiguracja próbek
    - Przejdź do Configuration & Results.
    - Rozwiń sekcję Data Quality, otwórz menu (⋯) i wybierz Configuration of Invalid Results Samples.
    - Ustaw:
        - Liczbę rekordów w próbce (np. 50, 100, 1000) — do weryfikacji polityk w Twojej instancji.
        - Wyłączenie próbek (off), jeśli nie chcesz ich generować.
- Dobre praktyki
    - Stosuj próbki do szybkiej diagnozy i walidacji hipotez (np. czy problem dotyczy konkretnej domeny wartości lub wzorca).
    - Jeśli próbka wskazuje na złożone problemy, włącz/export project results, aby pozyskać pełny zestaw invalid z exp__/sco__ do analizy downstream (ETL/BI).
    - Dla wrażliwych danych rozważ ograniczenie rozmiaru próbek w UI i przeniesienie analizy do bezpiecznego obszaru poprzez kontrolowany eksport.
- Pułapki i wskazówki
    - Próbka nie gwarantuje pełnej reprezentatywności przy rzadkich błędach; do audytu użyj pełnego eksportu.
    - Po zmianie konfiguracji próbek uruchom monitorowanie ponownie, aby odświeżyć widoczne wyniki.
    - Upewnij się, że role/ACL pozwalają na wgląd w dane rekordowe, szczególnie w środowiskach z restrykcjami zgodności.

# 💡 Przykład zastosowania
- Scenariusz: Diagnoza wzrostu INVALID dla reguły EMAIL_FORMAT_VALIDATION
    1. Po Run Monitoring zauważasz skok INVALID w Report.
    2. Klikasz Show invalid samples z Report, przeglądasz kilka rekordów z exp_email=EMAIL_UNSUPPORTED_CHAR i sco_email=2000.
    3. Hipoteza: nowy kanał rejestracji wprowadza spacje i znaki diakrytyczne w e-mailach.
    4. W Configuration of Invalid Results Samples zwiększasz próbkę z 50 do 200 na czas diagnozy; równolegle konfigurujesz export project results, aby pobrać pełny set invalid do analizy w DWH.
    5. Aktualizujesz pipeline ETL (trim/normalizacja), uruchamiasz Run Monitoring i weryfikujesz spadek INVALID w kolejnych raportach.

## 📌 Źródła
- Ataccama ONE — Invalid Results Samples: konfiguracja liczby rekordów oraz wyłączanie próbek w Configuration & Results.
- Ataccama ONE — Result Overview i Report: dostęp do Show invalid samples po zakończonym runie.
- Ataccama ONE — Export Project Results: pozyskanie pełnych danych invalid per rekord do analizy.
- Ataccama ONE — Explanation Codes i Scoring: interpretacja przyczyn i wagi naruszeń w próbkach.
- Ataccama ONE — Permissions/ACL: dostęp do podglądu danych rekordowych w UI.

## 👽 Brudnopis

- Wejście użytkownika (oczyszczone): “Invalid Records: Sample of invalid records (1 / 2) Once the DQ monitoring of a project is finished, the user can observe a sample of invalid records by clicking on the Show invalid samples either from the project Result Overview or from the Report tab. When there are issues detected in your monitoring project, investigating a sample of records that failed the applied DQ rules gives you a clearer idea of the issue at hand. You can configure how many invalid results are included in the sample or turn off this option completely. To access the configuration, on the Configuration & Results tab, expand the Data Quality three dots menu and select configuration of Invalid Results Samples.”
- Do weryfikacji:
    - Jaki limit liczebności próbki (domyślny i maksymalny) obowiązuje w Twojej instancji? — do weryfikacji.
    - Czy włączony jest export project results dla pełnej analizy invalid (kolumny id, exp__, sco__)? — do weryfikacji.
    - Czy istnieją ograniczenia uprawnień do podglądu próbek rekordów dla określonych ról? — do weryfikacji.