---
title: MDM Technical Architecture (Architektura Techniczna)
created: 2026-02-04
status: evergreen
category: MDM / Architecture
difficulty: advanced
language: pl
tags:
  - mdm
  - architecture
  - keycloak
  - postgres
  - components
aliases:
  - MDM Architecture
  - Komponenty MDM
---
# 🎯 Definicja
Architektura rozwiązania **Master Data Management (MDM)** w Atacamie opiera się na kilku współpracujących komponentach: Serwerze przetwarzającym, Bazie Danych, Aplikacji Webowej i Systemie Tożsamości. Jest to system modułowy, skalowalny i zorientowany na usługi.

# 🔑 Kluczowe punkty
- **MDM Server:** "Mózg". Silnik, który robi matching, merging i walidację danych.
- **MDM Web App:** "Twarz". Interfejs dla Data Stewardów do ręcznego poprawiania rekordów (Golden Record).
- **Database:** "Pamięć". Przechowuje dane mistrzowskie, historię zmian i konfigurację (zazwyczaj PostgreSQL, Oracle lub MS SQL).
- **Keycloak:** "Ochroniarz". Zarządza logowaniem (SSO).

# 📚 Szczegółowe wyjaśnienie
Przepływ danych:
1.  Dane wchodzą przez **Interfejsy** (Batch, Real-time API, JMS).
2.  **MDM Server** przetwarza je (czyści, łączy w pary, tworzy Złoty Rekord).
3.  Wynik jest zapisywany w **Bazie Danych**.
4.  Steward widzi wynik w **Web App** i może go skorygować.
5.  Czyste dane są wysyłane do systemów zewnętrznych (Downstream).

# 💡 Przykład zastosowania
Klient zmienia adres w aplikacji mobilnej.
1. Aplikacja wysyła REST API Call do MDM.
2. MDM Server sprawdza jakość (czy kod pocztowy pasuje do miasta).
3. Aktualizuje "Złoty Rekord" klienta.
4. Wysyła notyfikację do systemu Marketingowego, że adres się zmienił.

## 📌 Źródła
- Ataccama MDM Developer Guide - Architecture Overview.

## 👽 Brudnopis
- W chmurze (PaaS) te komponenty są ukryte w kontenerach Kubernetes, ale logiczna architektura pozostaje ta sama.