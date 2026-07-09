---
title: Metadata Model Overview (Przegląd Modelu Metadanych)
created: 2026-05-06
status: 🌱 draft
category: Data Governance
difficulty: średni
language: pl
tags:
  - ataccama
  - metadata-model
  - entities
  - configuration
aliases:
  - Przegląd modelu metadanych
  - Ataccama metadata model
---

# 🎯 Definicja
**Model Metadanych ([[Metadata|Metadata]] Model)** w [[Ataccama|Ataccama]] ONE to logiczna struktura definiująca schemat danych, na którym opiera się cała platforma. Określa on encje (entities), ich właściwości (properties), cechy ([[Traits|traits]]) oraz relacje, służąc jednocześnie jako podstawa do automatycznego generowania interfejsu użytkownika w aplikacji webowej.

---

🔑 **Kluczowe punkty**
- Definiuje strukturę pojęciową systemu (np. czym jest baza danych, tabela, kolumna, jakie mają atrybuty).
- Składa się z definicji typów (encji) oraz ich fizycznych instancji (zasobów danych).
- Umożliwia rozszerzanie domyślnego modelu poprzez tworzenie własnych encji i dodawanie właściwości.
- Konfiguracja może odbywać się wizualnie w aplikacji lub poprzez pliki konfiguracyjne JSON.

---

📚 **Szczegółowe wyjaśnienie**

### Typy encji w modelu
Encje w modelu metadanych [[Ataccama|Ataccama]] ONE dzielą się na dwie kategorie:
1. **Systemowe (System):** Używane wewnętrznie przez aplikację. Opisują konfigurację techniczną oraz parametry działania samej platformy.
2. **Biznesowe (Business):** Zarządzane przez organizację. Stanowią ramę dla metadanych istotnych z perspektywy biznesu (np. [[Glossary Terms|terminy biznesowe]], [[Data Catalog|elementy katalogu]]).

### Klasyfikacja: Encja vs Instancja
Model metadanych precyzyjnie rozróżnia definicje od konkretnych danych:
- **Encja (Entity):** Definicja typu obiektu w modelu metadanych. Przykładem jest encja `source` (źródło danych).
- **Instancja (Instance):** Rzeczywisty obiekt danych zarejestrowany w systemie. Dla encji `source` instancjami będą konkretne bazy, np. *AWS S3*, *baza PostgreSQL* czy system *MDM*.

### Możliwości konfiguracji modelu
Zmiany w modelu metadanych można wprowadzać na dwa sposoby:
- **Przez interfejs webowy:** Przechodząc do *Global Settings > [[Metadata|Metadata]] Model*. Pozwala to na wizualne tworzenie encji, dodawanie do nich właściwości oraz cech ([[Traits|traits]]).
- **Przez pliki konfiguracyjne JSON:** Importując pliki zmian w zakładce *Global Settings > System Changes*.

Edycja lub usuwanie podstawowej (fabrycznej) konfiguracji domyślnych encji dostarczanych przez [[Ataccama|Ataccama]] jest zablokowana ze względów bezpieczeństwa. Możliwe jest jednak dodawanie do nich nowych atrybutów.

---

💡 **Opcje ekranu [[Metadata|Metadata]] Model**
Ekran zarządzania modelem w [[Ataccama|Ataccama]] ONE oferuje następujące narzędzia:
- **[[Metadata|Metadata]] Model:** Lista wszystkich zdefiniowanych encji tworzących model.
- **Model Graph:** Graficzna [[Wizualizacja|wizualizacja]] zależności i powiązań między encjami w modelu (patrz: [[Metadata Model Graph]]).
- **Wyszukiwarka tekstowa:** Ułatwia szybkie odnalezienie encji po nazwie.
- **Filtr typów encji:** Pozwala przełączać widok między samymi encjami biznesowymi a pełnym modelem (włączając encje systemowe).
- **Przycisk Create:** Rozpoczyna kreator dodawania nowej encji.
- **Opcja Share:** Umożliwia współdzielenie uprawnień do edycji i odczytu modelu z innymi użytkownikami lub grupami.

---

📌 **Źródła**
- [[Ataccama|Ataccama]] ONE Metamodel Configuration Guide
- [[Ataccama|Ataccama]] ONE Administrator Portal Documentation