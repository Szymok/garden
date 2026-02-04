---
title: GAN (Generative Adversarial Networks)
created: 2026-02-04
status: evergreen
category: Deep Learning
difficulty: intermediate
language: pl
tags:
  - gan
  - generative
  - neural-networks
  - generator
  - discriminator
aliases:
  - Generatywne Sieci Współzawodniczące
  - Sieci GAN
---
# 🎯 Definicja
**GAN** (Generative Adversarial Networks) to architektura sieci neuronowych, w której dwie sieci – **Generator** i **Dyskryminator** – walczą ze sobą. Generator próbuje stworzyć fałszywe dane (np. zdjęcie człowieka), które wyglądają jak prawdziwe. Dyskryminator próbuje odróżnić fałsz od prawdy. Dzięki tej rywalizacji, Generator uczy się tworzyć ultra-realistyczne treści (np. Deepfakes).

# 🔑 Kluczowe punkty
- **Gra o sumie zerowej:** Sukces jednej sieci jest porażką drugiej.
- **Generator:** "Fałszerz sztuki". Na wejściu dostaje szum, na wyjściu daje obraz.
- **Dyskryminator:** "Rzeczoznawca/Policjant". Ocenia: Prawda (1) czy Fałsz (0).
- **Zastosowania:** Generowanie twarzy (thispersondoesnotexist.com), skalowanie obrazów (Super Resolution), transfer stylu.

# 📚 Szczegółowe wyjaśnienie
Trening GAN jest trudny (niestabilny).
Jeśli Dyskryminator jest za dobry, Generator nie ma szans się nauczyć (dostaje samych zer w ocenie).
Jeśli Generator jest za dobry, Dyskryminator zgaduje losowo.
Idealny stan to Równowaga Nasha, gdzie Generator produkuje idealne podróbki, a Dyskryminator ma 50% szans na zgadnięcie.

# 💡 Przykład zastosowania
Generowanie tekstur w grach wideo.
Zamiast ręcznie rysować 1000 wariantów trawy, uczysz GAN na zdjęciach trawy. Następnie Generator produkuje nieskończoną ilość unikalnych tekstur trawy na żądanie.

## 📌 Źródła
- Ian Goodfellow et al. (2014) - oryginalna publikacja o GAN.

## 👽 Brudnopis
- GAN-y powoli ustępują miejsca modelom dyfuzyjnym (Diffusion Models, np. Stable Diffusion), które są stabilniejsze w treningu i dają lepszą różnorodność wyników.