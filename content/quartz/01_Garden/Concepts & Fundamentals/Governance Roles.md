---
title: Governance Roles (Role Zarządzania)
created: 2026-02-04
status: evergreen
category: Data Governance
difficulty: intermediate
language: pl
tags:
  - roles
  - responsibilities
  - rbac
  - steward
  - owner
aliases:
  - Role Governance
  - Data Steward
  - Data Owner
---
# 🎯 Definicja
**Governance Roles** to zdefiniowane funkcje i odpowiedzialności przypisane do osób w procesie zarządzania danymi. Określają "kto co może robić" (uprawnienia) oraz "kto za co odpowiada" (odpowiedzialność). Klasyczny trójpodział to: Właściciel, Opiekun (Steward) i Konsument.

# 🔑 Kluczowe punkty
- **Data Owner (Właściciel):** Decydent biznesowy. Odpowiada za budżet, ryzyko i definicje. (Np. Dyrektor Finansowy).
- **Data Steward (Opiekun):** Ekspert merytoryczny/techniczny. Dba o jakość, opisy i metadane na co dzień.
- **Data Consumer (Konsument):** Użytkownik końcowy. Korzysta z danych do raportów i analiz.

# 📚 Szczegółowe wyjaśnienie
Twarde rozdzielenie ról jest kluczem do sukcesu Data Governance.
- Jeśli każdy jest właścicielem, to nikt nie jest.
- Administrator Systemu (IT) **NIE POWINIEN** być Właścicielem Danych (Biznes). IT tylko trzyma rury, Biznes decyduje, co w nich płynie.
W narzędziach (Ataccama, Alation), Role przekładają się na przyciski: Steward ma przycisk "Edytuj Definicję", Konsument ma tylko "Zgłoś Błąd".

# 💡 Przykład zastosowania
W wierszu tabeli `salary_amount` (kwota wynagrodzenia):
- **Właściciel:** Dyrektor HR (decydował, że zbieramy takie dane).
- **Steward:** Specjalista ds. Płac (sprawdza, czy nie ma pustych wartości, opisuje co to za waluta).
- **Konsument:** Analityk tworzący raport kosztów pracowniczych (widzi liczbę, nie może jej zmienić).

## 📌 Źródła
- DAMA-DMBOK2.

## 👽 Brudnopis
- Oprócz ról biznesowych są role techniczne: Custodian (Administrator bazy), System Owner.
- Najczęstszy błąd wdrożeń: mianowanie Stewardów bez dania im czasu na pracę (Stewardship jako 3. etat).