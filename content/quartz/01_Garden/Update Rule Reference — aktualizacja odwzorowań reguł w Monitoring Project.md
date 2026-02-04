---
title: Update Rule Reference — aktualizacja odwzorowań reguł w Monitoring Project 
created: 2025-08-08 
status: in-review 
category: data-quality
difficulty: intermediate 
language: pl 
tags:
- data-quality
- monitoring-projects
- dq-rules
- governance
- versioning
- ataccama-one 
aliases:
- update-rule-reference
- rule-updates
- outdated-rules-notifications
---

# 🎯 Definicja 
Update Rule Reference to proces uaktualniania przypiętych w projekcie [[Monitoring Project|Monitoring]] Project reguł DQ do ich najnowszych wersji, gdy źródłowe definicje reguł uległy zmianie. System powiadamia o nieaktualnych odwołaniach na ekranie Configuration & Results i pozwala zaktualizować wszystkie, wybrane katalogowe lub pojedyncze reguły po przeglądzie różnic.

# 🔑 Kluczowe punkty

- Powiadomienia: alert o edycji reguł pojawia się w Configuration & Results (outdated [[Rules]]).
- Zakres aktualizacji: cały projekt (Update for this project), pojedynczy Catalog Item (update for this catalog item) lub wybrane reguły.
- Identyfikacja: przestarzałe reguły oznaczone ikoną żarówki przy atrybutach.
- Przegląd zmian: See the details → Preview changes → Update Rule.
- Sterowanie powiadomieniami: admin aplikacji włącza/wyłącza globalnie przez trait core:reference.
- Ograniczenie: zmiana trait po przypięciu reguł nie działa wstecz na już zastosowane reguły.
- Dobre praktyki: przegląd różnic przed aktualizacją, testy na itemie pilotażowym, publikacja po zmianach.

# 📚 Szczegółowe wyjaśnienie

- Kiedy i gdzie widzisz alerty
    - W [[Monitoring Project|Monitoring]] Project, zakładka Configuration & Results pokazuje, że niektóre przypięte reguły mają nowsze wersje w bibliotece reguł.
    - Notyfikacje mogą być globalnie kontrolowane przez admina (trait core:reference).
- Tryby aktualizacji
    - Projektowo: wybierz Update for this project, aby uaktualnić wszystkie przestarzałe odwołania w ramach projektu.
    - Per Catalog Item: wybierz update for this catalog item na widoku konkretnego itemu.
    - Selektownie: na liście atrybutów znajdź pozycje z ikoną żarówki, kliknij regułę → See the details → Preview changes → Update Rule.
- Przepływ “Preview changes”
    - Otwiera ekran porównania (np. zmiany warunków, parametrów, wersji logiki).
    - Zweryfikuj wpływ (atrybuty, progi, Explanation Codes/Scoring, jeśli dotyczy).
    - Zatwierdź Update Rule, następnie opublikuj zmiany projektu (Publish) i uruchom Run [[Monitoring Project|Monitoring]], jeśli chcesz wykonać ewaluację.
- Administracja i governance
    - core:reference trait: włącza/wyłącza pokazywanie powiadomień dla wszystkich użytkowników.
    - Brak retroaktywności: jeśli trait zostanie zmieniony po przypięciu reguł w projekcie, nie obejmie tych już przypiętych referencji.
    - Rekomendacja: utrzymuj politykę wersjonowania reguł i okno serwisowe na aktualizacje w krytycznych projektach.
- Dobre praktyki i pułapki
    - Najpierw selektywnie: testowo zaktualizuj jeden Catalog Item, sprawdź wyniki (diff wskaźników, rozkład INVALID).
    - Dokumentuj zmiany: zapisz przyczynę aktualizacji i wpływ (np. w notatce projektu lub ticketach).
    - Uważaj na zmiany semantyczne reguł (np. ostrzejsze warunki) — mogą zwiększyć odsetek błędów i wpłynąć na SLA DQ.
    - Po aktualizacji pamiętaj o Publish; inaczej Run [[Monitoring Project|Monitoring]] użyje poprzedniej konfiguracji.

# 💡 Przykład zastosowania
- Scenariusz: Aktualizacja reguły EMAIL_FORMAT_VALIDATION w projekcie klientów
    1. W Configuration & Results pojawia się alert o nowszej wersji reguły dla dim_customer (ikona żarówki przy email).
    2. Klikasz regułę przy atrybucie email → See the details → Preview changes (dodano walidację EAI oraz ostrzejsze dopasowanie).
    3. Wybierasz Update Rule, następnie Publish.
    4. Uruchamiasz Run [[Monitoring Project|Monitoring]] i porównujesz wskaźniki (INVALID rate, top Explanation Codes).
    5. Jeśli wpływ jest akceptowalny, wykonujesz Update for this project dla pozostałych atrybutów/pozycji.

## 📌 Źródła

- [[Ataccama]] ONE — Update Rule Reference w [[Monitoring Project|Monitoring]] Projects: powiadomienia, aktualizacja projektu/itemu/pojedynczej reguły.
- [[Ataccama]] ONE — Preview changes i Update Rule: przegląd i zatwierdzanie zmian reguł DQ.
- [[Ataccama]] ONE — core:reference trait: konfiguracja powiadomień o przestarzałych odwołaniach do reguł.
- [[Ataccama]] ONE — Publish i Run [[Monitoring Project|Monitoring]] po aktualizacjach konfiguracji.
- [[Ataccama]] ONE — Best practices for rule versioning w projektach DQ.

## 👽 Brudnopis

- Wejście użytkownika (oczyszczone): “Update Rule Reference: If your [[Monitoring Project|monitoring]] project contains mappings to [[Rules]] that have since been edited, you are notified on the Configuration & Results screen. To update [[Rules]] to the latest version, select Update for this project for the [[Monitoring Project|monitoring]] project or update for this catalog item for a specific catalog item. To update only selected [[Rules]], find the outdated [[Rules]] in the list of attributes, marked with a lightbulb icon. Select the rule to open the rule information, and then select See the details. You are redirected to the Preview changes screen: review the changes and then select Update Rule. Application admins can turn on and off these notifications for all users through the core:reference trait. If you change the trait after applying [[Rules]] in the project, the trait doesn't apply to those [[Rules]].”
- Pytania do weryfikacji:
    - Czy obowiązuje organizacyjna polityka wersjonowania (semver) dla reguł i okienko wdrożeniowe na aktualizacje? — do weryfikacji.
    - Czy wymagać pilota na jednym Catalog Item przed Update for this project w krytycznych projektach? — do weryfikacji.
    - Czy archiwizować snapshot wyników przed i po aktualizacji (export project results) do porównania wpływu? — do weryfikacji.