---
title: Monitoring Notifications (Ataccama)
created: 2026-02-04
status: evergreen
category: Ataccama ONE / Monitoring
difficulty: intermediate
language: en
tags:
  - notifications
  - monitoring
  - alerts
  - slack
  - email
aliases:
  - Powiadomienia w Monitoringu
  - Alerts Setup
---
# 🎯 Definicja
**Monitoring Notifications** w Ataccama ONE pozwalają Ci wiedzieć, kiedy jakość danych spada lub gdy proces monitoringu się zawiesił. Zamiast logować się codziennie do systemu i klikać "Odśwież", system sam wyśle Ci maila lub wiadomość na Slacku.

# 🔑 Kluczowe punkty
- **Dwa typy:**
    - **General:** "System padł", "Monitoring zakończony". (Dla Adminów).
    - **Specific:** "Reguła 'Walidacja Email' spadła poniżej 97%". (Dla Data Stewardów).
- **Kanały:** E-mail, Slack, Microsoft Teams, In-App.
- **Granularność:** Możesz ustawić alert tylko dla konkretnej reguły w konkretnej tabeli.

# 📚 Szczegółowe wyjaśnienie
Aby ustawić **Specific Notification**:
1.  Wejdź w zakładkę **Report**.
2.  Znajdź interesującą Cię regułę (np. `DQ_Email`).
3.  Kliknij trzy kropki -> **Add Notification**.
4.  Ustaw warunek: "Wyślij alert, gdy `Invalid Rows > 5%`".
To dużo lepsze niż "General Notification", który spamuje przy każdym uruchomieniu.

# 💡 Przykład zastosowania
Zespół Marketingu chce wiedzieć, kiedy liczba pustych numerów telefonów przekroczy 10%.
Tworzysz **Specific Notification** na regule `Phone Number Presence`.
Warunek: `Null Count > 10%`.
Kanał: Slack `#marketing-data-quality`.
Dzięki temu reagują tylko na realne problemy, a nie na spam "Job Finished Successfully".

## 📌 Źródła
- Ataccama ONE Documentation - Monitoring Notifications.

## 👽 Brudnopis
- Przemyśl strategię powiadomień. Jeśli ustawisz ich za dużo, ludzie przestaną je czytać ("Alert Fatigue"). Skup się na błędach krytycznych (Critical Errors).
