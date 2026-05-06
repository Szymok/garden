---

title: Skierowany Graf Acykliczny (DAG - Directed Acyclic Graph)  
created: 2025-07-15  
status: 🌱 draft
category: InÅ¼ynieria danych  
difficulty: podstawowy  
language: pl  
tags:

- inÅ¼ynieria danych
- DAG
- grafy
- orkiestracja danych
- lineage  
aliases:
- DAG
- Directed Acyclic Graph
- Graf acykliczny

---

# ðŸŽ¯ Definicja

**Skierowany Graf Acykliczny (DAG, ang. Directed Acyclic Graph)** to [[Strukturyzacja danych|struktura danych]] skÅ‚adajÄ…ca siÄ™ z zestawu wierzchoÅ‚kÃ³w (wÄ™zÅ‚Ã³w) i skierowanych krawÄ™dzi miÄ™dzy nimi, przy czym graf nie zawiera Å¼adnych cykli â€” nie da siÄ™ wrÃ³ciÄ‡ do punktu wyjÅ›cia przez seriÄ™ poÅ‚Ä…czeÅ„. DAG umoÅ¼liwia jednoznaczne uporzÄ…dkowanie zadaÅ„ lub zaleÅ¼noÅ›ci w przetwarzaniu danych, co czyni go idealnym do modelowania potokÃ³w danych i procesÃ³w transformacji.

# ðŸ”‘ Kluczowe punkty

- **Skierowany**: kaÅ¼da krawÄ™dÅº ma kierunek (od wÄ™zÅ‚a rodzica do dziecka).
- **Acykliczny**: brak moÅ¼liwoÅ›ci utworzenia pÄ™tli â€” nie moÅ¼na wrÃ³ciÄ‡ do tego samego wÄ™zÅ‚a.
- **KolejnoÅ›Ä‡ zaleÅ¼noÅ›ci**: Graf wyraÅ¼a zaleÅ¼noÅ›ci miÄ™dzy krokami procesu (np. ETL, transformacji danych).
- **[[IdempotentnoÅ›Ä‡|Idempotencja]] i retry**: dziÄ™ki strukturze DAG, moÅ¼liwe jest bezpieczne ponowne uruchamianie tylko wybranych fragmentÃ³w procesu.
- **Zastosowanie w Data Engineeringu â€” orkiestracja, lineage, obserwowalnoÅ›Ä‡.**

# ðŸ“š SzczegÃ³Å‚owe wyjaÅ›nienie

## Zastosowanie DAG w inÅ¼ynierii danych

W systemach takich jak **Apache [[Apache Airflow|Airflow]]**, **[[Dagster]]**, **Prefect** czy **[[dbt]]**, DAG reprezentuje potok przetwarzania danych:

- **WÄ™zeÅ‚ (node)**: oznacza krok w potoku (np. ekstrakcjÄ™, transformacjÄ™, agregacjÄ™).
- **KrawÄ™dÅº (edge)**: reprezentuje zaleÅ¼noÅ›Ä‡ â€” jeden krok musi zakoÅ„czyÄ‡ siÄ™ sukcesem, by drugi mÃ³gÅ‚ siÄ™ rozpoczÄ…Ä‡.
- **Flow danych**: DAG pozwala ustaliÄ‡, ktÃ³re zadania moÅ¼na uruchomiÄ‡ rÃ³wnolegle, a ktÃ³re muszÄ… nastÄ…piÄ‡ po sobie.

## Cechy funkcjonalne DAG

- **DeterministycznoÅ›Ä‡**: przy tych samych danych wejÅ›ciowych â€“ te same wyniki.
- **[[IdempotentnoÅ›Ä‡|Idempotencja]]**: kaÅ¼dy krok moÅ¼e byÄ‡ bezpiecznie uruchomiony wielokrotnie â€“ patrz: [[IdempotentnoÅ›Ä‡]].
- **Debuggowanie i retry**: w przypadku bÅ‚Ä™du moÅ¼na powtÃ³rzyÄ‡ tylko problematyczny krok, a nie caÅ‚y potok.
- **RozszerzalnoÅ›Ä‡**: Å‚atwo dodawaÄ‡ nowe wÄ™zÅ‚y i zaleÅ¼noÅ›ci bez przebudowy caÅ‚ego workflow.

## PrzykÅ‚adowe narzÄ™dzia wykorzystujÄ…ce DAG

|NarzÄ™dzie|Opis|
|---|---|
|**[[Apache Airflow]]**|Planowanie i zarzÄ…dzanie zÅ‚oÅ¼onymi pipelineâ€™ami danych|
|**[[Dagster]]**|PodejÅ›cie typu "[[Data Source\|data asset]]-oriented" z deklaratywnym API|
|**[[dbt]]**|[[Modelowanie Danych]] w SQL jako DAG transformacji|
|**Prefect**|Nowoczesna orkiestracja z retry, caching, task runnerami|

## PrzykÅ‚ad graficzny DAG

PrzykÅ‚adowy DAG potoku danych:

```
raw_data_ingest
       â†“
transform_clean_data
       â†“
aggregate_to_metrics
       â†“
publish_to_dashboard
```

KaÅ¼dy z tych krokÃ³w jest od siebie zaleÅ¼ny i moÅ¼e zostaÄ‡ uruchomiony tylko wtedy, gdy jego poprzednik zakoÅ„czy siÄ™ pomyÅ›lnie.

# ðŸ’¡ PrzykÅ‚ad zastosowania

W architekturze danych e-commerce, zespÃ³Å‚ buduje pipeline oparty o Apache Airflow, w ktÃ³rym:

- Task A: pobiera dane zamÃ³wieÅ„ z API (`extract_orders`)
- Task B: oczyszcza dane (`clean_orders`)
- Task C: agreguje dane dzienne (`agg_daily_orders`)
- Task D: publikuje dane do Tableau (`update_dashboard`)

Wszystkie kroki sÄ… modelowane jako DAG. JeÅ›li podczas agregacji (Task C) wystÄ…pi bÅ‚Ä…d, moÅ¼na ponownie uruchomiÄ‡ tylko ten krok â€” nie trzeba uruchamiaÄ‡ ekstrakcji ani integracji z Tableau. Struktura DAG pozwala rÃ³wnieÅ¼ na analizÄ™ pochodzenia danych (_data lineage_) i automatyczne planowanie przetwarzania (np. codzienna aktualizacja).

## ðŸ“Œ Å¹rÃ³dÅ‚a

- [Airflow DAG Concepts](https://airflow.apache.org/docs/apache-airflow/stable/core-concepts/dags.html)
- [Dagster â€” Asset Graphs and Lineage](https://docs.dagster.io/concepts/assets)
- [dbt Docs â€” DAG](https://docs.getdbt.com/docs/build/building-models/graph-overview)
- [Wikipedia: Directed Acyclic Graph](https://en.wikipedia.org/wiki/Directed_acyclic_graph)

# ðŸ‘½ Brudnopis

- DAG: Directed â†’ kaÅ¼de poÅ‚Ä…czenie ma kierunek
- Acykliczny â†’ brak cykli, nie ma pÄ™tli
- DAG â‰  drzewo â€” mogÄ… byÄ‡ wierzchoÅ‚ki z wieloma parentami
- Istotne w przetwarzaniu danych, [[Business Intelligence|BI]], orkiestracji
- Struktura bazowa np. w [[dbt]]: kaÅ¼dy model SQL to wÄ™zeÅ‚ DAG
- Retry, flow control, impact analysis, parallelism â†’ wszystko dostÄ™pne dziÄ™ki DAG
- DAG = mapowanie zaleÅ¼noÅ›ci logicznych miÄ™dzy taskami â€“ nie wykres Å‚adowania danych