---

title: Factuality  
created: 2025-07-16  
status:  
category: LLM  
difficulty: podstawowy  
language: pl  
tags:

- factuality
- prompt engineering
- hallucinations
- accuracy
- LLM  
aliases:
- dokładność modeli językowych

---

# 🎯 Definicja

**Factuality** w kontekście dużych modeli językowych ([[Base LLM|LLM]]) oznacza stopień, w jakim odpowiedzi generowane przez model są zgodne z rzeczywistością, oparte na zweryfikowanych faktach i nie zawierają zmyśleń (tzw. halucynacji). Poprawa factuality to kluczowy cel inżynierii promptów i projektowania nowoczesnych systemów opartych na [[Uczenie Maszynowe|AI]].

# 🔑 Kluczowe punkty

- **[[Base LLM|LLM]] mogą „halucynować”** – generować informacje brzmiące prawdziwie, lecz nieistniejące w rzeczywistości.
- **Odpowiednie promptowanie** modelu, kontekst i przykłady mogą znacząco ograniczyć [[halucynacje]] i zwiększyć dokładność.
- **Warto wymagać, by model przyznawał się do niewiedzy** ("Nie wiem", "?") zamiast zgadywać lub wymyślać.
- **Dostarczanie źródeł kontekstowych** (np. fragmentów tekstów, konkretnych faktów) minimalizuje ryzyko generowania nieprawdziwych treści.
- **Optymalizacja parametrów generacji** jak temperatura, top_p i inne ogranicza kreatywność na rzecz precyzji.

# 📚 Jak zwiększyć factuality w [[Base LLM|LLM]]? 

## 1. Dodanie kontekstu/faktów do promptu

Umieszczając w prompcie fragmenty tekstów, artykułów lub informacje z baz wiedzy (np. Wikipedia), wyraźnie wskazujesz modelowi, na czym ma bazować w odpowiedzi. To przykład podejścia [[Retrieval Augmented Generation (RAG)|retrieval-augmented generation]] ([[RAG]]).

**Przykład:**

```
Kontekst: Mars ma dwa naturalne satelity – Fobosa i Deimosa.
Pytanie: Ile Księżyców ma Mars? Odpowiedz na podstawie powyższego kontekstu.
```

## 2. Prompt z przykładowymi pytaniami o znanych i nieznanych odpowiedziach

Pokazanie, że model może i powinien odpowiadać "?" lub "nie wiem", gdy pytanie przekracza jego faktyczne kompetencje, pozwala naturalnie wymusić ostrożniejszą generację.

**Przykład:**

```
Q: What is an atom?   A: An atom is a tiny particle that makes up everything.
Q: Who is Alvan Muntz?   A: ?
Q: How many moons does Mars have?   A: Two, Phobos and Deimos.
Q: What is Kozar-09?   A: ?
Q: Who is Neto Beto Roberto?   A: ?
```

Model, widząc taki wzorzec, chętniej przyzna się do niewiedzy zamiast zmyślać.

## 3. Regulacja parametrów generacji

Obniż temperaturę (temperature) i/lub top_p ([[Top P|nucleus sampling]]) w API, by model był mniej kreatywny i bardziej przewidywalny. Dodatkowo, w promptach zalecaj precyzję i powstrzymaj się od zgadywania.

**Przykład instrukcji:**

> Odpowiadaj konkretnie, tylko jeśli jesteś pewien odpowiedzi; w przeciwnym wypadku napisz "Nie wiem".

## 4. Jawne wymaganie cytowania, wycofania się lub źródła

Dodaj do promptu warunek: nie odpowiadaj bez cytatu albo napisz „brak danych”.

**Przykład:**

> Jeśli w kontekście nie ma odpowiedzi, napisz "Brak informacji w źródle".

# 💡 Jak jeszcze poprawić factuality?

- **Używanie systemu z zewnętrznym wyszukiwaniem** (np. [[LangChain]] + Google/Bing/Wikipedia API), by najpierw wyszukiwać [[fakty]], a dopiero potem generować odpowiedź.
- **Weryfikacja ex post** – każda odpowiedź modelu może być ponownie sprawdzona, np. przez drugi model lub dedykowany algorytm fakt-checkingowy.
- **Explicit reasoning** – stosowanie łańcucha myśli (chain-of-thought, [[Chain-of-Thought Prompting|CoT]]) z prośbą o uzasadnienie odpowiedzi zwiększa szanse na wyłapanie zmyśleń.

# 📌 Podsumowanie w tabeli

|Technika|Jak działa?|Efekt dla factuality|
|---|---|---|
|Kontekst źródła|Dostarczenie fragmentu tekstu|Model odpowiada tylko na bazie faktów|
|Przykłady "?" / "nie wiem"|Pokazanie niepewności|Model woli przyznać się do niewiedzy|
|Ograniczona temperatura|Mniejsza kreatywność|Bardziej powściągliwe odpowiedzi|
|Polecenie „nie zgaduj”|Wyraźny zapis w promptcie|Odpowiedzi tylko przy pewności|

# 💡 Praktyczny przykład zmiany pytania

Spróbuj zmienić rodzaj pytania, np.:

```
Q: Who is Neto Beto Roberto? A: ?
```

albo:

```
Q: Who is Jan Kowalski (fictional)? A: ?
Q: Who is John Smith? A: ?
Q: What is the capital of Spain? A: Madrid.
Q: Who is Alfreda Sztukałowicz? A: ?
```

Model, ćwiczony na takich promptach, będzie lepiej unikał halucynacji faktów i łatwiej przyzna się do niewiedzy w nieznanych przypadkach.

# 👽 Brudnopis

- Factuality = ograniczenie halucynacji, odpowiedzi opartych na domysłach
- Efektywne: wzorce pytań z "?", explicit chain-of-thought, kontekst source, niska temperatura
- Najlepsze efekty przy [[RAG]] i silnym promptowaniu z asetami źródłowymi
- Możliwość łączenia: explicit reasoning + context + hybrydy z narzędziami
- Propozycja: test na nieistniejące nazwiska, fantasy, liczby losowe, entiti o małej popularności
- Zawsze pilnować, by model miał prawo napisać "nie wiem", nawet kosztem mniejszego "odczuwanego" IQ