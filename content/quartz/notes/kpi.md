---

title: Wskaźnik Kluczowej Wydajności (KPI)  
created: 2025-07-15  
status:  
category: Inżynieria danych  
difficulty: podstawowy  
language: pl  
tags:

- KPI
- miernik
- miara
- business intelligence
- efektywność  
aliases:
- kluczowy wskaźnik wydajności
- Key Performance Indicator

---

# 🎯 Definicja

**Wskaźnik Kluczowej Wydajności (KPI, ang. Key Performance Indicator)** to ilościowy miernik służący do oceny realizacji kluczowych celów organizacji, projektu, zespołu lub konkretnej inicjatywy. KPI są najczęściej stosowane w zarządzaniu efektywnością biznesową — pozwalają na szybkie określenie, czy działania przynoszą zakładane rezultaty.

# 🔑 Kluczowe punkty

- KPI to [[miara]] sukcesu — monitoruje postęp wobec jasno ustalonych celów strategicznych lub operacyjnych.
- Są zawsze jednoznacznie zdefiniowane, wymierne i powiązane z określonym okresem czasu.
- Wspierają podejmowanie decyzji i zarządzanie poprzez [[fakty]], bez subiektywnych interpretacji.
- Każdy KPI powinien być powiązany z właścicielem, częstotliwością pomiaru i docelową wartością (targetem).
- Rozróżnia się KPI biznesowe (np. wzrost przychodów, liczba nowych klientów) i techniczne (np. dostępność systemów, SLA).

# 📚 Szczegółowe wyjaśnienie

## Jak rozwijać i stosować KPI?

### Cechy dobrego KPI

- **Mierzalny** – wyrażony liczbowo, możliwy do regularnego pomiaru.
- **Osiągalny** – realistyczny do osiągnięcia dla ocenianej jednostki/zespołu.
- **Istotny** – ukierunkowany na kluczowe cele organizacji lub projektu.
- **Wyraźnie zdefiniowany** – posiada dokładną i niebudzącą wątpliwości metodę liczenia.
- **Czasowy** – oceniany w określonym horyzoncie (np. tygodniowo, miesięcznie, kwartalnie).

### Przykłady KPI

|Wskaźnik|Opis|Przykład formuły|
|---|---|---|
|Przychód miesięczny|Miesięczny wolumen sprzedaży|SUMA(przychód) / miesiąc|
|Net Promoter Score|Skłonność klientów do polecenia produktu|% promotorów - % krytyków|
|Uptime systemu (SLA)|Dostępność systemów IT w danym okresie|(czas online / czas całkowity) *100%|
|Konwersja użytkowników|Odsetek użytkowników wykonujących akcję docelową|(liczba konwersji / liczba użytkowników) *100%|
|Churn rate|Procent rezygnujących klientów w danym okresie|(liczba utraconych / liczba w bazie na początku okresu) *100%|

### KPI a [[miara]]

KPI to wyspecjalizowany przypadek **miary** — nie każda [[miara]] jest KPI, ale każdy KPI jest miarą. KPI kładą nacisk na wagę biznesową oraz ustalony docelowy poziom (target).

## Zastosowanie KPI w ekosystemie danych

- **[[Business Intelligence]] i raportowanie:** KPI stanowią podstawę dashboardów, raportów i systemów controllingowych.
- **Zarządzanie strategiczne:** Ułatwiają monitorowanie realizacji celów (np. celów rocznych, kwartalnych OKR).
- **Performance management:** Pozwalają na audyt efektywności zespołów, projektów, produktów.
- **Data Science & [[Uczenie Maszynowe|Machine Learning]]:** Często KPI są celem optymalizacji lub walidacji skuteczności modeli [[Uczenie Maszynowe|ML]].

# 💡 Przykład zastosowania

Firma SaaS definiuje „Churn Rate” oraz „Monthly Recurring Revenue (MRR)” jako KPI produktu. Zespół marketingu monitoruje ich zmiany tygodniowo na dashboardzie [[Business Intelligence|BI]]. Analiza trendu MRR wskazuje na skuteczność kolejnych kampanii, zaś wzrost churnu natychmiast uruchamia działania retention — dzięki czemu zarówno poziom sprzedaży, jak i lojalności klienta są pod stałą kontrolą.

## 📌 Źródła

- [What is KPI? – Tableau](https://www.tableau.com/learn/articles/kpi)
- [IBM: Key Performance Indicator (KPI)](https://www.ibm.com/topics/key-performance-indicators)
- [Investopedia – KPI](https://www.investopedia.com/terms/k/kpi.asp)

# 👽 Brudnopis

- KPI = wybrane miary biznesowe, kluczowe dla strategii/operacji
- Cechy: mierzalność, relewantność, regularny pomiar, jasna definicja, target/odpowiedzialność
- Przykłady: przychód, churn, NPS, uptime, ROI, konwersja, CAC, LTV
- Różnica [[miara]] vs KPI — nie wszystkie agregaty to KPI; KPI = nacisk na wpływ na cel
- Biznes (zarząd, liderzy) monitoruje głównie KPI — ułatwia decyzje
- [[Inżynieria Danych|DataOps]], [[Business Intelligence|BI]], [[Uczenie Maszynowe|ML]] — KPI jako cel/model optymalizacji oraz raportowania