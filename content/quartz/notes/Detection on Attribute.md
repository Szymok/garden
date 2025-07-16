---

title: Detection on Attribute  
created: 2025-05-21  
status:  
category: data governance / jakość danych  
difficulty: średni  
language: pl  
tags:

- wykrywanie terminów
- dane atrybutów
- AI detection
- quality rules
- data discovery  
aliases:
- wykrywanie na atrybucie
- detekcja terminów na kolumnie
- detection on attribute

---

# 🎯 Definicja

**Detection on Attribute (wykrywanie na poziomie atrybutu)** to proces przypisywania terminów biznesowych do konkretnych kolumn (atrybutów danych) w tabelach, z użyciem reguł logicznych lub mechanizmów opartych na AI. Działa jako element automatyzacji katalogowania danych oraz wspiera odkrywanie semantyki danych w ramach procesu data discovery i data observability.

# 🔑 Kluczowe punkty

- 📍 Dotyczy pojedynczych kolumn (atrybutów) w danych technicznych.
- ⚙️ Wspiera **automatyczne rozpoznawanie terminów biznesowych** przy pomocy:
    - Reguł wykrywania (Detection Rules),
    - Mechanizmów AI opartych na podobieństwie nazw i wartości.
- 🚀 Można ustawić własne progi czułości (threshold) lub używać operatorów logicznych dla wielu reguł.
- 🧠 Przypisania dokonywane są na etapie data discovery lub manualnie z poziomu widoku atrybutu.
- 🔄 Integracja z katalogiem danych i słownikiem biznesowym (Business Glossary).

# 📚 Szczegółowe wyjaśnienie

## Jak działa wykrywanie na poziomie atrybutu?

Po zakończeniu procesu wykrycia danych w źródle (Data Discovery), użytkownik może przejść do widoku tabeli lub obiektu i otworzyć kartę **Settings → Detection on Attributes**, gdzie konfigurowane są reguły wykrywania i aktywowane mechanizmy AI.

### 1. AI-based Detection

- Wykorzystuje uczenie maszynowe oraz historię wcześniejszych przypisań, by zasugerować termin najbardziej dopasowany do danego atrybutu.
- Przykład: pole `email_address` zostanie oznaczone jako "Customer Email" z dużym prawdopodobieństwem.

### 2. Rule-based Detection

- Użytkownik może przypisać _jedną lub wiele reguł wykrywania (Detection Rules)_:
    - Reguły mogą działać na podstawie nazw kolumn, typów danych, wartości referencyjnych.
    - Przykład: reguła "email columns" dopasuje się do pól zawierających "email".

### Konfiguracja logiczna

- Można zdefiniować operator łączenia wielu reguł:
    - **AND** – wszystkie warunki muszą być spełnione,
    - **OR** – wystarczy spełnienie jednego.

### Próg wykrycia (Detection Threshold)

- W przypadku reguł opartych na danych (profilowanie, AI), możliwe jest ustawienie minimalnego dopasowania procentowego, np. 85%.

## Co się dzieje po wykryciu?

- Termin biznesowy może być automatycznie przypisany do atrybutu.
- W razie niepewności – system może oznaczyć przypisanie jako "Sugestia", do zatwierdzenia przez Data Stewarda.
- Przypisany termin uruchamia reguły jakości DQ i może być przetwarzany dalej w ramach observability, klasyfikacji danych lub workflow.

# 💡 Przykład zastosowania

```python
# Pseudokonfiguracja: wykryj termin "Phone Number" na kolumnie, jeśli:
# - Nazwa kolumny zawiera "phone"
# - Typ danych = STRING
# - Występuje wzorzec numeru telefonu

detection_rule = {
  "condition": "column_name.contains('phone') AND data_type == 'STRING'",
  "term": "Customer Phone Number"
}

apply_detection_on_attribute(table="customers", column="main_phone", rule=detection_rule)
```

W interfejsie użytkownika taką regułę można zdefiniować za pomocą Condition Builder lub Advanced Expression.

# 📌 Źródła

- [https://docs.ataccama.com/ONE/](https://docs.ataccama.com/ONE/)
- [https://help.collibra.com/docs/collibra/latest/Data_Discovery](https://help.collibra.com/docs/collibra/latest/Data_Discovery)
- [https://towardsdatascience.com/semantic-discovery-at-column-level-dee37eef6c6f](https://towardsdatascience.com/semantic-discovery-at-column-level-dee37eef6c6f)
- [https://learn.microsoft.com/en-us/fabric/data/data-categorization](https://learn.microsoft.com/en-us/fabric/data/data-categorization)

# 👽 Brudnopis

- Detekcja = semi-automatyczny krok łączenia technik z semantyką
- AI: uczy się z historii powiązań + nazw + rozkładów wartości
- Rules: dobry start, większa kontrola; AI: automatyzacja, szersze zastosowania
- Lineage = efektywne przypisanie terminów → uruchamia dziedziczne kontrole i raportowanie
- Przydatna w MDM, Catalog, Quality i klasyfikacji wrażliwości (np. PII)