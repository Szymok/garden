---

title: Szablon Jinja  
created: 2025-07-16  
status: Final  
category: Programowanie / Inżynieria danych  
difficulty: podstawowy  
language: pl  
tags:

- inżynieria
- danych
- "TemplateEngine"
- "PythonTemplates"  
aliases:
- jinja2
- silnik szablonów jinja
- python templating

---

# 🎯 Definicja

**Jinja** to szybki, ekspresyjny silnik szablonów tekstowych oparty na języku Python, który pozwala dynamicznie tworzyć treści poprzez wstawianie wartości, warunków i pętli w ramach szablonów. Jinja2 jest szeroko wykorzystywany w aplikacjach webowych (Flask, Django), narzędziach DevOps oraz — szczególnie — w **data engineeringu**, m.in. w narzędziu dbt.

# 🔑 Kluczowe punkty

- Szablony Jinja to pliki tekstowe (np. `.sql`, `.html`, `.yaml`, `.cfg`) wzbogacone o dynamiczne fragmenty w składni zbliżonej do Pythona.
- Interpretacja szablonu polega na **renderowaniu** — czyli uzupełnianiu go przekazanymi danymi lub strukturami (słowniki, listy itp.).
- Popularna składnia `{{ ... }}` (dla wyrażeń) i `{% ... %}` (dla instrukcji logicznych/pętli).
- Umożliwia iteracje, warunki, makra i filtrowanie danych tekstowych w ramach jednego pliku.
- Szczególnie użyteczny przy generowaniu kodu SQL, HTML, kodów konfiguracyjnych i raportów.

# 📚 Szczegółowe wyjaśnienie

## Podstawowa składnia Jinja

```jinja
-- Przykład z szablonu SQL w dbt
SELECT
  user_id,
  {% if include_email %}
    email,
  {% endif %}
  created_at
FROM {{ ref('users') }}
WHERE is_active = true
```

### Główne elementy:

|Składnia|Znaczenie|
|---|---|
|`{{ ... }}`|Wstawianie zmiennej lub wyniku wyrażenia|
|`{% ... %}`|Instrukcje: warunki, pętle, makra|
|`{# ... #}`|Komentarz w Jinja (nie widoczny w efekcie końcowym)|

### Przykład HTML + zmienne:

```jinja
<h1>Witaj {{ user.name }}!</h1>
{% if user.vip %}
<p>Dziękujemy za bycie naszym VIP-em 🎉</p>
{% else %}
<p>Rozważ dołączenie do programu VIP.</p>
{% endif %}
```

## Zastosowanie w dbt

W kontekście dbt (data build tool):

- Szablony `.sql` są renderowane przy każdym przebudowaniu modelu.
- Wewnętrzne zmienne jak `{{ ref() }}`, `{{ var() }}`, `{{ config() }}` są obsługiwane przez parser dbt + silnik Jinja.
- Można pisać makra w plikach `.sql` lub `.yml` i wykorzystywać je wielokrotnie.

Przykład:

```jinja
{% macro is_weekend_day(ds) %}
  EXTRACT(DAYOFWEEK FROM {{ ds }}) IN (1, 7)
{% endmacro %}
```

## Typowe zastosowania

- Dynamika zapytań SQL (filtry, warunki, generatory kolumn)
- Generowanie stron HTML (np. ze zmiennej treści)
- Konfiguracje YAML (np. Ansible, dbt manifest, GitHub workflows)
- Szablonowanie kodów testowych, dokumentacyjnych lub mailowych

# 💡 Przykład użycia

Zespół inżynierii danych chce stworzyć 30 modeli SQL zawierających różne kolumny tylko dla określonych regionów. Zamiast powielać kod SQL — definiuje pętlę i listę regionów w szablonie Jinja, automatyzując proces tworzenia plików oddzielnie dla każdego regionu.

## 📌 Źródła

- Oficjalna dokumentacja: [https://jinja.palletsprojects.com/](https://jinja.palletsprojects.com/)
- dbt docs: [https://docs.getdbt.com/docs/build/jinja-macros](https://docs.getdbt.com/docs/build/jinja-macros)
- Intro tutorial: [https://realpython.com/primer-on-jinja-templating/](https://realpython.com/primer-on-jinja-templating/)
- Jinja Cheatsheet: [https://quickref.me/jinja](https://quickref.me/jinja)

## 👽 Brudnopis

- render() = funkcja w Pythonie do przetworzenia szablonu
- Można łączyć Jinja z YAML, JSON, Markdown
- Dużo użycia w: Airflow, dbt, cookiecutter, mkdocs, static site generators
- Wrażliwy na wcięcia i spacje → kluczowe w YAML
- Możliwość tworzenia filtrów własnych: `{{ name | upper }}`

---