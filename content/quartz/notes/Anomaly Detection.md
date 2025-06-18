---
title: Anomaly Detection
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
Anomaly detection discovers any inconsistencies or irregularities in the data.
- Anomaly detection is applied in the following cases:
	- After profiling the data: Anomaly detection is automatically started following each profiling run.
	- In monitoring projects, as part of the data quality (DQ) evaluation .
- Anomaly detection relies on one of the two models:
	- Time-independent model: This model is used by default.
	- Time-dependent model, based on the time series analysis.
- You can select time-independent or time-dependent anomaly detection to be used during profiling.
- The model is equipped to detect unexpected values of different kinds such as unexpected nulls, negatives, positives or zeros and changes from established trends.
- Time-dependent anomaly detection requires a minimum of 6 runs.