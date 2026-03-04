---
title: Deklaratywność (Podejście Deklaratywne)
created: 2026-02-04
status: evergreen
category: Programming/Engineering
difficulty: basic
language: pl
tags:
  - declarative
  - imperative
  - sql
  - terraform
  - dbt
aliases:
  - Programowanie Deklaratywne
  - Declarative Programming
---
# 🎯 Definicja
**Deklaratywność** to paradygmat, w którym opisujesz **CO** chcesz osiągnąć (Cel), a nie **JAK** to zrobić (Kroki). Przeciwieństwem jest [[Imperatywność]].
Przykład z życia:
Imperatywnie: "Wyjdź z domu, idź prosto 100m, skręć w lewo, wejdź do sklepu, weź mleko, zapłać".
Deklaratywnie: "Chcę mieć mleko" (Resztą martwi się Uber Eats / System).

# 🔑 Kluczowe punkty
- **Wyższy poziom abstrakcji:** Skupiasz się na logice biznesowej, nie na sterowaniu przepływem (`for loop`, `if`).
- **Idempotentność:** Łatwiej zapewnić, że wielokrotne uruchomienie da ten sam wynik.
- **Popularność w Data & DevOps:** SQL, Terraform, Kubernetes, dbt - to wszystko narzędzia deklaratywne.

# 📚 Szczegółowe wyjaśnienie
**SQL** jest królem deklaratywności.
Piszesz: `SELECT * FROM users WHERE city = 'Warsaw'`.
Nie piszesz: "Otwórz plik, ustaw wskaźnik na linii 1, sprawdź czy city to Warsaw, jeśli tak to dodaj do bufora...". Silnik bazy danych decyduje, jak to zrobić najszybciej (użyć indeksu? zrobić full scan?).
W **Kubernetes**: Piszesz plik YAML: "Chcę mieć 3 repliki serwera X". K8s sam dba o to, by je uruchomić i zrestartować, gdy któraś padnie.

# 💡 Przykład zastosowania
Inżynieria Danych.
Podejście imperatywne (Python script):
1. Połącz się z FTP.
2. Pobierz plik.
3. Rozpakuj.
4. Wgraj do bazy. (Jak padnie w kroku 3, trzeba pisać obsługę błędów).
Podejście deklaratywne (Dagster asset):
`@asset: tabela_uzytkownicy`. "Ta tabela powstaje z tego pliku". Orkiestrator sam wie, że musi pobrać plik, żeby stworzyć tabelę.

## 📌 Źródła
- "Declarative Programming" - Wikipedia.

## 👽 Brudnopis
- Deklaratywność wymaga mądrego "silnika" pod spodem (Solvera), który zamieni "Chcenie" na "Działanie".
- HTML jest deklaratywny (opisujesz strukturę strony, przeglądarka ją rysuje).