---
title: Podpinanie Dokumentów do AI (Large Context)
created: 2026-02-04
status: evergreen
category: LLM / RAG
difficulty: intermediate
language: pl
tags:
  - context-window
  - chunking
  - rag
  - prompting
aliases:
  - Długie dokumenty w AI
  - Context Management
  - Chunking Strategy
---
# 🎯 Definicja
Modele AI mają **okno kontekstowe** (np. GPT-4: 128k tokenów, Claude 3: 200k+). Jeśli Twój dokument jest większy lub chcesz zaoszczędzić pieniądze, musisz użyć technik takich jak **Chunking** (dzielenie) lub **RAG** (wyszukiwanie), aby "podpiąć" dokument do modelu.

# 🔑 Kluczowe punkty
1.  **Context Window:** Limit pamięci modelu. Przekroczenie go ucina tekst lub powoduje błędy (Lost in the Middle).
2.  **Chunking:** Dzielenie tekstu na kawałki (np. po 1000 słów).
3.  **RAG:** Wyszukiwanie tylko potrzebnych fragmentów w bazie wektorowej i wysyłanie ich do modelu.

# 📚 Szczegółowe wyjaśnienie
Metody pracy z dużymi plikami:
1.  **Stuffing (Na chama):** Wklejasz cały tekst do promptu. Działa, jeśli tekst mieści się w limicie. Drogie.
2.  **Map-Reduce:** Dzielisz tekst na 5 części. Model streszcza każdą z osobna (Map). Potem model skleja 5 streszczeń w jedno (Reduce).
3.  **Refine:** Model czyta pierwszą część i robi notatkę. Potem czyta drugą część i aktualizuje notatkę... aż do końca.
4.  **RAG (Retrieval Augmented Generation):** Najlepsze do "rozmowy z dokumentacją".

# 💡 Przykład zastosowania
Masz ustawę podatkową (500 stron). Pytasz: "Jaka jest stawka VAT na pączki?".
- **Bez RAG:** Model zgaduje (halucynuje).
- **Z RAG:** System szuka słów "VAT", "stawka", "pączki" w ustawie. Znajduje "Art. 45 par. 3". Wysyła do ChatGPT tylko ten jeden paragraf. ChatGPT odpowiada precyzyjnie.

## 📌 Źródła
- LangChain Documentation - Document Loaders & Splitters.

## 👽 Brudnopis
- Pamiętaj: Im więcej "śmieci" w kontekście, tym głupszy model (Attention Dilution). Lepiej podać 3 precyzyjne strony niż 100 stron "na wszelki wypadek".