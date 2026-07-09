---
title: PAL (Program-Aided Language Models)
created: 2026-02-04
status: evergreen
category: AI / Prompt Engineering
difficulty: advanced
language: pl
tags:
  - pal
  - reasoning
  - code-generation
  - llm
  - agents
aliases:
  - Program-Aided Language Models
  - Generowanie Logiki przez Kod
---
# 🎯 Definicja
**PAL (Program-Aided Language Models)** to technika, w której model AI zamiast rozwiązywać zadanie matematyczne "w głowie" (co często mu nie wychodzi), pisze program (np. w Pythonie), który to policzy.

# 🔑 Kluczowe punkty
- **Delegacja:** Model AI (humanista) przekazuje obliczenia do Interpretera (matematyka).
- **Precyzja:** Eliminuje błędy arytmetyczne, z których słyną LLM.
- **Zastosowanie:** Matematyka, logika symboliczna, operacje na datach.

# 📚 Szczegółowe wyjaśnienie
W klasycznym [[Chain-of-Thought Prompting]] model pisze: "25 lat temu od 2023 to 1998". Często się myli.
W PAL model pisze:
```python
from datetime import date
print(date(2023, 2, 27).year - 25)
```
Ten kod jest następnie uruchamiany, a wynik (1998) jest pewny w 100%.

# 💡 Przykład zastosowania
Pytanie: "Jaka była data 1000 dni temu?"
Model [[GPT-4|GPT-4]] bez PAL: Może zgadnie, może się pomyli o dzień.
Model z PAL: Napisze `datetime.now() - timedelta(days=1000)`.

## 📌 Źródła
- "PAL: Program-aided Language Models" (arXiv).

## 👽 Brudnopis
- PAL to podstawa działania "Code Interpreter" w ChatGPT.