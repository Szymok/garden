---

title: LoRA Adapter  
created: 2025-07-16  
status: Final  
category: Fine-tuning modeli LLM  
difficulty: średniozaawansowany  
language: pl  
tags:

- LoRA
- Adapter
- fine-tuning
- LLM
- efektywne dostrajanie  
aliases:
- Low-Rank Adaptation
- LoRA fine-tuning
- adaptery LoRA

---

# 🎯 Definicja

**LoRA Adapter** (skrót: _Low-Rank Adaptation of [[Base LLM|Large Language Models]]_) to technika efektywnego dostrajania dużych modeli językowych ([[Base LLM|LLM]]), która polega na „zamrożeniu” oryginalnych wag modelu i modyfikacji tylko niewielkich, dodanych parametrów o niskiej randze (low-rank). LoRA umożliwia szybkie, oszczędne i efektywne dostrajanie modeli bez konieczności trenowania wszystkich ich wag.

# 🔑 Kluczowe punkty

- **Parametry bazowe modelu pozostają niezmienione (zamrożone)** – uczenie dotyczy tylko adapterów.
- **Dodawane są dwie małe macierze** (A i B) do każdej warstwy, które reprezentują korekcję wag.
- Obniża koszty pamięci i obliczeń – **znaczna oszczędność vs full fine-tuning.**
- Możliwość **szybkiego przełączania się między wariantami modelu** z różnymi adapterami.
- Zyskała dużą popularność dzięki efektywności w systemach typu Hugging Face Transformers, Bitsandbytes i PEFT (Parameter-Efficient Fine-Tuning).

# 📚 Szczegółowe wyjaśnienie

## Jak działa LoRA?

Dla każdej warstwy liniowej w modelu, np. `W ∈ ℝ^{d×k}`, zamiast uczyć W, dodajesz korektę:

```text
W_loRA = W + ΔW
ΔW = B × A → gdzie A ∈ ℝ^{r×k}, B ∈ ℝ^{d×r}, z r ≪ d,k
```

Zamiast uczyć W (duży, pełnowymiarowy tensor), LoRA uczy niewielkie A i B — dwie macierze o zmniejszonej randze `r`, często r=4, 8, 16.

## Korzyści:

|Właściwość|Pełen fine-tuning|LoRA Adapter|
|---|---|---|
|Parametry aktualizowane|Wszystkie wagi|Tylko adaptery|
|Zużycie GPU RAM|Wysokie|Niskie|
|Łatwość przełączania modeli|Brak|Adapter jako plik ∼30MB–100MB|
|Szybkie eksperymenty|Nie|Tak|
|Skalowanie wiele tasków|Trudne|Łatwe przez wczytywanie adapterów|

## Gdzie używamy LoRA?

- Dostrajanie modeli typu LLaMA, Mistral, BLOOM, GPTQ baz modeli do specyficznych zadań.
- Tworzenie _personalizowanych_ lub _domenowych_ wersji [[Base LLM|LLM]].
- Chatboty z zachowaniem tożsamości i stylu konwersacji.
- Fine-tuning z [[RAG]] ([[Retrieval Augmented Generation (RAG)|Retrieval-Augmented Generation]]).
- Popularne środowiska:
    - Hugging Face (`peft`, `transformers`)
    - QLoRA (Quantized LoRA – połączenie kvantyzacji + adapterów)
    - Axolotl / Open [[Base LLM|LLM]] Leaderboard

# 💡 Przykład kodu z użyciem Hugging Face `peft`

```python
from peft import LoraConfig, get_peft_model, TaskType
from transformers import AutoModelForCausalLM

model = AutoModelForCausalLM.from_pretrained("meta-llama/Llama-2-7b")
lora_config = LoraConfig(
    task_type=TaskType.CAUSAL_LM,
    r=8,
    lora_alpha=16,
    lora_dropout=0.1,
    target_modules=["q_proj", "v_proj"]
)
model = get_peft_model(model, lora_config)
```

# 🛠️ QLoRA – specjalna odmiana

**QLoRA** = Quantized + LoRA

- Modele są najpierw `4-bit quantized` (np. z bitsandbytes), potem dostrajane z LoRA.
- Trenujesz ogromne modele (np. Llama 65B) **na jednej karcie A100 40GB**.
- Rewolucja w dostępności [[Base LLM|LLM]] dla małych zespołów i projektów open-source.

# ✅ Zalety LoRA

|Zaleta|Opis|
|---|---|
|Wydajność|Tylko ułamek parametrów trenowany|
|Kompatybilność|Integruje się bezpiecznie z istniejącymi modelami|
|Łatwość zarządzania|Adaptery jako osobne pliki – łatwe w wersjonowaniu|
|Reużywalność|Można przełączać adaptery bez przebudowy modelu|
|Redukcja kosztów|Trening 10–100x tańszy od klasycznego fine-tune|

# ❌ Ograniczenia

- Adaptery wpływają tylko na część wag → mogą nie uchwycić bardzo złożonych relacji w danych.
- Nie zawsze tak skuteczny jak pełny fine-tune przy dużych zmianach zadania.
- Potrzebna dobra wiedza co do wyboru warstw `target_modules`.

# 📌 Źródła

- [https://arxiv.org/abs/2106.09685](https://arxiv.org/abs/2106.09685) – oryginalna publikacja
- [https://github.com/huggingface/peft](https://github.com/huggingface/peft)
- [https://github.com/artidoro/qlora](https://github.com/artidoro/qlora)
- [https://sebastianraschka.com/blog/2023/lora-explained.html](https://sebastianraschka.com/blog/2023/lora-explained.html)
- HF Spaces: [https://huggingface.co/docs/peft](https://huggingface.co/docs/peft)

## 👽 Brudnopis

- LoRA = plug-in tuning do [[Base LLM|LLM]] 🤖
- LoraConfig → decyduje gdzie dokładnie „wstawić” adaptery
- QLoRA = LoRA + 4bit quant – open tuning dla każdego
- Dobrze działa z LLaMA/Mistral, pod zadania typu chatbot, klasyfikacja, summarization
- Adapter można trenować 100x taniej → wrzucić na HF, swapować priorytetowe taski
- Mistral 7B pełne tune = $$$ — LoRA tune ≤ 2h na Colab 🚀

---