---
title: Wymagania Dostępu do Internetu dla Instalacji
created: 2026-02-04
status: sapling
category: Tech
difficulty: basic
language: pl
tags:
  - ataccama
  - installation
  - networking
  - requirements
aliases:
  - Dostęp do internetu Ataccama
  - Offline installation
---
# 🎯 Definicja
Wymagania dotyczące łączności z siecią publiczną dla kontrolera Ansible oraz serwerów docelowych podczas procesu instalacji i eksploatacji platformy [[Ataccama|Ataccama]] ONE.

# 🔑 Kluczowe punkty
- **Instalacja Online:** Platforma wymaga dostępu do repozytoriów pakietów (EPEL, Python PyPi, S3 [[Ataccama|Ataccama]]) w trakcie instalacji. Instalacja całkowicie offline ("air-gapped") jest technicznie trudna i niezalecana.
- **Kontroler Ansible:** Musi pobrać zależności Ansible i pakiety instalacyjne.
- **Serwery docelowe:** Muszą pobierać zależności systemowe (PostgreSQL repo, [[Keycloak|Keycloak]], Prometheus).

# 📚 Szczegółowe wyjaśnienie
Instalator Ataccamy nie jest pojedynczym plikiem `.exe` czy `.rpm`, który zawiera wszystko. To zestaw skryptów, które "dociągają" potrzebne komponenty z internetu.
Dlatego serwery muszą mieć wyjście na świat (ewentualnie przez HTTP Proxy).
Po instalacji, stały dostęp jest wymagany m.in. do synchronizacji czasu (NTP), co jest krytyczne dla walidacji tokenów bezpieczeństwa.

# 💡 Przykład zastosowania
W środowisku bankowym bez dostępu do Internetu:
1. Należy skonfigurować serwer Proxy (np. Squid) z białą listą domen (repozytoria RedHat, AWS S3 [[Ataccama|Ataccama]]).
2. Skonfigurować zmienne środowiskowe `http_proxy` i `https_proxy` w inwentarzu Ansible.

## 📌 Źródła


## 👽 Brudnopis
- Installing [[Ataccama|Ataccama]] ONE necessitates **internet access both during and after the installation**, though to varying extents.
- During the installation process, **both the Ansible controller and the target servers require access to external servers** for various reasons.
- The **controller** requires internet access to **install Ansible and its dependencies**.
- This necessitates **access to external Python (pip) repositories**.
- **Target servers** require internet access during installation for the following:
    - To access **distribution repositories for third-party dependencies** of the [[Ataccama|Ataccama]] ONE Platform, such as Extra Packages for Enterprise Linux (EPEL) and PostgreSQL repository.
    - To **download third-party open-source binaries** not distributed in installation packages, including [[Keycloak|Keycloak]] and Prometheus.
    - To **download [[Ataccama|Ataccama]] product packages from the Amazon S3 repository**.
- Therefore, internet access **must be provided either directly or through a dedicated proxy server**.
- **Installations without any internet access are not supported**.
- Following the installation, target servers require **reasonably well-synchronised clocks** for proper certificate and token expiry validation.