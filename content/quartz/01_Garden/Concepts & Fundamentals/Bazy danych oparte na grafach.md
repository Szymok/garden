---
title: Bazy Grafowe (Graph Databases)
created: 2026-02-04
status: evergreen
category: Data Engineering
difficulty: intermediate
language: pl
tags:
  - graph-db
  - neo4j
  - cypher
  - relationships
aliases:
  - Graph Databases
  - Neo4j
---
# 🎯 Definicja
**Baza grafowa** to system bazy danych, w którym priorytetem są **relacje** między danymi. Dane przechowywane są jako Węzły (Nodes, np. "Osoba") i Krawędzie (Edges, np. "Lubi", "Pracuje w").

# 🔑 Kluczowe punkty
- **Relacje First-Class:** W SQL relacja to kosztowny JOIN obliczany w momencie zapytania. W grafie relacja jest zapisana fizycznie na dysku jako wskaźnik. Przechodzenie po krawędziach jest błyskawiczne (index-free adjacency).
- **Złożoność:** Idealne do modelowania sieci społecznych, systemów rekomendacji, wykrywania fraudów (kręgi powiązań).
- **Języki:** Cypher (Neo4j), Gremlin (Apache TinkerPop), SPARQL (RDF).

# 📚 Szczegółowe wyjaśnienie
Bazy grafowe rozwiązują problem "Seven degrees of Kevin Bacon".
W SQL zapytanie "Znajdź znajomych znajomych znajomych..." wymaga 3 JOINów (wolne). W grafie to proste przejście ścieżką o długości 3.
Są dwa główne typy grafów:
1. **LPG (Labeled Property Graph):** Neo4j. Węzły i krawędzie mają etykiety i właściwości (JSONy). Intuicyjne dla programistów.
2. **RDF (Resource Description Framework):** Standard semantyczny (W3C). Trójki (Podmiot-Orzeczenie-Dopełnienie). Używany w Knowledge Graphs.

# 💡 Przykład zastosowania
Panama Papers.
Dziennikarze śledczy użyli Neo4j, aby połączyć miliony dokumentów.
"Osoba A" jest dyrektorem w "Firma B", która przelała kasę do "Firma C", której właścicielem jest "Żona osoby A".
W tabelach Excela/SQL wykrycie takiej pętli powiązań byłoby koszmarem. W grafie to prosty wzorzec.

## 📌 Źródła
- [Neo4j Graph Database](https://neo4j.com/)

## 👽 Brudnopis
- Algorytmy grafowe: PageRank (ważność węzła), Community Detection (klastry), Shortest Path.
- Knowledge Graphs (Grafy Wiedzy) - łączenie danych z różnych domen w jeden spójny graf (Google Knowledge Graph).