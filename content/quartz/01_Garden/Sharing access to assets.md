---

title: Sharing access to assets  
created: 2025-07-14  
status: Final  
category: Data Governance  
difficulty: podstawowy  
language: pl  
tags:

- zarządzanie dostępem
- data governance
- uprawnienia
- asset sharing  
aliases:
- udostępnianie zasobów danych
- dostęp do zasobów

---

# 🎯 Definicja

**Sharing access to assets** oznacza proces nadawania innym użytkownikom lub grupom uprawnień dostępu do konkretnego zasobu danych. Zasób może być plikiem, tabelą, zestawem danych, raportem bądź jakimkolwiek elementem zarządzanym w ekosystemie danych. Udostępnianie odbywa się na poziomie zasobu i umożliwia precyzyjne kontrolowanie widoczności oraz zakresu interakcji dla odbiorców.

# 🔑 Kluczowe punkty

- Brak udostępnienia = widoczność wyłącznie dla twórcy (domyślnie).
- Dostęp mogą nadawać jedynie administratorzy lub użytkownicy z uprawnieniami do dzielenia zasobu.
- Dostęp dziedziczony w ramach hierarchii grup: rodzic ↔ podgrupa.
- Grupy wyizolowane nie dziedziczą ani nie przekazują w górę praw dostępu.
- Zarządzanie dostępem w grupie nadrzędnej (Organization parent group) daje dostęp całej organizacji.

# 📚 Szczegółowe wyjaśnienie

## Jak działa udostępnianie zasobów?

Standardowo zasób danych jest prywatny i ma pełny dostęp przypisany jego twórcy.  
Aby inni użytkownicy mogli współpracować na tym zasobie (np. edytować, przeglądać, komentować), twórca, administrator lub steward musi jawnie go udostępnić wybranym grupom lub użytkownikom.

## Dostęp dziedziczony w grupach

- Jeśli zasób zostanie udostępniony grupie nadrzędnej, automatycznie trafi także do każdej grupy podrzędnej.
- Udostępnienie w dół: użytkownicy niżej w strukturze organizacyjnej otrzymują dostęp na wskazanym poziomie.
- Wyjątki stanowią tzw. _izolowane grupy_, które mają zablikowaną dziedziczność — mogą współdzielić dostęp tylko wewnątrz własnego obszaru.

## Rekomendacje i dobre praktyki

- Nie przypisuj użytkowników bezpośrednio do najbardziej nadrzędnej grupy organizacyjnej – spowoduje to ich automatyczny dostęp do wszystkich udostępnionych zasobów.
- Chcąc udostępnić zasób wszystkim użytkownikom – przypisz poziom dostępu do najniższego poziomu wspólnego, czyli głównej grupy organizacyjnej.
- Utrzymuj zarządzanie dostępem grupowe → prostsze w utrzymaniu, skalowalne i czytelniejsze.

# 💡 Przykład zastosowania

Analityk danych tworzy nowy zestaw danych "customer_ltv_2025" i wstępnie go testuje. Domyślnie tylko on ma pełny dostęp. Następnie postanawia przekazać dostęp:

- grupie **Marketing Analyst** z poziomem "read only",
- grupie **Analytics Core** z poziomem "edit",
- oraz grupie **[[Data Governance]]** z poziomem "[[Stewardship]]".

Poprzez właściwe przypisanie dostępu zapewnił współdzielony model pracy bez ryzyka przypadkowego nadpisania danych przez osób nietechniczne.

## 📌 Źródła

- Dokumentacja systemu dostępowego platformy danych (np. Ataccama, Collibra, etc.)
- [Best Practices in Data [[User Management|Access Management]] – Dataversity](https://www.dataversity.net/best-practices-data-access-governance/)

## 👽 Brudnopis

- Domyślnie zasób widoczny tylko dla twórcy → pełny access.
- Użytkownicy z uprawnieniami share mogą przydzielać dostęp do zasobu innym.
- Mechanizm dziedziczenia uprawnień w strukturze grup: parent > child > isolated.
- Organization parent group → jeśli przypisano tam usera = ma wszystko.
- Asset sharing ≠ ownership — ownership ustala steward, sharing = widoczność/interakcja.
- Zasada minimalnego dostępu — lepiej nadawać niż odbierać później.