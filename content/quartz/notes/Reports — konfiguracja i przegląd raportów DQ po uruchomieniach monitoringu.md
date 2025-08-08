---
title: Reports — konfiguracja i przegląd raportów DQ po uruchomieniach monitoringu
created: 2025-08-08 
status: in-review 
category: data-quality
difficulty: intermediate 
language: pl 
tags:
- data-quality
- monitoring-projects
- dq-reports
- anomaly-detection
- profiling
- ataccama-one 
aliases:
- dq-reports
- reports
- monitoring-reports
- ataccama-one-reports
---

# 🎯 Definicja 
Raporty DQ w [[Ataccama]] ONE (zakładka Report) prezentują wyniki jakości danych i wykryte anomalie w czasie dla wszystkich uruchomień [[Monitoring Project|Monitoring]] Project; po zmianie konfiguracji raportu konieczne jest ponowne uruchomienie monitoringu, aby zobaczyć aktualne rezultaty. Raport można dostosować, tworząc sekcje raportowe dla wybranych reguł, zamiast raportować całość kontroli DQ.

# 🔑 Kluczowe punkty
- Dostępność: raport pojawia się na zakładce Report po zakończeniu runu monitoringu.
- Zakres: pokazuje wyniki DQ i anomalie w czasie dla wszystkich uruchomień projektu.
- Re-run wymagany: po zmianach w konfiguracji raportu trzeba uruchomić [[Monitoring Project|monitoring]] ponownie.
- Personalizacja: sekcje pozwalają raportować wybrane reguły (nie tylko pełny zestaw checks).
- Stewardzi DQ: otrzymują [[Powiadomienia — konfiguracja powiadomień ogólnych i specyficznych w Monitoring Project|powiadomienia]] o nowych raportach; widzą problemy DQ, anomalie i odpowiadające im wyniki profilowania.
- Sekcje: dodawaj przez menu 3-kropek na Catalog Item lub w istniejącej sekcji (Add section); możliwe podsekcje.
- Widok wszystkich reguł: w Detailed results rozwiń listę reguł, aby zobaczyć DQ dla całego projektu.
- Iteracja: po każdej modyfikacji sekcji/filtrów raportu — ponowny Run [[Monitoring Project|Monitoring]], by odświeżyć metryki.

# 📚 Szczegółowe wyjaśnienie

- Przepływ pracy z raportami
    - Po Run [[Monitoring Project|Monitoring]] wyniki są agregowane i prezentowane na karcie Report dla projektu, z perspektywą trendów oraz detali per reguła i atrybut.
    - Raport obejmuje: statusy DQ (PASS/FAIL), odsetki invalid, rozkłady przyczyn (Explanation Codes), wykryte anomalie oraz wycinki z profilowania.
- Konfiguracja raportu i sekcji
    - Wejdź w Report i zorganizuj zawartość tworząc Sections:
        - Kliknij 3-kropki przy Catalog Item lub wybierz istniejącą sekcję, aby dodać podsekcję.
        - Wybierz “Add section”, następnie zdefiniuj zakres (np. konkretne reguły/atrybuty).
    - Sekcje pozwalają budować tematyczne widoki (np. “Kontakt: email/phone”, “Adres: kraj/miasto”) skupione na wybranych regułach.
- Raportowanie wybranych reguł vs całość
    - Aby śledzić DQ w czasie dla osobnych reguł, zdefiniuj dedykowane sekcje i przypisz do nich te reguły.
    - Aby zobaczyć DQ dla wszystkich reguł w projekcie, przejdź do Detailed results i rozwiń listę reguł bez filtrowania.
- Notyfikacje i przegląd
    - DQ Stewards są powiadamiani, gdy pojawi się nowy raport po runie.
    - W raporcie mogą:
        - przeglądać problemy DQ i rozwijać detale,
        - sprawdzać anomalie,
        - porównywać z wynikami profilowania ([[profiling]]) dla kontekstu danych.
- Dobre praktyki i wskazówki
    - Ustal konwencję sekcji pod kątem ról odbiorców (np. “[[KPI]] krytyczne”, “Reguły zgodności”, “Anomalie wolumenu”).
    - Łącz raporty z konfiguracją eksportu wyników (export project results), jeśli potrzebna jest analiza per rekord downstream.
    - Po dodaniu/zmianie sekcji pamiętaj o ponownym Run [[Monitoring Project|Monitoring]] — inaczej raport nie odzwierciedli zmian.
    - Regularnie weryfikuj spójność sekcji z mapowaniem Glossary/[[Rules]], aby raporty były czytelne dla biznesu.

# 💡 Przykład zastosowania

- Scenariusz: Raporty DQ dla reguł kontaktowych i adresowych
    1. Po pierwszym Run [[Monitoring Project|Monitoring]] otwórz zakładkę Report; zweryfikuj ogólny trend DQ/anomalii.
    2. Utwórz sekcję “Contact Data” (Add section z menu 3-kropek na Catalog Item) i dodaj reguły: EMAIL_FORMAT_VALIDATION, PHONE_E164.
    3. Utwórz podsekcję “Address Data” dla reguł: COUNTRY_ISO_IN_[[LOOKUP]], ZIP_FORMAT.
    4. Run [[Monitoring Project|Monitoring]] ponownie, aby zmaterializować sekcje w raporcie.
    5. W Detailed results rozwiń wszystkie reguły, jeśli chcesz zobaczyć pełny obraz poza sekcjami.
    6. Steward DQ otrzyma powiadomienie; w raporcie przejrzy invalid issues, anomalie wolumenu i szczegóły profilowania dla atrybutów.

## 📌 Źródła

- [[Ataccama]] ONE — [[Reports]] (zakładka Report w [[Monitoring Project|Monitoring]] Projects): dostępność raportów po runie i widoki trendów.
- [[Ataccama]] ONE — Report Sections: dodawanie sekcji/podsekcji (menu 3-kropek), konfiguracja pod wybrane reguły.
- [[Ataccama]] ONE — Detailed results: przegląd wyników dla wszystkich reguł w projekcie.
- [[Ataccama]] ONE — Notifications for DQ Stewards: [[Powiadomienia — konfiguracja powiadomień ogólnych i specyficznych w Monitoring Project|powiadomienia]] o nowych raportach i przegląd issues/anomalii/profilowania.
- [[Ataccama]] ONE — Re-run after configuration changes: konieczność ponownego uruchomienia monitoringu po zmianach raportu.

## 👽 Brudnopis

- Wejście użytkownika (oczyszczone): “[[Reports]] [[Ataccama]] ONE once [[Monitoring Project|monitoring]] has finished, the DQ report is available on the Report tab DQ [[Reports]] show the DQ results and detected anomalies over time for all [[Monitoring Project|monitoring]] runs. After the report configuration, the project should be rerun to see the results. [[Reports]] can be customized to monitor DQ results for selected [[rules]], rather than the whole [[Data Quality]] checks (see next slide). DQ Stewards are notified when a new report is available, and can see DQ issues (and expand details), anomalies, and the corresponding [[profiling]] results, To create a rule section, click the Catalog Item option menu (3-dots), or an already existing section to create a sub-section, and select Add section. To report the [[data quality]] over time for separate [[rules]], the user needs to create Sections. After implementing the changes, it is necessary to run the [[Monitoring Project|monitoring]] again to see the resulting [[reports]]. To see the [[data quality]] for all [[rules]] used in the [[Monitoring Project|monitoring]] project, expand the [[rules]] in the Detailed results list.”
- Pytania “do weryfikacji”:
    - Czy chcesz przygotować standardowe szablony sekcji (np. Contact, Address, Compliance) dla wszystkich projektów? — do weryfikacji.
    - Czy włączyć automatyczny export project results dla sekcji krytycznych (do dashboardów [[KPI]])? — do weryfikacji.
    - Jaki jest docelowy harmonogram runów po zmianach konfiguracji raportu (on-demand vs nightly)? — do weryfikacji.