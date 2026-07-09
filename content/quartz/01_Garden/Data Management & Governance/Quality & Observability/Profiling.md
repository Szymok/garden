---

title: Profiling  
created: 2025-05-06  
status: 🌱 draft
category: data quality / data discovery  
difficulty: podstawowy  
language: pl  
tags:

- data profiling
- jakość danych
- metadane
- analiza danych
- data governance  
aliases:
- profilowanie danych
- profilowanie jakości danych
- profiling w katalogu danych

---

# 🎯 Definicja

**Profiling ([[Data Profiling|profilowanie danych]])** to proces systematycznej analizy zawartości zbioru danych w celu uzyskania informacji o ich strukturze, jakości, rozkładzie wartości i innych właściwościach. Profilowanie pomaga użytkownikom lepiej zrozumieć dane, wykrywać nieprawidłowości i przygotować się do dalszej transformacji, wzbogacania, walidacji lub udostępniania danych.

# 🔑 Kluczowe punkty

- 📌 Profilowanie to pierwszy krok w procesach zarządzania jakością i odkrywania danych (data discovery).
- 🔎 Umożliwia zrozumienie struktury danych, takich jak liczba kolumn, ich typy, zakresy oraz występowanie braków (NULL).
- 🧠 Służy jako podstawa do automatyzowanego przypisania terminów biznesowych, reguł jakości i klasyfikatorów danych.
- 🔄 Może być wykonywane ręcznie ([[Manual Profiling]]) lub automatycznie (profilowanie cykliczne).
- 📈 Wyniki profilowania prezentowane są w formie statystyk, wizualizacji, wykresów i metadanych analitycznych.

# 📚 Szczegółowe wyjaśnienie

Profilowanie jest niezbędne do efektywnego zarządzania danymi na poziomie:

- strukturalnym (np. typ danych, długości, schematy),
- statystycznym (np. minimum, maksimum, dominujące wartości, procent braków),
- jakościowym (np. procent niepoprawnych formatów, niespójności w danych).

W narzędziach takich jak Ataccama ONE, Collibra czy Microsoft Purview, wyniki profilowania są zapisywane jako metadane i zasilają inne moduły:

- [[Data Catalog|katalog danych]] ([[Data Catalog]]),
- słownik pojęć (Glossary),
- reguły jakościowe (Data Quality [[Rules]]),
- alerty i [[Data Observability|obserwowalność danych]] ([[Data Observability]]),
- przypisania terminów (Glossary Term Detection).

## Typowe metryki generowane podczas profilowania

|Metryka|Opis|
|---|---|
|Null rate|Procent pustych (brakujących) wartości|
|Value uniqueness|Liczba unikalnych wartości w kolumnie|
|Minimum/Maximum|Wartości skrajne|
|Top values|Najczęściej występujące wartości|
|Pattern frequency|Najczęstsze wzorce danych (np. formatów e-mail, ZIP, numery)|
|Value length|Długości tekstów/liczb|
|Data type consistency|Spójność typu danych (czy wszystkie wartości mają zadany typ)|

# 💡 Przykład zastosowania

Firma planuje włączyć nowe [[Data Source|źródło danych]] z tabelą `klienci_raw`.

- Zespół danych uruchamia **profilowanie tej tabeli** w narzędziu Ataccama ONE.
- Profilowanie wykazuje:
    - Kolumna `email` ma 12% braków (null rate).
    - Kolumna `nip` zawiera 3 wzorce – dwie wersje rozdzielane myślnikami i jedna bez.
    - Kolumna `klient_id` zawiera liczby z ujemnymi wartościami → potencjalna anomalia.

Na podstawie tych wyników:

- przypisano termin słownikowy `Customer Email`,
- powiązano z regułą jakości "email must be valid format",
- zadecydowano o oczyszczeniu rekordów z `nip` przed joinem z innym systemem.

# 📌 Źródła

- [https://docs.ataccama.com/](https://docs.ataccama.com/)
- [https://learn.microsoft.com/en-us/fabric/data/profiling-overview](https://learn.microsoft.com/en-us/fabric/data/profiling-overview)
- [https://help.collibra.com/docs/collibra/latest/Data_Profiling](https://help.collibra.com/docs/collibra/latest/Data_Profiling)
- [https://www.talend.com/resources/guide-to-data-profiling/](https://www.talend.com/resources/guide-to-data-profiling/)
- [https://www.dataversity.net/benefits-of-data-profiling-techniques/](https://www.dataversity.net/benefits-of-data-profiling-techniques/)

# 👽 Brudnopis

- Profilowanie = narzędzie eksploracji, walidacji i standaryzacji danych
- Najlepiej uruchamiać na surowym źródle lub staging – pomaga zrozumieć dane przed ich przetworzeniem
- W nowoczesnych narzędziach – wyniki profilowania stają się metadanymi używanymi w downstream (DQ, glossary mapping, observability)
- Przy automatycznej analizie profili można wykrywać anomalie, np. nagły spadek row_count, spike w null rate, schema drift
- Profilowanie = start całego „data intelligence lifecycle”