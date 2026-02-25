---
title: Getting Eyes on It
created: 2026-02-23
status: 
category: 
difficulty: 
language: pl
tags:
  - 
aliases:
  - 
---
# ðŸŽ¯ Definicja

Zasada **"Getting Eyes on It"** opiera siÄ™ na przekonaniu, Å¼e bÅ‚Ä™dy sÄ… Å‚atwiejsze do wykrycia i naprawienia, gdy kod lub proces jest poddawany inspekcji przez wiele osÃ³b. Zgodnie z Prawem Linusa: *"Przy odpowiedniej liczbie oczu wszystkie bÅ‚Ä™dy sÄ… nieistotne"* (Given enough eyeballs, all bugs are shallow).

# ðŸ”‘ Kluczowe punkty

*   **Katedra vs. Bazar:** Model zamkniÄ™ty (elitarne grono) vs. model otwarty (kaÅ¼dy moÅ¼e patrzeÄ‡ i poprawiaÄ‡).
*   **Pull Request (PR) Review:** Krytyczny mechanizm weryfikacji zmian przez innych deweloperÃ³w przed ich wdroÅ¼eniem.
*   **Artefakty pierwszej klasy:** Procesy (np. wersjonowanie, buildy), ktÃ³rych zespÃ³Å‚ nie porzuci nawet pod presjÄ… terminÃ³w.
*   **Analiza statyczna:** Automatyczne skanowanie kodu (np. SonarQube) w poszukiwaniu bÅ‚Ä™dÃ³w logicznych i luk bezpieczeÅ„stwa.
*   **Shift Left:** Wykrywanie problemÃ³w jak najwczeÅ›niej w cyklu produkcyjnym.

# ðŸ“š SzczegÃ³Å‚owe wyjaÅ›nienie

Problemy w systemach nie biorÄ… siÄ™ znikÄ…d â€“ sÄ… tam umieszczane przez ludzi. Aby zminimalizowaÄ‡ ich liczbÄ™, musimy celowo wprowadzaÄ‡ mechanizmy inspekcji. Bazar (model Open Source) jest skuteczny, poniewaÅ¼ duÅ¼a liczba recenzentÃ³w sprawia, Å¼e deweloperzy bardziej dbajÄ… o jakoÅ›Ä‡ swoich wkÅ‚adÃ³w.

W Å›rodowisku korporacyjnym "oczy na kod" zapewniamy poprzez:
1.  **Automatyczne buildy PR:** SprawdzajÄ…, czy kod siÄ™ kompiluje i czy przechodzi testy jednostkowe.
2.  **Human Review:** Senior deweloperzy patrzÄ… na logikÄ™ i wymagania biznesowe.
3.  **Analiza statyczna:** NarzÄ™dzia programistycznie sprawdzajÄ… standardy (np. czy nie ma hardkodowanych haseÅ‚).

Otwarcie kodu (Open Sourcing) to najbardziej ekstremalna forma tej zasady, ktÃ³ra pozwala uÅ¼ytkownikom na samodzielne znajdowanie i naprawianie bÅ‚Ä™dÃ³w, o ile nie zagraÅ¼a to wÅ‚asnoÅ›ci intelektualnej firmy.

# ðŸ’¡ PrzykÅ‚ad zastosowania

*   **SonarQube w CI/CD:** Skonfigurowanie skanera tak, aby blokowaÅ‚ build, jeÅ›li deweloper zapomni o obsÅ‚udze wartoÅ›ci `null` lub zostawi hasÅ‚o w kodzie. NarzÄ™dzie od razu wyjaÅ›nia, dlaczego to bÅ‚Ä…d i jak go naprawiÄ‡, co edukuje zespÃ³Å‚.
*   **Zablokowanie Main Branch:** UniemoÅ¼liwienie bezpoÅ›redniego merge'owania do gÅ‚Ã³wnej gaÅ‚Ä™zi bez zatwierdzonego Pull Requesta i udanego buildu testowego.

## ðŸ“Œ Å¹rÃ³dÅ‚a

## ðŸ‘½ Brudnopis

It's important to understand how problems get into a system. They don't fly in the window.
