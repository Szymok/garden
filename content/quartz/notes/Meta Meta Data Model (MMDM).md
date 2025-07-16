---

title: Meta Meta Data Model (MMDM) w Ataccama  
created: 2025-03-28  
status: draft  
category: ataccama  
difficulty:  
language: pl  
tags:

- metadata
- data governance
- ataccama
- meta model  
aliases:
- MMDM
---
# 🎯 Definicja

**Meta Meta Data Model (MMDM)** w Ataccama to warstwa opisująca strukturę oraz mechanizmy działania samego modelu metadanych, czyli schemat (model) definiujący inne schematy opisujące dane w systemie. Jest to model meta-poziomu – meta-meta model – który umożliwia elastyczność i modyfikowalność architektury zarządzania metadanymi w rozwiązaniach Ataccama.

# 🔑 Kluczowe punkty

- **Opisuje strukturę metadanych**: MMDM definiuje zasady, typy obiektów, ich właściwości i zależności między nimi w modelu metadanych Ataccama.
- **Oddziela logikę aplikacyjną od struktury danych**: Modyfikacje MMDM zmieniają sposób, w jaki system obsługuje nowe typy encji, relacje, dziedziczenie i atrybuty – bez konieczności przeprogramowywania aplikacji.
- **Graficzna wizualizacja**: MMDM można eksplorować i edytować przez graficzny model w sekcji Organization → Application Settings → Metadata Model.
- **Rola uprawnień**: Do edytowania MMDM wymagana jest rola z uprawnieniem `application-admin`.
- **Model napędzany metadanymi (metadata-driven)**: System Ataccama wykorzystuje MMDM do generowania interfejsów, walidacji i zachowań biznesowych na podstawie dynamicznie zdefiniowanego modelu.

# 📚 Szczegółowe wyjaśnienie

## Czym jest Meta Meta Data Model?

W klasycznym podejściu metadane opisują dane (np. tabela: Product ma kolumnę Name). MMDM idzie poziom wyżej: definiuje, _jak_ opisujemy te tabele i kolumny — czyli struktury, typy encji i zasady relacji między nimi.

- **Obiekty modelu**: Każdy element MMDM opisuje typ encji (np. Person, Dataset) oraz możliwe właściwości, relacje, dziedziczenie.
- **Dziedziczenie i relacje**: Pozwala na tworzenie hierarchii typów oraz referencje – np. encja Person może mieć relacje do ról (Role), a dziedziczenie atrybutów umożliwia reużywalność schematów.

### Typy relacji i własności:

- **AEE (Array of Embedding Entities)** – lista encji wbudowanych w inne obiekty (np. lista adresów osoby – integralna część encji; usuwane razem z obiektem głównym).
- **SRE (Single of Referencing Entities)** – pojedyncze referencje do niezależnych obiektów (np. rola przypisana osobie; samodzielne życie, nieusuwane automatycznie).
- **Embedding vs. Referencing**:
    - _Embedding_: część składowa, usuwana wraz z głównym obiektem.
    - _Referencing_: powiązanie do istniejącego obiektu, pozostaje po usunięciu odnośnika.

## Modyfikacja w Ataccama ONE

- Edycja MMDM w Ataccama odbywa się przez Organization → Application Settings → Metadata Model (diagram + edytor):
    - **Zmiana MMDM = zmiana architektury aplikacji** (np. dodanie nowych typów encji, rozszerzenie atrybutów).
    - **Zmiana metadanych = zmiana zachowania systemu** (np. inne wyświetlanie, walidacje dla obiektów danych).

## Wpływ na aplikację

- **Zmiana modelu metadanych** pozwala opisać nowe domeny biznesowe, zautomatyzować generowanie interfejsów czy walidacji.
- **Zmiana MMDM** pozwala definitywnie zmodyfikować, jak system rozumie – i obsługuje – wszelkie metadane; wpływa na strukturę logiki oraz elastyczność aplikacji.

# 💡 Przykład zastosowania

**Scenariusz:** W organizacji pojawia się potrzeba rozszerzenia modelu o zarządzanie cyklem życia zgłoszeń reklamacyjnych (Claims).

1. Administrator (z rolą `application-admin`) przechodzi do Organization → Application Settings → Metadata Model.
2. Tworzy nowy typ encji Claim, definiuje jej właściwości oraz relacje (np. powiązania z klientem, produktem, statusem).
3. Ustala dziedziczenie (np. Claim dziedziczy atrybuty dokumentów).
4. Zapisuje zmiany – system automatycznie generuje widoki, walidacje i mechanizmy obsługi Claim.
5. Zmiana MMDM pozwala dynamicznie dostosowywać strukturę aplikacji do rosnących potrzeb biznesowych bez ingerencji w kod źródłowy.

```python
# Pseudokod - przykładowa definicja nowego typu encji w modelu (nie bezpośredni kod Ataccama!)
class Claim(Document):
    customer: Reference[Person]
    product: Reference[Product]
    status: str
    details: str
    close_date: date
```

# 📌 Źródła

- [https://support.ataccama.com/home/docs/aip/latest/development-guides/one-development-guide/configuring-the-metadata-model](https://support.ataccama.com/home/docs/aip/latest/development-guides/one-development-guide/configuring-the-metadata-model)
- [https://support.ataccama.com/home/docs/aip/latest/user-guides/one-web-application-user-guide/one-basics/searching-in-one-web-application#SearchinginONEWebApplication-SearchingUsingAQL](https://support.ataccama.com/home/docs/aip/latest/user-guides/one-web-application-user-guide/one-basics/searching-in-one-web-application#SearchinginONEWebApplication-SearchingUsingAQL)

# 👽 Brudnopis

- MMDM = opis, _jak_ opisujemy i modelujemy biznesowe “dane o danych” (modele meta-meta).
- Edycja MMDM powoduje nowe encje, dziedziczenie, typy relacji w całym Ataccama ONE.
- Graficzny edytor, uprawnienia “application-admin”.
- Wpływa na generowanie interfejsu, mechanizmy walidacji, automatyczne akcje.
- Typy relacji: embedding (część integralna), referencing (dowiązanie do innych, autonomicznych obiektów).
- Zmiana metadanych = wpływ na zachowania biznesowe; zmiana meta-metadanych = wpływ na strukturę całej aplikacji (metadata-driven).