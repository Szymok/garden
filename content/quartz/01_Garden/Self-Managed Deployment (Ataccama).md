---
title: Self-Managed Deployment (Ataccama)
created: 2026-02-04
status: evergreen
category: Ataccama ONE / Deployment
difficulty: intermediate
language: en
tags:
  - deployment
  - on-premise
  - self-managed
  - infrastructure
  - installation
aliases:
  - Wdrożenie On-Premise
  - Instalacja Samodzielna
---
# 🎯 Definicja
**Self-Managed Deployment** (dawniej On-Premise) to model, w którym Ataccama ONE działa na **Twoich serwerach** (lub Twoim koncie AWS/Azure).
Ty dajesz sprzęt, prąd i administratorów. Ataccama daje pliki instalacyjne.

# 🔑 Kluczowe punkty
- **Kontrola:** Twoje dane nigdy nie opuszczają Twojej sieci. Kluczowe dla banków i rządu.
- **Odpowiedzialność:** Ty musisz robić backupy, dbać o aktualizacje OS, firewall i monitoring.
- **Złożoność:** Wymaga zespołu DevOps/Adminów znających Linuxa, Tomcata, Jave, bazy danych.

# 📚 Szczegółowe wyjaśnienie
Proces w 5 krokach:
1.  **Preparation:** Szykujesz serwery (VM), sieć, DNS, certyfikaty SSL.
2.  **Readiness:** Sprawdzasz "Pre-install Checklist" (czy porty są otwarte?).
3.  **Installation:** Uruchamiasz skrypty [[Ansible Role in Deployment (Ataccama)|Ansible]].
4.  **Verification:** Logujesz się i sprawdzasz, czy działa.
5.  **Handover:** Oddajesz środowisko użytkownikom.

# 💡 Przykład zastosowania
Ministerstwo Finansów wdraża katalog danych.
Z uwagi na ustawę, dane podatników nie mogą być w chmurze publicznej (SaaS).
Wybierają Self-Managed Deployment w swoim rządowym centrum danych.

## 📌 Źródła
- Ataccama ONE Installation Guide.

## 👽 Brudnopis
- Przeciwieństwem jest **PaaS (Platform as a Service)**, gdzie Ataccama zarządza wszystkim w chmurze, a Ty tylko się logujesz.
