---
title: Notatniki (Jupyter Notebooks)
created: 2026-02-04
status: evergreen
category: Data Engineering / Tools
difficulty: basic
language: pl
tags:
  - jupyter
  - python
  - data-science
  - prototyping
  - databricks
aliases:
  - Jupyter Notebook
  - Notebooks
  - Zeppelin
---
# 🎯 Definicja
**Notebook (Notatnik)** to interaktywny dokument, który łączy żywy kod (Python, [[SQL|SQL]], R), jego wyniki (wykresy, tabele) i tekst narracyjny (Markdown). To standard pracy Data Scientista.

# 🔑 Kluczowe punkty
- **REPL na sterydach:** Piszesz kawałek kodu, klikasz "Uruchom", widzisz wynik od razu. Nie musisz kompilować całego programu.
- **Narracja:** Możesz opisać to, co robisz ("Tutaj wczytujemy dane"), co ułatwia dzielenie się wiedzą.
- **Środowiska:** Jupyter (standard), Databricks (chmurowy standard dla Big Data), Google Colab (darmowy z GPU).

# 📚 Szczegółowe wyjaśnienie
Notebooki zrewolucjonizowały naukę danych, bo pozwalają na eksperymentowanie.
Wady?
- **State Management:** Jeśli uruchomisz komórki w złej kolejności, stan pamięci może być inny niż myślisz (Hidden State).
- **Wersjonowanie:** Pliki `.ipynb` to brzydki JSON, który ciężko się porównuje w Git ("Git Diff hell").

# 💡 Przykład zastosowania
Analiza sprzedaży.
1. Wczytujesz bibliotekę [[Pandas]].
2. Pobierasz CSV (`df = pd.read_csv(...)`).
3. Wyświetlasz pierwsze 5 wierszy (`df.head()`).
4. Rysujesz wykres słupkowy.
Wszystko w jednym pliku, który możesz wysłać managerowi jako raport PDF.

## 📌 Źródła
- Project Jupyter Documentation.

## 👽 Brudnopis
- Netflix używa notebooków jako zadań produkcyjnych w orkiestratorze (Netflix Scheduler). To kontrowersyjne, ale działa u nich (tzw. "Notebooks in Production").