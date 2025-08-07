---

title: "Platforma Danych Klienta (CDP - Customer Data Platform)"  
created: 2025-07-16  
status: Final  
category: Data Architecture  
difficulty: podstawowy  
language: pl  
tags:

- inżynieria danych
- customer data
- data platform
- retail tech  
aliases:
- customer data platform
- CDP
- platforma danych klienta

---

# 🎯 Definicja

**Customer Data Platform (CDP)** to zaawansowany system do gromadzenia, integracji, zarządzania i aktywacji danych o klientach z różnych źródeł (kanałów cyfrowych, offline, CRM, aplikacji mobilnych). Główna cecha CDP to tworzenie zunifikowanego profilu klienta (tzw. single customer view), który jest łatwo dostępny dla działów marketingu, sprzedaży, analityki czy obsługi klienta.

# 🔑 Kluczowe punkty

- CDP integruje dane z różnych źródeł: e-commerce, media społecznościowe, działania offline, kampanie mailingowe, call center itp.
- Umożliwia tworzenie **pełnego, aktualnego profilu klienta**, który może być wykorzystywany w czasie rzeczywistym.
- Oczyszcza, deduplikuje i standaryzuje dane: **jakość danych jest kluczowa** dla trafnych analiz i personalizacji.
- Ułatwia segmentację, personalizację i automatyzację działań marketingowych.
- Różni się od DMP (Data Management Platform) – CDP działa na poziomie danych PII (personally identifiable information), czyli identyfikowalnych użytkowników, a nie anonimowych cookies.

# 📚 Szczegółowe wyjaśnienie

## Co robi CDP?

CDP spełnia kilka kluczowych funkcji:

1. **Zbieranie danych (Data Ingestion):**  
    Dane spływają z różnych źródeł – strony WWW, aplikacji, POS, e-maili, systemów CRM. CDP przyjmuje zdarzenia (np. kliknięcia, zakupy) i atrybuty (np. wiek, lokalizacja).
    
2. **Integracja i [[Data Enrichment|wzbogacanie danych]]:**  
    CDP porządkuje dane, identyfikuje tych samych klientów w wielu kanałach (ID stitching). Tworzy pojedynczy widok klienta.
    
3. **Utrzymanie jakości danych:**  
    Dane są oczyszczane, walidowane, deduplikowane i aktualizowane.
    
4. **Segmentacja:**  
    Na podstawie profilów pojedynczych klientów system umożliwia tworzenie segmentów do działań marketingowych.
    
5. **Aktywacja:**  
    Gotowe segmenty i profile są wysyłane do systemów zewnętrznych (np. e-mail automation, reklam, rekomendacji), które mogą z nimi działać w czasie rzeczywistym.
    

## Czym CDP różni się od CRM, DMP i systemów analitycznych?

|System|Główna funkcja|Zakres danych|Personalizacja|Dane o użytkowniku|
|---|---|---|---|---|
|**CDP**|Zbieranie i integracja danych klienta|Szeroki (różne kanały)|Tak|PII – znany użytkownik|
|**CRM**|Zarządzanie relacjami z klientami|Głównie sprzedaż i support|Częściowo|PII|
|**DMP**|Targetowanie reklam (adtech)|Zanonimizowane|Nie|Anonimowe ID (cookies)|
|**[[Business Intelligence\|BI]]**|Raportowanie i analiza|Atrybutowe|Nie|[[Rollup\|Agregaty]] i miary|

## Zastosowania

- Personalizacja treści i kampanii w czasie rzeczywistym na podstawie aktywności użytkownika.
- Automatyczna segmentacja klientów oparta na zachowaniach i preferencjach (np. RFM).
- Omnikanałowa orkiestracja kampanii marketingowych na stronach, w e-mailu, aplikacjach mobilnych.
- Identyfikacja trendów i sygnałów zakupowych.
- Ujednolicenie raportowania klientów między działami i systemami.

# 💡 Przykład zastosowania

Firma e-commerce wdraża CDP, aby lepiej śledzić zachowania zakupowe w sklepie oraz w aplikacji mobilnej. CDP zbiera dane z sesji użytkowników, historii zamówień i newsletterów. Następnie tworzy dynamiczne segmenty (np. „klienci rezygnujący”, „potencjalni powracający”), które system marketing automation wykorzystuje do targetowania kampanii. Wynikiem jest m.in. +22% konwersji w kampaniach remarketingowych.

## 📌 Źródła

- [https://www.segment.com/blog/what-is-a-customer-data-platform/](https://www.segment.com/blog/what-is-a-customer-data-platform/)
- [https://www.salesforce.com/products/marketing-cloud/customer-data-platform/](https://www.salesforce.com/products/marketing-cloud/customer-data-platform/)
- [https://www.cdpinstitute.org/cdp-101/](https://www.cdpinstitute.org/cdp-101/)

## 👽 Brudnopis

- CDP = centralny hub danych o kliencie
- Integracja danych all-channel & all-touchpoints
- Profile użytkownika = aktualne, jednorodne, możliwe do aktywacji
- CDP ≠ CRM (bardziej analityczne), ≠ DMP (anonimowe, reklamowe)
- API-first stack → łączenie CDP z systemami zewnętrznymi
- Segmentacja behavioralna, predykcyjna itd.
- Use cases: churn prediction, cross-sell automation, lifecycle targeting
- Popularne CDP: Segment, mParticle, ActionIQ, Bloomreach, Salesforce CDP, Tealium
- Krytyczne dla e-commerce, retail, healthcare i travel