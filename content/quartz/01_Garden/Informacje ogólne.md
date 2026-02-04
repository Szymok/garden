---
title: Informacje ogólne (Struktura Quartz)
created: 2026-02-04
status: evergreen
category: Meta / Ogród
difficulty: basic
language: pl
tags:
  - quartz
  - markdown
  - structure
  - meta
aliases:
  - Struktura Ogrodu
  - Linkowanie
  - Jak pisać notatki
---
# 🎯 Definicja
Ten dokument opisuje techniczne zasady prowadzenia tego Ogrodu Cyfrowego (Digital Garden), opartego na silniku **Quartz** (Hugo). Służy jako przewodnik dla autora (i AI) jak formatować treści, gdzie je zapisywać i jak linkować.

# 🔑 Kluczowe punkty
- **Folder Główny:** Wszystkie notatki lądują w `content/quartz/01_Garden/`.
- **Format:** Markdown (`.md`).
- **Frontmatter:** Każdy plik musi mieć nagłówek YAML z tytułem, statusem i tagami.

# 📚 Szczegółowe wyjaśnienie
## Linkowanie (WikiLinks)
Używamy standardowych linków Markdown lub WikiLinks (jeśli wspierane). W tym ogrodzie preferujemy:
`[[Nazwa Notatki]]` lub `[Tekst](Ścieżka/Do/Pliku.md)`.
Ważne: W Quartz ścieżki są względne do folderu `content`.

## Obrazy
Obrazy wrzucamy do `content/quartz/01_Garden/images/` (lub podfolderu assetów) i linkujemy:
`![Podpis](images/moj-obrazek.png)`.

## Metadane (Standard)
Każda notatka powinna mieć:
```yaml
title: Tytuł
created: YYYY-MM-DD
status: seedling | evergreen
tags: [tag1, tag2]
```

# 💡 Przykład zastosowania
Chcesz dodać nową notatkę o "Pythonie".
1. Tworzysz plik `Python.md` w głównym folderze ogrodu.
2. Dodajesz Frontmatter.
3. Piszesz treść.
4. Linkujesz do niej z innych notatek przez `[[Python]]`.

## 📌 Źródła
- [Quartz Documentation](https://quartz.jzhao.xyz).

## 👽 Brudnopis
- Dbałość o strukturę plików (`.md`) ułatwia późniejszą migrację (np. do Obsidian lub innego narzędzia).
- Unikaj spacji w nazwach plików, jeśli to możliwe (choć Quartz sobie radzi, URL-e wyglądają lepiej z myślnikami). Tutaj przyjęliśmy konwencję "Nazwa Pliku.md" (ze spacjami), co jest OK.