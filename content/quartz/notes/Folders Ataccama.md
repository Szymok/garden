---

title: Folders Ataccama  
created: 2025-04-03  
status:  
category: data catalog / struktura danych  
difficulty: podstawowy  
language: pl  
tags:

- katalog danych
- organizacja danych
- Ataccama
- struktura folderów  
aliases:
- foldery w Ataccama
- folder organization
- foldery katalogowe

---

# 🎯 Definicja

**Foldery w Ataccama** to elementy struktury organizacyjnej w katalogu danych, służące do logicznego grupowania obiektów danych, takich jak elementy katalogowe (Catalog Items), profile jakości danych, raporty, reguły, terminy słownika oraz inne artefakty platformy. Foldery odgrywają ważną rolę w organizacji dużych zbiorów metadanych, ułatwiając zarządzanie, wyszukiwanie oraz kontrolę dostępu.

# 🔑 Kluczowe punkty

- 🗂️ Foldery działają jako logiczne kontenery danych i metadanych.
- 📦 Mogą zawierać różne typy obiektów: tabele, pliki, raporty, terminy, profile jakości, modele reguł.
- 🔐 Obsługują zarządzanie uprawnieniami dostępu, dziedziczenie ról i funkcję „Shared With”.
- ✍️ Możliwe jest tworzenie folderów publicznych i prywatnych (widocznych tylko dla danej osoby lub grupy).
- 🔍 Struktura folderowa integruje się z funkcją wyszukiwania, filtrów i kokpitu głównego (Dashboardu).
- 🧭 Folder może pełnić także funkcję kategorii tematycznej według domen danych, właściciela biznesowego, regionu, systemu źródłowego (np. „Sales”, „Finance”, „CRM”).

# 📚 Szczegółowe wyjaśnienie

W Ataccama ONE foldery są często pierwszym miejscem, w którym użytkownicy końcowi (analitycy, właściciele danych) organizują i strukturyzują swoje dane i projekty. Przypominają strukturę znaną z systemów plików:

- Można tworzyć foldery główne i podrzędne,
- Można przenosić elementy między folderami (drag & drop lub przez akcje kontekstowe),
- Można katalogować dane ręcznie lub w sposób automatyczny (np. na podstawie źródła danych).

W połączeniu z przypisaniem tagów, terminów słownikowych i reguł jakości – foldery umożliwiają szybkie odnalezienie konkretnych zestawów danych i utrzymywanie porządku w środowisku katalogowym.

## Typowa struktura folderów przykład

```
└── Data Catalog
    ├── Finance
    │   ├── Sales_Data
    │   └── Budget_Reports
    ├── Marketing
    │   ├── Campaign_Performance
    │   └── Customer_Segments
    └── Technical
        ├── Staging
        └── Raw_Logs
```

## Funkcje w folderach

- 🔍 Filtrowanie zawortości folderu wg typu zasobu, właściciela, atrybutów jakości
- 📥 Dodawanie obiektów z katalogu danych:
    - tabele z systemów źródłowych,
    - reguły DQ,
    - związane terminy słownikowe,
    - zależności lineage.
- 🔒 Ustawienia:
    - widoczność (Public / Private),
    - uprawnienia (View / Comment / Edit),
    - współdzielenie z grupą (Group Isolation / Role-based).

# 💡 Przykład zastosowania

Analityk danych z działu finansowego tworzy folder "Revenue Metrics", który zawiera:

- Profilowane tabele: `sales_summary`, `monthly_targets`
- Reguły jakości danych dla kolumn `revenue`, `net_profit`
- Raporty wygenerowane z Power BI i synchronicznie podpięte w Ataccama
- Dokumentację w formie opisów oraz przypisanych terminów słownikowych ("Net Sales", "Quarterly KPI")

Folder „Revenue Metrics” jest udostępniony tylko grupie „Finance Analysts” z rolą edycyjną.

# 📌 Źródła

- [https://docs.ataccama.com/ONE/](https://docs.ataccama.com/ONE/)
- [https://www.ataccama.com/platform/data-catalog](https://www.ataccama.com/platform/data-catalog)
- [https://support.ataccama.com/home/docs](https://support.ataccama.com/home/docs)

# 👽 Brudnopis

- Folder = bramka organizacyjna → analogia do folderów w Google Drive
- Foldery = separacja domenowa + zarządzanie uprawnieniami
- Widoki folderów = dashboard zgodny z kontekstem użytkownika (role, ostatni dostęp, przypisania)
- Wdrożenie folderów ułatwia onboarding i eksplorację danych przez użytkowników nietechnicznych
- Przyszłe zastosowania: automatyczne folderowanie wg lineage, SLA score, klasyfikacja danych (PII)