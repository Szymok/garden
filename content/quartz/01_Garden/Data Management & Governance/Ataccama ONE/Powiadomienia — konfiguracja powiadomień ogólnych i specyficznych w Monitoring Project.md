---
title: Powiadomienia — konfiguracja powiadomień ogólnych i specyficznych w Monitoring Project
created: 2025-08-08 
status: in-review
category: data-governance
difficulty: intermediate 
language: pl 
tags:
- data-quality
- monitoring-projects
- notifications
- dq-reports
- anomaly-detection
- ataccama-one 
aliases:
- powiadomienia
- general-notifications
- specific-notifications
- monitoring-notifications
---

# 🎯 Definicja 
Powiadomienia w Monitoring Project dzielą się na dwa typy: General (ogólne) i Specific (specyficzne). Ogólne informują o kluczowych zdarzeniach monitoringu (np. nowe wyniki, błędy), a specyficzne służą do precyzyjnych alertów związanych z wybranymi regułami/sekcjami raportu i progami DQ. Oba typy są zarządzane na zakładce Notifications, z tym że nowe Specific tworzy się z poziomu Report.

# 🔑 Kluczowe punkty

- Dwa typy: General (zdarzenia systemowe) i Specific (alerty per reguła/sekcja z progami).
- Lokalizacja: lista i edycja obu typów na karcie Notifications; tworzenie Specific z karty Report.
- Operacje: dodaj/edytuj/usuń; włącz/wyłącz dla selektywnej aktywacji.
- Kanały: in-app, e-mail, Slack (kanał), Microsoft Teams (webhook URI).
- Zakres General: awarie monitoringu, krytyczne błędy struktury, nowe wyniki, kwestie DQ/anomalie.
- Zakres Specific: progi procentowe DQ, filtry (data, atrybuty), targetowane dostarczanie (wybrane osoby/role).
- Publikacja: po utworzeniu/edycji zapisz i opublikuj, aby aktywować powiadomienia.

# 📚 Szczegółowe wyjaśnienie

- Widok i zarządzanie
    - Notifications tab:
        - Przegląd wszystkich powiadomień (General i Specific) w projekcie.
        - Akcje: Add (tylko General), Edit, Enable/Disable, Delete dla każdego wpisu.
    - Report tab:
        - Tworzenie nowych Specific powiązanych z konkretną regułą, sekcją lub instancją raportową (np. rule instance).
- General Notifications — konfiguracja
    - Przeznaczenie: automatyczne alerty o stanie monitoringu i wysokopoziomowych zdarzeniach.
    - Monitorowane zdarzenia (przykłady):
        - Monitoring failures (run errors).
        - Critical errors in data structures.
        - New results available.
        - Data quality issues and anomalies.
    - Jak skonfigurować:
        - Przejdź do zakładki Notifications w projekcie.
        - Kliknij Add Notification (lub edytuj istniejące).
        - Wybierz zdarzenia i kanały dostarczenia:
            - In-app notification (wybór użytkowników).
            - Email (wybór użytkowników).
            - Slack (nazwa kanału).
            - Microsoft Teams (webhook URI).
        - Zapisz i opublikuj.
- Specific Notifications — konfiguracja
    - Przeznaczenie: granularne alerty dla konkretnych reguł/sekcji z progami i filtrami.
    - Możliwości:
        - Granular Thresholds: dokładny procent DQ (np. VALID% < 97%) wyzwalający alert.
        - Filter Conditions: warunki zawężające (np. zakres dat, wartości atrybutów).
        - Targeted Delivery: e-maile do wskazanych użytkowników/rol.
    - Jak utworzyć:
        - Przejdź do zakładki Report.
        - Wybierz instancję/sekcję/regułę, którą chcesz monitorować.
        - Menu 3-kropek → Add Notification.
        - Skonfiguruj próg, filtry, odbiorców; Save and Publish.
    - Uwaga: Specific są widoczne na karcie Notifications, gdzie można je włączać/wyłączać i edytować/usuwać.
- Dobre praktyki
    - Ustal progi zgodnie z KPI DQ (np. INVALID% > 3% lub nagły wzrost anomalii).
    - Ogranicz szum: używaj Specific dla krytycznych reguł, General dla stanu systemu.
    - Segmentuj odbiorców: techniczne awarie → on-call, degradacja KPI → stewardzi/ownerzy domen.
    - Testuj kanały (Slack/Teams webhooks) w środowisku testowym przed produkcją.
    - Po zmianach w raportach/sekcjach zweryfikuj, czy powiązane Specific nadal wskazują poprawne obiekty.

# 💡 Przykład zastosowania

- Scenariusz: Alert na spadek jakości e-maili i awarie runów
    1. General: na karcie Notifications dodaj alerty “Monitoring failures”, “New results available” z kanałami in-app + Slack #dq-alerts.
    2. Specific: na karcie Report w sekcji “Contact Data” dla reguły EMAIL_FORMAT_VALIDATION dodaj powiadomienie:
        - Threshold: VALID% < 97% w ostatnim runie lub trendzie 7-dniowym.
        - Filters: source_system = “registration_portal”.
        - Delivery: e-mail do DQ Steward + owner pipeline’u.
    3. Publish. Przy kolejnym Run Monitoring steward dostaje e-mail, a zespół on-call widzi Slack alert o ewentualnych awariach.

## 📌 Źródła

- Ataccama ONE — Notifications w Monitoring Projects: rodzaje (General/Specific), zarządzanie na karcie Notifications.
- Ataccama ONE — Report: tworzenie Specific Notifications z poziomu sekcji/reguł.
- Ataccama ONE — Channels: konfiguracja in-app, e-mail, Slack, Microsoft Teams (webhook).
- Ataccama ONE — Best practices for DQ alerting: progi KPI, filtrowanie, redukcja szumu alertowego.
- Ataccama ONE — Publish workflow: aktywacja zmian powiadomień po zapisie i publikacji.

## 👽 Brudnopis

- Wejście użytkownika (oczyszczone): “Powiadomienia There are two available types of notifications: A General B. Specific. Both general notifications and specific notifications are listed on the monitoring projects Notifications tab. From here, they can be edited, turned on or off, or removed as required. New general notifications can be added directly from the Notifications tab but new specific notifications are added from the Report tab. Add general notifications. Edit or delete general notifications. Enable or disable specific notifications. Edit or delete specific notifications. General Notifications: Get automatic alerts about important monitoring events. You can monitor: Monitoring failures, Critical errors in data structures, New results available, Data quality issues and anomalies. To set up General Notifications: Go to Notifications tab, Add Notification, select events and channels (In-app, Email, Slack, Teams). Specific Notifications: Get notified about very specific data quality issues. Granular thresholds, filter conditions (e.g., date range, attribute values), targeted delivery (emails to users/roles). How to create: Go to Report, select instance/rule, 3-dots → Add Notification, configure, save and publish.”
- Do weryfikacji:
    - Czy wymagać standardu progów (np. INVALID% > 3% critical, 1–3% warning) dla Specific? — do weryfikacji.
    - Czy integrować z incident management (np. Slack → PagerDuty) dla awarii runów? — do weryfikacji.
    - Czy przechowywać historię alertów w Data Lake dla audytu KPI DQ? — do weryfikacji.