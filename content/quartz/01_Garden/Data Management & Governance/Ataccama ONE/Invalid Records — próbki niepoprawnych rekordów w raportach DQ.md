---
title: Invalid Records (Próbki Błędów DQ)
created: 2026-02-04
status: evergreen
category: Data Quality / Ataccama
difficulty: intermediate
language: pl
tags:
  - data-quality
  - monitoring
  - troubleshooting
  - debugging
  - invalid-samples
aliases:
  - Próbki błędów
  - Show invalid samples
  - Rekordy Invalid
---
# 🎯 Definicja
**Invalid Records** (Próbki Niepoprawnych Rekordów) to funkcja w [[Ataccama|Ataccama]] ONE, która pozwala podejrzeć **przykładowe wiersze**, które nie przeszły reguł jakości danych. Zamiast widzieć tylko statystykę ("5 błędów"), widzisz konkretne dane ("Janusz Kowalski, email: janusz at pl"), co pozwala zrozumieć przyczynę problemu.

# 🔑 Kluczowe punkty
- **Kontekst:** Widzisz cały wiersz, nie tylko błędną kolumnę.
- **Konfiguracja:** Możesz ustawić limit próbek (np. 100 sztuk), aby nie zapychać bazy.
- **Bezpieczeństwo:** Pamiętaj, że próbki mogą zawierać dane wrażliwe (PII). Można wyłączyć tę funkcję dla danych poufnych.

# 📚 Szczegółowe wyjaśnienie
Gdy uruchamiasz Monitoring Projekt (DQ):
1. System sprawdza miliony rekordów.
2. Wylicza statystyki (np. 95% poprawności).
3. Dla tych 5% błędnych - zapisuje losową próbkę (Samples) do bazy ONE, abyś mógł je obejrzeć w GUI ("Show invalid samples").
Jeśli potrzebujesz **wszystkich** błędnych rekordów (a nie tylko próbki), musisz skonfigurować **Export**, a nie polegać na próbkach.

# 💡 Przykład zastosowania
Reguła "Walidacja Telefonu" pokazuje 20% błędów.
Steward klika "Show invalid samples".
Widzi: `123-456-789`, `(22) 123 45 67`, `+48 123...`.
Wniosek: Dane są poprawne, ale w różnych formatach. Reguła jest zbyt restrykcyjna (wymagała samych cyfr).
Działanie: Steward poprawia regułę, zamiast czyścić dane.

## 📌 Źródła
- [[Ataccama|Ataccama]] ONE Documentation - Monitoring Projects.

## 👽 Brudnopis
- Próbki to potężne narzędzie diagnostyczne ("Debugowanie danych").
- W GUI Ataccamy często dostępne pod "trzech kropkami" przy wyniku reguły.