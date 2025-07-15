---
title: Metadata Sync
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
Solution Architecture
![[Pasted image 20250401145516.png]]
To affect changes in metadata driven applications, you need to manipulate metadata 
- This often means synchronization of multiple metadata systems 
Challenges when syncing data between applications 
- Standard "metadata exchange” format does not exist 
- different applications have different meta models 
- different granularities 
Re-usability of metadata exchange 
- Stability of APIS in time not guaranteed 
- Need flexibility in tooling 
Use case
I have long list of tables in excel (csv/collibra etc...) that I want to run specific data quality checks on for my report I want automated process that takes that excel, and runs the rules specified and see results in the catalog I want to report overall quality of the attributes back in form of a document or database table