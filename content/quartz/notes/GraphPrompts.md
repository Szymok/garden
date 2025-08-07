---

title: GraphPrompts  
created: 2025-07-16  
status: Final  
category: LLM  
difficulty: zaawansowany  
language: pl  
tags:

- graph learning
- prompt-engineering
- AI
- LLM
- GNN
- grafy  
aliases:
- GraphPrompt
- prompting dla grafów

---

# 🎯 Definicja

**GraphPrompts** to technika inżynierii podpowiedzi wprowadzona przez Liu et al., która dostosowuje klasyczne podejście promptowe do pracy z danymi grafowymi. Struktura ta ma na celu poprawę wydajności modeli językowych i grafowych (np. GNN) w zadaniach niższego poziomu, takich jak klasyfikacja węzłów, przewidywanie krawędzi, a także transfer uczenia między zadaniami.

# 🔑 Kluczowe punkty

- GraphPrompts rozszerzają klasyczne podejścia few-shot/zero-shot na dane o strukturze grafowej.
- Technika umożliwia uczenie się zależności strukturalnych między węzłami/krawędziami poprzez semantycznie zaprojektowane prompty.
- Model otrzymuje informacje nie tylko o cechach wierzchołków, ale także o ich kontekście grafowym.
- Może być wykorzystywany w połączeniu z GNN (Graph Neural Networks) lub bez nich, z pomocą [[Base LLM|LLM]].
- Umożliwia uczenie się reprezentacji nieparametrycznych, poprawiając przenoszenie wiedzy między zadaniami grafowymi.

# 📚 Szczegółowe wyjaśnienie

## Czym są GraphPrompts?

GraphPrompt to struktura promptu, która wykorzystuje **kontekst lokalny i strukturalny grafu** jako dane wejściowe do modelu uczącego się. Działa to analogicznie do standardowego prompting w NLP, ale zamiast tekstu naturalnego używa informacji o strukturze grafu.

W klasycznym NLP może wyglądać to tak:

> "Q: Co to jest NLP? A: Przetwarzanie języka naturalnego..."

W przypadku GraphPrompt:

> "Node A ma sąsiadów: Node B (label: X), Node C (label: X). Node A ma cechy: [0.1, 0.5, 0.3]. Pytanie: Jaką etykietę może mieć Node A? Odpowiedź:"

## Architektura i przepływ

1. **Reprezentacja grafu** – tworzenie zbiorów treningowych w postaci ścieżek z grafu (np. węzeł + sąsiedzi).
2. **Zamiana kontekstu grafowego** na format promptowy (tekstowy lub embedowy), dostosowany do przetworzonych danych.
3. **Uczenie/Inferencja** – [[Base LLM|LLM]] lub GNN przyjmuje prompt i generuje predykcję (np. etykieta węzła).
4. **Uwaga na strukturę** – GraphPrompt może wykorzystywać szablony, które modelują topologię grafu, a nie tylko cechy pojedynczych węzłów.

## Typowe zastosowania

- Klasyfikacja węzłów w grafach społecznościowych lub cytowań.
- Przewidywanie krawędzi (np. rekomendacja, asocjacja).
- [[Transfer learning]] między heterogenicznymi grafami w różnych domenach.
- Low-resource tasks w grafowych zbiorach danych.

## Zestawienie z klasycznym promptowaniem

|Cecha|Klasyczne prompty (tekst)|GraphPrompts|
|---|---|---|
|Dane wejściowe|Tekst naturalny|Wierzchołki, cechy, sąsiedzi|
|Kontekst|Semantyczny lub logiczny|Strukturalny + semantyczny|
|Typ modelu|[[Base LLM\|LLM]] (tekstowe)|[[Base LLM\|LLM]], GNN lub hybryda|
|[[Transfer learning]]|Ograniczony|Lepsza adaptacja do innych grafów|

# 💡 Przykład zastosowania

W zadaniu klasyfikacji użytkowników w grafie sieci społecznościowej GraphPrompt umożliwił modelowi klasyfikację nie tylko na podstawie cech jednostki (np. liczby postów czy wieku), ale także na podstawie informacji o sąsiadujących węzłach – ich typowych cechach i etykietach. Dzięki temu poprawiono F1-score z 73% do 81% bez potrzeby dodatkowego tłoczenia danych, stosując jedynie warstwę logicznej transformacji danych w prompt.

## 📌 Źródła

- GraphPrompt: Towards effective prompt tuning for graph neural networks – Liu et al. ([https://arxiv.org/abs/2112.08668](https://arxiv.org/abs/2112.08668))
- Stanford CS224W – Lecture resources on GraphML
- HuggingFace paper digest – [https://huggingface.co/papers/2302.01344](https://huggingface.co/papers/2302.01344)

## 👽 Brudnopis

- Liu et al. – GraphPrompt = prompt tuning dla struktur grafowych
- Często łączony z GNN lub stosowany z [[Base LLM|LLM]] przez embeddingi jako przekodowany prompt
- Ma zastosowanie w low-shot learning na grafach
- Rozszerzenie formatu promptu o topologię grafu → np. sąsiedzi, lokalna informacja
- W NLP używamy łańcucha myśli, tutaj: łańcucha topologii
- Potencjał: bioinformatyka, społeczności, sieci wiedzy, rekomendacje
- Może działać nawet bez parametrycznego fine-tuningu – czysty prompt = świetny transfer
- Format danych: JSON do prompt + embed jako input do [[Base LLM|LLM]]
- Powiązane z GraphML, HeteroGNN i node2vec

Daj znać, jeżeli chcesz również notatki dot. Graph Neural Networks (GNN), prompt tuningu albo porównań GraphPrompt vs In-Context Learning!