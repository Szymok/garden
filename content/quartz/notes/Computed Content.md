---
title: Computed Content
created: 2025-04-01
status: 
category: 
difficulty: 
language: pl
tags:
  - 
aliases:
  - 
---
# 🎯 Definicja

# 🔑 Kluczowe punkty

# 📚 Szczegółowe wyjaśnienie

# 💡 Przykład zastosowania
```python

```
## 📌 Źródła

## 👽 Brudnopis
Special kind of metadata model node doesn't store metadata SQL query which computes values from other metadata Examples of use: Get the number of entities in the array. Get the name of the parent entity from the Child entity. Precompute values for filtering.
3 sections: Input attributes 
- which objects from the model will participate in the query Query section 
- simplified SQL query that translates into a computed query Computed properties 
- to map the ouput columns to the entity properties
$alias$
5 mandatory propertis, that the select has to return:
- parent_id_i: where the result of the CC should be stored
- id_i: unique identifier in the returned set
- from_h: history change number
- path_i,: path from the root of the model to the parent entity
- type_i: type of the parent entity.