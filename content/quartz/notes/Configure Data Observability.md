---

title: Configure Data Observability  
created: 2025-05-21  
status:  
category: monitoring danych  
difficulty: średni  
language: pl  
tags:

- data observability
- monitoring
- jakość danych
- konfiguracja
- inżynieria danych  
aliases:
- konfiguracja obserwowalności danych
- ustawienia data observability
- setup data observability

---

# 🎯 Definicja

**[[Data Observability]]** to zdolność systemu do automatycznego monitorowania stanu, jakości i ruchu danych w całym ekosystemie danych. Konfiguracja [[Data Observability]] polega na ustawieniu reguł, metryk i powiadomień dotyczących informacji, które mają być obserwowane oraz tego, jak często i w jakiej formie użytkownik ma być informowany o ewentualnych problemach z danymi.

# 🔑 Kluczowe punkty

- 📦 Obsługuje zarówno konfigurację podstawową (monitorowanie podstawowych metryk), jak i zaawansowaną (niestandardowe reguły, alerty, cykle harmonogramu).
- 🧩 Wymaga wykrycia i rozpoznania źródeł danych (discovery), zanim możliwa będzie konfiguracja.
- 🔔 Powiadomienia mogą obejmować: brakujące dane, anomalie w rozmiarze, błędy schematowe, regresję jakości itp.
- ⚙️ Możesz tworzyć i edytować konfigurację dla każdego źródła danych indywidualnie.
- 📊 Umożliwia obserwację na poziomie źródła, tabeli, kolumny lub metryki.

# 📚 Szczegółowe wyjaśnienie

## Jak skonfigurować [[Data Observability]]?

Po zakończeniu procesu Data Discovery w wybranym źródle (np. baza danych, plik, jezioro danych):

### 1. Konfiguracja nowej obserwowalności

1. Przejdź do zakładki **[[Data Observability]]** w widoku źródła danych.
2. Kliknij ikonę ⚙️ (Ustawienia) → Nowa konfiguracja.
3. Wybierz zakres obserwacji: całość, konkretne tabele, kolumny lub metryki.
4. Ustaw częstotliwość (np. codziennie, co godzinę).
5. Wybierz sposób powiadomień (np. email, Slack, webhook).

### 2. Edycja istniejącej konfiguracji

1. Otwórz [[Data Source|źródło danych]] > zakładka **[[Data Observability]]**.
2. Kliknij ikonę ustawień lub użyj menu z trzema kropkami `⋮` przy istniejącej konfiguracji.
3. Zmień harmonogram, zakres danych lub aktywuj dodatkowe alerty.

### 3. Przykładowe metryki do monitorowania

|Typ metryki|Opis|
|---|---|
|Null Rate|Procent brakujących wartości w kolumnie|
|Row Count|Liczba wierszy względem ostatnich synchronizacji|
|Freshness|Jak aktualne są dane (timestamp vs. czas systemowy)|
|Schema Drift|Wykrycie zmian w schemacie danych (dodanie/usunięcie kolumn)|
|Value Distribution|Detekcja nietypowych wartości (outliers, pattern break, bias)|

## Tryby konfiguracji

- **Podstawowa (Basic):** szybkie ustawienia dla kluczowych metryk, bez pisania reguł.
- **Zaawansowana (Advanced):** niestandardowe formuły, połączenia z DQ Engine lub integracja z regułami DQ platform (np. Ataccama DQ, Soda SQL, [[dbt]] tests).

# 💡 Przykład zastosowania

```python
# Pseudokod konfiguracji harmonogramu obserwowalności dla tabeli zamówienia
observe_table(
  source='Snowflake',
  table='orders',
  metrics=['row_count', 'null_rate', 'freshness'],
  schedule='daily',
  alert_channels=['slack_webhook', 'email'],
  threshold_rules={
    'row_count_change': '>10%',
    'null_rate': '<= 1%',
    'freshness_max': '1 day'
  }
)
```

W tym przykładzie konfigurujemy system do monitorowania trzech metryk codziennie. W razie odchyleń – system generuje alerty.

# 📌 Źródła

- [https://docs.ataccama.com/](https://docs.ataccama.com/)
- [https://docs.montecarlodata.com/](https://docs.montecarlodata.com/)
- [https://www.soda.io/](https://www.soda.io/)
- [https://docs.metaplane.dev/](https://docs.metaplane.dev/)
- [https://airbyte.com/blog/data-observability-trends](https://airbyte.com/blog/data-observability-trends)
- [https://towardsdatascience.com/data-observability-a-crash-course-5d3ecfa76e2e](https://towardsdatascience.com/data-observability-a-crash-course-5d3ecfa76e2e)

# 👽 Brudnopis

- „Observe what matters” – nie wszystko trzeba monitorować, tylko krytyczne dane
- lifecycle = discovery → configure → run → alert → feedback
- Wyzwalacze czasowe vs. zdarzeniowe
- Integracje: [[Apache Airflow|Airflow]]/Prefect → trigger if issue, [[dbt]] → execute test + alert
- [[Inżynieria Danych|DataOps]]: observability + lineage + testing = pełen [[Data Observability|monitoring jakości danych]]