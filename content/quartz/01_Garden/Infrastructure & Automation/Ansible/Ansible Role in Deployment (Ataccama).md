---
title: Ansible Role in Deployment (Ataccama)
created: 2026-02-04
status: evergreen
category: Ataccama ONE / Deployment
difficulty: intermediate
language: en
tags:
  - ansible
  - deployment
  - automation
  - devops
  - iac
aliases:
  - Rola Ansible we wdrożeniu
  - Automatyzacja instalacji
---
# 🎯 Definicja
**Ansible** to główne narzędzie do instalacji i aktualizacji platformy [[Ataccama|Ataccama]] ONE (w wersji [[PaaS|PaaS]]/On-Prem). Zamiast ręcznie kopiować pliki na 10 serwerów, uruchamiasz jeden skrypt (Playbook), który robi to za Ciebie.

# 🔑 Kluczowe punkty
- **[[Idempotentność|Idempotentność]]:** Możesz uruchomić skrypt 100 razy. Jeśli wszystko jest już zainstalowane, nic nie zepsuje.
- **Inventory:** Plik tekstowy, w którym definiujesz swoje serwery (`[master]`, `[worker]`, `[database]`).
- **Variables:** Konfiguracja (hasła, ścieżki, porty) jest w plikach `group_vars`.

# 📚 Szczegółowe wyjaśnienie
Proces wdrożenia [[Ataccama|Ataccama]] ONE przez Ansible:
1.  Pobierasz paczkę instalacyjną (ZIP).
2.  Edytujesz plik `hosts` (adresy IP Twoich serwerów).
3.  Edytujesz parametry w `group_vars/all` (np. adres zewnętrzny [[Bazy danych|bazy danych]]).
4.  Uruchamiasz `ansible-playbook -i hostsone site.yml`.
5.  Idziesz na kawę. Ansible instaluje Javę, Tomcat, kopiuje WARy, konfiguruje usługi.

# 💡 Przykład zastosowania
Klient chce zaktualizować środowisko TEST z wersji 13.9 na 14.0.
1.  Podmienia paczki instalacyjne w folderze źródłowym.
2.  Zmienia wersję w zmiennych Ansible.
3.  Puszcza Playbook.
4.  Po 15 minutach środowisko jest zaktualizowane. Ręcznie zajęłoby to 4 godziny i generowało błędy ludzkie.

## 📌 Źródła
- [[Ataccama|Ataccama]] ONE Installation Guide.

## 👽 Brudnopis
- Ansible nie wymaga instalowania agenta na serwerach docelowych (używa SSH). To jego wielka zaleta w bezpiecznych środowiskach bankowych (Agentless).
