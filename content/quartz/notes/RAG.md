---

title: RAG  
created: 2025-07-16  
status: Final  
category: LLM  
difficulty: średniozaawansowany  
language: pl  
tags:

- AI
- Sztuczna-Inteligencja  
aliases:
- Retrieval-Augmented Generation
- RAG

---

# 🎯 Definicja

**RAG (Retrieval-Augmented Generation)** to strategia łączenia dużych modeli językowych (LLM) z własnymi, najnowszymi, często prywatnymi zbiorami danych, bez potrzeby dalszego trenowania modelu. RAG rozszerza możliwości LLM, które zostały zatrzymane na wybranym punkcie w czasie (np. GPT-4 do 2021 roku), pozwalając na dynamiczne „zasilanie” modeli aktualną wiedzą oraz eliminację efektu tzw. halucynacji.

# 🔑 Kluczowe punkty

- RAG umożliwia **aktualizowanie wiedzy modelu LLM na bieżąco** poprzez dynamiczne podłączanie nowych danych – bez kosztownego retreningu.
- Pozwala na **integrację z prywatnymi, firmowymi lub niestandardowymi dokumentami** – model korzysta z wiedzy niedostępnej w pierwotnym zestawie treningowym.
- Efektywnie **zmniejsza ryzyko halucynacji**, ponieważ odpowiedzi opierają się na rzeczywistych danych, do których model ma dostęp podczas generowania tekstu.
- Wykorzystuje **bazę wektorową** do przechowywania embeddingów (osadzeń) dokumentów i skutecznego wyszukiwania podobieństw semantycznych.
- RAG można traktować jako zaawansowaną formę in-context learning — model podczas generacji korzysta z załączonych, odnalezionych fragmentów wiedzy.

# 📚 Szczegółowe wyjaśnienie

## Jak działa RAG w praktyce?

1. **Przygotowanie dokumentów**:  
    Teksty (dokumenty, notatki, artykuły) są dzielone na fragmenty i zamieniane na wektory (embeddingi) przez model embeddingowy.
    
2. **Baza wektorowa**:  
    Osadzenia dokumentów trafiają do wektorowej bazy danych (np. Pinecone, Faiss, Milvus), która optymalizuje szybkie wyszukiwanie po podobieństwie semantycznym.
    
3. **Zapytanie użytkownika**:  
    Gdy użytkownik zadaje pytanie, zapytanie również zostaje przekształcone na embedding. Baza wektorowa zwraca najbardziej podobne fragmenty.
    
4. **Generowanie odpowiedzi**:  
    Odpowiadające fragmenty dołączane są jako „kontekst” (in-context) do promptu dla LLM. Model generuje odpowiedź, opierając się nie tylko na własnej wiedzy, ale i na znalezionych, aktualnych danych.
    

## Struktura RAG

|Etap|Narzędzie/Komponent|Funkcja|
|---|---|---|
|Embedding|Model zamiany tekstu na wektory|Zamiana tekstu na embeddingi|
|Wektoryzacja|Baza wektorowa (np. Faiss)|Przechowanie i szybkie wyszukiwanie|
|Retrieval|Algorytmy wyszukiwania podobieństwa|Pobierz fragmenty powiązane z zapytaniem|
|Generacja|LLM (np. OpenAI GPT-4)|Odpowiedz, korzystając z retrieval context|

## Zalety RAG

- **Bezpieczeństwo i prywatność:** Wiedza może pochodzić wyłącznie z własnych, kontrolowanych źródeł bez naruszania bezpieczeństwa danych.
- **Aktualność wiedzy:** Odpowiedzi mogą opierać się na najnowszych dokumentach czy nawet bieżących wydarzeniach — bez przebudowywania i trenowania modelu.
- **Elastyczność integracji:** Można podłączyć pliki PDF, bazy wiedzy, wiedzę domenową, dokumentację itd.
- **Optymalizacja kosztów:** Skalowanie systemu odbywa się poprzez rozbudowę bazy wiedzy, nie retrening LLM.

# 💡 Przykład zastosowania

W firmie konsultingowej wdrożono aplikację RAG do wsparcia pracowników w obsłudze klienta. Pracownicy wpisują pytania o polityki wewnętrzne lub instrukcje — system przeszukuje aktualne FAQ, wyciągi z regulaminów i bieżące dokumenty prawne. Odpowiedź LLM bazuje na rzeczywistych fragmentach źródłowych — co minimalizuje ryzyko halucynacji i gwarantuje aktualność.

## 📌 Źródła

- Jak połączyć AI z własnymi danymi? RAG w praktyce! (demo, wyjaśnienia, wyzwania wdrożeniowe): [https://youtu.be/_VHKdKvZgFo](https://youtu.be/_VHKdKvZgFo)
- Pinecone – What is Retrieval Augmented Generation?: [https://www.pinecone.io/learn/retrieval-augmented-generation/](https://www.pinecone.io/learn/retrieval-augmented-generation/)
- OpenAI Cookbook – Retrieval-Augmented Generation with GPT-3: [https://github.com/openai/openai-cookbook/blob/main/examples/Retrieval_augmentation_for_QA.ipynb](https://github.com/openai/openai-cookbook/blob/main/examples/Retrieval_augmentation_for_QA.ipynb)

## 👽 Brudnopis

- Rozwiązanie ograniczenia data cutoff – RAG = dynamiczna doklejka kontekstu, nie retrenowanie.
- Kluczowe wyzwania: chunking (dzielenie dokumentów), jakość embeddingów, dobór typu bazy wektorowej (Faiss/Milvus/Pinecone etc).
- Typowe użycia: chatboty na firmowych danych, automaty QA, dokumentacja live, asystent inbound.
- Przykład: pytanie → embedding → query do wektorowej → doc context → prompt do LLM → odpowiedź oparta na własnych dokumentach.
- RAG ≈ in-context learning + retrieval.
- Redukcja halucynacji (model cytuje tylko rzeczywistą wiedzę).