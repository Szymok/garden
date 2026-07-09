---
title: Licencje Ataccama (Zarządzanie)
created: 2026-02-04
status: evergreen
category: Ataccama ONE / Administration
difficulty: basic
language: pl
tags:
  - licensing
  - configuration
  - installation
  - ataccama
aliases:
  - License Keys
  - Klucze licencyjne
---
# 🎯 Definicja
Każdy komponent platformy [[Ataccama|Ataccama]] ONE (DPE, [[ONE Desktop|ONE Desktop]], MDC) wymaga ważnego pliku licencji (`license.plf` lub podobne) do uruchomienia. Licencje definiują, jakie funkcje są aktywne (np. czy masz dostęp do modułu DQ, czy tylko MDM) oraz limity wydajności (liczba rekordów, rdzeni CPU).

# 🔑 Kluczowe punkty
- **Pliki:** Zazwyczaj pliki XML/Text dostarczane przez Support Ataccamy.
- **Wymagalność:** Bez licencji usługi nie wstaną (błąd w logach: `License not found` lub `License expired`).
- **Instalacja:** Wrzucane do folderu `etc/` lub konfigurowane w `runtimeConfig`.

# 📚 Szczegółowe wyjaśnienie
W środowiskach On-Premise odpowiadasz za ręczną aktualizację licencji przed ich wygaśnięciem.
W architekturze [[PaaS|PaaS]]/Cloud licencjami zarządza zazwyczaj [[Ataccama|Ataccama]] Operations, ale warto monitorować ich datę ważności w konsoli ONE.

# 💡 Przykład zastosowania
Podczas instalacji nowej instancji DPE (Data Processing Engine) na serwerze Linux, Ansible kopiuje pliki licencyjne do katalogu instalacyjnego. Jeśli plik jest uszkodzony lub wygasł, proces Javy zakończy się natychmiast po starcie.

## 📌 Źródła
- [[Ataccama|Ataccama]] Installation Guide.

## 👽 Brudnopis
- Pamiętaj, że licencje na [[ONE Desktop|ONE Desktop]] (narzędzie deweloperskie) są często imienne lub typu "Floating".