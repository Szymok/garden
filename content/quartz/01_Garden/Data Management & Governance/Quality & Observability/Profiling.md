---

title: Profiling  
created: 2025-05-06  
status: 🌱 draft
category: data quality / data discovery  
difficulty: podstawowy  
language: pl  
tags:

- data profiling
- jakoÅ›Ä‡ danych
- metadane
- analiza danych
- data governance  
aliases:
- profilowanie danych
- profilowanie jakoÅ›ci danych
- profiling w katalogu danych

---

# ðŸŽ¯ Definicja

**Profiling ([[Data Profiling|profilowanie danych]])** to proces systematycznej analizy zawartoÅ›ci zbioru danych w celu uzyskania informacji o ich strukturze, jakoÅ›ci, rozkÅ‚adzie wartoÅ›ci i innych wÅ‚aÅ›ciwoÅ›ciach. Profilowanie pomaga uÅ¼ytkownikom lepiej zrozumieÄ‡ dane, wykrywaÄ‡ nieprawidÅ‚owoÅ›ci i przygotowaÄ‡ siÄ™ do dalszej transformacji, wzbogacania, walidacji lub udostÄ™pniania danych.

# ðŸ”‘ Kluczowe punkty

- ðŸ“Œ Profilowanie to pierwszy krok w procesach zarzÄ…dzania jakoÅ›ciÄ… i odkrywania danych (data discovery).
- ðŸ”Ž UmoÅ¼liwia zrozumienie struktury danych, takich jak liczba kolumn, ich typy, zakresy oraz wystÄ™powanie brakÃ³w (NULL).
- ðŸ§  SÅ‚uÅ¼y jako podstawa do automatyzowanego przypisania terminÃ³w biznesowych, reguÅ‚ jakoÅ›ci i klasyfikatorÃ³w danych.
- ðŸ”„ MoÅ¼e byÄ‡ wykonywane rÄ™cznie ([[Manual Profiling]]) lub automatycznie (profilowanie cykliczne).
- ðŸ“ˆ Wyniki profilowania prezentowane sÄ… w formie statystyk, wizualizacji, wykresÃ³w i metadanych analitycznych.

# ðŸ“š SzczegÃ³Å‚owe wyjaÅ›nienie

Profilowanie jest niezbÄ™dne do efektywnego zarzÄ…dzania danymi na poziomie:

- strukturalnym (np. typ danych, dÅ‚ugoÅ›ci, schematy),
- statystycznym (np. minimum, maksimum, dominujÄ…ce wartoÅ›ci, procent brakÃ³w),
- jakoÅ›ciowym (np. procent niepoprawnych formatÃ³w, niespÃ³jnoÅ›ci w danych).

W narzÄ™dziach takich jak Ataccama ONE, Collibra czy Microsoft Purview, wyniki profilowania sÄ… zapisywane jako metadane i zasilajÄ… inne moduÅ‚y:

- [[Data Catalog|katalog danych]] ([[Data Catalog]]),
- sÅ‚ownik pojÄ™Ä‡ (Glossary),
- reguÅ‚y jakoÅ›ciowe (Data Quality [[Rules]]),
- alerty i [[Data Observability|obserwowalnoÅ›Ä‡ danych]] ([[Data Observability]]),
- przypisania terminÃ³w (Glossary Term Detection).

## Typowe metryki generowane podczas profilowania

|Metryka|Opis|
|---|---|
|Null rate|Procent pustych (brakujÄ…cych) wartoÅ›ci|
|Value uniqueness|Liczba unikalnych wartoÅ›ci w kolumnie|
|Minimum/Maximum|WartoÅ›ci skrajne|
|Top values|NajczÄ™Å›ciej wystÄ™pujÄ…ce wartoÅ›ci|
|Pattern frequency|NajczÄ™stsze wzorce danych (np. formatÃ³w e-mail, ZIP, numery)|
|Value length|DÅ‚ugoÅ›ci tekstÃ³w/liczb|
|Data type consistency|SpÃ³jnoÅ›Ä‡ typu danych (czy wszystkie wartoÅ›ci majÄ… zadany typ)|

# ðŸ’¡ PrzykÅ‚ad zastosowania

Firma planuje wÅ‚Ä…czyÄ‡ nowe [[Data Source|ÅºrÃ³dÅ‚o danych]] z tabelÄ… `klienci_raw`.

- ZespÃ³Å‚ danych uruchamia **profilowanie tej tabeli** w narzÄ™dziu Ataccama ONE.
- Profilowanie wykazuje:
    - Kolumna `email` ma 12% brakÃ³w (null rate).
    - Kolumna `nip` zawiera 3 wzorce â€“ dwie wersje rozdzielane myÅ›lnikami i jedna bez.
    - Kolumna `klient_id` zawiera liczby z ujemnymi wartoÅ›ciami â†’ potencjalna anomalia.

Na podstawie tych wynikÃ³w:

- przypisano termin sÅ‚ownikowy `Customer Email`,
- powiÄ…zano z reguÅ‚Ä… jakoÅ›ci "email must be valid format",
- zadecydowano o oczyszczeniu rekordÃ³w z `nip` przed joinem z innym systemem.

# ðŸ“Œ Å¹rÃ³dÅ‚a

- [https://docs.ataccama.com/](https://docs.ataccama.com/)
- [https://learn.microsoft.com/en-us/fabric/data/profiling-overview](https://learn.microsoft.com/en-us/fabric/data/profiling-overview)
- [https://help.collibra.com/docs/collibra/latest/Data_Profiling](https://help.collibra.com/docs/collibra/latest/Data_Profiling)
- [https://www.talend.com/resources/guide-to-data-profiling/](https://www.talend.com/resources/guide-to-data-profiling/)
- [https://www.dataversity.net/benefits-of-data-profiling-techniques/](https://www.dataversity.net/benefits-of-data-profiling-techniques/)

# ðŸ‘½ Brudnopis

- Profilowanie = narzÄ™dzie eksploracji, walidacji i standaryzacji danych
- Najlepiej uruchamiaÄ‡ na surowym ÅºrÃ³dle lub staging â€“ pomaga zrozumieÄ‡ dane przed ich przetworzeniem
- W nowoczesnych narzÄ™dziach â€“ wyniki profilowania stajÄ… siÄ™ metadanymi uÅ¼ywanymi w downstream (DQ, glossary mapping, observability)
- Przy automatycznej analizie profili moÅ¼na wykrywaÄ‡ anomalie, np. nagÅ‚y spadek row_count, spike w null rate, schema drift
- Profilowanie = start caÅ‚ego â€ždata intelligence lifecycleâ€