---

title: Simple Model Extensions  
created: 2025-03-31  
status:  
category: ataccama / metadata modeling  
difficulty: średni  
language: pl  
tags:

- rozszerzenie modelu
- metadane
- Ataccama
- model danych
- data governance  
aliases:
- rozszerzenia modelu
- Simple Extensions
- SME Ataccama

---

# 🎯 Definicja

**Simple Model Extensions (SME)** to mechanizm w Ataccama ONE umożliwiający rozszerzanie modelu metadanych o dodatkowe, konfigurowalne właściwości przypisywane do standardowych encji systemowych, takich jak źródła danych, elementy katalogowe, terminy słownikowe, reguły jakości i inne. Dzięki temu można dodawać własne atrybuty opisu bez konieczności tworzenia dedykowanego modelu specjalistycznego.

# 🔑 Kluczowe punkty

- 🧩 Umożliwiają dodawanie pól użytkownika na poziomie obiektów modelu metadanych (np. `business_criticality`, `compliance_tag`, `business_owner`).
- ⚙️ Obsługiwane typy danych: tekst, liczba, boolean, data, lista (LOV), odniesienie (reference).
- 🏷️ Pola mogą być wykorzystywane w filtrach, widokach tabelarycznych, workflow lub regułach walidacji.
- 🔁 Fields typu „Reference” pozwalają na powiązanie z innymi obiektami (np. relacja do właściciela jako user object).
- 🔐 Działają zgodnie z uprawnieniami – mogą być widoczne globalnie, projektowo lub lokalnie.

# 📚 Szczegółowe wyjaśnienie

## Dlaczego warto stosować SME?

Standardowy model Ataccama ONE obejmuje zestaw predefiniowanych pól dla każdego typu obiektu (tabela, termin, źródło). W wielu przypadkach organizacje potrzebują jednak przechowywać dodatkowe pola specyficzne dla ich procesów, np.:

- Poziom ryzyka danych (low/medium/high),
- Segmentacja właścicieli (business/data/IT),
- Oceny jakości (subiektywne),
- Mnożnik kosztu przetworzenia,
- Związana dokumentacja (link),
- Status akceptacji w zewnętrznym narzędziu (np. Jira, Confluence ID).

### Główne typy pól

|Typ pola|Opis|
|---|---|
|Text|Wartość tekstowa, np. opis, notatka|
|Boolean|Pole typu prawda/fałsz|
|Number|Wartość liczby całkowitej lub zmiennoprzecinkowej|
|Date|Data (np. data przeglądu, od kiedy obowiązuje)|
|List (LOV)|Lista dopuszczalnych wartości, np. `["Low", "Medium", "High"]`|
|Reference|Odniesienie do innego obiektu z systemu, np. innego użytkownika, reguły|

## Gdzie stosować SME?

- 🌐 Globalnie – np. każde źródło danych ma przypisany „Data Owner”.
- 🗂️ W obrębie katalogu – nadanie tagów, kategorii i klasyfikatorów niestandardowych.
- 📖 W słowniku pojęć – np. dowiązanie obiektu z zewnętrznego repozytorium (referencja do dokumentacji).
- 📏 W regułach jakości – np. „aktywna reguła DQ?” typu Boolean.
- 📈 Do celów analitycznych – np. tag „monitorowany przez AI” wykorzystywane w filtrach dashboardów.

## Konfiguracja

1. Administrator przechodzi do **Global Settings → Extensions**.
2. Wybiera typ obiektu, np. „Catalog Item” lub „Glossary Term”.
3. Tworzy nowe pole:
    - nazwę (`business_impact`)
    - typ (List)
    - wartości (`Low`, `Medium`, `High`)
4. Konfiguruje widoczność, edycyjność i czy pole ma być obowiązkowe.
5. Po zapisaniu — użytkownicy mogą wprowadzać/edytować wartość tego pola w widoku obiektu.

# 💡 Przykład zastosowania

Dodanie pola „Compliance Impact” typu `LOV` do każdego elementu katalogowego, z trzema wartościami: `Low`, `Moderate`, `Critical`.

```python
create_model_extension(
  target="Catalog Item",
  name="compliance_impact",
  type="List",
  values=["Low", "Moderate", "Critical"],
  visibility="global",
  editable=True,
  required=False
)
```

Pole to można potem używać do filtrowania obiektów podczas audytu lub budowania widoków dla zespołu Compliance.

# 📌 Źródła

- [https://docs.ataccama.com/ONE/](https://docs.ataccama.com/ONE/)
- [https://www.dataversity.net/extending-metadata-models/](https://www.dataversity.net/extending-metadata-models/)
- [https://learn.microsoft.com/en-us/purview/custom-metadata](https://learn.microsoft.com/en-us/purview/custom-metadata)

# 👽 Brudnopis

- SME = prosty sposób na "custom fields" dla każdego obszaru danych
- Pozwala zrezygnować z Excela / Confluence jako repozytorium „meta-metadanych”
- Alternatywa do budowy własnego modelu customowego – szybciej, łatwiej zarządzać
- Można łączyć z workflow, raportami, wyszukiwarką, widokami agregacyjnymi
- Dobrze działa z LOV i typem referencyjnym jako „manager” lub „dokument bazowy”