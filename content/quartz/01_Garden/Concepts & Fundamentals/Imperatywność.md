---
title: Imperatywność vs Deklaratywność
created: 2026-02-04
status: evergreen
category: Software Engineering
difficulty: intermediate
language: pl
tags:
  - paradigm
  - coding
  - sql
  - python
aliases:
  - Imperatywny
  - Deklaratywny
  - Imperative vs Declarative
---
# 🎯 Definicja
**Imperatywność** to styl programowania (lub zarządzania infrastrukturą), w którym mówisz komputerowi **JAK** ma coś zrobić ("Idź prosto, skręć w lewo, otwórz drzwi").
**[[Deklaratywność|Deklaratywność]]** to styl, w którym mówisz **CO** chcesz osiągnąć ("Chcę być w pokoju za drzwiami"), a system sam decyduje, jak to zrobić.

# 🔑 Kluczowe punkty
- **Imperatywny (How):** Python, Bash, Java, Airflow (klasyczny). Pełna kontrola, ale więcej kodu i błędów.
- **Deklaratywny (What):** [[SQL|SQL]], HTML, [[Terraform|Terraform]], [[Kubernetes|Kubernetes]], [[dbt|dbt]]. Mniej kodu, system zajmuje się "brudną robotą".

# 📚 Szczegółowe wyjaśnienie
Przykład techniczny:
Chcemy 3 serwery.
*Podejście Imperatywne (Skrypt Bash):*
1. Sprawdź, czy jest serwer 1. Jeśli nie, utwórz.
2. Sprawdź, czy jest serwer 2. Jeśli nie, utwórz.
3. Sprawdź, czy jest serwer 3...
*Podejście Deklaratywne ([[Terraform|Terraform]]):*
`count = 3`
Silnik Terraforma sam sprawdzi stan obecny (np. jest 1 serwer) i dołoży brakujące 2.

W Inżynierii Danych przechodzimy z imperatywnego kodowania (Python scripts w Airflow) na deklaratywne modele ([[dbt|dbt]], [[SQL|SQL]]), bo są łatwiejsze w utrzymaniu.

# 💡 Przykład zastosowania
[[SQL|SQL]] jest idealnym językiem deklaratywnym.
Piszesz: `SELECT * FROM Users WHERE age > 18`.
Nie piszesz: "Otwórz plik, przejdź do wiersza 1, sprawdź wiek, jeśli > 18 to dodaj do listy, przejdź do wiersza 2...". Baza danych sama wybiera optymalny algorytm (Index Scan vs Full Scan).

## 📌 Źródła
- "Fundamentals of Software Architecture".

## 👽 Brudnopis
- Imperatywność daje kontrolę (możesz zoptymalizować każdy krok), [[Deklaratywność|deklaratywność]] daje szybkość developmentu i czytelność.
- Nowoczesny Data Stack dąży do deklaratywności ([[dbt|dbt]], K8s).