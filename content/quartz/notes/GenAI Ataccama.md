---

title: GenAI Ataccama  
created: 2025-04-04  
status:  
category: AI / data management  
difficulty: średni  
language: pl  
tags:

- generatywna AI
- Ataccama
- automatyzacja danych
- data quality
- AI assistant  
aliases:
- generatywna AI w Ataccama
- Ataccama GenAI
- GenAI capabilities

---

# 🎯 Definicja

**[[Generatywna Sztuczna Inteligencja|GenAI]] w Ataccama** ([[Generatywna Sztuczna Inteligencja|Generative AI]]) to zestaw funkcjonalności opartych na sztucznej inteligencji generatywnej, zintegrowanej z platformą Ataccama ONE, które mają na celu zwiększenie produktywności zespołów danych, automatyzację powtarzalnych zadań oraz wspomaganie użytkowników w analizie i zarządzaniu danymi.

Funkcje te opierają się na dużych modelach językowych ([[Base LLM|LLM]]) i odnoszą się do wykorzystania naturalnego języka oraz AI w generowaniu opisu danych, reguł jakości i interakcji z katalogiem danych.

# 🔑 Kluczowe punkty

- 🤖 Wspierana przez duże modele językowe ([[Base LLM|LLM]]) – umożliwia interakcję z danymi przez język naturalny.
- 📋 Automatyczne generowanie: opisów zasobów danych, reguł DQ, raportów jakości danych.
- 🔍 Inteligentna [[analiza danych]], [[Anomaly Detection|wykrywanie anomalii]], klasyfikacja danych (np. PII).
- 🧠 Asystent AI gotowy do odpowiadania na zapytania użytkowników w ramach katalogu danych.
- 🚀 Przyspiesza wdrażanie projektów i eliminuje manualną, powtarzalną pracę.

# 📚 Szczegółowe wyjaśnienie

## Kluczowe zastosowania [[Generatywna Sztuczna Inteligencja|GenAI]] w Ataccama

|Funkcja [[Generatywna Sztuczna Inteligencja\|GenAI]]|Opis|
|---|---|
|🎯 Klasyfikacja danych (Data Classification)|Automatyczne klasyfikowanie pól jako PII, NIP, numer konta itp.|
|📈 [[Anomaly Detection\|Wykrywanie anomalii]] ([[Anomaly Detection]])|[[Uczenie Maszynowe\|AI]] wykrywa anomalie wartości danych lub wzorców|
|🧬 Dopasowywanie danych (Data Matching)|[[Generatywna Sztuczna Inteligencja\|GenAI]] wspiera rozpoznawanie rekordów podobnych lub zduplikowanych|
|📝 Generowanie reguł jakości (Gen. [[Rules\|DQ rules]])|Można opisać regułę w języku naturalnym — AI tworzy definicję logiczną|
|🧾 Generowanie opisów (Gen. asset descriptions)|Tworzy automatyczne opisy tabel, kolumn, terminów słownika|
|🔍 Zapytania przy użyciu języka naturalnego|Wyszukiwanie danych/raportów/terminów na podstawie zapytań tekstowych|
|💬 AI Assistant|Chat z AI w katalogu – odpowiada na pytania, podpowiada, sugeruje dane|
|📊 AI-generated DQ [[reports]]|Tworzenie podsumowań jakości danych automatycznie przez AI|

## Problemy, które rozwiązuje [[Generatywna Sztuczna Inteligencja|GenAI]]

- 🤯 Brak zasobów: zespoły zarządzania danymi są często małe i przeciążone manualną pracą (często to < 0,1% załogi).
- 🐢 Wolne wdrożenia: pisanie manualnych reguł jakości i wzbogacanie metadanych zajmuje dużo czasu.
- 🔁 Powtarzalność: opisywanie pól, mapowanie terminów, tworzenie reguł od podstaw to czasochłonny obowiązek.
- 🎛️ Niska akceptacja użytkowników nietechnicznych – AI eliminuje barierę interfejsu przez dialog językowy.

## Jak działa?

- Funkcjonalności [[Generatywna Sztuczna Inteligencja|GenAI]] uruchamiane są w wybranych sekcjach platformy:
    - ✓ Na poziomie katalogu danych (items, columns)
    - ✓ W edytorze reguł DQ
    - ✓ W słowniku terminów (glossary)
    - ✓ W panelu Asystenta lub czatu
- Użytkownik może kliknąć: "Generate description" / "Ask AI" / "Build rule from plain text"
- AI analizuje kontekst techniczny i metadane, a następnie generuje treść lub logikę

# 💡 Przykład zastosowania

1. Użytkownik zaznacza kolumnę `email_address` w katalogu.
2. Wybiera „Generate description” – AI tworzy:  
    `"Adres e-mail klienta używany do komunikacji i uwierzytelniania w systemie CRM."`
3. Następnie pisze w edytorze DSL:  
    `"Zaznacz rekord jako błąd, jeśli adres e-mail nie zawiera znaku @ lub pochodzi z domeny testowej"`  
    → [[Generatywna Sztuczna Inteligencja|GenAI]] tworzy Syntax DSL i gotową do wdrożenia regułę jakości.

# 📌 Źródła

- [https://www.ataccama.com/blog/genai-powered-data-management-platform](https://www.ataccama.com/blog/genai-powered-data-management-platform)
- [https://docs.ataccama.com/](https://docs.ataccama.com/)
- [https://www.dataversity.net/the-promise-of-genai-in-data-governance/](https://www.dataversity.net/the-promise-of-genai-in-data-governance/)
- [https://www.oreilly.com/radar/genai-in-the-modern-data-stack/](https://www.oreilly.com/radar/genai-in-the-modern-data-stack/)

# 👽 Brudnopis

- [[Generatywna Sztuczna Inteligencja|GenAI]] ma ułatwić onboarding i korzystanie z Ataccamy nietechnicznym użytkownikom
- Wspierane elementy: reguły, katalog, glossary, monitoring (automat generuje DQ insight)
- Wersje AI są trenowane m.in. na strukturach DSL (Ataccama), nazwach pola + prompt użytkownika
- W przyszłości wsparcie dla feedback loop – AI uczy się, które generacje były przyjęte / odrzucone
- Zastosowania do przyszłości: self-healing workflows, rekomendacje lineage, opisywanie [[Analiza Danych|dashboards]]