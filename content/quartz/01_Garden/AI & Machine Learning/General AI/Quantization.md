---
title: Quantization (Kwantyzacja modeli)
created: 2026-05-06
status: 🌱 draft
category: AI & ML
difficulty: zaawansowany
language: pl
tags:
  - quantization
  - llm
  - gguf
  - ggml
  - optymalizacja
  - local-llm
aliases:
  - Kwantyzacja
  - GGUF
  - Model Quantization
---

# 🎯 Definicja

**Kwantyzacja** to technika kompresji modelu AI polegająca na redukcji precyzji wag z 32-bitowych liczb zmiennoprzecinkowych (FP32) do niższych formatów (INT8, INT4), co radykalnie zmniejsza rozmiar modelu i zapotrzebowanie na pamięć RAM/VRAM przy minimalnej utracie jakości.

# 🔑 Kluczowe punkty

- **FP32 → INT4**: rozmiar modelu spada 8-krotnie
- **GGUF** — aktualny standard formatu kwantyzowanych modeli (zastąpił GGML)
- **Nazewnictwo**: `Q4_K_M` = kwantyzacja 4-bitowa, typ K, rozmiar Medium
- **Trade-off**: im niższy bit, tym mniejszy model ale większa degradacja jakości
- **llama.cpp** — biblioteka C++ wykonująca wnioskowanie na kwantyzowanych modelach
- **[[Ollama]]** używa GGUF pod spodem

# 📚 Szczegółowe wyjaśnienie

## Formaty kwantyzacji

| Format | Bity | Rozmiar (7B) | Jakość |
|---|---|---|---|
| FP32 | 32 | ~28 GB | Referencyjna |
| FP16 | 16 | ~14 GB | ~100% |
| Q8_0 | 8 | ~7 GB | ~99% |
| Q4_K_M | 4 | ~4 GB | ~97% |
| Q2_K | 2 | ~2.5 GB | ~90% |

## Sufiks nazwy modelu

```
Q4_K_M
│ │ │
│ │ └─ Rozmiar: S (Small), M (Medium), L (Large)
│ └─── Typ kwantyzacji: K (K-quant, nowszy, lepszy)
└───── Liczba bitów na wagę
```

## Jak używać z [[Ollama|Ollama]]

```bash
# Ollama automatycznie dobiera odpowiedni GGUF
ollama pull llama3.2          # domyślny (Q4_K_M)
ollama pull llama3.2:8b-q8_0  # wyższa jakość
```

## Kiedy stosować jaką kwantyzację

- **Q8_0** — masz dużo RAM/VRAM, zależy Ci na jakości
- **Q4_K_M** — złoty środek (domyślny wybór)
- **Q2_K** — bardzo ograniczone zasoby, akceptujesz utratę jakości

# 💡 Przykład zastosowania

Model Llama 3.1 70B w FP16 wymaga 140 GB VRAM (2x A100). Ten sam model w Q4_K_M mieści się w 40 GB — dostępny na jednej karcie A100 lub dwóch konsumenckich RTX 4090.

# 📌 Źródła

- [[Ollama]]
- [[Deployment modeli]]
- [[LoRA Adapter]]

# 👽 Brudnopis
