---

title: Slowly Changing Dimension (SCD)  
created: 2025-07-15  
status:  
category: Inżynieria danych  
difficulty: podstawowy  
language: pl  
tags:

- wymiar o zmiennej zmienności
- SCD
- data warehouse
- historia danych  
aliases:
- Slowly Changing Dimension
- SCD

---

# 🎯 Definicja

**Slowly Changing Dimension (SCD)** – wymiar o zmiennej zmienności – to model danych w Magazynie Danych, który umożliwia przechowywanie zarówno aktualnych, jak i historycznych wersji danych wymiarowych. Dzięki temu możliwe jest śledzenie, jak atrybuty rekordów ulegały zmianom w czasie (np. zmiana adresu klienta, stanowiska pracownika).

# 🔑 Kluczowe punkty

- **SCD pozwala zachować historię zmian** w atrybutach rekordów wymiarowych.
- **Kluczowy mechanizm ETL**, niezwykle istotny w raportowaniu, analizie trendów czy rekonstrukcji stanu historycznego.
- SCD przyjmuje różne strategie (typy) zarządzania zmiennością, m.in. SCD Type 1, 2 i 3.
- Wspiera zgodność z przepisami audytowymi i biznesowymi wymaganiami dotyczącymi retencji historii danych.

# 📚 Szczegółowe wyjaśnienie

## Mechanizm działania SCD

W środowisku Data Warehouse, tabele wymiarowe mogą ulegać zmianom wraz z rozwojem organizacji (np. zmiana nazw departamentów, promocje pracowników). Użycie SCD pozwala przechowywać kolejne wersje tych rekordów, by raporty i analizy mogły uwzględniać zarówno przeszłe, jak i bieżące wartości.

## Najważniejsze typy SCD

|Typ|Opis|Zastosowanie|
|---|---|---|
|SCD 1|Nadpisywanie starych wartości nowymi, **brak historii zmian**|Gdy historia nie jest istotna|
|SCD 2|Dodawanie nowych rekordów z datami obowiązywania, **pełna historia zmian**|Audyt, analizy trendów|
|SCD 3|Przechowywanie wybranych wersji (np. obecnej i poprzedniej wartości atrybutu)|Śledzenie ostatniej zmiany|

### Działanie na przykładzie

Gdy klient zmienia adres, SCD 2 powoduje utworzenie nowego rekordu z nową datą ważności, umożliwiając sprawdzenie, pod jakim adresem był zarejestrowany w danym okresie.

## Miejsce SCD w ekosystemie danych

SCD to fundament wiarygodnych raportów, rekonstrukcji stanu danych na moment w przeszłości, obsługi przepisów (np. RODO, audytów), a także wszelkich analiz wymagających śledzenia ewolucji danych wymiarowych.

# 💡 Przykład zastosowania

Bank śledzi historię adresów korespondencyjnych klientów. Dzięki SCD 2 może wygenerować raport, gdzie w przypadku incydentów lub reklamacji klienta uwzględnia się, na jaki adres wysyłano korespondencję w konkretnym miesiącu. Umożliwia to rzetelny audyt ścieżki obsługi klienta i minimalizuje ryzyko błędów.

## 📌 Źródła

- [Kimball Group: Easily Track Slowly Changing Dimension Changes with SCD Types](https://www.kimballgroup.com/2016/02/slowly-changing-dimensions/)
- [Microsoft Learn: Implementacja Slowly Changing Dimensions](https://learn.microsoft.com/pl-pl/sql/integration-services/data-flow/transformations/slowly-changing-dimension-transformation)
- [Data Warehouse Concepts – SCD](https://www.datavaultacademy.com/scd-in-data-vault/)

## 👽 Brudnopis

- SCD = przechowywanie historii zmian wymiarów, np. adresu klienta, departamentu.
- SCD 1 nadpisuje, SCD 2 dodaje rekordy historyczne, SCD 3 przechowuje kilka wartości.
- Kluczowe w Data Warehousingu do raportowania, analizy trendów, rekonstrukcji historii.
- Implementacja: SQL, narzędzia ETL (SSIS, Informatica, dbt), wymagane kolumny: data od-do, status rekordu.
- Realny przykład: zmiana danych klienta w bankowości – śledzenie, do kiedy obowiązywały dane adresowe.