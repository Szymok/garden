---
title: Ataccama ONE MDM Deployment
created: 2026-02-04
status: evergreen
category: Ataccama ONE / Architecture
difficulty: intermediate
language: en
tags:
  - installation
  - mdm
  - rdm
  - architecture
  - deployment
aliases:
  - MDM vs RDM Deployment
  - Warianty instalacji MDM
---
# 🎯 Definicja
Platforma Ataccama ONE MDM może być wdrażana w różnych konfiguracjach, zależnie od tego, czy potrzebujesz pełnego Master Data Management (MDM), czy tylko Reference Data Management (RDM).

# 🔑 Kluczowe punkty
- **Separacja:** Warianty "Tylko MDM" lub "Tylko RDM" są instalowane w oddzielnych środowiskach, co zmniejsza narzut na infrastrukturę (mniej serwerów).
- **Integracja:** Jeśli potrzebujesz obu (MDM i RDM) w jednym miejscu, musisz zainstalować pełną platformę **Ataccama ONE**.

# 📚 Szczegółowe wyjaśnienie
W przypadku instalacji dedykowanych (Standalone):
- **Lightweight:** Jeśli klient chce tylko zarządzać słownikami (RDM), nie musisz stawiać ciężkiego silnika MDM z matchingiem i mergowaniem. Wystarczy lżejsza instalacja.
- **Full Cloud:** W wersji PaaS (Cloud) zazwyczaj dostajesz dostęp do całej platformy, a funkcje są włączane/wyłączane licencją.

# 💡 Przykład zastosowania
Bank potrzebuje systemu do zarządzania listą walut i kodów krajów (RDM). Nie chcą kupować pełnego MDM do danych klientów. Instalują wersję **ONE RDM Standalone**. Wymaga to mniejszej ilości RAM i CPU.

## 📌 Źródła
- Ataccama Installation Guide.

## 👽 Brudnopis
- RDM to często "brama wejściowa" dla klienta. Zaczynają od słowników, a potem dokupują pełne MDM.
