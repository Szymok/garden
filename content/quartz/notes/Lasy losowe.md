---

title: "Lasy losowe"  
created: 2025-07-16  
status: Final  
category: Uczenie maszynowe  
difficulty: średniozaawansowany  
language: pl  
tags:

- uczenie maszynowe
- random forest
- bagging
- model ensemble
- interpretacja modeli  
aliases:
- random forest
- bagging trees
- las drzew decyzyjnych

---

# 🎯 Definicja

**Lasy losowe** (Random Forest) to złożony model [[Uczenie Maszynowe|machine learning]] typu ensemble, który buduje wiele drzew decyzyjnych (każde na losowo wybranej próbce danych oraz z losowym podzbiorem cech) i uśrednia ich decyzje (klasyfikacja: głosowanie, regresja: średnia) w celu uzyskania bardziej stabilnych i odpornych na przeuczenie predykcji.

# 🔑 Kluczowe punkty

- Random Forest = **wiele drzew decyzyjnych** + **losowy wybór cech oraz danych dla każdego drzewa** + **uśrednianie predykcji**.
- Metoda **bagging** (bootstrap aggregating): każde drzewo powstaje na nieco innym losowym podzbiorze obserwacji oraz (częściowo) cech.
- Główna zaleta: **odporność na nadmierne dopasowanie** przy zachowaniu wysokiej jakości predykcji.
- Wspiera: klasyfikację, regresję, ranking ważności cech (feature importance), interpretacje modelu i szacowanie pewności predykcji (variance/uncertainty).
- Każde drzewo może być bardzo głębokie (overfitowane), ale całe leśne ensemble nie przeucza się tak łatwo dzięki baggingowi.

# 📚 Szczegółowe wyjaśnienie

## Jak działa Random Forest?

1. **Budowa wielu drzew:** Na każdym bootstrapowanym podzbiorze danych (zwracanie z powrotem) i podzbiorze losowych cech trenowane jest osobne drzewo decyzyjne.
2. **Decyzja zbiorcza:** Klasyfikacja – głosowanie większościowe, regresja – średnia z predykcji wszystkich drzew.
3. **Wybór cech do splitów:** W każdym węźle drzewa wybierany jest losowy podzbiór cech – zwiększa to różnorodność drzew.
4. **Out-of-Bag error (OOB):** Każde drzewo nie widzi części danych treningowych — predykcje dla tych próbek służą do „walidacji wewnętrznej” całego lasu.

## Kluczowe komponenty i parametry

|Parametr|Znaczenie|
|---|---|
|n_estimators|Liczba drzew w lesie (typowo 100–1000+)|
|max_features|Liczba losowych cech branych pod uwagę przy każdym splocie|
|max_depth|Maksymalna głębokość drzew (często ustawiana na None)|
|oob_score|Czy liczyć OOB error (domyślny walidator underbagging)|

## Feature importance w lasach losowych

- Model pozwala mierzyć, które cechy najczęściej biorą udział w podziale drzewa i ile przyczyniają się do poprawy podziału wg indeksu gini/entropii.
- Ważność cech można łatwo zobaczyć (`clf.feature_importances_` w sklearn).
- **Nie zależy od typu cechy** – działa dla kolumn liczbowych i kategorycznych.

## Partial Dependence i interpretacje

- Możemy ocenić wpływ pojedynczej cechy (lub dwóch – 2D) na predykcję: jak zmienia się wynik jeśli tylko tę cechę modyfikujemy.
- Partial dependence nie jest w 100% jednoznaczna w obecności silnych interakcji cech.

## Zalety Random Forest

|Zaleta|Opis|
|---|---|
|Odporny na przeuczenie|Dodanie kolejnych drzew raczej nie psuje modelu|
|Obsługuje cechy kategoryczne / bez normalizacji|Nie wymaga dummy variables, standaryzacji, radzi sobie z wieloma typami cech|
|Mało wrażliwy na outliery|Nie reaguje drastycznie na wartości odstające w danych|
|Brak potrzeby przycinania|Głębokie drzewa same się „uspokajają” w agregacji|
|Możliwość szacowania niepewności (variance)|Rozrzut predykcji drzew informuje o pewności wyniku|

## Najlepsze praktyki i workflow

- **Zaczynaj od prostych modeli (OneR, TwoR) jako baseline.**
- **Analiza cech:** RF daje prostą interpretację ważności; nieistotne cechy można usunąć.
- **Bagging** = klucz do stabilności, nawet przy modelach mocno dopasowanych.
- **Automatyzacja (Kaggle):** predykcje eksportuj do csv:
    
    ```python
    import pandas as pd
    preds = model.predict(X_test)
    pd.DataFrame({'Id': test_ids, 'Prediction': preds}).to_csv('submission.csv', index=False)
    ```
    
- **Szybka iteracja:** Zacznij od modelu bazowego, codziennie poprawiaj hyperparametry, szybka walidacja na OOB lub valid set.

## Częste pytania

|Pytanie|Odpowiedź|
|---|---|
|Czy więcej drzew = lepiej?|W większości przypadków tak, z malejącym efektem przyrostu, czas rośnie liniowo.|
|Czy można przeuczyć RF?|Bardzo trudno, przeucza się przy bardzo małej liczbie drzew i głębokim drzewie.|
|Czy cechy losowe „zaśmiecą” las?|Model je często ignoruje, o ile nie są wysoce skorelowane.|
|Czy OOB eliminuje potrzebę validation set?|W praktyce do wczesnej walidacji, jednak submission waliduj na osobnym zbiorze.|
|Czy RF = tylko klasyfikacja?|Nie — równie dobrze regresja i ranking (np. feature importance).|
|Bagging vs Boosting|RF = bagging drzew + losowanie cech; boosting (XGBoost/LightGBM) = kolejne modele poprawiają błędy poprzednich.|

# 💡 Przykład zastosowania

Na konkursie Kaggle (np. Titanic, Tabular Playground) tworzysz Random Forest (100 drzew), eksportujesz predykcje do pliku CSV, analizujesz feature importance i iteracyjnie poprawiasz parametry i preprocessing. RF pozwala automatycznie radzić sobie z outlierami, konwersjami kategorii (np. `embarked`), nie wymaga logowania/standaryzacji taryf ani martwienia się o liniowość. Cel: szybki, pewny „benchmark” często dla dalszego rozwoju lub stacking'u.

# 📌 Źródła

- [https://scikit-learn.org/stable/modules/generated/sklearn.ensemble.RandomForestClassifier.html](https://scikit-learn.org/stable/modules/generated/sklearn.ensemble.RandomForestClassifier.html)
- [https://book.fast.ai/](https://book.fast.ai/)
- [https://en.wikipedia.org/wiki/Random_forest](https://en.wikipedia.org/wiki/Random_forest)
- [https://rpubs.com/partha_mukherjee/RandomForest](https://rpubs.com/partha_mukherjee/RandomForest)
- [https://www.kaggle.com/learn/overview](https://www.kaggle.com/learn/overview)

## 👽 Brudnopis

- random forest = first-resort model dla KAŻDEGO problemu tabelarycznego
- bardzo elastyczny, wysokie baseline, key w autoML i notebookach Kaggle
- OneR/TwoR: świetne proste baseline, interpretacja przez pojedyncze reguły
- najczęstszy błąd: brak usuwania kolumn kompletnie losowych
- explainer: pdpbox, shap, skater – do dogłębnej interpretacji predykcji
- nie potrzebuje feature scalingu, discards collinear features
- stacking: randomized forest + XGB/LightGBM + NN = top 1% Kaggle

---