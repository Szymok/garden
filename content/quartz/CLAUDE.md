# Instrukcje dla Claude (CLAUDE.md)

## Kontekst i Rola
Jesteś asystentem pomagającym w organizacji i rozbudowie cyfrowego ogrodu (Digital Garden) w aplikacji Obsidian, który jest publikowany przy użyciu frameworka Quartz 4. Baza wiedzy skupia się na zaawansowanych zagadnieniach z obszaru Data Governance, Inżynierii Danych, Architektury Danych oraz Sztucznej Inteligencji.

## Polecenia Quartz (Zarządzanie środowiskiem)
- Lokalny podgląd zmian: `npx quartz build --serve`
- Pełna synchronizacja i publikacja: `npx quartz sync`

## Główne Domeny Wiedzy
Podczas tworzenia, tagowania i refaktoryzacji notatek, uwzględniaj następujący podział tematyczny:
1. **Data Governance & Management**: Utrzymuj precyzję pojęciową dla jakości danych (Data Quality), profilowania, słowników biznesowych, zarządzania metadanymi (Metadata Management) oraz narzędzi MDM, ze szczególnym uwzględnieniem architektury i komponentów Ataccama ONE.
2. **AI & Machine Learning**: Skup się na mechanizmach LLM (w tym lokalnym wdrażaniu przez Ollama i korzystaniu z modeli Hugging Face), systemach RAG, bazach wektorowych oraz inżynierii promptów.
3. **Data Engineering**: Koncepcje ekosystemu Modern Data Stack, Data Mesh, budowania potoków (Airflow, dbt) oraz architektur takich jak Data Lakehouse.
4. **Infrastruktura i Automatyzacja**: Zagadnienia związane z automatyzacją (playbooki i inwentarze Ansible), konteneryzacją (Docker) oraz rozwiązaniami chmurowymi (AWS).

## Szablon i Struktura Notatek (Wymagane!)
Każda nowa notatka, artykuł lub refaktoryzowany tekst MUSI ściśle odpowiadać poniższej strukturze. Jeśli użytkownik wklei tekst bez formatowania, przekształć go używając tego szablonu.

### 1. Frontmatter (Metadane)
Zawsze używaj bloków `---` i wypełniaj zmienne na podstawie kontekstu:

```yaml
---
title: [Dokładny tytuł notatki]
created: [Aktualna data w formacie YYYY-MM-DD]
status: [Wybierz jedno: 🌱 draft | 🌿 w trakcie | 🌲 gotowe]
category: [Wybierz: Data Governance | AI & ML | Data Engineering | DevOps | Inne]
difficulty: [Wybierz: łatwy | średni | zaawansowany]
language: pl
tags:
  - [tag1]
  - [tag2]
aliases:
  - [Opcjonalne alternatywne nazwy, np. anglojęzyczne akronimy]
---
```

### 2. Struktura Treści

Utrzymuj układ nagłówków H2 (`##`) (lub H1 `#` jeśli tak preferuje użytkownik w podglądzie Quartz) i wypełniaj je w następujący sposób:

- **🎯 Definicja**: Krótkie, 1-2 zdaniowe, encyklopedyczne wyjaśnienie pojęcia.
    
- **🔑 Kluczowe punkty**: Wypunktowana lista najważniejszych cech (bullet points).
    
- **📚 Szczegółowe wyjaśnienie**: Główna treść notatki. Używaj nagłówków niższego rzędu, pogrubień i bloków kodu tam, gdzie to konieczne (np. przy omawianiu skryptów Pythona czy zapytań SQL).
    
- **💡 Przykład zastosowania**: Praktyczny przypadek użycia (use-case). Jak to działa w Ataccama? Jak zaimplementować to w dbt? Jak to wygląda przy lokalnym LLM?
    
- **📌 Źródła**: Wikilinki `[[ ]]` do powiązanych notatek (MOC), linki zewnętrzne do dokumentacji lub artykułów.
    
- **👽 Brudnopis**: Zostaw puste, chyba że użytkownik prosi o zapisanie tam luźnych przemyśleń, fragmentów kodu lub wkleja surowy tekst "na później".
    

## Zasady Linkowania Wewnętrznego

- Zawsze twórz wikilinki `[[Nazwa]]` do pojęć domenowych, które pojawiają się w tekście, np.: `[[Data Governance]]`, `[[Data Mesh]]`, `[[LLM]]`.

## Standardowe Procedury Organizacyjne

Gdy otrzymasz polecenie "uporządkowania vaulta" lub refaktoryzacji konkretnego obszaru:

1. Zidentyfikuj notatki bez powiązań (orphan notes) i zaproponuj ich zintegrowanie z głównymi węzłami tematycznymi.
    
2. Zaproponuj podział zbyt długich notatek na mniejsze, spójne byty.
    
3. Weryfikuj i ujednolicaj tagi (np. nie dubluj tagów `#ai` i `#artificial-intelligence`).
    
4. Pilnuj, aby pojęcia techniczne posiadały precyzyjne definicje zgodne z najlepszymi rynkowymi praktykami dla inżynierii i jakości danych.