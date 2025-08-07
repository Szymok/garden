---

title: Transfer Learning  
created: 2025-07-16  
status: Final  
category: Sztuczna inteligencja / Uczenie maszynowe  
difficulty: średniozaawansowany  
language: pl  
tags:

- uczenie maszynowe
- transfer learning
- AI
- modele pretrenowane
- deep learning  
aliases:
- uczenie transferowe
- transfer wiedzy
- transfer modeli

---

# 🎯 Definicja

**Transfer Learning** (uczenie transferowe) to technika w uczeniu maszynowym, która polega na ponownym wykorzystaniu wiedzy zdobytej przez model podczas rozwiązywania jednego zadania (źródłowego) do przyspieszenia i ulepszenia uczenia się na zadaniu pokrewnym (docelowym).

Zamiast trenować model od zera, stosuje się model wstępnie wytrenowany ([[Pretrained models|pretrained]] model), który następnie jest **dostrajany (fine-tuned)** lub wykorzystywany jako ekstraktor cech (feature extractor) dla nowego przypadku użycia.

# 🔑 Kluczowe punkty

- Pozwala trenować skuteczne modele przy **mniejszej liczbie danych i mniejszym wysiłku obliczeniowym**.
- Powszechnie stosowany w komputerowym rozpoznawaniu obrazów, NLP i audio.
- Przykład: użycie modelu BERT lub GPT do klasyfikacji tekstu po jego dostrojeniu.
- Może działać na poziomie:
    - Przeniesienia **struktur modelu**
    - Przeniesienia **wag (weights)** i warstw
    - Wykorzystania jako **zamrożony ekstraktor cech**

# 📚 Typowe scenariusze Transfer Learning

|Scenariusz|Opis|
|---|---|
|**Feature Extraction**|Zamrożenie wag pretrenowanego modelu i wykorzystanie jego wyjść jako cech wejściowych do nowej warstwy klasyfikacji.|
|**Fine-Tuning**|Dostosowanie (części lub całości) wag pretrenowanego modelu do nowego zadania na mniejszych danych.|
|**Zero-shot / Few-shot**|Wykorzystywanie modelu bez ponownego treningu, tylko z odpowiednim sformułowaniem promptu (np. [[Base LLM\|LLM]]).|

## Proces Transfer Learningu

1. **Wybór modelu pretrenowanego** (np. ResNet, BERT, GPT, VGG, ViT).
2. **Zamrożenie wybranych warstw** lub pozostawienie ich do dalszego treningu.
3. **Dostosowanie ostatnich warstw do nowej liczby klas lub formy wyjściowej.**
4. **Trenowanie nowej głowicy / całego modelu** z nowymi danymi.
5. (Opcjonalnie) **eksport i deployment** modelu dostrojonego.

# 🧠 Przykład: NLP

Użycie modelu `bert-base-uncased` do klasyfikacji recenzji filmu:

```python
from transformers import BertForSequenceClassification, Trainer

model = BertForSequenceClassification.from_pretrained("bert-base-uncased", num_labels=2)
# Fine-tuning na zadaniu binarnej klasyfikacji (np. sentyment: pozytywny/negatywny)
```

# 🖼️ Przykład: Vision

Dostrajanie ResNet50 do klasyfikacji medycznych obrazów (np. zmiany skórne):

```python
from torchvision.models import resnet50

model = resnet50(pretrained=True)
# Zamroź warstwy wcześniej uczone na ImageNet
for param in model.parameters():
    param.requires_grad = False

# Trenuj tylko ostatnią (nową) warstwę klasyfikującą
model.fc = torch.nn.Linear(2048, 3)  # np. 3 klasy chorób skóry
```

# 💡 Zastosowania

- Rozpoznawanie obrazów i OCR
- Klasyfikacja sentymentu i analiza treści tekstowej
- Medycyna (diagnoza obrazowa, segmentacja)
- Chatboty i asystenci AI
- Systemy rekomendacji
- Detekcja obiektów i transkrypcja audio

# ✅ Zalety

- Oszczędność zasobów (czas, dane, moc obliczeniowa)
- Lepsze wyniki przy ograniczonych danych
- Łatwiejsza adaptacja modeli uniwersalnych do problemów domenowych

# ⚠️ Wyzwania

- Nie dla każdej domeny da się zastosować bez dopasowania
- Efekt "katastrofalnego zapominania", jeśli fine-tuning jest agresywny
- Wymaga wiedzy o strukturze oryginalnego modelu

# 📌 Źródła

- [https://huggingface.co/docs/transformers/training](https://huggingface.co/docs/transformers/training)
- [https://www.tensorflow.org/tutorials/images/transfer_learning](https://www.tensorflow.org/tutorials/images/transfer_learning)
- [https://sebastianraschka.com/blog/2020/model-transfer-learning.html](https://sebastianraschka.com/blog/2020/model-transfer-learning.html)
- [https://cs231n.github.io/transfer-learning/](https://cs231n.github.io/transfer-learning/)

## 👽 Brudnopis

- transfer learning = fundamentalna technika XXI w [[Uczenie Maszynowe|ML]]
- GPT = jeden wielki transfer modelu językowego + prompting
- używany wszędzie: medycyna, NLP, wizja
- fine-tune = adjust, feature extraction = zamrożenie
- tensorflow hub, huggingface, torchvision → źródła modeli

---