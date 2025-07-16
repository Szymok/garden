---

title: Data Observability  
created: 2025-05-21  
status:  
category: monitoring danych  
difficulty: średni  
language: pl  
tags:

- data observability
- jakość danych
- monitoring
- anomaly detection
- data discovery  
aliases:
- obserwowalność danych
- monitoring jakości danych
- data observability ONE

---

# 🎯 Definicja

**Data Observability (obserwowalność danych)** to zdolność do aktywnego monitorowania, analizowania i diagnozowania stanu oraz jakości danych w organizacji na podstawie metadanych, anomalii, zmian schematów, opóźnień i innych sygnałów. Celem data observability jest wykrywanie problemów z danymi w czasie rzeczywistym oraz zrozumienie ich wpływu na procesy biznesowe i analityczne.

# 🔑 Kluczowe punkty

- 📊 Obejmuje monitorowanie jakości danych, wykrywanie anomalii oraz analizę zmian w schemacie i metadanych.
- 🤖 W nowoczesnych rozwiązaniach wspiera się algorytmami AI do detekcji odstępstw i automatycznego mapowania terminów biznesowych.
- 🔄 Ściśle powiązana z cyklem życia danych, katalogiem danych, słownikiem biznesowym i regułami jakości.
- 🔔 Umożliwia automatyczne powiadamianie o problemach oraz harmonogramowanie analiz diagnostycznych.
- 📈 Prezentuje wyniki na dashboardach, pokazując statystyki jakości, wskaźniki świeżości i zmiany w domenach biznesowych.

# 📚 Szczegółowe wyjaśnienie

## Składowe systemu Data Observability

1. **Monitoring jakości danych**
    
    - Analiza zgodności, kompletności, unikalności i rozkładów wartości.
    - Ustalanie reguł jakości (np. brak NULL, zakresy wartości, typy danych).
2. **Wykrywanie anomalii (AI-powered anomaly detection)**
    
    - Algorytmy uczące się „norm” danych i wykrywające odstępstwa (np. nagłe spadki wolumenu, skoki wartości).
3. **Zmiany w schematach (schema drift)**
    
    - Detektor zmian struktury danych, np. dodanie/zniesienie kolumny, zmiana typu pola.
    - W systemach takich jak Ataccama ONE – dotyczy tylko elementów katalogowanych bezpośrednio z baz danych (schema check nie działa na plikach ani VCI).
4. **Świeżość danych (data freshness)**
    
    - Jak aktualne są dane — opóźnienia w dostarczaniu vs. prognozowane SLA.
    - Detekcja danych przeterminowanych lub brakujących.
5. **Zmiany domen biznesowych i wykrywanie terminów**
    
    - System analizuje dane i wykrywa możliwe przypisania terminów biznesowych do atrybutów technicznych (np. przypisanie "Customer ID" do kolumny id_klienta).

## Jak działa Data Observability w Ataccama ONE

1. Proces **data discovery** analizuje dane i automatycznie sugeruje przypisanie terminów słownika do kolumn.
2. Użytkownik wybiera terminy biznesowe, które chce monitorować.
3. System automatycznie uruchamia metryki jakości, alerty i wykrywanie odchyleń.
4. Dzięki połączeniu z katalogiem i regułami DQ, możliwa jest dalsza analiza, konfiguracja powiadomień, a także współpraca z Data Stewardami.
5. Wyniki prezentowane są na **dashboardzie observability**, gdzie widać problemy, historię synchronizacji i statystyki wskaźników.

## Metadane śledzone w procesie observability

|Komponent|Typ|
|---|---|
|Data Quality|Completeness, Uniqueness, Consistency, Conformity|
|Anomalie|Skoki w ilości danych, brak danych, nagłe zmiany wartości|
|Schema Changes|Dodane/usunięte kolumny, zmieniony typ danych|
|Freshness|Spóźniona aktualność względem oczekiwanej stopy dopływu|

# 💡 Przykład zastosowania

W dziale finansowym dane sprzedażowe zbierane są codziennie do hurtowni Snowflake. Włączenie Data Observability w Ataccama ONE umożliwia:

- automatyczne monitorowanie pojawiania się rekordów w krytycznej tabeli fakt_sprzedaży,
- powiadomienie, gdy wartości „kwota” nagle spadną poniżej normalnego poziomu,
- wykrycie, że kolumna „region” znikła po zmianie schematu upstream,
- przypisanie terminu biznesowego „Transaction Amount”, co powoduje uruchomienie odpowiedniej reguły DQ.

Wszystko to widoczne w dashboardzie, z możliwością szybkiego zgłoszenia problemu stewardowi lub zespołowi integracyjnemu.

# 📌 Źródła

- [https://docs.ataccama.com/](https://docs.ataccama.com/)
- [https://airbyte.com/blog/data-observability-trends](https://airbyte.com/blog/data-observability-trends)
- [https://www.montecarlodata.com/docs/](https://www.montecarlodata.com/docs/)
- [https://docs.metaplane.dev/](https://docs.metaplane.dev/)
- [https://towardsdatascience.com/data-observability-a-crash-course-5d3ecfa76e2e](https://towardsdatascience.com/data-observability-a-crash-course-5d3ecfa76e2e)

# 👽 Brudnopis

- observability = jakość + detekcja + lineage + alerty
- must-have w modern data stack, DataOps, federacji danych i lakehouse
- powiązanie z Data Discovery + SLA logiczne – które zestawy są stale wykorzystywane i potrzebują poziomu usług
- AI-powered = autowykrywanie terminów, metryk, anomalii
- przyszłość = samonaprawiające się pipeline’y z feedback loop z observability