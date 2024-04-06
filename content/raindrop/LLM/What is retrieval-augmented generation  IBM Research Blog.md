---
raindrop_id: 677262034

---

# Metadata
Source URL:: https://research.ibm.com/blog/retrieval-augmented-generation-RAG
Topics:: #rag

---
# What is retrieval-augmented generation? | IBM Research Blog

RAG is an AI framework for retrieving facts to ground LLMs on the most accurate information and to give users insight into AI’s decisionmaking process.

## Highlights
## Note

Oto podsumowanie strony:

- **RAG - ramka AI do uzupełniania wiedzy LLM**: RAG (retrieval-augmented generation) to ramka AI, która pozwala dużym modelom językowym (LLM) na korzystanie z zewnętrznych źródeł wiedzy, aby poprawić jakość generowanych odpowiedzi i dać użytkownikom wgląd w proces decyzyjny AI¹[1]²[2].
- **Korzyści z RAG**: RAG zapewnia, że model ma dostęp do najbardziej aktualnych i wiarygodnych faktów, a użytkownicy mają dostęp do źródeł modelu, co zwiększa zaufanie do jego twierdzeń. RAG również zmniejsza ryzyko wycieku wrażliwych danych lub &quot;halucynacji&quot; nieprawidłowych lub wprowadzających w błąd informacji przez model. Ponadto RAG zmniejsza potrzebę ciągłego szkolenia modelu na nowych danych i aktualizowania jego parametrów wraz ze zmianą okoliczności.
- **Jak działa RAG**: RAG składa się z dwóch faz: pobierania i generowania treści. W fazie pobierania algorytmy wyszukują i pobierają fragmenty informacji związane z zapytaniem lub pytaniem użytkownika. W fazie generowania LLM wykorzystuje wzbogacone zapytanie i swoją wewnętrzną reprezentację danych treningowych, aby wygenerować angażującą odpowiedź dostosowaną do użytkownika.
- **Zastosowania i wyzwania RAG**: RAG jest obecnie najlepiej znanym narzędziem do ugruntowania LLM na najnowszych, weryfikowalnych informacjach i obniżenia kosztów ciągłego szkolenia i aktualizacji. RAG jest wykorzystywany przez IBM do ulepszania swoich wewnętrznych chatbotów obsługi klienta opartych na treści, która może być sprawdzona i zaufana³[3]. RAG ma jednak swoje ograniczenia i wiele ciekawych wyzwań pozostaje w uzyskaniu optymalnych efektów.