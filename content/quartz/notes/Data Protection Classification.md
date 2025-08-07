---

title: Data Protection Classification  
created: 2025-07-14  
status: Final  
category: Data Governance  
difficulty: podstawowy  
language: pl  
tags:

- ochrona danych
- klasyfikacja danych
- dane wrażliwe
- kontrola dostępu  
aliases:
- klasyfikacja ochrony danych

---

# 🎯 Definicja

**Data Protection Classification** (klasyfikacja ochrony danych) to mechanizm nakładający dodatkową warstwę bezpieczeństwa na dane wrażliwe i zastrzeżone. Umożliwia oznaczanie danych odpowiednimi znacznikami (tagami klasyfikacyjnymi), które regulują widoczność oraz możliwości interakcji z tymi danymi w zależności od poziomu dostępu użytkownika lub grupy.

# 🔑 Kluczowe punkty

- Pozwala na oznaczanie danych wrażliwych w celu ograniczenia ich widoczności i przetwarzania.
- Użytkownicy bez odpowiedniego poziomu dostępu nie widzą danych oznaczonych tagami klasyfikacyjnymi.
- Uprawnienia do danych klasyfikowanych są przyznawane na podstawie ról i przypisanych tagów ochrony danych.
- Klasyfikacja wpływa również na możliwości eksportu, edycji i sortowania danych.
- Służy do spełnienia wymogów regulacyjnych (np. RODO, HIPAA) oraz zapewnienia integralności danych biznesowych.

# 📚 Szczegółowe wyjaśnienie

## Mechanizm działania

Klasyfikacja ochrony danych opiera się na stosowaniu _tagów klasyfikacyjnych_, które przypisuje się do terminów (terms) bądź atrybutów zawierających dane wrażliwe. Dane te są następnie filtrowane w kontekście uprawnień użytkownika. Przykładami danych wymagających klasyfikacji są: dane osobowe, numery kart kredytowych, dane finansowe czy zdrowotne.

## Widoczność i kontrola dostępu

Zasady działania klasyfikacji:

- Dane są oznaczane ikoną kłódki – sygnałem ograniczeń widoczności.
- Użytkownicy/grupy bez przypisanego tagu nie mogą przeglądać, edytować ani eksportować danych.
- Widoczność danych profilowych ([[Data Profiling|profilowanie danych]]) i insightów jakości danych (DQ insights) również jest ograniczona dla danych sklasyfikowanych.
- Osoby z pełnym dostępem (Full access) mogą przeglądać klasyfikowane dane oraz udzielać dostępu innym.

## Integracja z procesami [[Data Governance]]

Data Protection Classification pełni kluczową rolę w zapewnieniu:

- zgodności z lokalnymi i globalnymi regulacjami prawnymi,
- bezpieczeństwa informacji wrażliwych,
- przejrzystości w zarządzaniu dostępami,
- kontroli w ramach modelu ról ([[Roles|Role]]-Based Access Control – RBAC).

# 💡 Przykład zastosowania

W organizacji przetwarzającej dane klientów (np. bank), administrator danych może oznaczyć atrybuty zawierające PESELe, numery kont bankowych i dane adresowe jako „Sensitive”. Pracownicy call center mają wyłącznie odczyt ograniczonych danych identyfikacyjnych (np. imię i nazwisko), natomiast pełny dostęp do danych osobowych mają tylko wyznaczeni analitycy i specjaliści ds. zgodności (compliance). Każda próba eksportu danych sklasyfikowanych przez nieupoważnionego użytkownika zostaje zablokowana przez system.

## 📌 Źródła

- [Ataccama Documentation – Data Protection Classification](https://docs.ataccama.com/)
- [Data Classification: A [[Data Governance]] Best Practice – DATAVERSITY](https://www.dataversity.net/data-classification-a-data-governance-best-practice/)

## 👽 Brudnopis

- Klasyfikacja ochrony danych = oznaczanie danych wrażliwych tagami klasyfikacyjnymi.
- Tagi regulują dostęp, edycję, eksport, widoczność.
- Blokowanie nieautoryzowanego dostępu.
- Ikona kłódki = dane zastrzeżone.
- Kluczowe dla RODO, HIPAA, PCI-DSS.
- Zarządzanie poprzez dostęp oparty o [[Roles|role]] i przypisanie tagu.
- Dostęp do profilowania i DQ insights też kontrolowany.
- Przykład: dane klientów w bankowości, tylko compliance ma pełny dostęp.