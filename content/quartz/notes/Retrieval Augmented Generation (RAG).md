---
title: Retrieval Augmented Generation (RAG)
tags:
  - RAG
  - bazy-danych
  - AI
  - Sztuczna-Inteligencja
aliases:
  - RAG
---
Modele językowe ogólnego przeznaczenia [LLM](LLM) można precyzyjnie dostroić, aby osiągnąć kilka typowych zadań, takich jak analiza sentymentow i rozpoznawanie nazwanych jednostek. Zadania te zazwyczaj nie wymagają dodatkowej wiedzy w tle.![[images/Pasted image 20231217201834.png]]

W przypadku bardziej złożonych i wymagających wiedzy zadań możliwe jest zbudowanie systemu opartego na modelu językowym, który uzyskuje dostęp do zewnętrznych źródeł wiedzy w celu wykonania zadań. Zapewnia to większą spójność faktów, poprawia wiarygodność generowanych odpowiedzi i pomaga złagodzić problem "[halucynacji](Halucynacje)".

Badacze Meta AI wprowadzili metodę zwaną Retrieval Augmented Generation (RAG)[Retrieval Augmented Generation (RAG) (opens in a new tab)](https://ai.facebook.com/blog/retrieval-augmented-generation-streamlining-the-creation-of-intelligent-natural-language-processing-models/), aby zająć się takimi zadaniami wymagającymi dużej wiedzy. RAG łączy w sobie komponent wyszukiwania informacji z modelem generowania tekstu. RAG może być precyzyjnie dostrojony, a jego wewnętrzna wiedza może być modyfikowana w efektywny sposób i bez konieczności ponownego szkolenia całego modelu.

RAG pobiera dane wejściowe i pobiera zestaw odpowiednich / wspierających dokumentów, biorąc pod uwagę źródło (np. Wikipedię). Dokumenty są łączone jako kontekst z oryginalnym promptem wejściowym i podawane do generatora tekstu, który generuje ostateczne dane wyjściowe. Sprawia to, że RAG jest adaptacyjny w sytuacjach, w których fakty mogą ewoluować w czasie. Jest to bardzo przydatne, ponieważ parametryczna wiedza LLM jest statyczna. RAG pozwala modelom językowym ominąć ponowne szkolenie, umożliwiając dostęp do najnowszych informacji w celu generowania wiarygodnych wyników poprzez generowanie oparte na wyszukiwaniu.

Lewis zaproponowal ogólny przepis dostrajania dla RAG. Wstępnie wytrenowany model [seq2seq](seq2seq) jest używany jako [pamięć parametryczna](pamięć parametryczna), a [dense vector index](dense%20vector%20index) Wikipedii jest używany jako [pamięć nieparametryczna](pamięć%20nieparametryczna) (dostępna przy użyciu wstępnie wytrenowanego [neural pre-trained retriever](neural%20pre-trained%20retriever)). Poniżej znajduje się przegląd tego, jak działa to podejście:

![[images/Pasted image 20230922001554.png]]

RAG osiąga dobre wyniki w kilku testach porównawczych, takich jak [Natural Questions](Natural%20Questions), [WebQuestions](WebQuestions) i [CuratedTrec](CuratedTrec). RAG generuje odpowiedzi, które są bardziej rzeczowe, konkretne i zróżnicowane, gdy testowane są na pytaniach [MS-MARCO](MS-MARCO) i [Jeopardy](Jeopardy). RAG poprawia również wyniki weryfikacji faktów [FEVER](FEVER).

Pokazuje to potencjał RAG jako realnej opcji ulepszania wyników modeli językowych w zadaniach wymagających dużej wiedzy.

Ostatnio podejścia oparte na retrieverach stały się bardziej popularne i są łączone z popularnymi LLM, takimi jak [ChatGPT](ChatGPT), w celu poprawy możliwości i spójności faktów.

Prosty przykład wykorzystania retrieverów i LLM do odpowiadania na pytania ze źródłami można znaleźć w dokumentacji [[notes/Langchain|LangChain]].

[simple example of how to use retrievers and LLMs for question answering with sources (opens in a new tab)](https://python.langchain.com/docs/use_cases/question_answering/how_to/vector_db_qa)

# Etapy z RAG

Istnieje pięć kluczowych etapów w ramach RAG, które z kolei będą częścią każdej większej aplikacji, którą zbudujesz. Są to:

- **Loading**: odnosi się do pobierania danych z miejsca, w którym się znajdują - niezależnie od tego, czy są to pliki tekstowe, PDF, inna strona internetowa, baza danych czy API - do potoku. [LlamaHub](https://llamahub.ai/) zapewnia setki konektorów do wyboru.
    
- **Indeksowanie**: oznacza to tworzenie struktury danych, która pozwala na wyszukiwanie danych. W przypadku LLM prawie zawsze oznacza to tworzenie "osadzeń wektorowych", numerycznych reprezentacji znaczenia danych, a także wielu innych strategii metadanych, aby ułatwić dokładne wyszukiwanie danych istotnych kontekstowo.
    
- Przechowywanie: po zindeksowaniu danych prawie zawsze będziesz chciał przechowywać indeks, a także inne metadane, aby uniknąć konieczności ich ponownego indeksowania.
    
- Zapytania: dla każdej strategii indeksowania istnieje wiele sposobów wykorzystania LLM i struktur danych LlamaIndex do zapytań, w tym podzapytań, zapytań wieloetapowych i strategii hybrydowych.
    
- **Evaluation**: krytycznym krokiem w każdym potoku jest sprawdzenie jego skuteczności w stosunku do innych strategii lub po wprowadzeniu zmian. Ocena zapewnia obiektywne pomiary dokładności, wierności i szybkości odpowiedzi na zapytania.![[images/Pasted image 20231217201958.png]]

## Ważne pojęcia w ramach każdego kroku

Istnieją również pewne terminy, które odnoszą się do kroków na każdym z tych etapów.

### Etap ładowania

[**Węzły i dokumenty**]: `Document` jest kontenerem wokół dowolnego źródła danych - na przykład PDF, wyjście API lub pobranie danych z bazy danych. `Węzeł` jest atomową jednostką danych w LlamaIndex i reprezentuje "fragment" źródłowego `Dokumentu`. Węzły mają metadane, które odnoszą je do dokumentu, w którym się znajdują i do innych węzłów.

[**Konektory**]: Konektor danych (często nazywany `Reader`) przyjmuje dane z różnych źródeł danych i formatów danych do `Document` i `Nodes`.

### Etap indeksowania

[**Indeksy**]: Po wprowadzeniu danych, LlamaIndex pomoże ci zindeksować dane do struktury, która jest łatwa do odzyskania. Zwykle wiąże się to z generowaniem "osadzeń wektorowych", które są przechowywane w wyspecjalizowanej bazie danych zwanej "magazynem wektorowym". Indeksy mogą również przechowywać różne metadane dotyczące danych.

[**Embeddingi**] LLM generują numeryczne reprezentacje danych zwane `embeddingami`. Podczas filtrowania danych pod kątem trafności, LlamaIndex przekonwertuje zapytania na osadzenia, a magazyn wektorów znajdzie dane, które są numerycznie podobne do osadzenia zapytania.

### Etap zapytań

[**Retrievery**]: Retriever definiuje sposób efektywnego pobierania odpowiedniego kontekstu z indeksu po otrzymaniu zapytania. Strategia wyszukiwania jest kluczem do trafności pobieranych danych i wydajności, z jaką jest to wykonywane.

[**Routery**]: Router określa, która wyszukiwarka zostanie użyta do pobrania odpowiedniego kontekstu z bazy wiedzy. Mówiąc dokładniej, klasa `RouterRetriever` jest odpowiedzialna za wybór jednego lub wielu kandydatów do wykonania zapytania. Używają selektora, aby wybrać najlepszą opcję na podstawie metadanych każdego kandydata i zapytania.

[**Node Postprocessors**]: Postprocesor węzła pobiera zestaw pobranych węzłów i stosuje do nich transformacje, filtrowanie lub logikę zmiany kolejności.

[**Syntezatory odpowiedzi**]: Syntezator odpowiedzi generuje odpowiedź z LLM, wykorzystując zapytanie użytkownika i dany zestaw pobranych fragmentów tekstu.

### Łączenie wszystkiego razem

Istnieje nieskończenie wiele przypadków użycia aplikacji LLM opartych na danych, ale można je z grubsza podzielić na trzy kategorie:

[**Silniki zapytań**]: Silnik zapytań to kompleksowy potok, który umożliwia zadawanie pytań dotyczących danych. Przyjmuje zapytanie w języku naturalnym i zwraca odpowiedź wraz z kontekstem referencyjnym pobranym i przekazanym do LLM.

[**Silniki czatu**]: Silnik czatu to kompleksowy potok umożliwiający konwersację z danymi (wielokrotna wymiana informacji zamiast pojedynczego pytania i odpowiedzi).

[**Agenci**]: Agent to zautomatyzowany proces decyzyjny zasilany przez LLM, który wchodzi w interakcję ze światem za pośrednictwem zestawu [narzędzi]. Agenci mogą podejmować dowolną liczbę kroków w celu wykonania danego zadania, dynamicznie decydując o najlepszym sposobie działania, zamiast podążać za wcześniej ustalonymi krokami. Daje to dodatkową elastyczność w rozwiązywaniu bardziej złożonych zadań.