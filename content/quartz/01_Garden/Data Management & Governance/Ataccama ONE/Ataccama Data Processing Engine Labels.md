---
title: Etykiety Silników Przetwarzania (DPE Labels)
created: 2026-02-04
status: sapling
category: Tech
difficulty: advanced
language: pl
tags:
  - ataccama
  - dpe
  - processing
  - architecture
aliases:
  - DPE Labels
  - Routing zadań Ataccama
---
# 🎯 Definicja
Mechanizm tagowania silników przetwarzania (DPE) w [[Ataccama|Ataccama]] ONE, pozwalający na precyzyjne kierowanie zadań (jobs) do konkretnych instancji DPE na podstawie lokalizacji danych, wymagań bezpieczeństwa lub specyfiki infrastruktury.

# 🔑 Kluczowe punkty
- **Routing Zadań:** Etykiety decydują, który DPE przetworzy dane źródło.
- **Bezpieczeństwo Sieciowe:** Pozwalają przetwarzać dane wrażliwe "blisko źródła" (np. wewnątrz firewalla on-premise), bez konieczności otwierania dostępu do chmury dla wszystkich danych.
- **Domyślne zachowanie:** Jeśli nie zdefiniowano etykiet, dowolny DPE może podjąć zadanie, co może prowadzić do błędów połączenia w środowiskach hybrydowych.

# 📚 Szczegółowe wyjaśnienie
W środowiskach hybrydowych (Hybrid Deployment), gdzie część usług działa w chmurze ([[SaaS|SaaS]]/[[PaaS|PaaS]]), a dane rezydują w lokalnych centrach danych (On-premise), etykiety są kluczowe.
Możesz oznaczyć lokalny DPE etykietą `PL-WARSAW-SECURE`. Następnie w konfiguracji źródła danych (w ONE Web App) wskazujesz, że to źródło wymaga `PL-WARSAW-SECURE`. Dzięki temu platforma nie spróbuje zlecić przetwarzania tego źródła silnikowi w chmurze AWS, który nie ma fizycznego dostępu do lokalnej sieci.

# 💡 Przykład zastosowania
- **DPE A (Chmura):** Etykieta `cloud-general`
- **DPE B (On-premise):** Etykieta `on-prem-financial`
- **Źródło "Klienci Banku":** Wymaga `on-prem-financial`.
Wynik: Profilowanie tabeli "Klienci Banku" zostanie wykonane wyłącznie przez DPE B.

## 📌 Źródła


## 👽 Brudnopis
Direct Traffic: Using DPE Labels for Targeted Processing What are DPE Labels?: DPE labels are used to target specific data processing engine for a [[Data Source|data source]]. If no labels are defined, any source can use any label. Connector Settings: Connector settings on DPE must be correct in order to connect to data. Security: For on-prem connections, be sure to set up the correct keys. Hybrid Deployments: Important for restricting access to data sources within your network (hybrid DPE).