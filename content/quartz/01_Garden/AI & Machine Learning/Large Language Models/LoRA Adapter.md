---
title: LoRA (Low-Rank Adaptation)
created: 2026-02-04
status: evergreen
category: LLM Fine-Tuning
difficulty: advanced
language: pl
tags:
  - peft
  - fine-tuning
  - optimization
  - gpu
  - lora
aliases:
  - Low-Rank Adaptation
  - Adaptery LoRA
  - PEFT
---
# 🎯 Definicja
**LoRA** to technika **taniego douczania (Fine-Tuning)** wielkich modeli AI. Zamiast trenować cały model (co wymaga superkomputera), trenujemy tylko malutki "dodatek" (Adapter), który waży kilka megabajtów. Wynik działa prawie tak samo dobrze, a kosztuje ułamek ceny.

# 🔑 Kluczowe punkty
- **Zamrożenie modelu:** Główny model (np. Llama 70B) pozostaje nienaruszony.
- **Macierze A i B:** LoRA dodaje dwie małe macierze do warstw sieci neuronowej. Uczymy tylko ich.
- **Przenośność:** Możesz mieć jeden model bazowy i 50 malutkich adapterów (jeden do pisania wierszy, drugi do [[SQL|SQL]], trzeci do medycyny).

# 📚 Szczegółowe wyjaśnienie
Tradycyjny Fine-Tuning zmienia wagi całego modelu (np. 70 miliardów parametrów). Wymaga to setek gigabajtów pamięci VRAM (wiele kart A100).
LoRA zmienia np. 0.1% parametrów. Dzięki temu można douczyć model Llama 7B na pojedynczej (dobrej) karcie graficznej w domu.
Narzędzie **QLoRA** idzie krok dalej, kwantyzując model bazowy do 4 bitów, co jeszcze bardziej obniża wymagania sprzętowe.

# 💡 Przykład zastosowania
Firma chce mieć własne AI, które mówi "firmowym żargonem".
Biorą model Mistral 7B (Open Source).
Używają LoRA na zbiorze swoich maili.
Po 2 godzinach treningu (koszt $5 w chmurze) mają plik `adapter.bin` (50 MB).
Wgrywają adapter do modelu i AI zaczyna pisać jak pracownik firmy.

## 📌 Źródła
- "LoRA: Low-Rank Adaptation of Large Language Models" (Microsoft Paper).

## 👽 Brudnopis
- LoRA to standard w świecie Open Source AI (HuggingFace PEFT).