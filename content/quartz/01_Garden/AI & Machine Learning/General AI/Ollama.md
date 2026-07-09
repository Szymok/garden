---
title: Ollama
created: 2026-05-06
status: 🌱 draft
category: AI & ML
difficulty: średni
language: pl
tags:
  - ollama
  - llm
  - local-llm
  - open-source
  - deployment
aliases:
  - Local LLM
  - Lokalny LLM
---

# 🎯 Definicja

**Ollama** to narzędzie open-source umożliwiające uruchamianie dużych modeli językowych ([[LLM Settings|LLM]]) lokalnie na własnym sprzęcie — bez dostępu do internetu i bez wysyłania danych do zewnętrznych API.

# 🔑 Kluczowe punkty

- **Prywatność**: dane nigdy nie opuszczają lokalnego środowiska
- **Bezpłatne wnioskowanie**: brak kosztów per-token po pierwszym pobraniu modelu
- **Prosty CLI**: `ollama run llama3` — jeden polecenie uruchamia model
- **REST API**: automatycznie wystawia endpoint `http://localhost:11434` kompatybilny z OpenAI API
- **Obsługa GGUF**: korzysta ze skwantyzowanych modeli w formacie [[Quantization|GGUF]]
- **Model library**: gotowe modele — Llama 3, Mistral, Gemma, Phi, DeepSeek i setki innych

# 📚 Szczegółowe wyjaśnienie

## Jak działa

Ollama opakowuje bibliotekę `llama.cpp` w wygodne narzędzie CLI i serwer HTTP. Model jest pobierany raz (kilka GB) i ładowany do pamięci RAM/VRAM. Każde żądanie trafia do lokalnego serwera.

```bash
# Instalacja (macOS/Linux)
curl -fsSL https://ollama.ai/install.sh | sh

# Pobranie i uruchomienie modelu
ollama pull llama3.2
ollama run llama3.2

# REST API (kompatybilne z OpenAI)
curl http://localhost:11434/api/generate \
  -d '{"model": "llama3.2", "prompt": "Wyjaśnij Data Mesh"}'
```

## Wymagania sprzętowe

| Model | Rozmiar | Min RAM |
|---|---|---|
| Llama 3.2 3B | ~2 GB | 8 GB RAM |
| Llama 3.1 8B | ~5 GB | 16 GB RAM |
| Llama 3.1 70B | ~40 GB | 64 GB RAM / GPU |

## Integracja z [[Retrieval Augmented Generation (RAG)|RAG]]

Ollama + [[LlamaIndex]] lub [[Langchain]] = lokalne RAG pipeline bez zewnętrznych zależności:

```python
from langchain_ollama import ChatOllama

llm = ChatOllama(model="llama3.2")
response = llm.invoke("Czym jest Data Governance?")
```

## Modelfile — własne modele

Można tworzyć własne modele z systemowym promptem:

```
FROM llama3.2
SYSTEM "Jesteś ekspertem od Ataccama ONE. Odpowiadaj po polsku."
```

# 💡 Przykład zastosowania

**Lokalny asystent Data Governance**: Ollama z modelem Llama 3.1 8B + [[Retrieval Augmented Generation (RAG)|RAG]] na dokumentacji Ataccamy → chatbot bez wysyłania poufnych danych firmowych do chmury. Steward może pytać po polsku o konfigurację reguł DQ bez dostępu do internetu.

# 📌 Źródła

- [[Retrieval Augmented Generation (RAG)]]
- [[Baza wektorowa]]
- [[Embedding]]
- [[Quantization]]
- [[Langchain]]
- [[LlamaIndex]]

# 👽 Brudnopis
