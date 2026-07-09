---
title: One API Subscriptions
created: 2026-07-09
status: evergreen
category: Ataccama ONE
difficulty: advanced
language: pl
tags:
  - ataccama
  - subscriptions
  - graphql
  - real-time
aliases:
  - Subskrypcje One API
  - Ataccama subscriptions
---

# 🎯 Definicja
**Subskrypcje ([[Subscriptions|Subscriptions]])** w GraphQL to mechanizm służący do przesyłania aktualizacji danych z serwera do klienta w czasie rzeczywistym. Odbywa się to poprzez ustanowienie stałego, dwukierunkowego połączenia (zazwyczaj przy użyciu protokołu WebSockets). W [[Ataccama|Ataccama]] ONE subskrypcje są wykorzystywane do śledzenia zewnętrznych zdarzeń w [[Metadata|modelu metadanych (MMM Eventing System)]]. Do wywoływania zapytań subskrypcji stosuje się [[Ataccama Using Playground|GraphQL Playground]].

---

# 🔑 Kluczowe punkty
- Pozwalają na natychmiastowe wypychanie (**push**) zmian danych z serwera do systemów zewnętrznych bez konieczności ciągłego odpytywania (polling, patrz: [[One API Queries|Zapytania]]).
- Śledzą zmiany stanu encji, takie jak: utworzenie (`CREATED`), aktualizacja (`UPDATED`) i usunięcie (`DELETED`).
- Obsługują tryb rozłączony – zdarzenia, które wystąpiły, gdy klient był offline, nie zostaną utracone (są kolejkowane).
- Przetworzone zdarzenia muszą być potwierdzane przez klienta za pomocą [[One API Mutations|mutacji]] **`_acknowledgeExternalEvents`**.
- Subskrypcje można kontrolować pod kątem optymalizacji wydajności (grupowanie zdarzeń za pomocą `chunkSize` i `chunkMaxDelay`).

---

# 📚 Szczegółowe wyjaśnienie i operacje

### 1. Tworzenie subskrypcji zdarzeń (Subscribing to Events)
Podczas uruchamiania subskrypcji określasz filtry (np. konkretny typ encji, identyfikator encji) oraz parametry techniczne:
- **`ackLimit`**: Limit niepotwierdzonych zdarzeń. Po osiągnięciu tego limitu serwer wstrzyma wysyłanie nowych rekordów do czasu otrzymania potwierdzenia od klienta.
- **`chunkSize`** i **`chunkMaxDelay`**: Służą do grupowania (batchowania) zdarzeń w celu zmniejszenia liczby pakietów sieciowych.

#### Uruchomienie subskrypcji zdarzeń MMM:
```graphql
subscription ($id: GID!, $ackLimit: Int!, $entityType: String) {
    _externalEvents(
        subscriptionId: $id, 
        entity_type: $entityType, 
        ackLimit: $ackLimit, 
        chunkSize: 10, 
        chunkMaxDelay: 2000, 
        excludeOwnModifications: false
    ) {
        events {
            id
            timestamp
            entityId
            entityType
            entityStatus
        }
    }
}
```

#### Przykładowy pakiet danych zdarzenia:
```json
{
    "id": 1,
    "timestamp": "2021-05-25T09:03:23.730010Z",
    "entityId": "cd456b86-157f-4432-b5df-c5602d5b9af5",
    "entityType": "tableAttribute",
    "entityStatus": "UPDATED"
}
```

---

### 2. Potwierdzanie odebranych zdarzeń (Acknowledge)
Po pomyślnym przetworzeniu paczki zdarzeń po stronie klienta, należy poinformować o tym serwer przy użyciu [[One API Mutations|mutacji]] `_acknowledgeExternalEvents`. Oczyszcza to kolejkę po stronie [[Ataccama|Ataccama]] ONE.

#### Mutacja potwierdzająca zdarzenia (do podanego identyfikatora włącznie):
```graphql
mutation acknowledgeEvents($id: GID!, $lastEventId: Long!) {
    _acknowledgeExternalEvents(
        subscriptionId: $id, 
        lastEventId: $lastEventId
    )
}
```

---

### 3. Sprawdzanie statusu subskrypcji
Za pomocą [[One API Queries|zapytania (query)]] można w każdej chwili sprawdzić status danej subskrypcji oraz dowiedzieć się, ile zdarzeń oczekuje na dostarczenie (`undeliveredEventCount`):

```graphql
query getSubscriptionStatus($id: GID!) {
    _externalEventsSubscriptionStatus(subscriptionId: $id) {
        subscriptionId
        undeliveredEventCount
        status
    }
}
```

---

### 4. Anulowanie subskrypcji (Unsubscribe)
Jeśli nie chcesz już otrzymywać powiadomień, należy jawną mutacją wyrejestrować subskrypcję. Zapobiega to marnowaniu zasobów po stronie serwera.

#### Mutacja anulująca subskrypcję:
```graphql
mutation unsubscribe($id: GID!) {
    _unsubscribeExternalEvents(subscriptionId: $id) {
        success
    }
}
```
*Uwaga: W przypadku braku jawnego anulowania, subskrypcja zostanie automatycznie usunięta po upływie czasu retencji skonfigurowanego we właściwości:*  
`plugin.external-events.ataccama.one.externalevents.subscribers-retention-period`

---

## 📌 Źródła
- [[Ataccama|Ataccama]] ONE Eventing System documentation
- GraphQL [[Subscriptions|Subscriptions]] Specification
