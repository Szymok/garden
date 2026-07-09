---
title: Metadata Model Graph (Wizualizacja Grafu Modelu Metadanych)
created: 2026-05-06
status: 🌱 draft
category: Data Governance
difficulty: średni
language: pl
tags:
  - ataccama
  - metadata-model
  - graph
  - entities
aliases:
  - Graf modelu metadanych
  - Model Graph Ataccama
---

# 🎯 Definicja
**[[Wizualizacja|Wizualizacja]] Grafu Modelu Metadanych ([[Metadata|Metadata]] Model Graph)** to interaktywne narzędzie graficzne w [[Ataccama|Ataccama]] ONE, które przedstawia schemat relacji, dziedziczenia oraz powiązań pomiędzy wszystkimi encjami tworzącymi model metadanych platformy. Ułatwia zrozumienie powiązań między warstwami technicznymi i biznesowymi.

---

🔑 **Kluczowe punkty**
- Dostępny w panelu administracyjnym w zakładce *Global Settings > [[Metadata|Metadata]] Model > Model Graph*.
- Reprezentuje encje jako bloki (skrzynki) zawierające listę ich właściwości, a powiązania jako linie.
- Pozwala na filtrowanie encji według ich typu (systemowe vs biznesowe) oraz wyszukiwanie konkretnych obiektów na grafie.
- Typ relacji (np. `AEE`, `SRE`, `SEE`) jest wyświetlany bezpośrednio nad linią łączącą encje.

---

📚 **Nawigacja i obsługa grafu**

- **Filtrowanie typów encji:** Model metadanych dzieli encje na **Systemowe** (system - używane wewnętrznie do konfiguracji technicznej) oraz **Biznesowe** (business - istotne z punktu widzenia ładu danych, patrz: [[Metadata Model Overview]]). Domyślnie graf pokazuje tylko encje biznesowe. Aby zobaczyć wszystkie powiązania, należy przełączyć filtr na **All**.
- **Wyszukiwanie i podświetlanie:** Kliknięcie ikony lupy w prawym górnym rogu umożliwia wyszukanie konkretnej encji. Po znalezieniu, wybrany blok zostaje automatycznie wycentrowany i podświetlony na **zielono**.
- **Interakcja z połączeniami:** Najechanie kursorem na linię łączącą bloki podświetla relację, ułatwiając śledzenie zależności na skomplikowanym grafie.
- **Skalowanie widoku:** Panel kontrolny w prawym dolnym rogu pozwala na przybliżanie/oddalanie (zoom) oraz automatyczne dopasowanie widoku do ekranu.

---

🛠️ **Procedura dodawania nowej encji do grafu**

Dodanie nowego obiektu do modelu oznacza zdefiniowanie nowego typu encji. Odbywa się to w dwóch krokach:

### Krok 1: Utworzenie samej encji
1. Przejdź do *Global Settings > [[Metadata|Metadata]] Model* i kliknij przycisk **Create Entity**.
2. Wypełnij pola ogólne:
   - **Name:** Nazwa nowej encji.
   - **Extends (Opcjonalnie):** Pozwala wybrać encję bazową, po której nowa encja odziedziczy właściwości (patrz: [[Entity Extension|Rozszerzanie Encji]]).
3. Dodaj właściwości (**Properties**), które zdefiniują pola wejściowe (np. nazwa, typ skalarny lub obiektowy, czy pole jest wymagane).
4. (Opcjonalnie) Dodaj cechy (**[[Traits|Traits]]**), aby nadać encji dodatkowe funkcjonalności (np. profilowanie, [[Jakość Danych|jakość danych]]).
5. Kliknij **Save**.

### Krok 2: Podpięcie encji pod główny model (`metadata`)
Aby nowa encja była widoczna i połączona z resztą systemu na grafie, należy dodać ją jako właściwość głównego węzła modelu:
1. Wyszukaj encję o nazwie `metadata` na liście i przejdź do jej edycji.
2. Wybierz opcję **Add Property**.
3. Jako nazwę podaj dokładnie nazwę nowej encji (wielkość liter ma znaczenie).
4. Ustaw typ jako **Embedded object array** lub **Object** i wskaż swoją nowo utworzoną encję w polu wyszukiwania obiektu.
5. Kliknij **Save**.
6. Kliknij **Apply changes** na górnym żółtym pasku wersji roboczej (draft bar), aby opublikować zmiany w całym systemie.

---

📌 **Źródła**
- [[Ataccama|Ataccama]] ONE Metamodel Configuration Guide
- [[Ataccama|Ataccama]] ONE Web Application Administration Guide