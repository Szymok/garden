---
title: Serwer SMTP
created: 2026-05-06
status: 🌱 draft
category: DevOps
difficulty: łatwy
language: pl
tags:
  - smtp
  - email
  - serwer
  - infrastruktura
aliases:
  - SMTP Server
---
# 🎯 Definicja
**Serwer SMTP** (Simple Mail Transfer Protocol Server) to serwer pocztowy obsługujący protokół SMTP, który służy do wysyłania i przekazywania wiadomości e-mail w sieci IP. W infrastrukturze IT oraz inżynierii danych serwer SMTP jest kluczowym elementem systemów powiadamiania (np. wysyłanie raportów, alertów o awariach w potokach ETL lub raportów o spadku jakości danych).

# 🔑 Kluczowe punkty
*   **Wysyłanie poczty:** SMTP służy wyłącznie do *wysyłania* i *przekazywania* poczty. Do *odbierania* wiadomości służą inne protokoły, takie jak IMAP lub POP3.
*   **Integracja DevOps & Alerting:** Narzędzia takie jak Ataccama, Jenkins, Apache Airflow czy Prometheus wymagają konfiguracji połączenia z serwerem SMTP, aby móc informować administratorów i data stewardów o błędach.
*   **Bezpieczeństwo:** Współczesne wdrożenia wymagają stosowania uwierzytelniania, szyfrowania TLS/SSL oraz mechanizmów weryfikacji nadawcy, takich jak SPF, DKIM oraz DMARC, aby zapobiec wpadaniu wiadomości do spamu.

# 📚 Szczegółowe wyjaśnienie
Działanie serwera SMTP opiera się na architekturze klient-serwer. Gdy aplikacja (np. [[Ataccama.md|Ataccama ONE]]) chce wysłać powiadomienie e-mail:
1.  Aplikacja łączy się z serwerem SMTP (zazwyczaj na porcie 587 dla bezpiecznego połączenia TLS lub 465 dla SSL).
2.  Przekazuje dane uwierzytelniające (login i hasło) oraz treść wiadomości.
3.  Serwer SMTP analizuje adres odbiorcy i przekazuje e-mail do serwera docelowego (np. serwera pocztowego Gmail należącego do odbiorcy).

W systemach Data Quality, serwer SMTP jest konfigurowany na poziomie platformy. Gdy reguła walidacyjna wykryje krytyczne błędy (np. w tabeli klientów nagle brakuje 30% adresów e-mail), system generuje alert i natychmiast wysyła e-mail do przypisanego opiekuna danych (Data Stewarda).

# 💡 Przykład zastosowania
*   **Konfiguracja alertów w Ataccama ONE:** W plikach konfiguracyjnych serwera platformy Ataccama definiuje się parametry serwera SMTP (host, port, username, password, default sender). Umożliwia to wysyłanie codziennych raportów z zadań profilowania danych bezpośrednio na skrzynkę e-mail zespołu analitycznego.
*   **Airflow EmailOperator:** Wykorzystanie wbudowanego w Apache Airflow operatora `EmailOperator` do powiadomienia zespołu o nieudanej próbie załadowania danych do hurtowni (Data Warehouse).

## 📌 Źródła
*   [[DevOps|Zasady DevOps w infrastrukturze]]
*   [[Jakość Danych|Alerty jakości danych]]

