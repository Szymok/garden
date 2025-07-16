---

title: Data Profiling  
created: 2025-04-03  
status:  
category: data quality / data discovery  
difficulty: podstawowy  
language: pl  
tags:

- data profiling
- jakość danych
- analiza danych
- metadata
- data governance  
aliases:
- profilowanie danych
- analiza danych źródłowych
- data profiling

---

# 🎯 Definicja

**Data Profiling** to proces eksploracji i analizy danych źródłowych w celu uzyskania szczegółowych informacji o ich strukturze, zawartości, jakościach statystycznych oraz potencjalnych nieprawidłowościach. Profilowanie danych wspiera zrozumienie, przygotowanie i weryfikację danych przed ich dalszym wykorzystaniem w projektach analitycznych, integracyjnych lub zarządzania jakością danych.

# 🔑 Kluczowe punkty

- 🔍 Ujawnia kluczowe cechy kolumn/tabel: typy danych, puste wartości, unikalność, rozkłady.
- 🧪 Część procesów data discovery, quality assessment oraz audytu danych.
- ✨ Umożliwia wykrycie błędów, anomalii, niespójności strukturalnych.
- 🔄 Może być uruchamiane ręcznie (manual profiling) lub automatycznie w harmonogramie.
- 📊 Dane raportowane przez profilowanie stanowią podstawę dla reguł jakości i przypisania terminów słownikowych.

# 📚 Szczegółowe wyjaśnienie

Data Profiling to pierwszy krok eksploracji danych, odpowiednik pytania: "Z czym mamy do czynienia?". Pozwala odpowiedzieć na pytania:

- Ile kolumn/wierszy ma tabela?
- Jakie są typy danych i ich zgodność?
- Które kolumny zawierają wartości puste (NULL)?
- Jakie są wartości dominujące lub nietypowe (outliers)?
- Czy istnieje rozbieżność między wartościami logicznie powiązanymi?

### Metryki profilowania

|Metryka|Opis|
|---|---|
|Null Rate|Procent brakujących wartości w danej kolumnie|
|Uniqueness Ratio|Liczba unikalnych wartości / liczba wszystkich wierszy|
|Value Distribution|Rozkład i częstotliwość występowania poszczególnych wartości|
|Min / Max|Wartości minimalne i maksymalne|
|Pattern Frequency|Typowe wzorce danych (np. numer telefonu, email, NIP)|
|Data Type Consistency|Czy wartości rzeczywiście odpowiadają zadeklarowanemu typowi|

# 💼 Scenariusze użycia

- Nowe źródło danych wymaga weryfikacji jakości przed integracją.
- Potrzeba lepszego zrozumienia istniejących danych przed modyfikacją systemów analitycznych.
- Występują problemy z jakością danych, więc konieczna jest analiza przyczyn.
- Użytkownik chce wykonać jednorazową ocenę zbioru danych przed dalszą analizą.

# 💡 Przykład zastosowania

```python
# Profilowanie danych z Pandas
import pandas as pd
import pandas_profiling

df = pd.read_csv('clients.csv')
profile = pandas_profiling.ProfileReport(df, title="Profil danych klientów", explorative=True)
profile.to_file("clients_profile.html")
```

W systemach klasy enterprise (np. Ataccama ONE):

1. Użytkownik wybiera tabelę 'orders'.
2. Włącza funkcję „Full Profiling”.
3. System pokazuje: 5% nulli w kolumnie `city`, 3 dominujące wartości w `status`, format rozpoznany jako kod pocztowy.

# 📌 Źródła

- [https://docs.ataccama.com/](https://docs.ataccama.com/)
- [https://learn.microsoft.com/en-us/fabric/data/profiling-overview](https://learn.microsoft.com/en-us/fabric/data/profiling-overview)
- [https://www.collibra.com/us/en/data-quality/data-profiling](https://www.collibra.com/us/en/data-quality/data-profiling)
- [https://www.talend.com/resources/guide-to-data-profiling/](https://www.talend.com/resources/guide-to-data-profiling/)
- [https://www.dataedo.com/kb/data-glossary/what-is-data-profiling](https://www.dataedo.com/kb/data-glossary/what-is-data-profiling)

# 👽 Brudnopis

- Profilowanie ≠ walidacja: daje wgląd, ale nie orzeka poprawności
- Podstawa do reguł DQ, przypisania terminów, klasyfikacji danych
- Wspierane przez AI suggestion → wskazówki, które dane mogą zawierać PII, błędy, wartości techniczne
- Profilowanie głównym punktem startowym w Data Discover & Observability
- Profilowanie = analiza zdrowia danych zanim zostaną „produkcyjnie użyte”