---

title: GAN - podstawy  
created: 2025-07-16  
status: Final  
category: Deep Learning  
difficulty: średniozaawansowany  
language: pl  
tags:

- GAN
- deep learning
- generative models
- uczenie bez nauczyciela  
aliases:
- generative adversarial networks
- sieci generatywne

---

# 🎯 Definicja

**GAN (Generative Adversarial Network)** to rodzaj modelu generatywnego, który uczy się tworzyć nowe dane podobne do danych treningowych. Składa się z dwóch sieci neuronowych — generatora i dyskryminatora — które uczą się w systemie rywalizacyjnym. GAN-y znajdują zastosowanie m.in. w generowaniu obrazów, mowy, tłumaczeniach, rekonstrukcji danych czy deepfake.

# 🔑 Kluczowe punkty

- GAN składa się z dwóch modeli uczących się przeciwko sobie: **generatora (G)** i **dyskryminatora (D)**.
- **Generator** tworzy dane na podstawie szumu losowego, próbując oszukać dyskryminator.
- **Dyskryminator** uczy się odróżniać dane rzeczywiste (z treningu) od tych wygenerowanych.
- Proces treningowy GAN to gra o sumie zerowej — G próbuje oszukać D, a D próbuje go wykryć.
- GAN-y działają w trybie uczenia bez nauczyciela (unsupervised) — uczą się struktury danych bez etykiet.

# 📚 Szczegółowe wyjaśnienie

## Jak działają GAN-y?

1. Generator przyjmuje losowy wektor (tzw. latent vector lub z) i przekształca go w wygenerowaną próbkę (np. obraz).
2. Dyskryminator otrzymuje rzeczywiste próbki oraz próbki z generatora i klasyfikuje je jako **real** lub **fake**.
3. GAN uczy się na zasadzie _minimax_:
    - Generator chce maksymalizować błąd dyskryminatora.
    - Dyskryminator chce minimalizować błędy klasyfikacji.

Matematycznie:

```
min_G max_D V(D, G) = E[log D(x)] + E[log(1 - D(G(z)))]
```

## Architektura GAN

|Komponent|Funkcja|
|---|---|
|**Generator (G)**|Tworzy dane przypominające dane rzeczywiste z losowego wejścia z|
|**Dyskryminator (D)**|Klasyfikuje próbki jako prawdziwe lub fałszywe. Dąży do perfekcyjnego rozpoznawania rzeczywistych danych.|

Strukturalnie zwykle są to [[Deep Learning|głębokie sieci neuronowe]] — np. CNN w przypadku generowania obrazów (DCGAN) lub RNN dla generatywnej mowy.

Architektury GAN można rozbudowywać:

- **DCGAN** — GAN z warstwami konwolucyjnymi
- **Pix2Pix / CycleGAN** — translaty obrazu w obraz
- **StyleGAN** — generowanie realistycznych twarzy
- **Conditional GAN** — GAN z warunkiem (np. generowanie obrazu psa/kota)

## Trening GAN

Trening GAN-a różni się od klasycznego uczenia:

1. Naprzemienne trenowanie D i G:
    - Trenuj D na danych prawdziwych i fałszywych
    - Trenuj G, aby lepiej oszukiwał D
2. Stabilność treningu to wyzwanie — typowe problemy:
    - [[Gradient]] vanishing/exploding
    - Mode collapse (generator zwraca podobne próbki)
3. Techniki stabilizacji:
    - Label smoothing
    - Dropout w D
    - WGAN (Wasserstein GAN) – zmiana funkcji straty na bardziej stabilną
    - Spectral Normalization, BatchNorm

# 💡 Przykład zastosowania

**StyleGAN2** (opracowany przez NVIDIA) generuje bardzo realistyczne twarze, które nie istnieją. Generator przyjmuje losowy wektor i zamienia go w zdjęcie przypominające człowieka. Dyskryminator uczy się, co czyni twarz realistyczną. Na stronie [thispersondoesnotexist.com](https://thispersondoesnotexist.com) można zobaczyć przykłady działania tego podejścia w praktyce.

## 📌 Źródła

- Ian Goodfellow et al., _Generative Adversarial Nets_ (2014): [https://arxiv.org/abs/1406.2661](https://arxiv.org/abs/1406.2661)
- [[Deep Learning]] Specialization by Andrew Ng (GANs module)
- GAN Hacks: [https://github.com/soumith/ganhacks](https://github.com/soumith/ganhacks)
- Papers with Code – GAN Benchmarks: [https://paperswithcode.com/task/image-generation](https://paperswithcode.com/task/image-generation)

## 👽 Brudnopis

- GAN = Generator vs Dyskryminator
- Inspiracja: gra rywalizacyjna (game theory, zero-sum)
- Modele uczą się nawzajem — LLBs learning by competition
- Zaczyna się od losowego z → Generator → output → Dyskryminator
- Przykład: generowanie zdjęć ludzi, deepfake, augmentacja danych
- Triada pojęć: GAN, DCGAN, WGAN
- Dobrze używać z normalnych rozkładów (N(0,1)) jako latent vector
- Trudność: ustabilizowanie treningu (stąd rozwój WGAN, LSGAN, BigGAN itd.)