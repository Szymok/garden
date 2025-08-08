---
title: Rule Suggestions 
created: 2025-08-08 
status: in-review 
category: data-quality
difficulty: intermediate 
language: pl
tags:
- data-quality
- dq-rules
- monitoring-projects
- glossary
- rule-suggestions
- ataccama-one 
aliases:
- suggestions
- rule-suggestions
- dq-rule-recommendations
---
# 🎯 Definicja 
Rule Suggestions to mechanizm [[Ataccama]] ONE podpowiadający [[Data Quality Evaluation rules|reguły jakości danych]] (DQ) do atrybutów w projektach [[Monitoring Project|Monitoring]] Project na podstawie powiązań z Glossary oraz historii użycia. Użytkownik może akceptować lub odrzucać propozycje pojedynczo.

# 🔑 Kluczowe punkty

- Kiedy pojawiają się sugestie:
    - Reguła przypisana do termu, a term przypisany do atrybutu.
    - Term przypisany do atrybutu jest także przypisany do wejścia reguły lub samej reguły.
    - Ta sama reguła była już przypisana do identycznego atrybutu w innym [[Monitoring Project]].
- Akcja użytkownika: akceptuj (✓) lub odrzuć (✗) każdą sugestię z osobna.
- Cel: przyspieszenie konfiguracji checks oraz standaryzacja zasad DQ między projektami.
- Dobre praktyki: utrzymuj spójne mapowania Glossary↔[[Rules]], aby zwiększać trafność sugestii.

📚 Szczegółowe wyjaśnienie

- Źródła reguł do sugestii
    - Powiązania semantyczne: jeśli Glossary term ma przypiętą regułę DQ, a ten sam term jest przypięty do atrybutu, system zaproponuje regułę dla atrybutu.
    - Powiązania na poziomie wejścia reguły: gdy term przypisany do atrybutu jest też przypisany do inputu reguły (lub do reguły), pojawi się sugestia.
    - Wiedza z innych projektów: jeżeli dany atrybut (lub atrybut równoważny w katalogu) ma już przypisaną regułę w innym [[Monitoring Project|Monitoring]] Project, system zaproponuje jej ponowne użycie.
- Obsługa sugestii
    - Interfejs oferuje listę rekomendowanych reguł przy konfiguracji atrybutów w [[Monitoring Project]].
    - Dla każdej pozycji wybierz: ✓ (Accept) — reguła zostanie przypisana; ✗ (Reject) — sugestia zostanie odrzucona dla bieżącego kontekstu.
    - Po dokonaniu wyborów pamiętaj o Publish, aby utrwalić konfigurację przed Run [[Monitoring Project|Monitoring]].
- Wskazówki wdrożeniowe
    - Utrzymuj porządek w Glossary: jasno zdefiniowane termy i ich relacje do reguł zwiększają jakość propozycji.
    - Wzorce atrybutów: jeśli różne tabele mają te same semantyczne atrybuty (np. email, phone), przypisanie tych samych reguł w jednym projekcie pomoże szybciej skonfigurować kolejne.
    - Weryfikacja kontekstu: nawet jeśli sugestia jest trafna semantycznie, sprawdź dopasowanie do specyfiki źródła (np. lokalne formaty, wyjątki biznesowe).
- Typowe pułapki
    - Nadmierna automatyzacja: akceptowanie wszystkich sugestii bez weryfikacji może dodać reguły nieadekwatne do konkretnego źródła.
    - Brak publikacji: po akceptacji/odrzuceniu należy Publish — inaczej Run [[Monitoring Project|Monitoring]] uruchomi się na poprzedniej konfiguracji.
    - Rozjazd Glossary: niespójne mapowania termów między zespołami obniżają trafność rekomendacji.

# 💡 Przykład zastosowania

- Scenariusz: Szybka konfiguracja reguł dla nowej tabeli klientów
    1. W Glossary term “Email” ma przypiętą regułę EMAIL_FORMAT_VALIDATION oraz term “CountryCode” ma regułę COUNTRY_ISO_IN_[[LOOKUP]].
    2. W nowym [[Monitoring Project]] dodajesz item dim_customer_v2, a jego atrybuty są zmapowane do termów “Email” i “CountryCode”.
    3. System sugeruje odpowiednie reguły dla tych atrybutów na podstawie powiązań oraz wcześniejszego użycia w projekcie dim_customer.
    4. Akceptujesz (✓) sugerowane reguły, odrzucasz (✗) te, które nie pasują, następnie Publish i Run [[Monitoring Project|Monitoring]].

## 📌 Źródła

- [[Ataccama]] ONE — Rule Suggestions: warunki generowania sugestii (Glossary↔[[Rules]], reuse między projektami) i obsługa UI (Accept/Reject).
- [[Ataccama]] ONE — [[Monitoring Project|Monitoring]] Projects: przypisywanie reguł DQ do atrybutów i publikacja zmian.
- [[Ataccama]] ONE — Glossary Management: mapowanie termów do atrybutów i reguł w celu standaryzacji.

## 👽 Brudnopis

- Wejście użytkownika (oczyszczone): “Rule Suggestions The application can suggest [[rules]] for DQ checks, [[Rules]] are suggested in the following situations:
    - When the rule is assigned to a term which is assigned to an attribute
    - When a term assigned to an attribute is also assigned to the rule input or rule
    - When the rule is assigned to the same attribute in another [[monitoring project]] Accept or reject suggestions one-by-one, using the relevant icon (tick for accept and cross for reject)”
- Do weryfikacji:
    - Czy w Waszej instancji istnieją dodatkowe heurystyki sugerowania (np. dopasowanie nazw atrybutów)? — do weryfikacji.
    - Czy chcesz włączyć raport trafności sugestii (accept rate) per projekt/domena? — do weryfikacji.