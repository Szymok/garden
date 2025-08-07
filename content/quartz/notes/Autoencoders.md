---

title: Autoencoders  
created: 2025-07-16  
status:  
category: Deep Learning  
difficulty: średni  
language: pl  
tags:

- Autoencoders
- NeuralNetworks
- ImageDenoising
- DimensionalityReduction  
aliases:

---

# 🎯 Definicja

**Autoenkodery** to rodzaj sieci neuronowych uczących się samodzielnie (uczenie nienadzorowane), których celem jest nauczenie się skutecznej, zwartej reprezentacji (tzw. latentnej reprezentacji) danych wejściowych poprzez ich kompresję i odtworzenie. Model jest trenowany tak, aby wyjście było jak najbardziej zbliżone do wejścia, dzięki czemu sieć zmuszana jest do wychwycenia najważniejszych cech danych.

# 🔑 Kluczowe punkty

- Zbudowane są z dwóch głównych modułów: **enkodera** (kompresuje dane do niższej wymiarowości) i **dekodera** (rekonstruuje dane z reprezentacji latentnej).
- **Często wykorzystywany do redukcji wymiarowości** oraz **odszumiania obrazów** (image denoising).
- Sieć uczona jest przez minimalizację błędu rekonstrukcji między wejściem a wyjściem (np. loss function typu mse).
- Pozwalają wychwycić ukryte, nieliniowe zależności w danych, przewyższając pod tym względem klasyczne metody jak PCA.
- Podstawowe narzędzie do **feature extraction**, wykrywania anomalii, kompresji danych i generowania syntetycznych danych.

# 📚 Szczegółowe wyjaśnienie

## Architektura autoenkodera

- **Encoder:** Odpowiada za przekształcenie wysokowymiarowych wejść do zwartej, latentnej, ukrytej reprezentacji (bottleneck).
- **Latent space (wąskie gardło):** Kluczowy element, który wymusza naukę najbardziej istotnych cech danych. Im mniejsza reprezentacja, tym efektywniejsza kompresja.
- **Decoder:** Z latentnej reprezentacji rekonstruuje dane wyjściowe, starając się jak najwierniej odwzorować oryginalne wejście.

## Tryby użycia i funkcje

- **Redukcja wymiarowości:** Pozwala zamienić dane np. z tysięcy pikseli w obrazie do kilku/kilkunastu współrzędnych latent space.
- **Odszumianie/wygładzanie obrazów:** Autoencoder uczy się rekonstrukcji czystego obrazu, otrzymując jako wejście obraz z szumem.
- **[[Anomaly Detection|Wykrywanie anomalii]]:** Wysoki błąd rekonstrukcji może świadczyć o tym, że dany przypadek odbiega od typowego rozkładu danych.
- **Ekstrakcja cech pod kolejne algorytmy:** Latent space może być "feature input" do klasyfikatorów, klasteryzacji, sieci decyzyjnych itp.
- **[[Generowanie danych]]:** Niektóre warianty, np. variational autoencoders (VAE), służą jako generatory nowe dane podobne do oryginału.

## Loss function i trening

- Najczęściej stosuje się minimalizację **loss function**, mierzącej odległość wejścia i wyjścia, np. MSE (mean squared error), binary cross-entropy, categorical cross-entropy.
- Przez backpropagation autoencoder uczy się optymalnie kodować istotne informacje i rekonstruować input.

## Wariacje i zastosowania

- **Denoising autoencoders** — odporne na szum i uszkodzenia obrazu/audio.
- **Sparse, contractive, variational autoencoders (VAE)** — regularizacje i rozszerzenia do feature engineering, generowania danych, modelowania rozkładów.
- **Adversarial autoencoders/AAE** — łączą cechy GAN i autoencoderów, do generowania/rekonstrukcji zaawansowanych danych.

# 💡 Przykład zastosowania

**Odszumianie obrazu:**  
Autoencoder trenujemy na obrazach, do których celowo dodano szum. Po treningu sieć nauczy się – nawet ze znacznym szumem wejściowym – rekonstruować czysty obraz.

**Redukcja wymiarowości:**  
Autoencoder kompresuje obrazy np. z 256x256 pikseli do 32-wymiarowych wektorów, które można użyć do szybszej klasyfikacji czy grupowania obrazów.

# 📌 Źródła

- [https://en.wikipedia.org/wiki/Autoencoder](https://en.wikipedia.org/wiki/Autoencoder)
- [https://www.ibm.com/think/topics/autoencoder](https://www.ibm.com/think/topics/autoencoder)
- [https://www.jeremyjordan.me/autoencoders/](https://www.jeremyjordan.me/autoencoders/)
- [https://fingerprints.digital/en/expert-zone/autoencoder-deep-learning-swiss-army-knife/](https://fingerprints.digital/en/expert-zone/autoencoder-deep-learning-swiss-army-knife/)
- [https://milvus.io/ai-quick-reference/what-is-an-autoencoder](https://milvus.io/ai-quick-reference/what-is-an-autoencoder)
- [https://www.datacamp.com/tutorial/introduction-to-autoencoders](https://www.datacamp.com/tutorial/introduction-to-autoencoders)
- [https://viso.ai/deep-learning/autoencoder/](https://viso.ai/deep-learning/autoencoder/)
- [https://www.simplilearn.com/tutorials/deep-learning-tutorial/what-are-autoencoders-in-deep-learning](https://www.simplilearn.com/tutorials/deep-learning-tutorial/what-are-autoencoders-in-deep-learning)
- [https://www.v7labs.com/blog/autoencoders-guide](https://www.v7labs.com/blog/autoencoders-guide)

# 👽 Brudnopis

- Autoencoder = unsupervised, bottleck, reconstruction
- Encoder + bottleneck + decoder
- Loss function = reconstruction error (MSE etc)
- Denoising AE, VAEs, AAE, contractive/sparse
- Feature extraction, [[anomaly detection]], synthetic data, dimensionality reduction, image processing
- Przewaga nad PCA: modelowanie nieliniowe, większa elastyczność (deep, convolutional, seq2seq)
- Przykłady: MNIST denoising, face recognition, latent space jako input do klasyfikatora