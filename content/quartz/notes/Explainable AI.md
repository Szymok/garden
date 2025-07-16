---

title: Explainable AI  
created: 2025-07-16  
status: Final  
category: Sztuczna Inteligencja  
difficulty: średniozaawansowany  
language: pl  
tags:

- AI
- sztuczna inteligencja
- explainability
- transparentność modeli
- XAI  
aliases:
- wyjaśnialna AI
- explainability
- XAI
- interpretowalność modeli

---

# 🎯 Definicja

**Explainable AI (XAI)** — czyli wyjaśnialna sztuczna inteligencja — to podejście obejmujące metody, techniki i narzędzia, które pozwalają **zrozumieć, prześledzić i uzasadnić decyzje podejmowane przez modele sztucznej inteligencji**. Celem XAI jest zwiększenie przejrzystości działania algorytmów, ułatwienie zaufania u użytkowników i wsparcie zgodności z regulacjami prawnymi (np. RODO, AI Act).

# 🔑 Kluczowe punkty

- Wyjaśnialność dotyczy zarówno **modeli typu black-box**, jak i **modeli interpretable-by-design**.
- Kluczowe pytania XAI: **Dlaczego model podjął taką decyzję?**, **Które cechy miały wpływ?**, **Co zmieniłoby wynik?**
- XAI zwiększa zaufanie (trust), bezpieczeństwo (safety), oraz ułatwia debugowanie modeli (model diagnostics).
- Stosowane szczególnie w obszarach krytycznych: finanse, zdrowie, ubezpieczenia, sektor publiczny.
- Może dotyczyć predykcji pojedynczej instancji (local explanation) lub działania całego modelu (global explanation).

# 📚 Szczegółowe wyjaśnienie

## Główne metody Explainable AI

|Metoda|Opis|
|---|---|
|**SHAP (SHapley Values)**|Oblicza wkład każdej cechy w decyzję modelu, inspirowane teorią gier.|
|**LIME**|Tworzy lokalny model interpretable wokół pojedynczego przykładu.|
|**Feature Importance**|Informuje, które cechy najbardziej wpływają na wyniki modelu globalnie.|
|**Partial Dependence Plots**|Pokazują, jak predykcja zmienia się przy zmianie konkretnej cechy.|
|**Counterfactual Explanations**|Co musiałoby się zmienić, aby decyzja modelu była inna.|

## Wyjaśnialność lokalna vs globalna

- **Globalna**: dotyczy całego modelu – ogólne cechy decyzyjne, ważność atrybutów.
- **Lokalna**: dotyczy konkretnego przypadku – dlaczego klient X został oznaczony jako "ryzykowny"?

## Explainability vs Interpretability

- **Interpretability** – stopień, w jakim człowiek może zrozumieć strukturę/model (np. regresja liniowa).
- **Explainability** – umiejętność _wyjaśniania_ działania złożonych, często czarnych skrzynek (np. sieci neuronowe), najczęściej przez warstwę interpretacyjną.

## Wyzwania XAI

- Ograniczona przejrzystość modeli typu black-box (np. DL, LLM)
- Ryzyko zbytniego uproszczenia (faithfulness vs comprehensibility)
- Trade-off: dokładność vs wyjaśnialność
- Wymogi regulacyjne dla AI – wyjaśnialność staje się obowiązkiem

# 💡 Przykład zastosowania

W instytucji finansowej model predykcyjny ocenia ryzyko kredytowe. Na poziomie każdej decyzji system z XAI (np. SHAP) wskazuje, które czynniki wpłynęły najbardziej: np. „brak historii kredytowej”, „zbyt duże zadłużenie”, „wielokrotny brak terminowości płatności”. Dzięki temu analityk może wyjaśnić klientowi wynik decyzji i bronić go przed regulatorem.

## 📌 Źródła

- [https://christophm.github.io/interpretable-ml-book/](https://christophm.github.io/interpretable-ml-book/)
- [https://shap.readthedocs.io/](https://shap.readthedocs.io/)
- [https://lime-ml.readthedocs.io/en/latest/](https://lime-ml.readthedocs.io/en/latest/)
- DARPA XAI Program Overview
- [https://pair-code.github.io/what-if-tool/](https://pair-code.github.io/what-if-tool/)

## 👽 Brudnopis

- XAI ≠ Pełna przejrzystość, ale warstwa tłumacząca – co, dlaczego i jakby było inaczej
- SHAP = interpretacja → kontekst wpływu featurów
- LIME = działa przez lokalne linearyzowanie black boxa
- faithfulness ≠ intelligibility → zrozumiałe != w pełni zgodne z modelowym wnętrzem
- rosnące znaczenie przy RLHF i LLM: „dlaczego wygenerował taki tekst”
- narzędzia: SHAP, LIME, Captum (PyTorch), What-If Tool (TF), ELI5

---