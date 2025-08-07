---

title: "Pełna synchronizacja odświeżania"  
created: 2025-07-16  
status: Final  
category: Synchronizacja danych  
difficulty: podstawowy  
language: pl  
tags:

- airbyte
- synchronizacja
- full refresh  
aliases:
- pełne odświeżenie danych
- full refresh sync

---

# 🎯 Definicja

**Pełna synchronizacja odświeżania (Full Refresh Sync)** to tryb synchronizacji w systemach integracji danych (np. Airbyte), w którym przy każdym uruchomieniu zaciągane są **wszystkie dane** ze źródła, niezależnie od tego, czy zostały już wcześniej zsynchronizowane. Jest to prosta, ale kosztowna metoda zachowywania spójności danych pomiędzy źródłem a celem.

# 🔑 Kluczowe punkty

- Pobierane i przesyłane są **pełne zbiory danych** – za każdym razem od zera.
- Występują dwa tryby zachowania w celu:
    - **Nadpisanie (Overwrite)** – usuwa dane docelowe przed załadunkiem nowych
    - **Dołączanie (Append)** – dołącza dane bez usuwania poprzednich rekordów
- Nie wymaga pola kursora (`cursor field`) ani logiki identyfikacji zmian.
- Obciąża systemy źródłowe i sieć – zwłaszcza przy dużych wolumenach danych.
- Sprawdza się w systemach zawierających małe tabele lub w przypadku trudności w detekcji zmian.

# 📚 Szczegółowe wyjaśnienie

## Tryby Full Refresh

|Tryb|Zachowanie|
|---|---|
|**Overwrite**|Usuwa istniejące dane docelowe przed załadowaniem nowych zasobów|
|**Append**|Dołącza nowy zrzut danych do istniejącego zestawu rekordów, bez kasowania|

### Overwrite

- Tworzy dokładne lustrzane odbicie źródła.
- Pozwala odzwierciedlać również **usunięcia** danych.
- Bezpieczeństwo: aktualne, spójne dane, brak duplikatów.
- Wadą jest **utrata historii** i wydajność (przepisywanie wszystkiego).

### Append

- Każda synchronizacja dodaje komplet rekordów.
- Może prowadzić do **duplikowania danych** przy braku kontroli.
- Używane, gdy zależy nam na zachowaniu historii lub śledzeniu zmian.
- Wymaga dodatkowej logiki deduplikacji po stronie celu.

## Wady i zalety podejścia

|Zalety|Wady|
|---|---|
|Prosta konfiguracja|Wysokie zużycie API/źródła i przepustowości|
|Nie wymaga pola typu `timestamp`|Powielanie danych (Append) lub nadpisywanie (Overwrite)|
|Gwarantuje spójność z systemem źródłowym|Niska efektywność dla dużych tabel|

# 💡 Przykład zastosowania

W przypadku API dostawcy reklam, które nie udostępnia znacznika `updated_at`, Airbyte używa pełnej synchronizacji z opcją **Overwrite** dla tabel takich jak `ads_config`. Dzięki temu hurtownia danych zawsze zawiera aktualny zestaw konfiguracji kampanii. Mniejsze tabele (<10 MB) nie powodują wizualnie dużego kosztu, a zapewniają pełne odświeżenie danych.

# 📌 Źródła

- [https://docs.airbyte.com/connections/sync-modes/](https://docs.airbyte.com/connections/sync-modes/)
- [https://airbyte.com/blog/full-refresh-vs-incremental-sync](https://airbyte.com/blog/full-refresh-vs-incremental-sync)
- [https://docs.airbyte.com/understanding-airbyte/sync-execution/](https://docs.airbyte.com/understanding-airbyte/sync-execution/)

## 👽 Brudnopis

- Full Refresh = brak „inteligencji różnicowej” → zawsze wszystko
- Append = trzeba deduplikować (np. `primary key`, `hash`, `generation`)
- Overwrite robi drop + insert, przydaje się tam, gdzie są delecje
- Generacja `_airbyte_generation_id` przy każdej synchronizacji
- Nieefektywne dla danych > 1M rekordów – przejdź na inkrementalne lub [[RAG]]
- Dobry fallback gdy nie działa tryb inkrementalny (brak kolumny timestamp lub ID)

---