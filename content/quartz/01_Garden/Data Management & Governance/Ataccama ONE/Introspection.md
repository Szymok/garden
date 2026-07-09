# [[GraphQL Introspection|GraphQL Introspection]]

🎯 **Definicja**
**Introspekcja (Introspection)** to wbudowana funkcja w technologii GraphQL, która umożliwia klientom odpytywanie serwera o szczegółowe informacje na temat jego schematu (schema). Klient może sprawdzić, jakie [[One API Queries|zapytania (queries)]], [[One API Mutations|mutacje (mutations)]] i [[One API Subscriptions|subskrypcje (subscriptions)]] są obsługiwane, a także jakie typy obiektów, pola i argumenty są dostępne w systemie.

---

🔑 **Kluczowe punkty**
- Umożliwia dynamiczne generowanie dokumentacji, autouzupełnianie kodu (np. w [[Ataccama Using Playground|GraphiQL]]) i walidację zapytań przed wysłaniem.
- W [[Ataccama|Ataccama]] ONE można z niej korzystać bezpośrednio za pomocą dedykowanych zapytań w konsoli [[Ataccama Using Playground|GraphQL Playground]] lub narzędzi sieciowych.
- Rozszerzenia przeglądarki, takie jak **GraphQL Network Inspector**, pozwalają na bezinwazyjne podglądanie zapytań generowanych na żywo przez interfejs użytkownika (frontend) aplikacji ONE do backendu.

---

📚 **Jak badać ruch GraphQL za pomocą GraphQL Network Inspector (Chrome)**

Przeglądanie zapytań przesyłanych przez aplikację ONE web w czasie rzeczywistym jest kluczem do zrozumienia, jakich zapytań i mutacji użyć we własnych integracjach (np. przy użyciu kroku [[Desktop JSON Call Step General Configuration|JSON Call]]):

1. **Instalacja rozszerzenia:** Zainstaluj rozszerzenie [GraphQL Network Inspector](https://chrome.google.com/webstore/detail/graphql-network-inspector/ndlbedplllcgconngcnfmkadhokfaaln) ze sklepu Chrome Web Store.
2. **Uruchomienie narzędzi:** Wejdź na wybraną stronę aplikacji [[Ataccama|Ataccama]] ONE (np. *Knowledge Catalog > [[Catalog Items|Catalog Items]]*, zobacz: [[Data Catalog]]).
3. **Otwarcie konsoli:** Otwórz Narzędzia Deweloperskie Chrome (F12 lub kliknij prawym przyciskiem myszy -> *Zbadaj*).
4. **Wybór zakładki:** Kliknij ikonę rozszerzenia zakładek (`>>`) w prawym górnym rogu panelu deweloperskiego i wybierz **GraphQL Network**.
5. **Przechwytywanie ruchu:** Odśwież stronę aplikacji [[Ataccama|Ataccama]]. Po lewej stronie panelu pojawi się lista wysyłanych zapytań ([[Queries|Queries]]) i mutacji ([[Mutations|Mutations]]).
6. **Eksploracja:** Wybierz dowolną pozycję z listy:
   - W zakładce **Request** zobaczysz dokładną strukturę wysłanego zapytania (Query) wraz ze zmiennymi (Variables) (patrz: [[One API Queries]]).
   - W zakładce **Response** sprawdzisz dane zwrócone z serwera w formacie JSON oraz ewentualne komunikaty o błędach (patrz: [[Endpoints and HTTP Headers|Obsługa Błędów HTTP]]).
   - Możesz skopiować całe zapytanie, zmienne, a nawet wyeksportować je jako polecenie **cURL** do wykorzystania w konsoli lub narzędziach zewnętrznych (np. [[Desktop JSON Call Step General Configuration|ONE Desktop]], GraphDev, Postman).

---

💡 **Przykład zastosowania**
Jeśli chcesz dowiedzieć się, w jaki sposób aplikacja [[Ataccama|Ataccama]] ONE pobiera oceny jakości danych (DQ evaluations) dla danej tabeli, włącz GraphQL Network Inspector, kliknij przycisk odświeżenia DQ (zobacz: [[Data Quality]]) w aplikacji webowej i skopiuj wywołaną w tle [[One API Mutations|mutację]] z zakładki *Request*.

---

📌 **Źródła**
- GraphQL Specification (Introspection schema)
- Chrome Web Store - GraphQL Network Inspector