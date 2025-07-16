---

title: "Informacje ogólne (Struktura folderów, Linki)"  
created: 2025-07-16  
status: Final  
category: pomoc  
difficulty: podstawowy  
language: pl  
tags:

- pomoc
- quartz
- hugo
- markdown  
aliases:
- struktura quartz
- linkowanie stron
- organizacja notatek
- foldery quartz

---

# 🎯 Opis

Ten dokument zawiera podstawowe informacje dotyczące struktury folderów, systemu linków oraz składni i metadanych w środowisku [Quartz](https://quartz.jzhao.xyz), które działa na platformie [Hugo](https://gohugo.io/). Wszystkie treści są pisane w formacie [Markdown](https://www.markdownguide.org/getting-started/) i mogą być łatwo edytowane za pomocą dowolnego edytora tekstowego.

# 📁 Struktura folderów

- Wszystkie treści notatkowe znajdują się w folderze:  
    `content/`
- Terminy słownika tematycznego zazwyczaj umieszczamy w `content/notes/` lub `content/term/`.
- Strona główna to plik:  
    `content/_index.md`
- Inne foldery (np. `themes/`, `static/`) należą do frameworka Hugo/Quartz i nie powinny zawierać notatek.

# 🔗 Linki

## Linking do innych notatek

Aby połączyć się z innym dokumentem, użyj **klasycznej składni Markdown** i zawsze podawaj ścieżkę względną względem katalogu `content/`.

Przykład:

```markdown
[Link do strony konfiguracyjnej](notes/config.md)
```

To utworzy hiperłącze do `content/notes/config.md`.

## Obrazy

Lokalne obrazy mogą być umieszczone w katalogu `content/images/`.

Przykład:

```markdown
![Przykładowy Obraz](/content/images/example.png)
```

Obraz zostanie załadowany obok treści dokumentu.

# 🔤 Małe litery i estetyka linków

- Notatki i linki powinny być zapisane **małymi literami** (np. `notes/nazwa-notatki.md`).
- W tekstach możesz kapitalizować nazwę linku dla estetyki, np.:  
    `[Apache Arrow](notes/apache%20arrow.md)`
- Skróty i nazw własne (np. YAML, SQL, API) możesz pisać wersalikami – wyjątek od tej reguły.

# 🧾 Metadane (Front Matter)

Każdy plik Markdown powinien zawierać blok metadanych (front matter) w formacie YAML na początku dokumentu.

Przykład:

```yaml
---
title: "Co to jest Słownik?"
tags:
- przykładowy-tag
- kolejny-tag
url: "notes/moja-inna-domena"
aliases:
- Ogród Cyfrowy
- Drugi Mózg
---
```

**Kluczowe właściwości:**

|Pole|Opis|
|---|---|
|`title`|Tytuł notatki, używany także w nawigacji i widoku strony.|
|`tags`|Lista tagów powiązanych z notatką – pomocne w filtrowaniu treści.|
|`url`|Opcjonalne – pozwala zdefiniować customowy URL, gdy chcesz inny niż domyślny.|
|`aliases`|Alternatywne nazwy/aliasy. Działa jak dodatkowa forma linkowania.|

> Uwaga: Hugo jest wrażliwy na formatowanie YAML (wcięcia, spacje, struktura kluczy). Zachowuj poprawną strukturę.

# ✅ Wskazówki dodatkowe

- Quartz obsługuje pełnotekstowe wyszukiwanie, WikiLinks (jeśli aktywowane), backlinki, transkluzje i widok grafu.
- Pliki mogą być hostowane na GitHub Pages lub dowolnym serwerze statycznym.
- Hot reload i build jest możliwy przez `quartz build` / `quartz preview`.
- Update'y i poradniki dostępne na oficjalnej stronie [Quartz](https://quartz.jzhao.xyz).

## 📌 Źródła

- [Quartz Docs – Start here](https://quartz.jzhao.xyz)
- [Hugo Documentation](https://gohugo.io/getting-started/quick-start/)
- [Markdown Guide](https://www.markdownguide.org/getting-started/)

## 👽 Brudnopis

- Folder nadrzędny to content/, każda notatka to osobny plik md
- Linkuje się po nazwach względnych: `notes/nazwa.md`
- alias = alternatywna etykieta → działa jak etykieta lub fraza z wyszukiwarki
- tagi = grupowanie semantyczne, linkowane
- wszystko ma być lowercase, chyba że nazwa własna
- obrazki lokalnie w `content/images/`
- frontmatter zawsze z `---` i poprawnym YAML-em

---