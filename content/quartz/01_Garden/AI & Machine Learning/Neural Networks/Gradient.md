---
title: Gradient (Kierunek Zmiany)
created: 2026-02-04
status: evergreen
category: Machine Learning / Math
difficulty: advanced
language: pl
tags:
  - calculus
  - optimization
  - backpropagation
  - descent
aliases:
  - Gradient Descent
  - Pochodna
---
# 🎯 Definicja
**Gradient** to wektor matematyczny, który pokazuje kierunek najszybszego wzrostu funkcji. W uczeniu maszynowym używamy go "na odwrót" (minus gradient), aby znaleźć kierunek najszybszego **spadku** błędu (Loss Function). To kompas, który mówi modelowi: "Zmień wagi w tę stronę, żeby wynik był lepszy".

# 🔑 Kluczowe punkty
- **Gradient Descent:** Algorytm "schodzenia z góry we mgle". Patrzysz pod nogi (liczysz gradient) i robisz krok w dół.
- **Backpropagation:** Metoda liczenia gradientu dla każdej wagi w sieci neuronowej (od końca do początku).
- **Learning Rate:** Wielkość kroku. Za duży = przeskoczysz dołek. Za mały = będziesz schodzić wieki.

# 📚 Szczegółowe wyjaśnienie
Dla funkcji jednej zmiennej gradient to po prostu pochodna.
Dla wielu zmiennych (a sieci mają miliony parametrów), gradient to wektor pochodnych cząstkowych.
Jeśli Gradient = 0, to znaczy, że jesteśmy na płaskim (szczyt, dno lub siodło). Szukamy globalnego dna (Global Minimum błędu).

# 💡 Przykład zastosowania
Model przewiduje cenę mieszkania i myli się o 50 tys. zł.
Obliczamy gradient funkcji błędu.
Gradient mówi: "Jeśli zwiększysz wagę 'powierzchnia' o 0.01 i zmniejszysz wagę 'wiek budynku' o 0.005, błąd spadnie".
Model aktualizuje wagi (Optimizer Step).
W kolejnej rundzie błąd wynosi już tylko 48 tys. zł.
Powtarzamy milion razy.

## 📌 Źródła
- "Calculus for [[Machine Learning|Machine Learning]]".

## 👽 Brudnopis
- Problemy z gradientem:
    - **Vanishing Gradient:** Gradient bliski zera, sieć przestaje się uczyć (typowe dla głębokich sieci z Sigmoidem).
    - **Exploding Gradient:** Gradient rośnie do nieskończoności, wagi wybuchają (NaN).