---
title: Generative Adversarial Network (Sieci GAN)
created: 2026-02-04
status: evergreen
category: Deep Learning
difficulty: advanced
language: pl
tags:
  - gan
  - generator
  - discriminator
  - deep-learning
aliases:
  - GAN
  - Sieci Współzawodniczące
  - Generatywne Sieci Przeciwstawne
---
# 🎯 Definicja
**Generative Adversarial Network (GAN)** to klasa modeli generatywnych, w których dwie [[Sieci neuronowe|sieci neuronowe]] – **Generator** i **Dyskryminator** – są trenowane razem w procesie rywalizacji (gry o sumie zerowej). Generator uczy się tworzyć dane (np. obrazy) nieodróżnialne od prawdziwych, a Dyskryminator uczy się wykrywać fałszerstwa.

# 🔑 Kluczowe punkty
- **Twórca:** Ian Goodfellow (2014).
- **Architektura:** Generator (G) vs Dyskryminator (D).
- **Cel:** Osiągnięcie punktu równowagi, gdzie Generator generuje idealne dane, a Dyskryminator "zgaduje" (prawdopodobieństwo 50%).

# 📚 Szczegółowe wyjaśnienie
Wyobraź sobie fałszerza banknotów (Generator) i policjanta (Dyskryminator).
1. Fałszerz drukuje banknot. Policjant mówi: "To fałszywka, papier jest za gładki".
2. Fałszerz poprawia papier. Policjant: "Teraz znak wodny jest krzywy".
3. Fałszerz poprawia znak wodny...
Po tysiącach iteracji fałszerz produkuje banknoty nieodróżnialne od prawdziwych, a policjant nie jest w stanie ich poznać. To jest wytrenowany GAN.

# 💡 Przykład zastosowania
- **Super-rozdzielczość:** Powiększanie starych, niewyraźnych zdjęć (Generator dorabia brakujące piksele tak, żeby wyglądały realistycznie).
- **Deepfakes:** Zamiana twarzy w wideo.
- **Transfer stylu:** Zamiana zdjęcia dziennego na nocne, lub szkicu na fotorealistyczny obraz (Pix2Pix).

## 📌 Źródła
- "Generative Adversarial Nets" - Ian Goodfellow et al.

## 👽 Brudnopis
- Trening GAN jest **bardzo niestabilny** (Mode Collapse, Oscillations).
- Wymaga precyzyjnego dostrajania hiperparametrów.
- Obecnie w generowaniu obrazów statycznych często wypierane przez modele dyfuzyjne (Stable Diffusion), ale wideo i audio nadal mocno polegają na GAN-ach.