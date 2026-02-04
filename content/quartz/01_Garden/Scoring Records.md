---
title: Scoring Records (Ataccama DQ)
created: 2026-02-04
status: evergreen
category: Ataccama ONE / DQ
difficulty: advanced
language: en
tags:
  - dq
  - scoring
  - explanation
  - monitoring
  - validation
aliases:
  - Punktacja Rekordów
  - DQ Score
---
# 🎯 Definicja
**Scoring Records** to mechanizm oceniania "jak bardzo zły" jest dany rekord.
Zamiast binarnego "Dobry/Zły", dostajesz punkty (Score).
Np. `Score = 0` (Idealny), `Score = 100` (Literówka), `Score = 1,000,000` (Brak ID).

# 🔑 Kluczowe punkty
- **Priorytetyzacja:** Pozwala odróżnić błahe błędy od krytycznych w raportach.
- **Explanation Codes:** Do każdego Score musi być kod wyjaśnienia (np. `INVALID_EMAIL`), żeby analityk wiedział, skąd te punkty.
- **Agregacja:** W raporcie widzisz "Średni Score" lub "Liczbę rekordów z Score > 1000".

# 📚 Szczegółowe wyjaśnienie
Model punktacji w Ataccama często wygląda tak:
- `0`: Valid.
- `< 1,000`: Drobna korekta (np. usunięcie spacji).
- `< 10,000`: Poważna korekta (np. zmiana `W-wa` na `Warszawa`).
- `> 1,000,000`: Błąd krytyczny (rekord odrzucony).
Score nadajesz w logice reguły (`Condition Builder` lub `Expression`).

# 💡 Przykład zastosowania
Masz milion klientów. 100 tysięcy ma błędy.
Których naprawiać najpierw?
Sortujesz po Score malejąco.
Na górze widzisz rekordy bez Nazwiska i PESELu (Score 5 mln). To są "duchy", które psują raporty.
Na dole widzisz rekordy, gdzie w ulicy jest literówka "Ul." zamiast "ul." (Score 50). To może poczekać.

## 📌 Źródła
- Ataccama ONE DQ Scoring Guide.

## 👽 Brudnopis
- Pamiętaj o kolumnach technicznych: `sco_email` (liczba) i `exp_email` (kod). To standard w Ataccama.