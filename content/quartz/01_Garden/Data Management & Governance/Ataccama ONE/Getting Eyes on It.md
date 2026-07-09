---
title: Getting Eyes on It
created: 2026-02-23
status: 🌱 draft
category: 
difficulty: 
language: pl
tags:
  - 
aliases:
  - 
---
# 🎯 Definicja

Zasada **"Getting Eyes on It"** opiera się na przekonaniu, że błędy są łatwiejsze do wykrycia i naprawienia, gdy kod lub proces jest poddawany inspekcji przez wiele osób. Zgodnie z Prawem Linusa: *"Przy odpowiedniej liczbie oczu wszystkie błędy są nieistotne"* (Given enough eyeballs, all bugs are shallow).

# 🔑 Kluczowe punkty

*   **Katedra vs. Bazar:** Model zamknięty (elitarne grono) vs. model otwarty (każdy może patrzeć i poprawiać).
*   **Pull Request (PR) Review:** Krytyczny mechanizm weryfikacji zmian przez innych deweloperów przed ich wdrożeniem.
*   **Artefakty pierwszej klasy:** Procesy (np. wersjonowanie, buildy), których zespół nie porzuci nawet pod presją terminów.
*   **Analiza statyczna:** Automatyczne skanowanie kodu (np. SonarQube) w poszukiwaniu błędów logicznych i luk bezpieczeństwa.
*   **Shift Left:** Wykrywanie problemów jak najwcześniej w cyklu produkcyjnym.

# 📚 Szczegółowe wyjaśnienie

Problemy w systemach nie biorą się znikąd – są tam umieszczane przez ludzi. Aby zminimalizować ich liczbę, musimy celowo wprowadzać mechanizmy inspekcji. Bazar (model Open Source) jest skuteczny, ponieważ duża liczba recenzentów sprawia, że deweloperzy bardziej dbają o jakość swoich wkładów.

W środowisku korporacyjnym "oczy na kod" zapewniamy poprzez:
1.  **Automatyczne buildy PR:** Sprawdzają, czy kod się kompiluje i czy przechodzi testy jednostkowe.
2.  **Human Review:** Senior deweloperzy patrzą na logikę i wymagania biznesowe.
3.  **Analiza statyczna:** Narzędzia programistycznie sprawdzają standardy (np. czy nie ma hardkodowanych haseł).

Otwarcie kodu (Open Sourcing) to najbardziej ekstremalna forma tej zasady, która pozwala użytkownikom na samodzielne znajdowanie i naprawianie błędów, o ile nie zagraża to własności intelektualnej firmy.

# 💡 Przykład zastosowania

*   **SonarQube w CI/CD:** Skonfigurowanie skanera tak, aby blokował build, jeśli deweloper zapomni o obsłudze wartości `null` lub zostawi hasło w kodzie. Narzędzie od razu wyjaśnia, dlaczego to błąd i jak go naprawić, co edukuje zespół.
*   **Zablokowanie Main Branch:** Uniemożliwienie bezpośredniego merge'owania do głównej gałęzi bez zatwierdzonego Pull Requesta i udanego buildu testowego.

## 📌 Źródła

## 👽 Brudnopis

It's important to understand how problems get into a system. They don't fly in the window.
