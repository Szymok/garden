---
title: Encrypting Secrets with SOPS (Szyfrowanie Sekretów z SOPS)
created: 2026-02-04
status: evergreen
category: DevOps/Security
difficulty: intermediate
language: pl
tags:
  - sops
  - encryption
  - gitops
  - secrets-management
  - age
aliases:
  - SOPS
  - Szyfrowanie haseł w Git
---
# 🎯 Definicja
**SOPS** (Secrets OPerationS) to narzędzie Mozilli do szyfrowania plików konfiguracyjnych ([[YAML|YAML]], JSON, ENV). Pozwala bezpiecznie trzymać hasła i klucze API w repozytorium Git. Szyfruje tylko wartości (values), a klucze (keys) zostawia jawne, co ułatwia przeglądanie struktury pliku (Diff) bez ujawniania sekretów.

# 🔑 Kluczowe punkty
- **Bezpieczny Git:** Możesz trzymać plik `secrets.yaml` w publicznym repozytorium, bo wartości są zaszyfrowane.
- **Współpraca z KMS:** Obsługuje AWS KMS, GCP KMS, Azure Key Vault oraz PGP i **age**.
- **Selektywne szyfrowanie:** Szyfruje wartości, struktura pliku pozostaje czytelna.

# 📚 Szczegółowe wyjaśnienie
Jak to działa?
1.  Tworzysz plik z hasłami: `db_password: super_secret`.
2.  Uruchamiasz `sops --encrypt secrets.yaml > secrets.enc.yaml`.
3.  Plik wynikowy ma postać: `db_password: ENC[AES256_GCM...]`.
4.  Wrzucasz `secrets.enc.yaml` do Gita.
5.  Na serwerze/u kolegi, mając odpowiedni klucz prywatny, uruchamiasz `sops --decrypt`.
SOPS automatycznie zarządza kluczami "master" i kluczami danych.

# 💡 Przykład zastosowania
Konfiguracja Kubernetesa (**GitOps**).
Masz definicję Deploymentu [[Bazy danych|bazy danych]]. Hasło jest w Secret.
Zamiast ręcznie wgrywać hasło na klaster (`kubectl create secret`), trzymasz je w repozytorium zaszyfrowane SOPS-em.
Operator FluxCD lub ArgoCD (z wtyczką SOPS) automatycznie odszyfrowuje je przy wdrażaniu na klaster.

## 📌 Źródła
- Mozilla SOPS GitHub Repository.
- "Managing Secrets in GitOps".

## 👽 Brudnopis
- Nowoczesnym, prostszym standardem szyfrowania dla SOPS jest **age** (zamiast starego PGP).
- Pamiętaj, aby nigdy nie commitować pliku `.sops.yaml` z kluczami prywatnymi!