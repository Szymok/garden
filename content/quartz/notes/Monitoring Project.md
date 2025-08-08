---
title: Monitoring Project 
created: 2025-08-08 
status: draft 
category: data-quality
difficulty: intermediate 
language: pl 
tags:

- data-quality
- monitoring-projects
- dq-rules
- anomaly-detection
- structure-checks
- ataccama-one 
aliases:
- monitoring
- dq-monitoring
- monitoring-project
- ataccama-one-monitoring
---
# 🎯 Definicja 
Monitoring Project w [[Ataccama]] ONE służy do oceny jakości danych wybranych [[Catalog Items]] i śledzenia zmian w czasie. Umożliwia ręczne, reaktywne monitorowanie kluczowych zasobów danych poprzez zastosowanie reguł DQ, detekcję anomalii i strukturalne kontrole, z wynikami prezentowanymi w wielu formatach.

# 🔑 Kluczowe punkty

- Zakres: monitorowanie wybranych [[Catalog Items]]; ręczne, reaktywne podejście.
- Alternatywa: dla pełnych źródeł/schematów bez ręcznej konfiguracji reguł użyj [[Data Observability]].
- Typy checks: Structure Checks, [[Anomaly Detection]], [[Rules|DQ Rules]] (na atrybutach).
- Przepływ: dodaj Items → przypisz checks → Publish → Run Monitoring.
- UI: konfiguracja i wyniki w zakładce Configuration & Results; mapowanie Glossary na Overview.
- Edycja: usuwanie checks przez ikonę X; usuwanie itemów z menu trzech kropek.
- Publikacja: każdą zmianę checks/items trzeba opublikować przed uruchomieniem.

# 📚 Szczegółowe wyjaśnienie

- Kiedy używać Monitoring Project
    - Gdy chcesz stale oceniać jakość priorytetowych tabel/zbiorów ([[Catalog Items]]) i przeglądać trendy [[KPI]] DQ.
    - Jest to monitoring reaktywny wybranych obiektów; do holistycznego nadzoru całych źródeł rozważ [[Data Observability]].
- Tworzenie projektu
    - Wejdź: [[Data Quality]] → Monitoring Projects → Create.
    - Podaj Name i opcjonalnie Description/aim.
    - Konfiguracja odbywa się w Configuration & Results; po zapisaniu można zmapować [[Glossary terms]] na Overview.
- Dodawanie Items to Monitor
    - W Configuration & Results użyj + Add, aby dodać [[Catalog Items]].
    - Każdy item otwieraj osobno (kliknij nazwę), by przypisać checks:
        - Structure Checks: włącz/wyłącz kontrole schematu i spójności strukturalnej.
        - [[Anomaly Detection]]: aktywuj wykrywanie odchyleń metryk ([[profiling]], rozkłady) w czasie.
        - [[Rules|DQ Rules]]: przypisz reguły jakości do konkretnych atrybutów (Condition Builder/Rule Library).
- Publikacja i uruchamianie
    - Po dodaniu/usunięciu checks lub itemów kliknij Publish, aby utrwalić konfigurację.
    - Uruchom ewaluację przez Run Monitoring.
    - Widok Configuration & Results pokazuje przegląd jakości, wykryte problemy i wyniki per item.
- Edycja i czyszczenie konfiguracji
    - Usuwanie błędnie dodanych checks: najedź na check i kliknij X.
    - Usuwanie itemów: menu trzech kropek → Delete.
    - Po każdej zmianie pamiętaj o Publish przed kolejnym uruchomieniem.
- Dobre praktyki i pułapki
    - Zawsze publikuj zmiany przed Run Monitoring; inaczej uruchomisz starą konfigurację.
    - Grupuj reguły DQ według krytyczności i domeny; ułatwia to interpretację wyników.
    - Łącz z Explanation Codes i Scoring (jeśli stosujesz) i skonfiguruj export project results, by mieć wyniki per rekord do analizy downstream.
    - Ustal kadencję uruchomień (np. po wsadzie ETL, cron) i SLA reakcji na alerty z anomalii.

# 💡 Przykład zastosowania
- Scenariusz: Monitoring tabeli klientów w DWH
    1. Create projekt “DWH_CUSTOMERS_DQ_MON”.
    2. Items to Monitor: dodaj catalog item dim_customer.
    3. Checks:
        - Structure Checks: włącz kontrolę brakujących kolumn i typów.
        - [[Anomaly Detection]]: aktywuj dla liczności rekordów i rozkładu null rate dla email/phone.
        - [[Rules|DQ Rules]]: przypisz EMAIL_FORMAT_VALIDATION, PHONE_E164, COUNTRY_ISO_IN_[[LOOKUP]].
    4. Publish, następnie Run Monitoring.
    5. Configuration & Results: przejrzyj wskaźniki, invalid samples; w razie błędnego checka usuń ikoną X i ponownie Publish.
    6. (Opcjonalnie) Export project results: włącz eksport CSV z exp__/sco__ dla analizy w pipeline ETL.

## 📌 Źródła

- [[Ataccama]] ONE — Monitoring Projects: tworzenie, konfiguracja (Configuration & Results), publikacja i uruchamianie.
- [[Ataccama]] ONE — [[Data Quality]] [[Rules]] i przypisywanie do atrybutów w projektach monitorujących.
- [[Ataccama]] ONE — Structure Checks: zakres i konfiguracja.
- [[Ataccama]] ONE — [[Anomaly Detection]]: włączanie i interpretacja wyników.
- [[Ataccama]] ONE — Export Project Results: konfiguracja eksportu wyników per rekord i integracja downstream.

## 👽 Brudnopis

- Wejście użytkownika (oczyszczone): “Monitoring Project: [[Data Quality]] Monitoring projects are used to evaluate the [[data quality]] Of [[Catalog Items]] and monitor the changes over time, Within a project, the user can:
    - Select [[Catalog Items]] to be evaluated.
    - Apply [[data quality]] [[rules]].
    - Display the results in multiple formats. Use monitoring projects for manual monitoring of your most critical data assets. Monitoring projects provide reactive monitoring of selected data. If you want to monitor entire data sources or schemas without needing to apply [[rules]] manually, consider using the [[Data Observability]] feature. Creating a new Monitoring Project Go to the [[Data Quality]] » Monitoring Projects, click the Create button. 2 Specify a Name and optionally Description or aim of the project. Configuration of the project is done under the Configuration & Results tab. Once saved, it is possible to map [[Glossary terms]] to the project itself on the Overview tab Project configuration The first step to configure a project is to add [[Catalog items]] to be monitored. That is done under the Configuration & Results tab in the Items to Monitor section using the + Add button. Once the [[catalog items]] have been added, you'll need to select each item individually to begin adding checks by clicking on the item name. Three types of checks can be applied: Structure checks - [[Anomaly detection]] - [[Rules|DQ rules]] To remove an existing item, use the three dots menu and select Delete. Project configuration After both adding or removing Checks, make sure to publish your changes. After Publishing the project, evaluation should be triggered by pressing the Run Monitoring button. Configuration & Results tab offers an overview of the [[data quality]], issues found, To remove wrongly applied checks: Hover over the applied check using the X icon. Project configuration By clicking on each catalog item, the details of the item’s [[data quality]] as well as its configuration will become available. There, the user can assign [[Rules|DQ rules]] to attributes, turn Structure Checks on and enable [[Anomaly Detection]].”
- Pytania do weryfikacji:
    - Czy chcesz skonfigurować automatyczny export project results (per rekord) i jakie kolumny ująć (id, exp__, sco__)? — do weryfikacji.
    - Jaka ma być kadencja uruchomień Run Monitoring (po wsadzie/batch, harmonogram)? — do weryfikacji.
    - Czy mapować [[Glossary terms]] do projektu i raportować [[KPI]] per term/business domain? — do weryfikacji.