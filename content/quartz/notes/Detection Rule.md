---

title: Detection Rule  
created: 2025-05-21  
status:  
category: data governance / jakość danych  
difficulty: średni  
language: pl  
tags:

- reguły jakości danych
- wykrywanie terminów
- detection rule
- data observability  
aliases:
- reguła wykrywania
- detection logic
- detection condition

---

# 🎯 Definicja

**Detection Rule (reguła wykrywania)** to reguła logiczna stosowana w systemach zarządzania jakością danych lub zarządzania metadanymi, służąca do automatycznego wykrywania zgodności danych z określonym warunkiem. Najczęstsze zastosowanie to wykrywanie terminów biznesowych w danych technicznych (np. kolumnach tabel), jako element procesu data discovery lub [[data observability]].

# 🔑 Kluczowe punkty

- 🧠 Logika wykrywania działa na poziomie pojedynczych atrybutów (np. kolumny tabeli).
- 💡 Może być tworzona na dwa sposoby:
    - poprzez kreator Condition Builder (graficzne reguły),
    - lub pisana ręcznie jako wyrażenie logiczne (Advanced Expression).
- 🏷️ Powszechnie wykorzystywana w mapowaniu terminów słownika biznesowego (business glossary) do danych technicznych.
- 🔄 Działa automatycznie w ramach procesów data discovery lub ręcznie uruchamianego profilowania danych.
- 🧩 Tworzy pomost między wykrytą strukturą danych a semantyką biznesową (np. pole typu tekstowego z numerem → „Customer ID”).

# 📚 Szczegółowe wyjaśnienie

## Gdzie występuje reguła wykrywania?

W narzędziach takich jak Ataccama ONE [[Detection rules|reguły wykrywania]] stanowią centralny element automatycznego powiązywania terminów biznesowych ze strukturami danych.

Etapy ich użycia to:

1. Administrator lub steward tworzy regułę typu „Term Detection” (Wykrycie Terminu).
2. Wybiera warunek wykrycia – używając opcji:
    - 🧰 **Condition Builder**: np. "Contains substring", "Is from reference data", "Starts with 'cust_'"
    - ✍🏻 **Advanced Expression**: np. `column_name LIKE 'cust%' AND data_type = 'text'`
3. Określa, do jakich pól reguła ma się odnosić (np. do nazw kolumn, typów danych lub wartości).
4. Po zastosowaniu reguły system wykrywa potencjalne dopasowania, np. sugerując przypisanie terminu "Customer Email" do kolumny `email_address`.

## Przykłady konfiguracji warunków

### ✅ Przykład z Condition Builder

- Rule Type: Term Detection
- Detection Condition: _Column name contains_ "email"
- Detected Term: "Customer Email"

### ✅ Przykład z Advanced Expression

```plaintext
column_name.matches("customer.*id") && data_type == "INTEGER"
```

# 💡 Przykład zastosowania

```python
# Pseudokod wykrywania kolumn z nazwą "phone" i typem 'string'

if "phone" in column_name.lower() and data_type == "STRING":
    detect_term("Phone Number")
```

W Ataccama użytkownik może to zapisać jako regułę typu Term Detection, aby system automatycznie oznaczał odpowiednie kolumny jako zawierające numery telefonów i przypisywał termin biznesowy zgodny z katalogiem.

# 📌 Źródła

- [https://docs.ataccama.com/](https://docs.ataccama.com/)
- [https://towardsdatascience.com/automated-data-discovery-ae0c2e83e3cf](https://towardsdatascience.com/automated-data-discovery-ae0c2e83e3cf)
- [https://www.collibra.com/blog/what-is-b2b-data-discovery-and-how-does-it-work](https://www.collibra.com/blog/what-is-b2b-data-discovery-and-how-does-it-work)
- [https://learn.microsoft.com/en-us/fabric/data/data-categorization](https://learn.microsoft.com/en-us/fabric/data/data-categorization)

# 👽 Brudnopis

- Detection rule = auto-mapper semantyki → kolumna = termin
- Bardzo przydatne przy szerokim katalogowaniu/DQ
- Rekomendacje AI mogą wspierać konfigurację reguł (np. AutoML na nazwach kolumn)
- Najlepsze efekty: kombinacja Condition Builder + podstawowe Testy
- Rekomendacja: walidować reguły z biznesem (czy dobrze „rozumiemy dane”)