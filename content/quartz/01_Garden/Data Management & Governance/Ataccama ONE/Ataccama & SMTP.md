---
title: Konfiguracja SMTP w Ataccama
created: 2026-02-04
status: sapling
category: Tech
difficulty: basic
language: pl
tags:
  - ataccama
  - smtp
  - configuration
  - email
aliases:
  - Ataccama SMTP
  - Powiadomienia mailowe Ataccama
---
# 🎯 Definicja
Mechanizm umożliwiający platformie [[Ataccama|Ataccama]] ONE wysyłanie automatycznych powiadomień e-mail (np. o błędach przetwarzania, statusach zadań) poprzez integrację z zewnętrznym serwerem SMTP dostarczanym przez klienta.

# 🔑 Kluczowe punkty
- **Zewnętrzny [[Serwer SMTP|serwer SMTP]]:** [[Ataccama|Ataccama]] nie posiada wbudowanego serwera pocztowego; wymaga podłączenia infrastruktury klienta (MDA - Mail Delivery Agent).
- **Bezpieczeństwo:** Połączenie musi być realizowane przez zabezpieczony protokół (np. z użyciem SSL/TLS).
- **Brak wsparcia dla Webhooków:** E-maile mogą być wysyłane *wyłącznie* przez protokół SMTP; inne metody (np. API/Webhooki do wysyłki maili) nie są wspierane w tym kontekście.

# 📚 Szczegółowe wyjaśnienie
W środowiskach korporacyjnych integracja z systemem pocztowym jest kluczowa dla monitorowania procesów [[Data Quality|Data Quality]] i MDM. [[Ataccama|Ataccama]] ONE deleguje zadanie dostarczania wiadomości na infrastrukturę klienta. Oznacza to, że administratorzy systemu muszą skonfigurować parametry połączenia (host, port, dane uwierzytelniające) w plikach konfiguracyjnych platformy.

Ważnym ograniczeniem jest wymóg stosowania standardowego protokołu SMTP. Platforma nie obsługuje natywnie wysyłania powiadomień e-mail poprzez nowoczesne interfejsy HTTP (np. SendGrid API) w ramach standardowych modułów notyfikacyjnych, co wymusza utrzymanie klasycznego serwera pocztowego.

# 💡 Przykład zastosowania
Konfiguracja w pliku `application.properties` (przykład teoretyczny):

```properties
mail.smtp.host=smtp.firma.com
mail.smtp.port=587
mail.smtp.auth=true
mail.smtp.starttls.enable=true
mail.user=powiadomienia@firma.com
mail.password=SekretneHaslo123!
```

## 📌 Źródła


## 👽 Brudnopis
- If configured, [[Ataccama|Ataccama]] ONE can send **email notifications using a customer-provided SMTP server (MDA)**.
- The connection to this server is established through a **secured SMTP protocol**.
- **Webhooks or other connection types for sending emails are not supported**.