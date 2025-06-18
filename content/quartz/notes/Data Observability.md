---
title: Data Observability
created: 2025-05-21
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
Data observability allows you to understand the state of your data based on the information you're collecting about that data, such as data quality issues, anomalies, or schema changes. 
The key components of data observability are: 
- Data quality monitoring
- Al-powered anomaly detection 
- Data discovery 
With these components in place you can better understand the nature of your data, including: 
- Data quality information. 
- Schema changes. (Virtual catalog items (VCl's) and files cannot undergo schema checks as schema checks are run on the database directly. ) 
- Anomalies 
- Changes in business domains of data 
- Data freshness 
- Any other metadata coming from ETL processes

The Data observability in ONE relies on the relationship between the data catalog, business glossary, and rules: 
- Business terms are defined in the business glossary, data quality rules are applied to terms, and terms are applied to items in the catalog during data discovery. 
- As the module contains a number of predefined rules and terms, the process is mainly automated. 
- In addition to this process, Al detects anomalies and suggests business terms. 
The following steps outline Data Observability works in the ONE: 
- The discovery process analyzes the data and detects business terms within specific attributes. 
- You select the business terms you want to monitor. 
- Schedule data observability runs. 
- Get notifications, improve AI, consume statistics on the data observability dashboard, analyze issues, and fix them.